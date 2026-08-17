unit FEncerramentoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, DBCtrls, MAHlpBtn, Buttons, TB97,
  ExtCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,FCadContrato, Db,
  Wwdatsrc, DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEncerramentoContrato = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    DBDataEncerramento: TCMDateTimePicker;
    DBMotivoEncerramento: TDBMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncerramentoContrato: TfrmEncerramentoContrato;
  idcontrato : integer;
implementation

uses uMensErro, DBaseDados;

{$R *.DFM}

procedure TfrmEncerramentoContrato.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   { Verificando se os campos foram preenchidos. }
   if TRIM(frmCadContrato.qry.FieldByName('DATAEFETENCERRA').AsString) = '' then
    begin
      MsgDlg('Obrigatório preencher a data do encerramento do contrato', 'Atenção', mtWarning,[mbOk],0);
      if DBDataEncerramento.CanFocus then DBDataEncerramento.SetFocus;
      Exit;
    end;

   if TRIM(frmCadContrato.qry.FieldByName('MOTIVOENCERRA').AsString) = '' then
    begin
      MsgDlg('Obrigatório preencher o motivo do encerramento do contrato','Atenção',mtWarning,[mbOk],0);
      if DBMotivoEncerramento.CanFocus then DBMotivoEncerramento.SetFocus;
      Exit;
    end;
   frmCadContrato.qry.edit;
   { Colocando o contrato como encerrado... }
   frmCadContrato.qry.FieldByName('FLGFIMCONTRATO').AsString := 'E';
   { Gravando. }
   frmCadContrato.qry.ApplyUpdates;
   bbtnSair.Click;
end;

end.
