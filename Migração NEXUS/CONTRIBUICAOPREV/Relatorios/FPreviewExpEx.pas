// Alterações:
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Criação da tela
//------------------------------------------------------------------------------

unit FPreviewExpEx;

interface

uses
  Windows, ComCtrls, SysUtils, Messages, Classes, Graphics, Controls, ppDevice,
  Forms, ExtCtrls, StdCtrls, Mask, Buttons, Dialogs, ppClass, ppForms, ppTypes,
  ppViewr, ppFilDev, Spin, TB97, MAHlpBtn, ppComm, ppProd, ppArchiv, UMensErro,
  ppReport, ppDBBDE, ppCache, ppDB, Db, ppBands, TB97Tlbr, TB97Ctls, ppRelatv,
  ppDBPipe, Menus, registry, TXComp, TXRB, QExport3Dialog, QExport3XLS, QExport3,
  Wwdatsrc;

type
  TFrmPreviewExpEx = class(TppCustomPreviewer)
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
    ToolbarSep972: TToolbarSep97;
    qe3dPadrao: TQExport3Dialog;
    btnExportar: TBitBtn;
    btnTelaUnica: TBitBtn;
    tlbrsp: TToolbarSep97;
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure ppViewerPageChange(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure btnExportarClick(Sender: TObject);
  private
    FArchiveFileName: string;
    dsRel: TwwDataSource;
  protected
    {overriden from TppForm}
    procedure LanguageChanged; override;
    function GetViewer: TObject; override;
  public
    constructor CreatePreview(AOwner: TComponent; ArchiveFile: string; ItemCaption: string; ds: TwwDataSource);
    class procedure CreateModalPreview(AOwner: TComponent; appReport: TppReport; ItemCaption: string; ds: TwwDataSource);
  end; {class, TfrmTwoPagePreview}

var
  FrmPreviewExpEx: TFrmPreviewExpEx;
  ChangeZoom: Boolean;

implementation

uses
  uSistema, JclShell, FSendMail, uString, uCMFIleUtils;

{$R *.DFM}

constructor TFrmPreviewExpEx.CreatePreview(AOwner: TComponent; ArchiveFile: string; ItemCaption: string; ds: TwwDataSource);
begin
  inherited Create(AOwner);
  ppViewer1.Report := arPreview;
  FArchiveFileName := ArchiveFile;
  arPreview.ArchiveFileName := ArchiveFile;

  arPreview.PrintToDevices;
  Caption := ItemCaption;
  ChangeZoom := True;
  dsRel := ds;
end;

procedure TFrmPreviewExpEx.FormCreate(Sender: TObject);
begin
  inherited;
  Icon.Assign(Application.MainForm.Icon);
end; {procedure FormCreate}

{------------------------------------------------------------------------------}
{ TppPrintPreview.LanguageChanged}

procedure TFrmPreviewExpEx.LanguageChanged;
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

  lBitMap := TBitMap.Create;

  lBitMap.Free;

  Caption := LoadStr(LanguageIndex + ppMsgPrintPreview);

end; {procedure, LanguageChanged}

function TFrmPreviewExpEx.GetViewer: TObject;
begin
  Result := ppViewer1;
end;

procedure TFrmPreviewExpEx.ppViewer1PrintStateChange(Sender: TObject);
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

procedure TFrmPreviewExpEx.spbPreviewCloseClick(Sender: TObject);
begin
  if (ppViewer1.Report <> nil) and (ppViewer1.Report.Printing) then
    ppViewer1.Cancel
  else
    Close;
end;

procedure TFrmPreviewExpEx.ppViewerPageChange(Sender: TObject);
begin
  if (ppViewer1.Report <> nil) then
  begin
    if (ppViewer1.Report is TppReport) then
      LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppReport).AbsolutePageNo) + ' de ' + IntToStr((ppViewer1.Report as TppReport).AbsolutePageCount)
    else
      LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppArchiveReader).ArchivePageNo) + ' de ' + IntToStr((ppViewer1.Report as TppArchiveReader).ArchivePageCount);

    ChangeZoom := False;
    SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
    ChangeZoom := True;
  end;
end;

procedure TFrmPreviewExpEx.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end;

procedure TFrmPreviewExpEx.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end;

procedure TFrmPreviewExpEx.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end;

procedure TFrmPreviewExpEx.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end;

procedure TFrmPreviewExpEx.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end;

procedure TFrmPreviewExpEx.spbPreviewWholeClick(Sender: TObject);
begin
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsWholePage;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TFrmPreviewExpEx.spbPreviewWidthClick(Sender: TObject);
begin
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsPageWidth;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TFrmPreviewExpEx.spbPreview100PercentClick(Sender: TObject);
begin
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zs100Percent;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TFrmPreviewExpEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPreviewExpEx.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (ssCtrl in Shift) then
    Exit;

  case Key of
    VK_PRIOR:
      ppViewer1.PriorPage;
    VK_NEXT:
      ppViewer1.NextPage;
    VK_HOME:
      ppViewer1.FirstPage;
    VK_END:
      begin
        ppViewer1.ScreenDevice.Active := True;
        ppViewer1.LastPage;
      end;

  end;

end;

procedure TFrmPreviewExpEx.SpinEdit1Change(Sender: TObject);
begin
  if not ChangeZoom then
    Exit;
  ppViewer1.ZoomPercentage := StrToIntDef(SpinEdit1.Text, 100);
end;

procedure TFrmPreviewExpEx.Reposiciona;
begin
  if tb97Fundo <> nil then
    tb97Fundo.DockPos := width;
end;

procedure TFrmPreviewExpEx.FormPaint(Sender: TObject);
begin
  Reposiciona;
end;

procedure TFrmPreviewExpEx.FormShow(Sender: TObject);
begin
  ppViewerPageChange(Sender); // Atualiza o Contador de Páginas
  spbPreviewWidthClick(Sender); // Atualiza o Zoom Da Página
end;

procedure TFrmPreviewExpEx.bbtnSalvarClick(Sender: TObject);
var
  ArquivoSaida: TppArchiveDevice;
begin

  if svReport.Execute then
  begin
    ArquivoSaida := TppArchiveDevice.Create(self);
    try
      Screen.Cursor := crHourGlass;
      ArquivoSaida.FileName := svReport.FileName;
      ArquivoSaida.Publisher := ppViewer1.Report.Publisher;
      ppViewer1.Report.ResetDevices;
      ppViewer1.Report.PrintToDevices;
      ArquivoSaida.Publisher := nil;
    finally
      ArquivoSaida.Free;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmPreviewExpEx.bbtnAbrirClick(Sender: TObject);
begin
  if opnReport.Execute then
    TFrmPreviewExpEx.CreatePreview(Application.MainForm, opnReport.FileName, opnReport.FileName, dsRel);

end;

procedure TFrmPreviewExpEx.FormDestroy(Sender: TObject);
begin
  arPreview.ArchiveFileName := '';
  arPreview.Reset;
  if (UPPERCASE(ExtractFileExt(FArchiveFileName)) = '.TMP') and (Copy(ExtractFileName(FArchiveFileName), 1, 2) = 'CM') then
    DeleteFile(FArchiveFileName);
end;

procedure TFrmPreviewExpEx.BtnGoToPageClick(Sender: TObject);
var
  sPageNumber: string;
begin
  inherited;
  sPageNumber := '1';
  if InputQuery('Visualizar Relatórios', 'Ir para a página nº', sPageNumber) then
    ppViewer1.GotoPage(StrToIntDef(sPageNumber, 1));
end;

procedure TFrmPreviewExpEx.MnuImprimirClick(Sender: TObject);
var
  sAreaderFile: string;
  RegPdf: TRegistry;
begin
  inherited;
  if Assigned(ppViewer1.Report) then
  begin
    sAreaderFile := '';
    RegPdf := TRegistry.Create;
    try
      RegPdf.RootKey := HKEY_LOCAL_MACHINE;
      RegPdf.OpenKey('Software\CM\' + Sistema.NomeModulo, True);
      sAreaderFile := RegPdf.ReadString('Acrobat Reader File');

      if sAreaderFile = '' then
      begin
        if DlgAreade.Execute then
        begin
          sAreaderFile := DlgAreade.FileName;
          try
            RegPdf.WriteString('Acrobat Reader File', sAreaderFile);
          except

          end;
        end
        else
          Abort;
      end;

      Screen.Cursor := crHourGlass;
      ppViewer1.Report.TextFileName := Sistema.TempDir + IntToStr(GetTickCount) + '.pdf';
      ppViewer1.Report.AllowPrintToFile := True;
      ppViewer1.Report.ShowPrintDialog := False;
      ppViewer1.Report.DeviceType := 'PDFFile';
      ppViewer1.Report.Print;

      ShellExecAndWait(sAreaderFile, '/p ' + ppViewer1.Report.TextFileName);

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

procedure TFrmPreviewExpEx.MnuVisualizarClick(Sender: TObject);
begin
  if Assigned(ppViewer1.Report) then
  try
    Screen.Cursor := crHourGlass;
    ppViewer1.Report.TextFileName := Sistema.TempDir + IntToStr(GetTickCount) + '.pdf';
    ppViewer1.Report.AllowPrintToFile := True;
    ppViewer1.Report.ShowPrintDialog := False;
    ppViewer1.Report.DeviceType := 'PDFFile';
    ppViewer1.Report.Print;

    ShellExecAndWait(ppViewer1.Report.TextFileName);
  finally
    ppViewer1.Report.ShowPrintDialog := True;
    ppViewer1.Report.DeviceType := 'Screen';
    Screen.Cursor := crDefault;
    DeleteFile(ppViewer1.Report.TextFileName);
  end;
end;

procedure TFrmPreviewExpEx.btnSendMailClick(Sender: TObject);
var
  ArquivoSaida: TppArchiveDevice;
  sCaption: string;
begin
  sCaption := Self.Caption;

  if Assigned(ppViewer1.Report) then
    with TFrmSendMail.Create(Self) do
    begin
      ArquivoSaida := TppArchiveDevice.Create(self);
      try
        sNomeRelat := ExtractFileName(sCaption);
        appViewer := ppViewer1;
        ArquivoRpt := ArquivoSaida;
        ShowModal;
      finally
        if Assigned(ArquivoSaida) then
          ArquivoSaida.Free;
        Free;
      end;
    end;
end;

class procedure TFrmPreviewExpEx.CreateModalPreview(AOwner: TComponent; appReport: TppReport; ItemCaption: string; ds: TwwDataSource);
begin
  with Self.Create(AOwner) do
  try
    formStyle := fsNormal;
    Visible := False;
    ppViewer1.Report := appReport;
    Caption := ItemCaption;
    ChangeZoom := True;
    ppViewer1.Report.ResetDevices;
    ppViewer1.Report.PrintToDevices;
    btnTelaUnica.Visible := True;
    dsRel := ds;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFrmPreviewExpEx.btnTelaUnicaClick(Sender: TObject);
var
  ArquivoSaida: TppArchiveDevice;
begin
  btnTelaUnica.Enabled := False;
  ArquivoSaida := TppArchiveDevice.Create(Self);
  try

    Screen.Cursor := crHourGlass;
    ArquivoSaida.FileName := NomeArqTemp;
    ArquivoSaida.Publisher := ppViewer1.Report.Publisher;

    ppViewer1.Report.ResetDevices;

    ppViewer1.Report.PrintToDevices;
    TFrmPreviewExpEx.CreatePreview(Application.MainFOrm, ArquivoSaida.FileName, Caption, dsRel);
    ArquivoSaida.Publisher := nil;
  finally
    ArquivoSaida.Free;
    Screen.Cursor := crDefault;
    Application.ProcessMessages;
    btnTelaUnica.Enabled := True;
  end;
end;

procedure TFrmPreviewExpEx.btnExportarClick(Sender: TObject);
begin
  qe3dPadrao.DataSet := dsRel.DataSet;
  qe3dPadrao.Execute;
end;

end.

