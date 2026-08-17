{===============================================================================
Unit    :  FAnimacao
Form    :  frmAnimacao

Autor   : Paulo André M. de Carvalho
Empresa : Fórmula Informática Ltda.

Data    : 13/05/1999

Objetivo: Permite a visualização de tela com Avi animado. Permite também o
          cancelamento da Operação.

Propriedades Publicadas:

  Cancel: Recebe False no create do Form e True caso o usuário tenha pressionado
          o botão cancelar. Deve ser testado na aplicação chamadora para verificar
          a interrupção do processamento por solicitação do usuário.

Métodos Públicos:

  SetAnimacao    : Inicializa a aplicação de Animação
  SetProgressBar : Atualiza a barra de execução da tarefa

Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
================================================================================}
unit FAnimacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmAnimacao = class(TForm)
    PnlInformacoes: TPanel;
    PnlProgressBar: TPanel;
    PrgrssBrBarra: TProgressBar;
    AnmtAnimacao: TAnimate;
    PnlEspacoEsqueda: TPanel;
    Panel2: TPanel;
    PnlCancelar: TPanel;
    BtBtnCancelar: TBitBtn;
    PnlEspacoDireita: TPanel;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BtBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    wTotLinhas : Integer;
  public
    Cancel : Boolean;
    Procedure SetAnimacao ( wTitulo : String; wTotalLinhas : Integer; wMostraBarra : Boolean; wMostraCancelar : Boolean; wObjetoAvi : TCommonAVI);
    Procedure SetProgressBar ( LinhaAtual : Integer );
    { Public declarations }
  end;

var
  frmAnimacao: TfrmAnimacao;

implementation

{$R *.DFM}

//--------------------------------------------------------------------
//-- SetAnimacao
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   wTitulo        : Título que será mostrado na janela
//--   wTotLinhas     : Total das linhas a serem processadas
//--   wMostraBarra   : True  - A Progress Bar será exibida
//--                    False - A Progress Bar não será exibida
//--   wMostraCacelar : True  - O Botão Cancelar será exibido
//--                    False - O Botão Cancelar será exibido
//--   wObjetoAvi     : Objeto Avi que irá ilustrar a animação
//--
//----------------------------------------------------------------------//
Procedure TfrmAnimacao.SetAnimacao ( wTitulo : String; wTotalLinhas : Integer; wMostraBarra : Boolean; wMostraCancelar : Boolean; wObjetoAvi : TCommonAVI);
Begin

     frmAnimacao.Caption    := wTitulo;

     wTotLinhas             := wTotalLinhas;
     PrgrssBrBarra.Position := 0;

     PnlProgressBar.Visible := wMostraBarra;
     PnlCancelar.Visible    := wMostraCancelar;

     frmAnimacao.AnmtAnimacao.Active := False;
     frmAnimacao.AnmtAnimacao.CommonAVI := wObjetoAvi;
     frmAnimacao.AnmtAnimacao.Active := True;

     frmAnimacao.Width := PnlEspacoEsqueda.Width + AnmtAnimacao.Width + PnlEspacoDireita.Width;
     frmAnimacao.Height := 165;

     frmAnimacao.Show;

End;

//--------------------------------------------------------------------
//-- SetProgressBar
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   LinhaAtual : Número da Linha atual que está sendo processada
//--
//----------------------------------------------------------------------//
Procedure TfrmAnimacao.SetProgressBar ( LinhaAtual : Integer );
Begin
  Application.ProcessMessages;
  PrgrssBrBarra.Position := LinhaAtual * 100 div wTotLinhas;
  PrgrssBrBarra.refresh;
  frmAnimacao.Refresh;
End;


procedure TfrmAnimacao.FormCreate(Sender: TObject);
begin
     Cancel := False;
end;

procedure TfrmAnimacao.BtBtnCancelarClick(Sender: TObject);
begin
     Cancel := True;
end;

end.
