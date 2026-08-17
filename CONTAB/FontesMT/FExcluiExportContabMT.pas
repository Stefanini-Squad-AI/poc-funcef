unit FExcluiExportContabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, MontaSelect, uCtrlLoteexportactb, dBaseDados, usistema;

type
  TFrmExcluiExportContabMT = class(TfrmOkCancelar)
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
  FrmExcluiExportContabMT: TFrmExcluiExportContabMT;

implementation

{$R *.DFM}

procedure TFrmExcluiExportContabMT.bbtnProcuraClick(Sender: TObject);
begin
  inherited;
  MsLote.Executar;
  if MsLote.RetornouValor then
  begin
    sIdLoteExportaCtb := MsLote.ValoresChave[0];
    EdtDescLote.Text := MsLote.ValoresChave[1];
    if trim(sIdLoteExportaCtb) <> '' then
      bbtnConfirmar.Enabled := true;
  end;
end;

procedure TFrmExcluiExportContabMT.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := false;
  sIdLoteExportaCtb := '';
  CtrlLoteexportactb := TCtrlLoteexportactb.Create;
  CtrlLoteexportactb.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
end;

procedure TFrmExcluiExportContabMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := false;
  if CtrlLoteexportactb.ExcluiLoteExportaCtb(strToIntDef(sIdLoteExportaCtb, -1)) then
    showMessage('O Lote de Exportação Contábil Foi Excluído Com Sucesso')
  else
    showMessage('Não Foi Possível Excluir Lote de Exportação Contábil');
  sIdLoteExportaCtb := '';
  bbtnConfirmar.Enabled := true;
  EdtDescLote.Text := '';
end;

procedure TFrmExcluiExportContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlLoteexportactb.Free;
end;

procedure TFrmExcluiExportContabMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  EdtDescLote.Text := '';
  sIdLoteExportaCtb := '';
  bbtnConfirmar.Enabled := false;
end;

end.
