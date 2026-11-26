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
unit CMDBLookupCombo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook;

type
  TCMDBLookupCombo = class(TwwDBLookupCombo)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
  end;

implementation

constructor TCMDBLookupCombo.Create(AOwner:TComponent);
begin
     inherited;
     AllowClearKey := true;
     AutoDropDown := true;
     Options := [loTitles];
     ShowMatchText := true;
     Style := csDropDownList;
end;

end.
