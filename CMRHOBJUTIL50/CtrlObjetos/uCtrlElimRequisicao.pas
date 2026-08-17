{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlElimRequisicao;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlElimRequisicao = class(TCtrlCustomRH)
  public
    function EliminarRequisicoes(const IAppCliente: OleVariant; ListaIdCargos: string;
      DataRef: TDateTime; var NumElim: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimRequisicao }

function TCtrlElimRequisicao.EliminarRequisicoes(const IAppCliente: OleVariant;
  ListaIdCargos: string; DataRef: TDateTime; var NumElim: integer): boolean;
var
  bOk: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EliminarRequisicoes(IAppCliente, ListaIdCargos,
      DataRef, NumElim);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    NumElim := 0;
    try
      _Cds.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  NUMREQ, DATAREQ'+CR_LF+
        'FROM'+CR_LF+
        '  REQUIPES'+CR_LF+
        'WHERE'+CR_LF+
        IFF(ListaIdCargos = '', '', '  (IDCARGO  IN (' +ListaIdCargos+ ')) AND')+
        '  (DATAREQ   < TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  (SITUACAO <> ''A'')');

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarEliminarCandidatos_CB(_Cds.RecordCount, 0, false);
      except
      end;

      StartTransaction;

      while not(_Cds.EOF) do
      begin
        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarEliminarCandidatos_CB(0, _Cds.FieldByName('NUMREQ').asFloat, false);
        except
        end;

        bOk := ExecSQL('DELETE FROM REQUICAND WHERE (NUMREQ = ' +
          _Cds.FieldByName('NUMREQ').asString+ ')');

        if (bOk) then
        begin
          bOk := ExecSQL('DELETE FROM REQUIPES WHERE (NUMREQ = ' +
            _Cds.FieldByName('NUMREQ').asString+ ')', true);

          if (bOk) then
            Inc(NumElim);
        end;

        _Cds.Next;
        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarEliminarCandidatos_CB(0, 0, true);
        except
        end;
      end;

      Commit;
      Result := true;

      if (NumElim = 0) then
        MessageInfo := ('Nenhuma Requisição foi excluída.')
      else
        MessageInfo := ('Procedimento Concluído com sucesso.');
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
