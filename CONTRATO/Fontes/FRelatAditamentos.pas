unit FRelatAditamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmRelatAditamentos = class(TfrmOkCancelar)
    qryContrato: TwwQuery;
    dbLookupComboContrato: TwwDBLookupCombo;
    Label1: TLabel;
    gbAditamentos: TGroupBox;
    Label2: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    rdAditamentos: TRadioGroup;
    procedure rdAditamentosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAditamentos: TfrmRelatAditamentos;

implementation
uses DRelatoriosContrato,USistema;
{$R *.DFM}

procedure TfrmRelatAditamentos.rdAditamentosClick(Sender: TObject);
begin
  inherited;
   if rdAditamentos.ItemIndex = 1 then begin
       gbAditamentos.Enabled := true;
       dtInicio.Color := clWindow;
       dtFim.Color := clWindow;
   end else begin
       gbAditamentos.Enabled := false;
       dtInicio.Color := clgray;
       dtFim.Color := clgray;
   end;
end;

procedure TfrmRelatAditamentos.FormActivate(Sender: TObject);
begin
  inherited;
  if not qryContrato.Active then
     begin
      qryContrato.Close;
      qryContrato.ParamByName('IDUSUARIO').AsString := IntToStr(Sistema.IDUsuario);
      qryContrato.Open;
     end;
end;

procedure TfrmRelatAditamentos.bbtnConfirmarClick(Sender: TObject);
var
   sSql : String;
begin
  inherited;
  dtmRelatoriosContrato.qryEmpresa.Close;
  dtmRelatoriosContrato.qryEmpresa.ParamByName('idEmpresa').Value := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryEmpresa.Open;
  dtmRelatoriosContrato.rpNomeEmpresaAdit.Caption := dtmRelatoriosContrato.qryEmpresaRAZAOSOCIAL.AsString;

  dtmRelatoriosContrato.qryAditamentos.Close;
  dtmRelatoriosContrato.qryAditamentos.SQL.Clear;

  case rdAditamentos.ItemIndex of
     0:begin
          sSql:='SELECT '+
                '   C.NOMECONTRATO,A.DATAASSADITAMENTO,A.DESCADITAMENTO, A.CODADITAMENTO '+
                'FROM '+
                '   CONTRATOCONTR C,ADITAMENTO A '+
                'WHERE ';
          if (Trim(dbLookupComboContrato.Text)<>'') then
             sSql:=sSql+'   (C.IDCONTRATO = :IDCONTRATO) AND ';

          sSql:=sSql+'   (A.IDCONTRATO = C.IDCONTRATO) '+
                     'ORDER BY C.NOMECONTRATO, A.DATAASSADITAMENTO, A.CODADITAMENTO';
       end;
     1:begin
          sSql:='SELECT '+
                '   C.NOMECONTRATO,A.DATAASSADITAMENTO,A.DESCADITAMENTO, A.CODADITAMENTO '+
                'FROM '+
                '   CONTRATOCONTR C,ADITAMENTO A '+
                'WHERE ';

          if (Trim(dbLookupComboContrato.Text)<>'') then
             sSql:=sSql+'   (C.IDCONTRATO = :IDCONTRATO) AND ';

          sSql:=sSql+'   (A.DATAASSADITAMENTO BETWEEN :DTINICIO AND :DTFIM) AND '+
                     '   (A.IDCONTRATO = C.IDCONTRATO) '+
                     'ORDER BY C.NOMECONTRATO, A.DATAASSADITAMENTO, A.CODADITAMENTO ';
       end;
    end;

  dtmRelatoriosContrato.qryAditamentos.SQL.Text:=sSql;
  case rdAditamentos.ItemIndex of
     0: if (Trim(dbLookupComboContrato.Text)<>'') then
           dtmRelatoriosContrato.qryAditamentos.ParamByName('IDCONTRATO').AsFloat :=
                                    qryContrato.FieldByName('IDCONTRATO').AsFloat;
     1: begin
           if (Trim(dbLookupComboContrato.Text)<>'') then
              dtmRelatoriosContrato.qryAditamentos.ParamByName('IDCONTRATO').AsFloat :=
                                    qryContrato.FieldByName('IDCONTRATO').AsFloat;

           dtmRelatoriosContrato.qryAditamentos.ParamByName('DTINICIO').AsDate := dtInicio.Date;
           dtmRelatoriosContrato.qryAditamentos.ParamByName('DTFIM').AsDate := dtFim.Date;
        end;
  end;

  dtmRelatoriosContrato.qryAditamentos.Open;
end;

end.
