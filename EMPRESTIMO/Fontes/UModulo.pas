unit UModulo;

interface


type

   TModulo = Class
   private

   public

      // grupo de regras usado pelo Empréstimo
      iGrupoRegra       : Int64;

      // Plano de Contas, Programa e Centro de Custo
      iPrograma         : Int64;
      iPlano            : Int64;
      sCentroCusto      : String;

      // máscaras dos Tipos de Recebimento / Desembolso
      sMascaraReceb     : string;
      sMascaraDesemb    : string;

      // uso de Centro de Responsabilidade e Unidade de Negócios + seus valores padrão
      bUsaCentRespon    : boolean;
      bUsaUnidNegoc     : boolean;

      sCentroRespon     : string;
      iUnidNegoc        : Int64;

      // Moeda corrente dos sistemas
      iMoedaCorrente    : integer;
      sMoedaCorrente    : string;

      // Tipos de Documento (TipoDocRecPag) a serem usados para integração
      iTipoDocRec       : Int64;
      iTipoDocRecDevol  : Int64;
      iTipoDocPag       : Int64;

      // País, cidade, estado
      iPais             : Int64;
      sEstado           : String;
      iCidade           : Int64;

      // Amortização e Renovação
      iPermiteRenovacao   : Integer;
      iPermiteAmortizacao : Integer;
      iFlgAgrupaParc      : Integer;

   end;



var
   Modulo : TModulo;



implementation



end.



