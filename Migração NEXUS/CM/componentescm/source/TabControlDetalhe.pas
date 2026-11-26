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
unit TabControlDetalhe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TTabControlDetalhe = class(TTabControl)
  private
    { Private declarations }
    FGrids : TStrings;
  protected
    { Protected declarations }
    procedure SetGrids(s:TStrings) ;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property detdbGrids : TStrings read FGrids write SetGrids;
  end;

implementation

constructor TTabControlDetalhe.Create(AOwner:TComponent);
begin
     inherited;
     FGrids := TSTringList.Create;
end;

destructor TTabControlDetalhe.Destroy;
begin
     FGrids.free;
     inherited;
end;

procedure TTabControlDetalhe.SetGrids(s:TStrings);
begin
     FGrids.Assign(s);
end;

end.
