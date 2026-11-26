unit FVlrDtDiverg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmVlrDtDiverg = class(TfrmOkCancelar)
    dtDataCobranca: TCMDateTimePicker;
    dblkpcmbPortForma: TwwDBLookupCombo;
    qryPortadorForma: TwwQuery;
    lblData: TLabel;
    lblForma: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var

  frmVlrDtDiverg: TfrmVlrDtDiverg;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmVlrDtDiverg.bbtnConfirmarClick(Sender: TObject);
begin

  if (dtDataCobranca.text = '')
  then begin
     MsgDlg('É preciso digitar a '+lblData.Caption+'.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if (dblkpcmbPortForma.text = '')
  then begin
     MsgDlg('É preciso digitar a '+lblForma.Caption+'.', 'Erro',mtError,[mbOk],0);
     Exit;
  end;

  if strtodate(dtDataCobranca.text) < date
  then begin
     MsgDlg('A '+lblData.Caption+' deve ser maior que a data corrente.','Erro',mtError,[mbOk],0);
     exit;
  end;
  inherited;
end;

procedure TfrmVlrDtDiverg.bbtnCancelarClick(Sender: TObject);
begin
  dblkpcmbPortForma.text := '';
  dtDataCobranca.text := '';
  ModalResult := mrCancel;
  inherited;
end;

procedure TfrmVlrDtDiverg.FormShow(Sender: TObject);
begin
  inherited;
  if not qryPortadorForma.Active then qryPortadorForma.Open;
end;

end.
