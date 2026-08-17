unit Frameu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcImager, fcImage, fcImageForm, ExtCtrls, StdCtrls, Buttons, Mask,
  ComCtrls, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcCombo, fctreecombo, ImgList, fcLabel, fcFrame,
  fcDemoRichEdit;

type
  TFrameDemo = class(TForm)
    fcImageForm1: TfcImageForm;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ImageList1: TImageList;
    fcTreeCombo4: TfcTreeCombo;
    fcShapeBtn1: TfcShapeBtn;
    fcTreeCombo5: TfcTreeCombo;
    Label18: TLabel;
    Image1: TImage;
    fcTreeCombo1: TfcTreeCombo;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcTreeCombo2: TfcTreeCombo;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    BackgroundCombo: TfcTreeCombo;
    fcLabel5: TfcLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    fcLabel6: TfcLabel;
    FrameCombo: TfcTreeCombo;
    fcLabel7: TfcLabel;
    fcTreeCombo3: TfcTreeCombo;
    fcLabel8: TfcLabel;
    fcLabel9: TfcLabel;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcImager6: TfcImager;
    TileImager: TfcImager;
    MosaicImager: TfcImager;
    WrinkleImager: TfcImager;
    LinenImager: TfcImager;
    ParchmentImager: TfcImager;
    procedure BitBtn1Click(Sender: TObject);
    procedure fcTreeCombo4Exit(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure BackgroundComboChange(Sender: TObject);
    procedure FrameComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameDemo: TFrameDemo;

implementation

{$R *.DFM}

procedure TFrameDemo.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrameDemo.fcTreeCombo4Exit(Sender: TObject);
begin
   with (Sender as TfcTreeCombo) do begin
     if items.FindNode(text,False) = nil then begin
        TreeView.Items.Add(nil,Text);
        Treeview.AlphaSort;
     end;
   end;
end;

procedure TFrameDemo.fcShapeBtn1Click(Sender: TObject);
begin
   ShowMessage('Put code here to send results of poll.');
end;

procedure TFrameDemo.BackgroundComboChange(Sender: TObject);
var TempImager:TfcImager;
begin
  if ((Sender as TfcTreeCombo).Text = 'Plain') then begin
     TileImager.Visible := False;
     exit;
  end;
  TempImager := nil;
  if ((Sender as TfcTreeCombo).Text = 'Wrinkle') then
     TempImager := WrinkleImager
  else if ((Sender as TfcTreeCombo).Text = 'Linen') then
     TempImager := LinenImager
  else if ((Sender as TfcTreeCombo).Text = 'Parchment') then
     TempImager := ParchmentImager
  else if ((Sender as TfcTreeCombo).Text = 'Mosaic') then
     TempImager := MosaicImager;

  if TempImager <> nil then begin
     TempImager.UpdateWorkBitmap;
     TileImager.Picture.Assign(TempImager.WorkBitmap);
  end;
  TileImager.Visible := True;
end;

procedure TFrameDemo.FrameComboChange(Sender: TObject);
var i:integer;
begin
  for i:= 0 to Controlcount-1 do begin
     if (Controls[i] is TfcTreeCombo) then begin
       TfcTreeCombo(Controls[i]).Frame.FocusStyle := efsFrameBox;
       TfcTreeCombo(Controls[i]).Frame.NonFocusStyle := efsFrameBox;
       TfcTreeCombo(Controls[i]).Frame.NonFocusBorders := [efLeftBorder,efTopBorder,efRightBorder,efBottomBorder];
       TfcTreeCombo(Controls[i]).ButtonEffects.Flat := False;
       TfcTreeCombo(Controls[i]).ButtonEffects.Transparent := False;
       TfcTreeCombo(Controls[i]).Frame.Enabled := True;


       if ((Sender as TfcTreeCombo).Text = 'Underline') then begin
          TfcTreeCombo(Controls[i]).Frame.NonFocusBorders := [efBottomBorder];
       end
       else if ((Sender as TfcTreeCombo).Text = 'FrameBox') then begin
       end
       else if ((Sender as TfcTreeCombo).Text = 'Flat Buttons') then begin
          TfcTreeCombo(Controls[i]).Frame.NonFocusStyle := efsFrameSingle;
          TfcTreeCombo(Controls[i]).ButtonEffects.Flat := True;
          TfcTreeCombo(Controls[i]).ButtonEffects.Transparent := True;
       end
       else if ((Sender as TfcTreeCombo).Text = 'No Frame (Normal)') then begin
          TfcTreeCombo(Controls[i]).Frame.Enabled := False;
          TfcTreeCombo(Controls[i]).BorderStyle := bsSingle;
       end
       else if ((Sender as TfcTreeCombo).Text = 'Sunken Focus') then begin
          TfcTreeCombo(Controls[i]).Frame.FocusStyle := efsFrameSunken;
       end
       else if ((Sender as TfcTreeCombo).Text = 'Raised Panel Focus') then begin
          TfcTreeCombo(Controls[i]).Frame.FocusStyle := efsFrameRaised;
       end
       else if ((Sender as TfcTreeCombo).Text = 'Etched') then begin
          TfcTreeCombo(Controls[i]).Frame.NonFocusStyle := efsFrameEtched;
          TfcTreeCombo(Controls[i]).Frame.FocusStyle := efsFrameEtched;
       end
       else if ((Sender as TfcTreeCombo).Text = 'Bump') then begin
          TfcTreeCombo(Controls[i]).Frame.NonFocusStyle := efsFrameBump;
          TfcTreeCombo(Controls[i]).Frame.FocusStyle := efsFrameBump;
       end
     end;
  end;
end;

procedure TFrameDemo.FormShow(Sender: TObject);
begin
//  fctreecombo4.TreeView.Color := clBtnFace;
   ParchmentImager.UpdateWorkBitmap;
   TileImager.Picture.Assign(ParchmentImager.WorkBitmap);
end;

end.
