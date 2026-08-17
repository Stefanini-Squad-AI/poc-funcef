unit FRelatContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmRelatContratos = class(TfrmOkCancelar)
    gbContratos: TGroupBox;
    Label2: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    rdTipoContratos: TRadioGroup;
    rdDatas: TRadioGroup;
    rdDataAV: TRadioGroup;
    rgDataPrevEncerramento: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdDatasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatContratos: TfrmRelatContratos;
  tipocontrato : string;

implementation
uses DRelatoriosContrato,USistema;
{$R *.DFM}

procedure TfrmRelatContratos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosContrato.qryEmpresa.Close;
  dtmRelatoriosContrato.qryEmpresa.ParamByName('idEmpresa').Value := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryEmpresa.Open;
  dtmRelatoriosContrato.rpNomeEmpresa.Caption := dtmRelatoriosContrato.qryEmpresaRAZAOSOCIAL.AsString;

  dtmRelatoriosContrato.qryContratos.Close;

  dtmRelatoriosContrato.qryContratos.ParamByName('FLGCONTRATO').AsString:='_';
  dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='_';
  case rdTipoContratos.ItemIndex of
     0: dtmRelatoriosContrato.qryContratos.ParamByName('FLGCONTRATO').AsString:='TODOS';
     1: dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='N';
     2: dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='S';
     3: dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='E';
  end;

  dtmRelatoriosContrato.qryContratos.ParamByName('TIPODATA').AsString:='_';
  if rdDatas.ItemIndex=1 then
     case rdDataAV.ItemIndex of
        0: dtmRelatoriosContrato.qryContratos.ParamByName('TIPODATA').AsString:='DTASS';
        1: dtmRelatoriosContrato.qryContratos.ParamByName('TIPODATA').AsString:='DTVNC';
     end;

  case rgDataPrevEncerramento.ItemIndex of
     0: dtmRelatoriosContrato.qryContratos.ParamByName('FLGDATAENC').AsString:='TODAS';
     1: dtmRelatoriosContrato.qryContratos.ParamByName('FLGDATAENC').AsString:='DTVENCD';
     2: dtmRelatoriosContrato.qryContratos.ParamByName('FLGDATAENC').AsString:='DTVENCI';
  end;

  dtmRelatoriosContrato.qryContratos.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryContratos.ParamByName('DTINICIO').AsDate := dtInicio.Date;
  dtmRelatoriosContrato.qryContratos.ParamByName('DTFIM').AsDate := dtFim.Date;
  dtmRelatoriosContrato.qryContratos.ParamByName('IDUSUARIO').AsFloat:=Sistema.IdUsuario;

  dtmRelatoriosContrato.iNumContratos:=0;
  dtmRelatoriosContrato.bFim:=False;
  dtmRelatoriosContrato.qryContratos.Open;
end;

procedure TfrmRelatContratos.rdDatasClick(Sender: TObject);
begin
  inherited;
   if rdDatas.ItemIndex = 1 then begin
       gbContratos.Enabled := true;
       rdDataAV.Enabled := true;       
       dtInicio.Color := clWindow;
       dtFim.Color := clWindow;
   end else begin
       gbContratos.Enabled := false;
       rdDataAV.Enabled := false;
       dtInicio.Color := clgray;
       dtFim.Color := clgray;
   end;
end;

end.

