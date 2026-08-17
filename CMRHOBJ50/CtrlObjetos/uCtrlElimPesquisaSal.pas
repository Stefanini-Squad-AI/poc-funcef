{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlElimPesquisaSal;

interface

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet;

type
  TCtrlElimPesquisaSal = class(TCmControlObject)
  public
    function ListPesquisaSalarial: OleVariant;

    function EliminiarPesquisaSalarial(IdPesqSalar: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimPesquisaSal }

function TCtrlElimPesquisaSal.ListPesquisaSalarial: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESQSALAR, NOMEPESQSALAR'+CR_LF+
    'FROM'+CR_LF+
    '  PESQISAL');
end;

function TCtrlElimPesquisaSal.EliminiarPesquisaSalarial(IdPesqSalar: integer): boolean;
begin
  try
    StartTransaction;
    Result := ExecSQL('DELETE FROM DADOPESQSAL WHERE (IDPESQSALAR = '+IntToStr(IdPesqSalar)+')');
    if (Result) then
      Result := ExecSQL('DELETE FROM TENDPESQSAL WHERE (IDPESQSALAR = '+IntToStr(IdPesqSalar)+')');
    if (Result) then
      Result := ExecSQL('DELETE FROM PESQISAL WHERE (IDPESQSALAR = '+IntToStr(IdPesqSalar)+')');
    Commit;

    if (Result) then
      MessageInfo := 'Procedimento Concluído com sucesso.';
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
