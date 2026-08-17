unit FCadastroGridCsInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  fcLabel, faMensagem;

type
  TFrmCadastroGridCSInv = class(TFrmCadastroGridCS)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Bevel2: TBevel;
    fraMens: TfraMensagem;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroGridCSInv: TFrmCadastroGridCSInv;

implementation

uses FPrincipal, URendaFixa;

{$R *.DFM}

procedure TFrmCadastroGridCSInv.sbtnInserirClick(Sender: TObject);
begin
   // Controle do processo de abertura de Renda Fixa
   if TipoMenuInvest = 'F' then
   begin
      if RendaFixa.VerEmAbertura then
      begin
         CmeCadastro.AtualizaBotoes(Self);
         Exit;
      end;
   end;
   inherited;
end;

procedure TFrmCadastroGridCSInv.sbtnAlterarClick(Sender: TObject);
begin
   // Controle do processo de abertura de Renda Fixa
   if TipoMenuInvest = 'F' then
   begin
      if RendaFixa.VerEmAbertura then
      begin
         CmeCadastro.AtualizaBotoes(Self);
         Exit;
      end;
   end;
   inherited;
end;

procedure TFrmCadastroGridCSInv.sbtnApagarClick(Sender: TObject);
begin
   // Controle do processo de abertura de Renda Fixa
   if TipoMenuInvest = 'F' then
   begin
      if RendaFixa.VerEmAbertura then
      begin
         CmeCadastro.AtualizaBotoes(Self);
         Exit;
      end;
   end;
   inherited;
end;

procedure TFrmCadastroGridCSInv.FormShow(Sender: TObject);
begin
   inherited;
   fraMens.Apaga;
   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Cadastro';
end;

procedure TFrmCadastroGridCSInv.FormResize(Sender: TObject);
begin
   inherited;
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
end;

procedure TFrmCadastroGridCSInv.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if Key = VK_Return then    
      SelectNext(ActiveControl,True,True)
end;

procedure TFrmCadastroGridCSInv.FormCreate(Sender: TObject);
begin
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
end;

procedure TFrmCadastroGridCSInv.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer;
begin
   // Fecha todas as queries que ficarem abertas
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
