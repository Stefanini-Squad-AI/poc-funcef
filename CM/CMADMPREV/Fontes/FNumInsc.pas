unit FNumInsc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, IvDictio, IvMulti, IvEMulti;

type
  TfrmNumInsc = class(TfrmOkCancelar)
    Label1: TLabel;
    edNomePlano: TEdit;
    edNumInsc: TRealEdit;
    Label2: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNumInsc: TfrmNumInsc;


implementation

uses UMensErro, uDataBase; 

{$R *.DFM}

procedure TfrmNumInsc.bbtnConfirmarClick(Sender: TObject);
begin

  if (edNumInsc.Text = '') or (edNumInsc.Value = 0)
  then begin
     MsgDlg('O Número de inscrição não pode ser nulo.','Erro',mtError,[mbOk],0);
     Exit;
  end;
  Close;
  inherited;

end;

procedure TfrmNumInsc.bbtnSairClick(Sender: TObject);
begin
  if MsgDlg('Ao sair toda a operação será cancelada. Deseja realmente sair da tela?','Confirmação',mtConfirmation,[mbno, mbyes],0) = mrNo
  then Abort;
  inherited;

end;

procedure TfrmNumInsc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edNumInsc.Text := '';
end;

end.
