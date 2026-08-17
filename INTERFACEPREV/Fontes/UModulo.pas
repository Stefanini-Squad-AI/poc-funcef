unit UModulo;

interface

uses Classes,UAutorizacao,dbTables,Forms,SysUtils,Dialogs, DB, Wwquery;

type TModulo = Class
   private

   public
      sMascaraDesembRec,      // mascara do Tipo de Desembolso para CAR
      sMascaraDesembPag,      // mascara do Tipo de Desembolso para CAP
      sIntegraRec,            // indica se o AdmPrev está integrado com o CAR
      sIntegraPag   : String; // indica se o AdmPrev está integrado com o CAP
      iUsuario  : longInt;

      bUsaABC   : boolean;
      bUsaCentRespon,bUsaUnidNegoc,bIntegraContab : boolean;
      
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
