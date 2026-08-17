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
unit MAHlpBtn;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TmaHelpBitBtn = class(TBitBtn)
  private
    { Private declarations }
    FClickHelpContext: THelpContext;
  public
    { Public declarations }
    procedure Click; override;
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property ClickHelpContext: THelpContext read FClickHelpContext write FClickHelpContext;
  end;

implementation

constructor TmaHelpBitBtn.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   
   Caption := 'Aju&da';
end;

procedure TmaHelpBitBtn.Click;
begin
  if FClickHelpContext <> 0
  then Application.HelpContext(FClickHelpContext)
  else if TForm(Owner).HelpContext <> 0
       then Application.HelpContext(TForm(Owner).HelpContext);
  inherited Click;
end;

end.
