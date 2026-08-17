//------------------------------------------------------------------------------
//Nº SIG......: 113136
//Data........: 04/07/2022  
//Responsável.: Cássio Florencio Rovaroto 
//Descrição...: Implementação da provisão de custos de imóveis.
//------------------------------------------------------------------------------
unit uCtrlImobMovBaixa;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,    
     SysUtils, dbclient, Provider, uMidasUtil,  
     dMTBem, uDBSelBaixa, uDBSelBaixaBens,
     uDBBem, uDBBemxMoeda, uDBBemxDep,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uCtrlParamCAF, uCtrlBem, uCtrlHistMovBem,
     uCtrlImobCafxContab, uCtrlImobFechamentoProRata,
     uCtrlProvisaoImovel, uModuloImobiliario, UFuncoesImob, DCAF;

Type
   TCtrlImobMovBaixa = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbSelBaixa          : TDBSelBaixa;
      _dbSelBaixaBens      : TDBSelBaixaBens;
      _dbBem               : TDBBem;
      _dbBemxMoeda         : TDBBemxMoeda;
      _dbBemxDep           : TDBBemxDep;
      _dbReavaliacao       : TDBReavaliacao;
      _dbReavalxMoeda      : TDBReavalxMoeda;
      _dbReavalxDep        : TDBReavalxDep;
      _dbAcrescimoValor    : TDBAcrescimoValor;
      _dbAcrescValorxMoeda : TDBAcrescValorxMoeda;
      _dbAcrescValorxDep   : TDBAcrescValorxDep;

      _dMTBem : tdtmMTBem;

      ParamCAF    : TCtrlParamCAF;
      HistMovBem  : TCtrlHistMovBem;
      CafxContab  : TCtrlImobCafxContab;
      ProRata     : TCtrlImobFechamentoProRata;
      Bem         : TCtrlBem;
      ProvisaoImovel : TCtrlProvisaoImovel;

      Fcds: TClientDataSet;
      FcdsSelBaixaBens: TClientDataSet;
      FcdsBem: TClientDataSet;
      FcdsBemxMoeda: TClientDataSet;
      FcdsBemxDep: TClientDataSet;
      FcdsReavaliacao: TClientDataSet;
      FcdsReavalxMoeda: TClientDataSet;
      FcdsReavalxDep: TClientDataSet;
      FcdsAcrescimoValor: TClientDataSet;
      FcdsAcrescValorxMoeda: TClientDataSet;
      FcdsAcrescValorxDep: TClientDataSet;

      //----------------------------------------------------------------------------------
      // Barra de Progresso
      //----------------------------------------------------------------------------------
      iPrgBarPos: Integer;
      iPrgBarMax: Integer;
      sPrgBarMsg: String;

      bIntegraContab : Boolean;
      aHistMovBem : array of Extended;
      iaHistMovBem : Integer;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsSelBaixaBens(const Value: TClientDataSet);
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;
      function RetornaImovelxBem(nIdBem: Extended) : Integer;
      //SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Inicio
      function RetornaGrupo(nIdBem: Extended) : String;
      //SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Fim
   Public
      property cds                  : TClientDataSet read Fcds write Setcds;
      property cdsSelBaixaBens      : TClientDataSet read FcdsSelBaixaBens write SetcdsSelBaixaBens;
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
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ListaSelBaixa(nIdPessoa : Extended; nIdSelBaixa: Extended = -1): OleVariant;
      function ListaSelBaixaBens(nIdPessoa, nIdSelBaixa: Extended; dDataBaixa : TDateTime): OleVariant;
      function ProcurarSELBAIXA(nIdPessoa, nIdSelBaixa: Extended) : OleVariant;
      function ProcurarSELBAIXABENS(nIdPessoa, nIdSelBaixa: Extended) : OleVariant;
      //----------------------------------------------------------------------------------
      function ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                            iMotivoBaixa : Integer;
                            dDataBaixa : TDateTime;
                            iTipoPropBaixa : Integer;
                            nPropBaixar, nValVenda : Extended;
                            sObsBaixa, sPlaContaDestino : String;
                            iTipDepProRata : Integer) : Boolean;
      function EstornaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                            //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
                            dDataMov, dDataEst : TDateTime;
                            bNaoEstornoDevSinal : Boolean = True;
                            bTransaction : Boolean = True) : Boolean;
                            
      //----------------------------------------------------------------------------------
      function ExecutaTermoBaixa(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                 iMotivoBaixa : Integer; dDataBaixa : TDateTime;
                                 iTipoPropBaixa : Integer; nPropBaixar, nValVenda : Extended;
                                 sObsBaixa, sPlaContaDestino : String;
                                 iTipDepProRata : Integer;
                                 sBilhete : String) : Boolean;

      function EstornaTermoBaixa(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                 dDataMov, dDataEst : TDateTime) : Boolean;

      //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
      function EstornaContabilCaf(nUsuario, nPlnCodigo, nModulo, nEmpresaProp : Double;
                                  sDataEstorno : String ) : Boolean;

   end;

implementation

{ TCtrlMovBaixa }

constructor TCtrlImobMovBaixa.Create;
begin
   inherited;
   _dbSelBaixa          := TDbSelBaixa.Create(Self);
   _dbSelBaixaBens      := TDbSelBaixaBens.Create(Self);
   _dbBem               := TDBBem.Create(Self);
   _dbBemxMoeda         := TDBBemxMoeda.Create(Self);
   _dbBemxDep           := TDBBemxDep.Create(Self);
   _dbReavaliacao       := TDBReavaliacao.Create(Self);
   _dbReavalxMoeda      := TDBReavalxMoeda.Create(Self);
   _dbReavalxDep        := TDBReavalxDep.Create(Self);
   _dbAcrescimoValor    := TDBAcrescimoValor.Create(Self);
   _dbAcrescValorxMoeda := TDBAcrescValorxMoeda.Create(Self);
   _dbAcrescValorxDep   := TDBAcrescValorxDep.Create(Self);

   _dMTBem               := tdtmMTBem.Create(Self);

   Fcds                  := TClientDataSet.Create(nil);
   FcdsSelBaixaBens      := TClientDataSet.Create(nil);
   FcdsBem               := TClientDataSet.Create(nil);
   FcdsBemxMoeda         := TClientDataSet.Create(nil);
   FcdsBemxDep           := TClientDataSet.Create(nil);
   FcdsReavaliacao       := TClientDataSet.Create(nil);
   FcdsReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsReavalxDep        := TClientDataSet.Create(nil);
   FcdsAcrescimoValor    := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep   := TClientDataSet.Create(nil);

   Bem         := TCtrlBem.Create;
   ParamCAF    := TCtrlParamCAF.Create;
   HistMovBem  := TCtrlHistMovBem.Create;
   CafxContab  := TCtrlImobCafxContab.Create;
   ProRata     := TCtrlImobFechamentoProRata.Create(Nil);
   ProvisaoImovel := TCtrlProvisaoImovel.Create;
end;

destructor TCtrlImobMovBaixa.Destroy;
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
   FreeAndNil(ProvisaoImovel);

   _dbSelBaixa.Free;
   _dbSelBaixaBens.Free;
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

   if IsAppServer then
      FreeCDS([Fcds, FcdsSelBaixaBens, FcdsBem, FcdsBemxMoeda, FcdsBemxDep,
               FcdsReavaliacao, FcdsReavalxMoeda, FcdsReavalxDep,
               FcdsAcrescimoValor, FcdsAcrescValorxMoeda, FcdsAcrescValorxDep]);
   inherited;
end;

procedure TCtrlImobMovBaixa.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   ProRata.InitializeAs(Self);
   ProvisaoImovel.InitializeAs(Self);
end;

procedure TCtrlImobMovBaixa.DoChangeDataBase;
begin
   inherited;
   _dbSelBaixa.DataBaseName          := DataBaseName;
   _dbSelBaixaBens.DataBaseName      := DataBaseName;
   _dbBem.DataBaseName               := DataBaseName;
   _dbBemxMoeda.DataBaseName         := DataBaseName;
   _dbBemxDep.DataBaseName           := DataBaseName;
   _dbReavaliacao.DataBaseName       := DataBaseName;
   _dbReavalxMoeda.DataBaseName      := DataBaseName;
   _dbReavalxDep.DataBaseName        := DataBaseName;
   _dbAcrescimoValor.DataBaseName    := DataBaseName;
   _dbAcrescValorxMoeda.DataBaseName := DataBaseName;
   _dbAcrescValorxDep.DataBaseName   := DataBaseName;
end;

procedure TCtrlImobMovBaixa.OnCreateAppServer;
begin
   inherited;
   Fcds             := TClientDataSet.Create(nil);
   FcdsSelBaixaBens := TClientDataSet.Create(nil);
end;

procedure TCtrlImobMovBaixa.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsSelBaixaBens(const Value: TClientDataSet);
begin
  FcdsSelBaixaBens := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlImobMovBaixa.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

function TCtrlImobMovBaixa.ProcurarSELBAIXA(nIdPessoa, nIdSelBaixa : Extended): OleVariant;
begin
   _dbSelBaixa.IDSELBAIXA.AsFloat := nIdSelBaixa;
   _dbSelBaixa.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbSelBaixa.sSQLSelect);
end;

function TCtrlImobMovBaixa.ProcurarSELBAIXABENS(nIdPessoa, nIdSelBaixa : Extended): OleVariant;
begin
   _dbSelBaixaBens.IDSELBAIXA.AsFloat := nIdSelBaixa;
   _dbSelBaixaBens.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbSelBaixaBens.sSQLSelect);
end;

function TCtrlImobMovBaixa.ListaSelBaixa(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT ST.IDSELBAIXA, ST.IDPESSOA, ST.SBTIPOMOV, ST.IDDESTINOBAIXA, ST.SBXTERMO, '+ #13 +
           '        ST.SBXPROCESSO, ST.SBXDATA, ST.IDRESPONSAVEL, ST.SBXFLGEXECUTADO, ST.SBXDTAEXECUTADO, ' + #13 +
           '        P.NOME AS NOMERESP, T.NOME AS NOMEDESTINOBAIXA ' + #13 +
           ' FROM SELBAIXA ST, ' + #13 +
           '      PESSOA P, ' + #13 +
           '      PESSOA T  ' + #13 +
           ' WHERE ST.SBTIPOMOV = 0 ' + #13;  // 0 - Baixa, 1 - Transferencia
   //-------------------------------------------------------------------------------------
   if nIdSelBaixa <> -1 then
      sSql := sSql + '   AND ST.IDSELBAIXA = ' + floattostr(nIdSelBaixa) + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND ST.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
                  '   AND ST.IDRESPONSAVEL = P.IDPESSOA(+) ' + #13 +
                  '   AND ST.IDDESTINOBAIXA = T.IDPESSOA(+) ' + #13 +
                  ' ORDER BY ST.SBXDATA, ST.IDSELBAIXA, ST.IDPESSOA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobMovBaixa.ListaSelBaixaBens(nIdPessoa, nIdSelBaixa: Extended; dDataBaixa : TDateTime): OleVariant;
begin
   //-------------------------------------------------------------------------------------
   // Carga dos parâmetros do sistema
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(nIdPessoa) then
   begin
      MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
      Raise Exception.Create(MessageInfo);
   end;
   //-------------------------------------------------------------------------------------
   _dMTBem.sqlListaSelBaixaBens.Prepare;
   _dMTBem.sqlListaSelBaixaBens.ParamByName('IDPESSOA').AsFloat := nIdPessoa;
   _dMTBem.sqlListaSelBaixaBens.ParamByName('IDSELBAIXA').AsFloat := nIdSelBaixa;
   _dMTBem.sqlListaSelBaixaBens.ParamByName('DATASLDBEM').AsDateTime := dDataBaixa;
   _dMTBem.sqlListaSelBaixaBens.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
   _dMTBem.sqlListaSelBaixaBens.ParamByName('IDTAXADEP').AsInteger := 1;
   Result := _dMTBem.sqlListaSelBaixaBens.Data;
end;

function TCtrlImobMovBaixa.AplicaOperacao(sTipoOperacao: String): Boolean;
var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoSELBAIXA(sTipoOperacao,
                                                            Fcds.Data,
                                                            FcdsSelBaixaBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbSelBaixa,[],[]);
            sMensagem := _dbSelBaixa.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsSelBaixaBens,_dbSelBaixaBens,[_dbSelBaixa.IdSelBaixa],[_dbSelBaixaBens.IdSelBaixa]);
            sMensagem := _dbSelBaixaBens.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end else
         //-------------------------------------------------------------------------------
         begin
            Result := ApplyCds(FcdsSelBaixaBens,_dbSelBaixaBens,[_dbSelBaixa.IdSelBaixa],[_dbSelBaixaBens.IdSelBaixa]);
            sMensagem := _dbSelBaixaBens.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbSelBaixa,[],[]);
            sMensagem := _dbSelBaixa.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end;
         //-------------------------------------------------------------------------------
         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa a Baixa de um Bem
//----------------------------------------------------------------------------------------
function TCtrlImobMovBaixa.ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    iMotivoBaixa : Integer;
                                    dDataBaixa : TDateTime;
                                    iTipoPropBaixa : Integer;
                                    nPropBaixar, nValVenda : Extended;
                                    sObsBaixa, sPlaContaDestino : String;
                                    iTipDepProRata : Integer) : Boolean;

var
   iPlanoConta,
   iSeqHist, iaIdHistMov , iAux,
   iExercicio, iPeriodo, iFlgPai                        : Integer;
   sDebito  , sDebitoCM  , sCredito  , sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto, sMensagem                              : String;
   bPlanilha, bTransacao, bCtaxCCusto                   : Boolean;
   nPropResult, nPropOriginal, nPropBaixa,
   nSeqHist, nPlanilha                                  : Extended;
   nSldContabil, nSldCtbImob,
   nDepCmBem, nDepDepLanc, nDepCmDep,
   nValResult,
   nBaixaB, nBaixaD,
   nBaixaCM, nBaixaCMD,
   nValContabB, nValContabCM,
   nValContabD, nValContabCMD                           : Currency;
   aIdHistMov                                           : Array [1..244] of Extended;
   dDataUltMov, dDataUltDep                             : TDateTime;
   //-------------------------------------------------------------------------------------
   iaValOrg                                             : Integer;
   aValOrg                                              : Array of Currency;
   aReavAcresc                                          : Array of Integer;
   nSomaValOrg                                          : Currency;
   bPrimMov                                             : Boolean;
   nIdImovel                                            : Integer;
   //-------------------------------------------------------------------------------------
   //SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Inicio
   sIxbGrupo                                            : String;
   //SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Fim
   cdsProvisaoImovel : TClientDataSet; // Cássio Rovaroto - SIG nº 113136
   dSaldoProvisaoBem : Double;
   wAno, wMes, wDia: Word;
   iHistMovBem : Integer;
   sMsgErro: string;
begin
  cdsProvisaoImovel := TClientDataSet.Create(nil);
  dSaldoProvisaoBem := 0;
  DecodeDate(dDataBaixa, wAno, wMes, wDia);
  try
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem,
                                                  iMotivoBaixa, dDataBaixa, iTipoPropBaixa,
                                                  nPropBaixar, nValVenda, sObsBaixa,
                                                  sPlaContaDestino, iTipDepProRata);
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
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         nIdImovel := RetornaImovelxBem(nBem);

         sIxbGrupo := RetornaGrupo(nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para baixa de bens
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
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
         if FcdsBem.FieldByName('FLGPENHORA').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem Penhorado!');
            Raise Exception.Create(MessageInfo);
         end else
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if iMotivoBaixa <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o MOTIVO DA BAIXA!'));
         //-------------------------------------------------------------------------------
         if iTipoPropBaixa = 0 then
         begin
            if (nPropBaixar <= 0) or (nPropBaixar > 100) then
            begin
               Raise Exception.Create(CMTranslate('Forneça a Proporção Percentual da Baixa ! (')+floattostr(nPropBaixar)+')');
            end;
         end else
         begin
            if nPropBaixar < 0 then
            begin
               Raise Exception.Create(CMTranslate('Valor da baixa parcial inválido!'));
            end;
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '06',
                                       dDataBaixa, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil
         //-------------------------------------------------------------------------------
         if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
         begin
            if not CafxContab.VerificaPeriodoContabil(nEmpresaProp, dDataBaixa,
                                                      iExercicio, iPeriodo) then
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
         // Alimentando os DataSets Filhos com os dados do bem que será baixado
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
         // Atualizar os componentes do saldo contábil das tabelas BemxMoeda e BemxDep
         //-------------------------------------------------------------------------------
         nSomaValOrg := 0; 
         while not FcdsBemxMoeda.EOF do
         begin
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
               begin
                  _dMTBem.sqlBaixaAtuBem.Prepare;
                  _dMTBem.sqlBaixaAtuBem.ParamByName('IDPESSOA').AsFloat    := FcdsBemxMoeda.FieldByName('IDPESSOA').AsFloat;
                  _dMTBem.sqlBaixaAtuBem.ParamByName('IDBEM').AsFloat       := FcdsBemxMoeda.FieldByName('IDBEM').AsFloat;
                  _dMTBem.sqlBaixaAtuBem.ParamByName('DATAMOV').AsDateTime  := dDataBaixa;
                  _dMTBem.sqlBaixaAtuBem.ParamByName('MOECODIGO').AsInteger := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlBaixaAtuBem.ParamByName('IDTAXADEP').AsInteger := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                  _cds.Data := _dMTBem.sqlBaixaAtuBem.Data;
                  //----------------------------------------------------------------------
                  if abs(_cds.FieldByName('VALORG').AsFloat - _cds.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  begin
                     FcdsBemxMoeda.Edit;
                     FcdsBemxMoeda.FieldByName('VALORG').AsFloat := _cds.FieldByName('VALORG0').AsFloat;
                     FcdsBemxMoeda.Post;
                  end;
                  if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     nSomaValOrg := Bem.ConvNum(nSomaValOrg + _cds.FieldByName('VALORG0').AsFloat);
                  //----------------------------------------------------------------------
                  if abs(_cds.FieldByName('CMBEM').AsFloat - _cds.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  begin
                     FcdsBemxMoeda.Edit;
                     FcdsBemxMoeda.FieldByName('CMBEM').AsFloat := _cds.FieldByName('CMBEM0').AsFloat;
                     FcdsBemxMoeda.Post;
                  end;
                  //----------------------------------------------------------------------
                  if abs(_cds.FieldByName('DEPLANC').AsFloat - _cds.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  begin
                     FcdsBemxDep.Edit;
                     FcdsBemxDep.FieldByName('DEPLANC').AsFloat := _cds.FieldByName('DEPLANC0').AsFloat;
                     FcdsBemxDep.Post;
                  end;
                  //----------------------------------------------------------------------
                  if abs(_cds.FieldByName('CMDEP').AsFloat - _cds.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  begin
                     FcdsBemxDep.Edit;
                     FcdsBemxDep.FieldByName('CMDEP').AsFloat := _cds.FieldByName('CMDEP0').AsFloat;
                     FcdsBemxDep.Post;
                  end;
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualizar os componentes do sldcontab nas tabelas ReavalxMoeda e ReavalxDep
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            FcdsReavalxMoeda.First;
            while not FcdsReavalxMoeda.EOF do
            begin
               if (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) then
               begin
                  FcdsReavalxDep.First;
                  while not FcdsReavalxDep.EOF do
                  begin
                     if (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) and
                        (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger) then
                     begin
                        _dMTBem.sqlBaixaAtuReaval.Prepare;
                        _dMTBem.sqlBaixaAtuReaval.ParamByName('IDPESSOA').AsFloat      := FcdsReavalxMoeda.FieldByName('IDPESSOA').AsFloat;
                        _dMTBem.sqlBaixaAtuReaval.ParamByName('IDBEM').AsFloat         := FcdsReavalxMoeda.FieldByName('IDBEM').AsFloat;
                        _dMTBem.sqlBaixaAtuReaval.ParamByName('IDREAVALIACAO').AsFloat := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat;
                        _dMTBem.sqlBaixaAtuReaval.ParamByName('DATAMOV').AsDateTime    := dDataBaixa;
                        _dMTBem.sqlBaixaAtuReaval.ParamByName('MOECODIGO').AsInteger   := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlBaixaAtuReaval.ParamByName('IDTAXADEP').AsInteger   := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                        _cds.Data := _dMTBem.sqlBaixaAtuReaval.Data;
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('VALORG').AsFloat - _cds.FieldByName('VALORG0').AsFloat) >= 0.01 then
                        begin
                           FcdsReavalxMoeda.Edit;
                           FcdsReavalxMoeda.FieldByName('VALORG').AsFloat := _cds.FieldByName('VALORG0').AsFloat;
                           FcdsReavalxMoeda.Post;
                        end;
                        if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                           nSomaValOrg := Bem.ConvNum(nSomaValOrg + _cds.FieldByName('VALORG0').AsFloat);
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('CMBEM').AsFloat - _cds.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                        begin
                           FcdsReavalxMoeda.Edit;
                           FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat := _cds.FieldByName('CMBEM0').AsFloat;
                           FcdsReavalxMoeda.Post;
                        end;
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('DEPLANC').AsFloat - _cds.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                        begin
                           FcdsReavalxDep.Edit;
                           FcdsReavalxDep.FieldByName('DEPLANC').AsFloat := _cds.FieldByName('DEPLANC0').AsFloat;
                           FcdsReavalxDep.Post;
                        end;
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('CMDEP').AsFloat - _cds.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                        begin
                           FcdsReavalxDep.Edit;
                           FcdsReavalxDep.FieldByName('CMDEP').AsFloat := _cds.FieldByName('CMDEP').AsFloat;
                           FcdsReavalxDep.Post;
                        end;
                     end;
                     FcdsReavalxDep.Next;
                  end;
               end;
               FcdsReavalxMoeda.Next;
            end;
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
            Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualizar os componentes do sldcontab nas tabelas AcrescValorxMoeda e
         // AcrescValorxDep
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            FcdsAcrescValorxMoeda.First;
            while not FcdsAcrescValorxMoeda.EOF do
            begin
               if (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) then
               begin
                  FcdsAcrescValorxDep.First;
                  while not FcdsAcrescValorxDep.EOF do
                  begin
                     if (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) and
                        (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger) then
                     begin
                        _dMTBem.sqlBaixaAtuAcresc.Prepare;
                        _dMTBem.sqlBaixaAtuAcresc.ParamByName('IDPESSOA').AsFloat    := FcdsAcrescValorxMoeda.FieldByName('IDPESSOA').AsFloat;
                        _dMTBem.sqlBaixaAtuAcresc.ParamByName('IDBEM').AsFloat       := FcdsAcrescValorxMoeda.FieldByName('IDBEM').AsFloat;
                        _dMTBem.sqlBaixaAtuAcresc.ParamByName('IDACRESCIMO').AsFloat := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat;
                        _dMTBem.sqlBaixaAtuAcresc.ParamByName('DATAMOV').AsDateTime  := dDataBaixa;
                        _dMTBem.sqlBaixaAtuAcresc.ParamByName('MOECODIGO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlBaixaAtuAcresc.ParamByName('IDTAXADEP').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _cds.Data := _dMTBem.sqlBaixaAtuAcresc.Data;
                        //----------------------------------------------------------------
                        if (abs(_cds.FieldByName('VALORG').AsFloat - _cds.FieldByName('VALORG0').AsFloat) >= 0.01)
                          and (_cds.FieldByName('VALORG').AsFloat > 0) then //Bruno Bastos - Sol: 128740 - Kintana: 692106
                        begin
                           FcdsAcrescValorxMoeda.Edit;
                           FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat := _cds.FieldByName('VALORG0').AsFloat;
                           FcdsAcrescValorxMoeda.Post;
                        end;
                        if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                           nSomaValOrg := Bem.ConvNum(nSomaValOrg + _cds.FieldByName('VALORG0').AsFloat);
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('CMBEM').AsFloat - _cds.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                        begin
                           FcdsAcrescValorxMoeda.Edit;
                           FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat := _cds.FieldByName('CMBEM0').AsFloat;
                           FcdsAcrescValorxMoeda.Post;
                        end;
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('DEPLANC').AsFloat - _cds.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                        begin
                           FcdsAcrescValorxDep.Edit;
                           FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := _cds.FieldByName('DEPLANC0').AsFloat;
                           FcdsAcrescValorxDep.Post;
                        end;
                        //----------------------------------------------------------------
                        if abs(_cds.FieldByName('CMDEP').AsFloat - _cds.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                        begin
                           FcdsAcrescValorxDep.Edit;
                           FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat := _cds.FieldByName('CMDEP').AsFloat;
                           FcdsAcrescValorxDep.Post;
                        end;
                     end;
                     FcdsAcrescValorxDep.Next;
                  end;
               end;
               FcdsAcrescValorxMoeda.Next;
            end;
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
            Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
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
         // Calcula a Depreciacao até o Dia da Movimentacao - 1
         //-------------------------------------------------------------------------------
         if (FcdsBem.FieldByName('CONTROLE').AsString = 'T') and (iTipDepProRata < 2) then
         begin
            if iTipDepProRata = 0 then
            begin
               if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataBaixa - 1), iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end else
            begin
               if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, dDataBaixa, iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end;       
         end;
         //-------------------------------------------------------------------------------
//SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Inicio
// se for do tipo "instalação" só verifica o campo baixa total, já que o sistema não trata este tipo de bem
         if sIxbGrupo = 'I' then
         begin
            if (FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S') then
            Raise Exception.Create(CMTranslate('Bem ') + trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   inttostr(FcdsBem.FieldByName('PLACA').AsInteger) + CMTranslate(' já Baixado !'));
         end
         else
            if ((FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S') or
                (FcdsBem.FieldByName('PROPBAIXA').AsFloat = 100)) then
            Raise Exception.Create(CMTranslate('Bem ') + trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   inttostr(FcdsBem.FieldByName('PLACA').AsInteger) + CMTranslate(' já Baixado !'));
//SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Fim
         //-------------------------------------------------------------------------------
         // Calcula o Lucro e/ou Prejuizo da Operação
         //-------------------------------------------------------------------------------
         if (nValVenda <> 0) or (iTipoPropBaixa = 1) then
            nSldContabil := Bem.SaldoContabil(trunc(nEmpresaProp), trunc(nBem), dDataBaixa,
                                              ParamCAF.MOEDAOFICIAL, 1)
         else
            nSldContabil := 0;
         //-------------------------------------------------------------------------------
         nValResult := nValVenda - nSldContabil;
         //-------------------------------------------------------------------------------
         // Realiza o calculo da proporção unificado, independente da opção informada
         // Os valores base serão sempre na moeda x taxadep primários
         //-------------------------------------------------------------------------------
         nPropBaixa := nPropBaixar;
         if iTipoPropBaixa = 1 then
         begin
            if nSldContabil <> 0 then
            begin
               nPropBaixa := (nPropBaixar / nSldContabil) * 100 ;
               if (nPropBaixa < 0) or (nPropBaixa > 100) then
                  Raise Exception.Create(CMTranslate('O valor informado para baixa parcial sobre o Saldo Contábil está acima ')+#13+
                                         CMTranslate('do Saldo contábil do bem no dia da baixa (')+FormatFloat('#0.00',nSldContabil)+')');
            end else
            begin
               nPropBaixa := 100;
            end;
         end else
         if iTipoPropBaixa = 2 then
         begin
            if nSomaValOrg >= nPropBaixar then
            begin
               nPropBaixa := (nPropBaixar / nSomaValOrg) * 100 ;
               if (nPropBaixa < 0) or (nPropBaixa > 100) then
                  Raise Exception.Create(CMTranslate('O valor informado para baixa parcial sobre Custo Aquisição está acima ') + #13 +
                                         CMTranslate('do Custo Aquisição do bem no dia da baixa (')+FormatFloat('#0.00',nSomaValOrg)+')');
            end else
            begin
               nPropBaixa := 100;
            end;
         end;
         nPropOriginal := (100 - FcdsBem.FieldByName('PROPBAIXA').AsFloat) * (nPropBaixa / 100);
         //-------------------------------------------------------------------------------
         iaIdHistMov   := 0;
         nValContabB   := 0;
         nValContabCM  := 0;
         nValContabD   := 0;
         nValContabCMD := 0;
         //-------------------------------------------------------------------------------
         // Realiza a baixa do custo de aquisicao
         //-------------------------------------------------------------------------------
         nSeqHist := 0;
         bPrimMov := True;
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            if bPrimMov then
            begin
               //-------------------------------------------------------------------------
               // Registra na tabela HISTORICOMOVIMENTACAO
               //-------------------------------------------------------------------------
               nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                         FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                         FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                         06,                                      // IDTIPOMOVIMENTACAO
                                                         dDataBaixa,                              // DATAMOVIMENTACAO
                                                         -1,                                      // IDREAVALACRESC
                                                         -1,                                      // DATAULTDEP
                                                         -1,                                      // IDGRUPANT
                                                         -1,                                      // IDCONJANT
                                                         -1,                                      // IDLOCALANT
                                                         -1,                                      // IDRESPANT
                                                         -1,                                      // PLACAANT
                                                         -1,                                      // PLNCODIGO
                                                         '',                                      // OBSREAVAL
                                                         iTipDepProRata,                          // TIPDEPPRORATA
                                                         -1,                                      // IDTIPODESPESA
                                                         '',                                      // OBSACRESCIMO
                                                         iMotivoBaixa,                            // IDMOTIVOBAIXA
                                                         nPropOriginal,                           // PROPBAIXA
                                                         nValVenda,                               // VALVENDAOFI
                                                         sObsBaixa);                              // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               inc(iaIdHistMov);
               aIdHistMov[iaIdHistMov] := nSeqHist;
               //-------------------------------------------------------------------------
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            nBaixaB  := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    nBaixaB) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Baixa em BemxMoeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Edit;
            FcdsBemxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
            FcdsBemxMoeda.Post;
            //----------------------------------------------------------------------------
            // Captura valor para Contabilização se for MoedaOficial
            //----------------------------------------------------------------------------
            if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
               nValContabB  := nBaixaB;
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
         end;
         if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM do custo de aquisicao
         //-------------------------------------------------------------------------------
         nSeqHist := 0;
         bPrimMov := True;
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            nBaixaCM := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').asFloat) * (nPropBaixa / 100);
            if nBaixaCM <> 0 then
            begin
               if bPrimMov then
               begin
                  //-------------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //-------------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                            25,                                      // IDTIPOMOVIMENTACAO
                                                            dDataBaixa,                              // DATAMOVIMENTACAO
                                                            -1,                                      // IDREAVALACRESC
                                                            -1,                                      // DATAULTDEP
                                                            -1,                                      // IDGRUPANT
                                                            -1,                                      // IDCONJANT
                                                            -1,                                      // IDLOCALANT
                                                            -1,                                      // IDRESPANT
                                                            -1,                                      // PLACAANT
                                                            -1,                                      // PLNCODIGO
                                                            '',                                      // OBSREAVAL
                                                            iTipDepProRata,                          // TIPDEPPRORATA
                                                            -1,                                      // IDTIPODESPESA
                                                            '',                                      // OBSACRESCIMO
                                                            -1,                                      // IDMOTIVOBAIXA
                                                             0,                                       // PROPBAIXA
                                                             0,                                     // VALVENDAOFI
                                                            '');                                     // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  inc(iaIdHistMov);
                  aIdHistMov[iaIdHistMov] := nSeqHist;
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       nBaixaCM) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em BemxMoeda
               //-------------------------------------------------------------------------
               FcdsBemxMoeda.Edit;
               FcdsBemxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
               FcdsBemxMoeda.Post;
            end;
            //----------------------------------------------------------------------------
            // Captura valor para Contabilização se for MoedaOficial
            //----------------------------------------------------------------------------
            if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
               nValContabCM := nBaixaCM;
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
         end;
         if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         // Realiza a baixa da Depreciação do Custo de Aquisicao
         //-------------------------------------------------------------------------------
         bPrimMov := True;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            //----------------------------------------------------------------------------
            // Processa a proporção por Valor sobre o Custo de Aquisição
            //----------------------------------------------------------------------------
            if iTipoPropBaixa = 2 then
            begin
               ProRata.FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                              VarArrayOf([0,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[]);
               nBaixaD   := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat -
                                    ProRata.FcdsLancProRata.FieldByName('VALDEP').AsFloat) * (nPropBaixa / 100) +
                            (ProRata.FcdsLancProRata.FieldByName('VALDEP').AsFloat * (nPropBaixa / 100));
            end else
            begin
               nBaixaD   := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
            end;
            //----------------------------------------------------------------------------
            if nBaixaD <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                            24,                                      // IDTIPOMOVIMENTACAO
                                                            dDataBaixa,                              // DATAMOVIMENTACAO
                                                            -1,                                      // IDREAVALACRESC
                                                            -1,                                      // DATAULTDEP
                                                            -1,                                      // IDGRUPANT
                                                            -1,                                      // IDCONJANT
                                                            -1,                                      // IDLOCALANT
                                                            -1,                                      // IDRESPANT
                                                            -1,                                      // PLACAANT
                                                            -1,                                      // PLNCODIGO
                                                            '',                                      // OBSREAVAL
                                                            iTipDepProRata,                          // TIPDEPPRORATA
                                                            -1,                                      // IDTIPODESPESA
                                                            '',                                      // OBSACRESCIMO
                                                            -1,                                      // IDMOTIVOBAIXA
                                                             0,                                      // PROPBAIXA
                                                             0,                                     // VALVENDAOFI
                                                            '');                                     // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  inc(iaIdHistMov);
                  aIdHistMov[iaIdHistMov] := nSeqHist;
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                       nBaixaD) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em BemxDep
               //-------------------------------------------------------------------------
               FcdsBemxDep.Edit;
               FcdsBemxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
               FcdsBemxDep.Post;
            end;
            //----------------------------------------------------------------------------
            // Captura valor para Contabilização se for MoedaOficial
            //----------------------------------------------------------------------------
            if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
               (FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = 1) then
               nValContabD := nBaixaD;
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM da Depreciação do Custo de Aquisicao
         //-------------------------------------------------------------------------------
         bPrimMov := True;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            //----------------------------------------------------------------------------
            // Processa a proporção por Valor sobre o Custo de Aquisição
            //----------------------------------------------------------------------------
            if iTipoPropBaixa = 2 then
            begin
               ProRata.FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                              VarArrayOf([0,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[]);
               nBaixaCMD := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat -
                                    ProRata.FcdsLancProRata.FieldByName('VALCMDEP').AsFloat) * (nPropBaixa / 100) +
                            (ProRata.FcdsLancProRata.FieldByName('VALCMDEP').AsFloat * (nPropBaixa / 100));
            end else
            begin
               nBaixaCMD := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
            end;
            //----------------------------------------------------------------------------
            if nBaixaCMD <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                            26,                                      // IDTIPOMOVIMENTACAO
                                                            dDataBaixa,                              // DATAMOVIMENTACAO
                                                            -1,                                      // IDREAVALACRESC
                                                            -1,                                      // DATAULTDEP
                                                            -1,                                      // IDGRUPANT
                                                            -1,                                      // IDCONJANT
                                                            -1,                                      // IDLOCALANT
                                                            -1,                                      // IDRESPANT
                                                            -1,                                      // PLACAANT
                                                            -1,                                      // PLNCODIGO
                                                            '',                                      // OBSREAVAL
                                                            iTipDepProRata,                          // TIPDEPPRORATA
                                                            -1,                                      // IDTIPODESPESA
                                                            '',                                      // OBSACRESCIMO
                                                            -1,                                      // IDMOTIVOBAIXA
                                                             0,                                      // PROPBAIXA
                                                             0,                                      // VALVENDAOFI
                                                            '');                                     // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  inc(iaIdHistMov);
                  aIdHistMov[iaIdHistMov] := nSeqHist;
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                       nBaixaCMD) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em BemxDep
               //-------------------------------------------------------------------------
               FcdsBemxDep.Edit;
               FcdsBemxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
               FcdsBemxDep.Post;
            end;
            //----------------------------------------------------------------------------
            // Captura valor para Contabilização se for MoedaOficial
            //----------------------------------------------------------------------------
            if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
               (FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = 1) then
               nValContabCMD := nBaixaCMD;
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Lançamento Contábil da Baixa do Custo
         //-------------------------------------------------------------------------------
         if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
         begin
            //----------------------------------------------------------------------------
            // Alimenta o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CafxContab.ContabilizaBaixa(nModulo, nEmpresaProp, nBem, dDataBaixa,
                                               FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                               FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                               FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                               FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                               nValContabB,nValContabCM,nValContabD,nValContabCMD,
                                               'B',
                                               FcdsBem.FieldByName('DESBEM').AsString,
                                               FcdsBem.FieldByName('PLACA').AsString,
                                               FcdsBem.FieldByName('DESCGRUPO').AsString,
                                               sPlaContaDestino,
                                               iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes nos Flags de Controle
         //-------------------------------------------------------------------------------
         FcdsBem.Edit;
         FcdsBem.FieldByName('PROPBAIXA').AsFloat := FcdsBem.FieldByName('PROPBAIXA').AsFloat + nPropOriginal;
         if FcdsBem.FieldByName('PROPBAIXA').AsFloat < 100 then
            FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N'
         else
            FcdsBem.FieldByName('BAIXATOTAL').AsString := 'S';
         FcdsBem.Post;
         if not ApplyCds(FcdsBem,_dbBem,[],[]) then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         nValContabB   := 0;
         nValContabCM  := 0;
         nValContabD   := 0;
         nValContabCMD := 0;
         //-------------------------------------------------------------------------------
         // Realiza a baixa das reavaliações
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            bPrimMov := True;
            FcdsReavalxMoeda.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
            begin
               nBaixaB  := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
               if nBaixaB <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(nBem,                                                  // IDBEM
                                                               nEmpresaProp,                                          // IDPESSOA
                                                               nModulo,                                               // IDMODULO
                                                               20,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                            // DATAMOVIMENTACAO
                                                               FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
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
                                                                0,                                                    // PROPBAIXA
                                                                0,                                                    // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nBaixaB) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em ReavalxMoeda
                  //----------------------------------------------------------------------
                  FcdsReavalxMoeda.Edit;
                  FcdsReavalxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
                  FcdsReavalxMoeda.Post;
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     nValContabB := nValContabB + nBaixaB;
               end;
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Next;
            end;
            if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM das reavaliações
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            bPrimMov := True;
            FcdsReavalxMoeda.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
            begin
               nBaixaCM := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat) * (nPropBaixa / 100);
               if nBaixaCM <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                               28,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                            // DATAMOVIMENTACAO
                                                               FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
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
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nBaixaCM) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em ReavalxMoeda
                  //----------------------------------------------------------------------
                  FcdsReavalxMoeda.Edit;
                  FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                  FcdsReavalxMoeda.Post;
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     nValContabCM := nValContabCM + nBaixaCM;
               end;
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Next;
            end;
            if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da Depreciação da Reavaliacao
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            bPrimMov := True;
            FcdsReavalxDep.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
            while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
            begin
               //-------------------------------------------------------------------------
               // Processa a proporção por Valor sobre o Custo de Aquisição
               //-------------------------------------------------------------------------
               if iTipoPropBaixa = 2 then
               begin
                  ProRata.FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                                 VarArrayOf([FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger]),[]);
                  nBaixaD := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat -
                                         ProRata.FcdsLancProRata.FieldByName('VALDEP').AsFloat) * (nPropBaixa / 100) +
                                         (ProRata.FcdsLancProRata.FieldByName('VALDEP').AsFloat * (nPropBaixa / 100));
               end else
               begin
                  nBaixaD := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
               end;
               //-------------------------------------------------------------------------
               if nBaixaD <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                               27,                                                  // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                          // DATAMOVIMENTACAO
                                                               FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                  // DATAULTDEP
                                                               -1,                                                  // IDGRUPANT
                                                               -1,                                                  // IDCONJANT
                                                               -1,                                                  // IDLOCALANT
                                                               -1,                                                  // IDRESPANT
                                                               -1,                                                  // PLACAANT
                                                               -1,                                                  // PLNCODIGO
                                                               '',                                                  // OBSREAVAL
                                                               iTipDepProRata,                                      // TIPDEPPRORATA
                                                               -1,                                                  // IDTIPODESPESA
                                                               '',                                                  // OBSACRESCIMO
                                                               -1,                                                  // IDMOTIVOBAIXA
                                                                0,                                                  // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                 // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                          nBaixaD) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em ReavalxDep
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Edit;
                  FcdsReavalxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
                  FcdsReavalxDep.Post;
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                     (FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger = 1) then
                     nValContabD   := nValContabD   + nBaixaD;
               end;
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Next;
            end;
            if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM da Depreciação da Reavaliacao
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            bPrimMov := True;
            FcdsReavalxDep.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
            while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
            begin
               //-------------------------------------------------------------------------
               // Processa a proporção por Valor sobre o Custo de Aquisição
               //-------------------------------------------------------------------------
               if iTipoPropBaixa = 2 then
               begin
                  ProRata.FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                                 VarArrayOf([FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger]),[]);
                  nBaixaCMD := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat -
                                       ProRata.FcdsLancProRata.FieldByName('VALCMDEP').AsFloat) * (nPropBaixa / 100) +
                               (ProRata.FcdsLancProRata.FieldByName('VALCMDEP').AsFloat * (nPropBaixa / 100));
               end else
               begin
                  nBaixaCMD := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
               end;
               //-------------------------------------------------------------------------
               if nBaixaCMD <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                               29,                                                  // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                          // DATAMOVIMENTACAO
                                                               FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                  // DATAULTDEP
                                                               -1,                                                  // IDGRUPANT
                                                               -1,                                                  // IDCONJANT
                                                               -1,                                                  // IDLOCALANT
                                                               -1,                                                  // IDRESPANT
                                                               -1,                                                  // PLACAANT
                                                               -1,                                                  // PLNCODIGO
                                                               '',                                                  // OBSREAVAL
                                                               iTipDepProRata,                                      // TIPDEPPRORATA
                                                               -1,                                                  // IDTIPODESPESA
                                                               '',                                                  // OBSACRESCIMO
                                                               -1,                                                  // IDMOTIVOBAIXA
                                                                0,                                                   // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                 // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //----------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                          nBaixaCMD) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em ReavalxDep
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Edit;
                  FcdsReavalxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                  FcdsReavalxDep.Post;
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                     (FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger = 1) then
                     nValContabCMD := nValContabCMD + nBaixaCMD;
               end;
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Next;
            end;
            if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Lançamento Contábil da Baixa da Reavaliacao
         //-------------------------------------------------------------------------------
         if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') and (not FcdsReavaliacao.IsEmpty) then
         begin
            //----------------------------------------------------------------------------
            // Alimenta o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CafxContab.ContabilizaBaixa(nModulo, nEmpresaProp, nBem, dDataBaixa,
                                               FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                               FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                               FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                               FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                               nValContabB,nValContabCM,nValContabD,nValContabCMD,
                                               'R',
                                               FcdsBem.FieldByName('DESBEM').AsString,
                                               FcdsBem.FieldByName('PLACA').AsString,
                                               FcdsBem.FieldByName('DESCGRUPO').AsString,
                                               sPlaContaDestino,
                                               iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         nValContabB   := 0;
         nValContabCM  := 0;
         nValContabD   := 0;
         nValContabCMD := 0;
         //-------------------------------------------------------------------------------
         // Baixa dos Acréscimos de Valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Início
               //if FcdsAcrescimoValor.FieldByName('VALOR').AsFloat < 0 then
               if FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat < 0 then
               begin
                 FcdsAcrescValorxMoeda.Next;
                 Continue;
               end;
               //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Fim

               nBaixaB  := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
               if nBaixaB <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(nBem,                                                  // IDBEM
                                                               nEmpresaProp,                                          // IDPESSOA
                                                               nModulo,                                               // IDMODULO
                                                               37,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                            // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
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
                                                                0,                                                    // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nBaixaB) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em AcrescValorxMoeda
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxMoeda.Edit;
                  FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
                  FcdsAcrescValorxMoeda.Post;
               end;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  nValContabB  := nValContabB  + nBaixaB;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Next;
            end;
            //FcdsAcrescValorxMoeda.SaveToFile('C:\cdsAcrescValorxMoeda.xml',dfXML);
            if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
               Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;

         //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Início
         //-------------------------------------------------------------------------------
         // Baixa dos Decréscimos de Valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               if FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat >= 0 then
               begin
                 FcdsAcrescValorxMoeda.Next;
                 Continue;
               end;
               nBaixaB  := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
               if nBaixaB <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(nBem,                                                  // IDBEM
                                                               nEmpresaProp,                                          // IDPESSOA
                                                               nModulo,                                               // IDMODULO
                                                               96,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                            // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
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
                                                                0,                                                    // PROPBAIXA
                                                                0,                                                    // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nBaixaB) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em AcrescValorxMoeda
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxMoeda.Edit;
                  FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
                  FcdsAcrescValorxMoeda.Post;
               end;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  nValContabB  := nValContabB  + nBaixaB;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Next;
            end;
            //FcdsAcrescValorxMoeda.SaveToFile('C:\cdsAcrescValorxMoeda.xml',dfXML);
            if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
               Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Fim

         //-------------------------------------------------------------------------------
         // Baixa da CM dos Acréscimos de Valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               nBaixaCM := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat) * (nPropBaixa / 100);
               if nBaixaCM <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                               38,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                            // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
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
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nBaixaCM) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em AcrescValorxMoeda
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxMoeda.Edit;
                  FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                  FcdsAcrescValorxMoeda.Post;
               end;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  nValContabCM := nValContabCM + nBaixaCM;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
               Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da Depreciação do Acrescimo de Valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxDep.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               //-------------------------------------------------------------------------
               // Processa a proporção por Valor sobre o Custo
               //-------------------------------------------------------------------------
               if iTipoPropBaixa = 2 then
               begin
                  ProRata.FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                                 VarArrayOf([FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger]),[]);
                  nBaixaD   := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat -
                                       ProRata.FcdsLancProRata.FieldByName('VALDEP').AsFloat) * (nPropBaixa / 100) +
                               (ProRata.FcdsLancProRata.FieldByName('VALDEP').AsFloat * (nPropBaixa / 100));
               end else
               begin
                  nBaixaD   := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
               end;
               //-------------------------------------------------------------------------
               if nBaixaD <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                               39,                                                  // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                          // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                  // DATAULTDEP
                                                               -1,                                                  // IDGRUPANT
                                                               -1,                                                  // IDCONJANT
                                                               -1,                                                  // IDLOCALANT
                                                               -1,                                                  // IDRESPANT
                                                               -1,                                                  // PLACAANT
                                                               -1,                                                  // PLNCODIGO
                                                               '',                                                  // OBSREAVAL
                                                               iTipDepProRata,                                      // TIPDEPPRORATA
                                                               -1,                                                  // IDTIPODESPESA
                                                               '',                                                  // OBSACRESCIMO
                                                               -1,                                                  // IDMOTIVOBAIXA
                                                                0,                                                  // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                 // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                          nBaixaD) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em AcrescValorxDep
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Edit;
                  FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
                  FcdsAcrescValorxDep.Post;
               end;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                  (FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger = 1) then
                  nValContabD   := nValContabD   + nBaixaD;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM da Depreciação do Acrescimo de Valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxDep.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               //-------------------------------------------------------------------------
               // Processa a proporção por Valor sobre o Custo
               //-------------------------------------------------------------------------
               if iTipoPropBaixa = 2 then
               begin
                  ProRata.FcdsLancProRata.Locate('IDREAVALACRESC;MOECODIGO;IDTAXADEP',
                                                 VarArrayOf([FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger]),[]);
                  nBaixaCMD := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat -
                                       ProRata.FcdsLancProRata.FieldByName('VALCMDEP').AsFloat) * (nPropBaixa / 100) +
                               (ProRata.FcdsLancProRata.FieldByName('VALCMDEP').AsFloat * (nPropBaixa / 100));
               end else
               begin
                  nBaixaCMD := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
               end;
               //-------------------------------------------------------------------------
               if nBaixaCMD <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                               40,                                                  // IDTIPOMOVIMENTACAO
                                                               dDataBaixa,                                          // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                  // DATAULTDEP
                                                               -1,                                                  // IDGRUPANT
                                                               -1,                                                  // IDCONJANT
                                                               -1,                                                  // IDLOCALANT
                                                               -1,                                                  // IDRESPANT
                                                               -1,                                                  // PLACAANT
                                                               -1,                                                  // PLNCODIGO
                                                               '',                                                  // OBSREAVAL
                                                               iTipDepProRata,                                      // TIPDEPPRORATA
                                                               -1,                                                  // IDTIPODESPESA
                                                               '',                                                  // OBSACRESCIMO
                                                               -1,                                                  // IDMOTIVOBAIXA
                                                                0,                                                   // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                 // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     inc(iaIdHistMov);
                     aIdHistMov[iaIdHistMov] := nSeqHist;
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                          nBaixaCMD) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em AcrescValorxDep
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Edit;
                  FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                  FcdsAcrescValorxDep.Post;
               end;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                  (FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger = 1) then
                  nValContabCMD := nValContabCMD + nBaixaCMD;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Lançamento Contábil da Baixa do Acrescimo de Valor
         //-------------------------------------------------------------------------------
         if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') and (not FcdsAcrescimoValor.IsEmpty) then
         begin
            //----------------------------------------------------------------------------
            // Alimenta o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CafxContab.ContabilizaBaixa(nModulo, nEmpresaProp, nBem, dDataBaixa,
                                               FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                               FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                               FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                               FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                               nValContabB,nValContabCM,nValContabD,nValContabCMD,
                                               'A',
                                               FcdsBem.FieldByName('DESBEM').AsString,
                                               FcdsBem.FieldByName('PLACA').AsString,
                                               FcdsBem.FieldByName('DESCGRUPO').AsString,
                                               sPlaContaDestino,
                                               iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Contabilização do Resultado da Operação
         //-------------------------------------------------------------------------------
         if bIntegraContab and
            (FcdsBem.FieldByName('CONTROLE').AsString = 'T') and
            (nValResult <> 0) then
         begin
            if not CafxContab.ContabilizaResultadoBaixa(nModulo, nEmpresaProp, nBem, dDataBaixa,
                                                        FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                        FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                        FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                        FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                        nValResult,
                                                        FcdsBem.FieldByName('DESBEM').AsString,
                                                        FcdsBem.FieldByName('PLACA').AsString,
                                                        FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                        sPlaContaDestino,
                                                        iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
         begin
            nPlanilha := CafxContab.RegistraPlanilhaContabil(nModulo,
                                                             nEmpresaProp,
                                                             nUsuario,
                                                             datetostr(dDataBaixa));//,
                                                             //nIdImovel);
//            if nPlanilha <= 0 then   // Vinicius 12/04/2007 - para baixar bem com saldo zero e valor de venda zero.
            if nPlanilha < 0 then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------

            // Marchetti - Pendencia 23502
            // Colocado o teste para verificar se foi gerada planilha
            if nPlanilha > 0 then
            begin
               with _dMTBem do
               begin
                  iAux := 1;
                  while iAux <= iaIdHistMov do
                  begin
                     sqlAtualizaPlnCodigo.Prepare;
                     sqlAtualizaPlnCodigo.ParamByName('IDMOVIMENTACAO').AsFloat := aIdHistMov[iAux];
                     sqlAtualizaPlnCodigo.ParamByName('PLNCODIGO').AsFloat := nPlanilha;
                     if not ExecSQL(sqlAtualizaPlnCodigo.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                     inc(iAux);
                  end;
               end;
            end;
            // Fim Marchetti - Pendencia 23502

         end else
            nPlanilha := 0;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            iFlgPai := 1;
            while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsFloat =
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat) do
            begin
               if not Bem.AtualizaSaldoContabBem(Trunc(nEmpresaProp),
                                                 Trunc(nBem),
                                                 dDataBaixa,
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
            RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;

    //Cássio Rovaroto - SIG nº 113136 - Início
    //Processa a baixa do saldo de provisão do custo
    ProvisaoImovel.InicializaContabProvisao;
    cdsProvisaoImovel.Data := ProvisaoImovel.GetProvisaoBemImovel(Trunc(nBem), dDataBaixa);
    if not cdsProvisaoImovel.IsEmpty then
    begin
      //Buscar saldo atual de provisão do bem;
      dSaldoProvisaoBem := ProvisaoImovel.BuscaSaldoProvisaoAnteriorBem(Trunc(nBem), dDataBaixa, False);

      if not ProvisaoImovel.ExecutaProvisaoCusto(Trunc(nBem),
                                                 Trunc(nEmpresaProp),
                                                 Trunc(nModulo),
                                                 ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                 cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').AsInteger,
                                                 cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger,
                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                 ModuloImobiliario.InvestImob.iUnidNegoc,
                                                 0,
                                                 cdsProvisaoImovel.FieldByName('CODTIPIMOVEL').AsString,
                                                 FcdsBem.FieldByName('PLACA').AsString,
                                                 FcdsBem.FieldByName('DESBEM').AsString,
                                                 '',
                                                 dDataBaixa,
                                                 0,
                                                 cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                 True,
                                                 True) then
        raise Exception.Create(ProvisaoImovel.MessageInfo);
    end;

    if ProvisaoImovel.bContabProvisao then
    begin
      if not ProvisaoImovel.ContabilizaProvisao(Trunc(nModulo),
                                                Trunc(nEmpresaProp),
                                                Trunc(nUsuario),
                                                dDataBaixa) then
        raise Exception.Create(ProvisaoImovel.MessageInfo);
    end;

    if ProvisaoImovel.VerificaBensBaixados(cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger) then
    begin
      LimpaParametros(dtmCAF.qryUpdProvisaoImovel);
      dtmCAF.qryUpdProvisaoImovel.Prepare;
      dtmCAF.QryUpdProvisaoImovel.ParamByName('PDATAFIM').asDateTime := dDataBaixa;
      dtmCAF.QryUpdProvisaoImovel.ParamByName('PFLGATIVO').asString := 'N';
      dtmCAF.qryUpdProvisaoImovel.ParamByName('PIDIMOVEL').asInteger := cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger;
      dtmCAF.qryUpdProvisaoImovel.ExecSQL;
    end;
   //Cássio Rovaroto - SIG nº 113136 - Fim
  finally
    FreeAndNil(cdsProvisaoImovel);
  end;
end;

function TCtrlImobMovBaixa.ExecutaTermoBaixa(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                         iMotivoBaixa : Integer; dDataBaixa : TDateTime;
                                         iTipoPropBaixa : Integer; nPropBaixar,
                                         nValVenda : Extended; sObsBaixa,
                                         sPlaContaDestino : String; iTipDepProRata : Integer;
                                         sBilhete : String) : Boolean;
var
   bTransacao : Boolean;
   nSomaValCtb, nSomaValOrg,
   nSomaValCusto, nProp : Currency;
   nPropBaixar1, nValVenda1  : Extended;
   sSql : String;
   //-------------------------------------------------------------------------------------
   aValPropBaixa  : Array of Currency;
   iaValPropBaixa : Integer;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTermoBaixa(nModulo, nEmpresaProp, nUsuario, nSelBaixa,
                                                       iMotivoBaixa, dDataBaixa,
                                                       iTipoPropBaixa, nPropBaixar,
                                                       nValVenda, sObsBaixa,
                                                       sPlaContaDestino, iTipDepProRata);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bTransacao := True;
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         bTransacao := Self.OpenTransaction;
         Self.OpenTransaction := False;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Carrega os bens da seleção
         //-------------------------------------------------------------------------------
         FcdsSelBaixaBens.Data := ListaSelBaixaBens(nEmpresaProp, nSelBaixa, dDataBaixa);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Iniciando...');
            iPrgBarMax  := FcdsSelBaixaBens.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Verifica se existem bens já baixados na seleção
         //-------------------------------------------------------------------------------
         nSomaValOrg   := 0;
         nSomaValCtb   := 0;
         nSomaValCusto := 0;
         while not FcdsSelBaixaBens.EOF do
         begin
            nSomaValOrg   := Bem.ConvNum(nSomaValOrg + FcdsSelBaixaBens.FieldByName('VALORG').AsCurrency);
            nSomaValCtb   := Bem.ConvNum(nSomaValCtb + FcdsSelBaixaBens.FieldByName('VALCTB').AsCurrency);
            nSomaValCusto := Bem.ConvNum(nSomaValCusto + FcdsSelBaixaBens.FieldByName('VALCUSTO').AsCurrency);
            //----------------------------------------------------------------------------
            if FcdsSelBaixaBens.FieldByName('BAIXATOTAL').AsString = 'S' then
               Raise Exception.Create(CMTranslate('O bem ') + FcdsSelBaixaBens.FieldByName('PLACA').AsString + CMTranslate(' já está baixado.') + #13 + #13 +
                                      CMTranslate('Retire-o do Termo de Baixa.'));
            //----------------------------------------------------------------------------
            FcdsSelBaixaBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta SBBVALVENDA com os valores proporcionados
         //-------------------------------------------------------------------------------
         if nValVenda <> 0 then
         begin
            FcdsSelBaixaBens.First;
            while not FcdsSelBaixaBens.EOF do
            begin
               if nSomaValCtb <> 0 then
               begin
                  nProp := FcdsSelBaixaBens.FieldByName('VALCTB').AsCurrency / nSomaValCtb
               end else
               begin
                  nProp := FcdsSelBaixaBens.FieldByName('VALCUSTO').AsCurrency / nSomaValCusto;
               end;
               //-------------------------------------------------------------------------
               FcdsSelBaixaBens.Edit;
               FcdsSelBaixaBens.FieldByName('SBBVALVENDA').AsCurrency := nValVenda * nProp;
               FcdsSelBaixaBens.Post;
               //-------------------------------------------------------------------------
               FcdsSelBaixaBens.Next;
            end;
            if not ApplyCds(FcdsSelBaixaBens,_dbSelBaixaBens,[],[]) then
               Raise Exception.Create(_dbSelBaixaBens.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Alimenta aValProp com o valor da baixa parcial rateada entre os
         // bens da seleção, de acordo com o saldo contábil atual
         //-------------------------------------------------------------------------------
         if iTipoPropBaixa = 0 then      // Baixa Parcial por Percentual do Saldo Contábil
         begin
            FcdsSelBaixaBens.First;
            iaValPropBaixa := 0;
            while not FcdsSelBaixaBens.EOF do
            begin
               SetLength(aValPropBaixa,iaValPropBaixa + 1);
               //-------------------------------------------------------------------------
               aValPropBaixa[iaValPropBaixa] := nPropBaixar;
               //-------------------------------------------------------------------------
               iaValPropBaixa := iaValPropBaixa + 1;
               FcdsSelBaixaBens.Next;
            end;
         end else
         //-------------------------------------------------------------------------------
         if iTipoPropBaixa = 1 then        // Baixa Parcial por Valor sobre Saldo Contábil
         begin
            if nSomaValCtb = 0 then
               Raise Exception.Create(CMTranslate('Não é possível processar a baixa parcial de bens de um termo onde a soma do saldos contábeis é igual a zero'));
            //----------------------------------------------------------------------------
            FcdsSelBaixaBens.First;
            iaValPropBaixa := 0;
            while not FcdsSelBaixaBens.EOF do
            begin
               SetLength(aValPropBaixa,iaValPropBaixa + 1);
               //-------------------------------------------------------------------------
               nProp := Bem.ConvNum(FcdsSelBaixaBens.FieldByName('VALCTB').AsCurrency / nSomaValCtb);
               aValPropBaixa[iaValPropBaixa] := nPropBaixar * nProp;
               //-------------------------------------------------------------------------
               iaValPropBaixa := iaValPropBaixa + 1;
               FcdsSelBaixaBens.Next;
            end;
         end else
         //-------------------------------------------------------------------------------
         if iTipoPropBaixa = 2 then       // Baixa Parcial por Valor sobre Custo Aquisição
         begin
            FcdsSelBaixaBens.First;
            iaValPropBaixa := 0;
            while not FcdsSelBaixaBens.EOF do
            begin
               SetLength(aValPropBaixa,iaValPropBaixa + 1);
               //-------------------------------------------------------------------------
               nProp := Bem.ConvNum(FcdsSelBaixaBens.FieldByName('VALORG').AsCurrency / nSomaValOrg);
               aValPropBaixa[iaValPropBaixa] := nPropBaixar * nProp;
               //-------------------------------------------------------------------------
               iaValPropBaixa := iaValPropBaixa + 1;
               FcdsSelBaixaBens.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Processa as Baixas
         //-------------------------------------------------------------------------------
         iaValPropBaixa := 0; 
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Baixando Placa ') + FcdsSelBaixaBens.FieldByName('PLACA').AsString;
               iPrgBarPos := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat);
            nPropBaixar1 := aValPropBaixa[iaValPropBaixa];
            nValVenda1   := FcdsSelBaixaBens.FieldbyName('SBBVALVENDA').AsCurrency;
            //----------------------------------------------------------------------------
            if not ExecutaBaixa(nModulo, nEmpresaProp, nUsuario,
                                FcdsBem.FieldByName('IDBEM').AsFloat,
                                iMotivoBaixa, dDataBaixa, iTipoPropBaixa,
                                nPropBaixar1, nValVenda1, sObsBaixa,
                                sPlaContaDestino, iTipDepProRata) then
               Raise Exception.Create(MessageInfo + #13 + ' na Baixa do bem ' +
                                      FcdsSelBaixaBens.FieldByName('PLACA').AsString);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE SELBAIXABENS ' +
                    ' SET FLGEXECUTADO = 1 ' +
                    ' WHERE IDSELBAIXA = ' + floattostr(nSelBaixa) +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp) +
                    '   AND IDBEM = ' + floattostr(FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            iaValPropBaixa := iaValPropBaixa + 1;
            FcdsSelBaixaBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como Executado
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaSelBaixa(nEmpresaProp, nSelBaixa);
         Fcds.Edit;
         Fcds.FieldByName('SBXFLGEXECUTADO').AsInteger  := 1;
         Fcds.FieldByName('SBXDTAEXECUTADO').AsDateTime := dDataBaixa;
         Fcds.Post;
         if not ApplyCds(Fcds, _dbSelBaixa, [], []) then
            Raise Exception.Create(_dbSelBaixa.MessageInfo);
         //-------------------------------------------------------------------------------
         Self.OpenTransaction := bTransacao;
         //-------------------------------------------------------------------------------
         Result := True;
         Commit;
      except
         On E : Exception do
         begin
            Self.OpenTransaction := bTransacao;
            RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que Estorna a Baixa de um Bem
//----------------------------------------------------------------------------------------
function TCtrlImobMovBaixa.EstornaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                        //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
                                        dDataMov,dDataEst : TDateTime;
                                        bNaoEstornoDevSinal : Boolean = True;
                                        bTransaction : Boolean = True) : Boolean;
Var
   sSql           : String;
   nPlnCodigo     : Extended;
   iExercicio,
   iPeriodo,
   iFlgPai,
   iTipDepProRata : Integer;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaBaixa(nModulo, nEmpresaProp, nUsuario, nBem,
                                                  //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
                                                  dDataMov, dDataEst, bNaoEstornoDevSinal);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
         if bTransaction then
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
         // verifica se ja houve movimentação no bem após a Baixa (Parcial)
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                 ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
            Raise Exception.Create(CMTranslate('Existe movimentação após a baixa parcial do bem. Consulte Histórico de Movimentação!'));
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
         // Valida os Parâmetros obrigatórios
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
         else
            if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if FcdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem em Saída Temporária!');
            Raise Exception.Create(MessageInfo);
         end else
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem que terá a baixa estornada
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
         // Retorna os Valores Baixados nas Tabela BEMXMOEDA e BEMXDEP
         //-------------------------------------------------------------------------------
         _dMTBem.sqlMovBaixaBem.Prepare;
         _dMTBem.sqlMovBaixaBem.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlMovBaixaBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlMovBaixaBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         _cds.Data := _dMTBem.sqlMovBaixaBem.Data;
         iTipDepProRata := _cds.FieldByName('TIPDEPPRORATA').AsInteger;
         //-------------------------------------------------------------------------------
         nPlnCodigo := 0;

         //Cássio Rovaroto - SIG nº 113136 - Início
         ProvisaoImovel.InicializaContabProvisao;
         if not ProvisaoImovel.EstornaProvisaoCustoImovel(Trunc(nUsuario),
                                                          Trunc(nModulo),
                                                          Trunc(nEmpresaProp),
                                                          203,
                                                          dDataMov,
                                                          True,
                                                          True,
                                                          Trunc(nBem)) then
         begin
           Result := False;
           raise Exception.Create(ProvisaoImovel.MessageInfo);
         end;

         LimpaParametros(dtmCAF.qryUpdEstornoProvisaoImovel);
         dtmCAF.qryUpdEstornoProvisaoImovel.Prepare;
         dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PFLGATIVO').AsString :=  'S';
         dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PIDIMOVEL').AsInteger := RetornaImovelxBem(nBem);
         dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PVIGENCIAFIM').AsDate := dDataMov;
         dtmCAF.qryUpdEstornoProvisaoImovel.ExecSQL;
         //Cássio Rovaroto - SIG nº 113136 - Fim


         _cds.First;
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Posiciona a tabela de acordo com a movimentacao
            //----------------------------------------------------------------------------
            if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 06) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 25) then
               FcdsBemxMoeda.Locate('MOECODIGO',_cds.FieldByName('MOECODIGO').AsFloat,[])
            else
               FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                     _cds.FieldByName('IDTAXADEP').AsFloat]), []);
            //----------------------------------------------------------------------------
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               06 : begin
                       if _cds.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                       begin
                          if not _cds.FieldByName('PLNCODIGO').IsNull then
                             nPlnCodigo := _cds.FieldByName('PLNCODIGO').AsFloat;
                          //--------------------------------------------------------------
                          FcdsBem.Edit;
                          FcdsBem.FieldByName('PROPBAIXA').AsFloat   := Bem.ConvNum(FcdsBem.FieldByName('PROPBAIXA').AsFloat - _cds.FieldByName('PROPBAIXA').AsFloat);
                          FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N';
                          FcdsBem.Post;
                       end;
                       //-----------------------------------------------------------------
                       FcdsBemxMoeda.Edit;
                       FcdsBemxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsBemxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               25 : begin
                       FcdsBemxMoeda.Edit;
                       FcdsBemxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsBemxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               24 : begin
                       FcdsBemxDep.Edit;
                       FcdsBemxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsBemxDep.Post;
                    end;
               //-------------------------------------------------------------------------
               26 : begin
                       FcdsBemxDep.Edit;
                       FcdsBemxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsBemxDep.Post;
                    end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         if not ApplyCds(FcdsBem,_dbBem,[],[]) then
            Raise Exception.Create(_dbBem.MessageInfo);
         if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Retorna os Valores Baixados na tabela REAVALIACAO
         //-------------------------------------------------------------------------------
         while not FcdsReavaliacao.EOF do
         begin
            _dMTBem.sqlMovBaixaReaval.Prepare;
            _dMTBem.sqlMovBaixaReaval.ParamByName('IDBEM').AsFloat          := nBem;
            _dMTBem.sqlMovBaixaReaval.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
            _dMTBem.sqlMovBaixaReaval.ParamByName('IDREAVALACRESC').AsFloat := FcdsReavaliacao.Fieldbyname('IDREAVALIACAO').AsFloat;
            _dMTBem.sqlMovBaixaReaval.ParamByName('DATAMOV').AsDateTime     := dDataMov;
            _cds.Data := _dMTBem.sqlMovBaixaReaval.Data;
            //----------------------------------------------------------------------------
            _cds.First;
            while not _cds.EOF do
            begin
               //-------------------------------------------------------------------------
               // Posiciona a tabela de acordo com a movimentacao
               //-------------------------------------------------------------------------
               if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 20) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 28) then
                  FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                _cds.FieldByName('MOECODIGO').AsFloat]),[])
               else
                  FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                           _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                           _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
               //-------------------------------------------------------------------------
               case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                  20 : begin
                          FcdsReavalxMoeda.Edit;
                          FcdsReavalxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsReavalxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  28 : begin
                          FcdsReavalxMoeda.Edit;
                          FcdsReavalxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsReavalxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  27 : begin
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsReavalxDep.Post;
                       end;
                  //----------------------------------------------------------------------
                  29 : begin
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsReavalxDep.Post;
                       end;
               end;
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            FcdsReavaliacao.Next
         end;
         if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
            Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Retorna os Valores Baixados na tabela ACRESCIMOVALOR
         //-------------------------------------------------------------------------------
         while not FcdsAcrescimoValor.EOF do
         begin
            _dMTBem.sqlMovBaixaAcresc.Prepare;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('IDBEM').AsFloat          := nBem;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('IDREAVALACRESC').AsFloat := FcdsAcrescimoValor.Fieldbyname('IDACRESCIMO').AsFloat;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('DATAMOV').AsDateTime     := dDataMov;
            _cds.Data := _dMTBem.sqlMovBaixaAcresc.Data;
            //----------------------------------------------------------------------------
            _cds.First;
            while not _cds.EOF do
            begin
               //-------------------------------------------------------------------------
               // Posiciona a tabela de acordo com a movimentacao
               //-------------------------------------------------------------------------
               //Bruno Bastos - Sol: 128740 - Kintana: 692106 - if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 37) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 38) then

               //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Início
               if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 37) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 38) or
                  (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 96) then
               //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Fim
                  FcdsAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                   _cds.FieldByName('MOECODIGO').AsFloat]),[])
               else
                  FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                 _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                 _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
               //-------------------------------------------------------------------------
               case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                  37 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  38 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  39 : begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsAcrescValorxDep.Post;
                       end;
                  //----------------------------------------------------------------------
                  40 : begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsAcrescValorxDep.Post;
                       end;

                  //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Início
                  96 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //Bruno Bastos - Sol: 128740 - Kintana: 692106 - Fim

               end;
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            FcdsAcrescimoValor.Next
         end;
         if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
            Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);

         //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - INI
         //--> se for devolução de seinal , não faz!!!
         if bNaoEstornoDevSinal then
         begin
            //-------------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //-------------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                    ' SET PLNCODIGO = NULL '+
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                    '   AND (IDTIPOMOVIMENTACAO = 06 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR ' +
                    '        IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR IDTIPOMOVIMENTACAO = 28 OR ' +
                    '        IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 29 OR IDTIPOMOVIMENTACAO = 37 OR ' +
                    '        IDTIPOMOVIMENTACAO = 96 OR  '+//Bruno Bastos - Sol: 128740 - Kintana: 692106
                    '        IDTIPOMOVIMENTACAO = 38 OR IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40) ' +
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
            // Remove os Registros da Baixa no Historico
            //-------------------------------------------------------------------------------
            sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF ' + #13 +
                    ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                    ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                    '   AND DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                    '   AND (IDTIPOMOVIMENTACAO = 06 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR ' + #13 +
                    '        IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR IDTIPOMOVIMENTACAO = 28 OR ' + #13 +
                    '        IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 29 OR IDTIPOMOVIMENTACAO = 37 OR ' + #13 +
                    '        IDTIPOMOVIMENTACAO = 96 OR  '+//Bruno Bastos - Sol: 128740 - Kintana: 692106
                    '        IDTIPOMOVIMENTACAO = 38 OR IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40) ' + #13 +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            _cds.Data := GetDataPacket(sSql);
            if _cds.IsEmpty then
               Raise Exception.Create(CMTranslate('Não foi possível estornar a baixa do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
            //-------------------------------------------------------------------------------
            while not _cds.Eof do
            begin
               sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover os valores da baixa do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
               //----------------------------------------------------------------------------
               sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover o historico da baixa do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
               //----------------------------------------------------------------------------
               _cds.Next;
            end;
            //-------------------------------------------------------------------------------
            // Estorna a Depreciacao PróRata se a mesma foi calculada.
            //-------------------------------------------------------------------------------
            sSql := ' SELECT /*+ RULE */ HM.IDPESSOA, HM.IDBEM ' +
                    ' FROM HISTORICOMOVIMENTACAO HM ' +
                    ' WHERE HM.IDBEM = ' + floattostr(nBem);
            if iTipDepProRata = 0 then
            begin
               sSql := sSql + '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',(dDataMov - 1)) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13;
            end else
            begin
               sSql := sSql + '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13;
            end;
            sSql := sSql + '   AND (HM.IDTIPOMOVIMENTACAO = 15 OR HM.IDTIPOMOVIMENTACAO = 22 OR HM.IDTIPOMOVIMENTACAO = 34 OR ' + #13 +
                           '        HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO = 18 OR HM.IDTIPOMOVIMENTACAO = 35 OR ' + #13 +
                           '        HM.IDTIPOMOVIMENTACAO = 21 OR HM.IDTIPOMOVIMENTACAO = 19 OR HM.IDTIPOMOVIMENTACAO = 36) ' + #13 +
                           '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' + #13 +
                           '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp);
            _cds.Data := GetDataPacket( sSql );
            //-------------------------------------------------------------------------------
            if not _cds.IsEmpty then
            begin
               if iTipDepProRata = 0 then
               begin
                  if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
                     Raise Exception.Create(ProRata.MessageInfo);
               end else
               begin
                  if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, dDataEst) then
                     Raise Exception.Create(ProRata.MessageInfo);
               end;
            end;
         end;
         //final da devolução de sinal
         //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387 - FIM      

         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            iFlgPai := 1;
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat then
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
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387

         if bTransaction then
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
            //Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
            if bTransaction then
               RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Estorna um Termo de Baixa
//----------------------------------------------------------------------------------------
function TCtrlImobMovBaixa.EstornaTermoBaixa(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                         dDataMov, dDataEst : TDateTime) : Boolean;
var
   bTransacao : Boolean;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaTermoBaixa(nModulo, nEmpresaProp, nUsuario, nSelBaixa,
                                                       dDataMov, dDataEst);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bTransacao := True;
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         bTransacao := Self.OpenTransaction;
         Self.OpenTransaction := False;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         FcdsSelBaixaBens.Data := ListaSelBaixaBens(nEmpresaProp, nSelBaixa, dDataMov);
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            if not EstornaBaixa(nModulo, nEmpresaProp, nUsuario,
                                FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                dDataMov, dDataEst) then
               Raise Exception.Create(MessageInfo + #13 + 'no Estorno da Baixa do bem ' +
                                      FcdsSelBaixaBens.FieldByName('PLACA').AsString);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE SELBAIXABENS ' +
                    ' SET FLGEXECUTADO = 0 ' +
                    ' WHERE IDSELBAIXA = ' + floattostr(nSelBaixa) +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp) +
                    '   AND IDBEM = ' + floattostr(FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FcdsSelBaixaBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como não Executado
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaSelBaixa(nEmpresaProp,nSelBaixa);
         Fcds.Edit;
         Fcds.FieldByName('SBXFLGEXECUTADO').AsInteger  := 0;
         Fcds.FieldByName('SBXDTAEXECUTADO').Clear;
         Fcds.Post;
         if not ApplyCds(Fcds, _dbSelBaixa, [], []) then
            Raise Exception.Create(_dbSelBaixa.MessageInfo);
         //-------------------------------------------------------------------------------
         Self.OpenTransaction := bTransacao;
         //-------------------------------------------------------------------------------
         Result := True;
         Commit;
      except
         On E : Exception do
         begin
            Self.OpenTransaction := bTransacao;
            RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlImobMovBaixa.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

function TCtrlImobMovBaixa.RetornaImovelxBem(nIdBem: Extended): Integer;
var
  sSQL: string;
  _cdsAux: TClientDataSet;
begin
  _cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDIMOVEL FROM IMOVELXBEM WHERE IDBEM = ' + FloatToStr(nIdBem);
    _cdsAux.Data := GetDataPacket(sSQL);
    Result := _cdsAux.FieldByName('IDIMOVEL').asInteger;
  finally
    _cdsAux.Free;
  end;
end;
//SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Inicio
function TCtrlImobMovBaixa.RetornaGrupo(nIdBem: Extended): String;
var
  sSQL: string;
  _cdsAux: TClientDataSet;
begin
  _cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IXBGRUPO FROM IMOVELXBEM WHERE IDBEM = ' + FloatToStr(nIdBem);
    _cdsAux.Data := GetDataPacket(sSQL);
    Result := _cdsAux.FieldByName('IXBGRUPO').AsString;
  finally
    _cdsAux.Free;
  end;
end;
//SOL 148729/3221  Ktn 1055095 Felipe de Oliveira - Fim

//Ricardo Cristiano - SOL Nº 44015 KINTANA Nº 523387
function TCtrlImobMovBaixa.EstornaContabilCaf(nUsuario, nPlnCodigo, nModulo, nEmpresaProp : Double;
                                              sDataEstorno : String ) : Boolean;
begin
   try
     //-------------------------------------------------------------------------------
     // Carga dos parâmetros do sistema
     //-------------------------------------------------------------------------------
     if not ParamCAF.CarregaProp(nEmpresaProp) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!'));

     if not CafxContab.LancaContab.EstornaLancaContab(nUsuario, nPlnCodigo,
                                                      nModulo, nEmpresaProp,
                                                      ParamCAF.USAPLANOPATRO,
                                                      sDataEstorno) then
        Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CafxContab.MessageInfo);

     Result := True;        
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;

end.
