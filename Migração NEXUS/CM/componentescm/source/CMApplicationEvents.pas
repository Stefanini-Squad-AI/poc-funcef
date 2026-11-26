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
unit CMApplicationEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AppEvnts;

type
  TOnPrintReportPadrao = procedure (sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean) of Object;
  TOnShowParamReportPadrao = procedure (sender: TObject; IdReports: Integer; Var sParams: String; Var PrintReport: Boolean) of Object;
  TOnConfigReportPadrao = procedure (liIdReports, liOrigemCm: Integer; DesReport: TObject; var Config: Boolean) of Object;

  TCMApplicationEvents = class(TApplicationEvents)
  private
    FAfterLogin: TNotiFyEvent;
    FOnCreateFormReports: TNotiFyEvent;
    FOnPrintReportPadrao: TOnPrintReportPadrao;
    FOnShowParamReportPadrao: TOnShowParamReportPadrao;
    FOnConfigReportPadrao: TOnConfigReportPadrao;
    procedure SetAfterLogin(const Value: TNotiFyEvent);
    procedure SetOnCreateFormReports(const Value: TNotiFyEvent);
    procedure SetOnPrintReportPadrao(const Value: TOnPrintReportPadrao);
    procedure SetOnShowParamReportPadrao(
      const Value: TOnShowParamReportPadrao);
    procedure SetOnConfigReportPadrao(const Value: TOnConfigReportPadrao);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure DoAfterLogin;
    Procedure CreateFormReports;
    function PrintReportPadrao(IdReports: Integer; sFileName: String): Boolean;
    function ConfigReport(liIdReports, liOrigemCm: Integer; DesReport: TObject): Boolean;
  published
    { Published declarations }
    property AfterLogin: TNotiFyEvent read FAfterLogin write SetAfterLogin;
    property OnCreateFormReports: TNotiFyEvent read FOnCreateFormReports write SetOnCreateFormReports;
    property OnPrintReportPadrao: TOnPrintReportPadrao read FOnPrintReportPadrao write SetOnPrintReportPadrao;
    property OnShowParamReportPadrao: TOnShowParamReportPadrao read FOnShowParamReportPadrao write SetOnShowParamReportPadrao;
    property OnConfigReportPadrao: TOnConfigReportPadrao read FOnConfigReportPadrao write SetOnConfigReportPadrao;
    
  end;

implementation

{ TCMApplicationEvents }

function TCMApplicationEvents.ConfigReport(liIdReports,
  liOrigemCm: Integer; DesReport: TObject): Boolean;
Var
  bConfig: Boolean;
begin
  bConfig := False;

  If Assigned(FOnConfigReportPadrao) Then FOnConfigReportPadrao(liIdReports, liOrigemCm, DesReport, bConfig);

  Result := bConfig;
end;

procedure TCMApplicationEvents.CreateFormReports;
begin
  If Assigned(OnCreateFormReports) Then OnCreateFormReports(self);
end;

procedure TCMApplicationEvents.DoAfterLogin;
begin
  If Assigned(AfterLogin) Then AfterLogin(self);
end;


function TCMApplicationEvents.PrintReportPadrao(IdReports: Integer;
         sFileName: String): Boolean;
Var
  bPrinted: Boolean;
begin
  bPrinted := False;

  If Assigned(FOnPrintReportPadrao) Then FOnPrintReportPadrao(Self,IdReports,sFileName,bPrinted);

  Result := bPrinted;
end;

procedure TCMApplicationEvents.SetAfterLogin(const Value: TNotiFyEvent);
begin
  FAfterLogin := Value;
end;


procedure TCMApplicationEvents.SetOnConfigReportPadrao(
  const Value: TOnConfigReportPadrao);
begin
  FOnConfigReportPadrao := Value;
end;

procedure TCMApplicationEvents.SetOnCreateFormReports(
  const Value: TNotiFyEvent);
begin
  FOnCreateFormReports := Value;
end;

procedure TCMApplicationEvents.SetOnPrintReportPadrao(
  const Value: TOnPrintReportPadrao);
begin
  FOnPrintReportPadrao := Value;
end;

procedure TCMApplicationEvents.SetOnShowParamReportPadrao(
  const Value: TOnShowParamReportPadrao);
begin
  FOnShowParamReportPadrao := Value;
end;

end.
