unit UModulo;

interface
uses SysUtils;

type TModulo = Class
   private
          FZeroUm   : String;
          FNumAvali : Integer;
   public
         // Atributos
         property bUsaZeroUm : String read FZeroUm write FZeroUm;
         property iNumAvali  : Integer read FNumAvali write FNumAvali;
         // Mensagens
         Procedure SetParametros;
   end;

var Modulo : TModulo;

implementation

Uses uSistema, uDataBase, dBaseDados;

Procedure TModulo.SetParametros;
Begin
 If Fazquery(DtmBaseDados.qry,' SELECT FLGZEROUM,NUMAVALI '+
                               ' FROM  PARAMSCQ  '+
                               ' WHERE '+
                               '       (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ')
  Then
     Begin
       FZeroUm   := DtmBaseDados.qry.FieldByName('FLGZEROUM').asString;
       FNumAvali := DtmBaseDados.qry.FieldByName('NUMAVALI').asInteger;
     End
  Else
     Begin
       FZeroUm   := '';
       FNumAvali := -1;
     End;
End;

end.

