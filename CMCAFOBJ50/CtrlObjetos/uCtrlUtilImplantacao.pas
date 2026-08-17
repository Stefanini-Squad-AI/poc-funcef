unit uCtrlUtilImplantacao;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP, Math, uCMMath,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes,  
     uDiasUteis,  
     dMTBem, dMTFechamento,
     uDBBem, uDBBemxMoeda, uDBBemxDep,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uCtrlParamCAF, uCtrlBem, uCtrlHistMovBem, uCtrlMovBaixa,
     uCtrlFechamentoProRata;

Type
   TCtrlUtilImplantacao = class(TCmControlObject)

   Protected
    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;

   Private
    //------------------------------------------------------------------------------------
    // Classes de Persistência
    //------------------------------------------------------------------------------------
    _dMTBem : TdtmMTBem;
    _dMTFechamento : TdtmMTFechamento;

    _dbBem               : TDBBem;
    _dbBemxMoeda         : TDBBemxMoeda;
    _dbBemxDep           : TDBBemxDep;
    _dbReavaliacao       : TDBReavaliacao;
    _dbReavalxMoeda      : TDBReavalxMoeda;
    _dbReavalxDep        : TDBReavalxDep;
    _dbAcrescimoValor    : TDBAcrescimoValor;
    _dbAcrescValorxMoeda : TDBAcrescValorxMoeda;
    _dbAcrescValorxDep   : TDBAcrescValorxDep;

    FcdsBem            : TClientDataSet;
    FcdsBemxMoeda      : TClientDataSet;
    FcdsBemxDep        : TClientDataSet;
    FcdsMovContabBem   : TClientDataSet;
    FcdsSaldoContabBem : TClientDataSet;
    FcdsSldCtbBemxDep  : TClientDataSet;
    FcdsSCBTransf      : TClientDataSet;
    FcdsAtuCusto       : TClientDataSet;
    FcdsAtuDeprec      : TClientDataSet;
    FcdsAux            : TClientDataSet;
    FcdsAjustes        : TClientDataSet;
    FcdsCAFMoedas      : TClientDataSet;
    FcdsAcrescimoValor: TClientDataSet;
    FcdsAcrescValorxMoeda: TClientDataSet;
    FcdsReavaliacao: TClientDataSet;
    FcdsReavalxMoeda: TClientDataSet;
    FcdsReavalxDep: TClientDataSet;
    FcdsAcrescValorxDep: TClientDataSet;

    Bem : TCtrlBem;
    HistMovBem : TCtrlHistMovBem;
    Baixa : TCtrlMovBaixa;
    ParamCAF : TCtrlParamCAF;
    ProRata : TCtrlFechamentoProRata;
    DiasUteis : TDiasUteis;
    Fcds: TClientDataSet;

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
    procedure SetcdsAjustes(const Value: TClientDataSet);
    procedure SetcdsCAFMoedas(const Value: TClientDataSet);
    procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
    procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
    procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
    procedure SetcdsReavaliacao(const Value: TClientDataSet);
    procedure SetcdsReavalxDep(const Value: TClientDataSet);
    procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
    procedure Setcds(const Value: TClientDataSet);
    //------------------------------------------------------------------------------------
    // Funções Privativas
    //------------------------------------------------------------------------------------
    function GrupoExiste(nGrupo, nEmpresaProp : Extended) : Boolean;
    function LocalExiste(nLocal, nEmpresaProp : Extended) : Boolean;
    function RespExiste(nResp : Extended) : Boolean;
    //------------------------------------------------------------------------------------
    function GeraCAFMoedasProp: Boolean;
    function CalcProxDataFec(dDataMov : TDateTime ; iMov : Integer) : TDateTime;
    function CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime) : Extended;
    function CalculaFatorDepreciacao(iModulo : Integer;
                                     dDataMov, dDataAnt, dDataIni : tDateTime;
                                     bSomenteImoveis : Boolean) : Extended;
    function EstornarFechamento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                dDataIni, dDataFim : TDateTime) : Boolean;
    function ExecutarFechamento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                dDataIni, dDataFim,
                                dDataBaixa : TDateTime; iMotivoBaixa : Integer) : Boolean;
    function ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                          iMotivoBaixa : Integer; dDataBaixa : TDateTime;
                          sObsBaixa : String) : Boolean;
    function EstornaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                          dDataMov,dDataEst : TDateTime) : Boolean;
    function RemoveBemDuplicado(iModulo, iEmpresaProp, iUsuario, iBem : Integer) : Boolean;

    function CMTranslate(sIgor : String) : String;

   Public

    property cdsBem               : TClientDataSet read FcdsBem            write SetcdsBem;
    property cdsBemxMoeda         : TClientDataSet read FcdsBemxMoeda      write SetcdsBemxMoeda;
    property cdsBemxDep           : TClientDataSet read FcdsBemxDep        write SetcdsBemxDep;
    property cdsSaldoContabBem    : TClientDataSet read FcdsSaldoContabBem write SetcdsSaldoContabBem;
    property cdsSldCtbBemxDep     : TClientDataSet read FcdsSldCtbBemxDep  write SetcdsSldCtbBemxDep;
    property cdsMovContabBem      : TClientDataSet read FcdsMovContabBem   write SetcdsMovContabBem;
    property cdsSCBTransf         : TClientDataSet read FcdsSCBTransf      write SetcdsSCBTransf;
    property cdsAtuCusto          : TClientDataSet read FcdsAtuCusto       write SetcdsAtuCusto;
    property cdsAtuDeprec         : TClientDataSet read FcdsAtuDeprec      write SetcdsAtuDeprec;
    property cdsAux               : TClientDataSet read FcdsAux            write SetcdsAux;
    property cdsAjustes           : TClientDataSet read FcdsAjustes        write SetcdsAjustes;
    property cdsCAFMoedas         : TClientDataSet read FcdsCAFMoedas      write SetcdsCAFMoedas;
    property cdsReavaliacao       : TClientDataSet read FcdsReavaliacao write SetcdsReavaliacao;
    property cdsReavalxMoeda      : TClientDataSet read FcdsReavalxMoeda write SetcdsReavalxMoeda;
    property cdsReavalxDep        : TClientDataSet read FcdsReavalxDep write SetcdsReavalxDep;
    property cdsAcrescimoValor    : TClientDataSet read FcdsAcrescimoValor write SetcdsAcrescimoValor;
    property cdsAcrescValorxMoeda : TClientDataSet read FcdsAcrescValorxMoeda write SetcdsAcrescValorxMoeda;
    property cdsAcrescValorxDep   : TClientDataSet read FcdsAcrescValorxDep write SetcdsAcrescValorxDep;
    property cds                  : TClientDataSet read Fcds write Setcds;
    //------------------------------------------------------------------------------------
    // Métodos
    //------------------------------------------------------------------------------------
    constructor Create;  Override;
    destructor  Destroy; Override;
    //------------------------------------------------------------------------------------
    // Funções Públicas
    //------------------------------------------------------------------------------------
    function ListaAjustes : OleVariant;
    function ReconstroiSaldoBem(iEmpresaProp, iBem, iTipoBem : Integer) : Boolean;
    //------------------------------------------------------------------------------------
    function ExecutaAjustesImplantacao(nEmpresaProp, nBem, nMoeCodigo, nTaxaDep : Extended;
                                       dDataMov : TDateTime) : Boolean;
    function EstornaAjustesImplantacao(nEmpresaProp, nBem, nMoeCodigo, nTaxaDep : Extended;
                                       dDataMov : TDateTime) : Boolean;
    //------------------------------------------------------------------------------------
    function ExecutaReconDeprecBem(nModulo, nEmpresaProp, nUsuario,
                                   nBem, nMoeCodigo, nTaxaDep: Extended;
                                   dDataIni, dDataFim : TDateTime;
                                   bEstornaBaixa: Boolean;
                                   dDataEstornaBaixa, dDataBaixa : TDateTime;
                                   iMotivoBaixa : Integer;
                                   bRemoveBemDup : Boolean) : Boolean;
   end;

implementation

{ TCtrlUtilImplantacao }

constructor TCtrlUtilImplantacao.Create;
begin
   inherited;
   _dbBem               := TDBBem.Create(Self);
   _dbBemxMoeda         := TDBBemxMoeda.Create(Self);
   _dbBemxDep           := TDBBemxDep.Create(Self);
   _dbReavaliacao       := TDBReavaliacao.Create(Self);
   _dbReavalxMoeda      := TDBReavalxMoeda.Create(Self);
   _dbReavalxDep        := TDBReavalxDep.Create(Self);
   _dbAcrescimoValor    := TDBAcrescimoValor.Create(Self);
   _dbAcrescValorxMoeda := TDBAcrescValorxMoeda.Create(Self);
   _dbAcrescValorxDep   := TDBAcrescValorxDep.Create(Self);

   _dMTBem := tdtmMTBem.Create(Self);
   _dMTFechamento := tdtmMTFechamento.Create(Self);

   Bem := TCtrlBem.Create;
   HistMovBem := TCtrlHistMovBem.Create;
   Baixa := TCtrlMovBaixa.Create;
   ParamCAF := TCtrlParamCAF.Create;
   ProRata := TCtrlFechamentoProRata.Create(Nil);
   DiasUteis := TDiasUteis.Create;

   Fcds                  := TClientDataSet.Create(nil);
   FcdsBem               := TClientDataSet.Create(nil);
   FcdsBemxMoeda         := TClientDataSet.Create(nil);
   FcdsBemxDep           := TClientDataSet.Create(nil);
   FcdsSaldoContabBem    := TClientDataSet.Create(nil);
   FcdsSldCtbBemxDep     := TClientDataSet.Create(nil);
   FcdsMovContabBem      := TClientDataSet.Create(nil);
   FcdsSCBTransf         := TClientDataSet.Create(nil);
   FcdsAtuCusto          := TClientDataSet.Create(nil);
   FcdsAtuDeprec         := TClientDataSet.Create(nil);
   FcdsAux               := TClientDataSet.Create(nil);
   FcdsCAFMoedas         := TClientDataSet.Create(nil);
   FcdsReavaliacao       := TClientDataSet.Create(nil);
   FcdsReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsReavalxDep        := TClientDataSet.Create(nil);
   FcdsAcrescimoValor    := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep   := TClientDataSet.Create(nil);
end;

destructor TCtrlUtilImplantacao.Destroy;
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
   HistMovBem.Free;
   Baixa.Free;
   ParamCAF.Free;
   ProRata.Free;
   DiasUteis.Free;

   _dMTBem.Free;
   _dMTFechamento.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbReavaliacao.Free;
   _dbReavalxMoeda.Free;
   _dbReavalxDep.Free;
   _dbAcrescimoValor.Free;
   _dbAcrescValorxMoeda.Free;
   _dbAcrescValorxDep.Free;

   Fcds.Free;
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
   FcdsCAFMoedas.Free;
   FcdsReavaliacao.Free;
   FcdsReavalxMoeda.Free;
   FcdsReavalxDep.Free;
   FcdsAcrescimoValor.Free;
   FcdsAcrescValorxMoeda.Free;
   FcdsAcrescValorxDep.Free;
   inherited;
end;

procedure TCtrlUtilImplantacao.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   Baixa.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   ProRata.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
end;

procedure TCtrlUtilImplantacao.DoChangeDataBase;
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

procedure TCtrlUtilImplantacao.SetcdsAtuCusto(const Value: TClientDataSet);
begin
  FcdsAtuCusto := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsAtuDeprec(const Value: TClientDataSet);
begin
  FcdsAtuDeprec := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsAux(const Value: TClientDataSet);
begin
  FcdsAux := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsMovContabBem(const Value: TClientDataSet);
begin
  FcdsMovContabBem := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
  FcdsSaldoContabBem := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsSCBTransf(const Value: TClientDataSet);
begin
  FcdsSCBTransf := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsSldCtbBemxDep(const Value: TClientDataSet);
begin
  FcdsSldCtbBemxDep := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsAjustes(const Value: TClientDataSet);
begin
  FcdsAjustes := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsCAFMoedas(const Value: TClientDataSet);
begin
  FcdsCAFMoedas := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlUtilImplantacao.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlUtilImplantacao.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlUtilImplantacao.ListaAjustes : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT (0)    AS IDREAVALIACAO,  ' + #13 +
           '        (0)    AS IDACRESCIMO,    ' + #13 +
           '        (0.00) AS VALORGA,        ' + #13 +
           '        (0.00) AS CMBEMA,         ' + #13 +
           '        (0.00) AS DEPLANCA,       ' + #13 +
           '        (0.00) AS CMDEPA,         ' + #13 +
           '        (0.00) AS VALORGB,        ' + #13 +
           '        (0.00) AS CMBEMB,         ' + #13 +
           '        (0.00) AS DEPLANCB,       ' + #13 +
           '        (0.00) AS CMDEPB          ' + #13 +
           ' FROM GRUPO                       ' + #13 +
           ' WHERE (IDGRUPO = -1)             ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlUtilImplantacao.GeraCAFMoedasProp: Boolean;
begin
   FcdsCAFMoedas.Data := GetDataPacket(' SELECT MOECODIGO, NUMDECIMAIS, ' + #13 +
                                       '        DECODE(FLGARREDONDA,''N'',0,1) AS FLGARREDONDA ' + #13 +
                                       ' FROM MOEDA ' + #13 +
                                       ' WHERE MOECODIGO = ' + inttostr(ParamCAF.MOEDAOFICIAL) + #13 +
                                       '    OR MOECODIGO = ' + inttostr(ParamCAF.MOEDAFISCAL) + #13 +
                                       '    OR MOECODIGO = ' + inttostr(ParamCAF.MOEDAGERENCIAL) + #13 +
                                       '    OR MOECODIGO = ' + inttostr(ParamCAF.MOEDAGERENCIALB) + #13 +
                                       '    OR MOECODIGO = ' + inttostr(ParamCAF.MOEDAGERENCIALC) );
   Result := True;
end;

function TCtrlUtilImplantacao.ReconstroiSaldoBem(iEmpresaProp, iBem, iTipoBem : Integer) : Boolean;
var
   bEntrou, bErroRemocao             : Boolean;
   iBensProcessados,
   ieGrupo, ieLocal, ieResp          : Integer;
   nBem, nPessoa,
   nSValOrg, nSCmBem,
   nSDepLanc, nSCmDep,
   nSReavValOrg, nSReavCmBem,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavValOrg, nSUltReavCmBem,
   nSUltReavDepLanc, nSUltReavCmDep,
   nIdBem                            : Extended;
   dDataMov                          : TDateTime;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ReconstroiSaldoBem(iEmpresaProp, iBem, iTipoBem);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bErroRemocao := False;
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
         _dMTBem.sqlRemSaldoContabBem.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
         _dMTBem.sqlRemSldCtbBemxDep.SQL.Strings[7] := ' ';
         _dMTBem.sqlRemSaldoContabBem.SQL.Strings[7] := ' ';
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRemSldCtbBemxDep.Prepare;
         _dMTBem.sqlRemSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
         _dMTBem.sqlRemSldCtbBemxDep.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
         if not ExecSQL(_dMTBem.sqlRemSldCtbBemxDep.SQLChanged,False) then
            Raise Exception.Create(CMTranslate('Removendo Saldo (1)') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRemSaldoContabBem.Prepare;
         _dMTBem.sqlRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
         _dMTBem.sqlRemSaldoContabBem.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
         if not ExecSQL(_dMTBem.sqlRemSaldoContabBem.SQLChanged,False) then
            Raise Exception.Create(CMTranslate('Removendo Saldo (2)') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
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
         StartTransaction;
         try
            //----------------------------------------------------------------------------
            // Reconstroi o saldo contábil dos bens ao longo de suas vidas úteis nas
            // tabelas SALDOCONTABBEM e SLDCTBBEMXDEP
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCBem.SQL.Strings[09] := ' AND BD.IDBEM = ' + inttostr(iBem);
            _dMTBem.sqlRCBem.SQL.Strings[10] := ' ';
            _dMTBem.sqlRCBem.Prepare;
            _dMTBem.sqlRCBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCBem.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsBem.Data := _dMTBem.sqlRCBem.Data;
            //----------------------------------------------------------------------------
            bEntrou := False;
            iBensProcessados := 0;
            while not FcdsBem.EOF do
            begin
               bEntrou := True;
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
                  //----------------------------------------------------------------
                  _dMTBem.sqlRCInsSaldoContabBem.Prepare;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDBEM').AsInteger        := FcdsBem.FieldByName('IDBEM').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger     := FcdsBem.FieldByName('IDPESSOA').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('MOECODIGO').AsInteger    := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                  _dMTBem.sqlRCInsSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime  := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
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
                  _dMTBem.sqlRCInsSldCtbBemxDep.ParamByName('DATASLDBEM').AsDateTime     := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
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
            end;
            if not bEntrou then
               Raise Exception.Create(CMTranslate('Não entrou na Fase II de Reconstrução'));
            //----------------------------------------------------------------------------
            // Atualização do histórico de transferências
            //----------------------------------------------------------------------------
            _dMTBem.sqlSCBTransf.SQL.Strings[10] := ' AND (SC.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlSCBTransf.SQL.Strings[11] := ' ';
            _dMTBem.sqlSCBTransf.Prepare;
            _dMTBem.sqlSCBTransf.ParamByName('IDPESSOA').AsInteger   := iEmpresaProp;
            _dMTBem.sqlSCBTransf.ParamByName('PFLGIMOVEL').AsInteger := iTipoBem;
            FcdsSCBTransf.Data := _dMTBem.sqlSCBTransf.Data;
            //----------------------------------------------------------------------------
            while not FcdsSCBTransf.EOF do
            begin
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
                     _dMTBem.sqlUpdSCBTransf.ParamByName('DATASLDBEM').AsDateTime   := FcdsSCBTransf.FieldByName('DATASLDBEM').AsDateTime;
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
            end;
            //----------------------------------------------------------------------------
            // Registra nas tabelas cadastrais os saldos atualizados
            //----------------------------------------------------------------------------
            // Processa as tabela Bem e BemxDep
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[23] := ' AND (HM.IDBEM = ' + IntToStr(iBem) + ') ';
            _dMTBem.sqlRCMovBemxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = ' + IntToStr(iBem) + ') ';
            _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[33] := ' AND (B.IDBEM = ' + IntToStr(iBem) + ') ';
            _dMTBem.sqlRCMovBemxDep2.SQL.Strings[30] := ' AND (B.IDBEM = ' + IntToStr(iBem) + ') ';
            _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[34] := ' ';
            _dMTBem.sqlRCMovBemxDep2.SQL.Strings[31] := ' ';
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovBemxMoeda2.Prepare;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('DATAMOV').AsDateTime  := date + 120;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovBemxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovBemxMoeda2.Data;
            _dMTBem.sqlRCMovBemxDep2.Prepare;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('DATAMOV').AsDateTime  := date + 120;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovBemxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovBemxDep2.Data;
            //----------------------------------------------------------------------------
            while not FcdsAtuCusto.EOF do
            begin
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
            end;
            //----------------------------------------------------------------------------
            while not FcdsAtuDeprec.EOF do
            begin
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
            end;
            //----------------------------------------------------------------------------
            // Processa as tabela Reavaliacao e ReavalxDep
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[19] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[29] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[30] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[30] := ' ';
            _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[31] := ' ';
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovReavalxMoeda2.Prepare;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('DATAMOV').AsDateTime  := date + 120;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovReavalxMoeda2.Data;
            _dMTBem.sqlRCMovReavalxDep2.Prepare;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('DATAMOV').AsDateTime  := date + 120;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovReavalxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovReavalxDep2.Data;
            //----------------------------------------------------------------------------
            while not FcdsAtuCusto.EOF do
            begin
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
            end;
            //----------------------------------------------------------------------------
            while not FcdsAtuDeprec.EOF do
            begin
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
            end;
            //----------------------------------------------------------------------------
            // Processa as tabela AcrescimoValor e AcrescValorxDep
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[17] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[27] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[18] := ' AND (HM.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[28] := ' AND (B.IDBEM = '+IntToStr(iBem)+') ';
            _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[28] := ' ';
            _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[29] := ' ';
            //----------------------------------------------------------------------------
            _dMTBem.sqlRCMovAcresxMoeda2.Prepare;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('DATAMOV').AsDateTime  := date + 120;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuCusto.Data := _dMTBem.sqlRCMovAcresxMoeda2.Data;
            _dMTBem.sqlRCMovAcresxDep2.Prepare;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('DATAMOV').AsDateTime  := date + 120;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTBem.sqlRCMovAcresxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
            FcdsAtuDeprec.Data := _dMTBem.sqlRCMovAcresxDep2.Data;
            //----------------------------------------------------------------------------
            while not FcdsAtuCusto.EOF do
            begin
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
            end;
            //----------------------------------------------------------------------------
            while not FcdsAtuDeprec.EOF do
            begin
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
            end;
         end;
      end else
      begin
         Result := False;
      end;
   end;
end;
//========================================================================================
function TCtrlUtilImplantacao.GrupoExiste(nGrupo, nEmpresaProp : Extended) : Boolean;
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
function TCtrlUtilImplantacao.LocalExiste(nLocal, nEmpresaProp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT IDLOCALIZACAO ' +
                                 ' FROM LOCALIZACAO ' +
                                 ' WHERE (IDLOCALIZACAO = ' + floattostr(nLocal) + ') ' +
                                 '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ') ;
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
function TCtrlUtilImplantacao.RespExiste(nResp : Extended) : Boolean;
begin
   FcdsAux.Data := GetDataPacket(' SELECT IDRESPONSAVEL ' +
                                 ' FROM RESPONSAVEL ' +
                                 ' WHERE (IDRESPONSAVEL = ' + floattostr(nResp) + ') ' +
                                 '   AND (FLGATIVOFIXO = 1) ') ;
   Result := not FcdsAux.IsEmpty;
end;
//========================================================================================
function TCtrlUtilImplantacao.ExecutaAjustesImplantacao(nEmpresaProp, nBem, nMoeCodigo, nTaxaDep : Extended;
                                                                  dDataMov : TDateTime) : Boolean;
var
   bTransacao : Boolean;
   nValDif : Currency;
   nSeqHist : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaAjustesImplantacao(nEmpresaProp, nBem,
                                                               nMoeCodigo, nTaxaDep, dDataMov,
                                                               FcdsAjustes.Data);
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
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Processa os ajustes
         //-------------------------------------------------------------------------------
         FcdsAjustes.First;
         while not FcdsAjustes.EOF do
         begin
            //----------------------------------------------------------------------------
            // Registra os ajustes das contas de custos
            //----------------------------------------------------------------------------
            nValDif := FcdsAjustes.FieldByName('VALORGB').AsFloat - FcdsAjustes.FieldByName('VALORGA').AsFloat;
            if nValDif <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra no Histórico
               //-------------------------------------------------------------------------
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat = 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            41, dDataMov, -1,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat <> 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            45, dDataMov,
                                                            FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            49, dDataMov,
                                                            FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Registra o Valor no Histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, 0, nValDif) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Registra os ajustes das contas de cm custos
            //----------------------------------------------------------------------------
            nValDif := FcdsAjustes.FieldByName('CMBEMB').AsFloat - FcdsAjustes.FieldByName('CMBEMA').AsFloat;
            if nValDif <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra no Histórico
               //-------------------------------------------------------------------------
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat = 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            42, dDataMov, -1,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat <> 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            46, dDataMov,
                                                            FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            50, dDataMov,
                                                            FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Registra o Valor no Histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, 0, nValDif) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Registra os ajustes das contas de depreciacao
            //----------------------------------------------------------------------------
            nValDif := FcdsAjustes.FieldByName('DEPLANCB').AsFloat - FcdsAjustes.FieldByName('DEPLANCA').AsFloat;
            if nValDif <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra no Histórico
               //-------------------------------------------------------------------------
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat = 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            43, dDataMov, -1,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat <> 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            47, dDataMov,
                                                            FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            51, dDataMov,
                                                            FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Registra o Valor no Histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nTaxaDep, nValDif) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Registra os ajustes das contas de cm depreciacao
            //----------------------------------------------------------------------------
            nValDif := FcdsAjustes.FieldByName('CMDEPB').AsFloat - FcdsAjustes.FieldByName('CMDEPA').AsFloat;
            if nValDif <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra no Histórico
               //-------------------------------------------------------------------------
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat = 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            44, dDataMov, -1,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               if (FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat <> 0) and
                  (FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat = 0) then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            48, dDataMov,
                                                            FcdsAjustes.FieldByName('IDREAVALIACAO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end else
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                            52, dDataMov,
                                                            FcdsAjustes.FieldByName('IDACRESCIMO').AsFloat,
                                                            -1, -1, -1, -1, -1, -1, -1,
                                                            '',  0, -1, '', -1,  0, 0, '');
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Registra o Valor no Histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nTaxaDep, nValDif) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsAjustes.Next;
         end;
         //-------------------------------------------------------------------------------
         // Reconstroi o Saldo do bem Ajustado
         //-------------------------------------------------------------------------------
         if not ReconstroiSaldoBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                   FcdsBem.FieldByName('IDBEM').AsInteger,
                                   FcdsBem.FieldByName('FLGIMOVEL').AsInteger) then
            raise Exception.Create(MessageInfo);
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
function TCtrlUtilImplantacao.EstornaAjustesImplantacao(nEmpresaProp, nBem, nMoeCodigo, nTaxaDep : Extended;
                                                        dDataMov : TDateTime) : Boolean;
var
   bTransacao : Boolean;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaAjustesImplantacao(nEmpresaProp, nBem, nMoeCodigo,
                                                               nTaxaDep, dDataMov);
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
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         FcdsAux.Data := GetDataPacket(' SELECT HM.IDMOVIMENTACAO ' + #13 +
                                       ' FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
                                       '      VLRHISTMOVBEM VM ' + #13 +
                                       ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
                                       '   AND HM.IDTIPOMOVIMENTACAO >= 41 AND IDTIPOMOVIMENTACAO <= 52 ' + #13 +
                                       '   AND HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' + #13 +
                                       '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
                                       '   AND (VM.IDTAXADEP = 0 OR VM.IDTAXADEP = ' + floattostr(nTaxaDep) + ' )' + #13 +
                                       '   AND VM.MOECODIGO = ' + floattostr(nMoeCodigo) + #13 +
                                       '   AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO ');
         FcdsAux.First;
         while not FcdsAux.Eof do
         begin
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE (IDMOVIMENTACAO = ' + FcdsAux.FieldByName('IDMOVIMENTACAO').AsString + ')';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os valores de ajuste do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!')+#13+MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                    ' WHERE (IDMOVIMENTACAO = ' + FcdsAux.FieldByName('IDMOVIMENTACAO').AsString + ')';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os registros de ajuste do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!')+#13+MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAux.Next;
         end;
         //-------------------------------------------------------------------------------
         // Reconstroi o Saldo do bem Ajustado
         //-------------------------------------------------------------------------------
         if not ReconstroiSaldoBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                   FcdsBem.FieldByName('IDBEM').AsInteger,
                                   FcdsBem.FieldByName('FLGIMOVEL').AsInteger) then
            raise Exception.Create(MessageInfo);
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

function TCtrlUtilImplantacao.ExecutaReconDeprecBem(nModulo, nEmpresaProp, nUsuario,
                                                    nBem, nMoeCodigo, nTaxaDep: Extended;
                                                    dDataIni, dDataFim : TDateTime;
                                                    bEstornaBaixa: Boolean;
                                                    dDataEstornaBaixa, dDataBaixa: TDateTime;
                                                    iMotivoBaixa : Integer;
                                                    bRemoveBemDup : Boolean): Boolean;
var
   bTransacao : Boolean;
   dDtaIni, dDtaFim : TDateTime;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaReconDeprecBem(nModulo, nEmpresaProp, nUsuario,
                                                           nBem, nMoeCodigo, nTaxaDep,
                                                           dDataIni, dDataFim,
                                                           bEstornaBaixa, dDataEstornaBaixa,
                                                           dDataBaixa, iMotivoBaixa, bRemoveBemDup);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      bTransacao := True;
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         if dDataBaixa <> -1 then                       // Executa a Baixa do Bem na Data
            if dDataBaixa > dDataFim then
               Raise Exception.Create(CMTranslate('Este processo não pode baixar um bem após a data do último fechamento.'));
         dDtaIni := dDataIni;
         dDtaFim := dDataFim;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Remove o Bem Duplicado ou Reconstroi os Fechamentos
         //-------------------------------------------------------------------------------
         if bRemoveBemDup then
         begin
            if not RemoveBemDuplicado(trunc(nModulo), trunc(nEmpresaProp), trunc(nUsuario), trunc(nBem)) then
               Raise Exception.Create(MessageInfo + #13 + CMTranslate('na Remoção do Bem Duplicado') + ' ' +
                                      FcdsBem.FieldByName('PLACA').AsString);
         end else
         begin
            bTransacao := Self.OpenTransaction;
            Self.OpenTransaction := False;
            //----------------------------------------------------------------------------
            if bEstornaBaixa then
               if not EstornaBaixa(nModulo, nEmpresaProp, nUsuario, nBem,
                                   dDataEstornaBaixa, dDataEstornaBaixa) then
                  Raise Exception.Create(MessageInfo + #13 + CMTranslate('no Estorno da Baixa do bem ') +
                                         FcdsBem.FieldByName('PLACA').AsString);
            //----------------------------------------------------------------------------
            // Estorna os lançamentos de fechamento no periodo especificado
            //----------------------------------------------------------------------------
            if not EstornarFechamento(nModulo, nEmpresaProp, nUsuario,
                                      nBem, dDtaIni, dDtaFim) then
               Raise Exception.Create(MessageInfo + #13 + CMTranslate('no Estorno dos Fechamentos do bem ') +
                                      FcdsBem.FieldByName('PLACA').AsString);
            //----------------------------------------------------------------------------
            // Reconstroi o Saldo Contábil do Bem
            //----------------------------------------------------------------------------
            if not ReconstroiSaldoBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                      FcdsBem.FieldByName('IDBEM').AsInteger,
                                      FcdsBem.FieldByName('FLGIMOVEL').AsInteger) then
               raise Exception.Create(MessageInfo + #13 + CMTranslate('na Atualização do Saldo Contábil do Bem ') +
                                      FcdsBem.FieldByName('PLACA').AsString + ' (1)');
            //----------------------------------------------------------------------------
            // Executa os lançamentos de fechamento no periodo especificado
            //----------------------------------------------------------------------------
            if not ExecutarFechamento(nModulo, nEmpresaProp, nUsuario, nBem,
                                      dDtaIni, dDtaFim, dDataBaixa, iMotivoBaixa) then
               Raise Exception.Create(MessageInfo + #13 + 'na Execução dos Fechamentos do bem ' +
                                      FcdsBem.FieldByName('PLACA').AsString);
            //----------------------------------------------------------------------------
            // Reconstroi o Saldo Contábil do Bem
            //----------------------------------------------------------------------------
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
            if FcdsBem.IsEmpty then
               Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
            //----------------------------------------------------------------------------
            if not ReconstroiSaldoBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                      FcdsBem.FieldByName('IDBEM').AsInteger,
                                      FcdsBem.FieldByName('FLGIMOVEL').AsInteger) then
               raise Exception.Create(MessageInfo + #13 + 'na Atualização do Saldo Contábil do Bem ' +
                                      FcdsBem.FieldByName('PLACA').AsString + ' (2)');
            //----------------------------------------------------------------------------
            Self.OpenTransaction := bTransacao;
         end;
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

function TCtrlUtilImplantacao.EstornarFechamento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                                 dDataIni, dDataFim : TDateTime) : Boolean;
Var
   sSql : String;
   dDataMov : TDateTime;

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
      // Alimenta os cds do bem
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
      FcdsBemxDep.Data := Bem.ListaBemxDep(nEmpresaProp, nBem);
      FcdsReavaliacao.Data := Bem.ListaReavaliacao(nEmpresaProp, nBem);
      FcdsReavalxMoeda.Data := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
      FcdsReavalxDep.Data := Bem.ListaReavalxDep(nEmpresaProp, nBem);
      FcdsAcrescimoValor.Data := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
      FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
      FcdsAcrescValorxDep.Data := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
      //----------------------------------------------------------------------------------
      // Processa os periodos
      //----------------------------------------------------------------------------------
      dDataMov := dDataFim;
      while dDataMov >= dDataIni do
      begin
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEMXMOEDA
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         while not FcdsBemxMoeda.EOF do
         begin
            //----------------------------------------------------------------------------
            // Retorna a Correção Monetária do Custo na Moeda Processada
            //----------------------------------------------------------------------------
            sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                    '        HM.DATAULTDEP, VM.VALOR ' +
                    ' FROM HISTORICOMOVIMENTACAO HM, ' +
                    '      VLRHISTMOVBEM VM ' +
                    ' WHERE (HM.IDBEM    = ' + floattostr(nBem) + ') ' +
                    '   AND (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                    '   AND (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                    '   AND (HM.TIPDEPPRORATA = 2)' +
                    '   AND (HM.IDTIPOMOVIMENTACAO = 15) '+
                    '   AND (VM.MOECODIGO = ' + FcdsBemxMoeda.FieldByName('MOECODIGO').AsString + ') '+
                    '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
            _cds.Data := GetDataPacket( sSQL );
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            // Processa os Cálculos por Moeda e Taxa Depreciação
            //----------------------------------------------------------------------------
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
                  // Taxa de Depreciação Processadas
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + floattostr(nBem) + ') ' +
                          '   AND (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                          '   AND (HM.TIPDEPPRORATA = 2)' +
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
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14 then
                     begin
                        _dMTFechamento.sqlAtuBemxDep2.Prepare;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDBEM').AsFloat         := nBem;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDPESSOA').AsFloat      := nEmpresaProp;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('DEPLANC').AsFloat       := FcdsBemxDep.FieldByName('DEPLANC').asFloat - _cds.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDateTime := StrToDate(_cds.FieldByName('DATAULTDEP').AsString);
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                        if not ExecSQL(_dMTFechamento.sqlAtuBemxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
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
                     //-------------------------------------------------------------------
                     _cds.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela REAVALIACAO
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            //----------------------------------------------------------------------------
            // Posiciona a Tabela REAVALXMOEDA
            //----------------------------------------------------------------------------
            FcdsReavalxMoeda.Locate('IDREAVALIACAO', VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat]),[]);
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat =
                                                  FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat) do
            begin
               //-------------------------------------------------------------------------
               // Retorna a Correção Monetária na Moeda Processada
               //-------------------------------------------------------------------------
               sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                       '        HM.DATAULTDEP, VM.VALOR ' +
                       ' FROM HISTORICOMOVIMENTACAO HM, ' +
                       '      VLRHISTMOVBEM VM ' +
                       ' WHERE (HM.IDBEM    = ' + floattostr(nBem) + ') ' +
                       '   AND (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                       '   AND (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                       '   AND (HM.TIPDEPPRORATA = 2)' +
                       '   AND (HM.IDTIPOMOVIMENTACAO = 22) '+
                       '   AND (HM.IDREAVALACRESC = ' + FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsString + ') '+
                       '   AND (VM.MOECODIGO = ' + FcdsReavalxMoeda.FieldByName('MOECODIGO').AsString + ') '+
                       '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
               _cds.Data := GetDataPacket( sSQL );
               //-------------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
               // Processa os Cálculos por Moeda e Taxa Depreciação
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO', VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                            FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat =
                                                   FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat) and
                                                  (FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat =
                                                   FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat) do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
                  // Taxa de Depreciação Processadas
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + floattostr(nBem) + ') ' +
                          '   AND (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                          '   AND (HM.TIPDEPPRORATA = 2)' +
                          '   AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACAO = 19))'+
                          '   AND (HM.IDREAVALACRESC = ' + FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsString + ') '+
                          '   AND (VM.IDTAXADEP = ' + FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsReavalxDep.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                          'ORDER BY HM.IDTIPOMOVIMENTACAO';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  while not _cds.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
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
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
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
                     //-------------------------------------------------------------------
                     _cds.Next;
                  end;
                  FcdsReavalxDep.Next;
               end;
               FcdsReavalxMoeda.Next;
            end;
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela ACRESCIMOVALOR
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO', VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat]),[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat =
                                                       FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat) do
            begin
               //-------------------------------------------------------------------------
               // Retorna a Correção Monetária na Moeda Processada
               //-------------------------------------------------------------------------
               sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                       '        HM.DATAULTDEP, VM.VALOR ' +
                       ' FROM HISTORICOMOVIMENTACAO HM, ' +
                       '      VLRHISTMOVBEM VM ' +
                       ' WHERE (HM.IDBEM    = ' + floattostr(nBem) + ') ' +
                       '   AND (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                       '   AND (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                       '   AND (HM.TIPDEPPRORATA = 2) ' +
                       '   AND (HM.IDTIPOMOVIMENTACAO = 34) '+
                       '   AND (HM.IDREAVALACRESC = ' + FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsString + ') '+
                       '   AND (VM.MOECODIGO = ' + FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsString + ') '+
                       '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
               _cds.Data := GetDataPacket( sSQL );
               //-------------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
               // Posiciona a Tabela AcrescValorxDep
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO', VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat,
                                                                               FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat =
                                                        FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat) and
                                                       (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat =
                                                        FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat) do

               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciação e a sua Correção Monetária na Moeda e na
                  // Taxa de Depreciação Processadas
                  //----------------------------------------------------------------------
                  sSql := ' SELECT /*+ RULE */ HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO, ' +
                          '        HM.DATAULTDEP, VM.VALOR ' +
                          ' FROM HISTORICOMOVIMENTACAO HM, ' +
                          '      VLRHISTMOVBEM VM ' +
                          ' WHERE (HM.IDBEM    = ' + floattostr(nBem) + ') ' +
                          '   AND (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                          '   AND (HM.DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                          '   AND (HM.TIPDEPPRORATA = 2) ' +
                          '   AND ((HM.IDTIPOMOVIMENTACAO = 35) OR (HM.IDTIPOMOVIMENTACAO = 36)) '+
                          '   AND (HM.IDREAVALACRESC = ' + FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsString + ') '+
                          '   AND (VM.IDTAXADEP = ' + FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsString + ') '+
                          '   AND (VM.MOECODIGO = ' + FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsString + ') '+
                          '   AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                          'ORDER BY HM.IDTIPOMOVIMENTACAO';
                  _cds.Data := GetDataPacket( sSQL );
                  //----------------------------------------------------------------------
                  while not _cds.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35 then
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
                     //-------------------------------------------------------------------
                     // Retorna a CM da Depreciação Calculada
                     //-------------------------------------------------------------------
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
                     //-------------------------------------------------------------------
                     _cds.Next;
                  end;
                  FcdsAcrescValorxDep.Next;
               end;
               FcdsAcrescValorxMoeda.Next;
            end;
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Remove o Registro da Depreciação Pró-Rata do Historico de Movimentações
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRemVlrHistMovBemFec.Prepare;
         _dMTBem.sqlRemVlrHistMovBemFec.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlRemVlrHistMovBemFec.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlRemVlrHistMovBemFec.ParamByName('DATAMOV').AsDateTime := dDataMov;
         if not ExecSQL(_dMTBem.sqlRemVlrHistMovBemFec.SQLChanged, False) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRemHistMovBemFec.Prepare;
         _dMTBem.sqlRemHistMovBemFec.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlRemHistMovBemFec.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlRemHistMovBemFec.ParamByName('DATAMOV').AsDateTime := dDataMov;
         if not ExecSQL(_dMTBem.sqlRemHistMovBemFec.SQLChanged, False) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Vai para o próximo periodo
         //-------------------------------------------------------------------------------
         dDataMov := CalcProxDataFec(dDataMov, -1);
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

function TCtrlUtilImplantacao.CalcProxDataFec(dDataMov : TDateTime; iMov : Integer) : TDateTime;
Var
   dAux : TDateTime;
   iDia,iMes,iAno,
   iMesFim,iAnoFim,iDiaFim : Word;

begin
   if iMov > 0 then
      dAux := dDataMov + 28
   else
      dAux := dDataMov - 33;
   //-------------------------------------------------------------------------------------
   DecodeDate(dAux, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   Result := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

function TCtrlUtilImplantacao.ExecutarFechamento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                                 dDataIni, dDataFim, dDataBaixa : TDateTime;
                                                 iMotivoBaixa : Integer) : Boolean;
var
   iHistMovBem, iFatorDec,
   iTipDepProRata, iFlgDeprec         : Integer;
   dDataMov, dDataUltDep,
   dDtaIniPer, dDtaFimPer             : TDateTime;
   nCmBem, nDepLanc, nCmDep,
   nValCmBem, nValDepLanc, nValCmDep,
   nFatorCM, nFatorDep, nTaxaDep,
   nSeqHist, nValMin                  : Extended;
   bCalcCM, bCalcDep, bCalcCmDep      : Boolean;
   iAno, iMes, iDia                   : Word;
   sFatorDec                          : String;

begin
   try
      //----------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //----------------------------------------------------------------------------------
      iTipDepProRata := 2;
      if not ParamCAF.CarregaProp(nEmpresaProp) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      GeraCAFMoedasProp;
      //----------------------------------------------------------------------------------
      // Processa os periodos
      //----------------------------------------------------------------------------------
      dDataMov := dDataIni;
      while dDataMov <= dDataFim do
      begin
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets com os dados do bem
         //-------------------------------------------------------------------------------
         FcdsBem.Data               := Bem.ListaBem(nEmpresaProp, nBem);
         FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,nBem);
         FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,nBem);
         FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,nBem);
         FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,nBem);
         FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,nBem);
         FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,nBem);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,nBem);
         FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,nBem);
         //-------------------------------------------------------------------------------
         // Processa os calculos por moeda
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
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
               nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxMoeda.FieldByName('DATAULTCM').AsDateTime);
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
                                                               iTipDepProRata,                                     // TIPDEPPRORATA
                                                               -1,                                                 // IDTIPODESPESA
                                                               '',                                                 // OBSACRESCIMO
                                                               -1,                                                 // IDMOTIVOBAIXA
                                                                0,                                                 // PROPBAIXA
                                                                0,                                                 // VALVENDAOFI
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
                     _dMTFechamento.sqlAtuBemxMoeda.Prepare;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDBEM').AsFloat        := FcdsBemxMoeda.FieldByName('IDBEM').AsFloat;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDPESSOA').AsFloat     := FcdsBemxMoeda.FieldByName('IDPESSOA').AsFloat;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('MOECODIGO').AsInteger  := FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('CMBEM').AsFloat        := nValCmBem;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('DATAULTCM').AsDateTime := dDataMov;
                     if not ExecSQL(_dMTFechamento.sqlAtuBemxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
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
                  nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBemxDep.FieldByName('DATAULTCM').AsDateTime);
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
                                                                  iTipDepProRata,                                  // TIPDEPPRORATA
                                                                  -1,                                              // IDTIPODESPESA
                                                                  '',                                              // OBSACRESCIMO
                                                                  -1,                                              // IDMOTIVOBAIXA
                                                                   0,                                              // PROPBAIXA
                                                                   0,                                              // VALVENDAOFI
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
                        _dMTFechamento.sqlAtuBemxDep1.Prepare;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDBEM').AsFloat        := FcdsBemxDep.FieldByName('IDBEM').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDPESSOA').AsFloat     := FcdsBemxDep.FieldByName('IDPESSOA').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('MOECODIGO').AsInteger  := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDTAXADEP').AsInteger  := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('CMDEP').AsFloat        := nValCmDep;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('DATAULTCM').AsDateTime := dDataMov;
                        if not ExecSQL(_dMTFechamento.sqlAtuBemxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
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
                  nFatorDep := CalculaFatorDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                       dDataMov,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime, False);
               end else
               begin
                  nFatorDep := CalculaFatorDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                       dDataMov,
                                                       FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsBem.FieldByName('DATAINICIODEP').AsDateTime, False);
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
               if (iFlgDeprec = 0) and (nFatorDep > 0) and
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
                     iFlgDeprec := 1;
                  end;
                  //----------------------------------------------------------------------
                  // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                  // caso contrário, deixar para acumular na próxima depreciação.
                  //----------------------------------------------------------------------
                  if abs(nDepLanc) >= nValMin then
                  begin
                     nValDepLanc := FcdsBemxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                     //-------------------------------------------------------------------
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
                                                               iTipDepProRata,                                   // TIPDEPPRORATA
                                                               -1,                                               // IDTIPODESPESA
                                                               '',                                               // OBSACRESCIMO
                                                               -1,                                               // IDMOTIVOBAIXA
                                                                0,                                               // PROPBAIXA
                                                                0,                                                 // VALVENDAOFI
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
                  end;
               end;
               //-------------------------------------------------------------------------
               // Avança para a próxima taxa de depreciação
               //-------------------------------------------------------------------------
               FcdsBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a próxima moeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // COMPONENTE REAVALIACAO
         //-------------------------------------------------------------------------------
         // Prepara a tabela de custos para o calculo da correção monetária e depreciação
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            FcdsReavalxMoeda.Locate('IDREAVALIACAO',VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger]),[]);
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) do
            begin
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
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nCmBem) >= 0.01 then
                     begin
                        nValCmBem := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                                                                   0,                                                 // VALVENDAOFI
                                                                  '');                                                   // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                                0,
                                                                nCmBem) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor na tabela ReavalxMoeda
                        //----------------------------------------------------------------
                        _dMTFechamento.sqlAtuReavxMoeda.Prepare;
                        _dMTFechamento.sqlAtuReavxMoeda.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTFechamento.sqlAtuReavxMoeda.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuReavxMoeda.ParamByName('CMBEM').AsFloat           := nValCmBem;
                        _dMTFechamento.sqlAtuReavxMoeda.ParamByName('DATAULTCM').AsDateTime    := dDataMov;
                        if not ExecSQL(_dMTFechamento.sqlAtuReavxMoeda.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
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
                        // Se o valor absoluto calculado for maior ou igual a
                        // 0,01 registrar, caso contrário, deixar para acumular na
                        // próxima depreciação.
                        //----------------------------------------------------------------
                        if abs(nCmDep) >= 0.01 then
                        begin
                           nValCmDep := FcdsReavalxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                           //-------------------------------------------------------------
                           // Registra na tabela HISTORICOMOVIMENTACAO
                           //-------------------------------------------------------------
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
                                                                      0,                                                 // VALVENDAOFI
                                                                     '');                                                  // OBSBAIXA
                           if nSeqHist = -1 then
                              Raise Exception.Create(HistMovBem.MessageInfo);
                           //-------------------------------------------------------------
                           // Registra o valor no histórico
                           //-------------------------------------------------------------
                           if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                   FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                   FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                                   nCmDep) then
                              Raise Exception.Create(HistMovBem.MessageInfo);
                           //-------------------------------------------------------------
                           // Registra o valor na tabela ReavalxDep
                           //-------------------------------------------------------------
                           _dMTFechamento.sqlAtuReavxDep1.Prepare;
                           _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                           _dMTFechamento.sqlAtuReavxDep1.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                           _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                           _dMTFechamento.sqlAtuReavxDep1.ParamByName('CMDEP').AsFloat           := nValCmDep;
                           _dMTFechamento.sqlAtuReavxDep1.ParamByName('DATAULTCM').AsDateTime    := dDataMov;
                           if not ExecSQL(_dMTFechamento.sqlAtuReavxDep1.SQLChanged, True) then
                              Raise Exception.Create(MessageInfo);
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Processar a Depreciação da Reavaliacao
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo de depreciação para a Reavaliacao
                  //----------------------------------------------------------------------
                  nFatorDep := CalculaFatorDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                       dDataMov,
                                                       FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime, False);
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
                     // Se o valor calculado para depreciação for superior ao total do
                     // custo de aquisição do bem, ajustar o valor para igualar e setar o
                     // flag de encerramento de periodo de depreciação
                     //-------------------------------------------------------------------
                     if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                        abs(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                     begin
                        nDepLanc := (FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                        iFlgDeprec := 1;
                     end;
                     //-------------------------------------------------------------------
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nValMin) >= 0.01 then
                     begin
                        nValDepLanc := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                                                                   0,                                                 // VALVENDAOFI
                                                                  '');                                                    // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,   // IDTAXADEP
                                                                nDepLanc) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra os valores na tabela ReavalxDep
                        //----------------------------------------------------------------
                        _dMTFechamento.sqlAtuReavxDep2.Prepare;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('MOECODIGO').AsInteger     := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDTAXADEP').AsInteger     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('DEPLANC').AsFloat         := nValDepLanc;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('DATAULTDEP').AsDateTime   := dDataMov;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('FLGDEPREC').AsInteger     := iFlgDeprec;
                        if not ExecSQL(_dMTFechamento.sqlAtuReavxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
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
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // COMPONENTE ACRESCIMO DE VALOR
         //-------------------------------------------------------------------------------
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
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nCmBem) >= 0.01 then
                     begin
                        nValCmBem := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + nCmBem;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                                                                   0,                                                 // VALVENDAOFI
                                                                  '');                                                   // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                                0,
                                                                nCmBem) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor na tabela AcrescValorxMoeda
                        //----------------------------------------------------------------
                        _dMTFechamento.sqlAtuAcresxMoeda.Prepare;
                        _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('CMBEM').AsFloat         := nValCmBem;
                        _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('DATAULTCM').AsDateTime  := dDataMov;
                        if not ExecSQL(_dMTFechamento.sqlAtuAcresxMoeda.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
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
                        // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                        // caso contrário, deixar para acumular na próxima depreciação.
                        //----------------------------------------------------------------
                        if abs(nCmDep) >= 0.01 then
                        begin
                           nValCmDep := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + nCmDep;
                           //-------------------------------------------------------------
                           // Registra na tabela HISTORICOMOVIMENTACAO
                           //-------------------------------------------------------------
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
                                                                      0,                                                 // VALVENDAOFI
                                                                     '');                                                  // OBSBAIXA
                           if nSeqHist = -1 then
                              Raise Exception.Create(HistMovBem.MessageInfo);
                           //-------------------------------------------------------------
                           // Registra o valor no histórico
                           //-------------------------------------------------------------
                           if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                   FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                   FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                   nCmDep) then
                              Raise Exception.Create(HistMovBem.MessageInfo);
                           //-------------------------------------------------------------
                           // Registra o valor na tabela AcrescValorxDep
                           //-------------------------------------------------------------
                           _dMTFechamento.sqlAtuAcresxDep1.Prepare;
                           _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                           _dMTFechamento.sqlAtuAcresxDep1.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                           _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                           _dMTFechamento.sqlAtuAcresxDep1.ParamByName('CMDEP').AsFloat         := nValCmDep;
                           _dMTFechamento.sqlAtuAcresxDep1.ParamByName('DATAULTCM').AsDateTime  := dDataMov;
                           if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep1.SQLChanged, True) then
                              Raise Exception.Create(MessageInfo);
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Processar a Depreciação da AcrescimoValor
                  //----------------------------------------------------------------------
                  // Calcula o fator de tempo de depreciação para a AcrescimoValor
                  //----------------------------------------------------------------------
                  nFatorDep := CalculaFatorDepreciacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                       dDataMov,
                                                       FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime,
                                                       FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime, False);
                  //----------------------------------------------------------------------
                  // Captura o flag de controle de fim de periodo de depreciação
                  //----------------------------------------------------------------------
                  if FcdsAcrescValorxDep.FieldByName('FLGDEPREC').IsNull then
                     iFlgDeprec := 0
                  else
                     iFlgDeprec := FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsInteger;
                  //----------------------------------------------------------------------
                  // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                  // for diferente de zero e a taxa de depreciação for diferente de zero,
                  // Calcular o valor a depreciar no periodo.
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
                     // Se o valor calculado para depreciação for superior ao total do custo
                     // de aquisição do bem, ajustar o valor para igualar e setar o flag
                     // de encerramento de periodo de depreciação
                     //-------------------------------------------------------------------
                     if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                        abs(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) then
                     begin
                        nDepLanc := (FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                        iFlgDeprec := 1;
                     end;
                     //-------------------------------------------------------------------
                     // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                     // caso contrário, deixar para acumular na próxima depreciação.
                     //-------------------------------------------------------------------
                     if abs(nDepLanc) >= nValMin then
                     begin
                        nValDepLanc := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + nDepLanc;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                           // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,                        // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,                        // IDMODULO
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
                                                                  iTipDepProRata,                                                 // TIPDEPPRORATA
                                                                  -1,                                                             // IDTIPODESPESA
                                                                  '',                                                             // OBSACRESCIMO
                                                                  -1,                                                             // IDMOTIVOBAIXA
                                                                   0,                                                              // PROPBAIXA
                                                                   0,                                                 // VALVENDAOFI
                                                                  '');                                                            // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                nDepLanc) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra os valores na tabela AcrescValorxDep
                        //----------------------------------------------------------------
                        _dMTFechamento.sqlAtuAcresxDep2.Prepare;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := nValDepLanc;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDateTime := dDataMov;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                        if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
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
            FcdsAcrescimoValor.Next
         end;
         //-------------------------------------------------------------------------------
         // Executar a Baixa qdo entrar no periodo determinado
         //-------------------------------------------------------------------------------
         if dDataBaixa <> -1 then
         begin
            dDtaIniPer := dDataMov + 1;
            dDtaFimPer := CalcProxDataFec(dDataMov, 1);
            if (dDataBaixa >= dDtaIniPer) and (dDataBaixa <= dDtaFimPer) then
            begin
               if not ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem,
                                   iMotivoBaixa, dDataBaixa, 'Baixa na Implantação') then
                  Raise Exception.Create(MessageInfo + #13 +
                                         'Não foi possível executar a baixa do bem' + #13 +
                                         FcdsBem.FieldByName('PLACA').AsString);
               //-------------------------------------------------------------------------
               dDataMov := dDataFim;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Vai para o próximo periodo
         //-------------------------------------------------------------------------------
         dDataMov := CalcProxDataFec(dDataMov, 1);
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

function TCtrlUtilImplantacao.ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                           iMotivoBaixa : Integer; dDataBaixa : TDateTime;
                                           sObsBaixa : String) : Boolean;

var
   iPlanoConta,
   iSeqHist, iAux, iTipDepProRata,
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
   nBaixaCM, nBaixaCMD                                  : Currency;
   dDataUltMov, dDataUltDep                             : TDateTime;
   bPrimMov                                             : Boolean;

begin
   try
      iTipDepProRata := 0; 
      //----------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
      begin
         MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Valida os Parâmetros obrigatórios para baixa de bens
      //----------------------------------------------------------------------------------
      if nModulo <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
      else
         if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
            Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
      //----------------------------------------------------------------------------------
      if nEmpresaProp <= 0 then
         Raise Exception.Create('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!')
      else
         if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
            Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      if iMotivoBaixa <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório fornecer o MOTIVO DA BAIXA!'));
      //----------------------------------------------------------------------------------
      // Alimentando os DataSets Filhos com os dados do bem que será baixado
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
      FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp, nBem);
      FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, nBem);
      FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
      FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, nBem);
      FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
      FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
      FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
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
      if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataBaixa - 1), 0) then
         Raise Exception.Create(ProRata.MessageInfo);
      //----------------------------------------------------------------------------------
      if ((FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S') or
          (FcdsBem.FieldByName('PROPBAIXA').AsFloat = 100)) then
         Raise Exception.Create(CMTranslate('Bem ') + trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                inttostr(FcdsBem.FieldByName('PLACA').AsInteger) + CMTranslate(' já Baixado !'));
      //----------------------------------------------------------------------------------
      nPropBaixa := 100;
      nPropOriginal := (100 - FcdsBem.FieldByName('PROPBAIXA').AsFloat) * (nPropBaixa / 100);
      //----------------------------------------------------------------------------------
      // Realiza a baixa do custo de aquisicao
      //----------------------------------------------------------------------------------
      nSeqHist := 0;
      bPrimMov := True;
      FcdsBemxMoeda.First;
      while not FcdsBemxMoeda.EOF do
      begin
         if bPrimMov then
         begin
            //----------------------------------------------------------------------------
            // Registra na tabela HISTORICOMOVIMENTACAO
            //----------------------------------------------------------------------------
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
                                                      0,                                       // VALVENDAOFI
                                                      sObsBaixa);                              // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            bPrimMov := False;
         end;
         //-------------------------------------------------------------------------------
         // Registra o valor no histórico
         //-------------------------------------------------------------------------------
         nBaixaB  := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
         if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                 FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                 0,
                                                 nBaixaB) then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra a Baixa em BemxMoeda
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Edit;
         FcdsBemxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
         FcdsBemxMoeda.Post;
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
         Raise Exception.Create(_dbBemxMoeda.MessageInfo);
      //----------------------------------------------------------------------------------
      // Realiza a baixa da CM do custo de aquisicao
      //----------------------------------------------------------------------------------
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
               //----------------------------------------------------------------------------
               // Registra na tabela HISTORICOMOVIMENTACAO
               //----------------------------------------------------------------------------
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
                                                          0,                                      // PROPBAIXA
                                                          0,                                      // VALVENDAOFI
                                                         '');                                     // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    nBaixaCM) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Baixa em BemxMoeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Edit;
            FcdsBemxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
            FcdsBemxMoeda.Post;
         end;
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Next;
      end;
      if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
         Raise Exception.Create(_dbBemxMoeda.MessageInfo);
      //----------------------------------------------------------------------------------
      // Realiza a baixa da Depreciação do Custo de Aquisicao
      //----------------------------------------------------------------------------------
      bPrimMov := True;
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         nBaixaD := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
         if nBaixaD <> 0 then
         begin
            if bPrimMov then
            begin
               //-------------------------------------------------------------------------
               // Registra na tabela HISTORICOMOVIMENTACAO
               //-------------------------------------------------------------------------
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
                                                          0,                                      // VALVENDAOFI
                                                         '');                                     // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                    nBaixaD) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Baixa em BemxDep
            //----------------------------------------------------------------------------
            FcdsBemxDep.Edit;
            FcdsBemxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
            FcdsBemxDep.Post;
         end;
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
         Raise Exception.Create(_dbBemxDep.MessageInfo);
      //----------------------------------------------------------------------------------
      // Realiza a baixa da CM da Depreciação do Custo de Aquisicao
      //----------------------------------------------------------------------------------
      bPrimMov := True;
      FcdsBemxDep.First;
      while not FcdsBemxDep.EOF do
      begin
         nBaixaCMD := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
         if nBaixaCMD <> 0 then
         begin
            if bPrimMov then
            begin
               //-------------------------------------------------------------------------
               // Registra na tabela HISTORICOMOVIMENTACAO
               //-------------------------------------------------------------------------
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
                                                          0,                                       // PROPBAIXA
                                                          0,                                                 // VALVENDAOFI
                                                         '');                                     // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                    nBaixaCMD) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Baixa em BemxDep
            //----------------------------------------------------------------------------
            FcdsBemxDep.Edit;
            FcdsBemxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
            FcdsBemxDep.Post;
         end;
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Next;
      end;
      if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
         Raise Exception.Create(_dbBemxDep.MessageInfo);
      //----------------------------------------------------------------------------------
      // Registra as alteracoes nos Flags de Controle
      //----------------------------------------------------------------------------------
      FcdsBem.Edit;
      FcdsBem.FieldByName('PROPBAIXA').AsFloat := FcdsBem.FieldByName('PROPBAIXA').AsFloat + nPropOriginal;
      if FcdsBem.FieldByName('PROPBAIXA').AsFloat < 100 then
         FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N'
      else
         FcdsBem.FieldByName('BAIXATOTAL').AsString := 'S';
      FcdsBem.Post;
      if not ApplyCds(FcdsBem,_dbBem,[],[]) then
         Raise Exception.Create(_dbBem.MessageInfo);
      //----------------------------------------------------------------------------------
      // Realiza a baixa das reavaliações
      //----------------------------------------------------------------------------------
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
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                   // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       nBaixaB) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em ReavalxMoeda
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Edit;
               FcdsReavalxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
               FcdsReavalxMoeda.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsReavalxMoeda.Next;
         end;
         if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
            Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Realiza a baixa da CM das reavaliações
      //----------------------------------------------------------------------------------
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
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                   // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       nBaixaCM) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em ReavalxMoeda
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Edit;
               FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
               FcdsReavalxMoeda.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsReavalxMoeda.Next;
         end;
         if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
            Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Realiza a baixa da Depreciação da Reavaliacao
      //----------------------------------------------------------------------------------
      FcdsReavaliacao.First;
      while not FcdsReavaliacao.EOF do
      begin
         bPrimMov := True;
         FcdsReavalxDep.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
         while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
         begin
            nBaixaD   := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
            if nBaixaD <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                 // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       nBaixaD) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em ReavalxDep
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Edit;
               FcdsReavalxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
               FcdsReavalxDep.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsReavalxDep.Next;
         end;
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Realiza a baixa da CM da Depreciação da Reavaliacao
      //----------------------------------------------------------------------------------
      FcdsReavaliacao.First;
      while not FcdsReavaliacao.EOF do
      begin
         bPrimMov := True;
         FcdsReavalxDep.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
         while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
         begin
            nBaixaCMD := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
            if nBaixaCMD <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                 // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       nBaixaCMD) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em ReavalxDep
               //-------------------------------------------------------------------------
               FcdsReavalxDep.Edit;
               FcdsReavalxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
               FcdsReavalxDep.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsReavalxDep.Next;
         end;
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Baixa dos Acréscimos de Valor
      //----------------------------------------------------------------------------------
      FcdsAcrescimoValor.First;
      while not FcdsAcrescimoValor.EOF do
      begin
         bPrimMov := True;
         FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
         while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
         begin
            nBaixaB  := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
            if nBaixaB <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                   // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       nBaixaB) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em AcrescValorxMoeda
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Edit;
               FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
               FcdsAcrescValorxMoeda.Post;
            end;
            FcdsAcrescValorxMoeda.Next;
         end;
         if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
            Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Next;
      end;
      //----------------------------------------------------------------------------------
      // Baixa da CM dos Acréscimos de Valor
      //----------------------------------------------------------------------------------
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
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                   // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       nBaixaCM) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em AcrescValorxMoeda
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Edit;
               FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
               FcdsAcrescValorxMoeda.Post;
            end;
            FcdsAcrescValorxMoeda.Next;
         end;
         if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
            Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Next;
      end;
      //----------------------------------------------------------------------------------
      // Realiza a baixa da Depreciação do Acrescimo de Valor
      //----------------------------------------------------------------------------------
      FcdsAcrescimoValor.First;
      while not FcdsAcrescimoValor.EOF do
      begin
         bPrimMov := True;
         FcdsAcrescValorxDep.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
         while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
         begin
            nBaixaD := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
            if nBaixaD <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                 // VALVENDAOFI
                                                            '');                                                 // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                       nBaixaD) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em AcrescValorxDep
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Edit;
               FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
               FcdsAcrescValorxDep.Post;
            end;
            FcdsAcrescValorxDep.Next;
         end;
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Next;
      end;
      //----------------------------------------------------------------------------------
      // Realiza a baixa da CM da Depreciação do Acrescimo de Valor
      //----------------------------------------------------------------------------------
      FcdsAcrescimoValor.First;
      while not FcdsAcrescimoValor.EOF do
      begin
         bPrimMov := True;
         FcdsAcrescValorxDep.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
         while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
         begin
            nBaixaCMD := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
            if nBaixaCMD <> 0 then
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
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
                                                             0,                                                  // PROPBAIXA
                                                             0,                                                  // VALVENDAOFI
                                                            '');                                                 // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                       nBaixaCMD) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em AcrescValorxDep
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Edit;
               FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
               FcdsAcrescValorxDep.Post;
            end;
            FcdsAcrescValorxDep.Next;
         end;
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.Next;
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

function TCtrlUtilImplantacao.CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime) : Extended;
var
   nValAtual, nValAnt : Extended;
   iNumDecimais, iFlgArredonda : Integer;

begin
   if ParamCAF.FLGCALCCM = 1 then // Sistema parametrizado para calcular C.M.
   begin
      nValAnt   := Bem.CotacaoMoeda(Trunc(ParamCAF.MOEDAFISCAL),dDataAnt,iNumDecimais, iFlgArredonda);
      nValAtual := Bem.CotacaoMoeda(Trunc(ParamCAF.MOEDAFISCAL),dDataMov,iNumDecimais, iFlgArredonda);
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

function TCtrlUtilImplantacao.CalculaFatorDepreciacao(iModulo : Integer;
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

function TCtrlUtilImplantacao.EstornaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                           dDataMov,dDataEst : TDateTime) : Boolean;
Var
   sSql           : String;
   iFlgPai,
   iTipDepProRata : Integer;

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
      // verifica se ja houve movimentação no bem após a Baixa (Parcial)
      //----------------------------------------------------------------------------------
      sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
              ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
              ' WHERE  (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' + #13 +
              '   AND  (IDBEM = ' + floattostr(nBem) + ') ' + #13;
      _cds.Data := GetDataPacket(sSql);
      if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
         Raise Exception.Create(CMTranslate('Existe movimentação após a baixa parcial do bem. Consulte Histórico de Movimentação!'));
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
      if FcdsBem.IsEmpty then
         Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
      //----------------------------------------------------------------------------------
      // Valida os Parâmetros obrigatórios
      //----------------------------------------------------------------------------------
      if nModulo <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
      else
         if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
            Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
      //----------------------------------------------------------------------------------
      if nEmpresaProp <= 0 then
         Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
      else
         if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
            Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
      //----------------------------------------------------------------------------------
      if FcdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MessageInfo := CMTranslate('Bem em Saída Temporária!');
         Raise Exception.Create(MessageInfo);
      end else
      //----------------------------------------------------------------------------------
      // Alimentando os DataSets Filhos com os dados do bem que terá a baixa estornada
      //----------------------------------------------------------------------------------
      FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
      FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp, nBem);
      FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, nBem);
      FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
      FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, nBem);
      FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
      FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
      FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
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
      // Retorna os Valores Baixados nas Tabela BEMXMOEDA e BEMXDEP
      //----------------------------------------------------------------------------------
      _dMTBem.sqlMovBaixaBem.Prepare;
      _dMTBem.sqlMovBaixaBem.ParamByName('IDBEM').AsFloat      := nBem;
      _dMTBem.sqlMovBaixaBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
      _dMTBem.sqlMovBaixaBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
      _cds.Data := _dMTBem.sqlMovBaixaBem.Data;
      iTipDepProRata := _cds.FieldByName('TIPDEPPRORATA').AsInteger;
      //----------------------------------------------------------------------------------
      _cds.First;
      while not _cds.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Posiciona a tabela de acordo com a movimentacao
         //-------------------------------------------------------------------------------
         if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 06) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 25) then
            FcdsBemxMoeda.Locate('MOECODIGO',_cds.FieldByName('MOECODIGO').AsFloat,[])
         else
            FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                  _cds.FieldByName('IDTAXADEP').AsFloat]), []);
         //-------------------------------------------------------------------------------
         case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
            06 : begin
                    if _cds.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                    begin
                       FcdsBem.Edit;
                       FcdsBem.FieldByName('PROPBAIXA').AsFloat   := Bem.ConvNum(FcdsBem.FieldByName('PROPBAIXA').AsFloat - _cds.FieldByName('PROPBAIXA').AsFloat);
                       FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N';
                       FcdsBem.Post;
                    end;
                    //--------------------------------------------------------------------
                    FcdsBemxMoeda.Edit;
                    FcdsBemxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                    FcdsBemxMoeda.Post;
                 end;
            //----------------------------------------------------------------------------
            25 : begin
                    FcdsBemxMoeda.Edit;
                    FcdsBemxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                    FcdsBemxMoeda.Post;
                 end;
            //----------------------------------------------------------------------------
            24 : begin
                    FcdsBemxDep.Edit;
                    FcdsBemxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                    FcdsBemxDep.Post;
                 end;
            //----------------------------------------------------------------------------
            26 : begin
                    FcdsBemxDep.Edit;
                    FcdsBemxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                    FcdsBemxDep.Post;
                 end;
         end;
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      if not ApplyCds(FcdsBem,_dbBem,[],[]) then
         Raise Exception.Create(_dbBem.MessageInfo);
      if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
         Raise Exception.Create(_dbBemxMoeda.MessageInfo);
      if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
         Raise Exception.Create(_dbBemxDep.MessageInfo);
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela REAVALIACAO
      //----------------------------------------------------------------------------------
      while not FcdsReavaliacao.EOF do
      begin
         _dMTBem.sqlMovBaixaReaval.Prepare;
         _dMTBem.sqlMovBaixaReaval.ParamByName('IDBEM').AsFloat          := nBem;
         _dMTBem.sqlMovBaixaReaval.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
         _dMTBem.sqlMovBaixaReaval.ParamByName('IDREAVALACRESC').AsFloat := FcdsReavaliacao.Fieldbyname('IDREAVALIACAO').AsFloat;
         _dMTBem.sqlMovBaixaReaval.ParamByName('DATAMOV').AsDateTime     := dDataMov;
         _cds.Data := _dMTBem.sqlMovBaixaReaval.Data;
         //-------------------------------------------------------------------------------
         _cds.First;
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Posiciona a tabela de acordo com a movimentacao
            //----------------------------------------------------------------------------
            if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 20) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 28) then
               FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                             _cds.FieldByName('MOECODIGO').AsFloat]),[])
            else
               FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                        _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                        _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
            //----------------------------------------------------------------------------
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               20 : begin
                       FcdsReavalxMoeda.Edit;
                       FcdsReavalxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsReavalxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               28 : begin
                       FcdsReavalxMoeda.Edit;
                       FcdsReavalxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsReavalxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               27 : begin
                       FcdsReavalxDep.Edit;
                       FcdsReavalxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsReavalxDep.Post;
                    end;
               //-------------------------------------------------------------------------
               29 : begin
                       FcdsReavalxDep.Edit;
                       FcdsReavalxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsReavalxDep.Post;
                    end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         FcdsReavaliacao.Next
      end;
      if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
         Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
      if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
         Raise Exception.Create(_dbReavalxDep.MessageInfo);
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      while not FcdsAcrescimoValor.EOF do
      begin
         _dMTBem.sqlMovBaixaAcresc.Prepare;
         _dMTBem.sqlMovBaixaAcresc.ParamByName('IDBEM').AsFloat          := nBem;
         _dMTBem.sqlMovBaixaAcresc.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
         _dMTBem.sqlMovBaixaAcresc.ParamByName('IDREAVALACRESC').AsFloat := FcdsAcrescimoValor.Fieldbyname('IDACRESCIMO').AsFloat;
         _dMTBem.sqlMovBaixaAcresc.ParamByName('DATAMOV').AsDateTime     := dDataMov;
         _cds.Data := _dMTBem.sqlMovBaixaAcresc.Data;
         //-------------------------------------------------------------------------------
         _cds.First;
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Posiciona a tabela de acordo com a movimentacao
            //----------------------------------------------------------------------------
            if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 37) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 38) then
               FcdsAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                _cds.FieldByName('MOECODIGO').AsFloat]),[])
            else
               FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                              _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                              _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
            //----------------------------------------------------------------------------
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               37 : begin
                       FcdsAcrescValorxMoeda.Edit;
                       FcdsAcrescValorxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsAcrescValorxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               38 : begin
                       FcdsAcrescValorxMoeda.Edit;
                       FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsAcrescValorxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               39 : begin
                       FcdsAcrescValorxDep.Edit;
                       FcdsAcrescValorxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsAcrescValorxDep.Post;
                    end;
               //-------------------------------------------------------------------------
               40 : begin
                       FcdsAcrescValorxDep.Edit;
                       FcdsAcrescValorxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                       FcdsAcrescValorxDep.Post;
                    end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         FcdsAcrescimoValor.Next
      end;
      if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
         Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
      if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
         Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
              ' SET PLNCODIGO = NULL '+
              ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
              '                          FROM HISTORICOMOVIMENTACAO'+
              '                          WHERE (IDBEM = ' + floattostr(nBem) + ')' +
              '                            AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ')' +
              '                            AND (DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
              '                            AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40)))';
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      // Remove os Registros da Baixa no Historico
      //----------------------------------------------------------------------------------
      sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
              ' FROM HISTORICOMOVIMENTACAO'+
              ' WHERE (IDBEM    = ' + floattostr(nBem) + ')' +
              '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ')' +
              '   AND (DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
              '   AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40))';
      _cds.Data := GetDataPacket(sSql);
      if _cds.IsEmpty then
         Raise Exception.Create(CMTranslate('Não foi possível estornar a baixa do Bem ') +
                                trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
      //----------------------------------------------------------------------------------
      while not _cds.Eof do
      begin
         sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                 ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os valores da baixa do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ')';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover o historico da baixa do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao PróRata
      //----------------------------------------------------------------------------------
      if iTipDepProRata = 0 then
      begin
         if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
            Raise Exception.Create(ProRata.MessageInfo);
      end else
      begin
         if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, dDataEst) then
            Raise Exception.Create(ProRata.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
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

function TCtrlUtilImplantacao.RemoveBemDuplicado(iModulo, iEmpresaProp, iUsuario, iBem: Integer): Boolean;
var
   sSql : String;

begin
   try
      //----------------------------------------------------------------------------------
      // Posiciona a tabela BEM
      //----------------------------------------------------------------------------------
      if Fcds.IsEmpty then
         Fcds.Data := Bem.ListaBem(iEmpresaProp,iBem);
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
      // Verifica se existem Lancamentos na Contabilidade
      //----------------------------------------------------------------------------------
      sSql := ' SELECT COUNT(IDMOVIMENTACAO) AS QTD ' +
              ' FROM HISTORICOMOVIMENTACAO '+
              ' WHERE IDBEM = ' + inttostr(iBem) +
              '   AND IDPESSOA = ' + inttostr(iEmpresaProp) +
              '   AND (NOT (PLNCODIGO IS NULL)) ';
      _cds.Data := GetDataPacket(sSql);
      if _cds.FieldByName('QTD').AsInteger <> 0 then
      begin
         MessageInfo := CMTranslate('Existe movimentação integrada a Contabilidade!');
         Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, IDREAVALACRESC ' + #13 +
                                 ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                                 ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                                 '   AND (IDBEM    = ' + inttostr(iBem) + ')');
      while not _cds.Eof do
      begin
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
      _cds.Data := GetDataPacket(' SELECT IDREAVALIACAO ' + #13 +
                                 ' FROM REAVALIACAO ' + #13 +
                                 ' WHERE IDPESSOA = ' + inttostr(iEmpresaProp) +
                                 '   AND IDBEM = ' + inttostr(iBem));
      while not _cds.Eof do
      begin
         sSql := ' DELETE FROM REAVALXDEP ' +
                 ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALIACAO').AsString + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (REAVALXDEP)');
         sSql := ' DELETE FROM REAVALXMOEDA ' +
                 ' WHERE (IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALIACAO').AsString + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (REAVALXMOEDA)');
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      if not _cds.IsEmpty then
      begin
         sSql := ' DELETE FROM REAVALIACAO ' +
                 ' WHERE IDPESSOA = ' + inttostr(iEmpresaProp) +
                 '   AND IDBEM = ' + inttostr(iBem);
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (REAVALIACAO)');
      end;
      //----------------------------------------------------------------------------------
      _cds.Data := GetDataPacket(' SELECT IDACRESCIMO ' + #13 +
                                 ' FROM ACRESCIMOVALOR ' + #13 +
                                 ' WHERE IDPESSOA = ' + inttostr(iEmpresaProp) +
                                 '   AND IDBEM = ' + inttostr(iBem));
      while not _cds.Eof do
      begin
         sSql := ' DELETE FROM ACRESCVALORXDEP ' +
                 ' WHERE (IDACRESCIMO = ' + _cds.FieldByName('IDACRESCIMO').AsString + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (ACRESCVALORXDEP)');
         sSql := ' DELETE FROM ACRESCVALORXMOEDA ' +
                 ' WHERE (IDACRESCIMO = ' + _cds.FieldByName('IDACRESCIMO').AsString + ')';
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (ACRESCVALORXMOEDA)');
         //-------------------------------------------------------------------------------
         _cds.Next;
      end;
      //----------------------------------------------------------------------------------
      if not _cds.IsEmpty then
      begin
         sSql := ' DELETE FROM ACRESCIMOVALOR ' +
                 ' WHERE IDPESSOA = ' + inttostr(iEmpresaProp) +
                 '   AND IDBEM = ' + inttostr(iBem);
         if not ExecSQL(sSql, (iModulo <> 8)) then
            Raise Exception.Create(MessageInfo + ' (ACRESCIMO)');
      end;      
      //----------------------------------------------------------------------------------
      // Remove os Registros de Movimentacao Inicial do Bem
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
              ' WHERE IDPESSOA = ' + inttostr(iEmpresaProp) +
              '   AND IDBEM = ' + inttostr(iBem);
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
      sSql := ' DELETE FROM BEMCOTACAO ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM PLANOPATROXBEM ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, False) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BEMXDEP ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (BEMXDEP)');
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BEMXMOEDA ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, (iModulo <> 8)) then
         Raise Exception.Create(MessageInfo + ' (BEMXMOEDA)');
      //----------------------------------------------------------------------------------
      sSql := ' DELETE FROM BEM ' +
              ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
              '   AND (IDBEM    = ' + inttostr(iBem) + ')';
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo + ' (BEM)');
      //----------------------------------------------------------------------------------
      if not Fcds.FieldByName('IDIMAGEM').IsNull then
      begin
         sSql := ' DELETE FROM IMAGENS ' +
                 ' WHERE IDIMAGEM = ' + floattostr(Fcds.FieldByName('IDIMAGEM').AsFloat);
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);
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

function TCtrlUtilImplantacao.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

