{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Tela de 'espera' para processamentos                }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FCustomAguardeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFrmCustomAguardeMT = class(TForm)
    Animate: TAnimate;
    LblMsg: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustomAguardeMT: TFrmCustomAguardeMT;

implementation

{$R *.DFM}

procedure TFrmCustomAguardeMT.FormShow(Sender: TObject);
begin
  Animate.Active := True;
  FrmCustomAguardeMT.Width := LblMsg.Left + LblMsg.Width + 30
end;

end.
