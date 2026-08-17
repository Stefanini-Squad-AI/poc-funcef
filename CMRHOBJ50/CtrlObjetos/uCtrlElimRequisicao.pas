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

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlElimRequisicao = class(TCtrlCustomRH)
  public
    function EliminarRequisicoes(ListaIdCargos: string; DataRef: TDate;
      var NumElim: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimRequisicao }

function TCtrlElimRequisicao.EliminarRequisicoes(ListaIdCargos: string; DataRef: TDate;
  var NumElim: integer): boolean;
begin
  NumElim := 0;
  //Result := true;
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

    DoProgresso([_Cds.RecordCount, 0, 0]);

    StartTransaction;

    while not(_Cds.EOF) do
    begin
      DoProgresso([0, _Cds.FieldByName('NUMREQ').asString, 0]);

      if (ExecSQL('DELETE FROM REQUICAND WHERE (NUMREQ = ' +
        _Cds.FieldByName('NUMREQ').asString+ ')', true)) then
        Inc(NumElim);

      _Cds.Next;
      DoProgresso([0, 0, 1]);
    end;

    Commit;
    Result := true;

    if (NumElim = 0) then
      MessageInfo := 'Nenhuma Requisição foi excluída.'
    else
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
