unit uCtrlFechamento;

interface

uses DB, uCmDbObject, uCmControlObject, wwStoreP,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes,
     dMTBem,
     uDBBem, uDBBemxMoeda, uDBBemxDep,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uDBSaldoContabBem, uDBSldCtbBemxDep,
     uDBPlanoGrupo,
     uCtrlBem, uCtrlParamCAF, uCtrlConjunto, uCtrlGrupoContab,
     uCtrlHistMovBem, uCtrlCafxContab,
     uDiasUteis;

type
   TCtrlFechamento = class(TCmControlObject)

   protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   private
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
      _dbUpdGrupo          : TDBPlanoGrupo;

      _dbSaldoContabBem   : TDBSaldoContabBem;
      _dbSldCtbBemxDep    : TDBSldCtbBemxDep;

      _dMTBem              : tdtmMTBem;

      Bem                  : TCtrlBem;
      ParamCAF             : TCtrlParamCAF;
      Conjunto             : TCtrlConjunto;
      GrupoContab          : TCtrlGrupoContab;
      HistMovBem           : TCtrlHistMovBem;
      CafxContab           : TCtrlCafxContab;
      DiasUteis            : TDiasUteis;

      FcdsBem,
      FcdsBemxMoeda,
      FcdsBemxDep,
      FcdsReavaliacao,
      FcdsReavalxMoeda,
      FcdsReavalxDep,
      FcdsAcrescimoValor,
      FcdsAcrescValorxMoeda,
      FcdsAcrescValorxDep,
      FcdsUpdGrupo,
      FcdsMovContabBem,
      FcdsSaldoContabBem,
      FcdsSldCtbBemxDep : TClientDataSet;

      iGrupoDeprec,
      iGrupoDepIni,
      iGrupoDepFim,
      iExercicio,
      iPeriodo             : Integer;
      bIntegraContab,
      bCtaxCCusto,
      bFlgPrimBem,
      bUpdDatGrupo         : Boolean;
      aHistMovBem          : Array of Extended;
      iaHistMovBem         : Integer;
      //----------------------------------------------------------------------------------
      // Barra de Progresso
      //----------------------------------------------------------------------------------
      iPrgBarMax : Integer;
      iPrgBarPos : Integer;
      sPrgBarMsg : String;
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
      procedure SetcdsUpdGrupo(const Value: TClientDataSet);
      procedure SetcdsMovContabBem(const Value: TClientDataSet);
      procedure SetcdsSaldoContabBem(const Value: TClientDataSet);
      procedure SetcdsSldCtbBemxDep(const Value: TClientDataSet);
      //----------------------------------------------------------------------------------
      // Funções Privativas
      //----------------------------------------------------------------------------------
      procedure CarregarDadosFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                        dDataMov : tDateTime);
      function ExecutaFechamentoBEM(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                    bSomenteImoveis : Boolean; Const IAppCliente: OleVariant) : boolean;
      function ExecutaFechamentoREAVALIACAO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                            bSomenteImoveis : Boolean; Const IAppCliente: OleVariant) : boolean;
      function ExecutaFechamentoACRESCIMO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                          bSomenteImoveis : Boolean; Const IAppCliente: OleVariant) : boolean;
      function CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime) : Extended;
      function CalculaFatorDepreciacao(iModulo : Integer; dDataMov, dDataAnt, dDataIni : tDateTime;
                                       bSomenteImoveis : Boolean) : Extended;
      function DataFechamentoAnterior(iModulo, iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                      bSomenteImoveis : boolean) : tDateTime;
      function AtualizaSaldoContabBem(iEmpresaProp, iBem: Integer;
                                      dDataSld: tDateTime; iMoeCodigo, iTaxaDep, iGrupo, iLocalizacao,
                                      iResponsavel, iPai: Integer): Boolean;

   public
      property cdsBem               : TClientDataSet read FcdsBem               write SetcdsBem;
      property cdsBemxMoeda         : TClientDataSet read FcdsBemxMoeda         write SetcdsBemxMoeda;
      property cdsBemxDep           : TClientDataSet read FcdsBemxDep           write SetcdsBemxDep;
      property cdsReavaliacao       : TClientDataSet read FcdsReavaliacao       write SetcdsReavaliacao;
      property cdsReavalxMoeda      : TClientDataSet read FcdsReavalxMoeda      write SetcdsReavalxMoeda;
      property cdsReavalxDep        : TClientDataSet read FcdsReavalxDep        write SetcdsReavalxDep;
      property cdsAcrescimoValor    : TClientDataSet read FcdsAcrescimoValor    write SetcdsAcrescimoValor;
      property cdsAcrescValorxMoeda : TClientDataSet read FcdsAcrescValorxMoeda write SetcdsAcrescValorxMoeda;
      property cdsAcrescValorxDep   : TClientDataSet read FcdsAcrescValorxDep   write SetcdsAcrescValorxDep;
      property cdsUpdGrupo          : TClientDataSet read FcdsUpdGrupo          write SetcdsUpdGrupo;
      property cdsMovContabBem      : TClientDataSet read FcdsMovContabBem      write SetcdsMovContabBem;
      property cdsSaldoContabBem    : TClientDataSet read FcdsSaldoContabBem write SetcdsSaldoContabBem;
      property cdsSldCtbBemxDep     : TClientDataSet read FcdsSldCtbBemxDep write SetcdsSldCtbBemxDep;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Funções Públicas
      //----------------------------------------------------------------------------------
      function UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer) : tDateTime;
      function ProximaDataFechamento(iModulo, iEmpresaProp,
                                     iGrupoDepIni, iGrupoDepFim : Integer;
                                     bSomenteImoveis : boolean) : tDateTime;
      function DataFechamentoOk(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                 dDataMov : TDateTime; bSomenteImoveis : Boolean;
                                 Const IAppCliente: OleVariant) : Boolean;
      function EstornaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                 dDataMov, dDataEst : TDateTime; bSomenteImoveis : Boolean;
                                 Const IAppCliente: OleVariant) : Boolean;
   end;

implementation

{ TCtrlFechamento }

constructor TCtrlFechamento.Create;
begin
   inherited;
   _dbBem                := TDBBem.Create(Self);
   _dbBemxMoeda          := TDBBemxMoeda.Create(Self);
   _dbBemxDep            := TDBBemxDep.Create(Self);
   _dbReavaliacao        := TDBReavaliacao.Create(Self);
   _dbReavalxMoeda       := TDBReavalxMoeda.Create(Self);
   _dbReavalxDep         := TDBReavalxDep.Create(Self);
   _dbAcrescimoValor     := TDBAcrescimoValor.Create(Self);
   _dbAcrescValorxMoeda  := TDBAcrescValorxMoeda.Create(Self);
   _dbAcrescValorxDep    := TDBAcrescValorxDep.Create(Self);
   _dbUpdGrupo           := TDBPlanoGrupo.Create(Self);

   _dbSaldoContabBem := TDBSaldoContabBem.Create(Self);
   _dbSldCtbBemxDep  := TDBSldCtbBemxDep.Create(Self);

   _dMTBem               := tdtmMTBem.Create(Self);

   FcdsBem               := TClientDataSet.Create(nil);
   FcdsBemxMoeda         := TClientDataSet.Create(nil);
   FcdsBemxDep           := TClientDataSet.Create(nil);
   FcdsReavaliacao       := TClientDataSet.Create(nil);
   FcdsReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsReavalxDep        := TClientDataSet.Create(nil);
   FcdsAcrescimoValor    := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep   := TClientDataSet.Create(nil);
   FcdsUpdGrupo          := TClientDataSet.Create(nil);

   Bem                   := TCtrlBem.Create;
   ParamCAF              := TCtrlParamCAF.Create;
   Conjunto              := TCtrlConjunto.Create;
   HistMovBem            := TCtrlHistMovBem.Create;
   CafxContab            := TCtrlCafxContab.Create;
   GrupoContab           := TCtrlGrupoContab.Create;
   DiasUteis             := TDiasUteis.Create;
end;

destructor TCtrlFechamento.Destroy;
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
   FcdsUpdGrupo.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbReavaliacao.Free;
   _dbReavalxMoeda.Free;
   _dbReavalxDep.Free;
   _dbAcrescimoValor.Free;
   _dbAcrescValorxMoeda.Free;
   _dbAcrescValorxDep.Free;
   _dbUpdGrupo.Free;

   _dbSaldoContabBem.Free;
   _dbSldCtbBemxDep.Free;

   _dMTBem.Free;

   Bem.Free;
   ParamCAF.Free;
   Conjunto.Free;
   HistMovBem.Free;
   CafxContab.Free;
   GrupoContab.Free;
   DiasUteis.Free;

   inherited;
end;

procedure TCtrlFechamento.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
end;

procedure TCtrlFechamento.DoChangeDataBase;
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
   _dbUpdGrupo.DataBaseName := DataBaseName;
end;

procedure TCtrlFechamento.SetcdsBem(const Value: TClientDataSet);
begin
   FcdsBem := Value;
end;

procedure TCtrlFechamento.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

procedure TCtrlFechamento.SetcdsBemxDep(const Value: TClientDataSet);
begin
   FcdsBemxDep := Value;
end;

procedure TCtrlFechamento.SetcdsReavaliacao(const Value: TClientDataSet);
begin
   FcdsReavaliacao := Value;
end;

procedure TCtrlFechamento.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
   FcdsReavalxMoeda := Value;
end;

procedure TCtrlFechamento.SetcdsReavalxDep(const Value: TClientDataSet);
begin
   FcdsReavalxDep := Value;
end;

procedure TCtrlFechamento.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
   FcdsAcrescimoValor := Value;
end;

procedure TCtrlFechamento.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
   FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlFechamento.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
   FcdsAcrescValorxDep := Value;
end;

procedure TCtrlFechamento.SetcdsUpdGrupo(const Value: TClientDataSet);
begin
   FcdsUpdGrupo := Value;
end;

procedure TCtrlFechamento.SetcdsMovContabBem(const Value: TClientDataSet);
begin
   FcdsMovContabBem := Value;
end;

procedure TCtrlFechamento.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
   FcdsSaldoContabBem := Value;
end;

procedure TCtrlFechamento.SetcdsSldCtbBemxDep(const Value: TClientDataSet);
begin
   FcdsSldCtbBemxDep := Value;
end;
//========================================================================================
// Carga dos CDS para a execução do Fechamento
//========================================================================================
procedure TCtrlFechamento.CarregarDadosFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                                   dDataMov : tDateTime);
begin
   _dMTBem.sqlFechamentoBem.Prepare;
   _dMTBem.sqlFechamentoBem.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
   _dMTBem.sqlFechamentoBem.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   _dMTBem.sqlFechamentoBem.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   _dMTBem.sqlFechamentoBem.ParamByName('PDATAMOV').AsDateTime     := dDataMov;
   FcdsBem.Data := _dMTBem.sqlFechamentoBem.Data;
   _dMTBem.sqlFechamentoReavaliacao.Prepare;
   _dMTBem.sqlFechamentoReavaliacao.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
   _dMTBem.sqlFechamentoReavaliacao.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   _dMTBem.sqlFechamentoReavaliacao.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   _dMTBem.sqlFechamentoReavaliacao.ParamByName('PDATAMOV').AsDateTime     := dDataMov;
   FcdsReavaliacao.Data := _dMTBem.sqlFechamentoReavaliacao.Data;
   _dMTBem.sqlFechamentoAcrescimoValor.Prepare;
   _dMTBem.sqlFechamentoAcrescimoValor.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
   _dMTBem.sqlFechamentoAcrescimoValor.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   _dMTBem.sqlFechamentoAcrescimoValor.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   _dMTBem.sqlFechamentoAcrescimoValor.ParamByName('PDATAMOV').AsDateTime     := dDataMov;
   FcdsAcrescimoValor.Data := _dMTBem.sqlFechamentoAcrescimoValor.Data;
   //-------------------------------------------------------------------------------------
   FcdsUpdGrupo.Data := GrupoContab.ListaPlanoGrupo(iEmpresaProp);
end;
//========================================================================================
// Função que executa o fechamento de um periodo do CAF, executando a depreciação e
// a correção monetária dos bens.
//----------------------------------------------------------------------------------------
function TCtrlFechamento.ExecutaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                           dDataMov : tDateTime; bSomenteImoveis : Boolean;
                                           Const IAppCliente: OleVariant) : Boolean;
var
   iHistMovBem : Integer;
   dDataUltDep : tDateTime;
   nPlanilha   : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaFechamento(iModulo, iEmpresaProp, iUsuario,
                                                       dDataMov, bSomenteImoveis, IAppCliente);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresaProp) then
         begin
            MessageInfo := 'Parâmetros do sistema inválidos!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CafxContab.IntegraContab(iEmpresaProp, iModulo);
         iaHistMovBem := 0;
         //-------------------------------------------------------------------------------
         // Posiciona os flags de filtragem de bens administrados pelo sistema CAF ou
         // InvestImob
         //-------------------------------------------------------------------------------
         if iModulo = 7 then
         begin
            if copy(ParamCAF.SISTEMAS, 4, 1) <> '1' then
            begin
               iGrupoDeprec := 2;
            end else
            begin
               if bSomenteImoveis then
                  iGrupoDeprec := 1
               else
                  iGrupoDeprec := 0;
            end;
         end else
         begin
            iGrupoDeprec := 1;
         end;
         //-------------------------------------------------------------------------------
         case iGrupoDeprec of
            0 : begin
                   iGrupoDepIni := 0;
                   iGrupoDepFim := 0;
                end;
            1 : begin
                   iGrupoDepIni := 1;
                   iGrupoDepFim := 1;
                end;
            2 : begin
                   iGrupoDepIni := 0;
                   iGrupoDepFim := 1;
                end;
            else
                begin
                   iGrupoDepIni := 2;
                   iGrupoDepFim := 2;
                end;
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data de fechamento está correta
         //-------------------------------------------------------------------------------
         if not DataFechamentoOk(iEmpresaProp, iGrupoDepIni, iGrupoDepFim, dDataMov, dDataUltDep) then
         begin
            MessageInfo := 'Data Anterior ao Último Fechamento Realizado ! ' + DatetoStr(dDataUltDep);
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data do fechamento pode ser usada para contabilização
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            if not CafxContab.VerificaPeriodoContabil(iEmpresaProp, dDataMov,
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
            if not CAFxContab.MontaParamCAFxContab(iEmpresaProp, ParamCAF.PLANOVIGENTE) then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Lê a Dependencia da Conta Contábil do Centro de Custo
            //----------------------------------------------------------------------------
            bCtaxCCusto := (ParamCAF.FLGCTADEPREC = 1);
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := 'Preparando...';
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         CarregarDadosFechamento(iEmpresaProp,iGrupoDepIni,iGrupoDepFim,dDataMov);
         //-------------------------------------------------------------------------------
         // Calcula a depreciação dos três componentes do saldo contábil dos bens
         //-------------------------------------------------------------------------------
         if not ExecutaFechamentoBEM(iModulo, iEmpresaProp, dDataMov, bSomenteImoveis, IAppCliente) then
            Raise Exception.Create(MessageInfo);

         if not ExecutaFechamentoREAVALIACAO(iModulo, iEmpresaProp, dDataMov, bSomenteImoveis, IAppCliente) then
            Raise Exception.Create(MessageInfo);

         if not ExecutaFechamentoACRESCIMO(iModulo, iEmpresaProp, dDataMov, bSomenteImoveis, IAppCliente) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := 'Registrando a Planilha Contábil...';
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
            except

            end;
            //----------------------------------------------------------------------------
            nPlanilha := CafxContab.RegistraPlanilhaContabil(iModulo,
                                                             iEmpresaProp,
                                                             iUsuario,
                                                             datetostr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra na tabela HISTORICOMOVIMENTACAO a planilha gerada
            //----------------------------------------------------------------------------
            for iHistMovBem := 0 to (iaHistMovBem - 1) do
            begin
               if not HistMovBem.RegistraPlanHistMovBem(aHistMovBem[iHistMovBem],nPlanilha) then
               begin
                  MessageInfo := HistMovBem.MessageInfo + #13 +
                                 ' Indice ' + IntToStr(iHistMovBem) +
                                 ' Movimento ' + FloattoStr(aHistMovBem[iHistMovBem]);
                  Raise Exception.Create(MessageInfo);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := 'Finalizando...';
            iPrgBarPos := 1;
            iPrgBarMax := 1;
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que retorna a data do último fechamento
//----------------------------------------------------------------------------------------
function TCtrlFechamento.UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer) : tDateTime;
Var
   sSql : String;

begin
   sSql := ' SELECT MAX(PG.DATAULTFEC) AS DATAMOVIMENTACAO '+ #13 +
           ' FROM GRUPO G, '+ #13 +
           '      PLANOGRUPO PG '+ #13 +
           ' WHERE ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + '))' + #13 +
           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' + #13 +
           '   AND (G.TIPO = ''A'') ' + #13 +
           '   AND (PG.DATAULTFEC IS NOT NULL) ' + #13 +
           '   AND (PG.IDGRUPO  = G.IDGRUPO) ' + #13;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if not _cds.IsEmpty then
      Result := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime
   else
      Result := -1;
end;
//========================================================================================
// Função que retorna a data do próximo fechamento
//----------------------------------------------------------------------------------------
function TCtrlFechamento.ProximaDataFechamento(iModulo, iEmpresaProp,
                                               iGrupoDepIni, iGrupoDepFim : Integer;
                                               bSomenteImoveis : boolean) : tDateTime;
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;
   dDataUltMov                : TDateTime;

begin
   ParamCAF.CarregaProp(iEmpresaProp);
   //-------------------------------------------------------------------------------------
   dDataUltMov := UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim);
   //-------------------------------------------------------------------------------------
   if dDataUltMov <> -1 then
   begin
      if (iModulo = 7) or (((iModulo <> 7) or bSomenteImoveis) and (ParamCAF.FLGDIARIO <> 'S')) then
      begin
         //-------------------------------------------------------------------------------
         // Calculo Anual
         //-------------------------------------------------------------------------------
         if ParamCAF.FLGTIPOCALC = 'A' then
         begin
            DecodeDate(dDataUltMov, iAno, iMes, iDia);
            iAnoFim := iAno + 1;
            iMesFim := 12;
            iDiaFim := 31;
         end else
         //-------------------------------------------------------------------------------
         // Calculo Mensal
         //-------------------------------------------------------------------------------
         if ParamCAF.FLGTIPOCALC = 'M' then
         begin
            DecodeDate(dDataUltMov + 28, iAno, iMes, iDia);
            DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
         end else
         //-------------------------------------------------------------------------------
         // Calculo Diário
         //-------------------------------------------------------------------------------
         if ParamCAF.FLGTIPOCALC = 'D' then
         begin
            DecodeDate(dDataUltMov + 1, iAnoFim, iMesFim, iDiaFim);
         end;
      end else
      begin
         DecodeDate(dDataUltMov + 1, iAnoFim, iMesFim, iDiaFim);
      end;
   end else
   begin
      DecodeDate(date(), iAno, iMes, iDia);
      DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   end;
   //-------------------------------------------------------------------------------------
   Result := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
// Função que retorna a data do fechamento anterior
//----------------------------------------------------------------------------------------
function TCtrlFechamento.DataFechamentoAnterior(iModulo, iEmpresaProp,
                                                iGrupoDepIni, iGrupoDepFim : Integer;
                                                bSomenteImoveis : boolean) : tDateTime;
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;
   dDataUltMov                : TDateTime;

begin
   ParamCAF.CarregaProp(iEmpresaProp);
   //-------------------------------------------------------------------------------------
   dDataUltMov := UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim);
   //-------------------------------------------------------------------------------------
   if dDataUltMov <> -1 then
   begin
      if (iModulo = 7) or (((iModulo <> 7) or bSomenteImoveis) and (ParamCAF.FLGDIARIO <> 'S')) then
      begin
         //-------------------------------------------------------------------------------
         // Calculo Anual
         //-------------------------------------------------------------------------------
         if ParamCAF.FLGTIPOCALC = 'A' then
         begin
            DecodeDate(dDataUltMov, iAno, iMes, iDia);
            iAnoFim := iAno - 1;
            iMesFim := 12;
            iDiaFim := 31;
         end else
         //-------------------------------------------------------------------------------
         // Calculo Mensal
         //-------------------------------------------------------------------------------
         if ParamCAF.FLGTIPOCALC = 'M' then
         begin
            DecodeDate(dDataUltMov - 31, iAno, iMes, iDia);
            DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
         end else
         //-------------------------------------------------------------------------------
         // Calculo Diário
         //-------------------------------------------------------------------------------
         if ParamCAF.FLGTIPOCALC = 'D' then
         begin
            DecodeDate(dDataUltMov - 1, iAnoFim, iMesFim, iDiaFim);
         end;
      end else
      begin
         DecodeDate(dDataUltMov - 1, iAnoFim, iMesFim, iDiaFim);
      end;
   end else
   begin
      DecodeDate(date(), iAno, iMes, iDia);
      DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   end;
   //-------------------------------------------------------------------------------------
   Result := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
// Função que verifica se a data fornecida e a certa para periodo em uso.
//----------------------------------------------------------------------------------------
function TCtrlFechamento.DataFechamentoOk(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                          dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
Var
   dDataUltMov : TDateTime;

begin
   dDataUltMov := UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim);
   //-------------------------------------------------------------------------------------
   if dDataUltMov <> -1 then
   begin
      dDataUlt := dDataMov;
      Result := True;
   end else
   begin
      dDataUlt := dDataUltMov;
      Result := dDataUltMov < dDataMov;
   end;
end;
//========================================================================================
function TCtrlFechamento.CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime) : Extended;
var
   nValAtual, nValAnt : Extended;

begin
   if ParamCAF.FLGCALCCM = 1 then // Sistema parametrizado para calcular C.M.
   begin
      nValAnt   := Bem.CotacaoMoeda(ParamCAF.MOEDAFISCAL,dDataAnt);
      nValAtual := Bem.CotacaoMoeda(ParamCAF.MOEDAFISCAL,dDataMov);
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
function TCtrlFechamento.CalculaFatorDepreciacao(iModulo : Integer;
                                                 dDataMov, dDataAnt, dDataIni : tDateTime;
                                                 bSomenteImoveis : Boolean) : Extended;
var
   iMesIni,iAnoIni,iDiaIni,
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno,iNDias,
   iMesInit,iAnoInit,iDiaInit,
   iDayInc                    : Word;
   sAnoIni,sAnoFim            : String;
   dDataInit                  : tDateTime;
   nTotDia, nTotDiaAno        : Extended;

begin
   if dDataAnt = dDataIni then
      iDayInc := 1
   else
      iDayInc := 0;
   //-------------------------------------------------------------------------------------
   DecodeDate(dDataAnt, iAnoIni, iMesIni, iDiaIni);
   DecodeDate(dDataMov, iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   // Calculo do Fator Temporal baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if (iModulo = 7) or
      (((iModulo <> 7) or bSomenteImoveis) and (ParamCAF.FLGDIARIO <> 'S')) then
   begin
      //----------------------------------------------------------------------------------
      // Calculo Anual
      //----------------------------------------------------------------------------------
      if ParamCAF.FLGTIPOCALC = 'A' then
      begin
         if dDataMov = dDataAnt then
         begin
            Result := 0;
         end else
         begin
            sAnoIni    := '01/01/' + inttostr(iAnoIni);
            sAnoFim    := '31/12/' + inttostr(iAnoIni);
            nTotDia    := (dDataMov - dDataAnt) + iDayInc;
            nTotDiaAno := (strtodate(sAnoFim) - strtodate(sAnoIni)) + iDayInc;
            Result     := (nTotDia / nTotDiaAno);
         end;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Mensal
      //----------------------------------------------------------------------------------
      if ParamCAF.FLGTIPOCALC = 'M' then
      begin
         iNDias := round(dDataMov - dDataAnt) + iDayInc;
         if (dDataMov = dDataAnt) or (dDataAnt = 0) then
         begin
            Result := 0;
         end else
         begin
            if (iMesIni = iMesFim) and (iDiaIni > 01) then
            begin
               DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
               Result := (1 / 12 / iDia) * iNDias;
            end else
            //----------------------------------------------------------------------------
            begin
               dDataInit := dDataMov - 31;
               DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
               DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
               dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
               //-------------------------------------------------------------------------
               if (dDataInit = dDataAnt) or
                  ((iMesIni = iMesFim) and (iDiaIni <> 01)) then
                  Result := (1 / 12)
               else
                  Result := (1 / 12) * (iNDias / 30.4375);
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Diário
      //----------------------------------------------------------------------------------
      begin
         if dDataMov = dDataAnt then
         begin
            Result := 0;
         end else
         begin
            iNDias := round(dDataMov - dDataAnt) + iDayInc;
            Result := iNDias / 365.25;
         end;
      end;
   end else
   //-------------------------------------------------------------------------------------
   // Calculo diário para o INVESTIMOB
   //-------------------------------------------------------------------------------------
   begin
      if dDataMov = dDataAnt then
      begin
         Result := 0;
      end else
      begin
         iNDias := round(dDataMov - dDataAnt) + iDayInc;
         Result := iNDias / 365.25;
      end;
   end;
end;
//========================================================================================
// Função que calcula a depreciação/correção monetária na Tabela BEM
//----------------------------------------------------------------------------------------
function TCtrlFechamento.ExecutaFechamentoBEM(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                              bSomenteImoveis : Boolean; Const IAppCliente: OleVariant) : boolean;
var
   nFatorCM, nFatorDep,
   nValCmBem, nCmBem,
   nSeqHist,
   nValCmDep, nCmDep,
   nValDepLanc, nDepLanc,
   nTaxaDep                 : Extended;
   iFlgPai, iFlgDeprec      : Integer;
   bCalcCM, bCalcDep,
   bCalcCMDEP               : Boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Interface com a Aplicação Cliente (Barra de Progresso)
      //----------------------------------------------------------------------------------
      try
         sPrgBarMsg := 'Iniciando...';
         iPrgBarMax  := FcdsBem.RecordCount;
         iPrgBarPos  := 0;
         IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
      except

      end;
      //----------------------------------------------------------------------------------
      bFlgPrimBem := True;
      while not FcdsBem.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos  := iPrgBarPos + 1;
            sPrgBarMsg := 'Processando Fase 1 (' + inttostr(iPrgBarPos) + ' em ' + inttostr(iPrgBarMax) + ')...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária e depreciação
         //-------------------------------------------------------------------------------
         _dMTBem.sqlFechamentoBemxMoeda.Prepare;
         _dMTBem.sqlFechamentoBemxMoeda.ParamByName('IDPESSOA').AsInteger := FcdsBem.FieldByName('IDPESSOA').AsInteger;
         _dMTBem.sqlFechamentoBemxMoeda.ParamByName('IDBEM').AsInteger    := FcdsBem.FieldByName('IDBEM').AsInteger;
         FcdsBemxMoeda.Data := _dMTBem.sqlFechamentoBemxMoeda.Data;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         bUpdDatGrupo := False;
         while not FcdsBemxMoeda.EOF do
         begin
            bCalcCM   := False;
            nCmBem    := 0;
            nCmDep    := 0;
            nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat;
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
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nCmBem) >= 0.01 then
                  begin
                     nValCmBem := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
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
                                                               2,                                                  // TIPDEPPRORATA
                                                               -1,                                                 // IDTIPODESPESA
                                                               '',                                                 // OBSACRESCIMO
                                                               -1,                                                 // IDMOTIVOBAIXA
                                                               0,                                                  // PROPBAIXA
                                                               0,                                     // VALVENDAOFI
                                                               '');                                                // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             nCmBem) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor na tabela BemxMoeda
                     //-------------------------------------------------------------------
                     FcdsBemxMoeda.Edit;
                     FcdsBemxMoeda.FieldByName('CMBEM').AsFloat     := nValCmBem;
                     FcdsBemxMoeda.FieldByName('DATAULTCM').AsFloat := dDataMov;
                     FcdsBemxMoeda.Post;
                     //-------------------------------------------------------------------
                     // Registra a Correção Monetária do Custo na Contabilidade
                     //-------------------------------------------------------------------
                     if bIntegraContab then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CafxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
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
                           Raise Exception.Create(CafxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Capta o id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                        iaHistMovBem := iaHistMovBem + 1;
                     end;
                     //-------------------------------------------------------------------
                     bCalcCM := True;
                     bUpdDatGrupo := True;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da correção monetária
            // da depreciação acumulada e da depreciação do custo
            //----------------------------------------------------------------------------
            _dMTBem.sqlFechamentoBemxDep.Prepare;
            _dMTBem.sqlFechamentoBemxDep.ParamByName('IDPESSOA').AsInteger  := FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger;
            _dMTBem.sqlFechamentoBemxDep.ParamByName('IDBEM').AsInteger     := FcdsBemxMoeda.FieldByName('IDBEM').AsInteger;
            _dMTBem.sqlFechamentoBemxDep.ParamByName('MOECODIGO').AsInteger := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
            FcdsBemxDep.Data := _dMTBem.sqlFechamentoBemxDep.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
            // por Taxa de Depreciação
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            while not FcdsBemxDep.EOF do
            begin
               bCalcCmDep  := False;
               nValCmDep   := FcdsBemxDep.FieldByName('CMDEP').AsFloat;
               nCmDep      := 0;
               bCalcDep    := False;
               nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat;
               nDepLanc    := 0;
               //-------------------------------------------------------------------------
               // Se a Moeda processada for a oficial e o parâmetro de cálculo da
               // correção monetária estiver ativado, processar a correção monetária da
               // Depreciação Acumulada
               //-------------------------------------------------------------------------
               if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
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
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nCmDep) >= 0.01 then
                     begin
                        nValCmDep := FcdsBemxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                                                                  2,                                               // TIPDEPPRORATA
                                                                  -1,                                              // IDTIPODESPESA
                                                                  '',                                              // OBSACRESCIMO
                                                                  -1,                                              // IDMOTIVOBAIXA
                                                                  0,                                               // PROPBAIXA
                                                                  0,                                     // VALVENDAOFI
                                                                  '');                                             // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                                nCmDep) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor na tabela BEMXDEP
                        //----------------------------------------------------------------
                        FcdsBemxDep.Edit;
                        FcdsBemxDep.FieldByName('CMBEM').AsFloat        := nValCmDep;
                        FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime := dDataMov;
                        FcdsBemxDep.Post;
                        //----------------------------------------------------------------
                        // Registra a Correção Monetária da Depreciacao na Contabilidade
                        //----------------------------------------------------------------
                        if bIntegraContab then
                        begin
                           //-------------------------------------------------------------
                           // Alimenta o DataSet que irá acumular a planilha contábil
                           // para a integração
                           //-------------------------------------------------------------
                           if not CafxContab.ContabilizaCorrecaoMonetaria(FcdsBem.FieldByName('IDMODULO').AsInteger,
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
                              Raise Exception.Create(CafxContab.MessageInfo);
                           //-------------------------------------------------------------
                           // Id da movimentacao para registro da planilha contábil
                           //-------------------------------------------------------------
                           SetLength(aHistMovBem,iaHistMovBem + 1);
                           aHistMovBem[iaHistMovBem] := nSeqHist;
                           iaHistMovBem := iaHistMovBem + 1;
                        end;
                        bCalcCMDep := True;
                        bUpdDatGrupo := True;
                     end;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Processar a Depreciação do Custo do BEM
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para o BEM
               //-------------------------------------------------------------------------
               if FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime = 0 then
               begin
                  nFatorDep := CalculaFatorDepreciacao(iModulo, dDataMov,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       bSomenteImoveis);
               end else
               begin
                  nFatorDep := CalculaFatorDepreciacao(iModulo, dDataMov,
                                                       FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       bSomenteImoveis);
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
                  if abs(nDepLanc) >= 0.01 then
                     nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if (nValDepLanc + nDepLanc + nValCmDep) >=
                     (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                  begin
                     nDepLanc := (FcdsBemxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     iFlgDeprec := 1;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nDepLanc) >= 0.01 then
                  begin
                     nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     //----------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
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
                                                               2,                                                // TIPDEPPRORATA
                                                               -1,                                               // IDTIPODESPESA
                                                               '',                                               // OBSACRESCIMO
                                                               -1,                                               // IDMOTIVOBAIXA
                                                               0,                                                // PROPBAIXA
                                                               0,                                     // VALVENDAOFI
                                                               '');                                              // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                             nDepLanc) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra os valores na tabela BEMXDEP
                     //-------------------------------------------------------------------
                     FcdsBemxDep.Edit;
                     FcdsBemxDep.FieldByName('DEPLANC').AsFloat       := nValDepLanc;
                     FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                     FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                     FcdsBemxDep.Post;
                     //-------------------------------------------------------------------
                     // Registra a Depreciação na Contabilidade
                     // Qdo estiver processando a Moeda Oficial do País de EmpresaProp
                     //-------------------------------------------------------------------
                     if bIntegraContab and
                       (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
                     begin
                        //----------------------------------------------------------------
                        // Alimenta o DataSet que irá acumular a planilha contábil
                        // para a integração
                        //----------------------------------------------------------------
                        if not CafxContab.ContabilizaDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
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
                                                                 bSomenteImoveis,
                                                                 bCtaxCCusto) then
                           Raise Exception.Create(CafxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                        iaHistMovBem := iaHistMovBem + 1;
                     end;
                     bCalcDep := True;
                     bUpdDatGrupo := True;
                  end;
               end;
               //-------------------------------------------------------------------------
               if bCalcCM or bCalcDep or bCalcCMDep then
               begin
                  //----------------------------------------------------------------------
                  // Gravação dos dados na tabela BEMXDEP
                  //----------------------------------------------------------------------
                  Result := ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]);
                  if not Result then Raise Exception.Create(_dbBemxDep.MessageInfo);
                  //----------------------------------------------------------------------
                  // Atualiza a tabela SALDOCONTABBEM
                  //----------------------------------------------------------------------
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
                                                    0, iFlgPai) then
                     Raise Exception.Create(Bem.MessageInfo);
               end;
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            if bCalcCM then
            begin
               //-------------------------------------------------------------------------
               // Gravação dos dados na tabela BEMXMOEDA
               //-------------------------------------------------------------------------
               Result := ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]);
               if not Result then Raise Exception.Create(_dbBemxMoeda.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra na tabela GRUPO a atualização da data do último fechamento
         //-------------------------------------------------------------------------------
         if bUpdDatGrupo and ((FcdsBem.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
         begin
            bFlgPrimBem := False;
            if FcdsUpdGrupo.Locate('IDGRUPO', FcdsBem.FieldByname('IDGRUPO').AsInteger,[]) then
            begin
               FcdsUpdGrupo.Edit;
               FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
               FcdsUpdGrupo.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         FcdsBem.Next
      end;
      //----------------------------------------------------------------------------------
      // Gravação dos dados na tabela PLANOGRUPO
      //----------------------------------------------------------------------------------
      if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
         Raise Exception.Create(_dbUpdGrupo.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         if not FcdsBem.IsEmpty then
            MessageInfo := E.Message + #13 + 'Placa ' + FcdsBem.FieldByName('PLACA').AsString
         else
            MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;
//========================================================================================
// Função que calcula a depreciação/correção monetária na Tabela REAVALIACAO
//----------------------------------------------------------------------------------------
function TCtrlFechamento.ExecutaFechamentoREAVALIACAO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                                      bSomenteImoveis : Boolean; Const IAppCliente: OleVariant) : boolean;
var
   nFatorCM, nFatorDep,
   nValCmBem, nCmBem,
   nSeqHist,
   nValCmDep, nCmDep,
   nValDepLanc, nDepLanc,
   nTaxaDep                      : Extended;
   iFlgPai, iFlgDeprec           : Integer;
   bCalcCM, bCalcDEP, bCalcCMDEP : Boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Interface com a Aplicação Cliente (Barra de Progresso)
      //----------------------------------------------------------------------------------
      try
         sPrgBarMsg := 'Iniciando...';
         iPrgBarMax  := FcdsReavaliacao.RecordCount;
         iPrgBarPos  := 0;
         IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
      except

      end;
      //----------------------------------------------------------------------------------
      bFlgPrimBem := True;
      while not FcdsReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos  := iPrgBarPos + 1;
            sPrgBarMsg := 'Processando Fase 2 (' + inttostr(iPrgBarPos) + ' em ' + inttostr(iPrgBarMax) + ')...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária e depreciação
         //-------------------------------------------------------------------------------
         _dMTBem.sqlProRataReavalxMoeda.Prepare;
         _dMTBem.sqlProRataReavalxMoeda.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
         FcdsReavalxMoeda.Data := _dMTBem.sqlProRataReavalxMoeda.Data;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         bUpdDatGrupo := False;
         while not FcdsReavalxMoeda.EOF do
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
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsReavaliacao.FieldByName('IDBEM').AsFloat,          // IDBEM
                                                               FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat,       // IDPESSOA
                                                               FcdsReavaliacao.FieldByName('IDMODULO').AsFloat,       // IDMODULO
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
                                                               2,                                                     // TIPDEPPRORATA
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
                        if not CafxContab.ContabilizaCorrecaoMonetaria(iModulo,
                                                                       FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                                       FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                                       FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                                       FcdsReavaliacao.FieldByName('IDCONJUNTO').AsInteger,
                                                                       FcdsReavaliacao.FieldByName('UNIDNEGOC').AsInteger,
                                                                       FcdsReavaliacao.FieldByName('CODSUBCONTA').AsInteger,
                                                                       FcdsReavaliacao.FieldByName('PLACA').AsString,
                                                                       FcdsReavaliacao.FieldByName('DESBEM').AsString,
                                                                       FcdsReavaliacao.FieldByName('DESCGRUPO').AsString,
                                                                       dDataMov,nCmBem,nCmDep,'R',
                                                                       iExercicio, iPeriodo) then
                           Raise Exception.Create(CafxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Capta o id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                        iaHistMovBem := iaHistMovBem + 1;
                     end;
                     //-------------------------------------------------------------------
                     bCalcCM := True;
                     bUpdDatGrupo := True;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da correção monetária
            // da depreciação acumulada e da depreciação da reavaliacao
            //----------------------------------------------------------------------------
            _dMTBem.sqlProRataReavalxDep.Prepare;
            _dMTBem.sqlProRataReavalxDep.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger;
            _dMTBem.sqlProRataReavalxDep.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
            FcdsReavalxDep.Data := _dMTBem.sqlProRataReavalxDep.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
            // por Taxa de Depreciação
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            while not FcdsReavalxDep.EOF do
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
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nCmDep) >= 0.01 then
                     begin
                        nValCmDep := FcdsReavalxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsReavaliacao.FieldByName('IDBEM').AsFloat,         // IDBEM
                                                                  FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat,      // IDPESSOA
                                                                  FcdsReavaliacao.FieldByName('IDMODULO').AsFloat,      // IDMODULO
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
                                                                  2,                                                    // TIPDEPPRORATA
                                                                  -1,                                                   // IDTIPODESPESA
                                                                  '',                                                   // OBSACRESCIMO
                                                                  -1,                                                   // IDMOTIVOBAIXA
                                                                  0,                                                    // PROPBAIXA
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
                        // Registra a Correção Monetária da Depreciacao na Contabilidade
                        //----------------------------------------------------------------
                        if bIntegraContab then
                        begin
                           //-------------------------------------------------------------
                           // Alimenta o DataSet que irá acumular a planilha contábil
                           // para a integração
                           //-------------------------------------------------------------
                           if not CafxContab.ContabilizaCorrecaoMonetaria(iModulo,
                                                                          FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                                          FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                                          FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                                          FcdsReavaliacao.FieldByName('IDCONJUNTO').AsInteger,
                                                                          FcdsReavaliacao.FieldByName('UNIDNEGOC').AsInteger,
                                                                          FcdsReavaliacao.FieldByName('CODSUBCONTA').AsInteger,
                                                                          FcdsReavaliacao.FieldByName('PLACA').AsString,
                                                                          FcdsReavaliacao.FieldByName('DESBEM').AsString,
                                                                          FcdsReavaliacao.FieldByName('DESCGRUPO').AsString,
                                                                          dDataMov,nCmBem,nCmDep,'R',
                                                                          iExercicio, iPeriodo) then
                              Raise Exception.Create(CafxContab.MessageInfo);
                           //-------------------------------------------------------------
                           // Id da movimentacao para registro da planilha contábil
                           //-------------------------------------------------------------
                           SetLength(aHistMovBem,iaHistMovBem + 1);
                           aHistMovBem[iaHistMovBem] := nSeqHist;
                           iaHistMovBem := iaHistMovBem + 1;
                        end;
                        bCalcCMDep := True;
                        bUpdDatGrupo := True;
                     end;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Processar a Depreciação da Reavaliacao
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para a Reavaliacao
               //-------------------------------------------------------------------------
               nFatorDep := CalculaFatorDepreciacao(iModulo,dDataMov,
                                                    FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                    FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                    bSomenteImoveis);
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
                  if abs(nDepLanc) >= 0.01 then
                     nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if ((nValDepLanc + nDepLanc + nValCmDep) >=
                      (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem)) then
                  begin
                     nDepLanc := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     iFlgDeprec := 1;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nDepLanc) >= 0.01 then
                  begin
                     nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     //----------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsReavaliacao.FieldByName('IDBEM').AsFloat,           // IDBEM
                                                               FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat,        // IDPESSOA
                                                               StrToFloat(IntToStr(iModulo)),                          // IDMODULO
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
                                                               2,                                                      // TIPDEPPRORATA
                                                               -1,                                                     // IDTIPODESPESA
                                                               '',                                                     // OBSACRESCIMO
                                                               -1,                                                     // IDMOTIVOBAIXA
                                                               0,                                                      // PROPBAIXA
                                                               '');                                                    // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
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
                        if not CafxContab.ContabilizaDepreciacao(iModulo,
                                                                 FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                                 FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                                 FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                                 FcdsReavaliacao.FieldByName('IDCONJUNTO').AsInteger,
                                                                 FcdsReavaliacao.FieldByName('UNIDNEGOC').AsInteger,
                                                                 FcdsReavaliacao.FieldByName('CODSUBCONTA').AsInteger,
                                                                 FcdsReavaliacao.FieldByName('PLACA').AsString,
                                                                 FcdsReavaliacao.FieldByName('DESBEM').AsString,
                                                                 FcdsReavaliacao.FieldByName('DESCGRUPO').AsString,
                                                                 dDataMov,nDepLanc,'R',
                                                                 iExercicio, iPeriodo,
                                                                 bSomenteImoveis,
                                                                 bCtaxCCusto) then
                           Raise Exception.Create(CafxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                        iaHistMovBem := iaHistMovBem + 1;
                     end;
                     bCalcDep := True;
                     bUpdDatGrupo := True;
                  end;
               end;
               //-------------------------------------------------------------------------
               if bCalcCM or bCalcDep or bCalcCMDep then
               begin
                  //----------------------------------------------------------------------
                  // Gravação dos dados na tabela ReavalxDep
                  //----------------------------------------------------------------------
                  Result := ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]);
                  if not Result then Raise Exception.Create(_dbReavalxDep.MessageInfo);
                  //----------------------------------------------------------------------
                  // Atualiza a tabela SALDOCONTABBEM
                  //----------------------------------------------------------------------
                  if cdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
                  begin
                     if not Bem.AtualizaSaldoContabBem(FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                       FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                       dDataMov,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       0, 0, 0, 0,
                                                       0, nCmBem, nDepLanc, nCmDep,
                                                       0, 0, 0, 0,
                                                       FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                       FcdsReavaliacao.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       FcdsReavaliacao.FieldByName('IDRESPONSAVEL').AsInteger,
                                                       0, iFlgPai) then
                        Raise Exception.Create(Bem.MessageInfo);
                  end else
                  begin
                     if not Bem.AtualizaSaldoContabBem(FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                       FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                       dDataMov,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       0, 0, 0, 0,
                                                       0, 0, 0, 0,
                                                       0, nCmBem, nDepLanc, nCmDep,
                                                       FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                       FcdsReavaliacao.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       FcdsReavaliacao.FieldByName('IDRESPONSAVEL').AsInteger,
                                                       0, iFlgPai) then
                        Raise Exception.Create(Bem.MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Next;
            end;
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
         //-------------------------------------------------------------------------------
         // Registra na tabela GRUPO a atualização da data do último fechamento
         //-------------------------------------------------------------------------------
         if bUpdDatGrupo and ((FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
         begin
            bFlgPrimBem := False;
            if FcdsUpdGrupo.Locate('IDGRUPO', FcdsReavaliacao.FieldByname('IDGRUPO').AsInteger,[]) then
            begin
               FcdsUpdGrupo.Edit;
               FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
               FcdsUpdGrupo.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.Next
      end;
      //----------------------------------------------------------------------------------
      // Gravação dos dados na tabela PLANOGRUPO
      //----------------------------------------------------------------------------------
      if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
         Raise Exception.Create(_dbUpdGrupo.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         if not FcdsReavaliacao.IsEmpty then
            MessageInfo := E.Message + #13 + 'Placa ' + FcdsReavaliacao.FieldByName('PLACA').AsString
         else
            MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;
//========================================================================================
// Função que calcula a depreciação/correção monetária na Tabela ACRESCIMOVALOR
//========================================================================================
function TCtrlFechamento.ExecutaFechamentoACRESCIMO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                                    bSomenteImoveis : Boolean; Const IAppCliente: OleVariant) : boolean;
var
   nFatorCM, nFatorDep,
   nValCmBem, nCmBem,
   nSeqHist,
   nValCmDep, nCmDep,
   nValDepLanc, nDepLanc,
   nTaxaDep                      : Extended;
   iFlgPai, iFlgDeprec           : Integer;
   bCalcCM, bCalcDEP, bCalcCMDEP : Boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Interface com a Aplicação Cliente (Barra de Progresso)
      //----------------------------------------------------------------------------------
      try
         sPrgBarMsg := 'Iniciando...';
         iPrgBarMax  := FcdsAcrescimoValor.RecordCount;
         iPrgBarPos  := 0;
         IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
      except

      end;
      //----------------------------------------------------------------------------------
      bFlgPrimBem := True;
      while not FcdsAcrescimoValor.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos  := iPrgBarPos + 1;
            sPrgBarMsg := 'Processando Fase 3 (' + inttostr(iPrgBarPos) + ' em ' + inttostr(iPrgBarMax) + ')...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária e depreciação
         //-------------------------------------------------------------------------------
         _dMTBem.sqlProRataAcrescValorxMoeda.Prepare;
         _dMTBem.sqlProRataAcrescValorxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger;
         FcdsAcrescValorxMoeda.Data := _dMTBem.sqlProRataAcrescValorxMoeda.Data;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         bUpdDatGrupo := False;
         while not FcdsAcrescValorxMoeda.EOF do
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
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat,           // IDBEM
                                                               FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat,        // IDPESSOA
                                                               StrToFloat(IntToStr(iModulo)),                             // IDMODULO
                                                               34,                                                        // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                                  // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat,  // IDREAVALACRESC
                                                               FcdsAcrescValorxMoeda.FieldByName('DATAULTCM').AsDateTime, // DATAULTDEP
                                                               -1,                                                        // IDGRUPANT
                                                               -1,                                                        // IDCONJANT
                                                               -1,                                                        // IDLOCALANT
                                                               -1,                                                        // IDRESPANT
                                                               -1,                                                        // PLACAANT
                                                               -1,                                                        // PLNCODIGO
                                                               '',                                                        // OBSREAVAL
                                                               2,                                                         // TIPDEPPRORATA
                                                               -1,                                                        // IDTIPODESPESA
                                                               '',                                                        // OBSACRESCIMO
                                                               -1,                                                        // IDMOTIVOBAIXA
                                                               0,                                                         // PROPBAIXA
                                                               '');                                                       // OBSBAIXA
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
                        if not CafxContab.ContabilizaCorrecaoMonetaria(FcdsAcrescimoValor.FieldByName('IDMODULO').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('IDPESSOA').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('IDBEM').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('IDCONJUNTO').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('UNIDNEGOC').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('CODSUBCONTA').AsInteger,
                                                                       FcdsAcrescimoValor.FieldByName('PLACA').AsString,
                                                                       FcdsAcrescimoValor.FieldByName('DESBEM').AsString,
                                                                       FcdsAcrescimoValor.FieldByName('DESCGRUPO').AsString,
                                                                       dDataMov,nCmBem,nCmDep,'A',
                                                                       iExercicio, iPeriodo) then
                           Raise Exception.Create(CafxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Capta o id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                        iaHistMovBem := iaHistMovBem + 1;
                     end;
                     //-------------------------------------------------------------------
                     bCalcCM := False;
                     bUpdDatGrupo := True;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Prepara a tabela de custos para o calculo da correção monetária
            // da depreciação acumulada e da depreciação da AcrescimoValor
            //----------------------------------------------------------------------------
            _dMTBem.sqlProRataAcrescValorxDep.Prepare;
            _dMTBem.sqlProRataAcrescValorxDep.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger;
            _dMTBem.sqlProRataAcrescValorxDep.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
            FcdsAcrescValorxDep.Data := _dMTBem.sqlProRataAcrescValorxDep.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
            // por Taxa de Depreciação
            //----------------------------------------------------------------------------
            iFlgPai := 1;
            while not FcdsAcrescValorxDep.EOF do
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
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat,         // IDBEM
                                                                  FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat,      // IDPESSOA
                                                                  FcdsAcrescimoValor.FieldByName('IDMODULO').AsFloat,      // IDMODULO
                                                                  36,                                                   // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                             // DATAMOVIMENTACAO
                                                                  FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat,  // IDREAVALACRESC
                                                                  FcdsAcrescValorxDep.FieldByName('DATAULTCM').AsDateTime,   // DATAULTDEP
                                                                  -1,                                                   // IDGRUPANT
                                                                  -1,                                                   // IDCONJANT
                                                                  -1,                                                   // IDLOCALANT
                                                                  -1,                                                   // IDRESPANT
                                                                  -1,                                                   // PLACAANT
                                                                  -1,                                                   // PLNCODIGO
                                                                  '',                                                   // OBSREAVAL
                                                                  2,                                                    // TIPDEPPRORATA
                                                                  -1,                                                   // IDTIPODESPESA
                                                                  '',                                                   // OBSACRESCIMO
                                                                  -1,                                                   // IDMOTIVOBAIXA
                                                                  0,                                                    // PROPBAIXA
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
                           if not CafxContab.ContabilizaCorrecaoMonetaria(FcdsAcrescimoValor.FieldByName('IDMODULO').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('IDPESSOA').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('IDBEM').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('IDCONJUNTO').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('UNIDNEGOC').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('CODSUBCONTA').AsInteger,
                                                                          FcdsAcrescimoValor.FieldByName('PLACA').AsString,
                                                                          FcdsAcrescimoValor.FieldByName('DESBEM').AsString,
                                                                          FcdsAcrescimoValor.FieldByName('DESCGRUPO').AsString,
                                                                          dDataMov,nCmBem,nCmDep,'A',
                                                                          iExercicio, iPeriodo) then
                              Raise Exception.Create(CafxContab.MessageInfo);
                           //-------------------------------------------------------------
                           // Id da movimentacao para registro da planilha contábil
                           //-------------------------------------------------------------
                           SetLength(aHistMovBem,iaHistMovBem + 1);
                           aHistMovBem[iaHistMovBem] := nSeqHist;
                           iaHistMovBem := iaHistMovBem + 1;
                        end;
                        bCalcCMDep := True;
                        bUpdDatGrupo := True;
                     end;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Processar a Depreciação da AcrescimoValor
               //-------------------------------------------------------------------------
               // Calcula o fator de tempo de depreciação para a AcrescimoValor
               //-------------------------------------------------------------------------
               nFatorDep := CalculaFatorDepreciacao(iModulo,dDataMov,
                                                    FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                    FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime,
                                                    bSomenteImoveis);
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
                  if abs(nDepLanc) >= 0.01 then
                     nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                  //----------------------------------------------------------------------
                  // Se o valor calculado para depreciação for superior ao total do custo
                  // de aquisição do bem, ajustar o valor para igualar e setar o flag
                  // de encerramento de periodo de depreciação
                  //----------------------------------------------------------------------
                  if ((nValDepLanc + nDepLanc + nValCmDep) >=
                      (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem)) then
                  begin
                     nDepLanc := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                     iFlgDeprec := 1;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nDepLanc) >= 0.01 then
                  begin
                     nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     //----------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsAcrescimoValor.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                               35,                                                             // IDTIPOMOVIMENTACAO
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
                                                               2,                                                              // TIPDEPPRORATA
                                                               -1,                                                             // IDTIPODESPESA
                                                               '',                                                             // OBSACRESCIMO
                                                               -1,                                                             // IDMOTIVOBAIXA
                                                               0,                                                              // PROPBAIXA
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
                        if not CafxContab.ContabilizaDepreciacao(FcdsAcrescimoValor.FieldByName('IDMODULO').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('IDPESSOA').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('IDBEM').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('IDCONJUNTO').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('UNIDNEGOC').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('CODSUBCONTA').AsInteger,
                                                                 FcdsAcrescimoValor.FieldByName('PLACA').AsString,
                                                                 FcdsAcrescimoValor.FieldByName('DESBEM').AsString,
                                                                 FcdsAcrescimoValor.FieldByName('DESCGRUPO').AsString,
                                                                 dDataMov,nDepLanc,'A',
                                                                 iExercicio, iPeriodo,
                                                                 bSomenteImoveis,
                                                                 bCtaxCCusto) then
                           Raise Exception.Create(CafxContab.MessageInfo);
                        //----------------------------------------------------------------
                        // Id da movimentacao para registro da planilha contábil
                        //----------------------------------------------------------------
                        SetLength(aHistMovBem,iaHistMovBem + 1);
                        aHistMovBem[iaHistMovBem] := nSeqHist;
                        iaHistMovBem := iaHistMovBem + 1;
                     end;
                     bCalcDep := True;
                     bUpdDatGrupo := True;
                  end;
               end;
               //-------------------------------------------------------------------------
               if bCalcCM or bCalcDep or bCalcCMDep then
               begin
                  //----------------------------------------------------------------------
                  // Gravação dos dados na tabela AcrescValorxDep
                  //----------------------------------------------------------------------
                  Result := ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]);
                  if not Result then Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
                  //----------------------------------------------------------------------
                  // Atualiza a tabela SALDOCONTABBEM
                  //----------------------------------------------------------------------
                  if not Bem.AtualizaSaldoContabBem(FcdsAcrescimoValor.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsAcrescimoValor.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                    0, nCmBem, nDepLanc, nCmDep,
                                                    0, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger,
                                                    FcdsAcrescimoValor.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    FcdsAcrescimoValor.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    0, iFlgPai) then
                     Raise Exception.Create(Bem.MessageInfo);
               end;
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação x moeda
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Next;
            end;
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
         //-------------------------------------------------------------------------------
         // Registra na tabela GRUPO a atualização da data do último fechamento
         //-------------------------------------------------------------------------------
         if bUpdDatGrupo and ((FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
         begin
            bFlgPrimBem := False;
            if FcdsUpdGrupo.Locate('IDGRUPO', FcdsAcrescimoValor.FieldByname('IDGRUPO').AsInteger,[]) then
            begin
               FcdsUpdGrupo.Edit;
               FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
               FcdsUpdGrupo.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Next
      end;
      //----------------------------------------------------------------------------------
      // Gravação dos dados na tabela PLANOGRUPO
      //----------------------------------------------------------------------------------
      if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
         Raise Exception.Create(_dbUpdGrupo.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception Do
      begin
         if not FcdsAcrescimoValor.IsEmpty then
            MessageInfo := E.Message + #13 + 'Placa ' + FcdsAcrescimoValor.FieldByName('PLACA').AsString
         else
            MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;
//========================================================================================
// Função que estorna o fechamento de um periodo do CAF, estornando a depreciação e a
// correção monetária registrada.
//----------------------------------------------------------------------------------------
function TCtrlFechamento.EstornaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                           dDataMov, dDataEst : tDateTime;
                                           bSomenteImoveis : Boolean;
                                           Const IAppCliente: OleVariant) : Boolean;
Var
   sSql                   : String;
   aIdBem, aPlanilha      : Array of Integer;
   iaIdBem, iaPlanilha,
   iPlan, iProcBem,
   iQtdBens, iFlgPai      : Integer;
   dDataUltDep,
   dDataAntDep            : TDateTime;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaFechamento(iModulo, iEmpresaProp, iUsuario, dDataMov,
                                                       dDataEst, bSomenteImoveis, IAppCliente);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 4;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Preparando...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresaProp) then
         begin
            MessageInfo := 'Parâmetros do sistema inválidos!';
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CafxContab.IntegraContab(iEmpresaProp, iModulo);
         //-------------------------------------------------------------------------------
         // Posiciona os flags de filtragem de bens administrados pelo sistema CAF ou
         // InvestImob
         //-------------------------------------------------------------------------------
         if iModulo = 7 then
         begin
            if copy(ParamCAF.SISTEMAS, 4, 1) <> '1' then
            begin
               iGrupoDeprec := 2;
            end else
            begin
               if bSomenteImoveis then
                  iGrupoDeprec := 1
               else
                  iGrupoDeprec := 0;
            end;
         end else
         begin
            iGrupoDeprec := 1;
         end;
         //-------------------------------------------------------------------------------
         case iGrupoDeprec of
            0 : begin
                   iGrupoDepIni := 0;
                   iGrupoDepFim := 0;
                end;
            1 : begin
                   iGrupoDepIni := 1;
                   iGrupoDepFim := 1;
                end;
            2 : begin
                   iGrupoDepIni := 0;
                   iGrupoDepFim := 1;
                end;
            else
                begin
                   iGrupoDepIni := 2;
                   iGrupoDepFim := 2;
                end;
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data de fechamento está correta
         //-------------------------------------------------------------------------------
         dDataUltDep := UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim);
         if dDataMov <> dDataUltDep then
         begin
            MessageInfo := 'Data deve ser a do Último Fechamento Realizado ! ' + DatetoStr(dDataUltDep);
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação após o fechamento
         //-------------------------------------------------------------------------------
         if HistMovBem.ExisteMovimentacao(iGrupoDepIni, iGrupoDepFim, iEmpresaProp, dDataMov) then
         begin
            MessageInfo := 'Existem Bens com movimentações após o Fechamento.' + #13 +
                           'Consulte Histórico de Movimentações!' ;
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Verifica se o fechamento pode ser estornado da contabilidade
         //-------------------------------------------------------------------------------
         if bIntegraContab then
            if not CafxContab.VerificaPeriodoContabil(iEmpresaProp, dDataMov,
                                                      iExercicio, iPeriodo) then
               Raise Exception.Create(CafxContab.MessageInfo);
         //-------------------------------------------------------------------------------
         // Calcula a Data do Fechamento anterior
         //-------------------------------------------------------------------------------
         dDataAntDep := DataFechamentoAnterior(iModulo, iEmpresaProp,
                                               iGrupoDepIni, iGrupoDepFim,
                                               bSomenteImoveis);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos := 1;
            sPrgBarMsg := 'Inicializando...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         // Preenche o Vetor com os id's a serem processados
         //-------------------------------------------------------------------------------
         sSql := ' SELECT DISTINCT B.IDGRUPO, HM.IDBEM, HM.PLNCODIGO ' +
                 ' FROM HISTORICOMOVIMENTACAO HM, '+
                 '      BEM B, '+
                 '      GRUPO G' +
                 ' WHERE (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                 '   AND (HM.TIPDEPPRORATA = 2) '+
                 '   AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIPOMOVIMENTACAO = 22) OR (HM.IDTIPOMOVIMENTACAO = 34) OR '+
                 '        (HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACAO = 35) OR '+
                 '        (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIPOMOVIMENTACAO = 19) OR (HM.IDTIPOMOVIMENTACAO = 36)) '+
                 '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                 '   AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni)+') OR (G.FLGIMOVEL = '+inttostr(iGrupoDepIni)+')) '+
                 '   AND (HM.IDBEM = B.IDBEM) '+
                 '   AND (HM.IDPESSOA = B.IDPESSOA) '+
                 '   AND (B.IDGRUPO = G.IDGRUPO) '+
                 ' ORDER BY B.IDGRUPO, HM.IDBEM';
         _cds.Data := GetDataPacket( sSql );
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos := 2;
            sPrgBarMsg := 'Inicializando...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         iaIdBem    := -1;
         iaPlanilha :=  0;
         iQtdBens   :=  0;
         while not _cds.EOF do
         begin
            if iaIdBem = -1 then
            begin
               iaIdBem := iaIdBem + 1;
               SetLength(aIdBem,iaIdBem + 1);
               aIdBem[iaIdBem] := _cds.FieldByName('IDBEM').AsInteger;
               iQtdBens := iQtdBens + 1;
            end else
            if aIdBem[iaIdBem] <> _cds.FieldByName('IDBEM').AsInteger then
            begin
               iaIdBem := iaIdBem + 1;
               SetLength(aIdBem,iaIdBem + 1);
               aIdBem[iaIdBem] := _cds.FieldByName('IDBEM').AsInteger;
               iQtdBens := iQtdBens + 1;
            end;
            //----------------------------------------------------------------------------
            if not _cds.FieldByName('PLNCODIGO').IsNull then
            begin
               if iaPlanilha = 0 then
               begin
                  iaPlanilha := iaPlanilha + 1;
                  SetLength(aPlanilha,iaPlanilha);
                  aPlanilha[iaPlanilha - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
               end else
               if aPlanilha[iaPlanilha - 1] <> _cds.FieldByName('PLNCODIGO').AsFloat then
               begin
                  iaPlanilha := iaPlanilha + 1;
                  SetLength(aPlanilha,iaPlanilha);
                  aPlanilha[iaPlanilha - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
               end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos := 3;
            sPrgBarMsg := 'Estorna Planilha Contábil...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         // Estorna Lancamento na Contabilidade
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Retira o Link do Histórico com a Planilha Contábil
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' + #13 +
                    ' SET PLNCODIGO = NULL '+ #13 +
                    ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO ' + #13 +
                    '                          FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
                    '                               BEM B, ' + #13 +
                    '                               GRUPO G ' + #13 +
                    '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' + #13 +
                    '                            AND (HM.TIPDEPPRORATA = 2) ' + #13 +
                    '                            AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIPOMOVIMENTACAO = 22) OR (HM.IDTIPOMOVIMENTACAO = 34) OR '+ #13 +
                    '                                 (HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACAO = 35) OR '+ #13 +
                    '                                 (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIPOMOVIMENTACAO = 19) OR (HM.IDTIPOMOVIMENTACAO = 36)) '+ #13 +
                    '                            AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' + #13 +
                    '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni)+') OR (G.FLGIMOVEL = '+inttostr(iGrupoDepIni)+')) '+ #13 +
                    '                            AND (HM.IDBEM = B.IDBEM) '+ #13 +
                    '                            AND (HM.IDPESSOA = B.IDPESSOA) '+ #13 +
                    '                            AND (B.IDGRUPO = G.IDGRUPO)) ' + #13 ;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            for iPlan := 0 to (iaPlanilha - 1) do
            begin
               if not CafxContab.RemovePlanContab(iEmpresaProp) then
               begin
                  if not CafxContab.LancaContab.EstornaLancaContab(iUsuario, aPlanilha[iPlan],
                                                                   iModulo,iEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataMov)) then
                  begin
                     MessageInfo := 'Estorno da Planilha Contabil não Executado !';
                     Raise Exception.Create(MessageInfo);
                  end;
               end else
               begin
                  if not CafxContab.LancaContab.ExcluiLancaContab(iUsuario, aPlanilha[iPlan],
                                                                  iModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                  begin
                     MessageInfo := 'Remoção da Planilha Contabil não Executada !';
                     Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         FcdsUpdGrupo.Data := GrupoContab.ListaPlanoGrupo(iEmpresaProp);
         //-------------------------------------------------------------------------------
         // Estorna os Lançamentos do Fechamento
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := iQtdBens;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Retornando Valores...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         bFlgPrimBem := True;
         for iProcBem := 0 to (iQtdBens - 1) do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               iPrgBarPos  := iPrgBarPos + 1;
               sPrgBarMsg := 'Retornando Valores (' + inttostr(iPrgBarPos) + ' em ' + inttostr(iPrgBarMax) + ')...';
               IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
            except

            end;
            //----------------------------------------------------------------------------
            // Posiciona a Tabela BEM
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(iEmpresaProp,aIdBem[iProcBem]);
            //----------------------------------------------------------------------------
            // Registra na tabela GRUPO a atualização da data do último fechamento
            //----------------------------------------------------------------------------
            if (FcdsBem.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem then 
            begin
               bFlgPrimBem := False;
               if FcdsUpdGrupo.Locate('IDGRUPO', FcdsBem.FieldByname('IDGRUPO').AsInteger,[]) then
               begin
                  FcdsUpdGrupo.Edit;
                  FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataAntDep;
                  FcdsUpdGrupo.Post;
               end;
            end;
            //----------------------------------------------------------------------------
            // Posiciona a Tabela BEMXMOEDA
            //----------------------------------------------------------------------------
            _dMTBem.sqlFechamentoBemxMoeda.Prepare;
            _dMTBem.sqlFechamentoBemxMoeda.ParamByName('IDBEM').AsInteger    := aIdBem[iProcBem];
            _dMTBem.sqlFechamentoBemxMoeda.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            FcdsBemxMoeda.Data := _dMTBem.sqlFechamentoBemxMoeda.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while not FcdsBemxMoeda.EOF do
            begin
               if ParamCAF.FLGCALCCM = 1 then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Correção Monetária do Custo na Moeda Processada
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + inttostr(aIdBem[iProcBem]) + ') ' +
                          '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND (HM.IDTIPOMOVIMENTACAO = 15) '+
                          '   AND (VM.MOECODIGO = ' + FcdsBemxMoeda.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  if not _cds.IsEmpty then
                  begin
                     _dMTBem.sqlAtuBemxMoeda.Prepare;
                     _dMTBem.sqlAtuBemxMoeda.ParamByName('IDBEM').AsInteger      := aIdBem[iProcBem];
                     _dMTBem.sqlAtuBemxMoeda.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
                     _dMTBem.sqlAtuBemxMoeda.ParamByName('MOECODIGO').AsInteger  := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
                     _dMTBem.sqlAtuBemxMoeda.ParamByName('CMBEM').AsFloat        := FcdsBemxMoeda.FieldByName('CMBEM').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTBem.sqlAtuBemxMoeda.ParamByName('DATAULTCM').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTBem.sqlAtuBemxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Posiciona a Tabela BEMXDEP
               //-------------------------------------------------------------------------
               _dMTBem.sqlFechamentoBemxDep.Prepare;
               _dMTBem.sqlFechamentoBemxDep.ParamByName('IDPESSOA').AsInteger  := FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger;
               _dMTBem.sqlFechamentoBemxDep.ParamByName('IDBEM').AsInteger     := FcdsBemxMoeda.FieldByName('IDBEM').AsInteger;
               _dMTBem.sqlFechamentoBemxDep.ParamByName('MOECODIGO').AsInteger := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
               FcdsBemxDep.Data := _dMTBem.sqlFechamentoBemxDep.Data;
               //-------------------------------------------------------------------------
               // Processa os Cálculos por Moeda e Taxa Depreciação
               //-------------------------------------------------------------------------
               bFlgPrimBem := True;
               while not FcdsBemxDep.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
                  // Taxa de Depreciação Processadas
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + inttostr(aIdBem[iProcBem]) + ') ' +
                          '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTACAO = 21))'+
                          '   AND (VM.IDTAXADEP = ' + FcdsBemxDep.FieldByName('IDBEMXDEP').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsBemxDep.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                          'ORDER BY HM.IDTIPOMOVIMENTACAO';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  while not _cds.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Correção Monetária da Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21 then
                     begin
                        _dMTBem.sqlAtuBemxDep1.Prepare;
                        _dMTBem.sqlAtuBemxDep1.ParamByName('IDBEM').AsInteger      := aIdBem[iProcBem];
                        _dMTBem.sqlAtuBemxDep1.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
                        _dMTBem.sqlAtuBemxDep1.ParamByName('MOECODIGO').AsInteger  := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlAtuBemxDep1.ParamByName('IDTAXADEP').AsInteger  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                        _dMTBem.sqlAtuBemxDep1.ParamByName('CMDEP').AsFloat        := FcdsBemxDep.FieldByName('CMDEP').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTBem.sqlAtuBemxDep1.ParamByName('DATAULTCM').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                        if not ExecSQL(_dMTBem.sqlAtuBemxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14 then
                     begin
                        _dMTBem.sqlAtuBemxDep2.Prepare;
                        _dMTBem.sqlAtuBemxDep2.ParamByName('IDBEM').AsInteger       := aIdBem[iProcBem];
                        _dMTBem.sqlAtuBemxDep2.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
                        _dMTBem.sqlAtuBemxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlAtuBemxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                        _dMTBem.sqlAtuBemxDep2.ParamByName('DEPLANC').AsFloat       := FcdsBemxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTBem.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                        _dMTBem.sqlAtuBemxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                        if not ExecSQL(_dMTBem.sqlAtuBemxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     _cds.Next;
                  end;
                  //----------------------------------------------------------------------
                  FcdsBemxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima moeda
               //-------------------------------------------------------------------------
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            // Posiciona a Tabela REAVALXMOEDA
            //----------------------------------------------------------------------------
            _dMTBem.sqlFechamentoReavalxMoeda.Prepare;
            _dMTBem.sqlFechamentoReavalxMoeda.ParamByName('IDBEM').AsInteger    := FcdsBem.FieldByName('IDBEM').AsInteger;
            _dMTBem.sqlFechamentoReavalxMoeda.ParamByName('IDPESSOA').AsInteger := FcdsBem.FieldByName('IDPESSOA').AsInteger;
            FcdsReavalxMoeda.Data := _dMTBem.sqlFechamentoReavalxMoeda.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while not FcdsReavalxMoeda.EOF do
            begin
               if ParamCAF.FLGCALCCM = 1 then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Correção Monetária na Moeda Processada
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + inttostr(aIdBem[iProcBem]) + ') ' +
                          '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND (HM.IDTIPOMOVIMENTACAO = 22) '+
                          '   AND (HM.IDREAVALACRESC = ' + FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsReavalxMoeda.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  if not _cds.IsEmpty then
                  begin
                     _dMTBem.sqlAtuReavxMoeda.Prepare;
                     _dMTBem.sqlAtuReavxMoeda.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger;
                     _dMTBem.sqlAtuReavxMoeda.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
                     _dMTBem.sqlAtuReavxMoeda.ParamByName('CMBEM').AsFloat           := FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTBem.sqlAtuReavxMoeda.ParamByName('DATAULTCM').AsDateTime    := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTBem.sqlAtuReavxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;   
               //-------------------------------------------------------------------------
               // Posiciona a Tabela ReavalxDep
               //-------------------------------------------------------------------------
               _dMTBem.sqlProRataReavalxDep.Prepare;
               _dMTBem.sqlProRataReavalxDep.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger;
               _dMTBem.sqlProRataReavalxDep.ParamByName('MOECODIGO').AsInteger := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
               FcdsReavalxDep.Data := _dMTBem.sqlProRataReavalxDep.Data;
               //-------------------------------------------------------------------------
               // Processa os Cálculos por Moeda e Taxa Depreciação
               //-------------------------------------------------------------------------
               while not FcdsReavalxDep.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
                  // Taxa de Depreciação Processadas
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + inttostr(aIdBem[iProcBem]) + ') ' +
                          '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACAO = 19))'+
                          '   AND (HM.IDREAVALACRESC = ' + FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsReavalxDep.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDTAXADEP = ' + FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                          ' ORDER BY HM.IDTIPOMOVIMENTACAO';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  while not _cds.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Correção Monetária da Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19 then
                     begin
                        _dMTBem.sqlAtuReavxDep1.Prepare;
                        _dMTBem.sqlAtuReavxDep1.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTBem.sqlAtuReavxDep1.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlAtuReavxDep1.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                        _dMTBem.sqlAtuReavxDep1.ParamByName('CMDEP').AsFloat           := FcdsReavalxDep.FieldByName('CMDEP').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTBem.sqlAtuReavxDep1.ParamByName('DATAULTCM').AsDateTime    := _cds.FieldByName('DATAULTDEP').AsDateTime;
                        if not ExecSQL(_dMTBem.sqlAtuReavxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18 then
                     begin
                        _dMTBem.sqlAtuReavxDep2.Prepare;
                        _dMTBem.sqlAtuReavxDep2.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTBem.sqlAtuReavxDep2.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlAtuReavxDep2.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                        _dMTBem.sqlAtuReavxDep2.ParamByName('DEPLANC').AsFloat         := FcdsReavalxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTBem.sqlAtuReavxDep2.ParamByName('DATAULTDEP').AsDateTime   := _cds.FieldByName('DATAULTDEP').AsDateTime;
                        _dMTBem.sqlAtuReavxDep2.ParamByName('FLGDEPREC').AsInteger     := 0;
                        if not ExecSQL(_dMTBem.sqlAtuReavxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     _cds.Next;
                  end;
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima moeda
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            // Posiciona a Tabela ACRESCIMOVALOR
            //----------------------------------------------------------------------------
            _dMTBem.sqlFechamentoAcrescValorxMoeda.Prepare;
            _dMTBem.sqlFechamentoAcrescValorxMoeda.ParamByName('IDBEM').AsInteger    := FcdsBem.FieldByName('IDBEM').AsInteger;
            _dMTBem.sqlFechamentoAcrescValorxMoeda.ParamByName('IDPESSOA').AsInteger := FcdsBem.FieldByName('IDPESSOA').AsInteger;
            FcdsAcrescValorxMoeda.Data := _dMTBem.sqlFechamentoAcrescValorxMoeda.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while not FcdsAcrescValorxMoeda.EOF do
            begin
               if ParamCAF.FLGCALCCM = 1 then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Correção Monetária na Moeda Processada
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + inttostr(aIdBem[iProcBem]) + ') ' +
                          '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND (HM.IDTIPOMOVIMENTACAO = 34) '+
                          '   AND (HM.IDREAVALACRESC = ' + FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  if not _cds.IsEmpty then
                  begin
                     _dMTBem.sqlAtuAcresxMoeda.Prepare;
                     _dMTBem.sqlAtuAcresxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger;
                     _dMTBem.sqlAtuAcresxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
                     _dMTBem.sqlAtuAcresxMoeda.ParamByName('CMBEM').AsFloat         := FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat - _cds.FieldByName('VALOR').AsFloat;
                     _dMTBem.sqlAtuAcresxMoeda.ParamByName('DATAULTCM').AsDateTime  := _cds.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTBem.sqlAtuAcresxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Posiciona a Tabela AcrescValorxDep
               //-------------------------------------------------------------------------
               _dMTBem.sqlProRataAcrescValorxDep.Prepare;
               _dMTBem.sqlProRataAcrescValorxDep.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger;
               _dMTBem.sqlProRataAcrescValorxDep.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
               FcdsAcrescValorxDep.Data := _dMTBem.sqlProRataAcrescValorxDep.Data;
               //-------------------------------------------------------------------------
               // Processa os Cálculos por Moeda e Taxa Depreciação
               //-------------------------------------------------------------------------
               while not FcdsAcrescValorxDep.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
                  // Taxa de Depreciação Processadas
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + inttostr(aIdBem[iProcBem]) + ') ' +
                          '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND ((HM.IDTIPOMOVIMENTACAO = 35) OR (HM.IDTIPOMOVIMENTACAO = 36))'+
                          '   AND (HM.IDREAVALACRESC = ' + FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsString + ') '+
                          '   AND (VM.IDTAXADEP = ' + FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                          'ORDER BY HM.IDTIPOMOVIMENTACAO';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  while not _cds.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Correção Monetária da Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36 then
                     begin
                        _dMTBem.sqlAtuAcresxDep1.Prepare;
                        _dMTBem.sqlAtuAcresxDep1.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                        _dMTBem.sqlAtuAcresxDep1.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlAtuAcresxDep1.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _dMTBem.sqlAtuAcresxDep1.ParamByName('CMDEP').AsFloat         := FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTBem.sqlAtuAcresxDep1.ParamByName('DATAULTCM').AsDateTime  := _cds.FieldByName('DATAULTDEP').AsDateTime;
                        if not ExecSQL(_dMTBem.sqlAtuAcresxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35 then
                     begin
                        _dMTBem.sqlAtuAcresxDep2.Prepare;
                        _dMTBem.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                        _dMTBem.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTBem.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _dMTBem.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTBem.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDateTime := _cds.FieldByName('DATAULTDEP').AsDateTime;
                        _dMTBem.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                        if not ExecSQL(_dMTBem.sqlAtuAcresxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     _cds.Next;
                  end;
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima moeda
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
            Raise Exception.Create(_dbUpdGrupo.MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove o Registro do Fechamento do Historico de Movimentações
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 0;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Estornando Lançamentos (Passo 1)...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlFecRemVlrHistMovBem.Prepare;
         _dMTBem.sqlFecRemVlrHistMovBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTBem.sqlFecRemVlrHistMovBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTBem.sqlFecRemVlrHistMovBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTBem.sqlFecRemVlrHistMovBem.ParamByName('DATAMOV').AsDateTime    := dDataMov;
         if not ExecSQL(_dMTBem.sqlFecRemVlrHistMovBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 0;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Estornando Lançamentos (Passo 2)...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlFecRemHistMovBem.Prepare;
         _dMTBem.sqlFecRemHistMovBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTBem.sqlFecRemHistMovBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTBem.sqlFecRemHistMovBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTBem.sqlFecRemHistMovBem.ParamByName('DATAMOV').AsDateTime    := dDataMov;
         if not ExecSQL(_dMTBem.sqlFecRemHistMovBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 0;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Estornando Lançamentos (Passo 3)...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlFecRemSldCtbBemxDep.Prepare;
         _dMTBem.sqlFecRemSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTBem.sqlFecRemSldCtbBemxDep.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTBem.sqlFecRemSldCtbBemxDep.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTBem.sqlFecRemSldCtbBemxDep.ParamByName('DATAMOV').AsDateTime    := dDataMov;
         if not ExecSQL(_dMTBem.sqlFecRemSldCtbBemxDep.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 0;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Estornando Lançamentos (Passo 4)...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlFecRemSaldoContabBem.Prepare;
         _dMTBem.sqlFecRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTBem.sqlFecRemSaldoContabBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTBem.sqlFecRemSaldoContabBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTBem.sqlFecRemSaldoContabBem.ParamByName('DATAMOV').AsDateTime    := dDataMov;
         if not ExecSQL(_dMTBem.sqlFecRemSaldoContabBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 0;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Registrando no Banco de Dados...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         Commit;
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Ajustar os Saldos Contábeis dos bens processados
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax := iQtdBens;
            iPrgBarPos := 0;
            sPrgBarMsg := 'Ajustando Saldo Contábil...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         for iProcBem := 0 to (iQtdBens - 1) do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               iPrgBarPos := iPrgBarPos + 1;
               sPrgBarMsg := 'Ajustando Saldo Contábil (' + inttostr(iPrgBarPos) + ' em ' + inttostr(iPrgBarMax) + ')...';
               IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
            except

            end;
            //----------------------------------------------------------------------------
            // Posiciona a Tabela BEM
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(iEmpresaProp,aIdBem[iProcBem]);
            //----------------------------------------------------------------------------
            // Posiciona a Tabela BEMXMOEDA
            //----------------------------------------------------------------------------
            _dMTBem.sqlFechamentoBemxMoeda.Prepare;
            _dMTBem.sqlFechamentoBemxMoeda.ParamByName('IDBEM').AsInteger    := aIdBem[iProcBem];
            _dMTBem.sqlFechamentoBemxMoeda.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            FcdsBemxMoeda.Data := _dMTBem.sqlFechamentoBemxMoeda.Data;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while not FcdsBemxMoeda.EOF do
            begin
               //-------------------------------------------------------------------------
               // Posiciona a Tabela BEMXDEP
               //-------------------------------------------------------------------------
               _dMTBem.sqlFechamentoBemxDep.Prepare;
               _dMTBem.sqlFechamentoBemxDep.ParamByName('IDPESSOA').AsInteger  := FcdsBemxMoeda.FieldByName('IDPESSOA').AsInteger;
               _dMTBem.sqlFechamentoBemxDep.ParamByName('IDBEM').AsInteger     := FcdsBemxMoeda.FieldByName('IDBEM').AsInteger;
               _dMTBem.sqlFechamentoBemxDep.ParamByName('MOECODIGO').AsInteger := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
               FcdsBemxDep.Data := _dMTBem.sqlFechamentoBemxDep.Data;
               //-------------------------------------------------------------------------
               // Processa os Cálculos por Moeda e Taxa Depreciação
               //-------------------------------------------------------------------------
               iFlgPai := 1;
               while not FcdsBemxDep.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Atualiza a tabela SALDOCONTABBEM
                  //----------------------------------------------------------------------
                  if not AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                FcdsBem.FieldByName('IDBEM').AsInteger,
                                                dDataMov,
                                                FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                iFlgPai) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsBemxDep.Next;
               end;
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            if (iProcBem mod 100) = 0 then
            begin
               Commit;
               StartTransaction;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            sPrgBarMsg := 'Finalizando...';
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarPos  := 1;
            IAppCliente.BarraProgresso_CB(sPrgBarMsg, iPrgBarMax, iPrgBarPos);
         except

         end;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            RollBack;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Função que executa a atualização da tabela de Saldo Contábil de Bens
//----------------------------------------------------------------------------------------
function TCtrlFechamento.AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer;
                                                dDataSld : tDateTime;
                                                iMoeCodigo, iTaxaDep,
                                                iGrupo, iLocalizacao, iResponsavel,
                                                iPai : Integer) : Boolean;
Var
   nSValOrg, nSCmBem,
   nSReavValOrg, nSReavCmBem,
   nSUltReavValOrg, nSUltReavCmBem,
   nSDepLanc, nSCmDep,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavDepLanc, nSUltReavCmDep      : Extended;

begin
   try
      //----------------------------------------------------------------------------------
      // Prepara os ClientDataSet's que irão gravar o saldo do bem
      //----------------------------------------------------------------------------------
      _dMTBem.sqlSaldoContabBem.Prepare;
      _dMTBem.sqlSaldoContabBem.ParamByName('IDBEM').AsInteger     := iBem;
      _dMTBem.sqlSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
      _dMTBem.sqlSaldoContabBem.ParamByName('DATASLD').AsDateTime  := dDataSld;
      _dMTBem.sqlSaldoContabBem.ParamByName('MOECODIGO').AsInteger := iMoeCodigo;
      FcdsSaldoContabBem.Data := _dMTBem.sqlSaldoContabBem.Data;
      _dMTBem.sqlSldCtbBemxDep.Prepare;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('IDBEM').AsInteger      := iBem;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
      _dMTBem.sqlSldCtbBemxDep.ParamByName('DATASLD').AsDateTime   := dDataSld;
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
      end else
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
      // Prepara o ClientDataSet que irá fornecer os valores movimentados
      // no bem por moeda x taxa depreciação
      //----------------------------------------------------------------------------------
      _dMTBem.sqlRCMovContabBemD.Prepare;
      _dMTBem.sqlRCMovContabBemD.ParamByName('PIDBEM').AsInteger     := iBem;
      _dMTBem.sqlRCMovContabBemD.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
      _dMTBem.sqlRCMovContabBemD.ParamByName('PMOECODIGO').AsInteger := iMoeCodigo;
      _dMTBem.sqlRCMovContabBemD.ParamByName('PIDTAXADEP').AsInteger := iTaxaDep;
      _dMTBem.sqlRCMovContabBemD.ParamByName('PDATASLD').AsDateTime  := dDataSld;
      FcdsMovContabBem.Data := _dMTBem.sqlRCMovContabBemD.Data;
      //----------------------------------------------------------------------------------
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
         //-------------------------------------------------------------------------------
         if iPai = 1 then
         begin
            FcdsSaldoContabBem.Append;
            FcdsSaldoContabBem.FieldByName('IDBEM').AsInteger         := FcdsMovContabBem.FieldByName('IDBEM').AsInteger;
            FcdsSaldoContabBem.FieldByName('IDPESSOA').AsInteger      := FcdsMovContabBem.FieldByName('IDPESSOA').AsInteger;
            FcdsSaldoContabBem.FieldByName('DATASLDBEM').AsDateTime   := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            FcdsSaldoContabBem.FieldByName('MOECODIGO').AsInteger     := iMoeCodigo;
            FcdsSaldoContabBem.FieldByName('VALORG').AsFloat          := nSValOrg;
            FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat           := nSCmBem;
            FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat      := nSReavValOrg;
            FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat       := nSReavCmBem;
            FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat   := nSUltReavValOrg;
            FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat    := nSUltReavCmBem;
            FcdsSaldoContabBem.FieldByName('IDGRUPO').AsInteger       := iGrupo;
            FcdsSaldoContabBem.FieldByName('IDLOCALIZACAO').AsInteger := iLocalizacao;
            FcdsSaldoContabBem.FieldByName('IDRESPONSAVEL').AsInteger := iResponsavel;
            FcdsSaldoContabBem.Post;
         end;
         //-------------------------------------------------------------------------------
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
         //-------------------------------------------------------------------------------
         FcdsMovContabBem.Next;
      end;
      FcdsMovContabBem.Close;
      //----------------------------------------------------------------------------------
      // Gravação dos dados nas tabelas SALDOCONTABBEM e SLDCTBBEMXDEP
      //----------------------------------------------------------------------------------
      if not ApplyCds(FcdsSaldoContabBem,_dbSaldoContabBem,[],[]) then
         Raise Exception.Create(_dbSaldoContabBem.MessageInfo);

      if not ApplyCds(FcdsSldCtbBemxDep,_dbSldCtbBemxDep,[],[]) then
         Raise Exception.Create(_dbSldCtbBemxDep.MessageInfo);
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

end.

