unit UModulo;

interface
Uses SysUtils;

type TModulo = Class
   private

   public
         iPlano          : Integer;
         iHotel          : Integer;
         sMascDocFis     : String;
         sMascDocJur     : String;
         sisrecpag       : String;
         sLancFinanc     : String;
         sEstorna        : String;
         ObrigaAbc       : String;
         ObrigaCrespon   : String;
         sMascaraDesemb  : String;
         sPRO            : String;
         sPrazoFluxoOrc  : String;
         sNaoIdent       : String;
         sMascaraPlano   : String;
         sIntegraContab  : String;
         bTipoOper       : Boolean;
         bIntegraContab  : Boolean;

         Function VerifImposto( sCODTIPRECDES, sRecPag : String ) : Boolean;
   end;

var Modulo : TModulo ;

implementation

Uses uDataBase, dBaseDados, uSistema;

Function TModulo.VerifImposto( sCODTIPRECDES, sRecPag : String ) : Boolean;
Begin
 Result := False;
 If FazQuery(DtmBaseDados.qry,' SELECT FLGCALCULAIMPOSTO '+
                              ' FROM TIPORECEBDESEMB '+
                              ' WHERE  (RTRIM(CODTIPRECDES) = '''+Trim(sCODTIPRECDES)+''')'+
                              '    AND (RECPAG   = '''+sRecPag+''')'+
                              '    AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
 Then
    Result := DtmBaseDados.qry.FieldByName('FLGCALCULAIMPOSTO').AsString = 'S';
End;

end.
 
