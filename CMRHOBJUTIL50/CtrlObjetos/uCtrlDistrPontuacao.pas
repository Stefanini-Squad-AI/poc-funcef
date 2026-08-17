{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlDistrPontuacao;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCtrlCustomRH;

type
  TCtrlDistrPontuacao = class(TCtrlCustomRH)
  private
  public
    function ListGrupoFunc: OleVariant;
    function ListCargo: OleVariant;
    function ListGrauCargo: OleVariant;
    function ListPesoGrupo: OleVariant;
    function ListFaixa: OleVariant;
    function ListClasseSal: OleVariant;    
  end;

implementation

{ TCtrlDistrPontuacao }

function TCtrlDistrPontuacao.ListGrupoFunc: OleVariant;
begin
  Result := GetDataPacket('SELECT CODGRPFUNC FROM GRUPFUNC');
end;

function TCtrlDistrPontuacao.ListCargo: OleVariant;
begin
  Result := GetDataPacket('SELECT * FROM CARGO');
end;

function TCtrlDistrPontuacao.ListGrauCargo: OleVariant;
begin
  Result := GetDataPacket('SELECT IDCARGO, IDFATORAVAL, GRAU FROM GRAUCARGO');
end;

function TCtrlDistrPontuacao.ListPesoGrupo: OleVariant;
begin
  Result := GetDataPacket('SELECT CODGRPFUNC, IDFATORAVAL, PESO FROM PESOFATGRP');
end;

function TCtrlDistrPontuacao.ListFaixa: OleVariant;
begin
  Result := GetDataPacket('SELECT IDFAIXASALARIAL FROM FAIXASAL');
end;

function TCtrlDistrPontuacao.ListClasseSal: OleVariant;
begin
  Result := GetDataPacket('SELECT CODGRPFUNC, MINIMO, MAXIMO, IDFAIXASALARIAL FROM CLASSESAL');
end;

end.
