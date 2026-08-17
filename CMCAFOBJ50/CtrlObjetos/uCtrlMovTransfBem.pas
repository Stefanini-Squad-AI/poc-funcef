// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//******************************************************************************
{-------------------------------------------------------------------------------
Rotina...........: ExecutaTransferencia
Nº SIG...........: 133082
Data da Alteração: 04/05/2023
Responsável......: Leandro Pocebon
Descrição........: Criação do parametro se realiza contabil quando feita transferencia
-------------------------------------------------------------------------------
Rotina...........: ListaSelBaixaBens
Nº SIG...........: 130571
Data da Alteração: 28/12/2022
Responsável......: Andre Imakawa
Descrição........: Criação do campo de seleção
-------------------------------------------------------------------------------
Rotina...........: EstornaTransferencia
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
-------------------------------------------------------------------------------}
//N. Sol..........: 179583.9461
//N. Kintana......: 1656762
//Data............: 10/05/2012
//Responsável.....: Otacilio
//Descrição.......: Tratar mensagens incorretas e replicadas
//******************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlMovTransfBem;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes, SysUtils, dbclient, Provider, uMidasUtil,
     dMTBem, uDBSelBaixa, uDBSelBaixaBens, uDBBem, uDBBemxDep, uDBConjunto,
     uCtrlParamCAF, uCtrlBem, uCtrlGrupoContab, uCtrlConjunto,
     uCtrlHistMovBem, uCtrlCAFxContab, uCtrlFechamentoProRata,
     uCtrlLocalizacoes, uCtrlResponsavel, USistema;

Type
   TCtrlMovTransfBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbSelBaixa           : TDBSelBaixa;
      _dbSelBaixaBens       : TDBSelBaixaBens;

      _dbBem                : TDBBem;
      _dbBemxDep            : TDBBemxDep;
      _dbConjunto           : TDBConjunto;

      _dMTBem               : TdtmMTBem;

      Fcds                  : TClientDataSet;
      FcdsSelBaixaBens      : TClientDataSet;
      FcdsBemxMoeda         : TClientDataSet;
      FcdsAcrescValorxDep   : TClientDataSet;
      FcdsAcrescimoValor    : TClientDataSet;
      FcdsAcrescValorxMoeda : TClientDataSet;
      FcdsBem               : TClientDataSet;
      FcdsBemxDep           : TClientDataSet;
      FcdsReavalxDep        : TClientDataSet;
      FcdsReavalxMoeda      : TClientDataSet;
      FcdsReavaliacao       : TClientDataSet;

      FcdsGrupoAtual: TClientDataSet;
      FcdsConjuntoAtual: TClientDataSet;
      FcdsLocalizacaoAtual: TClientDataSet;
      FcdsResponsavelAtual: TClientDataSet;
      FcdsGrupo : TClientDataSet;
      FcdsConjunto : TClientDataSet;
      FcdsLocalizacao : TClientDataSet;
      FcdsResponsavel : TClientDataSet;

      FcdsGrupoATaxaDep     : TClientDataSet;
      FcdsGrupoNTaxaDep     : TClientDataSet;

      FcdsSelBaixa3: TClientDataSet;
      FcdsSelBaixaBens3: TClientDataSet;

      FnMovimentacao : Extended;

      ParamCAF    : TCtrlParamCAF;
      Bem         : TCtrlBem;
      GrupoContab : TCtrlGrupoContab;
      Conjunto    : TCtrlConjunto;
      HistMovBem  : TCtrlHistMovBem;
      CAFxContab  : TCtrlCAFxContab;
      ProRata     : TCtrlFechamentoProRata;
      Localizacao : TCtrlLocalizacoes;
      Responsavel : TCtrlResponsavel;

      bIntegraContab : Boolean;

      //----------------------------------------------------------------------------------
      // Barra de Progresso
      //----------------------------------------------------------------------------------
      iPrgBarPos: Integer;
      iPrgBarMax: Integer;
      sPrgBarMsg: String;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsSelBaixaBens(const Value: TClientDataSet);
      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsConjunto(const Value: TClientDataSet);
      procedure SetcdsGrupo(const Value: TClientDataSet);
      procedure SetcdsLocalizacao(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsResponsavel(const Value: TClientDataSet);
      procedure SetcdsGrupoATaxaDep(const Value: TClientDataSet);
      procedure SetcdsGrupoNTaxaDep(const Value: TClientDataSet);
      procedure SetcdsSelBaixa3(const Value: TClientDataSet);
      procedure SetcdsSelBaixaBens3(const Value: TClientDataSet);
      procedure SetcdsConjuntoAtual(const Value: TClientDataSet);
      procedure SetcdsGrupoAtual(const Value: TClientDataSet);
      procedure SetcdsLocalizacaoAtual(const Value: TClientDataSet);
      procedure SetcdsResponsavelAtual(const Value: TClientDataSet);

      procedure SetnMovimentacao(const Value: Extended);

      function ContabilizaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                        dDataMov : tDateTime;
                                        nGrupoAtual, nGrupoNovo : Extended;
                                        sGrupoAtual, sGrupoNovo : String;
                                        nConjuntoAtual, nConjuntoNovo : Extended;
                                        sCCustoAtual, sCCustoNovo : String;
                                        nSubContaAtual, nSubContaNovo,
                                        nAtivProjetoAtual, nAtivProjetoNovo : Extended;
                                        Var nTrfValOrg, nTrfCmBem, nTrfDepLanc, nTrfCmDep,
                                            nTrfReavValOrg, nTrfReavCmBem, nTrfReavDepLanc, nTrfReavCmDep,
                                            nTrfAvValOrg, nTrfAvCmBem, nTrfAvDepLanc, nTrfAvCmDep : Extended;
                                        iExercicio, iPeriodo : Integer;
                                        bCtaxCCusto : Boolean) : Extended;

      function CMTranslate(sIgor : String) : String;

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
      property cdsGrupo             : TClientDataSet read FcdsGrupo write SetcdsGrupo;
      property cdsConjunto          : TClientDataSet read FcdsConjunto write SetcdsConjunto;
      property cdsLocalizacao       : TClientDataSet read FcdsLocalizacao write SetcdsLocalizacao;
      property cdsResponsavel       : TClientDataSet read FcdsResponsavel write SetcdsResponsavel;
      property cdsGrupoAtual        : TClientDataSet read FcdsGrupoAtual write SetcdsGrupoAtual;
      property cdsConjuntoAtual     : TClientDataSet read FcdsConjuntoAtual write SetcdsConjuntoAtual;
      property cdsLocalizacaoAtual  : TClientDataSet read FcdsLocalizacaoAtual write SetcdsLocalizacaoAtual;
      property cdsResponsavelAtual  : TClientDataSet read FcdsResponsavelAtual write SetcdsResponsavelAtual;

      property nMovimentacao : Extended read FnMovimentacao write SetnMovimentacao;

      property cdsGrupoATaxaDep : TClientDataSet read FcdsGrupoATaxaDep write SetcdsGrupoATaxaDep;
      property cdsGrupoNTaxaDep : TClientDataSet read FcdsGrupoNTaxaDep write SetcdsGrupoNTaxaDep;

      property cdsSelBaixa3     : TClientDataSet read FcdsSelBaixa3 write SetcdsSelBaixa3;
      property cdsSelBaixaBens3 : TClientDataSet read FcdsSelBaixaBens3 write SetcdsSelBaixaBens3;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function RemoveLinkInventario(nIdPessoa, nIdSelBaixa: Extended) : Boolean;
      function VerificaGrupo(nIdPessoa, nIdGrupo, nIdConjunto : Extended) : Boolean;
      function VerificaClasse(nIdPessoa, nIdGrupo, nIdClasse : Extended) : Boolean;
      function RetornaGrupoContabil(nIdPessoa, nIdClasseBem, nIdLocalizacao : Extended): Extended;
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ListaSelBaixa(nIdPessoa : Extended; nIdSelBaixa: Extended = -1): OleVariant;
      function ListaSelBaixaBens(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
      function ListaSelTransfBens(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
      function ProcurarSELBAIXA(nIdPessoa, nIdSelBaixa: Extended) : OleVariant;
      function ProcurarSELBAIXABENS(nIdPessoa, nIdSelBaixa: Extended) : OleVariant;
      //----------------------------------------------------------------------------------
      //leandro SIG133082 - INICIO
      //function ExecutaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
      //                              dDataMov : TDateTime) : Extended;
      function ExecutaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov : TDateTime; bIntegraContabil : Boolean = True) : Extended;
      //leandro SIG133082 - FIM

      function EstornaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov, dDataEst : TDateTime;
                                    nIdHistMovim : Extended) : Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaTermoTransferencia(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                         dDataMov : tDateTime;
                                         sBilhete : String) : Boolean;
      function EstornaTermoTransferencia(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                         dDataMov, dDataEst : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                   dDataMov : TDateTime) : Extended;

      function EstornaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                   dDataMov, dDataEst : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaTermoCorrGrupoBem(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                        dDataMov : tDateTime;
                                        sBilhete : String) : Boolean;
      function EstornaTermoCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                        nSelBaixa : Extended;
                                        dDataMov, dDataEst : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      function GerarTermoTransfConjunto(nEmpresaProp, nTermo : Extended; sProcesso : String;
                                        dDataTermo : TDateTime; nRespTermo, nConjunto,
                                        nLocalNovo, nRespNovo : Extended) : Extended;
      function RemoveTermoTransfConjunto(nEmpresaProp, nIdSelBaixa : Extended) : boolean;
      //----------------------------------------------------------------------------------
      function ListaTransfIlegal(nEmpresaProp : Extended) : OleVariant;
      function ExecComandoSQL(sSql : String) : Boolean;
   end;

implementation

{ TCtrlMovTransfBem }

function TCtrlMovTransfBem.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

constructor TCtrlMovTransfBem.Create;
begin
   inherited;
   _dbSelBaixa     := TDbSelBaixa.Create(Self);
   _dbSelBaixaBens := TDbSelBaixaBens.Create(Self);
   _dbBem          := TDbBem.Create(Self);
   _dbBemxDep      := TDbBemxDep.Create(Self);
   _dbConjunto     := TDbConjunto.Create(Self);

   _dMTBem := tdtmMTBem.Create(Self);

   Fcds                  := TClientDataSet.Create(nil);
   FcdsSelBaixaBens      := TClientDataSet.Create(nil);
   FcdsBem               := TClientDataSet.Create(nil);
   FcdsGrupo             := TClientDataSet.Create(nil);
   FcdsConjunto          := TClientDataSet.Create(nil);
   FcdsLocalizacao       := TClientDataSet.Create(nil);
   FcdsResponsavel       := TClientDataSet.Create(nil);
   FcdsBemxMoeda         := TClientDataSet.Create(nil);
   FcdsBemxDep           := TClientDataSet.Create(nil);
   FcdsReavaliacao       := TClientDataSet.Create(nil);
   FcdsReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsReavalxDep        := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda := TClientDataSet.Create(nil);
   FcdsAcrescimoValor    := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep   := TClientDataSet.Create(nil);
   FcdsGrupoATaxaDep     := TClientDataSet.Create(nil);
   FcdsGrupoNTaxaDep     := TClientDataSet.Create(nil);
   FcdsSelBaixa3         := TClientDataSet.Create(nil);
   FcdsSelBaixaBens3     := TClientDataSet.Create(nil);
   FcdsGrupoAtual        := TClientDataSet.Create(nil);
   FcdsConjuntoAtual     := TClientDataSet.Create(nil);
   FcdsLocalizacaoAtual  := TClientDataSet.Create(nil);
   FcdsResponsavelAtual  := TClientDataSet.Create(nil);

   ParamCAF    := TCtrlParamCAF.Create;
   Bem         := TCtrlBem.Create;
   Conjunto    := TCtrlConjunto.Create;
   GrupoContab := TCtrlGrupoContab.Create;
   HistMovBem  := TCtrlHistMovBem.Create;
   CAFxContab  := TCtrlCAFxContab.Create;
   ProRata     := TCtrlFechamentoProRata.Create(nil);
   Localizacao := TCtrlLocalizacoes.Create;
   Responsavel := TCtrlResponsavel.Create;
end;

destructor TCtrlMovTransfBem.Destroy;
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

   ParamCAF.Free;
   Bem.Free;
   GrupoContab.Free;
   Conjunto.Free;
   HistMovBem.Free;
   CAFxContab.Free;
   ProRata.Free;
   Localizacao.Free;
   Responsavel.Free;

   _dbSelBaixa.Free;
   _dbSelBaixaBens.Free;
   _dbBem.Free;
   _dbBemxDep.Free;
   _dbConjunto.Free;

   _dMTBem.Free;

   if IsAppServer then
      FreeCDS([Fcds, FcdsSelBaixaBens, FcdsBem, FcdsGrupo, FcdsConjunto,
               FcdsLocalizacao, FcdsResponsavel, FcdsBemxMoeda, FcdsBemxDep,
               FcdsReavaliacao, FcdsReavalxMoeda, FcdsReavalxDep,
               FcdsAcrescValorxMoeda, FcdsAcrescimoValor, FcdsAcrescValorxDep]);

   FcdsGrupoATaxaDep.Free;
   FcdsGrupoNTaxaDep.Free;
   FcdsSelBaixa3.Free;
   FcdsSelBaixaBens3.Free;
   FcdsGrupoAtual.Free;
   FcdsConjuntoAtual.Free;
   FcdsLocalizacaoAtual.Free;
   FcdsResponsavelAtual.Free;
   inherited;
end;

procedure TCtrlMovTransfBem.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
   Bem.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CAFxContab.InitializeAs(Self);
   ProRata.InitializeAs(Self);
   Localizacao.InitializeAs(Self);
   Responsavel.InitializeAs(Self);
end;

procedure TCtrlMovTransfBem.DoChangeDataBase;
begin
   inherited;
   _dbSelBaixa.DataBaseName     := DataBaseName;
   _dbSelBaixaBens.DataBaseName := DataBaseName;
   _dbBem.DataBaseName          := DataBaseName;
   _dbBemxDep.DataBaseName      := DataBaseName;
   _dbConjunto.DataBaseName     := DataBaseName;
end;

procedure TCtrlMovTransfBem.OnCreateAppServer;
begin
   inherited;
   Fcds             := TClientDataSet.Create(nil);
   FcdsSelBaixaBens := TClientDataSet.Create(nil);
   FcdsBem          := TClientDataSet.Create(nil);
   FcdsGrupo        := TClientDataSet.Create(nil);
   FcdsConjunto     := TClientDataSet.Create(nil);
   FcdsLocalizacao  := TClientDataSet.Create(nil);
   FcdsResponsavel  := TClientDataSet.Create(nil);
end;

procedure TCtrlMovTransfBem.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlMovTransfBem.SetcdsSelBaixaBens(const Value: TClientDataSet);
begin
  FcdsSelBaixaBens := Value;
end;

procedure TCtrlMovTransfBem.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlMovTransfBem.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlMovTransfBem.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlMovTransfBem.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlMovTransfBem.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlMovTransfBem.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlMovTransfBem.SetcdsConjunto(const Value: TClientDataSet);
begin
  FcdsConjunto := Value;
end;

procedure TCtrlMovTransfBem.SetcdsGrupo(const Value: TClientDataSet);
begin
  FcdsGrupo := Value;
end;

procedure TCtrlMovTransfBem.SetcdsLocalizacao(const Value: TClientDataSet);
begin
  FcdsLocalizacao := Value;
end;

procedure TCtrlMovTransfBem.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlMovTransfBem.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlMovTransfBem.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlMovTransfBem.SetcdsResponsavel(const Value: TClientDataSet);
begin
  FcdsResponsavel := Value;
end;

procedure TCtrlMovTransfBem.SetnMovimentacao(const Value: Extended);
begin
  FnMovimentacao := Value;
end;

procedure TCtrlMovTransfBem.SetcdsGrupoATaxaDep(const Value: TClientDataSet);
begin
  FcdsGrupoATaxaDep := Value;
end;

procedure TCtrlMovTransfBem.SetcdsGrupoNTaxaDep(const Value: TClientDataSet);
begin
  FcdsGrupoNTaxaDep := Value;
end;

procedure TCtrlMovTransfBem.SetcdsSelBaixa3(const Value: TClientDataSet);
begin
  FcdsSelBaixa3 := Value;
end;

procedure TCtrlMovTransfBem.SetcdsSelBaixaBens3(const Value: TClientDataSet);
begin
  FcdsSelBaixaBens3 := Value;
end;

procedure TCtrlMovTransfBem.SetcdsConjuntoAtual(const Value: TClientDataSet);
begin
  FcdsConjuntoAtual := Value;
end;

procedure TCtrlMovTransfBem.SetcdsGrupoAtual(const Value: TClientDataSet);
begin
  FcdsGrupoAtual := Value;
end;

procedure TCtrlMovTransfBem.SetcdsLocalizacaoAtual(const Value: TClientDataSet);
begin
  FcdsLocalizacaoAtual := Value;
end;

procedure TCtrlMovTransfBem.SetcdsResponsavelAtual(const Value: TClientDataSet);
begin
  FcdsResponsavelAtual := Value;
end;

function TCtrlMovTransfBem.AplicaOperacao(sTipoOperacao: String): Boolean;
var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoSELTRANSFBEM(sTipoOperacao,
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
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlMovTransfBem.ProcurarSELBAIXA(nIdPessoa, nIdSelBaixa : Extended): OleVariant;
begin
   _dbSelBaixa.IDSELBAIXA.AsFloat := nIdSelBaixa;
   _dbSelBaixa.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbSelBaixa.sSQLSelect);
end;

function TCtrlMovTransfBem.ProcurarSELBAIXABENS(nIdPessoa, nIdSelBaixa : Extended): OleVariant;
begin
   _dbSelBaixaBens.IDSELBAIXA.AsFloat := nIdSelBaixa;
   _dbSelBaixaBens.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbSelBaixaBens.sSQLSelect);
end;

function TCtrlMovTransfBem.ListaSelBaixa(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT ST.IDSELBAIXA, ST.IDPESSOA, ST.SBTIPOMOV, ST.SBXTERMO, ST.SBXPROCESSO, ST.SBXDATA, ' + #13 +
           '        ST.IDRESPONSAVEL, P.NOME AS NOMERESP, ST.SBXFLGEXECUTADO, ST.SBXDTAEXECUTADO ' + #13 +
           ' FROM SELBAIXA ST, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE ';
   //-------------------------------------------------------------------------------------
   if nIdSelBaixa <> -1 then
      sSql := sSql + '       (ST.IDSELBAIXA = ' + floattostr(nIdSelBaixa) + ') AND ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '(ST.IDPESSOA = ' + floattostr(nIdPessoa)  + ') ' + #13 +
           '   AND (ST.SBTIPOMOV = 1) ' + #13 +            // 0 - Baixa, 1 - Transferencia
           '   AND (ST.IDRESPONSAVEL = P.IDPESSOA) ' + #13 +
           ' ORDER BY ST.SBXDATA, ST.IDSELBAIXA, ST.IDPESSOA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovTransfBem.ListaSelBaixaBens(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA, SBB.FLGEXECUTADO,' + #13 +
           '        SBB.IDCONJATUAL, SBB.IDLOCALATUAL,  SBB.IDRESPATUAL,   SBB.IDGRUPATUAL, ' + #13 +
           '        SBB.IDCONJUNTO,  SBB.IDLOCALIZACAO, SBB.IDRESPONSAVEL, SBB.IDGRUPO, ' + #13 +
           '        B.PLACA, B.DESBEM, C.DESCCONJUNTO, ' + #13 +
           '        G.NOME AS DESCGRUPO, ' + #13 +
           '        L.NOME AS DESCLOCAL, R.NOME AS NOMERESP, ' + #13 +
           '        B.IDCONJUNTO AS IDCONJUNTOATUAL, ' + #13 +
           '        B.IDGRUPO AS IDGRUPOCONTABATUAL, ' + #13 +
           '        C.IDLOCALIZACAO AS IDLOCALIZACAOATUAL, ' + #13 +
           '        C.IDRESPONSAVEL AS IDRESPONSAVELATUAL, ' + #13 +
           '        B.IDCLASSEBEM ' + #13 +
           '        ,0 AS FLGENVIAR ' + #13 + // Andre Imakawa - SIG 130571
           ' FROM SELBAIXABENS SBB, ' + #13 +
           '      BEM B, CONJUNTO C, GRUPO G, LOCALIZACAO L, PESSOA R ' + #13 +
           ' WHERE (SBB.IDSELBAIXA = ' + floattostr(nIdSelBaixa) + ') ' + #13 +
           '   AND (SBB.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (B.BAIXATOTAL <> ''S'') ' + #13 +
           '   AND (SBB.IDBEM = B.IDBEM) ' + #13 +
           '   AND (SBB.IDPESSOA = B.IDPESSOA) ' + #13 +
           '   AND (B.IDCONJUNTO = C.IDCONJUNTO) ' + #13 +
           '   AND (B.IDPESSOA = C.IDPESSOA) ' + #13 +
           '   AND (B.IDGRUPO = G.IDGRUPO) ' + #13 +
           '   AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO) ' + #13 +
           '   AND (C.IDPESSOA = L.IDPESSOA) ' + #13 +
           '   AND (C.IDRESPONSAVEL = R.IDPESSOA) ' + #13 +
           ' ORDER BY B.PLACA ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovTransfBem.ListaSelTransfBens(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT B.PLACA, ' + #13 +
           '        B.DESBEM, ' + #13 +
           '        CA.DESCCONJUNTO AS DESCCONJATUAL, ' + #13 +
           '        LA.NOME AS NOMELOCAATUAL, ' + #13 +
           '        PA.NOME AS NOMERESPATUAL, ' + #13 +
           '        GA.NOME AS DESCGRUPATUAL, ' + #13 +
           '        CN.DESCCONJUNTO AS DESCCONJNOVO, ' + #13 +
           '        LN.NOME AS NOMELOCANOVO, ' + #13 +
           '        PN.NOME AS NOMERESPNOVO, ' + #13 +
           '        GN.NOME AS DESCGRUPNOVO, ' + #13 +
           '        SBB.IDSELBAIXA, ' + #13 +
           '        SBB.IDBEM, ' + #13 +
           '        SBB.IDPESSOA, ' + #13 +
           '        SBB.IDCONJUNTO, B.IDCONJUNTO AS IDCONJATUAL, ' + #13 +
           '        SBB.IDGRUPO, B.IDGRUPO AS IDGRUPOATUAL, ' + #13 +
           '        SBB.IDLOCALIZACAO, CA.IDLOCALIZACAO AS IDLOCALATUAL, ' + #13 +
           '        SBB.IDRESPONSAVEL, CA.IDRESPONSAVEL AS IDRESPATUAL ' + #13 +
           ' FROM SELBAIXABENS SBB, ' + #13 +
           '      BEM B,            ' + #13 +
           '      CONJUNTO CA,      ' + #13 +
           '      GRUPO GA,         ' + #13 +
           '      LOCALIZACAO LA,   ' + #13 +
           '      PESSOA PA,        ' + #13 +
           '      CONJUNTO CN,      ' + #13 +
           '      GRUPO GN,         ' + #13 +
           '      LOCALIZACAO LN,   ' + #13 +
           '      PESSOA PN         ' + #13 +
           ' WHERE SBB.IDSELBAIXA = ' + floattostr(nIdSelBaixa) + #13 +
           '   AND SBB.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '   AND SBB.FLGEXECUTADO = 0 ' + #13 +
           '   AND B.BAIXATOTAL <> ''S'' ' + #13 +
           '   AND SBB.IDBEM = B.IDBEM ' + #13 +
           '   AND SBB.IDPESSOA = B.IDPESSOA ' + #13 +
           '   AND B.IDCONJUNTO = CA.IDCONJUNTO ' + #13 +
           '   AND B.IDPESSOA = CA.IDPESSOA ' + #13 +
           '   AND CA.IDLOCALIZACAO = LA.IDLOCALIZACAO ' + #13 +
           '   AND CA.IDPESSOA = LA.IDPESSOA ' + #13 +
           '   AND CA.IDRESPONSAVEL = PA.IDPESSOA ' + #13 +
           '   AND B.IDGRUPO = GA.IDGRUPO ' + #13 +
           '   AND SBB.IDCONJUNTO = CN.IDCONJUNTO ' + #13 +
           '   AND SBB.IDPESSOA = CN.IDPESSOA ' + #13 +
           '   AND SBB.IDLOCALIZACAO = LN.IDLOCALIZACAO ' + #13 +
           '   AND SBB.IDPESSOA = LN.IDPESSOA ' + #13 +
           '   AND SBB.IDRESPONSAVEL = PN.IDPESSOA ' + #13 +
           '   AND SBB.IDGRUPO = GN.IDGRUPO ' + #13 +
           ' ORDER BY B.PLACA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovTransfBem.RemoveLinkInventario(nIdPessoa, nIdSelBaixa: Extended): Boolean;
var
   sSql : String;

begin
   try
      sSql := ' UPDATE INVENTARIOBENS ' + #13 +
              ' SET STATUS = 1, '       + #13 +
              '     IDSELBAIXA = NULL ' + #13 +
              ' WHERE (IDSELBAIXA = ' + floattostr(nIdSelBaixa) + ')' + #13 +
              '   AND (IDEMPRESA = ' + floattostr(nIdPessoa) + ')' + #13 ;
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo);
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

function TCtrlMovTransfBem.RetornaGrupoContabil(nIdPessoa, nIdClasseBem, nIdLocalizacao : Extended): Extended;
var
   sSql : String;
begin
   sSql := ' SELECT GXCC.IDGRUPO ' + #13 +
           ' FROM CLASSEXGRUPO CXG, ' + #13 +
           '      GRUPOBEMXCC GXCC, ' + #13 +
           '      LOCALIZACAO L, ' + #13 +
           '      PLANOGRUPO PG ' + #13 +
           ' WHERE (L.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (L.IDLOCALIZACAO = ' + floattostr(nIdLocalizacao) + ') ' + #13 +
           '   AND (CXG.IDCLASSEBEM = ' + floattostr(nIdClasseBem) + ') ' + #13 +
           '   AND (PG.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (PG.INATIVO = 0) ' + #13 +
           '   AND (CXG.IDGRUPO = GXCC.IDGRUPO) ' + #13 +
           '   AND (GXCC.CODCENTROCUSTO = L.CODCENTROCUSTO) ' + #13 +
           '   AND (GXCC.IDEMPRESA = L.IDEMPRESA) ' + #13 +
           '   AND (GXCC.IDGRUPO = PG.IDGRUPO)';
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
      Result := 0
   else
   if (_cds.RecordCount <> 1)  then
      Result := -1
   else
      Result := _cds.FieldByName('IDGRUPO').AsFloat;
end;

function TCtrlMovTransfBem.VerificaGrupo(nIdPessoa, nIdGrupo, nIdConjunto : Extended) : Boolean;
var
   sSql : String;
begin
   sSql := ' SELECT GXCC.IDGRUPO    ' + #13 +
           ' FROM CONJUNTO C,       ' + #13 +
           '      LOCALIZACAO L,    ' + #13 +
           '      GRUPOBEMXCC GXCC, ' + #13 +
           '      PLANOGRUPO PG     ' + #13 +
           ' WHERE (C.IDCONJUNTO     = ' + floattostr(nIdConjunto) + ') ' + #13 +
           '   AND (C.IDPESSOA       = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (GXCC.IDGRUPO     = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (GXCC.IDEMPRESA   = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO)     ' + #13 +
           '   AND (C.IDPESSOA       = L.IDPESSOA)          ' + #13 +
           '   AND (L.CODCENTROCUSTO = GXCC.CODCENTROCUSTO) ' + #13 +
           '   AND (L.IDEMPRESA      = GXCC.IDEMPRESA)      ' + #13 +
           '   AND (GXCC.IDGRUPO     = PG.IDGRUPO)          ' + #13 +
           '   AND (GXCC.IDEMPRESA   = PG.IDPESSOA)         ' + #13;
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if (_cds.IsEmpty) or (_cds.RecordCount > 1) then
      Result := False
   else
      Result := True;
end;

function TCtrlMovTransfBem.VerificaClasse(nIdPessoa, nIdGrupo, nIdClasse : Extended) : Boolean;
var
   sSql : String;
begin
   sSql := ' SELECT C.IDCLASSEBEM, C.IDGRUPO ' + #13 +
           ' FROM   CLASSEXGRUPO C, ' + #13 +
           '        PLANOGRUPO G ' + #13 +
           ' WHERE (C.IDCLASSEBEM = ' + floattostr(nIdClasse) + ') ' + #13 +
           '   AND (C.IDGRUPO = ' + floattostr(nIdGrupo) + ') ' + #13 +
           '   AND (G.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13 +
           '   AND (G.INATIVO = 0) ' + #13 +
           '   AND (C.IDGRUPO = G.IDGRUPO) ';
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if (_cds.IsEmpty) or (_cds.RecordCount > 1) then
      Result := False
   else
      Result := True;
end;
//========================================================================================
// Função que executa a Transferencia de Grupo de um Bem
//----------------------------------------------------------------------------------------
// nModulo       : id do Módulo que incluiu o bem                     (IDMODULO)
// nEmpresaProp  : id da Empresa Proprietária                         (IDPESSOA)
// nBem          : id do Bem movimentado                              (IDBEM)
// dDataMov      : Data da Transferência                              (DATAMOVIMENTACAO)
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.ExecutaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                                dDataMov : TDateTime; bIntegraContabil : Boolean = True) : Extended;
var
   sCCustoAtual, sCCustoNovo,
   sSql, sGrupoAtual, sGrupoNovo   : String;
   dDataUltMov,dDataUltDep         : TDateTime;
   nGrupoAtual, nConjuntoAtual,
   nLocalAtual, nRespAtual,
   nGrupoNovo, nConjuntoNovo,
   nLocalNovo, nRespNovo,
   nTrfValOrg, nTrfReavValOrg,
   nTrfAvValOrg, nTrfCmBem,
   nTrfReavCmBem, nTrfAvCmBem,
   nTrfDepLanc, nTrfReavDepLanc,
   nTrfAvDepLanc, nTrfCmDep,
   nTrfReavCmDep, nTrfAvCmDep,
   nSeqHistTransfGrupo,
   nSeqHistTransfConj,
   nSeqHistTransfLocal,
   nSeqHistTransfResp,
   nPlanilha                       : Extended;
   iExercicio, iPeriodo,
   iFlgPai                         : Integer;
   bCtaxCCusto                     : Boolean;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem,
                                                          dDataMov, FnMovimentacao, FcdsBem.Data,
                                                          FcdsGrupo.Data, FcdsLocalizacao.Data,
                                                          FcdsResponsavel.Data, FcdsConjunto.Data,
                                                          FcdsGrupoAtual.Data, FcdsLocalizacaoAtual.Data,
                                                          FcdsResponsavelAtual.Data, FcdsConjuntoAtual.Data);
      if Result < 0 then
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
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
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
         // Carrega os Parâmetros Básicos
         //-------------------------------------------------------------------------------
         if Self.OpenTransaction or ((nModulo = 54) or (nModulo = 64)) then // Transferência de um Bem
         begin
            nGrupoAtual    := FcdsBem.FieldByName('IDGRUPO').AsFloat;
            sGrupoAtual    := FcdsBem.FieldByName('DESCGRUPO').AsString;
            nConjuntoAtual := FcdsBem.FieldByName('IDCONJUNTO').AsFloat;
            nLocalAtual    := FcdsBem.FieldByName('IDLOCALIZACAO').AsFloat;
            sCCustoAtual   := FcdsBem.FieldByName('CODCENTROCUSTO').AsString;
            nRespAtual     := FcdsBem.FieldByName('IDRESPONSAVEL').AsFloat;
         end else                                  // Transferência de uma Seleção de Bens
         begin
            nGrupoAtual    := FcdsGrupoAtual.FieldByName('IDGRUPO').AsFloat;
            sGrupoAtual    := FcdsGrupoAtual.FieldByName('NOME').AsString;
            nConjuntoAtual := FcdsConjuntoAtual.FieldByName('IDCONJUNTO').AsFloat;
            nLocalAtual    := FcdsLocalizacaoAtual.FieldByName('IDLOCALIZACAO').AsFloat;
            sCCustoAtual   := FcdsLocalizacaoAtual.FieldByName('CODCENTROCUSTO').AsString;
            nRespAtual     := FcdsResponsavelAtual.FieldByName('IDRESPONSAVEL').AsFloat;
         end;
         nGrupoNovo     := FcdsGrupo.FieldByName('IDGRUPO').AsFloat;
         sGrupoNovo     := FcdsGrupo.FieldByName('NOME').AsString;
         nConjuntoNovo  := FcdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
         nLocalNovo     := FcdsLocalizacao.FieldByName('IDLOCALIZACAO').AsFloat;
         sCCustoNovo    := FcdsLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
         nRespNovo      := FcdsResponsavel.FieldByName('IDRESPONSAVEL').AsFloat;
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '02,05,11,12',
                                       dDataMov, dDataUltMov, dDataUltDep) then
         begin
           // SOL 179583.9461 KTN 1656762  Otacilio ** Inicio **
           //Raise Exception.Create(Bem.MessageInfo);
           MessageInfo := '';
           RollBack;
           Result := -1;
           Exit;
           // SOL 179583.9461 KTN 1656762  Otacilio ** Fim **
         end;
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem que será transferido
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
         // Processa a transferencia na contabilidade
         //-------------------------------------------------------------------------------
         nTrfValOrg  := 0; nTrfReavValOrg  := 0; nTrfAvValOrg  := 0;
         nTrfCmBem   := 0; nTrfReavCmBem   := 0; nTrfAvCmBem   := 0;
         nTrfDepLanc := 0; nTrfReavDepLanc := 0; nTrfAvDepLanc := 0;
         nTrfCmDep   := 0; nTrfReavCmDep   := 0; nTrfAvCmDep   := 0;
         //-------------------------------------------------------------------------------
         nPlanilha := 0;
         if bIntegraContab and bIntegraContabil and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
         begin
            if not CAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
                                                      iExercicio, iPeriodo) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query de montagem da Planilha Contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.InicializaMontaContab then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query com a Parametrização contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Lê a Dependencia da Conta Contábil do Centro de Custo
            //----------------------------------------------------------------------------
            bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
            //----------------------------------------------------------------------------
            // Alimenta o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            nPlanilha := ContabilizaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov,
                                                  nGrupoAtual, nGrupoNovo,
                                                  sGrupoAtual, sGrupoNovo,
                                                  nConjuntoAtual, nConjuntoNovo,
                                                  sCCustoAtual, sCCustoNovo,
                                                  FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                  FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                  FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                  FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                  nTrfValOrg, nTrfCmBem, nTrfDepLanc, nTrfCmDep,
                                                  nTrfReavValOrg, nTrfReavCmBem, nTrfReavDepLanc, nTrfReavCmDep,
                                                  nTrfAvValOrg, nTrfAvCmBem, nTrfAvDepLanc, nTrfAvCmDep,
                                                  iExercicio, iPeriodo,
                                                  bCtaxCCusto);
            if nPlanilha < 0 then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // SE O GRUPO INFORMADO FOR DIFERENTE DO ATUAL, EXECUTA TRANSFERÊNCIA DE GRUPO
         //-------------------------------------------------------------------------------
         nSeqHistTransfGrupo := -1;
         if nGrupoAtual <> nGrupoNovo then
         begin
            //----------------------------------------------------------------------------
            // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
            //----------------------------------------------------------------------------
            nSeqHistTransfGrupo := HistMovBem.RegistraHistMovBem(nBem,                    // IDBEM
                                                                 nEmpresaProp,            // IDPESSOA
                                                                 nModulo,                 // IDMODULO
                                                                 05,                      // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                // DATAMOVIMENTACAO
                                                                 -1,                      // IDREAVALACRESC
                                                                 -1,                      // DATAULTDEP
                                                                 nGrupoAtual,             // IDGRUPANT
                                                                 -1,                      // IDCONJANT
                                                                 -1,                      // IDLOCALANT
                                                                 -1,                      // IDRESPANT
                                                                 -1,                      // PLACAANT
                                                                 nPlanilha,               // PLNCODIGO
                                                                 '',                      // OBSREAVAL
                                                                  0,                      // TIPDEPPRORATA
                                                                 -1,                      // IDTIPODESPESA
                                                                 '',                      // OBSACRESCIMO
                                                                 -1,                      // IDMOTIVOBAIXA
                                                                  0,                      // PROPBAIXA
                                                                  0,                      // VALVENDAOFI
                                                                 '');                     // OBSBAIXA
            if nSeqHistTransfGrupo = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            FnMovimentacao := nSeqHistTransfGrupo;
         end;
         //-------------------------------------------------------------------------------
         // SE O CONJUNTO INFORMADO FOR DIFERENTE DO ATUAL,
         // EXECUTA TRANSFERÊNCIA DE CONJUNTO
         //-------------------------------------------------------------------------------
         nSeqHistTransfConj  := -1;
         if nConjuntoAtual <> nConjuntoNovo then
         begin
            //----------------------------------------------------------------------------
            // Registra a Movimentacao (HISTORICOMOVIMENTACAO)
            //----------------------------------------------------------------------------
            nSeqHistTransfConj := HistMovBem.RegistraHistMovBem(nBem,                     // IDBEM
                                                                nEmpresaProp,             // IDPESSOA
                                                                nModulo,                  // IDMODULO
                                                                12,                       // IDTIPOMOVIMENTACAO
                                                                dDataMov,                 // DATAMOVIMENTACAO
                                                                -1,                       // IDREAVALACRESC
                                                                -1,                       // DATAULTDEP
                                                                -1,                       // IDGRUPANT
                                                                nConjuntoAtual,           // IDCONJANT
                                                                -1,                       // IDLOCALANT
                                                                -1,                       // IDRESPANT
                                                                -1,                       // PLACAANT
                                                                nPlanilha,                // PLNCODIGO
                                                                '',                       // OBSREAVAL
                                                                0,                        // TIPDEPPRORATA
                                                                -1,                       // IDTIPODESPESA
                                                                '',                       // OBSACRESCIMO
                                                                -1,                       // IDMOTIVOBAIXA
                                                                 0,                       // PROPBAIXA
                                                                 0,                       // VALVENDAOFI
                                                                '');                      // OBSBAIXA
            if nSeqHistTransfConj = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // SE A LOCALIZAÇÃO INFORMADA FOR DIFERENTE DA ATUAL,
         // EXECUTA TRANSFERÊNCIA DE LOCAL
         //-------------------------------------------------------------------------------
         nSeqHistTransfLocal := -1;
         if nLocalAtual <> nLocalNovo then
         begin
            //----------------------------------------------------------------------------
            // Registra a Movimentacao (HISTORICOMOVIMENTACAO)
            //----------------------------------------------------------------------------
            nSeqHistTransfLocal := HistMovBem.RegistraHistMovBem(nBem,                    // IDBEM
                                                                 nEmpresaProp,            // IDPESSOA
                                                                 nModulo,                 // IDMODULO
                                                                 11,                      // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                // DATAMOVIMENTACAO
                                                                 -1,                      // IDREAVALACRESC
                                                                 -1,                      // DATAULTDEP
                                                                 -1,                      // IDGRUPANT
                                                                 -1,                      // IDCONJANT
                                                                 nLocalAtual,             // IDLOCALANT
                                                                 nRespAtual,              // IDRESPANT
                                                                 -1,                      // PLACAANT
                                                                 nPlanilha,               // PLNCODIGO
                                                                 '',                      // OBSREAVAL
                                                                  0,                      // TIPDEPPRORATA
                                                                 -1,                      // IDTIPODESPESA
                                                                 '',                      // OBSACRESCIMO
                                                                 -1,                      // IDMOTIVOBAIXA
                                                                  0,                      // PROPBAIXA
                                                                  0,                      // VALVENDAOFI
                                                                 '');                     // OBSBAIXA
            if nSeqHistTransfLocal = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // SE O RESPONSAVEL INFORMADO FOR DIFERENTE DO ATUAL,
         // EXECUTA TRANSFERÊNCIA DE RESPONSÁVEL
         //-------------------------------------------------------------------------------
         if nRespAtual <> nRespNovo then
         begin
            //----------------------------------------------------------------------------
            // Registra a Movimentacao (HISTORICOMOVIMENTACAO)
            //----------------------------------------------------------------------------
            nSeqHistTransfResp  := HistMovBem.RegistraHistMovBem(nBem,                    // IDBEM
                                                                 nEmpresaProp,            // IDPESSOA
                                                                 nModulo,                 // IDMODULO
                                                                 02,                      // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                // DATAMOVIMENTACAO
                                                                 -1,                      // IDREAVALACRESC
                                                                 -1,                      // DATAULTDEP
                                                                 -1,                      // IDGRUPANT
                                                                 -1,                      // IDCONJANT
                                                                 nLocalAtual,             // IDLOCALANT
                                                                 nRespAtual,              // IDRESPANT
                                                                 -1,                      // PLACAANT
                                                                 nPlanilha,               // PLNCODIGO
                                                                 '',                      // OBSREAVAL
                                                                  0,                      // TIPDEPPRORATA
                                                                 -1,                      // IDTIPODESPESA
                                                                 '',                      // OBSACRESCIMO
                                                                 -1,                      // IDMOTIVOBAIXA
                                                                  0,                      // PROPBAIXA
                                                                  0,                      // VALVENDAOFI
                                                                 '');                     // OBSBAIXA
            if nSeqHistTransfResp = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Armazena os valores registrados na planilha contábil no
         // HistoricoMovimentacao
         //-------------------------------------------------------------------------------
         if nPlanilha > 0 then
         begin
            if nSeqHistTransfGrupo > 0 then
            begin
               _dMTBem.sqlTransfHistMovBem.Prepare;
               _dMTBem.sqlTransfHistMovBem.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHistTransfGrupo;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFVALORG').AsFloat      := nTrfVALORG     ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMBEM').AsFloat       := nTrfCMBEM      ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFDEPLANC').AsFloat     := nTrfDEPLANC    ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMDEP').AsFloat       := nTrfCMDEP      ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVVALORG').AsFloat  := nTrfReavVALORG ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMBEM').AsFloat   := nTrfReavCMBEM  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVDEPLANC').AsFloat := nTrfReavDEPLANC;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMDEP').AsFloat   := nTrfReavCMDEP  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVVALORG').AsFloat    := nTrfAvVALORG   ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMBEM').AsFloat     := nTrfAvCMBEM    ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVDEPLANC').AsFloat   := nTrfAvDEPLANC  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMDEP').AsFloat     := nTrfAvCMDEP    ;
               if not ExecSQL(_dMTBem.sqlTransfHistMovBem.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end else
            if nSeqHistTransfConj > 0 then
            begin
               _dMTBem.sqlTransfHistMovBem.Prepare;
               _dMTBem.sqlTransfHistMovBem.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHistTransfConj;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFVALORG').AsFloat      := nTrfVALORG     ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMBEM').AsFloat       := nTrfCMBEM      ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFDEPLANC').AsFloat     := nTrfDEPLANC    ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMDEP').AsFloat       := nTrfCMDEP      ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVVALORG').AsFloat  := nTrfReavVALORG ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMBEM').AsFloat   := nTrfReavCMBEM  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVDEPLANC').AsFloat := nTrfReavDEPLANC;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMDEP').AsFloat   := nTrfReavCMDEP  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVVALORG').AsFloat    := nTrfAvVALORG   ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMBEM').AsFloat     := nTrfAvCMBEM    ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVDEPLANC').AsFloat   := nTrfAvDEPLANC  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMDEP').AsFloat     := nTrfAvCMDEP    ;
               if not ExecSQL(_dMTBem.sqlTransfHistMovBem.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end else
            if nSeqHistTransfLocal > 0 then
            begin
               _dMTBem.sqlTransfHistMovBem.Prepare;
               _dMTBem.sqlTransfHistMovBem.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHistTransfLocal;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFVALORG').AsFloat      := nTrfVALORG     ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMBEM').AsFloat       := nTrfCMBEM      ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFDEPLANC').AsFloat     := nTrfDEPLANC    ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMDEP').AsFloat       := nTrfCMDEP      ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVVALORG').AsFloat  := nTrfReavVALORG ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMBEM').AsFloat   := nTrfReavCMBEM  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVDEPLANC').AsFloat := nTrfReavDEPLANC;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMDEP').AsFloat   := nTrfReavCMDEP  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVVALORG').AsFloat    := nTrfAvVALORG   ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMBEM').AsFloat     := nTrfAvCMBEM    ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVDEPLANC').AsFloat   := nTrfAvDEPLANC  ;
               _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMDEP').AsFloat     := nTrfAvCMDEP    ;
               if not ExecSQL(_dMTBem.sqlTransfHistMovBem.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Altera a Tabela Bem
         //-------------------------------------------------------------------------------
         FcdsBem.Edit;
         FcdsBem.FieldByName('IDGRUPO').AsFloat    := nGrupoNovo;
         FcdsBem.FieldByName('IDCONJUNTO').AsFloat := nConjuntoNovo;
         FcdsBem.Post;
         if not ApplyCds(FcdsBem,_dbBem,[],[]) then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Altera a Tabela Conjunto
         //-------------------------------------------------------------------------------
         FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp, nConjuntoNovo);
         //-------------------------------------------------------------------------------
         // Se houve transferência de localização/responsável do conjunto
         //-------------------------------------------------------------------------------
         if (nConjuntoAtual = nConjuntoNovo) and
            ((nLocalAtual <> nLocalNovo) or (nRespAtual <> nRespNovo)) then
         begin
            //----------------------------------------------------------------------------
            // Altera a localizacao do conjunto
            //----------------------------------------------------------------------------
            FcdsConjunto.Edit;
            FcdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat := nLocalNovo;
            FcdsConjunto.FieldByName('IDRESPONSAVEL').AsFloat := nRespNovo;
            FcdsConjunto.Post;
            if not ApplyCds(FcdsConjunto, _dbConjunto, [], []) then
               Raise Exception.Create(_dbConjunto.MessageInfo);
            //----------------------------------------------------------------------------
            // Altera o Centro de Custo da Localizacao do Conjunto
            //----------------------------------------------------------------------------
            if nLocalAtual <> nLocalNovo then
            begin
               sSql := ' UPDATE CONJUNTO ' +
                       ' SET IDLOCALIZACAO = ' + floattostr(nLocalNovo) + #13 +
                       ' WHERE (IDCONJUNTO = ' + floattostr(nConjuntoNovo) + ')' + #13 +
                       '   AND (IDPESSOA   = ' + floattostr(nEmpresaProp) + ')' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               sSql := ' UPDATE RATEIODEPRECIACAO ' + #13 +
                       ' SET CODCENTROCUSTO = ' + #39 + sCCustoNovo + #39 + #13 +
                       ' WHERE (IDCONJUNTO = ' + floattostr(nConjuntoNovo) + ') '+ #13 +
                       '   AND (LTRIM(RTRIM(CODCENTROCUSTO)) = ' + #39 + sCCustoAtual + #39 + ')';
               if not ExecSQL(sSql, True) then
               begin
                  sSql := ' UPDATE RATEIODEPRECIACAO ' + #13 +
                          ' SET CODCENTROCUSTO = ' + #39 + sCCustoNovo + #39 + #13 +
                          ' WHERE (IDCONJUNTO = ' + floattostr(nConjuntoNovo) + ') '+ #13 +
                          '   AND (PARTICIPACAO = 100)';
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([ParamCAF.MOEDAOFICIAL]),[]);
            iFlgPai := 1;
            while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsFloat =
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat) do
            begin
               if not Bem.AtualizaSaldoContabBem(Trunc(nEmpresaProp),
                                                 Trunc(nBem),
                                                 dDataMov,
                                                 FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                 FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                 FcdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                                 FcdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                                 FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                 FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                 0, iFlgPai) then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := nPlanilha;
      except
         On E : Exception do
         begin
            RollBack;
            Result := -1;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa a Contabilizacao das Transferências de Grupo e Conjunto.
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.ContabilizaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                                    dDataMov : tDateTime;
                                                    nGrupoAtual, nGrupoNovo : Extended;
                                                    sGrupoAtual, sGrupoNovo : String;
                                                    nConjuntoAtual, nConjuntoNovo : Extended;
                                                    sCCustoAtual, sCCustoNovo : String;
                                                    nSubContaAtual, nSubContaNovo,
                                                    nAtivProjetoAtual, nAtivProjetoNovo : Extended;
                                                    Var nTrfValOrg, nTrfCmBem, nTrfDepLanc, nTrfCmDep,
                                                        nTrfReavValOrg, nTrfReavCmBem, nTrfReavDepLanc, nTrfReavCmDep,
                                                        nTrfAvValOrg, nTrfAvCmBem, nTrfAvDepLanc, nTrfAvCmDep : Extended;
                                                    iExercicio, iPeriodo : Integer;
                                                    bCtaxCCusto : Boolean) : Extended;
var
   nValorB, nValorCM,
   nValorD, nValorCMD,
   nPlanilha            : Extended;

begin
   try
      //----------------------------------------------------------------------------------
      // Link de Dados com a Classe PróRata
      //----------------------------------------------------------------------------------
      ProRata.cdsBem               := FcdsBem;
      ProRata.cdsBemxMoeda         := FcdsBemxMoeda;
      ProRata.cdsBemxDep           := FcdsBemxDep;
      ProRata.cdsReavaliacao       := FcdsReavaliacao;
      ProRata.cdsReavalxMoeda      := FcdsReavalxMoeda;
      ProRata.cdsReavalxDep        := FcdsReavalxDep;
      ProRata.cdsAcrescimoValor    := FcdsAcrescimoValor;
      ProRata.cdsAcrescValorxMoeda := FcdsAcrescValorxMoeda;
      ProRata.cdsAcrescValorxDep   := FcdsAcrescValorxDep;
      //----------------------------------------------------------------------------------
      // Calcula a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), 0) then
         Raise Exception.Create(ProRata.MessageInfo);
      //----------------------------------------------------------------------------------
      // Contabiliza a transferencia do componente BEM
      // IDBEMXDEP = 1 : Será sempre o País onde está instalado o CAF
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Locate('MOECODIGO', VarArrayOf([ParamCAF.MOEDAOFICIAL]),[]);
      FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([ParamCAF.MOEDAOFICIAL, 1]),[]);
      nValorB   := FcdsBemxMoeda.FieldByName('VALORG').asFloat;
      nValorCM  := FcdsBemxMoeda.FieldByName('CMBEM').asFloat;
      nValorD   := FcdsBemxDep.FieldByName('DEPLANC').asFloat;
      nValorCMD := FcdsBemxDep.FieldByName('CMDEP').asFloat;
      //----------------------------------------------------------------------------------
      if not CAFxContab.ContabilizaTransferencia(nModulo, nEmpresaProp, nBem,
                                                 nGrupoAtual,nGrupoNovo,
                                                 sGrupoAtual, sGrupoNovo,
                                                 nConjuntoAtual,nConjuntoNovo,
                                                 sCCustoAtual, sCCustoNovo,
                                                 dDataMov,
                                                 nValorB,nValorCM,nValorD,nValorCMD,
                                                 FcdsBem.FieldByName('DESBEM').AsString,
                                                 'B',
                                                 nSubContaAtual, nAtivProjetoAtual,
                                                 FcdsBem.FieldByName('PLACA').AsString,
                                                 iExercicio, iPeriodo,
                                                 bCtaxCCusto) then
         Raise Exception.Create(CAFxContab.MessageInfo);
      //----------------------------------------------------------------------------------
      nTrfValOrg  := nTrfValOrg  + nValorB;
      nTrfCmBem   := nTrfCmBem   + nValorCM;
      nTrfDepLanc := nTrfDepLanc + nValorD;
      nTrfCmDep   := nTrfCmDep   + nValorCMD;
      //----------------------------------------------------------------------------------
      // Transfere os valores das reavaliações do bem
      //----------------------------------------------------------------------------------
      FcdsReavaliacao.First;
      while not FcdsReavaliacao.EOF do
      begin
         FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',
                                 VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat, ParamCAF.MOEDAOFICIAL]),[]);
         FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',
                               VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat, ParamCAF.MOEDAOFICIAL, 1]),[]);
         nValorB   := FcdsReavalxMoeda.FieldByName('VALORG').asFloat;
         nValorCM  := FcdsReavalxMoeda.FieldByName('CMBEM').asFloat;
         nValorD   := FcdsReavalxDep.FieldByName('DEPLANC').asFloat;
         nValorCMD := FcdsReavalxDep.FieldByName('CMDEP').asFloat;
         //-------------------------------------------------------------------------------
         if not CAFxContab.ContabilizaTransferencia(nModulo, nEmpresaProp, nBem,
                                                    nGrupoAtual,nGrupoNovo,
                                                    sGrupoAtual, sGrupoNovo,
                                                    nConjuntoAtual,nConjuntoNovo,
                                                    sCCustoAtual, sCCustoNovo,
                                                    dDataMov,
                                                    nValorB,nValorCM,nValorD,nValorCMD,
                                                    FcdsBem.FieldByName('DESBEM').AsString,
                                                    'R',
                                                    nSubContaAtual, nAtivProjetoAtual,
                                                    FcdsBem.FieldByName('PLACA').AsString,
                                                    iExercicio, iPeriodo,
                                                    bCtaxCCusto) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         nTrfReavValOrg  := nTrfReavValOrg  + nValorB;
         nTrfReavCmBem   := nTrfReavCmBem   + nValorCM;
         nTrfReavDepLanc := nTrfReavDepLanc + nValorD;
         nTrfReavCmDep   := nTrfReavCmDep   + nValorCMD;
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Transfere os Valores dos acréscimos de valor do bem
      //----------------------------------------------------------------------------------
      FcdsAcrescimoValor.First;
      while not FcdsAcrescimoValor.EOF do
      begin
         FcdsAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',
                                      VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat, ParamCAF.MOEDAOFICIAL]),[]);
         FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',
                                    VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat, ParamCAF.MOEDAOFICIAL, 1]),[]);
         nValorB   := FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat;
         nValorCM  := FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat;
         nValorD   := FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat;
         nValorCMD := FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat;
         //-------------------------------------------------------------------------------
         if not CAFxContab.ContabilizaTransferencia(nModulo, nEmpresaProp, nBem,
                                                    nGrupoAtual,nGrupoNovo,
                                                    sGrupoAtual, sGrupoNovo,
                                                    nConjuntoAtual,nConjuntoNovo,
                                                    sCCustoAtual, sCCustoNovo,
                                                    dDataMov,
                                                    nValorB,nValorCM,nValorD,nValorCMD,
                                                    FcdsBem.FieldByName('DESBEM').AsString,
                                                    'A',
                                                    nSubContaAtual, nAtivProjetoAtual,
                                                    FcdsBem.FieldByName('PLACA').AsString,
                                                    iExercicio, iPeriodo,
                                                    bCtaxCCusto) then
            Raise Exception.Create(CAFxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         nTrfAvValOrg  := nTrfAvValOrg  + nValorB;
         nTrfAvCmBem   := nTrfAvCmBem   + nValorCM;

         nTrfAvDepLanc := nTrfAvDepLanc + nValorD;
         nTrfAvCmDep   := nTrfAvCmDep   + nValorCMD;
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Next;
      end;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         nPlanilha := CAFxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp,
                                                          nUsuario, datetostr(dDataMov));
         if nPlanilha < 0 then
            Raise Exception.Create(CAFxContab.MessageInfo);
      end else
         nPlanilha := 0;
      //----------------------------------------------------------------------------------
      Result := nPlanilha;
   except
      On E : Exception do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa o estorno de uma transferencia de grupo / conjunto / local / resp
//----------------------------------------------------------------------------------------
//
// nModulo      : id do Módulo que incluiu o bem                    (IDMODULO)
// nEmpresaProp : id da Empresa Proprietária                        (IDPESSOA)
// nBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.EstornaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                                dDataMov, dDataEst : TDateTime;
                                                nIdHistMovim : Extended) : Boolean;
var
   _cds2 : TClientDataSet;
   iTotPlan,
   iExercicio,iPeriodo,
   iAux, iPlan, iFlgPai              : Integer;
   sCCustoAtual, sSql                : String;
   bNovoPlnCodigo,
   bTransfConjunto                   : Boolean;
   aPlanilha                         : array of Integer;
   aDataMov                          : array of tDateTime;
   bInTransacao                      : boolean;   // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;   // Vando - SOL 154328-5901 / KTN 1373449

   _cds2 := TClientDataSet.Create(nil);
   Result := False;
   try
      if ConnectionSide = cnsClient then
      begin
         Result := Connection.AppServer.EstornaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem,
                                                             dDataMov, nIdHistMovim);
         if not Result then
            MessageInfo := Connection.AppServer.MessageInfo;
      end else
      begin
         try
            if not bInTransacao then   // Vando - SOL 154328-5901 / KTN 1373449
               StartTransaction;
            //----------------------------------------------------------------------------
            // Carga dos parâmetros do sistema
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(nEmpresaProp) then
            begin
               MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // verifica se ja houve movimentação no bem após a Transferência
            //----------------------------------------------------------------------------
            sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                    ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                    ' WHERE  (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' + #13 +
                    '   AND  (IDBEM = ' + floattostr(nBem) + ') ' + #13;
            _cds.Data := GetDataPacket(sSql);
            if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
               Raise Exception.Create(CMTranslate('Existe movimentação após a transferência. Consulte Histórico de Movimentação!'));
            //----------------------------------------------------------------------------
            // Alimenta as propriedades de integração contábil
            //----------------------------------------------------------------------------
            bIntegraContab := CAFxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
            //----------------------------------------------------------------------------
            // Posiciona a Tabela BEM
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
            if FcdsBem.IsEmpty then
               Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
            //----------------------------------------------------------------------------
            if nModulo <= 0 then
               Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
            else
               if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
                  Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
            //----------------------------------------------------------------------------
            if nEmpresaProp <= 0 then
               Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
            else
               if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
                  Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,nBem);
            FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,nBem);
            FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, nBem);
            FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
            FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, nBem);
            FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
            FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
            FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
            //----------------------------------------------------------------------------
            // Lê o Centro de Custo Atual
            //----------------------------------------------------------------------------
            FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp, FcdsBem.FieldByName('IDCONJUNTO').AsFloat);
            FcdsLocalizacao.Data := Localizacao.ListaLocalizacao(nEmpresaProp, FcdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
            sCCustoAtual := FcdsLocalizacao.FieldByName('CODCENTROCUSTO').AsString;
            //----------------------------------------------------------------------------
            if nIdHistMovim > 0 then
            begin
               sSql := ' SELECT DATAMOVIMENTACAO, PLNCODIGO' +
                       ' FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE IDMOVIMENTACAO = ' + floattostr(nIdHistMovim) +
                       '   AND IDBEM = ' + floattostr(nBem) +
                       '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                       '   AND (IDTIPOMOVIMENTACAO = 02 OR IDTIPOMOVIMENTACAO = 05 OR IDTIPOMOVIMENTACAO = 11 OR IDTIPOMOVIMENTACAO = 12) ' +
                       '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
               _cds2.Data := GetDataPacket(sSql);
               //-------------------------------------------------------------------------
               if _cds2.IsEmpty then
                  Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem e a movimentação estão incorretos (HistMovBem)!'));
            end;
            //----------------------------------------------------------------------------
            // Estorna Lancamento da Contabilidade
            //----------------------------------------------------------------------------
            if nIdHistMovim > 0 then
            begin
               sSql := ' SELECT DATAMOVIMENTACAO, PLNCODIGO'+
                       ' FROM HISTORICOMOVIMENTACAO '+
                       ' WHERE IDMOVIMENTACAO = ' + floattostr(nIdHistMovim) +
                       '   AND IDBEM = ' + floattostr(nBem) +
                       '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                       '   AND (IDTIPOMOVIMENTACAO = 02 OR IDTIPOMOVIMENTACAO = 05 OR IDTIPOMOVIMENTACAO = 11 OR IDTIPOMOVIMENTACAO = 12) ' +
                       '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            end else
            begin
               sSql := ' SELECT DATAMOVIMENTACAO, PLNCODIGO'+
                       ' FROM HISTORICOMOVIMENTACAO '+
                       ' WHERE IDBEM = ' + floattostr(nBem) +
                       '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                       '   AND (IDTIPOMOVIMENTACAO = 02 OR IDTIPOMOVIMENTACAO = 05 OR IDTIPOMOVIMENTACAO = 11 OR IDTIPOMOVIMENTACAO = 12) ' +
                       '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            end;
            _cds.Data := GetDataPacket(sSql);
            //----------------------------------------------------------------------------
            iTotPlan := 0;
            while not _cds.EOF do
            begin
               bNovoPlnCodigo := True;
               iAux := 0;
               while iAux <= (iTotPlan - 1) do
               begin
                  if aPlanilha[iAux] = _cds.FieldByName('PLNCODIGO').AsInteger then
                     bNovoPlnCodigo := False;
                  iAux := iAux + 1;
               end;
               if bNovoPlnCodigo then
               begin
                  iTotPlan := iTotPlan + 1;
                  SetLength(aPlanilha,iTotPlan);
                  SetLength(aDataMov,iTotPlan);
                  aPlanilha[iTotPlan - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
                  aDataMov[iTotPlan - 1]  := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               end;
               _cds.Next;
            end;
            //----------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //----------------------------------------------------------------------------
            if nIdHistMovim > 0 then
            begin
               sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                       ' SET PLNCODIGO = NULL '+
                       ' WHERE IDMOVIMENTACAO = ' + floattostr(nIdHistMovim) ;
            end else
            begin
               sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                       ' SET PLNCODIGO = NULL '+
                       ' WHERE IDBEM = ' + floattostr(nBem) +
                       '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                       '   AND (IDTIPOMOVIMENTACAO = 02 OR IDTIPOMOVIMENTACAO = 05 OR IDTIPOMOVIMENTACAO = 11 OR IDTIPOMOVIMENTACAO = 12) ' +
                       '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            end;
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Estorna as planilhas contábeis
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               //-------------------------------------------------------------------------
               // Link de Dados com a Classe PróRata
               //-------------------------------------------------------------------------
               ProRata.cdsBem               := FcdsBem;
               ProRata.cdsBemxMoeda         := FcdsBemxMoeda;
               ProRata.cdsBemxDep           := FcdsBemxDep;
               ProRata.cdsReavaliacao       := FcdsReavaliacao;
               ProRata.cdsReavalxMoeda      := FcdsReavalxMoeda;
               ProRata.cdsReavalxDep        := FcdsReavalxDep;
               ProRata.cdsAcrescimoValor    := FcdsAcrescimoValor;
               ProRata.cdsAcrescValorxMoeda := FcdsAcrescValorxMoeda;
               ProRata.cdsAcrescValorxDep   := FcdsAcrescValorxDep;
               //-------------------------------------------------------------------------
               // Estorna a Depreciacao no Dia da Movimentacao - 1 se a mesma foi
               // calculada.
               //-------------------------------------------------------------------------
               sSql := ' SELECT /*+ RULE */ HM.IDPESSOA, HM.IDBEM, HM.PLNCODIGO ' +
                       ' FROM HISTORICOMOVIMENTACAO HM ' +
                       ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
                       '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',(dDataMov - 1)) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                       '   AND (HM.IDTIPOMOVIMENTACAO = 15 OR HM.IDTIPOMOVIMENTACAO = 22 OR HM.IDTIPOMOVIMENTACAO = 34 OR ' + #13 +
                       '        HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO = 18 OR HM.IDTIPOMOVIMENTACAO = 35 OR ' + #13 +
                       '        HM.IDTIPOMOVIMENTACAO = 21 OR HM.IDTIPOMOVIMENTACAO = 19 OR HM.IDTIPOMOVIMENTACAO = 36) ' + #13 +
                       '   AND (HM.TIPDEPPRORATA = 0 OR HM.TIPDEPPRORATA = 1) ' + #13 +
                       '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp);
               _cds2.Data := GetDataPacket( sSql );
               //-------------------------------------------------------------------------
               if not _cds2.IsEmpty then
                  if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
                     Raise Exception.Create(ProRata.MessageInfo);
               //-------------------------------------------------------------------------
               // Estorna / Remove as Planilhas Contábeis
               //-------------------------------------------------------------------------
               if CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               begin
                  iPlan := 0;
                  while iPlan <= (iTotPlan - 1) do
                  begin
                     if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
                     begin
                        if aPlanilha[iPlan] > 0 then
                           if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, aPlanilha[iPlan],
                                                                            nModulo, nEmpresaProp,
                                                                            ParamCAF.USAPLANOPATRO,
                                                                            datetostr(dDataMov)) then
                           begin
                              Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CAFxContab.MessageInfo);
                           end;
                     end else
                     begin
                        if aPlanilha[iPlan] > 0 then
                           if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, aPlanilha[iPlan],
                                                                           nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                           begin
                              Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CAFxContab.MessageInfo);
                           end;
                     end;
                     //-------------------------------------------------------------------
                     iPlan := iPlan + 1;
                  end;
               end else
               begin
                  Raise Exception.Create(CAFxContab.MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nIdHistMovim > 0 then
            begin
               sSql := ' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF, '+
                       '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                       ' FROM HISTORICOMOVIMENTACAO '+
                       ' WHERE IDMOVIMENTACAO = ' + floattostr(nIdHistMovim) +
                       ' ORDER BY IDMOVIMENTACAO DESC' ;
            end else
            begin
               sSql := ' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF, ' +
                       '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                       ' FROM HISTORICOMOVIMENTACAO '+
                       ' WHERE IDBEM = ' + floattostr(nBem) +
                       '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                       '   AND (IDTIPOMOVIMENTACAO = 02 OR IDTIPOMOVIMENTACAO = 05 OR IDTIPOMOVIMENTACAO = 11 OR IDTIPOMOVIMENTACAO = 12) ' +
                       '   AND IDPESSOA = ' + floattostr(nEmpresaProp) +
                       ' ORDER BY IDMOVIMENTACAO DESC' ;
            end;
            _cds.Data := GetDataPacket(sSql);
            //----------------------------------------------------------------------------
            //
            // Troca da persistencia de ApplyCds para ExecSql em 22/01/2008 (Funcef)
            //
            //----------------------------------------------------------------------------
            bTransfConjunto := False;
            while not _cds.EOF do
            begin
               if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 05 then
               begin
                  FcdsGrupo.Data := GrupoContab.ListaGrupoContab(nEmpresaProp,
                                                                 _cds.FieldByName('IDGRUPANT').AsFloat);
                  if not FcdsGrupo.IsEmpty then
                  begin
                     sSql := ' UPDATE BEM ' +
                             ' SET IDGRUPO = ' + FcdsGrupo.FieldByName('IDGRUPO').AsString +
                             ' WHERE IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString +
                             '   AND IDPESSOA = ' + FcdsBem.FieldByName('IDPESSOA').AsString;
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo + ' (05)');
                  end;
               end else
               if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 12 then
               begin
                  FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp,
                                                              _cds.FieldByName('IDCONJANT').AsFloat);
                  if not FcdsConjunto.IsEmpty then
                  begin
                     sSql := ' UPDATE BEM ' +
                             ' SET IDCONJUNTO = ' + FcdsConjunto.FieldByName('IDCONJUNTO').AsString +
                             ' WHERE IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString +
                             '   AND IDPESSOA = ' + FcdsBem.FieldByName('IDPESSOA').AsString;
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo + ' (12)');
                     //-------------------------------------------------------------------
                     bTransfConjunto := True;
                  end;
               end;
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            //----------------------------------------------------------------------------
            // Retorna os dados do Conjunto
            //----------------------------------------------------------------------------
            if not bTransfConjunto then
            begin
               _cds.First;
               while not _cds.EOF do
               begin
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 11 then
                  begin
                     sSql := ' UPDATE CONJUNTO ' +
                             ' SET IDLOCALIZACAO = ' + _cds.FieldByName('IDLOCALANT').AsString + ', ' + #13 +
                             '     IDRESPONSAVEL = ' + _cds.FieldByName('IDRESPANT').AsString + #13 +
                             ' WHERE (IDCONJUNTO = ' + FcdsBem.FieldByName('IDCONJUNTO').AsString + ')';
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     FcdsLocalizacao.Data := Localizacao.ListaLocalizacao(nEmpresaProp,
                                                                          _cds.FieldByName('IDLOCALANT').AsFloat);
                     sSql := ' UPDATE RATEIODEPRECIACAO ' + #13 +
                             ' SET CODCENTROCUSTO = ' + #39 + FcdsLocalizacao.FieldByName('CODCENTROCUSTO').AsString + #39 + #13 +
                             ' WHERE (IDCONJUNTO = ' + FcdsBem.FieldByName('IDCONJUNTO').AsString + ') '+ #13 +
                             '   AND (LTRIM(RTRIM(CODCENTROCUSTO)) = ' + #39 + sCCustoAtual + #39 + ')';
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 02 then
                  begin
                     sSql := ' UPDATE CONJUNTO ' +
                             ' SET IDRESPONSAVEL = ' + _cds.FieldByName('IDRESPANT').AsString + #13 +
                             ' WHERE IDCONJUNTO = ' + FcdsBem.FieldByName('IDCONJUNTO').AsString;
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  _cds.Next;
               end;
            end;
            //----------------------------------------------------------------------------
            // Remove a movimentacao
            //----------------------------------------------------------------------------
            _cds.First;
            while not _cds.EOF do
            begin
               sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            _cds.Close;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp,
                                                        FcdsBem.FieldByName('IDCONJUNTO').AsFloat);
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.First;
            while not FcdsBemxMoeda.EOF do
            begin
               FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([ParamCAF.MOEDAOFICIAL]),[]);
               iFlgPai := 1;
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
                                                    FcdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    FcdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                    FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                    2, iFlgPai) then
                     Raise Exception.Create(Bem.MessageInfo);
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
                  FcdsBemxDep.Next;
               end;
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            if not bInTransacao then   // Vando - SOL 154328-5901 / KTN 1373449
               Commit;
            Result := True;
         except
            On E : Exception do
            begin
               Result := False;
               if not bInTransacao then   // Vando - SOL 154328-5901 / KTN 1373449
                  RollBack;
               MessageInfo := E.Message;
            end;
         end;
      end;
   finally
      _cds2.Free;
   end;
end;
//========================================================================================
function TCtrlMovTransfBem.ExecutaTermoTransferencia(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                                     dDataMov : tDateTime;
                                                     sBilhete : String) : Boolean;
var
   bTransacao : Boolean;
   nResult : Extended;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTermoTransferencia(nModulo, nEmpresaProp, nUsuario, nSelBaixa,
                                                               dDataMov, FcdsSelBaixaBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bTransacao := True;
      try
         StartTransaction;
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
         bTransacao := Self.OpenTransaction;
         Self.OpenTransaction := False;
         //-------------------------------------------------------------------------------
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Transferindo Placa ') + FcdsSelBaixaBens.FieldByName('PLACA').AsString;
               iPrgBarPos := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat);
            FcdsGrupo.Data := GrupoContab.ListaGrupoContab(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDGRUPO').AsFloat);
            FcdsConjunto.Data := Conjunto.ListaConjunto(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDCONJUNTO').AsFloat);
            FcdsLocalizacao.Data := Localizacao.ListaLocalizacao(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDLOCALIZACAO').AsFloat);
            FcdsResponsavel.Data := Responsavel.ListaResponsavel(FcdsSelBaixaBens.FieldByName('IDRESPONSAVEL').AsFloat);
            FcdsGrupoAtual.Data := GrupoContab.ListaGrupoContab(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDGRUPOATUAL').AsFloat);
            FcdsConjuntoAtual.Data := Conjunto.ListaConjunto(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDCONJATUAL').AsFloat);
            FcdsLocalizacaoAtual.Data := Localizacao.ListaLocalizacao(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDLOCALATUAL').AsFloat);
            FcdsResponsavelAtual.Data := Responsavel.ListaResponsavel(FcdsSelBaixaBens.FieldByName('IDRESPATUAL').AsFloat);
            //----------------------------------------------------------------------------
            nResult := ExecutaTransferencia(nModulo, nEmpresaProp, nUsuario,
                                            FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                            dDataMov);
            //----------------------------------------------------------------------------
            if nResult < 0 then
               Raise Exception.Create(MessageInfo + #13 + 'na transferência do bem ' +
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
            FcdsSelBaixaBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Finalizando...');
            iPrgBarMax  := 2;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como Executado
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaSelBaixa(nEmpresaProp,nSelBaixa);
         Fcds.Edit;
         Fcds.FieldByName('SBXFLGEXECUTADO').AsInteger  := 1;
         Fcds.FieldByName('SBXDTAEXECUTADO').AsDateTime := dDataMov;
         Fcds.Post;
         if not ApplyCds(Fcds, _dbSelBaixa, [], []) then
            Raise Exception.Create(_dbSelBaixa.MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos := 1;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         Self.OpenTransaction := bTransacao;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
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
// Estorna um Termo de Transferencia
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.EstornaTermoTransferencia(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                                     dDataMov, dDataEst : TDateTime) : Boolean;
var
   bTransacao : Boolean;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaTermoTransferencia(nModulo, nEmpresaProp, nUsuario, nSelBaixa,
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
         FcdsSelBaixaBens.Data := ListaSelBaixaBens(nEmpresaProp, nSelBaixa);
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            if not EstornaTransferencia(nModulo, nEmpresaProp, nUsuario,
                                        FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                        dDataMov, dDataEst, 0) then
               Raise Exception.Create(MessageInfo + #13 + 'no Estorno da transferência do bem ' +
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
//========================================================================================
// Função que executa a correção do grupo contábil de bens, lançando as diferenças de
// depreciação necessárias
//----------------------------------------------------------------------------------------
//
// nModulo      : id do Módulo que incluiu o bem                    (IDMODULO)
// nEmpresaProp : id da Empresa Proprietária                        (IDPESSOA)
// nUsuario     : id do Usuario
// nBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
//
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.ExecutaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                               dDataMov: TDateTime): Extended;
var
   sGrupoAtual, sGrupoNovo         : String;
   dDataUltMov,dDataUltDep         : TDateTime;
   nDepLancNovo, nDepLancDif       : Currency;
   nTrfValOrg, nTrfReavValOrg,
   nTrfAvValOrg, nTrfCmBem,
   nTrfReavCmBem, nTrfAvCmBem,
   nTrfDepLanc, nTrfReavDepLanc,
   nTrfAvDepLanc, nTrfCmDep,
   nTrfReavCmDep, nTrfAvCmDep,
   nGrupoAtual, nGrupoNovo,
   nSeqHistTransfGrupo,
   nSeqHist, nPlanilha             : Extended;
   iExercicio, iPeriodo,
   iFlgPai                         : Integer;
   bCtaxCCusto                     : Boolean;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario, nBem,
                                                         dDataMov, FcdsBem.Data, FcdsGrupo.Data);
      if Result < 0 then
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
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
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
         // Carrega os Parâmetros Básicos
         //-------------------------------------------------------------------------------
         nGrupoAtual := FcdsBem.FieldByName('IDGRUPO').AsFloat;
         sGrupoAtual := FcdsBem.FieldByName('DESCGRUPO').AsString;
         nGrupoNovo  := FcdsGrupo.FieldByName('IDGRUPO').AsFloat;
         sGrupoNovo  := FcdsGrupo.FieldByName('NOME').AsString;
         FcdsGrupoNTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(nGrupoNovo, nEmpresaProp);
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '05',
                                       dDataMov, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem que será transferido
         //-------------------------------------------------------------------------------
         FcdsBem.Data               := Bem.ListaBem(nEmpresaProp, nBem);
         FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
         FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp, nBem);
         FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, nBem);
         FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
         FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, nBem);
         FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
         FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
         //-------------------------------------------------------------------------------
         // Processa a transferencia na contabilidade
         //-------------------------------------------------------------------------------
         nTrfValOrg  := 0; nTrfReavValOrg  := 0; nTrfAvValOrg  := 0; 
         nTrfCmBem   := 0; nTrfReavCmBem   := 0; nTrfAvCmBem   := 0;
         nTrfDepLanc := 0; nTrfReavDepLanc := 0; nTrfAvDepLanc := 0;
         nTrfCmDep   := 0; nTrfReavCmDep   := 0; nTrfAvCmDep   := 0;
         //-------------------------------------------------------------------------------
         nPlanilha := 0;
         if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
         begin
            if not CAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
                                                      iExercicio, iPeriodo) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query de montagem da Planilha Contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.InicializaMontaContab then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query com a Parametrização contábil
            //----------------------------------------------------------------------------
            if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Lê a Dependencia da Conta Contábil do Centro de Custo
            //----------------------------------------------------------------------------
            bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
            //----------------------------------------------------------------------------
            // Alimenta o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            nPlanilha := ContabilizaTransferencia(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov,
                                                  nGrupoAtual, nGrupoNovo,
                                                  sGrupoAtual, sGrupoNovo,
                                                  FcdsBem.FieldByName('IDCONJUNTO').AsFloat,
                                                  FcdsBem.FieldByName('IDCONJUNTO').AsFloat,
                                                  FcdsBem.FieldByName('CODCENTROCUSTO').AsString,
                                                  FcdsBem.FieldByName('CODCENTROCUSTO').AsString,
                                                  FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                  FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                  FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                  FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                  nTrfValOrg, nTrfCmBem, nTrfDepLanc, nTrfCmDep,
                                                  nTrfReavValOrg, nTrfReavCmBem, nTrfReavDepLanc, nTrfReavCmDep,
                                                  nTrfAvValOrg, nTrfAvCmBem, nTrfAvDepLanc, nTrfAvCmDep,
                                                  iExercicio, iPeriodo, bCtaxCCusto);
            if nPlanilha < 0 then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
         //-------------------------------------------------------------------------------
         nSeqHistTransfGrupo := HistMovBem.RegistraHistMovBem(nBem,                    // IDBEM
                                                              nEmpresaProp,            // IDPESSOA
                                                              nModulo,                 // IDMODULO
                                                              05,                      // IDTIPOMOVIMENTACAO
                                                              dDataMov,                // DATAMOVIMENTACAO
                                                              -1,                      // IDREAVALACRESC
                                                              -1,                      // DATAULTDEP
                                                              nGrupoAtual,             // IDGRUPANT
                                                              -1,                      // IDCONJANT
                                                              -1,                      // IDLOCALANT
                                                              -1,                      // IDRESPANT
                                                              -1,                      // PLACAANT
                                                              nPlanilha,               // PLNCODIGO
                                                              '',                      // OBSREAVAL
                                                               0,                      // TIPDEPPRORATA
                                                              -1,                      // IDTIPODESPESA
                                                              '',                      // OBSACRESCIMO
                                                              -1,                      // IDMOTIVOBAIXA
                                                               0,                      // PROPBAIXA
                                                               0,                      // VALVENDAOFI
                                                              '');                     // OBSBAIXA
         if nSeqHistTransfGrupo = -1 then
            Raise Exception.Create(HistMovBem.MessageInfo);
         FnMovimentacao := nSeqHistTransfGrupo;
         //-------------------------------------------------------------------------------
         // Armazena os valores registrados na planilha contábil no HistoricoMovimentacao
         //-------------------------------------------------------------------------------
         if nPlanilha > 0 then
         begin
            _dMTBem.sqlTransfHistMovBem.Prepare;
            _dMTBem.sqlTransfHistMovBem.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHistTransfGrupo;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFVALORG').AsFloat      := nTrfVALORG;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMBEM').AsFloat       := nTrfCMBEM;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFDEPLANC').AsFloat     := nTrfDEPLANC;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFCMDEP').AsFloat       := nTrfCMDEP;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVVALORG').AsFloat  := nTrfReavVALORG;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMBEM').AsFloat   := nTrfReavCMBEM;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVDEPLANC').AsFloat := nTrfReavDEPLANC;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFREAVCMDEP').AsFloat   := nTrfReavCMDEP;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVVALORG').AsFloat    := nTrfAvVALORG;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMBEM').AsFloat     := nTrfAvCMBEM;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVDEPLANC').AsFloat   := nTrfAvDEPLANC;
            _dMTBem.sqlTransfHistMovBem.ParamByName('TRFAVCMDEP').AsFloat     := nTrfAvCMDEP;
            if not ExecSQL(_dMTBem.sqlTransfHistMovBem.SQLChanged, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Altera a Tabela Bem
         //-------------------------------------------------------------------------------
         FcdsBem.Edit;
         FcdsBem.FieldByName('IDGRUPO').AsFloat := nGrupoNovo;
         FcdsBem.Post;
         if not ApplyCds(FcdsBem,_dbBem,[],[]) then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra no Histórico
         //-------------------------------------------------------------------------------
         nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,      // IDBEM
                                                   FcdsBem.FieldByName('IDPESSOA').AsFloat,   // IDPESSOA
                                                   FcdsBem.FieldByName('IDMODULO').AsFloat,   // IDMODULO
                                                   17,                                        // IDTIPOMOVIMENTACAO
                                                   dDataMov,                                  // DATAMOVIMENTACAO
                                                   -1,                                        // IDREAVALACRESC
                                                   -1,                                        // DATAULTDEP
                                                   -1,                                        // IDGRUPANT
                                                   -1,                                        // IDCONJANT
                                                   -1,                                        // IDLOCALANT
                                                   -1,                                        // IDRESPANT
                                                   -1,                                        // PLACAANT
                                                   nPlanilha,                                 // PLNCODIGO
                                                   '',                                        // OBSREAVAL
                                                    0,                                        // TIPDEPPRORATA
                                                   -1,                                        // IDTIPODESPESA
                                                   '',                                        // OBSACRESCIMO
                                                   -1,                                        // IDMOTIVOBAIXA
                                                    0,                                        // PROPBAIXA
                                                    0,                                        // VALVENDAOFI
                                                   '');                                       // OBSBAIXA
         if nSeqHist = -1 then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //*******************************************************************************
         // Calcula a diferença entre o que já foi depreciado no grupo errado e o que
         // deveria ter sido calculado no grupo correto e lança no CAF e na Contabilidade
         //*******************************************************************************
         nPlanilha := 0;
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            iFlgPai := 1;
            FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
               begin
                  nDepLancNovo := ProRata.CalcularDeprecBemGrupoDif(nModulo, nEmpresaProp, nBem, nGrupoNovo,
                                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsFloat,
                                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat,
                                                                    dDataMov, FcdsBem.FieldByName('DATAINICIODEP').AsDateTime);
                  //----------------------------------------------------------------------
                  nDepLancDif := nDepLancNovo - (FcdsBemxDep.FieldByName('DEPLANC').AsFloat +
                                                 FcdsBemxDep.FieldByName('CMDEP').AsFloat);
                  //----------------------------------------------------------------------
                  // Atualiza a tabela MoedaxPais
                  //----------------------------------------------------------------------
                  FcdsGrupoNTaxaDep.Locate('IDTAXADEP',FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat, []);
                  FcdsBemxDep.Edit;
                  FcdsBemxDep.FieldByName('TAXADEP').AsFloat := FcdsGrupoNTaxaDep.FieldByName('TAXADEP').AsFloat;
                  FcdsBemxDep.FieldByName('DEPLANC').AsFloat := nDepLancNovo;
                  FcdsBemxDep.Post;
                  if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
                     Raise Exception.Create(_dbBemxDep.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Diferença de Depreciação na Contabilidade
                  //----------------------------------------------------------------------
                  if bIntegraContab and
                    (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                  begin
                     //-------------------------------------------------------------------
                     // Inicializa a query de montagem da Planilha Contábil
                     //-------------------------------------------------------------------
                     if not CAFxContab.InicializaMontaContab then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     // Inicializa a query com a Parametrização contábil
                     //-------------------------------------------------------------------
                     if not CAFxContab.MontaParamCAFxContab(FcdsBem.FieldByName('IDPESSOA').AsInteger, ParamCAF.PLANOVIGENTE) then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     // Lê a Dependencia da Conta Contábil do Centro de Custo
                     //-------------------------------------------------------------------
                     bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
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
                                                              dDataMov,nDepLancDif,'B',
                                                              iExercicio, iPeriodo,
                                                              False, bCtaxCCusto) then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                     //-------------------------------------------------------------------
                     nPlanilha := CAFxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp,
                                                                      nUsuario, datetostr(dDataMov));
                     if nPlanilha < 0 then
                        Raise Exception.Create(CAFxContab.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          nDepLancDif) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Atualiza o Saldo Contábil do Bem na Moeda x País
                  //----------------------------------------------------------------------
                  if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsBem.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                    0, 0, nDepLancDif, 0,
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
         if nPlanilha > 0 then
            with _dMTBem do
            begin
               sqlAtualizaPlnCodigo.Prepare;
               sqlAtualizaPlnCodigo.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHist;
               sqlAtualizaPlnCodigo.ParamByName('PLNCODIGO').AsFloat := nPlanilha;
               if not ExecSQL(sqlAtualizaPlnCodigo.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := nPlanilha;
      except
         On E : Exception do
         begin
            RollBack;
            Result := -1;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
// Função que estorna a correção de Grupo Contábil de um Bem
//----------------------------------------------------------------------------------------
//
// nModulo      : id do Módulo que incluiu o bem                    (IDMODULO)
// nEmpresaProp : id da Empresa Proprietária                        (IDPESSOA)
// nBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.EstornaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                               dDataMov, dDataEst : TDateTime) : Boolean;
var
   _cds2 : TClientDataSet;
   iTotPlan,
   iExercicio,iPeriodo,
   iAux, iPlan, iFlgPai : Integer;
   sSql                 : String;
   bNovoPlnCodigo       : Boolean;
   nPlanilha            : Extended;
   aPlanilha            : array of Integer;
   aDataMov             : array of tDateTime;

begin
   _cds2 := TClientDataSet.Create(nil);
   Result := False;
   try
      if ConnectionSide = cnsClient then
      begin
         Result := Connection.AppServer.EstornaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                                            nBem, dDataMov, dDataEst);
         if not Result then
            MessageInfo := Connection.AppServer.MessageInfo;
      end else
      begin
         try
            StartTransaction;
            //----------------------------------------------------------------------------
            // Carga dos parâmetros do sistema
            //----------------------------------------------------------------------------
            if not ParamCAF.CarregaProp(nEmpresaProp) then
            begin
               MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // verifica se ja houve movimentação no bem após a Transferência
            //----------------------------------------------------------------------------
            sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                    ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                    ' WHERE  (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' + #13 +
                    '   AND  (IDBEM = ' + floattostr(nBem) + ') ' + #13;
            _cds.Data := GetDataPacket(sSql);
            if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
               Raise Exception.Create(CMTranslate('Existe movimentação após a transferência. Consulte Histórico de Movimentação!'));
            //----------------------------------------------------------------------------
            // Alimenta as propriedades de integração contábil
            //----------------------------------------------------------------------------
            bIntegraContab := CAFxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
            //----------------------------------------------------------------------------
            // Posiciona a Tabela BEM
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
            if FcdsBem.IsEmpty then
               Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
            //----------------------------------------------------------------------------
            if nModulo <= 0 then
               Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
            else
               if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
                  Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
            //----------------------------------------------------------------------------
            if nEmpresaProp <= 0 then
               Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
            else
               if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
                  Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp,nBem);
            FcdsBemxDep.Data := Bem.ListaBemxDep(nEmpresaProp,nBem);
            //----------------------------------------------------------------------------
            sSql := ' SELECT DATAMOVIMENTACAO, PLNCODIGO' +
                    ' FROM HISTORICOMOVIMENTACAO ' +
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                    '   AND IDTIPOMOVIMENTACAO = 05 ' +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            _cds2.Data := GetDataPacket(sSql);
            //----------------------------------------------------------------------------
            if _cds2.IsEmpty then
               Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem e a movimentação estão incorretos (HistMovBem)!'));
            //----------------------------------------------------------------------------
            // Estorna Lancamento da Contabilidade
            //----------------------------------------------------------------------------
            sSql := ' SELECT DATAMOVIMENTACAO, PLNCODIGO'+
                    ' FROM HISTORICOMOVIMENTACAO '+
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                    '   AND IDTIPOMOVIMENTACAO = 05 ' +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            _cds.Data := GetDataPacket(sSql);
            //----------------------------------------------------------------------------
            iTotPlan := 0;
            while not _cds.EOF do
            begin
               bNovoPlnCodigo := True;
               iAux := 0;
               while iAux <= (iTotPlan - 1) do
               begin
                  if aPlanilha[iAux] = _cds.FieldByName('PLNCODIGO').AsInteger then
                     bNovoPlnCodigo := False;
                  iAux := iAux + 1;
               end;
               if bNovoPlnCodigo then
               begin
                  iTotPlan := iTotPlan + 1;
                  SetLength(aPlanilha,iTotPlan);
                  SetLength(aDataMov,iTotPlan);
                  aPlanilha[iTotPlan - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
                  aDataMov[iTotPlan - 1]  := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               end;
               _cds.Next;
            end;
            //----------------------------------------------------------------------------
            // Retira o link da Planilha Contábil
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                    ' SET PLNCODIGO = NULL '+
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                    '   AND IDTIPOMOVIMENTACAO = 05 ' +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Estorna as planilhas contábeis
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               //-------------------------------------------------------------------------
               // Link de Dados com a Classe PróRata
               //-------------------------------------------------------------------------
               ProRata.cdsBem               := FcdsBem;
               ProRata.cdsBemxMoeda         := FcdsBemxMoeda;
               ProRata.cdsBemxDep           := FcdsBemxDep;
               ProRata.cdsReavaliacao       := FcdsReavaliacao;
               ProRata.cdsReavalxMoeda      := FcdsReavalxMoeda;
               ProRata.cdsReavalxDep        := FcdsReavalxDep;
               ProRata.cdsAcrescimoValor    := FcdsAcrescimoValor;
               ProRata.cdsAcrescValorxMoeda := FcdsAcrescValorxMoeda;
               ProRata.cdsAcrescValorxDep   := FcdsAcrescValorxDep;
               //-------------------------------------------------------------------------
               // Estorna a Depreciacao no Dia da Movimentacao - 1
               //-------------------------------------------------------------------------
               if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
                  Raise Exception.Create(ProRata.MessageInfo);
               //-------------------------------------------------------------------------
               // Estorna / Remove as Planilhas Contábeis
               //-------------------------------------------------------------------------
               if CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               begin
                  iPlan := 0;
                  while iPlan <= (iTotPlan - 1) do
                  begin
                     if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
                     begin
                        if aPlanilha[iPlan] > 0 then
                           if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, aPlanilha[iPlan],
                                                                            nModulo, nEmpresaProp,
                                                                            ParamCAF.USAPLANOPATRO,
                                                                            datetostr(dDataMov)) then
                           begin
                              Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CAFxContab.MessageInfo);
                           end;
                     end else
                     begin
                        if aPlanilha[iPlan] > 0 then
                           if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, aPlanilha[iPlan],
                                                                           nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                           begin
                              Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CAFxContab.MessageInfo);
                           end;
                     end;
                     //-------------------------------------------------------------------
                     iPlan := iPlan + 1;
                  end;
               end else
               begin
                  Raise Exception.Create(CAFxContab.MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            sSql := ' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF, ' +
                    '        IDGRUPANT, IDCONJANT, IDLOCALANT, IDRESPANT ' +
                    ' FROM HISTORICOMOVIMENTACAO '+
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                    '   AND IDTIPOMOVIMENTACAO = 05 ' +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp) +
                    ' ORDER BY IDMOVIMENTACAO DESC' ;
            _cds.Data := GetDataPacket(sSql);
            //----------------------------------------------------------------------------
            while not _cds.EOF do
            begin
               FcdsBem.Edit;
               FcdsGrupo.Data := GrupoContab.ListaGrupoContab(nEmpresaProp,
                                                              _cds.FieldByName('IDGRUPANT').AsFloat);
               if not FcdsGrupo.IsEmpty then
                  FcdsBem.FieldByName('IDGRUPO').AsFloat := _cds.FieldByName('IDGRUPANT').AsFloat;
               FcdsBem.Post;
               if not ApplyCds(FcdsBem,_dbBem,[],[]) then
                  Raise Exception.Create(_dbBem.MessageInfo);
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            //----------------------------------------------------------------------------
            // Remove a movimentacao
            //----------------------------------------------------------------------------
            _cds.First;
            while not _cds.EOF do
            begin
               sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            _cds.Close;
            //----------------------------------------------------------------------------
            // Restaura a taxa e o valor acumulado da depreciação original
            //----------------------------------------------------------------------------
            FcdsGrupoATaxaDep.Data := Grupocontab.ListaGrupoTaxaDep(FcdsBem.FieldbyName('IDGRUPO').AsFloat,
                                                                    nEmpresaProp);
            _dMTBem.sqlCorrGrupoBem.Prepare;
            _dMTBem.sqlCorrGrupoBem.ParamByName('IDBEM').AsFloat      := nBem;
            _dMTBem.sqlCorrGrupoBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
            _dMTBem.sqlCorrGrupoBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
            _cds.Data := _dMTBem.sqlCorrGrupoBem.Data;
            //----------------------------------------------------------------------------
            nPlanilha := 0;
            while not _cds.EOF do
            begin
               if _cds.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
               begin
                  if not _cds.FieldByName('PLNCODIGO').IsNull then
                     nPlanilha := _cds.FieldByName('PLNCODIGO').AsFloat;
               end;
               //-------------------------------------------------------------------------
               FcdsGrupoATaxaDep.Locate('IDTAXADEP',_cds.FieldByName('IDTAXADEP').AsFloat, []);
               FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                     _cds.FieldByName('IDTAXADEP').AsFloat]), []);
               //-------------------------------------------------------------------------
               FcdsBemxDep.Edit;
               FcdsBemxDep.FieldByName('TAXADEP').AsFloat := FcdsGrupoATaxaDep.FieldByName('TAXADEP').AsFloat;
               FcdsBemxDep.FieldByName('DEPLANC').AsFloat := FcdsBemxDep.FieldByName('DEPLANC').AsFloat - _cds.FieldByName('VALOR').AsFloat;
               FcdsBemxDep.Post;
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
               Raise Exception.Create(_dbBemxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Retira o link com a Planilha Contábil
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                    ' SET PLNCODIGO = NULL '+
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                    '   AND IDTIPOMOVIMENTACAO = 17 ' +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            // Estorna as planilhas contábeis
            //----------------------------------------------------------------------------
            if bIntegraContab and (nPlanilha <> 0) then
            begin
               if CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               begin
                  if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
                  begin
                     if nPlanilha > 0 then
                        if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, nPlanilha,
                                                                         nModulo, nEmpresaProp,
                                                                         ParamCAF.USAPLANOPATRO,
                                                                         datetostr(dDataMov)) then
                        begin
                           Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CAFxContab.MessageInfo);
                        end;
                  end else
                  begin
                     if nPlanilha > 0 then
                        if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlanilha,
                                                                        nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                        begin
                           Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CAFxContab.MessageInfo);
                        end;
                  end;
               end else
               begin
                  Raise Exception.Create(CAFxContab.MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            // Remove os Registros da Correção do Historico
            //----------------------------------------------------------------------------
            sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF ' + #13 +
                    ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                    ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                    '   AND DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                    '   AND IDTIPOMOVIMENTACAO = 17 ' + #13 +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            _cds.Data := GetDataPacket(sSql);
            if _cds.IsEmpty then
               Raise Exception.Create(CMTranslate('Não foi possível estornar a baixa do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
            //----------------------------------------------------------------------------
            while not _cds.Eof do
            begin
               sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover os valores da correção do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover o historico da correção do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.First;
            while not FcdsBemxMoeda.EOF do
            begin
               FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([ParamCAF.MOEDAOFICIAL]),[]);
               iFlgPai := 1;
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
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
                  FcdsBemxDep.Next;
               end;
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            Commit;
            Result := True;
         except
            On E : Exception do
            begin
               Result := False;
               RollBack;
               MessageInfo := E.Message;
            end;
         end;
      end;
   finally
      _cds2.Free;
   end;
end;
//========================================================================================
// Executa um Termo de Correção de Grupo Contábil
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.ExecutaTermoCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                                    nSelBaixa: Extended; dDataMov: tDateTime;
                                                    sBilhete: String): Boolean;
var
   bTransacao : Boolean;
   nResult : Extended;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTermoCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                                              nSelBaixa, dDataMov,
                                                              FcdsSelBaixaBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bTransacao := True;
      try
         StartTransaction;
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
         bTransacao := Self.OpenTransaction;
         Self.OpenTransaction := False;
         //-------------------------------------------------------------------------------
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Transferindo Placa ') + FcdsSelBaixaBens.FieldByName('PLACA').AsString;
               iPrgBarPos := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat);
            FcdsGrupo.Data := GrupoContab.ListaGrupoContab(nEmpresaProp,FcdsSelBaixaBens.FieldByName('IDGRUPO').AsFloat);
            //----------------------------------------------------------------------------
            nResult := ExecutaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                           FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                           dDataMov);
            //----------------------------------------------------------------------------
            if nResult < 0 then
               Raise Exception.Create(MessageInfo + #13 + ' na transferência do bem ' +
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
            FcdsSelBaixaBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Finalizando...');
            iPrgBarMax  := 2;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como Executado
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaSelBaixa(nEmpresaProp,nSelBaixa);
         Fcds.Edit;
         Fcds.FieldByName('SBXFLGEXECUTADO').AsInteger  := 1;
         Fcds.FieldByName('SBXDTAEXECUTADO').AsDateTime := dDataMov;
         Fcds.Post;
         if not ApplyCds(Fcds, _dbSelBaixa, [], []) then
            Raise Exception.Create(_dbSelBaixa.MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos := 1;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         Self.OpenTransaction := bTransacao;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
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
// Estorna um Termo de Correção de Grupo Contábil
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.EstornaTermoCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                                    nSelBaixa: Extended; dDataMov,
                                                    dDataEst: TDateTime): Boolean;
var
   bTransacao : Boolean;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaTermoCorrGrupoBem(nModulo, nEmpresaProp,
                                                              nUsuario, nSelBaixa,
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
         FcdsSelBaixaBens.Data := ListaSelBaixaBens(nEmpresaProp, nSelBaixa);
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            if not EstornaCorrGrupoBem(nModulo, nEmpresaProp, nUsuario,
                                       FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                       dDataMov, dDataEst) then
               Raise Exception.Create(MessageInfo + #13 + 'no Estorno da transferência do bem ' +
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

function TCtrlMovTransfBem.GerarTermoTransfConjunto(nEmpresaProp, nTermo: Extended;
                                                    sProcesso: String; dDataTermo: TDateTime;
                                                    nRespTermo, nConjunto, nLocalNovo, nRespNovo: Extended): Extended;
var
   _cdsBensDoConjunto : TClientDataSet;

begin
   _cdsBensDoConjunto := TClientDataSet.Create(nil);
   Result := -1;
   try
      if ConnectionSide = cnsClient then
      begin
         Result := Connection.AppServer.GerarTermoTransfConjunto(nEmpresaProp, nTermo, sProcesso,
                                                                 dDataTermo, nRespTermo, nConjunto,
                                                                 nLocalNovo, nRespNovo);
         if Result <= 0 then
            MessageInfo := Connection.AppServer.MessageInfo;
      end else
      begin
         try
            StartTransaction;
            //----------------------------------------------------------------------------
            // Inicializa os clientdatasets do Termo de Transferencia
            //----------------------------------------------------------------------------
            FcdsSelBaixa3.Data := ListaSelBaixa(nEmpresaProp, 0);
            FcdsSelBaixaBens3.Data := ListaSelBaixaBens(nEmpresaProp, 0);
            //----------------------------------------------------------------------------
            // Registra o Mestre
            //----------------------------------------------------------------------------
            FcdsSelBaixa3.Append;
            FcdsSelBaixa3.FieldByName('IDPESSOA').AsFloat          := nEmpresaProp;
            FcdsSelBaixa3.FieldByName('SBTIPOMOV').AsInteger       := 1;            // Seleção para Transferencia
            FcdsSelBaixa3.FieldByName('SBXTERMO').AsFloat          := nTermo;
            FcdsSelBaixa3.FieldByName('SBXPROCESSO').AsString      := sProcesso;
            FcdsSelBaixa3.FieldByName('SBXDATA').AsDateTime        := dDataTermo;
            FcdsSelBaixa3.FieldByName('IDRESPONSAVEL').AsFloat     := nRespTermo;
            FcdsSelBaixa3.FieldByName('SBXFLGEXECUTADO').AsInteger := 0;            // Não Executado
            FcdsSelBaixa3.Post;
            //----------------------------------------------------------------------------
            // Registra os bens do conjunto para transferencia de local/responsável
            //----------------------------------------------------------------------------
            _dMTBem.sqlBensnoConjunto.Prepare;
            _dMTBem.sqlBensnoConjunto.ParamByName('IDCONJUNTO').AsFloat := nConjunto;
            _dMTBem.sqlBensnoConjunto.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
            _cdsBensDoConjunto.Data := _dMTBem.sqlBensnoConjunto.Data;
            _cdsBensDoConjunto.First;
            while not _cdsBensDoConjunto.EOF do
            begin
               FcdsSelBaixaBens3.Append;
               FcdsSelBaixaBens3.FieldbyName('IDPESSOA').AsFloat       := _cdsBensDoConjunto.FieldByName('IDPESSOA').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDBEM').AsFloat          := _cdsBensDoConjunto.FieldByName('IDBEM').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDCONJATUAL').AsFloat    := _cdsBensDoConjunto.FieldByName('IDCONJUNTO').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDGRUPATUAL').AsFloat    := _cdsBensDoConjunto.FieldByName('IDGRUPO').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDLOCALATUAL').AsFloat   := _cdsBensDoConjunto.FieldByName('IDLOCALIZACAO').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDRESPATUAL').AsFloat    := _cdsBensDoConjunto.FieldByName('IDRESPONSAVEL').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDCONJUNTO').AsFloat     := _cdsBensDoConjunto.FieldByName('IDCONJUNTO').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDGRUPO').AsFloat        := _cdsBensDoConjunto.FieldByName('IDGRUPO').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDLOCALIZACAO').AsFloat  := _cdsBensDoConjunto.FieldByName('IDLOCALIZACAO').AsFloat;
               FcdsSelBaixaBens3.FieldbyName('IDRESPONSAVEL').AsFloat  := nRespNovo;
               FcdsSelBaixaBens3.FieldbyName('FLGEXECUTADO').AsInteger := 0;
               FcdsSelBaixaBens3.Post;
               //-------------------------------------------------------------------------
               _cdsBensDoConjunto.Next;
            end;
            _cdsBensDoConjunto.Close;
            //----------------------------------------------------------------------------
            if not ApplyCds(FcdsSelBaixa3,_dbSelBaixa,[],[]) then
               Raise Exception.Create(_dbSelBaixa.MessageInfo);
            if not ApplyCds(FcdsSelBaixaBens3,_dbSelBaixaBens,[_dbSelBaixa.IdSelBaixa],[_dbSelBaixaBens.IdSelBaixa]) then
               Raise Exception.Create(_dbSelBaixaBens.MessageInfo);
            //----------------------------------------------------------------------------
            Result := _dbSelBaixa.IdSelBaixa.AsFloat;
            Commit;
         except
            On E : Exception Do
            begin
               Rollback;
               MessageInfo := E.Message;
               Result := -1;
            end;
         end;
      end;
   finally
      _cdsBensDoConjunto.Free;
   end;
end;

function TCtrlMovTransfBem.RemoveTermoTransfConjunto(nEmpresaProp, nIdSelBaixa : Extended): boolean;
var
   sSql : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.RemoveTermoTransfConjunto(nEmpresaProp, nIdSelBaixa);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM SELBAIXABENS ' + #13 +
                 ' WHERE IDSELBAIXA = ' + floattostr(nIdSelBaixa) + #13 +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM SELBAIXA ' + #13 +
                 ' WHERE IDSELBAIXA = ' + floattostr(nIdSelBaixa) + #13 +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
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
// Lista as Transferencias realizadas de forma ilegal
//----------------------------------------------------------------------------------------
function TCtrlMovTransfBem.ListaTransfIlegal(nEmpresaProp : Extended) : OleVariant;
var
   _cdsBemAtual,
   _cdsBemAnterior,
   _cdsMovTransf,
   _cdsReturn : TClientDataSet;
   //-------------------------------------------------------------------------------------
   atxtBens : TextFile;
   sLinha : String;

begin
   _cdsBemAtual := TClientDataSet.Create(nil);
   _cdsBemAnterior := TClientDataSet.Create(nil);
   _cdsMovTransf := TClientDataSet.Create(nil);
   _cdsReturn := TClientDataSet.Create(nil);
   try
      try
         //AssignFile(atxtBens, 'C:\ManipulacaoFuncef.TXT');
         AssignFile(atxtBens, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ManipulacaoFuncef.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Rewrite(atxtBens);
         //-------------------------------------------------------------------------------
         _cdsReturn.Data := GetDataPacket(' SELECT B.PLACA, SUBSTR(B.DESBEM,1,30) AS DESCBEM, ' + #13 +
                                          '        G.IDGRUPO AS IDGRUPOANT, G.CLASSE AS CLASSEANT, G.NOME AS NOMEANT, ' + #13 +
                                          '        G.IDGRUPO AS IDGRUPOATU, G.CLASSE AS CLASSEATU, G.NOME AS NOMEATU  ' + #13 +
                                          ' FROM BEM B, ' + #13 +
                                          '      GRUPO G ' + #13 +
                                          ' WHERE B.IDBEM = -9 ' + #13 +
                                          '   AND G.IDGRUPO = -9 ' + #13 +
                                          '   AND B.IDGRUPO = G.IDGRUPO ');
         Result := _cdsReturn.Data;
         //-------------------------------------------------------------------------------
         _cdsBemAtual.Data := GetDataPacket(' SELECT B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.IDGRUPO, G.CLASSE, G.NOME AS DESCGRUPO ' + #13 +
                                            ' FROM BEM B, ' + #13 +
                                            '      GRUPO G ' + #13 +
                                            ' WHERE B.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                                            '   AND B.IDGRUPO = G.IDGRUPO');
         while not _cdsBemAtual.EOF do
         begin
            //----------------------------------------------------------------------------
            // Verificar se o grupo da tabela BEM atual e o grupo da tabela BEM anterior
            // são diferentes.
            //----------------------------------------------------------------------------
            _cdsBemAnterior.Data := GetDataPacket(' SELECT B.IDGRUPO, G.CLASSE, G.NOME AS DESCGRUPO ' + #13 +
                                                  ' FROM BEM_ANTERIOR B, ' + #13 +
                                                  '      GRUPO G ' + #13 +
                                                  ' WHERE B.IDBEM = ' + _cdsBemAtual.FieldByName('IDBEM').AsString + #13 +
                                                  '   AND B.IDPESSOA = ' + _cdsBemAtual.FieldByName('IDPESSOA').AsString + #13 +
                                                  '   AND B.IDGRUPO = G.IDGRUPO');
            //----------------------------------------------------------------------------
            if _cdsBemAtual.FieldByName('IDGRUPO').AsFloat <> _cdsBemAnterior.FieldByName('IDGRUPO').AsFloat then
            begin
               //-------------------------------------------------------------------------
               // Pesquisar no historico a transferência e se ela não ocorreu, gerar
               // lançamento no cds de resposta
               //-------------------------------------------------------------------------
               _cdsMovTransf.Data := GetDataPacket(' SELECT /*+ RULE */ DATAMOVIMENTACAO, IDMOVIMENTACAO ' + #13 +
                                                   ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                                                   ' WHERE (IDBEM + 0 = ' + FloatToStr(_cdsBemAtual.FieldByName('IDBEM').AsFloat) + ')' + #13 +
                                                   '   AND (IDPESSOA = ' + FloatToStr(_cdsBemAtual.FieldByName('IDPESSOA').AsFloat) + ')' + #13 +
                                                   '   AND (IDTIPOMOVIMENTACAO = 05) ' + #13 +
                                                   '   AND (IDGRUPANT = ' + FloatToStr(_cdsBemAnterior.FieldByName('IDGRUPO').AsFloat) + ')' );
               //-------------------------------------------------------------------------
               if _cdsMovTransf.IsEmpty then
               begin
                  _cdsReturn.Append;
                  _cdsReturn.FieldByName('PLACA').AsFloat      := _cdsBemAtual.FieldByName('PLACA').AsFloat;
                  _cdsReturn.FieldByName('DESCBEM').AsString   := copy(_cdsBemAtual.FieldByName('DESBEM').AsString,01,30);
                  _cdsReturn.FieldByName('IDGRUPOANT').AsFloat := _cdsBemAnterior.FieldByName('IDGRUPO').AsFloat;
                  _cdsReturn.FieldByName('CLASSEANT').AsString := _cdsBemAnterior.FieldByName('CLASSE').AsString;
                  _cdsReturn.FieldByName('NOMEANT').AsString   := _cdsBemAnterior.FieldByName('DESCGRUPO').AsString;
                  _cdsReturn.FieldByName('IDGRUPOATU').AsFloat := _cdsBemAtual.FieldByName('IDGRUPO').AsFloat;
                  _cdsReturn.FieldByName('CLASSEATU').AsString := _cdsBemAtual.FieldByName('CLASSE').AsString;
                  _cdsReturn.FieldByName('NOMEATU').AsString   := _cdsBemAtual.FieldByName('DESCGRUPO').AsString;
                  _cdsReturn.Post;
                  //----------------------------------------------------------------------
                  sLinha := '';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('PLACA').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('DESCBEM').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('IDGRUPOANT').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('CLASSEANT').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('NOMEANT').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('IDGRUPOATU').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('CLASSEATU').AsString) + ';';
                  sLinha := sLinha + trim(_cdsReturn.FieldByName('NOMEATU').AsString);
                  Writeln(atxtBens, trim(sLinha));
               end;
            end;
            //----------------------------------------------------------------------------
            _cdsBemAtual.Next;
         end;
         //-------------------------------------------------------------------------------
         CloseFile(atxtBens);
         //_cdsReturn.SaveToFile('C:\ManipulacaoFuncef.xml',dfXML);
         _cdsReturn.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ManipulacaoFuncef.xml',dfXML);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Result := _cdsReturn.Data;
         MessageInfo := '';
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message + #13 + 'A tabela BEM_ANTERIOR deve estar na instância selecionada';
            Result := _cdsReturn.Data;
         end;
      end;
   finally
      _cdsBemAtual.Free;
      _cdsBemAnterior.Free;
      _cdsMovTransf.Free;
      _cdsReturn.Free;
   end;
end;

function TCtrlMovTransfBem.ExecComandoSQL(sSql: String): Boolean;
begin
   try
      StartTransaction;
      //----------------------------------------------------------------------------------
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      Commit;
      MessageInfo := 'Executado';
      Result := True;
   except
      On E : Exception Do
      begin
         Rollback;
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;

end.

