unit FRelatAlteraContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, mContrato, MontaSelect;

type
  TfrmRelatAlteraContrato = class(TfrmOkCancelar)
    gbContratos: TGroupBox;
    Label2: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    rdTipoContratos: TRadioGroup;
    rdDatas: TRadioGroup;
    rdDataAV: TRadioGroup;
    rgDataPrevEncerramento: TRadioGroup;
    molContrato1: TmolContrato;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdDatasClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaParametros(const qry: TwwQuery);    
  public
    { Public declarations }
  end;

var
  frmRelatAlteraContrato: TfrmRelatAlteraContrato;
  tipocontrato : string;

implementation

uses DRelatoriosContrato, USistema, uGeralContrato;
{$R *.DFM}

procedure TfrmRelatAlteraContrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosContrato.pplNomeEmpresa.Caption := Sistema.NomeEmpresa;

  LimpaParametros(dtmRelatoriosContrato.qryAlteraContrato);
  dtmRelatoriosContrato.qryAlteraAditamento.Close;
  dtmRelatoriosContrato.qryLogAditamento.Close;

  dtmRelatoriosContrato.qryAlteraContrato.ParamByName('IDPESSOA').AsFloat  := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryAlteraContrato.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;

  if molContrato1.iContrato > 0 then begin
     dtmRelatoriosContrato.qryAlteraContrato.ParamByName('IDCONTRATO').AsInteger := molContrato1.iContrato;
  end else begin
     dtmRelatoriosContrato.qryAlteraContrato.ParamByName('FLGCONTRATO').AsString:='_';
     dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPOCONTRATO').AsString:='_';
     case rdTipoContratos.ItemIndex of
        0: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('FLGCONTRATO').AsString:='TODOS';
        1: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPOCONTRATO').AsString:='N';
        2: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPOCONTRATO').AsString:='S';
        3: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPOCONTRATO').AsString:='E';
     end;

     dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPODATA').AsString:='_';
     if rdDatas.ItemIndex=1 then
        case rdDataAV.ItemIndex of
           0: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPODATA').AsString:='DTASS';
           1: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('TIPODATA').AsString:='DTVNC';
        end;

     case rgDataPrevEncerramento.ItemIndex of
        0: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('FLGDATAENC').AsString:='TODAS';
        1: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('FLGDATAENC').AsString:='DTVENCD';
        2: dtmRelatoriosContrato.qryAlteraContrato.ParamByName('FLGDATAENC').AsString:='DTVENCI';
     end;

     dtmRelatoriosContrato.qryAlteraContrato.ParamByName('DTINICIO').AsDate := dtInicio.Date;
     dtmRelatoriosContrato.qryAlteraContrato.ParamByName('DTFIM').AsDate := dtFim.Date;
  end;

  dtmRelatoriosContrato.qryAlteraContrato.Open;
  dtmRelatoriosContrato.qryAlteraAditamento.Open;
  dtmRelatoriosContrato.qryLogAditamento.Open;
end;

procedure TfrmRelatAlteraContrato.LimpaParametros(const qry: TwwQuery);
var i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

procedure TfrmRelatAlteraContrato.rdDatasClick(Sender: TObject);
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

