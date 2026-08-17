unit FConfigEtiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, wwQuery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus, Wwdbspin, uEtiquetaCM, ppEndUsr, ppRelatv, ppDBPipe,
  CmEventosCadastro, ImgList, ppComm, ppDB, ppDBBDE, ppProd, ppClass,
  ppReport, ppForms, ppBands, ppCache, uModeloRelatCM, uCmTypes;

type
  TFrmConfigEtiq = class(TfrmCadastroCS)
    QrySql: TwwQuery;
    DsConsulta: TwwDataSource;
    ppConsulta: TppBDEPipeline;
    ppRelatorio: TppBDEPipeline;
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
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
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
    qryIDETIQUETA: TFloatField;
    qryMODELOETIQ: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryNUMCOLUNAS: TFloatField;
    qryNUMCHARLARGURA: TFloatField;
    qryNUMLINHAS: TFloatField;
    qryNUMLINHASESPACO: TFloatField;
    BtnTestaImpressao: TToolbarButton97;
    Label6: TLabel;
    SedEspEtiq: TwwDBSpinEdit;
    qryNUMCHARENTREETIQ: TFloatField;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
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
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    bCriaTemplate: Boolean;
    bAlteraLayout: Boolean;
    aRptMemoryStream :TMemoryStream;    
    procedure SetaDadosRpt;
  public
    { Public declarations }
  end;

var
  FrmConfigEtiq: TFrmConfigEtiq;

implementation

Uses uSistema, uDataBase, uMensErro;

{$R *.DFM}

procedure TFrmConfigEtiq.BtnDesenhoClick(Sender: TObject);
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
          qryReportsTEMPLATE.SaveToStream(aRptMemoryStream);
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

procedure TFrmConfigEtiq.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  QryIdEtiqueta.AsFloat  := LeUltRegistro(nil,'ETIQUETA');
  QryIDREPORTS.AsInteger := LeUltRegistro(nil,'REPORTS');
  QryORIGEMCM.AsInteger  := 0;
  bCriaTemplate := True;
  bAlteraLayout := False;
End;

procedure TFrmConfigEtiq.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  bCriaTemplate := True;
  qryReports.Close;
  If Not qryReports.Prepared Then qryReports.Prepare;
  qryReports.Params[0].AsInteger := qryIDREPORTS.AsInteger;
  qryReports.Params[1].AsInteger := qryORIGEMCM.AsInteger;
  qryReports.Open;
  bAlteraLayout := False;
end;

procedure TFrmConfigEtiq.FormCreate(Sender: TObject);
begin
  inherited;
  If Not Qry.Prepared Then Qry.Prepare;
  If Not qryReports.Prepared Then qryReports.Prepare;
  qry.Open;
  aRptMemoryStream := TMemoryStream.Create;
  ModeloRelatCM := TModeloRelatCM.Create;
end;

procedure TFrmConfigEtiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If Qry.Active Then Qry.Close;
  If qryReports.Active Then qryReports.Close;
  If Qry.Prepared Then Qry.unPrepare;
  If qryReports.Prepared Then qryReports.unPrepare;
  inherited;

  aRptMemoryStream.Free;
  ModeloRelatCM.Free;
end;

procedure TFrmConfigEtiq.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  SetaDadosRpt;
  aRptMemoryStream.Clear;  
  RptCM.Template.SaveToStream(aRptMemoryStream);
end;

procedure TFrmConfigEtiq.Sair1Click(Sender: TObject);
begin
  inherited;
  SetaDadosRpt;
  aRptMemoryStream.Clear;    
  RptCM.Template.SaveToStream(aRptMemoryStream);
  DsgnCM.Close;
end;

procedure TFrmConfigEtiq.SetaDadosRpt;
begin
   RptCM.DataPipeline := ppConsulta;
End;

procedure TFrmConfigEtiq.mniFilePageSetupClick(Sender: TObject);
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

procedure TFrmConfigEtiq.mniFilePrintClick(Sender: TObject);
begin
  inherited;
  if (DsgnCM.Report = nil) then Exit;
      DsgnCM.PrintReport;
end;

procedure TFrmConfigEtiq.mniFilePrintToFileSetupClick(Sender: TObject);
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

Procedure TFrmConfigEtiq.CmeCadastroConfirma(Sender: TObject);
Begin
    qryReports.Close;
    If Not qryReports.Prepared Then qryReports.Prepare;
    qryReports.Params[0].AsInteger := QryIDREPORTS.AsInteger;
    qryReports.Params[1].AsInteger := 0;
    qryReports.Open;

    If CmeCadastro.Operacao In [OpInserir,OpAlterar] Then
    Begin
       Try
          StartTransacao;

          qryReports.Edit;
          qryReportsIDREPORTS.AsInteger := QryIDREPORTS.AsInteger;
          qryReportsNAME.AsString       := 'TEtiqueta';
          aRptMemoryStream.Position := 0;
          qryReportsTEMPLATE.LoadFromStream(aRptMemoryStream);
          qryReports.Post;
          qryReports.Close;

          CommitTransacao;
       Except
          RollbackTransacao;
          Raise;
       End;
    End;

    If FileExists(Sistema.TempDir + ArqCmEtiqueta) Then
       DeleteFile(Sistema.TempDir + ArqCmEtiqueta);


    inherited;

    If CmeCadastro.Operacao = opApagar Then
    Begin
       Try
          StartTransacao;

          If Not qryReports.IsEmpty Then qryReports.Delete;
          qryReports.Close;
          CommitTransacao;
       Except
          RollbackTransacao;
          Raise;
       End;
    End;
End;

Procedure TFrmConfigEtiq.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
     qry.Close;
     If Not qry.Prepared Then qry.Prepare;
     qry.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
  End;
End;

procedure TFrmConfigEtiq.DsgnCMCreate(Sender: TObject);
Var
 X,Y: Integer;
begin
  inherited;
{
  mniFile &Arquivo
  mniFileNew &Novo
  mniFileOpen &Abrir
  mniFileClose &Fechar
  mniFileLine1  -
  mniFileSave  A&brir Modelo
  mniFileSaveAs  Sa&lvar Modelo Como...
  mniFileLine3  -
  mniFilePageSetup  &Configurar Página
  mniFilePrint  &Imprimir
  mniFileLine4  -
  mniFilePrintToFileSetup  Print to &File Setup...
  *
  mniEdit  &Editar
  mniEditUndo  &Desfazer
  mniEditRedo  &Refazer
  mniEditLine1  -
  mniEditCut  &Recortar
  mniEditCopy  &Copiar
  mniEditPaste  C&olar
  mniEditDelete  &Apagar
  mniEditSelectAll  Se&elecionar Todos
  mniEditLine2  -
  mniEditBringToFront  Trazer para &Frente
  mniEditSendToBack  Enviar para &Traz
  *
  mniView  &Visualisar
  mniViewToolbars  Toolbars
  mniViewRulers  &Réguas
  mniViewGridOptions  &Opções da Grade
  mniViewLine1  -
  mniViewShowData  &Exibir Dados
  mniViewLine3  -
  mniViewOutline  Ou&tline
  *
  mniReport  &Relatório
  mniReportData  &Dados
  N1  -
  mniReportTitle  &Titúlo
  mniReportSummary  &Sumário
  mniReportLine1  -
  mniReportHeader  &Cabeçalho
  mniReportFooter  &Rodapé
  mniReportLine2  -
  mniReportGroups  &Grupos
  mniReportLine3  -
  mniReportPortrait  &Retrato
  mniReportLandscape  &Paisagem
  mniReportLine4  -
  mniReportUnits  &Units
  *
  mniHelp  &Ajuda
  mniHelpContents  Tópicos da &Ajuda
  mniMHelpLine1  -
  mniHelpAbout  &About...
  *

  ** Lista para um memo todos os Menus e Submenus do Design de relatórios}

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

procedure TFrmConfigEtiq.BtnTestaImpressaoClick(Sender: TObject);
begin
  inherited;
  EtiquetaCm := TEtiquetaCm.Create;
  EtiquetaCm.NumColunas       := StrToIntDef(SedtColuna.Text, 0);
  EtiquetaCm.NumCharLargura   := StrToIntDef(SedtLargura.Text, 0);
  EtiquetaCm.NumLinhas        := StrToIntDef(SedtLinhas.Text, 0);
  EtiquetaCm.NumLinhasEspaco  := StrToIntDef(SedtEtiq.Text, 0);
  EtiquetaCm.NumCharEntreEtiq := StrToIntDef(SedEspEtiq.Text, 0);
  EtiquetaCm.Imprime(QrySql,'Teste de Impressão');
  EtiquetaCm.Free;
end;

procedure TFrmConfigEtiq.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := bAlteraLayout;
end;

end.
