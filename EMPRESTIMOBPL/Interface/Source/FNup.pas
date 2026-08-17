unit FNup;

// Alterações:
{
-------------------------------------------------------------------------------
Pendência   : SOL 179958 KINTANA 1660970
Responsável : Mosé Pietro
Data        : 04/10/2012
Descrição   : Inclusão do botão Cancelar na tela de NUP
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Criado este fonte para incluir um novo campo "PNUMPROTOCOLO" para gravar o valor no NUP,
              onde o usuario ira entrar com este valor.
-------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Mask;

type
  TfrmNup = class(TfrmOkCancelar)
    Qry: TwwQuery;
    lbl1: TLabel;
    edtNumNup: TMaskEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMatricula: String;
    cancelar: char;


  end;

var
  frmNup: TfrmNup;


implementation

uses
   USistema, UMensErro, UDatabase, DBaseDados;


{$R *.DFM}





procedure TfrmNup.bbtnConfirmarClick(Sender: TObject);
begin
 inherited;
 close;
end;

procedure TfrmNup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (cancelar='0') then    //Mosé Pietro SOL 179958 KINTANA 1660970
Begin
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'SELECT FLGOBRIGANUMPROTOCOLO FROM TIPOCONTREMPTMO WHERE IDTIPOCONTREMPTMO = ' + sMatricula;
  Qry.Open;



  if Qry.FieldByName('FLGOBRIGANUMPROTOCOLO').asString = '1' then
  begin
    if  (Trim(edtNumNup.Text) = '')   then
    begin
      ShowMessage('Para esta modalidade de empréstimo é necessário informar o NUP.');
      edtNumNup.SetFocus;
      Abort;
    end
    else
    begin
      if (Length(Trim(edtNumNup.Text)) < 15) then
      begin
        ShowMessage('Não foi informado um número de protocolo para este contrato de empréstimo respeitando a máscara.');
        edtNumNup.SetFocus;
        Abort;
      end;


    end;


  end
  else
  begin
    if  (Trim(edtNumNup.Text) = '')   then
    begin
      if (MsgDlg('Não foi informado um número de protocolo para este contrato de empréstimo, deseja continuar?'
             ,'Confirmação ',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
      begin
       edtNumNup.SetFocus;
       Abort;
      end;

    end
    else
    begin
      if (Length(Trim(edtNumNup.Text)) < 15) then
      begin
        ShowMessage('Não foi informado um número de protocolo para este contrato de empréstimo respeitando a máscara.');
        edtNumNup.SetFocus;
        Abort;
      end;


    end;
  end;
  inherited;
     end;
end;
 //Mosé Pietro SOL 179958 KINTANA 1660970 - INICIO
procedure TfrmNup.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cancelar := '1'      ;
  close;

end;

procedure TfrmNup.FormCreate(Sender: TObject);
begin
  inherited;
cancelar :='0';
end;
//Mosé Pietro SOL 179958 KINTANA 1660970 - FIM
end.
