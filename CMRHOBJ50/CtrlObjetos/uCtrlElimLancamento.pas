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

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet;

type
  TCtrlElimLancamento = class(TCmControlObject)
  public
    function Processar(AnoMes, IdRubricasSel: string; MesAnoIni: boolean;
      Comparador: string; Permanente, Processados: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimLancamento }

function TCtrlElimLancamento.Processar(AnoMes,IdRubricasSel: string;
  MesAnoIni: boolean; Comparador: string; Permanente, Processados: integer): boolean;
var
  sSQL: string;
begin
  try
    sSQL := 'DELETE FROM RUBRICAINDIV'+CR_LF+
            'WHERE  (FLGTPRUBMANUT   = ''2'')';

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
    Commit;
  except
    Rollback;
    Result := false;
  end;
end;

end.
