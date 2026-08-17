unit FNumInsc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons,  Mask,
  DBCtrls, Db, DBTables, Wwquery, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdblook;

type
  Tfrmnuminsc = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    edPlanPrev: TEdit;
    qryPlanPrevAss: TwwQuery;
    DBCBGeraAuto: TCheckBox;
    dblkpcmbCalend: TwwDBLookupCombo;
    Label21: TLabel;
    qryCalendario: TwwQuery;
    qryCalendarioNOME: TStringField;
    qryCalendarioIDCALENDARIO: TFloatField;
    Label3: TLabel;
    edPlanAss: TEdit;
    edNumInscInicial: TEdit;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBCBGeraAutoClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmnuminsc: Tfrmnuminsc;

implementation

uses UMensErro, FRelPlanos, FPlanass;

{$R *.DFM}

procedure Tfrmnuminsc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edNumInscInicial.text := '';
  DBCBGeraAuto.checked := false;
end;

procedure Tfrmnuminsc.DBCBGeraAutoClick(Sender: TObject);
begin
  inherited;
  if not DBCBGeraAuto.checked then
  begin
    // DBCBGeraAuto.Checked := false;
    edNumInscInicial.visible := false;
    Label1.visible := false;
  end
  else
  begin
    // DBCBGeraAuto.Checked := true;
    edNumInscInicial.visible := true;
    Label1.visible := true;
  end;
end;

procedure Tfrmnuminsc.bbtnSairClick(Sender: TObject);
begin
  // inherited;
  Saiu := true;
  close;
end;

procedure Tfrmnuminsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // inherited;
  action := cafree;
  qryCalendario.Close;
end;

procedure Tfrmnuminsc.FormActivate(Sender: TObject);
begin
  inherited;
  qryCalendario.Open;
  edPlanPrev.text := frmplanassist.qryprev.fieldbyname('NOME').AsString +'/'+frmplanassist.qryassist.fieldbyname('NOME').AsString;
  if Detalhe then
  begin
    edPlanAss.Text := frmPlanAssist.qryRel.fieldbyname('NOME').AsString;
    DBCBGeraAuto.Enabled := false;
    edNumInscInicial.Enabled := false;
    if qryCalendario.Locate('IDCALENDARIO',frmPlanAssist.qryRel.FieldByName('IDCALENDARIO').AsInteger,[loCaseInsensitive]) then
      dblkpcmbCalend.Text := qryCalendario.FieldByName('NOME').AsString;
  end
  else
  begin
    edPlanAss.Text := frmPlanAssist.qryAssist.fieldbyname('NOME').AsString;
  end;
end;

procedure Tfrmnuminsc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If dblkpcmbCalend.Text<>'' then
  begin
    qryPlanPrevAss.Close;
    qryPlanPrevAss.ParamByName('IDCALENDARIO').Value := qryCalendario.FieldByName('IDCALENDARIO').AsInteger;
    qryPlanPrevAss.ParamByName('IDPLANOPREV').Value := frmplanassist.qryprev.FieldByName('IDPLANOPREV').AsInteger;
    qryPlanPrevAss.ParamByName('IDPLANASS').Value := frmplanassist.qryAssist.FieldByName('IDPLANASS').AsInteger;
    qryPlanPrevAss.ParamByName('IDPESSJUR').Value := frmplanassist.qrypessjur.FieldByName('IDPESSOA').AsInteger;

    if DBCBGeraAuto.checked then
    begin
      qryPlanPrevAss.ParamByName('FLGAUTONUMINSC').Value := 1;
      qryPlanPrevAss.ParamByName('NUMINSCINICIAL').Value := StrToInt(edNumInscInicial.text);
    end
    else
    begin
      qryPlanPrevAss.ParamByName('FLGAUTONUMINSC').Value := 0;
      qryPlanPrevAss.ParamByName('NUMINSCINICIAL').Clear;
    end;

    try
      qryPlanPrevAss.ExecSQL;
    except
      raise;
    end;
    close;
  end else MsgDlg('É necessário escolher o calendário.','Erro',mtError,[mbOk,mbHelp],0);
end;

end.
