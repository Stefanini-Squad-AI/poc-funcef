unit uFuncoesSaldamento;

interface

Uses
  Forms,
  Messages, SysUtils, Classes, Graphics, Controls, Dialogs, Windows,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, dBaseDados,
  ExtCtrls, Db, DBClient, uCMClientDataSet, uCmControlObject, uSistema,
  DBTables, Wwquery, uMensErro, Math;

Type
  RDadosBeneficioMinimo = Record
                            DataReferencia : TDateTime;
                            Valor : Double;
                          End;

  TipoParticipante = ( tpNone, tpReplan, tpREB, tpReplanPre78, tpREBPre78 );

  Function BuscaPessoasPreparo( psArquivoMatriculas : String; CdsPessoasPreparo : TCMClientDataSet ) : Boolean;

  Function ProcessarPreparo( psAnoMesRefProcesso, psArquivoMatriculas : String; bMostraEvolucaoBS : Boolean): Boolean;
  Function ProcessaPreparoPessoa( psAnoMesRefProcesso : String; bMostraEvolucaoBS : Boolean; CdsPessoasPreparo, CdsAux : TCMClientDataSet; QryAux : TwwQuery  ) : Boolean;

  Function AcertaBeneficioTransfPlano (  psAnoMesRefProcesso, psArquivoMatriculas : String; bMostraEvolucao : Boolean ) : Boolean;


  Function ExecutaEnquadramento( CdsPessoasPreparo : TCMClientDataSet; dDataRefProcesso: TDateTime; QryAux : TwwQuery ): Double;

  Function InsereReservaPart( CdsPessoasPreparo : TCMClientDataSet ) : Boolean;

  Function RetornaBeneficioMinimo( dDataRef: TDateTime ): Double;
  Function RetornaValorINSS( CdsPessoasPreparo, CdsAux : TCMClientDataSet; dDataRef: TDateTime ): Double;
  Function RetornaValorSUPL( CdsPessoasPreparo, CdsAux : TCMClientDataSet; dDataRef: TDateTime ): Double;
  Function RetornaTipoParticipante( CdsPessoasPreparo : TCMClientDataSet ): TipoParticipante;
  Function RetornaTipoParticipanteString( ptpTipoParticipante : TipoParticipante ): String;

  Function  CorrigeValorBS( psAnoMesRefProcesso : String; bMostraEvolucaoBS : Boolean; CdsPessoasPreparo, CdsAux : TCMClientDataSet; dDataRef: TDateTime; dValorBS : Double  ): Double;

  Procedure IniciaTabelaBeneficioMinimo;
  Procedure IniciaQryInsereReservaPart;
  Procedure IniciaArquivoDemonstrativo;

  Procedure GravaLogErro( CdsPessoasPreparo : TCMClientDataSet; psMensagem : String );

  { Outras funções úteis }
  Function PreparaStr( Str: String; Tamanho: Integer): String;
  Function AlinhaDireita( psCampo : String; piCasas: Integer ) : String;
  Function MontaStringMatriculas( psNomeArquivo : String ) : String;
  Function AnoMesAnterior( psAnoMesRef : String ) : String;
  Function Trunca( pdValor: Double; piDecimais: Integer ): Double;


Const
  dIncentivoDeSaldamento = 1.09;
  dIncentivoCaixa        = 4.00;

Var
  CtrlObjectAcessoBD : TCmControlObject;
  QryInsereReservaPart: TwwQuery;

  VetBeneficioMinimo : Array [0..5] Of RDadosBeneficioMinimo;

  dDataRefProcesso            : TDateTime;
  dDataRefMinimaEnquadramento : TDateTime;

  sNomeArquivoDemonstrativo : String;
  ArquivoExterno : TextFile;


implementation

{------------------------------------------------------------------------------}
{ Busca os dados das pessoas utilizadas no preparo para saldamento             }
Function BuscaPessoasPreparo( psArquivoMatriculas : String; CdsPessoasPreparo : TCMClientDataSet ) : Boolean;
Var
  sSQL, sLinhaMatriculas : String;

Begin

  If Trim( psArquivoMatriculas ) = '' Then Begin

    If MsgDlg('Lista de matriculas não informada. Sistema irá processar todos os registros da base.'+#13+
              'Este processo será demorado, Confirma ?',
              'Confirmação',mtConfirmation,[Mbyes, mbno],0) = mrno
    Then exit
  End;

  Try

    Try

      sSQL := 'SELECT '+

              '  BFB.IDTITULAR,          BFB.IDPESSOA AS IDBENEFICIARIO,                                   '+

              '  BFB.NUMEROPROCESSO,     BFB.IDPLANOPREV,      BFB.IDPESSJUR,         BFB.IDBENEFICIO,     '+
              '  BFB.SEQPROPOSTA,        BFB.DIBBENEFANT,      BFB.VALORBENEFANT,                         '+
              '  BFB.TIPCODIGO,          BFB.CODCENTRORESPON,  BFB.IDEMPRESAPROP,     BFB.IDDEPENDENCIA,   '+
              '  BFB.IDSITBENEFICIO,     BFB.IDTPPAGTOBENEFIC, BFB.DATAFINAL,         BFB.VALORATUAL,      '+
              '  BFB.DATAREQUERIMENTO,   BFB.DATAINICIO,       BFB.TMPPAGTOBENEFICIO, BFB.VALORCALCULADO,  '+
              '  BFB.DATAULTREAJUSTE,    BFB.ULTMESPREPARO,    BFB.VLRCALCINSS,       BFB.PLANO,           '+
              '  BFB.VLRINFINSS,         BFB.DATAINICIOINSS,   BFB.NUMPROCINSS,       BFB.DATAINICIOFUND,  '+
              '  BFB.VALORTOTAL,         BFB.DATACONCESSAO,    BFB.DATAENCERRAMENTO,  BFB.FONTEPAGADORA,   '+
              '  BFB.FLGPROVISORIO,      BFB.PERCPROVISORIO,   BFB.PRAZOPROVISORIO,   BFB.IDPLANOORIGEM,   '+
              '  BFB.ULTMESREAJUSTE,     BFB.DIBBENEFANT,      BFB.IDPLANPREVCONTAB,  BFB.VALORBENEFANT,   '+
              '  BFB.FLGENCERRAPORFALE,  BFB.DATAULTREVISAO,   BFB.PERCENTUAL,        BFB.VALORNADIB,      '+
              '  BFB.FLGPOSSUIACOMPINSS, BFB.VALORSRB,                                                     '+

              '  BPP.NOMEVALORBASE1,     BPP.NOMEVALORBASE2,   BPP.NOMEVALORBASE3,                         '+
              '  BFB.VALORBASE1,         BFB.VALORBASE2,       BFB.VALORBASE3,                             '+

              '  DECODE( BPP.NOMEVALORBASE1, ''%FUNCEF'', NVL( BFB.VALORBASE1, BPART.VALORBASE1) ,                                             '+
              '          DECODE( BPP.NOMEVALORBASE2, ''%FUNCEF'', NVL( BFB.VALORBASE2, BPART.VALORBASE2 ) ,                                     '+
              '                  DECODE( BPP.NOMEVALORBASE3, ''%FUNCEF'', NVL( BFB.VALORBASE3, BPART.VALORBASE3 ), 0 ) ) ) AS VALORPERCFUNCEF, '+

              '  BFB.VALORBINSSANT1,     BFB.VALORBINSSANT2,   BFB.VALORBINSSANT3,                         '+

              '  BFT.IDRESPONSAVEL, '+

              '  DEP.MATRICULA,     '+

              '  PESB.NOME AS NOMEBENEFICIARIO, '+
              '  PEST.NOME AS NOMETITULAR,      '+

              '  ELG.DATAADMISSAO,      ELG.IDSITFUNC,                 '+

              '  PPP.INSCRICAODATA,      PPP.DTINICIOINSC,     PPP.IDSITPLANOPREV,    PPP.IDSITPART, '+

              '  0 AS VALORBS '+

              'FROM   '+
              '  BENEFBFCIARIO BFB,                    '+
              '  BENEFPLANOPART BPART,                 '+
              '  BFCIARIOTITPLAN BFT,                  '+
              '  BENEFPLANPREV   BPP,                  '+
              '  DEPENTIT DEP,                         '+

              '  PESSOA PEST,       PESSOA PESB,       '+
              '  PESSOAFISICA PEFT, PESSOAFISICA PEFB, '+
              '  ELEGPATRO ELG,     PARTPREVPLAN PPP   '+

              'WHERE  '+
              '  ( '+
              '    ( BFB.IDPLANOPREV = 2 ) OR '+
              '    ( ( BFB.IDPLANOPREV = 66 ) AND ( EXISTS ( SELECT PP.IDPESSOA     '+
              '                                              FROM PARTPREVPLAN PP  '+
              '                                              WHERE PP.IDPLANOPREV    = 2 AND '+
              '                                                    PP.IDPESSOA       = BFB.IDPESSOA ) ) ) '+
              '  ) AND '+

              '  BFB.IDSITBENEFICIO   <> 3              AND '+ { Retirar beneficios Encerrados  }
              '  BFB.FONTEPAGADORA    = 1               AND '+ { Somente suplementação          }
              '  BFB.IDTPPAGTOBENEFIC = 1               AND '+ { Somente beneficios vitálicios  }

              '  BFB.IDTITULAR     = PEST.IDPESSOA      AND '+
              '  BFB.IDPESSOA      = PESB.IDPESSOA      AND '+

              '  BFB.IDTITULAR     = PEFT.IDPESSOA      AND '+
              '  BFB.IDPESSOA      = PEFB.IDPESSOA      AND '+

              '  BFB.IDPESSJUR     = BFT.IDPESSJUR      AND '+
              '  BFB.IDPLANOORIGEM = BFT.IDPLANOORIGEM  AND '+
              '  BFB.IDPLANOPREV   = BFT.IDPLANOPREV    AND '+
              '  BFB.IDTITULAR     = BFT.IDTITULAR      AND '+
              '  BFB.IDPESSOA      = BFT.IDPESSOA       AND '+
              '  BFB.IDBENEFICIO   = BFT.IDBENEFICIO    AND '+
              '  BFB.SEQPROPOSTA   = BFT.SEQPROPOSTA    AND '+


              '  BFB.IDPESSJUR     = BPART.IDPESSJUR(+)      AND '+
              '  BFB.IDPLANOPREV   = BPART.IDPLANOPREV(+)    AND '+
              '  BFB.IDPESSOA      = BPART.IDPESSOA(+)       AND '+
              '  BFB.SEQPROPOSTA   = BPART.SEQPROPOSTA(+)    AND '+
              '  BFB.IDBENEFICIO   = BPART.IDBENEFICIO(+)    AND ';

      If psArquivoMatriculas <> '' Then Begin

        sLinhaMatriculas := MontaStringMatriculas( psArquivoMatriculas );

        sSQL := sSQL + ' DEP.MATRICULA IN ('+ sLinhaMatriculas +') AND ';

      End;

      sSQL := sSQL +
              '  BFB.IDTITULAR     = DEP.IDTITULAR      AND '+
              '  BFB.IDPESSOA      = DEP.IDPESSOA       AND '+

              '  BFB.IDPESSJUR     = PPP.IDPESSJUR      AND '+
              '  BFB.IDPLANOPREV   = PPP.IDPLANOPREV    AND '+
              '  BFB.IDTITULAR     = PPP.IDPESSOA       AND '+
              '  BFB.SEQPROPOSTA   = PPP.SEQPROPOSTA    AND '+

              '  BFB.IDPESSJUR     = ELG.IDPESSJUR      AND '+
              '  BFB.IDTITULAR     = ELG.IDPESSOA       AND '+

              '  BFB.IDPLANOPREV   = BPP.IDPLANOPREV    AND '+
              '  BFB.IDBENEFICIO   = BPP.IDBENEFICIO        '+

              'ORDER BY '+
              '  BFB.IDTITULAR, BFB.IDPESSOA';


      CdsPessoasPreparo.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

      Result := True;

    Except

      Result := False;

    End;

  Finally

  End;

End; { BuscaDadosPreparo }

{------------------------------------------------------------------------------}
{ Processar o preparo para saldamento                                          }
Function ProcessarPreparo( psAnoMesRefProcesso, psArquivoMatriculas : String; bMostraEvolucaoBS : Boolean ): Boolean;
Var
  iNumPessoasProcessadas, iNumLinhasProcessadas : Integer;
  QryAux : TwwQuery;
  CdsPessoasPreparo, CdsAux : TCMClientDataSet;

Begin

  QryAux := TwwQuery.Create( Nil );
  QryAux.DatabaseName := 'BaseDados';

  CtrlObjectAcessoBD := TCmControlObject.Create;
  CtrlObjectAcessoBD.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer,
                                 True, Nil );

  CdsPessoasPreparo := TCMClientDataSet.Create( Nil );
  CdsAux            := TCMClientDataSet.Create( Nil );


  Try

    { Buscar pessoas a processar }
    If ( Not BuscaPessoasPreparo( psArquivoMatriculas, CdsPessoasPreparo ) ) Then Begin

      MsgDlg('Erro ao pesquisar pessoas para processar. ', 'Erro', mtError, [mbOk], 0);
      Exit;

    End;

    ShortDateFormat := 'DD/MM/YYYY';

    iNumPessoasProcessadas := 0;
    iNumLinhasProcessadas  := 0;

    dDataRefProcesso := Date;
    dDataRefMinimaEnquadramento := StrToDate( '01/09/2001' );

    { Inicia componente que irá gravar dados no BD }
    IniciaQryInsereReservaPart;

    { Inicia tabela de beneficios minimos }
    IniciaTabelaBeneficioMinimo;

    { Inicia arquivo de demonstrativo }
    IniciaArquivoDemonstrativo;

    If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.RollBack;
    dtmBaseDados.dbBaseDados.StartTransaction;

    QryInsereReservaPart.Prepare;

    { Inicio Processo }
    While Not CdsPessoasPreparo.Eof Do Begin

      { Processa somente o individuo }
      ProcessaPreparoPessoa( psAnoMesRefProcesso, bMostraEvolucaoBS, CdsPessoasPreparo, CdsAux, QryAux );

      { Incrementa contadores }
      Inc( iNumPessoasProcessadas );
      Inc( iNumLinhasProcessadas  );

      { Caso tenha processado mais de 1000 pessoas executa um COMMIT }
      If ( iNumPessoasProcessadas >= 1000 ) Then Begin

        iNumPessoasProcessadas := 0;

        { Confirma e reinicia a transação }
        dtmBaseDados.dbBaseDados.Commit;
        dtmBaseDados.dbBaseDados.StartTransaction;

      End;

      CdsPessoasPreparo.Next;

    End; { While Not CdsPessoasPreparo.Eof Do Begin }

    WriteLn( ArquivoExterno, ' ' );
    WriteLn( ArquivoExterno, 'TOTAL DE LINHAS PROCESSADAS -> '+ IntToStr( iNumLinhasProcessadas ) );

  Finally

    ShortDateFormat := 'DD/MM/YYYY';

    QryInsereReservaPart.UnPrepare;

    CloseFile( ArquivoExterno );

    //If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.Commit;
    If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.Rollback;


    CdsPessoasPreparo.Close;
    CdsAux.Close;
    QryAux.Close;

    FreeAndNil( CdsAux );
    FreeAndNil( CdsPessoasPreparo );
    FreeAndNil( QryAux );
    FreeAndNil( QryInsereReservaPart );

    FreeAndNil( CtrlObjectAcessoBD );

    //If Sistema.NomeUsuario = 'AUGUSTO.CM' Then
    WinExec( PChar( 'NOTEPAD.EXE '+sNomeArquivoDemonstrativo ) , SW_SHOW );

  End; { Finally }

End; { ProcessarPreparo }

{------------------------------------------------------------------------------}
{ Processar o preparo para saldamento para cada pessoa                         }
Function ProcessaPreparoPessoa( psAnoMesRefProcesso : String; bMostraEvolucaoBS : Boolean; CdsPessoasPreparo, CdsAux : TCMClientDataSet; QryAux : TwwQuery ): Boolean;
Var
  dValorEnquadramento, dValorBS, dValorBSCorrigido,  dValorbeneficioMinimo,
  dValorINSS, dPercentualFUNCEF, dPercentualFUNCEFReal  : Double;
  sDataRefEnquadramento : String;

  tpTipoParticipante : TipoParticipante;
Begin

  Result := True;

  { Preparo dos dados }

  { Calcular data de inicio do processo (< entre DIB e 01/09/2006) }
  If ( CdsPessoasPreparo.FieldByName('DATAINICIOFUND').AsDateTime < dDataRefMinimaEnquadramento )
  Then sDataRefEnquadramento := DateToStr( dDataRefMinimaEnquadramento )
  Else sDataRefEnquadramento := CdsPessoasPreparo.FieldByName('DATAINICIOFUND').AsString;

  dPercentualFUNCEF := CdsPessoasPreparo.FieldByName('VALORPERCFUNCEF').AsFloat;
  dPercentualFUNCEFReal := CdsPessoasPreparo.FieldByName('VALORPERCFUNCEF').AsFloat;

  If dPercentualFUNCEF <= 0
  Then dPercentualFUNCEF := 1
  Else dPercentualFUNCEF := ( CdsPessoasPreparo.FieldByName('VALORPERCFUNCEF').AsFloat /100 );

  tpTipoParticipante := RetornaTipoParticipante( CdsPessoasPreparo );

  { Calculos - Caso de erro sai fora }

  { Explicação dos calculos;                                                   }
  {  Caso participante seja REB Pré 78                                         }
  {    Caso DIB antes de 01/09/2001                                            }
  {      BS = Valor do beneficio Atual                                         }
  {    Caso DIB após 01/09/2001                                                }
  {      BS = ( Valor do na DIB * Percentual de incentivo )                    }
  {   Corrigir valor até apenas em 2006/06                                     }
  {                                                                            }
  {  Caso participante seja de outros tipos                                    }
  {    Executar regra de enquadramento na data de inicio do processo           }
  {    Buscar valor do INSS na data de inicio do processo                      }
  {    Calcular valor do BS                                                    }
  {    Aplicar o beneficio minimo                                              }
  {    Corrigir o valor pelo INPC                                              }
  {                                                                            }
  {  Gravar na RESERVAPART                                                     }
  {                                                                            }

  If tpTipoParticipante = tpREBPre78 Then Begin



    If ( CdsPessoasPreparo.FieldByName('DATAINICIOFUND').AsDateTime < dDataRefMinimaEnquadramento ) Then Begin

      dValorBS := CdsPessoasPreparo.FieldByName('VALORATUAL').AsFloat;

    End Else Begin

      dValorBS := ( CdsPessoasPreparo.FieldByName('VALORATUAL').AsFloat * dIncentivoDeSaldamento );

    End;

    { Corrigir o valor do SRB }
    dValorBSCorrigido := CorrigeValorBS( psAnoMesRefProcesso, bMostraEvolucaoBS, CdsPessoasPreparo, CdsAux, StrToDate( '01/01/2006' ), dValorBS );
    If dValorBSCorrigido = -5005 Then Begin
      GravaLogErro( CdsPessoasPreparo, ' ERRO AO CORRIGIR VALOR PELOS INPC ' );
      Result := False;
      Exit;
    End;

  End Else Begin

    { Cacula Enquadramento }
    //dValorEnquadramento := CdsPessoasPreparo.FieldByName('VALORSRB').AsFloat;
    dValorEnquadramento := ExecutaEnquadramento( CdsPessoasPreparo,  StrToDate( sDataRefEnquadramento ), QryAux );
    If dValorEnquadramento = -5005 Then Begin
      GravaLogErro( CdsPessoasPreparo, ' ERRO AO CALCULAR ENQUADRAMENTO ' );
      Result := False;
      Exit;
    End;

    { Busca valor do INSS }
    dValorINSS := RetornaValorINSS( CdsPessoasPreparo, CdsAux, StrToDate( sDataRefEnquadramento ) );
    If dValorINSS = -5005 Then Begin
      GravaLogErro( CdsPessoasPreparo, ' ERRO AO BUSCAR VALOR DO INSS ' );
      Result := False;
      Exit;
    End;

    { Aplica percentual de incentivo de saldamento, 1.09 }
    dValorBS := ( ( ( dValorEnquadramento * dPercentualFUNCEF ) - dValorINSS ) * dIncentivoDeSaldamento );

    { Aplicar beneficio Minimo }
    dValorbeneficioMinimo := RetornaBeneficioMinimo( CdsPessoasPreparo.FieldByName('DATAINICIOFUND').AsDateTime );
    If ( dValorBS < dValorbeneficioMinimo ) Then dValorBS := dValorbeneficioMinimo;

    { Corrigir o valor do SRB }
    dValorBSCorrigido := CorrigeValorBS( psAnoMesRefProcesso, bMostraEvolucaoBS, CdsPessoasPreparo, CdsAux, StrToDate( sDataRefEnquadramento ), dValorBS );
    If dValorBSCorrigido = -5005 Then Begin
      GravaLogErro( CdsPessoasPreparo, ' ERRO AO CORRIGIR VALOR PELOS INPC ' );
      Result := False;
      Exit;
    End;

  End; { Else tpTipoParticipante = tpREBPre78 Then Begin }

  { Atualiza Dados }
  CdsPessoasPreparo.Edit;
  CdsPessoasPreparo.FieldByName('VALORBS').AsFloat := dValorBSCorrigido;
  CdsPessoasPreparo.Post;

  WriteLn( ArquivoExterno, PreparaStr( CdsPessoasPreparo.FieldByName('MATRICULA').AsString, 10 )         +'  '+
                           AlinhaDireita( RetornaTipoParticipanteString( tpTipoParticipante ), 11 )      +'   '+
                           PreparaStr( CdsPessoasPreparo.FieldByName('NOMEBENEFICIARIO').AsString, 31 )  +'  '+
                           AlinhaDireita( FloatToStrF( dValorEnquadramento, ffNumber, 15,2 ), 14)        +'  '+
                           AlinhaDireita( FloatToStrF( dValorINSS, ffNumber, 15,2 ), 14)                 +'  '+
                           AlinhaDireita( FloatToStrF( dPercentualFUNCEFReal, ffNumber, 15,2 ) , 14)     +'  '+
                           AlinhaDireita( FloatToStrF( dValorBS, ffNumber, 15,2 ) , 14)                  +' '+
                           AlinhaDireita( FloatToStrF( CdsPessoasPreparo.FieldByName('VALORBS').AsFloat, ffNumber, 15,2 ), 15)

         );

End; { ProcessaPreparoPessoa }


{------------------------------------------------------------------------------}
{ Executa os acertos entre o novo valor do BD e o historico antigo             }
Function AcertaBeneficioTransfPlano(  psAnoMesRefProcesso, psArquivoMatriculas : String;  bMostraEvolucao : Boolean ) : Boolean;

  {----------------------------------------------------------------------------}
  { Deflaciona o valor do beneficio saldado anualmente                         }
  Function DeflacionaBS( pdValorBSReferencia : Double; psAnoMesRef, psAnoMesDIB : String; CdsAux: TCMClientDataSet; bMostraEvolucao : Boolean ): Double;
  Var
    sSQL, sMoedaIndice : String;
    iAnoRef, iAnoDIB: Integer;
    dValorIndice : Double;

  Begin

    Result := pdValorBSReferencia;

    sMoedaIndice := '7';

    iAnoRef := StrToInt( Copy( psAnoMesRef, 1, 4) );
    iAnoDIB := StrToInt( Copy( psAnoMesDIB, 1, 4) );
    iAnoDIB := iAnoDIB + 1;

    Case iAnoRef Of
      2002 : dValorIndice := 9.4418;
      2003 : dValorIndice := 14.74;
      2004 : dValorIndice := 10.3839;
      2005 : dValorIndice := 6.1332;
      2006 : dValorIndice := 5.0474;
    end;

    { No caso da DIB, compõe Indice }
    If ( iAnoRef = iAnoDIB ) Then Begin

      sSQL := 'SELECT   '+
              '  COT.COTDATA, SUBSTR( COT.COTMESREF, 3,4 ) ||''/''||SUBSTR( COT.COTMESREF, 1,2 ) AS COTMESREF, '+
              '  COT.COTVALOR    '+
              'FROM     '+
              '  COTACAOMOEDA COT '+
              'WHERE    '+
              '  ( COT.MOECODIGO = '+ sMoedaIndice +' ) AND '+
              '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') >= '+ QuotedStr( psAnoMesDIB ) +' ) AND '+
              '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') <= '+ QuotedStr( Copy( psAnoMesDIB,1,5 )+ '12' ) +' ) '+
              'ORDER BY '+
              '  COT.COTDATA   ';
      CdsAux.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

      dValorIndice := 1;;
      While ( Not CdsAux.Eof ) Do Begin

        dValorIndice := dValorIndice * ( 1 + (CdsAux.FieldByName('COTVALOR').AsFloat / 100 ) );
        CdsAux.Next;
      End;

      If ( dValorIndice = 0 ) Then dValorIndice := 1;

    End Else Begin

      dValorIndice := ( 1 + ( dValorIndice / 100 ) );

    End;

    dValorIndice := Trunca(  dValorIndice, 4 ) ;

    Result := ( pdValorBSReferencia / dValorIndice );

  End; { DeflacionaBS }
  {----------------------------------------------------------------------------}


  {----------------------------------------------------------------------------}
  { Corrige o valor da diferenca                                               }
  Function CorrigeValor( dValorReferencia : Double; sAnoMesRef : String; CdsAux: TCMClientDataSet; bMostraEvolucao : Boolean ): Double;
  Var
    sSQL, sMoedaIndice : String;

  Begin

    Result := dValorReferencia;

    sMoedaIndice := '7';

    Try

      sSQL := 'SELECT   '+
              '  COT.COTDATA, SUBSTR( COT.COTMESREF, 3,4 ) ||''/''||SUBSTR( COT.COTMESREF, 1,2 ) AS COTMESREF, '+
              '  COT.COTVALOR    '+

              'FROM     '+
              '  COTACAOMOEDA COT '+

              'WHERE    '+
              '  ( COT.MOECODIGO = '+ sMoedaIndice +' ) AND '+
              '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') = '+ QuotedStr( sAnoMesRef ) +' ) '+
              'ORDER BY '+
              '  COT.COTDATA   ';

      CdsAux.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

      If ( Not CdsAux.IsEmpty ) Then Begin

        dValorReferencia := ( dValorReferencia * CdsAux.FieldByName('COTVALOR').AsFloat );

        Result := dValorReferencia;

      End;

    Except

      Result := -5005; { Erro }

    End;

  End; { CorrigeValor }
  {----------------------------------------------------------------------------}

Var
  dValorPago, dValorAPagar, dValorCobrado, dValorACobrar,
  dValorPagoRefCalculo,
  dIndice, dDiferenca, dDiferencaCorrigida   : double;

  iFlgDevolucao    : word;

  sDataRefInd, sIndiceCorrecao, sSQL, sMsgErro, sLinhaMatriculas,
  sAnoMesAtual, sAnoMesDIB : string;

  iDiasProRata, iMesesProRata, iSeqBeneficio : Integer;
  CdsPessoasProcesso, CdsHistoricoPessoa, CdsAux : TCMClientDataSet;

  dValorBSOriginal, dValorBSReferencia, dValorBSCalculoReal, dValorBSCalculo  : Double;
Begin

  Result        := False;

  Try

    CtrlObjectAcessoBD := TCmControlObject.Create;
    CtrlObjectAcessoBD.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer,
                                 True, Nil );

    CdsHistoricoPessoa := TCMClientDataSet.Create( Nil );
    CdsPessoasProcesso := TCMClientDataSet.Create( Nil );
    CdsAux             := TCMClientDataSet.Create( Nil );

    IniciaArquivoDemonstrativo;
    WriteLn( ArquivoExterno, '  ' );

    sSQL := 'SELECT   '+
            '  PES.NOME, '+
            '  RES.IDTIPORESERVA,    RES.IDPLANOPREV,      RES.IDPESSOA,         RES.IDPESSJUR,      '+
            '  RES.DATAREFERENCIASA, RES.SEQPROPOSTA,      RES.VALORRESERVA,     RES.IDPARTICIPANTE  '+
            'FROM     '+
            '  RESERVAPART RES, PESSOA PES, DEPENTIT DEP '+
            'WHERE    '+
            '  RES.IDTIPORESERVA        = 114 AND '+
            '  RES.IDPLANOPREV          = 2   AND ';

    If psArquivoMatriculas <> '' Then Begin

      sLinhaMatriculas := MontaStringMatriculas( psArquivoMatriculas );
      sSQL := sSQL + ' DEP.MATRICULA IN ('+ sLinhaMatriculas +') AND ';

    End;

    sSQL := sSQL +
            '  RES.IDPESSOA       = PES.IDPESSOA  AND'+
            '  RES.IDPARTICIPANTE = DEP.IDTITULAR AND '+
            '  RES.IDPESSOA       = DEP.IDPESSOA      '+
            'ORDER BY '+
            '  RES.IDPARTICIPANTE, RES.IDPESSOA ';

    CdsPessoasProcesso.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

    dValorBSOriginal   := ( CdsPessoasProcesso.FieldByName('VALORRESERVA').AsFloat / 1.0088);
    dValorBSReferencia := ( CdsPessoasProcesso.FieldByName('VALORRESERVA').AsFloat / 1.0088);

    While ( Not CdsPessoasProcesso.Eof ) Do Begin

       If ( bMostraEvolucao = True ) Then Begin

         WriteLn( ArquivoExterno, '  ' ); WriteLn( ArquivoExterno, '  ' );
         WriteLn( ArquivoExterno, '-->  '+ CdsPessoasProcesso.FieldByName('IDPESSOA').AsString + ' - ' +
                                           CdsPessoasProcesso.FieldByName('NOME').AsString );
          WriteLn( ArquivoExterno, PreparaStr( 'MÊS       ',    12 )   +'  '+
                                   PreparaStr( 'VALOR DEVIDO ', 17 )   +'  '+
                                   PreparaStr( 'VALOR PAGO ',   16 )   +'  '+
                                   PreparaStr( 'DIFERENÇA',     15 ) );
       End;

       sSQL := 'SELECT   '+
               '  GREATEST ( B.DATAINICIOFUND, TO_DATE('+ QuotedStr('01/09/2001')+') ) AS DATAINICIOFUND,  '+
               '  H.MESREFERENCIA, '+
               '  SUM( DECODE( H.FLGDEVOLUCAO, 1, -H.VALORPREV,     H.VALORPREV ) )     AS VALORPREV,    '+
               '  SUM( DECODE( H.FLGDEVOLUCAO, 1, -H.VLBENEFPGTO,   H.VLBENEFPGTO ) )   AS VLBENEFPGTO,  '+
               '  SUM( DECODE( H.FLGDEVOLUCAO, 1, -H.VALORINTEGRAL, H.VALORINTEGRAL ) ) AS VALORINTEGRAL '+
               'FROM     '+
               '  HSTBENEFBFCIARIO H, BENEFBFCIARIO B '+
               'WHERE    '+
               '  H.IDTITULAR   = '+CdsPessoasProcesso.FieldByName('IDPARTICIPANTE').AsString + ' AND '+
               '  H.IDPESSOA    = '+CdsPessoasProcesso.FieldByName('IDPESSOA').AsString       + ' AND '+
               '  H.IDPLANOPREV = '+CdsPessoasProcesso.FieldByName('IDPLANOPREV').AsString    + ' AND '+

               '  H.MESREFERENCIA >= TO_CHAR( GREATEST ( B.DATAINICIOFUND, TO_DATE('+ QuotedStr('01/09/2001')+') ), ''YYYY/MM'' ) AND '+

               '  B.IDSITBENEFICIO = 1 AND '+
               '  B.FONTEPAGADORA  = 1 AND '+

               '  B.IDPESSJUR      = H.IDPESSJUR      AND '+
               '  B.IDPLANOORIGEM  = H.IDPLANOORIGEM  AND '+
               '  B.IDPLANOPREV    = H.IDPLANOPREV    AND '+
               '  B.IDTITULAR      = H.IDTITULAR      AND '+
               '  B.IDPESSOA       = H.IDPESSOA       AND '+
               '  B.IDBENEFICIO    = H.IDBENEFICIO    AND '+
               '  B.SEQPROPOSTA    = H.SEQPROPOSTA            '+
               'GROUP BY '+
               '  H.NUMEROPROCESSO, H.IDPESSJUR, H.IDPLANOPREV, H.IDTITULAR, H.IDPESSOA, H.IDBENEFICIO, H.MESREFERENCIA, B.DATAINICIOFUND '+
               'ORDER BY '+
               '  H.MESREFERENCIA DESC ';

      CdsHistoricoPessoa.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

      dValorBSCalculo     := dValorBSReferencia;
      dValorBSCalculoReal := dValorBSReferencia;

      dValorBSReferencia  := 2893;
      dValorBSCalculo     := 2893;
      dValorBSCalculoReal := 2893;

      sAnoMesDIB   := FormatDateTime( 'YYYY/MM', CdsHistoricoPessoa.FieldByName('DATAINICIOFUND').AsDateTime);
      sAnoMesAtual := psAnoMesRefProcesso;
      dValorPago   := 0; dValorPagoRefCalculo :=0;

      While ( sAnoMesAtual >= sAnoMesDIB ) Do Begin

        If ( Not CdsHistoricoPessoa.Locate('MESREFERENCIA', sAnoMesAtual, []) )     Or
           (
             ( CdsHistoricoPessoa.FieldByName('MESREFERENCIA').AsString < '2006/01' ) And
             ( (dValorPago * 1.20) <= CdsHistoricoPessoa.FieldByName('VALORPREV').AsFloat )
           )
        Then begin

          dValorPago := dValorPagoRefCalculo;

        End Else Begin

          dValorPago := CdsHistoricoPessoa.FieldByName('VALORPREV').AsFloat;

          If ( Pos( '/13', CdsHistoricoPessoa.FieldByName('MESREFERENCIA').AsString ) <= 0 ) Then
            dValorPagoRefCalculo := CdsHistoricoPessoa.FieldByName('VALORPREV').AsFloat;

        End;

        dValorBSCalculo := dValorBSCalculoReal;

        { Pro-Rata de dias }
        If ( sAnoMesAtual = sAnoMesDIB ) Then Begin

          iDiasProRata := ( 30 - StrToInt( Copy( CdsHistoricoPessoa.FieldByName('DATAINICIOFUND').AsString, 1, 2) ) );
          If ( iDiasProRata <= 0 ) Then iDiasProRata := 1;

          dValorPago      := ( dValorPago /30 )      * iDiasProRata;
          dValorBSCalculo := ( dValorBSCalculo /30 ) * iDiasProRata;

        End;

        { Pro-Rata de meses }
        If ( Pos( '/13', sAnoMesAtual ) > 0 ) And
           ( Copy ( sAnoMesAtual, 1,4 ) = Copy( CdsHistoricoPessoa.FieldByName('DATAINICIOFUND').AsString, 7, 4) )
        Then Begin

          iMesesProRata := ( 12 - StrToInt( Copy( CdsHistoricoPessoa.FieldByName('DATAINICIOFUND').AsString, 4, 2) ) );
          If ( iMesesProRata <= 0 ) Then iMesesProRata := 1;

          dValorBSCalculo := ( dValorBSCalculo /12 ) * iMesesProRata;

        End;

        { Deflaciona valor }
        If ( Pos( '/01', sAnoMesAtual ) > 0 ) Or ( sAnoMesAtual = sAnoMesDIB ) Then Begin

          dValorBSReferencia :=  DeflacionaBS( dValorBSReferencia,
                                               sAnoMesAtual,
                                               sAnoMesDIB,
                                               CdsAux,
                                               bMostraEvolucao );
        End;

        { Calcular acerto }
        If ( dValorPago > dValorBSCalculo ) Then Begin
           iFlgDevolucao := 1;
           dDiferenca    := ( dValorPago - dValorBSCalculo );
        End Else Begin
           iFlgDevolucao := 0;
           dDiferenca    := ( dValorBSCalculo - dValorPago );
        End;

        //If dDiferenca <= 0.01 Then Begin
        //
        //   CdsHistoricoPessoa.Next;
        //   Continue;
        //
        //End;

        dDiferencaCorrigida := CorrigeValor( dDiferenca, sAnoMesAtual, CdsAux, bMostraEvolucao );

        If ( bMostraEvolucao = True ) Then Begin

          WriteLn( ArquivoExterno, PreparaStr( sAnoMesAtual , 10 ) +'  '+
                                   AlinhaDireita( FloatToStrF( dValorBSCalculo, ffNumber, 15,2 ), 14) +' - '+
                                   AlinhaDireita( FloatToStrF( dValorPago,      ffNumber, 15,2 ), 14) +' = '+
                                   AlinhaDireita( FloatToStrF( dDiferencaCorrigida,      ffNumber, 15,2 ), 14) );
        End;

        If ( Pos( '/01', CdsHistoricoPessoa.FieldByName('MESREFERENCIA').AsString ) > 0 )Then Begin

          dValorBSCalculoReal := dValorBSReferencia;

        End;

        CdsHistoricoPessoa.Next;

        sAnoMesAtual := AnoMesAnterior( sAnoMesAtual );

      End; { While ( Not CdsHistoricoPessoa.Eof ) Do Begin }


(*
       if ( (qryGrava.FieldByName('VALORPREV').AsFloat <= 0) and (qrygrava.recordcount > 0 ) )
           or (qrygrava.recordcount = 0 )
           or (dtmaprev.qry.FieldByName('MESREFERENCIA').AsString > qryaux.fieldbyname('ULTMESPREPARO').AsString )then
       begin
          dtmaprev.qry.next;
          continue;
       end;



       sAnoMesRef := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;

       dIndice := 1;

       if Trim(dblkpcmbRegraParcela.Text) <> '' then begin
         sDataRefInd  := '01/'+Copy(sAnoMesRef,6,2)+'/'+Copy(sAnoMesRef,1,4);
         sSQL := 'SELECT '+OraNumero(FloatToStr(dIndice))+ ' AS INDICE, '+
                           IntToStr(piIdPessoa)          + ' AS IDPESSOA, '+
                           QuotedStr(sDataRefInd)        + ' AS DATAREF, '+
                           QuotedStr('1')                + ' AS FLGMIGRACAO, '+
                           QuotedStr(sAnoMesRefAnt)      + ' AS ANOMESREFANT, '+
                           QuotedStr(sAnoMesRef)         + ' AS ANOMESREF, '+
                           QuotedStr(Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2))+ ' AS ANOMESACERTOINI, '+
                           QuotedStr(sAnoMesLote)        + ' AS ANOMESACERTOFIM  '+
                 'FROM DUAL ';

          sIndiceCorrecao := RegraNumerica(dblkpcmbRegraParcela.LookupValue,
                                           sSQLRegraCorrecao, bErro, iIdCaluloAtualizacao);
          dIndice := StrToFloat(ClienteNumero(sIndiceCorrecao));
          if dIndice <= 0 then dIndice := 1;
       end;
       { Fim Augusto 21/06/2004 }

       { Inicio Augusto 18/06/2004 }
       iSeqBeneficio := PegaSeqBeneficio(qryAux,
                                         piIdPessJur,   piIdTitular,
                                         dtmaprev.qry.FieldByName('IDPLANOPREV').AsInteger,
                                         piIdPessoa,
                                         piSeqProposta,
                                         dtmaprev.qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                         dtmaprev.qry.FieldByName('IDBENEFICIO').AsInteger,
                                         prmIdMotivoAcertoMigracaoPlano,
                                         sAnoMesLote,
                                         dtmaprev.qry.FieldByName('MESREFERENCIA').AsString);
       { Fim Augusto 18/06/2004 }
       if not InsereHstBenefBfciario ( qryGrava,
                                       iSeqBeneficio, // 2, { Augusto 18/06/2004 }
                                       dtmaprev.qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                       dtmaprev.qry.FieldByName('IDBENEFICIO').AsInteger,
                                       dtmaprev.qry.FieldByName('IDPESSJUR').AsInteger,
                                       dtmaprev.qry.FieldByName('IDPLANOPREV').AsInteger,
                                       piIdTitular,
                                       piSeqProposta,
                                       piIdPessoa,
                                       -1,
                                       prmIdMotivoAcertoMigracaoPlano,
                                       -1, // piCodPortForma
                                       dtmaprev.qry.FieldByName('MESREFERENCIA').AsString,
                                       sAnoMesLote,
                                       '','','', // matricula, inscricao, lote
                                       (dDiferenca*dIndice), { Augusto 22/06/2004 }
                                       (dDiferenca*dIndice), { Augusto 22/06/2004 }
                                       dtmaprev.qry.FieldByName('VALORINTEGRAL').AsFloat,
                                       0, // valorpago
                                       0, // piFlgEnviado
                                       1, // piFlgConcessao
                                       iFlgDevolucao,
                                       iIdLote,
                                       sMsgErro,
                                       sDataFolha // datapagamento
                                       )

       then
       begin
          GravaErro('Erro ao inserir acerto de benefício no histórico.');
          Exit;
       end;

       sAnoMesRefAnt  := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
       dtmaprev.qry.Next;
    end;


    // **************************************************************************
    // ****************************  CONTRIBUICOES ******************************
    // **************************************************************************
    // Abrir query com novas contribuicoes, preparadas pelo evento de transferencia
    // de plano somando as contribuicoes por pagador, já que não existe de-para de
    // contribuicoes
    with dtmaprev.qry do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT H.MESCOBRANCA, H.MESREFERENCIA, H.IDPESSOA, CP.FLGPAGADOR,  H.IDPESSJUR, H.IDPLANOPREV,    '+
               '        MAX(H.IDCONTRIBUICAO) AS IDCONTRIBUICAO,                                        '+
               '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORESPERADO,H.VALORESPERADO)) AS VALORESPERADO,'+
               '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO '+
               ' FROM   CONTPREV CP, HSTCONTRIBPREV H                                                   '+
               ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)+
               ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)+
               ' AND    H.IDPESSOA =   '+IntToStr(piIdPessoa)+
               ' AND    H.SEQPROPOSTA = '+IntToStr(piSeqProposta)+
               ' AND    H.MESREFERENCIA    >= '''+Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2)+''' '+
               ' AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoDepois+'''  '+
               {' AND    EXISTS ( SELECT 1                                                               '+
               '                 FROM   BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CN    '+
               '                 WHERE  BTIT.IDPESSJUR       = '+IntToStr(piIdPessJur)                   +
               '                 AND    BTIT.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)                 +
               '                 AND    BTIT.IDTITULAR       = '+IntToStr(piIdTitular)                   +
               '                 AND    BTIT.IDPESSOA        = '+IntToStr(piIdPessoa)                    +
               '                 AND    BTIT.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                 +
               '                 AND    N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR                    '+
               '                 AND    CN.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR                       '+
               '                 AND    H.IDPESSOA           = N.IDRESPNUCLEO                           '+
               '                 AND    H.IDCONTRIBUICAO     = CN.IDCONTRIBUICAO )                      '+}
               ' AND   CP.IDPLANOPREV    = H.IDPLANOPREV                                                '+
               ' AND   CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                                             '+
               ' GROUP BY H.MESCOBRANCA, H.MESREFERENCIA, H.IDPESSOA, CP.FLGPAGADOR ,  H.IDPESSJUR, H.IDPLANOPREV   '+
               ' ORDER BY H.MESCOBRANCA, H.MESREFERENCIA                                                ');
       Open;

    end;

    sAnoMesRefAnt := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
    // Para cada linha encontrada, verificar se o beneficio associado no DE-PARA teve
    // valor calculado diferente
    while not dtmaprev.qry.Eof do
    begin
       qryGrava.Close;
       qryGrava.SQL.Clear;
       qryGrava.SQL.Add(' SELECT H.IDPESSJUR, H.IDPLANOPREV,                                                     '+
                        '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORESPERADO,H.VALORESPERADO)) AS VALORESPERADO,'+
                        '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO '+
                        ' FROM   CONTPREV CP, HSTCONTRIBPREV H                                                   '+
                        ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)                                      +
                        ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoOrigem)                                  +
                        ' AND    H.IDPESSOA        = '+dtmaprev.qry.FieldByName('IDPESSOA').AsString              +
                        ' AND    H.MESREFERENCIA   = '''+dtmaprev.qry.FieldByName('MESREFERENCIA').AsString+''' '+
                        ' AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoAntes+'''  '+
                        ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV                                               '+
                        ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                                            '+
                        ' AND    CP.FLGPAGADOR     = '''+dtmaprev.qry.FieldByName('FLGPAGADOR').AsString+'''              '+
                        ' GROUP BY H.IDPESSJUR, H.IDPLANOPREV                                                    ');
       qryGrava.Open;


       if qryGrava.FieldByName('VALORESPERADO').AsFloat <= 0 then
       begin
          sAnoMesRefAnt  := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
          dtmaprev.qry.next;
          continue;
       end;

       dValorCobrado:= qryGrava.FieldByName('VALORESPERADO').AsFloat;
       dValorACobrar:= dtmaprev.qry.FieldbyName('VALORESPERADO').AsFloat;

       if dValorCobrado > dValorACobrar
       then begin
          iFlgDevolucao := 1;
          dDiferenca    := dValorCobrado - dValorACobrar;
       end
       else begin
          iFlgDevolucao := 0;
          dDiferenca    := dValorACobrar - dValorCobrado;
       end;

       if dDiferenca <= 0.01
       then begin
          dtmaprev.qry.Next;
          continue;
       end;

       { Inicio Augusto 21/06/2004 }
       dIndice := 1;
       if Trim(dblkpcmbRegraParcela.Text) <> '' then begin
         sSQLRegraCorrecao := 'SELECT '+OraNumero(FloatToStr(dIndice))+ ' AS INDICE, '+
                                        IntToStr(piIdPessoa)          + ' AS IDPESSOA, '+
                                        QuotedStr(sDataRefInd)        + ' AS DATAREF, '+
                                        QuotedStr('1')                + ' AS FLGMIGRACAO, '+
                                        QuotedStr(sAnoMesRefAnt)      + ' AS ANOMESREFANT, '+
                                        QuotedStr(dtmaprev.qry.FieldByName('MESREFERENCIA').AsString)       + ' AS ANOMESREF, '+
                                        QuotedStr(Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2))+ ' AS ANOMESACERTOINI, '+
                                        QuotedStr(sAnoMesLote)   + ' AS ANOMESACERTOFIM  '+
                              'FROM DUAL ';

          sIndiceCorrecao := RegraNumerica(dblkpcmbRegraParcela.LookupValue,
                                           sSQLRegraCorrecao, bErro, iIdCaluloAtualizacao);
          dIndice := StrToFloat(ClienteNumero(sIndiceCorrecao));
          if dIndice <= 0 then dIndice := 1;
       end;
       { Fim  Augusto 21/06/2004 }

       if InsereHstContribPREV( qryGrava,
                                dtmaprev.qry.FieldByName('IDPESSOA').AsInteger,
                                piSeqProposta,
                                dtmaprev.qry.FieldByName('IDPESSJUR').AsInteger,
                                dtmaprev.qry.FieldByName('IDPLANOPREV').AsInteger,
                                dtmaprev.qry.FieldByName('IDCONTRIBUICAO').AsInteger,
                                prmIdMotivoAcertoMigracaoPlano,
                                dtmaprev.qry.FieldByName('MESREFERENCIA').AsString,
                                sAnoMesLote,
                                -1,
                                sDataFolha,
                                '',                   // psDataRecebimento
                                (dDiferenca*dIndice), { Augusto 22/06/2004 }
                                (dDiferenca*dIndice), { Augusto 22/06/2004 }
                                0,                    // pdValorRecebido
                                -1,                   // piIdRegraCalculo
                                1,                    // piFlgDescFolha
                                0,                   // pdValorBase1,
                                0,                   // pdValorBase2,
                                0,                   // pdValorBase3
                                '',                  // psDataInicio
                                '',                  // psDataFinal
                                'AS',
                                0,                   // sitrecebimento
                                0,                   // parcela
                                iIdLote,
                                'F',
                                0,                   // piFlgCalcReserva
                                iFlgDevolucao,
                                1,                   // piFlgConcessao
                                1 ) < 0              // piFlgEvento
       then
       begin
          GravaErro('Erro inserir acerto de contribuições no histórico.');
          Exit;
       end;

       sAnoMesRefAnt  := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
       dtmaprev.qry.Next;
*)
      CdsPessoasProcesso.Next;

    End; { While ( Not CdsPessoasProcesso.Eof ) Do Begin }

  Finally

    FreeAndNil( CdsAux );
    FreeAndNil( CdsHistoricoPessoa );
    FreeAndNil( CdsPessoasProcesso );

    FreeAndNil( CtrlObjectAcessoBD );


    Flush( ArquivoExterno );
    CloseFile( ArquivoExterno );

    WinExec( PChar( 'NOTEPAD.EXE '+sNomeArquivoDemonstrativo ) , SW_SHOW );


  End;

   Result   := True;
End; { AcertaBeneficioTransfPlano }


{------------------------------------------------------------------------------}
{ Executa a rotina de enquadramento                                            }
Function ExecutaEnquadramento( CdsPessoasPreparo : TCMClientDataSet; dDataRefProcesso: TDateTime; QryAux : TwwQuery ): Double;
Var
  sMsgErro, sSQL : String;
  bErro : Boolean;
  iIdCalculo : Integer;
Begin

  Result := 0;

  Try

    QryAux.SQL.Clear;

    (*

    Result := ExecutaRegraCalculoSRB(QryAux,
                                     6105,
                                     CdsPessoasPreparo.FieldByName('IDPESSJUR').AsInteger,
                                     CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsInteger,
                                     CdsPessoasPreparo.FieldByName('IDTITULAR').AsInteger,
                                     CdsPessoasPreparo.FieldByName('SEQPROPOSTA').AsInteger,
                                     CdsPessoasPreparo.FieldByName('IDBENEFICIO').AsInteger,
                                     CdsPessoasPreparo.FieldByName('NUMEROPROCESSO').AsInteger,

                                     CdsPessoasPreparo.FieldByName('IDSITFUNC').AsInteger,
                                     CdsPessoasPreparo.FieldByName('IDSITPART').AsInteger,
                                     CdsPessoasPreparo.FieldByName('IDSITPLANOPREV').AsInteger,

                                     CdsPessoasPreparo.FieldByName('VALORBASE1').AsFloat,
                                     CdsPessoasPreparo.FieldByName('VALORBASE2').AsFloat,
                                     CdsPessoasPreparo.FieldByName('VALORBASE3').AsFloat,

                                     sSQL,

                                     DateToStr( dDataRefProcesso ), { DATAEVENTO }
                                     CdsPessoasPreparo.FieldByName('DATAINICIOFUND').AsString,
                                     CdsPessoasPreparo.FieldByName('DATAINICIOINSS').AsString,
                                     CdsPessoasPreparo.FieldByName('DATAINICIO').AsString,
                                     CdsPessoasPreparo.FieldByName('DATAREQUERIMENTO').AsString,

                                     CdsPessoasPreparo.FieldByName('VLRINFINSS').AsString,
                                     CdsPessoasPreparo.FieldByName('VLRCALCINSS').AsString,

                                     '0', False, 0,

                                     CdsPessoasPreparo.FieldByName('DIBBENEFANT').AsString,
                                     CdsPessoasPreparo.FieldByName('VALORBENEFANT').AsString,
                                     CdsPessoasPreparo.FieldByName('VALORBINSSANT1').AsString,
                                     CdsPessoasPreparo.FieldByName('VALORBINSSANT2').AsString,
                                     CdsPessoasPreparo.FieldByName('VALORBINSSANT3').AsString,

                                     bErro,  sMsgErro, iIdCalculo, 0 );
    *)

     If bErro = True Then Result := -5005;

  Except

    Result := -5005;

  End;

End;

{------------------------------------------------------------------------------}
{ Busca os dados das pessoas utilizadas no preparo para saldamento             }
Function InsereReservaPart( CdsPessoasPreparo : TCMClientDataSet ) : Boolean;
Begin

  QryInsereReservaPart.ParamByName('IDPESSJUR').AsInteger         := CdsPessoasPreparo.FieldByName('IDPESSJUR').AsInteger;
  QryInsereReservaPart.ParamByName('IDPLANOPREV').AsInteger       := 2;
  QryInsereReservaPart.ParamByName('IDPESSOA').AsInteger          := CdsPessoasPreparo.FieldByName('IDBENEFICIARIO').AsInteger;
  QryInsereReservaPart.ParamByName('SEQPROPOSTA').AsInteger       := CdsPessoasPreparo.FieldByName('SEQPROPOSTA').AsInteger;

  QryInsereReservaPart.ParamByName('IDTIPORESERVA').AsInteger     := 114;
  QryInsereReservaPart.ParamByName('VALORRESERVA').AsFloat        := CdsPessoasPreparo.FieldByName('VALORBS').AsFloat;


  QryInsereReservaPart.ExecSQL;
End; { InsereReservaPart }

{------------------------------------------------------------------------------}
{ Iniciar tabela de benficios minimos                                          }
procedure IniciaTabelaBeneficioMinimo;
begin

  VetBeneficioMinimo[0].DataReferencia := StrToDate('31/12/2001');
  VetBeneficioMinimo[0].Valor          := 136.26;

  VetBeneficioMinimo[1].DataReferencia := StrToDate('31/12/2002');
  VetBeneficioMinimo[1].Valor          := 140.95;

  VetBeneficioMinimo[2].DataReferencia := StrToDate('31/12/2003');
  VetBeneficioMinimo[2].Valor          := 161.72;

  VetBeneficioMinimo[3].DataReferencia := StrToDate('31/12/2004');
  VetBeneficioMinimo[3].Valor          := 178.52;

  VetBeneficioMinimo[4].DataReferencia := StrToDate('31/12/2005');
  VetBeneficioMinimo[4].Valor          := 189.47;

  VetBeneficioMinimo[5].DataReferencia := StrToDate('31/12/2006');
  VetBeneficioMinimo[5].Valor          := 199.04;

end; { IniciaTabelaBeneficioMinimo }

{------------------------------------------------------------------------------}
{ Iniciar componente que irá incluir os dados no BD                            }
procedure IniciaQryInsereReservaPart;
Var
  sSQL : String;
begin

  QryInsereReservaPart := TwwQuery.Create( Nil );
  QryInsereReservaPart.DatabaseName := 'BaseDados';

  sSQL := 'INSERT INTO RESERVAPART                                                         '+
          '(                                                                               '+
          '  IDTIPORESERVA,    IDPLANOPREV,       IDPESSOA,         IDPESSJUR,             '+
          '  DATAREFERENCIASA, SEQPROPOSTA,       CODDOCUMENTOPREV, VALORRESERVA,          '+
          '  PLNCODIGOPREV,    PERCENTUALSAQUE,   CODPORTFORMA,     CODCENTRORESPON,       '+
          '  IDEMPRESAPROP,    CODSUBCONTA,       UNIDNEGOC,        CODCENTROCUSTOD,       '+
          '  IDEMPRESA,        CODCENTROCUSTOC,   PLACONTAD,        PLANO,                 '+
          '  PLACONTAC,        PLNCODIGOEFET,     CODDOCUMENTOEFET, FLGATIVO,              '+
          '  DATADESATIV,      FLGINCONSISTENCIA, DATAULTALIM,      DATAULTATUALIZA        '+
          ')                                                                               '+
          'VALUES                                                                          '+
          '(                                                                               '+
          '  :IDTIPORESERVA,    :IDPLANOPREV,       :IDPESSOA,         :IDPESSJUR,         '+
          '  :DATAREFERENCIASA, :SEQPROPOSTA,       :CODDOCUMENTOPREV, :VALORRESERVA,      '+
          '  :PLNCODIGOPREV,    :PERCENTUALSAQUE,   :CODPORTFORMA,     :CODCENTRORESPON,   '+
          '  :IDEMPRESAPROP,    :CODSUBCONTA,       :UNIDNEGOC,        :CODCENTROCUSTOD,   '+
          '  :IDEMPRESA,        :CODCENTROCUSTOC,   :PLACONTAD,        :PLANO,             '+
          '  :PLACONTAC,        :PLNCODIGOEFET,     :CODDOCUMENTOEFET, :FLGATIVO,          '+
          '  :DATADESATIV,      :FLGINCONSISTENCIA, :DATAULTALIM,      :DATAULTATUALIZA    '+
          ')                                                                               ';

  QryInsereReservaPart.SQL.Add( sSQL );

  QryInsereReservaPart.ParamByName('IDPESSJUR').DataType             := ftInteger;
  QryInsereReservaPart.ParamByName('IDPLANOPREV').DataType           := ftInteger;
  QryInsereReservaPart.ParamByName('IDPESSOA').DataType              := ftInteger;
  QryInsereReservaPart.ParamByName('SEQPROPOSTA').DataType           := ftInteger;
  QryInsereReservaPart.ParamByName('IDTIPORESERVA').DataType         := ftInteger;
  QryInsereReservaPart.ParamByName('VALORRESERVA').DataType          := ftFloat;
  QryInsereReservaPart.ParamByName('DATAREFERENCIASA').DataType      := ftDateTime;
  QryInsereReservaPart.ParamByName('CODDOCUMENTOPREV').DataType      := ftString;
  QryInsereReservaPart.ParamByName('PERCENTUALSAQUE').DataType       := ftFloat;
  QryInsereReservaPart.ParamByName('CODPORTFORMA').DataType          := ftString;
  QryInsereReservaPart.ParamByName('CODCENTRORESPON').DataType       := ftString;
  QryInsereReservaPart.ParamByName('IDEMPRESAPROP').DataType         := ftInteger;
  QryInsereReservaPart.ParamByName('CODSUBCONTA').DataType           := ftString;
  QryInsereReservaPart.ParamByName('UNIDNEGOC').DataType             := ftString;
  QryInsereReservaPart.ParamByName('CODCENTROCUSTOD').DataType       := ftString;
  QryInsereReservaPart.ParamByName('IDEMPRESA').DataType             := ftInteger;
  QryInsereReservaPart.ParamByName('CODCENTROCUSTOC').DataType       := ftString;
  QryInsereReservaPart.ParamByName('PLACONTAD').DataType             := ftString;
  QryInsereReservaPart.ParamByName('PLANO').DataType                 := ftInteger;
  QryInsereReservaPart.ParamByName('PLACONTAC').DataType             := ftString;
  QryInsereReservaPart.ParamByName('PLNCODIGOEFET').DataType         := ftString;
  QryInsereReservaPart.ParamByName('PLNCODIGOPREV').DataType         := ftString;
  QryInsereReservaPart.ParamByName('CODDOCUMENTOEFET').DataType      := ftString;
  QryInsereReservaPart.ParamByName('FLGATIVO').DataType              := ftInteger;
  QryInsereReservaPart.ParamByName('DATADESATIV').DataType           := ftDateTime;
  QryInsereReservaPart.ParamByName('FLGINCONSISTENCIA').DataType     := ftInteger;
  QryInsereReservaPart.ParamByName('DATAULTALIM').DataType           := ftDateTime;
  QryInsereReservaPart.ParamByName('DATAULTATUALIZA').DataType       := ftDateTime;

end; { IniciaQryInsereReservaPart }


{------------------------------------------------------------------------------}
{ Iniciar arquivo externo de demonstrativo                                     }
procedure IniciaArquivoDemonstrativo;
begin

    DateSeparator := '-';
    TimeSeparator := '-';
//  sNomeArquivoDemonstrativo := 'C:\TEMP\DEMONSTRATIVO DE SALDAMENTO '+ DateToStr( Date ) +' AS '+TimeToStr( Time ) +'.TXT';
    sNomeArquivoDemonstrativo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TEMP\DEMONSTRATIVO DE SALDAMENTO '+ DateToStr( Date ) +' AS '+TimeToStr( Time ) +'.TXT';
    DateSeparator := '/';
    TimeSeparator := ':';

    AssignFile( ArquivoExterno,  PChar( sNomeArquivoDemonstrativo ) );

    Rewrite( ArquivoExterno );
    WriteLn( ArquivoExterno, 'MATRICULA          TIPO   NOME                               VALOR DO SRB   VALOR DO INSS        % FUNCEF     VALOR DO BS    BS CORRIGIDO' );
    WriteLn( ArquivoExterno, '---------   -----------   -------------------------------   -------------   -------------   -------------   -------------   -------------' );

end; { IniciaArquivoDemonstrativo }


{------------------------------------------------------------------------------}
{ Gravar linha com o erro no demonstrativo                                     }
Procedure GravaLogErro( CdsPessoasPreparo : TCMClientDataSet; psMensagem : String );
Begin

  WriteLn( ArquivoExterno, PreparaStr( CdsPessoasPreparo.FieldByName('MATRICULA').AsString, 16 ) +' - '+
                           psMensagem );

End;

{------------------------------------------------------------------------------}
{ Retorna o valor do beneficio minimo                                          }
Function RetornaBeneficioMinimo( dDataRef: TDateTime): Double;
Var
  I : Integer;
begin

  Result := 0;

  For I := 0 To 5 Do Begin

    If dDataRef < VetBeneficioMinimo[I].DataReferencia Then Result := VetBeneficioMinimo[I].Valor;

  End;

end;

{------------------------------------------------------------------------------}
{ Retorna o valor do beneficio do INSS                                         }
Function  RetornaValorINSS( CdsPessoasPreparo, CdsAux : TCMClientDataSet; dDataRef: TDateTime ): Double;
Var
  sSQL : String;
Begin

  Result := 0;

  Try

    { Primeira pesquisa no histórico no INSS }

    sSQL := 'SELECT '+
            '  HFB.VALORINTEGRAL,         HFB.VALORTOTAL '+

            'FROM   '+
            '  HSTBENEFBFCIARIO HFB, '+
            '  BENEFPLANPREV BPP  '+

            'WHERE  '+
            '  ( BPP.FLGREFERENCIA = 1 ) AND '+
            '  ( HFB.IDPESSJUR   = '+ CdsPessoasPreparo.FieldByName('IDPESSJUR').AsString      + ' ) AND '+
            '  ( HFB.IDPLANOPREV = '+ CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsString    + ' ) AND '+
            '  ( HFB.IDTITULAR   = '+ CdsPessoasPreparo.FieldByName('IDTITULAR').AsString      + ' ) AND '+
            '  ( HFB.IDPESSOA    = '+ CdsPessoasPreparo.FieldByName('IDBENEFICIARIO').AsString + ' ) AND '+
            '  ( HFB.MESREFERENCIA = TO_CHAR( TO_DATE( '+ QuotedStr( DateToStr( dDataRef ) ) +', ''DD/MM/YYYY''), ''YYYY/MM'')' +' ) AND '+
            '  ( HFB.IDPLANOPREV = BPP.IDPLANOPREV  )  AND '+
            '  ( HFB.IDBENEFICIO = BPP.IDBENEFICIO  )      '+
            'ORDER BY '+
            '  HFB.SEQBENEFICIO DESC  ';

    CdsAux.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

    If ( Not CdsAux.IsEmpty ) Then Begin

      Result := CdsAux.FieldByName('VALORTOTAL').AsFloat;

      Exit;

    End;


    { Segunda pesquisa na BENEFBFCIARIO do INSS }

    sSQL := 'SELECT '+
            '  BFB.VLRCALCINSS,        BFB.VLRINFINSS,       BFB.VALORTOTAL,     '+
            '  BFB.VALORBINSSANT1,     BFB.VALORBINSSANT2,   BFB.VALORBINSSANT3  '+

            'FROM   '+
            '  BENEFBFCIARIO BFB, '+
            '  BENEFPLANPREV BPP  '+

            'WHERE  '+
            '  ( BPP.FLGREFERENCIA = 1 ) AND '+
            '  ( BFB.IDPESSJUR   = '+ CdsPessoasPreparo.FieldByName('IDPESSJUR').AsString      + ' ) AND '+
            '  ( BFB.IDPLANOPREV = '+ CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsString    + ' ) AND '+
            '  ( BFB.IDTITULAR   = '+ CdsPessoasPreparo.FieldByName('IDTITULAR').AsString      + ' ) AND '+
            '  ( BFB.IDPESSOA    = '+ CdsPessoasPreparo.FieldByName('IDBENEFICIARIO').AsString + ' ) AND '+
            '  ( BFB.IDPLANOPREV = BPP.IDPLANOPREV  )  AND '+
            '  ( BFB.IDBENEFICIO = BPP.IDBENEFICIO  )      ';

    CdsAux.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

    If ( Not CdsAux.IsEmpty ) Then Begin

      Result := CdsAux.FieldByName('VALORTOTAL').AsFloat;

    End;


  Except

    Result := -5005; { Erro }

  End;

End;


{------------------------------------------------------------------------------}
{ Retorna o valor da suplementação na referencia                               }
Function  RetornaValorSUPL( CdsPessoasPreparo, CdsAux : TCMClientDataSet; dDataRef: TDateTime ): Double;
Var
  sSQL : String;
Begin

  Result := 0;

  Try

    { Pesquisa no histórico }

    sSQL := 'SELECT '+
            '  HFB.MESREFERENCIA, HFB.VALORINTEGRAL, HFB.VALORTOTAL '+

            'FROM   '+
            '  HSTBENEFBFCIARIO HFB, '+
            '  BENEFPLANPREV BPP  '+

            'WHERE  '+
            '  ( HFB.IDPESSJUR   = '+ CdsPessoasPreparo.FieldByName('IDPESSJUR').AsString      + ' ) AND '+
            '  ( HFB.IDPLANOPREV = '+ CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsString    + ' ) AND '+
            '  ( HFB.IDTITULAR   = '+ CdsPessoasPreparo.FieldByName('IDTITULAR').AsString      + ' ) AND '+
            '  ( HFB.IDPESSOA    = '+ CdsPessoasPreparo.FieldByName('IDBENEFICIARIO').AsString + ' ) AND '+
            '  ( HFB.IDBENEFICIO = '+ CdsPessoasPreparo.FieldByName('IDBENEFICIO').AsString + ' ) AND '+

            '  ( HFB.MESREFERENCIA = TO_CHAR( TO_DATE( '+ QuotedStr( DateToStr( dDataRef ) ) +', ''DD/MM/YYYY''), ''YYYY/MM'')' +' ) AND '+

            '  ( HFB.IDPLANOPREV = BPP.IDPLANOPREV  )  AND '+
            '  ( HFB.IDBENEFICIO = BPP.IDBENEFICIO  )      '+
            'ORDER BY '+
            '  HFB.MESREFERENCIA, HFB.SEQBENEFICIO DESC  ';

    CdsAux.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

    If ( Not CdsAux.IsEmpty ) Then Begin

      Result := CdsAux.FieldByName('VALORINTEGRAL').AsFloat;

      Exit;
      
    End;

  Except

    Result := -5005; { Erro }

  End;

End;


{------------------------------------------------------------------------------}
{ Retorna o tipo de participoante que será processado                          }
Function  RetornaTipoParticipante( CdsPessoasPreparo : TCMClientDataSet ): TipoParticipante;
Begin
  Result := tpNone;

  If ( CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsInteger = 2 )
  Then Result := tpReplan
  Else Result := tpREB;

  If ( CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsInteger = 2 ) And
     ( CdsPessoasPreparo.FieldByName('DTINICIOINSC').AsDateTime < StrToDate('23/01/1978') )Then Begin

    Result := tpReplanPre78;

  End;

  If ( CdsPessoasPreparo.FieldByName('IDPLANOPREV').AsInteger = 66 ) And
     ( CdsPessoasPreparo.FieldByName('DTINICIOINSC').AsDateTime < StrToDate('23/01/1978') )Then Begin

    Result := tpREBPre78;

  End;


End;

{------------------------------------------------------------------------------}
{ Retorna o tipo de participoante em string                                    }
Function  RetornaTipoParticipanteString( ptpTipoParticipante : TipoParticipante ): String;
Begin
  Result := 'ERRO';
  If ptpTipoParticipante      = tpReplan      Then Result := 'REPLAN'
  Else If ptpTipoParticipante = tpREB         Then Result := 'REB'
  Else If ptpTipoParticipante = tpReplanPre78 Then Result := 'REPLANPRÉ78'
  Else If ptpTipoParticipante = tpREBPre78    Then Result := 'REBPRÉ78';
End;


{------------------------------------------------------------------------------}
{ Corrige o valor do beneficio saldado                                         }
Function  CorrigeValorBS( psAnoMesRefProcesso : String;
                          bMostraEvolucaoBS : Boolean;
                          CdsPessoasPreparo, CdsAux : TCMClientDataSet;
                          dDataRef: TDateTime;
                          dValorBS : Double  ): Double;
Var
  sSQL, sMoedaIndice, sAnoMesRef : String;
  dValorBSCorrigidoAntes, dValorBSCorrigido : Double;

Begin

  Result := dValorBS;

  sMoedaIndice := '7';

  Try

    sAnoMesRef := FormatDateTime( 'YYYY/MM', dDataRef );
    sSQL := 'SELECT   '+
            '  COT.COTDATA, SUBSTR( COT.COTMESREF, 3,4 ) ||''/''||SUBSTR( COT.COTMESREF, 1,2 ) AS COTMESREF, '+
            '  COT.COTVALOR    '+

            'FROM     '+
            '  COTACAOMOEDA COT '+

            'WHERE    '+
            '  ( COT.MOECODIGO = '+ sMoedaIndice +' ) AND '+
            '  ( TO_CHAR(COT.COTDATA, ''YYYY/MM'') >= '+ QuotedStr( sAnoMesRef ) +' ) '+
            'ORDER BY '+
            '  COT.COTDATA   ';

    CdsAux.Data := CtrlObjectAcessoBD.GetDataPacket( sSQL );

    If ( Not CdsAux.IsEmpty ) Then Begin

      { Aplicar correção no BS }
      dValorBSCorrigido := dValorBS;
      sAnoMesRef        := FormatDateTime( 'YYYY/MM', dDataRef );


      If ( bMostraEvolucaoBS = True ) Then Begin

        WriteLn( ArquivoExterno, '  ' );
        WriteLn( ArquivoExterno, PreparaStr( 'MÊS       ', 10 )     +'  '+
                                 PreparaStr( 'VALOR ANTERIOR', 15 ) +'  '+
                                 PreparaStr( 'COTAÇÃO', 07 )        +'  '+
                                 PreparaStr( 'VALOR CORRIGIDO', 15 ) );
      End;

      While ( Not CdsAux.Eof ) And ( sAnoMesRef <= psAnoMesRefProcesso ) Do Begin

        If ( sAnoMesRef <= CdsAux.FieldByName('COTMESREF').AsString ) Then Begin

          dValorBSCorrigidoAntes := dValorBSCorrigido;

          dValorBSCorrigido := ( dValorBSCorrigido + ( ( dValorBSCorrigido * CdsAux.FieldByName('COTVALOR').AsFloat ) / 100 ) );

          sAnoMesRef := CdsAux.FieldByName('COTMESREF').AsString;
        End;

        If ( bMostraEvolucaoBS = True ) Then Begin

          WriteLn( ArquivoExterno, PreparaStr( sAnoMesRef , 10 ) +'  '+
                                   AlinhaDireita( FloatToStrF( dValorBSCorrigidoAntes, ffNumber, 15,2 ), 14) +' * '+
                                   AlinhaDireita( FloatToStrF( CdsAux.FieldByName('COTVALOR').AsFloat, ffNumber, 5,2 ), 7) +' = '+
                                   AlinhaDireita( FloatToStrF( dValorBSCorrigido, ffNumber, 15,2 ), 14) );
        End;

        CdsAux.Next;
      End;

      If ( bMostraEvolucaoBS = True ) Then  WriteLn( ArquivoExterno, '  ' );

      Result := dValorBSCorrigido;

    End;


  Except

    Result := -5005; { Erro }

  End;

End;


Function PreparaStr( Str: String; Tamanho: Integer): String;
Var
  I: Byte;
Begin
  If Length( Str ) <> Tamanho Then Begin

    Str := Trim( Str );

    If Length( Str ) > Tamanho
    Then Str := Copy( Str , 1, Tamanho )
    Else For I := Length( Str ) To ( Tamanho-1 ) Do Str := Str + ' ';
  End;

  Result := Str;

End;

Function AlinhaDireita( psCampo : String; piCasas: Integer ) : String;
Var
  I : Integer;
Begin

  If Length( Trim( psCampo ) ) > piCasas Then Result := psCampo;

  I := piCasas - Length( Trim( psCampo ) );

  Result := StringOfChar(' ',I) + psCampo;

End;

Function MontaStringMatriculas( psNomeArquivo : String ) : string;
Var
  sMatriculas, sLinha : String;
  ArquivoMatriculas : TextFile;
Begin

  sMatriculas := '';

  Try
    AssignFile( ArquivoMatriculas,  PChar( psNomeArquivo ) );
    Reset( ArquivoMatriculas );

    While not Eof( ArquivoMatriculas ) Do Begin

      Readln( ArquivoMatriculas, sLinha );

      If Trim(sMatriculas) = ''
      Then sMatriculas := ''''+Trim(sLinha)+''''
      Else sMatriculas := sMatriculas +','+ ''''+Trim(sLinha)+'''';

    End;

    Result := sMatriculas;

  Finally

    CloseFile( ArquivoMatriculas );

  End;

End;

Function AnoMesAnterior( psAnoMesRef : String ) : String;
Var
  iAno, iMes : Integer;
  sAnoMes : String;
Begin

  Result := '';

  iAno := StrToInt( Copy( psAnoMesRef, 1, 4 ) );
  iMes := StrToInt( Copy( psAnoMesRef, 6, 2 ) );

  If iMes = 1 Then Begin

     sAnoMes := IntToStr( iAno-1 ) + '/';
     sAnoMes := sAnoMes + '13';

  End Else Begin

    sAnoMes := IntToStr( iAno ) + '/';
    iMes := iMes - 1;

    If iMes <= 9
    Then sAnoMes := sAnoMes + '0' + IntToStr( iMes )
    Else sAnoMes := sAnoMes + IntToStr( iMes );

  End;

  Result := sAnoMes;

End;

Function Trunca( pdValor: Double; piDecimais: Integer ): Double;
Begin
   Result := (Trunc( pdValor * Power (10, piDecimais))) / Power(10, piDecimais);
End;


end.
