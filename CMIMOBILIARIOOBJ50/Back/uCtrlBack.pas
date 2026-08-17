unit uCtrlBack;

// -----------------------------------------------------------------------------
//
//      OBJETOS DE CONTROLES DO BACK  ( MT )
//
//      Módulo          :  BACK - temporário
//      Autor           :  Vinícius Meyer Lana e Marcio Motta
//      Data de Início  :  10/03/2004
//      Data de Término :  10/03/2004
//
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes;

type TCtrlBack = class(TCMControlObject)

     private
     protected
     public
       function LookupCarteiraDaiea : OLEVariant;

     published

end;

implementation

{ TCtrlBack }

function TCtrlBack.LookupCarteiraDaiea: OLEVariant;
var
  sSql : string;

begin
 {O código do segmento para o Imobiliário/Daiea será sempre = 3}
  sSql := 'SELECT IDCARTEIRASPC, DESCARTEIRASPC' +#13+
          '  FROM CARTEIRASPC'              +#13+
          ' WHERE CODSEGMENTO = 3'            +#13+
          ' ORDER BY DESCARTEIRASPC';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;

end.
