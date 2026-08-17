{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 25/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlElimLancamento;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlElimLancamento = class(TCtrlCustomRH)
  public
    function Processar(AnoMes, IdRubricasSel: string; MesAnoIni: boolean;
      Comparador: string; Permanente, Processados, IdEmpresa: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimLancamento }

function TCtrlElimLancamento.Processar(AnoMes, IdRubricasSel: string;
  MesAnoIni: boolean; Comparador: string; Permanente, Processados, IdEmpresa: integer): boolean;
var
  sSQL: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EliminarLancamentos(AnoMes, IdRubricasSel,
      MesAnoIni, Comparador, Permanente, Processados, IdEmpresa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      sSQL := 'DELETE FROM RUBRICAINDIV'+CR_LF+
              'WHERE  (FLGTPRUBMANUT   = ''2'')';

      sSQL := sSQL +CR_LF+ ' AND   (IDEMPRESA  = ' +IntToStr(IdEmpresa)+ ')';

      if (Trim(IdRubricasSel) <> '') then
        if (Pos(',',IdRubricasSel) > 0) then
          sSQL := sSQL +CR_LF+ ' AND   (IDRUBRICA      IN (' +IdRubricasSel+ '))'
        else
          sSQL := sSQL +CR_LF+ ' AND   (IDRUBRICA       = ' +IdRubricasSel+ ')';

      if not(MesAnoIni) then
        sSQL := sSQL +CR_LF+ ' AND   (ANOMESINICIO  ' +Comparador+ ' ' +QuotedStr(AnoMes)+ ')';

      if (Permanente < 2) then
        sSQL := sSQL +CR_LF+ ' AND   (FLGPERMANENTE  <> ' +IntToStr(Permanente)+ ')';

      if (Processados < 2) then
        if (Processados = 0) then
          sSQL := sSQL +CR_LF+ ' AND   (NUMOCORRENCIAS >= PARCELAS)'
        else
          sSQL := sSQL +CR_LF+ ' AND   (NUMOCORRENCIAS  < PARCELAS)';

      StartTransaction;

      Result := ExecSQL(sSQL);
      if not(Result) then
        raise Exception.Create(MessageInfo);

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