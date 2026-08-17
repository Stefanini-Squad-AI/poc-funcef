{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. SIG......: 136321
Data........: 15/09/2023
Responsável.: Everson Cunha
Descrição...: Aumento do tamanho de caracteres do campo memMotivoEncerramento
--------------------------------------------------------------------------------
N. SIG......: 101877
Data........: 02/12/2020
Responsável.: Everson Cunha
Descrição...: Criação do campo Distrato
--------------------------------------------------------------------------------}

unit FEncrerraContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls;

type
  TfrmEncrerraContratoMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    dtpDataEncerramento: TCMDateTimePicker;
    Label2: TLabel;
    memMotivoEncerramento: TMemo;
    chkDistrato: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncrerraContratoMT: TfrmEncrerraContratoMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmEncrerraContratoMT.bbtnConfirmarClick(Sender: TObject);
begin
   ModalResult:=mrNone;
   if (Trim(dtpDataEncerramento.Text)='') then
    begin
       MsgDlg('Obrigatório preencher a Data de Encerramento','Atenção',mtWarning,[mbOk],0);
       dtpDataEncerramento.SetFocus;
       Abort;
    end;

   if (Trim(memMotivoEncerramento.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Motivo do Encerramento','Atenção',mtWarning,[mbOk],0);
       memMotivoEncerramento.SetFocus;
       Abort;
    end;

   ModalResult:=mrOk;
end;

end.
