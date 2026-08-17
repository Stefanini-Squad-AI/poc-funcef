//******************************************************************************
//Data	    : 25/07/2006
//Código    : Al_1
//Motivo(S) : Melhorias
//******************************************************************************
unit FOkCancelarInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, fcLabel, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, faMensagem, Db, DBTables, Wwquery;

type
  TfrmOkCancelarInv = class(TfrmOkCancelar)
    bvlSepTit: TBevel;
    pnlTitulo: TPanel;
    lbNomDescricao: TfcLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOkCancelarInv: TfrmOkCancelarInv;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmOkCancelarInv.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmOkCancelarInv.FormShow(Sender: TObject);
begin
   inherited;
   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Processo';
end;

procedure TfrmOkCancelarInv.FormCreate(Sender: TObject);
begin
   //AL_1
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
end;

procedure TfrmOkCancelarInv.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer;
begin
   // Fecha todas as queries que ficarem abertas
   //AL_1
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TwwQuery then
      begin
         if TwwQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TwwQuery(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TQuery then
      begin
         if TQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TQuery(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

end.
