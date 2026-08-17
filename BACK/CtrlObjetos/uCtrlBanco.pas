unit uCtrlBanco;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE BANCOS  ( MT )
//
//      Módulo          :  BACK - temporário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  15/05/2002
//      Data de Término :  16/05/2002
//
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes;

type TCtrlBanco = class(TCMControlObject)

     private
     protected
     public
       function LookupBanco(const sNumBanco:String = '') : OLEVariant;

     published

end;

implementation

{ TCtrlBanco }


function TCtrlBanco.LookupBanco(const sNumBanco: String): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if sNumBanco <> '' then sParam := sParam + ' AND B.NUMBANCO = ' + QuotedStr(sNumBanco);
  sSql := 'SELECT PB.NOME,    PB.RAZAOSOCIAL, ' +#13+
          '       B.NUMBANCO, B.IDPESSOA ' +#13+
          '  FROM PESSOA PB, BANCO B ' +#13+
          ' WHERE B.IDPESSOA = PB.IDPESSOA ' +#13+ sParam +#13+
          'ORDER BY PB.RAZAOSOCIAL';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


end.
