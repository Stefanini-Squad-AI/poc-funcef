{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit fCmErrorDlg;

{-------------------------------------------------------------------------------
Analista : Alex Pereira
Data     : 23/03/03
Pendência: 16328
Motivo   : Montar dinamicamente a lista de bpl da mensagem de erro do usuário
Solução  : Inserido componente resourcemangager utilizado por CmErroDialog
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, CmDock, StdCtrls, ComCtrls, Buttons, TB97Tlbr, TB97, uResource;

type
  TFrmCmErrorDlg = class(TForm)
    Bevel1: TBevel;
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    BtbEmail: TBitBtn;
    pnlFundo: TPanel;
    ReError: TRichEdit;
    Image2: TImage;
    ResourceManager: TCMResourceManager;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCmErrorDlg: TFrmCmErrorDlg;

implementation

Uses uSistema;

{$R *.DFM}

procedure TFrmCmErrorDlg.bbtnConfirmarClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;

end.
