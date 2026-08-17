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
unit uProcuraFO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FProcura;

type
  TProcuraDlg = class(TComponent)
  private
    { Private declarations }
    FUsaTeclado,
    FAbreCheio: Boolean;
    FOwner:TComponent;
    FCamposBusca,
    FCamposTbl,
    FSelecionados,
    FNomeSelecionados,
    FLengthSelecionados,
    FCondicaoEsp,
    FValoresSaida,
    FNomeTabela: TStrings;
    FNomeDataBase: String;
    FFonte: TFont;
    function ExecProcura(AParentForm:TComponent): Boolean;
    procedure SetCamposBusca(val: TStrings);
    procedure SetCamposTbl(val: TStrings);
    procedure SetSelecionados(val: TStrings);
    procedure SetNomeSelecionados(val: TStrings);
    procedure SetLengthSelecionados(val: TStrings);
    procedure SetCondicaoEsp(val: TStrings);
    procedure SetNomeTabela(val: TStrings);
    procedure SetFonte(val: TFont);
    procedure SetNomeDataBase(val: string);
    procedure SetAbreCheio(val: Boolean);
    procedure SetUsaTeclado(val: Boolean);

    function GetCamposBusca: TStrings;
    function GetCamposTbl: TStrings;
    function GetSelecionados: TStrings;
    function GetNomeSelecionados: TStrings;
    function GetLengthSelecionados: TStrings;
    function GetCondicaoEsp: TStrings;
    function GetNomeTabela: TStrings;
    function GetFonte: TFont;
    function GetNomeDataBase: string;
    function GetAbreCheio: Boolean;
    function GetUsaTeclado: Boolean;

  protected
    { Protected declarations }
  public
    property ValoresSaida: TStrings read FValoresSaida;
    function Execute:Boolean;
    constructor Create(AOwner: Tcomponent);override;
    destructor Destroy;override;
  published
    property CamposBusca:TStrings read GetCamposBusca write SetCamposBusca;
    property CamposTbl: TStrings read GetCamposTbl write SetCamposTbl;
    property Selecionados: TStrings read GetSelecionados write SetSelecionados;
    property NomeSelecionados: TStrings read GetNomeSelecionados write SetNomeSelecionados;
    property LengthSelecionados: TStrings read GetLengthSelecionados write SetLengthSelecionados;
    property NomeDataBase: String read GetNomeDataBase write SetNomeDataBase;
    property CondicaoEsp: TStrings read GetCondicaoEsp write SetCondicaoEsp;
    property NomeTabela:TStrings read GetNomeTabela write SetNomeTabela;
    property Fonte: TFont read GetFonte write SetFonte;
    property AbreGridCheio: Boolean read GetAbreCheio write SetAbreCheio default True;
    property UsaTeclado: Boolean read GetUsaTeclado write SetUsaTeclado default false;
  end;

implementation

procedure TProcuraDlg.SetFonte(val: TFont);
begin
  if FFonte <> Val then
     FFonte.Assign(val);
end;
procedure TProcuraDlg.SetCamposBusca(val: TStrings);
begin
  if FCamposBusca <> val then
    FCamposBusca.Assign(val);
end;
procedure TProcuraDlg.SetCamposTbl(val: TStrings);
begin
  if FCamposTbl <> val then
    FCamposTbl.Assign(val);
end;
procedure TProcuraDlg.SetSelecionados(val: TStrings);
begin
  if FSelecionados <> val then
    FSelecionados.Assign(val);
end;
procedure TProcuraDlg.SetNomeSelecionados(val: TStrings);
begin
  if FNomeSelecionados <> val then
    FNomeSelecionados.Assign(val);
end;
procedure TProcuraDlg.SetLengthSelecionados(val: TStrings);
begin
  if FLengthSelecionados <> val then
    FLengthSelecionados.Assign(val);
end;
procedure TProcuraDlg.SetCondicaoEsp(val: TStrings);
begin
  if FCondicaoEsp <> val then
    FCondicaoEsp.Assign(val);
end;
procedure TProcuraDlg.SetNomeTabela(val: TStrings);
begin
  if FNomeTabela <> val then
    FNomeTabela.Assign(val);
end;

procedure TProcuraDlg.SetNomeDataBase(val: string);
begin
  FNomeDataBase := val;
end;

procedure TProcuraDlg.SetAbreCheio(val: Boolean);
begin
  FAbreCheio := val;
end;

procedure TProcuraDlg.SetUsaTeclado(val: Boolean);
begin
  FUsaTeclado := val;
end;

function TProcuraDlg.GetCamposBusca: TStrings;
begin
  Result := FCamposBusca;
end;

function TProcuraDlg.GetCamposTbl: TStrings;
begin
  Result := FCamposTbl;
end;

function TProcuraDlg.GetSelecionados: TStrings;
begin
  Result := FSelecionados;
end;

function TProcuraDlg.GetNomeSelecionados: TStrings;
begin
  Result := FNomeSelecionados;
end;

function TProcuraDlg.GetLengthSelecionados: TStrings;
begin
  Result := FLengthSelecionados;
end;

function TProcuraDlg.GetCondicaoEsp: TStrings;
begin
  Result := FCondicaoEsp;
end;

function TProcuraDlg.GetNomeTabela: TStrings;
begin
  Result := FNomeTabela;
end;

function TProcuraDlg.GetFonte: TFont;
begin
  Result := FFonte;
end;

function TProcuraDlg.GetNomeDataBase: string;
begin
  Result := FNomeDataBase;
end;

function TProcuraDlg.GetAbreCheio: Boolean;
begin
  Result := FAbreCheio;
end;

function TProcuraDlg.GetUsaTeclado: Boolean;
begin
  Result := FUsaTeclado;
end;

constructor TProcuraDlg.Create(AOwner: Tcomponent);
begin
 inherited Create(AOwner);
 FCamposBusca := TStringList.Create;
 FCamposTbl := TStringList.Create;
 FSelecionados := TStringList.Create;
 FNomeSelecionados := TStringList.Create;
 FLengthSelecionados := TStringList.Create;
 FCondicaoEsp := TStringList.Create;
 FValoresSaida := TStringList.Create;
 FNomeTabela := TStringList.Create;
 FFonte:= TFont.Create;

 FOwner := AOwner;
end;

destructor TProcuraDlg.Destroy;
begin
   FFonte.Free;
   FCamposBusca.Destroy;
   FCamposTbl.Destroy;
   FSelecionados.Destroy;
   FNomeSelecionados.Destroy;
   FLengthSelecionados.Destroy;
   FCondicaoEsp.Destroy;
   FNomeTabela.Destroy;
   FValoresSaida.Destroy;
   inherited Destroy;
end;

function TProcuraDlg.Execute:Boolean;
begin
 result := ExecProcura(FOwner);
end;

function TProcuraDlg.ExecProcura(AParentForm:TComponent): Boolean;
begin
  result := Procura(FFonte,FAbreCheio,FUsaTeclado,AParentForm,FCamposTbl,FSelecionados,
                    FCamposBusca,FNomeSelecionados,FLengthselecionados,FNomeDataBase,
                    FNomeTabela.Text,FCondicaoEsp.Text,FValoresSaida);
end;
end.
