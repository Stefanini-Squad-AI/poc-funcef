unit FCfgEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus, Wwdbspin, uEtiquetaCM, ppEndUsr, ppRelatv, ppDBPipe,
  CmEventosCadastro, ImgList, ppComm, ppDB, ppDBBDE, ppProd, ppClass,
  ppReport, ppForms, ppBands, ppCache, uModeloRelatCM, uCmTypes,
  uCMClientDataSet, uCmSqlParams, wwdbedit, IvDictio, IvMulti, IvEMulti, DBClient,
  uCtrlConfigEtiq;

type
  TfrmCfgEtiqueta = class(TFrmCadastroMT)
    DsConsulta: TwwDataSource;
    ppConsulta: TppBDEPipeline;
    DsgnCM: TppDesigner;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFilePrint: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MnuRlatorio: TMenuItem;
    MnuTitulo: TMenuItem;
    MnuSumario: TMenuItem;
    N2: TMenuItem;
    MnuCabecalho: TMenuItem;
    MnuRodape: TMenuItem;
    N3: TMenuItem;
    MnuGrupos: TMenuItem;
    MnuLInha: TMenuItem;
    MnuRetrato: TMenuItem;
    MnuPaisagem: TMenuItem;
    N5: TMenuItem;
    MnuUnidades: TMenuItem;
    MnuPixelsTela: TMenuItem;
    MnuPixelsImpressora: TMenuItem;
    MnuPolegada: TMenuItem;
    MnuMilimetros: TMenuItem;
    MnuMMilimetros: TMenuItem;
    Label1: TLabel;
    DeEtiqueta: TwwDBEdit;
    BtnDesenho: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SedtColuna: TwwDBSpinEdit;
    SedtLinhas: TwwDBSpinEdit;
    SedtEtiq: TwwDBSpinEdit;
    SedtLargura: TwwDBSpinEdit;
    BtnTestaImpressao: TToolbarButton97;
    Label6: TLabel;
    SedEspEtiq: TwwDBSpinEdit;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    SQL: TCMSqlParams;
    SQLConsulta: TCMSqlParams;
    CdsConsulta: TCMClientDataSet;
    SQLReports: TCMSqlParams;
    CdsReports: TCMClientDataSet;
    CdsConsultaIDPESSOA: TFloatField;
    CdsConsultaNOME: TStringField;
    CdsConsultaLOGRADOURO: TStringField;
    CdsConsultaNUMERO: TStringField;
    CdsConsultaCOMPLEMENTO: TStringField;
    CdsConsultaBAIRRO: TStringField;
    CdsConsultaCIDADE: TStringField;
    CdsConsultaCODESTADO: TStringField;
    CdsConsultaCEP: TStringField;
    CdsConsultaCONTATO: TStringField;
    CdsConsultaMATRICULA: TStringField;
    CdsConsultaSITFUNDACAO: TStringField;
    CdsConsultaMENSAGEM: TStringField;
    procedure BtnDesenhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniFileSaveClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure mniFilePrintClick(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure DsgnCMCreate(Sender: TObject);
    procedure BtnTestaImpressaoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    bCriaTemplate: Boolean;
    bAlteraLayout: Boolean;
    aRptMemoryStream :TMemoryStream;
    _CtrlConfigEtiq: TCtrlConfigEtiq;    
    procedure SetaDadosRpt;
  public
    { Public declarations }
  end;

var
  frmCfgEtiqueta: TfrmCfgEtiqueta;

implementation

Uses uSistema, uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCfgEtiqueta.BtnDesenhoClick(Sender: TObject);
begin
  inherited;
   SetaDadosRpt;
   DsgnCM.Report := RptCM;

   Case  CmeCadastro.Operacao Of
   OpInserir:
     Begin
        If bCriaTemplate Then
        Begin
          aRptMemoryStream.Clear;
          ModeloRelatCM.CmEtiqueta.SaveToStream(aRptMemoryStream);
          bCriaTemplate := False;
        End;
     End;
   OpAlterar:
     Begin
        If bCriaTemplate Then
        Begin
          aRptMemoryStream.Clear;
          TBlobField(CdsReports.FieldByName('TEMPLATE')).SaveToStream(aRptMemoryStream);
          bCriaTemplate := False;
        End;
     End;
   End;

   aRptMemoryStream.Position := 0;
   RptCM.Template.LoadFromStream(aRptMemoryStream);
   SetaDadosRpt;

   DsgnCM.ShowModal;

   aRptMemoryStream.Clear;
   RptCM.Template.SaveToStream(aRptMemoryStream);

   RptCM.Reset;
   RptCM.ResetDevices;

   bAlteraLayout := True;
end;

procedure TfrmCfgEtiqueta.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  bCriaTemplate := True;
  bAlteraLayout := False;
End;

procedure TfrmCfgEtiqueta.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  bCriaTemplate := True;
  CdsReports.Close;

  SQLReports.Prepare;
  SQLReports.ParamByName('IDREPORTS').AsInteger := Cds.FieldByName('IDREPORTS').AsInteger;
  SQLReports.ParamByName('ORIGEMCM').AsInteger := Cds.FieldByName('ORIGEMCM').AsInteger;
  SQLReports.Open;
  bAlteraLayout := False;
end;

procedure TfrmCfgEtiqueta.FormCreate(Sender: TObject);
begin
  inherited;
  _CtrlConfigEtiq := TCtrlConfigEtiq.Create;
  _CtrlConfigEtiq.InitializeAs(Padroes);

  SQL.Prepare;
  SQL.Open;
  
  aRptMemoryStream := TMemoryStream.Create;
  ModeloRelatCM := TModeloRelatCM.Create;
end;

procedure TfrmCfgEtiqueta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If Cds.Active Then Cds.Close;
  If CdsReports.Active Then CdsReports.Close;

  inherited;

  aRptMemoryStream.Free;
  ModeloRelatCM.Free;
  _CtrlConfigEtiq.Free;
end;

procedure TfrmCfgEtiqueta.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  SetaDadosRpt;
  aRptMemoryStream.Clear;  
  RptCM.Template.SaveToStream(aRptMemoryStream);
end;

procedure TfrmCfgEtiqueta.Sair1Click(Sender: TObject);
begin
  inherited;
  SetaDadosRpt;
  aRptMemoryStream.Clear;    
  RptCM.Template.SaveToStream(aRptMemoryStream);
  DsgnCM.Close;
end;

procedure TfrmCfgEtiqueta.SetaDadosRpt;
begin
   RptCM.DataPipeline := ppConsulta;
End;

procedure TfrmCfgEtiqueta.mniFilePageSetupClick(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;

  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPageSetupDialog);
  lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));

  lPageSetupDlg.Report := DsgnCM.CurrentReport;
  lPageSetupDlg.ShowModal;

  lPageSetupDlg.Free;
end;

procedure TfrmCfgEtiqueta.mniFilePrintClick(Sender: TObject);
begin
  inherited;
  if (DsgnCM.Report = nil) then Exit;
      DsgnCM.PrintReport;
end;

procedure TfrmCfgEtiqueta.mniFilePrintToFileSetupClick(Sender: TObject);
var
  lTextFileDialog: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;
  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPrintToFileSetupDialog);

  lTextFileDialog := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

  lTextFileDialog.Report := DsgnCM.Report;
  lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;
  lTextFileDialog.ShowModal;

  lTextFileDialog.Free;
end;

Procedure TfrmCfgEtiqueta.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
     SQL.Prepare;
     SQL.ParamByName('IDETIQUETA').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     SQL.Open;
  End;
End;

procedure TfrmCfgEtiqueta.DsgnCMCreate(Sender: TObject);
Var
 X,Y: Integer;
begin
  inherited;
  For X:=0 To DsgnCM.Menu.items.count - 1 do
  begin
     For y:=0 to DsgnCM.Menu.items[x].Count - 1 do
     Begin
         If DsgnCM.Menu.items[x].items[y].name = 'mniReportData' Then
            DsgnCM.Menu.items[x].items[y].Visible := False
         Else
            If DsgnCM.Menu.items[x].items[y].name = 'N1' Then
               DsgnCM.Menu.items[x].items[y].Visible := False
            Else
               If DsgnCM.Menu.items[x].items[y].name = 'mniViewLine3' Then
                  DsgnCM.Menu.items[x].items[y].Visible := False
               Else
                  If DsgnCM.Menu.items[x].items[y].name = 'mniViewOutline' Then
                     DsgnCM.Menu.items[x].items[y].Visible := False;
     End;
  end;
end;

procedure TfrmCfgEtiqueta.BtnTestaImpressaoClick(Sender: TObject);
begin
  inherited;
  EtiquetaCm := TEtiquetaCm.Create;
  EtiquetaCm.NumColunas       := StrToIntDef(SedtColuna.Text, 0);
  EtiquetaCm.NumCharLargura   := StrToIntDef(SedtLargura.Text, 0);
  EtiquetaCm.NumLinhas        := StrToIntDef(SedtLinhas.Text, 0);
  EtiquetaCm.NumLinhasEspaco  := StrToIntDef(SedtEtiq.Text, 0);
  EtiquetaCm.NumCharEntreEtiq := StrToIntDef(SedEspEtiq.Text, 0);

  SQLConsulta.Open;
  EtiquetaCm.Imprime(CdsConsulta,'Teste de Impressão');
  EtiquetaCm.Free;
end;

procedure TfrmCfgEtiqueta.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := bAlteraLayout;
end;

procedure TfrmCfgEtiqueta.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  SQLReports.Prepare;
  SQLReports.ParamByName('IDREPORTS').AsInteger := Cds.FieldByName('IDREPORTS').AsInteger;
  SQLReports.ParamByName('ORIGEMCM').AsInteger := 0;
  SQLReports.Open;

  Case CmeCadastro.Operacao of
    OpInserir,OpAlterar:
      Begin
         CdsReports.Edit;
         CdsReports.FieldByName('IDREPORTS').AsInteger := Cds.FieldByName('IDREPORTS').AsInteger;
         CdsReports.FieldByName('NAME').AsString := 'TEtiqueta';
         aRptMemoryStream.Position := 0;
         TBlobField(CdsReports.FieldByName('TEMPLATE')).LoadFromStream(aRptMemoryStream);
         CdsReports.Post;
      End;
    opApagar:
      Begin
         If Not CdsReports.IsEmpty Then CdsReports.Delete;
         CdsReports.Close;
      End;
  End;

  Accept := _CtrlConfigEtiq.ProcessaConfig(Cds.Data, CdsReports.Data, CmeCadastro.Operacao);
end;

end.
