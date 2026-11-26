unit UModulo;

interface

uses Classes, UAutorizacao, dbTables, Forms, SysUtils, Dialogs;

type TModulo = Class

   private

   public
      sSistema : String;
      sMascaraPlano,
      sMascaraDesemb,
      sIntegraContab: String;
      iEmpresaProp,
      iPlano : Integer;
      iUsuario : Integer;
      SisCodOrigem : String;
      UnidNegoc : Integer;
      sLancFinanc:string;
      sEstorna:string;
      bTipoOper:boolean;
      ObrigaCrespon,
      ObrigaAbc:string;

      bUsaCentRespon,bUsaUnidNegoc,bIntegraContab : boolean;
      iUnidNegoc : integer;
      sCODCENTRORESPON : string;

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
