unit fCustomSelProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  fParamReports_Padrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, uCMClientDataSet;

type
  TfrmCustomSelProcesso = class(TfrmParamReports_Padrao)
    bbtnOutraVez: TBitBtn;
    pnResult: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  protected
    sSQL: string;
    iIndiceAnt: integer;
    bSelOk: boolean;

    function  GerarListaItens(RadioGroup: TRadioGroup; ListaCod, ListaDesc: TListBox): string;
    function  GerarParamSELECT(RadioGroup: TRadioGroup; ListaCod, ListaDesc: TListBox): string;
    procedure InserirLista(Modificado: boolean; ListaCod, ListaDesc: TListBox;
      Cds: TCMClientDataSet; CampoCod, CampoDesc: string);
    procedure ApagarLista(Key: word; ListaCod, ListaDesc: TListBox);
    procedure HabilitarLista(RadioGroup: TRadioGroup; GroupBox: TGroupBox;
      Cds: TCMClientDataSet);
  public
    AbrirQueryPrincipal, IrPaginaResult: boolean;

    procedure ExecutarIrPaginaResult;
  end;

var
  frmCustomSelProcesso: TfrmCustomSelProcesso;

implementation

{$R *.DFM}

procedure TfrmCustomSelProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirQueryPrincipal := true;
  IrPaginaResult := true;
end;

procedure TfrmCustomSelProcesso.bbtnOutraVezClick(Sender: TObject);
begin
  bbtnOutraVez.Visible := false;
  sep3.Visible := false;
  pnResult.Visible := false;
  pnResult.SendToBack;

  TB97oKCancelar.Visible := true;
  TB97oKCancelar.DockPos := Dock971.Width - tb97Fundo.Width;
  TB97oKCancelar.Repaint;
end;

procedure TfrmCustomSelProcesso.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  bSelOk := false;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCustomSelProcesso.ExecutarIrPaginaResult;
begin
  bbtnOutraVez.Visible := true;
  sep3.Visible := true;
  TB97oKCancelar.Visible := false;
  pnResult.BringToFront;
  pnResult.Visible := true;
end;

function TfrmCustomSelProcesso.GerarListaItens(RadioGroup: TRadioGroup;
  ListaCod, ListaDesc: TListBox): string;
var
  c: integer;
begin
  Result := '';
  if (RadioGroup.ItemIndex * ListaDesc.Items.Count > 0) then
  begin
    for c:=0 to ListaDesc.Items.Count-1 do
    begin
      if (ListaDesc.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + ListaCod.Items[c]
      else
        Result := Result +','+ ListaCod.Items[c];
    end;
  end;
end;

function TfrmCustomSelProcesso.GerarParamSELECT(RadioGroup: TRadioGroup;
  ListaCod, ListaDesc: TListBox): string;
begin
  Result := GerarListaItens(RadioGroup, ListaCod, ListaDesc);
  if (Result <> '') then
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

procedure TfrmCustomSelProcesso.InserirLista(Modificado: boolean; ListaCod, ListaDesc: TListBox;
  Cds: TCMClientDataSet; CampoCod, CampoDesc: string);
begin
  if (Modificado) then
  begin
    ListaCod.Items.Add(Cds.FieldByName(CampoCod).asString);
    ListaDesc.Items.Add(Cds.FieldByName(CampoDesc).asString);
  end;
end;

procedure TfrmCustomSelProcesso.ApagarLista(Key: word; ListaCod, ListaDesc: TListBox);
begin
  if (Key = VK_DELETE) and (ListaDesc.Items.Count > 0) then
  begin
    iIndiceAnt := ListaDesc.ItemIndex;
    ListaDesc.Items.Delete(iIndiceAnt);
    ListaCod.Items.Delete(iIndiceAnt);
  end;
end;

procedure TfrmCustomSelProcesso.HabilitarLista(RadioGroup: TRadioGroup; GroupBox: TGroupBox;
  Cds: TCMClientDataSet);
begin
  if (Cds.IsEmpty) then
    RadioGroup.ItemIndex := 0;
  GroupBox.Visible := (RadioGroup.ItemIndex > 0);
end;

end.
