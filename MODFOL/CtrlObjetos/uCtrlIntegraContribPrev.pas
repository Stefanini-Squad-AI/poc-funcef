// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************   
// *****************************************************************************
{-------------------------------------------------------------------------------
Nº Solicitação...: WO25167
Data da Alteração: 08/09/2025
Responsável......: Paulo Nobre
Descrição........: Inserção da inclusão dos registros da rubrica:
                    . 32877 / 23865 - P13 - CONT REB EMPRESA ACUMULADA.
                   Seleção da rubrica: 32437 / 12035 - CONT FUNCEF/REB (EMPRESA)
                   13º SALARIO para a composição do valor final da rubrica
                   acumulada.
--------------------------------------------------------------------------------
Nº Solicitação...: WO1920
Data da Alteração: 12/8/2024  28/08/2025
Responsável......: Paulo Nobre
Descrição........: Implementar recursos para o Cálculo de contribuição patronal Sobre Provisão de 13º
                   .Implementadas nova rotinas, baseadas em funções copiadas da uCtrlGeraFolPagNormal
                    feitas pelo Everson (SIG 33023), que estão totalmente funcionais rodando em
                    produção. Portanto, para agilizar, foram adaptadas e ajustadas para atender a este
                    contexto também:
                     > _CalcRubP13ContRebEmpresaMes
                     > _ListaTabReb2002
                     > _ListaDeEmpregadosCalcRubP13
                     > _GravarPreviaEmpregado
                   .Conforme diretivas das Gestoras, os calculos abrangerão apenas as folhas com
                    IDMOTIVO: 1 e 14 (Folha Mensal Empregados e Folha de Rescisão de Contrato);
                   .Em alinhamento com o Everson, como quase toda funcionalidade foi refeita, o código
                    foi limpo com a retirada de muitas rotinas comentadas.
-------------------------------------------------------------------------------------------------------
Nº SIG............: 67627
Data da Alteração.: 06/07/2018
Responsável.......: Denis Horongoso
Descrição.........: Desenvolvimento de relatorio de log para prévia.
--------------------------------------------------------------------------------
Nº SIG...........: SIG TIBERO
Data da Alteração: 30/05/2018
Responsável......: Everson Luiz Pereira da Cunha
Descrição........: Melhoria no Planus para adequação ao TIBERO.
                   Melhoria na função TCtrlIntegraContribPrev.VerificaTabReb2002
                   Inclusão de alias "BRISCO_PARTIC.NUMLINHA"
--------------------------------------------------------------------------------
Nº SOL............: 189675.17571
Nº PPM............: 989707
Data da Alteração.: 27/07/2015
Alteração Form....: alteração da funcionalidade
Responsável.......: William Santana
Descrição.........: Desenvolvimento do cálculo e gravação das contribuições
                    FUNCEF patronal.
--------------------------------------------------------------------------------
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração: comentar campo FLGBENEFICIO
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba
            "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
Rotina......: Criação da funcionalidade
Nº SOL......: 152930
Nº KINTANA..: 1146562
Data........: 11/06/2012
Responsável.: Edilaine Ferraresi
Descrição...: Implementação da Integração Contribuição Previdenciaria
--------------------------------------------------------------------------------}

Unit uCtrlIntegraContribPrev;

Interface

Uses Classes, SysUtils, Windows, Messages, JclStrings, uCMMath, uCmDbObject, uCmControlObject,
  JCLSysUtils, contnrs, Controls, IvDictio, uCMClientDataSet, DBaseDados, Wwquery, Dialogs,
  Forms, FProgresso, fAguarde, uSistema, uDatabase, uMensErro, uCtrlPadroes, uCtrlCustomRH,
  uCtrlProvDesc, uCtrlGlobalRH, uCtrlUsoGeralRH, uCtrlFuncoesRH;

Type
  TRecData = Record
    dia: word;
    mes: word;
    ano: word;
    sMes: String;
  End;

  TCtrlIntegraContribPrev = Class(TCtrlCustomRH)

  Protected
    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    FCds: TCMClientDataSet;

    // Paulo Nobre - WO1920 - Inicio
    _qryAux: TwwQuery;
    _cdsTabReb2002: TCMClientDataSet;
    _cdsListaDeEmpregadosCalcRubP13: TCMClientDataSet;
    // Paulo Nobre - WO1920 - Fim

    _qryAux2: TwwQuery;  // Paulo Nobre - WO25167

    ArqLog: TextFile;
    _sql: TStringList;

    // Ctrls
    CtrlGlobalRH: TCtrlGlobalRH;

  Public
    Constructor Create; Override;
    Destructor Destroy; Override;

    Property Cds: TCMClientDataSet Read FCds Write FCds;
    Function GetPeriodoAtual: TRecData;
    Function GetMotivoPadrao: integer;

    Function ListaMotivos(ListaGrupoMotivo: String = '';
      ListaFlgTipo: String = '';
      ListaIdMotivo: String = ''): OleVariant;

    Function ListaPessoaEstab(IdEmpresa: integer): String;

    Function ListaRubricas(pRubRef: String): OleVariant;    // Paulo Nobre - WO1920

    //Início -  William Santana - SOL 189675.17571 PPM 989707
   // function ListaFuncionario(ListaTipoContr: string;
//                              bRetiraLicSemVencto : Boolean = false;
//                              pPeriodo : String = '';
//                              ListaSitFunc : string = '') : OleVariant;
    //Término -  William Santana - SOL 189675.17571 PPM 989707

    Function ListaPessoasIntegracao(sMesAno, sListaMotivo, sListaRubrica, sListaPessoas: String): String;
    //Início -  William Santana - SOL 189675.17571 PPM 989707
//    function GeraLogIntegracao(sNomeLog : string;
//                               sMesAno : string;
//                               DtPagto : TDate;
//                               sIdMotivo : string;
//                               sMotivoFolha : TStringList;
//                               sListaPessoas : string;
//                               sListaRubrica : string) : boolean;

    Function GeraLogIntegracao(sNomeLog, sMesAno: String
      ; iProcesso: Integer = 1                              //Denis Horongoso - SIG 67627
      ): boolean;

    Function VerificaTabReb2002(sPeriodo: String): OleVariant;
    Function ListaFuncionario(iProcesso: integer; sPeriodo: String): OleVariant;
    //Término -  William Santana - SOL 189675.17571 PPM 989707

    // Paulo Nobre - WO1920 - Início
    Procedure _AtualizaFrmProgresso(Var iContador: integer);
    Procedure _CalcRubP13ContRebEmpresaMes(pAnoMesRef, pDataPagamento: String; pIdMotivo, pProcesso : Integer; Var pvTipoErro: Integer);
    Function _ListaTabReb2002(pAnoMesRef: String): OleVariant;
    Function _ListaDeEmpregadosCalcRubP13(pAnoMesRef, pTabela: String; pIdMotivo: Integer): OleVariant;
    Function _GravarPreviaEmpregado(pAnoMesRef, pIdPessoaEmpregado, pDataPagamento, pNumDocumento, pTabela: String;
                                    pVlrContribuicaoPatronal: Double;
                                    pIdMotivo : Integer): boolean;      // Paulo Nobre - WO25167
    // Paulo Nobre - WO1920 - Fim

  End;

Implementation

{ TCtrlIntegraContribPrev }

Constructor TCtrlIntegraContribPrev.Create;
Begin
  Inherited;
  // criando cds
  If FCds = Nil Then
    FCds := TCMClientDataSet.Create(Nil);

  // Paulo Nobre - WO1920 - Início
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmAguarde, frmAguarde);

  _cdsTabReb2002 := TCMClientDataSet.Create(Nil);
  _cdsListaDeEmpregadosCalcRubP13 := TCMClientDataSet.Create(Nil);
  _qryAux := TwwQuery.Create(Nil);
  _qryAux.DatabaseName := 'BaseDados';
  // Paulo Nobre - WO1920 - Fim

  // Paulo Nobre - WO25167 - Início
  _qryAux2 := TwwQuery.Create(Nil);
  _qryAux2.DatabaseName := 'BaseDados';
  // Paulo Nobre - WO25167 - Fim

  _sql := TStringList.create;

  // criando ctrl's
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
End;

Destructor TCtrlIntegraContribPrev.Destroy;
Begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(_sql);
  FCds.Free;
  // Paulo Nobre - WO1920 - Início
  FreeAndNil(frmProgresso);
  FreeAndNil(frmAguarde);
  FreeAndNil(_qryAux);
  FreeAndNil(_cdsTabReb2002);
  FreeAndNil(_cdsListaDeEmpregadosCalcRubP13);
  // Paulo Nobre - WO1920 - Fim

  FreeAndNil(_qryAux2);    // Paulo Nobre - WO25167

  Inherited;
End;

Procedure TCtrlIntegraContribPrev.DoChangeDataBase;
Begin
  Inherited;
End;

Function TCtrlIntegraContribPrev.ListaMotivos(ListaGrupoMotivo, ListaFlgTipo, ListaIdMotivo: String): OleVariant;
Var
  sParam, sSQL: String;
Begin
  sParam := '';
  If (ListaGrupoMotivo <> '') Then
  Begin
    sParam := 'WHERE' + CR_LF + '  (GRUPOMOTIVO ';
    If (Pos(',', ListaGrupoMotivo) > 0) Then
      sParam := sParam + 'IN (' + QuotedListaString(ListaGrupoMotivo, ',') + '))'
    Else
      sParam := sParam + '= ' + QuotedListaString(ListaGrupoMotivo, ',') + ')';
  End;

  If (ListaFlgTipo <> '') Then
  Begin
    If (sParam = '') Then
      sParam := 'WHERE' + CR_LF + '  (FLGTIPO '
    Else
      sParam := sParam + ' AND (FLGTIPO ';
    If (Pos(',', ListaFlgTipo) > 0) Then
      sParam := sParam + 'IN (' + QuotedListaString(ListaFlgTipo, ',') + '))'
    Else
      sParam := sParam + '= ' + QuotedListaString(ListaFlgTipo, ',') + ')';
  End;

  If (ListaIdMotivo <> '') Then
  Begin
    If (sParam = '') Then
      sParam := 'WHERE' + CR_LF + '  (IDMOTIVO '
    Else
      sParam := sParam + ' AND (IDMOTIVO ';
    If (Pos(',', ListaIdMotivo) > 0) Then
      sParam := sParam + 'IN (' + ListaIdMotivo + '))'
    Else
      sParam := sParam + '= ' + ListaIdMotivo + ')';
  End;

  sSQL := 'SELECT IDMOTIVO, DESCRICAO' + CR_LF +
    '  FROM MOTIVO' + CR_LF +
    sParam + CR_LF +
    ' ORDER BY DESCRICAO';

  Result := GetDataPacket(sSQL);
End;

Function TCtrlIntegraContribPrev.ListaRubricas(pRubRef: String): OleVariant; // Paulo Nobre - WO1920
Var
  sSQL: String;
Begin
  sSQL := 'SELECT DECODE(TIPO.TIPO, ''S'', ''SALARIO'', ''P'', ''PERCENTUAL'', ''C'', ''CONTRIBUIÇÃO'', TIPO.TIPO) TIPO,' + CR_LF +
    '       IDRUB.IDRUBRICA COD_RUB,' + CR_LF +
    '       DESCRICAO.DESCRICAO RUBRICA,' + CR_LF +
    '       SUBTIPO.SUBTIPO,' + CR_LF +
    '       MOTIVO.MOTIVO COD_MOTIVO,' + CR_LF +
    '       M.DESCRICAO MOTIVO,' + CR_LF +
    '       DECODE(CONT.CONT, ''1'', ''PARTICIPANTE'', 21, ''PATROCINADORA'', NULL) PAGADOR, ' + CR_LF +
    '       (TIPO||CONT.CONT||''_''||SUBTIPO) SUB_TIPO ' + CR_LF +
    '  FROM' + CR_LF +

  // Paulo Nobre - WO1920 - Inicio
  '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR IDRUBRICAREF' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB'' ' + CR_LF +
    '   AND V.CODCAMPO = ''IDRUBRICAREF'' ' + CR_LF +
    '   AND V.VALOR = ' + Quotedstr(pRubRef) + ') RUBREF' + CR_LF +
    ' JOIN' + CR_LF +
    '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR CONT' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '   AND V.CODCAMPO = ''CONT'') CONT ON CONT.NUMLINHA = RUBREF.NUMLINHA' + CR_LF +
    ' JOIN' + CR_LF +
    '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR DESCRICAO' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '   AND V.CODCAMPO = ''DESCRICAO'') DESCRICAO ON DESCRICAO.NUMLINHA = RUBREF.NUMLINHA' + CR_LF +
    ' JOIN' + CR_LF +
    '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR IDRUBRICA' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '   AND V.CODCAMPO = ''IDRUBRICA'') IDRUB ON IDRUB.NUMLINHA = RUBREF.NUMLINHA' + CR_LF +
    ' JOIN' + CR_LF +
    '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR MOTIVO' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '   AND V.CODCAMPO = ''MOTIVO'') MOTIVO ON MOTIVO.NUMLINHA = RUBREF.NUMLINHA' + CR_LF +
    ' JOIN' + CR_LF +
    '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR TIPO' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '   AND V.CODCAMPO = ''TIPO'') TIPO ON TIPO.NUMLINHA = RUBREF.NUMLINHA' + CR_LF +
    ' JOIN' + CR_LF +
    '(SELECT V.NUMLINHA,' + CR_LF +
    '       V.VALOR SUBTIPO' + CR_LF +
    '  FROM CM.VALTABGENER V' + CR_LF +
    ' WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '   AND V.CODCAMPO = ''SUBTIPO'') SUBTIPO ON SUBTIPO.NUMLINHA = RUBREF.NUMLINHA' + CR_LF +
    ' LEFT JOIN MOTIVO M ON M.IDMOTIVO = MOTIVO.MOTIVO' + CR_LF +
    ' ORDER BY TIPO DESC, PAGADOR, COD_MOTIVO, RUBRICA';
  // Paulo Nobre - WO1920 - Fim

//Término -  William Santana - SOL 189675.17571 PPM 989707
  Result := GetDataPacket(sSQL);
End;

Function TCtrlIntegraContribPrev.ListaPessoaEstab(IdEmpresa: integer): String;
Begin
  FCds.data := GetDataPacket('SELECT PJ.IDPESSOA, PJ.NOME ' + CR_LF +
    '  FROM PESSOA PJ, FILIALPESSOA FP ' + CR_LF +
    ' WHERE (PJ.IDGRUPO = ' + IntToStr(IdEmpresa) + ') ' + CR_LF +
    '   AND (FP.IDFILIALPESSOA = PJ.IDPESSOA) ');
  If FCds.IsEmpty Then
    Result := '-1'
  Else
    Result := FCds.Fields[0].AsString;
End;

Procedure TCtrlIntegraContribPrev.OnCreateAppServer;
Begin
  Inherited;
  FCds := TCMClientDataSet.Create(Nil);
End;

Function TCtrlIntegraContribPrev.GetPeriodoAtual: TRecData;
Begin
  result.Ano := FU.ExtraiAno(CtrlGlobalRH.GetNormalIni);
  result.mes := FU.ExtraiMes(CtrlGlobalRH.GetNormalIni);
  result.sMes := MesLongo[result.Mes];
End;

Function TCtrlIntegraContribPrev.GeraLogIntegracao(sNomeLog, sMesAno: String
  ; iProcesso: Integer = 1                                  //Denis Horongoso - SIG 67627
  ): boolean;
//Término -  William Santana - SOL 189675.17571 PPM 989707

  Procedure AdicionaQuebraDataPagto(Var lstTexto: TStringList; strPagto, strMotivo: String; bLinha: boolean);
  Var i: byte;
  Begin
    If bLinha Then
      lstTexto.Add(Replicate('=', 151));                    //edilaine SIG67627
    lstTexto.Add('');
    lstTexto.Add('Data de Pagamento: ' + strPagto);
    lstTexto.Add('Tipo (Motivo) de Folha: ' + strMotivo);
    lstTexto.Add('');

    //edilaine SIG67627 : inicio
    //lstTexto.Add('Matrícula      Nome Empregado                                    Código Rubrica      Descrição Rubrica                                           Valor');
    lstTexto.Add('Matrícula   Nome Empregado                                    Código Rubrica   Descrição Rubrica                                                 Valor');
    //edilaine SIG67627 : fim
  End;

  Procedure AdicionaQuebraMotivo(Var lstTexto: TStringList; strMotivo: String);
  Begin
    lstTexto.Add(Replicate('-', 51));                       //edilaine SIG67627
    lstTexto.Add('Tipo (Motivo) de Folha: ' + strMotivo);
    lstTexto.Add('');

    //edilaine SIG67627 : inicio
    //lstTexto.Add('Matrícula      Nome Empregado                                    Código Rubrica      Descrição Rubrica                                           Valor');
    lstTexto.Add('Matrícula   Nome Empregado                                    Código Rubrica   Descrição Rubrica                                                 Valor');
    //edilaine SIG67627 : fim
  End;

Var
  sLinha: String;
  lstTexto: TStringList;
  sMotivo: String;
  sDtPagto: String;
  sValor: String;                                           //edilaine 67627
Begin
  Try
    _sql.clear;
    //Denis Horongoso - SIG 67627 - Inicio
    If (iProcesso = 1) Then
    Begin
      _sql.Add('SELECT DISTINCT HR.MES, HR.IDMOTIVO, HR.IDPESSOA, ');
      _sql.Add('       F.MATRICULA, P.NOME, HR.IDRUBRICA, HP.DESCRPROVDESC AS DESCRICAO, ');
      _sql.Add('       HR.VALORPROVENTO AS VALOR, ');
      _sql.Add('       HC.DATAPREVISAORECE AS DATAPAGAMENTO, ');
      _sql.Add('       M.DESCRICAO AS MOTIVOFOLHA ');
      _sql.Add('  FROM HISTRUBSAL HR,     ');
      _sql.Add('       (SELECT H.IDPESSOA, H.DATAPREVISAORECE, H.IDRUBRICA ');

      _sql.Add('            FROM HSTCONTRIBPREV H ');
      _sql.Add('           WHERE TRUNC(h.dtintegracao) = TO_DATE(' + Quotedstr(FormatDateTime('dd/mm/yyyy', date)) + ', ''DD/MM/YYYY'')');
      //Início -  William Santana - SOL 189675.17571 PPM 989707
       // _sql.Add('             AND H.MESCOBRANCA = '+Quotedstr(sMesAno) );
      _sql.Add('             AND H.MESREFERENCIA = ' + Quotedstr(sMesAno));
      _sql.Add('             AND H.MESCOBRANCA = TO_CHAR(SYSDATE,''YYYY/MM'')');
      _sql.Add('             AND NVL(H.USERINTEGRACAO, -1) = ' + QuotedStr(IntToStr(Sistema.IdUsuario)));
      // _sql.Add('             AND NVL(H.USERINTEGRACAO, -1) = '+IntToStr(Sistema.IdUsuario) );
     //Término -  William Santana - SOL 189675.17571 PPM 989707

      _sql.Add('         ) HC, ');

      _sql.Add('       MOTIVO M,   ');
      _sql.Add('       RUBRICAXPESS HP,   ');
      _sql.Add('       FUNCIONARIO F,     ');
      _sql.Add('       PESSOA P           ');
      _sql.Add(' WHERE F.IDPESSOA   = P.IDPESSOA   ');
      // _sql.Add('   AND HC.IDRUBRICA = HP.IDRUBRICA ');    //Início -  William Santana - SOL 189675.17571 PPM 989707
      _sql.Add('   AND HP.IDRUBRICA = HR.IDRUBRICA ');
      _sql.Add('   AND HC.IDPESSOA  = P.IDPESSOA   ');
      _sql.Add('   AND P.IDPESSOA   = HR.IDPESSOA  ');
      _sql.Add('   AND HR.IDPESSOA IN (SELECT DISTINCT HC.IDPESSOA FROM HSTCONTRIBPREV HC ');
      _sql.Add('                        WHERE TRUNC(hc.dtintegracao) = TO_DATE(' + Quotedstr(FormatDateTime('dd/mm/yyyy', date)) + ', ''DD/MM/YYYY'')');
      //Início -  William Santana - SOL 189675.17571 PPM 989707
      //_sql.Add('                          AND NVL(HC.USERINTEGRACAO, -1) = 'IntToStr(Sistema.IdUsuario)));
      //_sql.Add('                          AND HC.MESCOBRANCA = '+Quotedstr(sMesAno) );
      _sql.Add('                          AND NVL(HC.USERINTEGRACAO, -1) = ' + QuotedStr(IntToStr(Sistema.IdUsuario)));
      _sql.Add('                          AND HC.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
      _sql.Add('                          AND HC.MESREFERENCIA = ' + Quotedstr(sMesAno));
      _sql.Add('                          AND HC.MESREFERENCIA = ' + Quotedstr(sMesAno));
      //Término -  William Santana - SOL 189675.17571 PPM 989707
      _sql.Add('                        ) ');
      _sql.Add('   AND NVL(HR.FLGINTEGRADO, ''N'') = ''S'' ');
      _sql.Add('   AND M.IDMOTIVO = HR.IDMOTIVO ');
      //       _sql.Add('   AND HR.IDMOTIVO IN ('+sIdMotivo+')' );
      _sql.Add('   AND HR.IDMODULO = 21 ');
      _sql.Add('   AND HR.MESCOBRANCA = ' + Quotedstr(sMesAno));
      //Início -  William Santana - SOL 189675.17571 PPM 989707
      _sql.Add('   AND HR.MES = ' + Quotedstr(sMesAno));
      //Término -  William Santana - SOL 189675.17571 PPM 989707
      _sql.Add(' ORDER BY HC.DATAPREVISAORECE, HR.IDMOTIVO, F.MATRICULA ');
    End
    Else
    Begin
      _sql.Add('SELECT DISTINCT HR.MES, HR.IDMOTIVO, HR.IDPESSOA, ');
      _sql.Add('       F.MATRICULA, P.NOME, HR.IDRUBRICA, HP.DESCRPROVDESC AS DESCRICAO, ');
      _sql.Add('       HR.VALORPROVENTO AS VALOR, ');
      _sql.Add('       HR.DATAPAGAMENTO, ');
      _sql.Add('       M.DESCRICAO AS MOTIVOFOLHA ');
      _sql.Add('  FROM PREVIAFOLPAG HR,     ');
      _sql.Add('       MOTIVO M,   ');
      _sql.Add('       RUBRICAXPESS HP,   ');
      _sql.Add('       FUNCIONARIO F,     ');
      _sql.Add('       PESSOA P           ');
      _sql.Add(' WHERE F.IDPESSOA   = P.IDPESSOA   ');
      _sql.Add('   AND HP.IDRUBRICA = HR.IDRUBRICA ');
      _sql.Add('   AND P.IDPESSOA   = HR.IDPESSOA  ');
      _sql.Add('   AND HR.IDPESSOA IN (SELECT DISTINCT HC.IDPESSOA FROM PREVIACONTRIBPATRO HC ');
      _sql.Add('                        WHERE HC.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
      _sql.Add('                          AND HC.MES = ' + Quotedstr(sMesAno));
      _sql.Add('                          AND TRUNC(HC.TRGDTINCLUSAO) = TO_DATE(' + Quotedstr(FormatDateTime('dd/mm/yyyy', date)) + ', ''DD/MM/YYYY'')');
      _sql.Add('                        ) ');
      _sql.Add('   AND M.IDMOTIVO = HR.IDMOTIVO ');
      _sql.Add('   AND HR.MESCOBRANCA = ' + Quotedstr(sMesAno));
      _sql.Add('   AND HR.MES = ' + Quotedstr(sMesAno));
      _sql.Add(' ORDER BY HR.DATAPAGAMENTO, HR.IDMOTIVO, F.MATRICULA ');
    End;
    //Denis Horongoso - SIG 67627 - Fim

    {$IFDEF DEBUG}
    _sql.SaveToFile('C:\Planus\Temp\CtrlIntegraContribPrev.GeraLogIntegracao_' + IntToStr(iProcesso) + '.sql');
    {$ENDIF}

    FCds.data := GetDataPacket(_sql.GetText);

    If Not FCds.IsEmpty Then
    Begin
      Try
        // Prepara gravação do arquivo de log
        lstTexto := TStringList.create;

        sMotivo := FCds.FieldbyName('MOTIVOFOLHA').AsString;
        sDtPagto := FCds.FieldbyName('DATAPAGAMENTO').AsString;

        lstTexto.Add('Nome Arquivo: ' + sNomeLog);
        lstTexto.Add('Mês e ano de Referência: ' + sMesAno);
        AdicionaQuebraDataPagto(lstTexto, sDtPagto, sMotivo, false);

        While Not FCds.Eof Do
        Begin
          If (sDtPagto <> FCds.FieldbyName('DATAPAGAMENTO').AsString) Then
          Begin
            sDtPagto := FCds.FieldbyName('DATAPAGAMENTO').AsString;
            sMotivo := FCds.FieldbyName('MOTIVOFOLHA').AsString;
            AdicionaQuebraDataPagto(lstTexto, sDtPagto, sMotivo, true);
          End
          Else If (sMotivo <> FCds.FieldbyName('MOTIVOFOLHA').AsString) Then
          Begin
            sMotivo := FCds.FieldbyName('MOTIVOFOLHA').AsString;
            AdicionaQuebraMotivo(lstTexto, sMotivo);
          End;

          //edilaine SIG67627 : inicio
          sValor := FormatFloat('#,##0.00;(#,##0.00)', FCds.FieldbyName('VALOR').AsCurrency);
          If Pos(')', sValor) = 0 Then
            sValor := sValor + ' ';

          sLinha := StrPadRight(FCds.FieldbyName('MATRICULA').AsString, 12, ' ') +
            StrPadRight(Copy(FCds.FieldbyName('NOME').AsString, 1, 50), 50, ' ') +
            StrPadRight(FCds.FieldbyName('IDRUBRICA').AsString, 17, ' ') +
            StrPadRight(Trim(FCds.FieldbyName('DESCRICAO').AsString), 60, ' ') +
            StrPadLeft(sValor, 12, ' ');
          //edilaine SIG67627 : fim

          lstTexto.Add(sLinha);

          FCds.next;
        End;

        lstTexto.SaveToFile(sNomeLog);
        Result := true;

      Finally
        lstTexto.free;
      End;
    End
    Else
    Begin
      Result := false;
      MessageInfo := 'Não há dados para integração.';
    End;
  Except
    On E: Exception Do
    Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;

Function TCtrlIntegraContribPrev.GetMotivoPadrao: integer;
Begin
  Fcds.data := CtrlGlobalRH.GetParamRH('IDMOTIVO');
  result := FCds.FieldByName('IDMOTIVO').asInteger;
End;

Function TCtrlIntegraContribPrev.ListaPessoasIntegracao(sMesAno, sListaMotivo,
  sListaRubrica, sListaPessoas: String): String;
Var
  sLista: String;
Begin
  _sql.clear;
  _sql.Add('SELECT DISTINCT HR.IDPESSOA');
  _sql.Add('  FROM HISTRUBSAL HR');
  _sql.Add(' WHERE HR.MES = ' + Quotedstr(sMesAno));
  _sql.Add('   AND HR.IDMODULO = ' + IntToStr(Sistema.IdModulo));
  _sql.Add('   AND HR.IDMOTIVO IN (' + sListaMotivo + ')');
  _sql.Add('   AND HR.IDRUBRICA IN (' + sListaRubrica + ') ');
  _sql.Add('   AND HR.IDPESSOA IN (' + sListaPessoas + ') ');
  _sql.Add('   AND NVL(HR.FLGINTEGRADO, ''N'') = ''N'' ');

  sLista := '';
  FCds.data := GetDataPacket(_sql.GetText);
  While Not FCds.eof Do
  Begin
    sLista := sLista + FCds.Fields[0].AsString;
    FCds.next;
    If Not FCds.eof Then
      sLista := sLista + ', ';
  End;

  Result := sLista;

End;

//Início -  William Santana - SOL 189675.17571 PPM 989707

Function TCtrlIntegraContribPrev.VerificaTabReb2002(sPeriodo: String): OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT BRISCO_PARTIC.NUMLINHA, BRISCO_PARTIC.BRISCO_PARTIC,  BRISCO_PATROC.BRISCO_PATROC,' + CR_LF +
    '       DATA.DATA, DES_ADM_ASSIST.DES_ADM_ASSIST,DES_ADM_ATIVO.DES_ADM_ATIVO,' + CR_LF +
    '       DES_ADM_PATR.DES_ADM_PATR, PERC_PATROC.PERC_PATROC, UR.UR' + CR_LF +
    '  FROM (SELECT V1.NUMLINHA, V1.VALOR AS BRISCO_PARTIC' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''BRISCO_PARTIC'') BRISCO_PARTIC' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS BRISCO_PATROC' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''BRISCO_PATROC'') BRISCO_PATROC' + CR_LF +
    '    ON BRISCO_PATROC.NUMLINHA = BRISCO_PARTIC.NUMLINHA' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DATA' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''DATA'') DATA' + CR_LF +
    '    ON BRISCO_PARTIC.NUMLINHA = DATA.NUMLINHA' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_ASSIST' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_ASSIST'') DES_ADM_ASSIST' + CR_LF +
    '    ON BRISCO_PARTIC.NUMLINHA = DES_ADM_ASSIST.NUMLINHA' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_ATIVO' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_ATIVO'') DES_ADM_ATIVO' + CR_LF +
    '    ON BRISCO_PARTIC.NUMLINHA = DES_ADM_ATIVO.NUMLINHA' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_PATR' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_PATR'') DES_ADM_PATR' + CR_LF +
    '    ON BRISCO_PARTIC.NUMLINHA = DES_ADM_PATR.NUMLINHA' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS PERC_PATROC' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''PERC_PATROC'') PERC_PATROC' + CR_LF +
    '    ON BRISCO_PARTIC.NUMLINHA = PERC_PATROC.NUMLINHA' + CR_LF +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS UR' + CR_LF +
    '          FROM CM.VALTABGENER V1' + CR_LF +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''' + CR_LF +
    '           AND TRIM(V1.CODCAMPO) = ''UR'') UR' + CR_LF +
    '    ON BRISCO_PARTIC.NUMLINHA = UR.NUMLINHA' + CR_LF +
    '    WHERE TO_DATE(DATA.DATA) = (SELECT MAX(TO_DATE(V1.VALOR)) AS DATA' + CR_LF +
    '    FROM CM.VALTABGENER V1' + CR_LF +
    '    WHERE V1.CODTABELA = ''TAB_REB_2002'' ' + CR_LF +
    '    AND TRIM(V1.CODCAMPO) = ''DATA'' ' + CR_LF +
    '    AND TO_DATE(V1.VALOR) <= TO_DATE(' + QuotedStr(sPeriodo) + ',''MM/YYYY''))';

  Result := GetDataPacket(sSQL);

End;

Function TCtrlIntegraContribPrev.ListaFuncionario(iProcesso: integer; sPeriodo: String): OleVariant;
Var sSQL, sTabela : string;
Begin
  //Processo = 0 -> Prévia | = 1 -> Final
  If iProcesso = 0 Then
    sTabela := 'PREVIAFOLPAG'
  Else
    sTabela := 'HISTRUBSAL';

  sSQL := 'SELECT DISTINCT P.IDPESSOA' + CR_LF +
    '  FROM ' + sTabela + ' P' + CR_LF +
    ' WHERE P.IDMOTIVO IN (1, 14, 15)' + CR_LF +
    '   AND P.MES = ' + QuotedStr(sPeriodo) + CR_LF +
    '   AND P.MESCOBRANCA  = ' + QuotedStr(sPeriodo) + CR_LF +
    '   AND IDPESSJUR IN (1, 91008) ' + CR_LF +
    '   AND P.IDRUBRICA IN ' + CR_LF +
    '   (SELECT IDRUBRICA' + CR_LF +
    '      FROM (' + CR_LF +
    '    SELECT V.VALOR IDRUBRICA,' + CR_LF +
    '           V.NUMLINHA' + CR_LF +
    '      FROM CM.VALTABGENER V' + CR_LF +
    '     WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '       AND V.CODCAMPO = ''IDRUBRICA'') IDRUB' + CR_LF +
    '      JOIN (' + CR_LF +
    '    SELECT V.VALOR TIPO,' + CR_LF +
    '           V.NUMLINHA' + CR_LF +
    '      FROM CM.VALTABGENER V' + CR_LF +
    '     WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '       AND V.CODCAMPO = ''TIPO''' + CR_LF +
    '       AND V.VALOR IN (''S'', ''P'', ''C'')) TIPO ON TIPO.NUMLINHA = IDRUB.NUMLINHA' + CR_LF +
    '     LEFT JOIN (' + CR_LF +
    '    SELECT V.VALOR CONT,' + CR_LF +
    '           V.NUMLINHA' + CR_LF +
    '      FROM CM.VALTABGENER V' + CR_LF +
    '     WHERE V.CODTABELA = ''RUBRICACONTRIB''' + CR_LF +
    '       AND V.CODCAMPO = ''CONT''' + CR_LF +
    '       AND V.VALOR = 1) CONT ON CONT.NUMLINHA = IDRUB.NUMLINHA )';

  result := GetDataPacket(sSQL);

End;
//Término -  William Santana - SOL 189675.17571 PPM 989707

// Paulo Nobre - WO1920 - Inicio

Procedure TCtrlIntegraContribPrev._AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

// Paulo Nobre - WO1920 - Inicio
//============================================================================================================================
// Cálculo da Rubrica (32878) P13 - CONT REB EMPRESA MES
//============================================================================================================================

Procedure TCtrlIntegraContribPrev._CalcRubP13ContRebEmpresaMes(pAnoMesRef, pDataPagamento: String; pIdMotivo, pProcesso : Integer; Var pvTipoErro: Integer);
Var
  _cdsVlrTotalLimite, _cdsVlrTotalContribEmpregados, _cdsVlrContribEmpregado: TCMClientDataSet;
  VlrTotalLimite, VlrTotalContribEmpregados, vlrContribPatroVoluntaria, vlrContribuicaoPatronal: Double;
  iContador: Integer;
  sTabela : string;
Begin
  //Processo = 0 -> Prévia | = 1 -> Final
  If pProcesso = 0 Then
    sTabela := 'CM.PREVIAFOLPAG'
  Else
    sTabela := 'CM.HISTRUBSAL';

  Try
    _cdsVlrTotalLimite := TCMClientDataSet.Create(Nil);
    _cdsVlrTotalContribEmpregados := TCMClientDataSet.Create(Nil);
    _cdsVlrContribEmpregado := TCMClientDataSet.Create(Nil);

    pvTipoErro := 0;                                        // Nenhum erro - Sucesso
    VlrTotalLimite := 0.00;
    VlrTotalContribEmpregados := 0.00;
    vlrContribPatroVoluntaria := 0.00;
    vlrContribuicaoPatronal := 0.00;

    Screen.Cursor := crSQLWait;
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Selecionando dados para os cálculos...');

    // Tabela Genérica - Tab_Reb_2002
    // Localizando dados parametrizados e defaults para este tipo de cálculo
    _cdsTabReb2002.Data := _ListaTabReb2002(pAnoMesRef);

    If _cdsTabReb2002.IsEmpty Then
    Begin
      pvTipoErro := 1;                                      // DataResult vazio
      Screen.Cursor := crDefault;
      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;
      Exit;
    End;

    // Valor Total Limite da rubrica de provisão do 13º
    _cdsVlrTotalLimite.Data := GetDataPacket(
      'SELECT SUM(TB.VALORPROVENTO) vlr_limite                             '#13#10 +
      'FROM ' + sTabela + ' TB                                             '#13#10 +
      'WHERE TB.MES = ' + QuotedStr(pAnoMesRef)                           + #13#10 +
      '      AND TB.IDMOTIVO IN (1, 14)                                    '#13#10 +
      '      AND TB.IDRUBRICA = 22340    -- P13 - PROVISAO 13 SALARIO MES  '#13#10 +
      '      AND EXISTS (SELECT 1                                          '#13#10 +
      '                  FROM ' + sTabela + ' TB2                          '#13#10 +
      '                  WHERE TB2.IDPESSOA = TB.IDPESSOA                  '#13#10 +
      '                        AND TB2.MES = TB.MES                        '#13#10 +
      '                        AND TB2.IDMOTIVO = TB.IDMOTIVO              '#13#10 +
      '                        AND TB2.IDRUBRICA = 32831 )  -- P13 - CONT REB EMPREGADO MES ');

    VlrTotalLimite := RoundCM(_cdsVlrTotalLimite.fieldbyname('vlr_limite').asFloat * _cdsTabReb2002.fieldbyname('PERC_PATROC').asFloat, 2); // 7% (0,07)

    // Valor Total da Rubrica de Contribuição dos Empregados
    _cdsVlrTotalContribEmpregados.Data := GetDataPacket(
      'SELECT SUM(TB.VALORPROVENTO) cont_limite                            '#13#10 +
      'FROM ' + sTabela + ' TB                                             '#13#10 +
      'WHERE TB.MES = ' + QuotedStr(pAnoMesRef) + #13#10 +
      '      AND TB.IDMOTIVO IN (1, 14)                                    '#13#10 +
      '      AND TB.IDRUBRICA = 32831   -- P13 - CONT REB EMPREGADO MES ');

    VlrTotalContribEmpregados := RoundCM(_cdsVlrTotalContribEmpregados.fieldbyname('cont_limite').asFloat, 2);

    // Selecionando os Empregados
    _cdsListaDeEmpregadosCalcRubP13.Data := _ListaDeEmpregadosCalcRubP13(pAnoMesRef, sTabela, pIdMotivo);

    If (_cdsListaDeEmpregadosCalcRubP13.IsEmpty) Then
    Begin
      pvTipoErro := 2;                                      // Lista de Empregados vazia
      Screen.Cursor := crDefault;
      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;
      Exit;
    End;

    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;
      
    // Paulo Nobre - WO25167 - Inicio
    frmAguarde.Mostra('Excluindo lançamentos deste Mês/Ano referência das Rubricas 32877 e 32878...');

    _qryAux.Close;
    _qryAux.SQL.Clear;
    _qryAux.SQL.Add('DELETE FROM ' + sTabela                   );
    _qryAux.SQL.Add('WHERE MES = :pMES                        ');
    _qryAux.SQL.Add('      AND IDPESSJUR   = :pIDPESSJUR      ');
    _qryAux.SQL.Add('      AND IDRUBRICA  IN ( ''32877'', ''32878'')  ');
//    _qryAux.SQL.Add('      AND IDMOTIVO    = :pIDMOTIVO       ');
//    _qryAux.SQL.Add('      AND REFERENCIA  = :pREFERENCIA     ');
//    _qryAux.SQL.Add('      AND SEQRUBRICA  = :pSEQRUBRICA     ');
    _qryAux.ParamByName('pMES').asString := pAnoMesRef;
    _qryAux.ParamByName('pIDPESSJUR').asInteger := 1;
//    _qryAux.ParamByName('pIDRUBRICA').asString := '32878';  // P13 - CONT REB EMPRESA MES
//    _qryAux.ParamByName('pIDMOTIVO').asInteger := 1;
//    _qryAux.ParamByName('pREFERENCIA').asString := '***';
//    _qryAux.ParamByName('pSEQRUBRICA').asInteger := 1;
    If Not _qryAux.Prepared Then
      _qryAux.Prepare;    
    _qryAux.ExecSQL;

    frmAguarde.pbAguarde.Visible := True;
    frmAguarde.Apaga;

    iContador := 0;
    frmProgresso.MostraFormProgresso('Aguarde ! Gerando os lançamentos das rubricas 32877 e 32878...', True, True, True, 0, _cdsListaDeEmpregadosCalcRubP13.RecordCount);
    Application.ProcessMessages;
    // Paulo Nobre - WO25167 - Fim

    // Processando os Empregados para a análise dos
    // cálculos para a inclusão do registro com a
    // rubrica '32878' - P13 - CONT REB EMPRESA MES
    _cdsListaDeEmpregadosCalcRubP13.First;
    While Not (_cdsListaDeEmpregadosCalcRubP13.EOF) Do
    Begin
      // Encontrado o Valor da Contribuição Patronal
      //
      // Se o valor limite for superior ou igual ao valor das contribuições dos participantes,
      // então, as contribuições são denominadas "paritárias" e neste caso,
      If VlrTotalLimite >= VlrTotalContribEmpregados Then
      Begin
        // O Valor da Contribuição Patronal será igual a Valor da Contribuição do Empregado
        vlrContribuicaoPatronal := RoundCM(_cdsListaDeEmpregadosCalcRubP13.fieldbyname('cont_empregado').asFloat, 2);
      End
        // Caso contrário, se o valor limite for menor que o valor das contribuições dos participantes, então
      Else
      Begin
        // O Valor da Contribuição Patronal será o resultado dos cálculos abaixo
        vlrContribPatroVoluntaria := VlrTotalLimite -
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('soma_custeio').asFloat -
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('soma_risco').asFloat -
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('soma_pb').asFloat -
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('soma_pc').asFloat;

        vlrContribuicaoPatronal := RoundCM(_cdsListaDeEmpregadosCalcRubP13.fieldbyname('pb').asFloat +
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('pc').asFloat +
          (vlrContribPatroVoluntaria * _cdsListaDeEmpregadosCalcRubP13.fieldbyname('percprop').asFloat) +
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('risco').asFloat +
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('custeio').asFloat, 2);
      End;

      If frmProgresso.Cancelou Then
      Begin
        pvTipoErro := 99;                                   // Não dar nenhuma msg
        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.RollBack;
        Screen.Cursor := crDefault;
        frmProgresso.EscondeFormProgresso;
        MsgDlg('Os Lançamentos processados não foram gravados.', 'Aviso', mtWarning, [mbOk], 0);
        Exit;
      End;

      Try
        _GravarPreviaEmpregado(pAnoMesRef,
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('idpessoa').asString,
          pDataPagamento,
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('numdocumento').asString,
          sTabela,
          vlrContribuicaoPatronal,
          _cdsListaDeEmpregadosCalcRubP13.fieldbyname('idmotivo').asInteger );      // Paulo Nobre - WO25167
      Except
        On E: Exception Do
        Begin
          pvTipoErro := 99;                                 // Não dar nenhuma msg
          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;
          Screen.Cursor := crDefault;
          frmProgresso.EscondeFormProgresso;
          MsgDlg(E.Message, 'Aviso', mtWarning, [mbOk], 0);
          Exit;
        End;
      End;
      
      _cdsListaDeEmpregadosCalcRubP13.Next;

      _AtualizaFrmProgresso(iContador);
    End;

    Screen.Cursor := crDefault;
    frmProgresso.EscondeFormProgresso;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
  Finally
    _cdsVlrTotalLimite.Free;
    _cdsVlrTotalContribEmpregados.Free;
    _cdsVlrContribEmpregado.Free;
  End;
End;

// Paulo Nobre - WO1920 - Inicio
Function TCtrlIntegraContribPrev._ListaTabReb2002(pAnoMesRef: String): OleVariant;
Begin
  result := GetDataPacket(
    'SELECT BRISCO_PARTIC.NUMLINHA, BRISCO_PARTIC.BRISCO_PARTIC,                   '#13#10 +
    '       BRISCO_PATROC.BRISCO_PATROC, DATA.DATA, DES_ADM_ASSIST.DES_ADM_ASSIST, '#13#10 +
    '       DES_ADM_ATIVO.DES_ADM_ATIVO, DES_ADM_PATR.DES_ADM_PATR,                '#13#10 +
    '       to_number(PERC_PATROC.PERC_PATROC, ''99999999999D9999999999999'', ''NLS_NUMERIC_CHARACTERS = ''''.,'''''') PERC_PATROC,  '#13#10 +
    '       UR.UR                                                                  '#13#10 +
    '  FROM (SELECT V1.NUMLINHA, V1.VALOR AS BRISCO_PARTIC                         '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''BRISCO_PARTIC'') BRISCO_PARTIC           '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS BRISCO_PATROC                         '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''BRISCO_PATROC'') BRISCO_PATROC           '#13#10 +
    '            ON BRISCO_PATROC.NUMLINHA = BRISCO_PARTIC.NUMLINHA                '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DATA                                  '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''DATA'') DATA                             '#13#10 +
    '            ON BRISCO_PARTIC.NUMLINHA = DATA.NUMLINHA                         '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_ASSIST                        '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_ASSIST'') DES_ADM_ASSIST         '#13#10 +
    '            ON BRISCO_PARTIC.NUMLINHA = DES_ADM_ASSIST.NUMLINHA               '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_ATIVO                         '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_ATIVO'') DES_ADM_ATIVO           '#13#10 +
    '            ON BRISCO_PARTIC.NUMLINHA = DES_ADM_ATIVO.NUMLINHA                '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS DES_ADM_PATR                          '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''DES_ADM_PATR'') DES_ADM_PATR             '#13#10 +
    '            ON BRISCO_PARTIC.NUMLINHA = DES_ADM_PATR.NUMLINHA                 '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS PERC_PATROC                           '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''PERC_PATROC'') PERC_PATROC               '#13#10 +
    '            ON BRISCO_PARTIC.NUMLINHA = PERC_PATROC.NUMLINHA                  '#13#10 +
    '  JOIN (SELECT V1.NUMLINHA, V1.VALOR AS UR                                    '#13#10 +
    '          FROM CM.VALTABGENER V1                                              '#13#10 +
    '         WHERE V1.CODTABELA = ''TAB_REB_2002''                                '#13#10 +
    '           AND TRIM(V1.CODCAMPO) = ''UR'') UR                                 '#13#10 +
    '            ON BRISCO_PARTIC.NUMLINHA = UR.NUMLINHA                           '#13#10 +
    ' WHERE TO_DATE(DATA.DATA) = (SELECT MAX(TO_DATE(V1.VALOR)) AS DATA            '#13#10 +
    '                               FROM CM.VALTABGENER V1                         '#13#10 +
    '                              WHERE V1.CODTABELA = ''TAB_REB_2002''           '#13#10 +
    '                                AND TRIM(V1.CODCAMPO) = ''DATA''              '#13#10 +
    '                                AND TO_DATE(V1.VALOR) <= TO_DATE(' + QuotedStr(pAnoMesRef) + ', ''YYYY/MM''))');
End;

Function TCtrlIntegraContribPrev._ListaDeEmpregadosCalcRubP13(pAnoMesRef, pTabela: String; pIdMotivo: Integer): OleVariant;
Begin
  Result := GetDataPacket(
    'WITH tb_cont_empregado AS (                              '#13#10 +
    '     SELECT pf.IDPESSOA, pf.VALORPROVENTO cont_empregado '#13#10 +
    '     FROM ' + pTabela + ' pf                             '#13#10 +
    '     WHERE pf.MES = ' + QuotedStr(pAnoMesRef) + #13#10 +
    '           AND pf.IDMOTIVO IN (1, 14)                    '#13#10 +
    '           AND pf.IDRUBRICA = 32831)                     '#13#10 +
    'SELECT calc.*,                                           '#13#10 +
    '       cont_liq - nb - nc nv, nb pb, nc pc,              '#13#10 +
    '       CASE WHEN (sum(cont_liq - nb - nc) OVER ()) > 0 THEN       '#13#10 +
    '         (cont_liq - nb - nc) / (sum(cont_liq - nb - nc) OVER ()) '#13#10 +
    '       ELSE                                      '#13#10 +
    '         0                                       '#13#10 +
    '       END percprop,                             '#13#10 +
    '       sum(custeio) OVER () soma_custeio,        '#13#10 +
    '       sum(risco) OVER () soma_risco,            '#13#10 +
    '       sum(nb) OVER () soma_pb,                  '#13#10 +
    '       sum(nc) OVER () soma_pc,                  '#13#10 +
    '       0 as cont_patro                           '#13#10 +
    'FROM (                                           '#13#10 +
    ' SELECT base.*,                                  '#13#10 +
    '        CASE WHEN nb1 < cont_liq THEN            '#13#10 +
    '          nb1                                    '#13#10 +
    '        ELSE                                     '#13#10 +
    '          cont_liq                               '#13#10 +
    '        END nb,                                  '#13#10 +
    '        CASE WHEN                                '#13#10 +
    '          cont_liq -                             '#13#10 +
    '        CASE WHEN nb1 < cont_liq THEN            '#13#10 +
    '          nb1                                    '#13#10 +
    '        ELSE                                     '#13#10 +
    '          cont_liq                               '#13#10 +
    '        END /*nc1*/ <                            '#13#10 +
    '        CASE WHEN (provisao - ' + _cdsTabReb2002.fieldbyname('UR').asString + ') * 0.06 < 0 THEN  '#13#10 +
    '          0                                      '#13#10 +
    '        ELSE                                     '#13#10 +
    '        (provisao - ' + _cdsTabReb2002.fieldbyname('UR').asString + ') * 0.06                     '#13#10 +
    '        END /*nc2*/ THEN                         '#13#10 +
    '        cont_liq -                               '#13#10 +
    '        CASE WHEN nb1 < cont_liq THEN            '#13#10 +
    '          nb1                                    '#13#10 +
    '        ELSE                                     '#13#10 +
    '          cont_liq                               '#13#10 +
    '        END /*nc1*/                              '#13#10 +
    '        ELSE                                     '#13#10 +
    '        CASE WHEN (provisao - ' + _cdsTabReb2002.fieldbyname('UR').asString + ') * 0.06 < 0 THEN  '#13#10 +
    '        0                                        '#13#10 +
    '        ELSE                                     '#13#10 +
    '        (provisao - ' + _cdsTabReb2002.fieldbyname('UR').asString + ') * 0.06                     '#13#10 +
    '        END /*nc2*/                              '#13#10 +
    '        END NC                                   '#13#10 +

    ' FROM (                                                                                                         '#13#10 +
    '       SELECT fp1.IDPESSOA, p.NUMDOCUMENTO, fp1.MES, fp1.VALORPROVENTO provisao, ce.cont_empregado,             '#13#10 +
    '              ce.cont_empregado * ' + _cdsTabReb2002.fieldbyname('DES_ADM_ATIVO').asString + ' custeio,          '#13#10 +
    '              fp1.VALORPROVENTO * ' + _cdsTabReb2002.fieldbyname('BRISCO_PARTIC').asString + ' risco,            '#13#10 +
    '              ce.cont_empregado - (ce.cont_empregado * ' + _cdsTabReb2002.fieldbyname('DES_ADM_ATIVO').asString + ') -  '#13#10 +
    '              (fp1.VALORPROVENTO * ' + _cdsTabReb2002.fieldbyname('BRISCO_PARTIC').asString + ') cont_liq,       '#13#10 +
    '              fp1.VALORPROVENTO * 0.02 nb1,                                                                     '#13#10 +
    '              fp1.IDMOTIVO                                                                                      '#13#10 +  // Paulo Nobre - WO25267
    '       FROM ' + pTabela + ' fp1                                                                                 '#13#10 +
    '       JOIN tb_cont_empregado ce ON ce.idpessoa = fp1.idpessoa                                                  '#13#10 +
    '       JOIN cm.PESSOA p ON p.IDPESSOA = fp1.IDPESSOA                                                            '#13#10 +
    '       WHERE fp1.MES = ' + QuotedStr(pAnoMesRef)                                                               + #13#10 +
    '             AND fp1.IDMOTIVO IN (1, 14)                                                                        '#13#10 +
    '             AND fp1.IDRUBRICA IN (22340)                            '#13#10 + // P13 - PROVISAO 13 SALARIO MES
    '             AND EXISTS (SELECT 1                                                                               '#13#10 +
    '                         FROM ' + pTabela + ' fp2                                                               '#13#10 +
    '                         WHERE fp2.idpessoa = fp1.idpessoa                                                      '#13#10 +
    '                               AND fp2.mes = fp1.mes                                                            '#13#10 +
    '                               AND fp2.IDMOTIVO = fp1.idmotivo                                                  '#13#10 +
    '                               AND fp2.IDRUBRICA = 32831)) base ) calc');     // P13 - CONT REB EMPREGADO MES
End;
//================================================================================================================================
// Paulo Nobre - WO1920 - Fim

Function TCtrlIntegraContribPrev._GravarPreviaEmpregado(pAnoMesRef, pIdPessoaEmpregado, pDataPagamento, pNumDocumento, pTabela: String;
                                                        pVlrContribuicaoPatronal: Double;
                                                        pIdMotivo : Integer): boolean;      // Paulo Nobre - WO25167): boolean;
Var sDataRef : String;  // Paulo Nobre - WO25167
    dVlrContribuicaoPatronalAcumulada : Double;   // Paulo Nobre - WO25167
Begin
  // Paulo Nobre - WO1920 - Inicio

  // Incluindo novo registro da rubrica 32878 / 23860
  _qryAux.Close;
  _qryAux.SQL.Clear;
  _qryAux.SQL.Add('INSERT INTO ' + pTabela                                                                         );
  _qryAux.SQL.Add('        ( IDPESSOA, MESCOBRANCA, IDMOTIVO, MES, IDPESSJUR, REFERENCIA, IDRUBRICA, CODPROVDESC, ');
  _qryAux.SQL.Add('         VALORPROVENTO, SEQRUBRICA, IDPATRO, DATAPAGAMENTO, NUMDOCUMENTO, CODIRRFDARF, IDMODULO )  '); // Paulo Nobre - WO25167
  _qryAux.SQL.Add('VALUES (:pIDPESSOA, :pMESCOBRANCA, :pIDMOTIVO, :pMES, :pIDPESSJUR, :pREFERENCIA, :pIDRUBRICA, :pCODPROVDESC, ');
  _qryAux.SQL.Add('        :pVALORPROVENTO, :pSEQRUBRICA, :pIDPATRO, :pDATAPAGAMENTO, :pNUMDOCUMENTO, :pCODIRRFDARF, :pIDMODULO ) '); // Paulo Nobre - WO25167
  _qryAux.ParamByName('pIDPESSOA').asString := pIdPessoaEmpregado;
  _qryAux.ParamByName('pMESCOBRANCA').asString := pAnoMesRef;
  _qryAux.ParamByName('pIDMOTIVO').asInteger := pIdMotivo;       // Paulo Nobre - WO25167
  _qryAux.ParamByName('pMES').asString := pAnoMesRef;
  _qryAux.ParamByName('pIDPESSJUR').asInteger := 1;         // FUNCEF
  _qryAux.ParamByName('pREFERENCIA').asString := '***';
  _qryAux.ParamByName('pIDRUBRICA').asString := '32878';    // P13 - CONT REB EMPRESA MES
  _qryAux.ParamByName('pCODPROVDESC').asString := '23860';  // P13 - CONT REB EMPRESA MES
  _qryAux.ParamByName('pVALORPROVENTO').asFloat := pVlrContribuicaoPatronal;
  _qryAux.ParamByName('pSEQRUBRICA').asInteger := 1;
  _qryAux.ParamByName('pIDPATRO').asInteger := 1;           // FUNCEF
  _qryAux.ParamByName('pDATAPAGAMENTO').asString := pDataPagamento;
  _qryAux.ParamByName('pNUMDOCUMENTO').asString := pNumDocumento; // CPF da Pessoa
  _qryAux.ParamByName('pCODIRRFDARF').asString := '0561';   // Rendimento do Trabalho Assalariado
  _qryAux.ParamByName('pIDMODULO').asInteger := 21;         // Folha de Pagamento de Empregados          // Paulo Nobre - WO25167
  If Not _qryAux.Prepared Then
    _qryAux.Prepare;
  _qryAux.ExecSQL;
  
  // Paulo Nobre - WO1920 - Fim

  // Paulo Nobre - WO25167 - Inicio

  sDataRef := '01/' + copy(pAnoMesRef,6,2) + '/' + copy(pAnoMesRef,1,4);
  dVlrContribuicaoPatronalAcumulada := 0.00;

  // Encontrando o valor acumulado anterior da rubrica 32877 / 23865 - P13 - CONT REB EMPRESA ACUMULADA
  _qryAux2.Close;
  _qryAux2.SQL.Clear;
  _qryAux2.SQL.Add('SELECT VALORPROVENTO VALORPROVENTO32877                                ');
  _qryAux2.SQL.Add('FROM ' + pTabela                                                        );
  _qryAux2.SQL.Add('WHERE MES = TO_CHAR(ADD_MONTHS(' + quotedstr(sDataRef) + ', -1), ''YYYY/MM'') ');
  _qryAux2.SQL.Add('      AND IDPESSJUR   = 1                                              ');  // FUNCEF
  _qryAux2.SQL.Add('      AND IDRUBRICA   = 32877                                          ');  // P13 - CONT REB EMPRESA ACUMULADA
  _qryAux2.SQL.Add('      AND IDPESSOA    = ' + pIdPessoaEmpregado                          );
  _qryAux2.Open;
  // Se existir
  if (not _qryAux2.EOF) Then
  begin
     // Se tem valor, então soma com o valor da contribuição patronal
     if (_qryAux2.FieldByName('VALORPROVENTO32877').asFloat <> 0.00) Then
        dVlrContribuicaoPatronalAcumulada := RoundCM(_qryAux2.FieldByName('VALORPROVENTO32877').asFloat + pVlrContribuicaoPatronal,2);

     // Encontrando o valor da rubrica 32437 / 12035 - CONT FUNCEF/REB (EMPRESA) 13º SALARIO
     _qryAux2.Close;
     _qryAux2.SQL.Clear;
     _qryAux2.SQL.Add('SELECT VALORPROVENTO VALORPROVENTO32437                                ');
     _qryAux2.SQL.Add('FROM ' + pTabela                                                        );
     _qryAux2.SQL.Add('WHERE MES = ' + QuotedStr(pAnoMesRef)                                   );
     _qryAux2.SQL.Add('      AND IDPESSJUR   = 1                                              ');  // FUNCEF
     _qryAux2.SQL.Add('      AND IDRUBRICA   = 32437                                          ');  // CONT FUNCEF/REB (EMPRESA) 13º SALARIO
     _qryAux2.SQL.Add('      AND IDPESSOA    = ' + pIdPessoaEmpregado                          );
     _qryAux2.Open;
     // Se existir
     if (not _qryAux2.EOF) Then
        // Se tem valor, então abate do valor da contribuição acumulada
        if (_qryAux2.FieldByName('VALORPROVENTO32437').asFloat <> 0.00) Then
           dVlrContribuicaoPatronalAcumulada := RoundCM(dVlrContribuicaoPatronalAcumulada - _qryAux2.FieldByName('VALORPROVENTO32437').asFloat,2);

     if (dVlrContribuicaoPatronalAcumulada <> 0.00) Then      
     Begin
        // Incluindo novo registro da rubrica 32877 / 23865 - P13 - CONT REB EMPRESA ACUMULADA
        _qryAux.Close;
        _qryAux.SQL.Clear;
        _qryAux.SQL.Add('INSERT INTO ' + pTabela                                                                        );
        _qryAux.SQL.Add('        (IDPESSOA, MESCOBRANCA, IDMOTIVO, MES, IDPESSJUR, REFERENCIA, IDRUBRICA, CODPROVDESC, ');
        _qryAux.SQL.Add('         VALORPROVENTO, SEQRUBRICA, IDPATRO, DATAPAGAMENTO, NUMDOCUMENTO, CODIRRFDARF, IDMODULO )  ');
        _qryAux.SQL.Add('VALUES (:pIDPESSOA, :pMESCOBRANCA, :pIDMOTIVO, :pMES, :pIDPESSJUR, :pREFERENCIA, :pIDRUBRICA, :pCODPROVDESC, ');
        _qryAux.SQL.Add('        :pVALORPROVENTO, :pSEQRUBRICA, :pIDPATRO, :pDATAPAGAMENTO, :pNUMDOCUMENTO, :pCODIRRFDARF, :pIDMODULO ) ');
        _qryAux.ParamByName('pIDPESSOA').asString := pIdPessoaEmpregado;
        _qryAux.ParamByName('pMESCOBRANCA').asString := pAnoMesRef;
        _qryAux.ParamByName('pIDMOTIVO').asInteger := pIdMotivo;      
        _qryAux.ParamByName('pMES').asString := pAnoMesRef;
        _qryAux.ParamByName('pIDPESSJUR').asInteger := 1;         // FUNCEF
        _qryAux.ParamByName('pREFERENCIA').asString := '***';
        _qryAux.ParamByName('pIDRUBRICA').asString := '32877';    // P13 - CONT REB EMPRESA ACUMULADA
        _qryAux.ParamByName('pCODPROVDESC').asString := '23865';  // P13 - CONT REB EMPRESA ACUMULADA
        _qryAux.ParamByName('pVALORPROVENTO').asFloat := dVlrContribuicaoPatronalAcumulada;
        _qryAux.ParamByName('pSEQRUBRICA').asInteger := 1;
        _qryAux.ParamByName('pIDPATRO').asInteger := 1;           // FUNCEF
        _qryAux.ParamByName('pDATAPAGAMENTO').asString := pDataPagamento;
        _qryAux.ParamByName('pNUMDOCUMENTO').asString := pNumDocumento; // CPF da Pessoa
        _qryAux.ParamByName('pCODIRRFDARF').asString := '0561';   // Rendimento do Trabalho Assalariado
        _qryAux.ParamByName('pIDMODULO').asInteger := 21;          // Folha de Pagamento de Empregados
        If Not _qryAux.Prepared Then
          _qryAux.Prepare;
        _qryAux.ExecSQL;
     End;
  End;
  // Paulo Nobre - WO25167 - Fim
End;

End.

