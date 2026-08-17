unit uCtrlMovDesmembramento;


{-------------------------------------------------------------------------------
Rotina...........: ExecutaDesmembramento, EstornaDesmembramento 
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
-------------------------------------------------------------------------------}

//Rotina......... : ExecutaDesmembramento
//N. Sol..........: 199277
//N. Kintana......: 1918056
//Data............: 23/01/2013
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Tratar mensagens incorretas sobre instrução não atualizou dados no banco

//Rotina......... : -
//N. Sol..........: 179583/9621
//N. Kintana......: 1663624
//Data............: 23/05/2012
//Responsável.....: Helen V. Bianchi
//Descrição.......: Tratar mensagens incorretas e replicadas

//Rotina..........: ExecutaDesmembramento
//N. Sol..........: 179583/9522
//N. Kintana......: 1659788
//Data............: 14/05/2012
//Responsável.....: Helen V Bianchi
//Descrição.......: Ajuste para apagar as tables no desmembramento corretamente

//Rotina..........: ExecutaDesmembramento
//N. Sol..........: 136732
//N. Kintana......: 821049
//Data............: 06/09/2010
//Responsável.....: Felipe de Oliveira
//Descrição.......: Ajuste para realizar  o desmembramento corretamente


//Rotina..........: EstornaDesmembramento
//N. Sol..........: 121534
//N. Kintana......: 586377
//Data............: 03/07/2009
//Responsável.....: Cássio Camargo
//Descrição.......: Ajuste na rotina retirando a Condição "if ExecSQL(sql, True) then"


//Rotina..........: EstornaDesmembramento
//N. Sol..........: 121469
//N. Kintana......: 585093
//Data............: 01/07/2009
//Responsável.....: Cássio Camargo
//Descrição.......: Ajutado o tratamento de exclusão de registros na tabela
//                  HMBREAVAL, no caso de não haver registros de movimentação.

//Rotina..........: ExecutaDesmembramento
//N. Sol..........: 120454
//N. Kintana......: 574711
//Data............: 19/06/2009
//Responsável.....: Cássio Camargo
//Descrição.......: Erro no sistema ao realizar o desmembramento de um imóvel,
//                  quando o percentual de rateio é quebrado, como por exemplo 0,8333%.

//Rotina..........: Function EstornaDesmembramento
//N. Sol..........: 95458
//N. Kintana......: 413614
//Data............: 28/11/2008
//Responsável.....: Cássio Camargo
//Descrição.......: Problema no desfazer Lançamento de Desmembramento.

//Rotina..........: Function ExecutaDesmembramento
//N. Sol..........: 95458
//N. Kintana......: 41361495
//Data............: 07/08/2008
//Responsável.....: Emerson S.
//Descrição.......: Problema no desfazer Lançamento de Desmembramento.

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uMidasUtil,
     dMTBem, uDBBem, uDBBemxMoeda, uDBBemxDep, uDBPlanoPatroxBem,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uCtrlParamCAF, uCtrlBem, uCtrlHistMovBem,
     uCtrlCafxContab, uCtrlFechamentoProRata, uDatabase, uCmClientDataset;

Type
   TCtrlMovDesmembramento = class(TCmControlObject)

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
      _dbPlanoPatroxBem    : TDBPlanoPatroxBem;
      _dbReavaliacao       : TDBReavaliacao;
      _dbReavalxMoeda      : TDBReavalxMoeda;
      _dbReavalxDep        : TDBReavalxDep;
      _dbAcrescimoValor    : TDBAcrescimoValor;
      _dbAcrescValorxMoeda : TDBAcrescValorxMoeda;
      _dbAcrescValorxDep   : TDBAcrescValorxDep;

      _dMTBem : TdtmMTBem;

      ParamCAF   : TCtrlParamCAF;
      HistMovBem : TCtrlHistMovBem;
      CafxContab : TCtrlCafxContab;
      ProRata    : TCtrlFechamentoProRata;
      Bem        : TCtrlBem;

      bIntegraContab : Boolean;

      FcdsBem: TClientDataSet;
      FcdsAcrescValorxMoeda: TClientDataSet;
      FcdsReavalxMoeda: TClientDataSet;
      FcdsAcrescValorxDep: TClientDataSet;
      FcdsBemxMoeda: TClientDataSet;
      FcdsReavaliacao: TClientDataSet;
      FcdsAcrescimoValor: TClientDataSet;
      FcdsReavalxDep: TClientDataSet;
      FcdsBemxDep: TClientDataSet;
      FcdsPlanoPatroxBem: TClientDataSet;
      FcdsBensGerados: TClientDataSet;
      FcdsGerBens: TClientDataSet;
      FcdsSldContab: TClientDataSet;
      FcdsNReavaliacao: TClientDataSet;
      FcdsNAcrescValorxMoeda: TClientDataSet;
      FcdsNAcrescimoValor: TClientDataSet;
      FcdsNReavalxDep: TClientDataSet;
      FcdsNBemxMoeda: TClientDataSet;
      FcdsNBem: TClientDataSet;
      FcdsNReavalxMoeda: TClientDataSet;
      FcdsNBemxDep: TClientDataSet;
      FcdsNAcrescValorxDep: TClientDataSet;

      FcdsAux: TClientDataSet;

      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBensGerados(const Value: TClientDataSet);
      procedure SetcdsGerBens(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsSldContab(const Value: TClientDataSet);
      procedure SetcdsNAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsNAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsNAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsNBem(const Value: TClientDataSet);
      procedure SetcdsNBemxDep(const Value: TClientDataSet);
      procedure SetcdsNBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsNReavaliacao(const Value: TClientDataSet);
      procedure SetcdsNReavalxDep(const Value: TClientDataSet);
      procedure SetcdsNReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsPlanoPatroxBem(const Value: TClientDataSet);
      procedure SetcdsAux(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;

   Public
      property cdsBem               : TClientDataSet read FcdsBem write SetcdsBem;
      property cdsBemxMoeda         : TClientDataSet read FcdsBemxMoeda write SetcdsBemxMoeda;
      property cdsBemxDep           : TClientDataSet read FcdsBemxDep write SetcdsBemxDep;
      property cdsPlanoPatroxBem    : TClientDataSet read FcdsPlanoPatroxBem write SetcdsPlanoPatroxBem;
      property cdsReavaliacao       : TClientDataSet read FcdsReavaliacao write SetcdsReavaliacao;
      property cdsReavalxMoeda      : TClientDataSet read FcdsReavalxMoeda write SetcdsReavalxMoeda;
      property cdsReavalxDep        : TClientDataSet read FcdsReavalxDep write SetcdsReavalxDep;
      property cdsAcrescimoValor    : TClientDataSet read FcdsAcrescimoValor write SetcdsAcrescimoValor;
      property cdsAcrescValorxMoeda : TClientDataSet read FcdsAcrescValorxMoeda write SetcdsAcrescValorxMoeda;
      property cdsAcrescValorxDep   : TClientDataSet read FcdsAcrescValorxDep write SetcdsAcrescValorxDep;
      property cdsGerBens           : TClientDataSet read FcdsGerBens write SetcdsGerBens;
      property cdsBensGerados       : TClientDataSet read FcdsBensGerados write SetcdsBensGerados;
      property cdsSldContab         : TClientDataSet read FcdsSldContab write SetcdsSldContab;
      //----------------------------------------------------------------------------------
      property cdsNBem               : TClientDataSet read FcdsNBem write SetcdsNBem;
      property cdsNBemxMoeda         : TClientDataSet read FcdsNBemxMoeda write SetcdsNBemxMoeda;
      property cdsNBemxDep           : TClientDataSet read FcdsNBemxDep write SetcdsNBemxDep;
      property cdsNReavaliacao       : TClientDataSet read FcdsNReavaliacao write SetcdsNReavaliacao;
      property cdsNReavalxMoeda      : TClientDataSet read FcdsNReavalxMoeda write SetcdsNReavalxMoeda;
      property cdsNReavalxDep        : TClientDataSet read FcdsNReavalxDep write SetcdsNReavalxDep;
      property cdsNAcrescimoValor    : TClientDataSet read FcdsNAcrescimoValor write SetcdsNAcrescimoValor;
      property cdsNAcrescValorxMoeda : TClientDataSet read FcdsNAcrescValorxMoeda write SetcdsNAcrescValorxMoeda;
      property cdsNAcrescValorxDep   : TClientDataSet read FcdsNAcrescValorxDep write SetcdsNAcrescValorxDep;
      //----------------------------------------------------------------------------------
      property cdsAux : TClientDataSet read FcdsAux write SetcdsAux;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ListaGerBens : OleVariant;
      function ListaSldContab : OleVariant;
      function ListaBensGerados(nEmpresaProp, nBem : Extended) : OleVariant;
      //----------------------------------------------------------------------------------
      function ExecutaDesmembramento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                     dDataMov : TDateTime) : Boolean;
      function EstornaDesmembramento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                     dDataMov, dDataEst : TDateTime) : Boolean;
   end;

implementation

{ TCtrlMovDesmembramento }

constructor TCtrlMovDesmembramento.Create;
begin
   inherited;
   _dbBem               := TDBBem.Create(Self);
   _dbBemxMoeda         := TDBBemxMoeda.Create(Self);
   _dbBemxDep           := TDBBemxDep.Create(Self);
   _dbPlanoPatroxBem    := TDBPlanoPatroxBem.Create(Self);
   _dbReavaliacao       := TDBReavaliacao.Create(Self);
   _dbReavalxMoeda      := TDBReavalxMoeda.Create(Self);
   _dbReavalxDep        := TDBReavalxDep.Create(Self);
   _dbAcrescimoValor    := TDBAcrescimoValor.Create(Self);
   _dbAcrescValorxMoeda := TDBAcrescValorxMoeda.Create(Self);
   _dbAcrescValorxDep   := TDBAcrescValorxDep.Create(Self);

   _dMTBem               := tdtmMTBem.Create(Self);

   FcdsBem                := TClientDataSet.Create(nil);
   FcdsBemxMoeda          := TClientDataSet.Create(nil);
   FcdsBemxDep            := TClientDataSet.Create(nil);
   FcdsPlanoPatroxBem     := TClientDataSet.Create(nil);
   FcdsReavaliacao        := TClientDataSet.Create(nil);
   FcdsReavalxMoeda       := TClientDataSet.Create(nil);
   FcdsReavalxDep         := TClientDataSet.Create(nil);
   FcdsAcrescimoValor     := TClientDataSet.Create(nil);
   FcdsAcrescValorxMoeda  := TClientDataSet.Create(nil);
   FcdsAcrescValorxDep    := TClientDataSet.Create(nil);

   FcdsGerBens            := TClientDataSet.Create(nil);
   FcdsBensGerados        := TClientDataSet.Create(nil);
   FcdsSldContab          := TClientDataSet.Create(nil);

   FcdsNBem               := TClientDataSet.Create(nil);
   FcdsNBemxMoeda         := TClientDataSet.Create(nil);
   FcdsNBemxDep           := TClientDataSet.Create(nil);
   FcdsNReavaliacao       := TClientDataSet.Create(nil);
   FcdsNReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsNReavalxDep        := TClientDataSet.Create(nil);
   FcdsNAcrescimoValor    := TClientDataSet.Create(nil);
   FcdsNAcrescValorxMoeda := TClientDataSet.Create(nil);
   FcdsNAcrescValorxDep   := TClientDataSet.Create(nil);

   FcdsAux                := TClientDataSet.Create(nil);

   Bem         := TCtrlBem.Create;
   ParamCAF    := TCtrlParamCAF.Create;
   HistMovBem  := TCtrlHistMovBem.Create;
   CafxContab  := TCtrlCafxContab.Create;
   ProRata     := TCtrlFechamentoProRata.Create(Nil);
end;

destructor TCtrlMovDesmembramento.Destroy;
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

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbPlanoPatroxBem.Free;
   _dbReavaliacao.Free;
   _dbReavalxMoeda.Free;
   _dbReavalxDep.Free;
   _dbAcrescimoValor.Free;
   _dbAcrescValorxMoeda.Free;
   _dbAcrescValorxDep.Free;

   _dMTBem.Free;

   if IsAppServer then
      FreeCDS([FcdsBem, FcdsBemxMoeda, FcdsBemxDep,
               FcdsReavaliacao, FcdsReavalxMoeda, FcdsReavalxDep,
               FcdsAcrescimoValor, FcdsAcrescValorxMoeda, FcdsAcrescValorxDep,
               FcdsGerBens, FcdsBensGerados]);

   FcdsPlanoPatroxBem.Free;
   FcdsSldContab.Free;

   FcdsNBem.Free;
   FcdsNBemxMoeda.Free;
   FcdsNBemxDep.Free;
   FcdsNReavaliacao.Free;
   FcdsNReavalxMoeda.Free;
   FcdsNReavalxDep.Free;
   FcdsNAcrescimoValor.Free;
   FcdsNAcrescValorxMoeda.Free;
   FcdsNAcrescValorxDep.Free;
   
   FcdsAux.Free;

   inherited;
end;

procedure TCtrlMovDesmembramento.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   ProRata.InitializeAs(Self);
end;

procedure TCtrlMovDesmembramento.DoChangeDataBase;
begin
   inherited;
   _dbBem.DataBaseName               := DataBaseName;
   _dbBemxMoeda.DataBaseName         := DataBaseName;
   _dbBemxDep.DataBaseName           := DataBaseName;
   _dbPlanoPatroxBem.DataBaseName    := DataBaseName;
   _dbReavaliacao.DataBaseName       := DataBaseName;
   _dbReavalxMoeda.DataBaseName      := DataBaseName;
   _dbReavalxDep.DataBaseName        := DataBaseName;
   _dbAcrescimoValor.DataBaseName    := DataBaseName;
   _dbAcrescValorxMoeda.DataBaseName := DataBaseName;
   _dbAcrescValorxDep.DataBaseName   := DataBaseName;
end;

procedure TCtrlMovDesmembramento.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsBensGerados(const Value: TClientDataSet);
begin
  FcdsBensGerados := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsGerBens(const Value: TClientDataSet);
begin
  FcdsGerBens := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsSldContab(const Value: TClientDataSet);
begin
   FcdsSldContab := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsNAcrescimoValor := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsNAcrescValorxDep := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsNAcrescValorxMoeda := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNBem(const Value: TClientDataSet);
begin
  FcdsNBem := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNBemxDep(const Value: TClientDataSet);
begin
  FcdsNBemxDep := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNBemxMoeda(const Value: TClientDataSet);
begin
  FcdsNBemxMoeda := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNReavaliacao(const Value: TClientDataSet);
begin
  FcdsNReavaliacao := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNReavalxDep(const Value: TClientDataSet);
begin
  FcdsNReavalxDep := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsNReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsNReavalxMoeda := Value;
end;

procedure TCtrlMovDesmembramento.SetcdsAux(const Value: TClientDataSet);
begin
  FcdsAux := Value;
end;

function TCtrlMovDesmembramento.ListaGerBens : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT B.IDBEM,                   ' +
           '        B.PLACA,                   ' +
           '        B.DESBEM,                  ' +
           '        B.IDCONJUNTO,              ' +
           '        C.DESCCONJUNTO,            ' +
           '        B.IDGRUPO,                 ' +
           '        G.CLASSE,                  ' +
           '        G.NOME,                    ' +
           '        (0) AS PROPORCAO           ' +
           ' FROM BEM B,                       ' +
           '      CONJUNTO C,                  ' +
           '      GRUPO G                      ' +
           ' WHERE B.IDBEM = -1                ' +
           '   AND B.IDCONJUNTO = C.IDCONJUNTO ' +
           '   AND B.IDGRUPO    = G.IDGRUPO    ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovDesmembramento.ListaBensGerados(nEmpresaProp, nBem : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT DM.IDBEMRESULTANTE AS IDBEM, HM.IDPESSOA ' + #13 +
           ' FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
           '      DESMEMBRAMENTO DM ' + #13 +
           ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
           '   AND HM.IDTIPOMOVIMENTACAO = 13 ' + #13 +
           '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '   AND HM.IDMOVIMENTACAO = DM.IDMOVIMENTACAO ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovDesmembramento.ListaSldContab : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT (0) AS MOECODIGO, ' + #13 +
           '        (0) AS IDTAXADEP, ' + #13 +
           '        (0.00) AS VALORG,      (0.00) AS SUMVALORG,     ' + #13 +
           '        (0.00) AS CMBEM,       (0.00) AS SUMCMBEM,      ' + #13 +
           '        (0.00) AS DEPLANC,     (0.00) AS SUMDEPLANC,    ' + #13 +
           '        (0.00) AS CMDEP,       (0.00) AS SUMCMDEP,      ' + #13 +
           '        (0.00) AS REAVVALORG,  (0.00) AS SUMREAVVALORG, ' + #13 +
           '        (0.00) AS REAVCMBEM,   (0.00) AS SUMREAVCMBEM,  ' + #13 +
           '        (0.00) AS REAVDEPLANC, (0.00) AS SUMREAVDEPLANC,' + #13 +
           '        (0.00) AS REAVCMDEP,   (0.00) AS SUMREAVCMDEP,  ' + #13 +
           '        (0.00) AS VALCONTAB,   (0.00) AS SUMVALCONTAB   ' + #13 +
           ' FROM GRUPO ' + #13 +
           ' WHERE IDGRUPO = -1 ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
//========================================================================================
// Executa o Desmembramento de um bem
//========================================================================================
function TCtrlMovDesmembramento.ExecutaDesmembramento(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                      dDataMov: TDateTime): Boolean;
var
   iExercicio, iPeriodo, iFlgPai,
   iIdGrupo, iIdLocalizacao, iIdResponsavel : Integer;
   bCtaxCCusto, bMaxProporcoes, bPrimMov    : Boolean;
   nPlaca,
   nValOrg, nCmBem, nDepLanc, nCmDep,
   nReavValOrg, nReavCmBem,
   nReavDepLanc, nReavCmDep,
   nUltReavValOrg, nUltReavCmBem,
   nUltReavDepLanc, nUltReavCmDep,
   nDepLancAtu, nUltReavDepLancAtu,
   nOfiValOrg, nOfiCmBem,
   nOfiDepLanc, nOfiCmDep,
   nValorLaudo,
   nBaixaB, nBaixaCM, nBaixaD, nBaixaCMD,
   nMaxProporcoes, nMaxPropBem,
   nSeqHist, nSeqHist07, nSeqHist15,
   nSeqHist17, nSeqHist21, nSeqHist32,
   nSeqHist22, nSeqHist33, nSeqHist19,
   nPropBaixa, nPlanilha,
   nMoeCodigo                               : Extended;
   dDataUltMov, dDataUltDep                 : TDateTime;
   sSql                                     : String;
   cSeparador                               : Char;
   nSomaProp                                : Double;
   bInTransacao                             : boolean; // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;  // Vando - SOL 154328-5901 / KTN 1373449

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaDesmembramento(nModulo, nEmpresaProp, nUsuario, nBem,
                                                           dDataMov, FcdsGerBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            StartTransaction;
         //-------------------------------------------------------------------------------
         // Verifica se os parametros para o novos bens foram fornecidos
         //-------------------------------------------------------------------------------
         if FcdsGerBens.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros para o novos bens não foram informados!'));
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
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
         //Emerson - SOL 95458 KINTANA 413614 - Início
         if (FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S') and (nModulo <> 54) then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //Emerson - SOL 95458 KINTANA 413614 - Fim
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Verifica se a data da movimentação é válida
         //-------------------------------------------------------------------------------
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '13',
                                       dDataMov, dDataUltMov, dDataUltDep) then
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
            if not CafxContab.VerificaPeriodoContabil(nEmpresaProp, dDataMov,
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
         // Verifica se a soma das proporções é igual a 100%
         //-------------------------------------------------------------------------------
         nSomaProp := 0;
         FcdsGerBens.First;
         
         while not FcdsGerBens.EOF do
         begin
            nSomaProp := nSomaProp + FcdsGerBens.FieldByName('PROPORCAO').AsFloat;
            FcdsGerBens.Next;
         end;
         //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Início
         //Incluído o Round para evitar erros em valores decimais muito pequenos.
         //if nSomaProp <> 100 then
         if Round(nSomaProp) <> 100 then
            raise Exception.Create(CMTranslate('A soma das proporções está diferente de 100% !'));
         //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Fim
         //-------------------------------------------------------------------------------
         // Verifica se existe Placa duplicada
         //-------------------------------------------------------------------------------
         FcdsGerBens.First;
         if FcdsGerBens.FieldByName('PLACA').AsFloat > 0 then begin   // VINICIUS FUSESC 10/04/08
           while not FcdsGerBens.EOF do begin
             nPlaca := FcdsGerBens.FieldByName('PLACA').AsFloat;

             FcdsGerBens.Next;
             while not FcdsGerBens.EOF do begin
               if FcdsGerBens.FieldByName('PLACA').AsFloat = nPlaca then
                 raise Exception.Create(CMTranslate('Uma das placas (')+FcdsGerBens.FieldByName('PLACA').AsString+')'+
                                        CMTranslate(' está duplicada na relação enviada para a geração dos novos bens!'));
               FcdsGerBens.Next;
             end;
             FcdsGerBens.Locate('PLACA',VarArrayOf([FcdsGerBens.FieldByName('PLACA').AsFloat]),[]);

             //----------------------------------------------------------------------------
             // Verifica se a Placa já cadastrada no banco
             //----------------------------------------------------------------------------
             if not Bem.PlacaUnica(nEmpresaProp, FcdsGerBens.FieldByName('PLACA').AsString) then
               raise Exception.Create(CMTranslate('Uma das placas (')+FcdsGerBens.FieldByName('PLACA').AsString+CMTranslate(') fornecidas para a ')+
                                      CMTranslate('geração dos novos bens já existe no cadastro!'));
             //----------------------------------------------------------------------------

             FcdsGerBens.Next; // VINICIUS FUSESC 10/04/08
           end;
         end;
         //===============================================================================
         // EXECUTA A GERACAO DOS NOVOS BENS
         //===============================================================================
         // Alimentando os DataSets Filhos com os dados do bem que será desmembrado
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
         // Calcula a Depreciacao até o Dia da Movimentacao - 1
         //-------------------------------------------------------------------------------
         if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), 0) then
            Raise Exception.Create(ProRata.MessageInfo);
         //===============================================================================
         // Calcula o Saldo Contábil do Bem antes do Desmembramento para o ajuste de
         // arredondamento
         //===============================================================================
         FcdsSldContab.Data := ListaSldContab;
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat then
               begin
                  if Bem.SaldoContabilBem(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                          FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                          dDataMov,
                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                          nValOrg, nCmBem, nDepLanc, nCmDep,
                                          nReavValOrg, nReavCmBem,
                                          nReavDepLanc, nReavCmDep,
                                          nUltReavValOrg, nUltReavCmBem,
                                          nUltReavDepLanc, nUltReavCmDep,
                                          nDepLancAtu, nUltReavDepLancAtu,
                                          iIdGrupo, iIdLocalizacao, iIdResponsavel) then
                  begin
                     FcdsSldContab.Append;
                     FcdsSldContab.FieldByName('MOECODIGO').AsInteger := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
                     FcdsSldContab.FieldByName('IDTAXADEP').AsInteger := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
                     FcdsSldContab.FieldByName('VALORG').AsFloat      := nValOrg;
                     FcdsSldContab.FieldByName('CMBEM').AsFloat       := nCmBem;
                     FcdsSldContab.FieldByName('DEPLANC').AsFloat     := nDepLanc;
                     FcdsSldContab.FieldByName('CMDEP').AsFloat       := nCmDep;
                     FcdsSldContab.FieldByName('REAVVALORG').AsFloat  := Bem.ConvNum(nReavValOrg  + nUltReavValOrg);
                     FcdsSldContab.FieldByName('REAVCMBEM').AsFloat   := Bem.ConvNum(nReavCmBem   + nUltReavCmBem);
                     FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat := Bem.ConvNum(nReavDepLanc + nUltReavDepLanc);
                     FcdsSldContab.FieldByName('REAVCMDEP').AsFloat   := Bem.ConvNum(nReavCmDep   + nUltReavCmDep);
                     FcdsSldContab.FieldByName('VALCONTAB').AsFloat   := Bem.ConvNum(nValOrg + nCmBem -
                                                                                     nDepLanc - nCmDep +
                                                                                     nReavValOrg + nUltReavValOrg +
                                                                                     nReavCmBem + nUltReavCmBem -
                                                                                     nReavDepLanc - nUltReavDepLanc -
                                                                                     nReavCmDep - nUltReavCmDep);
                     FcdsSldContab.Post;
                  end;
                  //----------------------------------------------------------------------
                  if (FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL) and
                     (FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = 1) then
                  begin
                     nOfiValOrg  := nValOrg;
                     nOfiCmBem   := nCmBem;
                     nOfiDepLanc := nDepLanc;
                     nOfiCmDep   := nCmDep;
                  end;
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //===============================================================================
         // Entrada dos novos bens
         //===============================================================================
         nMaxProporcoes := 0;
         FcdsGerBens.First;
         while not FcdsGerBens.EOF do
         begin
            //----------------------------------------------------------------------------
            // Seta variável que identifica a maior proporção
            //----------------------------------------------------------------------------
            if FcdsGerBens.FieldByName('PROPORCAO').AsFloat > nMaxProporcoes then
            begin
               nMaxProporcoes := FcdsGerBens.FieldByName('PROPORCAO').AsFloat;
               bMaxProporcoes := True;
            end else
            begin
               bMaxProporcoes := False;
            end;
            //----------------------------------------------------------------------------
            // Movimenta os dados do Bem Origem para o Bem Destino
            //----------------------------------------------------------------------------
            FcdsNBem.Data           := FcdsBem.Data;
            FcdsNBemxMoeda.Data     := FcdsBemxMoeda.Data;
            FcdsNBemxDep.Data       := FcdsBemxDep.Data;
            FcdsPlanoPatroxBem.Data := Bem.ListaPlanoPatroxBem(nEmpresaProp, nBem);
            //----------------------------------------------------------------------------
            // Atualiza os dados que irão para a Tabela Bem
            //----------------------------------------------------------------------------
            FcdsNBem.Edit;
            FcdsNBem.FieldByName('IDBEM').Clear;

            // VINICIUS FUSESC 10/04/08
            if FcdsGerBens.FieldByName('PLACA').AsFloat > 0 then
              FcdsNBem.FieldByName('PLACA').AsFloat        := FcdsGerBens.FieldByName('PLACA').AsFloat;

            FcdsNBem.FieldByName('IDGRUPO').AsFloat        := FcdsGerBens.FieldByName('IDGRUPO').AsFloat;
            FcdsNBem.FieldByName('IDCONJUNTO').AsFloat     := FcdsGerBens.FieldByName('IDCONJUNTO').AsFloat;
            FcdsNBem.FieldByName('DESBEM').AsString        := FcdsGerBens.FieldByName('DESBEM').AsString;
            FcdsNBem.FieldByName('DTAINCLUSAO').AsDateTime := dDataMov;
            FcdsNBem.FieldByName('VALHISTORICO').AsFloat   := FcdsNBem.FieldByName('VALHISTORICO').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100);
            FcdsNBem.Post;
            //----------------------------------------------------------------------------
            // Atualiza os dados que irão para a Tabela BemxMoeda
            //----------------------------------------------------------------------------
            FcdsNBemxMoeda.First;
            while not FcdsNBemxMoeda.EOF do
            begin
               nValOrg  := Bem.ConvNum(FcdsNBemxMoeda.FieldByName('VALORG').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
               nCmBem   := Bem.ConvNum(FcdsNBemxMoeda.FieldByName('CMBEM').AsCurrency  * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
               nValOrg  := strtofloat(FormatFloat('#0.00',((nValOrg  * 100) / 100)));
               nCmBem   := strtofloat(FormatFloat('#0.00',((nCmBem   * 100) / 100)));
               //-------------------------------------------------------------------------
               FcdsNBemxMoeda.Edit;
               FcdsNBemxMoeda.FieldByName('IDBEM').Clear;
               FcdsNBemxMoeda.FieldByName('VALORG').AsFloat := nValOrg;
               FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat  := nCmBem;
               FcdsNBemxMoeda.Post;
               //-------------------------------------------------------------------------
               // Acumula componentes para calcular diferenças residuais
               //-------------------------------------------------------------------------
               if FcdsSldContab.Locate('MOECODIGO;IDTAXADEP',VarArrayOf([FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger, 1]),[]) then
               begin
                  FcdsSldContab.Edit;
                  FcdsSldContab.FieldByName('SUMVALORG').AsFloat    := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALORG').AsFloat + nValOrg);
                  FcdsSldContab.FieldByName('SUMCMBEM').AsFloat     := Bem.ConvNum(FcdsSldContab.FieldByName('SUMCMBEM').AsFloat + nCmBem);
                  FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat + nValOrg + nCmBem);
                  FcdsSldContab.Post;
               end;
               //-------------------------------------------------------------------------
               FcdsNBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            // Atualiza os dados que irão para a Tabela BemxDep
            //----------------------------------------------------------------------------
            FcdsNBemxDep.First;
            while not FcdsNBemxDep.EOF do
            begin
               nDepLanc := Bem.ConvNum(FcdsNBemxDep.FieldByName('DEPLANC').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
               nCmDep   := Bem.ConvNum(FcdsNBemxDep.FieldByName('CMDEP').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
               nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
               nCmDep   := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
               //-------------------------------------------------------------------------
               FcdsNBemxDep.Edit;
               FcdsNBemxDep.FieldByName('IDBEM').Clear;
               FcdsNBemxDep.FieldByName('DEPLANC').AsFloat := nDepLanc;
               FcdsNBemxDep.FieldByName('CMDEP').AsFloat   := nCmDep;
               FcdsNBemxDep.Post;
               //-------------------------------------------------------------------------
               // Acumula componentes para calcular diferenças residuais
               //-------------------------------------------------------------------------
               if FcdsSldContab.Locate('MOECODIGO;IDTAXADEP',VarArrayOf([FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                                         FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[]) then
               begin
                  FcdsSldContab.Edit;
                  FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat    := Bem.ConvNum(FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat + nDepLanc);
                  FcdsSldContab.FieldByName('SUMCMDEP').AsFloat      := Bem.ConvNum(FcdsSldContab.FieldByName('SUMCMDEP').AsFloat + nCmDep);
                  FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat  := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat - nDepLanc - nCmDep);
                  FcdsSldContab.Post;
               end;
               //-------------------------------------------------------------------------
               FcdsNBemxDep.Next;
            end;
            //============================================================================
            // Gravação dos dados nas tabelas BEM, BEMXMOEDA, BEMXDEP, PLANOPATROXBEM
            //============================================================================
            CdsToDbObject(FcdsNBem,_dbBem);
            if not _dbBem.InsertAs(0) then
               Raise Exception.Create(_dbBem.MessageInfo);
            //----------------------------------------------------------------------------
            if bMaxProporcoes then
               nMaxPropBem := _dbBem.IDBEM.AsFloat;
            //----------------------------------------------------------------------------
            FcdsNBemxMoeda.First;
            while not FcdsNBemxMoeda.EOF do
            begin
               CdsToDbObject(FcdsNBemxMoeda,_dbBemxMoeda);
               _dbBemxMoeda.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
               if not _dbBemxMoeda.Insert then
                  Raise Exception.Create(_dbBemxMoeda.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsNBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsNBemxDep.First;
            while not FcdsNBemxDep.EOF do
            begin
               CdsToDbObject(FcdsNBemxDep,_dbBemxDep);
               _dbBemxDep.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
               if not _dbBemxDep.Insert then
                  Raise Exception.Create(_dbBemxDep.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsNBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsPlanoPatroxBem.First;
            while not FcdsPlanoPatroxBem.EOF do
            begin
               CdsToDbObject(FcdsPlanoPatroxBem,_dbPlanoPatroxBem);
               _dbPlanoPatroxBem.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
               if not _dbPlanoPatroxBem.Insert then
                  Raise Exception.Create(_dbPlanoPatroxBem.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsPlanoPatroxBem.Next;
            end;
            //----------------------------------------------------------------------------
            // Registra em GerBens o Id do Bem Gerado
            //----------------------------------------------------------------------------
            FcdsGerBens.Edit;
            FcdsGerBens.FieldByName('IDBEM').AsFloat := _dbBem.IDBEM.AsFloat;
            FcdsGerBens.Post;
            //----------------------------------------------------------------------------
            // Registra o Historico da Entrada do Bem por Desmembramento
            //----------------------------------------------------------------------------
            nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                           // IDBEM
                                                      _dbBem.IDPESSOA.AsFloat,                        // IDPESSOA
                                                      _dbBem.IDMODULO.AsFloat,                        // IDMODULO
                                                      07,                                             // IDTIPOMOVIMENTACAO
                                                      FcdsNBem.FieldByName('DTAINCLUSAO').AsDateTime, // DATAMOVIMENTACAO
                                                      -1,                                             // IDREAVALACRESC
                                                      -1,                                             // DATAULTDEP
                                                      -1,                                             // IDGRUPANT
                                                      -1,                                             // IDCONJANT
                                                      -1,                                             // IDLOCALANT
                                                      -1,                                             // IDRESPANT
                                                      -1,                                             // PLACAANT
                                                      -1,                                             // PLNCODIGO
                                                      '',                                             // OBSREAVAL
                                                       0,                                             // TIPDEPPRORATA
                                                      -1,                                             // IDTIPODESPESA
                                                      '',                                             // OBSACRESCIMO
                                                      -1,                                             // IDMOTIVOBAIXA
                                                       0,                                             // PROPBAIXA
                                                       0,                                     // VALVENDAOFI
                                                      '');                                            // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra na tabela VLRHISTMOVBEM
            //----------------------------------------------------------------------------
            FcdsNBemxMoeda.First;
            while not FcdsNBemxMoeda.EOF do
            begin
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       FcdsNBemxMoeda.FieldByName('VALORG').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);                 
               //-------------------------------------------------------------------------
               FcdsNBemxMoeda.Next;
            end;
            if bMaxProporcoes then
               nSeqHist07 := nSeqHist;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetaria
            //----------------------------------------------------------------------------
            if nOfiCmBem > 0 then
            begin
               nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                         _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                         _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                         15,                                             // IDTIPOMOVIMENTACAO
                                                         FcdsNBem.FieldByName('DTAINCLUSAO').AsDatetime, // DATAMOVIMENTACAO
                                                         -1,                                             // IDREAVALACRESC
                                                         -1,                                             // DATAULTDEP
                                                         -1,                                             // IDGRUPANT
                                                         -1,                                             // IDCONJANT
                                                         -1,                                             // IDLOCALANT
                                                         -1,                                             // IDRESPANT
                                                         -1,                                             // PLACAANT
                                                         -1,                                             // PLNCODIGO
                                                         '',                                             // OBSREAVAL
                                                          9,                                             // TIPDEPPRORATA
                                                         -1,                                             // IDTIPODESPESA
                                                         '',                                             // OBSACRESCIMO
                                                         -1,                                             // IDMOTIVOBAIXA
                                                          0,                                             // PROPBAIXA
                                                          0,                                     // VALVENDAOFI
                                                         '');                                            // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               FcdsNBemxMoeda.First;
               while not FcdsNBemxMoeda.EOF do
               begin
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsNBemxMoeda.Next;
               end;
               if bMaxProporcoes then
                  nSeqHist15 := nSeqHist;
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Depreciação
            //----------------------------------------------------------------------------
            if nOfiDepLanc > 0 then
            begin
               nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                         _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                         _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                         17,                                             // IDTIPOMOVIMENTACAO
                                                         FcdsNBem.FieldByName('DTAINCLUSAO').AsDatetime, // DATAMOVIMENTACAO
                                                         -1,                                             // IDREAVALACRESC
                                                         -1,                                             // DATAULTDEP
                                                         -1,                                             // IDGRUPANT
                                                         -1,                                             // IDCONJANT
                                                         -1,                                             // IDLOCALANT
                                                         -1,                                             // IDRESPANT
                                                         -1,                                             // PLACAANT
                                                         -1,                                             // PLNCODIGO
                                                         '',                                             // OBSREAVAL
                                                          0,                                             // TIPDEPPRORATA
                                                         -1,                                             // IDTIPODESPESA
                                                         '',                                             // OBSACRESCIMO
                                                         -1,                                             // IDMOTIVOBAIXA
                                                          0,                                             // PROPBAIXA
                                                          0,                                             // VALVENDAOFI
                                                         '');                                            // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               FcdsNBemxDep.First;
               while not FcdsNBemxDep.EOF do
               begin
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          FcdsNBemxDep.FieldByName('DEPLANC').AsFloat) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsNBemxDep.Next;
               end;
               //-------------------------------------------------------------------------
               if bMaxProporcoes then
                  nSeqHist17 := nSeqHist;
            end;
            //----------------------------------------------------------------------------
            // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
            //----------------------------------------------------------------------------
            if nOfiCmDep > 0 then
            begin
               nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                         _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                         _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                         21,                                             // IDTIPOMOVIMENTACAO
                                                         FcdsNBem.FieldByName('DTAINCLUSAO').AsDatetime, // DATAMOVIMENTACAO
                                                         -1,                                             // IDREAVALACRESC
                                                         -1,                                             // DATAULTDEP
                                                         -1,                                             // IDGRUPANT
                                                         -1,                                             // IDCONJANT
                                                         -1,                                             // IDLOCALANT
                                                         -1,                                             // IDRESPANT
                                                         -1,                                             // PLACAANT
                                                         -1,                                             // PLNCODIGO
                                                         '',                                             // OBSREAVAL
                                                          9,                                             // TIPDEPPRORATA
                                                         -1,                                             // IDTIPODESPESA
                                                         '',                                             // OBSACRESCIMO
                                                         -1,                                             // IDMOTIVOBAIXA
                                                          0,                                             // PROPBAIXA
                                                          0,                                     // VALVENDAOFI
                                                         '');                                            // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               FcdsNBemxDep.First;
               while not FcdsNBemxDep.EOF do
               begin
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          FcdsNBemxDep.FieldByName('CMDEP').AsFloat) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsNBemxDep.Next;
               end;
               if bMaxProporcoes then
                  nSeqHist21 := nSeqHist;
            end;
            //============================================================================
            // Processa as Reavaliações
            //============================================================================
            // Movimenta os dados das Reavaliações do Bem Origem para o Bem Destino
            //----------------------------------------------------------------------------
            FcdsNReavaliacao.Data  := FcdsReavaliacao.Data;
            FcdsNReavalxMoeda.Data := FcdsReavalxMoeda.Data;
            FcdsNReavalxDep.Data   := FcdsReavalxDep.Data;
            //----------------------------------------------------------------------------
            FcdsNReavaliacao.First;
            while not FcdsNReavaliacao.EOF do
            begin
               //-------------------------------------------------------------------------
               // Atualiza os dados que irão para a Tabela Bem
               //-------------------------------------------------------------------------
               FcdsNReavaliacao.Edit;
               FcdsNReavaliacao.FieldByName('IDBEM').AsFloat := _dbBem.IDBEM.AsFloat;
               FcdsNReavaliacao.Post;
               //-------------------------------------------------------------------------
               // Atualiza os dados que irão para a Tabela BemxMoeda
               //-------------------------------------------------------------------------
               FcdsNReavalxMoeda.First;
               while not FcdsNReavalxMoeda.EOF do
               begin
                  if FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     nValOrg  := Bem.ConvNum(FcdsNReavalxMoeda.FieldByName('VALORG').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nCmBem   := Bem.ConvNum(FcdsNReavalxMoeda.FieldByName('CMBEM').AsCurrency  * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nValOrg  := strtofloat(FormatFloat('#0.00',((nValOrg  * 100) / 100)));
                     nCmBem   := strtofloat(FormatFloat('#0.00',((nCmBem   * 100) / 100)));
                     //-------------------------------------------------------------------
                     FcdsNReavalxMoeda.Edit;
                     FcdsNReavalxMoeda.FieldByName('IDBEM').AsFloat  := _dbBem.IDBEM.AsFloat;
                     FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat := nValOrg;
                     FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat  := nCmBem;
                     FcdsNReavalxMoeda.Post;
                     //-------------------------------------------------------------------
                     // Acumula componentes para calcular diferenças residuais
                     //-------------------------------------------------------------------
                     if FcdsSldContab.Locate('MOECODIGO;IDTAXADEP',VarArrayOf([FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsInteger, 1]),[]) then
                     begin
                        FcdsSldContab.Edit;
                        FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat + nValOrg);
                        FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat  := Bem.ConvNum(FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat  + nCmBem);
                        FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat + nValOrg + nCmBem);
                        FcdsSldContab.Post;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsNReavalxMoeda.Next;
               end;
               //-------------------------------------------------------------------------
               // Atualiza os dados que irão para a Tabela BemxDep
               //-------------------------------------------------------------------------
               FcdsNReavalxDep.First;
               while not FcdsNReavalxDep.EOF do
               begin
                  if FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     nDepLanc := Bem.ConvNum(FcdsNReavalxDep.FieldByName('DEPLANC').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nCmDep   := Bem.ConvNum(FcdsNReavalxDep.FieldByName('CMDEP').AsCurrency  * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     nCmDep   := strtofloat(FormatFloat('#0.00',((nCmDep   * 100) / 100)));
                     //-------------------------------------------------------------------
                     FcdsNReavalxDep.Edit;
                     FcdsNReavalxDep.FieldByName('IDBEM').AsFloat   := _dbBem.IDBEM.AsFloat;
                     FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat := nDepLanc;
                     FcdsNReavalxDep.FieldByName('CMDEP').AsFloat   := nCmDep;
                     FcdsNReavalxDep.Post;
                     //-------------------------------------------------------------------
                     // Acumula componentes para calcular diferenças residuais
                     //-------------------------------------------------------------------
                     if FcdsSldContab.Locate('MOECODIGO;IDTAXADEP',VarArrayOf([FcdsNReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                               FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsInteger]),[]) then
                     begin
                        FcdsSldContab.Edit;
                        FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat + nDepLanc);
                        FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat   := Bem.ConvNum(FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat + nCmDep);
                        FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat   := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat - nDepLanc - nCmDep);
                        FcdsSldContab.Post;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsNReavalxDep.Next;
               end;
               //=========================================================================
               // Gravação dos dados nas tabelas REAVALIACAO, REAVALXMOEDA, REAVALXDEP
               //=========================================================================
               CdsToDbObject(FcdsNReavaliacao,_dbReavaliacao);
               if not _dbReavaliacao.Insert then
                  Raise Exception.Create(_dbReavaliacao.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsNReavalxMoeda.First;
               while not FcdsNReavalxMoeda.EOF do
               begin
                  if FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     CdsToDbObject(FcdsNReavalxMoeda,_dbReavalxMoeda);
                     _dbReavalxMoeda.IDREAVALIACAO.AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
                     if not _dbReavalxMoeda.Insert then
                        Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsNReavalxMoeda.Next;
               end;
               //-------------------------------------------------------------------------
               FcdsNReavalxDep.First;
               while not FcdsNReavalxDep.EOF do
               begin
                  if FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     CdsToDbObject(FcdsNReavalxDep,_dbReavalxDep);
                     _dbReavalxDep.IDREAVALIACAO.AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
                     if not _dbReavalxDep.Insert then
                        Raise Exception.Create(_dbReavalxDep.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsNReavalxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Obtem a observação da reavaliação
               //-------------------------------------------------------------------------
               sSql := ' SELECT OBSREAVAL' +
                       ' FROM HISTORICOMOVIMENTACAO' +
                       ' WHERE IDMOVIMENTACAO = ' + FcdsReavaliacao.FieldByName('IDMOVIMENTACAO').AsString;
               _cds.Data := GetDataPacket( sSql );
               //-------------------------------------------------------------------------
               // Registra o Historico do Custo
               //-------------------------------------------------------------------------
               nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,     // IDBEM
                                                         _dbBem.IDPESSOA.AsFloat,  // IDPESSOA
                                                         _dbBem.IDMODULO.AsFloat,  // IDMODULO
                                                         32,                                        // IDTIPOMOVIMENTACAO
                                                         dDataMov,                                  // DATAMOVIMENTACAO
                                                         _dbReavaliacao.IDREAVALIACAO.AsFloat,      // IDREAVALACRESC
                                                         -1,                                        // DATAULTDEP
                                                         -1,                                        // IDGRUPANT
                                                         -1,                                        // IDCONJANT
                                                         -1,                                        // IDLOCALANT
                                                         -1,                                        // IDRESPANT
                                                         -1,                                        // PLACAANT
                                                         -1,                                        // PLNCODIGO
                                                         _cds.FieldByName('OBSREAVAL').AsString,    // OBSREAVAL
                                                          0,                                        // TIPDEPPRORATA
                                                         -1,                                        // IDTIPODESPESA
                                                         '',                                        // OBSACRESCIMO
                                                         -1,                                        // IDMOTIVOBAIXA
                                                          0,                                        // PROPBAIXA
                                                          0,                                     // VALVENDAOFI
                                                         '');                                       // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra o Id da Movimentacao em REAVALIACAO
               //-------------------------------------------------------------------------
               sSql := ' UPDATE REAVALIACAO ' +
                       ' SET IDMOVIMENTACAO = ' + FloattoStr(nSeqHist) +
                       ' WHERE IDREAVALIACAO = ' + FloattoStr(_dbReavaliacao.IDREAVALIACAO.AsFloat);
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               // Obtem o historico da reavaliacao do bem origem por moeda x taxadep
               //-------------------------------------------------------------------------
               _dMTBem.sqlHMBReaval.Prepare;
               _dMTBem.sqlHMBReaval.ParamByName('IDMOVIMENTACAO').AsFloat := FcdsReavaliacao.FieldByName('IDMOVIMENTACAO').AsFloat;
               FcdsAux.Data := _dMTBem.sqlHMBReaval.Data;
               //-------------------------------------------------------------------------
               while not FcdsAux.EOF do
               begin
                  nValorLaudo := Bem.ConvNum(FcdsAux.FieldByName('VALORLAUDO').AsCurrency  * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                  nValorLaudo := strtofloat(FormatFloat('#0.00',((nValorLaudo * 100) / 100)));
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsAux.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsAux.FieldByName('IDTAXADEP').AsFloat,
                                                      nValorLaudo,
                                                      FcdsAux.FieldByName('TAXADEPANT').AsFloat) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsAux.Next;
               end;
               FcdsAux.Close;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               FcdsNReavalxMoeda.First;
               while not FcdsNReavalxMoeda.EOF do
               begin
                  if FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsNReavalxMoeda.Next;
               end;
               if bMaxProporcoes then
                  nSeqHist32 := nSeqHist;
               //-------------------------------------------------------------------------
               // Registra o Historico da Correção Monetaria
               //-------------------------------------------------------------------------
               nSeqHist := -1;
               FcdsNReavalxMoeda.First;
               while not FcdsNReavalxMoeda.EOF do
               begin
                  if FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     if FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                     begin
                        if FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat <> 0 then
                        begin
                           nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,    // IDBEM
                                                                     _dbBem.IDPESSOA.AsFloat, // IDPESSOA
                                                                     _dbBem.IDMODULO.AsFloat, // IDMODULO
                                                                     22,                                       // IDTIPOMOVIMENTACAO
                                                                     dDataMov,                                 // DATAMOVIMENTACAO
                                                                     _dbReavaliacao.IDREAVALIACAO.AsFloat,     // IDREAVALACRESC
                                                                     -1,                                       // DATAULTDEP
                                                                     -1,                                       // IDGRUPANT
                                                                     -1,                                       // IDCONJANT
                                                                     -1,                                       // IDLOCALANT
                                                                     -1,                                       // IDRESPANT
                                                                     -1,                                       // PLACAANT
                                                                     -1,                                       // PLNCODIGO
                                                                     '',                                       // OBSREAVAL
                                                                      9,                                       // TIPDEPPRORATA
                                                                     -1,                                       // IDTIPODESPESA
                                                                     '',                                       // OBSACRESCIMO
                                                                     -1,                                       // IDMOTIVOBAIXA
                                                                      0,                                       // PROPBAIXA
                                                                      0,                                     // VALVENDAOFI
                                                                     '');                                      // OBSBAIXA
                           if nSeqHist = -1 then
                              Raise Exception.Create(HistMovBem.MessageInfo);
                        end;
                     end;
                  end;
                  FcdsNReavalxMoeda.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if nSeqHist <> -1 then
               begin
                  FcdsNReavalxMoeda.First;
                  while not FcdsNReavalxMoeda.EOF do
                  begin
                     if FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                     begin
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                                0,
                                                                FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                     end;
                     FcdsNReavalxMoeda.Next;
                  end;
                  if bMaxProporcoes then
                     nSeqHist22 := nSeqHist;
               end;
               //-------------------------------------------------------------------------
               // Registra o Historico da Depreciação
               //-------------------------------------------------------------------------
               nSeqHist := -1;
               FcdsNReavalxDep.First;
               while not FcdsNReavalxDep.EOF do
               begin
                  if FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     if FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                     begin
                        if FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat = 1 then
                        begin
                           if FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat <> 0 then
                           begin
                              nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,    // IDBEM
                                                                        _dbBem.IDPESSOA.AsFloat, // IDPESSOA
                                                                        _dbBem.IDMODULO.AsFloat, // IDMODULO
                                                                        33,                                       // IDTIPOMOVIMENTACAO
                                                                        dDataMov,                                 // DATAMOVIMENTACAO
                                                                        _dbReavaliacao.IDREAVALIACAO.AsFloat,     // IDREAVALACRESC
                                                                        -1,                                       // DATAULTDEP
                                                                        -1,                                       // IDGRUPANT
                                                                        -1,                                       // IDCONJANT
                                                                        -1,                                       // IDLOCALANT
                                                                        -1,                                       // IDRESPANT
                                                                        -1,                                       // PLACAANT
                                                                        -1,                                       // PLNCODIGO
                                                                        '',                                       // OBSREAVAL
                                                                         0,                                       // TIPDEPPRORATA
                                                                        -1,                                       // IDTIPODESPESA
                                                                        '',                                       // OBSACRESCIMO
                                                                        -1,                                       // IDMOTIVOBAIXA
                                                                         0,                                       // PROPBAIXA
                                                                         0,                                     // VALVENDAOFI
                                                                        '');                                      // OBSBAIXA
                              if nSeqHist = -1 then
                                 Raise Exception.Create(HistMovBem.MessageInfo);
                           end;

                        end;
                     end;
                  end;
                  FcdsNReavalxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if nSeqHist <> -1 then
               begin
                  FcdsNReavalxDep.First;
                  while not FcdsNReavalxDep.EOF do
                  begin
                     if FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                     begin
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsNReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                                FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                     end;
                     FcdsNReavalxDep.Next;
                  end;
                  if bMaxProporcoes then
                     nSeqHist33 := nSeqHist;
               end;
               //-------------------------------------------------------------------------
               // Registra o Historico da Correção Monetária da Depreciação
               //-------------------------------------------------------------------------
               nSeqHist := -1;
               FcdsNReavalxDep.First;
               while not FcdsNReavalxDep.EOF do
               begin
                  if FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                  begin
                     if FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                     begin
                        if FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat = 1 then
                        begin
                           if FcdsNReavalxDep.FieldByName('CMDEP').AsFloat <> 0 then
                           begin
                              nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                     // IDBEM
                                                                        _dbBem.IDPESSOA.AsFloat, // IDPESSOA
                                                                        _dbBem.IDMODULO.AsFloat, // IDMODULO
                                                                        19,                                       // IDTIPOMOVIMENTACAO
                                                                        dDataMov,                                 // DATAMOVIMENTACAO
                                                                        _dbReavaliacao.IDREAVALIACAO.AsFloat,     // IDREAVALACRESC
                                                                        -1,                                       // DATAULTDEP
                                                                        -1,                                       // IDGRUPANT
                                                                        -1,                                       // IDCONJANT
                                                                        -1,                                       // IDLOCALANT
                                                                        -1,                                       // IDRESPANT
                                                                        -1,                                       // PLACAANT
                                                                        -1,                                       // PLNCODIGO
                                                                        '',                                       // OBSREAVAL
                                                                         9,                                       // TIPDEPPRORATA
                                                                        -1,                                       // IDTIPODESPESA
                                                                        '',                                       // OBSACRESCIMO
                                                                        -1,                                       // IDMOTIVOBAIXA
                                                                         0,                                       // PROPBAIXA
                                                                         0,                                     // VALVENDAOFI
                                                                        '');                                      // OBSBAIXA
                              if nSeqHist = -1 then
                                 Raise Exception.Create(HistMovBem.MessageInfo);
                           end;
                        end;
                     end;
                  end;
                  FcdsNReavalxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if nSeqHist <> -1 then
               begin
                  FcdsNReavalxDep.First;
                  while not FcdsNReavalxDep.EOF do
                  begin
                     if FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat then
                     begin
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsNReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                                FcdsNReavalxDep.FieldByName('CMDEP').AsFloat) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                     end;
                     FcdsNReavalxDep.Next;
                  end;
                  if bMaxProporcoes then
                     nSeqHist19 := nSeqHist;
               end;
               //-------------------------------------------------------------------------
               FcdsNReavaliacao.Next;
            end;
            //============================================================================
            // Processa os Acréscimos de Valor do Bem Desmembrado
            //============================================================================
            FcdsNAcrescimoValor.Data    := FcdsAcrescimoValor.Data;
            FcdsNAcrescValorxMoeda.Data := FcdsAcrescValorxMoeda.Data;
            FcdsNAcrescValorxDep.Data   := FcdsAcrescValorxDep.Data;
            //----------------------------------------------------------------------------
            FcdsNAcrescimoValor.First;
            while not FcdsNAcrescimoValor.EOF do
            begin
               //-------------------------------------------------------------------------
               // Atualiza os dados que irão para a Tabela Bem
               // SOL136732 ktn 821049
               //Só atualiza a tabela bem caso o lançamento seja maior que 0 
               //-------------------------------------------------------------------------
               if FcdsNAcrescValorxMoeda.FieldByName('VALORG').AsFloat >= 0.01 then
               begin
                 FcdsNAcrescimoValor.Edit;
                 FcdsNAcrescimoValor.FieldByName('IDBEM').AsFloat := _dbBem.IDBEM.AsFloat;
                 FcdsNAcrescimoValor.Post;
               end;

               //-------------------------------------------------------------------------
               // Atualiza os dados que irão para a Tabela BemxMoeda
               //-------------------------------------------------------------------------
               FcdsNAcrescValorxMoeda.First;
               while not FcdsNAcrescValorxMoeda.EOF do
               begin
                  if FcdsNAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     nValOrg  := Bem.ConvNum(FcdsNAcrescValorxMoeda.FieldByName('VALORG').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nCmBem   := Bem.ConvNum(FcdsNAcrescValorxMoeda.FieldByName('CMBEM').AsCurrency  * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nValOrg  := strtofloat(FormatFloat('#0.00',((nValOrg * 100) / 100)));
                     nCmBem   := strtofloat(FormatFloat('#0.00',((nCmBem  * 100) / 100)));
                     //Cássio - SOL Nº 128010 KINTANA Nº 684003
                     //Registra apenas valores maiores que 0,00
                     if nValOrg >= 0.01 then
                     begin
                       //-------------------------------------------------------------------
                       FcdsNAcrescValorxMoeda.Edit;
                       FcdsNAcrescValorxMoeda.FieldByName('IDBEM').AsFloat  := _dbBem.IDBEM.AsFloat;
                       FcdsNAcrescValorxMoeda.FieldByName('VALORG').AsFloat := nValOrg;
                       FcdsNAcrescValorxMoeda.FieldByName('CMBEM').AsFloat  := nCmBem;
                       FcdsNAcrescValorxMoeda.Post;
                       //-------------------------------------------------------------------
                       // Acumula componentes para calcular diferenças residuais
                       //-------------------------------------------------------------------
                       if FcdsSldContab.Locate('MOECODIGO;IDTAXADEP',VarArrayOf([FcdsNAcrescValorxDep.FieldByName('MOECODIGO').AsInteger, 1]),[]) then
                       begin
                          FcdsSldContab.Edit;
                          FcdsSldContab.FieldByName('SUMVALORG').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALORG').AsFloat + nValOrg);
                          FcdsSldContab.FieldByName('SUMCMBEM').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMCMBEM').AsFloat + nCmBem);
                          FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat + nValOrg + nCmBem);
                          FcdsSldContab.Post;
                       end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsNAcrescValorxMoeda.Next;
               end;
               //-------------------------------------------------------------------------
               // Atualiza os dados que irão para a Tabela BemxDep
               //-------------------------------------------------------------------------
               FcdsNAcrescValorxDep.First;
               while not FcdsNAcrescValorxDep.EOF do
               begin
                  if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     nDepLanc := Bem.ConvNum(FcdsNAcrescValorxDep.FieldByName('DEPLANC').AsCurrency * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nCmDep   := Bem.ConvNum(FcdsNAcrescValorxDep.FieldByName('CMDEP').AsCurrency  * (FcdsGerBens.FieldByName('PROPORCAO').AsFloat / 100));
                     nDepLanc := strtofloat(FormatFloat('#0.00',((nDepLanc * 100) / 100)));
                     nCmDep   := strtofloat(FormatFloat('#0.00',((nCmDep   * 100) / 100)));
                     //-------------------------------------------------------------------
                     //Cássio - SOL Nº 128010 KINTANA Nº 684003
                     //Registra apenas valores maiores que 0,00
                     if nValOrg >= 0.01 then
                     begin
                      FcdsNAcrescValorxDep.Edit;
                      FcdsNAcrescValorxDep.FieldByName('IDBEM').AsFloat   := _dbBem.IDBEM.AsFloat;
                      FcdsNAcrescValorxDep.FieldByName('DEPLANC').AsFloat := nDepLanc;
                      FcdsNAcrescValorxDep.FieldByName('CMDEP').AsFloat   := nCmDep;
                      FcdsNAcrescValorxDep.Post;
                      //-------------------------------------------------------------------
                      // Acumula componentes para calcular diferenças residuais
                      //-------------------------------------------------------------------
                      if FcdsSldContab.Locate('MOECODIGO;IDTAXADEP',VarArrayOf([FcdsNAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                                FcdsNAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger]),[]) then
                      begin
                        FcdsSldContab.Edit;
                        FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat + nDepLanc);
                        FcdsSldContab.FieldByName('SUMCMDEP').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMCMDEP').AsFloat + nCmDep);
                        FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat := Bem.ConvNum(FcdsSldContab.FieldByName('SUMVALCONTAB').AsFloat + nDepLanc + nCmDep);
                        FcdsSldContab.Post;
                      end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsNAcrescValorxDep.Next;
               end;
               //=========================================================================
               // Gravação dos dados nas tabelas
               //=========================================================================
               CdsToDbObject(FcdsNAcrescimoValor,_dbAcrescimoValor);
               if not _dbAcrescimoValor.Insert then
                  Raise Exception.Create(_dbAcrescimoValor.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsNAcrescValorxMoeda.First;
               while not FcdsNAcrescValorxMoeda.EOF do
               begin
                  if FcdsNAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     CdsToDbObject(FcdsNAcrescValorxMoeda,_dbAcrescValorxMoeda);
                     _dbAcrescValorxMoeda.IDACRESCIMO.AsFloat := _dbAcrescimoValor.IDACRESCIMO.AsFloat;
                     if not _dbAcrescValorxMoeda.Insert then
                        Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsNAcrescValorxMoeda.Next;
               end;
               //-------------------------------------------------------------------------
               FcdsNAcrescValorxDep.First;
               while not FcdsNAcrescValorxDep.EOF do
               begin
                  if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     CdsToDbObject(FcdsNAcrescValorxDep,_dbAcrescValorxDep);
                     _dbAcrescValorxDep.IDACRESCIMO.AsFloat := _dbAcrescimoValor.IDACRESCIMO.AsFloat;
                     if not _dbAcrescValorxDep.Insert then
                        Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsNAcrescValorxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Obtem os dados historicos do acrescimo
               //-------------------------------------------------------------------------
               sSql := ' SELECT IDTIPODESPESA, OBSACRESCIMO' +
                       ' FROM HISTORICOMOVIMENTACAO' +
                       ' WHERE IDMOVIMENTACAO = ' + FcdsAcrescimoValor.FieldByName('IDMOVIMENTACAO').AsString;
               _cds.Data := GetDataPacket( sSql );
               //-------------------------------------------------------------------------
               // Registra o Historico do Custo
               //-------------------------------------------------------------------------
               //Cássio - SOL Nº 128010 KINTANA Nº 684003
               //Registra apenas valores maiores que 0,00
               if FcdsNAcrescValorxMoeda.FieldByName('VALORG').AsFloat >= 0.01 then
               begin
                nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                      // IDBEM
                                                          _dbBem.IDPESSOA.AsFloat,                   // IDPESSOA
                                                          _dbBem.IDMODULO.AsFloat,                   // IDMODULO
                                                          09,                                        // IDTIPOMOVIMENTACAO
                                                          dDataMov,                                  // DATAMOVIMENTACAO
                                                          _dbAcrescimoValor.IDACRESCIMO.AsFloat,     // IDREAVALACRESC
                                                          -1,                                        // DATAULTDEP
                                                          -1,                                        // IDGRUPANT
                                                          -1,                                        // IDCONJANT
                                                          -1,                                        // IDLOCALANT
                                                          -1,                                        // IDRESPANT
                                                          -1,                                        // PLACAANT
                                                          -1,                                        // PLNCODIGO
                                                          '',                                        // OBSREAVAL
                                                           0,                                        // TIPDEPPRORATA
                                                          _cds.FieldByname('IDTIPODESPESA').AsFloat, // IDTIPODESPESA
                                                          _cds.FieldByname('OBSACRESCIMO').AsString, // OBSACRESCIMO
                                                          -1,                                        // IDMOTIVOBAIXA
                                                           0,                                        // PROPBAIXA
                                                           0,                                     // VALVENDAOFI
                                                          '');                                       // OBSBAIXA
                if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
                //-------------------------------------------------------------------------
                // Registra na tabela VLRHISTMOVBEM
                //-------------------------------------------------------------------------
                FcdsNAcrescValorxMoeda.First;
                while not FcdsNAcrescValorxMoeda.EOF do
                begin
                  if FcdsNAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsNAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             FcdsNAcrescValorxMoeda.FieldByName('VALORG').AsFloat) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsNAcrescValorxMoeda.Next;
                end;
               end;
               //-------------------------------------------------------------------------
               // Registra o Historico da Correção Monetaria
               //-------------------------------------------------------------------------
               nSeqHist := -1;
               FcdsNAcrescValorxMoeda.First;
               while not FcdsNAcrescValorxMoeda.EOF do
               begin
                  if FcdsNAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     if FcdsNAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                     begin
                        if FcdsNAcrescValorxMoeda.FieldByName('CMBEM').AsFloat <> 0 then
                        begin
                           nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,    // IDBEM
                                                                     _dbBem.IDPESSOA.AsFloat, // IDPESSOA
                                                                     _dbBem.IDMODULO.AsFloat, // IDMODULO
                                                                     34,                                       // IDTIPOMOVIMENTACAO
                                                                     dDataMov,                                 // DATAMOVIMENTACAO
                                                                     _dbAcrescimoValor.IDACRESCIMO.AsFloat,     // IDREAVALACRESC
                                                                     -1,                                       // DATAULTDEP
                                                                     -1,                                       // IDGRUPANT
                                                                     -1,                                       // IDCONJANT
                                                                     -1,                                       // IDLOCALANT
                                                                     -1,                                       // IDRESPANT
                                                                     -1,                                       // PLACAANT
                                                                     -1,                                       // PLNCODIGO
                                                                     '',                                       // OBSREAVAL
                                                                      9,                                       // TIPDEPPRORATA
                                                                     -1,                                       // IDTIPODESPESA
                                                                     '',                                       // OBSACRESCIMO
                                                                     -1,                                       // IDMOTIVOBAIXA
                                                                      0,                                       // PROPBAIXA
                                                                      0,                                     // VALVENDAOFI
                                                                     '');                                      // OBSBAIXA
                           if nSeqHist = -1 then
                              Raise Exception.Create(HistMovBem.MessageInfo);
                        end;
                     end;
                  end;
                  FcdsNAcrescValorxMoeda.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if nSeqHist <> -1 then
               begin
                  FcdsNAcrescValorxMoeda.First;
                  while not FcdsNAcrescValorxMoeda.EOF do
                  begin
                     if FcdsNAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                     begin
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsNAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                                0,
                                                                FcdsNAcrescValorxMoeda.FieldByName('CMBEM').AsFloat) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                     end;
                     FcdsNAcrescValorxMoeda.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Registra o Historico da Depreciação
               //-------------------------------------------------------------------------
               nSeqHist := -1;
               FcdsNAcrescValorxDep.First;
               while not FcdsNAcrescValorxDep.EOF do
               begin
                  if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     if FcdsNAcrescValorxDep.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                     begin
                        if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat = 1 then
                        begin
                           if FcdsNAcrescValorxDep.FieldByName('DEPLANC').AsFloat <> 0 then
                           begin
                              nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                     // IDBEM
                                                                        _dbBem.IDPESSOA.AsFloat,                  // IDPESSOA
                                                                        _dbBem.IDMODULO.AsFloat,                  // IDMODULO
                                                                        35,                                       // IDTIPOMOVIMENTACAO
                                                                        dDataMov,                                 // DATAMOVIMENTACAO
                                                                        _dbAcrescimoValor.IDACRESCIMO.AsFloat,    // IDREAVALACRESC
                                                                        -1,                                       // DATAULTDEP
                                                                        -1,                                       // IDGRUPANT
                                                                        -1,                                       // IDCONJANT
                                                                        -1,                                       // IDLOCALANT
                                                                        -1,                                       // IDRESPANT
                                                                        -1,                                       // PLACAANT
                                                                        -1,                                       // PLNCODIGO
                                                                        '',                                       // OBSREAVAL
                                                                         0,                                       // TIPDEPPRORATA
                                                                        -1,                                       // IDTIPODESPESA
                                                                        '',                                       // OBSACRESCIMO
                                                                        -1,                                       // IDMOTIVOBAIXA
                                                                         0,                                       // PROPBAIXA
                                                                         0,                                     // VALVENDAOFI
                                                                        '');                                      // OBSBAIXA
                              if nSeqHist = -1 then
                                 Raise Exception.Create(HistMovBem.MessageInfo);
                           end;
                        end;
                     end;
                  end;
                  FcdsNAcrescValorxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if nSeqHist <> -1 then
               begin
                  FcdsNAcrescValorxDep.First;
                  while not FcdsNAcrescValorxDep.EOF do
                  begin
                     if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                     begin
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsNAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsNAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                FcdsNAcrescValorxDep.FieldByName('DEPLANC').AsFloat) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                     end;
                     FcdsNAcrescValorxDep.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Registra o Historico da Correção Monetária da Depreciação
               //-------------------------------------------------------------------------
               nSeqHist := -1;
               FcdsNAcrescValorxDep.First;
               while not FcdsNAcrescValorxDep.EOF do
               begin
                  if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                  begin
                     if FcdsNAcrescValorxDep.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                     begin
                        if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat = 1 then
                        begin
                           if FcdsNAcrescValorxDep.FieldByName('CMDEP').AsFloat <> 0 then
                           begin
                              nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                     // IDBEM
                                                                        _dbBem.IDPESSOA.AsFloat,                  // IDPESSOA
                                                                        _dbBem.IDMODULO.AsFloat,                  // IDMODULO
                                                                        36,                                       // IDTIPOMOVIMENTACAO
                                                                        dDataMov,                                 // DATAMOVIMENTACAO
                                                                        _dbAcrescimoValor.IDACRESCIMO.AsFloat,    // IDREAVALACRESC
                                                                        -1,                                       // DATAULTDEP
                                                                        -1,                                       // IDGRUPANT
                                                                        -1,                                       // IDCONJANT
                                                                        -1,                                       // IDLOCALANT
                                                                        -1,                                       // IDRESPANT
                                                                        -1,                                       // PLACAANT
                                                                        -1,                                       // PLNCODIGO
                                                                        '',                                       // OBSREAVAL
                                                                         9,                                       // TIPDEPPRORATA
                                                                        -1,                                       // IDTIPODESPESA
                                                                        '',                                       // OBSACRESCIMO
                                                                        -1,                                       // IDMOTIVOBAIXA
                                                                         0,                                       // PROPBAIXA
                                                                         0,                                     // VALVENDAOFI
                                                                        '');                                      // OBSBAIXA
                              if nSeqHist = -1 then
                                 Raise Exception.Create(HistMovBem.MessageInfo);
                           end;
                        end;
                     end;
                  end;
                  FcdsNAcrescValorxDep.Next;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if nSeqHist <> -1 then
               begin
                  FcdsNAcrescValorxDep.First;
                  while not FcdsNAcrescValorxDep.EOF do
                  begin
                     if FcdsNAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat then
                     begin
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsNAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsNAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                FcdsNAcrescValorxDep.FieldByName('CMDEP').AsFloat) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                     end;
                     FcdsNAcrescValorxDep.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsNAcrescimoValor.Next;
            end;
            //----------------------------------------------------------------------------
            // Avança para a Próxima Proporção
            //----------------------------------------------------------------------------
            FcdsGerBens.Next;
         end;
         //===============================================================================
         // Verifica se existe alguma diferença residual na geração dos bens.
         // Se houver, lançar a diferença na última reavaliação ou no bem.
         //===============================================================================
         cSeparador := DecimalSeparator;
         DecimalSeparator := '.';
         //-------------------------------------------------------------------------------
         FcdsSldContab.First;
         while not FcdsSldContab.EOF do
         begin
            //----------------------------------------------------------------------------
            // Processa a diferença no custo
            //----------------------------------------------------------------------------
            if FcdsSldContab.FieldByName('IDTAXADEP').AsInteger = 1 then
            begin
               if FcdsSldContab.FieldByName('VALORG').AsFloat <> FcdsSldContab.FieldByName('SUMVALORG').AsFloat then
               begin
                  if (FcdsSldContab.FieldByName('VALORG').AsFloat - FcdsSldContab.FieldByName('SUMVALORG').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('VALORG').AsFloat - FcdsSldContab.FieldByName('SUMVALORG').AsFloat)) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist07) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('VALORG').AsFloat - FcdsSldContab.FieldByName('SUMVALORG').AsFloat))) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist07) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  if (FcdsSldContab.FieldByName('VALORG').AsFloat - FcdsSldContab.FieldByName('SUMVALORG').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE BEMXMOEDA ' +
                             ' SET VALORG = VALORG + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('VALORG').AsFloat - FcdsSldContab.FieldByName('SUMVALORG').AsFloat)) +
                             ' WHERE IDBEM IN (SELECT IDBEM '+
                             '                 FROM HISTORICOMOVIMENTACAO '+
                             '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist07) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE BEMXMOEDA ' +
                             ' SET VALORG = VALORG + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('VALORG').AsFloat - FcdsSldContab.FieldByName('SUMVALORG').AsFloat))) +
                             ' WHERE IDBEM IN (SELECT IDBEM '+
                             '                 FROM HISTORICOMOVIMENTACAO ' +
                             '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist07) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               if FcdsSldContab.FieldByName('CMBEM').AsFloat <> FcdsSldContab.FieldByName('SUMCMBEM').AsFloat then
               begin
                  if (FcdsSldContab.FieldByName('CMBEM').AsFloat - FcdsSldContab.FieldByName('SUMCMBEM').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('CMBEM').AsFloat - FcdsSldContab.FieldByName('SUMCMBEM').AsFloat)) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist15) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('CMBEM').AsFloat - FcdsSldContab.FieldByName('SUMCMBEM').AsFloat))) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist15) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  //if not ExecSQL(sSql, true) then   // Edilaine - SOL 199277 / KTN 1918056 - comentado
                  if not ExecSQL(sSql, FALSE) then    // Edilaine - SOL 199277 / KTN 1918056
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  if (FcdsSldContab.FieldByName('CMBEM').AsFloat - FcdsSldContab.FieldByName('SUMCMBEM').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE BEMXMOEDA ' +
                             ' SET CMBEM = CMBEM + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('CMBEM').AsFloat - FcdsSldContab.FieldByName('SUMCMBEM').AsFloat)) +
                             ' WHERE IDBEM IN (SELECT IDBEM '+
                             '                 FROM HISTORICOMOVIMENTACAO '+
                             '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist15) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE BEMXMOEDA ' +
                             ' SET CMBEM = CMBEM + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('CMBEM').AsFloat - FcdsSldContab.FieldByName('SUMCMBEM').AsFloat))) +
                             ' WHERE IDBEM IN (SELECT IDBEM '+
                             '                 FROM HISTORICOMOVIMENTACAO '+
                             '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist15) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                 //if not ExecSQL(sSql, true) then   // Edilaine - SOL 199277 / KTN 1918056 - comentado
                 if not ExecSQL(sSql, FALSE) then    // Edilaine - SOL 199277 / KTN 1918056
                     Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if FcdsSldContab.FieldByName('DEPLANC').AsFloat <> FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat then
            begin
               if (FcdsSldContab.FieldByName('DEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('DEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat)) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist17) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end else
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('DEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat))) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist17) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end;
               //if not ExecSQL(sSql, true) then   // Edilaine - SOL 199277 / KTN 1918056 - comentado
               if not ExecSQL(sSql, FALSE) then    // Edilaine - SOL 199277 / KTN 1918056
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               if (FcdsSldContab.FieldByName('DEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE BEMXDEP ' +
                          ' SET DEPLANC = DEPLANC + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('DEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat)) +
                          ' WHERE IDBEM IN (SELECT IDBEM ' +
                          '                 FROM HISTORICOMOVIMENTACAO ' +
                          '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist17) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDBEMXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end else
               begin
                  sSql := ' UPDATE BEMXDEP ' +
                          ' SET DEPLANC = DEPLANC + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('DEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMDEPLANC').AsFloat))) +
                          ' WHERE IDBEM IN (SELECT IDBEM '+
                          '                 FROM HISTORICOMOVIMENTACAO '+
                          '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist17) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDBEMXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end;
               //if not ExecSQL(sSql, true) then   // Edilaine - SOL 199277 / KTN 1918056 - comentado
               if not ExecSQL(sSql, FALSE) then    // Edilaine - SOL 199277 / KTN 1918056
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            if FcdsSldContab.FieldByName('CMDEP').AsFloat <> FcdsSldContab.FieldByName('SUMCMDEP').AsFloat then
            begin
               if (FcdsSldContab.FieldByName('CMDEP').AsFloat - FcdsSldContab.FieldByName('SUMCMDEP').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('CMDEP').AsFloat - FcdsSldContab.FieldByName('SUMCMDEP').AsFloat)) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist21) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end else
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('CMDEP').AsFloat - FcdsSldContab.FieldByName('SUMCMDEP').AsFloat))) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist21) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               if (FcdsSldContab.FieldByName('CMDEP').AsFloat - FcdsSldContab.FieldByName('SUMCMDEP').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE BEMXDEP ' +
                          ' SET CMDEP = CMDEP + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('CMDEP').AsFloat - FcdsSldContab.FieldByName('SUMCMDEP').AsFloat)) +
                          ' WHERE IDBEM IN (SELECT IDBEM ' +
                          '                 FROM HISTORICOMOVIMENTACAO ' +
                          '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist21) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDBEMXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end else
               begin
                  sSql := ' UPDATE BEMXDEP ' +
                          ' SET CMDEP = CMDEP + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('CMDEP').AsFloat - FcdsSldContab.FieldByName('SUMCMDEP').AsFloat))) +
                          ' WHERE IDBEM IN (SELECT IDBEM ' +
                          '                 FROM HISTORICOMOVIMENTACAO ' +
                          '                 WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist21) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDBEMXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa a diferença na reavaliação
            //----------------------------------------------------------------------------
            if FcdsSldContab.FieldByName('IDTAXADEP').AsInteger = 1 then
            begin
               if FcdsSldContab.FieldByName('REAVVALORG').AsFloat <> FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat then
               begin
                  if (FcdsSldContab.FieldByName('REAVVALORG').AsFloat - FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVVALORG').AsFloat - FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat)) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist32) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVVALORG').AsFloat - FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat))) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist32) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  if (FcdsSldContab.FieldByName('REAVVALORG').AsFloat - FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE REAVALXMOEDA ' +
                             ' SET VALORG = VALORG + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVVALORG').AsFloat - FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat)) +
                             ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                             '                         FROM HISTORICOMOVIMENTACAO '+
                             '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist32) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE REAVALXMOEDA ' +
                             ' SET VALORG = VALORG + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVVALORG').AsFloat - FcdsSldContab.FieldByName('SUMREAVVALORG').AsFloat))) +
                             ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                             '                         FROM HISTORICOMOVIMENTACAO '+
                             '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist32) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               if FcdsSldContab.FieldByName('REAVCMBEM').AsFloat <> FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat then
               begin
                  if (FcdsSldContab.FieldByName('REAVCMBEM').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMBEM').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat)) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist22) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE VLRHISTMOVBEM ' +
                             ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMBEM').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat))) +
                             ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist22) +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
                  //----------------------------------------------------------------------
                  if (FcdsSldContab.FieldByName('REAVCMBEM').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat) > 0 then
                  begin
                     sSql := ' UPDATE REAVALXMOEDA ' +
                             ' SET CMBEM = CMBEM + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMBEM').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat)) +
                             ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                             '                         FROM HISTORICOMOVIMENTACAO '+
                             '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist22) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end else
                  begin
                     sSql := ' UPDATE REAVALXMOEDA ' +
                             ' SET CMBEM = CMBEM + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMBEM').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMBEM').AsFloat))) +
                             ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                             '                         FROM HISTORICOMOVIMENTACAO '+
                             '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist22) + ') ' +
                             '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString;
                  end;
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat <> FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat then
            begin
               if (FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat)) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist33) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString + 
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end else
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat))) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist33) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               if (FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE REAVALXDEP ' +
                          ' SET DEPLANC = DEPLANC + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat)) +
                          ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                          '                         FROM HISTORICOMOVIMENTACAO '+
                          '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist33) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDREAVALXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end else
               begin
                  sSql := ' UPDATE REAVALXDEP ' +
                          ' SET DEPLANC = DEPLANC + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVDEPLANC').AsFloat - FcdsSldContab.FieldByName('SUMREAVDEPLANC').AsFloat))) +
                          ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                          '                         FROM HISTORICOMOVIMENTACAO '+
                          '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist33) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDREAVALXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString;
               end;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            if FcdsSldContab.FieldByName('REAVCMDEP').AsFloat <> FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat then
            begin
               if (FcdsSldContab.FieldByName('REAVCMDEP').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMDEP').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat)) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist19) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end else
               begin
                  sSql := ' UPDATE VLRHISTMOVBEM ' +
                          ' SET VALOR = VALOR - ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMDEP').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat))) +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist19) +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDTAXADEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               if (FcdsSldContab.FieldByName('REAVCMDEP').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat) > 0 then
               begin
                  sSql := ' UPDATE REAVALXDEP ' +
                          ' SET CMDEP = CMDEP + ' + formatfloat('#0.00',Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMDEP').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat)) +
                          ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC '+
                          '                         FROM HISTORICOMOVIMENTACAO '+
                          '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist19) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDREAVALXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end else
               begin
                  sSql := ' UPDATE REAVALXDEP ' +
                          ' SET CMDEP = CMDEP + ' + formatfloat('#0.00',abs(Bem.ConvNum(FcdsSldContab.FieldByName('REAVCMDEP').AsFloat - FcdsSldContab.FieldByName('SUMREAVCMDEP').AsFloat))) +
                          ' WHERE IDREAVALIACAO IN (SELECT IDREAVALACRESC ' +
                          '                         FROM HISTORICOMOVIMENTACAO ' +
                          '                         WHERE IDMOVIMENTACAO = ' + floattostr(nSeqHist19) + ') ' +
                          '   AND MOECODIGO = ' + FcdsSldContab.FieldByName('MOECODIGO').AsString +
                          '   AND IDREAVALXDEP = ' + FcdsSldContab.FieldByName('IDTAXADEP').AsString ;
               end;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsSldContab.Next;
         end;
         //-------------------------------------------------------------------------------
         DecimalSeparator := cSeparador;
         //===============================================================================
         // EXECUTA A BAIXA DO BEM DESMEMBRADO
         //===============================================================================
         if FcdsBem.FieldByName('PROPBAIXA').IsNull then
            nPropBaixa := 100
         else
            nPropBaixa := 100 - FcdsBem.FieldByName('PROPBAIXA').AsFloat;
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
                                                         13,                                      // IDTIPOMOVIMENTACAO
                                                         dDataMov,                                // DATAMOVIMENTACAO
                                                         -1,                                      // IDREAVALACRESC
                                                         -1,                                      // DATAULTDEP
                                                         -1,                                      // IDGRUPANT
                                                         -1,                                      // IDCONJANT
                                                         -1,                                      // IDLOCALANT
                                                         -1,                                      // IDRESPANT
                                                         -1,                                      // PLACAANT
                                                         -1,                                      // PLNCODIGO
                                                         '',                                      // OBSREAVAL
                                                          0,                                      // TIPDEPPRORATA
                                                         -1,                                      // IDTIPODESPESA
                                                         '',                                      // OBSACRESCIMO
                                                         -1,                                      // IDMOTIVOBAIXA
                                                         nPropBaixa,                              // PROPBAIXA
                                                          0,                                      // VALVENDAOFI
                                                         'Baixa para Desmembramento');            // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra os bens gerados na Tabela DESMEMBRAMENTO
               //-------------------------------------------------------------------------
               FcdsGerBens.First;
               while not FcdsGerBens.EOF do
               begin
                  if not HistMovBem.RegistraDesmembramento(nSeqHist,
                                                           FcdsGerBens.FieldByName('IDBEM').AsFloat,
                                                           FcdsGerBens.FieldByName('PROPORCAO').AsFloat) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsGerBens.Next;
               end;
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
            FcdsBemxMoeda.Next;
         end;
         if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM do custo de aquisicao
         //-------------------------------------------------------------------------------
         bPrimMov := True;
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            if FcdsBemxMoeda.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
            begin
               nBaixaCM := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').asFloat) * (nPropBaixa / 100);
               if nBaixaCM <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                               25,                                      // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                // DATAMOVIMENTACAO
                                                               -1,                                      // IDREAVALACRESC
                                                               -1,                                      // DATAULTDEP
                                                               -1,                                      // IDGRUPANT
                                                               -1,                                      // IDCONJANT
                                                               -1,                                      // IDLOCALANT
                                                               -1,                                      // IDRESPANT
                                                               -1,                                      // PLACAANT
                                                               -1,                                      // PLNCODIGO
                                                               '',                                      // OBSREAVAL
                                                                0,                                      // TIPDEPPRORATA
                                                               -1,                                      // IDTIPODESPESA
                                                               '',                                      // OBSACRESCIMO
                                                               -1,                                      // IDMOTIVOBAIXA
                                                                0,                                      // PROPBAIXA
                                                                0,                                      // VALVENDAOFI
                                                               '');                                     // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                          0,
                                                          nBaixaCM) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em BemxMoeda
                  //----------------------------------------------------------------------
                  FcdsBemxMoeda.Edit;
                  FcdsBemxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                  FcdsBemxMoeda.Post;
               end;
            end;
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
            nBaixaD   := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
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
                                                            dDataMov,                                // DATAMOVIMENTACAO
                                                            -1,                                      // IDREAVALACRESC
                                                            -1,                                      // DATAULTDEP
                                                            -1,                                      // IDGRUPANT
                                                            -1,                                      // IDCONJANT
                                                            -1,                                      // IDLOCALANT
                                                            -1,                                      // IDRESPANT
                                                            -1,                                      // PLACAANT
                                                            -1,                                      // PLNCODIGO
                                                            '',                                      // OBSREAVAL
                                                             0,                                      // TIPDEPPRORATA
                                                            -1,                                      // IDTIPODESPESA
                                                            '',                                      // OBSACRESCIMO
                                                            -1,                                      // IDMOTIVOBAIXA
                                                             0,                                      // PROPBAIXA
                                                             0,                                      // VALVENDAOFI
                                                            '');                                     // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
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
            if FcdsBemxDep.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
            begin
               nBaixaCMD := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
               if nBaixaCMD <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                               26,                                      // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                // DATAMOVIMENTACAO
                                                               -1,                                      // IDREAVALACRESC
                                                               -1,                                      // DATAULTDEP
                                                               -1,                                      // IDGRUPANT
                                                               -1,                                      // IDCONJANT
                                                               -1,                                      // IDLOCALANT
                                                               -1,                                      // IDRESPANT
                                                               -1,                                      // PLACAANT
                                                               -1,                                      // PLNCODIGO
                                                               '',                                      // OBSREAVAL
                                                                0,                                      // TIPDEPPRORATA
                                                               -1,                                      // IDTIPODESPESA
                                                               '',                                      // OBSACRESCIMO
                                                               -1,                                      // IDMOTIVOBAIXA
                                                                0,                                      // PROPBAIXA
                                                                0,                                      // VALVENDAOFI
                                                               '');                                     // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     bPrimMov := False;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o valor no histórico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          nBaixaCMD) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em BemxDep
                  //----------------------------------------------------------------------
                  FcdsBemxDep.Edit;
                  FcdsBemxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                  FcdsBemxDep.Post;
               end;
            end;
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra as alteracoes nos Flags de Controle
         //-------------------------------------------------------------------------------
         FcdsBem.Edit;
         FcdsBem.FieldByName('PROPBAIXA').AsFloat := FcdsBem.FieldByName('PROPBAIXA').AsFloat + nPropBaixa;
         
         if FcdsBem.FieldByName('PROPBAIXA').AsFloat < 100 then
            FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N'
         else
            FcdsBem.FieldByName('BAIXATOTAL').AsString := 'S';
         FcdsBem.Post;
         if not ApplyCds(FcdsBem,_dbBem,[],[]) then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Realiza a Baixa das Reavaliações
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
                                                               dDataMov,                                              // DATAMOVIMENTACAO
                                                               FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
                                                               -1,                                                    // IDGRUPANT
                                                               -1,                                                    // IDCONJANT
                                                               -1,                                                    // IDLOCALANT
                                                               -1,                                                    // IDRESPANT
                                                               -1,                                                    // PLACAANT
                                                               -1,                                                    // PLNCODIGO
                                                               '',                                                    // OBSREAVAL
                                                                0,                                                    // TIPDEPPRORATA
                                                               -1,                                                    // IDTIPODESPESA
                                                               '',                                                    // OBSACRESCIMO
                                                               -1,                                                    // IDMOTIVOBAIXA
                                                                0,                                                    // PROPBAIXA
                                                                0,                                                    // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
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
         // Realiza a Baixa das CM Reavaliações
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            bPrimMov := True;
            FcdsReavalxMoeda.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
            begin
               if FcdsReavalxMoeda.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
               begin
                  nBaixaCM := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat) * (nPropBaixa / 100);
                  if nBaixaCM <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                                  28,                                                    // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                            // DATAMOVIMENTACAO
                                                                  FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                                  -1,                                                    // DATAULTDEP
                                                                  -1,                                                    // IDGRUPANT
                                                                  -1,                                                    // IDCONJANT
                                                                  -1,                                                    // IDLOCALANT
                                                                  -1,                                                    // IDRESPANT
                                                                  -1,                                                    // PLACAANT
                                                                  -1,                                                    // PLNCODIGO
                                                                  '',                                                    // OBSREAVAL
                                                                   0,                                                    // TIPDEPPRORATA
                                                                  -1,                                                    // IDTIPODESPESA
                                                                  '',                                                    // OBSACRESCIMO
                                                                  -1,                                                    // IDMOTIVOBAIXA
                                                                   0,                                                    // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                   // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             nBaixaCM) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em ReavalxMoeda
                     //-------------------------------------------------------------------
                     FcdsReavalxMoeda.Edit;
                     FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                     FcdsReavalxMoeda.Post;
                  end;
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
               nBaixaD := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
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
                                                               dDataMov,                                          // DATAMOVIMENTACAO
                                                               FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                  // DATAULTDEP
                                                               -1,                                                  // IDGRUPANT
                                                               -1,                                                  // IDCONJANT
                                                               -1,                                                  // IDLOCALANT
                                                               -1,                                                  // IDRESPANT
                                                               -1,                                                  // PLACAANT
                                                               -1,                                                  // PLNCODIGO
                                                               '',                                                  // OBSREAVAL
                                                                0,                                                  // TIPDEPPRORATA
                                                               -1,                                                  // IDTIPODESPESA
                                                               '',                                                  // OBSACRESCIMO
                                                               -1,                                                  // IDMOTIVOBAIXA
                                                                0,                                                  // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                 // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
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
               if FcdsReavalxDep.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
               begin
                  nBaixaCMD := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
                  if nBaixaCMD <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                                  29,                                                  // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                          // DATAMOVIMENTACAO
                                                                  FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                                  -1,                                                  // DATAULTDEP
                                                                  -1,                                                  // IDGRUPANT
                                                                  -1,                                                  // IDCONJANT
                                                                  -1,                                                  // IDLOCALANT
                                                                  -1,                                                  // IDRESPANT
                                                                  -1,                                                  // PLACAANT
                                                                  -1,                                                  // PLNCODIGO
                                                                  '',                                                  // OBSREAVAL
                                                                   0,                                                  // TIPDEPPRORATA
                                                                  -1,                                                  // IDTIPODESPESA
                                                                  '',                                                  // OBSACRESCIMO
                                                                  -1,                                                  // IDMOTIVOBAIXA
                                                                   0,                                                  // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                 // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                             nBaixaCMD) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em ReavalxDep
                     //-------------------------------------------------------------------
                     FcdsReavalxDep.Edit;
                     FcdsReavalxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                     FcdsReavalxDep.Post;
                  end;
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
         // Baixa o custo dos acrescimos de valor
         //-------------------------------------------------------------------------------
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
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(nBem,                                                  // IDBEM
                                                               nEmpresaProp,                                          // IDPESSOA
                                                               nModulo,                                               // IDMODULO
                                                               37,                                                    // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                            // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                    // DATAULTDEP
                                                               -1,                                                    // IDGRUPANT
                                                               -1,                                                    // IDCONJANT
                                                               -1,                                                    // IDLOCALANT
                                                               -1,                                                    // IDRESPANT
                                                               -1,                                                    // PLACAANT
                                                               -1,                                                    // PLNCODIGO
                                                               '',                                                    // OBSREAVAL
                                                                0,                                                    // TIPDEPPRORATA
                                                               -1,                                                    // IDTIPODESPESA
                                                               '',                                                    // OBSACRESCIMO
                                                               -1,                                                    // IDMOTIVOBAIXA
                                                                0,                                                    // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                   // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
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
               FcdsAcrescValorxMoeda.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
               Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Baixa da CM do custo dos acrescimos de valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
               begin
                  nBaixaCM := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat) * (nPropBaixa / 100);
                  if nBaixaCM <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                                  38,                                                    // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                            // DATAMOVIMENTACAO
                                                                  FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                                  -1,                                                    // DATAULTDEP
                                                                  -1,                                                    // IDGRUPANT
                                                                  -1,                                                    // IDCONJANT
                                                                  -1,                                                    // IDLOCALANT
                                                                  -1,                                                    // IDRESPANT
                                                                  -1,                                                    // PLACAANT
                                                                  -1,                                                    // PLNCODIGO
                                                                  '',                                                    // OBSREAVAL
                                                                   0,                                                    // TIPDEPPRORATA
                                                                  -1,                                                    // IDTIPODESPESA
                                                                  '',                                                    // OBSACRESCIMO
                                                                  -1,                                                    // IDMOTIVOBAIXA
                                                                   0,                                                    // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                   // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             nBaixaCM) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em AcrescValorxMoeda
                     //-------------------------------------------------------------------
                     FcdsAcrescValorxMoeda.Edit;
                     FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                     FcdsAcrescValorxMoeda.Post;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxMoeda.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
               Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da Depreciação dos Acrescimos de Valor
         //-------------------------------------------------------------------------------
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
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                               39,                                                  // IDTIPOMOVIMENTACAO
                                                               dDataMov,                                          // DATAMOVIMENTACAO
                                                               FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                               -1,                                                  // DATAULTDEP
                                                               -1,                                                  // IDGRUPANT
                                                               -1,                                                  // IDCONJANT
                                                               -1,                                                  // IDLOCALANT
                                                               -1,                                                  // IDRESPANT
                                                               -1,                                                  // PLACAANT
                                                               -1,                                                  // PLNCODIGO
                                                               '',                                                  // OBSREAVAL
                                                                0,                                                  // TIPDEPPRORATA
                                                               -1,                                                  // IDTIPODESPESA
                                                               '',                                                  // OBSACRESCIMO
                                                               -1,                                                  // IDMOTIVOBAIXA
                                                                0,                                                  // PROPBAIXA
                                                                0,                                     // VALVENDAOFI
                                                               '');                                                 // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
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
               FcdsAcrescValorxDep.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep, [], []) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Realiza a baixa da CM da Depreciação dos Acrescimos de Valor
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            bPrimMov := True;
            FcdsAcrescValorxDep.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               if FcdsAcrescValorxDep.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
               begin
                  nBaixaCMD := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat) * (nPropBaixa / 100);
                  if nBaixaCMD <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                                  40,                                                  // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                            // DATAMOVIMENTACAO
                                                                  FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                                  -1,                                                  // DATAULTDEP
                                                                  -1,                                                  // IDGRUPANT
                                                                  -1,                                                  // IDCONJANT
                                                                  -1,                                                  // IDLOCALANT
                                                                  -1,                                                  // IDRESPANT
                                                                  -1,                                                  // PLACAANT
                                                                  -1,                                                  // PLNCODIGO
                                                                  '',                                                  // OBSREAVAL
                                                                   0,                                                  // TIPDEPPRORATA
                                                                  -1,                                                  // IDTIPODESPESA
                                                                  '',                                                  // OBSACRESCIMO
                                                                  -1,                                                  // IDMOTIVOBAIXA
                                                                   0,                                                  // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                 // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                             nBaixaCMD) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em AcrescValorxDep
                     //-------------------------------------------------------------------
                     FcdsAcrescValorxDep.Edit;
                     FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                     FcdsAcrescValorxDep.Post;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsAcrescValorxDep.Next;
            end;
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep, [], []) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.Next;
         end;
         //===============================================================================
         // Contabilização do Desmembramento
         //===============================================================================
         if bIntegraContab then
         begin
            FcdsGerBens.First;
            while not FcdsGerBens.EOF do
            begin
               FcdsNBem.Data               := Bem.ListaBem(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat);
               FcdsNBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat, ParamCAF.MOEDAOFICIAL);
               FcdsNBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat, ParamCAF.MOEDAOFICIAL, 1);
               FcdsNReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat);
               FcdsNReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat, ParamCAF.MOEDAOFICIAL);
               FcdsNReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat, ParamCAF.MOEDAOFICIAL, 1);
               FcdsNAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat);
               FcdsNAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat, ParamCAF.MOEDAOFICIAL);
               FcdsNAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat, ParamCAF.MOEDAOFICIAL, 1);
               //-------------------------------------------------------------------------
               // Contabiliza Custo
               //-------------------------------------------------------------------------
               if not CafxContab.ContabilizaDesmembramento(nModulo, nEmpresaProp,
                                                           FcdsNBem.FieldByName('IDBEM').AsFloat,
                                                           dDataMov,
                                                           FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                           FcdsNBem.FieldByName('IDGRUPO').AsFloat,         // iIdGrupoFilho
                                                           FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                           FcdsNBem.FieldByName('DESCGRUPO').AsString,      // iIdGrupoFilho
                                                           FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                           FcdsNBem.FieldByName('IDCONJUNTO').AsFloat,      // iIdConjuntoFilho
                                                           FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                           FcdsNBem.FieldByName('CODCENTROCUSTO').AsString, // iIdConjuntoFilho
                                                           FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                           FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                           'B',
                                                           FcdsNBemxMoeda.FieldByName('VALORG').AsFloat,
                                                           FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat,
                                                           FcdsNBemxDep.FieldByName('DEPLANC').AsFloat,
                                                           FcdsNBemxDep.FieldByName('CMDEP').AsFloat,
                                                           FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                           FcdsNBem.FieldByName('DESBEM').AsString,         // Descrição do Filho
                                                           FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                           FcdsNBem.FieldByName('PLACA').AsString,          // Placa do Filho
                                                           iExercicio, iPeriodo, bCtaxCCusto) then
                  Raise Exception.Create(CafxContab.MessageInfo);
               //-------------------------------------------------------------------------
               // Contabiliza Reavaliações
               //-------------------------------------------------------------------------
               FcdsNReavaliacao.First;
               while not FcdsNReavaliacao.EOF do
               begin
                  FcdsNReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',
                                           VarArrayOf([FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,ParamCAF.MOEDAOFICIAL]),[]);
                  FcdsNReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',
                                         VarArrayOf([FcdsNReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,ParamCAF.MOEDAOFICIAL, 1]),[]);
                  //----------------------------------------------------------------------
                  if not CafxContab.ContabilizaDesmembramento(nModulo, nEmpresaProp,
                                                              FcdsNBem.FieldByName('IDBEM').AsFloat,
                                                              dDataMov,
                                                              FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                              FcdsNBem.FieldByName('IDGRUPO').AsFloat,         // iIdGrupoFilho
                                                              FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                              FcdsNBem.FieldByName('DESCGRUPO').AsString,      // iIdGrupoFilho
                                                              FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                              FcdsNBem.FieldByName('IDCONJUNTO').AsFloat,      // iIdConjuntoFilho
                                                              FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                              FcdsNBem.FieldByName('CODCENTROCUSTO').AsString, // iIdConjuntoFilho
                                                              FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                              FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                              'R',
                                                              FcdsReavalxMoeda.FieldByName('VALORG').asFloat,
                                                              FcdsReavalxMoeda.FieldByName('CMBEM').asFloat,
                                                              FcdsReavalxDep.FieldByName('DEPLANC').asFloat,
                                                              FcdsReavalxDep.FieldByName('CMDEP').asFloat,
                                                              FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                              FcdsNBem.FieldByName('DESBEM').AsString,         // Descrição do Filho
                                                              FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                              FcdsNBem.FieldByName('PLACA').AsString,          // Placa do Filho
                                                              iExercicio, iPeriodo, bCtaxCCusto) then
                     Raise Exception.Create(CafxContab.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsNReavaliacao.Next;
               end;
               //-------------------------------------------------------------------------
               // Contabiliza Acrescimo
               //-------------------------------------------------------------------------
               FcdsNAcrescimoValor.First;
               while not FcdsNAcrescimoValor.EOF do
               begin
                  FcdsNAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',
                                                VarArrayOf([FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat,ParamCAF.MOEDAOFICIAL]),[]);
                  FcdsNAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',
                                              VarArrayOf([FcdsNAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat,ParamCAF.MOEDAOFICIAL, 1]),[]);
                  //----------------------------------------------------------------------
                  if not CafxContab.ContabilizaDesmembramento(nModulo, nEmpresaProp,
                                                              FcdsNBem.FieldByName('IDBEM').AsFloat,
                                                              dDataMov,
                                                              FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                              FcdsNBem.FieldByName('IDGRUPO').AsFloat,         // iIdGrupoFilho
                                                              FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                              FcdsNBem.FieldByName('DESCGRUPO').AsString,      // iIdGrupoFilho
                                                              FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                              FcdsNBem.FieldByName('IDCONJUNTO').AsFloat,      // iIdConjuntoFilho
                                                              FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                              FcdsNBem.FieldByName('CODCENTROCUSTO').AsString, // iIdConjuntoFilho
                                                              FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                              FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                              'A',
                                                              FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat,
                                                              FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat,
                                                              FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat,
                                                              FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat,
                                                              FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                              FcdsNBem.FieldByName('DESBEM').AsString,         // Descrição do Filho
                                                              FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                              FcdsNBem.FieldByName('PLACA').AsString,          // Placa do Filho
                                                              iExercicio, iPeriodo, bCtaxCCusto) then
                     Raise Exception.Create(CafxContab.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsNAcrescimoValor.Next;
               end;
               //-------------------------------------------------------------------------
               FcdsGerBens.Next;
            end;
            //----------------------------------------------------------------------------
            // Registra a Planilha Contábil
            //----------------------------------------------------------------------------
            nPlanilha := CafxContab.RegistraPlanilhaContabil(nModulo,
                                                             nEmpresaProp,
                                                             nUsuario,
                                                             datetostr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra no Historico a Planilha Gerada
            //----------------------------------------------------------------------------
            if nPlanilha > 0 then
            begin
               sSql := ' SELECT IDMOVIMENTACAO ' +
                       ' FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE IDBEM = ' + floattostr(nBem) +
                       '   AND IDTIPOMOVIMENTACAO = 13' +
                       '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
               _cds.Data := GetDataPacket( sSql );
               //-------------------------------------------------------------------------
               with _dMTBem do
               begin
                  sqlAtualizaPlnCodigo.Prepare;
                  sqlAtualizaPlnCodigo.ParamByName('IDMOVIMENTACAO').AsFloat := _cds.FieldByName('IDMOVIMENTACAO').AsFloat;
                  sqlAtualizaPlnCodigo.ParamByName('PLNCODIGO').AsFloat := nPlanilha;
                  if not ExecSQL(sqlAtualizaPlnCodigo.SQLChanged, True) then
                     Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               FcdsGerBens.First;
               while not FcdsGerBens.EOF do
               begin
                  sSql := ' SELECT IDMOVIMENTACAO ' +
                          ' FROM HISTORICOMOVIMENTACAO ' +
                          ' WHERE IDBEM = ' + floattostr(FcdsGerBens.FieldByName('IDBEM').AsFloat) +
                          '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
                  _cds.Data := GetDataPacket( sSql );
                  //----------------------------------------------------------------------
                  with _dMTBem do
                  begin
                     sqlAtualizaPlnCodigo.Prepare;
                     sqlAtualizaPlnCodigo.ParamByName('IDMOVIMENTACAO').AsFloat := _cds.FieldByName('IDMOVIMENTACAO').AsFloat;
                     sqlAtualizaPlnCodigo.ParamByName('PLNCODIGO').AsFloat := nPlanilha;
                     if not ExecSQL(sqlAtualizaPlnCodigo.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
                  //----------------------------------------------------------------------
                  FcdsGerBens.Next;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM dos Bens Gerados pelo Desmembramento
         //-------------------------------------------------------------------------------
         FcdsGerBens.First;
         while not FcdsGerBens.EOF do
         begin
            FcdsNBem.Data       := Bem.ListaBem(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat);
            FcdsNBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat);
            FcdsNBemxDep.Data   := Bem.ListaBemxDep(nEmpresaProp, FcdsGerBens.FieldByName('IDBEM').AsFloat);
            while not FcdsNBemxMoeda.EOF do
            begin
               FcdsNBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
               iFlgPai := 1;
               while (not FcdsNBemxDep.EOF) and (FcdsNBemxDep.FieldByName('MOECODIGO').AsFloat =
                                                 FcdsNBemxMoeda.FieldByName('MOECODIGO').AsFloat) do
               begin
                  if not Bem.AtualizaSaldoContabBem(FcdsNBemxDep.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsNBemxDep.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                    0, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    FcdsNBem.FieldByName('IDGRUPO').AsInteger,
                                                    FcdsNBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    FcdsNBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    FcdsNBem.FieldByName('IDCONJUNTO').AsInteger,
                                                    FcdsNBem.FieldByName('UNIDNEGOC').AsInteger,
                                                    2, iFlgPai) then
                     Raise Exception.Create(Bem.MessageInfo);
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
                  FcdsNBemxDep.Next;
               end;
               FcdsNBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsGerBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM do Bem Desmembrado
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            iFlgPai := 1;
            while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsFloat =
                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat) do
            begin
               if not Bem.AtualizaSaldoContabBem(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                                 FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                                 dDataMov,
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
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
            if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
               RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Estorna o Desmembramento de um bem
//========================================================================================
function TCtrlMovDesmembramento.EstornaDesmembramento(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                      dDataMov, dDataEst: TDateTime): Boolean;
var
   iExercicio, iPeriodo, iTotPlan,
   iFlgPai, iAux, iPlan              : Integer;
   sSql, sSQLEstorna                 : String;
   bNovoPlnCodigo, bRemovePlanContab : Boolean;
   aPlanilha                         : Array of Extended;
   cdsAux                            : TCMClientDataSet;
   bInTransacao                      : boolean; // Vando - SOL 154328-5901 / KTN 1373449
begin
   bInTransacao := InTransaction;  // Vando - SOL 154328-5901 / KTN 1373449

   cdsAux := TCMClientDataSet.Create(nil);
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaDesmembramento(nModulo, nEmpresaProp, nUsuario, nBem,
                                                           dDataMov, dDataEst);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            StartTransaction;
         //===============================================================================
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
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
         end;
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
         bIntegraContab := CafxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Carrega os bens gerados
         //-------------------------------------------------------------------------------
         FcdsBensGerados.Data := ListaBensGerados(nEmpresaProp, nBem);
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação nos bens gerados
         //-------------------------------------------------------------------------------
         while not FcdsBensGerados.EOF do
         begin
            sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                    ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                    ' WHERE  IDBEM = ' + floattostr(FcdsBensGerados.FieldByName('IDBEM').AsFloat) + #13 +
                    '   AND  IDPESSOA = ' + floattostr(FcdsBensGerados.FieldByName('IDPESSOA').AsFloat) ;
            _cds.Data := GetDataPacket(sSql);
            if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
               Raise Exception.Create(CMTranslate('Existe movimentação nos bens gerados pelo desmembramento. Consulte Histórico de Movimentação!'));
            //----------------------------------------------------------------------------
            FcdsBensGerados.Next;
         end;
         //===============================================================================
         // Remove a entrada dos bens resultantes
         //===============================================================================
         iTotPlan := 0;
         FcdsBensGerados.First;
         while not FcdsBensGerados.EOF do
         begin
          try
            _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, IDREAVALACRESC, PLNCODIGO ' + #13 +
                                       ' FROM   HISTORICOMOVIMENTACAO ' + #13 +
                                       ' WHERE  IDBEM = ' + floattostr(FcdsBensGerados.FieldByName('IDBEM').AsFloat) + #13 +
                                       '   AND  IDPESSOA = ' + floattostr(FcdsBensGerados.FieldByName('IDPESSOA').AsFloat) + #13);
            while not _cds.Eof do
            begin
               //-------------------------------------------------------------------------
               // Captura as planilhas contábeis
               //-------------------------------------------------------------------------
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
                  SetLength(aPlanilha, iTotPlan);
                  aPlanilha[iTotPlan - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
               end;
               //-------------------------------------------------------------------------
               // Remove os acréscimos
               //-------------------------------------------------------------------------
               if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 09 then
               begin
                  sSql := ' UPDATE ACRESCIMOVALOR ' +
                          ' SET IDMOVIMENTACAO = NULL ' +
                          ' WHERE IDACRESCIMO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  sSql := ' DELETE FROM ACRESCVALORXDEP ' +
                          ' WHERE IDACRESCIMO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  sSql := ' DELETE FROM ACRESCVALORXMOEDA ' +
                          ' WHERE IDACRESCIMO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  sSql := ' DELETE FROM ACRESCIMOVALOR ' +
                          ' WHERE IDACRESCIMO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim
               end;
               //-------------------------------------------------------------------------
               // Remove as reavaliacoes
               //-------------------------------------------------------------------------
               if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32 then
               begin
                  sSql := ' UPDATE REAVALIACAO ' +
                          ' SET IDMOVIMENTACAO = NULL ' +
                          ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  sSql := ' DELETE FROM REAVALXDEP ' +
                          ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  sSql := ' DELETE FROM REAVALXMOEDA ' +
                          ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  sSql := ' DELETE FROM REAVALIACAO ' +
                          ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                  //if not ExecSQL(sSql, True) then
                  //   Raise Exception.Create(MessageInfo);
                  //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                  //ExecSQL(sSql, True);
                  ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                  //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

                  if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32) then
                  begin
                    //Cássio - SOL Nº121469 - KINTANA Nº 585093 - Início
                    //Impedir a exclusão de registros inexistentes na tabela HMBREAVAL
                    sSQLEstorna := 'SELECT 1 FROM HMBREAVAL WHERE IDMOVIMENTACAO = ' +
                                     _cds.FieldByName('IDMOVIMENTACAO').AsString;
                   if FazQuery(cdsAux, sSQLEstorna) then
                   begin
                     sSql := ' DELETE FROM HMBREAVAL ' +
                             ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
// Alterado por Arnaldo V. Scarin em 11/09/2008 - Kintana: 413614
// Essa alteração foi indicada pelo Emerson, que descobriu o erro.
                     //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
                     //ExecSQL(sSql, True);
                     ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
                    // if not ExecSQL(sSql, True) then
                    //    Raise Exception.Create(MessageInfo);
                   end;
                  //Cássio - SOL Nº121469 - KINTANA Nº 585093 - Fim
                  end;
               end;
               //-------------------------------------------------------------------------
               // Remove os valores lançados
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
                 //if not ExecSQL(sSql, True) then
                 //   Raise Exception.Create(MessageInfo);
               //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
               //ExecSQL(sSql, True);
               ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
               //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim
               //-------------------------------------------------------------------------
               // Retira o link da Planilha Contábil
               //-------------------------------------------------------------------------
               sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                       ' SET PLNCODIGO = NULL '+
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
               //if not ExecSQL(sSql, True) then
               //   Raise Exception.Create(MessageInfo);
               //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
               //ExecSQL(sSql, True);
               ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
               //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            //----------------------------------------------------------------------------
            // Remove os Registros de Entrada no Histórico
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, True) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            //----------------------------------------------------------------------------
            // Remove os Registros de Saldos Contábeis do Bem
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM SLDCTBBEMXDEP ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, True) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            sSql := ' DELETE FROM SALDOCONTABBEM ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, True) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            //----------------------------------------------------------------------------
            // Remove o Cadastro
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM BEMCOTACAO ' +
                    ' WHERE IDBEM = ' + floattostr(nBem) +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, False) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            sSql := ' DELETE FROM PLANOPATROXBEM ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, False) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            sSql := ' DELETE FROM BEMXDEP ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, True) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            sSql := ' DELETE FROM BEMXMOEDA ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, True) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim

            //Helen - SOL: 179583/9522 KTN: 1659788 - Inicio
            sSql := ' DELETE FROM PLANOPATROXVIGENCIABEM ' +
                    '  WHERE (IDPESSOA = ' +  FcdsBensGerados.FieldByName('IDPESSOA').AsString + ')' +
                    '    AND (IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString + ')';
           //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Helen - SOL: 179583/9522 KTN: 1659788 - Fim

            sSql := ' DELETE FROM BEM ' +
                    ' WHERE IDBEM = ' + FcdsBensGerados.FieldByName('IDBEM').AsString +
                    '   AND IDPESSOA = ' + FcdsBensGerados.FieldByName('IDPESSOA').AsString;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            //if not ExecSQL(sSql, True) then
            //   Raise Exception.Create(MessageInfo);
            //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
            //ExecSQL(sSql, True);
            ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim
            //----------------------------------------------------------------------------
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Início
            except
              raise Exception.Create(MessageInfo);
            end;
            //Cássio - SOL Nº 121534 KINTAN Nº586377 - Fim
            FcdsBensGerados.Next;
         end;
         //===============================================================================
         // Remove a baixa do bem desmembrado
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
         //-------------------------------------------------------------------------------
         _cds.First;
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Posiciona a tabela de acordo com a movimentacao
            //----------------------------------------------------------------------------
            if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 13) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 25) then
               FcdsBemxMoeda.Locate('MOECODIGO',_cds.FieldByName('MOECODIGO').AsFloat,[])
            else
               FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                     _cds.FieldByName('IDTAXADEP').AsFloat]), []);
            //----------------------------------------------------------------------------
            // Captura as planilhas contábeis
            //----------------------------------------------------------------------------
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
               SetLength(aPlanilha, iTotPlan);
               aPlanilha[iTotPlan - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
            end;
            //----------------------------------------------------------------------------
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               13 : begin
                       if _cds.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                       begin
                          FcdsBem.Edit;
                          FcdsBem.FieldByName('PROPBAIXA').AsFloat   := Bem.ConvNum(FcdsBem.FieldByName('PROPBAIXA').AsFloat - _cds.FieldByName('PROPBAIXA').AsFloat);
                          //Emerson - 12/09/2008 - N. Sol 95458 -  N. Kintana 413614
                          //FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N';
                          if FcdsBem.FieldByName('PROPBAIXA').AsFloat < 100 then
                              FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N'
                           else
                              FcdsBem.FieldByName('BAIXATOTAL').AsString := 'S';
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
               // Captura as planilhas contábeis
               //-------------------------------------------------------------------------
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
                  SetLength(aPlanilha, iTotPlan);
                  aPlanilha[iTotPlan - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
               end;
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
               if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 37) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 38) then
                  FcdsAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                   _cds.FieldByName('MOECODIGO').AsFloat]),[])
               else
                  FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                 _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                 _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
               //-------------------------------------------------------------------------
               // Captura as planilhas contábeis
               //-------------------------------------------------------------------------
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
                  SetLength(aPlanilha, iTotPlan);
                  aPlanilha[iTotPlan - 1] := _cds.FieldByName('PLNCODIGO').AsInteger;
               end;
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
         //-------------------------------------------------------------------------------
         // Retira o link com a Planilha Contábil
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                 ' SET PLNCODIGO = NULL '+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 13 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR' +
                 '        IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR IDTIPOMOVIMENTACAO = 28 OR' +
                 '        IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 29 OR IDTIPOMOVIMENTACAO = 37 OR' +
                 '        IDTIPOMOVIMENTACAO = 38 OR IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40)' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
//Cássio - SOL 95458 KINTANA 413614 - Início
//         if not ExecSQL(sSql, True) then
//            Raise Exception.Create(MessageInfo);
//Cássio - SOL 95458 KINTANA 413614 - Fim
         //Helen - SOL: 179583/9621 KTN 1663624 - Inicio
         //ExecSQL(sSql, True);
         ExecSQL(sSql); //Helen - SOL: 179583/9621 KTN 1663624 - Fim
         //-------------------------------------------------------------------------------
         // Estorna as planilhas contábeis
         //-------------------------------------------------------------------------------
         if bIntegraContab and (iTotPlan > 0) then
         begin
            if not CafxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            bRemovePlanContab := CafxContab.RemovePlanContab(Trunc(nEmpresaProp));
            //----------------------------------------------------------------------------
            // Estorna / Remove as Planilhas Contábeis
            //----------------------------------------------------------------------------
            iPlan := 0;
            while iPlan <= (iTotPlan - 1) do
            begin
               if aPlanilha[iPlan] > 0 then
               begin
                  if not bRemovePlanContab then
                  begin
                     if not CafxContab.LancaContab.EstornaLancaContab(nUsuario, aPlanilha[iPlan],
                                                                      nModulo, nEmpresaProp,
                                                                      ParamCAF.USAPLANOPATRO,
                                                                      datetostr(dDataMov)) then
                     begin
                        Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CafxContab.MessageInfo);
                     end;
                  end else
                  begin
                     if not CafxContab.LancaContab.ExcluiLancaContab(nUsuario, aPlanilha[iPlan],
                                                                     nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                     begin
                        Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CafxContab.MessageInfo);
                     end;
                  end;
               end;
               //-------------------------------------------------------------------------
               iPlan := iPlan + 1;
            end;
         end;
        //Cássio - SOL 95458 KINTANA 413614 - Início
        //Se o Bem possuir baixa total, não fazer estorno de Valores
         if (FcdsBem.FieldByName('BAIXATOTAL').AsString <> 'S') then
         begin
         //Cássio - SOL 95458 KINTANA 413614 - Fim
          //-------------------------------------------------------------------------------
          // Remove os Registros da Baixa no Historico
          //-------------------------------------------------------------------------------
           sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                   ' FROM HISTORICOMOVIMENTACAO'+
                   ' WHERE IDBEM = ' + floattostr(nBem) +
                   '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                   '   AND (IDTIPOMOVIMENTACAO = 13 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR' +
                   '        IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR IDTIPOMOVIMENTACAO = 28 OR' +
                   '        IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 29 OR IDTIPOMOVIMENTACAO = 37 OR' +
                   '        IDTIPOMOVIMENTACAO = 38 OR IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40)' +
                   '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
           _cds.Data := GetDataPacket(sSql);
           if _cds.IsEmpty then
              Raise Exception.Create(CMTranslate('Não foi possível estornar a baixa para desmembramento do Bem ') +
                                     trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                     floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
           //-------------------------------------------------------------------------------
           while not _cds.Eof do
           begin
              if _cds.FieldbyName('IDTIPOMOVIMENTACAO').AsInteger = 13 then
              begin
                 sSql := ' DELETE FROM DESMEMBRAMENTO ' +
                         ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
                 if not ExecSQL(sSql, True) then
                    Raise Exception.Create(CMTranslate('Não foi possível remover as referencias do desmembramento do Bem ') +
                                           trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                           floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
              end;
              //----------------------------------------------------------------------------
              sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                      ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
              if not ExecSQL(sSql, True) then
                 Raise Exception.Create(CMTranslate('Não foi possível remover os valores da baixa para desmembramento do Bem ') +
                                        trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                        floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
              //----------------------------------------------------------------------------
              sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                      ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
              if not ExecSQL(sSql, True) then
                 Raise Exception.Create(CMTranslate('Não foi possível remover o historico da baixa para desmembramento do Bem ') +
                                        trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                        floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
              //----------------------------------------------------------------------------
              _cds.Next;
           end;

         //TESTAR
         //end;
           //-------------------------------------------------------------------------------
           // Estorna a Depreciacao PróRata
           //-------------------------------------------------------------------------------
           if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
              Raise Exception.Create(ProRata.MessageInfo);
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
         end;
         if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
            Commit;
         Result := True;
      except
         On E : Exception do
         begin
            if not bInTransacao then    // Vando - SOL 154328-5901 / KTN 1373449
               RollBack;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
   FreeAndNil(cdsAux);
end;

function TCtrlMovDesmembramento.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

