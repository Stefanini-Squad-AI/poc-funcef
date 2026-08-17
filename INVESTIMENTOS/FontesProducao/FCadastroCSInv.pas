//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_3
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//********************************************************************************************************
// Data     : 10/11/2005
// Código   : AL_2
// Motivo   : Fecha todas as queries que estiverem abertas no fechamento do form
//            Ajuste no LayOut do Painel de dados
//            Caption automático = 'Cadastro'
//********************************************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Motivo   : Controle do processo de abertura
//********************************************************************************************************
unit FCadastroCSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, wwdblook, ExtCtrls, fcLabel, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Mask,
  wwdbedit;

type
  TfrmCadastroCSInv = class(TfrmCadastroCS)
    Bevel2: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCSInv: TfrmCadastroCSInv;

implementation

{$R *.DFM}

uses uMensErro, UDataBase, FPrincipal, URendaFixa, URendaVariavel;


procedure TfrmCadastroCSInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then  
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadastroCSInv.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);
end;

procedure TfrmCadastroCSInv.sbtnInserirClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variavel
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroCSInv.sbtnAlterarClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variavel
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroCSInv.sbtnApagarClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variavel
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroCSInv.FormCreate(Sender: TObject);
begin
   // AL_2 - Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
end;

procedure TfrmCadastroCSInv.FormClose(Sender: TObject;  var Action: TCloseAction);
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
   end;
   inherited;
end;

procedure TfrmCadastroCSInv.FormShow(Sender: TObject);
begin
   // AL_2
   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Cadastro';
   inherited;
end;

end.
