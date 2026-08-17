{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

      OBJETO DE CONTROLE DE FUNÇÕES COMUNS SEM ACESSO AO BANCO  ( MT )

      Módulo          :  ComunsImobiliario
      Autor           :  Vinícius Meyer Lana
      Data de Início  :  01/07/2002
      Data de Término :

  FUNÇÕES PUBLICADAS:

      Arredonda     - Função para Arredondamento de casas decimais
      BuscaCorLinha - Gera um Nr. Integer representando a cor de linha para o Relatório
      MensErroMT    - Exibe o Erro retornado pelo CtrlObject
      Space         - Cria uma string com n caracteres de espaços
      StrTran       - Substitui caracteres em uma String
      Competencia   - Retorna a competência por extenso
      OrigemLanc    - Retorna a Origem de um lançamento dentro do imobiliário
      ErroIntegra   - Retorna a Descrição de um erro de integração
      ProRata       - Calculo ProRata de uma Taxa Mensal para um determinado período
      ConvPlanoEconomico - Converte um valor pelos planos econônicos Itamar e FHC

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: CalculaRateio
Nº SOL......: 181200/10722
Nº KINTANA..: 1745291
Data........: 05/12/2012
Responsável.: Marcio Sanches Spinosa
Descrição...: Criação da regra para sempre manter o valor arrendondado para
baixo.
--------------------------------------------------------------------------------
Rotina ......:
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add :-87 Erro ao Lançar Acréscimo de Valor para Correção Monetária.
--------------------------------------------------------------------------------
Pendência   : 24872
Responsável : Daniel Simões
Data        : 16/08/2007
Descrição   : Mudança na Origem do Lançamento de 'Lançamento Individual' para
              'Lançamentos em Lote' ( L ) ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit UComunsImobiliario;

interface

uses
  SysUtils, controls, uMensErro, Dialogs, Graphics, Math, uDiasUteis, uSistema,
  dbTables;

type TParamSistema = Record
  idEmpresa     : Integer;
  idModulo      : Integer;
  idUsuario     : Integer;
  idEspAcesso   : Integer;
  idPlanoPrev   : Integer;
  idPatro       : Integer;
  UsaPlanoPatro : Boolean;
end;

type
   // Classe de controle global do Imobiliário
   TComunsImobiliario = class
   private

   public
      procedure MensErroMT   (sMessageInfo: string);
      procedure BuscaCorLinha(var iPos: Integer; var Cor: TColor);
      function  Space        (const iQtde:Integer) : String;
      function  StrTran      (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
      function  AscanInt     (const Vetor: array of integer; const iBusca:Integer) : Boolean;
      function  Arredonda    (const fValor: extended; const iDecimais: word; const pTruncar : Boolean = False): extended;//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291
      function  ArredondaParaBaixo(value: double;casas : integer): double;//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 
      function  Competencia  (const iMes,iAno: Integer) : String; overload;
      function  Competencia  (const iMes,iAno: Double) : String;  overload;
      function  SiglaMes     (const iMes: Integer) : String;
      function  OrigemLanc   (const iIdModulo: Integer; const sTipo: String): String;
      function  ErroIntegra  (const iCodErro: Integer): String;
      function  ProRata      (const fTaxaMes:Extended; const dIni,dFim:TDateTime; const iMesesTaxa:Integer = 1): extended;
      function  Inteiro      (const Value: Extended): Integer;
      function  ConvPlanoEconomico(const dDataLanc: TDateTime; const fValor:Extended): Extended;

      function RetornaSegregacaoOrigem(iIdImovel: Integer; var qryRegistros: TQuery): Integer;
      function TrocaVirgPPto(Valor: string): String;
      function ConvNumSegregacao(nValor: Extended): Extended;

   end;

var
  ComunsImobiliario: TComunsImobiliario;

//--------------------------------------------------------------------------------------------------


implementation

{ TComunsImobiliario }

//========================================================================================
// Função para Gerar um Nr. Integer Ref. a cor selecionada para a linha do relatorio
// Data : 16/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iPos : Nr. Integer da Cor ( qdo igual a 0, retorna o Nr. da cor referente )
//       Cor  : Cor selecionada ( qdo iPos <> 0, retorna o Nr. Hexa da cor de iPos )
//
//----------------------------------------------------------------------------------------
procedure TComunsImobiliario.BuscaCorLinha(var iPos: Integer;  var Cor: TColor);
begin
  if iPos > 0 then begin
    case iPos of
      1 : Cor := $00FFFFFF;  // Branco
      2 : Cor := $00C0FFFF;  // Amarelo bebe
      3 : Cor := $00C6F9CC;  // Verde
      4 : Cor := $00F3E6CD;  // Azul
      5 : Cor := $00A0A0A0;  // Cinza 1
      6 : Cor := $00BEBEBE;  // Cinza 2
      7 : Cor := $00D2D2D2;  // Cinza 3
      8 : Cor := $00E3E3E3;  // Cinza 4
    end;
  end else begin
    case Cor of
      $00FFFFFF : iPos := 1;  // Branco
      $00C0FFFF : iPos := 2;  // Amarelo bebe
      $00C6F9CC : iPos := 3;  // Verde
      $00F3E6CD : iPos := 4;  // Azul
      $00A0A0A0 : iPos := 5;  // Cinza 1
      $00BEBEBE : iPos := 6;  // Cinza 2
      $00D2D2D2 : iPos := 7;  // Cinza 3
      $00E3E3E3 : iPos := 8;  // Cinza 4
    end;
  end;
end;


//========================================================================================
// Função para Exibir a mensagem de erros retornada pelo Application Server
// Data : 05/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sMessageInfo : Mensagem vinda do Application Server
//
//----------------------------------------------------------------------------------------
procedure TComunsImobiliario.MensErroMT(sMessageInfo: string);
begin
  MsgDlg(sMessageInfo, 'Aviso', mtWarning, [mbOk], 0);
end;


//========================================================================================
// Função para gerar uma String com n caracteres de espaços ( idem Clipper )
// Data : 05/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iQtde : Quantidade de espaços a ser gerado
//
// Retorno : String de espaços
//----------------------------------------------------------------------------------------
function TComunsImobiliario.Space(const iQtde: Integer): String;
var i:Integer;
begin
  Result := '';
  if iQtde > 0 then
    for i := 1 to iQtde do Result := Result + ' ';
end;



//========================================================================================
// Função para Substituir caracteres em uma String ( idem Clipper )
// Data : 28/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sValor    : String original a ser pesquisada
//       sBusca    : String que será localizada
//       sTroca    : String pela qual será trocada ( nulo, só exclui o caracter de busca )
//       bPrimeira : True - Substitui apenas a primeira ocorrência
//
// Retorno : String alterada
//----------------------------------------------------------------------------------------
function TComunsImobiliario.StrTran(sValor,sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
var iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Exit;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;


//========================================================================================
// Função para Arredondar valores
// Data : 08/08/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       fValor    : Número a ser arredondado
//       iDecimais : Quantidade de casas decimais
//
// Retorno : String alterada
//----------------------------------------------------------------------------------------
function TComunsImobiliario.Arredonda(const fValor: extended;
                                      const iDecimais: word;
                                      const pTruncar : Boolean = False): extended; //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291
begin
   try
      if not (pTruncar) then
       Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais)
      else
       Result := Trunc(fValor * 100) / 100;
   except
      Result := fValor;
   end;
end;



//========================================================================================
// Função que retorna o Mês e Ano de competencia por extenso
// Data : 08/08/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iMes    : Número do Mês
//       iAno    : Número do Ano
//
// Retorno : String com a competência por extenso
//----------------------------------------------------------------------------------------
function TComunsImobiliario.Competencia(const iMes, iAno: Integer): String;
begin
  // Define competencia por extenso
  case iMes of
    1  : Result := 'Janeiro';
    2  : Result := 'Fevereiro';
    3  : Result := 'Março';
    4  : Result := 'Abril';
    5  : Result := 'Maio';
    6  : Result := 'Junho';
    7  : Result := 'Julho';
    8  : Result := 'Agosto';
    9  : Result := 'Setembro';
    10 : Result := 'Outubro';
    11 : Result := 'Novembro';
    12 : Result := 'Dezembro';
  end;
  Result := Result + ' / ' + FormatFloat('0000',iAno);
end;

// mesma função, mas com parametros diferentes
function TComunsImobiliario.Competencia(const iMes, iAno: Double): String;
var i : Integer;
begin
  // Define competencia por extenso
  i := StrToInt(FloatToStr(iMes));
  case i of
    1  : Result := 'Janeiro';
    2  : Result := 'Fevereiro';
    3  : Result := 'Março';
    4  : Result := 'Abril';
    5  : Result := 'Maio';
    6  : Result := 'Junho';
    7  : Result := 'Julho';
    8  : Result := 'Agosto';
    9  : Result := 'Setembro';
    10 : Result := 'Outubro';
    11 : Result := 'Novembro';
    12 : Result := 'Dezembro';
  end;
  Result := Result + ' / ' + FormatFloat('0000',iAno);
end;




//========================================================================================
// Função que retorna a Sigla do Mes
// Data : 25/10/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iMes : Número do mês
//
// Retorno : Sigla
//----------------------------------------------------------------------------------------
function TComunsImobiliario.SiglaMes(const iMes: Integer): String;
var iMesReal : Integer;
begin
  iMesReal := iMes;
  if iMesReal > 12 then iMesReal := (iMesReal - 12);
  // Define competencia por extenso
  case iMesReal of
    1  : Result := 'JAN';
    2  : Result := 'FEV';
    3  : Result := 'MAR';
    4  : Result := 'ABR';
    5  : Result := 'MAI';
    6  : Result := 'JUN';
    7  : Result := 'JUL';
    8  : Result := 'AGO';
    9  : Result := 'SET';
    10 : Result := 'OUT';
    11 : Result := 'NOV';
    12 : Result := 'DEZ';
  end;
end;


//========================================================================================
// Função para Calcular um indice Pro Rata entre duas datas
// Data : 28/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       fTaxaMes : Taxa mensal a ser pro rateada
//       dIni     : Data inicial
//       dFim     : Data final
//
// Retorno : Taxa do periodo informado
//----------------------------------------------------------------------------------------
function TComunsImobiliario.ProRata(const fTaxaMes: Extended; const dIni,dFim: TDateTime; const iMesesTaxa:Integer): extended;
var iNumDias,iMeses :Integer;
    fTaxaPer :Extended;
    iDia1,iDia2 : word;
begin
  // Verifica Juros Pró-Rata ( Composto )
  fTaxaPer := 0;
  iNumDias := DiasUteis.IntervaloDias(dIni, dFim);
  iDia1    := DiasUteis.ExtraiDia(dIni);
  iDia2    := DiasUteis.ExtraiDia(dFim);
  iMeses   := DiasUteis.IntervaloMeses(dIni,dFim);

  if (iDia1 = iDia2) and (iMeses = 1) then begin
    iNumDias := 30;
  end;

  if iNumDias > 0 then begin
    fTaxaPer := Power((1 + fTaxaMes), (1/(30 * iMesesTaxa)) )  - 1;   // Taxa Dia
    //BRUNO AZEVEDO SOL 136335
    //fTaxaPer := Power((1 + fTaxaPer),iNumDias) - 1;                   // Taxa Período
    fTaxaPer := Power((1+fTaxaPer),(iMeses*30))-1;
    //BRUNO AZEVEDO SOL 136335
  end;
  Result := fTaxaPer;
end;


function TComunsImobiliario.AscanInt(const Vetor: array of integer;
                                     const iBusca: Integer): Boolean;
var i : Integer;
begin
   Result := False;
   if Length(Vetor) > 0 then begin
      for i := 1 to Length(Vetor) do begin
         if iBusca = Vetor[i] then begin
            Result := True;
            Exit;
         end;
      end;
   end;
end;


//========================================================================================
// Função para Retornar a origem de um lançamento dentro do imobiliario
// Data : 28/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdModulo : Módulo de Origem
//       sTipo     : Tipo de Lançamento
//
// Retorno : Descrição da Origem do Lançamento
//----------------------------------------------------------------------------------------
function TComunsImobiliario.OrigemLanc(const iIdModulo: Integer; const sTipo: String): String;
begin
  Result := '';
  if iIdModulo = 64 then begin   // adminimob
    case sTipo[1] of
      'A' : Result := 'Acréscimo de Valor';
      'C' : Result := 'Aquisição à Vista';
      'D' : Result := 'Lançamento de Dívidas';
      'E' : Result := 'Lançamento de Reembolso';
      'F' : Result := 'Folha de Aluguéis';
      'G' : Result := 'Acerto de Divergências';
      'I' : Result := 'Importação';
      'L' : Result := 'Lançamento em Lote'; 
      'M' : Result := 'Lançamento Múltiplo';
      'O' : Result := 'Obras';
      'P' : Result := 'Prestação de Contas';
      'R' : Result := 'Folha de Remunerações';
      'S' : Result := 'Alienação à Vista';
      'T' : Result := 'Lançamento com Rateio';
      'V' : Result := 'Lançamento de Previsão';
    end;
  end;
end;



//========================================================================================
// Função para Retornar a descrição de um erro de integração contábil / financeira
// Data : 06/01/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCodErro : Código do Erro
//
// Retorno : Descrição do erro
//----------------------------------------------------------------------------------------
function TComunsImobiliario.ErroIntegra(const iCodErro: Integer): String;
begin
   Result := '';
   case iCodErro of
      // uCtrlLancamentoImovel.DefineParamContabeis
      -1: Result := 'Erro -1 = Conta contábil de débito não informada';
      -2: Result := 'Erro -2 = Sub conta contábil de débito obrigatória mas não informada';
      -3: Result := 'Erro -3 = Centro de Custos da conta de débito obrigatório mas não informado';
      -4: Result := 'Erro -4 = Conta contábil de crédito não informada';
      -5: Result := 'Erro -5 = Sub conta contábil de crédito obrigatória mas não informada';
      -6: Result := 'Erro -6 = Centro de Custos da conta crédito obrigatório mas não informado';
      -7: Result := 'Erro -7 = Ambiguidade de parametrização';
      -8: Result := 'Erro -8 = Nenhuma parametrização atende o lançamento';
      -9: Result := 'Erro -9 = Tipo de Recebimento / Desembolso Inativo';
      -10:Result := 'Erro -10 = Ambiguidade de parametrização do segundo lançamento contábil';
      -11:Result := 'Erro -11 = Nenhuma parametrização atende ao segundo lançamento contábil';

      // VerificaCondicoes
      -12: Result := 'Erro -12 = Código de tipo de desembolso não informado';
      -13: Result := 'Erro -13 = Código de tipo de recebimento não informado';
      -14: Result := 'Erro -14 = Unidade de negócio não informado';
      -15: Result := 'Erro -15 = Código de centro de responsabilidade não informado';
      -16: Result := 'Erro -16 = Número de documento inválido';
      -18: Result := 'Erro -18 = Tipo código não informado';
      -19: Result := 'Erro -19 = Centro de Custo inativo para conta contábil';      

      // uCtrlLancamentoImovel.FazerLancamentoContab
      -20: Result := 'Erro -20 = Data não pertence a nehum período';
      -21: Result := 'Erro -21 = Data pertence a mais de um período';
      -22: Result := 'Erro -22 = Período bloqueado na contabilidade';
      -23: Result := 'Erro -23 = Período já integrado. Lançamentos bloqueados';
      -24: Result := 'Erro -24 = Erro genérico funcao Testa Periodo';
      -25: Result := 'Erro -25 = Erro genérico funcao Fazer Lançamento Contabilidade';
      -26: Result := 'Erro -26 = Erro genérico função Fazer Lançamento Contabilidade';
      -27: Result := 'Erro -27 = Erro genérico função Fazer Lançamento Contabilidade';

      // Integração CAPCAR
      -30: Result := 'Erro -30 = Existem documentos com o mesmo número e parametização diferentes';
      -31: Result := 'Erro -31 = Não conseguiu criar o documento e o lançamento';
      -32: Result := 'Erro -32 = Não conseguiu criar o rateio do documento';
      -33: Result := 'Erro -33 = Erro ao atualizar "Número do Imóvel" ao lançar rateio de documento';
      -34: Result := 'Erro -34 = Erro genérico na integração do contas à pagar/receber';

      // Funçao SetMensagem
      -37: Result := 'Erro -37 = Erro genérico na função de Mensagem do Boleto';
      -38: Result := 'Erro -38 = Erro genérico na função de Mensagem do Boleto';

      // Integra
      -40: Result := 'Erro -40 = Erro ao atualizar Lançamentos Imovel';

      // Contabilizar ou Financeiro
      -50: Result := 'Erro -50 = É necessário que os parâmetros sejam marcados para Integração na Contabilidadeo ou no Contas a pagar/receber.';
      // Helen - SOL: 127213 KTN: 672023
      -51: Result := 'Erro -51 = Existem Documentos com Vencimento maior que o mês Atual';

      // Responsável pela Cobrança
      -55: Result := 'Erro -55 = A tabela de parâmetros do sistema está vazia.';
      -56: Result := 'Erro -56 = Despesas sob responsabilidade do Locatário.';
      -57: Result := 'Erro -57 = Verificar Parâmetro do Sistema '+#13+''' Despesas de responsabilidade do Locatário .''';

      // Integração com o Orçamento
      -60: Result := 'Erro -60 = Usuário corrente sem alçada para criar o Compromisso';
      -61: Result := 'Erro -61 = Existem Compromissos entre as Reservas passadas como parâmetro';
      -62: Result := 'Erro -62 = Existem Reservas Canceladas ou Efetivadas entre as Reservas passadas como parâmetro';
      -63: Result := 'Erro -63 = Existem Reservas com Contas Orçamentárias diferentes entre as Reservas passadas como parâmetro';
      -64: Result := 'Erro -64 = Houve um erro inesperado no Banco de Dados';
      -65: Result := 'Erro -65 = Novo erro não identificado na função CriaCompromisso';

      -66: Result := 'Erro -66 = Usuário corrente sem alçada para a Efetivação';
      -67: Result := 'Erro -67 = O número enviado é de uma Reserva Orçamentária, não de um Compromisso';
      -68: Result := 'Erro -68 = O número enviado é de um Compromisso já Cancelado';
      -69: Result := 'Erro -69 = O número enviado é de um Compromisso já Efetivado';
      -70: Result := 'Erro -70 = Houve um erro inesperado no Banco de Dados';
      -71: Result := 'Erro -71 = O valor passado como parâmetro é maior que o valor do compromisso';
      -72: Result := 'Erro -72 = Novo erro não identificado na função EfetivaCompromisso';

      -75: Result := 'Erro -75 = Algum erro genérico na integração com o Orçamento';

      // geração do reembolso automático
      -80: Result := 'Erro -80 = Falta parametrização do lançamento de receita referente ao reembolso automático.';
      -81: Result := 'Erro -81 = Erro genério na criação do reembolso.';

      // integração dos alteradores
      -85: Result := 'Erro -85 = Não consegui integrar o(s) alterador(es).';
      -86: Result := 'Erro -86 = Ambiguidade de Parametrização de Contas de Baixa dos Alteradores.';
      // Helen - SOL: 127213 KTN: 672023
      -87: Result := 'Erro -87 = Erro ao Lançar Acréscimo de Valor para Correção Monetária. Verifique fechamento do CAF. ';

      // Obriga liberação
      -90: Result := 'Erro -90 = Receita de imóvel que nunca foi locado.';
      -91: Result := 'Erro -91 = Despesa de imóvel inativo.';
      -92: Result := 'Erro -92 = Registro contábil fora da competência gerencial.';

   else
      if iCodErro < 0 then Result := 'Erro: '+inttostr(iCodErro)+' - não tratado';
   end;
end;


//========================================================================================
// Função para Retornar um valor convertido pelos Planos Itamar e FHC
// Data : 07/04/2005                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       dDataLanc : Data do lançamento
//       fValor    : Valor a ser convertido
//
// Retorno : Valor convertido
//----------------------------------------------------------------------------------------
function TComunsImobiliario.ConvPlanoEconomico(const dDataLanc: TDateTime;
                                               const fValor: Extended): Extended;
begin
   Result := fValor;
   // Corrige Plano Itamar - Divide por 1.000
   if dDataLanc < StrToDate('31/07/1993') then begin
      Result := Result / 1000;
   end;
   // Corrige Plano FHC I - Divide por 2.750
   if dDataLanc < StrToDate('30/06/1994') then begin
      Result := Result / 2750;
   end;
end;

function TComunsImobiliario.Inteiro(Const Value: extended): integer;
var
  s : string;
  i : integer;
begin
  s := FloatToStr( Value );
  i := Pos( '.', s );
  if i > 0 then
    s := Copy( s, 1, i - 1 );
  Result := StrToInt( s )
end;

function TComunsImobiliario.RetornaSegregacaoOrigem(iIdImovel: Integer;
  var qryRegistros: TQuery): Integer;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPATRO,          ' + #10#13 +
          '       IDPLANOPREV,      ' + #10#13 +
          '       PPIPERCENTRATEIO, ' + #10#13 +
          '       FLGTIPO           ' + #10#13 +
          '  FROM PLANOPATROXIMOVEL ' + #10#13 +
          ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);

  qryRegistros.SQL.Clear;
  qryRegistros.DatabaseName := 'BaseDados';
  qryRegistros.SQL.Add(sSql);
  qryRegistros.Open;

  Result := qryRegistros.RecordCount;
end;

//-----------------------------------------------------------------------
//  Responsavel :Emerson
// Data : 25.11.2008
//  Descricao   : Retira a virgula de um texto e troca por um ponto decimal
//
function TComunsImobiliario.TrocaVirgPPto(Valor: string): String;
//
// Troca a virgula pelo ponto em um valor Float
//
var i:integer;
begin
if Valor <> ' ' then
   begin
   for i := 0 to Length(Valor) do
       begin
        try
           if Valor[i] = '.' then
           begin
              Valor[i]:=',';
           end
           else if Valor[i] = ',' then
           begin
                   Valor[i]:='.';
            end;
        except
        end;

        end;

   end;
   Result := valor;
end;
//---------------------------------Fim---------------------//


function TComunsImobiliario.ConvNumSegregacao(nValor: Extended): Extended;
begin
  Result := StrToFloat(Format('%20.2f',[nValor]));
end;

//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
function TComunsImobiliario.ArredondaParaBaixo(value: double;
  casas: integer): double;
Var
   fracao, Total : real;
   i : integer;
   decimal : string;
begin
   try
       fracao := Frac(value); //Retorna a parte fracionária de um número
       i := Pos(',', FloatToStr(fracao));
       decimal:= (Copy(floattostr(fracao), i + 1, length(floattostr(fracao)))); //decimal recebe a parte decimal
       //Enquanto o tamanho da variavel decimal for maior que o número de casas faça
      while length(decimal) > casas do
      begin
        //Verifica se o último digito da variável decimal é maior que 5
        if strtoint(Copy(decimal,Length(Decimal) - 1, 1))> 9 then
        begin
            //Descarta o último digito da variável Decimal
            decimal:=Copy(decimal, 0 , length(decimal) - 1);
            //Soma o valor número da variavel decimal + 1
            decimal:= floattostr(strtofloat(decimal) + 1);
        end
        else
            decimal:=Copy(decimal,0, length(decimal)-1); //Descarta o último digito da variável Decimal
      end;
     result:=(int(value) + (strtofloat(decimal)/100)); //devolve o resultado para a função
   except
         Raise Exception.Create('Erro no arredondamento');
   end;
end;
//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

end.
