//********************************************************************************************************
//Data    : 12/09/2005
//Codigo  : AL_2
//Descr.  : Recebe o ID da operação de Direito, para testar se existe OUTRA operação igual
//********************************************************************************************************
//Data    : 08/09/2005
//Codigo  : AL_1
//Descr.  : Faz Outer Join para testar operações que exijam só Origem
//********************************************************************************************************
unit uDireitos;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, ComCtrls;

Type
   TDireitos = Class(TObject)
   private

   public
    // AL_2
    function ExisteOperDir(iTipoOperacao, iEmissor: Integer;
                           dDataAge, dDataBase, dDataPrevista: TDateTime;
                           iInvOrig: Integer = -1; iInvDest: Integer = -1;
                           iOperDireito: Integer = -1): Boolean;

   end;

var
  Direitos : TDireitos;

implementation

uses UOperComum, DBaseDados, UDatabase, USistema, UBibliotecaInvest,
     UMensErro, UOperacaoInvest, dOperComum;

// AL_2
function TDireitos.ExisteOperDir(iTipoOperacao, iEmissor: Integer;
                                 dDataAge, dDataBase, dDataPrevista: TDateTime;
                                 iInvOrig: Integer = -1; iInvDest: Integer = -1;
                                 iOperDireito: Integer = -1): Boolean;
var QryBuscaOperDireito: TwwQuery;
begin
   try  // Finally
      Result := True;
      try  // Except
         QryBuscaOperDireito := TwwQuery.Create(Application);
         QryBuscaOperDireito.DatabaseName := 'BaseDados';
         QryBuscaOperDireito.SQL.Add('SELECT O.IDOPERACAODIREITO ');
         QryBuscaOperDireito.SQL.Add('FROM OPERACAODIREITO O, ');
         QryBuscaOperDireito.SQL.Add('     (SELECT * FROM OPERDIREITOXINV WHERE ORIGDEST = ''O'') ORIG, ');
         QryBuscaOperDireito.SQL.Add('     (SELECT * FROM OPERDIREITOXINV WHERE ORIGDEST = ''D'') DEST ');
         QryBuscaOperDireito.SQL.Add('WHERE O.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));
         QryBuscaOperDireito.SQL.Add('  AND O.IDEMISSOR      = ' + IntToStr(iEmissor));
         QryBuscaOperDireito.SQL.Add('  AND O.DATAEX         = TO_DATE(' + QuotedStr(DateToStr(dDataBase)) + ', ' + QuotedStr('dd/mm/yyyy') + ')');
         QryBuscaOperDireito.SQL.Add('  AND O.DATAAGE        = TO_DATE(' + QuotedStr(DateToStr(dDataAGE)) + ', ' + QuotedStr('dd/mm/yyyy') + ')');
         QryBuscaOperDireito.SQL.Add('  AND O.DATACOM        = TO_DATE(' + QuotedStr(DateToStr(dDataPrevista)) + ', ' + QuotedStr('dd/mm/yyyy') + ')');
         // AL_1
         QryBuscaOperDireito.SQL.Add('  AND ORIG.IDOPERACAODIREITO(+) = O.IDOPERACAODIREITO ');
         QryBuscaOperDireito.SQL.Add('  AND DEST.IDOPERACAODIREITO(+) = O.IDOPERACAODIREITO ');
         // AL_2
         QryBuscaOperDireito.SQL.Add('  AND O.IDOPERACAODIREITO <> ' + IntToStr(iOperDireito));
         if iInvOrig > 0 then
            QryBuscaOperDireito.SQL.Add('  AND ORIG.IDINVESTIMENTO = ' + IntToStr(iInvOrig));
         if iInvDest > 0 then
            QryBuscaOperDireito.SQL.Add('  AND DEST.IDINVESTIMENTO = ' + IntToStr(iInvDest));
         QryBuscaOperDireito.Open;
         if QryBuscaOperDireito.IsEmpty then
            Result := False;
      except
         Result := True;
      end;
   finally
      FreeAndNil(QryBuscaOperDireito);
   end;
end;



end.
