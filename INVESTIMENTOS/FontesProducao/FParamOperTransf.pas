unit FParamOperTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamOperTransf = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamOperTransf: TfrmParamOperTransf;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, UBibliotecaInvest, FDmRelatoriosFundos,
  FCadTransfFundos;

procedure TfrmParamOperTransf.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TfrmParamOperTransf.bbtnConfirmarClick(Sender: TObject);
var data: Integer;
begin
  inherited;
  if Trim(edDataRef.Text) = '' then
  begin
     MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
     edDataRef.SetFocus;
     ModalResult := mrNone;
     exit;
  end;
  frmCadTransfFundos.dbDtaTransf.DateTime := edDataRef.DateTime;
end;

end.
