unit FCadRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, TB97Ctls, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables, Wwquery, Mask,
  wwdbedit, wwdblook, MontaSelect, ppEndUsr, ppCache, ppDB, ppDBBDE,ppForms,
  ppComm, ppProd, ppClass, ppReport, Menus, ppPrnabl, ppCtrls, ppBands, Pptypes,
  ppDsgnCt, ppUtils, ppSubRpt, ppRuler, ppViewr, ppRegion, ppPrintr,
  ppTmplat, Printers, IvDictio, IvMulti, IvEMulti, fCadastroCs, ppRelatv,
  ppDBPipe, CmEventosCadastro, ImgList;

type
  TFrmCadRelatorios = class(TfrmCadastroCS)
    QryModulo: TwwQuery;
    DsgnCM: TppDesigner;
    ppConsulta: TppBDEPipeline;
    ppRelatorio: TppBDEPipeline;
    DsConsulta: TwwDataSource;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrint: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    QrySql: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    CmbModulo: TwwDBLookupCombo;
    EdtName: TwwDBEdit;
    ChkFiltro: TDBCheckBox;
    MemSql: TDBMemo;
    BitBtn1: TBitBtn;
    DbTemplate: TDBMemo;
    EdtSql: TEdit;
    EdtGrupo: TEdit;
    BtnConsGrupo: TSpeedButton;
    BtnConsSql: TSpeedButton;
    MsConsulta: TMontaSelect;
    MsGrupo: TMontaSelect;
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
    QryModuloIDMODULO: TFloatField;
    QryModuloNOMEMODULO: TStringField;
    qryNAME: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryIDGRUPORELATORIO: TFloatField;
    qryIDDATAVIEW: TFloatField;
    qryIDMODULO: TFloatField;
    qryDESCRIPTION: TMemoField;
    qryFLGFILTROMANUAL: TStringField;
    qryTEMPLATE: TBlobField;
    qryORIGEMCMGR: TFloatField;
    qryORIGEMCMDV: TFloatField;
    qryReports: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure mniFilePrintClick(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure mniFileSaveClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnConsSqlClick(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    bCriaTemplate: Boolean;
    RptCM: TppReport;
    iIdConsulta, iOrigemConsulta, iIdGrupo, iOrigemGrupo: Integer;
    procedure SetaDadosRpt;
  public
    { Public declarations }
  end;

var
  FrmCadRelatorios: TFrmCadRelatorios;

implementation

Uses
  uSistema, uDataBase, DBaseDados, uMensErro, uModeloRelatCM;

{$R *.DFM}

Procedure TFrmCadRelatorios.CmeCadastroFind(Sender: TObject);
Begin
  If MontaSelect.RetornouValor Then
  Begin
     Qry.Close;
     If Not Qry.Prepared Then Qry.Prepare;
     Qry.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     Qry.Params[1].AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     Qry.Open;
  End;
End;

procedure TFrmCadRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Qry.Close;
  If FileExists(Sistema.TempDir + 'RelatorioCM.Tmp') Then
     DeleteFile(Sistema.TempDir + 'RelatorioCM.Tmp');
  action := CaFree;
  inherited;
end;


Procedure TFrmCadRelatorios.CmeCadastroConfirma(Sender: TObject);
Var
  iOldId, iOldDv: Integer;
  sRelatorio, sDescricao: String;
Begin

  iOldId := 0;
  iOldDv := 0;

  inherited;

  If iOldId <> 0 Then
  Begin
     qryReports.Close;
     If Not qryReports.Prepared Then qryReports.Prepare;
     qryReports.Params[0].AsInteger := iOldId;
     qryReports.Params[1].AsInteger := iOldDv;
     qryReports.Open;
     qryReports.Edit;
     qryReports.FieldByName('DESCRIPTION').AsString := sDescricao;
     qryReports.FieldByName('TEMPLATE').AsString    := sRelatorio;
     qryReports.Post;
     qryReports.Close;
  End;

  If FileExists(Sistema.TempDir + 'RelatorioCM.Tmp') Then
     DeleteFile(Sistema.TempDir + 'RelatorioCM.Tmp');
End;

procedure TFrmCadRelatorios.BitBtn1Click(Sender: TObject);
Var
  sSql: String;
begin
  inherited;

  If (EdtName.Text <> '') And (EdtSql.Text <> '') And
     (CmbModulo.Text <> '') And(EdtGrupo.Text <> '') Then
  Begin

     RptCM := TppReport.Create(Application);

     SetaDadosRpt;
     DsgnCM.Report := RptCM;

     QrySql.Close;
     QrySql.Sql.Text := 'SELECT TEMPLATE FROM DATAVIEW WHERE IDDATAVIEW = ' + IntToStr(iIdConsulta) +
                        ' AND ORIGEMCMDV = ' + IntToStr(iOrigemConsulta);
     QrySql.Open;

     sSql := QrySql.FieldByName('TEMPLATE').AsString;

     QrySql.Close;
     QrySql.Sql.Text := sSql;

     RptCM.Template.LoadFromFile;
     SetaDadosRpt;     

     DsgnCM.ShowModal;

     DbTemplate.Lines.LoadFromFile(Sistema.TempDir + 'RelatorioCM.Tmp');

     RptCM.Free;
  End
  Else
     MsgDlg('Antes de desenhar o Relatório, favor informar todos os dados do mesmo','Atenção',MtInformation,[MbOk],0);
end;

procedure TFrmCadRelatorios.mniFilePageSetupClick(Sender: TObject);
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

procedure TFrmCadRelatorios.mniFilePrintClick(Sender: TObject);
begin
  inherited;
  if (DsgnCM.Report = nil) then Exit;
      DsgnCM.PrintReport;
end;

procedure TFrmCadRelatorios.mniFilePrintToFileSetupClick(Sender: TObject);
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

procedure TFrmCadRelatorios.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  SetaDadosRpt;
  RptCM.Template.SaveToFile;
end;

procedure TFrmCadRelatorios.Sair1Click(Sender: TObject);
begin
  inherited;
  SetaDadosRpt;  
  RptCM.Template.SaveToFile;
  DsgnCM.Close;
end;

procedure TFrmCadRelatorios.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  If FileExists(Sistema.TempDir + 'RelatorioCM.Tmp') Then
     DeleteFile(Sistema.TempDir + 'RelatorioCM.Tmp');

  If iOrigemConsulta <> -1 Then
  Begin
    If FazQuery(DtmBaseDados.Qry,'SELECT NAME FROM DATAVIEW WHERE IDDATAVIEW = ' + IntToStr(iIdConsulta) +
                                 ' AND ORIGEMCMDV = ' + IntToStr(iOrigemConsulta)) Then
                                 EdtSql.Text := DtmBaseDados.Qry.Fields[0].AsString;
    If FazQuery(DtmBaseDados.Qry,'SELECT DESCRICAO FROM GRUPORELATORIO WHERE IDGRUPORELATORIO = ' + IntToStr(iIdGrupo) +
                                 ' AND ORIGEMCMGR = ' + IntToStr(iOrigemGrupo)) Then
                                 EdtGrupo.Text := DtmBaseDados.Qry.Fields[0].AsString;
  End;
end;

procedure TFrmCadRelatorios.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  bCriaTemplate := True;
  Qry.FieldByName('ORIGEMCM').AsInteger := 0;
  Qry.FieldByName('IDREPORTS').AsInteger := LeUltRegistro(nil,'REPORTS');
  iIdConsulta     := -1;
  iOrigemConsulta := -1;
  EdtSql.Text     := '';
  iIdGrupo     := -1;
  iOrigemGrupo := -1;
  EdtGrupo.Text     := '';
end;

procedure TFrmCadRelatorios.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  bCriaTemplate := True;
end;

procedure TFrmCadRelatorios.SetaDadosRpt;
begin
     RptCM.Language := lgPortugueseBrazil;
     RptCM.AllowPrintToArchive := True;
     RptCM.AllowPrintToFile := True;
     RptCM.SaveAsTemplate := True;
     RptCM.DataPipeline := ppConsulta;
     RptCM.Template.FileName := Sistema.TempDir   + 'RelatorioCM.Tmp';
     RptCM.Template.Saveto := stFile;
     RptCM.Template.Format := ftASCII;
End;

procedure TFrmCadRelatorios.BtnConsSqlClick(Sender: TObject);
begin
  inherited;
  If MsConsulta.Executar = MrOk Then
  Begin
     iIdConsulta     := StrToInt(MsConsulta.ValoresChave[0]);
     iOrigemConsulta := StrToInt(MsConsulta.ValoresChave[1]);
     EdtSql.Text     := MsConsulta.ValoresChave[2];
  End
  Else
  Begin
     iIdConsulta     := -1;
     iOrigemConsulta := -1;
     EdtSql.Text     := '';
  End;
end;

procedure TFrmCadRelatorios.BtnConsGrupoClick(Sender: TObject);
begin
  inherited;
  If MsGrupo.Executar = MrOk Then
  Begin
     iIdGrupo     := StrToInt(MsGrupo.ValoresChave[0]);
     iOrigemGrupo := StrToInt(MsGrupo.ValoresChave[1]);
     EdtGrupo.Text     := MsGrupo.ValoresChave[2];
  End
  Else
  Begin
     iIdGrupo     := -1;
     iOrigemGrupo := -1;
     EdtGrupo.Text     := '';
  End;
end;

procedure TFrmCadRelatorios.bbtnConfirmarClick(Sender: TObject);
begin
  If (Trim(EdtName.Text) = '') Or (EdtSql.Text = '') Or
     (CmbModulo.Text = '') Or(EdtGrupo.Text = '') Then
     MsgDlg('Favor informar todos os dados do Relatório','Atenção',MtInformation,[MbOk],0)
  Else
     inherited;
end;

procedure TFrmCadRelatorios.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  If (Not Qry.IsEmpty) And (Qry.State = DsBrowse) Then
  Begin
    iOrigemConsulta := QryORIGEMCMDV.AsInteger;
    iIdConsulta     := QryIDDATAVIEW.AsInteger;
    iIdGrupo        := QryIDGRUPORELATORIO.AsInteger;
    iOrigemGrupo    := QryORIGEMCMGR.AsInteger;
    If FazQuery(DtmBaseDados.Qry,'SELECT NAME FROM DATAVIEW WHERE IDDATAVIEW = ' + IntToStr(iIdConsulta) +
                                 ' AND ORIGEMCMDV = ' + IntToStr(iOrigemConsulta)) Then
                                 EdtSql.Text := DtmBaseDados.Qry.Fields[0].AsString;
    If FazQuery(DtmBaseDados.Qry,'SELECT DESCRICAO FROM GRUPORELATORIO WHERE IDGRUPORELATORIO = ' + IntToStr(iIdGrupo) +
                                 ' AND ORIGEMCMGR = ' + IntToStr(iOrigemGrupo)) Then
                                 EdtGrupo.Text := DtmBaseDados.Qry.Fields[0].AsString;
  End;
end;

procedure TFrmCadRelatorios.FormActivate(Sender: TObject);
begin
  inherited;
  Qry.Open;
  QryModulo.Open;
end;

procedure TFrmCadRelatorios.FormShow(Sender: TObject);
begin
  inherited;
end;

end.



