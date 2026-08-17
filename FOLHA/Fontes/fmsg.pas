{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FMsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, TB97, TB97Tlbr;

type
  TfrmMsg = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    pnlFundo: TPanel;
    memMensagem: TMemo;
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMsg: TfrmMsg;

implementation

{$R *.DFM}

procedure TfrmMsg.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}
{==============================================================================|
| UNIT                       : FMsg.pas
|
| DESCRIÇÃO FUNCIONAL        : Janela para exibição de um campo Memo para
|                              consulta.
|
===============================================================================|
| DESENVOLVEDOR              : David Ayrolla dos Santos
|
| PERÍODO DE IMPLEMENTAÇÃO   : de 11/01/2001 a 17/01/2001
|
| VERSÃO PARA LIBERAÇÃO      : 3.02.11c
|
| CLIENTE                    : REFER
|
| DESCRIÇÃO DA IMPLEMENTAÇÃO : Criado inicialmente para exibir observações sobre
|                              estornos (no módulo de "Consulta a Estornos"),
|						 				esta janela pode ser utilizada em outros módulos
|										do sistema.
|
|==============================================================================}

