unit uCtrlImobObra;
{-------------------------------------------------------------------------------
----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------
--------------------------------------------------------------------------------
Rotina.......: ExecutaEncerramentoObra, EstornaEncerramentoObra, ExecutaDesmembraObra, EstornaDesmembraObra
               GravaPlanoPatroxImovel, AtualizaSegregacaoLancamentos
--------------------------------------------------------------------------------
N. Sol..........: 258265
N. Kintana......: 983438
Data............: 14/08/2015
Responsável.....: William Moreira da Silva
Descrição.......: O Rateio pelo Plano dos imoveis, estava sendo lançados todos no planos padrão definido no CAF.
--------------------------------------------------------------------------------
Nº SOL.......: 154328-5901
Nº KINTANA...: 1373449
Data.........: 13/03/2014
Responsável..: Vando Souza Amancio
Descrição....: Segregação por plano previdenciário de todas as movimentações
               que são contabilizadas.
--------------------------------------------------------------------------------
SOL..........: 179583/9621
Kintana......: 1663624
Responsável..: Helen V. Bianchi
Data.........: 23/05/2012
Descrição....: Tratar mensagens incorretas e replicadas
--------------------------------------------------------------------------------
SOL..........: 179583
Kintana......: 1655783
Responsável..: Helen V. Bianchi
Data.........: 04/05/2012
Descrição....: Adicionado uma verificação no Historico antes de desfazer
--------------------------------------------------------------------------------
SOL..........: 864893
Kintana......: 139681
Responsável..: Felipe de Oliveira
Data.........: 23/07/2010
Descrição....: Corrigir o encerramento de obra, para contabilizar no plano de
               gestão administrativo
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
SOL..........: 139388
Kintana......: 766651
Responsável..: Cássio Camargo
Data.........: 08/07/2010
Descrição....: Correção dos processos de Encerramento de Obras e Estorno de
               Encerramento de Obras, para utilização da tabela
               PLANOPATROXVIGENCIABEM e PLANOPATROXVIGENCIAIMOB   
--------------------------------------------------------------------------------
}
interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,   SysUtils, dbclient, Provider,
     uMidasUtil, uDBBem, uDBBemxMoeda, uDBBemxDep,
     dMTBem, {uDbImobObra,} uDbCafObraRateio, uDbCafObraLanc, uDbCafObraDesmemb,
     uCtrlParamCAF, uCtrlBem, uCtrlGrupoContab, uCtrlCafxContab, uCtrlHistMovBem,
     uCtrlImobCAFxContab, uDbPlanoPatroxBem, uDbCafObra, uComunsImobiliario, uCMClientDataSet,
     UMensErro,Dialogs;

Type
   TCtrlImobObra = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      //_dbImobObra        : TDBImobObra;
      _dbImobObra        : TDBCafObra;
      _dbCafObraRateio  : TDBCafObraRateio;
      _dbCafObraLanc    : TDBCafObraLanc;
      _dbCafObraDesmemb : TDBCafObraDesmemb;

      _dbBem            : TDBBem;
      _dbBemxMoeda      : TDBBemxMoeda;
      _dbBemxDep        : TDBBemxDep;
      _dbPlanoPatroxBem : TDBPlanoPatroxBem;

      _dMTBem : tdtmMTBem;

      ParamCAF    : TCtrlParamCAF;
      GrupoContab : TCtrlGrupoContab;
      CafxContab  : TCtrlCafxContab;
      HistMovBem  : TCtrlHistMovBem;
      ImobCAFxContab : TCtrlImobCAFxContab;

      Fcds                : TClientDataSet;
      FcdsCafObraRateio   : TClientDataSet;
      FcdsCafObraLanc     : TClientDataSet;
      FcdsCafObraDesmemb  : TClientDataSet;
      FcdsCafObraEncerrar : TClientDataSet;
      FcdsBem             : TClientDataSet;
      FcdsBemxDep         : TClientDataSet;
      FcdsBemxMoeda       : TClientDataSet;
      FcdsTaxasDep        : TClientDataSet;
      FcdsObraFilhos      : TClientDataSet;
      FcdsGrpLancObra     : TClientDataSet;
      FcdsPlanoPatroxBem: TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsCafObraDesmemb(const Value: TClientDataSet);
      procedure SetcdsCafObraLanc(const Value: TClientDataSet);
      procedure SetcdsCafObraRateio(const Value: TClientDataSet);
      procedure SetcdsCafObraEncerrar(const Value: TClientDataSet);
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsTaxasDep(const Value: TClientDataSet);
      procedure SetcdsObraFilhos(const Value: TClientDataSet);
      procedure SetcdsGrpLancObra(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      //----------------------------------------------------------------------------------
      function RegistraCafObra(nEmpresaProp, nModulo : Extended; sDescCafObra : String;
                               dDataInicioObra, dDataEncerraObra : TDateTime;
                               iFlgObra : Integer;
                               nImovel, nTipoCustoRecImo : Extended) : Extended;
      function RegistraCafObraRateio(nEmpresaProp, nCafObra : Extended;
                                     sCodCentroCusto : String;
                                     nParticipacao : Extended) : Boolean;
      //----------------------------------------------------------------------------------
      function RegistraLancObra(nCafObra, nEmpresaProp, nModulo : Extended;
                                dDtaLanc : TDateTime; nObraEtapa : Extended;
                                nValOfi, nValFis, nValGer, nValGerb : Extended;
                                sNumNota, sComplNota : String; dDtaNota : TDateTime;
                                nPlanilha, nGrupo, nSubConta, nAtivProjeto, nFornecedor : Extended;
                                sDescLancObra : String; iFlgDesmembObra : Integer;
                                nObraLanc : Extended = 0) : Extended;
      //----------------------------------------------------------------------------------
      function RegistraCafObraDesmemb(nEmpresaProp, nCafObra, nObraResult : Extended;
                                      iTipoProporcao : Integer;
                                      nProporcao : Extended) : Boolean;
      //----------------------------------------------------------------------------------
      function RegistraEncerraObra(nEmpresaProp, nCafObra : Extended;
                                   dDtaEncerraObra : TDateTime;
                                   iTipoEncerra : Integer) : Boolean;

      function CMTranslate(sIgor : String) : String;

      function VerificaObraHistoricoMovimentacao(iIdCafObra : Double): boolean;

   Public
// Felipe de Oliveira Sol 139681 ktn 864893 - Inicio
      iImovel : Integer;
// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
      iHistorico : Integer; //Helen - SOL:179583 KTN : 1655783
      Bem : TCtrlBem;
      //----------------------------------------------------------------------------------
      property cds                : TClientDataSet read Fcds                write Setcds;
      property cdsCafObraRateio   : TClientDataSet read FcdsCafObraRateio   write SetcdsCafObraRateio;
      property cdsCafObraLanc     : TClientDataSet read FcdsCafObraLanc     write SetcdsCafObraLanc;
      property cdsCafObraDesmemb  : TClientDataSet read FcdsCafObraDesmemb  write SetcdsCafObraDesmemb;
      property cdsCafObraEncerrar : TClientDataSet read FcdsCafObraEncerrar write SetcdsCafObraEncerrar;
      property cdsBem             : TClientDataSet read FcdsBem             write SetcdsBem;
      property cdsBemxMoeda       : TClientDataSet read FcdsBemxMoeda       write SetcdsBemxMoeda;
      property cdsBemxDep         : TClientDataSet read FcdsBemxDep         write SetcdsBemxDep;
      property cdsTaxasDep        : TClientDataSet read FcdsTaxasDep        write SetcdsTaxasDep;
      property cdsObraFilhos      : TClientDataSet read FcdsObraFilhos      write SetcdsObraFilhos;
      property cdsGrpLancObra     : TClientDataSet read FcdsGrpLancObra     write SetcdsGrpLancObra;
      property cdsPlanoPatroxBem  : TClientDataSet read FcdsPlanoPatroxBem write SetcdsPlanoPatroxBem;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ProcurarCafObra(nIdPessoa, nIdCafObra: Extended) : OleVariant;
      function ProcurarCafObraRateio(nIdPessoa, nIdCafObra: Extended) : OleVariant;
      function ListaCafObra(nIdPessoa : Extended; nIdCafObra: Extended = -1): OleVariant;
      function ListaCafObraRateio(nIdPessoa, nIdCafObra: Extended): OleVariant;
      function ListaCafObraLanc(nIdPessoa, nIdCafObra: Extended; nObraLanc : Extended = -1): OleVariant;
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function LancamentosnaObra(nIdPessoa, nIdCafObra : Extended) : Boolean;
      function ListaObraFilhos : OleVariant;
      function ListaGrpLancObra(nIdPessoa, nIdCafObra: Extended): OleVariant;
      function ListaCafObraDesmemb(nIdPessoa, nIdCafObra: Extended): OleVariant;
      function ConvNum(nValor : Extended) : Extended;
      //----------------------------------------------------------------------------------
      function ExecutaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra, nObraEtapa,
                               nGrupo, nSubConta, nAtivProjeto : Extended;
                               dDtaLanc : TDateTime; nValOfi : Extended;
                               sGrupo, sNumNota, sComplNota : String;
                               dDtaNota : TDateTime;
                               nFornecedor : Extended; sDescLancObra : String;
                               nObraLanc : Extended = 0; iIdImovel: Integer =  -1) : Extended;
      function EstornaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra : Extended;
                               dDataMov, dDataEst : TDateTime;
                               nObraLanc : Extended) : Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaEncerramentoObra(nModulo, nEmpresaProp, nUsuario, nCafObra : Extended;
                                       dDataEncerramento : TDateTime; iIdImovel: Integer = -1) : boolean;
      function ExecutaEncerraGrupoObra(nModulo, nEmpresaProp, nCafObra, nConjunto,
                                       nGrupo, nGrupoObra, nSubConta, nAtivProjeto,
                                       nClasseBem, nPlaca, nSituacao : Extended;
                                       sDescBem : string; dDataInclusao : TDateTime;
                                       nValOrg : Extended; dDataIniDep : tDateTime;
                                       bIntegraContab : Boolean;
                                       iExercicio, iPeriodo : Integer;
                                       bCtaxCCusto : Boolean) : Boolean;
      function EstornaEncerramentoObra(nModulo, nEmpresaProp, nUsuario, nCafObra : Extended;
                                       dDataEncerramento : TDateTime) : boolean;
      //----------------------------------------------------------------------------------
      function ExecutaDesmembraObra(nModulo, nEmpresaProp, nCafObra : Extended;
                                    dDataMov : TDateTime; nSomaLanc : Extended) : Boolean;
      function EstornaDesmembraObra(nModulo, nEmpresaProp, nCafObra : Extended) : Boolean;
      function LookupPlanoPatroxImovel(iIdImovel: Integer): OLEVariant;

      function GravaPlanoPatroxImovel(iIdImovelOrigem, iIdImovelNovo : integer) : boolean; // Vando - SOL 154328-5901 / KTN 1373449
      function AtualizaSegregacaoLancamentos(iIdBem : integer; dData : TDateTime) : boolean;
   end;

implementation

 uses
   uSistema, uFuncoesImob, dImobiliario, uDataBase;
{ TCtrlImobObra }

constructor TCtrlImobObra.Create;
begin
   inherited;
   //_dbImobObra       := TDbImobObra.Create(Self);
   _dbImobObra       := TDbCafObra.Create(Self);
   _dbCafObraRateio  := TDbCafObraRateio.Create(Self);
   _dbCafObraLanc    := TDbCafObraLanc.Create(Self);
   _dbCafObraDesmemb := TDbCafObraDesmemb.Create(Self);

   _dbBem            := TdbBem.Create(Self);
   _dbBemxMoeda      := TdbBemxMoeda.Create(Self);
   _dbBemxDep        := TdbBemxDep.Create(Self);
   _dbPlanoPatroxBem := TDBPlanoPatroxBem.Create(Self);

   _dMTBem := tdtmMTBem.Create(Self);

   Fcds                := TClientDataSet.Create(nil);
   FcdsCafObraRateio   := TClientDataSet.Create(nil);
   FcdsCafObraLanc     := TClientDataSet.Create(nil);
   FcdsCafObraDesmemb  := TClientDataSet.Create(nil);
   FcdsCafObraEncerrar := TClientDataSet.Create(nil);
   FcdsBem             := TClientDataSet.Create(nil);
   FcdsBemxDep         := TClientDataSet.Create(nil);
   FcdsBemxMoeda       := TClientDataSet.Create(nil);
   FcdsTaxasDep        := TClientDataSet.Create(nil);
   FcdsObraFilhos      := TClientDataSet.Create(nil);
   FcdsGrpLancObra     := TClientDataSet.Create(nil);

   ParamCAF    := TCtrlParamCAF.Create;
   Bem         := TCtrlBem.Create;
   GrupoContab := TCtrlGrupoContab.Create;
   CafxContab  := TCtrlCafxContab.Create;
   HistMovBem  := TCtrlHistMovBem.Create;
   ImobCAFxContab := TCtrlImobCAFxContab.Create;

end;

destructor TCtrlImobObra.Destroy;
begin
   ParamCAF.Free;
   Bem.Free;
   GrupoContab.Free;
   CafxContab.Free;
   HistMovBem.Free;
   ImobCAFxContab.Free;

   _dbImobObra.Free;
   _dbCafObraRateio.Free;
   _dbCafObraLanc.Free;
   _dbCafObraDesmemb.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;

   _dMTBem.Free;

   if IsAppServer then
      FreeCDS([Fcds, FcdsCafObraRateio, FcdsCafObraEncerrar]);

   FcdsGrpLancObra.Free;
   //FcdsObraFilhos.Free;
   FcdsCafObraLanc.Free;
   FcdsCafObraDesmemb.Free;
   FcdsBem.Free;
   FcdsBemxDep.Free;
   FcdsBemxMoeda.Free;
   FcdsTaxasDep.Free;
   inherited;
end;

procedure TCtrlImobObra.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
   Bem.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   ImobCAFxContab.InitializeAs(Self);

end;

procedure TCtrlImobObra.DoChangeDataBase;
begin
   inherited;
   _dbImobObra.DataBaseName        := DataBaseName;
   _dbCafObraRateio.DataBaseName  := DataBaseName;
   _dbCafObraLanc.DataBaseName    := DataBaseName;
   _dbCafObraDesmemb.DataBaseName := DataBaseName;
   _dbBem.DataBaseName            := DataBaseName;
   _dbBemxMoeda.DataBaseName      := DataBaseName;
   _dbBemxDep.DataBaseName        := DataBaseName;
end;

procedure TCtrlImobObra.OnCreateAppServer;
begin
   inherited;
   Fcds               := TClientDataSet.Create(nil);
   FcdsCafObraRateio  := TClientDataSet.Create(nil);
   FcdsCafObraLanc    := TClientDataSet.Create(nil);
   FcdsCafObraDesmemb := TClientDataSet.Create(nil);
   FcdsBem            := TClientDataSet.Create(nil);
   FcdsBemxDep        := TClientDataSet.Create(nil);
   FcdsBemxMoeda      := TClientDataSet.Create(nil);
   FcdsTaxasDep       := TClientDataSet.Create(nil);
end;

procedure TCtrlImobObra.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlImobObra.SetcdsCafObraDesmemb(const Value: TClientDataSet);
begin
  FcdsCafObraDesmemb := Value;
end;

procedure TCtrlImobObra.SetcdsCafObraLanc(const Value: TClientDataSet);
begin
  FcdsCafObraLanc := Value;
end;

procedure TCtrlImobObra.SetcdsCafObraRateio(const Value: TClientDataSet);
begin
  FcdsCafObraRateio := Value;
end;

procedure TCtrlImobObra.SetcdsCafObraEncerrar(const Value: TClientDataSet);
begin
  FcdsCafObraEncerrar := Value;
end;

procedure TCtrlImobObra.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlImobObra.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlImobObra.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlImobObra.SetcdsTaxasDep(const Value: TClientDataSet);
begin
  FcdsTaxasDep := Value;
end;

procedure TCtrlImobObra.SetcdsObraFilhos(const Value: TClientDataSet);
begin
  FcdsObraFilhos := Value;
end;

procedure TCtrlImobObra.SetcdsGrpLancObra(const Value: TClientDataSet);
begin
  FcdsGrpLancObra := Value;
end;

//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TCtrlImobObra.ConvNum(nValor : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[nValor]));
end;

function TCtrlImobObra.AplicaOperacao(sTipoOperacao: String): Boolean;
Var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCAFOBRA(sTipoOperacao,
                                                           Fcds.Data,
                                                           FcdsCafObraRateio.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbImobObra,[],[]);
            sMensagem := _dbImobObra.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsCafObraRateio,_dbCafObraRateio,[_dbImobObra.IdCafObra],[_dbCafObraRateio.IdCafObra]);
            sMensagem := _dbCafObraRateio.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end else
         //-------------------------------------------------------------------------------
         begin
            Result := ApplyCds(FcdsCafObraRateio,_dbCafObraRateio,[_dbImobObra.IdCafObra],[_dbCafObraRateio.IdCafObra]);
            sMensagem := _dbCafObraRateio.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbImobObra,[],[]);
            sMensagem := _dbImobObra.MessageInfo;
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

function TCtrlImobObra.ProcurarCAFOBRA(nIdPessoa, nIdCafObra : Extended): OleVariant;
begin
   _dbImobObra.IDCAFOBRA.AsFloat := nIdCafObra;
   _dbImobObra.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbImobObra.sSQLSelect);
end;

function TCtrlImobObra.ProcurarCAFOBRARATEIO(nIdPessoa, nIdCafObra : Extended): OleVariant;
begin
   _dbCafObraRateio.IDCAFOBRA.AsFloat := nIdCafObra;
   _dbCafObraRateio.IDPESSOA.AsFloat := nIdPessoa;
   Result := GetDataPacket(_dbCafObraRateio.sSQLSelect);
end;

function TCtrlImobObra.ListaCafObra(nIdPessoa, nIdCafObra: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDCAFOBRA, IDPESSOA, IDMODULO, DESCCAFOBRA, DTAINICIOOBRA, ' + #13 +
           '        DTAENCERRAOBRA, FLGOBRA, IDIMOVEL, IDTIPOCUSTORECIMO ' + #13 +
           ' FROM CAFOBRA ' + #13 +
           ' WHERE IDPESSOA = ' + floattostr(nIdPessoa) + #13;
   //-------------------------------------------------------------------------------------
   if nIdCafObra <> -1 then
      sSql := sSql + '   AND (IDCAFOBRA = ' + floattostr(nIdCafObra) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY IDCAFOBRA, IDPESSOA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobObra.ListaCafObraRateio(nIdPessoa, nIdCafObra: Extended): OleVariant;
begin
   _dMTBem.sqlCafObraRateio.Prepare;
   _dMTBem.sqlCafObraRateio.ParamByName('IDCAFOBRA').AsFloat := nIdCafObra;
   _dMTBem.sqlCafObraRateio.ParamByName('IDPESSOA').AsFloat  := nIdPessoa;
   //-------------------------------------------------------------------------------------
   Result := _dMTBem.sqlCafObraRateio.Data;
end;

function TCtrlImobObra.ListaCafObraLanc(nIdPessoa, nIdCafObra: Extended; nObraLanc : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT L.IDOBRALANC, L.IDCAFOBRA, L.IDPESSOA, L.IDMODULO, L.IDOBRATIPOETAPA, ' + #13 +
           '        L.PLNCODIGO, L.DTANOTA, L.NUMNOTA, L.COMPLNOTA, L.DTALANCAMENTO, ' + #13 +
           '        L.VALOFI, L.VALFIS, L.VALGER, L.VALGERB, L.IDGRUPO, L.CODSUBCONTA, ' + #13 +
           '        L.DESCLANCOBRA, L.IDFORNECEDOR, L.FLGDESMEMBOBRA, L.UNIDNEGOC, ' + #13 +
           '        G.NOME AS DESCGRUPO, EO.DESCOBRATIPOETAPA, P.NOME AS NOMEFORN ' + #13 +
           ' FROM CAFOBRALANC L, ' + #13 +
           '      CAFOBRATIPOETAPA EO, ' + #13 +
           '      GRUPO G, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE L.IDCAFOBRA = ' + floattostr(nIdCafObra) + #13 +
           '   AND L.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           '   AND L.IDOBRATIPOETAPA = EO.IDOBRATIPOETAPA ' + #13 +
           '   AND L.IDGRUPO = G.IDGRUPO ' + #13 +
           '   AND L.IDFORNECEDOR = P.IDPESSOA(+) ' + #13 +
           ' ORDER BY L.DTALANCAMENTO, L.IDGRUPO, L.IDOBRATIPOETAPA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobObra.ListaObraFilhos : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT O.DESCCAFOBRA,         ' + #13 +
           '        (0) AS TIPOPROPORCAO,  ' + #13 +
           '        (0.0000) AS PROPORCAO, ' + #13 +
           '        (0) AS IDOBRARESULT    ' + #13 +
           ' FROM CAFOBRA O                ' + #13 +
           ' WHERE (O.IDCAFOBRA = -1)      ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobObra.ListaGrpLancObra(nIdPessoa, nIdCafObra: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT L.IDOBRATIPOETAPA, L.IDGRUPO, L.CODSUBCONTA, L.UNIDNEGOC, ' + #13 +
           '        L.IDFORNECEDOR, SUM(L.VALOFI) AS SOMAVALOFI ' + #13 +
           ' FROM CAFOBRALANC L ' + #13 +
           ' WHERE L.IDCAFOBRA = ' + floattostr(nIdCafObra) + #13 +
           '   AND L.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
           ' GROUP BY L.IDOBRATIPOETAPA, L.IDGRUPO, L.CODSUBCONTA, L.UNIDNEGOC, L.IDFORNECEDOR ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobObra.ListaCafObraDesmemb(nIdPessoa, nIdCafObra: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT IDCAFOBRA, IDPESSOA, IDOBRARESULT, ' + #13 +
           '        TIPOPROPORCAO, PROPORCAO ' + #13 +
           ' FROM CAFOBRADESMEMB ' + #13 +
           ' WHERE IDCAFOBRA = ' + floattostr(nIdCafObra) + #13 +
           '   AND IDPESSOA = ' + floattostr(nIdPessoa);
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobObra.LancamentosnaObra(nIdPessoa, nIdCafObra : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDCAFOBRA) AS QTD ' +
           ' FROM CAFOBRALANC ' +
           ' WHERE IDCAFOBRA = ' + floattostr(nIdCafObra) +
           '   AND IDPESSOA = ' + floattostr(nIdPessoa);
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := CMTranslate('Existem Lançamentos cadastrados nesta Obra!');
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlImobObra.RegistraCafObra(nEmpresaProp, nModulo : Extended; sDescCafObra : String;
                                      dDataInicioObra, dDataEncerraObra : TDateTime;
                                      iFlgObra : Integer;
                                      nImovel, nTipoCustoRecImo : Extended) : Extended;
begin
   try
      with _dbImobObra do
      begin
         IDPESSOA.AsFloat         := nEmpresaProp;
         IDMODULO.AsFloat         := nModulo;
         DESCCAFOBRA.AsString     := sDescCafObra;
         DTAINICIOOBRA.AsDateTime := dDataInicioObra;
         FLGOBRA.AsInteger        := iFlgObra;
         //-------------------------------------------------------------------------------
         if dDataEncerraObra > 0 then
            DTAENCERRAOBRA.AsDateTime := dDataEncerraObra
         else
            DTAENCERRAOBRA.Clear;
         //-------------------------------------------------------------------------------
         if nImovel > 0 then
            IDIMOVEL.AsFloat := nImovel
         else
            IDIMOVEL.Clear;
         //-------------------------------------------------------------------------------
         if nTipoCustoRecImo > 0 then
            IDTIPOCUSTORECIMO.AsFloat := nTipoCustoRecImo
         else
            IDTIPOCUSTORECIMO.Clear;
      end;
      //----------------------------------------------------------------------------------
      if not _dbImobObra.Insert then
         Raise Exception.Create(_dbImobObra.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := _dbImobObra.IDCAFOBRA.AsFloat;
   except
      On E : Exception Do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlImobObra.RegistraCafObraRateio(nEmpresaProp, nCafObra : Extended;
                                            sCodCentroCusto : String;
                                            nParticipacao : Extended) : Boolean;
begin
   try
      with _dbCafObraRateio do
      begin
         IDCAFOBRA.AsFloat       := nCafObra;
         IDPESSOA.AsFloat        := nEmpresaProp;
         IDEMPRESA.AsFloat       := nEmpresaProp;
         CODCENTROCUSTO.AsString := sCodCentroCusto;
         PARTICIPACAO.AsFloat    := nParticipacao;
      end;
      //----------------------------------------------------------------------------------
      if not _dbCafObraRateio.Insert then
         Raise Exception.Create(_dbCafObraRateio.MessageInfo);
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

function TCtrlImobObra.RegistraLancObra(nCafObra, nEmpresaProp, nModulo : Extended;
                                       dDtaLanc : TDateTime; nObraEtapa : Extended;
                                       nValOfi, nValFis, nValGer, nValGerb : Extended;
                                       sNumNota, sComplNota : String; dDtaNota : TDateTime;
                                       nPlanilha, nGrupo, nSubConta, nAtivProjeto, nFornecedor : Extended;
                                       sDescLancObra : String; iFlgDesmembObra : Integer;
                                       nObraLanc : Extended) : Extended;
begin
   try
      with _dbCafObraLanc do
      begin
         IDCAFOBRA.AsFloat := nCafObra;
         IDPESSOA.AsFloat := nEmpresaProp;
         IDOBRATIPOETAPA.AsFloat := nObraEtapa;
         IDGRUPO.AsFloat := nGrupo;
         //-------------------------------------------------------------------------------
         if nFornecedor > 0 then
            IDFORNECEDOR.AsFloat := nFornecedor
         else
            IDFORNECEDOR.Clear;
         //-------------------------------------------------------------------------------
         if nSubConta > 0 then
            CODSUBCONTA.AsFloat := nSubConta
         else
            CODSUBCONTA.Clear;
         //-------------------------------------------------------------------------------
         if nAtivProjeto > 0 then
            UNIDNEGOC.AsFloat := nAtivProjeto
         else
            UNIDNEGOC.Clear;
         //-------------------------------------------------------------------------------
         if nPlanilha > 0 then
            PLNCODIGO.AsFloat := nPlanilha
         else
            PLNCODIGO.Clear;
         //-------------------------------------------------------------------------------
         if dDtaNota <> -1 then
            DTANOTA.AsDateTime := dDtaNota
         else
            DTANOTA.Clear;
         //-------------------------------------------------------------------------------
         DESCLANCOBRA.AsString := sDescLancObra;
         NUMNOTA.AsString := sNumNota;
         COMPLNOTA.AsString := sComplNota;
         DTALANCAMENTO.AsDateTime := dDtaLanc;
         VALOFI.AsFloat := nValOfi;
         FLGDESMEMBOBRA.AsInteger := iFlgDesmembObra;
      end;
      //----------------------------------------------------------------------------------
      if not _dbCafObraLanc.InsertAs(nObraLanc) then
         Raise Exception.Create(_dbCafObraLanc.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := _dbCafObraLanc.IDOBRALANC.AsFloat;
   except
      on E : Exception Do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlImobObra.RegistraCafObraDesmemb(nEmpresaProp, nCafObra, nObraResult : Extended;
                                             iTipoProporcao : Integer;
                                             nProporcao : Extended) : Boolean;
begin
   try
      with _dbCafObraDesmemb do
      begin
         IDCAFOBRA.AsFloat       := nCafObra;
         IDPESSOA.AsFloat        := nEmpresaProp;
         IDOBRARESULT.AsFloat    := nObraResult;
         TIPOPROPORCAO.AsInteger := iTipoProporcao;
         PROPORCAO.AsFloat       := nProporcao;
      end;
      //----------------------------------------------------------------------------------
      if not _dbCafObraDesmemb.Insert then
         Raise Exception.Create(_dbCafObraDesmemb.MessageInfo);
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

function TCtrlImobObra.RegistraEncerraObra(nEmpresaProp, nCafObra : Extended;
                                          dDtaEncerraObra : TDateTime;
                                          iTipoEncerra : Integer) : Boolean;

begin
   try
      Fcds.Data := ListaCafObra(nEmpresaProp, nCafObra);
      //----------------------------------------------------------------------------------
      Fcds.Edit;
      //Helen - SOL:179583 KTN : 1655783
      Fcds.FieldByName('DESCCAFOBRA').AsString := Trim(Fcds.FieldByName('DESCCAFOBRA').AsString);
      
      if iTipoEncerra = 0 then
      begin
         Fcds.FieldByName('DTAENCERRAOBRA').Clear;
         Fcds.FieldByName('FLGOBRA').AsInteger := 0;
      end else
      if iTipoEncerra = 1 then
      begin
         Fcds.FieldByName('DTAENCERRAOBRA').AsDateTime := dDtaEncerraObra;
         Fcds.FieldByName('FLGOBRA').AsInteger := 1  // Encerramento de Obra
      end else
      if iTipoEncerra = 2 then
      begin
         Fcds.FieldByName('DTAENCERRAOBRA').AsDateTime := dDtaEncerraObra;
         Fcds.FieldByName('FLGOBRA').AsInteger := 2; // Desmembramento de Obra
      end;
      Fcds.Post;
      //----------------------------------------------------------------------------------
      CdsToDbObject(Fcds, _dbImobObra);
      if not _dbImobObra.Update then
         Raise Exception.Create(_dbImobObra.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MessageInfo := CMTranslate('Erro no registro do encerramento da obra') + #13 + #13 + E.Message;
      end;
   end;
end;
//========================================================================================
// Executa um Lancamento em uma Obra
//========================================================================================
function TCtrlImobObra.ExecutaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra, nObraEtapa,
                                      nGrupo, nSubConta, nAtivProjeto : Extended;
                                      dDtaLanc : TDateTime; nValOfi : Extended;
                                      sGrupo, sNumNota, sComplNota : String;
                                      dDtaNota : TDateTime; nFornecedor : Extended;
                                      sDescLancObra : String;
                                      nObraLanc : Extended; iIdImovel: Integer) : Extended;
var
   bIntegraContab, bCtaxCCusto : Boolean;
   nValFis, nValGer, nValGerb,
   nPlanilha, nIdObraLanc      : Extended;
   iExercicio, iPeriodo        : Integer;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra, nObraEtapa,
                                                     nGrupo, nSubConta, nAtivProjeto,
                                                     dDtaLanc, nValOfi, sGrupo, sNumNota, sComplNota,
                                                     dDtaNota, nFornecedor, sDescLancObra, nObralanc, iIdImovel);
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
         //bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         bIntegraContab := ImobCAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Carrega os dados da obra
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaCafObra(nEmpresaProp, nCafObra);
         if Fcds.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos a Obra estão incorretos!'));
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> Fcds.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou a Obra pode manipulá-la'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Obra!'))
         else
            if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou a Obra pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         // Valida os parâmetros obrigatórios para Lançamento de Obra
         //-------------------------------------------------------------------------------
         if dDtaLanc <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Data do Lançamento de Obra!'));
         //-------------------------------------------------------------------------------
         if nGrupo <= 0 then
            Raise Exception.Create(CMTranslate('Informe o Grupo Contábil!'));
         //-------------------------------------------------------------------------------
         if nObraEtapa <= 0 then
            Raise Exception.Create(CMTranslate('Informe a Etapa da Obra!'));
         //-------------------------------------------------------------------------------
         if nValOfi = 0 then
            Raise Exception.Create(CMTranslate('Informe o Valor do Lançamento da Obra'));
         //-------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //-------------------------------------------------------------------------------
         nValFis  := Bem.ConversaoMoeda(nValOfi, ParamCAF.MOEDAFISCAL, dDtaLanc);
         nValGer  := Bem.ConversaoMoeda(nValOfi, ParamCAF.MOEDAGERENCIAL, dDtaLanc);
         nValGerb := Bem.ConversaoMoeda(nValOfi, ParamCAF.MOEDAGERENCIALB, dDtaLanc);
         //-------------------------------------------------------------------------------
         // Lançamento Contábil
         //-------------------------------------------------------------------------------
         nPlanilha := 0;
         if bIntegraContab then
         begin
            //if not CafxContab.VerificaPeriodoContabil(nEmpresaProp, dDtaLanc,
            if not ImobCAFxContab.VerificaPeriodoContabil(nEmpresaProp, dDtaLanc,
                                                      iExercicio, iPeriodo) then
               //Raise Exception.Create(CafxContab.MessageInfo);
               Raise Exception.Create(ImobCAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query de montagem da Planilha Contábil
            //----------------------------------------------------------------------------
            //if not CafxContab.InicializaMontaContab then
            if not ImobCAFxContab.InicializaMontaContab then
               //Raise Exception.Create(CafxContab.MessageInfo);
              Raise Exception.Create(ImobCafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query com a Parametrização contábil
            //----------------------------------------------------------------------------
            //if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
            if not ImobCAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
               //Raise Exception.Create(CafxContab.MessageInfo);
               Raise Exception.Create(ImobCafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Lê a Dependencia da Conta Contábil do Centro de Custo
            //----------------------------------------------------------------------------
            bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
            //----------------------------------------------------------------------------
            // Alimenta o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            //nPlanilha := CafxContab.ContabilizaLancObra(nModulo, nEmpresaProp, nUsuario,
            nPlanilha := ImobCAFxContab.ContabilizaLancObra(nModulo, nEmpresaProp, nUsuario,
                                                        nCafObra, nGrupo, iExercicio, iPeriodo,
                                                        dDtaLanc, nValOfi, sGrupo,
                                                        Fcds.FieldByName('DESCCAFOBRA').AsString,
                                                        nAtivProjeto, nSubConta, bCtaxCCusto,
                                                        iIdImovel);
            if nPlanilha < 0 then
               //Raise Exception.Create(CafxContab.MessageInfo);
               Raise Exception.Create(ImobCafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra o Lançamento em CAFOBRALANC
         //-------------------------------------------------------------------------------
         nIdObraLanc := RegistraLancObra(nCafObra, nEmpresaProp, nModulo,
                                         dDtaLanc, nObraEtapa, nValOfi, nValFis,
                                         nValGer, nValGerb, sNumNota, sComplNota,
                                         dDtaNota, nPlanilha, nGrupo, nSubConta, nAtivProjeto,
                                         nFornecedor, sDescLancObra, 0, nObraLanc);
         if nIdObraLanc = -1 then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         Result := nIdObraLanc;
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
// Função que executa o estorno de um lançamento de valor em Obra
//----------------------------------------------------------------------------------------
function TCtrlImobObra.EstornaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra : Extended;
                                      dDataMov, dDataEst : TDateTime;
                                      nObraLanc : Extended) : Boolean;
var
   bIntegraContab : Boolean;
   nPlanilha      : Extended;
   sSql           : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra,
                                                     dDataMov, dDataEst, nObraLanc);
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
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         //bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         bIntegraContab := ImobCafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Carrega os dados da obra
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaCafObra(nEmpresaProp, nCafObra);
         if Fcds.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos a Obra estão incorretos!'));
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> Fcds.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou a Obra pode manipulá-la'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA da Obra!'))
         else
            if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou a Obra pode manipulá-la'));
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela CAFOBRALANC
         //-------------------------------------------------------------------------------
         FcdsCafObraLanc.Data := ListaCafObraLanc(nEmpresaProp, nCafObra);
         if FcdsCafObraLanc.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos a Obra estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Localiza o lançamento que será estornado
         //-------------------------------------------------------------------------------
         if not FcdsCafObraLanc.Locate('IDOBRALANC',nObraLanc,[]) then
            Raise Exception.Create(CMTranslate('Código do lançamento inválido para essa Obra!'));
         //-------------------------------------------------------------------------------
         if FcdsCafObraLanc.FieldByName('PLNCODIGO').IsNull then
            nPlanilha := 0
         else
            nPlanilha := FcdsCafObraLanc.FieldByName('PLNCODIGO').AsFloat;
         //-------------------------------------------------------------------------------
         // Estorna Lancamento na Contabilidade
         //-------------------------------------------------------------------------------
         if bIntegraContab and (nPlanilha > 0) then
         begin
            //----------------------------------------------------------------------------
            // Retira o Link do Histórico com a Planilha Contábil
            //----------------------------------------------------------------------------
            sSql := ' UPDATE CAFOBRALANC ' +
                    ' SET PLNCODIGO = NULL '+
                    ' WHERE IDCAFOBRA  = ' + floattostr(nCafObra) +
                    '   AND IDOBRALANC = ' + floattostr(nObraLanc) +
                    '   AND IDPESSOA   = ' + floattostr(nEmpresaProp);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            //if not CafxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
            if not ImobCafxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
            begin
               //if not CafxContab.LancaContab.EstornaLancaContab(nUsuario, nPlanilha,
               if not ImobCafxContab.LancaContab.EstornaLancaContab(nUsuario, nPlanilha,
                                                                nModulo, nEmpresaProp,
                                                                ParamCAF.USAPLANOPATRO,
                                                                datetostr(dDataMov)) then
               begin
                  //Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + CafxContab.MessageInfo);
                  Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + ImobCafxContab.MessageInfo);
               end;
            end else
            begin
               //if not CafxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlanilha,
               if not ImobCafxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlanilha,
                                                               nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
               begin
                  //Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + CafxContab.MessageInfo);
                  Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + ImobCafxContab.MessageInfo);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM CAFOBRALANC ' +
                 ' WHERE IDCAFOBRA  = ' + floattostr(nCafObra) +
                 '   AND IDOBRALANC = ' + floattostr(nObraLanc) +
                 '   AND IDPESSOA   = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa o Encerramento de uma Obra com a entrada de um bem no Ativo Fixo
// para cada grupo acumulado
//----------------------------------------------------------------------------------------
function TCtrlImobObra.ExecutaEncerramentoObra(nModulo, nEmpresaProp, nUsuario, nCafObra : Extended;
                                              dDataEncerramento : TDateTime; iIdImovel: Integer) : boolean;
var
   bIntegraContab, bCtaxCCusto : Boolean;
   iExercicio, iPeriodo        : Integer;
   nPlanilha                   : Extended;
   sSql                        : String;
   bInTransacao                : boolean;   // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;   // Vando - SOL 154328-5901 / KTN 1373449

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaEncerramentoObra(nModulo, nEmpresaProp, nUsuario, nCafObra,
                                                             dDataEncerramento,
                                                             Fcds.Data,
                                                             FcdsCafObraEncerrar.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bInTransacao then   // Vando - SOL 154328-5901 / KTN 1373449
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
         //bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         bIntegraContab := ImobCAFxContab.IntegraContab(trunc(nEmpresaProp), trunc (nModulo));
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //if not CafxContab.VerificaPeriodoContabil(nEmpresaProp, dDataEncerramento,
            if not ImobCafxContab.VerificaPeriodoContabil(nEmpresaProp, dDataEncerramento,
                                                      iExercicio, iPeriodo) then
               //Raise Exception.Create(CafxContab.MessageInfo);
               Raise Exception.Create(ImobCafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query de montagem da Planilha Contábil
            //----------------------------------------------------------------------------
            //if not CafxContab.InicializaMontaContab then
            //   Raise Exception.Create(CafxContab.MessageInfo);
            if not ImobCafxContab.InicializaMontaContab then
               Raise Exception.Create(ImobCafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Inicializa a query com a Parametrização contábil
            //----------------------------------------------------------------------------
            //if not CAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
            //   Raise Exception.Create(CafxContab.MessageInfo);
            if not ImobCAFxContab.MontaParamCAFxContab(trunc(nEmpresaProp), ParamCAF.PLANOVIGENTE) then
               Raise Exception.Create(ImobCafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Lê a Dependencia da Conta Contábil do Centro de Custo
         //-------------------------------------------------------------------------------
         bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
         //-------------------------------------------------------------------------------
         // Registra os bens no cadastro
         //-------------------------------------------------------------------------------
         FcdsCafObraEncerrar.First;
         while not FcdsCafObraEncerrar.EOF do
         begin
            if FcdsCafObraEncerrar.FieldByName('IDGRUPO').IsNull then
               Raise Exception.Create(CMTranslate('O grupo contábil não foi definido!'));
            if FcdsCafObraEncerrar.FieldByName('IDCONJUNTO').IsNull then
               Raise Exception.Create(CMTranslate('O conjunto não foi definido!'));
            if FcdsCafObraEncerrar.FieldByName('IDCLASSEBEM').IsNull then
               Raise Exception.Create(CMTranslate('A Classe do Bem não foi definida!'));
            if FcdsCafObraEncerrar.FieldByName('PLACA').IsNull then
               Raise Exception.Create(CMTranslate('A Placa não foi definida!'));
            if FcdsCafObraEncerrar.FieldByName('IDSITUACAO').IsNull then
               Raise Exception.Create(CMTranslate('A Situação do Bem não foi definida!'));
            if FcdsCafObraEncerrar.FieldByName('DESBEM').IsNull then
               Raise Exception.Create(CMTranslate('A Descrição do Bem não foi definida!'));
            if FcdsCafObraEncerrar.FieldByName('DATAINICIODEP').IsNull then
               Raise Exception.Create(CMTranslate('A Data de Inicio da Depreciação do Bem não foi definida!'));
            //----------------------------------------------------------------------------

            iImovel := iIdImovel;//William Moreira da Silva - SOL 258265 PPM 983438
            
            if not ExecutaEncerraGrupoObra(FcdsCafObraEncerrar.FieldByName('IDMODULO').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('IDPESSOA').AsFloat,
                                           Fcds.FieldByName('IDCAFOBRA').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('IDCONJUNTO').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('IDGRUPO').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('IDGRUPOOBRA').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('CODSUBCONTA').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('UNIDNEGOC').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('IDCLASSEBEM').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('PLACA').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('IDSITUACAO').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('DESBEM').AsString,
                                           FcdsCafObraEncerrar.FieldByName('DTAINCLUSAO').AsDateTime,
                                           FcdsCafObraEncerrar.FieldByName('VALORG').AsFloat,
                                           FcdsCafObraEncerrar.FieldByName('DATAINICIODEP').AsDateTime,
                                           bIntegraContab, iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FcdsCafObraEncerrar.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         nPlanilha := 0;
         if bIntegraContab then
         begin
            //nPlanilha := CafxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp, nUsuario,
            nPlanilha := ImobCafxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp, nUsuario,
                                                             datetostr(dDataEncerramento));//, iIdImovel);
            if nPlanilha < 0 then
               //Raise Exception.Create(CafxContab.MessageInfo);
               Raise Exception.Create(ImobCafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra o número da Planilha Contábil no historico de movimentacao
         //-------------------------------------------------------------------------------
         if bIntegraContab and VerificaObraHistoricoMovimentacao(nCafObra) then
         begin
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                    ' SET PLNCODIGO = ' + floattostr(nPlanilha) +
                    ' WHERE IDCAFOBRA  = ' + floattostr(nCafObra) +
                    '   AND IDPESSOA   = ' + floattostr(nEmpresaProp);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Obra como Encerrada
         //-------------------------------------------------------------------------------
         if not RegistraEncerraObra(nEmpresaProp, nCafObra, dDataEncerramento, 1) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         if not bInTransacao then   // Vando - SOL 154328-5901 / KTN 1373449
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
           if not bInTransacao then   // Vando - SOL 154328-5901 / KTN 1373449
              RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa o Encerramento de uma Obra com a entrada de um bem no Ativo Fixo
//----------------------------------------------------------------------------------------
function TCtrlImobObra.ExecutaEncerraGrupoObra(nModulo, nEmpresaProp, nCafObra, nConjunto,
                                              nGrupo, nGrupoObra, nSubConta, nAtivProjeto,
                                              nClasseBem, nPlaca, nSituacao : Extended;
                                              sDescBem : string; dDataInclusao : TDateTime;
                                              nValOrg : Extended; dDataIniDep : tDateTime;
                                              bIntegraContab : Boolean;
                                              iExercicio, iPeriodo : Integer;
                                              bCtaxCCusto : Boolean) : Boolean;
type
   rBemxDep = Record
      IDBEMXDEP  : Integer;
      TAXADEP    : Extended;
   end;

var
   aBemxDep                      : Array of rBemxDep;
   iaBemxDep,
   iAux, iFlgSemPlaca, icBemxDep,
   iFlgPai                       : Integer;
   sGrupo, sGrupoObra,sSQL            : String;
   nValorMoeda, nSeqHist,
   nLocalizacao, nResponsavel    : Extended;

   dDataVigencia :TDateTime;

   cdsPlanoPatro :TCMClientDataSet;

begin
   try
// Felipe de Oliveira Sol 139681 ktn 864893 - Inicio
      cdsPlanoPatro := TCmClientDataSet.Create(nil);

      cdsPlanoPatro.Data :=  LookupPlanoPatroxImovel(iImovel);
// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
      //----------------------------------------------------------------------------------
      // Verificar os dados fornecidos
      //----------------------------------------------------------------------------------
      if nModulo <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
      else
         if nModulo <> Fcds.FieldByName('IDMODULO').AsFloat then
            Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou a Obra pode encerrá-la'));
      //----------------------------------------------------------------------------------
      if nEmpresaProp <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA da Obra!'))
      else
         if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
            Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou a Obra pode encerrá-la'));
      //----------------------------------------------------------------------------------
      if nCafObra <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório informar a OBRA!'));
      //----------------------------------------------------------------------------------
      if nGrupoObra <= 0 then
      begin
         Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do GRUPO da Obra que irá gerar o bem!'));
      end else
      begin
         _cds.Data := GrupoContab.ListaGrupoContab(nEmpresaProp, nGrupoObra);
         if _cds.isEmpty then
            Raise Exception.Create(CMTranslate('Código do GRUPO da Obra inexistente ou inválido!'));
         sGrupoObra := _cds.FieldByName('NOME').AsString;
      end;
      //----------------------------------------------------------------------------------
      // Preencher os cds necessários ao cadastramento do bem
      //----------------------------------------------------------------------------------
      FcdsBem.Data       := Bem.ListaBem(nEmpresaProp, 0);
      FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp, 0);
      FcdsBemxDep.Data   := Bem.ListaBemxDep(nEmpresaProp, 0);
      //----------------------------------------------------------------------------------
      FcdsBem.Append;
      FcdsBem.FieldbyName('IDPESSOA').AsFloat         := nEmpresaProp;
      FcdsBem.FieldbyName('IDMODULO').AsFloat         := nModulo;
      FcdsBem.FieldbyName('PLACA').AsFloat            := nPlaca;
      FcdsBem.FieldbyName('IDGRUPO').AsFloat          := nGrupo;
      FcdsBem.FieldbyName('IDCLASSEBEM').AsFloat      := nClasseBem;
      FcdsBem.FieldbyName('IDSITUACAO').AsFloat       := nSituacao;
      FcdsBem.FieldbyName('IDCONJUNTO').AsFloat       := nConjunto;
      FcdsBem.FieldbyName('REGISTRO').AsString        := 'O';
      FcdsBem.FieldbyName('CONTROLE').AsString        := 'T';
      FcdsBem.FieldbyName('VALHISTORICO').AsFloat     := nValOrg;
      FcdsBem.FieldbyName('DTAINCLUSAO').AsDateTime   := dDataInclusao;
      FcdsBem.FieldbyName('DATAINICIODEP').AsDateTime := dDataIniDep;
      FcdsBem.FieldbyName('DESBEM').AsString          := sDescBem;
      //----------------------------------------------------------------------------------
      if nSubConta > 0 then
         FcdsBem.FieldbyName('CODSUBCONTA').AsFloat := nSubConta
      else
         FcdsBem.FieldbyName('CODSUBCONTA').Clear;
      //----------------------------------------------------------------------------------
      if nAtivProjeto > 0 then
         FcdsBem.FieldbyName('UNIDNEGOC').AsFloat := nAtivProjeto
      else
         FcdsBem.FieldbyName('UNIDNEGOC').Clear;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         FcdsBem.FieldbyName('FLGBEMINTCONTAB').AsFloat := 1;
         FcdsBem.FieldbyName('DTACONTAB').AsFloat       := dDataInclusao;
      end else
      begin
         FcdsBem.FieldbyName('FLGBEMINTCONTAB').AsFloat := 0;
         FcdsBem.FieldbyName('DTACONTAB').Clear;
      end;
      //----------------------------------------------------------------------------------
      FcdsBem.Post;
      //----------------------------------------------------------------------------------
      // Carregar as taxas de depreciação padrão para o grupo
      // escolhido do bem que será gerado
      //----------------------------------------------------------------------------------
      FcdsTaxasDep.Data := GrupoContab.ListaGrupoTaxaDep(nGrupo, nEmpresaProp);
      while not FcdsTaxasDep.EOF do
      begin
         FcdsBemxDep.Append;
         FcdsBemxDep.FieldByName('IDPESSOA').AsFloat     := nEmpresaProp;
         FcdsBemxDep.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
         FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger  := FcdsTaxasDep.FieldByName('IDTAXADEP').AsInteger;
         FcdsBemxDep.FieldByName('TAXADEP').AsFloat      := FcdsTaxasDep.FieldByName('TAXADEP').AsFloat;
         FcdsBemxDep.FieldByName('DESCTAXADEP').AsString := FcdsTaxasDep.FieldByName('DESCTAXADEP').AsString;
         FcdsBemxDep.Post;
         //-------------------------------------------------------------------------------
         FcdsTaxasDep.Next;
      end;
      //----------------------------------------------------------------------------------
      // Se o grupo não possuir as taxas de depreciação
      //----------------------------------------------------------------------------------
      if FcdsBemxDep.RecordCount <> ParamCAF.NUMTAXADEP then
         Raise Exception.Create(CMTranslate('Grupo Contábil ')+floattostr(nGrupo)+CMTranslate(' não ')+
                                CMTranslate('possui taxa(s) de depreciação definida(s)!.')+#13+
                                CMTranslate('Cadastre as Taxas no Cadastro de Grupos Contábeis.'));
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
            FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
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
      // Registro do Valor em Moeda Oficial
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Append;
      FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := FcdsBem.FieldByName('IDPESSOA').AsInteger;
      FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger  := ParamCAF.MOEDAOFICIAL;
      FcdsBemxMoeda.FieldByName('VALORG').AsFloat       := nValOrg;
      FcdsBemxMoeda.FieldByName('CMBEM').AsFloat        := 0;
      FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
      FcdsBemxMoeda.Post;
      //----------------------------------------------------------------------------------
      // Conversão do valor de aquisição para as quatro moedas suportadas pelo CAF
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAFISCAL > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg,ParamCAF.MOEDAFISCAL,
                                           FcdsBem.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger   := FcdsBem.FieldByName('IDPESSOA').AsInteger;
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
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := FcdsBem.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAFISCAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime  := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIAL > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIAL,
                                           FcdsBem.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
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
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger    := FcdsBem.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAGERENCIAL;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger   := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat       := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIALB > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIALB,
                                           FcdsBem.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
         FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
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
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      if ParamCAF.MOEDAGERENCIALC > 0 then
      begin
         nValorMoeda := Bem.ConversaoMoeda(nValOrg, ParamCAF.MOEDAGERENCIALC,
                                           FcdsBem.FieldByName('DTAINCLUSAO').AsDateTime);
         if nValorMoeda < 0 then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Append;
         FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
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
            FcdsBemxDep.FieldByName('IDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALC;
            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger := aBemxDep[iAux].IDBEMXDEP;
            FcdsBemxDep.FieldByName('TAXADEP').AsFloat     := aBemxDep[iAux].TAXADEP;
            FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := FcdsBem.FieldByName('DATAINICIODEP').AsDateTime;
            FcdsBemxDep.Post;
            iAux := iAux + 1;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Validação dos parâmetros obrigatórios para entrada de bens
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('REGISTRO').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer o Código de Registro do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      if not ((FcdsBem.FieldbyName('REGISTRO').AsString = 'I') or
              (FcdsBem.FieldbyName('REGISTRO').AsString = 'O')) then
      begin
         MessageInfo := CMTranslate('Código de registro inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('CONTROLE').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a Forma de Controle do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      if not ((FcdsBem.FieldbyName('CONTROLE').AsString = 'T') or (FcdsBem.FieldbyName('CONTROLE').AsString = 'F')) then
      begin
         MessageInfo := CMTranslate('Código de controle inválido!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('IDCONJUNTO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do CONJUNTO do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDLOCALIZACAO, IDRESPONSAVEL, DESCCONJUNTO '+
                                    ' FROM CONJUNTO '+
                                    ' WHERE (IDPESSOA = '   + FcdsBem.FieldbyName('IDPESSOA').AsString + ')' +
                                    '   AND (IDCONJUNTO = ' + FcdsBem.FieldbyName('IDCONJUNTO').AsString + ')');
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código do CONJUNTO do bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
         nLocalizacao := _cds.FieldByName('IDLOCALIZACAO').AsFloat;
         nResponsavel := _cds.FieldByName('IDRESPONSAVEL').AsFloat;
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('IDGRUPO').IsNull then
      begin
         MessageInfo := CMTranslate('Código do GRUPO CONTÁBIL do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT G.IDGRUPO, G.NOME, G.FLGSEMPLACA '+
                                    ' FROM PLANOGRUPO PG, '+
                                    '      GRUPO G '+
                                    ' WHERE (PG.IDPESSOA = ' + FcdsBem.FieldbyName('IDPESSOA').AsString + ')' +
                                    '   AND (PG.IDGRUPO  = ' + FcdsBem.FieldbyName('IDGRUPO').AsString + ')'  +
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
      if FcdsBem.FieldbyName('IDCLASSEBEM').IsNull then
      begin
         MessageInfo := CMTranslate('Código da CLASSE do bem inválido!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDCLASSEBEM ' +
                                    ' FROM CLASSEDEBEM ' +
                                    ' WHERE (IDCLASSEBEM = ' + FcdsBem.FieldbyName('IDCLASSEBEM').AsString + ')') ;
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código de CLASSE de bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if not FcdsBem.FieldbyName('CODSUBCONTA').IsNull then
      begin
         _cds.Data := GetDataPacket(' SELECT CODSUBCONTA ' +
                                    ' FROM SUBCONTA ' +
                                    ' WHERE (CODSUBCONTA = ' + FcdsBem.FieldbyName('CODSUBCONTA').AsString + ')' +
                                    '   AND (IDPESSOA = ' + FcdsBem.FieldbyName('IDPESSOA').AsString + ')' );
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código de SUBCONTA de bem inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if (not FcdsBem.FieldbyName('IDFORNSERV').IsNull) and (FcdsBem.FieldbyName('IDFORNSERV').AsInteger <> 0) then
      begin
         _cds.Data := GetDataPacket(' SELECT NOME '+
                                    ' FROM PESSOA '+
                                    ' WHERE (IDPESSOA = ' + FcdsBem.FieldbyName('IDFORNSERV').AsString + ')' );
         if _cds.isEmpty then
         begin
            MessageInfo := CMTranslate('Código do FORNECEDOR Inválido ou não cadastrado!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('PLACA').IsNull then
      begin
         if iFlgSemPlaca = 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer o Número de TOMBAMENTO do bem!');
            Raise Exception.Create(MessageInfo);
         end;
      end else
      begin
         if not Bem.PlacaUnica(FcdsBem.FieldbyName('IDPESSOA').AsFloat,
                               FcdsBem.FieldbyName('PLACA').AsString) then
         begin
            MessageInfo := CMTranslate('Número da PLACA DE TOMBAMENTO já alocado a outro bem!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('IDSITUACAO').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a ID da SITUAÇÃO FÍSICA do bem!');
         Raise Exception.Create(MessageInfo);
      end else
      begin
         _cds.Data := GetDataPacket(' SELECT IDSITUACAO ' +
                                    ' FROM SITUACAO ' +
                                    ' WHERE (IDSITUACAO = ' + FcdsBem.FieldbyName('IDSITUACAO').AsString + ')' );
         if _cds.IsEmpty then
         begin
            MessageInfo := CMTranslate('Código da SITUAÇÃO FÍSICA de bem inexistente ou inválido!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('DESBEM').IsNull then
      begin
         MessageInfo := CMTranslate('É obrigatório fornecer a DESCRIÇÃO do bem!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('FLGBEMINTCONTAB').AsInteger = 1 then
      begin
         if FcdsBem.FieldbyName('DTACONTAB').IsNull then
         begin
            MessageInfo := CMTranslate('A data do registro do custo de entrada do bem na contabilidade deve ser informada!');
            Raise Exception.Create(MessageInfo);
         end;
      end;
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldbyName('UNIDNEGOC').IsNull then
      begin
         FcdsBem.Edit;
         FcdsBem.FieldbyName('UNIDNEGOC').AsFloat := ParamCAF.ATIVPROJETO;
         FcdsBem.Post;
      end;
      //----------------------------------------------------------------------------------
      // Verificar se o valor de aquisição em moeda corrente foi informado
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldByName('VALHISTORICO').IsNull or (FcdsBem.FieldByName('VALHISTORICO').AsFloat = 0) then
      begin
         MessageInfo := CMTranslate('O valor de entrada do bem deve ser informado!');
         Raise Exception.Create(MessageInfo);
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
      CdsToDbObject(FcdsBem,_dbBem);
      if not _dbBem.InsertAs(FcdsBem.FieldByName('IDBEM').AsFloat) then
         Raise Exception.Create(_dbBem.MessageInfo);

// Felipe de Oliveira Sol 139681 ktn 864893 - Início
        dDataVigencia := Now;
       //Cria registros na tabela PLANOPATROXBEM
        cdsPlanoPatro.First;
        while not cdsPlanoPatro.Eof do
        begin
          sSql := 'INSERT INTO PLANOPATROXBEM (IDPLANOPREV, IDPATRO, IDBEM, IDPESSOA, PPBPERCRATEIO) ' + #13 +
                  'VALUES (' + cdsPlanoPatro.FieldByName('IDPLANOPREV').asString + ', ' + #13 +
                               cdsPlanoPatro.FieldByName('IDPATRO').asString + ', ' + #13 +
                               _dbBem.FieldByName('IDBEM').AsString + ', ' + #13 +
                               IntToStr(Sistema.IdEmpresa) + ', '+ #13 +
                               ComunsImobiliario.TrocaVirgPPto(cdsPlanoPatro.FieldByName('PPIPERCENTRATEIO').asString )+ ')';
          if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
            raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXBEM');

          sSql := 'INSERT INTO PLANOPATROXVIGENCIABEM(IDPLANOPATROXVIGENCIABEM, IDBEM, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO, IDPESSOA) ' + #13 +
                   'VALUES (' + IntToStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIABEM')) + ', ' + #13
                              + _dbBem.FieldByName('IDBEM').asString + ', ' + #13
                              + 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVigencia)) + ', ''DD/MM/YYYY''), ' + #13 //DateTimeToStr( dDataVigencia))
                              + cdsPlanoPatro.FieldByName('IDPLANOPREV').asString + ', ' + #13
                              + cdsPlanoPatro.FieldByName('IDPATRO').asString + ', ' + #13
                              + QuotedStr(cdsPlanoPatro.FieldByName('PPIPERCENTRATEIO').asString) + ' ,' + #13
                              + IntToStr(Sistema.IdEmpresa) + ')';
          if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
              raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXVIGENCIABEM');
          cdsPlanoPatro.Next;
        end;

// Felipe de Oliveira Sol 139681 ktn 864893 - Fim
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
      // Registra a entrada na contabilidade
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         //-------------------------------------------------------------------------------
         // Alimenta o DataSet que irá acumular a planilha contábil para a integração
         //-------------------------------------------------------------------------------
         //if not CafxContab.ContabilizaEncerraObra(nModulo, nEmpresaProp,
         if not ImobCafxContab.ContabilizaEncerraObra(nModulo, nEmpresaProp,
                                                  _dbBem.IDBEM.AsFloat, nConjunto,
                                                  nGrupoObra, nGrupo,
                                                  sGrupoObra, sGrupo,
                                                  iExercicio, iPeriodo,
                                                  dDataInclusao, nValOrg,
                                                  Fcds.FieldByName('DESCCAFOBRA').AsString,
                                                  sDescBem, nAtivProjeto, nSubConta,
                                                  nPlaca, bCtaxCCusto) then
            //Raise Exception.Create(CafxContab.MessageInfo);
            Raise Exception.Create(ImobCafxContab.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Registra na tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                01,                            // IDTIPOMOVIMENTACAO
                                                _dbBem.DTAINCLUSAO.AsDatetime, // DATAMOVIMENTACAO
                                                -1,                            // IDREAVALACRESC
                                                -1,                            // DATAULTDEP
                                                -1,                            // IDGRUPANT
                                                -1,                            // IDCONJANT
                                                -1,                            // IDLOCALANT
                                                -1,                            // IDRESPANT
                                                -1,                            // PLACAANT
                                                -1,                            // PLNCODIGO
                                                '',                            // OBSREAVAL
                                                0,                             // TIPDEPPRORATA
                                                -1,                            // IDTIPODESPESA
                                                '',                            // OBSACRESCIMO
                                                -1,                            // IDMOTIVOBAIXA
                                                0,                             // PROPBAIXA
                                                0,                             // VALVENDAOFI
                                                '',                            // OBSBAIXA
                                                nCafObra);                     // IDCAFOBRA
      if nSeqHist = -1 then
         Raise Exception.Create(MessageInfo);
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
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o saldo contábil
         //-------------------------------------------------------------------------------
         iFlgPai := 1;
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            if FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
            begin
               if not Bem.AtualizaSaldoContabBem(_dbBem.IDPESSOA.AsInteger,
                                                 _dbBem.IDBEM.AsInteger,
                                                 _dbBem.DTAINCLUSAO.AsDateTime,
                                                 FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                 FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                 FcdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 _dbBem.IDGRUPO.AsInteger,
                                                 Trunc(nLocalizacao),
                                                 Trunc(nResponsavel),
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
      // Registra o ID do bem criado no CDS de origem para uso do InvestImob
      //----------------------------------------------------------------------------------
      FcdsCafObraEncerrar.Edit;
      FcdsCafObraEncerrar.FieldByName('IDBEM').AsInteger := _dbBem.IDBEM.AsInteger;
      FcdsCafObraEncerrar.Post;
      //----------------------------------------------------------------------------------

      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
// Função que executa o Encerramento de uma Obra com a entrada de um bem no Ativo Fixo
// para cada grupo acumulado
//----------------------------------------------------------------------------------------
function TCtrlImobObra.EstornaEncerramentoObra(nModulo, nEmpresaProp, nUsuario, nCafObra : Extended;
                                              dDataEncerramento : TDateTime) : boolean;
var
   bIntegraContab              : Boolean;
   iExercicio, iPeriodo        : Integer;
   sSql                        : String;
   bInTransacao                : boolean;    // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;    // Vando - SOL 154328-5901 / KTN 1373449

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaEncerramentoObra(nModulo, nEmpresaProp, nUsuario, nCafObra,
                                                             dDataEncerramento, Fcds.Data,
                                                             FcdsCafObraEncerrar.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
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
         //bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         bIntegraContab := ImobCafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //if not CafxContab.VerificaPeriodoContabil(nEmpresaProp, dDataEncerramento,
            if not ImobCafxContab.VerificaPeriodoContabil(nEmpresaProp, dDataEncerramento,
                                                      iExercicio, iPeriodo) then
               //Raise Exception.Create(CafxContab.MessageInfo);
               Raise Exception.Create(ImobCafxContab.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Estorna o Lançamento Contábil
         //-------------------------------------------------------------------------------
         sSql := ' SELECT DISTINCT PLNCODIGO, IDMOVIMENTACAO' +
                 ' FROM HISTORICOMOVIMENTACAO '+
                 ' WHERE IDCAFOBRA = ' + floattostr(nCafObra) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         // Estorna as planilhas do encerramento de obra
         //-------------------------------------------------------------------------------
         while not _cds.eof do
         begin
            if not _cds.FieldByName('PLNCODIGO').IsNull then
            begin
               //-------------------------------------------------------------------------
               // Remove o Link com a Planilha Contabil
               //-------------------------------------------------------------------------
               sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                       ' SET PLNCODIGO = NULL ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               //if not CafxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               if not ImobCafxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               begin
                  //if not CafxContab.LancaContab.EstornaLancaContab(nUsuario,
                  if not ImobCafxContab.LancaContab.EstornaLancaContab(nUsuario,
                                                                   _cds.FieldbyName('PLNCODIGO').AsFloat,
                                                                   nModulo, nEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataEncerramento)) then
                  begin
                     //Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + CafxContab.MessageInfo);
                     Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + ImobCafxContab.MessageInfo);
                  end;
               end else
               begin
                  //if not CafxContab.LancaContab.ExcluiLancaContab(nUsuario, _cds.FieldbyName('PLNCODIGO').AsFloat,
                  if not ImobCafxContab.LancaContab.ExcluiLancaContab(nUsuario, _cds.FieldbyName('PLNCODIGO').AsFloat,
                                                                  nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                  begin
                     //Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + CafxContab.MessageInfo);
                     Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + ImobCafxContab.MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         // Estorna os bens do cadastro
         //-------------------------------------------------------------------------------
         FcdsCafObraEncerrar.First;
         while not FcdsCafObraEncerrar.EOF do
         begin
            //----------------------------------------------------------------------------
            // Remove o Link de HistMovBem com CafObra
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                    ' SET IDCAFOBRA = NULL ' +
                    ' WHERE IDBEM = ' + FcdsCafObraEncerrar.FieldByName('IDBEM').AsString +
                    '   AND IDTIPOMOVIMENTACAO = 01 ' +
                    '   AND IDPESSOA = ' + FcdsCafObraEncerrar.FieldByName('IDPESSOA').AsString;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);

            //Fazer exclusao nas tabelas PLANOPATROXBEM e PLANOPATROXVIGENCIABEM
            //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Início
            // Troca da tabela HSTPERCSEGREGABEM pela PLANOPATROXVIGENCIABEM
            sSql := 'DELETE FROM PLANOPATROXVIGENCIABEM WHERE IDBEM = ' + FcdsCafObraEncerrar.FieldByName('IDBEM').AsString;
            if Not ExecSQL(sSQL, True) then
              raise Exception.Create(MessageInfo);
            //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Fim

            sSql := 'DELETE FROM PLANOPATROXBEM WHERE IDBEM = ' + FcdsCafObraEncerrar.FieldByName('IDBEM').AsString;
            if Not ExecSQL(sSQL, True) then
              raise Exception.Create(MessageInfo);

            //----------------------------------------------------------------------------
            // Estorna a entrada do bem
            //----------------------------------------------------------------------------
            if not Bem.EstornaEntrada(Trunc(nModulo), Trunc(nEmpresaProp), Trunc(nUsuario),
                                      FcdsCafObraEncerrar.FieldByName('IDBEM').AsInteger,
                                      Fcds.FieldByName('DTAENCERRAOBRA').AsDateTime,
                                      Fcds.FieldByName('DTAENCERRAOBRA').AsDateTime, 2) then
               Raise Exception.Create(Bem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsCafObraEncerrar.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Obra como aberta
         //-------------------------------------------------------------------------------
         if not RegistraEncerraObra(nEmpresaProp, nCafObra, -1, 0) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
            if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
               RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa o Desmembramento de uma Obra
//----------------------------------------------------------------------------------------
function TCtrlImobObra.ExecutaDesmembraObra(nModulo, nEmpresaProp, nCafObra : Extended;
                                           dDataMov : TDateTime; nSomaLanc : Extended) : Boolean;
var
   sSql                        : String;
   nCafObraNova, nSomaProp,
   nSumLancObra, nMaxLancObra,
   nLancValOfi, nMaxProcObra,
   nObraLanc, nTotal           : Extended;
   bMaxLancObra                : Boolean;
   cSeparador                  : Char;
   aAjObraLanc, aAjValLanc     : Array of Extended;
   iAjInd, iAux                : Integer;
   bInTransacao                : boolean;     // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;     // Vando - SOL 154328-5901 / KTN 1373449

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaDesmembraObra(nModulo, nEmpresaProp, nCafObra,
                                                          dDataMov, nSomaLanc,
                                                          Fcds.Data,
                                                          FcdsObraFilhos.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bInTransacao then     // Vando - SOL 154328-5901 / KTN 1373449
            StartTransaction;
         //-------------------------------------------------------------------------------
         // Verifica se a data do desmembramento não está anterior ao último lançamento
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DTALANCAMENTO) AS DTAULTLANC ' +
                 ' FROM CAFOBRALANC ' +
                 ' WHERE IDCAFOBRA = ' + floattostr(nCafObra) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if dDataMov < _cds.FieldByName('DTAULTLANC').AsDateTime then
            raise Exception.Create(CMTranslate('A data do desmembramento não pode ser anterior ao último lançamento ')+
                                   CMTranslate('realizado na obra (')+_cds.FieldByName('DTAULTLANC').AsString+')!');
         //-------------------------------------------------------------------------------
         // Verifica se a soma das proporções é igual a 100%
         //-------------------------------------------------------------------------------
         nSomaProp := 0;
         FcdsObraFilhos.First;
         while not FcdsObraFilhos.Eof do
         begin
            if FcdsObraFilhos.FieldByName('TIPOPROPORCAO').AsInteger = 0 then
               nSomaProp := nSomaProp + FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat
            else
               nSomaProp := nSomaProp + ((FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat / nSomaLanc) * 100);
            FcdsObraFilhos.Next;
         end;
         if nSomaProp <> 100 then
            raise Exception.Create(CMTranslate('A soma das proporções (')+formatfloat('#0.00',nSomaProp)+CMTranslate(') está diferente de 100% !'));
         //===============================================================================
         // EXECUTA A GERACAO DAS NOVAS OBRAS
         //===============================================================================
         if nModulo <= 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer o código do MÓDULO!');
            Raise Exception.Create(MessageInfo);
         end else
         begin
            if nModulo <> Fcds.FieldByName('IDMODULO').asInteger then
            begin
               MessageInfo := CMTranslate('Somente o módulo que cadastrou a Obra pode desmembrá-la');
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Carga do Rateio de Custos da Obra Pai
         //-------------------------------------------------------------------------------
         FcdsCafObraRateio.Data := ListaCafObraRateio(nEmpresaProp, nCafObra);
         if FcdsCafObraRateio.IsEmpty then
            raise Exception.Create(CMTranslate('Erro ao acessar os dados do rateio de custo da obra que será desmembrada!'));
         //-------------------------------------------------------------------------------
         // Carga dos Lançamentos por Grupo
         //-------------------------------------------------------------------------------
         cdsGrpLancObra.Data := ListaGrpLancObra(nEmpresaProp, nCafObra);
         //-------------------------------------------------------------------------------
         FcdsObraFilhos.First;
         nMaxProcObra := -1;
         iAjInd := 0;
         while not FcdsObraFilhos.Eof do
         begin
            //----------------------------------------------------------------------------
            // Registra o Cabeçalho da Obra
            //----------------------------------------------------------------------------
            nCafObraNova := RegistraCafObra(Fcds.FieldByName('IDPESSOA').AsFloat,
                                            Fcds.FieldByName('IDMODULO').AsFloat,
                                            FcdsObraFilhos.FieldByName('DESCCAFOBRA').AsString,
                                            dDataMov, -1, 0,
                                            Fcds.FieldByName('IDIMOVEL').AsFloat,
                                            Fcds.FieldByName('IDTIPOCUSTORECIMO').AsFloat);
            if nCafObraNova = -1 then
               Raise Exception.Create(CMTranslate('Erro na geração da Obra : ')+
                                      FcdsObraFilhos.FieldByName('DESCCAFOBRA').AsString + #13 +
                                      CMTranslate('Causa : ') + MessageInfo);
            //----------------------------------------------------------------------------
            // Registra o Rateio de Custos da Obra
            //----------------------------------------------------------------------------
            FcdsCafObraRateio.First;
            while not FcdsCafObraRateio.EOF do
            begin
               if not RegistraCafObraRateio(FcdsCafObraRateio.FieldByName('IDPESSOA').AsFloat,
                                            nCafObraNova,
                                            FcdsCafObraRateio.FieldByName('CODCENTROCUSTO').AsString,
                                            FcdsCafObraRateio.FieldByName('PARTICIPACAO').AsFloat) then
                  Raise Exception.Create(CMTranslate('Erro na geração do Rateio de Custo da Obra : ')+
                                         FcdsObraFilhos.FieldByName('DESCCAFOBRA').AsString + #13 +
                                         CMTranslate('Causa : ') + MessageInfo);
               //-------------------------------------------------------------------------
               FcdsCafObraRateio.Next;
            end;
            //----------------------------------------------------------------------------
            // Registra os Lançamentos
            //----------------------------------------------------------------------------
            nSumLancObra  := 0;
            nMaxLancObra := 0;
            FcdsGrpLancObra.First;
            while not FcdsGrpLancObra.EOF do
            begin
               //-------------------------------------------------------------------------
               // Calcula o Valor Proporcional
               //-------------------------------------------------------------------------
               if FcdsObraFilhos.FieldByName('TIPOPROPORCAO').AsInteger = 0 then
                  nLancValOfi := FcdsGrpLancObra.FieldByName('SOMAVALOFI').AsFloat * (FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat / 100)
               else
                  nLancValOfi := FcdsGrpLancObra.FieldByName('SOMAVALOFI').AsFloat * (FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat / nSomaLanc);
               nLancValOfi := strtofloat(FormatFloat('#0.00',((nLancValOfi * 100) / 100)));
               //-------------------------------------------------------------------------
               // Seta variável que identifica o maior valor
               //-------------------------------------------------------------------------
               if nLancValOfi > nMaxLancObra then
               begin
                  bMaxLancObra := True;
                  nMaxLancObra := nLancValOfi;
               end else
               begin
                  bMaxLancObra := False;
               end;
               //-------------------------------------------------------------------------
               // Acumula para calcular diferença residual
               //-------------------------------------------------------------------------
               nSumLancObra := Bem.ConvNum(nSumLancObra) + Bem.ConvNum(nLancValOfi);
               //-------------------------------------------------------------------------
               // Registra os Lançamentos
               //-------------------------------------------------------------------------
               nObraLanc := RegistraLancObra(nCafObraNova, nEmpresaProp, nModulo, dDataMov,
                                             FcdsGrpLancObra.FieldByName('IDOBRATIPOETAPA').AsFloat,
                                             nLancValOfi, 0, 0 ,0 , '', '', -1, -1,
                                             FcdsGrpLancObra.FieldByName('IDGRUPO').AsFloat,
                                             FcdsGrpLancObra.FieldByName('CODSUBCONTA').AsFloat,
                                             FcdsGrpLancObra.FieldByName('UNIDNEGOC').AsFloat,
                                             FcdsGrpLancObra.FieldByName('IDFORNECEDOR').AsFloat,
                                             'Lançamento por Desmembramento', 1);
               if nObraLanc = -1 then
                  Raise Exception.Create(CMTranslate('Erro na geração de Lançamento na Obra : ') +
                                         FcdsObraFilhos.FieldByName('DESCCAFOBRA').AsString + #13 +
                                         CMTranslate('Causa : ') + MessageInfo);
               //-------------------------------------------------------------------------
               if bMaxLancObra then
                  nMaxProcObra := nObraLanc;
               //-------------------------------------------------------------------------
               FcdsGrpLancObra.Next;
            end;
            //----------------------------------------------------------------------------
            // Registra o Desmembramento da Obra
            //----------------------------------------------------------------------------
            if not RegistraCafObraDesmemb(nEmpresaProp, nCafObra, nCafObraNova,
                                          FcdsObraFilhos.FieldByName('TIPOPROPORCAO').AsInteger,
                                          FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat) then
               Raise Exception.Create(CMTranslate('Erro no Registro do Desmembramento : ') +
                                      FcdsObraFilhos.FieldByName('DESCCAFOBRA').AsString + #13 +
                                      CMTranslate('Causa : ') + MessageInfo);
            //----------------------------------------------------------------------------
            // Verifica se existe alguma diferença residual na totalização dos lançamentos
            // das novas obras. Se houver, acumular para lançar a diferença no maior
            //----------------------------------------------------------------------------
            if FcdsObraFilhos.FieldByName('TIPOPROPORCAO').AsInteger = 0 then
               nTotal := nSomaLanc * (FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat / 100)
            else
               nTotal := FcdsObraFilhos.FieldByName('PROPORCAO').AsFloat;
            nTotal := strtofloat(FormatFloat('#0.00',((nTotal * 100) / 100)));
            //----------------------------------------------------------------------------
            if nTotal <> nSumLancObra then
            begin
               iAjInd := iAjInd + 1;
               SetLength(aAjObraLanc,iAjInd);
               SetLength(aAjValLanc,iAjInd);
               //-------------------------------------------------------------------------
               aAjObraLanc[iAjInd - 1] := nMaxProcObra;
               if nTotal > nSumLancObra then
                  aAjValLanc[iAjInd - 1]  := strtofloat(formatfloat('#0.00',Bem.ConvNum(nTotal - nSumLancObra)))
               else
                  aAjValLanc[iAjInd - 1]  := strtofloat(formatfloat('#0.00',abs(Bem.ConvNum(nTotal - nSumLancObra)))) * -1;
            end;
            //----------------------------------------------------------------------------
            // Registra no Array de Saída o Id da Obra Gerada
            //----------------------------------------------------------------------------
            FcdsObraFilhos.Edit;
            FcdsObraFilhos.FieldByName('IDOBRARESULT').AsFloat := nCafObraNova;
            FcdsObraFilhos.Post;
            //----------------------------------------------------------------------------
            FcdsObraFilhos.Next
         end;
         //-------------------------------------------------------------------------------
         // Executa o Encerramento da Obra desmembrada
         //-------------------------------------------------------------------------------
         if not RegistraEncerraObra(nEmpresaProp, nCafObra, dDataMov, 2) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registro dos Ajustes de Arredondamento
         //-------------------------------------------------------------------------------
         if iAjInd > 0 then
         begin
            cSeparador       := DecimalSeparator;
            DecimalSeparator := '.';
            //----------------------------------------------------------------------------
            for iAux := 0 to (iAjInd - 1) do
            begin
               sSql := ' UPDATE CAFOBRALANC ' +
                       ' SET VALOFI = VALOFI + ' + floattostr(aAjValLanc[iAux]) +
                       ' WHERE IDOBRALANC = ' + floattostr(aAjObraLanc[iAux]);
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            DecimalSeparator := cSeparador;
         end;
         //-------------------------------------------------------------------------------
         if not bInTransacao then     // Vando - SOL 154328-5901 / KTN 1373449
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
            if not bInTransacao then     // Vando - SOL 154328-5901 / KTN 1373449
               RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa o estorno de um Desmembramento de Obra
//----------------------------------------------------------------------------------------
function TCtrlImobObra.EstornaDesmembraObra(nModulo, nEmpresaProp, nCafObra : Extended) : Boolean;
var
   sSql      : String;
   iSomaLanc : Integer;
   bInTransacao  : boolean;    // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;    // Vando - SOL 154328-5901 / KTN 1373449

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaDesmembraObra(nModulo, nEmpresaProp, nCafObra);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela CAFOBRA
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaCafObra(nEmpresaProp, nCafObra);
         if Fcds.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos a Obra estão incorretos!'));
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
         begin
            MessageInfo := CMTranslate('É obrigatório fornecer o código do MÓDULO!');
            Raise Exception.Create(MessageInfo);
         end else
         begin
            if nModulo <> Fcds.FieldByName('IDMODULO').asInteger then
            begin
               MessageInfo := CMTranslate('Somente o módulo que cadastrou a Obra pode manipula-la');
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA da Obra!'))
         else
            if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou a Obra pode manipula-la'));
         //-------------------------------------------------------------------------------
         if Fcds.FieldByName('FLGOBRA').AsInteger <> 2 then
            Raise Exception.Create(CMTranslate('Esta Obra não foi Desmembrada'));
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela CAFOBRADESMEMB
         //-------------------------------------------------------------------------------
         FcdsCafObraDesmemb.Data := ListaCafObraDesmemb(nEmpresaProp, nCafObra);
         if FcdsCafObraDesmemb.IsEmpty then
            Raise Exception.Create(CMTranslate('Esta Obra não foi Desmembrada!'));
         //-------------------------------------------------------------------------------
         // Verifica se já houve lançamentos nas obras geradas
         //-------------------------------------------------------------------------------
         iSomaLanc := 0;
         while not FcdsCafObraDesmemb.EOF do
         begin
            FcdsCafObraLanc.Data := ListaCafObraLanc(nEmpresaProp, FcdsCafObraDesmemb.FieldByName('IDOBRARESULT').AsFloat);
            while not FcdsCafObraLanc.EOF do
            begin
               if FcdsCafObraLanc.FieldByName('FLGDESMEMBOBRA').AsInteger = 0 then
                  iSomaLanc := iSomaLanc + 1;
               FcdsCafObraLanc.Next;
            end;
            FcdsCafObraDesmemb.Next;
         end;
         if iSomaLanc <> 0 then
            Raise Exception.Create(CMTranslate('Já existem lançamentos nas obras geradas!'));
         FcdsCafObraLanc.Close;
         //-------------------------------------------------------------------------------
         // Remove o registro do desmembramento
         //-------------------------------------------------------------------------------
         FcdsCafObraDesmemb.First;
        while not FcdsCafObraDesmemb.EOF do
         begin
            //Helen - SOL:179583 KTN : 1655783 - Inicio
            iHistorico := 0 ;
           if VerificaObraHistoricoMovimentacao( FcdsCafObraDesmemb.FieldByName('IDOBRARESULT').AsFloat) then
           begin
                MsgDlg('Não é possível desfazer desmembramento, existem movimentações posteriores.', 'Aviso', mtWarning, [mbOk], 0);
                RollBack;
                Result := False;
                iHistorico := 1 ;
                Exit;
           end;
           //Helen - SOL:179583 KTN : 1655783 - Fim
            sSql := ' DELETE FROM CAFOBRALANC '+
                    ' WHERE IDCAFOBRA = ' + FcdsCafObraDesmemb.FieldByName('IDOBRARESULT').AsString +
                    '   AND IDPESSOA = ' + FcdsCafObraDesmemb.FieldByName('IDPESSOA').AsString;
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //if not ExecSQL(sSql, True) then
            if not ExecSQL(sSql) then
            //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            begin
               //Helen - SOL:179583 KTN : 1655783 - Add If
               if MessageInfo <> 'A instrução executada não modificou registros no Banco de Dados. Verifique' then
                  Raise Exception.Create(CMTranslate('Não foi possível remover os lançamentos iniciais das obras geradas!') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM CAFOBRARATEIO '+
                    ' WHERE IDCAFOBRA = ' + FcdsCafObraDesmemb.FieldByName('IDOBRARESULT').AsString +
                    '   AND IDPESSOA = ' + FcdsCafObraDesmemb.FieldByName('IDPESSOA').AsString;
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //if not ExecSQL(sSql, True) then
            if not ExecSQL(sSql) then
            //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            begin
               //Helen - SOL:179583 KTN : 1655783 - Add If
               if MessageInfo <> 'A instrução executada não modificou registros no Banco de Dados. Verifique' then
                   Raise Exception.Create(CMTranslate('Não foi possível remover o rateio de custo das obras geradas!') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM CAFOBRA '+
                    ' WHERE IDCAFOBRA = ' + FcdsCafObraDesmemb.FieldByName('IDOBRARESULT').AsString +
                    '   AND IDPESSOA = ' + FcdsCafObraDesmemb.FieldByName('IDPESSOA').AsString;
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //if not ExecSQL(sSql, True) then
            if not ExecSQL(sSql) then
            //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            begin
               //Helen - SOL:179583 KTN : 1655783 - Add If
               if MessageInfo <> 'A instrução executada não modificou registros no Banco de Dados. Verifique' then
                  Raise Exception.Create(CMTranslate('Não foi possível remover as obras geradas!') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsCafObraDesmemb.Next;
         end;
         FcdsCafObraDesmemb.Close;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM CAFOBRADESMEMB '+
                 ' WHERE IDCAFOBRA = ' + floattostr(nCafObra) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //if not ExecSQL(sSql, True) then
            if not ExecSQL(sSql) then
            //Helen - SOL: 179583/9621 KTN 1663624 - Fim
         begin
            //Helen - SOL:179583 KTN : 1655783 - Add If
            if MessageInfo <> 'A instrução executada não modificou registros no Banco de Dados. Verifique' then
               Raise Exception.Create(CMTranslate('Não foi possível remover o registro do desmembramento da obra!') + #13 + MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Obra como aberta
         //-------------------------------------------------------------------------------
         if not RegistraEncerraObra(nEmpresaProp, nCafObra, -1, 0) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
           if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
               RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlImobObra.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

procedure TCtrlImobObra.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxBem := Value;
end;

function TCtrlImobObra.LookupPlanoPatroxImovel(
  iIdImovel: Integer): OLEVariant;
var
  //cdsPlanoPatroxImovel : TCMClientDataSet;
  sSql : string;
begin
  sSql := '';
  //cdsPlanoPatroxImovel := TCMClientDataSet.Create(nil);
  //try
    sSql := 'SELECT IDPLANOPREV, IDPATRO, PPIPERCENTRATEIO, FLGTIPO FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
    Result := GetDataPacket(sSql);
  //finally
  //  FreeAndNil(cdsPlanoPatroxImovel);
  //end;

end;

function TCtrlImobObra.VerificaObraHistoricoMovimentacao(
  iIdCafObra: Double): boolean;
var
  _cds : TClientDataSet;
  sSQL : string;
begin
  Result := True;
  _cds := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDMOVIMENTACAO FROM CM.HISTORICOMOVIMENTACAO WHERE ' +
            '       IDCAFOBRA = ' + FloatToStr(iIdCafObra);
    _cds.Data := GetDataPacket(sSQL);
    if _cds.RecordCount < 1 then
     Result := False;
  finally
    FreeAndNil(_cds);
  end;
end;


function TCtrlImobObra.GravaPlanoPatroxImovel(iIdImovelOrigem, iIdImovelNovo: integer) : boolean;
var
  sSQL : string;
begin
  try
    sSQL := 'SELECT IDPLANOPREV, IDPATRO, PPIPERCENTRATEIO, FLGTIPO ' +
                   '  FROM PLANOPATROXIMOVEL ' +
                   ' WHERE IDIMOVEL = ' + IntToStr(iIdImovelOrigem);
    _cds.Data := GetDataPacket(sSQL);

    while not _cds.Eof do
    begin
      //Cria registros na tabela PLANOPATROXIMOVEL a partir do imovel origem
      sSql := 'INSERT INTO PLANOPATROXIMOVEL ' +
              ' VALUES (' + IntToStr(iIdImovelNovo) + ','
                          + _cds.FieldByName('IDPATRO').asString + ','
                          + _cds.FieldByName('IDPLANOPREV').AsString + ','
                          + ComunsImobiliario.TrocaVirgPPto(_cds.FieldByName('PPIPERCENTRATEIO').asString) + ','
                          + QuotedStr(_cds.FieldByName('FLGTIPO').asString)+ ')';
      if not ExecutarQuery(dtmImobiliario.qryAux,sSql) then
         raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXIMOVEL');

      //Cria registros na tabela PLANOPATROXVIGENCIAIMOB
      sSql := 'INSERT INTO PLANOPATROXVIGENCIAIMOB (IDPLANOPATROXVIGENCIAIMOB, IDIMOVEL, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO, TRGDTINCLUSAO) ' + #13 +
              'VALUES ( ' + InttoStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIAIMOB')) + ', ' + #13
                          + IntToStr(iIdImovelNovo) + ', ' + #13
                          + 'TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', now))+ ', ''DD/MM/YYYY''), ' + #13
                          + _cds.FieldByName('IDPLANOPREV').asString + ', ' + #13
                          + _cds.FieldByName('IDPATRO').AsString + ', ' + #13
                          + QuotedStr(_cds.FieldByName('PPIPERCENTRATEIO').asString) + ', ' + #13
                          + 'TO_DATE(' + QuotedStr(DateTimeToStr(now))+ ', ''DD/MM/YYYY HH24:MI:SS''))';
      if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
        raise Exception.Create('Erro ao atualizar a tabela PLANOPATROXVIGENCIAIMOB');

      _cds.Next;
    end;
    result := true;
  except
    result := false;
  end;

end;

function TCtrlImobObra.AtualizaSegregacaoLancamentos(iIdBem: integer; dData: TDateTime): boolean;
var
 sSQL : string;
begin
  try
     sSQL := 'UPDATE SALDOCONTABBEM S SET S.VALORG = S.VALORG        '+#13+
             ' WHERE S.IDBEM = '+intToStr(iIdBem) +#13+
             '   AND TO_CHAR(S.DATASLDBEM, ''DD/MM/YYYY'')  = '+QuotedStr(DateToStr( dData ))+#13+
             '   AND not exists (SELECT 1 FROM SALDOTOTALPORPLANO ST '+#13+
             '                    WHERE ST.IDBEM = S.IDBEM           '+#13+
             '                      AND ST.DATASLDBEM = S.DATASLDBEM '+#13+
             '                      AND ST.MOECODIGO = S.MOECODIGO)  ';
     if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
        raise Exception.create('Erro ao atualizar Saldo Total por Plano');

     { atualiza a RATEIOVLRHISTMOVBEM caso algum lançamento tenha sido feito na VLRHISTMOVBEM mas não foi segregado }
     sSQL := 'UPDATE VLRHISTMOVBEM V SET V.VALOR = V.VALOR        '+#13+
             ' WHERE exists     (SELECT 1 FROM HISTORICOMOVIMENTACAO H '+#13+
             '                    WHERE H.IDMOVIMENTACAO = V.IDMOVIMENTACAO ' +#13+
             '                      AND H.IDBEM = '+intToStr(iIdBem)+#13+
             '                      AND TO_CHAR(H.DATAMOVIMENTACAO, ''DD/MM/YYYY'')  = '+QuotedStr(DateToStr( dData ))+')'#13+
             '   AND not exists (SELECT 1 FROM RATEIOVLRHISTMOVBEM RT '+#13+
             '                    WHERE RT.IDMOVIMENTACAO = V.IDMOVIMENTACAO )  ';
     if not ExecutaQuery(dtmImobiliario.qryAux, sSql) then
        raise Exception.create('Erro ao atualizar Rateio de Movimentação');

   result := true;
  except
    result := false;
  end;

end;

end.
