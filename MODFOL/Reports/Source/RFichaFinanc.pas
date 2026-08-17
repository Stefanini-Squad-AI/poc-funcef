// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{-----------------------------------------------------------------------------------------------
Rotina......:
Nº KINTANA..: 81086
Data........: 12/03/2019
Responsável.: Fábio Sampaio
Descrição...: Otimização na forma de obtenção dos dados para evitar o erro de
              "Temporary table resource limit".
------------------------------------------------------------------------------------------------
Rotina......: GerarDadosRelat, CrmRptCMBeforePrint
Nº SOL......: 201660      
Nº KINTANA..: 1963920
Data........: 27/09/2013
Responsável.: Felipe A. Santos
Descrição...: troquei o componente de consulta do relatório de SQL para Query pois quando
              a consulta retornava muitos registros acontecia um erro de insuficient memory,
              por trazer tudo de uma vez na memória.
------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 151113
Nº KINTANA..: 1104236
Data........: 19/01/2010
Responsável.: Thaise Amaral Martins
Descrição...: Criada função AcertaLista para quebrar os dados informados na clausula 'IN', já
              que a mesma recebe em sua lista quantidade de dados acima de 1000.
------------------------------------------------------------------------------------------------
Autor(a)    :  Ádler Teodoro de Souza
Data        :  19/02/2009
Pendência   : SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//----------------------------------------------------------------------------------------------}

unit RFichaFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptFichaFinanc = class(TFrmCmReport)
    rpFichaFinanc: TppReport;
    rpFichaFinancHdrBnd: TppHeaderBand;
    rpFichaFinancLblMESREF: TppLabel;
    rpFichaFinancDBText1: TppDBText;
    rpFichaFinancDBText2: TppDBText;
    rpFichaFinancDBText3: TppDBText;
    rpFichaFinancDBText4: TppDBText;
    rpFichaFinancLabel2: TppLabel;
    rpFichaFinancLabel3: TppLabel;
    rpFichaFinancLabel1: TppLabel;
    rpFichaFinancDBText5: TppDBText;
    rpFichaFinancSysVar1: TppSystemVariable;
    rpFichaFinancSysVar2: TppSystemVariable;
    rpFichaFinancDtlBnd: TppDetailBand;
    rpFichaFinancFootBnd: TppFooterBand;
    rpFichaFinancSmryBnd: TppSummaryBand;
    rpFichaFinancGroupEMPRESA: TppGroup;
    rpFichaFinancGrpHdrBnd1: TppGroupHeaderBand;
    rpFichaFinancGrpFootBnd4: TppGroupFooterBand;
    rpFichaFinancGroupFUNC: TppGroup;
    rpFichaFinancGrpHdrBnd2: TppGroupHeaderBand;
    rpFichaFinancLabel4: TppLabel;
    rpFichaFinancDBText6: TppDBText;
    rpFichaFinancDBText50: TppDBText;
    rpFichaFinancLabel5: TppLabel;
    rpFichaFinancLabel6: TppLabel;
    rpFichaFinancDBText8: TppDBText;
    rpFichaFinancDBText7: TppDBText;
    rpFichaFinancLabel10: TppLabel;
    rpFichaFinancDBText24: TppDBText;
    rpFichaFinancLine1: TppLine;
    rpFichaFinancGrpFootBnd3: TppGroupFooterBand;
    rpFichaFinancLine2: TppLine;
    rpFichaFinancLabel9: TppLabel;
    rpFichaFinancLine4: TppLine;
    rpFichaFinancDBCalc14: TppDBCalc;
    rpFichaFinancDBCalc15: TppDBCalc;
    rpFichaFinancDBCalc16: TppDBCalc;
    rpFichaFinancDBCalc17: TppDBCalc;
    rpFichaFinancDBCalc18: TppDBCalc;
    rpFichaFinancDBCalc19: TppDBCalc;
    rpFichaFinancDBCalc20: TppDBCalc;
    rpFichaFinancDBCalc21: TppDBCalc;
    rpFichaFinancDBCalc22: TppDBCalc;
    rpFichaFinancDBCalc23: TppDBCalc;
    rpFichaFinancDBCalc24: TppDBCalc;
    rpFichaFinancDBCalc25: TppDBCalc;
    rpFichaFinancDBCalc26: TppDBCalc;
    rpFichaFinancGroupPROVDESC: TppGroup;
    rpFichaFinancGrpHdrBnd3: TppGroupHeaderBand;
    rpFichaFinancDBText9: TppDBText;
    rpFichaFinancLine3: TppLine;
    lblTituloTotal: TppLabel;
    lblTituloMES01: TppLabel;
    lblTituloMES02: TppLabel;
    lblTituloMES03: TppLabel;
    lblTituloMES04: TppLabel;
    lblTituloMES05: TppLabel;
    lblTituloMES06: TppLabel;
    lblTituloMES07: TppLabel;
    lblTituloMES08: TppLabel;
    lblTituloMES09: TppLabel;
    lblTituloMES10: TppLabel;
    lblTituloMES11: TppLabel;
    lblTituloMES12: TppLabel;
    rpFichaFinancGrpFootBnd2: TppGroupFooterBand;
    rpFichaFinancLabel8: TppLabel;
    rpFichaFinancDBCalc1: TppDBCalc;
    rpFichaFinancDBCalc2: TppDBCalc;
    rpFichaFinancDBCalc3: TppDBCalc;
    rpFichaFinancDBCalc4: TppDBCalc;
    rpFichaFinancDBCalc5: TppDBCalc;
    rpFichaFinancDBCalc6: TppDBCalc;
    rpFichaFinancDBCalc7: TppDBCalc;
    rpFichaFinancDBCalc8: TppDBCalc;
    rpFichaFinancDBCalc9: TppDBCalc;
    rpFichaFinancDBCalc10: TppDBCalc;
    rpFichaFinancDBCalc11: TppDBCalc;
    rpFichaFinancDBCalc12: TppDBCalc;
    rpFichaFinancDBCalc13: TppDBCalc;
    rpFichaFinancGroupRUB: TppGroup;
    rpFichaFinancGrpHdrBnd4: TppGroupHeaderBand;
    rpFichaFinancGrpFootBnd1: TppGroupFooterBand;
    rpFichaFinancDBText10: TppDBText;
    rpFichaFinancDBText12: TppDBText;
    rpFichaFinancDBText13: TppDBText;
    rpFichaFinancDBText14: TppDBText;
    rpFichaFinancDBText15: TppDBText;
    rpFichaFinancDBText16: TppDBText;
    rpFichaFinancDBText17: TppDBText;
    rpFichaFinancDBText18: TppDBText;
    rpFichaFinancDBText19: TppDBText;
    rpFichaFinancDBText20: TppDBText;
    rpFichaFinancDBText21: TppDBText;
    rpFichaFinancDBText22: TppDBText;
    rpFichaFinancDBText23: TppDBText;
    rpFichaFinancDBText25: TppDBText;
    ppFichaFinanc: TppBDEPipeline;
    dsFichaFinanc: TwwDataSource;
    sqlFichaFinanc: TCMSqlParams;
    CdsFichaFinanc: TCMClientDataSet;
    cdsFiltroAux: TCMClientDataSet;
    CdsFichaFinancAux: TCMClientDataSet;
    sqlEstab: TCMSqlParams;
    cdsEstab: TCMClientDataSet;
    dsEstab: TwwDataSource;
    ppEstab: TppBDEPipeline;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpFichaFinancSmryBndAfterPrint(Sender: TObject);
    procedure CdsFichaFinancAfterScroll(DataSet: TDataSet);
  private
    //procedure GerarDadosRelat; // Alterado por FHBS - 04/03/2019 - SIG81086 - Comentado
    FSQLAux: TStringList;        // Alterado por FHBS - 04/03/2019 - SIG81086
    Function AcertaLista(const pCampo,pLista : String) : String; //Thaise SOL151113 - Função criada para quebrar os dados informados na clausula 'IN'
  end;

var
  RptFichaFinanc: TRptFichaFinanc;

implementation

uses dCds, fAguarde, uSistema, uCtrlFuncoesRH, uCtrlUsoGeralRH,
     uCtrlPadroes {, uCMFileUtils}; // Alterado por FHBS - 04/03/2019 - SIG81086

{$R *.DFM}

procedure TRptFichaFinanc.CrmRptCMBeforePrint(Sender: TObject);
var
  // Alterado por FHBS - 04/03/2019 - SIG81086
  sDataRef: String;
  iContRec, iCol: Integer;
  sNomePessoa: String;
  sFiltroAux: String;
  sSQLAux: String;
  // Fim - Alterado por FHBS - 04/03/2019 - SIG81086

  // Alterado por FHBS - 04/03/2019 - SIG81086
  function MesCurto_IncDataAM(Data: string; Meses: integer): string;
  var
    Mes: Integer;
  begin
    Mes := StrToInt( Copy(FU.IncDataAM(Data, Meses), 6, 2) );
    Result := MesCurto[Mes];
  end;
  // Fim - Alterado por FHBS - 04/03/2019 - SIG81086

begin
  inherited;
  // Alterado por FHBS - 04/03/2019 - SIG81086
  sDataRef := CmpRptCM.ParamByName('AnoRef').asString +'/'+FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger);
  // Fim - Alterado por FHBS - 04/03/2019 - SIG81086

  // Alterado por FHBS - 12/03/2019 - SIG81086
  if cdsEstab.Active then cdsEstab.Close;
  with (sqlEstab.SQL) do
  begin
    Clear;
    Add('SELECT PJ.IDPESSOA AS IDESTAB,');
    Add('       RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('       DECODE(PJ.NUMDOCUMENTO, NULL, '''', ''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('       ES.CODESTADO AS UF,');
    Add('       RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO), '''',');
    Add('             DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO), '''', '''',');
    Add('             ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
    Add('             ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('       RTRIM(E.LOGRADOURO) || '', '' || E.NUMERO ||');
    Add('         DECODE(RTRIM(E.COMPLEMENTO), NULL, '''', '' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('         DECODE(RTRIM(E.BAIRRO), NULL, '''', '' - '' || RTRIM(E.BAIRRO)) ||');
    Add('         DECODE(RTRIM(CIDADES.NOME), NULL, '''', '' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('         '' - CEP: '' || RTRIM(SUBSTR(E.CEP, 1, 5)) || ''-'' || RTRIM(SUBSTR(E.CEP, 6, 3)) AS ENDERECO');
    Add('  FROM PESSOA PJ,');
    Add('       ENDPESS E,');
    Add('       CIDADES,');
    Add('       ESTADO ES,');
    Add('       (SELECT D.IDPESSOA,');
    Add('               TD.CODDOCUMENTO,');
    Add('               D.NUMDOCUMENTO,');
    Add('               UPPER(TD.SIGLADOCUMENTO)');
    Add('          FROM DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('         WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'')');
    Add('           AND (TD.IDDOCUMENTO = D.IDDOCUMENTO)) ESTADUAL,');
    Add('       (SELECT D.IDPESSOA,');
    Add('               TD.CODDOCUMENTO,');
    Add('               D.NUMDOCUMENTO,');
    Add('               UPPER(TD.SIGLADOCUMENTO)');
    Add('          FROM DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('         WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'')');
    Add('           AND (TD.IDDOCUMENTO = D.IDDOCUMENTO)) MUNICIPAL');
    Add(' WHERE (' + AcertaLista('PJ.IDPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString) + ')');
    Add('   AND (PJ.IDENDCOMERCIAL = E.IDENDERECO)');
    Add('   AND (PJ.IDPESSOA = E.IDPESSOA)');
    Add('   AND (E.IDCIDADES = CIDADES.IDCIDADES)');
    Add('   AND (CIDADES.IDESTADO = ES.IDESTADO)');
    Add('   AND (PJ.IDPESSOA = ESTADUAL.IDPESSOA(+))');
    Add('   AND (PJ.IDPESSOA = MUNICIPAL.IDPESSOA(+))');
  end;
  sqlEstab.Open;
  // Fim - Alterado por FHBS - 12/03/2019 - SIG81086

  // Monta Query Auxiliar
  // Alterado por FHBS - 04/03/2019 - SIG81086
  with (FSQLAux) do
  //with (dmCds.Qry.SQL) do // Felipe A. Santos SOL 201660 KTN 1963920 troca de componente de consulta
  // Fim - Alterado por FHBS - 04/03/2019 - SIG81086
  begin
    Clear;
    Add('SELECT ');
    Add('       IDESTAB,'); // Alterado por FHBS - 12/03/2019 - SIG81086
    Add('       MATRICULA, FUNCIONARIO, NOMECENTROCUSTO, NOMECARGO, RUBRICA, TIPORUBRICA,');
    Add('       DECODE(TIPORUBRICA, 0, ''PROVENTOS'', 1, ''DESCONTOS'', 2, ''OUTROS'', null) AS PROVENTODESCONTO,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 0))+', VALOR, 0)) AS VALOR_01,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 1))+', VALOR, 0)) AS VALOR_02,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 2))+', VALOR, 0)) AS VALOR_03,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 3))+', VALOR, 0)) AS VALOR_04,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 4))+', VALOR, 0)) AS VALOR_05,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 5))+', VALOR, 0)) AS VALOR_06,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 6))+', VALOR, 0)) AS VALOR_07,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 7))+', VALOR, 0)) AS VALOR_08,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 8))+', VALOR, 0)) AS VALOR_09,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 9))+', VALOR, 0)) AS VALOR_10,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef,10))+', VALOR, 0)) AS VALOR_11,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef,11))+', VALOR, 0)) AS VALOR_12,');
    Add('       SUM(VALOR) AS TOT_LINHA,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 0))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_01,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 1))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_02,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 2))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_03,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 3))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_04,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 4))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_05,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 5))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_06,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 6))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_07,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 7))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_08,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 8))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_09,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef, 9))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_10,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef,10))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_11,');
    Add('       SUM(DECODE(MES, '+QuotedStr(FU.IncDataAM(sDataRef,11))+', DECODE(TIPORUBRICA, 1, -1, 1) * VALOR, 0)) AS VALOR_TOT_12,');
    Add('       SUM(DECODE(TIPORUBRICA, 1, -1, 1) * VALOR) AS TOT_LIQUIDO');
    Add('FROM (');
    Add('SELECT F.IDESTAB,'); // Alterado por FHBS - 04/03/2019 - SIG81086 - Retirado o DISTINCT
    Add('  HIST.MES,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME AS FUNCIONARIO,');
    Add('  CC.NOME AS NOMECENTROCUSTO,');
    Add('  C.TITULO AS NOMECARGO,');
    Add('  HIST.DESCRPROVDESC AS RUBRICA,');
    Add('  HIST.FLGDESCONTO AS TIPORUBRICA,');
    Add('  HIST.VALOR');
    Add('FROM');
    // Alterado por FHBS - 11/03/2019 - SIG81086
    //Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES, CENTCUST CC,');
    //Add('  CARGO C, ESTADO ES, SITFUNC ST,');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, CENTCUST CC, CARGO C, SITFUNC ST,');
    // Fim - Alterado por FHBS - 11/03/2019 - SIG81086 
    // -------------------------------------------------------------------------------- //
{ // Alterado por FHBS - 11/03/2019 - SIG81086
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
    Add('         (D.IDPESSOA       IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');
    Add( '(' + AcertaLista('D.IDPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString) +')' +' AND ');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, UPPER(TD.SIGLADOCUMENTO)');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
    //Add('         (D.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('(' + AcertaLista('D.IDPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString) +')' +' AND ');

    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL,'); 
} // Alterado por FHBS - 11/03/2019 - SIG81086
    // -------------------------------------------------------------------------------- //
    Add('  (SELECT');  // Alterado por FHBS - 04/03/2019 - SIG81086 - Retirado o DISTINCT
    Add('     F.IDPESSOA, H.MES, H.CODPROVDESC, RP.DESCRPROVDESC, P.FLGDESCONTO,');
    Add('     SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, RUBRICAXPESS RP, PROVDESC P, FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE');
    //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
    //Add('     (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('(' + AcertaLista('F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString) +')' +' AND ');

    Add('  /*##FiltroAux##*/'); // Alterado por FHBS - 04/03/2019 - SIG81086 - Filtro Auxiliar para quebrar o retorno das informações devido incompatibilidade com o Tibero

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
        //Add('     (F.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
        Add('(' + AcertaLista('F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString) +')' +' AND ')
      else
        Add('     (F.IDPESSOA        = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
          //Add('  (F.CODCENTROCUSTO IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          Add('(' + AcertaLista('F.CODCENTROCUSTO',CmpRptCM.ParamByName('ListaCodCCusto').asString) +')' +' AND ')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        begin
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
            //Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            Add('(' + AcertaLista('F.CODCENTROCUSTO',CtrlUsoGeralRH.UsuXCCusto) +')' +' AND ')
          else
            Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
          //Add('     (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
          Add('(' + AcertaLista('ST.TIPOSIT', CmpRptCM.ParamByName('SitFunc').asString) +')' +' AND ')
        else
          Add('     (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
          //Add('     (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
          Add('(' + AcertaLista('F.TIPOCONTRATO', CmpRptCM.ParamByName('TipoContrato').asString) +')' +' AND ')
        else
          Add('     (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    if not(CmpRptCM.ParamByName('SelRubricaApoio').asBoolean) then
      Add('     (P.FLGDESCONTO     < 2) AND');

    if (CmpRptCM.ParamByName('ListaIdRubrica').asString <> '') then
    begin
      // Felipe A. Santos SOL 201660 KTN 1963920
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
         Add('(' + AcertaLista('H.IDRUBRICA', CmpRptCM.ParamByName('ListaIdRubrica').asString) +')' +' AND ')
      else
         Add('     (H.IDRUBRICA     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

      { comentado para passar o campo IDRUBRICA na select pois com o codprovdesc estava trazendo
        rubricas que não foram selecionadas pois existem codprovdesc iguais.
        
      if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
        //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
        //Add('     (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
        Add('(' + AcertaLista('H.CODPROVDESC', CmpRptCM.ParamByName('ListaIdRubrica').asString) +')' +' AND ')
      else
        Add('     (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');
      }
      // Felipe A. Santos SOL 201660 KTN 1963920 - fim
    end
    else
      Add('     (H.IDPESSJUR       = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    Add('     (H.MES       BETWEEN ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ' AND '+
      QuotedStr(FU.IncDataAM(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger),11))+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
        //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
        //Add('  (H.IDMOTIVO       IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
        Add('(' + AcertaLista('H.IDMOTIVO', CmpRptCM.ParamByName('ListaTipoFolha').asString) +')' +' AND ')
      else
        Add('  (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');
    end;

    Add('     (H.IDMODULO        = 21) AND');
    Add('     (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('     (F.IDPESSOA        = H.IDPESSOA) AND');
    Add('     (H.IDRUBRICA       = P.IDPROVENTO) AND');
    Add('     (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    Add('     (H.IDPESSJUR       = RP.IDPESSOA)');
    Add('   GROUP BY');
    Add('     F.IDPESSOA, H.MES, H.CODPROVDESC, RP.DESCRPROVDESC, P.FLGDESCONTO) HIST');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
    //Add('  (PJ.IDPESSOA        IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');
    Add('(' + AcertaLista('PJ.IDPESSOA', CmpRptCM.ParamByName('ListaIdEstab').asString) +')' +' AND ');

    Add('  /*##FiltroAux##*/'); // Alterado por FHBS - 04/03/2019 - Filtro Auxiliar para quebrar o retorno das informações devido incompatibilidade com o Tibero

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
        //Add('  (F.IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
        Add('(' + AcertaLista('F.IDPESSOA', CmpRptCM.ParamByName('ListaIdFunc').asString) +')' +' AND ')
      else
        Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

      Add('  (F.IDSITFUNC         = ST.IDSITFUNC) AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
          //Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          Add('(' + AcertaLista('F.CODCENTROCUSTO', CtrlUsoGeralRH.UsuXCCusto) +')' +' AND ')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
          //Add('  (ST.TIPOSIT         IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
          Add('(' + AcertaLista('ST.TIPOSIT', CmpRptCM.ParamByName('SitFunc').asString) +')' +' AND ')
        else
      Add('  (ST.TIPOSIT          = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          //Thaise SOL151113 - Quebrando os IDs para garantir que o IN receba menos de 1000 dados
          //Add('  (F.TIPOCONTRATO     IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
          Add('(' + AcertaLista('F.TIPOCONTRATO', CmpRptCM.ParamByName('TipoContrato').asString) +')' +' AND ')
        else
          Add('  (F.TIPOCONTRATO      = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

      Add('  (ST.IDSITFUNC        = F.IDSITFUNC) AND');
    end;

    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDCARGO           = C.IDCARGO) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA          = HIST.IDPESSOA) ');
{ // Alterado por FHBS - 11/03/2019 - SIG81086
    Add('  (PJ.IDENDCOMERCIAL   = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA         = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA         = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA         = MUNICIPAL.IDPESSOA(+))'); }
    Add(')');
    Add('GROUP BY IDESTAB, MATRICULA, FUNCIONARIO, NOMECENTROCUSTO, NOMECARGO, RUBRICA, TIPORUBRICA');
    // Fim - Alterado por FHBS - 04/03/2019 - SIG81086

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      { // Alterado por FHBS - 04/03/2019 - SIG81086
      0 : Add('  UPPER(FUNCIONARIO), FLGDESCONTO, UPPER(RUBRICA), MES');
      1 : Add('  MATRICULA, FLGDESCONTO, UPPER(RUBRICA), MES'); }
      0 : Add('  UPPER(FUNCIONARIO), TIPORUBRICA, UPPER(RUBRICA)');
      1 : Add('  MATRICULA, TIPORUBRICA, UPPER(RUBRICA)');
      // Fim - Alterado por FHBS - 04/03/2019 - SIG81086
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

{ // Alterado por FHBS - 04/03/2019 - SIG81086
  dmCds.Qry.Open; // Felipe A. Santos SOL 201660 KTN 1963920 troca de componente de consulta

  // Monta Query Principal
  GerarDadosRelat;

  dmCds.Qry.Close; // Felipe A. Santos SOL 201660 KTN 1963920

  frmAguarde.Max := CdsFichaFinanc.RecordCount;
  frmAguarde.Min := 0;
} // Fim - Alterado por FHBS - 04/03/2019 - SIG81086

  // Especifico Configurações do Relatório
  rpFichaFinancLblMESREF.Caption := 'FICHA FINANCEIRA POR FUNCIONÁRIO - ' +
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
    CmpRptCM.ParamByName('AnoRef').asString +' A '+
    Copy(FU.IncData('01/'+ FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
    CmpRptCM.ParamByName('AnoRef').asString,0,11,0),4,7);

  // Alterado por FHBS - 11/03/2019 - SIG81086
  lblTituloMES01.Caption := MesCurto_IncDataAM(sDataRef, 0);
  lblTituloMES02.Caption := MesCurto_IncDataAM(sDataRef, 1);
  lblTituloMES03.Caption := MesCurto_IncDataAM(sDataRef, 2);
  lblTituloMES04.Caption := MesCurto_IncDataAM(sDataRef, 3);
  lblTituloMES05.Caption := MesCurto_IncDataAM(sDataRef, 4);
  lblTituloMES06.Caption := MesCurto_IncDataAM(sDataRef, 5);
  lblTituloMES07.Caption := MesCurto_IncDataAM(sDataRef, 6);
  lblTituloMES08.Caption := MesCurto_IncDataAM(sDataRef, 7);
  lblTituloMES09.Caption := MesCurto_IncDataAM(sDataRef, 8);
  lblTituloMES10.Caption := MesCurto_IncDataAM(sDataRef, 9);
  lblTituloMES11.Caption := MesCurto_IncDataAM(sDataRef,10);
  lblTituloMES12.Caption := MesCurto_IncDataAM(sDataRef,11);

  // Obtendo registros com nome e idpessoa para criação do filtro.
  sSQLAux := ' select idpessoa, nome from pessoa' +
             '  where ' + AcertaLista('idpessoa',CmpRptCM.ParamByName('TOTALIdFunc').asString) +
             ' order by nome, idpessoa';
  cdsFiltroAux.Data := Padroes.GetDataPacket(sSQLAux);

  CdsFichaFinanc.IndexName := '';
  if (CdsFichaFinanc.IndexDefs.Count > 0) then
    CdsFichaFinanc.DeleteIndex('Index1');
  
  // Criando o dataset sem dados
  sSQLAux := StringReplace(FSQLAux.Text, '/*##FiltroAux##*/', '(1 = 0) AND', [rfReplaceAll]);
  CdsFichaFinanc.Data := Padroes.GetDataPacket(sSQLAux);


  sNomePessoa := '';
  sFiltroAux  := '';

  iContRec := 0;
  cdsFiltroAux.First;
  while not cdsFiltroAux.Eof do
  begin
    iContRec := iContRec + 1;

    if sFiltroAux <> '' then sFiltroAux := sFiltroAux + ',';
    sFiltroAux := sFiltroAux + cdsFiltroAux.FieldByName('idPessoa').AsString;

    sNomePessoa := cdsFiltroAux.FieldByName('Nome').AsString;

    cdsFiltroAux.Next;

    // Se o nome for igual, considerar no mesmo grupo de impressão;
    if (not cdsFiltroAux.Eof) and (iContRec > 50) then
      if (sNomePessoa = cdsFiltroAux.FieldByName('Nome').AsString) then
        Continue;

    // Abrindo o grupo de filtro e copiando os dados para o cds de impressão (CdsFichaFinanc)
    if (cdsFiltroAux.Eof) or (iContRec > 50) then
    begin
      sSQLAux := StringReplace(FSQLAux.Text, '/*##FiltroAux##*/', '(F.IDPESSOA in ('+sFiltroAux+')) AND', [rfReplaceAll]);
      CdsFichaFinancAux.Data := Padroes.GetDataPacket(sSQLAux);

      CdsFichaFinancAux.First;
      while not CdsFichaFinancAux.Eof do
      begin
        CdsFichaFinanc.Append;
        for iCol := 0 to CdsFichaFinancAux.FieldCount - 1 do
          CdsFichaFinanc.Fields[iCol].Value := CdsFichaFinancAux.Fields[iCol].Value;
        CdsFichaFinanc.Post;
        CdsFichaFinancAux.Next;
      end;
      CdsFichaFinancAux.Close;

      iContRec := 0;
      sNomePessoa := '';
      sFiltroAux  := '';
    end;

  end;

  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsFichaFinanc.AddIndex('Index1', 'FUNCIONARIO;TIPORUBRICA;RUBRICA', []);
    1 : CdsFichaFinanc.AddIndex('Index1', 'MATRICULA;TIPORUBRICA;RUBRICA', []);
  end;
  CdsFichaFinanc.IndexName := 'Index1';
  CdsFichaFinanc.First;

  frmAguarde.Min := 0;
  frmAguarde.Max := CdsFichaFinanc.RecordCount;
  frmAguarde.Pos := 0;
  // Fim - Alterado por FHBS - 11/03/2019 - SIG81086
end;

procedure TRptFichaFinanc.CdsFichaFinancAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaFinanc.rpFichaFinancSmryBndAfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

{ // Alterado por FHBS - 04/03/2019 - SIG81086
procedure TRptFichaFinanc.GerarDadosRelat;
const
  MES: array[1..12] of string[2] =
    ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');
  ANOMES: array[1..12] of string[7] =
    ('2000/03', '2000/04', '2000/05', '2000/06', '2000/07', '2000/08', '2000/09',
     '2000/10', '2000/11', '2000/12' ,'2001/01' ,'2001/02');
var
  c, iTipoRubrica: integer;
  sDataRef, sRubrica, sMatricula: string;
  rProv, rDesc, rOutr, rTot: array[1..12] of real;
  rTotAux: real;
begin
  // Felipe A. Santos SOL 201660 KTN 1963920 (alteração dmCds.Cds para dmCds.Qry)

  CdsFichaFinanc.IndexName := '';
  if (CdsFichaFinanc.IndexDefs.Count > 0) then
    CdsFichaFinanc.DeleteIndex('Index1');

  sqlFichaFinanc.Open;
  if not(dmCds.Qry.IsEmpty) then
  begin
    // Arrumo os Ponteiros dos meses
    sDataRef := CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger);

    for c:=1 to 12 do
    begin
      ANOMES[c] := sDataRef;
      MES[c] := Copy(sDataRef,6,2);
      sDataRef := FU.IncDataAM(sDataRef,1);
    end;

    // Zero todos os Totais
    for c:=1 to 12 do
      rTot[c] := 0;

    // LOOP para todas as linhas
    repeat
      CdsFichaFinanc.Insert;
      CdsFichaFinanc.FieldByName('EMPRESA').asString := dmCds.Qry.FieldByName('EMPRESA').asString;
      CdsFichaFinanc.FieldByName('CGC').asString := dmCds.Qry.FieldByName('CGC').asString;
      CdsFichaFinanc.FieldByName('UF').asString := dmCds.Qry.FieldByName('UF').asString;
      CdsFichaFinanc.FieldByName('INSCRICAO').asString := dmCds.Qry.FieldByName('ESTADUALMUNICIPAL').asString;
      CdsFichaFinanc.FieldByName('ENDERECO').asString := dmCds.Qry.FieldByName('ENDERECO').asString;
      CdsFichaFinanc.FieldByName('MATRICULA').asString := dmCds.Qry.FieldByName('MATRICULA').asString;
      CdsFichaFinanc.FieldByName('FUNCIONARIO').asString := dmCds.Qry.FieldByName('FUNCIONARIO').asString;
      CdsFichaFinanc.FieldByName('NOMECENTROCUSTO').asString := dmCds.Qry.FieldByName('NOMECENTROCUSTO').asString;
      CdsFichaFinanc.FieldByName('NOMECARGO').asString := dmCds.Qry.FieldByName('NOMECARGO').asString;
      CdsFichaFinanc.FieldByName('RUBRICA').asString := dmCds.Qry.FieldByName('RUBRICA').asString;
      CdsFichaFinanc.FieldByName('TIPORUBRICA').asInteger := dmCds.Qry.FieldByName('TIPORUBRICA').asInteger;

      case (dmCds.Qry.FieldByName('TIPORUBRICA').asInteger) of
        0 : CdsFichaFinanc.FieldByName('PROVENTODESCONTO').asString := 'PROVENTOS';
        1 : CdsFichaFinanc.FieldByName('PROVENTODESCONTO').asString := 'DESCONTOS';
        2 : CdsFichaFinanc.FieldByName('PROVENTODESCONTO').asString := 'OUTROS';
      end;

      // Labels dos Meses escolhidos pelo usuário
      for c:=1 to 12 do
        CdsFichaFinanc.FieldByName('MES_'+FU.PoeZero(c)).asString := MesCurto[StrToInt(MES[c])];

      iTipoRubrica := dmCds.Qry.FieldByName('TIPORUBRICA').asInteger;
      sRubrica := Trim(dmCds.Qry.FieldByName('RUBRICA').asString);
      sMatricula := dmCds.Qry.FieldByName('MATRICULA').asString;

      // Zero totalizadores das Rubricas
      for c:=1 to 12 do
      begin
        rProv[c] := 0;
        rDesc[c] := 0;
        rOutr[c] := 0;
      end;

      // Preencho UMA Linha do MÊS ATUAL para a Rubrica do Funcionário
      repeat
        for c:=1 to 12 do
          if (ANOMES[c] = dmCds.Qry.FieldByName('MES').asString) then
            break;

        case (dmCds.Qry.FieldByName('TIPORUBRICA').asInteger) of
          0 : rProv[c] := dmCds.Qry.FieldByName('VALOR').asFloat;
          1 : rDesc[c] := dmCds.Qry.FieldByName('VALOR').asFloat;
          2 : rOutr[c] := dmCds.Qry.FieldByName('VALOR').asFloat;
        end;

        dmCds.Qry.Next;
      until (sMatricula <> dmCds.Qry.FieldByName('MATRICULA').asString)     or
            (sRubrica   <> Trim(dmCds.Qry.FieldByName('RUBRICA').asString)) or
            (dmCds.Qry.EOF);

      case (iTipoRubrica) of
        0 : begin
              for c:=1 to 12 do
                CdsFichaFinanc.FieldByName('VALOR_' +FU.PoeZero(c)).asFloat := rProv[c];

              for c:=1 to 12 do
                rTot[c] := rTot[c] + rProv[c];
            end;
        1 : begin
              for c:=1 to 12 do
                CdsFichaFinanc.FieldByName('VALOR_' +FU.PoeZero(c)).asFloat := rDesc[c];

              for c:=1 to 12 do
                rTot[c] := rTot[c] - rDesc[c];
            end;
        2 : for c:=1 to 12 do
              CdsFichaFinanc.FieldByName('VALOR_' +FU.PoeZero(c)).asFloat := rOutr[c];
      end;

      rTotAux := 0;
      for c:=1 to 12 do
        rTotAux := rTotAux + (rProv[c] - rDesc[c]) + rOutr[c];

      CdsFichaFinanc.FieldByName('TOT_LINHA').asFloat := rTotAux;

      if (sMatricula <> dmCds.Qry.FieldByName('MATRICULA').asString) or
         (dmCds.Qry.EOF) then
      begin
        for c:=1 to 12 do
          CdsFichaFinanc.FieldByName('VALOR_TOT_' +FU.PoeZero(c)).asFloat := rTot[c];

        rTotAux := 0;
        for c:=1 to 12 do
          rTotAux := rTotAux + rTot[c];
        CdsFichaFinanc.FieldByName('TOT_LIQUIDO').asFloat := rTotAux;

        for c:=1 to 12 do
          rTot[c] := 0;
      end;
      CdsFichaFinanc.Post;
    until (dmCds.Qry.EOF);
  end
  else
  begin
    CdsFichaFinanc.Insert;
    CdsFichaFinanc.Post;
  end;

  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsFichaFinanc.AddIndex('Index1', 'FUNCIONARIO;TIPORUBRICA;RUBRICA', []);
    1 : CdsFichaFinanc.AddIndex('Index1', 'MATRICULA;TIPORUBRICA;RUBRICA', []);
  end;
  CdsFichaFinanc.IndexName := 'Index1';
  CdsFichaFinanc.First;
end;
} // Fim - Alterado por FHBS - 04/03/2019 - SIG81086

//Thaise SOL151113 - Função criada para quebrar os dados informados na clausula 'IN', já
//que a mesma recebe em sua lista quantidade de dados acima de 1000.
function TRptFichaFinanc.AcertaLista(const pCampo, pLista: String): String;
var lstLista : TStringList;
    iCount,iPos : Integer;
 sLista,sLinha : String;
begin
  lstLista := TStringList.Create;
  sLista := pLista;
  iCount := 0;
  sLinha := pCampo +' in(';
  while sLista <> '' do
  begin
    iPos := Pos(',',sLista);
    If iPos = 0 then
      iPos := length(sLista) + 1;
    If iPos > 0 then
    begin
      sLinha := sLinha + Copy(sLista,1,iPos-1) + ',';
     sLista := Copy(sLista,iPos+1,length(sLista));
    end;
    inc(iCount);
    If (iCount = 900) or (sLista = '') then
    begin
      lstLista.Add(Copy(sLinha,1,Length(sLinha)-1)+')');
      If sLista <> '' then
        sLinha := ' or '+pCampo+' in (';
      iCount := 0;
    end;
  end;

  result := lstLista.Text;
  lstLista.Clear;
  FreeAndNil(lstLista);
end;

procedure TRptFichaFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  FSQLAux := TStringList.Create; // Alterado por FHBS - 04/03/2019 - SIG81086
end;

procedure TRptFichaFinanc.FormDestroy(Sender: TObject);
begin
  FSQLAux.Clear; // Alterado por FHBS - 04/03/2019 - SIG81086
  FSQLAux.Free;  // Alterado por FHBS - 04/03/2019 - SIG81086
  inherited;
end;

end.

