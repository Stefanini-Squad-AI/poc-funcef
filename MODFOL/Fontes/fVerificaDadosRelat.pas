unit fVerificaDadosRelat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, ComCtrls, ColorListBox;

type
  TfrmVerificaDadosRelat = class(TfrmOkCancelar)
    fcLabel1: TfcLabel;
    pgctrlRelatorios: TPageControl;
    tbshRelats: TTabSheet;
    tbshMeiosMag: TTabSheet;
    Bevel1: TBevel;
    lstbxMeiosMag: TColorListBox;
    lstbxRelatorios: TColorListBox;
    procedure FormCreate(Sender: TObject);
    procedure lstbxRelatoriosDblClick(Sender: TObject);
    procedure lstbxRelatoriosColorItems(Col, Row: Integer;
      KeyField: String; State: TOwnerDrawState; Brush: TBrush;
      Font: TFont);
    procedure lstbxMeiosMagDblClick(Sender: TObject);
  private
    setRelHabilitados, setMeiosMagHabilitados: set of byte;
  public
    { Public declarations }
  end;

var
  frmVerificaDadosRelat: TfrmVerificaDadosRelat;

implementation

uses uFuncoesUteis, fVerificaDadosRAISMagnetico, fParamVerificaAlfabMensal;

{$R *.DFM}

procedure TfrmVerificaDadosRelat.FormCreate(Sender: TObject);
begin
  inherited;
  pgctrlRelatorios.ActivePage := tbshRelats;
  setRelHabilitados           := [18];
  setMeiosMagHabilitados      := [3];
end;

procedure TfrmVerificaDadosRelat.lstbxRelatoriosColorItems(Col, Row: Integer;
  KeyField: String; State: TOwnerDrawState; Brush: TBrush; Font: TFont);
begin
  inherited;
  if ((pgctrlRelatorios.ActivePage = tbshRelats)   and (Row in setRelHabilitados)) or
     ((pgctrlRelatorios.ActivePage = tbshMeiosMag) and (Row in setMeiosMagHabilitados)) then
  begin
    Font.Style := [fsBold];
    if (odSelected in State) then
    begin
      Brush.Color := clNavy;
      Font.Color  := clWhite;
    end
    else
    begin
      Brush.Color := clWhite;
      Font.Color  := clBlack;
    end;
  end
  else
  begin
    Font.Style := [];
    Font.Color := $00CACACA;

    if (odSelected in State) then
      Brush.Color := CL_AMARELO_CLARO //$00E8FFFF
    else
      Brush.Color := clWhite;
  end;
end;

procedure TfrmVerificaDadosRelat.lstbxRelatoriosDblClick(Sender: TObject);
begin
  if (lstbxRelatorios.ItemIndex in setRelHabilitados) then
  begin
    frmParamVerificaAlfabMensal := TfrmParamVerificaAlfabMensal.Create(Application);
    frmParamVerificaAlfabMensal.ShowModal;
    frmParamVerificaAlfabMensal.Free;
  end;
end;

procedure TfrmVerificaDadosRelat.lstbxMeiosMagDblClick(Sender: TObject);
begin
  if (lstbxMeiosMag.ItemIndex in setMeiosMagHabilitados) then
  begin
    frmVerificaDadosRAISMagnetico := TfrmVerificaDadosRAISMagnetico.Create(Application);
    frmVerificaDadosRAISMagnetico.ShowModal;
    frmVerificaDadosRAISMagnetico.Free;
  end;
end;

end.
