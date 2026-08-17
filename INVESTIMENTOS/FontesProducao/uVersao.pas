unit UVersao;

interface
 
Type
   TVersao = Class(TObject)

   function CodigoVersao : String;

end;

var
   Versao : TVersao;

implementation

function TVersao.CodigoVersao : String;
begin
   // Obs.: Antes de trocar o código, Fazer um ZIP DO DIRETÓRIO DE PRODUÇÃO
   // com o nome da versão anterior. Ex.: Invest_v20512_11032001.ZIP
   // Copiar para o Diretório A02006634/CMSolucoes/Investimento/Backup-Versao

  Result := '3.01.87';//                       // Data Versão : 18/06/2004

{  Melhorias :



}

end;

end.
