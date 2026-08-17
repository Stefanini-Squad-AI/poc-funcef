unit uCtrlMovAcrescimoValor;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina ......: EstornaAcrescimoValor
SOL..........: 205195
Kintana......: 1984996
Data.........: 17/04/2013
Responsável..: Xavier - Azevedo
Descrição....: Ao tentar excluir um documento identifcamos um erro, conforme
               e-mail segue proposta para solução
--------------------------------------------------------------------------------
Rotina ......: ExecutaAcrescimoValor
SOL..........: 153958
Kintana......: 1167601
Data.........: 20/06/2011
Responsável..: Helen V. Bianchi
Descrição....: nmodulo
--------------------------------------------------------------------------------

Rotina ......: ExecutaAcrescimoValor
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Alterada ExecutaAcrescimoValor
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado o campo IDTIPODESPESA
--------------------------------------------------------------------------------
SOL..........: 141302
Kintana......: 890967
Responsável..: Cássio Rovaroto de Camargo
Data.........: 05/08/2010
Descrição....: Alteração na rotina de Estorno de Acréscimo de Valor, para permitir
               o estorno de Decréscimos de Valor
--------------------------------------------------------------------------------}
interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,    
     SysUtils, dbclient, Provider, uMidasUtil,  
     dMTBem, uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uCtrlParamCAF, uCtrlBem, uCtrlHistMovBem, uCtrlCafxContab, uCtrlFechamentoProRata;

Type
   TCtrlMovAcrescimoValor = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbAcrescimoValor    : TDBAcrescimoValor;
      _dbAcrescValorxMoeda : TDBAcrescValorxMoeda;
      _dbAcrescValorxDep   : TDBAcrescValorxDep;

      _dMTBem : tdtmMTBem;

      ParamCAF    : TCtrlParamCAF;
      HistMovBem  : TCtrlHistMovBem;
      CafxContab  : TCtrlCafxContab;
      ProRata     : TCtrlFechamentoProRata;
      Bem         : TCtrlBem;

      bIntegraContab, bCtaxCCusto : Boolean;
      iExercicio, iPeriodo        : Integer;

      FcdsBem: TClientDataSet;
      FcdsBemxMoeda: TClientDataSet;
      FcdsBemxDep: TClientDataSet;
      FcdsReavaliacao: TClientDataSet;
      FcdsReavalxMoeda: TClientDataSet;
      FcdsReavalxDep: TClientDataSet;
      FcdsAcrescimoValor: TClientDataSet;
      FcdsAcrescValorxMoeda: TClientDataSet;
      FcdsAcrescValorxDep: TClientDataSet;

      FIdAcrescimo: Integer;

      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);

      procedure SetIdAcrescimo(const Value: Integer);

      function CMTranslate(sIgor : String) : String;

   Public
      property cdsBem               : TClientDataSet read FcdsBem write SetcdsBem;
      property cdsBemxMoeda         : TClientDataSet read FcdsBemxMoeda write SetcdsBemxMoeda;
      property cdsBemxDep           : TClientDataSet read FcdsBemxDep write SetcdsBemxDep;
      property cdsReavaliacao       : TClientDataSet read FcdsReavaliacao write SetcdsReavaliacao;
      property cdsReavalxMoeda      : TClientDataSet read FcdsReavalxMoeda write SetcdsReavalxMoeda;
      property cdsReavalxDep        : TClientDataSet read FcdsReavalxDep write SetcdsReavalxDep;
      property cdsAcrescimoValor    : TClientDataSet read FcdsAcrescimoValor write SetcdsAcrescimoValor;
      property cdsAcrescValorxMoeda : TClientDataSet read FcdsAcrescValorxMoeda write SetcdsAcrescValorxMoeda;
      property cdsAcrescValorxDep   : TClientDataSet read FcdsAcrescValorxDep write SetcdsAcrescValorxDep;
      //----------------------------------------------------------------------------------
      property IdAcrescimo : Integer read FIdAcrescimo write SetIdAcrescimo;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function CalculaTaxaDep(nDepLanc, nValOrg, nTaxaDepOrg : Extended; dDataMov : tDateTime) : Extended;
      //----------------------------------------------------------------------------------
      function ExecutaAcrescimoValor(nModulo,
                                     nEmpresaProp,
                                     nUsuario,
                                     nBem : Extended;
                                     dDataMov : TDateTime;
                                     iTipoDespesa : Integer;
                                     nValAcres : Extended;
                                     sObsAcres: String;
                                     bLancaDecrescimo : Boolean = False) : Boolean;
      function EstornaAcrescimoValor(nModulo,
                                     nEmpresaProp,
                                     nUsuario,
                                     nBem,
                                     nIdAcrescimo : Extended;
                                     dDataMov,
                                     dDataEst : TDateTime) : Boolean;
   end;

implementation

{ TCtrlMovAcrescimoValor }

constructor TCtrlMovAcrescimoValor.Create;
begin
   inherited;
   _dbAcrescimoValor    := TDBAcrescimoValor.Create(Self);
   _dbAcrescValorxMoeda := TDBAcrescValorxMoeda.Create(Self);
   _dbAcrescValorxDep   := TDBAcrescValorxDep.Create(Self);

   _dMTBem               := tdtmMTBem.Create(Self);

   FcdsBem                := TClientDataSet.Create(nil);
   FcdsBemxMoeda          := TClientDataSet.Create(nil);
   FcdsBemxDep            := TClientDataSet.Create(nil);
   FcdsReavaliacao        := TClientDataSet.Create(nil);
   FcdsReavalxMoeda       := TClientDataSet.Create(nil);
   FcdsReavalxDep         := TClientDataSet.Create(nil);
   FcdsAcrescimoValor     := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda  := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep    := TClientDataSet.Create(nil);

   Bem         := TCtrlBem.Create;
   ParamCAF    := TCtrlParamCAF.Create;
   HistMovBem  := TCtrlHistMovBem.Create;
   CafxContab  := TCtrlCafxContab.Create;
   ProRata     := TCtrlFechamentoProRata.Create(Nil);
end;

destructor TCtrlMovAcrescimoValor.Destroy;
begin
   ProRata.cdsBem               := Nil;
   ProRata.cdsBemxMoeda         := Nil;
   ProRata.cdsBemxDep           := Nil;
   ProRata.cdsReavaliacao       := Nil;
   ProRata.cdsReavalxMoeda      := Nil;
   ProRata.cdsReavalxDep        := Nil;
   ProRata.cdsAcrescimoValor    := Nil;
   ProRata.cdsAcrescValorxMoeda := Nil;
   ProRata.cdsAcrescValorxDep   := Nil;

   Bem.Free;
   ParamCAF.Free;
   HistMovBem.Free;
   CafxContab.Free;
   ProRata.Free;

   _dbAcrescimoValor.Free;
   _dbAcrescValorxMoeda.Free;
   _dbAcrescValorxDep.Free;

   _dMTBem.Free;

   if IsAppServer then
      FreeCDS([FcdsBem, FcdsBemxMoeda, FcdsBemxDep, FcdsReavaliacao, FcdsReavalxMoeda,
               FcdsReavalxDep, FcdsAcrescimoValor, FcdsAcrescValorxMoeda, FcdsAcrescValorxDep]);

   inherited;
end;

procedure TCtrlMovAcrescimoValor.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   ProRata.InitializeAs(Self);
end;

procedure TCtrlMovAcrescimoValor.DoChangeDataBase;
begin
   inherited;
   _dbAcrescimoValor.DataBaseName    := DataBaseName;
   _dbAcrescValorxMoeda.DataBaseName := DataBaseName;
   _dbAcrescValorxDep.DataBaseName   := DataBaseName;
end;

procedure TCtrlMovAcrescimoValor.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlMovAcrescimoValor.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlMovAcrescimoValor.SetIdAcrescimo(const Value: Integer);
begin
  FIdAcrescimo := Value;
end;
//========================================================================================
// Função que executa o Acréscimo de Valor
//========================================================================================
function TCtrlMovAcrescimoValor.ExecutaAcrescimoValor(nModulo,
                                                      nEmpresaProp,
                                                      nUsuario,
                                                      nBem : Extended;
                                                      dDataMov : TDateTime;
                                                      iTipoDespesa : Integer;
                                                      nValAcres : Extended;
                                                      sObsAcres: String;
                                                      bLancaDecrescimo : Boolean = False) : Boolean;
var
   nSeqHist, nTaxaDep,
   nPlanilha, nMoeValAcres  : Extended;
   dDataUltMov, dDataUltDep : TDateTime;
   iFlgPai                  : Integer;
   sSql                     : String;
   sTipoMovimento           : String;
   iTipoMovimento           : Integer;
   rFator                   : Double;
   bTransaction             : Boolean;    // Helen - SOL: 127213 KTN: 672023
   //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
   nValOrg                  : Extended;
begin
   sTipoMovimento := '09';
   iTipoMovimento := 9;
   If bLancaDecrescimo then
   begin
     sTipoMovimento := '95';
     iTipoMovimento := 95;
   end;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaAcrescimoValor(nModulo, nEmpresaProp, nUsuario, nBem,
                                                           dDataMov, iTipoDespesa,
                                                           nValAcres, sObsAcres);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         // Helen - SOL: 127213 KTN: 672023
         bTransaction  := InTransaction;
         if not bTransaction then
            StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os parâmetros obrigatórios para o acréscimo de valor
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!')
         else
            if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if FcdsBem.FieldByName('CONTROLE').AsString = 'F' then
         begin
            MessageInfo := CMTranslate('Bem em Controle Físico!');
            Raise Exception.Create(MessageInfo);
         end else
         if FcdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem em Saída Temporária!');
            Raise Exception.Create(MessageInfo);
         end else
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if dDataMov <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Data do Acréscimo de Valor!'));
        //-------------------------------------------------------------------------------
         if nValAcres <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Valor do Acréscimo de Valor!'));
         //-------------------------------------------------------------------------------
         if sObsAcres = '' then
            Raise Exception.Create(CMTranslate('Informe as informações relativas ao Fato Gerador do Acréscimo de Valor'));
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
          if not Bem.VerificaPeriodoCAF(nEmpresaProp,
                                       nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       sTipoMovimento,         // '09',
                                       dDataMov,
                                       dDataUltMov,
                                       dDataUltDep,
                                       True) then
            Raise Exception.Create(Bem.MessageInfo);  
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            if not CafxContab.VerificaPeriodoContabil(nEmpresaProp,
                                                      dDataMov,
                                                      iExercicio,
                                                      iPeriodo) then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query de montagem da Planilha Contábil
            //----------------------------------------------------------------------------
            if not CafxContab.InicializaMontaContab then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query com a Parametrização contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Lê a Dependencia da Conta Contábil do Centro de Custo
            //----------------------------------------------------------------------------
            bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
         end;
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
         FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp, nBem);
         FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, nBem);
         FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
         FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, nBem);
         FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
         FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
         //-------------------------------------------------------------------------------
         // Link de Dados com a Classe PróRata
         //-------------------------------------------------------------------------------
         ProRata.cdsBem               := FcdsBem;
         ProRata.cdsBemxMoeda         := FcdsBemxMoeda;
         ProRata.cdsBemxDep           := FcdsBemxDep;
         ProRata.cdsReavaliacao       := FcdsReavaliacao;
         ProRata.cdsReavalxMoeda      := FcdsReavalxMoeda;
         ProRata.cdsReavalxDep        := FcdsReavalxDep;
         ProRata.cdsAcrescimoValor    := FcdsAcrescimoValor;
         ProRata.cdsAcrescValorxMoeda := FcdsAcrescValorxMoeda;
         ProRata.cdsAcrescValorxDep   := FcdsAcrescValorxDep;
         //-------------------------------------------------------------------------------
         // Calcula o Fechamento PróRata
         //-------------------------------------------------------------------------------
         if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), 0) then
            Raise Exception.Create(ProRata.MessageInfo);
         //-------------------------------------------------------------------------------
         // Contabiliza o Acréscimo de Valor
         //-------------------------------------------------------------------------------
         nPlanilha := -1;
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Prepara o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CafxContab.ContabilizaAcrescimoValor(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                        FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                        FcdsBem.FieldByName('IDBEM').AsInteger,
                                                        FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                        FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                        FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                        FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                        FcdsBem.FieldByName('PLACA').AsString,
                                                        FcdsBem.FieldByName('DESBEM').AsString,
                                                        FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                        dDataMov,
                                                        nValAcres,
                                                        iExercicio,
                                                        iPeriodo,
                                                        bCtaxCCusto,
                                                        bLancaDecrescimo,
             {//Helen - SOL Nº142550 KINTANA Nº 911790} iTipoDespesa) then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha Contábil
            //----------------------------------------------------------------------------
            nPlanilha := CafxContab.RegistraPlanilhaContabil(FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                             FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                             nUsuario, DateToStr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Inicializa os cds
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, 0);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, 0);
         FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, 0);
         //-------------------------------------------------------------------------------
         // Registra no Histórico
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Append;
         FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat            := FcdsBem.FieldByName('IDBEM').AsFloat;
         FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat         := FcdsBem.FieldByName('IDPESSOA').AsFloat;
         FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime := dDataMov;
         //Helen - SOL Nº142550 KINTANA Nº 911790
         FcdsAcrescimoValor.FieldByName('IDTIPODESPESA').AsFloat    := iTipoDespesa;
         FcdsAcrescimoValor.Post;
         if not ApplyCds(FcdsAcrescimoValor,_dbAcrescimoValor,[],[]) then
            Raise Exception.Create(_dbAcrescimoValor.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra no Histórico
         //-------------------------------------------------------------------------------
         nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,      // IDBEM
                                                   FcdsBem.FieldByName('IDPESSOA').AsFloat,   // IDPESSOA
                                                   FcdsBem.FieldByName('IDMODULO').AsFloat,   // IDMODULO
                                                   iTipoMovimento,                            // IDTIPOMOVIMENTACAO
                                                   dDataMov,                                  // DATAMOVIMENTACAO
                                                   _dbAcrescimoValor.IDACRESCIMO.AsFloat,     // IDREAVALACRESC
                                                   -1,                                        // DATAULTDEP
                                                   -1,                                        // IDGRUPANT
                                                   -1,                                        // IDCONJANT
                                                   -1,                                        // IDLOCALANT
                                                   -1,                                        // IDRESPANT
                                                   -1,                                        // PLACAANT
                                                   nPlanilha,                                 // PLNCODIGO
                                                   '',                                        // OBSREAVAL
                                                    0,                                        // TIPDEPPRORATA
                                                   iTipoDespesa,                              // IDTIPODESPESA
                                                   sObsAcres,                                 // OBSACRESCIMO
                                                   -1,                                        // IDMOTIVOBAIXA
                                                    0,                                        // PROPBAIXA
                                                    0,                                        // VALVENDAOFI
                                                   '');                                       // OBSBAIXA
         if nSeqHist = -1 then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra o id do Histórico no acrescimovalor
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE ACRESCIMOVALOR '+
                 ' SET IDMOVIMENTACAO = ' + FloatToStr(nSeqHist) + ' ' +
                 ' WHERE IDACRESCIMO = ' + FloatToStr(_dbAcrescimoValor.IDACRESCIMO.AsFloat);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra no Histórico
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            if FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat <> ParamCAF.MOEDAOFICIAL then
            begin
                nMoeValAcres := Bem.ConversaoMoeda(nValAcres,
                                                  FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                  dDataMov);
               if nMoeValAcres = 0 then
                  Raise Exception.Create(Bem.MessageInfo);
            end
            else
            begin
               nMoeValAcres := nValAcres;
            end;
            //----------------------------------------------------------------------------
            // Registra o acréscimo de valor na moeda
            //----------------------------------------------------------------------------

            //Bruno Bastos - Sol: 128740 - Kintana: 692106 - 17/06/2010 - Início
            rFator := 1;
            If bLancaDecrescimo then
              rFator := -1;
            //Bruno Bastos - Sol: 128740 - Kintana: 692106 - 17/06/2010 - Fim

            FcdsAcrescValorxMoeda.Append;
            FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat  := _dbAcrescimoValor.IDACRESCIMO.AsFloat;
            FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat    := FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat;
            //Bruno Bastos - Sol: 128740 - Kintana: 692106 - 17/06/2010 - FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat       := nMoeValAcres;
            FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat       := nMoeValAcres * rFator; //Bruno Bastos - Sol: 128740 - Kintana: 692106 - 17/06/2010
            FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDatetime := dDataMov;
            FcdsAcrescValorxMoeda.Post;
            //----------------------------------------------------------------------------
            // Registra o acréscimo de valor na moeda no historico
            //----------------------------------------------------------------------------
            //Bruno Bastos - Sol: 128740 - Kintana: 692106 - 17/06/2010 - Início
            {
            rFator := 1;
            If bLancaDecrescimo then
              rFator := -1;
            }
            //Bruno Bastos - Sol: 128740 - Kintana: 692106 - 17/06/2010 - Fim
            If not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    nMoeValAcres * rFator) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
               begin
                  // Pend ToalPrev 23877 - Vinicius
                  if cdsReavaliacao.IsEmpty then begin
                     nTaxaDep := CalculaTaxaDep((FcdsBemxDep.FieldByName('DEPLANC').AsFloat +
                                                 FcdsBemxDep.FieldByName('CMDEP').AsFloat),
                                                (FcdsBemxMoeda.FieldByName('VALORG').AsFloat +
                                                 FcdsBemxMoeda.FieldByName('CMBEM').AsFloat),
                                                 FcdsBemxDep.FieldByName('TAXADEP').asFloat,
                                                 dDataMov);
                  end else begin
                     cdsReavaliacao.Locate('FLGULTREAVAL',1,[]);   // Localiza a última reavaliação
                     cdsReavalxDep.Locate('IDREAVALIACAO',cdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,[]);   // Posiciona na última reavaliação
                     cdsReavalxMoeda.Locate('IDREAVALIACAO',cdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,[]); // Posiciona na última reavaliação

                    //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387                     
                    nValOrg := 1;
                    if (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat +
                         FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat) <> 0 then
                       nValOrg := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat +
                                                FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat);

                     nTaxaDep := CalculaTaxaDep((FcdsReavalxDep.FieldByName('DEPLANC').AsFloat +
                                                 FcdsReavalxDep.FieldByName('CMDEP').AsFloat),
                                                 //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
                                                 nValOrg,
                                                 FcdsReavalxDep.FieldByName('TAXADEP').asFloat,
                                                 dDataMov);
                  end;
                  //Helen SOL: 153958 Kintana : 1167601
                  if nModulo <> 54 then
                  begin
                    if nTaxaDep < 0 then
                       nTaxaDep := 0;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o acréscimo de valor na moeda x dep
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Append;
                  FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat     := _dbAcrescimoValor.IDACRESCIMO.AsFloat;
                  FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat       := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
                  FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat := FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat;
                  FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat         := nTaxaDep;
                  FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDatetime    := dDataMov;
                  FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDatetime   := dDataMov;
                  FcdsAcrescValorxDep.Post;
                  //----------------------------------------------------------------------
                  // Atualiza o Saldo Contábil do Bem na Moeda x TaxaDep
                  //----------------------------------------------------------------------
                  if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsBem.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                    nMoeValAcres * rFator, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                    FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                    FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                    0, iFlgPai) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
            Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FIdAcrescimo := _dbAcrescimoValor.IDACRESCIMO.AsInteger;
         // Helen - SOL: 127213 KTN: 672023
         if not bTransaction then
            Commit;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception do
         begin
            // Helen - SOL: 127213 KTN: 672023
            if not bTransaction then
               RollBack;
            FIdAcrescimo := -1;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que calcula a TaxaDep baseado no Saldo Contábil
//----------------------------------------------------------------------------------------
function TCtrlMovAcrescimoValor.CalculaTaxaDep(nDepLanc, nValOrg, nTaxaDepOrg : Extended;
                                               dDataMov : tDateTime) : Extended;
var
   iNdias, iTotaldeMeses,
   iTotaldeMesesDeprec       : LongInt;
   nTaxaDiaria, nTaxaMensal  : Extended;
   iDia, iMes, iAno          : Word ;
begin
   if nTaxaDepOrg > 0 then
   begin
      try
         DecodeDate(dDataMov, iAno, iMes, iDia);
         iTotaldeMeses       := trunc((100 / nTaxaDepOrg) * 12);
         iTotaldeMesesDeprec := trunc((nDepLanc / nValOrg) * iTotaldeMeses);
         //-------------------------------------------------------------------------------
         iNDias := ((iTotaldeMeses * 30) - (iTotaldeMesesDeprec * 30)) - (iDia - 1);
         nTaxaDiaria := (100 / iNdias) + 0.000001;
         nTaxaDiaria := strtofloat(FormatFloat('#0.000000',((nTaxaDiaria * 1000000) / 1000000)));
         nTaxaMensal := (nTaxaDiaria * 30) + 0.000001;
         Result      := (nTaxaMensal * 12);
      except
         Raise Exception.Create(CMTranslate('Não foi possível calcular a Taxa de Depreciação para o Acréscimo de Valor! ')+
                                CMTranslate('Valor BEM ')+floattostr(nValOrg)+CMTranslate(' Depreciação BEM ')+floattostr(nDepLanc));
      end;
   end else
   begin
      Result := 0;
   end;
end;
//========================================================================================
// Estorna a Reavaliacao Patrimonial de um bem
//========================================================================================
function TCtrlMovAcrescimoValor.EstornaAcrescimoValor(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                      nIdAcrescimo : Extended;
                                                      dDataMov, dDataEst: TDateTime): Boolean;
var
   iFlgPai        : Integer;
   nPlnCodigo,
   nQtdAcrescimo,
   nMovimentacao  : Extended;
   sSql           : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaAcrescimoValor(nModulo, nEmpresaProp, nUsuario, nBem, nIdAcrescimo,
                                                           dDataMov, dDataEst);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação no bem após o Acrescimo de Valor
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                 ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
            Raise Exception.Create(CMTranslate('Existe movimentação após o acréscimo de valor do bem. Consulte Histórico de Movimentação!'));
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CafxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os parâmetros obrigatórios para o estorno do acréscimo de valor
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!')
         else
            if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if FcdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem em Saída Temporária!');
            Raise Exception.Create(MessageInfo);
         end else
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if nIdAcrescimo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o ACRÉSCIMO DE VALOR que será estornado!'));
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
         FcdsBemxDep.Data := Bem.ListaBemxDep(nEmpresaProp, nBem);
         FcdsReavaliacao.Data := Bem.ListaReavaliacao(nEmpresaProp, nBem);
         FcdsReavalxMoeda.Data := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
         FcdsReavalxDep.Data := Bem.ListaReavalxDep(nEmpresaProp, nBem);
         FcdsAcrescimoValor.Data := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
         FcdsAcrescValorxDep.Data := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
         //-------------------------------------------------------------------------------
         // Se for o unico acrescimo de valor no dia, estorna o fechamento pró-rata
         //-------------------------------------------------------------------------------
         nQtdAcrescimo := 0;
         while not FcdsAcrescimoValor.EOF do
         begin
            if FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime = dDataMov then
               nQtdAcrescimo := nQtdAcrescimo + 1;
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         if nQtdAcrescimo = 1 then
         begin
            //----------------------------------------------------------------------------
            // Link de Dados com a Classe PróRata
            //----------------------------------------------------------------------------
            ProRata.cdsBem               := FcdsBem;
            ProRata.cdsBemxMoeda         := FcdsBemxMoeda;
            ProRata.cdsBemxDep           := FcdsBemxDep;
            ProRata.cdsReavaliacao       := FcdsReavaliacao;
            ProRata.cdsReavalxMoeda      := FcdsReavalxMoeda;
            ProRata.cdsReavalxDep        := FcdsReavalxDep;
            ProRata.cdsAcrescimoValor    := FcdsAcrescimoValor;
            ProRata.cdsAcrescValorxMoeda := FcdsAcrescValorxMoeda;
            ProRata.cdsAcrescValorxDep   := FcdsAcrescValorxDep;
            //----------------------------------------------------------------------------
            // Estorna a Depreciacao PróRata
            //----------------------------------------------------------------------------
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Carrega o registro no Histórico e Captura a Planilha Contábil
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDMOVIMENTACAO, PLNCODIGO ' +
                 ' FROM HISTORICOMOVIMENTACAO'+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDREAVALACRESC = ' + floattostr(nIdAcrescimo) +
                 '   AND ( IDTIPOMOVIMENTACAO = 09 ' +   // SOL 205195
                 //Cássio - SOL Nº  KINTANA Nº - Início
                 '    OR IDTIPOMOVIMENTACAO = 95 ) ' + // 95 -> Decréscimo de Valor // SOL 205195
                 //Cássio - SOL Nº  KINTANA Nº - Fim
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket( sSql );
         if not _cds.IsEmpty then
         begin
            if not _cds.FieldbyName('PLNCODIGO').IsNull then
            begin
               nPlnCodigo := _cds.FieldbyName('PLNCODIGO').AsFloat;
            end else
            begin
               nPlnCodigo := -1;
            end;
            nMovimentacao := _cds.FieldbyName('IDMOVIMENTACAO').AsFloat;
         end else
         begin
            Raise Exception.Create(CMTranslate('Erro ao acessar o historico do acréscimo de valor!'));
         end;
         //-------------------------------------------------------------------------------
         // Retira o link com a Planilha Contábil
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                 ' SET PLNCODIGO = NULL '+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDREAVALACRESC = ' + floattostr(nIdAcrescimo) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                 '   AND ( IDTIPOMOVIMENTACAO = 09 ' +  // SOL 205195
                 //Cássio - SOL Nº  KINTANA Nº - Início
                 '    OR IDTIPOMOVIMENTACAO = 95 ) ' + // 95 -> Decréscimo de Valor  // SOL 205195
                 //Cássio - SOL Nº  KINTANA Nº - Fim
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Estorna as planilhas contábeis
         //-------------------------------------------------------------------------------
         if bIntegraContab and (nPlnCodigo > 0) then
         begin
            //----------------------------------------------------------------------------
            // Estorna / Remove as Planilhas Contábeis
            //----------------------------------------------------------------------------
            if CafxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
            begin
               if not CafxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               begin
                  if not CafxContab.LancaContab.EstornaLancaContab(nUsuario, nPlnCodigo,
                                                                   nModulo, nEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataMov)) then
                  begin
                     Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CafxContab.MessageInfo);
                  end;
               end else
               begin
                  if not CafxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlnCodigo,
                                                                  nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                  begin
                     Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CafxContab.MessageInfo);
                  end;
               end;
            end else
            begin
               Raise Exception.Create(CafxContab.MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Remove o lancamento do acréscimo de valor
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM ACRESCVALORXDEP ' +
                 ' WHERE IDACRESCIMO = ' + floattostr(nIdAcrescimo);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os dados do Acréscimo de Valor do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM ACRESCVALORXMOEDA ' +
                 ' WHERE IDACRESCIMO = ' + floattostr(nIdAcrescimo);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os dados do Acréscimo de Valor do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM ACRESCIMOVALOR ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDACRESCIMO = ' + floattostr(nIdAcrescimo) +
                 '   AND DATAACRESCIMO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os dados do Acréscimo de Valor do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove os Registros do acréscimo de valor no Historico
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                 ' WHERE IDMOVIMENTACAO = ' + floattostr(nMovimentacao);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os valores do acréscimo de valor do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDMOVIMENTACAO = ' + floattostr(nMovimentacao);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover o historico do acréscimo de valor do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            iFlgPai := 1;
            FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsFloat =
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat) do
            begin
               if not Bem.AtualizaSaldoContabBem(Trunc(nEmpresaProp),
                                                 Trunc(nBem),
                                                 (dDataMov - 1),
                                                 FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                 FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                 FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                 FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                 FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                 2, iFlgPai) then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            MessageInfo := E.Message;
            RollBack;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlMovAcrescimoValor.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.


