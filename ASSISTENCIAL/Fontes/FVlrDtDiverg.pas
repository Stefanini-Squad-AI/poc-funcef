unit FVlrDtDiverg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery,Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmVlrDtDiverg = class(TfrmOkCancelar)
    ctcob: TCMDateTimePicker;
    cmbport: TwwDBLookupCombo;
    qryportadorforma: TwwQuery;
    dsportadorforma: TwwDataSource;
    Data: TLabel;
    Label1: TLabel;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVlrDtDiverg: TfrmVlrDtDiverg;
  bSaiu : boolean;
  sMesCob,sData, sCodPort,sCobTela : String;

implementation

uses FDivergContribAss, UMensErro;

{$R *.DFM}

procedure TfrmVlrDtDiverg.bbtnSairClick(Sender: TObject);
begin
  bSaiu := true;
  inherited;
end;

procedure TfrmVlrDtDiverg.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (ctcob.text = '') then
  begin
     MsgDlg('É preciso digitar a data de '+sCobTela+'.','Erro',mtError,[mbOk],0);
     exit;
  end;

  if (cmbport.text = '') then
  begin
     MsgDlg('É preciso digitar a forma de '+sCobTela+'.','Erro',mtError,[mbOk],0);
     exit;
  end;

  if strtodate(ctcob.text) <= date then
  begin
     MsgDlg('A data da '+sCobTela+' deve ser maior que a data corerente.',
            'Erro',mtError,[mbOk],0);
     exit;
  end;

  bSaiu := false;
  sMesCob :=  copy(ctcob.text,7,4)+'/'+copy(ctcob.text,4,2);
  sData :=  ctcob.text;
  sCodPort := qryportadorforma.fieldbyname('CODPORTFORMA').AsString;
  close;
end;

procedure TfrmVlrDtDiverg.bbtnCancelarClick(Sender: TObject);
begin
  cmbport.text := '';
  ctcob.text := '';
  inherited;
end;

procedure TfrmVlrDtDiverg.FormCreate(Sender: TObject);
begin
  inherited;
  qryportadorforma.open;
  frmVlrDtDiverg.Caption := 'Parâmetros para a '+sCobTela+' da Divergência';
  Data.Caption := 'Data de '+sCobTela+'';
  Label1.Caption := 'Forma de '+sCobTela+'';
end;

end.
