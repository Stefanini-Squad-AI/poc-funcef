{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlElimCandidato;

interface

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH;

type
  TCtrlElimCandidato = class(TCtrlCustomRH)
  public
    function EliminarCandidatos(ListaIdCargos: string; DataRef: TDate;
      var NumElim: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimCandidato }

function TCtrlElimCandidato.EliminarCandidatos(ListaIdCargos: string; DataRef: TDate;
  var NumElim: integer): boolean;
var
  bOk: boolean;  
begin
  NumElim := 0;
  try
    _Cds.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDPESSOA, DATINCLU'+CR_LF+
      'FROM'+CR_LF+
      '  CANDIDAT'+CR_LF+
      'WHERE'+CR_LF+
      IFF(ListaIdCargos = '', '', '  (IDCARGO IN (' +ListaIdCargos+ ')) AND'+ CR_LF)+
      '  (DATINCLU < TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''))');

    DoProgresso([_Cds.RecordCount, 0, 0]);

    StartTransaction;

    while not(_Cds.EOF) do
    begin
      DoProgresso([0, _Cds.FieldByName('IDPESSOA').asString, 0]);

      bOk := ExecSQL('DELETE FROM REQUICAND WHERE (IDPESSOA = ' +
        _Cds.FieldByName('IDPESSOA').asString+ ')');

      if (bOk) then
      begin
        bOk := ExecSQL('DELETE FROM CANDIDAT WHERE (IDPESSOA = ' +
          _Cds.FieldByName('IDPESSOA').asString+ ')', true);

        if (bOk) then
          Inc(NumElim);
      end;

      _Cds.Next;
      DoProgresso([0, 0, 1]);
    end;
    
    Commit;
    Result := true;

    if (NumElim = 0) then
      MessageInfo := 'Nenhum Candidato foi excluído.'
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
