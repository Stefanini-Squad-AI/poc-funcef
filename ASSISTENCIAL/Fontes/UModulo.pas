unit UModulo;

interface

uses Classes,UAutorizacao,dbTables,Forms,SysUtils,Dialogs, DB, Wwquery;

type TModulo = Class
   private

   public
      sSistema       :String;
      //sisRecPag      : String;    Exclusão em 07/06/99 - Padrao 4.25
      //sMascaraPlano,
      //sMascaraDesemb,
      //sIntegraContab : String;
      iEmpresaProp,
      //iPlano       : Integer;
      iUsuario ,
      iParamContab,
      iParamCAP,
      iParamCAR    : Integer;
      SisCodOrigem : String;
      UnidNegoc    : Integer;

      function GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
   end;

var Modulo : TModulo;

implementation

uses UDataBase, USistema, DBaseDados;

function TModulo.GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
var iIdLogTotalPREV : longint;
begin
   Result := False;

   iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
   if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';
   with dtmBaseDados.qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA) '+
             ' VALUES ('+IntToStr(iIdLogTotalPREV)+','+
                         IntToStr(Sistema.IdModulo)+','+
                         ''''+Copy(psDescOperacao,1,100)+''','+
                         IntToStr(Sistema.IdUsuario)+', '+
                         ' SYSDATE )');
     try
        ExecSQL;
     except
        Exit;
     end;
   end;
   Result := True;
end; // GravaLogTOTALPREV

end.


 


