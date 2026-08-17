unit FPreview;

interface

uses
  Windows, ComCtrls,
  SysUtils, Messages, Classes, Graphics, Controls, ppDevice,
  Forms, ExtCtrls, StdCtrls, Mask, Buttons, Dialogs, ppClass,
  ppForms, ppTypes, ppViewr, ppFilDev, Spin, TB97, MAHlpBtn,
  ppComm, ppProd, ppArchiv, UMensErro, ppReport, ppDBBDE,
  ppCache, ppDB,  Db, ppBands, TB97Tlbr, TB97Ctls, ppRelatv,
  ppDBPipe, Menus, registry, TXComp;

type
  TFrmPreview = class(TppCustomPreviewer)
    ppViewer1: TppViewer;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    spbPreviewClose: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    spbPreview100Percent: TToolbarButton97;
    spbPreviewWhole: TToolbarButton97;
    spbPreviewPrint: TToolbarButton97;
    bbtnAbrir: TToolbarButton97;
    bbtnSalvar: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    lblPrevPct: TLabel;
    spbPreviewWidth: TToolbarButton97;
    ToolbarSep975: TToolbarSep97;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    LblPreviewPage: TLabel;
    spbPreviewPrior: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    SpinEdit1: TSpinEdit;
    arPreview: TppArchiveReader;
    BtnGoToPage: TSpeedButton;
    svReport: TSaveDialog;
    opnReport: TOpenDialog;
    sbnAreader: TToolbarButton97;
    ppmImpAreader: TPopupMenu;
    MnuImprimir: TMenuItem;
    MnuVisualizar: TMenuItem;
    DlgAreade: TOpenDialog;
    ExtReport: TExtraOptions;
    ToolbarSep971: TToolbarSep97;
    btnSendMail: TToolbarButton97;
    btnTelaUnica: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure ppViewerPageChange(Sender: TObject);
    procedure ppViewerStatusChange(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Reposiciona;
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnAbrirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnGoToPageClick(Sender: TObject);
    procedure MnuImprimirClick(Sender: TObject);
    procedure MnuVisualizarClick(Sender: TObject);
    procedure btnSendMailClick(Sender: TObject);
    procedure btnTelaUnicaClick(Sender: TObject);
  private
    FArchiveFileName : string;

  protected
    {overriden from TppForm}
    procedure LanguageChanged; override;
    function  GetViewer: TObject; override;

  public
    constructor CreatePreview(AOwner : TComponent; ArchiveFile : string; ItemCaption : string);
    Class Procedure CreateModalPreview(AOwner : TComponent; appReport: TppReport; ItemCaption : string);
  end; {class, TfrmTwoPagePreview}

var
  FrmPreview: TFrmPreview;
  ChangeZoom : Boolean;

implementation

Uses uSistema, JclShell, FSendMail, uString, uCMFIleUtils;

{$R *.DFM}

constructor TFrmPreview.CreatePreview(AOwner : TComponent; ArchiveFile : string; ItemCaption : string);
begin
     inherited Create(AOwner);
     ppViewer1.Report := arPreview;
     FArchiveFileName := ArchiveFile;
     arPreview.ArchiveFileName := ArchiveFile;

     arPreview.PrintToDevices;
     Caption := ItemCaption;
     ChangeZoom := True;
end;

procedure TFrmPreview.FormCreate(Sender: TObject);
begin
   inherited;
   Icon.Assign(Application.MainForm.Icon);   
end; {procedure FormCreate}

{------------------------------------------------------------------------------}
{ TppPrintPreview.LanguageChanged}

procedure TFrmPreview.LanguageChanged;
var
  lBitMap: TBitMap;
begin
  spbPreviewPrint.Hint := LoadStr(LanguageIndex + ppMsgPrint);
  spbPreviewWhole.Hint := LoadStr(LanguageIndex + ppMsgWhole);
  spbPreviewWidth.Hint := LoadStr(LanguageIndex + ppMsgPageWidth);
  spbPreview100Percent.Hint := LoadStr(LanguageIndex + ppMsg100Percent);
  spbPreviewFirst.Hint := LoadStr(LanguageIndex + ppMsgFirst);
  spbPreviewPrior.Hint := LoadStr(LanguageIndex + ppMsgPrior);
  spbPreviewNext.Hint := LoadStr(LanguageIndex + ppMsgNext);
  spbPreviewLast.Hint := LoadStr(LanguageIndex + ppMsgLast);
  //spbPreviewClose.Caption := LoadStr(LanguageIndex + ppMsgClose);

  lBitMap := TBitMap.Create;
  //spbPreviewClose.Width := lBitMap.Canvas.TextWidth(spbPreviewClose.Caption) + 30;
  lBitMap.Free;

  Caption := LoadStr(LanguageIndex + ppMsgPrintPreview);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppPrintPreview.GetViewer }

function TFrmPreview.GetViewer: TObject;
begin
  Result := ppViewer1;
end; {function, GetViewer}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewer1PrintStateChange }

procedure TFrmPreview.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin
  if ppViewer1.Busy then
     ppViewer1.Cursor := crHourGlass

  else
      ppViewer1.Cursor := crDefault;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);

end;

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbCloseClick }

procedure TFrmPreview.spbPreviewCloseClick(Sender: TObject);
begin
   if (ppViewer1.Report <> nil) And (ppViewer1.Report.Printing) then
     ppViewer1.Cancel
   else
     Close;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewerStatusChange }

procedure TFrmPreview.ppViewerStatusChange(Sender: TObject);
begin
end;
{procedure, ppViewerStatusChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewerPageChange }

procedure TFrmPreview.ppViewerPageChange(Sender: TObject);
begin
     if (ppViewer1.Report <> nil) then
     begin
        If (ppViewer1.Report is TppReport) Then
           LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppReport).AbsolutePageNo) + ' de ' +
           IntToStr((ppViewer1.Report as TppReport).AbsolutePageCount)
        Else
           LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppArchiveReader).ArchivePageNo) + ' de ' +
           IntToStr((ppViewer1.Report as TppArchiveReader).ArchivePageCount);

        ChangeZoom := False;
        SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
        ChangeZoom := True;
     end;
end; {procedure, ppViewerPageChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewPrintClick }

procedure TFrmPreview.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end; {procedure, spbPreviewPrintClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewFirstClick}

procedure TFrmPreview.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewPriorClick}

procedure TFrmPreview.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end; {procedure, spbPreviewFirstClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewNextClick}

procedure TFrmPreview.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end; {procedure, spbPreviewNextClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewLastClick}

procedure TFrmPreview.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end; {procedure, spbPreviewLastClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.mskPreviewPageKeyPress}

procedure TFrmPreview.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
begin

end;

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewZoomClick }

procedure TFrmPreview.spbPreviewWholeClick(Sender: TObject);
begin
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsWholePage;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end; {procedure, spbPreviewZoomClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewWidthClick}

procedure TFrmPreview.spbPreviewWidthClick(Sender: TObject);
begin
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsPageWidth;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end; {procedure, spbPreviewWidthClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreview100PercentClick}

procedure TFrmPreview.spbPreview100PercentClick(Sender: TObject);
begin
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zs100Percent;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end; {procedure, spbPreview100PercentClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.mskPreviewPercentageKeyPress}

procedure TFrmPreview.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
begin
end;

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormClose}

procedure TFrmPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormKeyDown}

procedure TFrmPreview.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not(ssCtrl in Shift) then Exit;

  case Key of
    VK_PRIOR: ppViewer1.PriorPage;
    VK_NEXT:  ppViewer1.NextPage;
    VK_HOME:  ppViewer1.FirstPage;
    VK_END:
      begin
        ppViewer1.ScreenDevice.Active := True;
        ppViewer1.LastPage;
      end;

  end;

end; {procedure, FormResize}


procedure TFrmPreview.SpinEdit1Change(Sender: TObject);
begin
  If Not ChangeZoom Then Exit;
  ppViewer1.ZoomPercentage := StrToIntDef(SpinEdit1.Text,100);
end;

procedure TFrmPreview.Reposiciona;
begin
  if tb97Fundo <> nil then
     tb97Fundo.DockPos := width;
end;

procedure TFrmPreview.FormPaint(Sender: TObject);
begin
   Reposiciona;
end;

procedure TFrmPreview.FormShow(Sender: TObject);
begin
  ppViewerPageChange(Sender); // Atualiza o Contador de Páginas
  spbPreviewWidthClick(Sender); // Atualiza o Zoom Da Página
end;

procedure TFrmPreview.bbtnSalvarClick(Sender: TObject);
{**
Var
  ldlgSave : TSaveDialog;
  lbShowSaveDlg: Boolean;
  lReport: TppCustomReport;
**}
Var
  ArquivoSaida: TppArchiveDevice;
begin
(**
  lReport := (ppViewer1.Report As TppReport);

  {display Save to File dialog }
  ldlgSave := TSaveDialog.Create(Self);
  ldlgSave.DefaultExt := 'RTM';
  ldlgSave.Filter     := 'Arquivos de Relatório|*.RTM|Banco de Dados|*.BCD';
  ldlgSave.Options    := [ofOverWritePrompt, ofPathMustExist, ofHideReadOnly];

  lbShowSaveDlg := True;

  Application.ProcessMessages;

  while lbShowSaveDlg do
    begin
      lbShowSaveDlg := False;

      if ldlgSave.Execute then
        begin
          lReport.Template.FileName := ldlgSave.FileName;
          lReport.Template.Format := ftASCII;

          {re-display the save dialog, if file is read-only}
          if lReport.Template.ReadOnly then
            begin
              //MessageDlg('File is read-only', mtWarning,[mbOK], 0);
              MsgDlg('O Arquivo é só para leitura','Atenção',mtWarning,[mbOK],0);
              lbShowSaveDlg := True;
            end
          else
            lReport.Template.SaveToFile;
        end;
    end;
  ldlgSave.Free;
**)
     if svReport.Execute then
     begin
          ArquivoSaida := TppArchiveDevice.Create(self);
          try
            Screen.Cursor := crHourGlass ;
            ArquivoSaida.FileName := svReport.FileName;
            ArquivoSaida.Publisher := ppViewer1.Report.Publisher ;
            ppViewer1.Report.ResetDevices;
            ppViewer1.Report.PrintToDevices;
            ArquivoSaida.Publisher := nil ;
          finally
             ArquivoSaida.Free;
             Screen.Cursor := crDefault ;
          end;
     end;
end;

procedure TFrmPreview.bbtnAbrirClick(Sender: TObject);
(**
Var
  ldlgOpen : TOpenDialog;
  lsSaveTemplateName: String;
  lReport: TppCustomReport;
  **)
begin
  if opnReport.Execute then
     TfrmPreview.CreatePreview(Application.MainForm, opnReport.FileName, opnReport.FileName);
  (**
  lReport := (ppViewer1.Report As TppReport);

  if (lReport = nil) then Exit;

  {display open dialog }
  ldlgOpen := TOpenDialog.Create(Self);
  ldlgOpen.DefaultExt := 'RTM';
  ldlgOpen.Filter     := 'Arquivos de Relatório|*.RTM';
  ldlgOpen.Options    := [ofFileMustExist, ofHideReadOnly];

  Application.ProcessMessages;

  try
    if ldlgOpen.Execute then
      begin

        lsSaveTemplateName    := lReport.Template.Description;
        lReport.Template.FileName := ldlgOpen.FileName;

        try
          lReport.Template.LoadFromFile;

          {set template properties to connect report database}
          lReport.Template.DatabaseSettings := (ppViewer1.Report as TppReport).Template.DatabaseSettings;
          lReport.Template.DatabaseSettings.Name := lsSaveTemplateName;
          lReport.Modified := True;

          lReport.Language := lgPortugueseBrazil;
          ppViewer1.Report := lReport;
          lReport.PrintToDevices;
        except
          lReport.Template.Description := lsSaveTemplateName;
          MsgDlg('Os Dados do relatório são diferentes dos dados no Preview.','Atenção',mtWarning,[mbOK],0);
        end;
      end;

  finally
    ldlgOpen.Free;
  end; {try }
  **)
end;

procedure TFrmPreview.FormDestroy(Sender: TObject);
begin
     arPreview.ArchiveFileName := '';
     arPreview.Reset ;
     if (UPPERCASE(ExtractFileExt(FArchiveFileName)) = '.TMP') AND
        (Copy(ExtractFileName(FArchiveFileName),1,2) = 'CM') then
        DeleteFile(FArchiveFileName);
end;

procedure TFrmPreview.BtnGoToPageClick(Sender: TObject);
Var
  sPageNumber :String;
begin
  inherited;
  sPageNumber := '1';
  If InputQuery('Visualizar Relatórios','Ir para a página nº',sPageNumber) Then
     ppViewer1.GotoPage(StrToIntDef(sPageNumber,1));
end;

procedure TFrmPreview.MnuImprimirClick(Sender: TObject);
Var
  sAreaderFile: String;
  RegPdf: TRegistry;
begin
  inherited;
  If Assigned(ppViewer1.Report) Then
  Begin
    sAreaderFile := '';
    RegPdf:=TRegistry.Create;
    try
      RegPdf.RootKey:=HKEY_LOCAL_MACHINE;
      RegPdf.OpenKey('Software\CM\' + Sistema.NomeModulo,True);
      sAreaderFile := RegPdf.ReadString('Acrobat Reader File');

      If sAreaderFile = '' Then
      Begin
         If DlgAreade.Execute Then
         Begin
            sAreaderFile := DlgAreade.FileName;
            RegPdf.WriteString('Acrobat Reader File',sAreaderFile);
         End
         Else
           Abort;
      End;

      Screen.Cursor := crHourGlass ;
      ppViewer1.Report.TextFileName := Sistema.TempDir + IntToStr(GetTickCount) + '.pdf';
      ppViewer1.Report.AllowPrintToFile := True;
      ppViewer1.Report.ShowPrintDialog := False;
      ppViewer1.Report.DeviceType :='PDFFile';
      ppViewer1.Report.Print;

      ShellExecAndWait(sAreaderFile,'/p ' + ppViewer1.Report.TextFileName);

    finally
      RegPdf.CloseKey;
      RegPdf.Free;
      ppViewer1.Report.ShowPrintDialog := True;
      ppViewer1.Report.DeviceType := 'Screen';
      Screen.Cursor := crDefault;
      DeleteFile(ppViewer1.Report.TextFileName);
    end;
  end;
end;

procedure TFrmPreview.MnuVisualizarClick(Sender: TObject);
begin
  If Assigned(ppViewer1.Report) Then
    try
      Screen.Cursor := crHourGlass ;
      ppViewer1.Report.TextFileName := Sistema.TempDir + IntToStr(GetTickCount) + '.pdf';
      ppViewer1.Report.AllowPrintToFile := True;
      ppViewer1.Report.ShowPrintDialog := False;
      ppViewer1.Report.DeviceType :='PDFFile';
      ppViewer1.Report.Print;

      ShellExecAndWait(ppViewer1.Report.TextFileName);
    finally
      ppViewer1.Report.ShowPrintDialog := True;
      ppViewer1.Report.DeviceType := 'Screen';
      Screen.Cursor := crDefault;
      DeleteFile(ppViewer1.Report.TextFileName);
    end;
end;

procedure TFrmPreview.btnSendMailClick(Sender: TObject);
Var
  ArquivoSaida :TppArchiveDevice;
  sCaption: String;
begin
  sCaption := Self.Caption;

  If Assigned(ppViewer1.Report) Then
     With TFrmSendMail.Create(Self) Do
     Begin
       ArquivoSaida := TppArchiveDevice.Create(self);
       Try
          sNomeRelat := ExtractFileName(sCaption);
          appViewer := ppViewer1;
          ArquivoRpt := ArquivoSaida;
          ShowModal;
       finally
          If Assigned(ArquivoSaida) Then ArquivoSaida.Free;
          Free;
       end;
     End;
end;

class procedure TFrmPreview.CreateModalPreview(AOwner: TComponent;
  appReport: TppReport; ItemCaption: string);
begin
   With Self.Create(AOwner) Do
     Try
       formStyle := fsNormal;
       Visible := False;
       ppViewer1.Report := appReport;
       Caption := ItemCaption;
       ChangeZoom := True;
       ppViewer1.Report.ResetDevices;
       ppViewer1.Report.PrintToDevices;
       btnTelaUnica.Visible := True;
       ShowModal;
     finally
       Free;
     End;
end;

procedure TFrmPreview.btnTelaUnicaClick(Sender: TObject);
Var
  ArquivoSaida: TppArchiveDevice;
begin
  btnTelaUnica.Enabled := False;
  ArquivoSaida := TppArchiveDevice.Create(Self);
  try

     Screen.Cursor := crHourGlass ;
     ArquivoSaida.FileName := NomeArqTemp;
     ArquivoSaida.Publisher := ppViewer1.Report.Publisher ;

     ppViewer1.Report.ResetDevices;

     ppViewer1.Report.PrintToDevices;
     TfrmPreview.CreatePreview(Application.MainFOrm, ArquivoSaida.FileName, Caption );
     ArquivoSaida.Publisher := nil ;
  finally
     ArquivoSaida.Free;
     Screen.Cursor := crDefault ;
     Application.ProcessMessages;
     btnTelaUnica.Enabled := True;
  end;
end;

end.
