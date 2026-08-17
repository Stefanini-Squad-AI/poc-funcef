//Rotina..........: ExecutarII, CalculaFatorDepreciacao
//Solicitação.....: WO 17991
//Data............: 15/01/2025
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Adequação da determinação do Fator de Depereciação e atribuição
//                  do valor de depreciação mês para depreciações pró-rata.
//------------------------------------------------------------------------------------------------
{Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467
Rotina......: Executar
Nº SOL......: 162907
Nº KINTANA..: 1387467
Data........: 16/11/2012
Responsável.: Marcio Sanches Spinosa
Descrição...: Verificação no distrato Contratual
--------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 172333
Nº KINTANA..: 1549630
Data........: 01/03/2013
Responsável.: Helen V. Bianchi
Descrição...: Add depreciação apenas para Imoveis adquirido fora do Ano vigente
-------------------------------------------------------------------------------
Helen SOL Nº 153958 Kintana Nº 1167601
Rotina......: Estornar
Nº SOL......: 153958
Nº KINTANA..: 1167601
Data........: 20/06/2011
Responsável.: Helen V. Bianchi
Descrição...: Add depreciação do Decrescimo
--------------------------------------------------------------------------------
Rotina......: --------
Nº SOL......: 151877
Nº KINTANA..: 1120282
Data........: 06/06/2011
Responsável.: Felipe de Oliveira
Descrição...: fazer com que implementações do caf não influenciem no imobiliário.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 152857
Nº KINTANA..: 1148170
Data........: 18/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Mudança na rotina do prorata, que estava fazendo o calculo errado
--------------------------------------------------------------------------------
Rotina......: Executar
Nº SOL......: 150414
Nº KINTANA..: 1092527
Data........: 10/01/2011
Responsável.: Helen V. Bianchi
Descrição...: Add depreciação do Decrescimo positivo
--------------------------------------------------------------------------------
Rotina......: Executar
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer a depreciação de Decrescimo
--------------------------------------------------------------------------------
Rotina......: Executar
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 31/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Valor Residual
-------------------------------------------------------------------------------}
unit uCtrlFechamentoProRata;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP,      
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes, Math, uCMMath,
     dMTBem, dMTFechamento,
     uDBBem, uDBBemxMoeda, uDBBemxDep,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uDBGrupoContab,
     uCtrlBem, uCtrlParamCAF, uCtrlConjunto, uCtrlGrupoContab,
     uCtrlHistMovBem, uCtrlCAFxContab, uDiasUteis;

Type
   TCtrlFechamentoProRata = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbBem               : TDBBem;
      _dbBemxMoeda         : TDBBemxMoeda;
      _dbBemxDep           : TDBBemxDep;
      _dbReavaliacao       : TDBReavaliacao;
      _dbReavalxMoeda      : TDBReavalxMoeda;
      _dbReavalxDep        : TDBReavalxDep;
      _dbAcrescimoValor    : TDBAcrescimoValor;
      _dbAcrescValorxMoeda : TDBAcrescValorxMoeda;
      _dbAcrescValorxDep   : TDBAcrescValorxDep;

      _dMTBem              : tdtmMTBem;
      _dMTFechamento       : tdtmMTFechamento;

      Bem         : TCtrlBem;
      ParamCAF    : TCtrlParamCAF;
      Conjunto    : TCtrlConjunto;
      GrupoContab : TCtrlGrupoContab;
      HistMovBem  : TCtrlHistMovBem;
      DiasUteis   : TDiasUteis;
      CAFxContab  : TCtrlCAFxContab;

      FcdsBem,
      FcdsBemxMoeda,
      FcdsBemxDep,
      FcdsReavaliacao,
      FcdsReavalxMoeda,
      FcdsReavalxDep,
      FcdsAcrescimoValor,
      FcdsAcrescValorxMoeda,
      FcdsAcrescValorxDep    : TClientDataSet;
      FcdsCAFMoedas: TClientDataSet;
      FcdsProjSaldo: TClientDataSet;
      FcdsGrupoTaxaDep: TClientDataSet;
      FcdsBemxDep9: TClientDataSet;
      FcdsBemxMoeda9: TClientDataSet;

      iExercicio,
      iPeriodo             : Integer;

      bHeranca,
      bIntegraContab       : Boolean;
      //----------------------------------------------------------------------------------
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsCAFMoedas(const Value: TClientDataSet);
      procedure SetcdsProjSaldo(const Value: TClientDataSet);
      procedure SetcdsGrupoTaxaDep(const Value: TClientDataSet);
      procedure SetcdsBemxDep9(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda9(const Value: TClientDataSet);
      //----------------------------------------------------------------------------------
      // Funções Privativas
      //----------------------------------------------------------------------------------
//      function CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : TDateTime) : Extended;
      function CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : TDateTime; const pIsDistratoContratual : Boolean = False) : Extended;// Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467
      function CalculaFatorDepreciacao(dDataMov, dDataAnt, dDataIni : TDateTime; iIDModulo: Extended; dDataUltMov: TDateTime = -1) : Extended;
      function VerificaDataEstorno(nEmpresaProp, nBem : Extended; dDataMov : TDateTime) : Boolean;
      function IniciarCdsLancProRata : OleVariant;
      function GeraCAFMoedasProp : Boolean;
      function CMTranslate(sIgor : String) : String;
      function ConvNum(nNum : Extended) : Extended;
      procedure IniciarsqlProjSaldo(iAnoIni : Integer);

   Public
      aHistMovBem  : Array of Extended;
      iaHistMovBem : Integer;
      //----------------------------------------------------------------------------------
      FcdsLancProRata : TClientDataSet;
      procedure SetcdsLancProRata(const Value: TClientDataSet);
      //----------------------------------------------------------------------------------
      property cdsBem               : TClientDataSet read FcdsBem               write SetcdsBem;
      property cdsBemxMoeda         : TClientDataSet read FcdsBemxMoeda         write SetcdsBemxMoeda;
      property cdsBemxDep           : TClientDataSet read FcdsBemxDep           write SetcdsBemxDep;
      property cdsReavaliacao       : TClientDataSet read FcdsReavaliacao       write SetcdsReavaliacao;
      property cdsReavalxMoeda      : TClientDataSet read FcdsReavalxMoeda      write SetcdsReavalxMoeda;
      property cdsReavalxDep        : TClientDataSet read FcdsReavalxDep        write SetcdsReavalxDep;
      property cdsAcrescimoValor    : TClientDataSet read FcdsAcrescimoValor    write SetcdsAcrescimoValor;
      property cdsAcrescValorxMoeda : TClientDataSet read FcdsAcrescValorxMoeda write SetcdsAcrescValorxMoeda;
      property cdsAcrescValorxDep   : TClientDataSet read FcdsAcrescValorxDep   write SetcdsAcrescValorxDep;
      property cdsLancProRata       : TClientDataSet read FcdsLancProRata       write SetcdsLancProRata;
      property cdsCAFMoedas         : TClientDataSet read FcdsCAFMoedas         write SetcdsCAFMoedas;
      property cdsProjSaldo         : TClientDataSet read FcdsProjSaldo         write SetcdsProjSaldo;
      property cdsGrupoTaxaDep      : TClientDataSet read FcdsGrupoTaxaDep      write SetcdsGrupoTaxaDep;
      property cdsBemxMoeda9        : TClientDataSet read FcdsBemxMoeda9        write SetcdsBemxMoeda9;
      property cdsBemxDep9          : TClientDataSet read FcdsBemxDep9          write SetcdsBemxDep9;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create(CAFxContab : TCtrlCAFxContab);  Reintroduce;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Funções Públicas
      //----------------------------------------------------------------------------------
//      function Executar(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
//                        dDataMov : tDateTime; iTipDepProRata : Integer) : Boolean;
      function Executar(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                        dDataMov : tDateTime; iTipDepProRata : Integer;
                        Const pIsDistratoContratual : boolean = False) : Boolean;// Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467


      function Estornar(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                        dDataMov, dDataEst : tDateTime;
                        bEstornaContab : Boolean = True) : Boolean;

      //----------------------------------------------------------------------------------
      // Funções para o Remembramento
      //----------------------------------------------------------------------------------
      function ExecutarII(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                          dDataMov : tDateTime; iTipDepProRata : Integer) : Boolean;

      //----------------------------------------------------------------------------------
      // Funções para o Execução de Projeção Futura de Saldo Contabil
      //----------------------------------------------------------------------------------
      function ExecutarProjecaoBem(nModulo, nEmpresaProp, nBem,
                                   nMoeCodigo, nIdTaxaDep: Extended;
                                   dDataMov: TDateTime;
                                   Var nSomaValOrg, nSomaCmBem,
                                       nSomaDepLanc, nSomaCmDep : Currency) : Boolean;

      function ExecutarProjecaoGrupo(nModulo, nEmpresaProp,
                                     nMoeCodigo, nIdTaxaDep : Extended;
                                     dDataSld: TDateTime;
                                     iAnoIni, iAnos : Integer;
                                     nGrupo : Extended; sGrupo : String;
                                     iTipoGrupo : Integer): Boolean;

      //----------------------------------------------------------------------------------
      function CalcularDeprecBemGrupoDif(nModulo, nEmpresaProp, nBem, nGrupoDif,
                                         nMoeCodigo, nIdTaxaDep: Extended;
                                         dDataMov, dDataInicioDep: TDateTime): Extended;

      //----------------------------------------------------------------------------------
      function CalcularDeprecBemTaxaDif(nModulo, nEmpresaProp, nBem,
                                        nMoeCodigo, nIdTaxaDep: Extended;
                                        dDataMov, dDataInicioDep : TDateTime;
                                        nNovaTaxaDep : Extended;
                                        sTipoTab : String; nReavalAcresc : Extended): Extended;
   end;

implementation

{ TCtrlFechamentoProRata }

constructor TCtrlFechamentoProRata.Create(CAFxContab : TCtrlCAFxContab);
begin
   inherited Create;
   _dbBem                := TDBBem.Create(Self);
   _dbBemxMoeda          := TDBBemxMoeda.Create(Self);
   _dbBemxDep            := TDBBemxDep.Create(Self);
   _dbReavaliacao        := TDBReavaliacao.Create(Self);
   _dbReavalxMoeda       := TDBReavalxMoeda.Create(Self);
   _dbReavalxDep         := TDBReavalxDep.Create(Self);
   _dbAcrescimoValor     := TDBAcrescimoValor.Create(Self);
   _dbAcrescValorxMoeda  := TDBAcrescValorxMoeda.Create(Self);
   _dbAcrescValorxDep    := TDBAcrescValorxDep.Create(Self);

   _dMTBem               := tdtmMTBem.Create(Self);
   _dMTFechamento        := tdtmMTFechamento.Create(Self);

   FcdsBem               := TClientDataSet.Create(nil);
   FcdsBemxMoeda         := TClientDataSet.Create(nil);
   FcdsBemxDep           := TClientDataSet.Create(nil);
   FcdsReavaliacao       := TClientDataSet.Create(nil);
   FcdsReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsReavalxDep        := TClientDataSet.Create(nil);
   FcdsAcrescimoValor    := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep   := TClientDataSet.Create(nil);
   FcdsLancProRata       := TClientDataSet.Create(nil);
   FcdsCAFMoedas         := TClientDataSet.Create(nil);
   FcdsProjSaldo         := TClientDataSet.Create(nil);
   FcdsGrupoTaxaDep      := TClientDataSet.Create(nil);
   FcdsBemxMoeda9        := TClientDataSet.Create(nil);
   FcdsBemxDep9          := TClientDataSet.Create(nil);

   Bem                   := TCtrlBem.Create;
   ParamCAF              := TCtrlParamCAF.Create;
   Conjunto              := TCtrlConjunto.Create;
   HistMovBem            := TCtrlHistMovBem.Create;
   //-------------------------------------------------------------------------------------
   // CAFxContab já criada na classe superior
   //-------------------------------------------------------------------------------------
   bHeranca := CAFxContab <> nil;
   if bHeranca then
      Self.CAFxContab := CAFxContab
   else
      Self.CAFxContab := TCtrlCAFxContab.Create;
   //-------------------------------------------------------------------------------------
   GrupoContab           := TCtrlGrupoContab.Create;
   DiasUteis             := TDiasUteis.Create;
end;

destructor TCtrlFechamentoProRata.Destroy;
begin
   FcdsBem.Free;
   FcdsBemxMoeda.Free;
   FcdsBemxDep.Free;
   FcdsReavaliacao.Free;
   FcdsReavalxMoeda.Free;
   FcdsReavalxDep.Free;
   FcdsAcrescimoValor.Free;
   FcdsAcrescValorxMoeda.Free;
   FcdsAcrescValorxDep.Free;
   FcdsLancProRata.Free;
   FcdsCAFMoedas.Free;
   FcdsProjSaldo.Free;
   FcdsGrupoTaxaDep.Free;
   FcdsBemxMoeda9.Free;
   FcdsBemxDep9.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbReavaliacao.Free;
   _dbReavalxMoeda.Free;
   _dbReavalxDep.Free;
   _dbAcrescimoValor.Free;
   _dbAcrescValorxMoeda.Free;
   _dbAcrescValorxDep.Free;

   _dMTBem.Free;
   _dMTFechamento.Free;

   Bem.Free;
   ParamCAF.Free;
   Conjunto.Free;
   HistMovBem.Free;

   if not bHeranca then
      CAFxContab.Free;

   GrupoContab.Free;
   DiasUteis.Free;
   inherited;
end;

procedure TCtrlFechamentoProRata.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CAFxContab.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
end;

procedure TCtrlFechamentoProRata.DoChangeDataBase;
begin
   inherited;
   _dbBem.DataBaseName := DataBaseName;
   _dbBemxMoeda.DataBaseName := DataBaseName;
   _dbBemxDep.DataBaseName := DataBaseName;
   _dbReavaliacao.DataBaseName := DataBaseName;
   _dbReavalxMoeda.DataBaseName := DataBaseName;
   _dbReavalxDep.DataBaseName := DataBaseName;
   _dbAcrescimoValor.DataBaseName := DataBaseName;
   _dbAcrescValorxMoeda.DataBaseName := DataBaseName;
   _dbAcrescValorxDep.DataBaseName := DataBaseName;
end;

procedure TCtrlFechamentoProRata.SetcdsBem(const Value: TClientDataSet);
begin
   FcdsBem := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsBemxDep(const Value: TClientDataSet);
begin
   FcdsBemxDep := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsReavaliacao(const Value: TClientDataSet);
begin
   FcdsReavaliacao := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
   FcdsReavalxMoeda := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsReavalxDep(const Value: TClientDataSet);
begin
   FcdsReavalxDep := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
   FcdsAcrescimoValor := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
   FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
   FcdsAcrescValorxDep := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsLancProRata(const Value: TClientDataSet);
begin
   FcdsLancProRata := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsCAFMoedas(const Value: TClientDataSet);
begin
  FcdsCAFMoedas := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsProjSaldo(const Value: TClientDataSet);
begin
  FcdsProjSaldo := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsGrupoTaxaDep(const Value: TClientDataSet);
begin
  FcdsGrupoTaxaDep := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsBemxDep9(const Value: TClientDataSet);
begin
  FcdsBemxDep9 := Value;
end;

procedure TCtrlFechamentoProRata.SetcdsBemxMoeda9(const Value: TClientDataSet);
begin
  FcdsBemxMoeda9 := Value;
end;

function TCtrlFechamentoProRata.ConvNum(nNum: Extended): Extended;
begin
   Result := strtofloat(Format('%20.5f',[nNum]));
end;

function TCtrlFechamentoProRata.GeraCAFMoedasProp: Boolean;
begin
   FcdsCAFMoedas.Data := GetDataPacket(' SELECT MOECODIGO, (2) AS NUMDECIMAIS, ' + #13 +
                                       '        (''S'') AS FLGARREDONDA ' + #13 +
                                       ' FROM CAFMOEDAS ');
   Result := True;
end;

function TCtrlFechamentoProRata.IniciarCdsLancProRata : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT (0)    AS IDREAVALACRESC,'+ #13 +
           '        (0)    AS MOECODIGO,     '+ #13 +
           '        (0)    AS IDTAXADEP,     '+ #13 +
           '        (0.00) AS VALCM,         '+ #13 +
           '        (0.00) AS VALDEP,        '+ #13 +
           '        (0.00) AS VALCMDEP       '+ #13 +
           ' FROM BEM '+ #13 +
           ' WHERE BEM.IDBEM = -1' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
//========================================================================================
// Função que executa o fechamento ProRata de um Bem
//----------------------------------------------------------------------------------------
function TCtrlFechamentoProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                         dDataMov : tDateTime;
                                         iTipDepProRata : Integer;
                                         Const pIsDistratoContratual : boolean = False) : Boolean;// Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467
var
   iHistMovBem,
   iFlgPai, iFlgDeprec,
   iFatorDec                          : Integer;
   dDataUltDep                        : TDateTime;
   nCmBem, nDepLanc, nCmDep,
   nValCmBem, nValDepLanc, nValCmDep  : Currency;
   nPlanilha,
   nFatorCM, nFatorDep, nTaxaDep,
   nSeqHist, nValMin                  : Extended;
   bCtaxCCusto,
   bCalcCM, bCalcDep, bCalcCmDep      : Boolean;
   iAno, iMes, iDia                   : Word;
   sFatorDec                          : String;
   //Helen - SOL Nº150414 KINTANA Nº 1092527
   bDecrescimo : Boolean; iTipoMovimentacao : Integer; sTipoTab :String;
   iAno_Dep, iMes_Dep, iDia_Dep,iAno_Atu, iMes_Atu, iDia_Atu  : Word; //Helen - SOL:172333 KTN: 1549630
begin
   //-------------------------------------------------------------------------------------
   // Caso o dia da movimentação seja 01, não calcular o pró-rata (CBS em 06/12/2001)
   //-------------------------------------------------------------------------------------
   if iTipDepProRata = 0 then
   begin
      DecodeDate((dDataMov + 1), iAno, iMes, iDia);
   end else
   begin
      DecodeDate(dDataMov, iAno, iMes, iDia);
   end;
   if iDia = 1 then
   begin
      Result := True;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   try
      FcdsLancProRata.Data := IniciarCdsLancProRata;
      //----------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
      GeraCAFMoedasProp;
      //----------------------------------------------------------------------------------
      // Alimenta as propriedades de integração contábil
      //----------------------------------------------------------------------------------
      bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), Trunc(nModulo));
      iaHistMovBem := -1;
      //----------------------------------------------------------------------------------
      // Verifica se a data da depreciação pró-rata pode ser usada para contabilização
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         if not CAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
                                                   iExercicio, iPeriodo) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query de montagem da Planilha Contábil
         //-------------------------------------------------------------------------------
         if not CAFxContab.InicializaMontaContab then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query com a Parametrização contábil
         //-------------------------------------------------------------------------------
         if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
            Raise Exception.Create(CAFxContab.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Calcula a depreciação dos três componentes do saldo contábil dos bens
      //----------------------------------------------------------------------------------
      // COMPONENTE BEM
      //----------------------------------------------------------------------------------
      // Prepara a tabela de custos para o calculo da correção monetária e depreciação
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      //----------------------------------------------------------------------------------
      // Processa os calculos por moeda
      //----------------------------------------------------------------------------------
      while not FcdsBemxMoeda.EOF do
      begin
         bCalcCM   := False;
         nCmBem    := 0;
         nCmDep    := 0;
         nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat;
         //-------------------------------------------------------------------------------
         // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
         // monetária estiver ativado, processar a correção monetária do custo
         //-------------------------------------------------------------------------------
         if (FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) //then
         // Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467 - Inicio
         or pIsDistratoContratual then
         begin
            //----------------------------------------------------------------------------
            // Calcula o fator de tempo da correção monetária para o BEM
            //----------------------------------------------------------------------------
            nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime, pIsDistratoContratual);
            //----------------------------------------------------------------------------
            // Calculo da CORRECAO MONETÁRIA DO CUSTO
            // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
            // custo no periodo para a Moeda Oficial
            //----------------------------------------------------------------------------
            if nFatorCM > 0 then
            begin
               //-------------------------------------------------------------------------
               // Calcula a Correção Monetária do Custo
               //-------------------------------------------------------------------------
               nCmBem := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + FcdsBemxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
               if abs(nCmBem) >= 0.01 then
                  nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
               //-------------------------------------------------------------------------
               // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
               // caso contrário, deixar para acumular na próxima depreciação.
               //-------------------------------------------------------------------------
               if abs(nCmBem) >= 0.01 then
               begin
                  nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,               // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,            // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,            // IDMODULO
                                                            15,                                                 // IDTIPOMOVIMENTACAO
                                                            dDataMov,                                           // DATAMOVIMENTACAO
                                                            -1,                                                 // IDREAVALACRESC
                                                            FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
                                                            -1,                                                 // IDGRUPANT
                                                            -1,                                                 // IDCONJANT
                                                            -1,                                                 // IDLOCALANT
                                                            -1,                                                 // IDRESPANT
                                                            -1,                                                 // PLACAANT
                                                            -1,                                                 // PLNCODIGO
                                                            '',                                                 // OBSREAVAL
                                                            iTipDepProRata,                                     // TIPDEPPRORATA
                                                            -1,                                                 // IDTIPODESPESA
                                                            '',                                                 // OBSACRESCIMO
                                                            -1,                                                 // IDMOTIVOBAIXA
                                                            0,                                                  // PROPBAIXA
                                                            0,                                                  // VALVENDAOFI
                                                            '');                                                // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,                                                
                                                          nCmBem) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o valor na tabela BemxMoeda
                  //----------------------------------------------------------------------
                  FcdsBemxMoeda.Edit;
                  FcdsBemxMoeda.FieldByName('CMBEM').AsFloat     := nValCmBem;
                  FcdsBemxMoeda.FieldByName('DATAULTCM').AsFloat := dDataMov;
                  FcdsBemxMoeda.Post;
                  //----------------------------------------------------------------------
                  // Registra a Correção Monetária do Custo na Contabilidade
                  //----------------------------------------------------------------------
                  if bIntegraContab then
                  begin
                     //-------------------------------------------------------------------
                     // Alimenta o DataSet que irá acumular a planilha contábil
                     // para a integração
                     //-------------------------------------------------------------------
                     if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                    FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                    FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                    FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                    FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                    FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                    FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                    FcdsBem.FieldByName('PLACA').AsString,
                                                                    FcdsBem.FieldByName('DESBEM').AsString,
                                                                    FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                    dDataMov,nCmBem,nCmDep,'B',
                                                                    iExercicio, iPeriodo) then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     // Capta o id da movimentacao para registro da planilha contábil
                     //-------------------------------------------------------------------
                     iaHistMovBem := iaHistMovBem + 1;
                     SetLength(aHistMovBem,iaHistMovBem + 1);
                     aHistMovBem[iaHistMovBem] := nSeqHist;
                  end;
                  //----------------------------------------------------------------------
                  bCalcCM := False;
               end;
            end;
         end;
         // Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467 - Fim         
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária
         // da depreciação acumulada e da depreciação do custo
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Locate('MOECODIGO',FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat,[]);
         //-------------------------------------------------------------------------------
         // Processa os calculos da DEPRECIAÇÃO e a sua CORREÇÃO MONETÁRIA
         // por Taxa de Depreciação
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger) do
         begin
            bCalcCmDep  := False;
            nValCmDep   := FcdsBemxDep.FieldByName('CMDEP').AsFloat;
            nCmDep      := 0;
            bCalcDep    := False;
            nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat;
            nDepLanc    := 0;
            //----------------------------------------------------------------------------
            // Se a Moeda processada for a oficial e o parâmetro de cálculo da
            // correção monetária estiver ativado, processar a correção monetária da
            // Depreciação Acumulada
            //----------------------------------------------------------------------------
            if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
               (ParamCAF.FLGCALCCM = 1) then
            begin
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo da correção monetária
               //-------------------------------------------------------------------------
               nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime);
               //-------------------------------------------------------------------------
               if nFatorCM > 0 then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a Correção Monetária da Depreciação Acumulada
                  //----------------------------------------------------------------------
                  nCmDep := (FcdsBemxDep.FieldByName('DEPLANC').AsFloat + FcdsBemxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                  if abs(nCmDep) >= 0.01 then
                     nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nCmDep) >= 0.01 then
                  begin
                     nValCmDep := FcdsBemxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,            // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,         // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,         // IDMODULO
                                                               21,                                              // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                        // DATAMOVIMENTACAO
                                                               -1,                                              // IDREAVALACRESC
                                                               FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime, // DATAULTDEP
                                                               -1,                                              // IDGRUPANT
                                                               -1,                                              // IDCONJANT
                                                               -1,                                              // IDLOCALANT
                                                               -1,                                              // IDRESPANT
                                                               -1,                                              // PLACAANT
                                                               -1,                                              // PLNCODIGO
                                                               '',                                              // OBSREAVAL
                                                               iTipDepProRata,                                  // TIPDEPPRORATA
                                                               -1,                                              // IDTIPODESPESA
                                                               '',                                              // OBSACRESCIMO
                                                               -1,                                              // IDMOTIVOBAIXA
                                                               0,                                               // PROPBAIXA
                                                               0,                                     // VALVENDAOFI
                                                               '');                                             // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                             nCmDep) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor na tabela BEMXDEP
                     //-------------------------------------------------------------------
                     FcdsBemxDep.Edit;
                     FcdsBemxDep.FieldByName('CMBEM').AsFloat        := nValCmDep;
                     FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := dDataMov;
                     FcdsBemxDep.Post;
                     //-------------------------------------------------------------------
                     // Registra a Correção Monetária da Depreciacao na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                       FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                       FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                       FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                       FcdsBem.FieldByName('PLACA').AsString,
                                                                       FcdsBem.FieldByName('DESBEM').AsString,
                                                                       FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                       dDataMov,nCmBem,nCmDep,'B',
                                                                       iExercicio, iPeriodo) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        iaHistMovBem := iaHistMovBem + 1;
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                     end;
                     bCalcCMDep := True;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Processar a Depreciação do Custo do BEM
            //----------------------------------------------------------------------------
            // Calcula o fator de tempo de depreciação para o BEM
            //----------------------------------------------------------------------------
            if FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime = 0 then
            begin
               nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                    FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                    FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                    nModulo);
            end else
            begin
               nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                    FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                    FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                    nModulo);
            end;
            //----------------------------------------------------------------------------
            // Captura o flag de controle de fim de periodo de depreciação
            //----------------------------------------------------------------------------
            if FcdsBemxDep.FieldByName('FLGDEPREC').IsNull then
               iFlgDeprec := 0
            else
               iFlgDeprec := FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger;
            //----------------------------------------------------------------------------
            // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
            // for diferente de zero e a taxa de depreciação for diferente de zero,
            // Calcular o valor a depreciar no periodo.
            //----------------------------------------------------------------------------
            //Helen - SOL: 172333 KTN: 1549630 - Inicio
            _cds.Data := GetDataPacket( ' SELECT '+ #13 +
                                            ' B.IDBEM,B.DTAINCLUSAO,B.DATAINICIODEP , I.IDIMOVEL   '+ #13 +
                                            ' FROM BEM B , IMOVELXBEM I '+ #13 +
                                            ' WHERE B.IDBEM = I.IDBEM   '+ #13 +
                                            '   AND B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').asString );
            iAno_Dep := 0;
            if not _cds.eof then
               DecodeDate(_cds.FieldByName('DATAINICIODEP').AsDateTime, iAno_Dep, iMes_Dep, iDia_Dep);
            DecodeDate(dDataMov, iAno_Atu, iMes_Atu, iDia_Atu);
            {if (iFlgDeprec = 0) and  (nFatorDep > 0) and
               (FcdsBemxDep.FieldByName('TAXADEP').AsFloat > 0) then}
             if (iFlgDeprec = 0) and  (nFatorDep > 0) and
               (FcdsBemxDep.FieldByName('TAXADEP').AsFloat > 0)and (iAno_Atu > iAno_Dep) then
            //Helen - SOL: 172333 KTN: 1549630 - Fim
            begin
               //-------------------------------------------------------------------------
               // Calcula a quota proporcional de depreciação do bem
               //-------------------------------------------------------------------------
               nTaxaDep := ((FcdsBemxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);

               // Alterado por FHBS - SOL: 136972 KTN: 823252 - Ignorando o "Valor Residual"
               //nDepLanc := (nTaxaDep * (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
               nDepLanc := (nTaxaDep * (FcdsBemxMoeda.FieldByName('VALORCALC').AsFloat + nValCmBem));
               // Fim - Alterado por FHBS

               //-------------------------------------------------------------------------
               // Converte para a Precisão da Moeda
               //-------------------------------------------------------------------------
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
               begin
                  nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                  if abs(nDepLanc) >= nValMin then
                  begin
                     iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                     if ParamCAF.MOEPADRAODECIMAIS > 0 then
                     begin
                        sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                     end else
                     begin
                        sFatorDec := '#0';
                     end;
                     nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                  end;
               end else
               begin
                  if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                  begin
                     nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                        if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     nValMin := 0.01;
                     if abs(nDepLanc) >= nValMin then
                        nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                  end;
               end;
               //-------------------------------------------------------------------------
               // Se o valor calculado para depreciação for superior ao total do custo
               // de aquisição do bem, ajustar o valor para igualar e setar o flag
               // de encerramento de periodo de depreciação
               //-------------------------------------------------------------------------
               if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                  // Alterado por FHBS - SOL: 136972 KTN: 823252 - Ignorando o "Valor Residual"
                  //abs(FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                  abs(FcdsBemxMoeda.FieldByName('VALORCALC').AsFloat + nValCmBem) then
                  // Fim - Alterado por FHBS
               begin
                  // Alterado por FHBS - SOL: 136972 KTN: 823252 - Ignorando o "Valor Residual"
                  //nDepLanc := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                  nDepLanc := (FcdsBemxMoeda.FieldByName('VALORCALC').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                  // Fim - Alterado por FHBS
                  iFlgDeprec := 1;
               end;
               //-------------------------------------------------------------------------
               // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
               // caso contrário, deixar para acumular na próxima depreciação.
               //-------------------------------------------------------------------------
               if abs(nDepLanc) >= nValMin then
               begin
                  nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,             // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,          // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,          // IDMODULO
                                                            14,                                               // IDTIPOMOVIMENTACAO
                                                            dDataMov,                                         // DATAMOVIMENTACAO
                                                            -1,                                               // IDREAVALACRESC
                                                            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime, // DATAULTDEP
                                                            -1,                                               // IDGRUPANT
                                                            -1,                                               // IDCONJANT
                                                            -1,                                               // IDLOCALANT
                                                            -1,                                               // IDRESPANT
                                                            -1,                                               // PLACAANT
                                                            -1,                                               // PLNCODIGO
                                                            '',                                               // OBSREAVAL
                                                            iTipDepProRata,                                   // TIPDEPPRORATA
                                                            -1,                                               // IDTIPODESPESA
                                                            '',                                               // OBSACRESCIMO
                                                            -1,                                               // IDMOTIVOBAIXA
                                                             0,                                               // PROPBAIXA
                                                             0,                                               // VALVENDAOFI
                                                            '');                                              // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          nDepLanc) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra os valores na tabela BEMXDEP
                  //----------------------------------------------------------------------
                  FcdsBemxDep.Edit;
                  FcdsBemxDep.FieldByName('DEPLANC').AsFloat       := nValDepLanc;
                  FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                  FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                  FcdsBemxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a Depreciação na Contabilidade
                  //----------------------------------------------------------------------
                  if bIntegraContab and
                    (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) or
                    pIsDistratoContratual then
                  begin
                     //-------------------------------------------------------------------
                     // Alimenta o DataSet que irá acumular a planilha contábil
                     // para a integração
                     //-------------------------------------------------------------------
                     if not CAFxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                              FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                              FcdsBem.FieldByName('IDBEM').AsInteger,
                                                              FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                              FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                              FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                              FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                              FcdsBem.FieldByName('PLACA').AsString,
                                                              FcdsBem.FieldByName('DESBEM').AsString,
                                                              FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                              dDataMov,nDepLanc,'B',
                                                              iExercicio, iPeriodo,
                                                              False, bCtaxCCusto) then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     // Id da movimentacao para registro da planilha contábil
                     //-------------------------------------------------------------------
                     iaHistMovBem := iaHistMovBem + 1;
                     SetLength(aHistMovBem,iaHistMovBem + 1);
                     aHistMovBem[iaHistMovBem] := nSeqHist;
                  end;
                  bCalcDep := True;
               end;
            end;
            //----------------------------------------------------------------------------
            if bCalcCM or bCalcDep or bCalcCMDep then
            begin
               //-------------------------------------------------------------------------
               // Registra em cdsLancProRata
               //-------------------------------------------------------------------------
               if not FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                             VarArrayOf([0,
                                                         FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                         FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[]) then
               begin
                  FcdsLancProRata.Append;
                  FcdsLancProRata.FieldByName('IDREAVALACRESC').AsInteger := 0;
                  FcdsLancProRata.FieldByName('MOECODIGO').AsInteger      := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                  FcdsLancProRata.FieldByName('IDTAXADEP').AsInteger      := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                  FcdsLancProRata.FieldByName('VALCM').AsFloat            := nCmBem;
                  FcdsLancProRata.FieldByName('VALDEP').AsFloat           := nDepLanc;
                  FcdsLancProRata.FieldByName('VALCMDEP').AsFloat         := nCmDep;
               end else
               begin
                  FcdsLancProRata.Edit;
                  FcdsLancProRata.FieldByName('VALCM').AsFloat    := FcdsLancProRata.FieldByName('VALCM').AsFloat    + nCmBem;
                  FcdsLancProRata.FieldByName('VALDEP').AsFloat   := FcdsLancProRata.FieldByName('VALDEP').AsFloat   + nDepLanc;
                  FcdsLancProRata.FieldByName('VALCMDEP').AsFloat := FcdsLancProRata.FieldByName('VALCMDEP').AsFloat + nCmDep;
               end;
               FcdsLancProRata.Post;
               //-------------------------------------------------------------------------
               // Atualiza a tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                 FcdsBem.FieldByName('IDBEM').AsInteger,
                                                 dDataMov,
                                                 FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                 FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                 0, nCmBem, nDepLanc, nCmDep,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                 FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                 FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                 FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                 0, iFlgPai) then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima taxa de depreciação x moeda
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados na tabela BEMXDEP
         //-------------------------------------------------------------------------------
         Result := ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]);
         if not Result then Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         if bCalcCM then
         begin
            //----------------------------------------------------------------------------
            // Gravação dos dados na tabela BEMXMOEDA
            //----------------------------------------------------------------------------
            Result := ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]);
            if not Result then Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Avança para a próxima moeda
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      // COMPONENTE REAVALIACAO
      //----------------------------------------------------------------------------------
      // Prepara a tabela de custos para o calculo da correção monetária e depreciação
      //----------------------------------------------------------------------------------
      // Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467 - Inicio
      if not (pIsDistratoContratual) then
      begin
        FcdsReavaliacao.First;
        while not FcdsReavaliacao.EOF do
        begin
           FcdsReavalxMoeda.Locate('IDREAVALIACAO',VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger]),[]);
           //-------------------------------------------------------------------------------
           // Processa os calculos por moeda
           //-------------------------------------------------------------------------------
           while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) do
           begin
              bCalcCM   := False;
              nCmBem    := 0;
              nCmDep    := 0;
              nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat;
              //----------------------------------------------------------------------------
              // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
              // monetária estiver ativado, processar a correção monetária do custo
              //----------------------------------------------------------------------------
              if (FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
              begin
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo da correção monetária para o BEM
                 //-------------------------------------------------------------------------
                 nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavalxMoeda.FieldByName('DATAULTCM').AsDateTime);
                 //-------------------------------------------------------------------------
                 // Calculo da CORRECAO MONETÁRIA DO CUSTO
                 // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
                 // custo no periodo para a Moeda Oficial
                 //-------------------------------------------------------------------------
                 if nFatorCM > 0 then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a Correção Monetária do Custo
                    //----------------------------------------------------------------------
                    nCmBem := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                    if abs(nCmBem) >= 0.01 then
                       nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nCmBem) >= 0.01 then
                    begin
                       nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                                 FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                                 FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                                 22,                                                    // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                              // DATAMOVIMENTACAO
                                                                 FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                                 FcdsReavalxMoeda.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
                                                                 -1,                                                    // IDGRUPANT
                                                                 -1,                                                    // IDCONJANT
                                                                 -1,                                                    // IDLOCALANT
                                                                 -1,                                                    // IDRESPANT
                                                                 -1,                                                    // PLACAANT
                                                                 -1,                                                    // PLNCODIGO
                                                                 '',                                                    // OBSREAVAL
                                                                 iTipDepProRata,                                        // TIPDEPPRORATA
                                                                 -1,                                                    // IDTIPODESPESA
                                                                 '',                                                    // OBSACRESCIMO
                                                                 -1,                                                    // IDMOTIVOBAIXA
                                                                 0,                                                     // PROPBAIXA
                                                                 0,                                     // VALVENDAOFI
                                                                 '');                                                   // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                               0,
                                                               nCmBem) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor na tabela ReavalxMoeda
                       //-------------------------------------------------------------------
                       FcdsReavalxMoeda.Edit;
                       FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat     := nValCmBem;
                       FcdsReavalxMoeda.FieldByName('DATAULTCM').AsFloat := dDataMov;
                       FcdsReavalxMoeda.Post;
                       //-------------------------------------------------------------------
                       // Registra a Correção Monetária do Custo na Contabilidade
                       //-------------------------------------------------------------------
                       if bIntegraContab then
                       begin
                          //----------------------------------------------------------------
                          // Alimenta o DataSet que irá acumular a planilha contábil
                          // para a integração
                          //----------------------------------------------------------------
                          if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                         FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                         FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                         FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                         FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                         FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                         FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                         FcdsBem.FieldByName('PLACA').AsString,
                                                                         FcdsBem.FieldByName('DESBEM').AsString,
                                                                         FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                         dDataMov,nCmBem,nCmDep,'R',
                                                                         iExercicio, iPeriodo) then
                             Raise Exception.Create(CAFxContab.MessageInfo);
                          //----------------------------------------------------------------
                          // Capta o id da movim para registro da planilha contábil
                          //----------------------------------------------------------------
                          iaHistMovBem := iaHistMovBem + 1;
                          SetLength(aHistMovBem,iaHistMovBem + 1);
                          aHistMovBem[iaHistMovBem] := nSeqHist;
                       end;
                       //-------------------------------------------------------------------
                       bCalcCM := False;
                    end;
                 end;
              end;
              //----------------------------------------------------------------------------
              // Prepara a tabela de custos para o calculo da correção monetária
              // da depreciação acumulada e da depreciação da reavaliacao
              //----------------------------------------------------------------------------
              FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                          FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
              //----------------------------------------------------------------------------
              // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
              // por Taxa de Depreciação
              //----------------------------------------------------------------------------
              iFlgPai := 1;
              while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger) and
                                                 (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger) do
              begin
                 bCalcCmDep  := False;
                 nValCmDep   := FcdsReavalxDep.FieldByName('CMDEP').AsFloat;
                 nCmDep      := 0;
                 bCalcDep    := False;
                 nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat;
                 nDepLanc    := 0;
                 //-------------------------------------------------------------------------
                 // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                 // correção monetária estiver ativado, processar a correção monetária da
                 // Depreciação Acumulada
                 //-------------------------------------------------------------------------
                 if (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                    (ParamCAF.FLGCALCCM = 1) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula o fator de tempo da correção monetária
                    //----------------------------------------------------------------------
                    nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavalxDep.FieldByName('DATAULTCM').AsDateTime);
                    //----------------------------------------------------------------------
                    if nFatorCM > 0 then
                    begin
                       //-------------------------------------------------------------------
                       // Calcula a Correção Monetária da Depreciação Acumulada
                       //-------------------------------------------------------------------
                       nCmDep := (FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + FcdsReavalxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                       if abs(nCmDep) >= 0.01 then
                          nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                       //-------------------------------------------------------------------
                       // Se o valor absoluto calculado for maior ou igual a
                       // 0,01 registrar, caso contrário, deixar para acumular na
                       // próxima depreciação.
                       //-------------------------------------------------------------------
                       if abs(nCmDep) >= 0.01 then
                       begin
                          nValCmDep := FcdsReavalxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                          //----------------------------------------------------------------
                          // Registra na tabela HISTORICOMOVIMENTACAO
                          //----------------------------------------------------------------
                          nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,         // IDBEM
                                                                    FcdsBem.FieldByName('IDPESSOA').AsFloat,      // IDPESSOA
                                                                    FcdsBem.FieldByName('IDMODULO').AsFloat,      // IDMODULO
                                                                    19,                                                   // IDTIPOMOVIMENTACAO
                                                                    dDataMov,                                             // DATAMOVIMENTACAO
                                                                    FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat,  // IDREAVALACRESC
                                                                    FcdsReavalxDep.FieldByName('DATAULTCM').AsDateTime,   // DATAULTDEP
                                                                    -1,                                                   // IDGRUPANT
                                                                    -1,                                                   // IDCONJANT
                                                                    -1,                                                   // IDLOCALANT
                                                                    -1,                                                   // IDRESPANT
                                                                    -1,                                                   // PLACAANT
                                                                    -1,                                                   // PLNCODIGO
                                                                    '',                                                   // OBSREAVAL
                                                                    iTipDepProRata,                                       // TIPDEPPRORATA
                                                                    -1,                                                   // IDTIPODESPESA
                                                                    '',                                                   // OBSACRESCIMO
                                                                    -1,                                                   // IDMOTIVOBAIXA
                                                                     0,                                                    // PROPBAIXA
                                                                     0,                                     // VALVENDAOFI
                                                                    '');                                                  // OBSBAIXA
                          if nSeqHist = -1 then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor no histórico
                          //----------------------------------------------------------------
                          if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                  FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                  FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                                  nCmDep) then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor na tabela ReavalxDep
                          //----------------------------------------------------------------
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('CMBEM').AsFloat        := nValCmDep;
                          FcdsReavalxDep.FieldByName('DATAULTCM').AsDateTime := dDataMov;
                          FcdsReavalxDep.Post;
                          //----------------------------------------------------------------
                          // Registra a Corr. Monetária da Depreciacao na Contabilidade
                          //----------------------------------------------------------------
                          if bIntegraContab then
                          begin
                             //-------------------------------------------------------------
                             // Alimenta o DataSet que irá acumular a planilha contábil
                             // para a integração
                             //-------------------------------------------------------------
                             if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                            FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                            FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                            FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                            FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                            FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                            FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                            FcdsBem.FieldByName('PLACA').AsString,
                                                                            FcdsBem.FieldByName('DESBEM').AsString,
                                                                            FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                            dDataMov,nCmBem,nCmDep,'R',
                                                                            iExercicio, iPeriodo) then
                                Raise Exception.Create(CAFxContab.MessageInfo);
                             //-------------------------------------------------------------
                             // Id da movimentacao para registro da planilha contábil
                             //-------------------------------------------------------------
                             iaHistMovBem := iaHistMovBem + 1;
                             SetLength(aHistMovBem,iaHistMovBem + 1);
                             aHistMovBem[iaHistMovBem] := nSeqHist;
                          end;
                          bCalcCMDep := True;
                       end;
                    end;
                 end;
                 //-------------------------------------------------------------------------
                 // Processar a Depreciação da Reavaliacao
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo de depreciação para a Reavaliacao
                 //-------------------------------------------------------------------------
                 nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                      FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                      FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                      nModulo);
                 //-------------------------------------------------------------------------
                 // Captura o flag de controle de fim de periodo de depreciação
                 //-------------------------------------------------------------------------
                 if FcdsReavalxDep.FieldByName('FLGDEPREC').IsNull then
                    iFlgDeprec := 0
                 else
                    iFlgDeprec := FcdsReavalxDep.FieldByName('FLGDEPREC').AsInteger;
                 //-------------------------------------------------------------------------
                 // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                 // for diferente de zero e a taxa de depreciação for diferente de zero,
                 // Calcular o valor a depreciar no periodo.
                 //-------------------------------------------------------------------------
                 if (iFlgDeprec = 0) and
                    (nFatorDep > 0) and
                    (FcdsReavalxDep.FieldByName('TAXADEP').AsFloat > 0) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a quota proporcional de depreciação do bem
                    //----------------------------------------------------------------------
                    nTaxaDep := ((FcdsReavalxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                    nDepLanc := (nTaxaDep * (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
                    //----------------------------------------------------------------------
                    // Converte para a Precisão da Moeda
                    //----------------------------------------------------------------------
                    if FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                    begin
                       nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                       if abs(nDepLanc) >= nValMin then
                       begin
                          iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                          if ParamCAF.MOEPADRAODECIMAIS > 0 then
                          begin
                             sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                          end else
                          begin
                             sFatorDec := '#0';
                          end;
                          nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                       end;
                    end else
                    begin
                       if FcdsCAFMoedas.Locate('MOECODIGO',FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                       begin
                          nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                          if abs(nDepLanc) >= nValMin then
                          begin
                             iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                             if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                             begin
                                sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                             end else
                             begin
                                sFatorDec := '#0';
                             end;
                             nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                          end;
                       end else
                       begin
                          nValMin := 0.01;
                          if abs(nDepLanc) >= nValMin then
                             nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                       end;
                    end;
                    //----------------------------------------------------------------------
                    // Se o valor calculado para depreciação for superior ao total do custo
                    // de aquisição do bem, ajustar o valor para igualar e setar o flag
                    // de encerramento de periodo de depreciação
                    //----------------------------------------------------------------------
                    if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                       abs(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                    begin
                       nDepLanc := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                       iFlgDeprec := 1;
                    end;
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nDepLanc) >= nValMin then
                    begin
                       nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                   // IDBEM
                                                                 FcdsBem.FieldByName('IDPESSOA').AsFloat,                // IDPESSOA
                                                                 nModulo,                                                // IDMODULO
                                                                 18,                                                     // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                               // DATAMOVIMENTACAO
                                                                 FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat,    // IDREAVALACRESC
                                                                 FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,    // DATAULTDEP
                                                                 -1,                                                     // IDGRUPANT
                                                                 -1,                                                     // IDCONJANT
                                                                 -1,                                                     // IDLOCALANT
                                                                 -1,                                                     // IDRESPANT
                                                                 -1,                                                     // PLACAANT
                                                                 -1,                                                     // PLNCODIGO
                                                                 '',                                                     // OBSREAVAL
                                                                 iTipDepProRata,                                         // TIPDEPPRORATA
                                                                 -1,                                                     // IDTIPODESPESA
                                                                 '',                                                     // OBSACRESCIMO
                                                                 -1,                                                     // IDMOTIVOBAIXA
                                                                  0,                                                      // PROPBAIXA
                                                                  0,                                     // VALVENDAOFI
                                                                 '');                                                    // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,   // IDTAXADEP
                                                               nDepLanc) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra os valores na tabela ReavalxDep
                       //-------------------------------------------------------------------
                       FcdsReavalxDep.Edit;
                       FcdsReavalxDep.FieldByName('DEPLANC').AsFloat       := nValDepLanc;
                       FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                       FcdsReavalxDep.FieldByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                       FcdsReavalxDep.Post;
                       //-------------------------------------------------------------------
                       // Registra a Depreciação na Contabilidade
                       //-------------------------------------------------------------------
                       if bIntegraContab and
                         (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                       begin
                          //----------------------------------------------------------------
                          // Alimenta o DataSet que irá acumular a planilha contábil
                          // para a integração
                          //----------------------------------------------------------------
                          if not CAFxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                   FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                   FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                   FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                   FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                   FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                   FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                   FcdsBem.FieldByName('PLACA').AsString,
                                                                   FcdsBem.FieldByName('DESBEM').AsString,
                                                                   FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                   dDataMov,nDepLanc,'R',
                                                                   iExercicio, iPeriodo,
                                                                   False, bCtaxCCusto) then
                             Raise Exception.Create(CAFxContab.MessageInfo);
                          //----------------------------------------------------------------
                          // Id da movimentacao para registro da planilha contábil
                          //----------------------------------------------------------------
                          iaHistMovBem := iaHistMovBem + 1;
                          SetLength(aHistMovBem,iaHistMovBem + 1);
                          aHistMovBem[iaHistMovBem] := nSeqHist;
                       end;
                       bCalcDep := True;
                    end;
                 end;
                 //-------------------------------------------------------------------------
                 if bCalcCM or bCalcDep or bCalcCMDep then
                 begin
                    //----------------------------------------------------------------------
                    // Registra em cdsLancProRata
                    //----------------------------------------------------------------------
                    if not FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                                  VarArrayOf([FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger,
                                                              FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                              FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger]),[]) then
                    begin
                       FcdsLancProRata.Append;
                       FcdsLancProRata.FieldByName('IDREAVALACRESC').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                       FcdsLancProRata.FieldByName('MOECODIGO').AsInteger      := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                       FcdsLancProRata.FieldByName('IDTAXADEP').AsInteger      := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                       FcdsLancProRata.FieldByName('VALCM').AsFloat            := nCmBem;
                       FcdsLancProRata.FieldByName('VALDEP').AsFloat           := nDepLanc;
                       FcdsLancProRata.FieldByName('VALCMDEP').AsFloat         := nCmDep;
                    end else
                    begin
                       FcdsLancProRata.Edit;
                       FcdsLancProRata.FieldByName('VALCM').AsFloat    := FcdsLancProRata.FieldByName('VALCM').AsFloat    + nCmBem;
                       FcdsLancProRata.FieldByName('VALDEP').AsFloat   := FcdsLancProRata.FieldByName('VALDEP').AsFloat   + nDepLanc;
                       FcdsLancProRata.FieldByName('VALCMDEP').AsFloat := FcdsLancProRata.FieldByName('VALCMDEP').AsFloat + nCmDep;
                    end;
                    FcdsLancProRata.Post;
                    //----------------------------------------------------------------------
                    // Atualiza a tabela SALDOCONTABBEM
                    //----------------------------------------------------------------------
                    if FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
                    begin
                       if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                         FcdsBem.FieldByName('IDBEM').AsInteger,
                                                         dDataMov,
                                                         FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                         FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                         0, 0, 0, 0,
                                                         0, nCmBem, nDepLanc, nCmDep,
                                                         0, 0, 0, 0,
                                                         FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                         FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                         FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                         FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                         FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                         0, iFlgPai) then
                          Raise Exception.Create(Bem.MessageInfo);
                    end else
                    begin
                       if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                         FcdsBem.FieldByName('IDBEM').AsInteger,
                                                         dDataMov,
                                                         FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                         FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                         0, 0, 0, 0,
                                                         0, 0, 0, 0,
                                                         0, nCmBem, nDepLanc, nCmDep,
                                                         FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                         FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                         FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                         FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                         FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                         0, iFlgPai) then
                          Raise Exception.Create(Bem.MessageInfo);
                    end;
                    //----------------------------------------------------------------------
                    iFlgPai := 0;
                 end;
                 //-------------------------------------------------------------------------
                 // Avança para a próxima taxa de depreciação x moeda
                 //-------------------------------------------------------------------------
                 FcdsReavalxDep.Next;
              end;
              //----------------------------------------------------------------------------
              // Gravação dos dados na tabela ReavalxDep
              //----------------------------------------------------------------------------
              Result := ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]);
              if not Result then Raise Exception.Create(_dbReavalxDep.MessageInfo);
              //----------------------------------------------------------------------------
              if bCalcCM then
              begin
                 //-------------------------------------------------------------------------
                 // Gravação dos dados na tabela ReavalxMoeda
                 //-------------------------------------------------------------------------
                 Result := ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]);
                 if not Result then Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
              end;
              //----------------------------------------------------------------------------
              // Avança para a próxima moeda
              //----------------------------------------------------------------------------
              FcdsReavalxMoeda.Next;
           end;
           FcdsReavaliacao.Next;
        end;
        //----------------------------------------------------------------------------------
        // COMPONENTE ACRESCIMO DE VALOR
        //----------------------------------------------------------------------------------
        FcdsAcrescimoValor.First;
        while not FcdsAcrescimoValor.EOF do
        begin
           //-------------------------------------------------------------------------------
           // Prepara a tabela de custos para o calculo da corr monetária e depreciação
           //-------------------------------------------------------------------------------
           FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger]),[]);
           //-------------------------------------------------------------------------------
           // Processa os calculos por moeda
           //-------------------------------------------------------------------------------
           while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) do
           begin
              //Helen - SOL Nº142550 KINTANA Nº 911790
              bDecrescimo := False; //Helen - SOL Nº150414 KINTANA Nº 1092527
              //Helen - SOL Nº142550 KINTANA Nº 911790
              if FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat < 0 then
              begin
                   // Felipe de Oliveira SOL153958 - Início
                   //Helen - SOL Nº150414 KINTANA Nº 1092527
                   {if (nModulo = 7) then
                      bDecrescimo := true
                   else
                   begin
                     FcdsAcrescValorxMoeda.Next;
                     Continue;
                   end; }
                   //Helen SOL Nº 153958 KINTANA Nº 1167601
                   bDecrescimo := true

                   // Felipe de Oliveira SOL153958 - Fim
                   //Helen - SOL Nº150414 KINTANA Nº 1092527 - Fim
              end;
              bCalcCM   := False;
              nCmBem    := 0;
              nCmDep    := 0;
              nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat;
              //----------------------------------------------------------------------------
              // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
              // monetária estiver ativado, processar a correção monetária do custo do
              // Acréscimo de Valor
              //----------------------------------------------------------------------------
              if (FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
              begin
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo da correção monetária para o BEM
                 //-------------------------------------------------------------------------
                 nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDateTime);
                 //-------------------------------------------------------------------------
                 // Calculo da CORRECAO MONETÁRIA DO CUSTO DO ACRÉSCIMO DE VALOR
                 // Se calcula a correção e se a moeda é a oficial -> Calcular a correção
                 // do custo do Acréscimo de Valor no periodo para a Moeda Oficial
                 //-------------------------------------------------------------------------
                 if nFatorCM > 0 then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a Correção Monetária do Custo do Acréscimo de Valor
                    //----------------------------------------------------------------------
                    nCmBem := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                    if abs(nCmBem) >= 0.01 then
                       nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nCmBem) >= 0.01 then
                    begin
                       nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,          // IDBEM
                                                                 FcdsBem.FieldByName('IDPESSOA').AsFloat,       // IDPESSOA
                                                                 FcdsBem.FieldByName('IDMODULO').AsFloat,       // IDMODULO
                                                                 34,                                                    // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                              // DATAMOVIMENTACAO
                                                                 FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                                 FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
                                                                 -1,                                                    // IDGRUPANT
                                                                 -1,                                                    // IDCONJANT
                                                                 -1,                                                    // IDLOCALANT
                                                                 -1,                                                    // IDRESPANT
                                                                 -1,                                                    // PLACAANT
                                                                 -1,                                                    // PLNCODIGO
                                                                 '',                                                    // OBSREAVAL
                                                                 iTipDepProRata,                                        // TIPDEPPRORATA
                                                                 -1,                                                    // IDTIPODESPESA
                                                                 '',                                                    // OBSACRESCIMO
                                                                 -1,                                                    // IDMOTIVOBAIXA
                                                                  0,                                                     // PROPBAIXA
                                                                  0,                                     // VALVENDAOFI
                                                                 '');                                                   // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                               0,
                                                               nCmBem) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor na tabela AcrescValorxMoeda
                       //-------------------------------------------------------------------
                       FcdsAcrescValorxMoeda.Edit;
                       FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat     := nValCmBem;
                       FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsFloat := dDataMov;
                       FcdsAcrescValorxMoeda.Post;
                       //-------------------------------------------------------------------
                       // Registra a Correção Monetária do Custo na Contabilidade
                       //-------------------------------------------------------------------
                       if bIntegraContab then
                       begin
                          //----------------------------------------------------------------
                          // Alimenta o DataSet que irá acumular a planilha contábil
                          // para a integração
                          //----------------------------------------------------------------
                          if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                         FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                         FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                         FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                         FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                         FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                         FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                         FcdsBem.FieldByName('PLACA').AsString,
                                                                         FcdsBem.FieldByName('DESBEM').AsString,
                                                                         FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                         dDataMov,nCmBem,nCmDep,'A',
                                                                         iExercicio, iPeriodo) then
                             Raise Exception.Create(CAFxContab.MessageInfo);
                          //----------------------------------------------------------------
                          // Capta o id da movimentacao para registro da planilha contábil
                          //----------------------------------------------------------------
                          iaHistMovBem := iaHistMovBem + 1;
                          SetLength(aHistMovBem,iaHistMovBem + 1);
                          aHistMovBem[iaHistMovBem] := nSeqHist;
                       end;
                       //-------------------------------------------------------------------
                       bCalcCM := False;
                    end;
                 end;
              end;
              //----------------------------------------------------------------------------
              // Prepara a tabela de custos para o calculo da correção monetária
              // da depreciação acumulada e da depreciação da AcrescimoValor
              //----------------------------------------------------------------------------
              FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger,
                                                                             FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
              //----------------------------------------------------------------------------
              // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
              // por Taxa de Depreciação
              //----------------------------------------------------------------------------
              iFlgPai := 1;
              while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger) and
                                                      (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger) do
              begin
                 bCalcCmDep  := False;
                 nValCmDep   := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat;
                 nCmDep      := 0;
                 bCalcDep    := False;
                 nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat;
                 nDepLanc    := 0;
                 //-------------------------------------------------------------------------
                 // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                 // correção monetária estiver ativado, processar a correção monetária da
                 // Depreciação Acumulada
                 //-------------------------------------------------------------------------
                 if (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                    (ParamCAF.FLGCALCCM = 1) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula o fator de tempo da correção monetária
                    //----------------------------------------------------------------------
                    nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime);
                    //----------------------------------------------------------------------
                    if nFatorCM > 0 then
                    begin
                       //-------------------------------------------------------------------
                       // Calcula a Correção Monetária da Depreciação Acumulada
                       //-------------------------------------------------------------------
                       nCmDep := (FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                       if abs(nCmDep) >= 0.01 then
                          nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                       //-------------------------------------------------------------------
                       // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                       // caso contrário, deixar para acumular na próxima depreciação.
                       //-------------------------------------------------------------------
                       if abs(nCmDep) >= 0.01 then
                       begin
                          nValCmDep := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                          //----------------------------------------------------------------
                          // Registra na tabela HISTORICOMOVIMENTACAO
                          //----------------------------------------------------------------
                          nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                 // IDBEM
                                                                    FcdsBem.FieldByName('IDPESSOA').AsFloat,              // IDPESSOA
                                                                    FcdsBem.FieldByName('IDMODULO').AsFloat,              // IDMODULO
                                                                    36,                                                   // IDTIPOMOVIMENTACAO
                                                                    dDataMov,                                             // DATAMOVIMENTACAO
                                                                    FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat,  // IDREAVALACRESC
                                                                    FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime, // DATAULTDEP
                                                                    -1,                                                   // IDGRUPANT
                                                                    -1,                                                   // IDCONJANT
                                                                    -1,                                                   // IDLOCALANT
                                                                    -1,                                                   // IDRESPANT
                                                                    -1,                                                   // PLACAANT
                                                                    -1,                                                   // PLNCODIGO
                                                                    '',                                                   // OBSREAVAL
                                                                    iTipDepProRata,                                       // TIPDEPPRORATA
                                                                    -1,                                                   // IDTIPODESPESA
                                                                    '',                                                   // OBSACRESCIMO
                                                                    -1,                                                   // IDMOTIVOBAIXA
                                                                     0,                                                    // PROPBAIXA
                                                                     0,                                     // VALVENDAOFI
                                                                    '');                                                  // OBSBAIXA
                          if nSeqHist = -1 then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor no histórico
                          //----------------------------------------------------------------
                          if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                  FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                  FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                  nCmDep) then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor na tabela AcrescValorxDep
                          //----------------------------------------------------------------
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('CMBEM').AsFloat        := nValCmDep;
                          FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime := dDataMov;
                          FcdsAcrescValorxDep.Post;
                          //----------------------------------------------------------------
                          // Registra a Correção Monetária da Depreciacao na Contabilidade
                          //----------------------------------------------------------------
                          if bIntegraContab then
                          begin
                             //-------------------------------------------------------------
                             // Alimenta o DataSet que irá acumular a planilha contábil
                             // para a integração
                             //-------------------------------------------------------------
                             if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                            FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                            FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                            FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                            FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                            FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                            FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                            FcdsBem.FieldByName('PLACA').AsString,
                                                                            FcdsBem.FieldByName('DESBEM').AsString,
                                                                            FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                            dDataMov,nCmBem,nCmDep,'A',
                                                                            iExercicio, iPeriodo) then
                                Raise Exception.Create(CAFxContab.MessageInfo);
                             //-------------------------------------------------------------
                             // Id da movimentacao para registro da planilha contábil
                             //-------------------------------------------------------------
                             iaHistMovBem := iaHistMovBem + 1;
                             SetLength(aHistMovBem,iaHistMovBem + 1);
                             aHistMovBem[iaHistMovBem] := nSeqHist;
                          end;
                          bCalcCMDep := True;
                       end;
                    end;
                 end;
                 //-------------------------------------------------------------------------
                 // Processar a Depreciação da AcrescimoValor
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo de depreciação para a AcrescimoValor
                 //-------------------------------------------------------------------------
                 nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                      FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                      FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime,
                                                      nModulo);
                 //-------------------------------------------------------------------------
                 // Captura o flag de controle de fim de periodo de depreciação
                 //-------------------------------------------------------------------------
                 if FcdsAcrescValorxDep.FieldByName('FLGDEPREC').IsNull then
                    iFlgDeprec := 0
                 else
                    iFlgDeprec := FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsInteger;
                 //-------------------------------------------------------------------------
                 // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                 // for diferente de zero e a taxa de depreciação for diferente de zero,
                 // Calcular o valor a depreciar no periodo.
                 //-------------------------------------------------------------------------
                 if (iFlgDeprec = 0) and
                    (nFatorDep > 0) and
                    (FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat > 0) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a quota proporcional de depreciação do bem
                    //----------------------------------------------------------------------
                    nTaxaDep := ((FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
  //nDepLanc := (nTaxaDep * (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));//Helen - SOL Nº150414 KINTANA Nº 1092527
                    //nDepLanc := (nTaxaDep * (abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat) + nValCmBem));
                    //Felipe - SOL 151877 KINTANA Nº 1120282
                    if nModulo =  7 then
                       nDepLanc := (nTaxaDep * (abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat) + nValCmBem))//Helen - SOL Nº150414 KINTANA Nº 1092527
                    else
                       nDepLanc := (nTaxaDep * (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));

                    //----------------------------------------------------------------------
                    // Converte para a Precisão da Moeda
                    //----------------------------------------------------------------------
                    if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                    begin
                       nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                       if abs(nDepLanc) >= nValMin then
                       begin
                          iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                          if ParamCAF.MOEPADRAODECIMAIS > 0 then
                          begin
                             sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                          end else
                          begin
                             sFatorDec := '#0';
                          end;
                          nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                       end;
                    end else
                    begin
                       if FcdsCAFMoedas.Locate('MOECODIGO',FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                       begin
                          nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                          if abs(nDepLanc) >= nValMin then
                          begin
                             iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                             if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                             begin
                                sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                             end else
                             begin
                                sFatorDec := '#0';
                             end;
                             nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                          end;
                       end else
                       begin
                          nValMin := 0.01;
                          if abs(nDepLanc) >= nValMin then
                             nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                       end;
                    end;
                    //----------------------------------------------------------------------
                    // Se o valor calculado para depreciação for superior ao total do custo
                    // de aquisição do bem, ajustar o valor para igualar e setar o flag
                    // de encerramento de periodo de depreciação
                    //----------------------------------------------------------------------
                    if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                       abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                    begin
                       //Helen - SOL Nº150414 KINTANA Nº 1092527
                       //nDepLanc := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                       //nDepLanc := (abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat) + nValCmBem) - (nValDepLanc + nValCmDep);
                       //Felipe - SOL 151877 KINTANA 1120282
                       if nModulo = 7 then
                          nDepLanc := (abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat) + nValCmBem) - (nValDepLanc + nValCmDep)
                       else
                          nDepLanc := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);

                       iFlgDeprec := 1;
                    end;
                    //Helen - SOL Nº150414 KINTANA Nº 1092527
                    if bDecrescimo = False then
                    begin
                       iTipoMovimentacao := 35;
                       sTipoTab := 'A';
                    end
                    else
                    begin
                       iTipoMovimentacao := 99;
                       sTipoTab := 'D';
                    end;
                    //Helen - SOL Nº150414 KINTANA Nº 1092527 FIM
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nDepLanc) >= nValMin then
                    begin
                       if bDecrescimo = True then
                          nDepLanc := nDepLanc * (-1); //Helen - SOL Nº150414 KINTANA Nº 1092527
                       nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                           // IDBEM
                                                                 FcdsBem.FieldByName('IDPESSOA').AsFloat,                        // IDPESSOA
                                                                 FcdsBem.FieldByName('IDMODULO').AsFloat,                        // IDMODULO
  {Helen - SOL Nº150414 KINTANA Nº 1092527 de 35 p/ alterado para iTipoMovimentacao}    iTipoMovimentacao,                       // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                                       // DATAMOVIMENTACAO
                                                                 FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat,         // IDREAVALACRESC
                                                                 FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,       // DATAULTDEP
                                                                 -1,                                                             // IDGRUPANT
                                                                 -1,                                                             // IDCONJANT
                                                                 -1,                                                             // IDLOCALANT
                                                                 -1,                                                             // IDRESPANT
                                                                 -1,                                                             // PLACAANT
                                                                 -1,                                                             // PLNCODIGO
                                                                 '',                                                             // OBSREAVAL
                                                                 iTipDepProRata,                                                 // TIPDEPPRORATA
                                                                 -1,                                                             // IDTIPODESPESA
                                                                 '',                                                             // OBSACRESCIMO
                                                                 -1,                                                             // IDMOTIVOBAIXA
                                                                  0,                                                              // PROPBAIXA
                                                                  0,                                     // VALVENDAOFI
                                                                 '');                                                            // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                               nDepLanc) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra os valores na tabela AcrescValorxDep
                       //-------------------------------------------------------------------
                       FcdsAcrescValorxDep.Edit;
                       FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat       := nValDepLanc;
                       FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                       FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                       FcdsAcrescValorxDep.Post;
                       //-------------------------------------------------------------------
                       // Registra a Depreciação na Contabilidade
                       //-------------------------------------------------------------------
                       if bIntegraContab and
                         (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                       begin
                          //----------------------------------------------------------------
                          // Alimenta o DataSet que irá acumular a planilha contábil
                          // para a integração
                          //----------------------------------------------------------------
                          if not CAFxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                   FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                   FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                   FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                   FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                   FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                   FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                   FcdsBem.FieldByName('PLACA').AsString,
                                                                   FcdsBem.FieldByName('DESBEM').AsString,
                                                                   FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                   dDataMov,nDepLanc,sTipoTab , //'A', Helen - SOL Nº150414 KINTANA Nº 1092527
                                                                   iExercicio, iPeriodo,
                                                                   False, bCtaxCCusto) then
                             Raise Exception.Create(CAFxContab.MessageInfo);
                          //----------------------------------------------------------------
                          // Id da movimentacao para registro da planilha contábil
                          //----------------------------------------------------------------
                          iaHistMovBem := iaHistMovBem + 1;
                          SetLength(aHistMovBem,iaHistMovBem + 1);
                          aHistMovBem[iaHistMovBem] := nSeqHist;
                       end;
                       bCalcDep := True;
                    end;
                 end;
                 //-------------------------------------------------------------------------
                 if bCalcCM or bCalcDep or bCalcCMDep then
                 begin
                    //----------------------------------------------------------------------
                    // Registra em cdsLancProRata
                    //----------------------------------------------------------------------
                    if not FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                                  VarArrayOf([FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger,
                                                              FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                              FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger]),[]) then
                    begin
                       FcdsLancProRata.Append;
                       FcdsLancProRata.FieldByName('IDREAVALACRESC').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                       FcdsLancProRata.FieldByName('MOECODIGO').AsInteger      := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                       FcdsLancProRata.FieldByName('IDTAXADEP').AsInteger      := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                       FcdsLancProRata.FieldByName('VALCM').AsFloat            := nCmBem;
                       FcdsLancProRata.FieldByName('VALDEP').AsFloat           := nDepLanc;
                       FcdsLancProRata.FieldByName('VALCMDEP').AsFloat         := nCmDep;
                    end else
                    begin
                       FcdsLancProRata.Edit;
                       FcdsLancProRata.FieldByName('VALCM').AsFloat    := FcdsLancProRata.FieldByName('VALCM').AsFloat    + nCmBem;
                       FcdsLancProRata.FieldByName('VALDEP').AsFloat   := FcdsLancProRata.FieldByName('VALDEP').AsFloat   + nDepLanc;
                       FcdsLancProRata.FieldByName('VALCMDEP').AsFloat := FcdsLancProRata.FieldByName('VALCMDEP').AsFloat + nCmDep;
                    end;
                    FcdsLancProRata.Post;
                    //----------------------------------------------------------------------
                    // Atualiza a tabela SALDOCONTABBEM
                    //----------------------------------------------------------------------
                    if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                      FcdsBem.FieldByName('IDBEM').AsInteger,
                                                      dDataMov,
                                                      FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                      FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                      0, nCmBem, nDepLanc, nCmDep,
                                                      0, 0, 0, 0,
                                                      0, 0, 0, 0,
                                                      FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                      FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                      FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                      FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                      FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                      0, iFlgPai) then
                       Raise Exception.Create(Bem.MessageInfo);
                    //----------------------------------------------------------------------
                    iFlgPai := 0;
                 end;
                 //-------------------------------------------------------------------------
                 // Avança para a próxima taxa de depreciação x moeda
                 //-------------------------------------------------------------------------
                 FcdsAcrescValorxDep.Next;
              end;
              //----------------------------------------------------------------------------
              // Gravação dos dados na tabela AcrescValorxDep
              //----------------------------------------------------------------------------
              Result := ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]);
              if not Result then Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
              //----------------------------------------------------------------------------
              if bCalcCM then
              begin
                 //-------------------------------------------------------------------------
                 // Gravação dos dados na tabela AcrescValorxMoeda
                 //-------------------------------------------------------------------------
                 Result := ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]);
                 if not Result then Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
              end;
              //----------------------------------------------------------------------------
              // Avança para a próxima moeda
              //----------------------------------------------------------------------------
              FcdsAcrescValorxMoeda.Next;
           end;
           FcdsAcrescimoValor.Next;
        end;
      end;
      // Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467 - Fim
      //----------------------------------------------------------------------------------
      // Registra a Planilha Contábil
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         nPlanilha := CAFxContab.RegistraPlanilhaContabil(nModulo,
                                                          nEmpresaProp,
                                                          nUsuario,
                                                          datetostr(dDataMov));
         if nPlanilha < 0 then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra na tabela HISTORICOMOVIMENTACAO a planilha gerada
         //-------------------------------------------------------------------------------
         iHistMovBem := 0;
         while iHistMovBem <= iaHistMovBem do
         begin
            if not HistMovBem.RegistraPlanHistMovBem(aHistMovBem[iHistMovBem],nPlanilha) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            iHistMovBem := iHistMovBem + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa o Fechamento ProRata durante um remembramento de bens
//----------------------------------------------------------------------------------------
function TCtrlFechamentoProRata.ExecutarII(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                           dDataMov : tDateTime;
                                           iTipDepProRata : Integer) : Boolean;
var
   iFatorDec, iHistMovBem,
   iFlgPai, iFlgDeprec                : Integer;
   dDataUltDep                        : TDateTime;
   nPlanilha,
   nCmBem, nDepLanc, nCmDep,
   nValCmBem, nValDepLanc, nValCmDep,
   nFatorCM, nFatorDep, nTaxaDep,
   nSeqHist, nValMin                  : Extended;
   bCtaxCCusto,
   bCalcCM, bCalcDep, bCalcCmDep      : Boolean;
   iAno, iMes, iDia                   : Word;
   sFatorDec                          : String;
   iTipoMov                           : Integer ; //Helen SOL Nº 153958 KINTANA Nº 1167601
   sTipoTab                           : String;   //Helen SOL Nº 153958 KINTANA Nº 1167601
   iAno_Dep, iMes_Dep, iDia_Dep,iAno_Atu, iMes_Atu, iDia_Atu  : Word; //Helen - SOL:172333 KTN: 1549630
   nAcumValorG                        :Extended;
begin
   //-------------------------------------------------------------------------------------
   // Caso o dia da movimentação seja 01, não calcular o pró-rata
   //-------------------------------------------------------------------------------------
   if iTipDepProRata = 0 then
   begin
      DecodeDate((dDataMov + 1), iAno, iMes, iDia);
   end else
   begin
      DecodeDate(dDataMov, iAno, iMes, iDia);
   end;
   if iDia = 1 then
   begin
      Result := True;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
      GeraCAFMoedasProp;
      //----------------------------------------------------------------------------------
      // Alimenta as propriedades de integração contábil
      //----------------------------------------------------------------------------------
      bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), Trunc(nModulo));
      iaHistMovBem := -1;
      //----------------------------------------------------------------------------------
      // Verifica se a data do fechamento pró-rata pode ser usada para contabilização
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         if not CAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
                                                   iExercicio, iPeriodo) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query de montagem da Planilha Contábil
         //-------------------------------------------------------------------------------
         if not CAFxContab.InicializaMontaContab then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query com a Parametrização contábil
         //-------------------------------------------------------------------------------
         if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
            Raise Exception.Create(CAFxContab.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Alimentando os DataSets com os dados do bem
      //----------------------------------------------------------------------------------
      FcdsBem.Data               := Bem.ListaBem(nEmpresaProp,nBem);
      FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,nBem);
      FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,nBem);
      FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,nBem);
      FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,nBem);
      FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,nBem);
      FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,nBem);
      FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,nBem);
      FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,nBem);
      //----------------------------------------------------------------------------------
      // Calcula a depreciação dos três componentes do saldo contábil dos bens
      //----------------------------------------------------------------------------------
      // COMPONENTE BEM
      //----------------------------------------------------------------------------------
      // Processa os calculos por moeda
      //----------------------------------------------------------------------------------
      while not FcdsBemxMoeda.EOF do
      begin
         bCalcCM   := False;
         nCmBem    := 0;
         nCmDep    := 0;
         nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat;
         //-------------------------------------------------------------------------------
         // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
         // monetária estiver ativado, processar a correção monetária do custo
         //-------------------------------------------------------------------------------
         if (FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
         begin
            //----------------------------------------------------------------------------
            // Calcula o fator de tempo da correção monetária para o BEM
            //----------------------------------------------------------------------------
            nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime);
            //----------------------------------------------------------------------------
            // Calculo da CORRECAO MONETÁRIA DO CUSTO
            // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
            // custo no periodo para a Moeda Oficial
            //----------------------------------------------------------------------------
            if nFatorCM > 0 then
            begin
               //-------------------------------------------------------------------------
               // Calcula a Correção Monetária do Custo
               //-------------------------------------------------------------------------
               nCmBem := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + FcdsBemxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
               if abs(nCmBem) >= 0.01 then
                  nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
               //-------------------------------------------------------------------------
               // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
               // caso contrário, deixar para acumular na próxima depreciação.
               //-------------------------------------------------------------------------
               if abs(nCmBem) >= 0.01 then
               begin
                  nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,               // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,            // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,            // IDMODULO
                                                            15,                                                 // IDTIPOMOVIMENTACAO
                                                            dDataMov,                                           // DATAMOVIMENTACAO
                                                            -1,                                                 // IDREAVALACRESC
                                                            FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
                                                            -1,                                                 // IDGRUPANT
                                                            -1,                                                 // IDCONJANT
                                                            -1,                                                 // IDLOCALANT
                                                            -1,                                                 // IDRESPANT
                                                            -1,                                                 // PLACAANT
                                                            -1,                                                 // PLNCODIGO
                                                            '',                                                 // OBSREAVAL
                                                            iTipDepProRata,                                     // TIPDEPPRORATA
                                                            -1,                                                 // IDTIPODESPESA
                                                            '',                                                 // OBSACRESCIMO
                                                            -1,                                                 // IDMOTIVOBAIXA
                                                             0,                                                  // PROPBAIXA
                                                             0,                                     // VALVENDAOFI
                                                            '');                                                // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nCmBem) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o valor na tabela BemxMoeda
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlAtuBemxMoeda.Prepare;
                  _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDBEM').AsFloat        := FcdsBemxMoeda.FieldByName('IDBEM').AsFloat;
                  _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDPESSOA').AsFloat     := FcdsBemxMoeda.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlAtuBemxMoeda.ParamByName('MOECODIGO').AsInteger  := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
                  _dMTFechamento.sqlAtuBemxMoeda.ParamByName('CMBEM').AsFloat        := nValCmBem;
                  _dMTFechamento.sqlAtuBemxMoeda.ParamByName('DATAULTCM').AsDateTime := dDataMov;
                  if not ExecSQL(_dMTFechamento.sqlAtuBemxMoeda.SQLChanged, True) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Correção Monetária do Custo na Contabilidade
                  //----------------------------------------------------------------------
                  if bIntegraContab then
                  begin
                     //-------------------------------------------------------------------
                     // Alimenta o DataSet que irá acumular a planilha contábil
                     // para a integração
                     //-------------------------------------------------------------------
                     if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                    FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                    FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                    FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                    FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                    FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                    FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                    FcdsBem.FieldByName('PLACA').AsString,
                                                                    FcdsBem.FieldByName('DESBEM').AsString,
                                                                    FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                    dDataMov,nCmBem,nCmDep,'B',
                                                                    iExercicio, iPeriodo) then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     // Capta o id da movimentacao para registro da planilha contábil
                     //-------------------------------------------------------------------
                     iaHistMovBem := iaHistMovBem + 1;
                     SetLength(aHistMovBem,iaHistMovBem + 1);
                     aHistMovBem[iaHistMovBem] := nSeqHist;
                  end;
                  //----------------------------------------------------------------------
                  bCalcCM := False;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária
         // da depreciação acumulada e da depreciação do custo
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Locate('MOECODIGO',FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat,[]);
         //-------------------------------------------------------------------------------
         // Processa os calculos da DEPRECIAÇÃO e a sua CORREÇÃO MONETÁRIA
         // por Taxa de Depreciação
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger) do
         begin
            bCalcCmDep  := False;
            nValCmDep   := FcdsBemxDep.FieldByName('CMDEP').AsFloat;
            nCmDep      := 0;
            bCalcDep    := False;
            nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat;
            nDepLanc    := 0;
            //----------------------------------------------------------------------------
            // Se a Moeda processada for a oficial e o parâmetro de cálculo da
            // correção monetária estiver ativado, processar a correção monetária da
            // Depreciação Acumulada
            //----------------------------------------------------------------------------
            if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
               (ParamCAF.FLGCALCCM = 1) then
            begin
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo da correção monetária
               //-------------------------------------------------------------------------
               nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime);
               //-------------------------------------------------------------------------
               if nFatorCM > 0 then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a Correção Monetária da Depreciação Acumulada
                  //----------------------------------------------------------------------
                  nCmDep := (FcdsBemxDep.FieldByName('DEPLANC').AsFloat + FcdsBemxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                  if abs(nCmDep) >= 0.01 then
                     nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nCmDep) >= 0.01 then
                  begin
                     nValCmDep := FcdsBemxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,            // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,         // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,         // IDMODULO
                                                               21,                                              // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                        // DATAMOVIMENTACAO
                                                               -1,                                              // IDREAVALACRESC
                                                               FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime, // DATAULTDEP
                                                               -1,                                              // IDGRUPANT
                                                               -1,                                              // IDCONJANT
                                                               -1,                                              // IDLOCALANT
                                                               -1,                                              // IDRESPANT
                                                               -1,                                              // PLACAANT
                                                               -1,                                              // PLNCODIGO
                                                               '',                                              // OBSREAVAL
                                                               iTipDepProRata,                                  // TIPDEPPRORATA
                                                               -1,                                              // IDTIPODESPESA
                                                               '',                                              // OBSACRESCIMO
                                                               -1,                                              // IDMOTIVOBAIXA
                                                                0,                                               // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                             // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                             nCmDep) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor na tabela BEMXDEP
                     //-------------------------------------------------------------------
                     _dMTFechamento.sqlAtuBemxDep1.Prepare;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDBEM').AsFloat        := FcdsBemxDep.FieldByName('IDBEM').AsFloat;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDPESSOA').AsFloat     := FcdsBemxDep.FieldByName('IDPESSOA').AsFloat;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('MOECODIGO').AsInteger  := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDTAXADEP').AsInteger  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('CMDEP').AsFloat        := nValCmDep;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('DATAULTCM').AsDateTime := dDataMov;
                     if not ExecSQL(_dMTFechamento.sqlAtuBemxDep1.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Correção Monetária da Depreciacao na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                       FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                       FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                       FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                       FcdsBem.FieldByName('PLACA').AsString,
                                                                       FcdsBem.FieldByName('DESBEM').AsString,
                                                                       FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                       dDataMov,nCmBem,nCmDep,'B',
                                                                       iExercicio, iPeriodo) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        iaHistMovBem := iaHistMovBem + 1;
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                     end;
                     bCalcCMDep := True;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Processar a Depreciação do Custo do BEM
            //----------------------------------------------------------------------------
            // Calcula o fator de tempo de depreciação para o BEM
            //----------------------------------------------------------------------------
            if FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime = 0 then
            begin
               nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                    FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                    FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                    nModulo);
            end else
            begin
               //Cássio - WO17991 - Inclusão de Parâmetro
               nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                    FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                    FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                    nModulo, FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime);
            end;
            //----------------------------------------------------------------------------
            // Captura o flag de controle de fim de periodo de depreciação
            //----------------------------------------------------------------------------
            if FcdsBemxDep.FieldByName('FLGDEPREC').IsNull then
               iFlgDeprec := 0
            else
               iFlgDeprec := FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger;
            //----------------------------------------------------------------------------
            // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
            // for diferente de zero e a taxa de depreciação for diferente de zero,
            // Calcular o valor a depreciar no periodo.
            //----------------------------------------------------------------------------
            //Helen - SOL: 172333 KTN: 1549630 - Inicio
               _cds.Data := GetDataPacket( ' SELECT '+ #13 +
                                            ' B.IDBEM,B.DTAINCLUSAO,B.DATAINICIODEP , I.IDIMOVEL   '+ #13 +
                                            ' FROM BEM B , IMOVELXBEM I '+ #13 +
                                            ' WHERE B.IDBEM = I.IDBEM   '+ #13 +
                                            '   AND B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').asString );
               iAno_Dep := 0;
               if not _cds.eof then
                   DecodeDate(_cds.FieldByName('DATAINICIODEP').AsDateTime, iAno_Dep, iMes_Dep, iDia_Dep);
               DecodeDate(dDataMov, iAno_Atu, iMes_Atu, iDia_Atu);
               {if (iFlgDeprec = 0) and (nFatorDep > 0) and
               (FcdsBemxDep.FieldByName('TAXADEP').AsFloat > 0) then then}
               if (iFlgDeprec = 0) and (nFatorDep > 0) and
                  (FcdsBemxDep.FieldByName('TAXADEP').AsFloat > 0) and
                  (iAno_Atu > iAno_Dep) then
                //Helen - SOL: 172333 KTN: 1549630 - Fim

            begin
               //-------------------------------------------------------------------------
               // Calcula a quota proporcional de depreciação do bem
               //-------------------------------------------------------------------------
               nTaxaDep := ((FcdsBemxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
               //Cássio Rovaroto - WO17991 - Início
               if nModulo = 7 then
                nDepLanc := (nTaxaDep * (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem))
               else
               begin
                if dDataMov <= StrtoDate('31/12/2022') then
                  nDepLanc := (nTaxaDep * (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem))
                else
                  nDepLanc := (nTaxaDep * ((FcdsBemxMoeda.FieldByName('VALORG').AsFloat -
                                            FcdsBemxDep.FieldByName('DEPLANC').AsFloat) +
                                            nValCmBem));
               end;
               //Cássio Rovaroto - WO17991 - Fim


               //-------------------------------------------------------------------------
               // Converte para a Precisão da Moeda
               //-------------------------------------------------------------------------
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
               begin
                  nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                  if abs(nDepLanc) >= nValMin then
                  begin
                     iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                     if ParamCAF.MOEPADRAODECIMAIS > 0 then
                     begin
                        sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                     end else
                     begin
                        sFatorDec := '#0';
                     end;
                     nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                  end;
               end else
               begin
                  if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                  begin
                     nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                        if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     nValMin := 0.01;
                     if abs(nDepLanc) >= nValMin then
                        nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                  end;
               end;
               //-------------------------------------------------------------------------
               // Se o valor calculado para depreciação for superior ao total do custo
               // de aquisição do bem, ajustar o valor para igualar e setar o flag
               // de encerramento de periodo de depreciação
               //-------------------------------------------------------------------------
               if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                  abs(FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
               begin
                  nDepLanc := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                  iFlgDeprec := 1;
               end;
               //-------------------------------------------------------------------------
               // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
               // caso contrário, deixar para acumular na próxima depreciação.
               //-------------------------------------------------------------------------
               if abs(nDepLanc) >= nValMin then
               begin
                  nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,             // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,          // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,          // IDMODULO
                                                            14,                                               // IDTIPOMOVIMENTACAO
                                                            dDataMov,                                         // DATAMOVIMENTACAO
                                                            -1,                                               // IDREAVALACRESC
                                                            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime, // DATAULTDEP
                                                            -1,                                               // IDGRUPANT
                                                            -1,                                               // IDCONJANT
                                                            -1,                                               // IDLOCALANT
                                                            -1,                                               // IDRESPANT
                                                            -1,                                               // PLACAANT
                                                            -1,                                               // PLNCODIGO
                                                            '',                                               // OBSREAVAL
                                                            iTipDepProRata,                                   // TIPDEPPRORATA
                                                            -1,                                               // IDTIPODESPESA
                                                            '',                                               // OBSACRESCIMO
                                                            -1,                                               // IDMOTIVOBAIXA
                                                             0,                                                // PROPBAIXA
                                                             0,                                     // VALVENDAOFI
                                                            '');                                              // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          nDepLanc) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra os valores na tabela BEMXDEP
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlAtuBemxDep2.Prepare;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDBEM').AsFloat         := FcdsBemxDep.FieldByName('IDBEM').AsFloat;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDPESSOA').AsFloat      := FcdsBemxDep.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('DEPLANC').AsFloat       := nValDepLanc;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDateTime := dDataMov;
                  _dMTFechamento.sqlAtuBemxDep2.ParamByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                  if not ExecSQL(_dMTFechamento.sqlAtuBemxDep2.SQLChanged, True) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Depreciação na Contabilidade
                  //----------------------------------------------------------------------
                  if bIntegraContab and
                    (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                  begin
                     //-------------------------------------------------------------------
                     // Alimenta o DataSet que irá acumular a planilha contábil
                     // para a integração
                     //-------------------------------------------------------------------
                     if not CAFxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                              FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                              FcdsBem.FieldByName('IDBEM').AsInteger,
                                                              FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                              FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                              FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                              FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                              FcdsBem.FieldByName('PLACA').AsString,
                                                              FcdsBem.FieldByName('DESBEM').AsString,
                                                              FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                              dDataMov,nDepLanc,'B',
                                                              iExercicio, iPeriodo,
                                                              False, bCtaxCCusto) then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     // Id da movimentacao para registro da planilha contábil
                     //-------------------------------------------------------------------
                     iaHistMovBem := iaHistMovBem + 1;
                     SetLength(aHistMovBem,iaHistMovBem + 1);
                     aHistMovBem[iaHistMovBem] := nSeqHist;
                  end;
                  bCalcDep := True;
               end;
            end;
            //----------------------------------------------------------------------------
            if bCalcCM or bCalcDep or bCalcCMDep then
            begin
               //-------------------------------------------------------------------------
               // Atualiza a tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                 FcdsBem.FieldByName('IDBEM').AsInteger,
                                                 dDataMov,
                                                 FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                 FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                 0, nCmBem, nDepLanc, nCmDep,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                 FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                 FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                 FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                 0, iFlgPai) then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima taxa de depreciação
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Avança para a próxima moeda
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      // COMPONENTE REAVALIACAO
      //----------------------------------------------------------------------------------
      // Prepara a tabela de custos para o calculo da correção monetária e depreciação
      //----------------------------------------------------------------------------------
      FcdsReavaliacao.First;
      while not FcdsReavaliacao.EOF do
      begin
         FcdsReavalxMoeda.Locate('IDREAVALIACAO',VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger]),[]);
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) do
         begin
            bCalcCM   := False;
            nCmBem    := 0;
            nCmDep    := 0;
            nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
            // monetária estiver ativado, processar a correção monetária do custo
            //----------------------------------------------------------------------------
            if (FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
            begin
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo da correção monetária para o BEM
               //-------------------------------------------------------------------------
               nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavalxMoeda.FieldByName('DATAULTCM').AsDateTime);
               //-------------------------------------------------------------------------
               // Calculo da CORRECAO MONETÁRIA DO CUSTO
               // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
               // custo no periodo para a Moeda Oficial
               //-------------------------------------------------------------------------
               if nFatorCM > 0 then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a Correção Monetária do Custo
                  //----------------------------------------------------------------------
                  nCmBem := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                  if abs(nCmBem) >= 0.01 then
                     nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nCmBem) >= 0.01 then
                  begin
                     nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                               22,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                              // DATAMOVIMENTACAO
                                                               FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               FcdsReavalxMoeda.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
                                                               -1,                                                    // IDGRUPANT
                                                               -1,                                                    // IDCONJANT
                                                               -1,                                                    // IDLOCALANT
                                                               -1,                                                    // IDRESPANT
                                                               -1,                                                    // PLACAANT
                                                               -1,                                                    // PLNCODIGO
                                                               '',                                                    // OBSREAVAL
                                                               iTipDepProRata,                                        // TIPDEPPRORATA
                                                               -1,                                                    // IDTIPODESPESA
                                                               '',                                                    // OBSACRESCIMO
                                                               -1,                                                    // IDMOTIVOBAIXA
                                                                0,                                                     // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             nCmBem) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor na tabela ReavalxMoeda
                     //-------------------------------------------------------------------
                     _dMTFechamento.sqlAtuReavxMoeda.Prepare;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('CMBEM').AsFloat           := nValCmBem;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('DATAULTCM').AsDateTime    := dDataMov;
                     if not ExecSQL(_dMTFechamento.sqlAtuReavxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Correção Monetária do Custo na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                       FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                       FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                       FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                       FcdsBem.FieldByName('PLACA').AsString,
                                                                       FcdsBem.FieldByName('DESBEM').AsString,
                                                                       FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                       dDataMov,nCmBem,nCmDep,'R',
                                                                       iExercicio, iPeriodo) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Capta o id da movim para registro da planilha contábil
                        //----------------------------------------------------------------
                        iaHistMovBem := iaHistMovBem + 1;
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                     end;
                     //-------------------------------------------------------------------
                     bCalcCM := False;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da correção monetária
            // da depreciação acumulada e da depreciação da reavaliacao
            //----------------------------------------------------------------------------
            FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                        FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
            //----------------------------------------------------------------------------
            // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
            // por Taxa de Depreciação
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger) and
                                               (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger) do
            begin
               bCalcCmDep  := False;
               nValCmDep   := FcdsReavalxDep.FieldByName('CMDEP').AsFloat;
               nCmDep      := 0;
               bCalcDep    := False;
               nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat;
               nDepLanc    := 0;

               //Cássio Rovaroto - WO17991 - Início
               if nModulo = 7 then
                nAcumValorG := nAcumValorG + FcdsReavalxMoeda.FieldByName('VALORG').AsFloat
               else
               begin
                if dDataMov < StrToDate('01/01/2022') then
                  nAcumValorG := nAcumValorG + FcdsReavalxMoeda.FieldByName('VALORG').AsFloat
                else
                  nAcumValorG := nAcumValorG + (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat -
                                                FcdsReavalxDep.FieldByName('DEPLANC').AsFloat);
               end;
               //Cássio Rovaroto - WO17991 - Fim

               //-------------------------------------------------------------------------
               // Se a Moeda processada for a oficial e o parâmetro de cálculo da
               // correção monetária estiver ativado, processar a correção monetária da
               // Depreciação Acumulada
               //-------------------------------------------------------------------------
               if (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                  (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo da correção monetária
                  //----------------------------------------------------------------------
                  nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavalxDep.FieldByName('DATAULTCM').AsDateTime);
                  //----------------------------------------------------------------------
                  if nFatorCM > 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a Correção Monetária da Depreciação Acumulada
                     //-------------------------------------------------------------------
                     nCmDep := (FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + FcdsReavalxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                     if abs(nCmDep) >= 0.01 then
                        nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                     //-------------------------------------------------------------------
                     // Se o valor absoluto calculado for maior ou igual a
                     // 0,01 registrar, caso contrário, deixar para acumular na
                     // próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nCmDep) >= 0.01 then
                     begin
                        nValCmDep := FcdsReavalxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,         // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,      // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,      // IDMODULO
                                                                  19,                                                   // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                             // DATAMOVIMENTACAO
                                                                  FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat,  // IDREAVALACRESC
                                                                  FcdsReavalxDep.FieldByName('DATAULTCM').AsDateTime,   // DATAULTDEP
                                                                  -1,                                                   // IDGRUPANT
                                                                  -1,                                                   // IDCONJANT
                                                                  -1,                                                   // IDLOCALANT
                                                                  -1,                                                   // IDRESPANT
                                                                  -1,                                                   // PLACAANT
                                                                  -1,                                                   // PLNCODIGO
                                                                  '',                                                   // OBSREAVAL
                                                                  iTipDepProRata,                                       // TIPDEPPRORATA
                                                                  -1,                                                   // IDTIPODESPESA
                                                                  '',                                                   // OBSACRESCIMO
                                                                  -1,                                                   // IDMOTIVOBAIXA
                                                                   0,                                                    // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                  // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                                nCmDep) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor na tabela ReavalxDep
                        //----------------------------------------------------------------
                        _dMTFechamento.sqlAtuReavxDep1.Prepare;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('CMDEP').AsFloat           := nValCmDep;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('DATAULTCM').AsDateTime    := dDataMov;
                        if not ExecSQL(_dMTFechamento.sqlAtuReavxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                        //----------------------------------------------------------------
                        // Registra a Corr. Monetária da Depreciacao na Contabilidade
                        //----------------------------------------------------------------
                        if bIntegraContab then
                        begin
                           //-------------------------------------------------------------
                           // Alimenta o DataSet que irá acumular a planilha contábil
                           // para a integração
                           //-------------------------------------------------------------
                           if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                          FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                          FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                          FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                          FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                          FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                          FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                          FcdsBem.FieldByName('PLACA').AsString,
                                                                          FcdsBem.FieldByName('DESBEM').AsString,
                                                                          FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                          dDataMov,nCmBem,nCmDep,'R',
                                                                          iExercicio, iPeriodo) then
                              Raise Exception.Create(CAFxContab.MessageInfo);
                           //-------------------------------------------------------------
                           // Id da movimentacao para registro da planilha contábil
                           //-------------------------------------------------------------
                           iaHistMovBem := iaHistMovBem + 1;
                           SetLength(aHistMovBem,iaHistMovBem + 1);
                           aHistMovBem[iaHistMovBem] := nSeqHist;
                        end;
                        bCalcCMDep := True;
                     end;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Processar a Depreciação da Reavaliacao
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para a Reavaliacao
               //-------------------------------------------------------------------------
               nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                    FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                    FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                    nModulo);
               //-------------------------------------------------------------------------
               // Captura o flag de controle de fim de periodo de depreciação
               //-------------------------------------------------------------------------
               if FcdsReavalxDep.FieldByName('FLGDEPREC').IsNull then
                  iFlgDeprec := 0
               else
                  iFlgDeprec := FcdsReavalxDep.FieldByName('FLGDEPREC').AsInteger;
               //-------------------------------------------------------------------------
               // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
               // for diferente de zero e a taxa de depreciação for diferente de zero,
               // Calcular o valor a depreciar no periodo.
               //-------------------------------------------------------------------------
               if (iFlgDeprec = 0) and
                  (nFatorDep > 0) and
                  (FcdsReavalxDep.FieldByName('TAXADEP').AsFloat > 0) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a quota proporcional de depreciação do bem
                  //----------------------------------------------------------------------
                  nTaxaDep := ((FcdsReavalxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                  //Cássio Rovaroto - WO17991 - Início
                  //nDepLanc := (nTaxaDep * (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
                  nDepLanc := (nTaxaDep * (nAcumValorG + nValCmBem));
                  //Cássio Rovaroto - WO17991 - Fim
                  //----------------------------------------------------------------------
                  // Converte para a Precisão da Moeda
                  //----------------------------------------------------------------------
                  if FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                  begin
                     nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                        if ParamCAF.MOEPADRAODECIMAIS > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     if FcdsCAFMoedas.Locate('MOECODIGO',FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                     begin
                        nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                           if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        nValMin := 0.01;
                        if abs(nDepLanc) >= nValMin then
                           nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                     abs(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                  begin
                     nDepLanc := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     iFlgDeprec := 1;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nValMin) >= 0.01 then
                  begin
                     nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                   // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,                // IDPESSOA
                                                               nModulo,                                                // IDMODULO
                                                               18,                                                     // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                               // DATAMOVIMENTACAO
                                                               FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat,    // IDREAVALACRESC
                                                               FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,    // DATAULTDEP
                                                               -1,                                                     // IDGRUPANT
                                                               -1,                                                     // IDCONJANT
                                                               -1,                                                     // IDLOCALANT
                                                               -1,                                                     // IDRESPANT
                                                               -1,                                                     // PLACAANT
                                                               -1,                                                     // PLNCODIGO
                                                               '',                                                     // OBSREAVAL
                                                               iTipDepProRata,                                         // TIPDEPPRORATA
                                                               -1,                                                     // IDTIPODESPESA
                                                               '',                                                     // OBSACRESCIMO
                                                               -1,                                                     // IDMOTIVOBAIXA
                                                                0,                                                      // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                    // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,   // IDTAXADEP
                                                             nDepLanc) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra os valores na tabela ReavalxDep
                     //-------------------------------------------------------------------
                     _dMTFechamento.sqlAtuReavxDep2.Prepare;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('DEPLANC').AsFloat         := nValDepLanc;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('DATAULTDEP').AsDateTime   := dDataMov;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('FLGDEPREC').AsInteger     := iFlgDeprec;
                     if not ExecSQL(_dMTFechamento.sqlAtuReavxDep2.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Depreciação na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab and
                       (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                 FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                 FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                 FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                 FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                 FcdsBem.FieldByName('PLACA').AsString,
                                                                 FcdsBem.FieldByName('DESBEM').AsString,
                                                                 FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                 dDataMov,nDepLanc,'R',
                                                                 iExercicio, iPeriodo,
                                                                 False, bCtaxCCusto) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        iaHistMovBem := iaHistMovBem + 1;
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                     end;
                     bCalcDep := True;
                  end;
               end;
               //-------------------------------------------------------------------------
               if bCalcCM or bCalcDep or bCalcCMDep then
               begin
                  //----------------------------------------------------------------------
                  // Atualiza a tabela SALDOCONTABBEM
                  //----------------------------------------------------------------------
                  if FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
                  begin
                     if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                       FcdsBem.FieldByName('IDBEM').AsInteger,
                                                       dDataMov,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       0, 0, 0, 0,
                                                       0, nCmBem, nDepLanc, nCmDep,
                                                       0, 0, 0, 0,
                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                       FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                       0, iFlgPai) then
                        Raise Exception.Create(Bem.MessageInfo);
                  end else
                  begin
                     if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                       FcdsBem.FieldByName('IDBEM').AsInteger,
                                                       dDataMov,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       0, 0, 0, 0,
                                                       0, 0, 0, 0,
                                                       0, nCmBem, nDepLanc, nCmDep,
                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                       FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                       0, iFlgPai) then
                        Raise Exception.Create(Bem.MessageInfo);
                  end;
                  iFlgPai := 0
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsReavalxMoeda.Next;
         end;
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // COMPONENTE ACRESCIMO DE VALOR
      //----------------------------------------------------------------------------------
      FcdsAcrescimoValor.First;
      while not FcdsAcrescimoValor.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da corr monetária e depreciação
         //-------------------------------------------------------------------------------
         FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger]),[]);
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) do
         begin
            bCalcCM   := False;
            nCmBem    := 0;
            nCmDep    := 0;
            nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
            // monetária estiver ativado, processar a correção monetária do custo do
            // Acréscimo de Valor
            //----------------------------------------------------------------------------
            if (FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
            begin
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo da correção monetária para o BEM
               //-------------------------------------------------------------------------
               nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDateTime);
               //-------------------------------------------------------------------------
               // Calculo da CORRECAO MONETÁRIA DO CUSTO DO ACRÉSCIMO DE VALOR
               // Se calcula a correção e se a moeda é a oficial -> Calcular a correção
               // do custo do Acréscimo de Valor no periodo para a Moeda Oficial
               //-------------------------------------------------------------------------
               if nFatorCM > 0 then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a Correção Monetária do Custo do Acréscimo de Valor
                  //----------------------------------------------------------------------
                  nCmBem := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                  if abs(nCmBem) >= 0.01 then
                     nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nCmBem) >= 0.01 then
                  begin
                     nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,          // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,       // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,       // IDMODULO
                                                               34,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                              // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
                                                               -1,                                                    // IDGRUPANT
                                                               -1,                                                    // IDCONJANT
                                                               -1,                                                    // IDLOCALANT
                                                               -1,                                                    // IDRESPANT
                                                               -1,                                                    // PLACAANT
                                                               -1,                                                    // PLNCODIGO
                                                               '',                                                    // OBSREAVAL
                                                               iTipDepProRata,                                        // TIPDEPPRORATA
                                                               -1,                                                    // IDTIPODESPESA
                                                               '',                                                    // OBSACRESCIMO
                                                               -1,                                                    // IDMOTIVOBAIXA
                                                                0,                                                     // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             nCmBem) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor na tabela AcrescValorxMoeda
                     //-------------------------------------------------------------------
                     _dMTFechamento.sqlAtuAcresxMoeda.Prepare;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('CMBEM').AsFloat         := nValCmBem;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('DATAULTCM').AsDateTime  := dDataMov;
                     if not ExecSQL(_dMTFechamento.sqlAtuAcresxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Correção Monetária do Custo na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                       FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                       FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                       FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                       FcdsBem.FieldByName('PLACA').AsString,
                                                                       FcdsBem.FieldByName('DESBEM').AsString,
                                                                       FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                       dDataMov,nCmBem,nCmDep,'A',
                                                                       iExercicio, iPeriodo) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Capta o id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        iaHistMovBem := iaHistMovBem + 1;
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                     end;
                     //-------------------------------------------------------------------
                     bCalcCM := False;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da correção monetária
            // da depreciação acumulada e da depreciação da AcrescimoValor
            //----------------------------------------------------------------------------
            FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger,
                                                                           FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            //----------------------------------------------------------------------------
            // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
            // por Taxa de Depreciação
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger) and
                                                    (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger) do
            begin
               bCalcCmDep  := False;
               nValCmDep   := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat;
               nCmDep      := 0;
               bCalcDep    := False;
               nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat;
               nDepLanc    := 0;
               //-------------------------------------------------------------------------
               // Se a Moeda processada for a oficial e o parâmetro de cálculo da
               // correção monetária estiver ativado, processar a correção monetária da
               // Depreciação Acumulada
               //-------------------------------------------------------------------------
               if (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                  (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo da correção monetária
                  //----------------------------------------------------------------------
                  nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime);
                  //----------------------------------------------------------------------
                  if nFatorCM > 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a Correção Monetária da Depreciação Acumulada
                     //-------------------------------------------------------------------
                     nCmDep := (FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                     if abs(nCmDep) >= 0.01 then
                        nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                     //-------------------------------------------------------------------
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nCmDep) >= 0.01 then
                     begin
                        nValCmDep := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                 // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,              // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,              // IDMODULO
                                                                  36,                                                   // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                             // DATAMOVIMENTACAO
                                                                  FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat,  // IDREAVALACRESC
                                                                  FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime, // DATAULTDEP
                                                                  -1,                                                   // IDGRUPANT
                                                                  -1,                                                   // IDCONJANT
                                                                  -1,                                                   // IDLOCALANT
                                                                  -1,                                                   // IDRESPANT
                                                                  -1,                                                   // PLACAANT
                                                                  -1,                                                   // PLNCODIGO
                                                                  '',                                                   // OBSREAVAL
                                                                  iTipDepProRata,                                       // TIPDEPPRORATA
                                                                  -1,                                                   // IDTIPODESPESA
                                                                  '',                                                   // OBSACRESCIMO
                                                                  -1,                                                   // IDMOTIVOBAIXA
                                                                   0,                                                    // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                  // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                nCmDep) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor na tabela AcrescValorxDep
                        //----------------------------------------------------------------
                        _dMTFechamento.sqlAtuAcresxDep1.Prepare;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('CMDEP').AsFloat         := nValCmDep;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('DATAULTCM').AsDateTime  := dDataMov;
                        if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                        //----------------------------------------------------------------
                        // Registra a Correção Monetária da Depreciacao na Contabilidade
                        //----------------------------------------------------------------
                        if bIntegraContab then
                        begin
                           //-------------------------------------------------------------
                           // Alimenta o DataSet que irá acumular a planilha contábil
                           // para a integração
                           //-------------------------------------------------------------
                           if not CAFxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                          FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                          FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                          FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                          FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                          FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                          FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                          FcdsBem.FieldByName('PLACA').AsString,
                                                                          FcdsBem.FieldByName('DESBEM').AsString,
                                                                          FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                          dDataMov,nCmBem,nCmDep,'A',
                                                                          iExercicio, iPeriodo) then
                              Raise Exception.Create(CAFxContab.MessageInfo);
                           //-------------------------------------------------------------
                           // Id da movimentacao para registro da planilha contábil
                           //-------------------------------------------------------------
                           iaHistMovBem := iaHistMovBem + 1;
                           SetLength(aHistMovBem,iaHistMovBem + 1);
                           aHistMovBem[iaHistMovBem] := nSeqHist;
                        end;
                        bCalcCMDep := True;
                     end;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Processar a Depreciação da AcrescimoValor
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para a AcrescimoValor
               //-------------------------------------------------------------------------
               nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                    FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                    FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime,
                                                    nModulo);
               //-------------------------------------------------------------------------
               // Captura o flag de controle de fim de periodo de depreciação
               //-------------------------------------------------------------------------
               if FcdsAcrescValorxDep.FieldByName('FLGDEPREC').IsNull then
                  iFlgDeprec := 0
               else
                  iFlgDeprec := FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsInteger;
               //-------------------------------------------------------------------------
               // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
               // for diferente de zero e a taxa de depreciação for diferente de zero,
               // Calcular o valor a depreciar no periodo.
               //-------------------------------------------------------------------------
               if (iFlgDeprec = 0) and
                  (nFatorDep > 0) and
                  (FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat > 0) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a quota proporcional de depreciação do bem
                  //----------------------------------------------------------------------
                  nTaxaDep := ((FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                  nDepLanc := (nTaxaDep * (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
                  //----------------------------------------------------------------------
                  // Converte para a Precisão da Moeda
                  //----------------------------------------------------------------------
                  if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                  begin
                     nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                        if ParamCAF.MOEPADRAODECIMAIS > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     if FcdsCAFMoedas.Locate('MOECODIGO',FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                     begin
                        nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                           if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        nValMin := 0.01;
                        if abs(nDepLanc) >= nValMin then
                           nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                     abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                  begin
                     nDepLanc := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     iFlgDeprec := 1;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nDepLanc) >= nValMin then
                  begin
                      iTipoMov := 35;
                      sTipoTab := 'A';
                     //Helen SOL Nº 153958 KINTANA Nº 1167601
                     if nModulo = 54 then
                     begin
                         if FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat > 0 then
                            iTipoMov := 35
                         else
                         begin
                            iTipoMov := 99;
                            sTipoTab := 'D';
                         end;
                     end;
                     nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                           // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,                        // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,                        // IDMODULO
{Helen SOL Nº 153958 KINTANA Nº 1167601}                       iTipoMov,                                                       // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                                       // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat,         // IDREAVALACRESC
                                                               FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,       // DATAULTDEP
                                                               -1,                                                             // IDGRUPANT
                                                               -1,                                                             // IDCONJANT
                                                               -1,                                                             // IDLOCALANT
                                                               -1,                                                             // IDRESPANT
                                                               -1,                                                             // PLACAANT
                                                               -1,                                                             // PLNCODIGO
                                                               '',                                                             // OBSREAVAL
                                                               iTipDepProRata,                                                 // TIPDEPPRORATA
                                                               -1,                                                             // IDTIPODESPESA
                                                               '',                                                             // OBSACRESCIMO
                                                               -1,                                                             // IDMOTIVOBAIXA
                                                                0,                                                              // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                            // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                             nDepLanc) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra os valores na tabela AcrescValorxDep
                     //-------------------------------------------------------------------
                     _dMTFechamento.sqlAtuAcresxDep2.Prepare;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := nValDepLanc;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDateTime := dDataMov;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                     if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep2.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Depreciação na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab and
                       (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                                 FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                                 FcdsBem.FieldByName('IDBEM').AsInteger,
                                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                                 FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                                 FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                                 FcdsBem.FieldByName('PLACA').AsString,
                                                                 FcdsBem.FieldByName('DESBEM').AsString,
                                                                 FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                                // dDataMov,nDepLanc,'A', - Helen SOL Nº 153958 KINTANA 1167601
                                                                 dDataMov,nDepLanc,sTipoTab,
                                                                 iExercicio, iPeriodo,
                                                                 False, bCtaxCCusto) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        iaHistMovBem := iaHistMovBem + 1;
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                     end;
                     bCalcDep := True;
                  end;
               end;
               //-------------------------------------------------------------------------
               if bCalcCM or bCalcDep or bCalcCMDep then
               begin
                  //----------------------------------------------------------------------
                  // Atualiza a tabela SALDOCONTABBEM
                  //----------------------------------------------------------------------
                  if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsBem.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                    0, nCmBem, nDepLanc, nCmDep,
                                                    0, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                    FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                    FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                    0, iFlgPai) then
                     Raise Exception.Create(Bem.MessageInfo);
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsAcrescValorxMoeda.Next;
         end;
         FcdsAcrescimoValor.Next
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
function TCtrlFechamentoProRata.CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime; const pIsDistratoContratual : Boolean = False) : Extended;// Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467
var
   nValAtual, nValAnt : Extended;
   iNumDecimais, iFlgArredonda : Integer;

begin
   if (ParamCAF.FLGCALCCM = 1) or (pIsDistratoContratual) then // Sistema parametrizado para calcular C.M. // Marcio Sanches Spinosa SOL Nº 162907 Kintana Nº 1387467
   begin
      nValAnt   := Bem.CotacaoMoeda(Trunc(ParamCAF.MOEDAFISCAL), dDataAnt, iNumDecimais, iFlgArredonda);
      nValAtual := Bem.CotacaoMoeda(Trunc(ParamCAF.MOEDAFISCAL), dDataMov, iNumDecimais, iFlgArredonda);
      //----------------------------------------------------------------------------------
      if (nValAnt <= 0) or (nValAtual <= 0) then
         Result := 0
      else
         Result := nValAtual / nValAnt;
   end else
   begin
      Result := 0;
   end;
end;
//========================================================================================
function TCtrlFechamentoProRata.CalculaFatorDepreciacao(dDataMov, dDataAnt, dDataIni : tDateTime; iIDModulo: Extended; dDataUltMov: tDateTime) : Extended;
var
   iMesIni,iAnoIni,iDiaIni,
   iMesFim,iAnoFim,iDiaFim,
   iNDias, iDayInc,
   iDayIncP,
   iAnoFimP,iMesFimP,iDiaFimP,
   iAno,iMes,iDia,
   iAnoInit,iMesInit,iDiaInit : Word;
   dDataRef, dDataInit: TDateTime;

begin
   if dDataAnt = dDataIni then
   begin
      iDayInc := 1;
      iDayIncP := 0;
   end else
   begin
      iDayInc := 0;
      iDayIncP := 1;
   end;
   //-------------------------------------------------------------------------------------
   DecodeDate(dDataAnt, iAnoIni, iMesIni, iDiaIni);
   DecodeDate(dDataMov, iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   if (dDataMov = dDataAnt) or (dDataAnt = 0) then
   begin
      Result := 0;
   end else
   begin
      //----------------------------------------------------------------------------------
      // Fechamento por Periodo Mensal
      //----------------------------------------------------------------------------------
      if ParamCAF.FLGTIPOCALC = 'M' then
      begin
        //Cássio Rovaroto - WO17991 - Início
        if iIdModulo = 7 then
        begin
         DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAnoFimP,iMesFimP,iDiaFimP);
         if ((dDataAnt + iDayIncP) = EncodeDate(iAnoFim,iMesFim,01)) and
            (dDataMov = EncodeDate(iAnoFimP,iMesFimP,iDiaFimP)) then
         begin
            Result := (1 / 12);
         end else
         begin
            //Thaise SOl 152857 - O calculo deve ser igual ao do
            //desmembramento.
            iNDias := round(dDataMov - dDataAnt) + iDayInc;
            Result := ((1 / 12) / iDiaFimP) * (iNDias );

            {iNDias := round(dDataMov - dDataAnt) + iDayInc;
            Result := iNDias / 365.25;}
         end;
        end
        else
        begin
         if (iMesIni = iMesFim) and (iDiaIni = 01) then
         begin
            Result := (1 / 12);
         end
         else
         begin
          if (iAnoIni <> iAnoFim) and (dDataUltMov <> -1) then
          begin
            dDataRef := dDataUltMov;
            DecodeDate(dDataRef, iAnoIni, iMesIni, iDiaIni);
          end
          else
            dDataRef := dDataAnt;

          iNDias := round(dDataMov - dDataRef) + iDayInc;

          if (dDataMov = dDataRef) or (dDataRef = 0) then
          begin
            Result := 0;
          end
          else
          begin
            if (iMesIni = iMesFim) and (iDiaIni > 01) then
            begin
              DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
              Result := (1 / 12 / iDia) * iNDias;
            end
            else
            //-------------------------------------------------------------------------
            begin
              dDataInit := dDataMov - 31;
              DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
              DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
              dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
            //----------------------------------------------------------------------
              if dDataMov >= StrToDate('31/01/2022') then
                Result :=  (1 / 12) * (365.25 / 30.4375)
              else
                if (dDataInit = dDataRef) or
                   ((iMesIni = iMesFim) and (iDiaIni <> 01)) then
                  Result := (1 / 12)
                else
                  Result := (1 / 12) * (iNDias / 30.4375);
            end;
            end;
         end;
        end;
        //Cássio Rovaroto - WO17991 - Fim
      end else
      //----------------------------------------------------------------------------------
      // Fechamento por Periodo Anual ou Diario
      //----------------------------------------------------------------------------------
      begin
         iNDias := round(dDataMov - dDataAnt) + iDayInc;
         Result := iNDias / 365.25;
      end;
   end;
end;
//========================================================================================
function TCtrlFechamentoProRata.VerificaDataEstorno(nEmpresaProp, nBem : Extended;
                                                    dDataMov : tDateTime) : Boolean;
var
   sSql : String;
begin
   sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
           ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
           ' WHERE  (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )' + #13 +
           '   AND  (IDBEM    = ' + floattostr(nBem) + ' )' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty or
      (_cds.FieldByName('DATAULTMOV').AsDateTime > (dDataMov + 1)) then
   begin
      Result := False;
      MessageInfo := CMTranslate('Existem movimentações com data posterior. Consulte Histórico de Movimentações!');
   end else
      Result := True;
end;
//========================================================================================
// Função que estorna o fechamento prórata de um bem
//----------------------------------------------------------------------------------------
function TCtrlFechamentoProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                         dDataMov, dDataEst : tDateTime;
                                         bEstornaContab : Boolean) : Boolean;
Var
   sSql               : String;
   aPlanilha          : Array of Integer;
   iaPlanilha, iPlan  : Integer;
   bCalculouProRata   : Boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após a Depreciacao
      //----------------------------------------------------------------------------------
      if not VerificaDataEstorno(nEmpresaProp, nBem, dDataMov) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      // Alimenta as propriedades de integração contábil
      //----------------------------------------------------------------------------------
      bIntegraContab := CAFxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));

      // Vinicius - 14/09/2006 - Verifica o período contábil apenas se existirem lançamentos a serem estornados
      //----------------------------------------------------------------------------------
      // Verifica se o fechamento pode ser estornado da contabilidade
      //----------------------------------------------------------------------------------
//      if bIntegraContab then
//         if not CAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
//                                                   iExercicio, iPeriodo) then
//            Raise Exception.Create(CAFxContab.MessageInfo);

      //----------------------------------------------------------------------------------
      // Preenche o Vetor com os id's a serem processados
      //----------------------------------------------------------------------------------
      sSql := ' SELECT /*+ RULE */ HM.IDPESSOA, HM.IDBEM, HM.PLNCODIGO ' +
              ' FROM HISTORICOMOVIMENTACAO HM ' +
              ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
              '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
              '   AND (HM.IDTIPOMOVIMENTACAO = 15 OR HM.IDTIPOMOVIMENTACAO = 22 OR HM.IDTIPOMOVIMENTACAO = 34 OR ' + #13 +
              '        HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO = 18 OR HM.IDTIPOMOVIMENTACAO = 35 OR ' + #13 +
              '        HM.IDTIPOMOVIMENTACAO = 21 OR HM.IDTIPOMOVIMENTACAO = 19 OR HM.IDTIPOMOVIMENTACAO = 36 OR ' + #13 +
              '        HM.IDTIPOMOVIMENTACAO = 99) ' + #13 +         //Helen - SOL Nº150414 KINTANA Nº 1092527
              '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' + #13 +
              '   AND HM.FLGRETIFICAREAVAL = 0 ' + #13 +
              '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp);
      _cds.Data := GetDataPacket( sSql );
      bCalculouProRata := not _cds.IsEmpty;
      //----------------------------------------------------------------------------------

      // Vinicius - 14/09/2006 - Verifica o período contábil apenas se existirem lançamentos a serem estornados

      //----------------------------------------------------------------------------------
      // Verifica se o fechamento pode ser estornado da contabilidade
      //----------------------------------------------------------------------------------
      if (bIntegraContab) and (bCalculouProRata) then
         if not CAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
                                                   iExercicio, iPeriodo) then
            Raise Exception.Create(CAFxContab.MessageInfo);

      iaPlanilha := -1;
      while not _cds.EOF do
      begin
         if not _cds.FieldByName('PLNCODIGO').IsNull then
         begin
            if iaPlanilha = -1 then
            begin
               iaPlanilha := iaPlanilha + 1;
               SetLength(aPlanilha,iaPlanilha + 1);
               aPlanilha[iaPlanilha] := _cds.FieldByName('PLNCODIGO').AsInteger;
            end else
            if aPlanilha[iaPlanilha] <> _cds.FieldByName('PLNCODIGO').AsFloat then
            begin
               iaPlanilha := iaPlanilha + 1;
               SetLength(aPlanilha,iaPlanilha + 1);
               aPlanilha[iaPlanilha] := _cds.FieldByName('PLNCODIGO').AsInteger;
            end;
         end;
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento na Contabilidade
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         //-------------------------------------------------------------------------------
         // Retira o Link do Histórico com a Planilha Contábil
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE HISTORICOMOVIMENTACAO ' + #13 +
                 ' SET PLNCODIGO = NULL ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                 '   AND DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                 '   AND (TIPDEPPRORATA = 0 OR TIPDEPPRORATA = 1) ' + #13 +
                 '   AND (IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 22 OR IDTIPOMOVIMENTACAO = 34 OR ' + #13 +
                 '        IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 18 OR IDTIPOMOVIMENTACAO = 35 OR ' + #13 +
                 '        IDTIPOMOVIMENTACAO = 21 OR IDTIPOMOVIMENTACAO = 19 OR IDTIPOMOVIMENTACAO = 36 OR ' + #13 +
                 '        IDTIPOMOVIMENTACAO = 99 ) ' + #13 +  //Helen - SOL Nº150414 KINTANA Nº 1092527
                 '   AND FLGRETIFICAREAVAL = 0 ' + #13 +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         if bEstornaContab then
         begin
            for iPlan := 0 to iaPlanilha do
            begin
               if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               begin
                  if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, aPlanilha[iPlan],
                                                                   nModulo, nEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataMov)) then
                  begin
                     MessageInfo := CMTranslate('Estorno da Planilha Contabil não Executado !');
                     Raise Exception.Create(CAFxContab.MessageInfo);
                  end;
               end else
               begin
                  if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, aPlanilha[iPlan],
                                                                  nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                  begin
                     MessageInfo := CMTranslate('Remoção da Planilha Contabil não Executada !');
                     Raise Exception.Create(CAFxContab.MessageInfo);
                  end;
               end;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEMXMOEDA
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      //----------------------------------------------------------------------------------
      // Processa os calculos por moeda
      //----------------------------------------------------------------------------------
      while not FcdsBemxMoeda.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Retorna a Correção Monetária do Custo na Moeda Processada
         //-------------------------------------------------------------------------------
         sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                 '        HM.DATAULTDEP, VM.VALOR ' +
                 ' FROM HISTORICOMOVIMENTACAO HM, ' +
                 '      VLRHISTMOVBEM VM ' +
                 ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
                 '   AND HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') ' +
                 '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1)' + #13 +
                 '   AND HM.IDTIPOMOVIMENTACAO = 15 ' + #13 +
                 '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                 '   AND VM.MOECODIGO = ' + FcdsBemxMoeda.FieldByName('MOECODIGO').AsString + #13 +
                 '   AND VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO ';
         _cds.Data := GetDataPacket( sSQL );
         //-------------------------------------------------------------------------------
         if not _cds.IsEmpty then
         begin
            _dMTFechamento.sqlAtuBemxMoeda.Prepare;
            _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDBEM').AsFloat        := nBem;
            _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDPESSOA').AsFloat     := nEmpresaProp;
            _dMTFechamento.sqlAtuBemxMoeda.ParamByName('MOECODIGO').AsInteger  := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
            _dMTFechamento.sqlAtuBemxMoeda.ParamByName('CMBEM').AsFloat        := FcdsBemxMoeda.FieldByName('CMBEM').asFloat - _cds.FieldByName('VALOR').AsFloat;
            _dMTFechamento.sqlAtuBemxMoeda.ParamByName('DATAULTCM').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
            if not ExecSQL(_dMTFechamento.sqlAtuBemxMoeda.SQLChanged, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Processa os Cálculos por Moeda e Taxa Depreciação
         //-------------------------------------------------------------------------------
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat then
            begin
               //-------------------------------------------------------------------------
               // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
               // Taxa de Depreciação Processadas
               //-------------------------------------------------------------------------
               sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                       '        HM.DATAULTDEP, VM.VALOR ' +
                       ' FROM HISTORICOMOVIMENTACAO HM, ' +
                       '      VLRHISTMOVBEM VM ' +
                       ' WHERE HM.IDBEM    = ' + floattostr(nBem) + #13 +
                       '   AND HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') ' +
                       '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' +
                       '   AND (HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO = 21)' + #13 +
                       '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                       '   AND HM.FLGRETIFICAREAVAL = 0 ' + #13 +
                       '   AND VM.IDTAXADEP = ' + FcdsBemxDep.FieldByName('IDBEMXDEP').AsString + #13 +
                       '   AND VM.MOECODIGO = ' + FcdsBemxDep.FieldByName('MOECODIGO').AsString + #13 +
                       '   AND VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO ' +
                       ' ORDER BY HM.IDTIPOMOVIMENTACAO';
               _cds.Data := GetDataPacket( sSQL );
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação Calculada
                  //----------------------------------------------------------------------
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14 then
                  begin
                     _dMTFechamento.sqlAtuBemxDep2.Prepare;
                     _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDBEM').AsFloat         := nBem;
                     _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDPESSOA').AsFloat      := nEmpresaProp;
                     _dMTFechamento.sqlAtuBemxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                     _dMTFechamento.sqlAtuBemxDep2.ParamByName('DEPLANC').AsFloat       := FcdsBemxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     //-------------------------------------------------------------------
                     if not _cds.FieldByName('DATAULTDEP').IsNull then
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDateTime := StrToDate(_cds.FieldByName('DATAULTDEP').AsString)
                     else
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDateTime := StrToDate(FcdsBem.FieldByName('DATAINICIODEP').AsString);
                     //-------------------------------------------------------------------
                     _dMTFechamento.sqlAtuBemxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                     if not ExecSQL(_dMTFechamento.sqlAtuBemxDep2.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação Calculada
                  //----------------------------------------------------------------------
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21 then
                  begin
                     _dMTFechamento.sqlAtuBemxDep1.Prepare;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDBEM').AsFloat        := nBem;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDPESSOA').AsFloat     := nEmpresaProp;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('MOECODIGO').AsInteger  := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDTAXADEP').AsInteger  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('CMDEP').AsFloat        := FcdsBemxDep.FieldByName('CMDEP').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuBemxDep1.ParamByName('DATAULTCM').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTFechamento.sqlAtuBemxDep1.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  _cds.Next;
               end;
            end;
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Avança para a próxima moeda
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela REAVALIACAO
      //----------------------------------------------------------------------------------
      FcdsReavaliacao.First;
      while not FcdsReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela REAVALXMOEDA
         //-------------------------------------------------------------------------------
         FcdsReavalxMoeda.Locate('IDREAVALIACAO', VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat]),[]);
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat =
                                               FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat) do
         begin
            //----------------------------------------------------------------------------
            // Retorna a Correção Monetária na Moeda Processada
            //----------------------------------------------------------------------------
            sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' + #13 +
                    '        HM.DATAULTDEP, VM.VALOR ' + #13 +
                    ' FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
                    '      VLRHISTMOVBEM VM ' + #13 +
                    ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
                    '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                    '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1)' + #13 +
                    '   AND HM.IDTIPOMOVIMENTACAO = 22 '+ #13 +
                    '   AND HM.IDREAVALACRESC = ' + FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsString + #13 +
                    '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                    '   AND HM.FLGRETIFICAREAVAL = 0 ' + #13 +
                    '   AND VM.MOECODIGO = ' + FcdsReavalxMoeda.FieldByName('MOECODIGO').AsString + #13 +
                    '   AND VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO ';
            _cds.Data := GetDataPacket( sSQL );
            //----------------------------------------------------------------------------
            if not _cds.IsEmpty then
            begin
               _dMTFechamento.sqlAtuReavxMoeda.Prepare;
               _dMTFechamento.sqlAtuReavxMoeda.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger;
               _dMTFechamento.sqlAtuReavxMoeda.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
               _dMTFechamento.sqlAtuReavxMoeda.ParamByName('CMBEM').AsFloat           := FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - _cds.FieldByName('VALOR').AsFloat;
               _dMTFechamento.sqlAtuReavxMoeda.ParamByName('DATAULTCM').AsDateTime    := _cds.FieldByName('DATAULTDEP').AsDateTime;
               if not ExecSQL(_dMTFechamento.sqlAtuReavxMoeda.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa os Cálculos por Moeda e Taxa Depreciação
            //----------------------------------------------------------------------------
            FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO', VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                         FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
            while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat =
                                                FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat) and
                                               (FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat =
                                                FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat) do
            begin
               //-------------------------------------------------------------------------
               // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
               // Taxa de Depreciação Processadas
               //-------------------------------------------------------------------------
               sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' + #13 +
                       '        HM.DATAULTDEP, VM.VALOR ' + #13 +
                       ' FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
                       '      VLRHISTMOVBEM VM ' + #13 +
                       ' WHERE HM.IDBEM    = ' + floattostr(nBem) + #13 +
                       '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                       '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' + #13 +
                       '   AND (HM.IDTIPOMOVIMENTACAO = 18 OR HM.IDTIPOMOVIMENTACAO = 19) ' + #13 +
                       '   AND HM.IDREAVALACRESC = ' + FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsString + #13 +
                       '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                       '   AND HM.FLGRETIFICAREAVAL = 0 ' + #13 +
                       '   AND VM.IDTAXADEP = ' + FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsString + #13 +
                       '   AND VM.MOECODIGO = ' + FcdsReavalxDep.FieldByName('MOECODIGO').AsString + #13 +
                       '   AND VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO ' + #13 +
                       ' ORDER BY HM.IDTIPOMOVIMENTACAO ';
               _cds.Data := GetDataPacket( sSQL );
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação Calculada
                  //----------------------------------------------------------------------
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18 then
                  begin
                     _dMTFechamento.sqlAtuReavxDep2.Prepare;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('DEPLANC').AsFloat         := FcdsReavalxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('DATAULTDEP').AsDateTime   := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     _dMTFechamento.sqlAtuReavxDep2.ParamByName('FLGDEPREC').AsInteger     := 0;
                     if not ExecSQL(_dMTFechamento.sqlAtuReavxDep2.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação Calculada
                  //----------------------------------------------------------------------
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19 then
                  begin
                     _dMTFechamento.sqlAtuReavxDep1.Prepare;
                     _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep1.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                     _dMTFechamento.sqlAtuReavxDep1.ParamByName('CMDEP').AsFloat           := FcdsReavalxDep.FieldByName('CMDEP').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuReavxDep1.ParamByName('DATAULTCM').AsDateTime    := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTFechamento.sqlAtuReavxDep1.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  _cds.Next;
               end;
               FcdsReavalxDep.Next;
            end;
            FcdsReavalxMoeda.Next;
         end;
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      FcdsAcrescimoValor.First;
      while not FcdsAcrescimoValor.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         FcdsAcrescValorxMoeda.Locate('IDACRESCIMO', VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat]),[]);
         while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat =
                                                    FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat) do
         begin
            //----------------------------------------------------------------------------
            // Retorna a Correção Monetária na Moeda Processada
            //----------------------------------------------------------------------------
            sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' + #13 +
                    '        HM.DATAULTDEP, VM.VALOR ' + #13 +
                    ' FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
                    '      VLRHISTMOVBEM VM ' + #13 +
                    ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
                    '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                    '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' + #13 +
                    '   AND HM.IDTIPOMOVIMENTACAO = 34 ' + #13 +
                    '   AND HM.IDREAVALACRESC = ' + FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsString + #13 +
                    '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                    '   AND HM.FLGRETIFICAREAVAL = 0 ' + #13 +
                    '   AND VM.MOECODIGO = ' + FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsString + #13 +
                    '   AND VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO ';
            _cds.Data := GetDataPacket( sSQL );
            //----------------------------------------------------------------------------
            if not _cds.IsEmpty then
            begin
               _dMTFechamento.sqlAtuAcresxMoeda.Prepare;
               _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger;
               _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
               _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('CMBEM').AsFloat         := FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat - _cds.FieldByName('VALOR').AsFloat;
               _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('DATAULTCM').AsDateTime  := _cds.FieldByName('DATAULTDEP').AsDateTime;
               if not ExecSQL(_dMTFechamento.sqlAtuAcresxMoeda.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Posiciona a Tabela AcrescValorxDep
            //----------------------------------------------------------------------------
            FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO', VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat,
                                                                            FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
            while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat =
                                                     FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat) and
                                                    (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat =
                                                     FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat) do

            begin
               //-------------------------------------------------------------------------
               // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
               // Taxa de Depreciação Processadas
               //-------------------------------------------------------------------------
               sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                       '        HM.DATAULTDEP, VM.VALOR ' +
                       ' FROM HISTORICOMOVIMENTACAO HM, ' +
                       '      VLRHISTMOVBEM VM ' +
                       ' WHERE HM.IDBEM = ' + floattostr(nBem) +
                       '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                       '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' +
                       '   AND (HM.IDTIPOMOVIMENTACAO = 35 OR HM.IDTIPOMOVIMENTACAO = 36 OR HM.IDTIPOMOVIMENTACAO = 99) ' + //Helen - SOL Nº150414 KINTANA Nº 1092527
                       '   AND HM.IDREAVALACRESC = ' + FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsString +
                       '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) +
                       '   AND HM.FLGRETIFICAREAVAL = 0 ' + #13 +
                       '   AND VM.IDTAXADEP = ' + FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsString +
                       '   AND VM.MOECODIGO = ' + FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsString +
                       '   AND VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO ' +
                       ' ORDER BY HM.IDTIPOMOVIMENTACAO ';
               _cds.Data := GetDataPacket( sSQL );
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação Calculada
                  //----------------------------------------------------------------------

                  if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35)then
                  begin
                     _dMTFechamento.sqlAtuAcresxDep2.Prepare;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     _dMTFechamento.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                     if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep2.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //Helen SOL Nº 153958 Kintana Nº 1167601 Add a TipoMov = 99
                  if nModulo = 54 then
                  begin
                      if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 99) then
                      begin
                         _dMTFechamento.sqlAtuAcresxDep2.Prepare;
                         _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                         _dMTFechamento.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                         _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                         _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat + _cds.FieldByName('VALOR').AsFloat;
                         _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                         _dMTFechamento.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                         if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep2.SQLChanged, True) then
                            Raise Exception.Create(MessageInfo);
                      end;
                  end;
                  //----------------------------------------------------------------------
                  // Retorna a CM da Depreciação Calculada
                  //----------------------------------------------------------------------
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36 then
                  begin
                     _dMTFechamento.sqlAtuAcresxDep1.Prepare;
                     _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep1.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                     _dMTFechamento.sqlAtuAcresxDep1.ParamByName('CMDEP').AsFloat         := FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuAcresxDep1.ParamByName('DATAULTCM').AsDateTime  := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep1.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  _cds.Next;
               end;
               FcdsAcrescValorxDep.Next;
            end;
            FcdsAcrescValorxMoeda.Next;
         end;
         FcdsAcrescimoValor.Next;
      end;
      //----------------------------------------------------------------------------------
      // Remove o Registro da Depreciação Pró-Rata do Historico de Movimentações
      //----------------------------------------------------------------------------------
      if bCalculouProRata then
      begin
         _dMTBem.sqlRemVlrHistMovBem.Prepare;
         _dMTBem.sqlRemVlrHistMovBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlRemVlrHistMovBem.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlRemVlrHistMovBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         if not ExecSQL(_dMTBem.sqlRemVlrHistMovBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRemHistMovBem.Prepare;
         _dMTBem.sqlRemHistMovBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlRemHistMovBem.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlRemHistMovBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         if not ExecSQL(_dMTBem.sqlRemHistMovBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
// Funções para o Execução de Projeção Futura de Saldo Contabil
//========================================================================================
function TCtrlFechamentoProRata.ExecutarProjecaoBem(nModulo, nEmpresaProp, nBem,
                                                    nMoeCodigo, nIdTaxaDep: Extended;
                                                    dDataMov: TDateTime;
                                                    Var nSomaValOrg, nSomaCmBem,
                                                        nSomaDepLanc, nSomaCmDep : Currency): Boolean;
var
   iFlgDeprec,
   iFatorDec                      : Integer;
   dDataUltDep                    : TDateTime;
   nCmBem, nDepLanc, nCmDep,
   nValValOrg, nValCmBem,
   nValDepLanc, nValCmDep         : Currency;
   nFatorCM, nFatorDep, nTaxaDep,
   nValMin                        : Extended;
   iAno, iMes, iDia               : Word;
   sFatorDec                      : String;
begin
   try
      FcdsBem.Data               := Bem.ListaBem(nEmpresaProp,nBem);
      FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,nBem,nMoeCodigo);
      FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,nBem,nMoeCodigo,nIdTaxaDep);
      FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,nBem);
      FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,nBem,-1,nMoeCodigo);                // Vinicius - 30/04/2007 - Não considerar idReaval
      FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,nBem,-1,nMoeCodigo,nIdTaxaDep);       // Vinicius - 30/04/2007 - Não considerar idReaval
      FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,nBem);
      FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,nBem,-1,nMoeCodigo);           // Vinicius - 30/04/2007 - Não considerar idAcrescimo
      FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,nBem,-1,nMoeCodigo,nIdTaxaDep);  // Vinicius - 30/04/2007 - Não considerar idAcrescimo
      //----------------------------------------------------------------------------------
      try
         nSomaValOrg := 0;
         nSomaCMBem := 0;
         nSomaDepLanc := 0;
         nSomaCMDep := 0;
         nValValOrg := 0;
         nValCmBem := 0;
         nValDepLanc := 0;
         nValCMDep := 0;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         GeraCAFMoedasProp;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while not FcdsBemxMoeda.EOF do
         begin
            nValValOrg := FcdsBemxMoeda.FieldByName('VALORG').AsFloat;
            nValCmBem  := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
            // monetária estiver ativado, processar a correção monetária do custo
            //----------------------------------------------------------------------------
            if (FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
            begin
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo da correção monetária para o BEM
               //-------------------------------------------------------------------------
               nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime);
               //-------------------------------------------------------------------------
               // Calculo da CORRECAO MONETÁRIA DO CUSTO
               // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
               // custo no periodo para a Moeda Oficial
               //-------------------------------------------------------------------------
               if nFatorCM > 0 then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a Correção Monetária do Custo
                  //----------------------------------------------------------------------
                  nCmBem := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + FcdsBemxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                  if abs(nCmBem) >= 0.01 then
                     nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                  //----------------------------------------------------------------------
                  nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
               end;
            end;
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da correção monetária
            // da depreciação acumulada e da depreciação do custo
            //----------------------------------------------------------------------------
            FcdsBemxDep.Locate('MOECODIGO',FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat,[]);
            //----------------------------------------------------------------------------
            // Processa os calculos da DEPRECIAÇÃO e a sua CORREÇÃO MONETÁRIA
            // por Taxa de Depreciação
            //----------------------------------------------------------------------------
            while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger) do
            begin
               nValCmDep   := FcdsBemxDep.FieldByName('CMDEP').AsFloat;
               nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat;
               //-------------------------------------------------------------------------
               // Se a Moeda processada for a oficial e o parâmetro de cálculo da
               // correção monetária estiver ativado, processar a correção monetária da
               // Depreciação Acumulada
               //-------------------------------------------------------------------------
               if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                  (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo da correção monetária
                  //----------------------------------------------------------------------
                  nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime);
                  //----------------------------------------------------------------------
                  if nFatorCM > 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a Correção Monetária da Depreciação Acumulada
                     //-------------------------------------------------------------------
                     nCmDep := (FcdsBemxDep.FieldByName('DEPLANC').AsFloat + FcdsBemxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                     if abs(nCmDep) >= 0.01 then
                        nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                     //-------------------------------------------------------------------
                     nValCmDep := FcdsBemxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Processar a Depreciação do Custo do BEM
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para o BEM
               //-------------------------------------------------------------------------
               if FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime = 0 then
               begin
                  nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       nModulo);
               end else
               begin
                  nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                       FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       nModulo);
               end;
               //-------------------------------------------------------------------------
               // Captura o flag de controle de fim de periodo de depreciação
               //-------------------------------------------------------------------------
               if FcdsBemxDep.FieldByName('FLGDEPREC').IsNull then
                  iFlgDeprec := 0
               else
                  iFlgDeprec := FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger;
               //-------------------------------------------------------------------------
               // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
               // for diferente de zero e a taxa de depreciação for diferente de zero,
               // Calcular o valor a depreciar no periodo.
               //-------------------------------------------------------------------------
               if (iFlgDeprec = 0) and
                  (nFatorDep > 0) and
                  (FcdsBemxDep.FieldByName('TAXADEP').AsFloat > 0) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a quota proporcional de depreciação do bem
                  //----------------------------------------------------------------------
                  nTaxaDep := ((FcdsBemxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                  nDepLanc := (nTaxaDep * (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
                  //----------------------------------------------------------------------
                  // Converte para a Precisão da Moeda
                  //----------------------------------------------------------------------
                  if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                  begin
                     nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                        if ParamCAF.MOEPADRAODECIMAIS > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                     begin
                        nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                           if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        nValMin := 0.01;
                        if abs(nDepLanc) >= nValMin then
                           nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                     abs(FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                  begin
                     nDepLanc := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                  end;
                  //----------------------------------------------------------------------
                  nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Acumula para o Retorno da Função
         //-------------------------------------------------------------------------------
         nSomaValOrg := nSomaValOrg + nValValOrg;
         nSomaCMBem := nSomaCMBem + nValCmBem;
         nSomaDepLanc := nSomaDepLanc + nValDepLanc;
         nSomaCMDep := nSomaCMDep + nValCMDep;

         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária e depreciação
         // REAVALIAÇÃO
         //-------------------------------------------------------------------------------

         // Vinicius - 30/04/2007 - zera as variáveis para acum da reavaliacao.
         nValValOrg := 0;
         nValCmBem := 0;
         nValDepLanc := 0;
         nValCMDep := 0;

         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            FcdsReavalxMoeda.Locate('IDREAVALIACAO',VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger]),[]);
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) do
            begin
               nValValOrg := FcdsReavalxMoeda.FieldByName('VALORG').AsFloat;
               nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
               // monetária estiver ativado, processar a correção monetária do custo
               //-------------------------------------------------------------------------
               if (FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo da correção monetária para o BEM
                  //----------------------------------------------------------------------
                  nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavalxMoeda.FieldByName('DATAULTCM').AsDateTime);
                  //----------------------------------------------------------------------
                  // Calculo da CORRECAO MONETÁRIA DO CUSTO
                  // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
                  // custo no periodo para a Moeda Oficial
                  //----------------------------------------------------------------------
                  if nFatorCM > 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a Correção Monetária do Custo
                     //-------------------------------------------------------------------
                     nCmBem := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                     if abs(nCmBem) >= 0.01 then
                        nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                     //-------------------------------------------------------------------
                     nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Prepara a tabela de custos para o calculo da correção monetária
               // da depreciação acumulada e da depreciação da reavaliacao
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                           FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               //-------------------------------------------------------------------------
               // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
               // por Taxa de Depreciação
               //-------------------------------------------------------------------------
               while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger) and
                                                  (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger) do
               begin
                  nValCmDep   := FcdsReavalxDep.FieldByName('CMDEP').AsFloat;
                  nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat;
                  //----------------------------------------------------------------------
                  // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                  // correção monetária estiver ativado, processar a correção monetária da
                  // Depreciação Acumulada
                  //----------------------------------------------------------------------
                  if (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                     (ParamCAF.FLGCALCCM = 1) then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula o fator de tempo da correção monetária
                     //-------------------------------------------------------------------
                     nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavalxDep.FieldByName('DATAULTCM').AsDateTime);
                     //-------------------------------------------------------------------
                     if nFatorCM > 0 then
                     begin
                        //----------------------------------------------------------------
                        // Calcula a Correção Monetária da Depreciação Acumulada
                        //----------------------------------------------------------------
                        nCmDep := (FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + FcdsReavalxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                        if abs(nCmDep) >= 0.01 then
                           nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                        //----------------------------------------------------------------
                        nValCmDep := FcdsReavalxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo de depreciação para a Reavaliacao
                  //----------------------------------------------------------------------
                  nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                       FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                       nModulo);
                  //----------------------------------------------------------------------
                  // Captura o flag de controle de fim de periodo de depreciação
                  //----------------------------------------------------------------------
                  if FcdsReavalxDep.FieldByName('FLGDEPREC').IsNull then
                     iFlgDeprec := 0
                  else
                     iFlgDeprec := FcdsReavalxDep.FieldByName('FLGDEPREC').AsInteger;
                  //----------------------------------------------------------------------
                  // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                  // for diferente de zero e a taxa de depreciação for diferente de zero,
                  // Calcular o valor a depreciar no periodo.
                  //----------------------------------------------------------------------
                  if (iFlgDeprec = 0) and
                     (nFatorDep > 0) and
                     (FcdsReavalxDep.FieldByName('TAXADEP').AsFloat > 0) then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a quota proporcional de depreciação do bem
                     //-------------------------------------------------------------------
                     nTaxaDep := ((FcdsReavalxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                     nDepLanc := (nTaxaDep * (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
                     //-------------------------------------------------------------------
                     // Converte para a Precisão da Moeda
                     //-------------------------------------------------------------------
                     if FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                     begin
                        nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                           if ParamCAF.MOEPADRAODECIMAIS > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        if FcdsCAFMoedas.Locate('MOECODIGO',FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                        begin
                           nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                           if abs(nDepLanc) >= nValMin then
                           begin
                              iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                              if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                              begin
                                 sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                              end else
                              begin
                                 sFatorDec := '#0';
                              end;
                              nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                           end;
                        end else
                        begin
                           nValMin := 0.01;
                           if abs(nDepLanc) >= nValMin then
                              nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Se o valor calculado para depreciação for superior ao total do custo
                     // de aquisição do bem, ajustar o valor para igualar e setar o flag
                     // de encerramento de periodo de depreciação
                     //-------------------------------------------------------------------
                     if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                        abs(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                     begin
                        nDepLanc := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     end;
                     //-------------------------------------------------------------------
                     nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                  end;
                  //----------------------------------------------------------------------
                  // Avança para a próxima taxa de depreciação x moeda
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima moeda
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            // Acumula para o Retorno da Função
            //----------------------------------------------------------------------------
            nSomaValOrg := nSomaValOrg + nValValOrg;
            nSomaCMBem := nSomaCMBem + nValCmBem;
            nSomaDepLanc := nSomaDepLanc + nValDepLanc;
            nSomaCMDep := nSomaCMDep + nValCMDep;
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // COMPONENTE ACRESCIMO DE VALOR
         //-------------------------------------------------------------------------------
         // Vinicius - 30/04/2007 - zera as variáveis para acum da reavaliacao.
         nValValOrg := 0;
         nValCmBem := 0;
         nValDepLanc := 0;
         nValCMDep := 0;

         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da corr monetária e depreciação
            //----------------------------------------------------------------------------
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger]),[]);
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) do
            begin
               nValValOrg := FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat;
               nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
               // monetária estiver ativado, processar a correção monetária do custo do
               // Acréscimo de Valor
               //-------------------------------------------------------------------------
               if (FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo da correção monetária para o BEM
                  //----------------------------------------------------------------------
                  nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDateTime);
                  //----------------------------------------------------------------------
                  // Calculo da CORRECAO MONETÁRIA DO CUSTO DO ACRÉSCIMO DE VALOR
                  // Se calcula a correção e se a moeda é a oficial -> Calcular a correção
                  // do custo do Acréscimo de Valor no periodo para a Moeda Oficial
                  //----------------------------------------------------------------------
                  if nFatorCM > 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a Correção Monetária do Custo do Acréscimo de Valor
                     //-------------------------------------------------------------------
                     nCmBem := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                     if abs(nCmBem) >= 0.01 then
                        nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                     //-------------------------------------------------------------------
                     nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Prepara a tabela de custos para o calculo da correção monetária
               // da depreciação acumulada e da depreciação da AcrescimoValor
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger,
                                                                              FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
               //-------------------------------------------------------------------------
               // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
               // por Taxa de Depreciação
               //-------------------------------------------------------------------------
               while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger) and
                                                       (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger) do
               begin
                  nValCmDep   := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat;
                  nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat;
                  //----------------------------------------------------------------------
                  // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                  // correção monetária estiver ativado, processar a correção monetária da
                  // Depreciação Acumulada
                  //----------------------------------------------------------------------
                  if (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                     (ParamCAF.FLGCALCCM = 1) then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula o fator de tempo da correção monetária
                     //-------------------------------------------------------------------
                     nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime);
                     //-------------------------------------------------------------------
                     if nFatorCM > 0 then
                     begin
                        //----------------------------------------------------------------
                        // Calcula a Correção Monetária da Depreciação Acumulada
                        //----------------------------------------------------------------
                        nCmDep := (FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                        if abs(nCmDep) >= 0.01 then
                           nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                        //----------------------------------------------------------------
                        nValCmDep := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Processar a Depreciação da AcrescimoValor
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo de depreciação para a AcrescimoValor
                  //----------------------------------------------------------------------
                  nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                       FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime,
                                                       nModulo);
                  //----------------------------------------------------------------------
                  // Captura o flag de controle de fim de periodo de depreciação
                  //----------------------------------------------------------------------
                  if FcdsAcrescValorxDep.FieldByName('FLGDEPREC').IsNull then
                     iFlgDeprec := 0
                  else
                     iFlgDeprec := FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsInteger;
                  //----------------------------------------------------------------------
                  // Se o bem ainda estiver no periodo de depreciação e se o fator
                  // temporal for diferente de zero e a taxa de depreciação for diferente
                  // de zero, Calcular o valor a depreciar no periodo.
                  //----------------------------------------------------------------------
                  if (iFlgDeprec = 0) and
                     (nFatorDep > 0) and
                     (FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat > 0) then
                  begin
                     //-------------------------------------------------------------------
                     // Calcula a quota proporcional de depreciação do bem
                     //-------------------------------------------------------------------
                     nTaxaDep := ((FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                     nDepLanc := (nTaxaDep * (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem));
                     //-------------------------------------------------------------------
                     // Converte para a Precisão da Moeda
                     //-------------------------------------------------------------------
                     if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                     begin
                        nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                           if ParamCAF.MOEPADRAODECIMAIS > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        if FcdsCAFMoedas.Locate('MOECODIGO',FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,[]) then
                        begin
                           nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                           if abs(nDepLanc) >= nValMin then
                           begin
                              iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                              if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                              begin
                                 sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                              end else
                              begin
                                 sFatorDec := '#0';
                              end;
                              nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                           end;
                        end else
                        begin
                           nValMin := 0.01;
                           if abs(nDepLanc) >= nValMin then
                              nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Se o valor calculado para depreciação for superior ao total do
                     // custo de aquisição do bem, ajustar o valor para igualar e setar o
                     // flag de encerramento de periodo de depreciação
                     //-------------------------------------------------------------------
                     if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                        abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                     begin
                        nDepLanc := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     end;
                     //-------------------------------------------------------------------
                     nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                  end;
                  //----------------------------------------------------------------------
                  // Avança para a próxima taxa de depreciação x moeda
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima moeda
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            // Acumula para o Retorno da Função
            //----------------------------------------------------------------------------
            nSomaValOrg := nSomaValOrg + nValValOrg;
            nSomaCMBem := nSomaCMBem + nValCmBem;
            nSomaDepLanc := nSomaDepLanc + nValDepLanc;
            nSomaCMDep := nSomaCMDep + nValCMDep;
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next
         end;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      FcdsBem.Close;
      FcdsBemxMoeda.Close;
      FcdsBemxDep.Close;
      FcdsReavaliacao.Close;
      FcdsReavalxMoeda.Close;
      FcdsReavalxDep.Close;
      FcdsAcrescimoValor.Close;
      FcdsAcrescValorxMoeda.Close;
      FcdsAcrescValorxDep.Close;
   end;
end;
//========================================================================================
// Inicializa o sqlProjSaldo, para contornar limitação do Delphi 5 BDE
//========================================================================================
Procedure TCtrlFechamentoProRata.IniciarsqlProjSaldo(iAnoIni : Integer);
begin
   _dMTFechamento.sqlProjSaldo.SQL.Text := ' SELECT G.IDGRUPO, ' + #13 +
                                           '        A.ANO, '  + #13 +
                                           '        G.CLASSE, ' + #13 +
                                           '        G.NOME AS DESCGRUPO, ' + #13 +
                                           '        G.TIPO AS S_A, ' + #13 +
                                           '        (0.00) AS VALCUSTO, ' + #13 +
                                           '        (0.00) AS VALCMCUSTO, ' + #13 +
                                           '        (0.00) AS VALDEPREC, ' + #13 +
                                           '        (0.00) AS VALCMDEPREC, ' + #13 +
                                           '        (0.00) AS VALSALDO ' + #13 +
                                           ' FROM GRUPO G, ' + #13 +
                                           '      PLANOGRUPO PG, ' + #13 +
                                           '      (SELECT ('+inttostr(iAnoIni)+' + (IDTIPOMOVIMENTACAO - 1)) AS ANO ' + #13 +
                                           '       FROM TIPOMOVIMENTACAO ' + #13 +
                                           '       WHERE IDTIPOMOVIMENTACAO <= :ANOS) A ' + #13 +
                                           ' WHERE PG.IDPESSOA = :IDPESSOA ' + #13 +
                                           '   AND PG.IDGRUPO = G.IDGRUPO ' + #13 +
                                           ' ORDER BY G.CLASSE, A.ANO ';
end;
//========================================================================================
// Funções para o Execução de Projeção Futura de Saldo Contabil
//========================================================================================
function TCtrlFechamentoProRata.ExecutarProjecaoGrupo(nModulo, nEmpresaProp,
                                                      nMoeCodigo, nIdTaxaDep : Extended;
                                                      dDataSld: TDateTime;
                                                      iAnoIni, iAnos : Integer;
                                                      nGrupo : Extended; sGrupo : String;
                                                      iTipoGrupo : Integer): Boolean;
var
   iFlgDeprec, iGrupo,
   iFatorDec                 : Integer;
   dDataUltDep,
   dDataMov, dDataSld9       : TDateTime;
   nCmBem, nDepLanc, nCmDep,
   nValValOrg, nValCmBem,
   nValDepLanc, nValCmDep,
   nSomaGrupoValOrg,
   nSomaGrupoCMBem,
   nSomaGrupoDepLanc,
   nSomaGrupoCMDep           : Currency;
   nFatorCM, nFatorDep,
   nTaxaDep, nValMin         : Extended;
   iAno, iMes, iDia,
   iAnoIni9, iAnoFim9        : Word;
   sFatorDec                 : String;
   
begin
   try
      //----------------------------------------------------------------------------------
      // Ajuste dos Parâmetros
      //----------------------------------------------------------------------------------
      iAnoIni9 := iAnoIni;
      iAnoFim9 := iAnoIni + (iAnos - 1);
      dDataSld9 := EncodeDate(iAnoFim9, 12, 31);
      //----------------------------------------------------------------------------------
      // ClientDataSet com os Resultados
      //----------------------------------------------------------------------------------
      IniciarsqlProjSaldo(iAnoIni9);
      _dMTFechamento.sqlProjSaldo.Prepare;
      _dMTFechamento.sqlProjSaldo.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
      _dMTFechamento.sqlProjSaldo.ParamByName('ANOS').AsInteger   := iAnos;
      FcdsProjSaldo.Data := _dMTFechamento.sqlProjSaldo.Data;
      //----------------------------------------------------------------------------------
      if (nGrupo <> 0) or (sGrupo <> '') then
      begin
         if sGrupo <> '' then
         begin
            _dMTFechamento.sqlProjSaldoBem.SQL.Strings[10] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sGrupo + '%' + #39 + ') ';
            _dMTFechamento.sqlProjSaldoReaval.SQL.Strings[10] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sGrupo + '%' + #39 + ') ';
            _dMTFechamento.sqlProjSaldoAcresc.SQL.Strings[10] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sGrupo + '%' + #39 + ') ';
         end else
         begin
            _dMTFechamento.sqlProjSaldoBem.SQL.Strings[10] := ' AND SB1.IDGRUPO = ' + FloatToStr(nGrupo);
            _dMTFechamento.sqlProjSaldoReaval.SQL.Strings[10] := ' AND SB1.IDGRUPO = ' + FloatToStr(nGrupo);
            _dMTFechamento.sqlProjSaldoAcresc.SQL.Strings[10] := ' AND SB1.IDGRUPO = ' + FloatToStr(nGrupo);
         end;
      end else
      begin
         _dMTFechamento.sqlProjSaldoBem.SQL.Strings[10] := ' ';
         _dMTFechamento.sqlProjSaldoReaval.SQL.Strings[10] := ' ';
         _dMTFechamento.sqlProjSaldoAcresc.SQL.Strings[10] := ' ';
      end;
      //----------------------------------------------------------------------------------
      _dMTFechamento.sqlProjSaldoBem.Prepare;
      _dMTFechamento.sqlProjSaldoBem.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
      _dMTFechamento.sqlProjSaldoBem.ParamByName('MOECODIGO').AsFloat := nMoeCodigo;
      _dMTFechamento.sqlProjSaldoBem.ParamByName('IDTAXADEP').AsFloat := nIdTaxaDep;
      _dMTFechamento.sqlProjSaldoBem.ParamByName('DATASLD').AsDateTime := dDataSld9;
      if iTipoGrupo = 0 then
      begin
         _dMTFechamento.sqlProjSaldoBem.ParamByName('TIPOGRUPO1').AsInteger := 0;
         _dMTFechamento.sqlProjSaldoBem.ParamByName('TIPOGRUPO2').AsInteger := 0;
      end else
      if iTipoGrupo = 1 then
      begin
         _dMTFechamento.sqlProjSaldoBem.ParamByName('TIPOGRUPO1').AsInteger := 1;
         _dMTFechamento.sqlProjSaldoBem.ParamByName('TIPOGRUPO2').AsInteger := 1;
      end else
      begin
         _dMTFechamento.sqlProjSaldoBem.ParamByName('TIPOGRUPO1').AsInteger := 0;
         _dMTFechamento.sqlProjSaldoBem.ParamByName('TIPOGRUPO2').AsInteger := 1;
      end;
      FcdsBem.Data := _dMTFechamento.sqlProjSaldoBem.Data;
      //----------------------------------------------------------------------------------
      _dMTFechamento.sqlProjSaldoReaval.Prepare;
      _dMTFechamento.sqlProjSaldoReaval.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
      _dMTFechamento.sqlProjSaldoReaval.ParamByName('MOECODIGO').AsFloat := nMoeCodigo;
      _dMTFechamento.sqlProjSaldoReaval.ParamByName('IDTAXADEP').AsFloat := nIdTaxaDep;
      _dMTFechamento.sqlProjSaldoReaval.ParamByName('DATASLD').AsDateTime := dDataSld9;
      if iTipoGrupo = 0 then
      begin
         _dMTFechamento.sqlProjSaldoReaval.ParamByName('TIPOGRUPO1').AsInteger := 0;
         _dMTFechamento.sqlProjSaldoReaval.ParamByName('TIPOGRUPO2').AsInteger := 0;
      end else
      if iTipoGrupo = 1 then
      begin
         _dMTFechamento.sqlProjSaldoReaval.ParamByName('TIPOGRUPO1').AsInteger := 1;
         _dMTFechamento.sqlProjSaldoReaval.ParamByName('TIPOGRUPO2').AsInteger := 1;
      end else
      begin
         _dMTFechamento.sqlProjSaldoReaval.ParamByName('TIPOGRUPO1').AsInteger := 0;
         _dMTFechamento.sqlProjSaldoReaval.ParamByName('TIPOGRUPO2').AsInteger := 1;
      end;
      FcdsReavaliacao.Data := _dMTFechamento.sqlProjSaldoReaval.Data;
      //----------------------------------------------------------------------------------
      _dMTFechamento.sqlProjSaldoAcresc.Prepare;
      _dMTFechamento.sqlProjSaldoAcresc.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
      _dMTFechamento.sqlProjSaldoAcresc.ParamByName('MOECODIGO').AsFloat := nMoeCodigo;
      _dMTFechamento.sqlProjSaldoAcresc.ParamByName('IDTAXADEP').AsFloat := nIdTaxaDep;
      _dMTFechamento.sqlProjSaldoAcresc.ParamByName('DATASLD').AsDateTime := dDataSld9;
      if iTipoGrupo = 0 then
      begin
         _dMTFechamento.sqlProjSaldoAcresc.ParamByName('TIPOGRUPO1').AsInteger := 0;
         _dMTFechamento.sqlProjSaldoAcresc.ParamByName('TIPOGRUPO2').AsInteger := 0;
      end else
      if iTipoGrupo = 1 then
      begin
         _dMTFechamento.sqlProjSaldoAcresc.ParamByName('TIPOGRUPO1').AsInteger := 1;
         _dMTFechamento.sqlProjSaldoAcresc.ParamByName('TIPOGRUPO2').AsInteger := 1;
      end else
      begin
         _dMTFechamento.sqlProjSaldoAcresc.ParamByName('TIPOGRUPO1').AsInteger := 0;
         _dMTFechamento.sqlProjSaldoAcresc.ParamByName('TIPOGRUPO2').AsInteger := 1;
      end;
      FcdsAcrescimoValor.Data := _dMTFechamento.sqlProjSaldoAcresc.Data;
      //----------------------------------------------------------------------------------
      try
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         GeraCAFMoedasProp;
         //-------------------------------------------------------------------------------
         // Componente BEM
         //-------------------------------------------------------------------------------
         iAno := iAnoIni9;
         while iAno <= iAnoFim9 do
         begin
            dDataMov := EncodeDate(iAno, 12, 31);
            FcdsBem.First;
            while not FcdsBem.EOF do
            begin
               nSomaGrupoValOrg  := 0;
               nSomaGrupoCMBem   := 0;
               nSomaGrupoDepLanc := 0;
               nSomaGrupoCMDep   := 0;
               iGrupo := FcdsBem.FieldByName('IDGRUPO').AsInteger;
               while not (FcdsBem.EOF) and (FcdsBem.FieldByName('IDGRUPO').AsInteger = iGrupo) do
               begin
                  if FcdsBem.FieldByName('DATAINICIODEP').AsDateTime <= dDataMov then
                  begin
                     nValValOrg := FcdsBem.FieldByName('VALORG').AsFloat;
                     nValCmBem  := FcdsBem.FieldByName('CMBEM').AsFloat;
                     //-------------------------------------------------------------------
                     // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
                     // monetária estiver ativado, processar a correção monetária do custo
                     //-------------------------------------------------------------------
                     if (FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula o fator de tempo da correção monetária para o BEM
                        //----------------------------------------------------------------
                        nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBem.FieldByName('DATAULTCM').AsDateTime);
                        //----------------------------------------------------------------
                        // Calculo da CORRECAO MONETÁRIA DO CUSTO
                        // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
                        // custo no periodo para a Moeda Oficial
                        //----------------------------------------------------------------
                        if nFatorCM > 0 then
                        begin
                           //-------------------------------------------------------------
                           // Calcula a Correção Monetária do Custo
                           //-------------------------------------------------------------
                           nCmBem := (FcdsBem.FieldByName('VALORG').AsFloat + FcdsBem.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                           if abs(nCmBem) >= 0.01 then
                              nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                           //-------------------------------------------------------------
                           nValCmBem := FcdsBem.FieldByName('CMBEM').AsFloat + nCmBem;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Prepara a tabela de custos para o calculo da correção monetária
                     // da depreciação acumulada e da depreciação do custo
                     //-------------------------------------------------------------------
                     nValCmDep   := FcdsBem.FieldByName('CMDEP').AsFloat;
                     nValDepLanc := FcdsBem.FieldByName('DEPLANC').AsFloat;
                     //-------------------------------------------------------------------
                     // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                     // correção monetária estiver ativado, processar a correção monetária da
                     // Depreciação Acumulada
                     //-------------------------------------------------------------------
                     if (FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                        (ParamCAF.FLGCALCCM = 1) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula o fator de tempo da correção monetária
                        //----------------------------------------------------------------
                        nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBem.FieldByName('DATAULTCM').AsDateTime);
                        //----------------------------------------------------------------
                        if nFatorCM > 0 then
                        begin
                           //-------------------------------------------------------------
                           // Calcula a Correção Monetária da Depreciação Acumulada
                           //-------------------------------------------------------------
                           nCmDep := (FcdsBem.FieldByName('DEPLANC').AsFloat + FcdsBem.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                           if abs(nCmDep) >= 0.01 then
                              nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                           //-------------------------------------------------------------
                           nValCmDep := FcdsBem.FieldByName('CMDEP').AsFloat + nCmDep;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Processar a Depreciação do Custo do BEM
                     //-------------------------------------------------------------------
                     // Calcula o fator de tempo de depreciação para o BEM
                     //-------------------------------------------------------------------
                     if FcdsBem.FieldByName('DATAULTDEP').AsDateTime = 0 then
                     begin
                        nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                             FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                             FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                             nModulo);
                     end else
                     begin
                        nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                             FcdsBem.FieldByName('DATAULTDEP').AsDateTime,
                                                             FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                             nModulo);
                     end;
                     //-------------------------------------------------------------------
                     // Captura o flag de controle de fim de periodo de depreciação
                     //-------------------------------------------------------------------
                     if FcdsBem.FieldByName('FLGDEPREC').IsNull then
                        iFlgDeprec := 0
                     else
                        iFlgDeprec := FcdsBem.FieldByName('FLGDEPREC').AsInteger;
                     //-------------------------------------------------------------------
                     // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                     // for diferente de zero e a taxa de depreciação for diferente de zero,
                     // Calcular o valor a depreciar no periodo.
                     //-------------------------------------------------------------------
                     if (iFlgDeprec = 0) and
                        (nFatorDep > 0) and
                        (FcdsBem.FieldByName('TAXADEP').AsFloat > 0) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula a quota proporcional de depreciação do bem
                        //----------------------------------------------------------------
                        nTaxaDep := ((FcdsBem.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                        nDepLanc := (nTaxaDep * (FcdsBem.FieldByName('VALORG').AsFloat + nValCmBem));
                        //----------------------------------------------------------------
                        // Converte para a Precisão da Moeda
                        //----------------------------------------------------------------
                        if FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                        begin
                           nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                           if abs(nDepLanc) >= nValMin then
                           begin
                              iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                              if ParamCAF.MOEPADRAODECIMAIS > 0 then
                              begin
                                 sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                              end else
                              begin
                                 sFatorDec := '#0';
                              end;
                              nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                           end;
                        end else
                        begin
                           if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBem.FieldByName('MOECODIGO').AsInteger,[]) then
                           begin
                              nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                              if abs(nDepLanc) >= nValMin then
                              begin
                                 iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                                 if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                                 begin
                                    sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                                 end else
                                 begin
                                    sFatorDec := '#0';
                                 end;
                                 nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                              end;
                           end else
                           begin
                              nValMin := 0.01;
                              if abs(nDepLanc) >= nValMin then
                                 nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                           end;
                        end;
                        //----------------------------------------------------------------
                        // Se o valor calculado para depreciação for superior ao total do custo
                        // de aquisição do bem, ajustar o valor para igualar e setar o flag
                        // de encerramento de periodo de depreciação
                        //----------------------------------------------------------------
                        if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                           abs(FcdsBem.FieldByName('VALORG').AsFloat + nValCmBem) then
                        begin
                           nDepLanc := (FcdsBem.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                        end;
                        //----------------------------------------------------------------
                        nValDepLanc := FcdsBem.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     end;
                     nSomaGrupoValOrg := ConvNum(nSomaGrupoValOrg + nValValOrg);
                     nSomaGrupoCMBem := ConvNum(nSomaGrupoCMBem + nValCmBem);
                     nSomaGrupoDepLanc := ConvNum(nSomaGrupoDepLanc + nValDepLanc);
                     nSomaGrupoCMDep := ConvNum(nSomaGrupoCMDep + nValCMDep);
                  end;
                  FcdsBem.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra no GRUPO / ANO especifico
               //-------------------------------------------------------------------------
               if FcdsProjSaldo.Locate('IDGRUPO;ANO',VarArrayOf([iGrupo, iAno]),[]) then
               begin
                  FcdsProjSaldo.Edit;
                  FcdsProjSaldo.FieldByName('VALCUSTO').AsCurrency    := ConvNum(FcdsProjSaldo.FieldByName('VALCUSTO').AsCurrency + nSomaGrupoValOrg);
                  FcdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency  := ConvNum(FcdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency + nSomaGrupoCmBem);
                  FcdsProjSaldo.FieldByName('VALDEPREC').AsCurrency   := ConvNum(FcdsProjSaldo.FieldByName('VALDEPREC').AsCurrency + nSomaGrupoDepLanc);
                  FcdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency := ConvNum(FcdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency + nSomaGrupoCmDep);
                  FcdsProjSaldo.FieldByName('VALSALDO').AsCurrency    := ConvNum(FcdsProjSaldo.FieldByName('VALSALDO').AsCurrency +
                                                                                 (nSomaGrupoValOrg + nSomaGrupoCmBem - nSomaGrupoDepLanc - nSomaGrupoCmDep));
                  FcdsProjSaldo.Post;
               end;
            end;
            iAno := iAno + 1;
         end;
         //-------------------------------------------------------------------------------
         // Componente REAVALIAÇÃO
         //-------------------------------------------------------------------------------
         iAno := iAnoIni9;
         while iAno <= iAnoFim9 do
         begin
            dDataMov := EncodeDate(iAno, 12, 31);
            FcdsReavaliacao.First;
            while not FcdsReavaliacao.EOF do
            begin
               nSomaGrupoValOrg := 0;
               nSomaGrupoCMBem := 0;
               nSomaGrupoDepLanc := 0;
               nSomaGrupoCMDep := 0;
               iGrupo := FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger;
               while not (FcdsReavaliacao.EOF) and (FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger = iGrupo) do
               begin
                  if FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime <= dDataMov then
                  begin
                     nValValOrg := FcdsReavaliacao.FieldByName('VALORG').AsFloat;
                     nValCmBem := FcdsReavaliacao.FieldByName('CMBEM').AsFloat;
                     //-------------------------------------------------------------------
                     // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
                     // monetária estiver ativado, processar a correção monetária do custo
                     //-------------------------------------------------------------------
                     if (FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula o fator de tempo da correção monetária para o BEM
                        //----------------------------------------------------------------
                        nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavaliacao.FieldByName('DATAULTCM').AsDateTime);
                        //----------------------------------------------------------------
                        // Calculo da CORRECAO MONETÁRIA DO CUSTO
                        // Se calcula a correção e se a moeda é a oficial -> Calcular a correção do
                        // custo no periodo para a Moeda Oficial
                        //----------------------------------------------------------------
                        if nFatorCM > 0 then
                        begin
                           //-------------------------------------------------------------
                           // Calcula a Correção Monetária do Custo
                           //-------------------------------------------------------------
                           nCmBem := (FcdsReavaliacao.FieldByName('VALORG').AsFloat + FcdsReavaliacao.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                           if abs(nCmBem) >= 0.01 then
                              nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                           //-------------------------------------------------------------
                           nValCmBem := FcdsReavaliacao.FieldByName('CMBEM').AsFloat + nCmBem;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
                     // por Taxa de Depreciação
                     //-------------------------------------------------------------------
                     nValCmDep   := FcdsReavaliacao.FieldByName('CMDEP').AsFloat;
                     nValDepLanc := FcdsReavaliacao.FieldByName('DEPLANC').AsFloat;
                     //-------------------------------------------------------------------
                     // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                     // correção monetária estiver ativado, processar a correção monetária da
                     // Depreciação Acumulada
                     //-------------------------------------------------------------------
                     if (FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                        (ParamCAF.FLGCALCCM = 1) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula o fator de tempo da correção monetária
                        //----------------------------------------------------------------
                        nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavaliacao.FieldByName('DATAULTCM').AsDateTime);
                        //----------------------------------------------------------------
                        if nFatorCM > 0 then
                        begin
                           //-------------------------------------------------------------
                           // Calcula a Correção Monetária da Depreciação Acumulada
                           //-------------------------------------------------------------
                           nCmDep := (FcdsReavaliacao.FieldByName('DEPLANC').AsFloat + FcdsReavaliacao.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                           if abs(nCmDep) >= 0.01 then
                              nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                           //-------------------------------------------------------------
                           nValCmDep := FcdsReavaliacao.FieldByName('CMDEP').AsFloat + nCmDep;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Calcula o fator de tempo de depreciação para a Reavaliacao
                     //-------------------------------------------------------------------
                     nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                          FcdsReavaliacao.FieldByName('DATAULTDEP').AsDateTime,
                                                          FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                          nModulo);
                     //-------------------------------------------------------------------
                     // Captura o flag de controle de fim de periodo de depreciação
                     //-------------------------------------------------------------------
                     if FcdsReavaliacao.FieldByName('FLGDEPREC').IsNull then
                        iFlgDeprec := 0
                     else
                        iFlgDeprec := FcdsReavaliacao.FieldByName('FLGDEPREC').AsInteger;
                     //-------------------------------------------------------------------
                     // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                     // for diferente de zero e a taxa de depreciação for diferente de zero,
                     // Calcular o valor a depreciar no periodo.
                     //-------------------------------------------------------------------
                     if (iFlgDeprec = 0) and
                        (nFatorDep > 0) and
                        (FcdsReavaliacao.FieldByName('TAXADEP').AsFloat > 0) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula a quota proporcional de depreciação do bem
                        //----------------------------------------------------------------
                        nTaxaDep := ((FcdsReavaliacao.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                        nDepLanc := (nTaxaDep * (FcdsReavaliacao.FieldByName('VALORG').AsFloat + nValCmBem));
                        //----------------------------------------------------------------
                        // Converte para a Precisão da Moeda
                        //----------------------------------------------------------------
                        if FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                        begin
                           nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                           if abs(nDepLanc) >= nValMin then
                           begin
                              iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                              if ParamCAF.MOEPADRAODECIMAIS > 0 then
                              begin
                                 sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                              end else
                              begin
                                 sFatorDec := '#0';
                              end;
                              nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                           end;
                        end else
                        begin
                           if FcdsCAFMoedas.Locate('MOECODIGO',FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,[]) then
                           begin
                              nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                              if abs(nDepLanc) >= nValMin then
                              begin
                                 iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                                 if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                                 begin
                                    sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                                 end else
                                 begin
                                    sFatorDec := '#0';
                                 end;
                                 nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                              end;
                           end else
                           begin
                              nValMin := 0.01;
                              if abs(nDepLanc) >= nValMin then
                                 nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                           end;
                        end;
                        //----------------------------------------------------------------
                        // Se o valor calculado para depreciação for superior ao total do
                        // custo de aquisição do bem, ajustar o valor para igualar e setar o
                        // flag de encerramento de periodo de depreciação
                        //----------------------------------------------------------------
                        if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                           abs(FcdsReavaliacao.FieldByName('VALORG').AsFloat + nValCmBem) then
                        begin
                           nDepLanc := (FcdsReavaliacao.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                        end;
                        //----------------------------------------------------------------
                        nValDepLanc := FcdsReavaliacao.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     end;
                     nSomaGrupoValOrg := ConvNum(nSomaGrupoValOrg + nValValOrg);
                     nSomaGrupoCMBem := ConvNum(nSomaGrupoCMBem + nValCmBem);
                     nSomaGrupoDepLanc := ConvNum(nSomaGrupoDepLanc + nValDepLanc);
                     nSomaGrupoCMDep := ConvNum(nSomaGrupoCMDep + nValCMDep);
                  end;
                  //----------------------------------------------------------------------
                  FcdsReavaliacao.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra no GRUPO / ANO especifico
               //-------------------------------------------------------------------------
               if FcdsProjSaldo.Locate('IDGRUPO;ANO',VarArrayOf([iGrupo, iAno]),[]) then
               begin
                  FcdsProjSaldo.Edit;
                  FcdsProjSaldo.Edit;
                  FcdsProjSaldo.FieldByName('VALCUSTO').AsCurrency    := ConvNum(FcdsProjSaldo.FieldByName('VALCUSTO').AsCurrency + nSomaGrupoValOrg);
                  FcdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency  := ConvNum(FcdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency + nSomaGrupoCmBem);
                  FcdsProjSaldo.FieldByName('VALDEPREC').AsCurrency   := ConvNum(FcdsProjSaldo.FieldByName('VALDEPREC').AsCurrency + nSomaGrupoDepLanc);
                  FcdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency := ConvNum(FcdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency + nSomaGrupoCmDep);
                  FcdsProjSaldo.FieldByName('VALSALDO').AsCurrency    := ConvNum(FcdsProjSaldo.FieldByName('VALSALDO').AsCurrency +
                                                                                 (nSomaGrupoValOrg + nSomaGrupoCmBem - nSomaGrupoDepLanc - nSomaGrupoCmDep));
                  FcdsProjSaldo.Post;
               end;
            end;
            iAno := iAno + 1;
         end;
         //-------------------------------------------------------------------------------
         // COMPONENTE ACRESCIMO DE VALOR
         //-------------------------------------------------------------------------------
         iAno := iAnoIni9;
         while iAno <= iAnoFim9 do
         begin
            dDataMov := EncodeDate(iAno, 12, 31);
            FcdsAcrescimoValor.First;
            while not FcdsAcrescimoValor.EOF do
            begin
               nSomaGrupoValOrg := 0;
               nSomaGrupoCMBem := 0;
               nSomaGrupoDepLanc := 0;
               nSomaGrupoCMDep := 0;
               iGrupo := FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger;
               while not (FcdsAcrescimoValor.EOF) and (FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger = iGrupo) do
               begin
                  if FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime <= dDataMov then
                  begin
                     nValValOrg := FcdsAcrescimoValor.FieldByName('VALORG').AsFloat;
                     nValCmBem := FcdsAcrescimoValor.FieldByName('CMBEM').AsFloat;
                     //-------------------------------------------------------------------
                     // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
                     // monetária estiver ativado, processar a correção monetária do custo do
                     // Acréscimo de Valor
                     //-------------------------------------------------------------------
                     if (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula o fator de tempo da correção monetária para o BEM
                        //----------------------------------------------------------------
                        nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescimoValor.FieldByName('DATAULTCM').AsDateTime);
                        //----------------------------------------------------------------
                        // Calculo da CORRECAO MONETÁRIA DO CUSTO DO ACRÉSCIMO DE VALOR
                        // Se calcula a correção e se a moeda é a oficial -> Calcular a correção
                        // do custo do Acréscimo de Valor no periodo para a Moeda Oficial
                        //----------------------------------------------------------------
                        if nFatorCM > 0 then
                        begin
                           //-------------------------------------------------------------
                           // Calcula a Correção Monetária do Custo do Acréscimo de Valor
                           //-------------------------------------------------------------
                           nCmBem := (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + FcdsAcrescimoValor.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                           if abs(nCmBem) >= 0.01 then
                              nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                           //-------------------------------------------------------------
                           nValCmBem := FcdsAcrescimoValor.FieldByName('CMBEM').AsFloat + nCmBem;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Processa os calculos da DEPRECIAÇÃO e da sua CORREÇÃO MONETÁRIA
                     // por Taxa de Depreciação
                     //-------------------------------------------------------------------
                     nValCmDep   := FcdsAcrescimoValor.FieldByName('CMDEP').AsFloat;
                     nValDepLanc := FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat;
                     //-------------------------------------------------------------------
                     // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                     // correção monetária estiver ativado, processar a correção monetária da
                     // Depreciação Acumulada
                     //-------------------------------------------------------------------
                     if (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                        (ParamCAF.FLGCALCCM = 1) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula o fator de tempo da correção monetária
                        //----------------------------------------------------------------
                        nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescimoValor.FieldByName('DATAULTCM').AsDateTime);
                        //----------------------------------------------------------------
                        if nFatorCM > 0 then
                        begin
                           //-------------------------------------------------------------
                           // Calcula a Correção Monetária da Depreciação Acumulada
                           //-------------------------------------------------------------
                           nCmDep := (FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat + FcdsAcrescimoValor.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                           if abs(nCmDep) >= 0.01 then
                              nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                           //-------------------------------------------------------------
                           nValCmDep := FcdsAcrescimoValor.FieldByName('CMDEP').AsFloat + nCmDep;
                        end;
                     end;
                     //-------------------------------------------------------------------
                     // Calcula o fator de tempo de depreciação para a AcrescimoValor
                     //-------------------------------------------------------------------
                     nFatorDep := CalculaFatorDepreciacao(dDataMov,
                                                          FcdsAcrescimoValor.FieldByName('DATAULTDEP').AsDateTime,
                                                          FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime,
                                                          nModulo);
                     //-------------------------------------------------------------------
                     // Captura o flag de controle de fim de periodo de depreciação
                     //-------------------------------------------------------------------
                     if FcdsAcrescimoValor.FieldByName('FLGDEPREC').IsNull then
                        iFlgDeprec := 0
                     else
                        iFlgDeprec := FcdsAcrescimoValor.FieldByName('FLGDEPREC').AsInteger;
                     //-------------------------------------------------------------------
                     // Se o bem ainda estiver no periodo de depreciação e se o fator
                     // temporal for diferente de zero e a taxa de depreciação for diferente
                     // de zero, Calcular o valor a depreciar no periodo.
                     //-------------------------------------------------------------------
                     if (iFlgDeprec = 0) and
                        (nFatorDep > 0) and
                        (FcdsAcrescimoValor.FieldByName('TAXADEP').AsFloat > 0) then
                     begin
                        //----------------------------------------------------------------
                        // Calcula a quota proporcional de depreciação do bem
                        //----------------------------------------------------------------
                        nTaxaDep := ((FcdsAcrescimoValor.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                        nDepLanc := (nTaxaDep * (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + nValCmBem));
                        //----------------------------------------------------------------
                        // Converte para a Precisão da Moeda
                        //----------------------------------------------------------------
                        if FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                        begin
                           nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                           if abs(nDepLanc) >= nValMin then
                           begin
                              iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                              if ParamCAF.MOEPADRAODECIMAIS > 0 then
                              begin
                                 sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                              end else
                              begin
                                 sFatorDec := '#0';
                              end;
                              nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                           end;
                        end else
                        begin
                           if FcdsCAFMoedas.Locate('MOECODIGO',FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger,[]) then
                           begin
                              nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                              if abs(nDepLanc) >= nValMin then
                              begin
                                 iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                                 if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                                 begin
                                    sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                                 end else
                                 begin
                                    sFatorDec := '#0';
                                 end;
                                 nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                              end;
                           end else
                           begin
                              nValMin := 0.01;
                              if abs(nDepLanc) >= nValMin then
                                 nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                           end;
                        end;
                        //----------------------------------------------------------------
                        // Se o valor calculado para depreciação for superior ao total do
                        // custo de aquisição do bem, ajustar o valor para igualar e setar o
                        // flag de encerramento de periodo de depreciação
                        //----------------------------------------------------------------
                        if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                           abs(FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + nValCmBem) then
                        begin
                           nDepLanc := (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                        end;
                        //----------------------------------------------------------------
                        nValDepLanc := FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     end;
                     nSomaGrupoValOrg := ConvNum(nSomaGrupoValOrg + nValValOrg);
                     nSomaGrupoCMBem := ConvNum(nSomaGrupoCMBem + nValCmBem);
                     nSomaGrupoDepLanc := ConvNum(nSomaGrupoDepLanc + nValDepLanc);
                     nSomaGrupoCMDep := ConvNum(nSomaGrupoCMDep + nValCMDep);
                  end;
                  //----------------------------------------------------------------------
                  FcdsAcrescimoValor.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra no GRUPO / ANO especifico
               //-------------------------------------------------------------------------
               if FcdsProjSaldo.Locate('IDGRUPO;ANO',VarArrayOf([iGrupo, iAno]),[]) then
               begin
                  FcdsProjSaldo.Edit;
                  FcdsProjSaldo.FieldByName('VALCUSTO').AsCurrency    := ConvNum(FcdsProjSaldo.FieldByName('VALCUSTO').AsCurrency + nSomaGrupoValOrg);
                  FcdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency  := ConvNum(FcdsProjSaldo.FieldByName('VALCMCUSTO').AsCurrency + nSomaGrupoCmBem);
                  FcdsProjSaldo.FieldByName('VALDEPREC').AsCurrency   := ConvNum(FcdsProjSaldo.FieldByName('VALDEPREC').AsCurrency + nSomaGrupoDepLanc);
                  FcdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency := ConvNum(FcdsProjSaldo.FieldByName('VALCMDEPREC').AsCurrency + nSomaGrupoCmDep);
                  FcdsProjSaldo.FieldByName('VALSALDO').AsCurrency    := ConvNum(FcdsProjSaldo.FieldByName('VALSALDO').AsCurrency +
                                                                                 (nSomaGrupoValOrg + nSomaGrupoCmBem - nSomaGrupoDepLanc - nSomaGrupoCmDep));
                  FcdsProjSaldo.Post;
               end;
            end;
            iAno := iAno + 1;
         end;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      FcdsBem.Close;
      FcdsReavaliacao.Close;
      FcdsAcrescimoValor.Close;
   end;
end;
//========================================================================================
// Função para o Executar a Depreciação Acumulada de um Bem em um Grupo Contábil Diferente
//========================================================================================
function TCtrlFechamentoProRata.CalcularDeprecBemGrupoDif(nModulo, nEmpresaProp, nBem,
                                                          nGrupoDif, nMoeCodigo, nIdTaxaDep: Extended;
                                                          dDataMov, dDataInicioDep : TDateTime): Extended;
var
   iFlgDeprec, iFatorDec   : Integer;
   nDepLanc,
   nValValOrg, nValCmBem,
   nValDepLanc, nValCmDep  : Currency;
   nFatorDep, nTaxaDep,
   nValMin                 : Extended;
   sFatorDec               : String;

begin
   try
      Result := 0;
      FcdsBemxMoeda9.Data := Bem.ListaBemxMoeda(nEmpresaProp,nBem,nMoeCodigo);
      FcdsBemxDep9.Data   := Bem.ListaBemxDep(nEmpresaProp,nBem,nMoeCodigo,nIdTaxaDep);
      //----------------------------------------------------------------------------------
      try
         nValDepLanc := 0;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         GeraCAFMoedasProp;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while not FcdsBemxMoeda9.EOF do
         begin
            nValValOrg := FcdsBemxMoeda9.FieldByName('VALORG').AsFloat;
            nValCmBem  := FcdsBemxMoeda9.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            FcdsBemxDep9.Locate('MOECODIGO',FcdsBemxMoeda9.FieldByName('MOECODIGO').AsFloat,[]);
            //----------------------------------------------------------------------------
            // Processa os calculos da DEPRECIAÇÃO por Taxa de Depreciação
            //----------------------------------------------------------------------------
            while (not FcdsBemxDep9.EOF) and (FcdsBemxDep9.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda9.FieldByName('MOECODIGO').AsInteger) do
            begin
               nValCmDep   := FcdsBemxDep9.FieldByName('CMDEP').AsFloat;
               nValDepLanc := FcdsBemxDep9.FieldByName('DEPLANC').AsFloat;
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para o BEM desde o início
               //-------------------------------------------------------------------------
               nFatorDep := CalculaFatorDepreciacao(dDataMov, dDataInicioDep, dDataInicioDep, nModulo);
               //-------------------------------------------------------------------------
               // Captura o flag de controle de fim de periodo de depreciação
               //-------------------------------------------------------------------------
               if FcdsBemxDep9.FieldByName('FLGDEPREC').IsNull then
                  iFlgDeprec := 0
               else
                  iFlgDeprec := FcdsBemxDep9.FieldByName('FLGDEPREC').AsInteger;
               //-------------------------------------------------------------------------
               FcdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(nGrupoDif,
                                                                      nEmpresaProp,
                                                                      trunc(nIdTaxaDep));
               //-------------------------------------------------------------------------
               // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
               // for diferente de zero e a taxa de depreciação for diferente de zero,
               // Calcular o valor a depreciar no periodo.
               //-------------------------------------------------------------------------
               if (iFlgDeprec = 0) and
                  (nFatorDep > 0) and
                  (FcdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat > 0) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a quota proporcional de depreciação do bem
                  //----------------------------------------------------------------------
                  nTaxaDep := ((FcdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                  nDepLanc := (nTaxaDep * (nValValOrg + nValCmBem));
                  //-------------------------------------------------------------------------
                  // Converte para a Precisão da Moeda
                  //-------------------------------------------------------------------------
                  if FcdsBemxDep9.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                  begin
                     nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                        if ParamCAF.MOEPADRAODECIMAIS > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBemxDep9.FieldByName('MOECODIGO').AsInteger,[]) then
                     begin
                        nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                           if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        nValMin := 0.01;
                        if abs(nDepLanc) >= nValMin then
                           nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if abs(nDepLanc + nValCmDep) >=
                     abs(FcdsBemxMoeda9.FieldByName('VALORG').AsFloat + nValCmBem) then
                  begin
                     nDepLanc := (FcdsBemxMoeda9.FieldByName('VALORG').AsFloat + nValCmBem) - (nDepLanc + nValCmDep);
                  end;
                  //----------------------------------------------------------------------
                  nValDepLanc := nDepLanc;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsBemxDep9.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda9.Next;
         end;
         //-------------------------------------------------------------------------------
         Result := nValDepLanc;
      except
         On E : Exception Do
         begin
            Result := 0;
            MessageInfo := E.Message;
         end;
      end;
   finally
      FcdsBemxMoeda9.Close;
      FcdsBemxDep9.Close;
   end;
end;
//========================================================================================
// Função para o Calcular a Depreciação Acumulada de um Bem/Reavaliacao/Acréscimo
// de Valor usando uma taxa de depreciação diferente (Retificação de Reavaliação)
//========================================================================================
function TCtrlFechamentoProRata.CalcularDeprecBemTaxaDif(nModulo, nEmpresaProp, nBem,
                                                         nMoeCodigo, nIdTaxaDep: Extended;
                                                         dDataMov, dDataInicioDep : TDateTime;
                                                         nNovaTaxaDep : Extended;
                                                         sTipoTab : String;
                                                         nReavalAcresc : Extended): Extended;
var
   iFlgDeprec, iFatorDec   : Integer;
   nDepLanc,
   nValValOrg, nValCmBem,
   nValDepLanc, nValCmDep  : Currency;
   nFatorDep, nTaxaDep,
   nValMin                 : Extended;
   sFatorDec               : String;

begin
   try
      Result := 0;
      //----------------------------------------------------------------------------------
      if sTipoTab = 'B' then
      begin
         FcdsBemxMoeda9.Data := Bem.ListaBemxMoeda(nEmpresaProp,nBem,nMoeCodigo);
         FcdsBemxDep9.Data   := Bem.ListaBemxDep(nEmpresaProp,nBem,nMoeCodigo,nIdTaxaDep);
      end else
      if sTipoTab = 'R' then
      begin
         FcdsBemxMoeda9.Data := Bem.ListaReavalxMoeda(nEmpresaProp,nBem,nReavalAcresc,nMoeCodigo);
         FcdsBemxDep9.Data   := Bem.ListaReavalxDep(nEmpresaProp,nBem,nReavalAcresc,nMoeCodigo,nIdTaxaDep);
      end else
      if sTipoTab = 'A' then
      begin
         FcdsBemxMoeda9.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,nBem,nReavalAcresc,nMoeCodigo);
         FcdsBemxDep9.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,nBem,nReavalAcresc,nMoeCodigo,nIdTaxaDep);
      end;
      //----------------------------------------------------------------------------------
      try
         nValDepLanc := 0;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         GeraCAFMoedasProp;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while not FcdsBemxMoeda9.EOF do
         begin
            nValValOrg := FcdsBemxMoeda9.FieldByName('VALORG').AsFloat;
            nValCmBem  := FcdsBemxMoeda9.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            FcdsBemxDep9.Locate('MOECODIGO',FcdsBemxMoeda9.FieldByName('MOECODIGO').AsFloat,[]);
            //----------------------------------------------------------------------------
            // Processa os cálculos da DEPRECIAÇÃO por Taxa de Depreciação
            //----------------------------------------------------------------------------
            while (not FcdsBemxDep9.EOF) and (FcdsBemxDep9.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda9.FieldByName('MOECODIGO').AsInteger) do
            begin
               nValCmDep   := FcdsBemxDep9.FieldByName('CMDEP').AsFloat;
               nValDepLanc := FcdsBemxDep9.FieldByName('DEPLANC').AsFloat;
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para o BEM desde o início
               //-------------------------------------------------------------------------
               nFatorDep := CalculaFatorDepreciacao(dDataMov, dDataInicioDep, dDataInicioDep, nModulo);
               //-------------------------------------------------------------------------
               // Captura o flag de controle de fim de periodo de depreciação
               //-------------------------------------------------------------------------
               if FcdsBemxDep9.FieldByName('FLGDEPREC').IsNull then
                  iFlgDeprec := 0
               else
                  iFlgDeprec := FcdsBemxDep9.FieldByName('FLGDEPREC').AsInteger;
               //-------------------------------------------------------------------------
               // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
               // for diferente de zero e a taxa de depreciação for diferente de zero,
               // Calcular o valor a depreciar no periodo.
               //-------------------------------------------------------------------------
               if (iFlgDeprec = 0) and (nFatorDep > 0) and (nNovaTaxaDep > 0) then
               begin
                  //----------------------------------------------------------------------
                  // Calcula a quota proporcional de depreciação do bem
                  //----------------------------------------------------------------------
                  nTaxaDep := ((nNovaTaxaDep / 100) * nFatorDep);
                  nDepLanc := (nTaxaDep * (nValValOrg + nValCmBem));
                  //-------------------------------------------------------------------------
                  // Converte para a Precisão da Moeda
                  //-------------------------------------------------------------------------
                  if FcdsBemxDep9.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
                  begin
                     nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
                     if abs(nDepLanc) >= nValMin then
                     begin
                        iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
                        if ParamCAF.MOEPADRAODECIMAIS > 0 then
                        begin
                           sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
                        end else
                        begin
                           sFatorDec := '#0';
                        end;
                        nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                     end;
                  end else
                  begin
                     if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBemxDep9.FieldByName('MOECODIGO').AsInteger,[]) then
                     begin
                        nValMin := 1 / Power(10, abs(FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger));
                        if abs(nDepLanc) >= nValMin then
                        begin
                           iFatorDec := 10 * FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger;
                           if FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger > 0 then
                           begin
                              sFatorDec := '#0.' + StringOfChar('0',FcdsCAFMoedas.FieldByName('NUMDECIMAIS').AsInteger);
                           end else
                           begin
                              sFatorDec := '#0';
                           end;
                           nDepLanc := strtofloat(FormatFloat(sFatorDec,((nDepLanc * iFatorDec) / iFatorDec)));
                        end;
                     end else
                     begin
                        nValMin := 0.01;
                        if abs(nDepLanc) >= nValMin then
                           nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar ao custo
                  //----------------------------------------------------------------------
                  if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                     abs(FcdsBemxMoeda9.FieldByName('VALORG').AsFloat + nValCmBem) then
                  begin
                     nDepLanc := (FcdsBemxMoeda9.FieldByName('VALORG').AsFloat + nValCmBem) - (nDepLanc + nValCmDep);
                  end;
                  //----------------------------------------------------------------------
                  nValDepLanc := nDepLanc;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsBemxDep9.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda9.Next;
         end;
         //-------------------------------------------------------------------------------
         Result := nValDepLanc;
      except
         On E : Exception Do
         begin
            Result := 0;
            MessageInfo := E.Message;
         end;
      end;
   finally
      FcdsBemxMoeda9.Close;
      FcdsBemxDep9.Close;
   end;
end;

function TCtrlFechamentoProRata.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

