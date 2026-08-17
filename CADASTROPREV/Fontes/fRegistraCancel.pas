// *********************************************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ****************************************************************************
// *********************************************************************************************************************************
// ---------------------------------------------------------------------------------------------------------------------------------
//Nº SIG:........... 25312
//Data da Alteração: 22/06/2017
//Responsável......: Darivaldo Alencar / Andre Imakawa
//Descrição........: Criação da funcionalidade
//					 Utilizar a tabela Motivo.
// ---------------------------------------------------------------------------------------------------------------------------------

unit fRegistraCancel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, ComCtrls, DBTables, Wwquery,UMensErro;

type
  TfrmRegistraCancel = class(TfrmOkCancelar)
    pnlFundo2: TPanel;
    lblDataCancel: TLabel;
    lblMotivoCancel: TLabel;
    dtCancelamento: TCMDateTimePicker;
    cbbMOTIVOCANCEL: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    dsMotivo: TDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmRegistraCancel: TfrmRegistraCancel;

implementation
  
{$R *.DFM}

procedure TfrmRegistraCancel.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   If (cbbMOTIVOCANCEL.LookupValue = EmptyStr) Then
    Begin
      MsgDlg('Selecione o Motivo do Cancelamento.','Erro',mtError,[mbOk],0);
      ModalResult:= mrNone;
    End
   else
   If Trim(dtCancelamento.Text) = '' Then
    Begin
      MsgDlg('Informe a data de cancelamento.','Erro',mtError,[mbOk],0);
      ModalResult:= mrNone;
    End
   else ModalResult:= mrOk;
end;

procedure TfrmRegistraCancel.FormCreate(Sender: TObject);
begin
  inherited;
  qryMotivo.close;
  qryMotivo.open;
end;

procedure TfrmRegistraCancel.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult:= mrCancel;
end;

end.
