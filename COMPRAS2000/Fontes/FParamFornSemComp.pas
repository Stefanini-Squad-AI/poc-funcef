unit FParamFornSemComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamFornSemComp = class(TfrmOkCancelar)
    edData: TCMDateTimePicker;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamFornSemComp: TFrmParamFornSemComp;

implementation

{$R *.DFM}

{ TFrmParamFornSemComp }

Uses DRelCompras, uMensErro;

procedure TFrmParamFornSemComp.FazRel;
begin
   DtmRelCompras.LbTitForn.Caption := 'Fornecedores sem Compra desde ' +edData.Text;
   With DtmRelCompras.qryFornSemComp Do
   Begin
      Close;
      ParamByName('DATA').AsDate := edData.Date;
      Open;
   End;
end;

procedure TFrmParamFornSemComp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(edData.Text) = '' Then
  Begin
     ModalResult := mrNone;
     MsgDlg('Data não preenchida','Erro',mtError,[mbOk],0);
     edData.SetFocus;
  End
  Else
  Begin
     ModalResult := mrOk;
     FazRel;
  End;
end;

end.
