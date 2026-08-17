//********************************************************************************************************
//Autor   :  Marco Turon
//Data	  :  14/12/2005
//Codigo  :  AL_1
//Função  :  Preenche automáticamente o Caption do form com 'Consulta',
//              se nenhum outro nome for atribuído
//********************************************************************************************************
unit FOkCancelarRelInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, DBClient, uCMClientDataSet, Wwquery,
  Db, DBTables;

type
  TfrmOkCancelarRelInv = class(TfrmOkCancelarInv)
    ToolbarSep972: TToolbarSep97;
    bt_Imprime: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOkCancelarRelInv: TfrmOkCancelarRelInv;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmOkCancelarRelInv.FormCreate(Sender: TObject);
begin
   // AL_2 - Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
  inherited;
  if UpperCase(Copy(Self.Caption, 1, 3)) = 'FRM' then
     Self.Caption := 'Consulta';
end;

procedure TfrmOkCancelarRelInv.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   // AL_2 - Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);
end;

procedure TfrmOkCancelarRelInv.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: Word;
begin
   // AL_2 - Fecha todas as queries que ficarem abertas
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
      if TForm(Sender).Components[i] is TCMClientDataSet then
      begin
         if TCMClientDataSet(TForm(Sender).Components[i]).State <> dsInactive then
            TCMClientDataSet(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TClientDataSet then
      begin
         if TClientDataSet(TForm(Sender).Components[i]).State <> dsInactive then
            TClientDataSet(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

end.
