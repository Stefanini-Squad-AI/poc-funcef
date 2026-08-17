unit FReabNovaData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmReabNovaData = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    lblDtInicioAntes: TLabel;
    edDtInicioAntes: TEdit;
    lblDtFinalAntes: TLabel;
    edDtFinalAntes: TEdit;
    GroupBox2: TGroupBox;
    lblDtInicio: TLabel;
    dtInicio: TCMDateTimePicker;
    lblDtFinal: TLabel;
    dtFinal: TCMDateTimePicker;
    rgrpReabertura: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure rgrpReaberturaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bDatasOK : boolean;
  end;

var
  frmReabNovaData: TfrmReabNovaData;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmReabNovaData.FormShow(Sender: TObject);
begin
  inherited;
  // No caso de Prorrogacao a data de inicio nao deve se alterar
  // No caso de Renovacao   a data de inicio deve ser um dia apos o encerramento
  if rgrpReabertura.ItemIndex = -1
  then Exit;

  if (rgrpReabertura.ItemIndex = 0) and
     (Trim(edDtFinalAntes.Text) <> '') and
     (StrToDate(edDtFinalAntes.Text) >= date) // Prorrogacao
  then begin
     dtInicio.Text := edDtInicioAntes.Text;
     dtInicio.Enabled := False;
  end
  else begin
     if (rgrpReabertura.ItemIndex = 0) and
        (Trim(edDtFinalAntes.Text) <> '') and
        (StrToDate(edDtFinalAntes.Text) < date) // RENOVACAO
     then begin
        dtInicio.Text := DateToStr(StrToDate(edDtFinalAntes.Text) + 1);
        dtInicio.Enabled := False;
     end
     else dtInicio.Enabled := True;
  end;
end;

procedure TfrmReabNovaData.bbtnConfirmarClick(Sender: TObject);
var bReabertura : boolean;
begin
  bDatasOk := False;
  if (dtInicio.Enabled) and (Trim(dtInicio.Text) = '')
  then begin
     MsgDlg('Informe a nova data de início.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (Trim(dtFinal.Text) = '')
  then begin
     MsgDlg('Informe a nova data final.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (dtInicio.Enabled) and (StrToDate(dtFinal.Text)  < StrToDate(dtInicio.Text))
  then begin
     MsgDlg('A data final não pode ser anterior à data de início.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (dtInicio.Enabled) and (StrToDate(dtInicio.Text)  < StrToDate(edDtInicioAntes.Text))
  then begin
     MsgDlg('A nova data de início não pode ser anterior à data de início cadastrada até o momento.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  // Se for uma reabertura ou uma renovacao
  // Entao a data de inicio deve ser maior que a data final anterior
  bReabertura := False;

  if (rgrpReabertura.ItemIndex = 0)    and
     (Trim(edDtFinalAntes.Text) <> '') and
     (StrToDate(edDtFinalAntes.Text) < date)
  then bReabertura := True;

  if  ( (rgrpReabertura.ItemIndex = 1) or (bReabertura) ) and
      (  dtInicio.Enabled and (StrToDate(dtInicio.Text)  <= StrToDate(edDtFinalAntes.Text)) )
  then begin
     MsgDlg('A nova data de início deve ser posterior à data final anterior. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;
  bDatasOK := True;
  inherited;
end;

procedure TfrmReabNovaData.bbtnCancelarClick(Sender: TObject);
begin
  bDatasOK := False;
  inherited;

end;

procedure TfrmReabNovaData.rgrpReaberturaClick(Sender: TObject);
begin
  inherited;
  // No caso de Prorrogacao a data de inicio nao deve se alterar
  // No caso de Renovacao   a data de inicio deve ser um dia apos o encerramento
  if (rgrpReabertura.ItemIndex = 0) and
     (Trim(edDtFinalAntes.Text) <> '') and
     (StrToDate(edDtFinalAntes.Text) >= date) // Prorrogacao
  then begin
     dtInicio.Text := edDtInicioAntes.Text;
     dtInicio.Enabled := False;
  end
  else begin
     if (rgrpReabertura.ItemIndex = 0) and
        (Trim(edDtFinalAntes.Text) <> '') and
        (StrToDate(edDtFinalAntes.Text) < date) // Renovacao
     then begin
        dtInicio.Text := DateToStr(StrToDate(edDtFinalAntes.Text) + 1);
        dtInicio.Enabled := False;
     end
     else dtInicio.Enabled := True;
  end;

end;

end.
