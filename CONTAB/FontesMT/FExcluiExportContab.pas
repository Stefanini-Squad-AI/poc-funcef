unit FExcluiExportContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, MontaSelect, uCtrlLoteexportactb;

type
  TFrmExcluiExportContab = class(TfrmOkCancelar)
    EdtDescLote: TwwDBEdit;
    Label1: TLabel;
    bbtnProcura: TBitBtn;
    MsLote: TMontaSelect;
    procedure bbtnProcuraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    sIdLoteExportaCtb : String;
    CtrlLoteexportactb: TCtrlLoteexportactb;

  public
    { Public declarations }
  end;

var
  FrmExcluiExportContab: TFrmExcluiExportContab;

implementation

{$R *.DFM}

procedure TFrmExcluiExportContab.bbtnProcuraClick(Sender: TObject);
begin
  inherited;
  MsLote.Executar;
  if MsLote.RetornouValor then
  begin
    sIdLoteExportaCtb := MsLote.ValoresChave[0];
    EdtDescLote.Text := MsLote.ValoresChave[1];
    if trim(sIdLoteExportaCtb) <> '' then
      bbtnConfirmarClick.Enabled := true;
  end;
end;

procedure TFrmExcluiExportContab.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmarClick.Enabled := false;
  sIdLoteExportaCtb := '';
  CtrlLoteexportactb := TCtrlLoteexportactb.Create;
  CtrlLoteexportactb.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
end;

procedure TFrmExcluiExportContab.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmarClick.Enabled := false;
  if CtrlLoteexportactb.ExcluiLoteExportaCtb(strToIntDef(sIdLoteExportaCtb, -1)) then
    showMessage('O Lote de Exportação Contábil Foi Excluído Com Sucesso')
  else
    showMessage('Não Foi Possível Excluir Lote de Exportação Contábil');
  sIdLoteExportaCtb := '';
  bbtnConfirmarClick.Enabled := true;
  EdtDescLote.Text := '';
end;

procedure TFrmExcluiExportContab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlLoteexportactb.Free;
end;

procedure TFrmExcluiExportContab.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  EdtDescLote.Text := '';
  sIdLoteExportaCtb := '';
  bbtnConfirmarClick.Enabled := false;
end;

end.
