unit RAACTPS;
{*******************************************************************************
Rotina...........: criação do relatório
Nº SIG...........: 20695
Data da Alteração: 14/06/2013
Responsável......: William Santana
Descrição........: relatório de Ficha de anotações e atualizações da CTPS - modelo2
********************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, uCmSqlParams, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl,
  ppBands, ppCache, uSistema, ppStrtch, ppMemo, DBTables, Wwquery,
  ppModule, daDataModule, Provider, raCodMod, ppSubRpt, ppParameter,
  ppRegion;

type
  TRptRAACTPS = class(TFrmCmReport)
    rpAACTPS: TppReport;
    Dados: TppBDEPipeline;
    dsDados: TwwDataSource;
    ppParameterList1: TppParameterList;
    Cargo: TppDBPipeline;
    Ferias: TppDBPipeline;
    Contrib: TppDBPipeline;
    dsContrib: TwwDataSource;
    dsFerias: TwwDataSource;
    dsCargo: TwwDataSource;
    cdsFerias: TCMClientDataSet;
    cdsContrib: TCMClientDataSet;
    sqlContrib: TCMSqlParams;
    sqlFerias: TCMSqlParams;
    sqlCargo: TCMSqlParams;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape3: TppShape;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText3: TppDBText;
    ppDBText10: TppDBText;
    ppLabel24: TppLabel;
    ppLabel29: TppLabel;
    ppLabel27: TppLabel;
    ppShape4: TppShape;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText12: TppDBText;
    ppShape5: TppShape;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText13: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape6: TppShape;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppDBText18: TppDBText;
    ppShape7: TppShape;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppDBText22: TppDBText;
    ppLabel22: TppLabel;
    ppLabel25: TppLabel;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppLine8: TppLine;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel3: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBImage1: TppDBImage;
    ppLine61: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine60: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine3: TppLine;
    ppLine9: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine23: TppLine;
    ppLabel49: TppLabel;
    ppLine56: TppLine;
    ppLabel50: TppLabel;
    ppLine59: TppLine;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText9: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine22: TppLine;
    ppDBText17: TppDBText;
    ppLine57: TppLine;
    ppDBText30: TppDBText;
    ppLine58: TppLine;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppLine4: TppLine;
    raCodeModule1: TraCodeModule;
    cdsCargo: TCMClientDataSet;
    cdsDados: TCMClientDataSet;
    sqlDados: TCMSqlParams;
    fltfldFeriasIDPESSOA: TFloatField;
    strngfldFeriasPERIODO_AQUISITIVO: TStringField;
    strngfldFeriasPERIODO_FERIAS: TStringField;
    fltfldFeriasDIAS_FERIAS: TFloatField;
    strngfldFeriasABONO_PEC: TStringField;
    fltfldFeriasQTDIASABONO: TFloatField;
    strngfldFeriasADTO13: TStringField;
    fltfldFeriasNUMSEQ: TFloatField;
    cdsContribMES: TStringField;
    cdsContribVALORPROVENTO: TFloatField;
    cdsContribRAZAO_SINDICATO: TStringField;
    cdsDadosIDPESSOA: TFloatField;
    strngfldConsultaMATRICULA: TStringField;
    cdsDadosDATAADMISSAO: TDateTimeField;
    cdsDadosDATANASC: TDateTimeField;
    strngfldConsultaNOME_EMPREGADO: TStringField;
    strngfldConsultaSEXO: TStringField;
    strngfldConsultaCTPS: TStringField;
    strngfldConsultaPIS: TStringField;
    strngfldConsultaCPF_EMPREGADO: TStringField;
    strngfldConsultaRG: TStringField;
    strngfldConsultaORGAO_EMISSOR_RG: TStringField;
    strngfldConsultaLOTACAO: TStringField;
    strngfldConsultaRAZAO_EMPRESA: TStringField;
    strngfldConsultaNOME_EMPRESA: TStringField;
    strngfldConsultaENDERECO_EMPRESA: TStringField;
    strngfldConsultaNUM_END_EMPRESA: TStringField;
    strngfldConsultaCOMPL_END_EMPRESA: TStringField;
    strngfldConsultaBAIRRO_EMPRESA: TStringField;
    strngfldConsultaCIDADE_EMPRESA: TStringField;
    strngfldConsultaUF_EMPRESA: TStringField;
    strngfldConsultaCEP_EMPRESA: TStringField;
    cdsDadosCNPJ_EMPRESA: TStringField;
    cdsCargoIDPESSOA: TFloatField;
    cdsCargoDATAALTERFUNC: TDateTimeField;
    strngfldSub1MOEDA: TStringField;
    cdsCargoSALARIO: TFloatField;
    strngfldSub1FUNCAO: TStringField;
    strngfldSub1CARGO_FUNCAO: TStringField;
    cdsCargoCBO_CARGO_FUNCAO: TFloatField;
    cdsCargoVLRSALARIOFUNCAO: TFloatField;
    strngfldSub1MOTIVO: TStringField;
    cdsContribMOEDA: TStringField;
    cdsContribIDPESSOA: TFloatField;
    cdsDadosTITULO: TStringField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    psbrprt2: TppSubReport;
    pchldrprt2: TppChildReport;
    ptlbnd2: TppTitleBand;
    phdrbnd1: TppHeaderBand;
    pshp1: TppShape;
    Til6: TppLabel;
    Til7: TppLabel;
    Til8: TppLabel;
    Til9: TppLabel;
    Til10: TppLabel;
    Til11: TppLabel;
    pln3: TppLine;
    pln4: TppLine;
    pln5: TppLine;
    pln6: TppLine;
    pln7: TppLine;
    pln8: TppLine;
    pln9: TppLine;
    pln10: TppLine;
    pln11: TppLine;
    Til12: TppLabel;
    pdtlbnd2: TppDetailBand;
    pdbtxtPERIODO_AQUISITIVO: TppDBText;
    pdbtxtPERIODO_FERIAS: TppDBText;
    pdbtxtDIAS_FERIAS: TppDBText;
    pdbtxtABONO_PEC: TppDBText;
    pdbtxtADTO13: TppDBText;
    pln12: TppLine;
    pln13: TppLine;
    pln14: TppLine;
    pln15: TppLine;
    pln16: TppLine;
    pln17: TppLine;
    pln18: TppLine;
    pdbtxtQTDIASABONO: TppDBText;
    psmrybnd2: TppSummaryBand;
    pln19: TppLine;
    rcdmdl3: TraCodeModule;
    psbrprt3: TppSubReport;
    pchldrprt3: TppChildReport;
    ptlbnd3: TppTitleBand;
    phdrbnd2: TppHeaderBand;
    pshp2: TppShape;
    Til13: TppLabel;
    Til14: TppLabel;
    Til15: TppLabel;
    Til16: TppLabel;
    Til17: TppLabel;
    pln20: TppLine;
    pln21: TppLine;
    pln22: TppLine;
    pln23: TppLine;
    pln24: TppLine;
    pln25: TppLine;
    pln26: TppLine;
    pdtlbnd3: TppDetailBand;
    pln27: TppLine;
    pdbtxtMES: TppDBText;
    pln28: TppLine;
    pdbtxtMoeda: TppDBText;
    pln29: TppLine;
    pdbtxtVALORPROVENTO: TppDBText;
    pln30: TppLine;
    pdbtxtRAZAO_SINDICATO: TppDBText;
    pln31: TppLine;
    psmrybnd3: TppSummaryBand;
    pln32: TppLine;
    rcdmdl2: TraCodeModule;
    cdsDadosSINDICATO: TStringField;
    dsFoto: TwwDataSource;
    Foto: TppDBPipeline;
    updFoto: TUpdateSQL;
    qryApp: TwwQuery;
    qryFoto: TwwQuery;
    Til1: TppLabel;
    pdbtxtRAZAO_EMPRESA: TppDBText;
    pdbtxtNOME_EMPREGADO: TppDBText;
    pln1: TppLine;
    pln2: TppLine;
    psystmvrbl1: TppSystemVariable;
    Til2: TppLabel;
    Til3: TppLabel;
    psystmvrbl2: TppSystemVariable;
    Til4: TppLabel;
    psystmvrbl3: TppSystemVariable;
    Til5: TppLabel;
    ppRegion1: TppRegion;
    cdsCargoVLRFUNCAO: TFloatField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
    procedure psmrybnd1AfterPrint(Sender: TObject);
  private
    { Private declarations }
     bAguarde : Boolean;
  public
    { Public declarations }
  end;

var
  RptRAACTPS: TRptRAACTPS;

implementation

uses fAguarde, dCds, uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}             

procedure TRptRAACTPS.psmrybnd1AfterPrint(Sender: TObject);

begin
  inherited;
  if bAguarde then
  begin
   frmAguarde.BringToFront;
   frmAguarde.Pos := frmAguarde.Pos + 1;
   frmAguarde.Update;
  end;
end;

procedure TRptRAACTPS.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
  bAguarde := False;
end;

procedure TRptRAACTPS.CrmRptCMBeforePrint(Sender: TObject);
 var
   order : String;
   ini, fim : Integer;

   procedure abreSqlFotos();    
   begin
     //Esta função serve para abrir a consulta em partes, pois estava estourando a memória quando haviam muitos registros;
     qryApp.Close;
     qryApp.ParamByName('ini').AsInteger := ini;
     qryApp.ParamByName('fim').AsInteger := fim;
     qryApp.Open;
     
     if not(qryFoto.Prepared) then
     qryFoto.Prepare;
     
     while not qryApp.Eof do
     begin
      qryFoto.Append;
      qryFoto.FieldByName('IDPESSOA').AsInteger := qryApp.FieldByName('IDPESSOA').AsInteger;
      qryFoto.FieldByName('FOTO').value := qryApp.FieldByName('FOTO').value;    //blob
      qryFoto.Post;
      qryApp.Next;
     end;
     
     if (qryApp.RecordCount = 500) then
     begin
        ini := fim + 1;
        fim := fim + 500;
        abreSqlFotos; //caso ainda existam registros a ser abertos, chama a função de novo;
     end;

   end;

begin
  inherited;
  frmAguarde.Mostra('Ficha de anotações e atualizações da CTPS - Modelo 2');

  sqlDados.SQL.Text   := stringReplace(sqlDados.SQL.Text,'1=2',
                         FU.QuebrarListaFiltro(1,'(F.IDPESSOA', CmpRptCM.ParamByName('ListaIdFuncSel').AsString,500),[rfReplaceAll, rfIgnoreCase]);

  sqlCargo.SQL.Text   := stringReplace(sqlCargo.SQL.Text,'1=2',
                         FU.QuebrarListaFiltro(1,'(E.IDPESSOA', CmpRptCM.ParamByName('ListaIdFuncSel').AsString,500),[rfReplaceAll, rfIgnoreCase]);

  sqlFerias.SQL.Text  := stringReplace(sqlFerias.SQL.Text,'1=2',
                         FU.QuebrarListaFiltro(1,'(FE.IDPESSOA', CmpRptCM.ParamByName('ListaIdFuncSel').AsString,500),[rfReplaceAll, rfIgnoreCase]);

  sqlContrib.SQL.Text := stringReplace(sqlContrib.SQL.Text,'1=2',
                         FU.QuebrarListaFiltro(1,'(H.IDPESSOA', CmpRptCM.ParamByName('ListaIdFuncSel').AsString,500),[rfReplaceAll, rfIgnoreCase]);

  //query para usar no append
  qryApp.SQL.Text    := stringReplace(qryApp.SQL.Text,'1=2',
                         FU.QuebrarListaFiltro(1,'(P.IDPESSOA', CmpRptCM.ParamByName('ListaIdFuncSel').AsString,500),[rfReplaceAll, rfIgnoreCase]);


  case CmpRptCM.ParamByName('Ordem').AsInteger of
   // Nome
   0: order := ' ORDER BY PFUNC.NOME';
   // Matrícula
   1: order := ' ORDER BY F.MATRICULA';
   // Lotação, Nome
   2: order := ' ORDER BY CC.NOME, PFUNC.NOME';
   // Lotação, Matrícula
   3: order := ' ORDER BY CC.NOME, F.MATRICULA';
   // Cargo, Nome
   4: order := ' ORDER BY C.TITULO, PFUNC.NOME';
   // Cargo, Matrícula
   5: order := ' ORDER BY C.TITULO, F.MATRICULA';
  end;

  sqlDados.SQL.Text := sqlDados.SQL.Text + order ;

  sqlDados.Open;
  sqlCargo.Open;
  sqlFerias.Open;
  sqlContrib.Open;

  qryFoto.Open;
  ini := 0;
  fim := 500;
  abreSqlFotos;
                                                                              
  frmAguarde.Min := 0;
  frmAguarde.Max := cdsDados.RecordCount + 1;
  frmAguarde.Pos := 0;
                                                         
  bAguarde := True;

end;

end.
