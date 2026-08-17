unit FCMPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Spin, MAHlpBtn, Buttons, ExtCtrls, QrPrntr, QuickRpt, QrCtrls,
  ComCtrls, ToolWin, FSairAjuda, TB97, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmCMPreview = class(TfrmSairAjuda)
    OpenDlg: TOpenDialog;
    SaveDlg: TSaveDialog;
    PrintDlg: TPrintDialog;
    bbtnProxPag: TSpeedButton;
    bbtnUltPag: TSpeedButton;
    bbtnPagAnt: TSpeedButton;
    bbtnPrimPag: TSpeedButton;
    lblPagina: TLabel;
    qrprv: TQRPreview;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnLargPag: TToolbarButton97;
    bbtnPagInt: TToolbarButton97;
    bbtnImprimir: TToolbarButton97;
    bbtnAbrir: TToolbarButton97;
    bbtnSalvar: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    procedure SpinEdit1Change(Sender: TObject);
    procedure bbtnLargPagClick(Sender: TObject);
    procedure bbtnPagIntClick(Sender: TObject);
    procedure bbtnPrimPagClick(Sender: TObject);
    procedure bbtnPagAntClick(Sender: TObject);
    procedure bbtnProxPagClick(Sender: TObject);
    procedure bbtnUltPagClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnAbrirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnPagIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnImprimirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrprvPageAvailable(Sender: TObject; PageNum: Integer);
    procedure SetPrinter(p : TQRPrinter);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCMPreview: TfrmCMPreview;

implementation

{$R *.DFM}

uses FCadastro;

procedure TfrmCMPreview.bbtnAbrirClick(Sender: TObject);
begin
  inherited;
  with TOpenDialog.Create(Application) do
  try
    Filter := '(*.rel)|*.rel';
    if Execute then
      if FileExists(FileName) then
      begin
        qrprv.QRPrinter.Load(Filename);
        qrprv.PageNumber := 1;
        qrprv.PreviewImage.PageNumber := 1;
        Caption := 'Visualizar Impressão: ' + qrprv.QRPrinter.Title;
      end
      else
        ShowMessage('');
  finally
    free;
  end;
end;

procedure TfrmCMPreview.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
        then qrprv.QRPrinter.Save(SaveDlg.FileName);
end;

procedure TfrmCMPreview.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with PrintDlg do begin
      MaxPage  := qrprv.QRprinter.PageCount;
      FromPage := 1;
      ToPage   := MaxPage;
      if Execute
      then begin
         {QRprinter.FromPage := FromPage;
         QRprinter.ToPage   := ToPage;}
         qrprv.QRprinter.Print;
      end;
   end; { with }
end;

{Procedimento para mostrar a página inteira do relatório}
procedure TfrmCMPreview.bbtnPagIntClick(Sender: TObject);
begin
  inherited;
  Application.ProcessMessages;
  qrprv.ZoomToFit;
  SpinEdit1.Value := qrprv.Zoom;
end;

{Procedimento para ampliar o relatório até o tamanho da página}
procedure TfrmCMPreview.bbtnLargPagClick(Sender: TObject);
begin
  inherited;
  qrprv.Zoom := 100;
  SpinEdit1.Value := qrprv.Zoom;
end;

{Procedimento para dar ZOOM no relatório}
procedure TfrmCMPreview.SpinEdit1Change(Sender: TObject);
var sTroca : string;
begin
  inherited;
  try
     { By Marcia with Joselmo's help }
     sTroca := SpinEdit1.Text;
     if sTroca = '' then Exit;
     
     if SpinEdit1.Value > SpinEdit1.MaxValue
        then SpinEdit1.Value := SpinEdit1.MaxValue;
     qrprv.Zoom := SpinEdit1.Value;
  except
     on Exception do;
  end;
end;

{Ir para a primeira página}
procedure TfrmCMPreview.bbtnPrimPagClick(Sender: TObject);
begin
  inherited;
  with qrprv do
     if PageNumber <> 1
     then begin
          PageNumber := 1;
          lblPagina.Caption := Format('Pág. %d de %d', [PageNumber, QRPrinter.PageCount]);//Format('Pág. %d', [PageNumber]);
     end;
end;

{Ir para a página anterior}
procedure TfrmCMPreview.bbtnPagAntClick(Sender: TObject);
begin
  inherited;
  with qrprv do
     if PageNumber <> 1
     then begin
          PageNumber := PageNumber - 1;
          lblPagina.Caption := Format('Pág. %d de %d', [PageNumber, QRPrinter.PageCount]);
          //lblPagina.Caption := Format('Pág. %d', [PageNumber]);
     end;
end;

{Ir para a próxima página}
procedure TfrmCMPreview.bbtnProxPagClick(Sender: TObject);
begin
  inherited;
  with qrprv do
     if QRPrinter.PageCount <> PageNumber
     then begin
          PageNumber := PageNumber + 1;
          lblPagina.Caption := Format('Pág. %d de %d', [PageNumber, QRPrinter.PageCount]);
          //lblPagina.Caption := Format('Pág. %d', [PageNumber]);
     end
end;

{Ir para a última página}
procedure TfrmCMPreview.bbtnUltPagClick(Sender: TObject);
begin
  inherited;
  with qrprv do
     if PageNumber <> QRPrinter.PageCount then
     begin
          PageNumber := QRPrinter.PageCount;
          lblPagina.Caption := Format('Pág. %d de %d', [QRPrinter.PageCount, QRPrinter.PageCount]);
          //lblPagina.Caption := Format('Pág. %d', [PageNumber]);
      end;
end;

{Parâmetros de abertura do relatório}
procedure TfrmCMPreview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
   VK_PRIOR:
      if ssCtrl in Shift
      then begin
           with qrprv.VertScrollBar do
                Position := 0;
                Key := 0;
      end
      else begin
            bbtnPagAntClick(bbtnPagAnt);
            Key := 0;
      end;
   VK_NEXT :
      if ssCtrl in Shift
      then begin
           with qrprv.VertScrollBar do
                Position := Range;
                Key := 0;
      end
      else begin
           bbtnProxPagClick(bbtnProxPag);
           Key := 0;
      end;
   VK_UP :
      if ssAlt in Shift
      then begin
           with qrprv.VertScrollBar do
                Position := Position - Increment;
                Key := 0;
      end;
   VK_DOWN :
      if ssAlt in Shift
      then begin
           with qrprv.VertScrollBar do
                Position := Position + Increment;
                Key := 0;
           end;
   VK_LEFT :
      if ssAlt in Shift
      then begin
           with qrprv.HorzScrollBar do
                Position := Position - Increment;
                Key := 0;
      end;
   VK_RIGHT :
      if ssAlt in Shift
      then begin
           with qrprv.HorzScrollBar do
                Position := Position + Increment;
                Key := 0;
      end;
   VK_HOME :
      if ssCtrl in Shift
      then begin
           qrprv.PageNumber := 1;
           lblPagina.Caption := Format('Pág. %d de %d', [qrprv.PageNumber, QRPrinter.PageCount]);
           Key := 0;
      end
      else begin
            with qrprv.HorzScrollBar do Position := 0;
            Key := 0;
      end;
   VK_END :
      if ssCtrl in Shift
      then begin
           qrprv.PageNumber := QRPrinter.PageCount;
           lblPagina.Caption := Format('Pág. %d de %d', [qrprv.PageNumber, QRPrinter.PageCount]);
           Key := 0;
      end
      else begin
           with qrprv.HorzScrollBar do Position := Range;
                Key := 0;
      end;
   end;
end;

procedure TfrmCMPreview.bbtnPagIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ssAlt in Shift then Key := 0;
end;

procedure TfrmCMPreview.bbtnImprimirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ssAlt in Shift then Key := 0;
end;

procedure TfrmCMPreview.qrprvPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
   inherited;
   lblPagina.Caption := Format('Pág. %d de %d', [qrprv.PageNumber, qrprv.QRPrinter.PageCount]);
end;

procedure TfrmCMPreview.SetPrinter(p : TQRPrinter);
begin
  inherited;
  qrprv.QRPrinter := p;
  SpinEdit1.Value  := 100;
  qrprv.Zoom       := 100;
  qrprv.PageNumber := 1;
  qrprv.VertScrollBar.Position   := 0;
end;

end.
