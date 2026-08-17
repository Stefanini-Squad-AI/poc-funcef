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

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlElimPesquisaSal = class(TCtrlCustomRH)
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
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EliminiarPesquisaSalarial(IdPesqSalar);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL('DELETE FROM DADOPESQSAL WHERE (IDPESQSALAR = '+IntToStr(IdPesqSalar)+')');
      if (Result) then
        Result := ExecSQL('DELETE FROM TENDPESQSAL WHERE (IDPESQSALAR = '+IntToStr(IdPesqSalar)+')');
      if (Result) then
        Result := ExecSQL('DELETE FROM PESQISAL WHERE (IDPESQSALAR = '+IntToStr(IdPesqSalar)+')');

      if not(Result) then
        raise Exception.Create(MessageInfo)
      else  
        MessageInfo := ('Procedimento Concluído com sucesso.');

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;  
end;

end.