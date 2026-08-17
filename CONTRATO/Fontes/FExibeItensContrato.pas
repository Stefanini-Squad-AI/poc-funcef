unit FExibeItensContrato;
{ ------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Rotina......: frmExibeItensContrato
Nº SOL......: 142171
Nº KINTANA..: 913629
Data........: 12/08/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Criação do formulário para exibir os itens do Contrato.
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, uCMClientDataSet;

type
  TfrmExibeItensContrato = class(TForm)
    lbCabecalho: TLabel;
    Button1: TButton;
    lvGradeDados: TListView;
  private

    { Private declarations }
  public
  procedure setDados(sCargo : String; valor : double; cds : TCMClientDataSet);
    { Public declarations }
  end;

var
  frmExibeItensContrato: TfrmExibeItensContrato;

implementation

{$R *.DFM}

{ TfrmExibeItensContrato }



procedure TfrmExibeItensContrato.setDados(sCargo : String; valor : double; cds : TCMClientDataSet);
var
ListItem :TlistItem;
i : Integer;
begin
    lbCabecalho.Caption := 'Registro do contrato necessita de autorização do(a) '+sCargo;
    cds.First;
    while not cds.eof Do
    Begin
    ListItem := lvGradeDados.Items.Add;
    ListItem.Caption := cds.FieldByName('DATABASECONTRATO').asString;
    ListItem.SubItems.Add(cds.FieldByName('NOMECONTRATO').asString);
    ListItem.SubItems.Add(cds.FieldByName('VALORBASECONTRATO').asString);
    cds.Next;
    end;
    ListItem := lvGradeDados.Items.Add;
    ListItem.SubItems.Add('Total:');
    ListItem.SubItems.Add(FloatToStr(valor));
end;

end.
