// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Função      : ValidaNumProcesso
// Autor       : Leo
// Data        : 07/10/2002
// Alteração   : acerto da função que estava com a forma de cálculo do dígito errada
// *****************************************************************************
// Função      : ValidaNumProcesso
// Autor       : Leo
// Data        : 23/09/2002
// Alteração   : implementei esta função que valida o número do processo no módulo 11,
//               como o CPF
// *****************************************************************************
// Função      : CriticaDataCobrancaSit
// Autor       : Leo
// Data        : 25/06/2002
// Alteração   : TROQUEI IIDFUNDACAO POR IDEMPRESA
// *****************************************************************************
// Autor       : Leo
// Data        : 05/06/2002
// Alteração   : tratamento do parâmetro IDMOTIVOSALMANUT
// *****************************************************************************
// Autora      : Camille
// Data        : 03.04.2002
// Alteração   : Leitura do parâmetro global "Gerar rubricas de contribuição e benefícios
//               automaticamente" ( FLGRUBRICAAUTO )
// *****************************************************************************


unit UAdmPrev;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Machklb,Registry,checklst, StdCtrls, Spin ;

const

  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;

var
   { Variáveis Globais }
   sTipoTelaBenef   : string;

   iIdParticipante : integer; { Identificador lido pela rotina PedeParticipante
                                para a próxima função = Participante Ativo }
   iIdPlanoPrev    : integer; { Identificador do Plano Previdenciário do
                                Participante Ativo }
   iIdPatrocin     : integer; { Identificador da Patrocinadora do
                                Participante Ativo }
   iIdFundacao     : integer; { Identificador da fundacao no caso de monofundacao }
   iIdFundacaoAtual : integer;

   sIdVolta,
   sNomeParticip,
   sNomePatro,
   sNomePlano       : string;

   sCancelaSuspende : string; { String com a letra da operacao a ser realizada
                                S - Suspensao  C - Cancelamento
                                D - Desfazer cancelamento }

   bRubricaPatrocinadora ,    { True  - Associação de Rubrica p/ Patrocinadora
                                False - Associação de Rubrica p/ Fundação }
   bAux,                                
   bExibeQuery,
   bPedeFundacao : boolean; { True- entrar no cadastro de fundacao na abertura do sistema}

   sIdPlanoPrev,
   sIdPlano,
   sIdEventoGerador,
   sFlgInterno,
   sIdProduto, sNomeProduto,
   sMascTpReserva  : string; { Mascara do tipo de reserva }

   iIdResponsavelGeral : longint;
   iIdCalculoGeral     : longInt ; // variavel criada para passar para a funcao RegraNumerica
                              // caso o procedimento chamador nao necessite deste paramentro

   { Parâmetros do Sistema }

   prmFLGTIPOPREVIDENC : string; 
   prmIntegraContab,
   prmIntegraCAP,
   prmIntegraCAR, 
   prmFlgGravaSimulBenef,
   prmFlgImpCertif,
   prmMostraSitGeral,
   prmFlgRubricaAuto      : boolean; // CAMILLE -    03.04.2002
   prmflgMultiFundacao    : boolean;
   prmIdMotivoContrib ,
   prmIdMotivoDiverg,
   prmIdMotivoParcelaPREV,
   prmIDMOTIVOFOLHABEN ,
   prmIdMotivoDevolBen,
   prmIdMotDevolNaoIden,
   prmIdMotivoSalManut //leocm - 05062002
   : longint;


   prmIDGRINSTR, { Augusto 30/07/2002 }
   prmNUMOPINSS       : integer;

   prmNOMEBINSS1,
   prmNOMEBINSS2,
   prmNOMEBINSS3      : string;

   prmFLGEDITABINSS1,
   prmFLGEDITABINSS2,
   prmFLGEDITABINSS3  : boolean;

   prmIDRGBINSS1,
   prmIDRGBINSS2,
   prmIDRGBINSS3      : longint;


   // Variaveis de integracao com financeiro
   prmIdRamoTipoCliAtivo,
   prmIdRamoTipoCliPatro,
   prmIdRamoTipoCliMantido,
   prmIdRamoTipoCliMantidoParc,
   prmIdRamoTipoCliAssistido,
   prmIdRamoTipoForAtivo,
   prmIdRamoTipoForPatro,
   prmIdRamoTipoForMantido,
   prmIdRamoTipoForMantidoParc,
   prmIdRamoTipoForAssistido    : longint;

   prmUnidNegoc : longint;
   prmCodCentroRespon,
   prmTpOperCobranca,
   prmTpOperFolhaBen,
   prmTpOperReserva,
   prmTpDocRRecBanco,
   prmTpDocRRecPatro,
   prmTpDocPEnvioPatro,
   prmTpDocfOLHAbEN    ,
   prmTpDocPEnvioBanco  : string;

   prmMargemDesconto    : double;
   prmIdRubricaIRRF     : integer;
   prmIdMotivoAbono     : integer;
   prmIdRubPensao       : integer;

   prmIdRegraCalcBenefMin : longint; // CAMILLE - CBS - 05.03.2002
   
   { Parametro temporario para dizer se testa ou nao REGRA }
   bTestaRegra : boolean;
   procedure TiraQuery(qryAux : TwwQuery);
   { Rotina para ler a tabela de parametros do Sistema AdmPrev
     e preencher as variaveis de paramentro necessárias }
   function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
   procedure CadastraFundacao(qry : TwwQuery);

   { Rotina que calcula a idade em anos de uma pessoa }
   function CalcIdade(dDataNasc : TDateTime) : integer;

   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero : string):string;
   function ClienteNumero(sNumero : string):string;

   { Rotinas para executar regras }

   function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumerica(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   function RegraBooleanaPasso(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumericaPasso(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   { Rotinas para tratar meses e anos }
   function AnoMesAnterior(iMes, iAno : integer) : string;
   function SAnoMesAnterior(sAnoMes : string   ) : string;
   function ProximoAnoMes(iMes,iAno : integer)   : string;
   function ProximoMesAno(iMes, iAno : integer)  : string;

   { Rotina para identificar Id do item checado em um checkListBox }

   function PegaidCheck(chklst : TCheckListBox ;chave,nome: string ; var qryaux : TwwQuery ):String;

   { Rotina para criticar Data da Cobranca dependendo da SITUACAO(Calendario)
     'N' - Cobrança Normal          'A' - Cobrança Atrasada      'D' - Pagamento de Devolução
     'P' - Pagamento de Beneficio   'B' - Pagamento de Abono     'T' - Pagamento de Antecipacao de Beneficio
     'O' - Pagamento de Antecipacao de Abono
   }
   function CriticaDataCobrancaSit(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
            sTipoData : char; sMesReferencia, sAnoReferencia : string): string;



   function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
   function MesAnoAnterior(iMes, iAno : integer) : string;
   function MudaSeparador(sNumero : string):string;

   procedure TiraSQL( qry : TwwQuery);

   function  ProcSituacao(sCodSituacao : string) : string;

   function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;

   // CAMILLE - REFER - 28.06.1999
   function  CalculaDataAposPrazo(psDataInicio : string; piPrazoEmMeses : integer) : string;

   // Faz o calculo de um valor pro-rata do inicio do mes até o dia final
   function ValorProRataUltimo(psValorIntegral , psDataRefFinal : string) : double;

   function ValorProRataMes(psValorIntegral, psAnoMesRef, psDataRefInicio, psDataRefFinal : string) : double;

   // Faz o calculo de um valor pro-rata do dia de inicio até o final do mes
   function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;

   function FormaAnoMesTela( pCmbMes : TComboBox; pSpAno : TSpinEdit) : string;

   function RetornaFlagEvento(sDescEvento : string) : string;

   function DiaUtil(sDiaUtil, sMesAno: string): string;

   function RetornaFlgIntSitPart ( piIdSitPart : longint)  : string;

   function BuscaCampoTabela     ( psNomeCampo, psNomeTabela, psCondicao : string ) : string;

   function BuscaMesCobrancaLote ( piIdLote : longint; psAnoMesCobrancaDefault : string ) : string;

   //P.RAMOS - REFER - 04.07.2001
   function PegaFlgIncluiMesConc(pidlote : integer) : integer;

// CGUEDES - 21/11/2001:
// Retorna tempo em extenso
    Function TempoExtenso(Tempo:Integer):String;

    Function TransformaDiasTempo(Tempo:Integer):String;

// Retorna Indicador se Periodo for Concomitante
    Function PeriodoConcomitante(QryLocal: TwwQuery;
                                 IdPessoa, Sequencia : Integer;
                                 DataInicial, DataFinal: String):Boolean;

    // CAMILLE - FUNCEF - 22.11.2001
    function PatroPermiteAlterarDados( piIdPessJur, piIdPessoa : longint ) : boolean ;


    //leocm - 2309
    function ValidaNumProcesso(num: string): boolean;

implementation

uses UMensErro,   DAPrev,        UMascaras, USistema,     UAutorizacao, DBaseDados,
     FPedeInfAux, UFuncoesUteis, UModulo,   UIntegraBack, USincronismo;

Function  PeriodoConcomitante(QryLocal: TwwQuery;
                                                    IdPessoa, Sequencia: Integer;
                                                    DataInicial, DataFinal: String):Boolean;
Begin
  Result := False;
// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);
// Verifica se no historico do participante, ja nao existe uma empresa com o periodo igual.
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(
     'SELECT SEQHISTFUNC FROM HISTFUNCPREV                 ' +
     'WHERE IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
     '      SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
     '      (DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
     '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
     '       OR                                                                               ' +
     '       DATAFINAL  BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
     '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ');
    Open;

    If IsEmpty Then Begin
      Result := False;
    End Else Begin
      Result := True;
    End;
  End;
End;




//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := Replicate('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;



//******************************************************************************
// Retorna tempo em extenso
Function TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo, I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= Replicate('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;


procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;

function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;

function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   // CAMILLE - REFER - 23.08.1999
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

function MudaSeparador(sNumero : string):string;
var i : integer;
    sOra : string;
begin
   sOra  := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if (sNumero[i] = '.') or (sNumero[i] = ',') then
        sOra   := sOra + DecimalSeparator
     else sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;


function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
var qry : TwwQuery;
begin
   bPedeFundacao := False;

   // Se variaveis ainda nao foram inicilizadas, inicializá-las
   if bInicVar
   then begin
      bTestaRegra := True;
   end;

   // Criar query temporária
   Result := True;
   qry := TwwQuery.Create(Application);
   qry.DatabaseName := nomeBaseDados;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT * FROM PARAMAPREV');
   try
     qry.Open;
   except
     MsgDlg('Erro na leitura de parâmetros','Erro',mtError,[mbOk,mbHelp],0);
     Result := False;
     qry.Close;
     tirasql(qry);     
     qry.Free;
     Exit;
   end;

   { Se nao existir registro na tabela de parametros, significa que o sistema
     ainda nao foi instalado, ou seja, está sendo instalado pela 1a. vez.
     Neste caso, o sistema deve gravar algums valores default. Além disto o
     sistema deverá :
        * Perguntar se o usuário trabalhará com mais de uma fundacao
          Se sim -> abrir cadastro de fundacao
          Se nao -> cadastrar empresa do login como fundacao
   }
   if qry.IsEmpty
   then begin
     if MsgDlg('Deseja trabalhar com o sistema Multi-Fundação ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
     then begin // Nao é multifundacao
        CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
        try
           qry.Close;
           qry.SQL.Clear;
           qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                       '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR) '+
                       ' VALUES(0,1,0,1,1) ');
           qry.ExecSQL;
        except
           MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
        end;
     end
     else begin // Usuario optou por sistema multifundacao
        iIdFundacao := -1;
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                    '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR) '+
                    ' VALUES(0,1,1,1,1) ');
        try
          qry.ExecSQL;
        except
          on E:EDBEngineError do begin
             MostrarErro(E);
             qry.Close;
             tirasql(qry);
             qry.Free;              
             Exit;
          end;
        end;
     end;
   end;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT IDGRINSTR,         FLGATUMATRICULA,      FLGACERTARESERVA,    TPDOCPCONVENIO,      '+
               '        IDGRINSTRUNIV,     FLGVERATIVOS,         IDREGRAMOTIVO,       FLGEXECRGBMINMES,    '+
               '        FLGINTCONTAB,      FLGRECALCULOSRBMES,  '+
               '        MARGEMDESCONTOS,   MASCTIPORESERVA,      FLGMULTIFUNDACAO,    IDMOTIVOFOLHABEN,    '+
               '        FLGINTCPAGAR,      FLGINTCRECEBER,       FLGINTCPAGARPREV,    FLGINTCRECEBERPR,    '+
               '        IDMOTIVOABONO,     IDRUBQUITAEMPREST,    IDRUBQUITAPREV,      IDRUBQUITAASSIST,    '+
               '        IDRUBPENSAO,       IDMOTIVODEVOLBEN,    TPDOCPFLHBENELET,    '+
               '        TPDOCPFLHBENINDIV, TPDOCRFLHBENELET,     TPDOCRFLHBENINDIV,   TPDOCPENVIOBANCO,    '+
               '        TPDOCPENVIOPATRO,  TPDOCRRECBANCO,       TPDOCRRECPATRO,      TIPOPERENVIO,        '+
               '        TIPOPERCOBRANCA,   TIPOPERDIVERG,        TIPOPERRESERVA,      TIPOPERFLHBEN,       '+
               '        TIPOCLIMANTIDOS,   TIPOCLIATIVOS,        TIPOCLIASSISTIDOS,   TIPOCLIMANTPARC,     '+
               '        TIPOFAVATIVOS,     TIPOFAVMANTIDOS,      TIPOFAVASSISTIDOS,   TIPOFAVMANTPARC,     '+
               '        IDMOTIVODIVERG,    FLGCOBPRIMBCOASS,     IDMOTIVOPARCELA,     IDTIPOAGRECPMF,      '+
               '        FLGUSAFOLHARESG,   FLGTRATAPREVIAPA,     FLGCALCULOVALORES,   FLGCORRIGEBENEF,     '+
               '        VLRARREDSALARIO,   VLRBENEFMIN,          IDRUBIRRF,           IDRUBPENSAO,         '+
               '        FLGGRAVASIMULABEN, FLGCALCJUNTO,         FLGINCLUIMESCONC,    NOMEBINSS3,          '+
               '        IDRGBINSS1,        IDRGBINSS2,           IDRGBINSS3,          FLGEDITABINSS1,      '+
               '        FLGEDITABINSS2,    FLGEDITABINSS3,       NUMOPINSS,           NOMEBINSS1,          '+
               '        NOMEBINSS2,        IDMOTDEVOLNAOIDEN,    CODPORTFORMAPATRO,   FLGMOSTRASITGERAL,   '+
               '        FLGRUBRICAAUTO,    FLGIMPCERTIF,         TIPOFAVPATRO,        TIPOCLIPATRO,        '+
               '        IDDOCUMENTO,       IDREGRACALCINSS,      IDMOTIVOCONTRIBP ,   IDMOTIVOSALMANUT     '+
               ' FROM PARAMAPREV ');
   qry.Open;

   // Parametros de integracao com o financeiro
   prmTpOperCobranca   := qry.FieldByName('TIPOPERCOBRANCA').AsString;
   prmTpOperFolhaBen   := qry.FieldByName('TIPOPERFLHBEN').AsString;
   prmTpOperReserva    := qry.FieldByName('TIPOPERDIVERG').AsString;
   prmTpDocRRecBanco   := qry.FieldByName('TPDOCRRECBANCO').AsString;
   prmTpDocRRecPatro   := qry.FieldByName('TPDOCRRECPATRO').AsString;
   prmTpDocPEnvioPatro := qry.FieldByName('TPDOCPENVIOPATRO').AsString;
   prmTpDocfOLHAbEN    := qry.FieldByName('TPDOCPFLHBENELET').AsString;
   prmTpDocPEnvioBanco := qry.FieldByName('TPDOCPENVIOBANCO').AsString;

   prmIdRamoTipoCliAtivo        := qry.FieldByName('TIPOCLIATIVOS').AsInteger;
   prmIdRamoTipoCliPatro        := qry.FieldByName('TIPOCLIPATRO').AsInteger;
   prmIdRamoTipoCliMantido      := qry.FieldByName('TIPOCLIMANTIDOS').AsInteger;
   prmIdRamoTipoCliMantidoParc  := qry.FieldByName('TIPOCLIMANTPARC').AsInteger;
   prmIdRamoTipoCliAssistido    := qry.FieldByName('TIPOCLIASSISTIDOS').AsInteger;

   prmIdRamoTipoForAtivo        := qry.FieldByName('TIPOFAVATIVOS').AsInteger;
   prmIdRamoTipoForPatro        := qry.FieldByName('TIPOFAVPATRO').AsInteger;
   prmIdRamoTipoForMantido      := qry.FieldByName('TIPOFAVMANTIDOS').AsInteger;
   prmIdRamoTipoForMantidoParc  := qry.FieldByName('TIPOFAVMANTPARC').AsInteger;
   prmIdRamoTipoForAssistido    := qry.FieldByName('TIPOFAVASSISTIDOS').AsInteger;

   if qry.FieldByName('FLGIMPCERTIF').AsInteger = 1
   then prmFlgImpCertif := True
   else prmFlgImpCertif := False;

   if qry.FieldByName('FLGMOSTRASITGERAL').AsInteger = 1
   then prmMostraSitGeral := True
   else prmMostraSitGeral := False;

   if qry.FieldByName('flgMultiFundacao').AsInteger = 1
   then prmflgMultiFundacao := True
   else prmflgMultiFundacao := False;


   prmIntegraContab       := (qry.FieldByName('FLGINTCONTAB').AsInteger = 1);
   prmIntegraCAP          := (qry.FieldByName('FLGINTCPAGARPREV').AsInteger = 1);
   prmIntegraCAR          := (qry.FieldByName('FLGINTCRECEBERPR').AsInteger = 1);

   prmFlgGravaSimulBenef  := (qry.FieldByName('FLGGRAVASIMULABEN').AsInteger = 1);
   prmFlgRubricaAuto      := (qry.FieldByName('FLGRUBRICAAUTO').AsInteger = 1); // CAMILLE - 03.04.2002
   prmIdMotivoContrib     := qry.FieldByName('IDMOTIVOCONTRIBP').AsInteger;
   prmIdMotivoDiverg      := qry.FieldByName('IDMOTIVODIVERG').AsInteger;
   prmIdMotivoParcelaPREV := qry.FieldByName('IDMOTIVOPARCELA').AsInteger;
   sMascTpReserva         := qry.FieldByName('MascTipoReserva').AsString;


   prmMargemDesconto      := qry.FieldByName('MARGEMDESCONTOS').AsFloat/100;
   prmIdRubricaIRRF       := qry.FieldByName('IDRUBIRRF').AsInteger;
   prmIDMOTIVOFOLHABEN    := qry.FieldByName('IDMOTIVOFOLHABEN').AsInteger;
   prmIdMotDevolNaoIden   := qry.FieldByName('IDMOTDEVOLNAOIDEN').AsInteger;
   prmIdMotivoDevolBen    := qry.FieldByName('IDMOTIVODEVOLBEN').AsInteger; // CAMILLE - REFER - 26.03.1999
   prmIdMotivoAbono       := qry.FieldByName('IDMOTIVOABONO').AsInteger;


   prmIdMotivoSalManut    := qry.FieldByName('IDMOTIVOSALMANUT').AsInteger; //leocm - 05062002

   { Augusto 30/07/2002 }
   prmIDGRINSTR           := qry.FieldByName('IDGRINSTR').AsInteger;

   // Parametros de beneficio do INSS
   prmNUMOPINSS           := qry.FieldByName('NUMOPINSS').AsInteger;

   prmNOMEBINSS1          := qry.FieldByName('NOMEBINSS1').AsString;
   prmNOMEBINSS2          := qry.FieldByName('NOMEBINSS2').AsString;
   prmNOMEBINSS3          := qry.FieldByName('NOMEBINSS3').AsString;

   prmFLGEDITABINSS1      := (qry.FieldByName('FLGEDITABINSS1').AsInteger = 1);
   prmFLGEDITABINSS2      := (qry.FieldByName('FLGEDITABINSS2').AsInteger = 1);
   prmFLGEDITABINSS3      := (qry.FieldByName('FLGEDITABINSS3').AsInteger = 1);

   prmIDRGBINSS1          := qry.FieldByName('IDRGBINSS1').AsInteger;
   prmIDRGBINSS2          := qry.FieldByName('IDRGBINSS2').AsInteger;
   prmIDRGBINSS3          := qry.FieldByName('IDRGBINSS3').AsInteger;

   prmIdRubPensao         := qry.FieldByName('IDRUBPENSAO').AsInteger;

   prmIdRegraCalcBenefMin := qry.FieldByName('VLRBENEFMIN').AsInteger; // CAMILLE - CBS - 05.03.2002


   // Verificar se o parametro de multifundacao está preenchido e a fundacao não existe
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDPESSOA, FLGTIPOPREVIDENC FROM FUNDACAO ');
   qry.Open;
   if qry.IsEmpty
   then begin // Nao existe nenuma fundacao gravada
      if not prmflgMultiFundacao  // Sistema MonoFundacao
      then begin
         if MsgDlg(' O sistema está cadastrado como Mono-Fundação, porém não existe nenhuma fundação cadastrada. '+
                ' Deseja gravar Fundação neste momento ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
         then begin
            // Gravar fundacao
            CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
            prmFLGTIPOPREVIDENC := 'F';
            iIdFundacao := Sistema.IdEmpresa;
         end
         else iIdFundacao := -1;
      end
      else begin // Sistema MultiFundacao
         MsgDlg('O sistema está cadastrado como Multi-Fundação, porém não existe nenhuma fundação cadastrada. '+
                'É recomendável que as Fundações sejam cadastradas neste momento.','Informação',mtInformation,[mbOk,mbHelp],0);
         prmFLGTIPOPREVIDENC := 'F';
         iIdFundacao := -1;
      end;
   end
   else begin
      if not prmflgMultiFundacao
      then iIdFundacao := qry.FieldByName('IdPessoa').AsInteger
      else iIdFundacao := -1;

      prmFLGTIPOPREVIDENC := qry.FieldByName('FLGTIPOPREVIDENC').AsString;
   end;


   iIdFundacaoAtual := iIdFundacao;    // FDIAS - REFER - 23.07.2001  NAO TEM EFEITO PARA MULTIFUNDAÇÃO
                                       // PORTANTO DEVE-SE ACRESCENTAR ESTA LINHA NO FPRINCIPAL APÓS EscolheFundacao;
   tirasql(qry);
   qry.Free;

   if Trim(sMascTpReserva) <> ''
   then PreencheTamNiveisMascara(sMascTpReserva);

   if Sistema.IdEmpresa <= 0 then Sistema.IdEmpresa := iIdFundacao;
end;

procedure CadastraFundacao(qry : TwwQuery);
var sNomeEmpresa : string;
begin
   if Sistema.IdEmpresa <= 0
   then begin
      MsgDlg('Empresa Própria não cadastrada como Fundação. Utilize o Cadastro de Fundação.','Erro',mtError,[mbOk,mbHelp],0);
      tirasql(qry);
      Exit;
   end;
   if Trim(Sistema.NomeEmpresa) = ''
   then sNomeEmpresa := '[Nome da Fundação]'
   else sNomeEmpresa := Sistema.NomeEmpresa;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT F.IDPESSOA, P.NOME FROM FUNDACAO F, PESSOA P '+
               ' WHERE P.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' AND '+
               '       P.IDPESSOA = F.IDPESSOA(+)' );
   qry.Open;
   if (qry.IsEmpty) or  (qry.FieldByName('IdPessoa').AsString = '')
   then begin // Empresa nao cadastrada como fundacao
      try
         if qry.IsEmpty // empresa nao existe em pessoa
         then begin
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add(' INSERT INTO PESSOA(IDPESSOA,NOME,TIPO,RAZAOSOCIAL)'+
                        ' VALUES ('+IntToStr(Sistema.IdEmpresa)+','''+sNomeEmpresa+''', ''J'','''+
                                      sNomeEmpresa+''')');
            qry.ExecSQL;
         end;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('INSERT INTO FUNDACAO(IDPESSOA,FLGTIPOPREVIDENC) VALUES('+IntToStr(Sistema.IdEmpresa)+', ''F'')');
         qry.ExecSQL;
         qry.Close;
      except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
      end;
   end;
   iIdFundacao := Sistema.IdEmpresa;
end;

function CalcIdade(dDataNasc : TDateTime) : integer;
begin
 if Trim(DateToStr(dDataNasc)) = ''
 then Result := 0
 else Result := Trunc((date - dDataNasc) / 365);
end;

{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
    cAux    : char;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;
   iIdCalculoGeral := 0;

   Result := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      cAux := DecimalSeparator;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;         
      end;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end
      else bErro     := True;
      qryRegra.Close;
   end;
end;

function RegraBooleanaPasso(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;

   Result := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.PassoAPasso;
      if not regraAPrev.Error       
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end
      else bErro     := True;
      qryRegra.Close;
   end;
end;


function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux : char;
begin
   Result := '0';
   bErro := False;

   iIdCalculoGeral := 0;
   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      cAux                 := DecimalSeparator;
      regraAPrev.QueryIn   := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;
      end;

      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;

         // Verificar se o resultado da regra é um número válido
         try
            StrToFloat(ClienteNumero(RegraAPrev.Result))
         except
            MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                   '[VALOR = '+RegraAPrev.Result+']','Erro',mtError,[mbOk, mbHelp],0);
            bErro := True;
            piIdCalculo := -1;
         end;

         Result := OraNumero(regraAPrev.Result);
      end
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;

      qryRegra.Close;
   end;
end;

// ROSANA - REFER - 09/08/99
function RegraNumericaPasso(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
begin
   Result := '';
   bErro := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      regraAPrev.QueryIn   := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      regraAPrev.PassoAPasso;
      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;
         Result := OraNumero(regraAPrev.Result);
      end
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;
      qryRegra.Close;
   end;
end;

{ Rotinas para tratar meses e anos }
function ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13)
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//ProximoAnoMes

function AnoMesAnterior(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sAnoMes := IntToStr(iAno-1)+'/';
     sAnoMes := sAnoMes+'12';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//AnoMesAnterior

function MesAnoAnterior(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sMesAno := '12/'+IntToStr(iAno-1);
  end
  else begin
    iMes := iMes - 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//MesAnoAnterior


function ProximoMesAno(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13) 
  then begin
     sMesAno := '01/'+IntToStr(iAno+1);
  end
  else begin
    iMes := iMes + 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//ProximoMesAno

function PegaidCheck(chklst : TCheckListBox;chave,nome: string ; var qryaux : TwwQuery ):String;
var marcado,i : integer;
    Volta : String;
begin
   marcado := 0;

   for i := 0 to chklst.Items.Count - 1 do
   begin
         if not chklst.checked[i] then
         continue
         else inc(marcado);
   end;

   Volta := '';
   if marcado = 0 then
   begin
      Result := '';
      Exit;
   end;

   for i := 0 to chklst.Items.Count - 1 do
   begin
      if (not chklst.checked[i]) and ( marcado <> 0) then continue;
      if not  qryaux.Locate(''+Nome+'',chklst.items[i],[]) then
      begin
         continue;
      end
      else
      begin
         Volta := qryaux.fieldbyname(''+chave+'').AsString + ',';
      end;
   end;

   Volta := Copy(Volta,Length(Volta) - 1 ,1);
   Result := Volta;
end;//PegaIdCheck


{ Rotina para tratar Dia Útil (Calendario) }
function CriticaDataCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass ,
                                   sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


 {Verifica Data Cobrança Normal}
  if sTipoData = 'N' then //Normal
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBNORMAL').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBNORMAL').AsString
          else
             sDia := qry.FieldByName('DIACOBNORMAL').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Normal}
          if qry.FieldByName('FLGUTILNORMAL').AsString = 'N' then // ex: se DIACOBNORMAL = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         {Fim - Dia Normal}
          else //FLGUTILNORMAL = U
         {Dia Útil}
             begin // ex: se DIACOBNORMAL = 5, pega 5° Dia Útil do mes}
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança Normal}



 {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBATRASO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBATRASO').AsString
          else
             sDia := qry.FieldByName('DIACOBATRASO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Atraso}
          if qry.FieldByName('FLGUTILATRASO').AsString = 'N' then // ex: se DIACOBATRASO = 5, pega Dia 5
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         {Fim - Dia Atraso}
          else //FLGUTILATRASO = U
         {Dia Útil}
             begin // ex: se DIACOBATRASO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança em Atraso}



 {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBDEVOLUCAO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBDEVOLUCAO').AsString
          else
             sDia := qry.FieldByName('DIACOBDEVOLUCAO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Devolucao}
          if qry.FieldByName('FLGUTILDEVOLUCAO').AsString = 'N' then //ex: se DIACOBDEVOLUCAO = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         {Fim - Dia Devolucao}
          else //FLGUTILDEVOLUCAO = U
         {Dia Útil}
             begin //ex: se DIACOBDEVOLUCAO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data de Devolução}

  Result := sData;
end;


function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sAnoMes : string;
begin
  Result := '';

 {Filtra DATASPATROPLANASS}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + '';


  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;

          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}

          {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sAnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
             sAnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             sAnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

  Result := sAnoMes;


end;

{ Rotina que retorna o 'N' Dia Útil do mes }
function DiaUtil(sDiaUtil, sMesAno: string): string;
var
  iDia,              // guarda o dia util
  iDiaUtil,
  iUltDiaMes : integer; // controla o dia util
  dData      : double;
begin
  Result     := '';
  iDia       := 1;
  iDiaUtil   := 0;
  iUltDiaMes := TrazUltDiaMes(StrToInt(Copy(sMesAno,1,2)), StrToInt(Copy(sMesAno,4,4)) );

  while (StrToInt(sDiaUtil) <> iDiaUtil) and
        (iDia <= iUltDiaMes) do
  begin
     if Length(IntToStr(iDia)) = 1
     then dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
     else dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);

     if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)
     then iDiaUtil := iDiaUtil + 1;// Se Dia da Semana nao for Domingo nem Sabado

     iDia := iDia + 1;
  end;

  Result := IntToStr(iDia - 1);
end;//DiaUtil

function CriticaDataCobrancaSit( qry : TwwQuery;
                                 sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
                                 sTipoData                              : char;
                                 sMesReferencia, sAnoReferencia         : string) : string;
var
  sSql, sAux,
  sTabela,
  sFiltro,
  sAnoMesCiclo,
  sData           : string;
  iIdModulo       : longint;
  bEncontrouCicloAberto,
  bCicloEncerrado : boolean;
  cTipoEnvPrev    : char;
begin
  Result := '';
  // SINCRONISMO : Se o ciclo do mes/ano passados como parametros estiver encerrado,
  //               ir para o próximo.
  //               Esta função só poderá retornar uma data de um ciclo em aberto.

  bEncontrouCicloAberto := False;
  sAnoMesCiclo          := sAnoReferencia+'/'+sMesReferencia;
  while not bEncontrouCicloAberto do
  begin
     case sTipoData of
       'N' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobranca Normal
       'A' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobrança Atrasada
       'D' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM;// Pagamento de Devolução
       'P' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Beneficio
       'B' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Abono
       'T' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Beneficio
       'O' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Abono
     end;

     if sSitFundacao = 'PT'
     then bCicloEncerrado := False
     else bCicloEncerrado := VerificaFechamento( StrToInt(sIdPessJur),
                                                 iIdModulo,
                                                 sAnoMesCiclo,
                                                 'E' ,cTipoEnvPrev);
     if bCicloEncerrado
     then begin
        bEncontrouCicloAberto := False;
        sAnoMesCiclo := ProximoAnoMes(StrToInt(Copy(sAnoMesCiclo,6,2)), StrToInt(Copy(sAnoMesCiclo,1,4)));
     end
     else bEncontrouCicloAberto := True;
  end;

  sMesReferencia := Copy(sAnoMesCiclo,6,2);
  sAnoReferencia := Copy(sAnoMesCiclo,1,4);

  if sSitFundacao = 'MS' then sSitFundacao := 'AT';

  if sMesReferencia = '13'
  then sMesReferencia := '12';

  if sSitFundacao = 'AS'
  then begin
         sTabela := 'FUNDACAO';
         sFiltro := ' AND (T.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')'; // LEOCM - 25062002 - TROQUEI IIDFUNDACAO POR IDEMPRESA
         sAux := 'Fundação';
       end
  else begin
         sTabela := 'PLANPREVPATRO';
         sFiltro := ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
                    ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')';
         sAux := 'Patrocinadora';
       end;

  sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF, '+
          //leocbs - 0401 - inicio
          ' TO_CHAR(CD.DATACOBNORMAL,''DD/MM/YYYY'') DATACOBNORMAL, '+
          ' TO_CHAR(CD.DATACOBATRASO,''DD/MM/YYYY'') DATACOBATRASO,'+
          ' TO_CHAR(CD.DATACOBDEVOLUCAO,''DD/MM/YYYY'') DATACOBDEVOLUCAO, '+
          ' TO_CHAR(CD.DATAPAGBENEF,''DD/MM/YYYY'') DATAPAGBENEF, '+
          ' TO_CHAR(CD.DATAPAGABONO,''DD/MM/YYYY'') DATAPAGABONO, '+
          ' TO_CHAR(CD.DATAPAGANTBENEF,''DD/MM/YYYY'') DATAPAGANTBENEF, '+
          ' TO_CHAR(CD.DATAPAGANTABONO,''DD/MM/YYYY'') DATAPAGANTABONO '+
          //leocbs - 0401 - fim
          ' FROM   CALENDDATAS CD, ' + sTabela + ' T' +
          ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
          ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
          sFiltro +
          ' AND    (T.IDCALENDARIO = CD.IDCALENDARIO)';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty
  then begin
     MsgDlg('Não existe calendário associado. Confira o cadastro. ','Informação',mtInformation,[mbOk,mbHelp],0);
     qry.Close;
     Exit;
  end;

  // Verifica Tipo de Cobrança
  case sTipoData of
    'N' : sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A' : sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D' : sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    'P' : sData := qry.FieldByName('DATAPAGBENEF').AsString;     // Pagamento de Beneficio
    'B' : sData := qry.FieldByName('DATAPAGABONO').AsString;     //  Pagamento de Abono
    'T' : sData := qry.FieldByName('DATAPAGANTBENEF').AsString;  // Pagamento de Antecipacao de Beneficio
    'O' : sData := qry.FieldByName('DATAPAGANTABONO').AsString;  // Pagamento de Antecipacao de Abono
  end;
 Result := sData;
end;//CriticaDataCobrancaSit

function VoltaMesCob(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sMesAno : string;
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else
             sMesAno := sMesReferencia + '/' + sAnoReferencia;
         {Fim - Mês Posterior}

          Result := sMesAno;

end;

procedure TiraQuery(qryAux : TwwQuery);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT 1 FROM DUAL');
   qryAux.Open;
end;

function SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;


function ProcSituacao(sCodSituacao : string) : string;
begin
   Result := '';
   if sCodSituacao = 'AT'
   then Result := 'Ativo'
   else if sCodSituacao = 'AS'
        then Result := 'Assistido'
        else if sCodSituacao = 'MA'
             then Result := 'Mantido'
             else if sCodSituacao = 'MP'
                  then Result := 'Mantido Parcial'
                  else if sCodSituacao = 'MS'
                       then Result := 'Mantido de Saldo de Conta'
                       else Result := 'Patrocinadora';
end;

function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;
var 
    D1,M1,A1,                {1234567890}
    D2,M2,A2:Integer;        {dd/mm/aaaa}
    TD1,TD2 :LongInt;

begin
   Result := False;
   try
     StrToDate(sData1);
   except
     Exit;
   end;


   try
     StrToDate(sData2); 
   except
     Exit;
   end;

   D1 := StrInt(copy(sData1,1,2));
   M1 := StrInt(copy(sData1,4,2));
   A1 := StrInt(copy(sData1,7,4));
   D2 := StrInt(copy(sData2,1,2));
   M2 := StrInt(copy(sData2,4,2));
   A2 := StrInt(copy(sData2,7,4));
   TD1 := (D1+TotDiasNoAno(M1,A1)+Trunc(365.25*(A1-1)));
   TD2 := (D2+TotDiasNoAno(M2,A2)+Trunc(365.25*(A2-1)));
   NumDias  := TD2-TD1;
   NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
   NumAnos  := Trunc(NumDias/365.25);
   Result := True;
end;


// CAMILLE - REFER - 25.08.1999
function  CalculaDataAposPrazo(psDataInicio : string; piPrazoEmMeses : integer) : string;
var iMesesASomar,
    iMes,
    iAno,
    iMesInicio : integer;
    sDataFinal : string;
begin
    Result := Trim(psDataInicio);
    if Trim(psDataInicio) = '' then Exit;

    iMesInicio   := StrToInt(Copy(psDataInicio,4,2));

    // Soma prazo ao mes
    iMesesASomar := piPrazoEmMeses;
    iMes := iMesInicio + piPrazoEmMeses;
    iAno := StrToInt(Copy(psDataInicio,7,4));

    if iMes > 12
    then begin
       iMesesASomar := iMesesASomar - ( 12 - iMesInicio);
       iMes := 1;
       inc(iAno);
       while iMesesASomar > 0 do
       begin
         iMes := iMes + iMesesASomar - 1;
         if iMes > 12
         then begin
            iMes := 1;
            inc(iAno);
            iMesesASomar := iMesesASomar -  12;
         end
         else if iMes < 12
              then iMesesASomar := iMesesASomar - ( 12 - iMes)
              else iMesesASomar := iMesesASomar - 12;
       end;
    end;

    sDataFinal := Copy(psDataInicio,1,2);
    if iMes <= 9
    then sDataFinal := sDataFinal + '/0'+IntToStr(iMes)
    else sDataFinal := sDataFinal + '/'+IntToStr(iMes);
    sDataFinal := sDataFinal + '/'+IntToStr(iAno);
    Result := sDataFinal;
end; // CalculaDataAposPrazo

function ValorProRataUltimo(psValorIntegral, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal) = '' then Exit;

   // Do inicio do mes até o dia informado
   iNumDiasProRata := StrToInt(Copy(psDataRefFinal,1,2));
   // CAMILLE - REFER - 03.09.1999
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psDataRefFinal,4,2));
   iAno := StrToInt(Copy(psDataRefFinal,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;
var dValorDiario,
    dValorSalario   : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefInicio) = '' then Exit;
   // Do dia informado até o final do mes (mes comercial), considerando o dia informado
   iNumDiasProRata := 30 - StrToInt(Copy(psDataRefInicio,1,2));
   iNumDiasProRata := iNumDiasProRata + 1;     
   iMes := StrToInt(Copy(psDataRefInicio,4,2));
   iAno := StrToInt(Copy(psDataRefInicio,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes  := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataMes(psValorIntegral, psAnoMesRef, psDataRefInicio, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal)  = '' then Exit;
   if Trim(psDataRefInicio) = '' then Exit;

   if Copy(psDataRefInicio,7,4)+'/'+Copy(psDataRefInicio,4,2) < psAnoMesRef
   then psDataRefInicio := '01/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);

   if Copy(psDataRefFinal,7,4)+'/'+Copy(psDataRefFinal,4,2) > psAnoMesRef
   then if Copy(psAnoMesRef,6,2) = '02'
        then psDataRefFinal := '28/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4)
        else psDataRefFinal := '30/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);

   // Do inicio do mes até o dia informado
   iNumDiasProRata := Trunc(StrToDate(psDataRefFinal) - StrToDate(psDataRefInicio) + 1);
    
   // CAMILLE - REFER - 03.09.1999
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psAnoMesRef,6,2));
   iAno := StrToInt(Copy(psAnoMesRef,1,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial
   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function FormaAnoMesTela( pCmbMes : TComboBox; pSpAno : TSpinEdit) : string;
var sAno,
    sMes    : string;
    sAnoMes : string;
begin
    Result := '';
    sAno   := Trim(pSpAno.Text);
    if pCmbMes.ItemIndex <= 8
    then sMes := '0'+IntToStr(pCmbMes.ItemIndex+1)
    else sMes := IntToStr(pCmbMes.ItemIndex+1);
    sAnoMes   := sAno+'/'+sMes;
    Result    := sAnoMes;
end; // FormaAnoMesTela

function RetornaFlagEvento(sDescEvento : string) : string;
var sFlgInternoEvento : string;
begin
   Result := '';
   sFlgInternoEvento := '';
   if (sDescEvento) = 'Demissão com Cancelamento'
   then sFlgInternoEvento := 'DC'
   else if (sDescEvento) = 'Demissão da Patrocinadora'
   then sFlgInternoEvento := 'DP'
   else if (sDescEvento) = 'Demissão com Manutenção de Contribuição'
   then sFlgInternoEvento := 'DM'
   else if (sDescEvento) = 'Demissão com Manutenção de Saldo de Conta'
   then sFlgInternoEvento := 'DS'
   else if (sDescEvento) = 'Manutenção Parcial'
   then sFlgInternoEvento := 'MP'
   else if (sDescEvento) = 'Afastamento'
   then sFlgInternoEvento := 'AF'
   else if (sDescEvento) = 'Tempo de Serviço'
   then sFlgInternoEvento := 'TS'
   else if (sDescEvento) = 'Idade'
   then sFlgInternoEvento := 'ID'
   else if (sDescEvento) = 'Incapacidade'
   then sFlgInternoEvento := 'IN'
   else if (sDescEvento) = 'Doença'
   then sFlgInternoEvento := 'DO'
   else if (sDescEvento) = 'Acidente'
   then sFlgInternoEvento := 'AC'
   else if (sDescEvento) = 'Outros Eventos Temporários'
   then sFlgInternoEvento := 'OE'
   else if (sDescEvento) = 'Cancelamento por Iniciativa do Participante'
   then sFlgInternoEvento := 'CP'
   else if (sDescEvento) = 'Cancelamento por Inadimplência'
   then sFlgInternoEvento := 'CI'
   else if (sDescEvento) = 'Registro de Inadimplência'
   then sFlgInternoEvento := 'RI'
   else if (sDescEvento) = 'Falecimento'
   then sFlgInternoEvento := 'FL'
   else if (sDescEvento) = 'Função de Risco'
   then sFlgInternoEvento := 'FR'
   else if (sDescEvento) = 'Encerramento de Benefício'
   then sFlgInternoEvento := 'EB'
   else if (sDescEvento) = 'Resgate a Pedido'
   then sFlgInternoEvento := 'RP'
   else if (sDescEvento) = 'Transferência de Reserva'
   then sFlgInternoEvento := 'TR'
   else if (sDescEvento) = 'Transferência de Plano'
   then sFlgInternoEvento := 'TP'
   else if (sDescEvento) = 'Mudança de Perfil'
   then sFlgInternoEvento := 'MU'
   else if (sDescEvento) = 'Retorno de Mantido Para Ativo'
   then sFlgInternoEvento := 'RA'
   else if (sDescEvento) = 'Inscrição do Participante'
   then sFlgInternoEvento := 'IP'
   else if (sDescEvento) = 'Reinscrição do Participante'
   then sFlgInternoEvento := 'RM'
   else if (sDescEvento) = 'Programa de Demissão Voluntária'
   then sFlgInternoEvento := 'PD'
   else if (sDescEvento) = 'Reclusao'
   then sFlgInternoEvento := 'RC';

   Result := sFlgInternoEvento;

end; // RetornaFlagEvento

function RetornaFlgIntSitPart (piIdSitPart : longint)  : string;
begin
   Result := '';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+IntToStr(piIdSitPart));
      Open;
      if not IsEmpty
      then Result := FieldbyName('FlgInterno').AsString;
      Close;
   end;
end;

function BuscaCampoTabela ( psNomeCampo, psNomeTabela, psCondicao : string ) : string;
begin
   Result := '';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT '+psNomeCampo+' FROM '+ psNomeTabela+' WHERE '+psCondicao );
      Open;
      if not IsEmpty
      then Result := FieldbyName(psNomeCampo).AsString;
      Close;
   end;
end;

function BuscaMesCobrancaLote ( piIdLote : longint; psAnoMesCobrancaDefault : string ) : string;
begin
   Result := psAnoMesCobrancaDefault;
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(piIdLote) );
      Open;
      if not IsEmpty
      then Result := FieldbyName('MESREFERENCIA').AsString;
      Close;
   end;
end;

//P.RAMOS - REFER - 04.07.2001
function PegaFlgIncluiMesConc(pidlote : integer) : integer;
begin
  Result:=1;
  try
    with dtmAPrev.qryAux2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FLGINCLUIMESCONC FROM CTRLINTERFACE WHERE IDLOTE = '+inttostr(pidlote));
      Open;
      if not IsEmpty then
        Result := Fields[0].asinteger;
      Close;
    end;
  except
    Result:=1;
  end;
end;

function PatroPermiteAlterarDados( piIdPessJur, piIdPessoa : longint ) : boolean ;
begin
   Result := True;
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FLGALTERADADOS FROM PATRO WHERE IDPESSOA = '+IntToStr(piIdPessJur));
      Open;
      if (IsEmpty) or (FieldbyName('FLGALTERADADOS').AsInteger = 1)
      then Exit;

      // Neste ponto o FLGALTERADADOS é igual a ZERO, ou seja, nao pode alterar dados de
      // ATIVOS e MANTIDOS PARCIAIS

      // Agora o sistema deve verificar se a pessoa é ATIVA ou MANTIDA PARCIAL
      Close;
      SQL.Clear;
      SQL.Add(' SELECT SP.FLGINTERNO '+
              ' FROM   PARTPREVPLAN PP, SITPART SP '+
              ' WHERE  PP.IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    PP.IDPESSOA      = '+IntToStr(piIdPessoa)+
              ' AND    PP.FLGDESATIVADO = 0 '+
              ' AND    SP.IDSITPART     = PP.IDSITPART ');
      Open;
      if  IsEmpty // a pessoa é só elegível
      then Result := False
      else if (FieldByName('FLGINTERNO').AsString = 'AT') or (FieldByName('FLGINTERNO').AsString = 'MP')
           then Result := False
           else Result := True;
      Close;
   end
end;


function ValidaNumProcesso(num: string): boolean;
var
 n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
 d1,d2: integer;
 digitado, calculado: string;
begin

 if length(num) < 10 then
 begin
   ValidaNumProcesso:=false;
   exit;
 end;

 n1:=StrToInt(num[1]);
 n2:=StrToInt(num[2]);
 n3:=StrToInt(num[3]);
 n4:=StrToInt(num[4]);
 n5:=StrToInt(num[5]);
 n6:=StrToInt(num[6]);
 n7:=StrToInt(num[7]);
 n8:=StrToInt(num[8]);
 n9:=StrToInt(num[9]);


 d1:=n9*9+n8*8+n7*7+n6*6+n5*5+n4*4+n3*3+n2*2+n1*9;
 d1:= (d1 mod 11);
 if d1>=10 then d1:=0;

 calculado:=inttostr(d1);
 digitado:=num[10];

 if calculado=digitado then
   ValidaNumProcesso:=true
 else
   ValidaNumProcesso:=false;

end;



end.


