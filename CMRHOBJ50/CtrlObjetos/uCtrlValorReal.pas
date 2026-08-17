{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlValorReal;

interface

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlValorReal = class(TCtrlCustomRH)
  protected
    procedure OnCreateAppServer; override;
  private
    FCdsValorReal: TCMClientDataSet;
  public
    destructor Destroy; override;

    procedure CalcularValorReal(ValorRateio: double);

    property CdsValorReal: TCMClientDataSet read FCdsValorReal write FCdsValorReal;
  end;

implementation

//uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlValorReal }

destructor TCtrlValorReal.Destroy;
begin
  if (IsAppServer) then
    FCdsValorReal.Free;
  inherited;
end;

procedure TCtrlValorReal.OnCreateAppServer;
begin
  inherited;
  FCdsValorReal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlValorReal.CalcularValorReal(ValorRateio: double);
var
  TotCusto: double;
begin
  TotCusto := 0;
  CdsValorReal.First;
  while not(CdsValorReal.EOF) do
  begin
    TotCusto := TotCusto + CdsValorReal.FieldByName('VALORPROVAVEL').asFloat;
    CdsValorReal.Next;
  end;

  CdsValorReal.First;
  while not(CdsValorReal.EOF) and (TotCusto > 0) do
  begin
    CdsValorReal.Edit;
    CdsValorReal.FieldByName('VALORSENTENCA').asFloat :=
      Round(CdsValorReal.FieldByName('VALORPROVAVEL').asFloat *
      ValorRateio / TotCusto * 100) / 100;
    CdsValorReal.Post;
    CdsValorReal.Next;
  end;
  CdsValorReal.First;
end;

end.
