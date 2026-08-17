unit UVersao;

interface

type

   TVersao = Class(TObject)
   Public
      function CodigoVersao:String;

end;

var

   Versao : TVersao;

implementation

function TVersao.CodigoVersao:String;
begin
   // Obs.: Antes de trocar o código, Fazer um ZIP DO DIRETÓRIO DE PRODUÇÃO
   //      com o nome da versão anterior. Ex.: Invest_20512.ZIP
   // Copiar para o Diretório Desenv0045/Publico/Investimentos_Versao

   Result := '1.00.03';                        // Data Versão : 22/11/2001

{  Melhorias :

  (Marcelo)

  (Ricardo)

  (Turon)

  (Fabio)
}
end;


end.
