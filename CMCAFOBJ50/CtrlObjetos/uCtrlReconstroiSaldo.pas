unit uCtrlReconstroiSaldo;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP, Math, uCMMath,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes, uDiasUteis,
     dMTBem, uCtrlParamCAF;

Type
   TCtrlReconstroiSaldo = class(TCmControlObject)

   Protected
      procedure AfterInitialize; Override;

   Private
    //------------------------------------------------------------------------------------
    // Classes de Persistência
    //------------------------------------------------------------------------------------
    _dMTBem : tdtmMTBem;

    FcdsBem            : TClientDataSet;
    FcdsAtuDeprec      : TClientDataSet;
    FcdsBemxMoeda      : TClientDataSet;
    FcdsBemxDep        : TClientDataSet;
    FcdsAtuCusto       : TClientDataSet;
    FcdsMovContabBem   : TClientDataSet;
    FcdsSldCtbBemxDep  : TClientDataSet;
    FcdsSaldoContabBem : TClientDataSet;
    FcdsSCBTransf      : TClientDataSet;
    FcdsAux            : TClientDataSet;

    ParamCAF : TCtrlParamCAF;

    //------------------------------------------------------------------------------------
    // Barra de Progresso
    //------------------------------------------------------------------------------------
    iPrgBarPos: Integer;
    iPrgBarMax: Integer;
    sPrgBarMsg: String;

    procedure SetcdsAtuCusto(const Value: TClientDataSet);
    procedure SetcdsAtuDeprec(const Value: TClientDataSet);
    procedure SetcdsBem(const Value: TClientDataSet);
    procedure SetcdsBemxDep(const Value: TClientDataSet);
    procedure SetcdsBemxMoeda(const Value: TClientDataSet);
    procedure SetcdsMovContabBem(const Value: TClientDataSet);
    procedure SetcdsSaldoContabBem(const Value: TClientDataSet);
    procedure SetcdsSCBTransf(const Value: TClientDataSet);
    procedure SetcdsSldCtbBemxDep(const Value: TClientDataSet);
    procedure SetcdsAux(const Value: TClientDataSet);
    //------------------------------------------------------------------------------------
    // Funções Privativas
    //------------------------------------------------------------------------------------
    function GrupoExiste(nGrupo, nEmpresaProp : Extended) : Boolean;
    function LocalExiste(nLocal, nEmpresaProp : Extended) : Boolean;
    function RespExiste(nResp : Extended) : Boolean;
    function ConjuntoExiste(nConjunto, nEmpresaProp : Extended) : Boolean;
    function AtivProjetoExiste(nAtivProjeto, nEmpresaProp : Extended) : Boolean;

    function CMTranslate(sIgor : String) : String;

   Public

    property cdsBem            : TClientDataSet read FcdsBem            write SetcdsBem;
    property cdsBemxMoeda      : TClientDataSet read FcdsBemxMoeda      write SetcdsBemxMoeda;
    property cdsBemxDep        : TClientDataSet read FcdsBemxDep        write SetcdsBemxDep;
    property cdsSaldoContabBem : TClientDataSet read FcdsSaldoContabBem write SetcdsSaldoContabBem;
    property cdsSldCtbBemxDep  : TClientDataSet read FcdsSldCtbBemxDep  write SetcdsSldCtbBemxDep;
    property cdsMovContabBem   : TClientDataSet read FcdsMovContabBem   write SetcdsMovContabBem;
    property cdsSCBTransf      : TClientDataSet read FcdsSCBTransf      write SetcdsSCBTransf;
    property cdsAtuCusto       : TClientDataSet read FcdsAtuCusto       write SetcdsAtuCusto;
    property cdsAtuDeprec      : TClientDataSet read FcdsAtuDeprec      write SetcdsAtuDeprec;
    property cdsAux            : TClientDataSet read FcdsAux            write SetcdsAux;
    //------------------------------------------------------------------------------------
    // Métodos
    //------------------------------------------------------------------------------------
    constructor Create;  Override;
    destructor  Destroy; Override;
    //------------------------------------------------------------------------------------
    // Funções Públicas
    //------------------------------------------------------------------------------------
    //function Acionar(iEmpresaProp, iTipoBem, iTipoRemover, iBem, iGrupo : Integer;
    //                 sBilhete : String) : Boolean;
    function AcionarII(iEmpresaProp, iTipoBem, iTipoRemover, iBem, iGrupo : Integer;
                       sBilhete : String) : Boolean;
   end;

implementation

{ TCtrlReconstroiSaldo }

constructor TCtrlReconstroiSaldo.Create;
begin
   inherited;
   _dMTBem            := tdtmMTBem.Create(Self);

   FcdsBem            := TClientDataSet.Create(nil);
   FcdsBemxMoeda      := TClientDataSet.Create(nil);
   FcdsBemxDep        := TClientDataSet.Create(nil);
   FcdsSaldoContabBem := TClientDataSet.Create(nil);
   FcdsSldCtbBemxDep  := TClientDataSet.Create(nil);
   FcdsMovContabBem   := TClientDataSet.Create(nil);
   FcdsSCBTransf      := TClientDataSet.Create(nil);
   FcdsAtuCusto       := TClientDataSet.Create(nil);
   FcdsAtuDeprec      := TClientDataSet.Create(nil);
   FcdsAux            := TClientDataSet.Create(nil);

   ParamCAF := TCtrlParamCAF.Create;
end;

destructor TCtrlReconstroiSaldo.Destroy;
begin
   _dMTBem.Free;

   FcdsBem.Free;
   FcdsBemxMoeda.Free;
   FcdsBemxDep.Free;
   FcdsSaldoContabBem.Free;
   FcdsSldCtbBemxDep.Free;
   FcdsMovContabBem.Free;
   FcdsSCBTransf.Free;
   FcdsAtuCusto.Free;
   FcdsAtuDeprec.Free;
   FcdsAux.Free;

   ParamCAF.Free;
   inherited;
end;

procedure TCtrlReconstroiSaldo.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
end;
//========================================================================================
// Função que executa a atualização da tabela de Saldo Contábil de Bens
//----------------------------------------------------------------------------------------
function TCtrlReconstroiSaldo.AcionarII(iEmpresaProp, iTipoBem, iTipoRemover, iBem, iGrupo : Integer;
                                        sBilhete : String) : Boolean;
var
   bEntrou, bErroRemocao, bPai       : Boolean;
   iBensProcessados,
   ieGrupo, ieLocal, ieResp,
   ieConjunto, ieAtivProjeto         : Integer;
   nBem, nPessoa, nIdBem, nMoeda,
   nSValOrg, nSCmBem,
   nSDepLanc, nSCmDep,
   nSReavValOrg, nSReavCmBem,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavValOrg, nSUltReavCmBem,
   nSUltReavDepLanc, nSUltReavCmDep,
   nPlacaErro, nIdBemErro            : Extended;
   dDataMov                          : tDateTime;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ReconstroiSaldo(iEmpresaProp, iTipoBem, iTipoRemover,
                                                     iBem, iGrupo, sBilhete);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bErroRemocao := False;
      nPlacaErro := -1;
      nIdBemErro := -1;
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Remove os lançamentos de Saldo de um Bem ou de um grupo contábil de bens
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            sPrgBarMsg := CMTranslate('Removendo Saldos Anteriores...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         if (iBem > 0) or (iGrupo > 0) then
         begin
            if iBem > 0 then
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            end else
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[6] := ' ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[6] := ' ';
            end;
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[7] := ' AND (B.IDGRUPO = ' + inttostr(iGrupo) + ') ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[7] := ' AND (B.IDGRUPO = ' + inttostr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[7] := ' ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[7] := ' ';
            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRemSldCtbBemxDep.Prepare;
            _dMTBem.sqlRemSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlRemSldCtbBemxDep.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            if not ExecSQL(_dMTBem.sqlRemSldCtbBemxDep.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Removendo Saldo (1)') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            _dMTBem.sqlRemSaldoContabBem.Prepare;
            _dMTBem.sqlRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlRemSaldoContabBem.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            if not ExecSQL(_dMTBem.sqlRemSaldoContabBem.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Removendo Saldo (2)') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            Commit;
         end else
         begin
            //----------------------------------------------------------------------------
            // Remove os lançamentos de Saldo dos bens por bem
            //----------------------------------------------------------------------------
            if iTipoRemover = 2 then
            begin
               _cds.Data := GetDataPacket( ' SELECT /*+ RULE */ B.IDBEM ' +
                                           ' FROM BEM B, ' +
                                           '      GRUPO G, ' +
                                           '      PLANOGRUPO PG ' +
                                           ' WHERE (B.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (G.FLGIMOVEL = ' + inttostr(iTipoBem) + ' ) ' +
                                           '   AND (B.IDGRUPO = G.IDGRUPO) ' +
                                           '   AND (G.IDGRUPO = PG.IDGRUPO) ' );
               if _cds.IsEmpty then
                  Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
               //-------------------------------------------------------------------------
               try
                  sPrgBarMsg := CMTranslate('Removendo Saldos Anteriores...');
                  iPrgBarMax  := _cds.RecordCount;
                  iPrgBarPos  := 0;
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               iBensProcessados := 0;
               while not _cds.EOF do
               begin
                  _dMTBem.sqlRemSldCtbxDep.Prepare;
                  _dMTBem.sqlRemSldCtbxDep.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
                  _dMTBem.sqlRemSldCtbxDep.ParamByName('IDBEM').AsInteger    := _cds.FieldByName('IDBEM').AsInteger;
                  if not ExecSQL(_dMTBem.sqlRemSldCtbxDep.SQLChanged,False) then
                     Raise Exception.Create(CMTranslate('Removendo Saldo (1)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRemSaldoContab.Prepare;
                  _dMTBem.sqlRemSaldoContab.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
                  _dMTBem.sqlRemSaldoContab.ParamByName('IDBEM').AsInteger    := _cds.FieldByName('IDBEM').AsInteger;
                  if not ExecSQL(_dMTBem.sqlRemSaldoContab.SQLChanged,False) then
                     Raise Exception.Create(CMTranslate('Removendo Saldo (2)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  _cds.Next;
                  try
                     sPrgBarMsg := CMTranslate('Removendo Saldo Anterior ... (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')';
                     iPrgBarPos  := iPrgBarPos + 1;
                     DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                  except

                  end;
                  //----------------------------------------------------------------------
                  iBensProcessados := iBensProcessados + 1;
                  if iBensProcessados = 20 then
                  begin
                     Commit;
                     StartTransaction;
                  end;
               end;
               //-------------------------------------------------------------------------
               Commit;
               _cds.Close;
            end else
            //----------------------------------------------------------------------------
            // Remove os lançamentos de Saldo dos bens por Grupo Contábil
            //----------------------------------------------------------------------------
            if iTipoRemover = 0 then
            begin
               _cds.Data := GetDataPacket( ' SELECT /*+ RULE */ DISTINCT B.IDGRUPO, B.IDPESSOA ' +
                                           ' FROM BEM B, ' +
                                           '      GRUPO G, ' +
                                           '      PLANOGRUPO PG ' +
                                           ' WHERE (G.FLGIMOVEL = ' + inttostr(iTipoBem) + ' ) ' +
                                           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (B.IDGRUPO = G.IDGRUPO) ' +
                                           '   AND (G.IDGRUPO = PG.IDGRUPO) ' );
               if _cds.IsEmpty then
                  Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  _dMTBem.sqlRemSldCtbGrupoxDep.Prepare;
                  _dMTBem.sqlRemSldCtbGrupoxDep.ParamByName('IDGRUPO').AsInteger  := _cds.FieldByName('IDGRUPO').AsInteger;
                  _dMTBem.sqlRemSldCtbGrupoxDep.ParamByName('IDPESSOA').AsInteger := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSldCtbGrupoxDep.SQLChanged);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRemSaldoContabGrupo.Prepare;
                  _dMTBem.sqlRemSaldoContabGrupo.ParamByName('IDGRUPO').AsInteger  := _cds.FieldByName('IDGRUPO').AsInteger;
                  _dMTBem.sqlRemSaldoContabGrupo.ParamByName('IDPESSOA').AsInteger := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSaldoContabGrupo.SQLChanged);
                  //----------------------------------------------------------------------
                  Commit;
                  //----------------------------------------------------------------------
                  _cds.Next;
                  if not _cds.EOF then
                     StartTransaction;
               end;
               _cds.Close;
            end else
            //----------------------------------------------------------------------------
            // Remove os lançamentos de Saldo dos bens por Conjunto
            //----------------------------------------------------------------------------
            begin
               _cds.Data := GetDataPacket( ' SELECT DISTINCT B.IDCONJUNTO, B.IDPESSOA ' +
                                           ' FROM BEM B, ' +
                                           '      GRUPO G, ' +
                                           '      PLANOGRUPO PG ' +
                                           ' WHERE (G.FLGIMOVEL = ' + inttostr(iTipoBem) + ' ) ' +
                                           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (B.IDGRUPO = G.IDGRUPO) ' +
                                           '   AND (G.IDGRUPO = PG.IDGRUPO) ' );
               if _cds.IsEmpty then
                  Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  _dMTBem.sqlRemSldCtbConjxDep.Prepare;
                  _dMTBem.sqlRemSldCtbConjxDep.ParamByName('PFLGIMOVEL').AsInteger  := iTipoBem;
                  _dMTBem.sqlRemSldCtbConjxDep.ParamByName('PIDCONJUNTO').AsInteger := _cds.FieldByName('IDCONJUNTO').AsInteger;
                  _dMTBem.sqlRemSldCtbConjxDep.ParamByName('IDPESSOA').AsInteger    := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSldCtbConjxDep.SQLChanged);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRemSaldoContabConj.Prepare;
                  _dMTBem.sqlRemSaldoContabConj.ParamByName('PFLGIMOVEL').AsInteger  := iTipoBem;
                  _dMTBem.sqlRemSaldoContabConj.ParamByName('PIDCONJUNTO').AsInteger := _cds.FieldByName('IDCONJUNTO').AsInteger;
                  _dMTBem.sqlRemSaldoContabConj.ParamByName('IDPESSOA').AsInteger    := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSaldoContabConj.SQLChanged);
                  //----------------------------------------------------------------------
                  Commit;
                  //----------------------------------------------------------------------
                  _cds.Next;
                  if not _cds.EOF then
                     StartTransaction;
               end;
               _cds.Close;
            end;
         end;
      except
         on E : Exception do
         begin
            RollBack;
            bErroRemocao := True;
            MessageInfo := E.Message;
         end;
      end;
      //----------------------------------------------------------------------------------
      if not bErroRemocao then
      begin
         try
            sPrgBarMsg := CMTranslate('Iniciando...');
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         StartTransaction;
         try
            //----------------------------------------------------------------------------
            // Reconstroi o saldo contábil dos bens ao longo de suas vidas úteis nas
            // tabelas SALDOCONTABBEM e SLDCTBBEMXDEP
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCBem.SQL.Strings[9] := ' AND BD.IDBEM = ' + inttostr(iBem);
            end else
            begin
               _dMTBem.sqlRCBem.SQL.Strings[9] := ' ';
            end;
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCBem.SQL.Strings[10] := ' AND B.IDGRUPO = ' + inttostr(iGrupo);
            end else
            begin
               _dMTBem.sqlRCBem.SQL.Strings[10] := ' ';
            end;
            _dMTBem.sqlRCBem.Prepare;
            _dMTBem.sqlRCBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCBem.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsBem.Data := _dMTBem.sqlRCBem.Data;
            if FcdsBem.IsEmpty then
               Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsBem.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            if FcdsBem.IsEmpty then
            begin
               Commit;
               Result := True;
               Exit;
            end;
            //----------------------------------------------------------------------------
            bEntrou := False;
            iBensProcessados := 0;
            nMoeda := -2;
            while not FcdsBem.EOF do
            begin
               bEntrou := True;
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Reconstruindo Saldo ... (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')';
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               nPlacaErro := FcdsBem.FieldByName('PLACA').AsFloat;
               nIdBemErro := FcdsBem.FieldByName('IDBEM').AsFloat;
               //-------------------------------------------------------------------------
               nIdBem := FcdsBem.FieldByName('IDBEM').AsFloat;
               if nMoeda <> FcdsBem.FieldByName('MOECODIGO').AsFloat then
               begin
                  nMoeda := FcdsBem.FieldByName('MOECODIGO').AsFloat;
                  bPai := True;
               end else
               begin
                  bPai := False;
               end;
               //-------------------------------------------------------------------------
               nSValOrg := 0; nSCmBem := 0; nSDepLanc := 0; nSCmDep := 0;
               nSReavValOrg := 0; nSReavCmBem := 0; nSReavDepLanc := 0; nSReavCmDep := 0;
               nSUltReavValOrg := 0; nSUltReavCmBem := 0; nSUltReavDepLanc := 0; nSUltReavCmDep := 0;
               //-------------------------------------------------------------------------
               // Prepara o ClientDataSet que irá fornecer os valores movimentados
               // no bem por moeda x taxa depreciação
               //-------------------------------------------------------------------------
               _dMTBem.sqlRCMovContabBem.Prepare;
               _dMTBem.sqlRCMovContabBem.ParamByName('PIDBEM').AsInteger     := FcdsBem.FieldByName('IDBEM').AsInteger;
               _dMTBem.sqlRCMovContabBem.ParamByName('PIDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
               _dMTBem.sqlRCMovContabBem.ParamByName('PMOECODIGO').AsInteger := FcdsBem.FieldByName('MOECODIGO').AsInteger;
               _dMTBem.sqlRCMovContabBem.ParamByName('PIDTAXADEP').AsInteger := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
               FcdsMovContabBem.Data := _dMTBem.sqlRCMovContabBem.Data;
               //-------------------------------------------------------------------------
               while not FcdsMovContabBem.EOF do
               begin
                  nSValOrg         := nSValOrg         + FcdsMovContabBem.FieldByName('VALORG').AsFloat;
                  nSCmBem          := nSCmBem          + FcdsMovContabBem.FieldByName('CMBEM').AsFloat;
                  nSDepLanc        := nSDepLanc        + FcdsMovContabBem.FieldByName('DEPLANC').AsFloat;
                  nSCmDep          := nSCmDep          + FcdsMovContabBem.FieldByName('CMDEP').AsFloat;
                  nSReavValOrg     := nSReavValOrg     + FcdsMovContabBem.FieldByName('REAVVALORG').AsFloat;
                  nSReavCmBem      := nSReavCmBem      + FcdsMovContabBem.FieldByName('REAVCMBEM').AsFloat;
                  nSReavDepLanc    := nSReavDepLanc    + FcdsMovContabBem.FieldByName('REAVDEPLANC').AsFloat;
                  nSReavCmDep      := nSReavCmDep      + FcdsMovContabBem.FieldByName('REAVCMDEP').AsFloat;
                  nSUltReavValOrg  := nSUltReavValOrg  + FcdsMovContabBem.FieldByName('ULTREAVVALORG').AsFloat;
                  nSUltReavCmBem   := nSUltReavCmBem   + FcdsMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
                  nSUltReavDepLanc := nSUltReavDepLanc + FcdsMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
                  nSUltReavCmDep   := nSUltReavCmDep   + FcdsMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
                  //----------------------------------------------------------------------
                  if bPai then
                  begin
                     _dMTBem.sqlRCInsSaldoContabBem.Prepare;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDBEM').AsInteger        := FcdsBem.FieldByName('IDBEM').AsInteger;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger     := FcdsBem.FieldByName('IDPESSOA').AsInteger;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('MOECODIGO').AsInteger    := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('DATASLDBEM').AsDate      := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('VALORG').AsFloat         := nSValOrg;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('CMBEM').AsFloat          := nSCmBem;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('REAVVALORG').AsFloat     := nSReavValOrg;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('REAVCMBEM').AsFloat      := nSReavCmBem;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDGRUPO').AsFloat        := FcdsBem.FieldByName('IDGRUPO').AsInteger;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDLOCALIZACAO').AsFloat  := FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDRESPONSAVEL').AsFloat  := FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger;
                     _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDCONJUNTO').AsFloat     := FcdsBem.FieldByName('IDCONJUNTO').AsInteger;
                     //-------------------------------------------------------------------
                     if not FcdsBem.FieldByName('UNIDNEGOC').IsNull then
                        _dMTBem.sqlRCInsSaldoContabBem.ParamByName('UNIDNEGOC').AsFloat := FcdsBem.FieldByName('UNIDNEGOC').AsInteger
                     else
                        _dMTBem.sqlRCInsSaldoContabBem.ParamByName('UNIDNEGOC').Clear;
                     //-------------------------------------------------------------------
                     if not ExecSQL(_dMTBem.sqlRCInsSaldoContabBem.SQLChanged, True) then
                        Raise Exception.Create(CMTranslate('Incluindo Saldo (1)') + #13 + MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRCInsSldCtbBemxDep.Prepare;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('IDBEM').AsInteger           := FcdsBem.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger        := FcdsBem.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('MOECODIGO').AsInteger       := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('IDSLDCTBBEMXDEP').AsInteger := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('DATASLDBEM').AsDate         := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('DEPLANC').AsFloat           := nSDepLanc;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('CMDEP').AsFloat             := nSCmDep;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('REAVDEPLANC').AsFloat       := nSReavDepLanc;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('REAVCMDEP').AsFloat         := nSReavCmDep;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep;
                  if not ExecSQL(_dMTBem.sqlRCInsSldCtbBemxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Incluindo Saldo (2)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsMovContabBem.Next;
               end;
               //-------------------------------------------------------------------------
               FcdsBem.Next;
               //-------------------------------------------------------------------------
               if not FcdsBem.EOF then
               begin
                  if FcdsBem.FieldByName('IDBEM').AsFloat <> nIdBem then
                  begin
                     iBensProcessados := iBensProcessados + 1;
                     nMoeda := -2;
                  end;
               end else
               begin
                  iBensProcessados := iBensProcessados + 1;
               end;
               //-------------------------------------------------------------------------
               if (iBensProcessados = 30) or (FcdsBem.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            if not bEntrou then
               Raise Exception.Create(CMTranslate('Não entrou na Fase II de Reconstrução'));
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando ...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Atualização do histórico de transferências
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[10] := ' AND (SC.IDBEM = ' + IntToStr(iBem) + ') ';
            end else
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[10] := ' ';
            end;
            if iGrupo > 0 then
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[11] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[11] := ' ';
            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlSCBTransf.Prepare;
            _dMTBem.sqlSCBTransf.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlSCBTransf.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            FcdsSCBTransf.Data := _dMTBem.sqlSCBTransf.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsSCBTransf.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando ...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsSCBTransf.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Reconstruindo Locais ...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               nPlacaErro := FcdsSCBTransf.FieldByName('PLACA').AsFloat;
               nIdBemErro := FcdsSCBTransf.FieldByName('IDBEM').AsFloat;
               //-------------------------------------------------------------------------
               nBem    := FcdsSCBTransf.FieldByName('IDBEM').AsFloat;
               nPessoa := FcdsSCBTransf.FieldByName('IDPESSOA').AsFloat;
               ieGrupo := FcdsSCBTransf.FieldByName('IDGRUPO').AsInteger;
               ieLocal := FcdsSCBTransf.FieldByName('IDLOCALIZACAO').AsInteger;
               ieResp  := FcdsSCBTransf.FieldByName('IDRESPONSAVEL').AsInteger;
               //-------------------------------------------------------------------------
               ieConjunto := FcdsSCBTransf.FieldByName('IDCONJUNTO').AsInteger;
               //-------------------------------------------------------------------------
               if not FcdsSCBTransf.FieldByName('UNIDNEGOC').IsNull then
                  ieAtivProjeto := FcdsSCBTransf.FieldByName('UNIDNEGOC').AsInteger
               else
                  ieAtivProjeto := -9;
               //-------------------------------------------------------------------------
               // Dados de transferencia anteriores do bem
               //-------------------------------------------------------------------------
               _dMTBem.sqlRCMovTransf.Prepare;
               _dMTBem.sqlRCMovTransf.ParamByName('IDBEM').AsFloat    := nBem;
               _dMTBem.sqlRCMovTransf.ParamByName('IDPESSOA').AsFloat := nPessoa;
               FcdsMovContabBem.Data := _dMTBem.sqlRCMovTransf.Data;
               while (not FcdsSCBTransf.EOF) and (FcdsSCBTransf.FieldByName('IDBEM').AsFloat = nBem) and
                                                 (FcdsSCBTransf.FieldByName('IDPESSOA').AsFloat = nPessoa) do
               begin
                  if not FcdsMovContabBem.IsEmpty then
                  begin
                     //-------------------------------------------------------------------
                     // Atualiza os dados na tabela SALDOCONTABBEM
                     //-------------------------------------------------------------------
                     _dMTBem.sqlUpdSCBTransf.Prepare;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDBEM').AsFloat           := nBem;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDPESSOA').AsFloat        := nPessoa;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('DATASLDBEM').AsDate       := FcdsSCBTransf.FieldByName('DATASLDBEM').AsDateTime;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDGRUPO').AsInteger       := ieGrupo;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDLOCALIZACAO').AsInteger := ieLocal;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDRESPONSAVEL').AsInteger := ieResp;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDCONJUNTO').AsInteger    := ieConjunto;
                     //-------------------------------------------------------------------
                     if ieAtivProjeto <> -9 then
                        _dMTBem.sqlUpdSCBTransf.ParamByName('UNIDNEGOC').AsInteger := ieAtivProjeto
                     else
                        _dMTBem.sqlUpdSCBTransf.ParamByName('UNIDNEGOC').Clear;
                     //-------------------------------------------------------------------
                     if not ExecSQL(_dMTBem.sqlUpdSCBTransf.SQLChanged, True) then
                        Raise Exception.Create(CMTranslate('Atualizando Transferencias') + #13 + MessageInfo);
                     //-------------------------------------------------------------------
                     // Verifica mudança no grupo, localização ou responsável do bem
                     //-------------------------------------------------------------------
                     if not FcdsMovContabBem.IsEmpty then
                     begin
                        if FcdsSCBTransf.FieldByName('DATASLDBEM').AsDateTime = FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime then
                        begin
                           dDataMov := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                           while (not FcdsMovContabBem.EOF) and
                                 (FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                           begin
                              if not FcdsMovContabBem.FieldByName('IDGRUPANT').IsNull then
                                 if GrupoExiste(FcdsMovContabBem.FieldByName('IDGRUPANT').AsFloat, iEmpresaProp) then
                                    ieGrupo := FcdsMovContabBem.FieldByName('IDGRUPANT').AsInteger;
                              if not FcdsMovContabBem.FieldByName('IDLOCALANT').IsNull then
                                 if LocalExiste(FcdsMovContabBem.FieldByName('IDLOCALANT').AsFloat, iEmpresaProp) then
                                    ieLocal := FcdsMovContabBem.FieldByName('IDLOCALANT').AsInteger;
                              if not FcdsMovContabBem.FieldByName('IDRESPANT').IsNull then
                                 if RespExiste(FcdsMovContabBem.FieldByName('IDRESPANT').AsFloat) then
                                    ieResp  := FcdsMovContabBem.FieldByName('IDRESPANT').AsInteger;
                              //----------------------------------------------------------
                              if not FcdsMovContabBem.FieldByName('IDCONJANT').IsNull then
                                 if ConjuntoExiste(FcdsMovContabBem.FieldByName('IDCONJANT').AsFloat, iEmpresaProp) then
                                    ieConjunto := FcdsMovContabBem.FieldByName('IDCONJANT').AsInteger;
                              if not FcdsMovContabBem.FieldByName('UNIDNEGOCANT').IsNull then
                                 if AtivProjetoExiste(FcdsMovContabBem.FieldByName('UNIDNEGOCANT').AsFloat, iEmpresaProp) then
                                    ieAtivProjeto := FcdsMovContabBem.FieldByName('UNIDNEGOCANT').AsInteger;
                              //----------------------------------------------------------
                              FcdsMovContabBem.Next;
                           end;
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsSCBTransf.Next;
               end;
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsSCBTransf.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            nPlacaErro := -1;
            nIdBemErro := -1;
            //----------------------------------------------------------------------------
            // Registra nas tabelas cadastrais os saldos atualizados
            //----------------------------------------------------------------------------
            // Processa as tabela Bem e BemxDep
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[23] := ' AND (HM.IDBEM = ' + IntToStr(iBem) + ') ';
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[33] := ' AND (B.IDBEM = ' + IntToStr(iBem) + ') ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = ' + IntToStr(iBem) + ') ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[30] := ' AND (B.IDBEM = ' + IntToStr(iBem) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[23] := ' ';
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[33] := ' ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[20] := ' ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[30] := ' ';
            end;
            //----------------------------------------------------------------------------
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[34] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[31] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[34] := ' ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[31] := ' ';
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Consistencia...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovBemxMoeda2.Prepare;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovBemxMoeda2.Data;
            _dMTBem.sqlRCMovBemxDep2.Prepare;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovBemxDep2.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuCusto.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Consistencia... (Custo)');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuCusto.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia... (Custo)');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
               nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsValOrg <> FcdsAtuCusto.FieldByName('VALORG').AsFloat) or
                  (nsCmBem  <> FcdsAtuCusto.FieldByName('CMBEM').AsFloat) then
               begin
                  _dMTBem.sqlAtuBem.Prepare;
                  _dMTBem.sqlAtuBem.ParamByName('IDBEM').AsInteger     := FcdsAtuCusto.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlAtuBem.ParamByName('IDPESSOA').AsInteger  := FcdsAtuCusto.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlAtuBem.ParamByName('MOECODIGO').AsInteger := FcdsAtuCusto.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuBem.ParamByName('VALORG').AsFloat      := nsValorg;
                  _dMTBem.sqlAtuBem.ParamByName('CMBEM').AsFloat       := nsCmBem;
                  if not ExecSQL(_dMTBem.sqlAtuBem.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (1.1)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuCusto.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsAtuCusto.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuDeprec.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Consistencia... (Depreciação)');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuDeprec.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia... (Depreciação)');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
               nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsDepLanc <> FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat) or
                  (nsCmDep <> FcdsAtuDeprec.FieldByName('CMDEP').AsFloat) then
               begin
                  _dMTBem.sqlAtuBemxDep.Prepare;
                  _dMTBem.sqlAtuBemxDep.ParamByName('IDBEM').AsInteger     := FcdsAtuDeprec.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('IDPESSOA').AsInteger  := FcdsAtuDeprec.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('MOECODIGO').AsInteger := FcdsAtuDeprec.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('IDTAXADEP').AsInteger := FcdsAtuDeprec.FieldByName('IDBEMXDEP').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('DEPLANC').AsFloat     := nsDepLanc;
                  _dMTBem.sqlAtuBemxDep.ParamByName('CMDEP').AsFloat       := nsCmDep;
                  if not ExecSQL(_dMTBem.sqlAtuBemxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (1.2)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuDeprec.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsAtuDeprec.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            // Processa as tabela Reavaliacao e ReavalxDep
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[19] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[29] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[30] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            end else
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[19] := ' ';
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[29] := ' ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[20] := ' ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[30] := ' ';
            end;
            //----------------------------------------------------------------------------
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[30] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[31] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[30] := ' ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[31] := ' ';
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Reavaliações...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovReavalxMoeda2.Prepare;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovReavalxMoeda2.Data;
            _dMTBem.sqlRCMovReavalxDep2.Prepare;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovReavalxDep2.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuCusto.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Reavaliações...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuCusto.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Reavaliações)...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);                  
               except

               end;
               //-------------------------------------------------------------------------
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
               nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsValOrg <> FcdsAtuCusto.FieldByName('VALORG').AsFloat) or
                  (nsCmBem  <> FcdsAtuCusto.FieldByName('CMBEM').AsFloat) then
               begin
                  _dMTBem.sqlAtuReavaliacao.Prepare;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('IDREAVALIACAO').AsInteger := FcdsAtuCusto.FieldByName('IDREAVALIACAO').AsInteger;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('MOECODIGO').AsInteger     := FcdsAtuCusto.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('VALORG').AsFloat          := nsValorg;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('CMBEM').AsFloat           := nsCmBem;
                  if not ExecSQL(_dMTBem.sqlAtuReavaliacao.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (2.1)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuCusto.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsAtuCusto.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuDeprec.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Reavaliações...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuDeprec.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Reavaliações (Dep.)...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
               nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsDepLanc <> FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat) or
                  (nsCmDep <> FcdsAtuDeprec.FieldByName('CMDEP').AsFloat) then
               begin
                  _dMTBem.sqlAtuReavalxDep.Prepare;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('IDREAVALIACAO').AsInteger := FcdsAtuDeprec.FieldByName('IDREAVALIACAO').AsInteger;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('MOECODIGO').AsInteger     := FcdsAtuDeprec.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('IDTAXADEP').AsInteger     := FcdsAtuDeprec.FieldByName('IDREAVALXDEP').AsInteger;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('DEPLANC').AsFloat         := nsDepLanc;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('CMDEP').AsFloat           := nsCmDep;
                  if not ExecSQL(_dMTBem.sqlAtuReavalxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (2.2)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuDeprec.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsAtuDeprec.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            // Processa as tabela AcrescimoValor e AcrescValorxDep
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[17] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[27] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[18] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[28] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            end else
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[17] := ' ';
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[27] := ' ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[18] := ' ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[28] := ' ';
            end;
            //----------------------------------------------------------------------------
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[28] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[29] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[28] := ' ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[29] := ' ';
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Acréscimos...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovAcresxMoeda2.Prepare;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovAcresxMoeda2.Data;
            _dMTBem.sqlRCMovAcresxDep2.Prepare;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovAcresxDep2.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuCusto.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Acréscimos...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuCusto.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Acréscimos)...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
               nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsValOrg <> FcdsAtuCusto.FieldByName('VALORG').AsFloat) or
                  (nsCmBem  <> FcdsAtuCusto.FieldByName('CMBEM').AsFloat) then
               begin
                  _dMTBem.sqlAtuAcrescimo.Prepare;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('IDACRESCIMO').AsInteger := FcdsAtuCusto.FieldByName('IDACRESCIMO').AsInteger;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('MOECODIGO').AsInteger   := FcdsAtuCusto.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('VALORG').AsFloat        := nsValorg;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('CMBEM').AsFloat         := nsCmBem;
                  if not ExecSQL(_dMTBem.sqlAtuAcrescimo.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (3.1)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuCusto.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsAtuCusto.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuDeprec.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Acréscimos...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuDeprec.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Acréscimos (Dep.))...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
               nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsDepLanc <> FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat) or
                  (nsCmDep <> FcdsAtuDeprec.FieldByName('CMDEP').AsFloat) then
               begin
                  _dMTBem.sqlAtuAcrescxDep.Prepare;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('IDACRESCIMO').AsInteger := FcdsAtuDeprec.FieldByName('IDACRESCIMO').AsInteger;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('MOECODIGO').AsInteger   := FcdsAtuDeprec.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('IDTAXADEP').AsInteger   := FcdsAtuDeprec.FieldByName('IDACRESCIMOXDEP').AsInteger;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('DEPLANC').AsFloat       := nsDepLanc;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('CMDEP').AsFloat         := nsCmDep;
                  if not ExecSQL(_dMTBem.sqlAtuAcrescxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (3.2)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuDeprec.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 30) or (FcdsAtuDeprec.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            Commit;
            Result := True;
         except
            on E : Exception do
            begin
               RollBack;
               Result := False;
               MessageInfo := E.Message;
               if (nPlacaErro > 0) then
                  MessageInfo := MessageInfo + #13 + 'Placa ' + floattostr(nPlacaErro);
               if (nIdBemErro > 0) then
                  MessageInfo := MessageInfo + #13 + 'ID Bem ' + floattostr(nIdBemErro);
            end;
         end;
      end else
      begin
         Result := False;
      end;
   end;
end;
//========================================================================================
function TCtrlReconstroiSaldo.GrupoExiste(nGrupo, nEmpresaProp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT G.IDGRUPO ' +
                                 ' FROM GRUPO G, ' +
                                 '      PLANOGRUPO PG ' +
                                 ' WHERE (G.IDGRUPO = ' + floattostr(nGrupo) + ') ' +
                                 '   AND (PG.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                                 '   AND (G.TIPO = ''A'') ' +
                                 '   AND (G.IDGRUPO = PG.IDGRUPO) ');
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
function TCtrlReconstroiSaldo.LocalExiste(nLocal, nEmpresaProp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT IDLOCALIZACAO ' +
                                 ' FROM LOCALIZACAO ' +
                                 ' WHERE (IDLOCALIZACAO = ' + floattostr(nLocal) + ') ' +
                                 '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ') ;
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
function TCtrlReconstroiSaldo.RespExiste(nResp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT IDRESPONSAVEL ' +
                                 ' FROM RESPONSAVEL ' +
                                 ' WHERE (IDRESPONSAVEL = ' + floattostr(nResp) + ') ' +
                                 '   AND (FLGATIVOFIXO = 1) ') ;
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
function TCtrlReconstroiSaldo.ConjuntoExiste(nConjunto, nEmpresaProp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT IDCONJUNTO ' +
                                 ' FROM CONJUNTO ' +
                                 ' WHERE (IDCONJUNTO = ' + floattostr(nConjunto) + ' )' +
                                 '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )');
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
function TCtrlReconstroiSaldo.AtivProjetoExiste(nAtivProjeto, nEmpresaProp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT UNIDNEGOC ' +
                                 ' FROM UNIDNEGOCIO ' +
                                 ' WHERE (UNIDNEGOC = ' + floattostr(nAtivProjeto) + ' )' +
                                 '   AND (IDPESSOA = '+ floattostr(nEmpresaProp) + ' )');
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
procedure TCtrlReconstroiSaldo.SetcdsAtuCusto(const Value: TClientDataSet);
begin
  FcdsAtuCusto := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsAtuDeprec(const Value: TClientDataSet);
begin
  FcdsAtuDeprec := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsAux(const Value: TClientDataSet);
begin
  FcdsAux := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsMovContabBem(const Value: TClientDataSet);
begin
  FcdsMovContabBem := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
  FcdsSaldoContabBem := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsSCBTransf(const Value: TClientDataSet);
begin
  FcdsSCBTransf := Value;
end;

procedure TCtrlReconstroiSaldo.SetcdsSldCtbBemxDep(const Value: TClientDataSet);
begin
  FcdsSldCtbBemxDep := Value;
end;

function TCtrlReconstroiSaldo.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;
//========================================================================================
// Função que executa a atualização da tabela de Saldo Contábil de Bens
//----------------------------------------------------------------------------------------
{function TCtrlReconstroiSaldo.Acionar(iEmpresaProp, iTipoBem, iTipoRemover,
                                      iBem, iGrupo : Integer;
                                      sBilhete : String) : Boolean;
var
   bEntrou, bErroRemocao             : Boolean;
   iBensProcessados,
   ieGrupo, ieLocal, ieResp          : Integer;
   nBem, nPessoa, nIdBem,
   nSValOrg, nSCmBem,
   nSDepLanc, nSCmDep,
   nSReavValOrg, nSReavCmBem,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavValOrg, nSUltReavCmBem,
   nSUltReavDepLanc, nSUltReavCmDep,
   nPlacaErro, nIdBemErro            : Extended;
   dDataMov                          : tDateTime;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ReconstroiSaldo(iEmpresaProp, iTipoBem, iTipoRemover,
                                                     iBem, iGrupo, sBilhete);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bErroRemocao := False;
      nPlacaErro := -1;
      nIdBemErro := -1;
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Remove os lançamentos de Saldo de um Bem ou de um grupo contábil de bens
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            sPrgBarMsg := CMTranslate('Removendo Saldos Anteriores...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         if (iBem > 0) or (iGrupo > 0) then
         begin
            if iBem > 0 then
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            end else
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[6] := ' ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[6] := ' ';
            end;
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[7] := ' AND (B.IDGRUPO = ' + inttostr(iGrupo) + ') ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[7] := ' AND (B.IDGRUPO = ' + inttostr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[7] := ' ';
               _dMTBem.sqlRemSaldoContabBem.SQL.Strings[7] := ' ';
            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRemSldCtbBemxDep.Prepare;
            _dMTBem.sqlRemSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlRemSldCtbBemxDep.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            if not ExecSQL(_dMTBem.sqlRemSldCtbBemxDep.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Removendo Saldo (1)') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            _dMTBem.sqlRemSaldoContabBem.Prepare;
            _dMTBem.sqlRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlRemSaldoContabBem.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            if not ExecSQL(_dMTBem.sqlRemSaldoContabBem.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Removendo Saldo (2)') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            Commit;
         end else
         begin
            //----------------------------------------------------------------------------
            // Remove os lançamentos de Saldo dos bens por bem
            //----------------------------------------------------------------------------
            if iTipoRemover = 2 then
            begin
               _cds.Data := GetDataPacket( ' SELECT /*+ RULE */ B.IDBEM ' +
                                           ' FROM BEM B, ' +
                                           '      GRUPO G, ' +
                                           '      PLANOGRUPO PG ' +
                                           ' WHERE (B.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (G.FLGIMOVEL = ' + inttostr(iTipoBem) + ' ) ' +
                                           '   AND (B.IDGRUPO = G.IDGRUPO) ' +
                                           '   AND (G.IDGRUPO = PG.IDGRUPO) ' );
               if _cds.IsEmpty then
                  Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
               //-------------------------------------------------------------------------
               try
                  sPrgBarMsg := CMTranslate('Removendo Saldos Anteriores...');
                  iPrgBarMax  := _cds.RecordCount;
                  iPrgBarPos  := 0;
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               iBensProcessados := 0;
               while not _cds.EOF do
               begin
                  _dMTBem.sqlRemSldCtbxDep.Prepare;
                  _dMTBem.sqlRemSldCtbxDep.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
                  _dMTBem.sqlRemSldCtbxDep.ParamByName('IDBEM').AsInteger    := _cds.FieldByName('IDBEM').AsInteger;
                  if not ExecSQL(_dMTBem.sqlRemSldCtbxDep.SQLChanged,False) then
                     Raise Exception.Create(CMTranslate('Removendo Saldo (1)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRemSaldoContab.Prepare;
                  _dMTBem.sqlRemSaldoContab.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
                  _dMTBem.sqlRemSaldoContab.ParamByName('IDBEM').AsInteger    := _cds.FieldByName('IDBEM').AsInteger;
                  if not ExecSQL(_dMTBem.sqlRemSaldoContab.SQLChanged,False) then
                     Raise Exception.Create(CMTranslate('Removendo Saldo (2)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  _cds.Next;
                  try
                     sPrgBarMsg := CMTranslate('Removendo Saldo Anterior ... (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')';
                     iPrgBarPos  := iPrgBarPos + 1;
                     DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                  except

                  end;
                  //----------------------------------------------------------------------
                  iBensProcessados := iBensProcessados + 1;
                  if iBensProcessados = 20 then
                  begin
                     Commit;
                     StartTransaction;
                  end;
               end;
               //-------------------------------------------------------------------------
               Commit;
               _cds.Close;
            end else
            //----------------------------------------------------------------------------
            // Remove os lançamentos de Saldo dos bens por Grupo Contábil
            //----------------------------------------------------------------------------
            if iTipoRemover = 0 then
            begin
               _cds.Data := GetDataPacket( ' SELECT /*+ RULE */ DISTINCT B.IDGRUPO, B.IDPESSOA ' +
                                           ' FROM BEM B, ' +
                                           '      GRUPO G, ' +
                                           '      PLANOGRUPO PG ' +
                                           ' WHERE (G.FLGIMOVEL = ' + inttostr(iTipoBem) + ' ) ' +
                                           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (B.IDGRUPO = G.IDGRUPO) ' +
                                           '   AND (G.IDGRUPO = PG.IDGRUPO) ' );
               if _cds.IsEmpty then
                  Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  _dMTBem.sqlRemSldCtbGrupoxDep.Prepare;
                  _dMTBem.sqlRemSldCtbGrupoxDep.ParamByName('IDGRUPO').AsInteger  := _cds.FieldByName('IDGRUPO').AsInteger;
                  _dMTBem.sqlRemSldCtbGrupoxDep.ParamByName('IDPESSOA').AsInteger := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSldCtbGrupoxDep.SQLChanged);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRemSaldoContabGrupo.Prepare;
                  _dMTBem.sqlRemSaldoContabGrupo.ParamByName('IDGRUPO').AsInteger  := _cds.FieldByName('IDGRUPO').AsInteger;
                  _dMTBem.sqlRemSaldoContabGrupo.ParamByName('IDPESSOA').AsInteger := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSaldoContabGrupo.SQLChanged);
                  //----------------------------------------------------------------------
                  Commit;
                  //----------------------------------------------------------------------
                  _cds.Next;
                  if not _cds.EOF then
                     StartTransaction;
               end;
               _cds.Close;
            end else
            //----------------------------------------------------------------------------
            // Remove os lançamentos de Saldo dos bens por Conjunto
            //----------------------------------------------------------------------------
            begin
               _cds.Data := GetDataPacket( ' SELECT DISTINCT B.IDCONJUNTO, B.IDPESSOA ' +
                                           ' FROM BEM B, ' +
                                           '      GRUPO G, ' +
                                           '      PLANOGRUPO PG ' +
                                           ' WHERE (G.FLGIMOVEL = ' + inttostr(iTipoBem) + ' ) ' +
                                           '   AND (PG.IDPESSOA = ' + inttostr(iEmpresaProp) + ' ) ' +
                                           '   AND (B.IDGRUPO = G.IDGRUPO) ' +
                                           '   AND (G.IDGRUPO = PG.IDGRUPO) ' );
               if _cds.IsEmpty then
                  Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
               //-------------------------------------------------------------------------
               while not _cds.EOF do
               begin
                  _dMTBem.sqlRemSldCtbConjxDep.Prepare;
                  _dMTBem.sqlRemSldCtbConjxDep.ParamByName('PFLGIMOVEL').AsInteger  := iTipoBem;
                  _dMTBem.sqlRemSldCtbConjxDep.ParamByName('PIDCONJUNTO').AsInteger := _cds.FieldByName('IDCONJUNTO').AsInteger;
                  _dMTBem.sqlRemSldCtbConjxDep.ParamByName('IDPESSOA').AsInteger    := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSldCtbConjxDep.SQLChanged);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRemSaldoContabConj.Prepare;
                  _dMTBem.sqlRemSaldoContabConj.ParamByName('PFLGIMOVEL').AsInteger  := iTipoBem;
                  _dMTBem.sqlRemSaldoContabConj.ParamByName('PIDCONJUNTO').AsInteger := _cds.FieldByName('IDCONJUNTO').AsInteger;
                  _dMTBem.sqlRemSaldoContabConj.ParamByName('IDPESSOA').AsInteger    := _cds.FieldByName('IDPESSOA').AsInteger;
                  ExecSQL(_dMTBem.sqlRemSaldoContabConj.SQLChanged);
                  //----------------------------------------------------------------------
                  Commit;
                  //----------------------------------------------------------------------
                  _cds.Next;
                  if not _cds.EOF then
                     StartTransaction;
               end;
               _cds.Close;
            end;
         end;
      except
         on E : Exception do
         begin
            RollBack;
            bErroRemocao := True;
            MessageInfo := E.Message;
         end;
      end;
      //----------------------------------------------------------------------------------
      if not bErroRemocao then
      begin
         try
            sPrgBarMsg := CMTranslate('Iniciando...');
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         StartTransaction;
         try
            //----------------------------------------------------------------------------
            // Reconstroi o saldo contábil dos bens ao longo de suas vidas úteis nas
            // tabelas SALDOCONTABBEM e SLDCTBBEMXDEP
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCBem.SQL.Strings[9] := ' AND BD.IDBEM = ' + inttostr(iBem);
            end else
            begin
               _dMTBem.sqlRCBem.SQL.Strings[9] := ' ';
            end;
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCBem.SQL.Strings[10] := ' AND B.IDGRUPO = ' + inttostr(iGrupo);
            end else
            begin
               _dMTBem.sqlRCBem.SQL.Strings[10] := ' ';
            end;
            _dMTBem.sqlRCBem.Prepare;
            _dMTBem.sqlRCBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCBem.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsBem.Data := _dMTBem.sqlRCBem.Data;
            if FcdsBem.IsEmpty then
               Raise Exception.Create('Não existem bens cadastrados no grupo selecionado');
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsBem.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            bEntrou := False;
            iBensProcessados := 0;
            while not FcdsBem.EOF do
            begin
               bEntrou := True;
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Reconstruindo Saldo ... (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')';
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               nPlacaErro := FcdsBem.FieldByName('PLACA').AsFloat;
               nIdBemErro := FcdsBem.FieldByName('IDBEM').AsFloat;
               //-------------------------------------------------------------------------
               nIdBem := FcdsBem.FieldByName('IDBEM').AsFloat;
               //-------------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
               // Prepara o ClientDataSet que irá fornecer os valores movimentados
               // no bem por moeda x taxa depreciação
               //-------------------------------------------------------------------------
               _dMTBem.sqlRCMovContabBem.Prepare;
               _dMTBem.sqlRCMovContabBem.ParamByName('PIDBEM').AsInteger     := FcdsBem.FieldByName('IDBEM').AsInteger;
               _dMTBem.sqlRCMovContabBem.ParamByName('PIDPESSOA').AsInteger  := FcdsBem.FieldByName('IDPESSOA').AsInteger;
               _dMTBem.sqlRCMovContabBem.ParamByName('PMOECODIGO').AsInteger := FcdsBem.FieldByName('MOECODIGO').AsInteger;
               _dMTBem.sqlRCMovContabBem.ParamByName('PIDTAXADEP').AsInteger := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
               FcdsMovContabBem.Data := _dMTBem.sqlRCMovContabBem.Data;
               //-------------------------------------------------------------------------
               while not FcdsMovContabBem.EOF do
               begin
                  nSValOrg         := nSValOrg         + FcdsMovContabBem.FieldByName('VALORG').AsFloat;
                  nSCmBem          := nSCmBem          + FcdsMovContabBem.FieldByName('CMBEM').AsFloat;
                  nSDepLanc        := nSDepLanc        + FcdsMovContabBem.FieldByName('DEPLANC').AsFloat;
                  nSCmDep          := nSCmDep          + FcdsMovContabBem.FieldByName('CMDEP').AsFloat;
                  nSReavValOrg     := nSReavValOrg     + FcdsMovContabBem.FieldByName('REAVVALORG').AsFloat;
                  nSReavCmBem      := nSReavCmBem      + FcdsMovContabBem.FieldByName('REAVCMBEM').AsFloat;
                  nSReavDepLanc    := nSReavDepLanc    + FcdsMovContabBem.FieldByName('REAVDEPLANC').AsFloat;
                  nSReavCmDep      := nSReavCmDep      + FcdsMovContabBem.FieldByName('REAVCMDEP').AsFloat;
                  nSUltReavValOrg  := nSUltReavValOrg  + FcdsMovContabBem.FieldByName('ULTREAVVALORG').AsFloat;
                  nSUltReavCmBem   := nSUltReavCmBem   + FcdsMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
                  nSUltReavDepLanc := nSUltReavDepLanc + FcdsMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
                  nSUltReavCmDep   := nSUltReavCmDep   + FcdsMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRCInsSaldoContabBem.Prepare;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDBEM').AsInteger        := FcdsBem.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger     := FcdsBem.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('MOECODIGO').AsInteger    := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('DATASLDBEM').AsDate      := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('VALORG').AsFloat         := nSValOrg;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('CMBEM').AsFloat          := nSCmBem;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('REAVVALORG').AsFloat     := nSReavValOrg;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('REAVCMBEM').AsFloat      := nSReavCmBem;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsFloat  := nSUltReavValOrg;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsFloat   := nSUltReavCmBem;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDGRUPO').AsFloat        := FcdsBem.FieldByName('IDGRUPO').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDLOCALIZACAO').AsFloat  := FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDRESPONSAVEL').AsFloat  := FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger;
                  if not ExecSQL(_dMTBem.sqlRCInsSaldoContabBem.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Incluindo Saldo (1)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  _dMTBem.sqlRCInsSldCtbBemxDep.Prepare;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('IDBEM').AsInteger           := FcdsBem.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger        := FcdsBem.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('MOECODIGO').AsInteger       := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('IDSLDCTBBEMXDEP').AsInteger := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('DATASLDBEM').AsDate         := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('DEPLANC').AsFloat           := nSDepLanc;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('CMDEP').AsFloat             := nSCmDep;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('REAVDEPLANC').AsFloat       := nSReavDepLanc;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('REAVCMDEP').AsFloat         := nSReavCmDep;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc;
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep;
                  if not ExecSQL(_dMTBem.sqlRCInsSldCtbBemxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Incluindo Saldo (2)') + #13 + MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsMovContabBem.Next;
               end;
               //-------------------------------------------------------------------------
               FcdsBem.Next;
               //-------------------------------------------------------------------------
               if not FcdsBem.EOF then
               begin
                  if FcdsBem.FieldByName('IDBEM').AsFloat <> nIdBem then
                     iBensProcessados := iBensProcessados + 1;
               end else
                  iBensProcessados := iBensProcessados + 1;
               //-------------------------------------------------------------------------
               if (iBensProcessados = 30) or (FcdsBem.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            if not bEntrou then
               Raise Exception.Create(CMTranslate('Não entrou na Fase II de Reconstrução'));
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando ...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Atualização do histórico de transferências
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[10] := ' AND (SC.IDBEM = ' + IntToStr(iBem) + ') ';
            end else
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[10] := ' ';
            end;
            if iGrupo > 0 then
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[11] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlSCBTransf.SQL.Strings[11] := ' ';
            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlSCBTransf.Prepare;
            _dMTBem.sqlSCBTransf.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlSCBTransf.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            FcdsSCBTransf.Data := _dMTBem.sqlSCBTransf.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsSCBTransf.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando ...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsSCBTransf.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Reconstruindo Locais ...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               nPlacaErro := FcdsSCBTransf.FieldByName('PLACA').AsFloat;
               nIdBemErro := FcdsSCBTransf.FieldByName('IDBEM').AsFloat;
               //-------------------------------------------------------------------------
               nBem    := FcdsSCBTransf.FieldByName('IDBEM').AsFloat;
               nPessoa := FcdsSCBTransf.FieldByName('IDPESSOA').AsFloat;
               ieGrupo := FcdsSCBTransf.FieldByName('IDGRUPO').AsInteger;
               ieLocal := FcdsSCBTransf.FieldByName('IDLOCALIZACAO').AsInteger;
               ieResp  := FcdsSCBTransf.FieldByName('IDRESPONSAVEL').AsInteger;
               //-------------------------------------------------------------------------
               // Dados de transferencia anteriores do bem
               //-------------------------------------------------------------------------
               _dMTBem.sqlRCMovTransf.Prepare;
               _dMTBem.sqlRCMovTransf.ParamByName('IDBEM').AsFloat    := nBem;
               _dMTBem.sqlRCMovTransf.ParamByName('IDPESSOA').AsFloat := nPessoa;
               FcdsMovContabBem.Data := _dMTBem.sqlRCMovTransf.Data;
               while (not FcdsSCBTransf.EOF) and (FcdsSCBTransf.FieldByName('IDBEM').AsFloat = nBem) and
                                                 (FcdsSCBTransf.FieldByName('IDPESSOA').AsFloat = nPessoa) do
               begin
                  if not FcdsMovContabBem.IsEmpty then
                  begin
                     //-------------------------------------------------------------------
                     // Atualiza os dados na tabela SALDOCONTABBEM
                     //-------------------------------------------------------------------
                     _dMTBem.sqlUpdSCBTransf.Prepare;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDBEM').AsFloat           := nBem;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDPESSOA').AsFloat        := nPessoa;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('DATASLDBEM').AsDate       := FcdsSCBTransf.FieldByName('DATASLDBEM').AsDateTime;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDGRUPO').AsInteger       := ieGrupo;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDLOCALIZACAO').AsInteger := ieLocal;
                     _dMTBem.sqlUpdSCBTransf.ParamByName('IDRESPONSAVEL').AsInteger := ieResp;
                     if not ExecSQL(_dMTBem.sqlUpdSCBTransf.SQLChanged, True) then
                        Raise Exception.Create(CMTranslate('Atualizando Transferencias') + #13 + MessageInfo);
                     //-------------------------------------------------------------------
                     // Verifica mudança no grupo, localização ou responsável do bem
                     //-------------------------------------------------------------------
                     if not FcdsMovContabBem.IsEmpty then
                     begin
                        if FcdsSCBTransf.FieldByName('DATASLDBEM').AsDateTime = FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime then
                        begin
                           dDataMov := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                           while (not FcdsMovContabBem.EOF) and
                                 (FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                           begin
                              if not FcdsMovContabBem.FieldByName('IDGRUPANT').IsNull then
                                 if GrupoExiste(FcdsMovContabBem.FieldByName('IDGRUPANT').AsFloat, iEmpresaProp) then
                                    ieGrupo := FcdsMovContabBem.FieldByName('IDGRUPANT').AsInteger;
                              if not FcdsMovContabBem.FieldByName('IDLOCALANT').IsNull then
                                 if LocalExiste(FcdsMovContabBem.FieldByName('IDLOCALANT').AsFloat, iEmpresaProp) then
                                    ieLocal := FcdsMovContabBem.FieldByName('IDLOCALANT').AsInteger;
                              if not FcdsMovContabBem.FieldByName('IDRESPANT').IsNull then
                                 if RespExiste(FcdsMovContabBem.FieldByName('IDRESPANT').AsFloat) then
                                    ieResp  := FcdsMovContabBem.FieldByName('IDRESPANT').AsInteger;
                              //----------------------------------------------------------
                              FcdsMovContabBem.Next;
                           end;
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsSCBTransf.Next;
               end;
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsSCBTransf.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            nPlacaErro := -1;
            nIdBemErro := -1;
            //----------------------------------------------------------------------------
            // Registra nas tabelas cadastrais os saldos atualizados
            //----------------------------------------------------------------------------
            // Processa as tabela Bem e BemxDep
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[23] := ' AND (HM.IDBEM = ' + IntToStr(iBem) + ') ';
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[33] := ' AND (B.IDBEM = ' + IntToStr(iBem) + ') ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = ' + IntToStr(iBem) + ') ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[30] := ' AND (B.IDBEM = ' + IntToStr(iBem) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[23] := ' ';
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[33] := ' ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[20] := ' ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[30] := ' ';
            end;
            //----------------------------------------------------------------------------
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[34] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[31] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[34] := ' ';
               _dMTBem.sqlRCMovBemxDep2.SQL.Strings[31] := ' ';
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Consistencia...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovBemxMoeda2.Prepare;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovBemxMoeda2.Data;
            _dMTBem.sqlRCMovBemxDep2.Prepare;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovBemxDep2.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuCusto.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Consistencia... (Custo)');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuCusto.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia... (Custo)');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
               nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsValOrg <> FcdsAtuCusto.FieldByName('VALORG').AsFloat) or
                  (nsCmBem  <> FcdsAtuCusto.FieldByName('CMBEM').AsFloat) then
               begin
                  _dMTBem.sqlAtuBem.Prepare;
                  _dMTBem.sqlAtuBem.ParamByName('IDBEM').AsInteger     := FcdsAtuCusto.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlAtuBem.ParamByName('IDPESSOA').AsInteger  := FcdsAtuCusto.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlAtuBem.ParamByName('MOECODIGO').AsInteger := FcdsAtuCusto.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuBem.ParamByName('VALORG').AsFloat      := nsValorg;
                  _dMTBem.sqlAtuBem.ParamByName('CMBEM').AsFloat       := nsCmBem;
                  if not ExecSQL(_dMTBem.sqlAtuBem.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (1.1)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuCusto.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsAtuCusto.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuDeprec.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Consistencia... (Depreciação)');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuDeprec.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia... (Depreciação)');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
               nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsDepLanc <> FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat) or
                  (nsCmDep <> FcdsAtuDeprec.FieldByName('CMDEP').AsFloat) then
               begin
                  _dMTBem.sqlAtuBemxDep.Prepare;
                  _dMTBem.sqlAtuBemxDep.ParamByName('IDBEM').AsInteger     := FcdsAtuDeprec.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('IDPESSOA').AsInteger  := FcdsAtuDeprec.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('MOECODIGO').AsInteger := FcdsAtuDeprec.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('IDTAXADEP').AsInteger := FcdsAtuDeprec.FieldByName('IDBEMXDEP').AsInteger;
                  _dMTBem.sqlAtuBemxDep.ParamByName('DEPLANC').AsFloat     := nsDepLanc;
                  _dMTBem.sqlAtuBemxDep.ParamByName('CMDEP').AsFloat       := nsCmDep;
                  if not ExecSQL(_dMTBem.sqlAtuBemxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (1.2)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuDeprec.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsAtuDeprec.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            // Processa as tabela Reavaliacao e ReavalxDep
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[19] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[29] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[30] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            end else
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[19] := ' ';
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[29] := ' ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[20] := ' ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[30] := ' ';
            end;
            //----------------------------------------------------------------------------
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[30] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[31] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[30] := ' ';
               _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[31] := ' ';
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Reavaliações...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovReavalxMoeda2.Prepare;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovReavalxMoeda2.Data;
            _dMTBem.sqlRCMovReavalxDep2.Prepare;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovReavalxDep2.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuCusto.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Reavaliações...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuCusto.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Reavaliações)...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);                  
               except

               end;
               //-------------------------------------------------------------------------
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
               nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsValOrg <> FcdsAtuCusto.FieldByName('VALORG').AsFloat) or
                  (nsCmBem  <> FcdsAtuCusto.FieldByName('CMBEM').AsFloat) then
               begin
                  _dMTBem.sqlAtuReavaliacao.Prepare;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('IDREAVALIACAO').AsInteger := FcdsAtuCusto.FieldByName('IDREAVALIACAO').AsInteger;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('MOECODIGO').AsInteger     := FcdsAtuCusto.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('VALORG').AsFloat          := nsValorg;
                  _dMTBem.sqlAtuReavaliacao.ParamByName('CMBEM').AsFloat           := nsCmBem;
                  if not ExecSQL(_dMTBem.sqlAtuReavaliacao.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (2.1)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuCusto.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsAtuCusto.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuDeprec.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Reavaliações...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuDeprec.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Reavaliações (Dep.)...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
               nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsDepLanc <> FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat) or
                  (nsCmDep <> FcdsAtuDeprec.FieldByName('CMDEP').AsFloat) then
               begin
                  _dMTBem.sqlAtuReavalxDep.Prepare;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('IDREAVALIACAO').AsInteger := FcdsAtuDeprec.FieldByName('IDREAVALIACAO').AsInteger;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('MOECODIGO').AsInteger     := FcdsAtuDeprec.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('IDTAXADEP').AsInteger     := FcdsAtuDeprec.FieldByName('IDREAVALXDEP').AsInteger;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('DEPLANC').AsFloat         := nsDepLanc;
                  _dMTBem.sqlAtuReavalxDep.ParamByName('CMDEP').AsFloat           := nsCmDep;
                  if not ExecSQL(_dMTBem.sqlAtuReavalxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (2.2)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuDeprec.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsAtuDeprec.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            // Processa as tabela AcrescimoValor e AcrescValorxDep
            //----------------------------------------------------------------------------
            if iBem > 0 then
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[17] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[27] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[18] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[28] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            end else
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[17] := ' ';
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[27] := ' ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[18] := ' ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[28] := ' ';
            end;
            //----------------------------------------------------------------------------
            if iGrupo > 0 then
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[28] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[29] := ' AND (B.IDGRUPO = ' + IntToStr(iGrupo) + ') ';
            end else
            begin
               _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[28] := ' ';
               _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[29] := ' ';
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := 1;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Iniciando Acréscimos...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);               
            except

            end;
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovAcresxMoeda2.Prepare;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovAcresxMoeda2.Data;
            _dMTBem.sqlRCMovAcresxDep2.Prepare;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('DATAMOV').AsDate := date + 120;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovAcresxDep2.Data;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuCusto.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Acréscimos...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuCusto.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Acréscimos)...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
               nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
                  nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
                  nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsValOrg <> FcdsAtuCusto.FieldByName('VALORG').AsFloat) or
                  (nsCmBem  <> FcdsAtuCusto.FieldByName('CMBEM').AsFloat) then
               begin
                  _dMTBem.sqlAtuAcrescimo.Prepare;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('IDACRESCIMO').AsInteger := FcdsAtuCusto.FieldByName('IDACRESCIMO').AsInteger;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('MOECODIGO').AsInteger   := FcdsAtuCusto.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('VALORG').AsFloat        := nsValorg;
                  _dMTBem.sqlAtuAcrescimo.ParamByName('CMBEM').AsFloat         := nsCmBem;
                  if not ExecSQL(_dMTBem.sqlAtuAcrescimo.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (3.1)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuCusto.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsAtuCusto.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            try
               iPrgBarMax  := FcdsAtuDeprec.RecordCount;
               iPrgBarPos  := 0;
               sPrgBarMsg := CMTranslate('Preparando Acréscimos...');
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            iBensProcessados := 0;
            while not FcdsAtuDeprec.EOF do
            begin
               try
                  iPrgBarPos  := iPrgBarPos + 1;
                  sPrgBarMsg := CMTranslate('Verificando Consistencia (Acréscimos (Dep.))...');
                  DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
               except

               end;
               //-------------------------------------------------------------------------
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
               nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
                  nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
               //-------------------------------------------------------------------------
               if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
                  nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
               //-------------------------------------------------------------------------
               if (nsDepLanc <> FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat) or
                  (nsCmDep <> FcdsAtuDeprec.FieldByName('CMDEP').AsFloat) then
               begin
                  _dMTBem.sqlAtuAcrescxDep.Prepare;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('IDACRESCIMO').AsInteger := FcdsAtuDeprec.FieldByName('IDACRESCIMO').AsInteger;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('MOECODIGO').AsInteger   := FcdsAtuDeprec.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('IDTAXADEP').AsInteger   := FcdsAtuDeprec.FieldByName('IDACRESCIMOXDEP').AsInteger;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('DEPLANC').AsFloat       := nsDepLanc;
                  _dMTBem.sqlAtuAcrescxDep.ParamByName('CMDEP').AsFloat         := nsCmDep;
                  if not ExecSQL(_dMTBem.sqlAtuAcrescxDep.SQLChanged, True) then
                     Raise Exception.Create(CMTranslate('Atualizando Último Saldo (3.2)') + #13 + MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsAtuDeprec.Next;
               //-------------------------------------------------------------------------
               iBensProcessados := iBensProcessados + 1;
               if (iBensProcessados = 25) or (FcdsAtuDeprec.EOF) then
               begin
                  Commit;
                  StartTransaction;
                  iBensProcessados := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            Commit;
            Result := True;
         except
            on E : Exception do
            begin
               RollBack;
               Result := False;
               MessageInfo := E.Message;
               if (nPlacaErro > 0) then
                  MessageInfo := MessageInfo + #13 + 'Placa ' + floattostr(nPlacaErro);
               if (nIdBemErro > 0) then
                  MessageInfo := MessageInfo + #13 + 'ID Bem ' + floattostr(nIdBemErro);
            end;
         end;
      end else
      begin
         Result := False;
      end;
   end;
end;}

end.

