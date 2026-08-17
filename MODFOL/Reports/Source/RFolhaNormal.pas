// *****************************************************************************
// ********************** REGISTRO DE ALTERAÇÕES *******************************
// *****************************************************************************
// Autor(a)    :  Taffarel Sevaybriker
// Data        :  27/07/2018
// Pendência   :  SIG72346
// Descricao   :  Erro na condição IN com mais de 1000 registros.
//------------------------------------------------------------------------------
// Autor(a)    :  Marcelo Cardoso
// Data        :  16/09/2015
// Pendência   :  SOL 261820 PPM 1071822
// Descricao   :  Erro na abertura do relatório "Folha de Pagamento Normal".
//------------------------------------------------------------------------------
// Autor(a)    :  Marcelo Cardoso
// Data        :  30/06/2015
// DFM         :  Ordernar as rubricas por nome QueryRelatorio
// Pendência   :  SOL 256773 PPM 850577
// Descricao   :  Solicitamos verificar o erro na geração do relatório
//FOLHA DE PAGAMENTO NORMAL, pois não está ordenando as rubricas por nome,
//conforme parametrização no arquivo anexo.
//------------------------------------------------------------------------------
// Autor(a)    :  Fernando Xavier
// Data        :  30/10/2014
// DFM         :  Criação do componente QueryRelatorio
// Pendência   :  SOL 226604 KINTANA 2062822
// Descricao   :  Solicitamos verificar o erro na geração do relatório, conforme
//                arquivo anexo. Solução: reestruturação do relatorio.
//--------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFolhaNormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, CmParamReport, TXRB, USistema, DBTables, Wwquery;

type
  TRptFolhaNormal = class(TFrmCmReport)
    rpFolhaNormal: TppReport;
    rpFolhaNormalHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText12: TppDBText;
    rpFolhaNormalDBTextCGC: TppDBText;
    rpFolhaNormalDBTextEstMun: TppDBText;
    ppDBText15: TppDBText;
    rpFolhaNormalDBTextEnder: TppDBText;
    rpFolhaNormalLabel1: TppLabel;
    rpFolhaNormalLabel2: TppLabel;
    rpFolhaNormalLabel3: TppLabel;
    rpFolhaNormalLine3: TppLine;
    rpFolhaNormalLabel10: TppLabel;
    rpFolhaNormalDBText9: TppDBText;
    rpFolhaNormallbMes: TppLabel;
    ppCalc1: TppSystemVariable;
    rpFolhaNormalCalc1: TppSystemVariable;
    rpFolhaNormalDtlBnd: TppDetailBand;
    rpFolhaNormalDBText4: TppDBText;
    rpFolhaNormalDBText5: TppDBText;
    rpFolhaNormalDBText6: TppDBText;
    rpFolhaNormalDBText7: TppDBText;
    rpFolhaNormalDBText8: TppDBText;
    rpFolhaNormalDBText13: TppDBText;
    rpFolhaNormalSmryBnd: TppSummaryBand;
    rpFolhaNormalGrpCENTROCUSTO: TppGroup;
    rpFolhaNormalGrpHdrBnd0: TppGroupHeaderBand;
    rpFolhaNormalGrpFootBnd0: TppGroupFooterBand;
    FolhaNormalppGroup5: TppGroup;
    rpFolhaNormalGrpHdrBnd1: TppGroupHeaderBand;
    rpFolhaNormalGrpFootBnd1: TppGroupFooterBand;
    rpFolhaNormalGrpEMPREGADO: TppGroup;
    rpFolhaNormalGrpHdrBand2: TppGroupHeaderBand;
    rpFolhaNormalDBtxtMatricula: TppDBText;
    rpFolhaNormalDBText2: TppDBText;
    rpFolhaNormalDBText3: TppDBText;
    rpFolhaNormalLine2: TppLine;
    rpFolhaNormalLabel4: TppLabel;
    rpFolhaNormalLabel5: TppLabel;
    rpFolhaNormalLabel6: TppLabel;
    rpFolhaNormalLabel7: TppLabel;
    rpFolhaNormalLabel8: TppLabel;
    rpFolhaNormalDBText1: TppDBText;
    FolhaNormalrpLblCONTINUACAO: TppLabel;
    rpFolhaNormalLabel12: TppLabel;
    rpFolhaNormalLabel13: TppLabel;
    rpFolhaNormalLabel14: TppLabel;
    rpFolhaNormalDBText11: TppDBText;
    rpFolhaNormalDBText12: TppDBText;
    rpFolhaNormalLabelNivel: TppLabel;
    rpFolhaNormalDBTextNivel: TppDBText;
    rpFolhaNormalGrpFootBnd2: TppGroupFooterBand;
    rpFolhaNormalLine1: TppLine;
    rpFolhaNormalLabel9: TppLabel;
    rpFolhaNormalDBCalc1: TppDBCalc;
    rpFolhaNormalDBCalc2: TppDBCalc;
    rpFolhaNormalLine4: TppLine;
    rpFolhaNormalLabel11: TppLabel;
    ppFolhaNormal: TppBDEPipeline;
    dsFolhaNormal: TDataSource;
    sqlFolhaNormal: TCMSqlParams;
    CdsFolhaNormal: TCMClientDataSet;
    rpFolhaNormalLblPROCESSO: TppLabel;
    QueryRelatorio: TwwQuery; // SOL 226604 KINTANA 2062822
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFolhaNormalAfterScroll(DataSet: TDataSet);
    procedure rpFolhaNormalBeforePrint(Sender: TObject);
    procedure rpFolhaNormalDBText9Print(Sender: TObject);
    procedure rpFolhaNormalLabel11Print(Sender: TObject);
    procedure rpFolhaNormalHdrBndAfterPrint(Sender: TObject);
    procedure rpFolhaNormalGrpHdrBand2AfterPrint(Sender: TObject);
    procedure rpFolhaNormalGrpFootBnd2AfterPrint(Sender: TObject);
    procedure rpFolhaNormalSmryBndAfterPrint(Sender: TObject);
    procedure QueryRelatorioAfterScroll(DataSet: TDataSet); // SOL 226604 KINTANA 2062822
  private
    sMatricula: string;
  end;

var
  RptFolhaNormal: TRptFolhaNormal;

implementation

uses uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptFolhaNormal.CrmRptCMBeforePrint(Sender: TObject);
var
  sOrdemRubrica: string;
  DocID: array[1..2] of integer;
  iMes, iAno: integer;
begin
  inherited;
  DocID[1] := 0;
  DocID[2] := 0;
  iMes := CmpRptCM.ParamByName('MesRef').asInteger;
  iAno := CmpRptCM.ParamByName('AnoRef').asInteger;

  rpFolhaNormalDBTextCGC.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpFolhaNormalDBTextEstMun.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpFolhaNormalDBTextEnder.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  //with (sqlFolhaNormal.SQL) do // SOL 226604 KINTANA 2062822 comentado
  //begin  // SOL 226604 KINTANA 2062822 comentado

  // SOL 226604 KINTANA 2062822 troca do componente CDS pelo componemte QUERY
  QueryRelatorio.close;
  QueryRelatorio.SQL.clear;

    QueryRelatorio.SQL.Add('SELECT');
    QueryRelatorio.SQL.Add('  H.SEQRUBRICA,');
    QueryRelatorio.SQL.Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    QueryRelatorio.SQL.Add('  F.MATRICULA,');
    QueryRelatorio.SQL.Add('  F.IDFAIXACARGO AS NIVEL,');
    QueryRelatorio.SQL.Add('  CC.CODCENTROCUSTO AS CENTROCUSTO,');
    QueryRelatorio.SQL.Add('  CC.NOME AS NOMECENTROCUSTO,');
    QueryRelatorio.SQL.Add('  H.MES,');
    QueryRelatorio.SQL.Add('  PF.NOME AS EMPREGADO,');
    QueryRelatorio.SQL.Add('  C.TITULO,');
    QueryRelatorio.SQL.Add('  TO_NUMBER(NVL(PEFIS.NUMDEPIRRF,0)) AS NUMDEPIRRF,');
    QueryRelatorio.SQL.Add('  TO_NUMBER(NVL(PEFIS.NUMDEPSALF,0)) AS NUMDEPSALF,');
    QueryRelatorio.SQL.Add('  F.TIPOPAGAMENTO,');
    QueryRelatorio.SQL.Add('  ES.CODESTADO AS UF,');
    QueryRelatorio.SQL.Add('  MO.DESCRICAO,');
    QueryRelatorio.SQL.Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    QueryRelatorio.SQL.Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUM),NULL,');
    QueryRelatorio.SQL.Add('    DECODE(RTRIM(MUNICIPAL.NUM),NULL,NULL,');
    QueryRelatorio.SQL.Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUM),');
    QueryRelatorio.SQL.Add('    ''Inscrição Estadual: '' || ESTADUAL.NUM)) AS ESTADUALMUNICIPAL,');
    QueryRelatorio.SQL.Add('  substr(RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    QueryRelatorio.SQL.Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E.COMPLEMENTO)) ||'' - ''|| ');
    QueryRelatorio.SQL.Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,RTRIM(E.BAIRRO)) ||'' - ''||');
    QueryRelatorio.SQL.Add('    RTRIM(CIDADES.NOME) || '' - CEP: '' ||');
    QueryRelatorio.SQL.Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)),1,200) AS ENDERECO,');
    QueryRelatorio.SQL.Add('  P.CODRUBCLT AS CODRUBCLT,');
    QueryRelatorio.SQL.Add('  RP.CODPROVDESC AS CODRUBRICA,');
    QueryRelatorio.SQL.Add('  RP.DESCRPROVDESC AS RUBRICA,');
    QueryRelatorio.SQL.Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    QueryRelatorio.SQL.Add('    ''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
    QueryRelatorio.SQL.Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO) AS PROVENTO,');
    QueryRelatorio.SQL.Add('  DECODE(P.FLGDESCONTO,1,H.VALORPROVENTO) AS DESCONTO,');
    QueryRelatorio.SQL.Add('  DECODE(P.FLGDESCONTO,2,H.VALORPROVENTO) AS OUTROS,');
    QueryRelatorio.SQL.Add('  P.FLGDESCONTO AS TIPORUBRICA');
    QueryRelatorio.SQL.Add('FROM');
    QueryRelatorio.SQL.Add('  '+CmpRptCM.ParamByName('NomeTabela').asString+' H, PESSOA PJ, PESSOA PF,');
    QueryRelatorio.SQL.Add('  PESSOAFISICA PEFIS, ENDPESS E, PROVDESC P, RUBRICAXPESS RP, FUNCIONARIO F,');
    QueryRelatorio.SQL.Add('  ESTADO ES, CIDADES, CARGO C, MOTIVO MO, CENTCUST CC,' +
      FU.IFF(CmpRptCM.ParamByName('ListaIdFunc').asString <> '','','SITFUNC ST,'));
    // ------------------------------------------------------------------------------- //
    // Última evolução Funcional do Funcionário
    // --------------------------------------------------------------------------------//
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      QueryRelatorio.SQL.Add('  (SELECT EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
      QueryRelatorio.SQL.Add('    FROM   EVOLFUNC EVOL,');
      QueryRelatorio.SQL.Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      QueryRelatorio.SQL.Add('           FROM   EVOLFUNC');
      QueryRelatorio.SQL.Add('           WHERE');
      QueryRelatorio.SQL.Add('            (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
        ',''DD/MM/YYYY''))');
      QueryRelatorio.SQL.Add('           GROUP BY IDPESSOA) HST2,');
      QueryRelatorio.SQL.Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
      QueryRelatorio.SQL.Add('           FROM   EVOLFUNC');
      QueryRelatorio.SQL.Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      QueryRelatorio.SQL.Add('           GROUP BY IDPESSOA) HST3');
      QueryRelatorio.SQL.Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
      QueryRelatorio.SQL.Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
      QueryRelatorio.SQL.Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
      QueryRelatorio.SQL.Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
    end;
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual
    QueryRelatorio.SQL.Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    QueryRelatorio.SQL.Add('   FROM   DOCPESSOA');
    QueryRelatorio.SQL.Add('   WHERE (IDPESSOA   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    QueryRelatorio.SQL.Add('         (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    QueryRelatorio.SQL.Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    QueryRelatorio.SQL.Add('   FROM   DOCPESSOA');
    QueryRelatorio.SQL.Add('   WHERE (IDPESSOA   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    QueryRelatorio.SQL.Add('         (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL');
    // ------------------------------------------------------------------------------- //
    QueryRelatorio.SQL.Add('WHERE');

    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
        QueryRelatorio.SQL.Add('  (MO.IDMOTIVO      IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
      else
        QueryRelatorio.SQL.Add('  (MO.IDMOTIVO       = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');

    QueryRelatorio.SQL.Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    QueryRelatorio.SQL.Add('  (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      QueryRelatorio.SQL.Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND')
    else
      QueryRelatorio.SQL.Add('  (F.IDEMPRESA     = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
    QueryRelatorio.SQL.Add('  (RP.IDPESSOA       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
    QueryRelatorio.SQL.Add('  (H.MES             = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    QueryRelatorio.SQL.Add('  (H.IDPESSJUR       = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      //Taffarel - SIG72346 - início
      //if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        //QueryRelatorio.SQL.Add('  (PF.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
        QueryRelatorio.SQL.Add(CmpRptCM.ParamByName('ListaIdFunc').asString+ ' AND ')
      //else
        //QueryRelatorio.SQL.Add('  (PF.IDPESSOA        = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      //Taffarel - SIG72346 - fim
    end
    else
    begin
      // C. de Custo selecionados
      if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            QueryRelatorio.SQL.Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            QueryRelatorio.SQL.Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
              QueryRelatorio.SQL.Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              QueryRelatorio.SQL.Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;
      end
      else
      begin
        if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        begin
          if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
            QueryRelatorio.SQL.Add('  (F.CODCENTROCUSTO IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
          else
            QueryRelatorio.SQL.Add('  (F.CODCENTROCUSTO  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
        end
        else
        begin
          // C. de Custo(s) habilitados para o usuário
          if (CtrlUsoGeralRH.UsuXCCusto <> '') then
            if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
              QueryRelatorio.SQL.Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
            else
              QueryRelatorio.SQL.Add('  (F.CODCENTROCUSTO = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          QueryRelatorio.SQL.Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          QueryRelatorio.SQL.Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          QueryRelatorio.SQL.Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          QueryRelatorio.SQL.Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

      QueryRelatorio.SQL.Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    end;

    QueryRelatorio.SQL.Add('  (P.FLGCONSTAFOLHA  = 1) AND');
    QueryRelatorio.SQL.Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    QueryRelatorio.SQL.Add('  (PF.IDPESSOA       = PEFIS.IDPESSOA) AND');
    QueryRelatorio.SQL.Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      QueryRelatorio.SQL.Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) AND')
    else
      QueryRelatorio.SQL.Add('  (F.IDCARGO = C.IDCARGO) AND');
    QueryRelatorio.SQL.Add('  (PF.IDPESSOA       = H.IDPESSOA) AND');
    QueryRelatorio.SQL.Add('  (MO.IDMOTIVO       = H.IDMOTIVO) AND');
    QueryRelatorio.SQL.Add('  (H.IDRUBRICA       = RP.IDRUBRICA) AND');
    QueryRelatorio.SQL.Add('  (H.IDRUBRICA       = P.IDPROVENTO) AND');
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      QueryRelatorio.SQL.Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = RP.IDPESSOA) AND');
      QueryRelatorio.SQL.Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    end
    else
    begin
      QueryRelatorio.SQL.Add('  (F.IDEMPRESA = RP.IDPESSOA) AND');
      QueryRelatorio.SQL.Add('  (F.IDEMPRESA = CC.IDEMPRESA) AND');
    end;
    QueryRelatorio.SQL.Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    QueryRelatorio.SQL.Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    QueryRelatorio.SQL.Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    QueryRelatorio.SQL.Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
    begin
      QueryRelatorio.SQL.Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
      QueryRelatorio.SQL.Add('  (F.IDPESSOA        = HST.IDPESSOA(+)) AND');
    end
    else
      QueryRelatorio.SQL.Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');

    QueryRelatorio.SQL.Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    QueryRelatorio.SQL.Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    QueryRelatorio.SQL.Add('ORDER BY');

    //Inico - SOL256773 - PPM 850577 - Marcelo Cardoso
 // case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
 //     0 : QueryRelatorio.SQL.Add('  DESCRICAO, EMPREGADO, CENTROCUSTO, TIPORUBRICA');  // SOL 226604 KINTANA 2062822 retirado o UPPER do order by
 //     1 : QueryRelatorio.SQL.Add('  DESCRICAO, MATRICULA, CENTROCUSTO, TIPORUBRICA');  // SOL 226604 KINTANA 2062822 retirado o UPPER do order by
 //     2 : QueryRelatorio.SQL.Add('  DESCRICAO, CENTROCUSTO, EMPREGADO, TIPORUBRICA');  // SOL 226604 KINTANA 2062822 retirado o UPPER do order by
 //     3 : QueryRelatorio.SQL.Add('  DESCRICAO, CENTROCUSTO, MATRICULA, TIPORUBRICA');   // SOL 226604 KINTANA 2062822 retirado o UPPER do order by
 //     4 : QueryRelatorio.SQL.Add('  DESCRICAO, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA'); // SOL 226604 KINTANA 2062822 retirado o UPPER do order by
 //     5 : QueryRelatorio.SQL.Add('  DESCRICAO, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA'); // SOL 226604 KINTANA 2062822 retirado o UPPER do order by
 //   end;

    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : QueryRelatorio.SQL.Add('  DESCRICAO, EMPREGADO, CENTROCUSTO');
      1 : QueryRelatorio.SQL.Add('  DESCRICAO, MATRICULA, CENTROCUSTO');
      2 : QueryRelatorio.SQL.Add('  DESCRICAO, CENTROCUSTO, EMPREGADO');
      3 : QueryRelatorio.SQL.Add('  DESCRICAO, CENTROCUSTO, MATRICULA');
      4 : QueryRelatorio.SQL.Add('  DESCRICAO, NOMECENTROCUSTO, EMPREGADO');
      5 : QueryRelatorio.SQL.Add('  DESCRICAO, NOMECENTROCUSTO, MATRICULA');
    end;
   //Fim - SOL256773 - PPM 850577 - Marcelo Cardoso

    case (CmpRptCM.ParamByName('OrdemRubrica').asInteger) of
      0 : sOrdemRubrica := ',TIPORUBRICA, CODRUBRICA';
      1 : sOrdemRubrica := ',TIPORUBRICA, RUBRICA';
    end;

    QueryRelatorio.SQL.Add(sOrdemRubrica); // SOL 256773 PPM 850577
    //sqlFolhaNormal.SQL[sqlFolhaNormal.SQL.Count-1] :=  // SOL 226604 KINTANA 2062822 comentado
    //sqlFolhaNormal.SQL[sqlFolhaNormal.SQL.Count-1] + sOrdemRubrica;  // SOL 226604 KINTANA 2062822 comentado
    //QueryRelatorio.sql.SaveToFile('c:\QueryRelatorio.sql');   // Marcelo Cardoso - SOL 261820 PPM 1071822  
    //SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332  // SOL 226604 KINTANA 2062822 comentado
  //end; // SOL 226604 KINTANA 2062822 comentado
  QueryRelatorio.Open;

  frmAguarde.Max := QueryRelatorio.RecordCount;
  frmAguarde.Min := 0;

  rpFolhaNormalLabelNivel.Visible := (CmpRptCM.ParamByName('FlgNivelIndiv').asInteger = 1);
  rpFolhaNormalDBTextNivel.Visible := (CmpRptCM.ParamByName('FlgNivelIndiv').asInteger = 1);

  rpFolhaNormalGrpCENTROCUSTO.NewPage := CmpRptCM.ParamByName('AgruparPorCCusto').asBoolean;
  if (CmpRptCM.ParamByName('AgruparPorCCusto').asBoolean) then
    rpFolhaNormalGrpCENTROCUSTO.BreakName := 'CENTROCUSTO'
  else
    rpFolhaNormalGrpCENTROCUSTO.BreakName := '';

  rpFolhaNormalLblPROCESSO.Visible := CmpRptCM.ParamByName('ImprimeTipoProcesso').asBoolean;
  if (rpFolhaNormalLblPROCESSO.Visible) then
    if (CmpRptCM.ParamByName('NomeTabela').asString = 'PREVIAFOLPAG') then
      rpFolhaNormalLblPROCESSO.Caption := 'Processo: PRÉVIA'
    else
      rpFolhaNormalLblPROCESSO.Caption := 'Processo: FINAL';
end;

procedure TRptFolhaNormal.CdsFolhaNormalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFolhaNormal.rpFolhaNormalBeforePrint(Sender: TObject);
begin
  sMatricula := '';
end;

procedure TRptFolhaNormal.rpFolhaNormalDBText9Print(Sender: TObject);
begin
  rpFolhaNormallbMes.Caption := FU.MesExtensoAno(QueryRelatorio.FieldByName('MES').asString);
end;

procedure TRptFolhaNormal.rpFolhaNormalLabel11Print(Sender: TObject);
begin
  rpFolhaNormalLabel11.Caption := FU.ValStr((rpFolhaNormalDBCalc1.Value -
    rpFolhaNormalDBCalc2.Value), 12, 2, true, ',');
end;

procedure TRptFolhaNormal.rpFolhaNormalHdrBndAfterPrint(Sender: TObject);
begin
  FolhaNormalrpLblCONTINUACAO.Visible :=
    (sMatricula = QueryRelatorio.FieldByName('MATRICULA').asString);
end;

procedure TRptFolhaNormal.rpFolhaNormalGrpHdrBand2AfterPrint(Sender: TObject);
begin
  sMatricula := QueryRelatorio.FieldByName('MATRICULA').asString;
end;

procedure TRptFolhaNormal.rpFolhaNormalGrpFootBnd2AfterPrint(Sender: TObject);
begin
  FolhaNormalrpLblCONTINUACAO.Visible := false;
end;

procedure TRptFolhaNormal.rpFolhaNormalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFolhaNormal.QueryRelatorioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

end.
