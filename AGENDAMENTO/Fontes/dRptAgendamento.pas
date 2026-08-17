unit dRptAgendamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppComm, ppRelatv, ppProd, ppClass, ppReport, uCmRptManager,
  TXComp, CmParamReport, ppPrnabl, ppCtrls, ppDB, uSistema, dBaseDados,
  ppDBPipe, Db, Provider, DBTables, DBClient, uCMClientDataSet, ppBands,
  ppCache, uCtrlAgendamento, ppVar, ppStrtch, ppMemo, Wwdatsrc, ppModule,
  JCLSysUtils, uModuloAgendamento, myChkBox;

type
  TdtmRptAgendamento = class(TFrmCmReport)
    ppReportGeral: TppReport;
    cdsAgendamento: TCMClientDataSet;
    dtsAgendamento: TDataSource;
    ppDBPipeline: TppDBPipeline;
    ppRDocsReceb: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText12: TppDBText;
    ppLine1: TppLine;
    ppDBText48: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppLabel19: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine9: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLabel11: TppLabel;
    ppDBText13: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText29: TppDBText;
    ppLabel17: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel57: TppLabel;
    ppLabel31: TppLabel;
    ppLabel58: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBImage2: TppDBImage;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    cdsFun: TCMClientDataSet;
    ppDBPipeFun: TppDBPipeline;
    ppDBPipeFunppField1: TppField;
    ppDBPipeFunppField2: TppField;
    ppDBPipeFunppField3: TppField;
    ppDBPipeFunppField4: TppField;
    ppDBPipeFunppField5: TppField;
    ppDBPipeFunppField6: TppField;
    ppDBPipeFunppField7: TppField;
    ppDBPipeFunppField8: TppField;
    ppDBPipeFunppField9: TppField;
    ppDBPipeFunppField10: TppField;
    dsFun: TwwDataSource;
    lblSistema: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    cdsAgendamentoIDAGENDAMENTO: TFloatField;
    cdsAgendamentoATENDENTE: TStringField;
    cdsAgendamentoSOLICITANTE: TStringField;
    cdsAgendamentoIDPESSOA: TFloatField;
    cdsAgendamentoDATA: TDateTimeField;
    cdsAgendamentoHORA: TStringField;
    cdsAgendamentoASSUNTO: TStringField;
    cdsAgendamentoTELEFONE: TStringField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    cdsAgendamentoSITUACAO: TStringField;
    cdsAgendamentoDATAALTERACAO: TDateTimeField;
    ppDBText10: TppDBText;
    cdsAgendamentoMatricula: TStringField;
    cdsAgendamentoPlano: TStringField;
    cdsAgendamentoPATRO: TStringField;
    cdsDadosExtras: TCMClientDataSet;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    cdsAgendamentoINSCRICAONUMERO: TFloatField;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel20: TppLabel;
    ppTitleBand1: TppTitleBand;
    ppLine4: TppLine;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    lblTxtPeriodoGeral: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    lblAtendenteGeral: TppLabel;
    lblAssuntoGeral: TppLabel;
    lblSolicitanteGeral: TppLabel;
    lblUltAlteracaoGeral: TppLabel;
    lblSituacaoGeral: TppLabel;
    lblPeriodoGeral: TppLabel;
    ppReportPorAtendente: TppReport;
    ppTitleBand3: TppTitleBand;
    ppDBImage4: TppDBImage;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLabel79: TppLabel;
    ppLine8: TppLine;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    lblAtendentePorAtend: TppLabel;
    lblAssuntoPorAtend: TppLabel;
    lblSolicitantePorAtend: TppLabel;
    lblUltAlteracaoPorAtend: TppLabel;
    lblSituacaoPorAtend: TppLabel;
    lblPeriodoPorAtend: TppLabel;
    ppHeaderBand4: TppHeaderBand;
    ppLine10: TppLine;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel115: TppLabel;
    ppLine11: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape3: TppShape;
    ppLabel116: TppLabel;
    ppDBText37: TppDBText;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppReportPorData: TppReport;
    ppTitleBand2: TppTitleBand;
    ppDBImage3: TppDBImage;
    ppDBText8: TppDBText;
    ppDBText22: TppDBText;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    lblAtendentePorData: TppLabel;
    lblAssuntoPorData: TppLabel;
    lblSolicitantePorData: TppLabel;
    lblUltAlteracaoPorData: TppLabel;
    lblSituacaoPorData: TppLabel;
    lblPeriodoPorData: TppLabel;
    ppLine5: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppLine6: TppLine;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel76: TppLabel;
    ppLine7: TppLine;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppLabel77: TppLabel;
    ppDBText34: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel53: TppLabel;
    ppDBText23: TppDBText;
    ppLabel65: TppLabel;
    cdsAgendamentoOBSERVACAO: TBlobField;
    myCheckBox1: TmyCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    CtrlAgendamento : TCtrlAgendamento;
  public
    { Public declarations }
  end;

var
  dtmRptAgendamento: TdtmRptAgendamento;

implementation

{$R *.DFM}

procedure TdtmRptAgendamento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAgendamento := TCtrlAgendamento.Create;
  CtrlAgendamento.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil );
  cdsFun.Data := CtrlAgendamento.DadosFundacao;

  if iReportAgendamento = 1 then
    CrmRptCM.Report := ppReportGeral
  else
    if iReportAgendamento = 2 then
      CrmRptCM.Report := ppReportPorAtendente
    else
      CrmRptCM.Report := ppReportPorData;
end;

procedure TdtmRptAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlAgendamento.Free;
end;

procedure TdtmRptAgendamento.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lblAtendenteGeral.Caption    := Iff( CmpRptCM.ParamByName('_lblAtendente').AsString = '', '<Todos>', CmpRptCM.ParamByName('_lblAtendente').AsString );

  lblPeriodoGeral.Caption      := '<Todos>';
  if CmpRptCM.ParamByName('DATAINICIAL').AsDateTime > 0 then
  begin
    if CmpRptCM.ParamByName('DATAFINAL').AsDateTime <= 0 then
      lblPeriodoGeral.Caption := 'A partir de ' + FormatDateTime( 'dd/mm/yyyy', CmpRptCM.ParamByName('DATAINICIAL').AsDateTime )
    else
      lblPeriodoGeral.Caption := 'De ' + FormatDateTime( 'dd/mm/yyyy', CmpRptCM.ParamByName('DATAINICIAL').AsDateTime ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', CmpRptCM.ParamByName('DATAFINAL').AsDateTime );
  end
  else
  begin
    if CmpRptCM.ParamByName('DATAFINAL').AsDateTime > 0 then
      lblPeriodoGeral.Caption := 'Até ' + FormatDateTime( 'dd/mm/yyyy', CmpRptCM.ParamByName('DATAFINAL').AsDateTime );
  end;

  lblAssuntoGeral.Caption      := Iff( CmpRptCM.ParamByName('_lblAssunto').AsString = '', '<Todos>', CmpRptCM.ParamByName('_lblAssunto').AsString );
  lblSituacaoGeral.Caption     := Iff( CmpRptCM.ParamByName('FLGSITUACAO').AsInteger = 0, '<Todas>',
                                   Iff( CmpRptCM.ParamByName('FLGSITUACAO').AsInteger = 1, 'Agendado',
                                    Iff( CmpRptCM.ParamByName('FLGSITUACAO').AsInteger = 2, 'Efetivado', 'Cancelado' ) ) );
  lblSolicitanteGeral.Caption  := Iff( CmpRptCM.ParamByName('NOMESOLIC').AsString = '', '<Todos>', CmpRptCM.ParamByName('NOMESOLIC').AsString );
  lblUltAlteracaoGeral.Caption := Iff( CmpRptCM.ParamByName('DATAALTERACAO').AsDateTime <= 0, '<Todas>', FormatDateTime( 'dd/mm/yyyy', CmpRptCM.ParamByName('DATAALTERACAO').AsDateTime ) );

  lblAtendentePorAtend.Caption    := lblAtendenteGeral.Caption;
  lblPeriodoPorAtend.Caption      := lblPeriodoGeral.Caption;
  lblAssuntoPorAtend.Caption      := lblAssuntoGeral.Caption;
  lblSituacaoPorAtend.Caption     := lblSituacaoGeral.Caption;
  lblSolicitantePorAtend.Caption  := lblSolicitanteGeral.Caption;
  lblUltAlteracaoPorAtend.Caption := lblUltAlteracaoGeral.Caption;

  lblAtendentePorData.Caption     := lblAtendenteGeral.Caption;
  lblPeriodoPorData.Caption       := lblPeriodoGeral.Caption;
  lblAssuntoPorData.Caption       := lblAssuntoGeral.Caption;
  lblSituacaoPorData.Caption      := lblSituacaoGeral.Caption;
  lblSolicitantePorData.Caption   := lblSolicitanteGeral.Caption;
  lblUltAlteracaoPorData.Caption  := lblUltAlteracaoGeral.Caption;

  cdsAgendamento.Data := CtrlAgendamento.RelatorioAtendimentos(
   CmpRptCM.ParamByName('IDATENDENTE').AsInteger,
   CmpRptCM.ParamByName('DATAINICIAL').AsDateTime,
   CmpRptCM.ParamByName('DATAFINAL').AsDateTime,
   CmpRptCM.ParamByName('IDASSUNTOAGENDA').AsInteger,
   CmpRptCM.ParamByName('FLGSITUACAO').AsInteger,
   CmpRptCM.ParamByName('NOMESOLIC').AsString,
   CmpRptCM.ParamByName('DATAALTERACAO').AsDateTime,
   ( iReportAgendamento = 2 ) );

  cdsAgendamento.First;
  while not cdsAgendamento.Eof do
  begin
    if cdsAgendamentoIDPESSOA.AsInteger > 0 then
    begin
      cdsDadosExtras.Close;
      cdsDadosExtras.Data := CtrlAgendamento.DadosExtrasRelatorio( cdsAgendamentoIDPESSOA.AsInteger );
      cdsAgendamento.Edit;
      cdsAgendamentoMATRICULA.AsString        := cdsDadosExtras.FieldByName('MATRICULA').AsString;
      cdsAgendamentoINSCRICAONUMERO.AsInteger := cdsDadosExtras.FieldByName('INSCRICAONUMERO').AsInteger;
      cdsAgendamentoPLANO.AsString            := cdsDadosExtras.FieldByName('PLANO').AsString;
      cdsAgendamentoPATRO.AsString            := cdsDadosExtras.FieldByName('PATRO').AsString;
      cdsAgendamento.Post;
      cdsDadosExtras.Close;
    end;
    cdsAgendamento.Next;
  end;
  cdsAgendamento.First;
end;

end.
