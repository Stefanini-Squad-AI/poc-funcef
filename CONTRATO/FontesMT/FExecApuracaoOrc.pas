{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27582
Responsável : Daniel Simões
Data        : 12/03/2008
Descrição   : Ajuste do Help Context.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecApuracaoOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, mContrato, wwdblook,
  Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, uCtrlPadroes, uCtrlContrRateioOrc,
  Grids, Wwdbigrd, Wwdbgrid, Menus, ppCtrls, ppBands, ppClass, ppDB,
  ppDBPipe, ppDBBDE, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  fpreview, ppReport, uSistema, fProgresso;

type
  TfrmExecApuracaoOrc = class(TfrmWizardMT)
    cdsContratos: TCMClientDataSet;
    cdsOrcamento: TCMClientDataSet;
    dsContratos: TDataSource;
    sqlContratos: TCMSqlParams;
    molContrato: TmolContrato;
    cdsFormulas: TCMClientDataSet;
    dsFormulas: TDataSource;
    sqlFormulas: TCMSqlParams;
    dbcboFormula: TwwDBLookupCombo;
    Label2: TLabel;
    dsOrcamento: TDataSource;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    dbComboPeriodoIni: TwwDBComboBox;
    Label14: TLabel;
    dbComboPeriodoFim: TwwDBComboBox;
    spExercicioIni: TwwDBSpinEdit;
    Label3: TLabel;
    Label1: TLabel;
    spExercicioFim: TwwDBSpinEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    spnAnoApura: TwwDBSpinEdit;
    Label5: TLabel;
    chkExclui: TCheckBox;
    TabSheet2: TTabSheet;
    dbgContratos: TwwDBGrid;
    fcLabel2: TfcLabel;
    wwDBGrid1: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    cdsOrcamentoCODCONTRATOEMPR: TStringField;
    cdsOrcamentoNOMECONTRATO: TStringField;
    cdsOrcamentoNOME_ITEM: TStringField;
    cdsOrcamentoIDCONTRATO: TFloatField;
    cdsOrcamentoIDOBJETO: TFloatField;
    cdsOrcamentoIDITEM: TFloatField;
    cdsOrcamentoANO: TFloatField;
    cdsOrcamentoMES: TFloatField;
    cdsOrcamentoQTDE: TFloatField;
    cdsOrcamentoVALOR: TFloatField;
    PopupMenuPrint: TPopupMenu;
    MenuItem2: TMenuItem;
    ppRApura: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    lblPeriodoIni: TppLabel;
    lblPeriodoFinal: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppFooterBand1: TppFooterBand;
    ppLabel9: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppBDEApura: TppBDEPipeline;
    ppFundacao: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    pplFundacao: TppLabel;
    cdsContratoProcessa: TCMClientDataSet;
    cdsItens: TCMClientDataSet;
    ppLabel309: TppLabel;
    cdsOrcamentoTOTAL: TFloatField;
    ppDBText8: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel10: TppLabel;
    cdsOrcamentoFORMA: TStringField;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure dbgContratosDblClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsOrcamentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    CtrlContrRateioOrc : TCtrlContratoRateioOrc;
  public
    { Public declarations }
  end;

var
  frmExecApuracaoOrc: TfrmExecApuracaoOrc;

implementation

{$R *.DFM}

uses uMensErro;


procedure TfrmExecApuracaoOrc.FormCreate(Sender: TObject);
var
   iDia, iMes, iAno : Word;
begin
   inherited;
   CtrlContrRateioOrc := TCtrlContratoRateioOrc.Create;
   CtrlContrRateioOrc.InitializeAs(Padroes);
   CtrlContrRateioOrc.CdsContrRateioOrc := cdsOrcamento;
   CtrlContrRateioOrc.cdsContratos      := cdsContratoProcessa;
   CtrlContrRateioOrc.cdsItens          := cdsItens;

   DecodeDate(Date, iAno, iMes, iDia);
   spnAnoApura.Value    := iAno + 1;
   spExercicioIni.Value := iAno;
   spExercicioFim.Value := iAno;
   sqlFormulas.Open;
end;



procedure TfrmExecApuracaoOrc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( CtrlContrRateioOrc );
   inherited;
end;



procedure TfrmExecApuracaoOrc.btnContinuarClick(Sender: TObject);
var
   iFormula   : Integer;
   iContrato  : Integer;
   bProcessou : Boolean;
   iContador  : Integer;
begin
   inherited;
   iFormula   := -1;
   iContrato  := -1;
   bProcessou := False;

   if dbcboFormula.LookupValue <> '' then iFormula  := StrToInt(dbcboFormula.LookupValue);
   if molContrato.iContrato > 0      then iContrato := molContrato.iContrato;

   if PagControle.ActivePageIndex = 1 then
   begin
      cdsContratos.Data := CtrlContrRateioOrc.ListaContratosParaOrcamento(iContrato,iFormula);
   end;

   if PagControle.ActivePageIndex = 2 then
   begin
      cdsOrcamento.Data := CtrlContrRateioOrc.LookupRateiosLancados(Trunc(spnAnoApura.Value),iContrato);
      cdsOrcamento.DisableControls;

      if chkExclui.Checked then
      begin
         while not cdsOrcamento.eof do cdsOrcamento.Delete;
      end;

      iContador      := 0;
      frmProgresso.MostraFormProgresso('Processando apuração orçamentária',
                                       True,False,True,0,cdsContratos.RecordCount);
      cdsContratos.First;
      while not cdsContratos.eof do
      begin
         iContrato := cdsContratos.FieldByName('IDCONTRATO').AsInteger;
         Inc(iContador);
         frmProgresso.AndaFormProgresso(iContador);
         if cdsContratos.FieldByName('FLGPROCESSA').AsInteger = 1 then
         begin
            CtrlContrRateioOrc.ProcessaCalculoOrcamento(dbComboPeriodoIni.ItemIndex+1,
                                                        Trunc(spExercicioIni.Value),
                                                        dbComboPeriodoFim.ItemIndex+1,
                                                        Trunc(spExercicioFim.Value),
                                                        Trunc(spnAnoApura.Value),
                                                        iContrato,
                                                        iFormula
                                                        );
            bProcessou := True;
         end;
         cdsContratos.Next;
      end;

      if not bProcessou then cdsOrcamento.Data := CtrlContrRateioOrc.LookupRateiosLancados(1899,iContrato);

      cdsOrcamento.First;
      cdsOrcamento.IndexFieldNames := 'IDCONTRATO;IDITEM;ANO;MES';
      cdsOrcamento.EnableControls;

      frmProgresso.EscondeFormProgresso;
   end;
end;



procedure TfrmExecApuracaoOrc.dbgContratosDblClick(Sender: TObject);
begin
   inherited;
   cdsContratos.Edit;
   if cdsContratos.FieldByName('FLGPROCESSA').AsInteger = 0 then
      cdsContratos.FieldByName('FLGPROCESSA').AsInteger := 1
   else
      cdsContratos.FieldByName('FLGPROCESSA').AsInteger := 0;
   cdsContratos.Post;
end;



procedure TfrmExecApuracaoOrc.MenuItem2Click(Sender: TObject);
begin
  inherited;

  pplFundacao.Caption     := Sistema.NomeEmpresa;
  lblPeriodoIni.Caption   := dbComboPeriodoIni.Text + '/' + IntToStr(Trunc(spExercicioIni.Value));
  lblPeriodoFinal.Caption := dbComboPeriodoFim.Text + '/' + IntToStr(Trunc(spExercicioFim.Value));

  cdsOrcamento.DisableControls;
  TFrmPreview.CreateModalPreview(Application, ppRApura, 'Apuração orçametária');
  cdsOrcamento.EnableControls;
end;



procedure TfrmExecApuracaoOrc.btnConfirmarClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma gravar os cálculos?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      CtrlContrRateioOrc.GravaContratoRateioOrc;
end;



procedure TfrmExecApuracaoOrc.cdsOrcamentoCalcFields(DataSet: TDataSet);
begin
   inherited;
   cdsOrcamentoTOTAL.AsFloat := cdsOrcamentoVALOR.AsFloat * cdsOrcamentoQTDE.ASFloat;
end;



end.
