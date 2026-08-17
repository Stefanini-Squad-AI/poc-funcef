unit uCtrlImobCAF;

interface
uses SysUtils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCmClientDataSet, uCMTypes, uCtrlContab, uCtrlPeriodo, uCtrlLancamento,
     uCtrlImobLancamento, uCmSqlParams, uCtrlSegregacao, uCtrlImobSegregacao,
     uCtrlDocumento, uCtrlImobDocumento, uCMFileUtils, uCtrlPadroes, uCtrlConjunto,
     uCtrlGrupoContab, dMTBem, uCtrlParamCaf, uDbBem, uDbBemXMoeda, uDbBemXDep,
     uDbSaldoContabBem, uDbSldCtbBemXDep, uDbImagemBem, uDbPlanoPatroxImovel,
     uDiasUteis, uDbPlanoPatroxBem, uCtrlHistMovBem, uCtrlContaContabil, Math,
     uCtrlImobCAFxContab;

type
   { CtrlImobBem = possui todas as informações básicas do BEM }
   TCtrlImobBem = class(TCmControlObject)
    private
      _dbBem            : TDBBem;
      _dbBemxMoeda      : TDBBemxMoeda;
      _dbBemxDep        : TDBBemxDep;
      _dbPlanoPatroxBem : TDBPlanoPatroxBem;
      _dbImagem         : TDBImagemBem;
      _dbSaldoContabBem : TDBSaldoContabBem;
      _dbSldCtbBemxDep  : TDBSldCtbBemxDep;
      _dMTBem           : tdtmMTBem;
      _dbPlanoPatroxImovel: TDbPlanoPatroxImovel;

      ParamCAF       : TCtrlParamCAF;
      Conjunto       : TCtrlConjunto;
      GrupoContab    : TCtrlGrupoContab;
      HistMovBem     : TCtrlHistMovBem;
      DiasUteis      : TDiasUteis;
      ImobCAFxContab : TCtrlImobCAFxContab;

      FcdsBemxDep: TClientDataSet;
      FcdsPlanoPatroxBem: TClientDataSet;
      FcdsConjunto: TClientDataSet;
      FcdsTaxasDep: TClientDataSet;
      Fcds: TClientDataSet;
      FcdsBemxMoeda: TClientDataSet;
      FcdsMovTransf: TClientDataSet;
      FcdsSaldoContabBem: TClientDataSet;
      FcdsImagem: TClientDataSet;
      FcdsSldCtbBemxDep: TClientDataSet;
      FcdsMovContabBem: TClientDataSet;
      FIdBem: Integer;
      function TiraCaracter(sStr : string; sCh : Char) : string;
      function RegistraEntradaTotal(nEmpresaProp, nBem,
                                    nGrupo, nSubConta, nAtivProjeto : Extended;
                                    dDataInicioDep : TDateTime; nValHistorico : Extended;
                                    bFlgBemIntContab : Boolean; dDtaContab : TDateTime) : Boolean;
      function CMTranslate(sIgor : String) : String;
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;
      procedure OnCreateAppServer; override;
      procedure SetIdBem(const Value: Integer);
      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsConjunto(const Value: TClientDataSet);
      procedure SetcdsImagem(const Value: TClientDataSet);
      procedure SetcdsMovContabBem(const Value: TClientDataSet);
      procedure SetcdsMovTransf(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsSaldoContabBem(const Value: TClientDataSet);
      procedure SetcdsSldCtbBemxDep(const Value: TClientDataSet);
      procedure SetcdsTaxasDep(const Value: TClientDataSet);
    public
      Property IdBem : Integer read FIdBem write SetIdBem;
      property cds : TClientDataSet read Fcds write Setcds;
      property cdsBemxMoeda : TClientDataSet read FcdsBemxMoeda write SetcdsBemxMoeda;
      property cdsBemxDep : TClientDataSet read FcdsBemxDep write SetcdsBemxDep;
      property cdsPlanoPatroxBem : TClientDataSet read FcdsPlanoPatroxBem write SetcdsPlanoPatroxBem;
      property cdsSaldoContabBem : TClientDataSet read FcdsSaldoContabBem write SetcdsSaldoContabBem;
      property cdsSldCtbBemxDep : TClientDataSet read FcdsSldCtbBemxDep write SetcdsSldCtbBemxDep;
      property cdsMovContabBem : TClientDataSet read FcdsMovContabBem write SetcdsMovContabBem;
      property cdsMovTransf : TClientDataSet read FcdsMovTransf write SetcdsMovTransf;
      property cdsTaxasDep : TClientDataSet read FcdsTaxasDep write SetcdsTaxasDep;
      property cdsImagem : TClientDataSet read FcdsImagem write SetcdsImagem;
      property cdsConjunto : TClientDataSet read FcdsConjunto write SetcdsConjunto;

      constructor Create; override;
      destructor Destroy; override;

      function ProcurarBem(nIdPessoa, nIdBem : Extended) : OleVariant;
      function ProcurarBemxMoeda(nIdPessoa, nIdBem, nMoeCodigo : Extended) : OleVariant;
      function ProcurarBemxDep(nIdPessoa, nIdBem, nMoeCodigo, nIdBemxDep : Extended) : OleVariant;
      function ProcurarPlanoPatroxBem(nIdImovel, nIdPlanoPrev, nIdPatro : Extended) : OleVariant;

      function ListaBem(nIdPessoa : Extended; nIdBem : Extended = -1): OleVariant;
      function ListaBemxMoeda(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1): OleVariant;
      function ListaBemxDep(nIdPessoa, nIdBem : Extended; nMoeCodigo : Extended = -1;
                            nIdBemxDep : Extended = -1): OleVariant;

      function ListaReavaliacao(nIdPessoa : Extended; nIdBem : Extended = -1; bUltReaval : boolean = False): OleVariant;
      function ListaReavalxMoeda(nIdPessoa, nIdBem : Extended; nIdReavaliacao : Extended = -1; nMoeCodigo : Extended = -1) : OleVariant;
      function ListaReavalxDep(nIdPessoa, nIdBem : Extended; nIdReavaliacao : Extended = -1; nMoeCodigo  : Extended = -1; nIdReavalxDep : Extended = -1): OleVariant;

      function ListaAcrescimoValor(nIdPessoa : Extended; nIdBem : Extended = -1): OleVariant;
      function ListaAcrescValorxMoeda(nIdPessoa, nIdBem : Extended; nIdAcrescimo : Extended = -1; nMoeCodigo : Extended = -1) : OleVariant;
      function ListaAcrescValorxDep(nIdPessoa, nIdBem : Extended; nIdAcrescimo : Extended = -1; nMoeCodigo  : Extended = -1; nIdAcrescimoxDep : Extended = -1): OleVariant;

      function ListaPlanoPatroxBem(nIdPessoa, nIdBem : Extended; nIdPatro : Extended = -1;
                                   nIdPlanoPrev : Extended = -1) : OleVariant;
      function ListaPlanoPatroxImovel(nIdImovel: Extended; nIdPatro: Extended = -1;
                                       nIdPlanoPrev: Extended = -1) : OleVariant;
      function ListaMovimentacao(iEmpresaProp, iBem : Integer;
                                 dDataSld : tDateTime; iMoeCodigo, iTaxaDep : Integer) : OleVariant;
      function PlacaUnica(nEmpresa : Extended; sPlaca : string) : boolean;
      function PlacaIdBem(nEmpresa : Extended; sPlaca : string) : Integer;

      function CotacaoMoeda(iMoeda : Integer; dData : tDatetime;
                            var iNumDecimais, iFlgArredonda : Integer) : Extended;
      function ConversaoMoeda(nValor : Extended; iMoeda : Integer; dData : tDatetime) : Extended;
      function ComplZeros(sCodigo : String; iTam : Integer) : string;

      function VerificaPeriodoCAF(nEmpresaProp, nBem : Extended;
                                  iFlgImovel : Integer;
                                  sTipoMov : String;
                                  dDataMov : TDateTime;
                                  var dDataUltMov, dDataUltDep : TDateTime;
                                  bPermiteMesmaData : boolean = False) : Boolean;
      function ConvNum(nValor : Extended) : Extended;

      function AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                      iMoeCodigo, iTaxaDep : Integer;
                                      nValOrg, nCmBem, nDepLanc, nCmDep,
                                      nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                                      nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc,
                                      nUltReavCmDep : Extended;
                                      iGrupo, iLocalizacao, iResponsavel, iConjunto, iAtivProjeto,
                                      iCodMov, iPai : Integer) : Boolean;
      function SaldoContabilBem(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                iMoeCodigo, iTaxaDep : Integer;
                                Var nValOrg, nCmBem,
                                    nDepLanc, nCmDep,
                                    nReavValOrg, nReavCmBem,
                                    nReavDepLanc, nReavCmDep,
                                    nUltReavValOrg, nUltReavCmBem,
                                    nUltReavDepLanc, nUltReavCmDep,
                                    nDepLancAtu, nUltReavDepLancAtu : Extended;
                                Var iGrupo, iLocalizacao, iResponsavel : Integer) : Boolean;
      function SaldoContabil(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                             iMoeCodigo, iTaxaDep : Integer) : Extended;
      function SaldoContabilA(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                              iMoeCodigo, iTaxaDep : Integer;
                              iReavaliacao : Integer = 0) : Extended;

      function ExecutaEntrada(iModulo, iEmpresaProp, iUsuario : Integer;
                              Var nPlanilha : Extended;
                              iIdImovel : Integer = -1) : LongInt;
      function EstornaEntrada(iModulo, iEmpresaProp, iUsuario, iBem : Integer;
                              dDataMov, dDataEst : tDateTime; iTipoEstorna : Integer = 0) : Boolean;
      function ExecutaTransfPlaca(nModulo, nEmpresaProp, nBem : Extended;
                                  nPlacaNova : Extended; dDataMov : TDateTime) : boolean;
      function ExecutaControleTotal(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov : TDateTime;
                                    nGrupo, nSubConta, nAtivProjeto : Extended;
                                    dDataInicioDep : TDateTime;
                                    nValHistorico : Extended;
                                    bFlgBemIntContab : Boolean;
                                    dDtaContab : TDateTime) : Boolean;

      Function ExecutaAlteracaoBemManut : Boolean;
      function ExecutaCadastroBem(nModulo, nEmpresaProp, nUsuario : Extended;
                                  sTipoEntrada : String = 'I';
                                  nValorTotal : Extended = 0;
                                  iQuantidade : Integer = 1;
                                  nIdImovel: Integer = -1) : Boolean;
      function CarregaImagem(nImagem : Extended) : OleVariant;
      function GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse, nPlacaAtual : Extended) : Extended;
      function ExecutaAlteracaoEntradaCtrlTotal(nUsuario : Extended) : Boolean;
      function ExecutaAlteracaoEntradaRestrita : Boolean;
   end;

var CtrlImobBem : TCtrlImobBem;

implementation


{ TCtrlImobBem }

procedure TCtrlImobBem.AfterInitialize;
begin
  inherited;
  ParamCAF.InitializeAs(Self);
  Conjunto.InitializeAs(Self);
  GrupoContab.InitializeAs(Self);
  HistMovBem.InitializeAs(Self);
  DiasUteis.InitializeAs(Self);
  ImobCAFxContab.InitializeAs(Self);
end;

function TCtrlImobBem.AtualizaSaldoContabBem(iEmpresaProp, iBem: Integer;
  dDataSld: tDateTime; iMoeCodigo, iTaxaDep: Integer; nValOrg, nCmBem,
  nDepLanc, nCmDep, nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
  nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep: Extended;
  iGrupo, iLocalizacao, iResponsavel, iConjunto, iAtivProjeto, iCodMov,
  iPai: Integer): Boolean;
Var
   sSql, sMensagem                       : String;
   naValOrg, naCmBem,
   naDepLanc, naCmDep,
   naReavValOrg, naReavCmBem,
   naReavDepLanc, naReavCmDep,
   naUltReavValOrg, naUltReavCmBem,
   naUltReavDepLanc, naUltReavCmDep,
   nSValOrg, nSCmBem,
   nSReavValOrg, nSReavCmBem,
   nSUltReavValOrg, nSUltReavCmBem,
   nSDepLanc, nSCmDep,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavDepLanc, nSUltReavCmDep      : Currency;
   isGrupo, isLocalizacao, isResponsavel,
   isConjunto, isAtivProjeto             : Integer;
   dDataMov                              : TDateTime;
   bResult                               : Boolean;
   fLog   : TextFile;
   sLinha : String;

begin
  try
  //----------------------------------------------------------------------------------
  // Tratamento dos valores
  //----------------------------------------------------------------------------------
  naValOrg := nValOrg;
  naCmBem := nCmBem;
  naDepLanc := nDepLanc;
  naCmDep := nCmDep;
  naReavValOrg := nReavValOrg;
  naReavCmBem := nReavCmBem;
  naReavDepLanc := nReavDepLanc;
  naReavCmDep := nReavCmDep;
  naUltReavValOrg := nUltReavValOrg;
  naUltReavCmBem := nUltReavCmBem;
  naUltReavDepLanc := nUltReavDepLanc;
  naUltReavCmDep := nUltReavCmDep;
  //----------------------------------------------------------------------------------
  // Remove os saldos posteriores a data da movimentação estornada
  //----------------------------------------------------------------------------------
  if iCodMov = 2 then
  begin
    if iPai = 1 then           // Remove os saldos quando for a atualização do pai
    begin
      sSql := ' DELETE FROM SLDCTBBEMXDEP ' + #13 +
              ' WHERE (IDBEM = ' + IntToStr(iBem) + ')' + #13 +
              '   AND (IDPESSOA = ' + IntToStr(iEmpresaProp) + ')' + #13 +
              '   AND (MOECODIGO = ' + IntToStr(iMoeCodigo) + ')' + #13 ;
      if not ExecSQL(sSql, False) then
        Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------
      sSql := ' DELETE FROM SALDOCONTABBEM ' + #13 +
              ' WHERE (IDBEM = ' + inttostr(iBem) + ')' + #13 +
              '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' + #13 +
              '   AND (MOECODIGO = ' + inttostr(iMoeCodigo) + ')' + #13;

      if not ExecSQL(sSql, False) then
        Raise Exception.Create(MessageInfo);
    end;
  end;
  //----------------------------------------------------------------------------------
  // Prepara os ClientDataSet's que irão gravar o saldo do bem
  //----------------------------------------------------------------------------------
  _dMTBem.sqlSaldoContabBem.Prepare;
  _dMTBem.sqlSaldoContabBem.ParamByName('IDBEM').AsInteger     := iBem;
  _dMTBem.sqlSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
  _dMTBem.sqlSaldoContabBem.ParamByName('DATASLD').AsDate      := dDataSld;
  _dMTBem.sqlSaldoContabBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
  FcdsSaldoContabBem.Data := _dMTBem.sqlSaldoContabBem.Data;
  _dMTBem.sqlSldCtbBemxDep.Prepare;
  _dMTBem.sqlSldCtbBemxDep.ParamByName('IDBEM').AsInteger      := iBem;
  _dMTBem.sqlSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
  _dMTBem.sqlSldCtbBemxDep.ParamByName('DATASLD').AsDate       := dDataSld;
  _dMTBem.sqlSldCtbBemxDep.ParamByName('MOECODIGO').AsInteger  := iMoeCodigo;
  _dMTBem.sqlSldCtbBemxDep.ParamByName('IDTAXADEP').AsInteger  := iTaxaDep;
  FcdsSldCtbBemxDep.Data  := _dMTBem.sqlSldCtbBemxDep.Data;
  //----------------------------------------------------------------------------------
  // Inicializa as variáveis de trabalho
  //----------------------------------------------------------------------------------
  if not cdsSaldoContabBem.IsEmpty then
  begin
    nSValOrg         := FcdsSaldoContabBem.FieldByName('VALORG').AsFloat;
    nSCmBem          := FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat;
    nSReavValOrg     := FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat;
    nSReavCmBem      := FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat;
    nSUltReavValOrg  := FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat;
    nSUltReavCmBem   := FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
    nSDepLanc        := FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat;
    nSCmDep          := FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat;
    nSReavDepLanc    := FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat;
    nSReavCmDep      := FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat;
    nSUltReavDepLanc := FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat;
    nSUltReavCmDep   := FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat;
  end
  else
  begin
    nSValOrg         := 0;
    nSCmBem          := 0;
    nSReavValOrg     := 0;
    nSReavCmBem      := 0;
    nSUltReavValOrg  := 0;
    nSUltReavCmBem   := 0;
    nSDepLanc        := 0;
    nSCmDep          := 0;
    nSReavDepLanc    := 0;
    nSReavCmDep      := 0;
    nSUltReavDepLanc := 0;
    nSUltReavCmDep   := 0;
  end;
  //----------------------------------------------------------------------------------
  // Registra o grupo, localização e responsável
  //----------------------------------------------------------------------------------
  isGrupo       := iGrupo;
  isLocalizacao := iLocalizacao;
  isResponsavel := iResponsavel;
  isConjunto    := iConjunto;
  isAtivProjeto := iAtivProjeto;
  //----------------------------------------------------------------------------------
  // Todas as movimentações, exceto REAVALIAÇÃO
  //----------------------------------------------------------------------------------
  if iCodMov = 0 then
  begin
  //-------------------------------------------------------------------------------
  // Caso a data de Atualização já exista no cadastro, atualizar dados
  //-------------------------------------------------------------------------------
    if FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
    begin
      if iPai = 1 then
      begin
        FcdsSaldoContabBem.Edit;
        FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg         + naValOrg;
        FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem          + naCmBem;
        FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg     + naReavValOrg;
        FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem      + naReavCmBem;
        FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := nSUltReavValOrg  + naUltReavValOrg;
        FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := nSUltReavCmBem   + naUltReavCmBem;
        FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
        FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
        FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
        FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
        //-------------------------------------------------------------------------

        if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
          FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
        else
          FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
        //-------------------------------------------------------------------------
        FcdsSaldoContabBem.Post;
      end;

      if FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
      begin
        FcdsSldCtbBemxDep.Edit;
        FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat        := nSDepLanc        + naDepLanc;
        FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat          := nSCmDep          + naCmDep;
        FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat    := nSReavDepLanc    + naReavDepLanc;
        FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat      := nSReavCmDep      + naReavCmDep;
        FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat := nSUltReavDepLanc + naUltReavDepLanc;
        FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat   := nSUltReavCmDep   + naUltReavCmDep;
        FcdsSldCtbBemxDep.Post;
      end
      else
      begin
        FcdsSldCtbBemxDep.Append;
        FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
        FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
        FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
        FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
        FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
        FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
        FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
        FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + naReavDepLanc;
        FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + naReavCmDep;
        FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc + naUltReavDepLanc;
        FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep   + naUltReavCmDep;
        FcdsSldCtbBemxDep.Post;
      end;
    end
    else
    //-------------------------------------------------------------------------------
    // Caso a data de Atualização não exista no cadastro, inserir saldo
    //-------------------------------------------------------------------------------
    begin
      if iPai = 1 then
      begin
        FcdsSaldoContabBem.Append;
        FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger         := iBem;
        FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger      := iEmpresaProp;
        FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime   := dDataSld;
        FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger     := iMoeCodigo;
        FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg        + naValOrg;
        FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem         + naCmBem;
        FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg    + naReavValOrg;
        FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem     + naReavCmBem;
        FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := nSUltReavValOrg + naUltReavValOrg;
        FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := nSUltReavCmBem  + naUltReavCmBem;
        FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
        FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
        FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
        FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
        //-------------------------------------------------------------------------
        if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
          FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
        else
          FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
        //-------------------------------------------------------------------------
        FcdsSaldoContabBem.Post;
      end;
      FcdsSldCtbBemxDep.Append;
      FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
      FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
      FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
      FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
      FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
      FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
      FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
      FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + naReavDepLanc;
      FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + naReavCmDep;
      FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc + naUltReavDepLanc;
      FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep   + naUltReavCmDep;
      FcdsSldCtbBemxDep.Post;
    end;
  end
  else
  //----------------------------------------------------------------------------------
  // Atualização de saldo decorrente de REAVALIAÇÃO
  //----------------------------------------------------------------------------------
    if iCodMov = 1 then
    begin
      //-------------------------------------------------------------------------------
      // Caso a data de Atualização já exista no cadastro, atualizar dados
      //-------------------------------------------------------------------------------
      if cdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
      begin
        if iPai = 1 then
        begin
          FcdsSaldoContabBem.Edit;
          FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg         + naValOrg;
          FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem          + naCmBem;
          FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg     + nSUltReavValOrg;
          FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem      + nSUltReavCmBem;
          FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := naUltReavValOrg;
          FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := naUltReavCmBem;
          FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
          FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
          FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
          FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
          //-------------------------------------------------------------------------
          if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
            FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
          else
            FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
          //-------------------------------------------------------------------------
          FcdsSaldoContabBem.Post;
        end;

        if cdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime = dDataSld then
        begin
          FcdsSldCtbBemxDep.Edit;
          FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat        := nSDepLanc        + naDepLanc;
          FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat          := nSCmDep          + naCmDep;
          FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat    := nSReavDepLanc    + nSUltReavDepLanc;
          FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat      := nSReavCmDep      + nSUltReavCmDep;
          FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat := naUltReavDepLanc;
          FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat   := naUltReavCmDep;
          FcdsSldCtbBemxDep.Post;
        end
        else
        begin
          FcdsSldCtbBemxDep.Append;
          FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
          FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
          FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
          FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
          FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
          FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
          FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
          FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + nSUltReavDepLanc;
          FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + nSUltReavCmDep;
          FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := naUltReavDepLanc;
          FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := naUltReavCmDep;
          FcdsSldCtbBemxDep.Post;
        end;
      end
      else
      //-------------------------------------------------------------------------------
      // Caso a data de Atualização não exista no cadastro, inserir saldo
      //-------------------------------------------------------------------------------
      begin
        if iPai = 1 then
        begin
          FcdsSaldoContabBem.Append;
          FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger         := iBem;
          FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger      := iEmpresaProp;
          FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime   := dDataSld;
          FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger     := iMoeCodigo;
          FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg         + naValOrg;
          FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem          + naCmBem;
          FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg     + nSUltReavValOrg;
          FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem      + nSUltReavCmBem;
          FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := naUltReavValOrg;
          FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := naUltReavCmBem;
          FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
          FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
          FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
          FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
          //-------------------------------------------------------------------------
          if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
            FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
          else
            FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
            //-------------------------------------------------------------------------
          FcdsSaldoContabBem.Post;
        end;
        FcdsSldCtbBemxDep.Append;
        FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := iBem;
        FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := iEmpresaProp;
        FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := dDataSld;
        FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
        FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
        FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc        + naDepLanc;
        FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep          + naCmDep;
        FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc    + nSUltReavDepLanc;
        FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep      + nSUltReavCmDep;
        FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := naUltReavDepLanc;
        FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := naUltReavCmDep;
        FcdsSldCtbBemxDep.Post;
      end;
    end
    else
    //----------------------------------------------------------------------------------
    // Reconstroi Saldo Contábil do Bem
    //----------------------------------------------------------------------------------
    if iCodMov = 2 then
    begin
      nSValOrg         := 0;
      nSCmBem          := 0;
      nSDepLanc        := 0;
      nSCmDep          := 0;
      nSReavValOrg     := 0;
      nSReavCmBem      := 0;
      nSReavDepLanc    := 0;
      nSReavCmDep      := 0;
      nSUltReavValOrg  := 0;
      nSUltReavCmBem   := 0;
      nSUltReavDepLanc := 0;
      nSUltReavCmDep   := 0;
      //-------------------------------------------------------------------------------
      // Prepara o ClientDataSet que irá fornecer os valores movimentados
      // no bem por moeda x taxa depreciação
      //-------------------------------------------------------------------------------
      _dMTBem.sqlRCMovContabBem.Prepare;
      _dMTBem.sqlRCMovContabBem.ParamByName('PIDBEM').AsInteger     := iBem;
      _dMTBem.sqlRCMovContabBem.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
      _dMTBem.sqlRCMovContabBem.ParamByName('PMOECODIGO').AsInteger := iMoeCodigo;
      _dMTBem.sqlRCMovContabBem.ParamByName('PIDTAXADEP').AsInteger := iTaxaDep;
      FcdsMovContabBem.Data := _dMTBem.sqlRCMovContabBem.Data;
      //-------------------------------------------------------------------------------
      while not FcdsMovContabBem.EOF do
      begin
        nSValOrg         := nSValOrg         + fcdsMovContabBem.FieldByName('VALORG').AsFloat;
        nSCmBem          := nSCmBem          + fcdsMovContabBem.FieldByName('CMBEM').AsFloat;
        nSDepLanc        := nSDepLanc        + fcdsMovContabBem.FieldByName('DEPLANC').AsFloat;
        nSCmDep          := nSCmDep          + fcdsMovContabBem.FieldByName('CMDEP').AsFloat;
        nSReavValOrg     := nSReavValOrg     + fcdsMovContabBem.FieldByName('REAVVALORG').AsFloat;
        nSReavCmBem      := nSReavCmBem      + fcdsMovContabBem.FieldByName('REAVCMBEM').AsFloat;
        nSReavDepLanc    := nSReavDepLanc    + fcdsMovContabBem.FieldByName('REAVDEPLANC').AsFloat;
        nSReavCmDep      := nSReavCmDep      + fcdsMovContabBem.FieldByName('REAVCMDEP').AsFloat;
        nSUltReavValOrg  := nSUltReavValOrg  + fcdsMovContabBem.FieldByName('ULTREAVVALORG').AsFloat;
        nSUltReavCmBem   := nSUltReavCmBem   + fcdsMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
        nSUltReavDepLanc := nSUltReavDepLanc + fcdsMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
        nSUltReavCmDep   := nSUltReavCmDep   + fcdsMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
        //----------------------------------------------------------------------------
        if iPai = 1 then
        begin
          FcdsSaldoContabBem.Append;
          FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger        := FcdsMovContabBem.FieldByName('IDBEM').AsInteger;
          FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger     := FcdsMovContabBem.FieldByName('IDPESSOA').AsInteger;
          FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime  := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
          FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger    := iMoeCodigo;
          FcdsSaldoContabBem.FieldByName('VALORG').AsFloat         := nSValOrg;
          FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat          := nSCmBem;
          FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat     := nSReavValOrg;
          FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat      := nSReavCmBem;
          FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg;
          FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem;
               FcdsSaldoContabBem.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsSldCtbBemxDep.Append;
            FcdsSldCtbBemxDep.FieldByName('IDBEM').AsInteger           := FcdsMovContabBem.FieldByName('IDBEM').AsInteger;
            FcdsSldCtbBemxDep.FieldByName('IDPESSOA').AsInteger        := FcdsMovContabBem.FieldByName('IDPESSOA').AsInteger;
            FcdsSldCtbBemxDep.FieldByName('DATASLDBEM').AsDateTime     := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            FcdsSldCtbBemxDep.FieldByName('MOECODIGO').AsInteger       := iMoeCodigo;
            FcdsSldCtbBemxDep.FieldByName('IDSLDCTBBEMXDEP').AsInteger := iTaxaDep;
            FcdsSldCtbBemxDep.FieldByName('DEPLANC').AsFloat           := nSDepLanc;
            FcdsSldCtbBemxDep.FieldByName('CMDEP').AsFloat             := nSCmDep;
            FcdsSldCtbBemxDep.FieldByName('REAVDEPLANC').AsFloat       := nSReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('REAVCMDEP').AsFloat         := nSReavCmDep;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc;
            FcdsSldCtbBemxDep.FieldByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep;
            FcdsSldCtbBemxDep.Post;
            //----------------------------------------------------------------------------
            FcdsMovContabBem.Next;
         end;
         FcdsMovContabBem.Close;
         //-------------------------------------------------------------------------------
         // Recoloca os grupos/localizações/responsáveis dos saldos reconstruidos
         //-------------------------------------------------------------------------------
         FcdsSaldoContabBem.Last;
         while not cdsSaldoContabBem.BOF do
         begin
            //----------------------------------------------------------------------------
            // Dados anteriores do bem
            //----------------------------------------------------------------------------
            _dMTBem.sqlMovTransf.Prepare;
            _dMTBem.sqlMovTransf.ParamByName('IDBEM').AsInteger     := iBem;
            _dMTBem.sqlMovTransf.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            FcdsMovTransf.Data := _dMTBem.sqlMovTransf.Data;
            //----------------------------------------------------------------------------
            while (not FcdsSaldoContabBem.BOF) and (FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger = iBem) and
                                                   (FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger = iEmpresaProp) do
            begin
               //-------------------------------------------------------------------------
               // Atualiza os dados na tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Edit;
               FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := isGrupo;
               FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := isLocalizacao;
               FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := isResponsavel;
               FcdsSaldoContabBem.FieldByName('IDCONJUNTO').AsInteger    := isConjunto;
               //-------------------------------------------------------------------------
               if (isAtivProjeto > 0) or (isAtivProjeto = -1) then
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').AsInteger := isAtivProjeto
               else
                  FcdsSaldoContabBem.FieldByName('UNIDNEGOC').Clear;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Post;
               //-------------------------------------------------------------------------
               // Verifica mudança no grupo, localização, responsável,
               // Conjunto ou Atividade/Projeto do bem
               //-------------------------------------------------------------------------
               if FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime = FcdsMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime then
               begin
                  dDataMov := FcdsMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  while (not FcdsMovTransf.EOF) and
                        (FcdsMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                  begin
                     if (not FcdsMovTransf.FieldByName('IDGRUPANT').IsNull) and (not FcdsMovTransf.FieldByName('IDGRUPO').IsNull) then
                        isGrupo       := FcdsMovTransf.FieldByName('IDGRUPANT').AsInteger;
                     if (not FcdsMovTransf.FieldByName('IDLOCALANT').IsNull) and (not FcdsMovTransf.FieldByName('IDLOCALIZACAO').IsNull) then
                        isLocalizacao := FcdsMovTransf.FieldByName('IDLOCALANT').AsInteger;
                     if (not FcdsMovTransf.FieldByName('IDRESPANT').IsNull) and (not FcdsMovTransf.FieldByName('IDRESPONSAVEL').IsNull) then
                        isResponsavel := FcdsMovTransf.FieldByName('IDRESPANT').AsInteger;
                     //-------------------------------------------------------------------
                     if (not FcdsMovTransf.FieldByName('IDCONJANT').IsNull) and (not FcdsMovTransf.FieldByName('IDCONJUNTO').IsNull) then
                        isConjunto    := FcdsMovTransf.FieldByName('IDCONJANT').AsInteger;
                     if (not FcdsMovTransf.FieldByName('UNIDNEGOCANT').IsNull) and (not FcdsMovTransf.FieldByName('UNIDNEGOC').IsNull) then
                        isAtivProjeto := FcdsMovTransf.FieldByName('UNIDNEGOCANT').AsInteger;
                     //-------------------------------------------------------------------
                     FcdsMovTransf.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsSaldoContabBem.Prior;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Gravação dos dados nas tabelas SALDOCONTABBEM e SLDCTBBEMXDEP
      //----------------------------------------------------------------------------------
      bResult := ApplyCds(FcdsSaldoContabBem,_dbSaldoContabBem,[],[]);
      sMensagem := _dbSaldoContabBem.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);

      bResult := ApplyCds(FcdsSldCtbBemxDep,_dbSldCtbBemxDep,[],[]);
      sMensagem := _dbSldCtbBemxDep.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;

function TCtrlImobBem.CarregaImagem(nImagem: Extended): OleVariant;
var
   sSql : String;
begin
  sSql := ' SELECT I.IDIMAGEM, I.IMAGEM, I.DESCRIMAGEM ' + #13 +
           ' FROM IMAGENS I ' + #13 +
           ' WHERE I.IDIMAGEM = ' + FloatToStr(nImagem);
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlImobBem.CMTranslate(sIgor: String): String;
begin
  Result := sIgor;
end;

function TCtrlImobBem.ComplZeros(sCodigo: String; iTam: Integer): string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;

function TCtrlImobBem.ConversaoMoeda(nValor: Extended; iMoeda: Integer;
  dData: tDatetime): Extended;
var
   nFator, nValMin, nResult : Extended;
   iFatorDec, iNumDecimais, iFlgArredonda : Integer;
   sFatorDec : String;
begin
   try
      nFator := CotacaoMoeda(iMoeda, dData, iNumDecimais, iFlgArredonda);
      if nFator < 0 then
         raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      nResult := nValor / nFator;
      //----------------------------------------------------------------------------------
      // Retorna os valores na precisão cadastrada no Global para a Moeda Padrão
      //----------------------------------------------------------------------------------
      if iMoeda = ParamCAF.MOEDAPADRAO then
      begin
         if ParamCAF.MOEPADRAODECIMAIS > 0 then
            nValMin := 1 / Power(10,ParamCAF.MOEPADRAODECIMAIS)
         else
            nValMin := 0;
         //-------------------------------------------------------------------------------
         if abs(nResult) >= nValMin then
         begin
            iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
            if ParamCAF.MOEPADRAODECIMAIS > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
            end else
            begin
               sFatorDec := '#0';
            end;
            nResult := strtofloat(FormatFloat(sFatorDec,((nResult * iFatorDec) / iFatorDec)));
         end;
      end else
      begin
         if iNumDecimais > 0 then
            nValMin := 1 / Power(10,iNumDecimais)
         else
            nValMin := 0;
         //-------------------------------------------------------------------------------
         if abs(nResult) >= nValMin then
         begin
            iFatorDec := 10 * iNumDecimais;
            if iNumDecimais > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',iNumDecimais);
            end else
            begin
               sFatorDec := '#0';
            end;
            nResult := strtofloat(FormatFloat(sFatorDec,((nResult * iFatorDec) / iFatorDec)));
         end;
      end;
      Result := nResult;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := 0;
      end;
   end;
end;

function TCtrlImobBem.ConvNum(nValor: Extended): Extended;
begin
  Result := strtofloat(Format('%20.5f',[nValor]));
end;

function TCtrlImobBem.CotacaoMoeda(iMoeda: Integer; dData: tDatetime;
  var iNumDecimais, iFlgArredonda: Integer): Extended;
var
   sData               : String;
   cdsMoeda, cdsMoedaC : TClientDataSet;

begin
   cdsMoeda  := TClientDataSet.Create(nil);
   cdsMoedaC := TClientDataSet.Create(nil);
   //-------------------------------------------------------------------------------------
   try
      cdsMoeda.Data := GetDataPacket(' SELECT MOECODIGO, MOEPERIODICIDADE, MOEDESC, ' + #13 +
                                     '        (2) AS NUMDECIMAIS, (1) AS FLGARREDONDA ' + #13 +
                                     ' FROM MOEDA ' + #13 +
                                     ' WHERE MOECODIGO = ' + inttostr(iMoeda));
      //----------------------------------------------------------------------------------
      if not cdsMoeda.FieldByName('NUMDECIMAIS').IsNull then
      begin
         iNumDecimais  := cdsMoeda.FieldByName('NUMDECIMAIS').AsInteger;
         iFlgArredonda := cdsMoeda.FieldByName('FLGARREDONDA').AsInteger;
      end else
      begin
         iNumDecimais  := 2;
         iFlgArredonda := 1;
      end;
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'A' then
      begin
         sData := copy(datetostr(dData),7,4);
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ' + #13 +
                                         '   AND (COTMESREF = ' + QuotedStr(sData) + ') ');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.IsEmpty then
         begin
            MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                           CMTranslate(' do Ano ') + sData + CMTranslate(' não Cadastrada!');
            result := -1;
         end else
         begin
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
            if result = 0 then
            begin
               MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                              CMTranslate(' do Ano ') + sData + CMTranslate(' está igual a Zero!');
               result := -1;
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
      begin
         sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE (MOECODIGO = ' + inttostr(iMoeda) + ') ' + #13 +
                                         '   AND (COTMESREF = ' + QuotedStr(sData) + ') ');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.IsEmpty then
         begin
            MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                           CMTranslate(' do Mês ') + sData + CMTranslate(' não Cadastrada!');
            result := -1;
         end else
         begin
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
            if result = 0 then
            begin
               MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                              CMTranslate(' do Mês ') + sData + CMTranslate(' está igual a Zero!');
               result := -1;
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      if cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
      begin
         cdsMoedaC.Data := GetDataPacket(' SELECT COTVALOR ' + #13 +
                                         ' FROM COTACAOMOEDA ' + #13 +
                                         ' WHERE MOECODIGO = ' + inttostr(iMoeda) + #13 +
                                         '   AND COTDATA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dData)) + ',' + QuotedStr('DD/MM/YYYY') + ')');
         //-------------------------------------------------------------------------------
         if cdsMoedaC.isEmpty then
         begin
            MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                           CMTranslate(' do Dia ') + datetostr(dData) + CMTranslate(' não Cadastrada!');
            result := -1;
         end else
         begin
            result := cdsMoedaC.FieldByName('COTVALOR').AsCurrency;
            if result = 0 then
            begin
               MessageInfo := CMTranslate('Cotação da Moeda ') + cdsMoeda.FieldByName('MOEDESC').AsString +
                              CMTranslate(' do Dia ') + datetostr(dData) + CMTranslate(' está igual a Zero!');
               result := -1;
            end;
         end;
      end else
      begin
         Result := 1;
      end;
   finally
      cdsMoeda.Free;
      cdsMoedaC.Free;
   end;

end;

constructor TCtrlImobBem.Create;
begin
  inherited;
  Fcds                := TClientDataSet.Create(nil);
  FcdsBemxMoeda       := TClientDataSet.Create(nil);
  FcdsBemxDep         := TClientDataSet.Create(nil);
  FcdsPlanoPatroxBem  := TClientDataSet.Create(nil);
  FcdsImagem          := TClientDataSet.Create(nil);
  FcdsConjunto        := TClientDataSet.Create(nil);

  FcdsSaldoContabBem  := TClientDataSet.Create(nil);
  FcdsSldCtbBemxDep  := TClientDataSet.Create(nil);
  FcdsMovContabBem   := TClientDataSet.Create(nil);
  FcdsMovTransf      := TClientDataSet.Create(nil);
  FcdsTaxasDep       := TClientDataSet.Create(nil);
  
  _dbBem               := TDBBem.Create(Self);
  _dbBemxMoeda         := TDBBemxMoeda.Create(Self);
  _dbBemxDep           := TDBBemxDep.Create(Self);
  _dbPlanoPatroxBem    := TDBPlanoPatroxBem.Create(Self);
  _dbImagem           := TDBImagemBem.Create(Self);

  _dbSaldoContabBem   := TDBSaldoContabBem.Create(Self);
  _dbSldCtbBemxDep    := TDBSldCtbBemxDep.Create(Self);

  _dMTBem             := tdtmMTBem.Create(Self);

  ParamCAF          := TCtrlParamCAF.Create;
  GrupoContab       := TCtrlGrupoContab.Create;
  Conjunto          := TCtrlConjunto.Create;
  HistMovBem        := TCtrlHistMovBem.Create;
  DiasUteis         := TDiasUteis.Create;
  ImobCAFxContab    := TCtrlImobCAFxContab.Create;
end;

destructor TCtrlImobBem.Destroy;
begin
  inherited;
  FreeAndNil( Fcds );
  FreeAndNil( FcdsBemxMoeda );
  FreeAndNil( FcdsBemxDep );
  FreeAndNil( FcdsPlanoPatroxBem );
  FreeAndNil( FcdsImagem );
  FreeAndNil( FcdsConjunto );
  FreeAndNil( FcdsSaldoContabBem );
  FreeAndNil( FcdsSldCtbBemxDep );
  FreeAndNil( FcdsMovContabBem );
  FreeAndNil( FcdsMovTransf );
  FreeAndNil( FcdsTaxasDep );

  FreeAndNil( _dbBem );
  FreeAndNil( _dbBemxMoeda );
  FreeAndNil( _dbBemxDep );
  FreeAndNil( _dbPlanoPatroxBem );
  FreeAndNil( _dbImagem );

  FreeAndNil( _dbSaldoContabBem );
  FreeAndNil( _dbSldCtbBemxDep );

  FreeAndNil( _dMTBem );

  FreeAndNil( ParamCAF );
  FreeAndNil( Conjunto );
  FreeAndNil( GrupoContab );
  FreeAndNil( HistMovBem );

  FreeAndNil( DiasUteis );
  FreeAndNil( ImobCAFxContab );
end;

procedure TCtrlImobBem.DoChangeDataBase;
begin
  inherited;

  _dbBem.DataBaseName := DataBaseName;
  _dbBemxMoeda.DataBaseName := DataBaseName;
  _dbBemxDep.DataBaseName := DataBaseName;
  _dbPlanoPatroxBem.DataBaseName := DataBaseName;
  _dbImagem.DataBaseName := DataBaseName;
end;

function TCtrlImobBem.EstornaEntrada(iModulo, iEmpresaProp, iUsuario,
  iBem: Integer; dDataMov, dDataEst: tDateTime;
  iTipoEstorna: Integer): Boolean;
Var
   iExercicio, iPeriodo,
   iTotPlan, iPlan       : Integer;
   aPlanilha             : Array [1..12] of Integer;
   aDataMov              : Array [1..12] of tDateTime;
   sSql                  : String;

begin
   try
      //----------------------------------------------------------------------------------
      // Posiciona a tabela BEM
      //----------------------------------------------------------------------------------
      if Fcds.IsEmpty then
         Fcds.Data := ListaBem(iEmpresaProp,iBem);
      //----------------------------------------------------------------------------------
      if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MessageInfo := CMTranslate('Bem em Saída Temporária!');
         Raise Exception.Create(MessageInfo);
      end else
      if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MessageInfo := CMTranslate('Bem Baixado!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após sua entrada nos bens com
      // controle total
      //----------------------------------------------------------------------------------
      if Fcds.FieldByName('CONTROLE').AsString = 'T' then
      begin
         _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO '+
                                    ' FROM   HISTORICOMOVIMENTACAO ' +
                                    ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                                    '   AND (IDBEM = ' + inttostr(iBem) + ')' +
                                    '   AND (IDTIPOMOVIMENTACAO <> 01)  '+    // ENTRADA TOTAL
                                    '   AND (IDTIPOMOVIMENTACAO <> 03)  '+    // ENTRADA FISICA
                                    '   AND (IDTIPOMOVIMENTACAO <> 17)  '+    // INCLUSAO DE DEPRECIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 15)  '+    // CORRECAO MONETARIA
                                    '   AND (IDTIPOMOVIMENTACAO <> 21)  '+    // CORRECAO MONETARIA DA DEPRECIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 32)  '+    // INCLUSAO DO SALDO DE REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 33)  '+    // INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 22)  '+    // CORRECAO MONETARIA DA REAVALIACAO
                                    '   AND (IDTIPOMOVIMENTACAO <> 19)  ');   // CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO
         if not _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Existe movimentação após a Entrada do Bem no Ativo Fixo. Consulte Movimentação!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if iTipoEstorna < 2 then
      begin
         if (ParamCAF.INTEGRACONTAB = 'S') and
            (Fcds.FieldByName('FLGBEMINTCONTAB').AsInteger = 1) and
            (Fcds.FieldByName('CONTROLE').AsString = 'T') and
            ((Fcds.FieldByName('IDMODULO').AsInteger = 7) or
             (Fcds.FieldByName('IDMODULO').AsInteger = 54)) then
         begin
            {if CAFxContab.VerificaPeriodoContabil(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                  Fcds.FieldByName('DTACONTAB').AsDateTime,
                                                  iExercicio,iPeriodo) then}

            if ImobCafxContab.VerificaPeriodoContabil(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                  Fcds.FieldByName('DTACONTAB').AsDateTime,
                                                  iExercicio,iPeriodo) then
            begin
               _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                                          ' FROM   HISTORICOMOVIMENTACAO '+
                                          ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                                          '   AND (IDBEM    = ' + inttostr(iBem) + ') ');
               iTotPlan := 0;
               while not _cds.EOF do
               begin
                  if not ((_cds.FieldByName('PLNCODIGO').AsInteger <= 0) or
                          (_cds.FieldByName('PLNCODIGO').IsNull)) then
                  begin
                     iTotPlan := iTotPlan + 1;
                     aPlanilha[iTotPlan] := _cds.FieldByName('PLNCODIGO').AsInteger;
                     aDataMov[iTotPlan]  := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  end;
                  _cds.Next;
               end;
               //-------------------------------------------------------------------------
               // RETIRA O LINK DA PLANILHA CONTÁBIL
               //-------------------------------------------------------------------------
               sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                       ' SET PLNCODIGO = NULL '+
                       ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                       '                          FROM HISTORICOMOVIMENTACAO'+
                       '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                       '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + '))';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iPlan := 1;
               while iPlan <= iTotPlan do
               begin
                  if not ImobCafxContab.RemovePlanContab(iEmpresaProp) then
                  begin
                     if not ImobCafxContab.ImobLancaContab.EstornaLancaContab(iUsuario, aPlanilha[iPlan],
                                                                      iModulo,iEmpresaProp,
                                                                      ParamCAF.USAPLANOPATRO,
                                                                      datetostr(aDataMov[iPlan])) then
                     begin
                        MessageInfo := CMTranslate('Estorno Entrada : Estorno da Planilha Contabil não Executado !');
                        Raise Exception.Create(MessageInfo);
                     end;
                  end else
                  begin
                     if not ImobCafxContab.ImobLancaContab.ExcluiLancaContab(iUsuario, aPlanilha[iPlan],
                                                                     iModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                     begin
                        MessageInfo := CMTranslate('Estorno Entrada : Remoção da Planilha Contabil não Executada !');
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  iPlan := iPlan + 1;
               end;
            end else
            begin
               MessageInfo := CMTranslate('Erro no Estorno das Planilhas Contábeis !');
               Raise Exception.Create(MessageInfo);
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, IDREAVALACRESC ' + #13 +
                                 ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                                 '   AND (IDBEM    = ' + inttostr(iBem) + ')');
      while not _cds.Eof do
      begin
         if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32 then  // Saldo de Reavaliações
         begin
            sSql := ' DELETE FROM REAVALXDEP ' +
                    ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then
               Raise Exception.Create(MessageInfo + ' (REAVALXDEP)');
            sSql := ' DELETE FROM REAVALXMOEDA ' +
                    ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then
               Raise Exception.Create(MessageInfo + ' (REAVALXMOEDA)');
            sSql := ' DELETE FROM REAVALIACAO ' +
                    ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then
               Raise Exception.Create(MessageInfo + ' (REAVALIACAO)');
         end;
         //-------------------------------------------------------------------------------
         if not ((_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 04) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12)) then  // Saldo de Reavaliações
         begin
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
            if not ExecSQL(sSql, (iModulo <> 8)) then  // MANUT
               Raise Exception.Create(MessageInfo + ' (VLRHISTMOVBEM)');
         end;
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Remove os Registros de Movimentacao Inicial do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (HISTORICOMOVIMENTACAO)');
      //----------------------------------------------------------------------------------
      // Remove os Registros de Saldos Contábeis do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM SLDCTBBEMXDEP ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (SLDCTBBEMXDEP)');
      sSql := ' DELETE FROM SALDOCONTABBEM ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (SALDOCONTABBEM)');
      //----------------------------------------------------------------------------------
      // Remove o Bem, caso o estorno seja total
      //----------------------------------------------------------------------------------
      if (iTipoEstorna = 0) or (iTipoEstorna = 2) then
      begin
         sSql := ' DELETE FROM BEMCOTACAO ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);

         sSql := ' DELETE FROM PLANOPATROXBEM ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);

         sSql := ' DELETE FROM BEMXDEP ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (BEMXDEP)');

         sSql := ' DELETE FROM BEMXMOEDA ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (BEMXMOEDA)');

         sSql := ' DELETE FROM BEM ' +
                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                 '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo + ' (BEM)');

         if not Fcds.FieldByName('IDIMAGEM').IsNull then
         begin
            sSql := ' DELETE FROM IMAGENS ' +
                    ' WHERE IDIMAGEM = ' + floattostr(Fcds.FieldByName('IDIMAGEM').AsFloat);
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;

end;

function TCtrlImobBem.ExecutaAlteracaoBemManut: Boolean;
Var
   sSql : String;
   nSeqHist : Extended;
   iFlgPai : Integer;

begin
   try
      FcdsConjunto.Data := Conjunto.ListaConjunto(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                  Fcds.FieldByName('IDCONJUNTO').AsFloat);
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO ' +
                                 ' FROM HISTORICOMOVIMENTACAO ' +
                                 ' WHERE IDBEM = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger) +
                                 '   AND IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) );
      while not _cds.EOF do
      begin
         if not ((_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 04) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11) or
                 (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12)) then
         begin
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, False) then  // MANUT
               Raise Exception.Create(MessageInfo + ' (VLRHISTMOVBEM)');
         end;
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Remove os Registros de Movimentacao Inicial do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) +
              '   AND IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (HISTORICOMOVIMENTACAO)');
      //----------------------------------------------------------------------------------
      // Remove os Registros de Saldos Contábeis do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM SLDCTBBEMXDEP ' +
              ' WHERE IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) +
              '   AND IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (SLDCTBBEMXDEP)');

      sSql := ' DELETE FROM SALDOCONTABBEM ' +
              ' WHERE IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) +
              '   AND IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (SALDOCONTABBEM)');
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BEMXDEP ' +
              ' WHERE (IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) + ')' +
              '   AND (IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (BEMXDEP)');

      sSql := ' DELETE FROM BEMXMOEDA ' +
              ' WHERE (IDPESSOA = ' + inttostr(Fcds.FieldByName('IDPESSOA').AsInteger) + ')' +
              '   AND (IDBEM    = ' + inttostr(Fcds.FieldByName('IDBEM').AsInteger) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo + ' (BEMXMOEDA)');
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         CdsToDbObject(FcdsBemxMoeda,_dbBemxMoeda);
         _dbBemxMoeda.IDBEM.AsFloat := Fcds.FieldByName('IDBEM').AsFloat;
         if not _dbBemxMoeda.Insert then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         CdsToDbObject(FcdsBemxDep,_dbBemxDep);
         _dbBemxDep.IDBEM.AsFloat := Fcds.FieldByName('IDBEM').AsFloat;
         if not _dbBemxDep.Insert then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      //----------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(Fcds.FieldByName('IDBEM').AsFloat,
                                                Fcds.FieldByName('IDPESSOA').AsFloat,
                                                Fcds.FieldByName('IDMODULO').AsFloat,
                                                03,
                                                Fcds.FieldByName('DTAINCLUSAO').AsDatetime,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                '',
                                                0,
                                                -1,
                                                '',
                                                -1,
                                                0,
                                                0,
                                                '');
      if nSeqHist = -1 then
         Raise Exception.Create(HistMovBem.MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra o valor no histórico
         //-------------------------------------------------------------------------------
         if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                 FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                 0,
                                                 FcdsBemxMoeda.FieldByName('VALORG').AsFloat) then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
            begin
               if not AtualizaSaldoContabBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                             Fcds.FieldByName('IDBEM').AsInteger,
                                             Fcds.FieldByName('DTAINCLUSAO').AsDateTime,
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                             FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                             0, 0, 0, 0,
                                             0, 0, 0, 0,
                                             Fcds.FieldByName('IDGRUPO').AsInteger,
                                             FcdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                             FcdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                             Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                             Fcds.FieldByName('UNIDNEGOCIO').AsInteger,
                                             0, iFlgPai) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
            end;
            FcdsBemxDep.Next;
         end;
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;

end;

function TCtrlImobBem.ExecutaAlteracaoEntradaCtrlTotal(
  nUsuario: Extended): Boolean;
var
   nPlanilha : Extended;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExecutaAlteracaoEntradaCtrlTotal(nUsuario,
                                                                    Fcds.Data,
                                                                    FcdsBemxMoeda.Data,
                                                                    FcdsBemxDep.Data,
                                                                    FcdsPlanoPatroxBem.Data,
                                                                    FcdsImagem.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
    //-------------------------------------------------------------------------------
    // Remove os lançamentos de historico e contabilidade
    //-------------------------------------------------------------------------------
      if not EstornaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                            Fcds.FieldByName('IDPESSOA').AsInteger,
                            Trunc(nUsuario),
                            Fcds.FieldByName('IDBEM').AsInteger,
                            Fcds.FieldByName('DTAINCLUSAO').AsDateTime,
                            Fcds.FieldByName('DTAINCLUSAO').AsDateTime, 0) then
        Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      // Registra os novos dados do bem
       //-------------------------------------------------------------------------------
        if ExecutaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                          Fcds.FieldByName('IDPESSOA').AsInteger,
                          trunc(nUsuario), nPlanilha) < 0 then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlImobBem.ExecutaAlteracaoEntradaRestrita: Boolean;
var
   sSql : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExecutaAlteracaoEntradaRestrita(Fcds.Data, FcdsImagem.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
    end
    else
    begin
      try
      //-------------------------------------------------------------------------------
      // Tratamento da Imagem
      //-------------------------------------------------------------------------------
        sSql := ' DELETE FROM IMAGENS ' +
                ' WHERE IDIMAGEM = ' + FloatToStr(FcdsImagem.FieldByName('IDIMAGEM').AsFloat);

        if not ExecSQL(sSql, False) then
          Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
        if not FcdsImagem.FieldByName('IMAGEM').IsNull then
        begin
          CdsToDbObject(FcdsImagem,_dbImagem);
          if not _dbImagem.Insert then
            Raise Exception.Create(_dbImagem.MessageInfo);
        //----------------------------------------------------------------------------
          Fcds.Edit;
          Fcds.FieldbyName('IDIMAGEM').AsFloat := _dbImagem.IDIMAGEM.AsFloat;
         end
         else
         begin
          Fcds.Edit;
          Fcds.FieldbyName('IDIMAGEM').Clear;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados na tabela BEM
         //-------------------------------------------------------------------------------
         CdsToDbObject(Fcds,_dbBem);
         if not _dbBem.Update then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         if Fcds.FieldByName('IDMODULO').AsInteger = 8 then
            if not ExecutaAlteracaoBemManut then
               Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;       
end;

function TCtrlImobBem.ExecutaCadastroBem(nModulo, nEmpresaProp,
  nUsuario: Extended; sTipoEntrada: String; nValorTotal: Extended;
  iQuantidade: Integer; nIdImovel: Integer): Boolean;
type
  rBemxDep = Record
    IDBEMXDEP  : Integer;
    TAXADEP    : Extended;
  end;

var
  nIdBem, nPlanilha, nPlacaAtual,
  nValOrg, nValorMoeda            : Extended;
  sDigMascPlaca                   : String;
  iQtd, iAux                      : Integer;
  aBemxDep                        : Array of rBemxDep;
  iaBemxDep                       : Integer;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExecutaCadastroBem(nModulo, nEmpresaProp, nUsuario,
                                                      sTipoEntrada, nValorTotal, iQuantidade,
                                                      Fcds.Data,
                                                      FcdsTaxasDep.Data,
                                                      FcdsPlanoPatroxBem.Data,
                                                      FcdsImagem.Data,
                                                      nIdImovel);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      if sTipoEntrada <> 'I' then
        if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
        begin
          MessageInfo := CMTranslate('Bem em Saída Temporária!');
          Raise Exception.Create(MessageInfo);
        end
        else
          if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
          begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
          end;

      if iQuantidade <= 0 then
      begin
        MessageInfo := CMTranslate('É obrigatório fornecer a quantidade de bens!');
        Raise Exception.Create(MessageInfo);
      end;

      if (Fcds.FieldByName('CONTROLE').AsString = 'T') and (nValorTotal = 0) and (nModulo <> 54) then
      begin
        MessageInfo := CMTranslate('O valor de aquisição do(s) bem(ns) deve(m) ser informado(s)!');
        Raise Exception.Create(MessageInfo);
      end;

      if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
      begin
        MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
        Raise Exception.Create(MessageInfo);
      end;

     FcdsBemxDep.Data := FcdsTaxasDep.Data;

     nValOrg := strtofloat(FormatFloat('#0.00',(((nValorTotal / iQuantidade) * 100) / 100)));
     Fcds.Edit;
     Fcds.FieldByName('VALHISTORICO').AsFloat := nValOrg;

     iaBemxDep := 0;
     FcdsBemxDep.First;
     while not FcdsBemxDep.EOF do
     begin
      if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  = ParamCAF.MOEDAOFICIAL then
      begin
        FcdsBemxDep.Edit;
        FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.Post;
      end;
      SetLength(aBemxDep,iaBemxDep + 1);
      aBemxDep[iaBemxDep].IDBEMXDEP  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
      aBemxDep[iaBemxDep].TAXADEP    := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
      iaBemxDep := iaBemxDep + 1;
      FcdsBemxDep.Next;
     end;

     FcdsBemxMoeda.Data := ListaBemxMoeda(nEmpresaProp,0);

     FcdsBemxMoeda.Append;
     FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := Fcds.FieldByName('IDPESSOA').AsInteger;
     FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
     FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValOrg;
     FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
     FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
     FcdsBemxMoeda.Post;

     if ParamCAF.MOEDAFISCAL > 0 then
     begin
      nValorMoeda := ConversaoMoeda(nValOrg,ParamCAF.MOEDAFISCAL,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(MessageInfo);

      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;

      iAux := 0;
      while iAux < iaBemxDep do
      begin
        FcdsBemxDep.Append;
        FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
        FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAFISCAL;
        FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
        FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
        FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime  := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.Post;
        iAux := iAux + 1;
      end;
     end;

     if ParamCAF.MOEDAGERENCIAL > 0 then
     begin
      nValorMoeda := ConversaoMoeda(nValOrg,ParamCAF.MOEDAGERENCIAL,
                                        Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(MessageInfo);

      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;
      iAux := 0;

      while iAux < iaBemxDep do
      begin
        FcdsBemxDep.Append;
        FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
        FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAGERENCIAL;
        FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
        FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
        FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.Post;
        iAux := iAux + 1;
      end;
     end;

     if ParamCAF.MOEDAGERENCIALB > 0 then
     begin
      nValorMoeda := ConversaoMoeda(nValOrg,ParamCAF.MOEDAGERENCIALB,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(MessageInfo);

      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;
      iAux := 0;

      while iAux < iaBemxDep do
      begin
         FcdsBemxDep.Append;
         FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
         FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
         FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
         FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
         FcdsBemxDep.Post;
         iAux := iAux + 1;
      end;
     end;

     if ParamCAF.MOEDAGERENCIALC > 0 then
     begin
      nValorMoeda := ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIALC,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(CtrlImobBem.MessageInfo);

      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;

      iAux := 0;
      while iAux < iaBemxDep do
      begin
         FcdsBemxDep.Append;
         FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAGERENCIALC;
         FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
         FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
         FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
         FcdsBemxDep.Post;
         iAux := iAux + 1;
      end;
     end;

     if sTipoEntrada = 'I' then
     begin
     // Inclusão do Bem
     // Complementa a placa com os digitos de subplaca
      if not Fcds.FieldByName('PLACA').IsNull then
      begin
        nPlacaAtual := Fcds.FieldByName('PLACA').AsFloat;
        if iQuantidade > 1 then
        begin
          _cds.Data := GetDataPacket(' SELECT DIGMASCPLACA '+
                                          ' FROM PARAMETROSCAFMANUT '+
                                          ' WHERE IDPESSOA = ' + Fcds.FieldByName('IDPESSOA').AsString);
          sDigMascPlaca := StringOfChar('0',_cds.FieldByName('DIGMASCPLACA').AsInteger);

          nPlacaAtual := strtofloat(floattostr(nPlacaAtual) + sDigMascPlaca);
          Fcds.FieldByName('PLACA').AsFloat := nPlacaAtual;
        end;
      end
      else
      begin
        nPlacaAtual := 0;
      end;

      nPlanilha := -1;
      iQtd := 1;
      while iQtd <= iQuantidade do
      begin
      // Alimenta os datasets da classe de negócio
       {cds.Data               := Fcds.Data;
       cdsBemxMoeda.Data      := FcdsBemxMoeda.Data;
       cdsBemxDep.Data        := FcdsBemxDep.Data;
       cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
       cdsImagem.Data         := FcdsImagem.Data;}
       //-------------------------------------------------------------------------
       nIdBem := ExecutaEntrada(trunc(nModulo), trunc(nEmpresaProp),
                                    trunc(nUsuario), nPlanilha, nIdImovel);
       //-------------------------------------------------------------------------
       if nIdBem < 0 then
          Raise Exception.Create(MessageInfo);
       //-------------------------------------------------------------------------
       FIdBem := Trunc(nIdBem);
       //-------------------------------------------------------------------------
       iQtd := iQtd + 1;
       //-------------------------------------------------------------------------
       if iQtd <= iQuantidade then
       begin
        if nPlacaAtual <> 0 then
        begin
          Fcds.Edit;
          Fcds.FieldByName('PLACA').AsFloat := GeraProxPlacaTomb(Fcds.FieldByName('IDPESSOA').AsFloat,
                                                                 Fcds.FieldByName('IDGRUPO').AsFloat,
                                                                 Fcds.FieldByName('IDCLASSEBEM').AsFloat,
                                                                 Fcds.FieldByName('PLACA').AsFloat);
        end;
       end;
      end;
     end
     else
     //-------------------------------------------------------------------------------
     // Alteração Completa de Bem
     //-------------------------------------------------------------------------------
      if sTipoEntrada = 'AC' then
      begin
      //----------------------------------------------------------------------------
      // Alimenta os datasets da classe de negócio
      //----------------------------------------------------------------------------
        {
        cds.Data               := Fcds.Data;
        cdsBemxMoeda.Data      := FcdsBemxMoeda.Data;
        cdsBemxDep.Data        := FcdsBemxDep.Data;
        cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
        cdsImagem.Data         := FcdsImagem.Data;}
        if nModulo <> 8 then
        begin
           if not ExecutaAlteracaoEntradaCtrlTotal(nUsuario) then
              Raise Exception.Create(MessageInfo);
        end
        else
        begin
          if not ExecutaAlteracaoEntradaRestrita then
            Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FIdBem := Fcds.FieldByName('IDBEM').AsInteger;
         end else
         //-------------------------------------------------------------------------------
         // Alteração Restrita de Bem com Controle Total
         //-------------------------------------------------------------------------------
         if sTipoEntrada = 'AR' then
         begin
            Fcds.First;
            if not ExecutaAlteracaoEntradaRestrita then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FIdBem := Fcds.FieldByName('IDBEM').AsInteger;
         end else
         begin
          //----------------------------------------------------------------------------
          // Remove o Bem do Cadastro
          //----------------------------------------------------------------------------
          {Bem.cds.Data := Fcds.Data;
          Bem.cdsBemxMoeda.Data := FcdsBemxMoeda.Data;
          Bem.cdsBemxDep.Data := FcdsBemxDep.Data;
          Bem.cdsPlanoPatroxBem.Data := FcdsPlanoPatroxBem.Data;
          Bem.cdsImagem.Data := FcdsImagem.Data;}
          //----------------------------------------------------------------------------
          if not EstornaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                                Fcds.FieldByName('IDPESSOA').AsInteger,
                                Trunc(nUsuario),
                                Fcds.FieldByName('IDBEM').AsInteger,
                                Fcds.FieldByName('DTAINCLUSAO').AsDateTime,
                                Fcds.FieldByName('DTAINCLUSAO').AsDateTime, 0) then
            Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FIdBem := Fcds.FieldByName('IDBEM').AsInteger;
         end;
         Result := True;
         Commit;
      except
         on E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
  end;
end;

function TCtrlImobBem.ExecutaControleTotal(nModulo, nEmpresaProp, nUsuario,
  nBem: Extended; dDataMov: TDateTime; nGrupo, nSubConta,
  nAtivProjeto: Extended; dDataInicioDep: TDateTime;
  nValHistorico: Extended; bFlgBemIntContab: Boolean;
  dDtaContab: TDateTime): Boolean;
var
   nSeqHist, nPlanilha      : Extended;
   dDataUltMov, dDataUltDep : TDateTime;
   bIntegraContab,
   bCtaxCCusto              : Boolean;
   iExercicio, iPeriodo,
   iFlgPai                  : Integer;
   sGrupo, sSql             : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExecutaControleTotal(nModulo, nEmpresaProp, nUsuario, nBem,
                                                        dDataMov, nGrupo, nSubConta, nAtivProjeto,
                                                        dDataInicioDep, nValHistorico,
                                                        bFlgBemIntContab, dDtaContab);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      //-------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //-------------------------------------------------------------------------------
      Fcds.Data := ListaBem(nEmpresaProp, nBem);
      if Fcds.IsEmpty then
        Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
      //-------------------------------------------------------------------------------
      if nModulo <= 0 then
        Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
      else
        if nModulo <> Fcds.FieldByName('IDMODULO').asInteger then
          Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipula-lo'));
      //-------------------------------------------------------------------------------
      if nEmpresaProp <= 0 then
        Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
      else
        if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
          Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
      //-------------------------------------------------------------------------------
      if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
        MessageInfo := CMTranslate('Bem em Saída Temporária!');
        Raise Exception.Create(MessageInfo);
      end
      else
        if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
        begin
          MessageInfo := CMTranslate('Bem Baixado!');
          Raise Exception.Create(MessageInfo);
        end;
      //-------------------------------------------------------------------------------
      if Fcds.FieldByName('CONTROLE').AsString = 'T' then
        Raise Exception.Create(CMTranslate('O Bem já está em Controle Total!'));
      //-------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
      begin
        MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
        Raise Exception.Create(MessageInfo);
      end;
      //-------------------------------------------------------------------------------
      if dDataMov <= 0 then
        Raise Exception.Create(CMTranslate('Informe o Data da Movimentação!'))
      else
        if dDataMov < Fcds.FieldByName('DTAINCLUSAO').AsDateTime then
          Raise Exception.Create(CMTranslate('A Data da Movimentação não pode ser Anterior a Data de Entrada do Bem no Ativo Fixo!'));
      //-------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //-------------------------------------------------------------------------------
      if not VerificaPeriodoCAF(nEmpresaProp, nBem,
                                Fcds.FieldByName('FLGIMOVEL').AsInteger,
                                '01', dDataMov, dDataUltMov, dDataUltDep) then
        Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      if nGrupo <= 0 then
        Raise Exception.Create(CMTranslate('Informe o Grupo Contábil do Bem!'));
      //-------------------------------------------------------------------------------
      if nValHistorico <= 0 then
        Raise Exception.Create(CMTranslate('Informe o Valor Histórico de Aquisição do Bem!'));
      //-------------------------------------------------------------------------------
      if dDataInicioDep <= 0 then
        Raise Exception.Create(CMTranslate('Informe o Data de Inicio da Depreciação do Bem!'))
      else
        if dDataInicioDep < Fcds.FieldByName('DTAINCLUSAO').AsDateTime then
          Raise Exception.Create(CMTranslate('A Data de Inicio da Depreciação não pode ser anterior a Data de Entrada do Bem no Ativo Fixo!'));
      //-------------------------------------------------------------------------------
      if bFlgBemIntContab and (dDtaContab <= 0) then
        Raise Exception.Create(CMTranslate('Informe a Data de Contabilização da Transferência para Controle Total!'));
      //-------------------------------------------------------------------------------
      // Alimenta as propriedades de integração contábil
      //-------------------------------------------------------------------------------
      bIntegraContab := ImobCAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
      //-------------------------------------------------------------------------------
      nPlanilha := -1;
      if bIntegraContab and bFlgBemIntContab then
      begin
        if not ImobCAFxContab.VerificaPeriodoContabil(Fcds.FieldByName('IDPESSOA').AsInteger,
                                                  dDtaContab, iExercicio, iPeriodo) then
          Raise Exception.Create(ImobCAFxContab.MessageInfo);
      //----------------------------------------------------------------------------
      // Inicializa a query de montagem da Planilha Contábil
      //----------------------------------------------------------------------------
        if not ImobCAFxContab.InicializaMontaContab then
          Raise Exception.Create(ImobCAFxContab.MessageInfo);
      //----------------------------------------------------------------------------
      // Inicializa a query com a Parametrização contábil
      //----------------------------------------------------------------------------
        if not ImobCAFxContab.MontaParamCAFxContab(Fcds.FieldByName('IDPESSOA').AsInteger,
                                               ParamCAF.PLANOVIGENTE) then
          Raise Exception.Create(ImobCAFxContab.MessageInfo);
      //----------------------------------------------------------------------------
      // Lê a Dependencia da Conta Contábil do Centro de Custo
      //----------------------------------------------------------------------------
        bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
      //----------------------------------------------------------------------------
      // Prepara o DataSet que irá acumular a planilha contábil para a integração
      //----------------------------------------------------------------------------
        if not ImobCAFxContab.ContabilizaEntrada(Fcds.FieldByName('IDMODULO').AsInteger,
                                             Fcds.FieldByName('IDPESSOA').AsInteger,
                                             Fcds.FieldByName('IDBEM').AsInteger,
                                             Trunc(nGrupo),
                                             Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                             Trunc(nAtivProjeto),
                                             Trunc(nSubConta),
                                             Fcds.FieldByName('PLACA').AsString,
                                             Fcds.FieldByName('DESBEM').AsString, sGrupo,
                                             dDtaContab, nValHistorico,
                                             iExercicio, iPeriodo, bCtaxCCusto) then
          Raise Exception.Create(ImobCAFxContab.MessageInfo);
      //----------------------------------------------------------------------------
      // Registra a Planilha Contábil
      //----------------------------------------------------------------------------
        nPlanilha := ImobCAFxContab.RegistraPlanilhaContabil(Fcds.FieldByName('IDMODULO').AsFloat,
                                                         Fcds.FieldByName('IDPESSOA').AsFloat,
                                                         nUsuario, DateToStr(dDtaContab));
        if nPlanilha < 0 then
          Raise Exception.Create(MessageInfo);
      end;
      //-------------------------------------------------------------------------------
      // Registra a Entrada do Bem
      //-------------------------------------------------------------------------------
      if not RegistraEntradaTotal(nEmpresaProp, nBem,
                                  nGrupo, nSubConta, nAtivProjeto,
                                  dDataInicioDep, nValHistorico,
                                  bFlgBemIntContab, dDtaContab) then
        Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      // Remove o lançamento com controle físico anterior
      //-------------------------------------------------------------------------------
        sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                ' WHERE (IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO ' +
                '                           FROM HISTORICOMOVIMENTACAO ' +
                '                           WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                '                             AND (IDBEM    = ' + Floattostr(nBem) + ')))';
        if not ExecSQL(sSql, True) then
          Raise Exception.Create(MessageInfo);

        sSql := ' DELETE FROM HISTORICOMOVIMENTACAO '+
                ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                '   AND (IDBEM    = ' + Floattostr(nBem) + ')';

        if not ExecSQL(sSql, True) then
          Raise Exception.Create(MessageInfo);

        sSql := ' DELETE FROM SLDCTBBEMXDEP '+
                ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                '   AND (IDBEM    = ' + Floattostr(nBem) + ')';

        if not ExecSQL(sSql, True) then
          Raise Exception.Create(MessageInfo);

        sSql := ' DELETE FROM SALDOCONTABBEM '+
                ' WHERE (IDPESSOA = ' + FloattoStr(nEmpresaProp) + ')' +
                '   AND (IDBEM    = ' + Floattostr(nBem) + ')';

        if not ExecSQL(sSql, True) then
          Raise Exception.Create(MessageInfo);

      //-------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //-------------------------------------------------------------------------------
        nSeqHist := HistMovBem.RegistraHistMovBem(Fcds.FieldByName('IDBEM').AsFloat,     // IDBEM
                                                  Fcds.FieldByName('IDPESSOA').AsFloat,  // IDPESSOA
                                                  Fcds.FieldByName('IDMODULO').AsFloat,  // IDMODULO
                                                  01,                                    // IDTIPOMOVIMENTACAO
                                                  dDataMov,                              // DATAMOVIMENTACAO
                                                  -1,                                    // IDREAVALACRESC
                                                  -1,                                    // DATAULTDEP
                                                  -1,                                    // IDGRUPANT
                                                  -1,                                    // IDCONJANT
                                                  -1,                                    // IDLOCALANT
                                                  -1,                                    // IDRESPANT
                                                  -1,                                    // PLACAANT
                                                  nPlanilha,                             // PLNCODIGO
                                                  '',                                    // OBSREAVAL
                                                  0,                                     // TIPDEPPRORATA
                                                  -1,                                    // IDTIPODESPESA
                                                  '',                                    // OBSACRESCIMO
                                                  -1,                                    // IDMOTIVOBAIXA
                                                  0,                                     // PROPBAIXA
                                                  0,                                     // VALVENDAOFI
                                                  '');                                   // OBSBAIXA
        if nSeqHist = -1 then
          Raise Exception.Create(HistMovBem.MessageInfo);
      //-------------------------------------------------------------------------------
      // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
      //-------------------------------------------------------------------------------
        FcdsBemxMoeda.First;
        while not FcdsBemxMoeda.EOF do
        begin
        //----------------------------------------------------------------------------
        // Registra o valor no histórico
        //----------------------------------------------------------------------------
          if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                  FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                  0,
                                                  FcdsBemxMoeda.FieldByName('VALORG').AsFloat) then
            Raise Exception.Create(HistMovBem.MessageInfo);
        //----------------------------------------------------------------------------
        // Atualiza o saldo contábil
        //----------------------------------------------------------------------------
        iFlgPai := 1;
        FcdsBemxDep.First;

        while not FcdsBemxDep.EOF do
        begin
          if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
          begin
            if not AtualizaSaldoContabBem(Fcds.FieldByName('IDPESSOA').AsInteger,
                                          Fcds.FieldByName('IDBEM').AsInteger,
                                          dDataMov,
                                          FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                          FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                          0, 0, 0, 0,
                                          0, 0, 0, 0,
                                          Fcds.FieldByName('IDGRUPO').AsInteger,
                                          Fcds.FieldByName('IDLOCALIZACAO').AsInteger,
                                          Fcds.FieldByName('IDRESPONSAVEL').AsInteger,
                                          Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                          Fcds.FieldByName('UNIDNEGOC').AsInteger,
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
end;

(* Cássio - SOL 92381 KINTANA 394180
   Começa a inclusão do bem do imóvel adquirido.
   Nessa função é importante passar o ID do Imóvel (iIdImovel), para que a
   segregação na origem seja executada. *)
function TCtrlImobBem.ExecutaEntrada(iModulo, iEmpresaProp,
  iUsuario: Integer; var nPlanilha: Extended; iIdImovel : Integer): LongInt;
var
   iFlgSemPlaca, iExercicio,
   iPeriodo, icBemxDep, iFlgPai,
   iLocalizacao, iResponsavel    : Integer;
   sGrupo, sSql                  : String;
   nTipoMov, nSeqHist            : Extended;
   bCtaxCCusto                   : Boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(Fcds.FieldByName('IDPESSOA').AsFloat) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Validação dos parâmetros obrigatórios para entrada de bens
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('REGISTRO').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer o Código de Registro do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      if not ((Fcds.FieldbyName('REGISTRO').AsString = 'I') or
              (Fcds.FieldbyName('REGISTRO').AsString = 'O')) then
      begin
         MessageInfo := CMTranslate('Código de registro inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('REGISTRO').AsString = 'O' then
      begin
         Fcds.Edit;
         Fcds.FieldByName('CONTROLE').AsString := 'F';
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('CONTROLE').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a Forma de Controle do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      if not ((Fcds.FieldbyName('CONTROLE').AsString = 'T') or (Fcds.FieldbyName('CONTROLE').AsString = 'F')) then
      begin
         MessageInfo := CMTranslate('Código de controle inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDMODULO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do módulo CM inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDPESSOA').IsNull then
      begin
         MessageInfo := CMTranslate('Código da EMPRESA PROPRIETÁRIA Inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT NOME '+
                                    ' FROM PESSOA '+
                                    ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')');
         if _cds.isEmpty then
         begin
            MessageInfo := CMTranslate('Código da EMPRESA PROPRIETÁRIA Inválido ou não cadastrado!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDCONJUNTO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do CONJUNTO do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDLOCALIZACAO, IDRESPONSAVEL, DESCCONJUNTO '+
                                    ' FROM CONJUNTO '+
                                    ' WHERE (IDPESSOA = '   + Fcds.FieldbyName('IDPESSOA').AsString + ')' +
                                    '   AND (IDCONJUNTO = ' + Fcds.FieldbyName('IDCONJUNTO').AsString + ')');
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código do CONJUNTO do bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
         iLocalizacao := _cds.FieldByName('IDLOCALIZACAO').AsInteger;
         iResponsavel := _cds.FieldByName('IDRESPONSAVEL').AsInteger;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDGRUPO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do GRUPO CONTÁBIL do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT G.IDGRUPO, G.NOME, G.FLGSEMPLACA '+
                                    ' FROM PLANOGRUPO PG, '+
                                    '      GRUPO G '+
                                    ' WHERE (PG.IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')' +
                                    '   AND (PG.IDGRUPO  = ' + Fcds.FieldbyName('IDGRUPO').AsString + ')'  +
                                    '   AND (PG.IDGRUPO = G.IDGRUPO)');
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código do GRUPO CONTÁBIL do bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
         iFlgSemPlaca := _cds.FieldByName('FLGSEMPLACA').AsInteger;
         sGrupo       := _cds.FieldByName('NOME').AsString;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDCLASSEBEM').IsNull then
      begin
         MessageInfo := CMTranslate('Código da CLASSE do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDCLASSEBEM ' +
                                    ' FROM CLASSEDEBEM ' +
                                    ' WHERE (IDCLASSEBEM = ' + Fcds.FieldbyName('IDCLASSEBEM').AsString + ')') ;
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código de CLASSE de bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if not Fcds.FieldbyName('CODSUBCONTA').IsNull then
      begin
         _cds.Data := GetDataPacket(' SELECT CODSUBCONTA ' +
                                    ' FROM SUBCONTA ' +
                                    ' WHERE (CODSUBCONTA = ' + Fcds.FieldbyName('CODSUBCONTA').AsString + ')' +
                                    '   AND (IDPESSOA = ' + Fcds.FieldbyName('IDPESSOA').AsString + ')' );
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código de SUBCONTA de bem inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if (not Fcds.FieldbyName('IDFORNSERV').IsNull) and (Fcds.FieldbyName('IDFORNSERV').AsInteger <> 0) then
      begin
         _cds.Data := GetDataPacket(' SELECT NOME '+
                                    ' FROM PESSOA '+
                                    ' WHERE (IDPESSOA = ' + Fcds.FieldbyName('IDFORNSERV').AsString + ')' );
         if _cds.isEmpty then
         begin
            MessageInfo := CMTranslate('Código do FORNECEDOR Inválido ou não cadastrado!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('PLACA').IsNull then
      begin
         if iFlgSemPlaca = 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer o Número de TOMBAMENTO do bem!');
            Raise Exception.Create(MessageInfo);
         end;
      end else
      begin
         if not PlacaUnica(Fcds.FieldbyName('IDPESSOA').AsFloat,
                           Fcds.FieldbyName('PLACA').AsString) then
         begin
            MessageInfo := CMTranslate('Número da PLACA DE TOMBAMENTO já alocado a outro bem!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('IDSITUACAO').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a ID da SITUAÇÃO FÍSICA do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDSITUACAO ' +
                                    ' FROM SITUACAO ' +
                                    ' WHERE (IDSITUACAO = ' + Fcds.FieldbyName('IDSITUACAO').AsString + ')' );
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código da SITUAÇÃO FÍSICA de bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('DESBEM').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a DESCRIÇÃO do bem!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('FLGBEMINTCONTAB').AsInteger = 1 then
      begin
         if Fcds.FieldbyName('DTACONTAB').IsNull then
         begin
            MessageInfo := CMTranslate('A data do registro do custo de entrada do bem na contabilidade deve ser informada!');
            Raise Exception.Create(MessageInfo);
         end;
      end else
      begin
         Fcds.Edit;
         Fcds.FieldbyName('DTACONTAB').Clear;
      end;
      //----------------------------------------------------------------------------------
      if Fcds.FieldbyName('UNIDNEGOC').IsNull then
      begin
         Fcds.Edit;
         Fcds.FieldbyName('UNIDNEGOC').AsFloat := ParamCAF.ATIVPROJETO;
      end;
      //----------------------------------------------------------------------------------
      // Tratamento da Imagem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM IMAGENS ' +
              ' WHERE IDIMAGEM = ' + floattostr(FcdsImagem.FieldByName('IDIMAGEM').AsFloat);
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      if not FcdsImagem.FieldByName('IMAGEM').IsNull then
      begin
         CdsToDbObject(FcdsImagem,_dbImagem);
         if not _dbImagem.Insert then
            Raise Exception.Create(_dbImagem.MessageInfo);
         Fcds.Edit;
         Fcds.FieldbyName('IDIMAGEM').AsFloat := _dbImagem.IDIMAGEM.AsFloat;
      end else
      begin
         Fcds.Edit;
         Fcds.FieldbyName('IDIMAGEM').Clear;
      end;
      //----------------------------------------------------------------------------------
      // Verificar se todas as taxas de depreciação foram informadas
      //----------------------------------------------------------------------------------
      icBemxDep := 0;
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial then
            icBemxDep := icBemxDep + 1;
         FcdsBemxDep.Next;
      end;
      if icBemxDep <> ParamCAF.NUMTAXADEP then
      begin
         MessageInfo := CMTranslate('As taxas de depreciação não foram totalmente informadas!');
         Raise Exception.Create(MessageInfo);
      end;
      //==================================================================================
      // Gravação dos dados nas tabelas BEM, BEMXMOEDA, BEMXDEP, PLANOPATROXBEM
      // Não deve ser usado o ApplyCds, pois o mesmo traz o status do form
      //==================================================================================
      CdsToDbObject(Fcds,_dbBem);
      if not _dbBem.InsertAs(Fcds.FieldByName('IDBEM').AsFloat) then
         Raise Exception.Create(_dbBem.MessageInfo);
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         CdsToDbObject(FcdsBemxMoeda,_dbBemxMoeda);
         _dbBemxMoeda.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
         if not _dbBemxMoeda.Insert then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         CdsToDbObject(FcdsBemxDep,_dbBemxDep);
         _dbBemxDep.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
         if not _dbBemxDep.Insert then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsPlanoPatroxBem.First;
      while not FcdsPlanoPatroxBem.EOF do
      begin
         CdsToDbObject(FcdsPlanoPatroxBem,_dbPlanoPatroxBem);
         _dbPlanoPatroxBem.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
         if not _dbPlanoPatroxBem.Insert then
            Raise Exception.Create(_dbPlanoPatroxBem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsPlanoPatroxBem.Next;
      end;
      //----------------------------------------------------------------------------------
      // Registra a entrada na contabilidade
      //----------------------------------------------------------------------------------
      nPlanilha := -1;
      if (ParamCAF.INTEGRACONTAB = 'S') and
         (_dbBem.FLGBEMINTCONTAB.AsInteger = 1) and
         (_dbBem.CONTROLE.AsString = 'T') and
         ((_dbBem.IDMODULO.AsInteger = 7) or (_dbBem.IDMODULO.AsInteger = 54)) then
      begin
        //--------------------------------------------------------------------------------
        // Verifica se é o período informado para  a contabilização é válido.
        //--------------------------------------------------------------------------------
         if not ImobCAFxContab.VerificaPeriodoContabil(_dbBem.IDPESSOA.AsInteger,
                                                   _dbBem.DTACONTAB.AsDateTime,
                                                   iExercicio, iPeriodo) then
            Raise Exception.Create(ImobCAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query de montagem da Planilha Contábil
         //-------------------------------------------------------------------------------
         if not ImobCAFxContab.InicializaMontaContab then
            Raise Exception.Create(ImobCAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa a query com a Parametrização contábil
         //-------------------------------------------------------------------------------
         if not ImobCAFxContab.MontaParamCAFxContab(_dbBem.IDPESSOA.AsInteger, ParamCAF.PLANOVIGENTE) then
            Raise Exception.Create(ImobCAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Lê a Dependencia da Conta Contábil do Centro de Custo
         //-------------------------------------------------------------------------------
         bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
         //-------------------------------------------------------------------------------
         // Leitura do valor a ser contabilizado
         //-------------------------------------------------------------------------------
         if not FcdsBemxMoeda.Locate('MOECODIGO',VarArrayOf([ParamCAF.MOEDAOFICIAL]),[]) then
            Raise Exception.Create(CMTranslate('Erro na leitura do valor a ser contabilizado'));
         //-------------------------------------------------------------------------------
         // Prepara o DataSet que irá acumular a planilha contábil para a integração
         //-------------------------------------------------------------------------------
         if not ImobCAFxContab.ContabilizaEntrada(_dbBem.IDMODULO.AsInteger, _dbBem.IDPESSOA.AsInteger,
                                              _dbBem.IDBEM.AsInteger, _dbBem.IDGRUPO.AsInteger,
                                              _dbBem.IDCONJUNTO.AsInteger, _dbBem.UNIDNEGOC.AsInteger,
                                              _dbBem.CODSUBCONTA.AsInteger, _dbBem.PLACA.AsString,
                                              _dbBem.DESBEM.AsString, sGrupo,
                                              _dbBem.DTACONTAB.AsDateTime,
                                              FcdsBemxMoeda.FieldByName('VALORG').AsFloat,
                                              iExercicio, iPeriodo, bCtaxCCusto) then
            Raise Exception.Create(ImobCAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         (* Cássio - SOL 92381 KINTANA 394180
            Neste ponto é feita a contabilização, chamando a função que faz integração
            com a Contabilidade, que está declarada na classe TCtrlImobCAFxContab.
            Neste método possui um parâmetro novo (iIdImovel), imprecindível
            para a segrergação na origem. *)
         nPlanilha := ImobCAFxContab.RegistraPlanilhaContabil(_dbBem.IDMODULO.AsFloat,
                                                          _dbBem.IDPESSOA.AsFloat,
                                                          iUsuario,
                                                          _dbBem.DTACONTAB.AsString);//, iIdImovel);
         if nPlanilha < 0 then
            Raise Exception.Create(ImobCAFxContab.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Registra a entrada no histórico
      //----------------------------------------------------------------------------------
      if _dbBem.CONTROLE.AsString = 'T' then
         nTipoMov := 01
      else
         nTipoMov := 03;
      //----------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                nTipoMov,                      // IDTIPOMOVIMENTACAO
                                                _dbBem.DTAINCLUSAO.AsDatetime, // DATAMOVIMENTACAO
                                                -1,                            // IDREAVALACRESC
                                                -1,                            // DATAULTDEP
                                                -1,                            // IDGRUPANT
                                                -1,                            // IDCONJANT
                                                -1,                            // IDLOCALANT
                                                -1,                            // IDRESPANT
                                                -1,                            // PLACAANT
                                                nPlanilha,                     // PLNCODIGO
                                                '',                            // OBSREAVAL
                                                0,                             // TIPDEPPRORATA
                                                -1,                            // IDTIPODESPESA
                                                '',                            // OBSACRESCIMO
                                                -1,                            // IDMOTIVOBAIXA
                                                0,                             // PROPBAIXA
                                                0,                             // VALVENDAOFI
                                                '');                           // OBSBAIXA
      if nSeqHist = -1 then
         Raise Exception.Create(HistMovBem.MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra na tabela VLRHISTMOVBEM e Atualiza o saldo contábil
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra o valor no histórico
         //-------------------------------------------------------------------------------
         if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                 FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                 0,
                                                 FcdsBemxMoeda.FieldByName('VALORG').AsFloat) then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
            begin
               if not AtualizaSaldoContabBem(_dbBem.IDPESSOA.AsInteger,
                                             _dbBem.IDBEM.AsInteger,
                                             _dbBem.DTAINCLUSAO.AsDateTime,
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                             FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                             0, 0, 0, 0,
                                             0, 0, 0, 0,
                                             _dbBem.IDGRUPO.AsInteger,
                                             iLocalizacao,
                                             iResponsavel,
                                             _dbBem.IDCONJUNTO.AsInteger,
                                             _dbBem.UNIDNEGOC.AsInteger,
                                             0, iFlgPai) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
            end;
            FcdsBemxDep.Next;
         end;
         FcdsBemxMoeda.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := _dbBem.IdBem.AsInteger;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := -1;
      end;
   end;
end;

function TCtrlImobBem.ExecutaTransfPlaca(nModulo, nEmpresaProp, nBem,
  nPlacaNova: Extended; dDataMov: TDateTime): boolean;
var
   dDataUltMov, dDataUltDep : TDateTime;
   nSeqHist : Extended;
   iFlgPai : Integer;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExecutaTransfPlaca(nModulo, nEmpresaProp, nBem,
                                                      nPlacaNova, dDataMov);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      //-------------------------------------------------------------------------------
      // Posiciona a Tabela BEM no Bem que terá a Placa Substituída
      //-------------------------------------------------------------------------------
      Fcds.Data := ListaBem(nEmpresaProp, nBem);
      if Fcds.IsEmpty then
        Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
      //-------------------------------------------------------------------------------
        if nModulo <= 0 then
          Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
        else
          if nModulo <> Fcds.FieldByName('IDMODULO').asInteger then
            Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipula-lo'));
      //-------------------------------------------------------------------------------
        if Fcds.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
        begin
          MessageInfo := CMTranslate('Bem em Saída Temporária!');
          Raise Exception.Create(MessageInfo);
        end
        else
          if Fcds.FieldByName('BAIXATOTAL').AsString = 'S' then
          begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
          end;
      //-------------------------------------------------------------------------------
      // verifica se a placa nova não existe
      //-------------------------------------------------------------------------------
      if nPlacaNova <= 0 then
      begin
        MessageInfo := CMTranslate('É obrigatório fornecer o novo Número de TOMBAMENTO do bem!');
        Raise Exception.Create(MessageInfo);
      end
      else
      begin
        if not PlacaUnica(Fcds.FieldbyName('IDPESSOA').AsFloat,
                          FloatToStr(nPlacaNova)) then
        begin
          MessageInfo := CMTranslate('Novo Número da PLACA DE TOMBAMENTO já alocado a outro bem!');
          Raise Exception.Create(MessageInfo);
        end;
      end;
      //-------------------------------------------------------------------------------
      // Verifica se a data da movimentação é válida
      //-------------------------------------------------------------------------------
      if not VerificaPeriodoCAF(nEmpresaProp, nBem,
                                Fcds.FieldByName('FLGIMOVEL').AsInteger,
                               '04', dDataMov, dDataUltMov, dDataUltDep) then
        Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //-------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(nBem,                                  // IDBEM
                                                nEmpresaProp,                          // IDPESSOA
                                                nModulo,                               // IDMODULO
                                                04,                                    // IDTIPOMOVIMENTACAO
                                                dDataMov,                              // DATAMOVIMENTACAO
                                                -1,                                    // IDREAVALACRESC
                                                -1,                                    // DATAULTDEP
                                                -1,                                    // IDGRUPANT
                                                -1,                                    // IDCONJANT
                                                -1,                                    // IDLOCALANT
                                                -1,                                    // IDRESPANT
                                                Fcds.FieldByName('PLACA').AsFloat,     // PLACAANT
                                                -1,                                    // PLNCODIGO
                                                '',                                    // OBSREAVAL
                                                0,                                     // TIPDEPPRORATA
                                                -1,                                    // IDTIPODESPESA
                                                '',                                    // OBSACRESCIMO
                                                -1,                                    // IDMOTIVOBAIXA
                                                0,                                     // PROPBAIXA
                                                0,                                     // VALVENDAOFI
                                                '');                                   // OBSBAIXA
      if nSeqHist = -1 then
        Raise Exception.Create(HistMovBem.MessageInfo);
      //-------------------------------------------------------------------------------
      // Altera a Tabela BEM
      //-------------------------------------------------------------------------------
      Fcds.Edit;
      Fcds.FieldByName('PLACA').AsFloat := nPlacaNova;
      if not ApplyCds(Fcds,_dbBem,[],[]) then
        Raise Exception.Create(_dbBem.MessageInfo);
      //-------------------------------------------------------------------------------
      // Atualiza o saldo contábil
      //-------------------------------------------------------------------------------
      FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp, Fcds.FieldByName('IDCONJUNTO').AsFloat);
      FcdsBemxDep.Data := ListaBemxDep(nEmpresaProp, nBem);
      FcdsBemxMoeda.Data := ListaBemxMoeda(nEmpresaProp, nBem);

      while not FcdsBemxMoeda.EOF do
      begin
        iFlgPai := 1;
        FcdsBemxDep.First;

        while not FcdsBemxDep.EOF do
        begin
          if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
          begin
            if not AtualizaSaldoContabBem(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                          FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                          dDataMov,
                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                          0, 0, 0, 0,
                                          0, 0, 0, 0,
                                          0, 0, 0, 0,
                                          Fcds.FieldByName('IDGRUPO').AsInteger,
                                          FcdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                          FcdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                          Fcds.FieldByName('IDCONJUNTO').AsInteger,
                                          Fcds.FieldByName('UNIDNEGOC').AsInteger,
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
end;

function TCtrlImobBem.GeraProxPlacaTomb(nEmpresa, nGrupo, nClasse,
  nPlacaAtual: Extended): Extended;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca, sSql           : String;
   iAux                          : Integer;
   bEdPlaca, bOk                 : boolean;
begin
  try
    //----------------------------------------------------------------------------------
    // Recarga dos parametros do sistema
    //----------------------------------------------------------------------------------
    if not ParamCAF.CarregaProp(nEmpresa) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      bEdPlaca := ParamCAF.EDITACODBEM = 1;
      //----------------------------------------------------------------------------------
      case ParamCAF.SEQBEMEMP of
         0 : sCodPlaca := 'E'; {sequencial por Empresa}
         1 : sCodPlaca := 'G'; {sequencial por Grupo}
         2 : sCodPlaca := 'C'; {sequencial por Classe}
         3 : sCodPlaca := 'S'; {sequencial Puro}
      end;
      //----------------------------------------------------------------------------------
      sProxPlaca := '';
      bOk := False;
      while not bOk do
      begin
         if bEdPlaca then
         begin
            //----------------------------------------------------------------------------
            // Calcula o Numero da Próxima Placa de Patrimônio
            //----------------------------------------------------------------------------
            if ParamCAF.PROXIMAPLACA <= 0 then
            begin
               sProximoCodigo := '1';
            end else
            begin
               sProximoCodigo := FloatToStr(ParamCAF.PROXIMAPLACA);
            end;
            sDigMascPlaca := StringOfChar('0', ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + FloatToStr(StrToFloat(sProximoCodigo) + 1) +
                    ' WHERE IDPESSOA = ' + FloatToStr(nEmpresa);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Recarga dos parametros do sistema após a atualização
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(nEmpresa) then
            begin
               MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Calculo por GRUPO
            //----------------------------------------------------------------------------
            if sCodPlaca = 'G' then
            begin
               _cds.Data := GetDataPacket(' SELECT CLASSE FROM GRUPO ' +
                                          ' WHERE IDGRUPO  = ' + floattostr(nGrupo));
               sGrupo := trim(_cds.FieldByName('CLASSE').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sGrupo + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por CLASSE
            //----------------------------------------------------------------------------
            if sCodPlaca = 'C' then
            begin
               _cds.Data := GetDataPacket(' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                                          ' WHERE IDCLASSEBEM  = ' + floattostr(nClasse));
               sClasse := trim(_cds.FieldByName('CODHIERARQ').AsString);
               //-------------------------------------------------------------------------
               sProxPlaca := sClasse + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo por EMPRESA
            //----------------------------------------------------------------------------
            if sCodPlaca = 'E' then
            begin
               sMascaraEmpresa := '';
               for iAux := 1 to length(trim(FloatToStr(nEmpresa))) do
               begin
                  sMascaraEmpresa := sMascaraEmpresa + '9';
               end;
               //-------------------------------------------------------------------------
               sProxPlaca := ComplZeros(copy(FloatToStr(nPlacaAtual),1,length(sMascaraEmpresa))+
                                        sProximoCodigo,(Length(sMascaraEmpresa) + 9)) + sDigMascPlaca;
            end;
            //----------------------------------------------------------------------------
            // Calculo SEQUENCIAL
            //----------------------------------------------------------------------------
            if sCodPlaca = 'S' then
            begin
               sProxPlaca := sProximoCodigo + sDigMascPlaca;
            end;
         end else
         begin
            sDigMascPlaca := StringOfChar('0', ParamCAF.DIGMASCPLACA);
            //----------------------------------------------------------------------------
            if length(sDigMascPlaca) > 0 then
            begin
               sProxPlaca := copy(FloatToStr(nPlacaAtual),1,
                                  length(FloatToStr(nPlacaAtual))-length(sDigMascPlaca));
               sProxPlaca := FloatToStr(StrToFloat(sProxPlaca) + 1) + sDigMascPlaca;
            end else
            begin
               sProxPlaca := FloatToStr(nPlacaAtual + 1);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Confere se a placa calculada já existe
         //-------------------------------------------------------------------------------
         bOk := PlacaUnica(nEmpresa, sProxPlaca);
      end;
      result := StrToFloat(sProxPlaca);
   except
      on E : Exception do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlImobBem.ListaAcrescimoValor(nIdPessoa,
  nIdBem: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT A.IDACRESCIMO, A.IDMOVIMENTACAO, A.IDBEM, A.IDPESSOA, '+ #13 +
           '        A.DATAACRESCIMO '+ #13 +
           ' FROM ACRESCIMOVALOR A '+ #13 +
           ' WHERE (A.IDPESSOA    = '+ FloatToStr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (A.IDBEM = ' + FloatToStr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobBem.ListaAcrescValorxDep(nIdPessoa, nIdBem, nIdAcrescimo,
  nMoeCodigo, nIdAcrescimoxDep: Extended): OleVariant;
var
   sSql : String;
begin
  sSql := ' SELECT A.IDBEM, A.IDPESSOA, AD.MOECODIGO, M.MOEDESC, ' + #13 +
          '        AD.IDACRESCIMO, AD.IDACRESCIMOXDEP, AD.TAXADEP, GD.DESCTAXADEP, ' + #13 +
          '        AD.DEPLANC, AD.CMDEP, AD.DATAULTDEP, AD.DATAULTCM, AD.FLGDEPREC ' + #13 +
          ' FROM ACRESCIMOVALOR A, ' + #13 +
          '      ACRESCVALORXDEP AD, ' + #13 +
          '      MOEDA M, ' + #13 +
          '      BEM B, ' + #13 +
          '      GRUPOTAXADEP GD ' + #13 +
          ' WHERE (A.IDPESSOA    = '+ FloatToStr(nIdPessoa) +') ' + #13;
  //-------------------------------------------------------------------------------------
  if nIdBem <> -1 then
    sSql := sSql + '   AND (A.IDBEM = ' + FloatToStr(nIdBem) + ') ' + #13;
  //-------------------------------------------------------------------------------------
  if nIdAcrescimo <> -1 then
    sSql := sSql + '   AND (AD.IDACRESCIMO = ' + FloatToStr(nIdAcrescimo) + ') ' + #13;
  //-------------------------------------------------------------------------------------
  if nMoeCodigo <> -1 then
    sSql := sSql + '   AND (AD.MOECODIGO = ' + FloatToStr(nMoeCodigo) + ') ' + #13;
  //-------------------------------------------------------------------------------------
  if nIdAcrescimoxDep <> -1 then
    sSql := sSql + '   AND (AD.IDACRESCIMOXDEP = ' + FloatToStr(nIdAcrescimoxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
  sSql := sSql + '   AND (A.IDACRESCIMO   = AD.IDACRESCIMO) ' + #13 +
                 '   AND (AD.MOECODIGO    = M.MOECODIGO) ' + #13 +
                 '   AND (A.IDBEM         = B.IDBEM) ' + #13 +
                 '   AND (A.IDPESSOA      = B.IDPESSOA) ' + #13 +
                 '   AND (B.IDGRUPO       = GD.IDGRUPO) ' + #13 +
                 '   AND (B.IDPESSOA      = GD.IDPESSOA) ' + #13 +
                 '   AND (AD.IDACRESCIMOXDEP = GD.IDTAXADEP) ' + #13 +
                 ' ORDER BY AD.IDACRESCIMO, AD.MOECODIGO, AD.IDACRESCIMOXDEP ';
  //-------------------------------------------------------------------------------------
  Result := GetDataPacket(sSql);
end;

function TCtrlImobBem.ListaAcrescValorxMoeda(nIdPessoa, nIdBem,
  nIdAcrescimo, nMoeCodigo: Extended): OleVariant;
begin

end;

function TCtrlImobBem.ListaBem(nIdPessoa, nIdBem: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT B.IDBEM, B.IDPESSOA, B.IDFORNSERV, B.IDTERCEIRO, B.IDCLASSEBEM,                 ' + #13 +
           '        B.IDMODULO, B.CODSUBCONTA, B.IDITENSRECDEV, B.UNIDNEGOC, B.IDIMAGEM,            ' + #13 +
           '        B.IDSITUACAO, B.IDCONJUNTO, B.IDGRUPO, B.REGISTRO, B.DESBEM,                    ' + #13 +
           '        B.DTAINCLUSAO, B.DTANOTA, B.DATAINICIODEP, B.PROPBAIXA, B.CONTROLE,             ' + #13 +
           '        B.VALDEPINI, B.NUMSERIE, B.BAIXATOTAL, B.IDNOTA, B.COMPLNOTA, B.PLACA,          ' + #13 +
           '        B.VALHISTORICO, B.FLGSAIDATEMP, B.IDOPCIONAL, B.PROCESSOAQUIS,                  ' + #13 +
           '        B.EMPENHOAQUIS, B.PUBAUTOR, B.PUBEDITORA, B.PUBANO, B.FLGBEMINTCONTAB,          ' + #13 +
           '        B.DTACONTAB, B.PRIORIDADE, B.DATAINSTALACAO, B.DATATERMINOGAR, B.FLGPENHORA, ' + #13 +
           '        CB.DESCRICAO AS NOMECLASSE, S.DESCSITUACAO, C.DESCCONJUNTO,                     ' + #13 +
           '        F.NOME AS NOMEFORN, T.NOME AS NOMETERCEIRO, G.CLASSE, G.NOME AS DESCGRUPO,      ' + #13 +
           '        G.FLGIMOVEL, AP.NOME AS DESCATIVPROJ, SC.NOMESUBCONTA,                          ' + #13 +
           '        C.IDLOCALIZACAO, C.IDRESPONSAVEL,                                               ' + #13 +
           '        L.NOME AS DESCLOCALIZACAO, R.NOME AS NOMERESPONSAVEL,                           ' + #13 +
           '        L.CODCENTROCUSTO, CC.NOME AS DESCCCUSTO                                         ' + #13 +
           ' FROM BEM         B,  '+ #13 +
           '      CLASSEDEBEM CB, '+ #13 +
           '      SITUACAO    S,  '+ #13 +
           '      CONJUNTO    C,  '+ #13 +
           '      PESSOA      F,  '+ #13 +
           '      PESSOA      R,  '+ #13 +
           '      PESSOA      T,  '+ #13 +
           '      GRUPO       G,  '+ #13 +
           '      UNIDNEGOCIO AP, '+ #13 +
           '      SUBCONTA    SC, '+ #13 +
           '      LOCALIZACAO L,  '+ #13 +
           '      CENTCUST    CC  '+ #13 +
           ' WHERE (B.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (B.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'+ #13 +
                  '   AND (C.IDRESPONSAVEL  = R.IDPESSOA(+))'+ #13 +
                  '   AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'+ #13 +
                  '   AND (C.IDPESSOA       = L.IDPESSOA(+))'+ #13 +
                  '   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'+ #13 +
                  '   AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'+ #13 +
                  '   AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'+ #13 +
                  '   AND (B.IDSITUACAO     = S.IDSITUACAO(+))'+ #13 +
                  '   AND (B.IDFORNSERV     = F.IDPESSOA(+))'+ #13 +
                  '   AND (B.IDTERCEIRO     = T.IDPESSOA(+))'+ #13 +
                  '   AND (B.IDGRUPO        = G.IDGRUPO(+))'+ #13 +
                  '   AND (B.UNIDNEGOC      = AP.UNIDNEGOC(+))'+ #13 +
                  '   AND (B.IDPESSOA       = AP.IDPESSOA(+))'+ #13 +
                  '   AND (B.CODSUBCONTA    = SC.CODSUBCONTA(+))'+ #13 +
                  '   AND (B.IDPESSOA       = SC.IDPESSOA(+))'+ #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobBem.ListaBemxDep(nIdPessoa, nIdBem, nMoeCodigo,
  nIdBemxDep: Extended): OleVariant;
var
   sSql : String;                
begin
   sSql := ' SELECT BD.IDBEM, BD.IDPESSOA, BD.MOECODIGO, M.MOEDESC, '+ #13 +
           '        BD.IDBEMXDEP, BD.TAXADEP, GD.DESCTAXADEP, '+ #13 +
           '        BD.DEPLANC, BD.CMDEP, BD.DATAULTDEP, BD.DATAULTCM, BD.FLGDEPREC '+ #13 +
           ' FROM BEMXDEP BD, '+ #13 +
           '      MOEDA M, '+ #13 +
           '      BEM B, '+ #13 +
           '      GRUPOTAXADEP GD '+ #13 +
           ' WHERE (BD.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BD.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BD.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBemxDep <> -1 then
      sSql := sSql + '   AND (BD.IDBEMXDEP = ' + floattostr(nIdBemxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BD.MOECODIGO = M.MOECODIGO) ' + #13 +
                  '   AND (BD.IDBEM = B.IDBEM) ' + #13 +
                  '   AND (BD.IDPESSOA = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA = GD.IDPESSOA) ' + #13 +
                  '   AND (BD.IDBEMXDEP = GD.IDTAXADEP) ' + #13 +
                  ' ORDER BY BD.IDBEM, BD.MOECODIGO, BD.IDBEMXDEP' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);

end;

function TCtrlImobBem.ListaBemxMoeda(nIdPessoa, nIdBem,
  nMoeCodigo: Extended): OleVariant;
var
   sSql : String;                
begin
   sSql := ' SELECT BM.IDBEM, BM.IDPESSOA, BM.MOECODIGO, M.MOEDESC,'+ #13 +
           '        BM.VALORG, BM.CMBEM, BM.DATAULTCM '+ #13 +
           ' FROM BEMXMOEDA BM, '+ #13 +
           '      MOEDA M '+ #13 +
           ' WHERE (BM.IDPESSOA    = '+ floattostr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (BM.IDBEM = ' + floattostr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (BM.MOECODIGO = ' + floattostr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (BM.MOECODIGO = M.MOECODIGO) ' + #13 +
                  ' ORDER BY BM.IDBEM, BM.MOECODIGO' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobBem.ListaMovimentacao(iEmpresaProp, iBem: Integer;
  dDataSld: tDateTime; iMoeCodigo, iTaxaDep: Integer): OleVariant;
begin
  _dMTBem.sqlHistMovBem.Prepare;
  _dMTBem.sqlHistMovBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
  _dMTBem.sqlHistMovBem.ParamByName('IDBEM').AsInteger     := iBem;
  _dMTBem.sqlHistMovBem.ParamByName('DATAMOV').AsDate      := dDataSld;
  _dMTBem.sqlHistMovBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
  _dMTBem.sqlHistMovBem.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
  Result := _dMTBem.sqlHistMovBem.Data;
end;


function TCtrlImobBem.ListaPlanoPatroxBem(nIdPessoa, nIdBem, nIdPatro,
  nIdPlanoPrev: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PPB.IDBEM,PPB.IDPESSOA,PPB.IDPLANOPREV,PPB.IDPATRO,PPB.PPBPERCRATEIO, ' + #13 +
           '        P.NOME AS NOMEPATRO, PLANO.NOME AS NOMEPLANOPREV ' + #13 +
           ' FROM PLANOPATROXBEM PPB, ' + #13 +
           '      PLANPREVCONTABIL PLANO, ' + #13 +
           '      PATRO, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE (PPB.IDPESSOA = '+ FloatToStr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (PPB.IDBEM = ' + FloatToStr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPatro <> -1 then
      sSql := sSql + '   AND (PPB.IDPATRO = ' + FloatToStr(nIdPatro) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPlanoPrev <> -1 then
      sSql := sSql + '   AND (PPB.IDPLANOPREV = ' + FloatToStr(nIdPlanoPrev) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' AND (PPB.IDPLANOPREV = PLANO.IDPLANOPREV(+)) ' + #13 +
                  ' AND (PPB.IDPATRO = PATRO.IDPESSOA(+)) ' + #13 +
                  ' AND (PATRO.IDPESSOA = P.IDPESSOA(+)) ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);

end;

function TCtrlImobBem.ListaPlanoPatroxImovel(nIdImovel, nIdPatro,
  nIdPlanoPrev: Extended): OleVariant;
var
  sSQL : string;
begin
  sSql := ' SELECT PPI.IDIMOVEL, PPI.IDPLANOPREV,PPI.IDPATRO,PPI.PPIPERCENTRATEIO, ' + #13 +
           '        P.NOME AS NOMEPATRO, PLANO.NOME AS NOMEPLANOPREV ' + #13 +
           ' FROM PLANOPATROXIMOVEL PPI, ' + #13 +
           '      PLANPREVCONTABIL PLANO, ' + #13 +
           '      PATRO, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE (PPI.IDIMOVEL = '+ FloatToStr(nIdImovel) +') ' + #13;
   if nIdPatro <> -1 then
      sSQL := sSQL + '   AND (PPB.IDPATRO = ' + FloatToStr(nIdPatro) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdPlanoPrev <> -1 then
      sSQL := sSQL + '   AND (PPB.IDPLANOPREV = ' + FloatToStr(nIdPlanoPrev) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSQL := sSQL + ' AND (PPB.IDPLANOPREV = PLANO.IDPLANOPREV(+)) ' + #13 +
                  ' AND (PPB.IDPATRO = PATRO.IDPESSOA(+)) ' + #13 +
                  ' AND (PATRO.IDPESSOA = P.IDPESSOA(+)) ' + #13 ;
   //-------------------------------------------------------------------------------------
  Result := GetDataPacket(sSQL);
end;

function TCtrlImobBem.ListaReavaliacao(nIdPessoa, nIdBem: Extended;
  bUltReaval: boolean): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT R.IDREAVALIACAO, R.IDMOVIMENTACAO, R.IDBEM, R.IDPESSOA, '+ #13 +
           '        R.DATAREAVALIACAO, R.FLGULTREAVAL '+ #13 +
           ' FROM REAVALIACAO R   '+ #13 +
           ' WHERE (R.IDPESSOA    = '+ FloatToStr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (R.IDBEM = ' + FloatToStr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if bUltReaval then
      sSql := sSql + '   AND (R.FLGULTREAVAL = 1) ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);

end;

function TCtrlImobBem.ListaReavalxDep(nIdPessoa, nIdBem, nIdReavaliacao,
  nMoeCodigo, nIdReavalxDep: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT R.IDBEM, R.IDPESSOA, RD.MOECODIGO, M.MOEDESC, '+ #13 +
           '        RD.IDREAVALIACAO, RD.IDREAVALXDEP, RD.TAXADEP, GD.DESCTAXADEP, '+ #13 +
           '        RD.DEPLANC, RD.CMDEP, RD.DATAULTDEP, RD.DATAULTCM, RD.FLGDEPREC '+ #13 +
           ' FROM REAVALIACAO R, '+ #13 +
           '      REAVALXDEP RD, '+ #13 +
           '      MOEDA M, '+ #13 +
           '      BEM B, '+ #13 +
           '      GRUPOTAXADEP GD '+ #13 +
           ' WHERE (R.IDPESSOA    = '+ FloatToStr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (R.IDBEM = ' + FloatToStr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdReavaliacao <> -1 then
      sSql := sSql + '   AND (RD.IDREAVALIACAO = ' + FloatToStr(nIdReavaliacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (RD.MOECODIGO = ' + FloatToStr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdReavalxDep <> -1 then
      sSql := sSql + '   AND (RD.IDREAVALXDEP = ' + FloatToStr(nIdReavalxDep) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (R.IDREAVALIACAO = RD.IDREAVALIACAO) ' + #13 +
                  '   AND (RD.MOECODIGO    = M.MOECODIGO) ' + #13 +
                  '   AND (R.IDBEM         = B.IDBEM) ' + #13 +
                  '   AND (R.IDPESSOA      = B.IDPESSOA) ' + #13 +
                  '   AND (B.IDGRUPO       = GD.IDGRUPO) ' + #13 +
                  '   AND (B.IDPESSOA      = GD.IDPESSOA) ' + #13 +
                  '   AND (RD.IDREAVALXDEP = GD.IDTAXADEP) ' + #13 +
                  ' ORDER BY RD.IDREAVALIACAO, RD.MOECODIGO, RD.IDREAVALXDEP' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobBem.ListaReavalxMoeda(nIdPessoa, nIdBem, nIdReavaliacao,
  nMoeCodigo: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT R.IDBEM, R.IDPESSOA, RM.MOECODIGO, M.MOEDESC,'+ #13 +
           '        RM.IDREAVALIACAO, RM.VALORG, RM.CMBEM, RM.DATAULTCM ' + #13 +
           ' FROM REAVALIACAO R, ' + #13 +
           '      REAVALXMOEDA RM, ' + #13 +
           '      MOEDA M '+ #13 +
           ' WHERE (R.IDPESSOA    = '+ FloatToStr(nIdPessoa) +') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdBem <> -1 then
      sSql := sSql + '   AND (R.IDBEM = ' + FloatToStr(nIdBem) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdReavaliacao <> -1 then
      sSql := sSql + '   AND (RM.IDREAVALIACAO = ' + FloatToStr(nIdReavaliacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND (RM.MOECODIGO = ' + FloatToStr(nMoeCodigo) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (R.IDREAVALIACAO = RM.IDREAVALIACAO) ' + #13 +
                  '   AND (RM.MOECODIGO = M.MOECODIGO) ' + #13 +
                  ' ORDER BY RM.IDREAVALIACAO, RM.MOECODIGO' ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlImobBem.OnCreateAppServer;
begin
   inherited;
   Fcds               := TClientDataSet.Create(nil);
   FcdsTaxasDep       := TClientDataSet.Create(nil);
   FcdsPlanoPatroxBem := TClientDataSet.Create(nil);
   FcdsImagem         := TClientDataSet.Create(nil);
end;

function TCtrlImobBem.PlacaIdBem(nEmpresa: Extended;
  sPlaca: string): Integer;
var
   sSql, sPlacaAux : String;                 
begin
   sPlacaAux := sPlaca;
   while (pos('.',sPlacaAux) <> 0) do
      sPlacaAux := TiraCaracter(sPlacaAux,'.');
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT IDBEM, DESBEM ' + #13 +
           ' FROM BEM ' + #13 +
           ' WHERE (PLACA = ' + sPlacaAux + ') ' + #13 +
           '   AND (IDPESSOA = ' + FloatToStr(nEmpresa) + ') ' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.RecordCount = 1 then
      result := _cds.FieldByName('IDBEM').AsInteger
   else
      result := 0;

end;

function TCtrlImobBem.PlacaUnica(nEmpresa: Extended;
  sPlaca: string): boolean;
var
   sSql, sPlacaAux : String;
begin
   sPlacaAux := sPlaca;
   while (pos('.',sPlacaAux) <> 0) do
      sPlacaAux := TiraCaracter(sPlacaAux,'.');
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT IDBEM, DESBEM ' + #13 +
           ' FROM BEM ' + #13 +
           ' WHERE (PLACA = ' + sPlacaAux + ') ' + #13 +
           '   AND (IDPESSOA = ' + FloatToStr(nEmpresa) + ') ' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   result := _cds.IsEmpty;
end;

function TCtrlImobBem.ProcurarBem(nIdPessoa, nIdBem: Extended): OleVariant;
begin
  _dbBem.IDPESSOA.AsFloat := nIdPessoa;
  _dbBem.IDBEM.AsFloat    := nIdBem;
  Result := GetDataPacket(_dbBem.sSQLSelect);
end;

function TCtrlImobBem.ProcurarBemxDep(nIdPessoa, nIdBem, nMoeCodigo,
  nIdBemxDep: Extended): OleVariant;
begin
  _dbBemxDep.IDPESSOA.AsFloat    := nIdPessoa;
  _dbBemxDep.IDBEM.AsFloat       := nIdBem;
  _dbBemxDep.MOECODIGO.AsFloat   := nMoeCodigo;
  _dbBemxDep.IDBEMXDEP.AsFloat   := nIdBemxDep;
  Result := GetDataPacket(_dbBemxDep.sSQLSelect);
end;

function TCtrlImobBem.ProcurarBemxMoeda(nIdPessoa, nIdBem,
  nMoeCodigo: Extended): OleVariant;
begin
  _dbBemxMoeda.IDPESSOA.AsFloat  := nIdPessoa;
  _dbBemxMoeda.IDBEM.AsFloat     := nIdBem;
  _dbBemxMoeda.MOECODIGO.AsFloat := nMoeCodigo;
  Result := GetDataPacket(_dbBemxMoeda.sSQLSelect);
end;

function TCtrlImobBem.ProcurarPlanoPatroxBem(nIdImovel, 
  nIdPlanoPrev, nIdPatro: Extended): OleVariant;
begin
  _dbPlanoPatroxImovel.IDImovel.AsFloat    := nIdImovel;
  _dbPlanoPatroxImovel.IDPLANOPREV.AsFloat := nIdPlanoPrev;
  _dbPlanoPatroxImovel.IDPATRO.AsFloat     := nIdPatro;
  Result := GetDataPacket(_dbPlanoPatroxImovel.sSQLSelect);
end;

function TCtrlImobBem.RegistraEntradaTotal(nEmpresaProp, nBem, nGrupo,
  nSubConta, nAtivProjeto: Extended; dDataInicioDep: TDateTime;
  nValHistorico: Extended; bFlgBemIntContab: Boolean;
  dDtaContab: TDateTime): Boolean;
type
   rBemxDep = Record
      IDBEMXDEP  : Integer;
      TAXADEP    : Extended;
   end;

var
   sSql             : String;
   aBemxDep         : Array of rBemxDep;
   iaBemxDep, iAux  : Integer;
   nValorMoeda      : Extended;
begin
  try
    //----------------------------------------------------------------------------------
    // Altera a tabela BEM
    //----------------------------------------------------------------------------------
     _dMTBem.sqlRegistraBemTotal.Prepare;
     //-------------------------------------------------------------------------------
     _dMTBem.sqlRegistraBemTotal.ParamByName('IDBEM').AsFloat            := nBem;
     _dMTBem.sqlRegistraBemTotal.ParamByName('IDPESSOA').AsFloat         := nEmpresaProp;
     _dMTBem.sqlRegistraBemTotal.ParamByName('DATAINICIODEP').asDateTime := dDataInicioDep;
     _dMTBem.sqlRegistraBemTotal.ParamByName('VALHISTORICO').asFloat     := nValHistorico;
     _dMTBem.sqlRegistraBemTotal.ParamByName('IDGRUPO').AsFloat          := nGrupo;
     //-------------------------------------------------------------------------------
     if nSubConta > 0 then
      _dMTBem.sqlRegistraBemTotal.ParamByName('CODSUBCONTA').AsFloat := nSubConta
     else
      _dMTBem.sqlRegistraBemTotal.ParamByName('CODSUBCONTA').Clear;
     //-------------------------------------------------------------------------------
     if nAtivProjeto > 0 then
      _dMTBem.sqlRegistraBemTotal.ParamByName('UNIDNEGOC').AsFloat := nAtivProjeto
     else
      _dMTBem.sqlRegistraBemTotal.ParamByName('UNIDNEGOC').Clear;
     //-------------------------------------------------------------------------------
     if bFlgBemIntContab then
     begin
      _dMTBem.sqlRegistraBemTotal.ParamByName('FLGBEMINTCONTAB').AsInteger := 1;
      _dMTBem.sqlRegistraBemTotal.ParamByName('DTACONTAB').AsDateTime := dDtaContab;
     end
     else
     begin
      _dMTBem.sqlRegistraBemTotal.ParamByName('FLGBEMINTCONTAB').AsInteger := 0;
      _dMTBem.sqlRegistraBemTotal.ParamByName('DTACONTAB').Clear;
     end;
     //----------------------------------------------------------------------------------
     if not ExecSQL(_dMTBem.sqlRegistraBemTotal.SQLChanged, True) then
      Raise Exception.Create(MessageInfo);
     //----------------------------------------------------------------------------------
     // Remove os BemxMoeda e BemxDep anteriores
     //----------------------------------------------------------------------------------
     sSql := ' DELETE FROM BEMXDEP ' +
             ' WHERE (IDPESSOA = ' + FloatToStr(nEmpresaProp) + ')' +
             '   AND (IDBEM    = ' + FloatToStr(nBem) + ')';
     if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);

     sSql := ' DELETE FROM BEMXMOEDA ' +
             ' WHERE (IDPESSOA = ' + FloatToStr(nEmpresaProp) + ')' +
             '   AND (IDBEM    = ' + FloatToStr(nBem) + ')';

     if not ExecSQL(sSql, True) then
      Raise Exception.Create(MessageInfo);
     //----------------------------------------------------------------------------------
     // Registra as BemxMoeda e BemxDep
     //----------------------------------------------------------------------------------
     // Carga das Multiplas Taxas com Grupo Selecionado
     //----------------------------------------------------------------------------------
     FcdsBemxDep.Data  := ListaBemxDep(0, 0);
     FcdsTaxasDep.Data := GrupoContab.ListaGrupoTaxaDep(Fcds.FieldByName('IDGRUPO').AsFloat, nEmpresaProp);
     while not FcdsTaxasDep.EOF do
     begin
      FcdsBemxDep.Append;
      FcdsBemxDep.FieldByName('IDPESSOA').AsFloat     := nEmpresaProp;
      FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
      FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger  := cdsTaxasDep.FieldByName('IDTAXADEP').AsInteger;
      FcdsBemxDep.FieldByName('TAXADEP').AsFloat      := cdsTaxasDep.FieldByName('TAXADEP').AsFloat;
      FcdsBemxDep.FieldByName('DESCTAXADEP').AsString := cdsTaxasDep.FieldByName('DESCTAXADEP').AsString;
      FcdsBemxDep.Post;
      //-------------------------------------------------------------------------------
      FcdsTaxasDep.Next;
     end;
     //----------------------------------------------------------------------------------
     // Registra em array os dados relativos a BEMXDEP em Moeda Oficial, para serem
     // replicados nas moedas restantes.
     //----------------------------------------------------------------------------------
     iaBemxDep := 0;
     FcdsBemxDep.First;
     while not FcdsBemxDep.EOF do
     begin
      if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  = ParamCAF.MOEDAOFICIAL then
      begin
        FcdsBemxDep.Edit;
        FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := dDataInicioDep;
        FcdsBemxDep.Post;
      end;
        SetLength(aBemxDep,iaBemxDep + 1);
        aBemxDep[iaBemxDep].IDBEMXDEP  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
        aBemxDep[iaBemxDep].TAXADEP    := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
        iaBemxDep := iaBemxDep + 1;
        FcdsBemxDep.Next;
     end;
     //----------------------------------------------------------------------------------
     // Realiza os lançamentos em BEMXMOEDA
     //----------------------------------------------------------------------------------
     FcdsBemxMoeda.Data := ListaBemxMoeda(nEmpresaProp, 0);
     //----------------------------------------------------------------------------------
     // Registro do Valor em Moeda Oficial
     //----------------------------------------------------------------------------------
     FcdsBemxMoeda.Append;
     FcdsBemxMoeda.FieldByName('IDPESSOA').AsFloat     := nEmpresaProp;
     FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
     FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValHistorico;
     FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
     FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime := dDataInicioDep;
     FcdsBemxMoeda.Post;
     //----------------------------------------------------------------------------------
     // Conversão do valor de aquisição para as quatro moedas suportadas pelo CAF
     //----------------------------------------------------------------------------------
     if ParamCAF.MOEDAFISCAL > 0 then
     begin
      nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAFISCAL,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := CtrlImobBem.Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAFISCAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
      FcdsBemxMoeda.Post;
      //-------------------------------------------------------------------------------
      // Registra as taxas de depreciacao para esta moeda
      //-------------------------------------------------------------------------------
      iAux := 0;
      while iAux < iaBemxDep do
      begin
      FcdsBemxDep.Append;
      FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAFISCAL;
      FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
      FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
      FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
      FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime  := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
      FcdsBemxDep.Post;
      iAux := iAux + 1;
     end;
    end;
    //----------------------------------------------------------------------------------
    if ParamCAF.MOEDAGERENCIAL > 0 then
    begin
      nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAGERENCIAL,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(MessageInfo);
    //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;
      //-------------------------------------------------------------------------------
      // Registra as taxas de depreciacao para esta moeda
      //-------------------------------------------------------------------------------
      iAux := 0;
      while iAux < iaBemxDep do
      begin
        FcdsBemxDep.Append;
        FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
        FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
        FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
        FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
        FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.Post;
        iAux := iAux + 1;
      end;
    end;
    //----------------------------------------------------------------------------------
    if ParamCAF.MOEDAGERENCIALB > 0 then
    Begin
      nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAGERENCIALB,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
      Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;
      //----------------------------------------------------------------------------
      // Registra as taxas de depreciacao para esta moeda
      //----------------------------------------------------------------------------
      iAux := 0;
      while iAux < iaBemxDep do
      begin
        FcdsBemxDep.Append;
        FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
        FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
        FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
        FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
        FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.Post;
        iAux := iAux + 1;
      end;
    end;
    //----------------------------------------------------------------------------------
    if ParamCAF.MOEDAGERENCIALC > 0 then
    begin
      nValorMoeda := ConversaoMoeda(nValHistorico,ParamCAF.MOEDAGERENCIALC,
                                    Fcds.FieldByName('DTAINCLUSAO').AsDateTime);
      if nValorMoeda < 0 then
        Raise Exception.Create(MessageInfo);
      //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := Fcds.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat      := nValorMoeda;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat       := 0;
      FcdsBemxMoeda.Post;
      //-------------------------------------------------------------------------------
      // Registra as taxas de depreciacao para esta moeda
      //-------------------------------------------------------------------------------
      iAux := 0;
      while iAux < iaBemxDep do
      begin
        FcdsBemxDep.Append;
        FcdsBemxDep.FieldByName('IDPESSOA').AsInteger := Fcds.FieldByName('IDPESSOA').AsInteger;
        FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
        FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
        FcdsBemxDep.FieldByName('TAXADEP').AsFloat := aBemxDep[iAux].TAXADEP;
        FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := Fcds.FieldByName('DATAINICIODEP').AsDateTime;
        FcdsBemxDep.Post;
        iAux := iAux + 1;
      end;
    end;
    //----------------------------------------------------------------------------------
    FcdsBemxMoeda.First;

    while not FcdsBemxMoeda.EOF do
    begin
      CdsToDbObject(FcdsBemxMoeda,_dbBemxMoeda);
      _dbBemxMoeda.IDBEM.AsFloat := Fcds.FieldbyName('IDBEM').AsFloat;
      if not _dbBemxMoeda.Insert then
        Raise Exception.Create(_dbBemxMoeda.MessageInfo);
      //-------------------------------------------------------------------------------
      FcdsBemxMoeda.Next;
    end;
    //----------------------------------------------------------------------------------
    FcdsBemxDep.First;
    while not FcdsBemxDep.EOF do
    begin
      CdsToDbObject(FcdsBemxDep,_dbBemxDep);
      _dbBemxDep.IDBEM.AsFloat := Fcds.FieldbyName('IDBEM').AsFloat;
      if not _dbBemxDep.Insert then
        Raise Exception.Create(_dbBemxDep.MessageInfo);
      //-------------------------------------------------------------------------------
      FcdsBemxDep.Next;
    end;
    //----------------------------------------------------------------------------------
    Result := True;
  except
    On E : Exception do
    begin
      MessageInfo := E.Message;
      Result := False;
    end;
  end;
end;

function TCtrlImobBem.SaldoContabil(iEmpresaProp, iBem: Integer;
  dDataSld: tDateTime; iMoeCodigo, iTaxaDep: Integer): Extended;
var
   nValOrg, nCmBem, nDepLanc, nCmDep,
   nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
   nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep,
   nDepLancAtu, nUltReavDepLancAtu    : Extended;
   iGrupo, iLocalizacao, iResponsavel : Integer;

begin
   try
      if not SaldoContabilBem(iEmpresaProp, iBem, dDataSld, iMoeCodigo, iTaxaDep,
                              nValOrg, nCmBem, nDepLanc, nCmDep,
                              nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
                              nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep,
                              nDepLancAtu, nUltReavDepLancAtu,
                              iGrupo, iLocalizacao, iResponsavel) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      Result := nValOrg + nCmBem - nDepLanc - nCmDep +
                nReavValOrg + nReavCmBem - nReavDepLanc - nReavCmDep +
                nUltReavValOrg + nUltReavCmBem - nUltReavDepLanc - nUltReavCmDep;
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := 0;
      end;
   end;
end;

function TCtrlImobBem.SaldoContabilA(iEmpresaProp, iBem: Integer;
  dDataSld: tDateTime; iMoeCodigo, iTaxaDep,
  iReavaliacao: Integer): Extended;
begin
   try
      if iReavaliacao <= 0 then
      begin
         _dMTBem.sqlSaldoContabBemA.Prepare;
         _dMTBem.sqlSaldoContabBemA.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
         _dMTBem.sqlSaldoContabBemA.ParamByName('IDBEM').AsInteger     := iBem;
         _dMTBem.sqlSaldoContabBemA.ParamByName('DATASLD').AsDate      := dDataSld;
         _dMTBem.sqlSaldoContabBemA.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
         _dMTBem.sqlSaldoContabBemA.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
         _cds.Data := _dMTBem.sqlSaldoContabBemA.Data;
      end else
      begin
         _dMTBem.sqlSaldoContabReavalA.Prepare;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDPESSOA').AsInteger      := iEmpresaProp;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDBEM').AsInteger         := iBem;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('DATASLD').AsDate          := dDataSld;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('MOECODIGO').AsInteger     := iMoeCodigo;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDTAXADEP').AsInteger     := iTaxaDep;
         _dMTBem.sqlSaldoContabReavalA.ParamByName('IDREAVALIACAO').AsInteger := iReavaliacao;
         _cds.Data := _dMTBem.sqlSaldoContabReavalA.Data;
      end;
      //----------------------------------------------------------------------------------
      if not _cds.IsEmpty then
         Result := _cds.FieldByName('VALORG').AsFloat  + _cds.FieldByName('CMBEM').AsFloat -
                   _cds.FieldByName('DEPLANC').AsFloat - _cds.FieldByName('CMDEP').AsFloat
      else
         Result := 0;
      //----------------------------------------------------------------------------------
      MessageInfo := '';
   except
      On E : Exception Do
      begin
         MessageInfo := E.Message;
         Result := 0;
      end;
   end;
end;

function SaldoContabilBem(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                                iMoeCodigo, iTaxaDep : Integer;
                                Var nValOrg, nCmBem,
                                    nDepLanc, nCmDep,
                                    nReavValOrg, nReavCmBem,
                                    nReavDepLanc, nReavCmDep,
                                    nUltReavValOrg, nUltReavCmBem,
                                    nUltReavDepLanc, nUltReavCmDep,
                                    nDepLancAtu, nUltReavDepLancAtu : Extended;
                                Var iGrupo, iLocalizacao, iResponsavel : Integer) : Boolean;
begin
   try

      CtrlImobBem._dMTBem.sqlSaldoContabilBem.Prepare;
      CtrlImobBem._dMTBem.sqlSaldoContabilBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
      CtrlImobBem._dMTBem.sqlSaldoContabilBem.ParamByName('IDBEM').AsInteger     := iBem;
      CtrlImobBem._dMTBem.sqlSaldoContabilBem.ParamByName('DATASLD').AsDate      := dDataSld;
      CtrlImobBem._dMTBem.sqlSaldoContabilBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
      CtrlImobBem._dMTBem.sqlSaldoContabilBem.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
      CtrlImobBem._cds.Data := CtrlImobBem._dMTBem.sqlSaldoContabilBem.Data;
      //----------------------------------------------------------------------------------
      if not CtrlImobBem._cds.IsEmpty then
      begin
         nValOrg            := CtrlImobBem._cds.FieldByName('VALORG').AsFloat;
         nCMBem             := CtrlImobBem._cds.FieldByName('CMBEM').AsFloat;
         nDepLanc           := CtrlImobBem._cds.FieldByName('DEPLANC').AsFloat;
         nCMDep             := CtrlImobBem._cds.FieldByName('CMDEP').AsFloat;
         nReavValOrg        := CtrlImobBem._cds.FieldByName('REAVVALORG').AsFloat;
         nReavCMBem         := CtrlImobBem._cds.FieldByName('REAVCMBEM').AsFloat;
         nReavDepLanc       := CtrlImobBem._cds.FieldByName('REAVDEPLANC').AsFloat;
         nReavCMDep         := CtrlImobBem._cds.FieldByName('REAVCMDEP').AsFloat;
         nUltReavValOrg     := CtrlImobBem._cds.FieldByName('ULTREAVVALORG').AsFloat;
         nUltReavCMBem      := CtrlImobBem._cds.FieldByName('ULTREAVCMBEM').AsFloat;
         nUltReavDepLanc    := CtrlImobBem._cds.FieldByName('ULTREAVDEPLANC').AsFloat;
         nUltReavCMDep      := CtrlImobBem._cds.FieldByName('ULTREAVCMDEP').AsFloat;
         iGrupo             := CtrlImobBem._cds.FieldByName('IDGRUPO').AsInteger;
         iLocalizacao       := CtrlImobBem._cds.FieldByName('IDLOCALIZACAO').AsInteger;
         iResponsavel       := CtrlImobBem._cds.FieldByName('IDRESPONSAVEL').AsInteger;
         nDepLancAtu        := CtrlImobBem._cds.FieldByName('DEPLANCATU').AsFloat;
         nUltReavDepLancAtu := CtrlImobBem._cds.FieldByName('VALULTDEPREAVATU').AsFloat;
      end else
      begin
         nValOrg            := 0;
         nCMBem             := 0;
         nDepLanc           := 0;
         nCMDep             := 0;
         nReavValOrg        := 0;
         nReavCMBem         := 0;
         nReavDepLanc       := 0;
         nReavCMDep         := 0;
         nUltReavValOrg     := 0;
         nUltReavCMBem      := 0;
         nUltReavDepLanc    := 0;
         nUltReavCMDep      := 0;
         iGrupo             := 0;
         iLocalizacao       := 0;
         iResponsavel       := 0;
         nDepLancAtu        := 0;
         nUltReavDepLancAtu := 0;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         CtrlImobBem.MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;

function TCtrlImobBem.SaldoContabilBem(iEmpresaProp, iBem: Integer;
  dDataSld: tDateTime; iMoeCodigo, iTaxaDep: Integer; var nValOrg, nCmBem,
  nDepLanc, nCmDep, nReavValOrg, nReavCmBem, nReavDepLanc, nReavCmDep,
  nUltReavValOrg, nUltReavCmBem, nUltReavDepLanc, nUltReavCmDep,
  nDepLancAtu, nUltReavDepLancAtu: Extended; var iGrupo, iLocalizacao,
  iResponsavel: Integer): Boolean;
begin
  try
    _dMTBem.sqlSaldoContabilBem.Prepare;
    _dMTBem.sqlSaldoContabilBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
    _dMTBem.sqlSaldoContabilBem.ParamByName('IDBEM').AsInteger     := iBem;
    _dMTBem.sqlSaldoContabilBem.ParamByName('DATASLD').AsDate      := dDataSld;
    _dMTBem.sqlSaldoContabilBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
    _dMTBem.sqlSaldoContabilBem.ParamByName('IDTAXADEP').AsInteger := iTaxaDep;
    _cds.Data := _dMTBem.sqlSaldoContabilBem.Data;
    //----------------------------------------------------------------------------------
    if not _cds.IsEmpty then
    begin
      nValOrg            := _cds.FieldByName('VALORG').AsFloat;
      nCMBem             := _cds.FieldByName('CMBEM').AsFloat;
      nDepLanc           := _cds.FieldByName('DEPLANC').AsFloat;
      nCMDep             := _cds.FieldByName('CMDEP').AsFloat;
      nReavValOrg        := _cds.FieldByName('REAVVALORG').AsFloat;
      nReavCMBem         := _cds.FieldByName('REAVCMBEM').AsFloat;
      nReavDepLanc       := _cds.FieldByName('REAVDEPLANC').AsFloat;
      nReavCMDep         := _cds.FieldByName('REAVCMDEP').AsFloat;
      nUltReavValOrg     := _cds.FieldByName('ULTREAVVALORG').AsFloat;
      nUltReavCMBem      := _cds.FieldByName('ULTREAVCMBEM').AsFloat;
      nUltReavDepLanc    := _cds.FieldByName('ULTREAVDEPLANC').AsFloat;
      nUltReavCMDep      := _cds.FieldByName('ULTREAVCMDEP').AsFloat;
      iGrupo             := _cds.FieldByName('IDGRUPO').AsInteger;
      iLocalizacao       := _cds.FieldByName('IDLOCALIZACAO').AsInteger;
      iResponsavel       := _cds.FieldByName('IDRESPONSAVEL').AsInteger;
      nDepLancAtu        := _cds.FieldByName('DEPLANCATU').AsFloat;
      nUltReavDepLancAtu := _cds.FieldByName('VALULTDEPREAVATU').AsFloat;
    end
    else
    begin
      nValOrg            := 0;
      nCMBem             := 0;
      nDepLanc           := 0;
      nCMDep             := 0;
      nReavValOrg        := 0;
      nReavCMBem         := 0;
      nReavDepLanc       := 0;
      nReavCMDep         := 0;
      nUltReavValOrg     := 0;
      nUltReavCMBem      := 0;
      nUltReavDepLanc    := 0;
      nUltReavCMDep      := 0;
      iGrupo             := 0;
      iLocalizacao       := 0;
      iResponsavel       := 0;
      nDepLancAtu        := 0;
      nUltReavDepLancAtu := 0;
    end;
    //----------------------------------------------------------------------------------
    Result := True;
  except
    On E : Exception Do
    begin
      MessageInfo := E.Message;
      Result := False;
    end;
  end;
end;

procedure TCtrlImobBem.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlImobBem.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlImobBem.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlImobBem.SetcdsConjunto(const Value: TClientDataSet);
begin
  FcdsConjunto := Value;
end;

procedure TCtrlImobBem.SetcdsImagem(const Value: TClientDataSet);
begin
  FcdsImagem := Value;
end;

procedure TCtrlImobBem.SetcdsMovContabBem(const Value: TClientDataSet);
begin
  FcdsMovContabBem := Value;
end;

procedure TCtrlImobBem.SetcdsMovTransf(const Value: TClientDataSet);
begin
  FcdsMovTransf := Value;
end;

procedure TCtrlImobBem.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlImobBem.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
  FcdsSaldoContabBem := Value;
end;

procedure TCtrlImobBem.SetcdsSldCtbBemxDep(const Value: TClientDataSet);
begin
  FcdsSldCtbBemxDep := Value;
end;

procedure TCtrlImobBem.SetcdsTaxasDep(const Value: TClientDataSet);
begin
  FcdsTaxasDep := Value;
end;

procedure TCtrlImobBem.SetIdBem(const Value: Integer);
begin
  FIdBem := Value;
end;

function TCtrlImobBem.TiraCaracter(sStr: string; sCh: Char): string;
var
   iConta : Byte;
begin
   Result := '';
   for iConta := 1 to Length(sStr) do
   begin
    if sStr[iConta] <> sCh then
      Result := Result + sStr[iConta];
   end;
end;

function TCtrlImobBem.VerificaPeriodoCAF(nEmpresaProp, nBem: Extended;
  iFlgImovel: Integer; sTipoMov: String; dDataMov: TDateTime;
  var dDataUltMov, dDataUltDep: TDateTime;
  bPermiteMesmaData: boolean): Boolean;
var
   iAno, iMes, iDia   : Word;
   dDataIni, dDataFim : TDateTime;
   sSql               : String;
begin
   dDataUltMov := 0;
   dDataUltDep := 0;
   //-------------------------------------------------------------------------------------
   // Data da Última Movimentação
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
           ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
           ' WHERE  (IDBEM    = ' + FloatToStr(nBem) + ') ' + #13 +
           '   AND  (IDPESSOA = ' + FloatToStr(nEmpresaProp) + ') ';
   _cds.Data := GetDataPacket(sSql);
   if _cds.IsEmpty then
   begin
      Result := True;
      Exit;
   end;
   dDataUltMov := _cds.FieldByName('DATAULTMOV').AsDateTime;
   //-------------------------------------------------------------------------------------
   // Data do Último Fechamento
   //-------------------------------------------------------------------------------------
   sSql := ' SELECT MAX(PG.DATAULTFEC) AS DTAULTFECHAMENTO ' +
           ' FROM GRUPO G,' +
           '      PLANOGRUPO PG '+
           ' WHERE (G.FLGIMOVEL = ' + IntToStr(iFlgImovel) + ')' +
           '   AND (PG.IDPESSOA = ' + FloatToStr(nEmpresaProp) + ') ' +
           '   AND (PG.IDGRUPO = G.IDGRUPO) ';
   _cds.Data := GetDataPacket(sSql);
   if (_cds.IsEmpty) or (_cds.FieldByName('DTAULTFECHAMENTO').IsNull) then
   begin
      Result := True;
      Exit;
   end;
   dDataUltDep := _cds.FieldByName('DTAULTFECHAMENTO').AsDateTime;
   //-------------------------------------------------------------------------------------
   // Verifica se a movimentação já ocorreu na data
   //-------------------------------------------------------------------------------------
   if not bPermiteMesmaData then
   begin
      sSql := ' SELECT DATAMOVIMENTACAO ' +
              ' FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE (IDBEM = ' + FloatToStr(nBem) + ')' +
              '   AND (IDPESSOA = ' + FloatToStr(nEmpresaProp) + ')' +
              '   AND (IDTIPOMOVIMENTACAO IN ( ' + sTipoMov + ' ))' +
              '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('DD/MM/YYYY',dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))';
      _cds.Data := GetDataPacket(sSql);
      if not _cds.IsEmpty then
      begin
         MessageInfo := CMTranslate('Já existe esta movimentação na data. Consulte Histórico de Movimentações!');
         Result := False;
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if dDataUltMov > (dDataMov + 1) then
   begin
      MessageInfo := CMTranslate('Existem movimentações com data posterior. Consulte Histórico de Movimentações!');
      Result := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   dDataIni := dDataUltDep + 1;
   DecodeDate(dDataIni,iAno,iMes,iDia);
   dDataFim := DiasUteis.UltDiaMes(iAno,iMes);
   if dDataMov > dDataFim then
   begin
      MessageInfo := CMTranslate('Período ainda não iniciado pelo Controle do Ativo Fixo!') + #13 +
                     CMTranslate('Impossível gerar lançamento de movimentação.') + #13 +
                     CMTranslate('Altere a data de movimentação.');
      Result := False;
   end
   else
   if (dDataMov < dDataIni) then
   begin
      MessageInfo := CMTranslate('Período já encerrado pelo Controle do Ativo Fixo!') + #13 +
                     CMTranslate('Impossível gerar lançamento de movimentação.') + #13 +
                     CMTranslate('Altere a data de movimentação.');
      Result := False;
   end
   else
    Result := True;
end;
end.
