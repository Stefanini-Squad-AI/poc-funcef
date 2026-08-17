{ --------------------------------------------------------------------------------------------------
Rotina...........: ExecutaRemembramento
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
Rotina......: ExecutaRemembramento
Nº SOL......: 153539
Nº KINTANA..: 1159566
Data........: 23/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para não verificar a quantidade mínima de bens por imóvel.
---------------------------------------------------------------------------------------------------}

unit uCtrlMovRemembramento;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,    
     SysUtils, dbclient, Provider, uMidasUtil,  
     dMTBem, uDBBem, uDBBemxMoeda, uDBBemxDep, uDBPlanoPatroxBem,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uCtrlParamCAF, uCtrlBem, uCtrlHistMovBem,
     uCtrlCafxContab, uCtrlFechamentoProRata,
     uCtrlConjunto, uCtrlLocalizacoes, uCtrlGrupoContab;

Type
   TCtrlMovRemembramento = class(TCmControlObject)

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

      ParamCAF    : TCtrlParamCAF;
      HistMovBem  : TCtrlHistMovBem;
      CafxContab  : TCtrlCafxContab;
      ProRata     : TCtrlFechamentoProRata;
      Bem         : TCtrlBem;
      Conjunto    : TCtrlConjunto;
      Localizacao : TCtrlLocalizacoes;
      Grupo       : TCtrlGrupoContab;

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
      FcdsBensBaixados: TClientDataSet;
      FcdsSelBens: TClientDataSet;
      FcdsCotaDep: TClientDataSet;
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
      
      FIdBem: Integer;

      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsBensBaixados(const Value: TClientDataSet);
      procedure SetcdsSelBens(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsCotaDep(const Value: TClientDataSet);
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
      procedure SetIdBem(const Value: Integer);

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
      property cdsSelBens           : TClientDataSet read FcdsSelBens write SetcdsSelBens;
      property cdsBensBaixados      : TClientDataSet read FcdsBensBaixados write SetcdsBensBaixados;
      property cdsCotaDep           : TClientDataSet read FcdsCotaDep write SetcdsCotaDep;
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
      Property IdBem : Integer read FIdBem write SetIdBem;                   // InvestImob
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ListaCotaDep : OleVariant;
      function ListaBensBaixados(nEmpresaProp, nBem : Extended) : OleVariant;
      //----------------------------------------------------------------------------------
      function ExecutaRemembramento(nModulo, nEmpresaProp, nUsuario : Extended;
                                    nPlaca, nConjunto, nSituacao, nClasse, nGrupo : Extended;
                                    sDescBem : String; dDataMov : TDateTime;
                                    ValidarQtdeDeBens: Boolean = True // Alterado por FHBS - SOL: 153539 KTN: 1159566
                                    ): Boolean;

      function EstornaRemembramento(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov, dDataEst : TDateTime) : Boolean;

   end;

implementation

{ TCtrlMovRemembramento }

constructor TCtrlMovRemembramento.Create;
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

   FcdsSelBens            := TClientDataSet.Create(nil);
   FcdsBensBaixados       := TClientDataSet.Create(nil);
   FcdsCotaDep            := TClientDataSet.Create(nil);

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
   Conjunto    := TCtrlConjunto.Create;
   Localizacao := TCtrlLocalizacoes.Create;
   Grupo       := TCtrlGrupoContab.Create;
end;

destructor TCtrlMovRemembramento.Destroy;
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
   Conjunto.Free;
   Localizacao.Free;
   Grupo.Free;
   
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
               FcdsSelBens, FcdsBensBaixados]);

   FcdsPlanoPatroxBem.Free;
   FcdsCotaDep.Free;

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

procedure TCtrlMovRemembramento.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   ProRata.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
   Localizacao.InitializeAs(Self);
   Grupo.InitializeAs(Self);
end;

procedure TCtrlMovRemembramento.DoChangeDataBase;
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

procedure TCtrlMovRemembramento.SetcdsPlanoPatroxBem(const Value: TClientDataSet);
begin
  FcdsPlanoPatroxBem := Value;
end;

procedure TCtrlMovRemembramento.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlMovRemembramento.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlMovRemembramento.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlMovRemembramento.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlMovRemembramento.SetcdsBensBaixados(const Value: TClientDataSet);
begin
  FcdsBensBaixados := Value;
end;

procedure TCtrlMovRemembramento.SetcdsSelBens(const Value: TClientDataSet);
begin
  FcdsSelBens := Value;
end;

procedure TCtrlMovRemembramento.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlMovRemembramento.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlMovRemembramento.SetcdsCotaDep(const Value: TClientDataSet);
begin
   FcdsCotaDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsNAcrescimoValor := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsNAcrescValorxDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsNAcrescValorxMoeda := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNBem(const Value: TClientDataSet);
begin
  FcdsNBem := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNBemxDep(const Value: TClientDataSet);
begin
  FcdsNBemxDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNBemxMoeda(const Value: TClientDataSet);
begin
  FcdsNBemxMoeda := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNReavaliacao(const Value: TClientDataSet);
begin
  FcdsNReavaliacao := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNReavalxDep(const Value: TClientDataSet);
begin
  FcdsNReavalxDep := Value;
end;

procedure TCtrlMovRemembramento.SetcdsNReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsNReavalxMoeda := Value;
end;

procedure TCtrlMovRemembramento.SetcdsAux(const Value: TClientDataSet);
begin
  FcdsAux := Value;
end;

procedure TCtrlMovRemembramento.SetIdBem(const Value: Integer);
begin
  FIdBem := Value;
end;

function TCtrlMovRemembramento.ListaBensBaixados(nEmpresaProp, nBem : Extended) : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT RM.IDBEMBAIXADO AS IDBEM, HM.IDPESSOA ' + #13 +
           ' FROM HISTORICOMOVIMENTACAO HM, ' + #13 +
           '      REMEMBRAMENTO RM ' + #13 +
           ' WHERE HM.IDBEM = ' + floattostr(nBem) + #13 +
           '   AND HM.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '   AND HM.IDTIPOMOVIMENTACAO = 10 ' + #13 +
           '   AND HM.IDMOVIMENTACAO = RM.IDMOVIMENTACAO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovRemembramento.ListaCotaDep : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT (0)    AS IDREAVALIACAO, ' + #13 +
           '        (0)    AS MOECODIGO,     ' + #13 +
           '        (0)    AS IDTAXADEP,     ' + #13 +
           '        (0.00) AS SUMCUSTO,      ' + #13 +
           '        (0.00) AS SUMCMCUSTO,    ' + #13 +
           '        (0.00) AS SUMCOTADEP,    ' + #13 +
           '        (0.00) AS SUMDEPACUM,    ' + #13 +
           '        (0.00) AS SUMCMDEPACUM   ' + #13 +
           ' FROM GRUPO                      ' + #13 +
           ' WHERE (IDGRUPO = -1)            ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
//========================================================================================
// Executa o Remembramento de um bem
//========================================================================================
function TCtrlMovRemembramento.ExecutaRemembramento(nModulo, nEmpresaProp, nUsuario : Extended;
                                                    nPlaca, nConjunto, nSituacao, nClasse, nGrupo : Extended;
                                                    sDescBem : String; dDataMov : TDateTime;
                                                    ValidarQtdeDeBens: Boolean
                                                    ): Boolean;
var
   iExercicio, iPeriodo,
   iFlgPai, iHistMovBem,
   iGrupo, iLocalizacao, iResponsavel       : Integer;
   bCtaxCCusto, bFlgPai, bPrimMov, bPrimBem : Boolean;
   nMoeda, nCusto, nCMCusto, nCotaDep,
   nBaixaB, nBaixaCM, nBaixaD, nBaixaCMD,
   nValContabB, nValContabCM,
   nValContabD, nValContabCMD,
   nSeqHist,
   nPropBaixa, nPlanilha                    : Extended;
   dDataUltMov, dDataUltDep                 : TDateTime;
   sSql, sCentroCusto, sDescGrupo           : String;
   cSeparador                               : Char;
   sListaBem : string;      // Vando - SOL 154328-5901 / KTN 1373449
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaRemembramento(nModulo, nEmpresaProp, nUsuario,
                                                          nPlaca, nConjunto,
                                                          nSituacao, nClasse, nGrupo,
                                                          sDescBem, dDataMov, FcdsSelBens.Data,
                                                          ValidarQtdeDeBens );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Verifica a lista de bens que serão baixados
         //-------------------------------------------------------------------------------
         // Alterado por FHBS - SOL: 153539 KTN: 1159566 - Colocado o "ValidarQtdeDeBens"
         // para ignorar a verificação da quantidade mínima de bem, pois no Imobiliário podemos fazer
         // o remembramento de um Imovel (Terreno+Contrução) com outro imovel (apenas Terreno).
         if (ValidarQtdeDeBens) and (FcdsSelBens.RecordCount < 2) then
            Raise Exception.Create(CMTranslate('Os bens que serão baixados para a criação do Novo Bem não foram informados!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para a Entrada do Novo Bem
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Novo Bem!'));
         //-------------------------------------------------------------------------------
//         if nPlaca <= 0 then
//            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Novo Bem!'))
//         else
//            if not Bem.PlacaUnica(nEmpresaProp, floattostr(nPlaca)) then
//               raise Exception.Create(CMTranslate('Número do Tombamento Patrimonial do Novo Bem (') + floattostr(nPlaca) + CMTranslate(') deve ser exclusivo!'));
         //-------------------------------------------------------------------------------
         if nConjunto <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do CONJUNTO do Novo Bem!'));
         FcdsAux.Data := Conjunto.ListaConjunto(nEmpresaProp, nConjunto);
         if FcdsAux.IsEmpty then
            Raise Exception.Create(CMTranslate('O código do CONJUNTO do Novo Bem é invalido!'));
         iLocalizacao := FcdsAux.FieldbyName('IDLOCALIZACAO').AsInteger;
         iResponsavel := FcdsAux.FieldbyName('IDRESPONSAVEL').AsInteger;
         FcdsAux.Data := Localizacao.ListaLocalizacao(nEmpresaProp, FcdsAux.FieldbyName('IDLOCALIZACAO').AsFloat);
         sCentroCusto := FcdsAux.FieldByName('CODCENTROCUSTO').AsString;
         //-------------------------------------------------------------------------------
         if nSituacao <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código da SITUAÇÃO FÍSICA do Novo Bem!'));
         //-------------------------------------------------------------------------------
         if nClasse <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código da CLASSE do Novo Bem!'));
         //-------------------------------------------------------------------------------
         if nGrupo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do GRUPO CONTÁBIL do Novo Bem!'));
         FcdsAux.Data := Grupo.ListaGrupoContab(nEmpresaProp, nGrupo);
         if FcdsAux.IsEmpty then
            Raise Exception.Create(CMTranslate('O código do GRUPO CONTÁBIL do Novo Bem é invalido!'));
         iGrupo := Trunc(nGrupo);
         sDescGrupo := FcdsAux.FieldByName('NOME').AsString;
         //-------------------------------------------------------------------------------
         if sDescBem = '' then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a DESCRIÇÃO do Novo Bem!'));
         //-------------------------------------------------------------------------------
         if dDataMov <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a Data de Movimentação do Novo Bem!'));
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
         bIntegraContab := CafxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil do Fechamento PróRata
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
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
         end;
         //-------------------------------------------------------------------------------
         // Inicializa o CDS que irá acumular os custos e as cotas anuais de depreciação
         // de cada Bem x Moeda x Dep, para o calculo da Taxa de Depreciacao do novo
         // Bem
         //-------------------------------------------------------------------------------
         FcdsCotaDep.Data := ListaCotaDep;
         //===============================================================================
         // Verifica se os parâmetros dos bens selecionados estão corretos, processa os
         // seus Fechamentos Pró-Rata e acumula os valores para o novo bem, separando os
         // Custo de Aquisição / Acréscimos de Valor da Reavaliação
         //===============================================================================
         ProRata.iaHistMovBem := -1;
         bPrimBem := True;
         FcdsSelBens.First;

         sListaBem := '';   // Vando - SOL 154328-5901 / KTN 1373449

         while not FcdsSelBens.EOF do
         begin
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            if FcdsBem.IsEmpty then
               Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
            //----------------------------------------------------------------------------
            if FcdsBem.FieldByName('IDMODULO').AsFloat <> nModulo then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o bem pode manipulá-lo'));
            //----------------------------------------------------------------------------
            if FcdsBem.FieldByName('IDPESSOA').AsFloat <> nEmpresaProp then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o bem pode manipulá-lo'));
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            // Verifica se a data da movimentação é válida
            //----------------------------------------------------------------------------
            if not Bem.VerificaPeriodoCAF(nEmpresaProp, FcdsBem.FieldByName('IDBEM').AsInteger,
                                          FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                          '16',
                                          dDataMov, dDataUltMov, dDataUltDep) then
               Raise Exception.Create(Bem.MessageInfo);
            //----------------------------------------------------------------------------
            // Calcula a Depreciacao até o Dia da Movimentacao - 1
            //----------------------------------------------------------------------------
            if not ProRata.ExecutarII(nModulo, nEmpresaProp, nUsuario,
                                      FcdsSelBens.FieldByName('IDBEM').AsFloat,
                                      (dDataMov - 1), 0) then
               Raise Exception.Create(ProRata.MessageInfo);
            //----------------------------------------------------------------------------
            // Alimentando os DataSets Filhos com os dados do bem já atualizado pela
            // Fechamento Pró-Rata
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            //----------------------------------------------------------------------------
            // Movimenta os dados de um dos Bens baixados para o Bem Destino
            //----------------------------------------------------------------------------
            if bPrimBem then
            begin
               FcdsNBem.Data           := FcdsBem.Data;
               FcdsNBemxMoeda.Data     := FcdsBemxMoeda.Data;
               FcdsNBemxDep.Data       := FcdsBemxDep.Data;
               // Vando - SOL 154328-5901 / KTN 1373449 - COMENTADO
               //FcdsPlanoPatroxBem.Data := Bem.ListaPlanoPatroxBem(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);

               //-------------------------------------------------------------------------
               FcdsNBem.Edit;
               FcdsNBem.FieldByName('IDBEM').Clear;
               FcdsNBem.FieldByName('IDPESSOA').AsFloat       := nEmpresaProp;
               FcdsNBem.FieldByName('IDMODULO').AsFloat       := nModulo;
               FcdsNBem.FieldByName('PLACA').AsFloat          := nPlaca;
               FcdsNBem.FieldByName('IDCONJUNTO').AsFloat     := nConjunto;
               FcdsNBem.FieldByName('IDSITUACAO').AsFloat     := nSituacao;
               FcdsNBem.FieldByName('IDCLASSEBEM').AsFloat    := nClasse;
               FcdsNBem.FieldByName('IDGRUPO').AsFloat        := nGrupo;
               FcdsNBem.FieldByName('DESBEM').AsString        := sDescBem;
               FcdsNBem.FieldByName('DTAINCLUSAO').AsDateTime := dDataMov;
               FcdsNBem.Post;
               //-------------------------------------------------------------------------
               bPrimBem := False;
            end;
            //----------------------------------------------------------------------------
            // Realiza o acumulo dos valores para o calculo da cota anual de depreciação
            // para o Novo Bem e para o registro historico.
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.First;
            while not FcdsBemxMoeda.EOF do
            begin
               nMoeda   := FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat;
               nCusto   := FcdsBemxMoeda.FieldByName('VALORG').AsFloat;
               nCMCusto := FcdsBemxMoeda.FieldByName('CMBEM').AsFloat;
               bFlgPai  := True;
               //-------------------------------------------------------------------------
               FcdsBemxDep.First;
               while not FcdsBemxDep.EOF do
               begin
                  if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = nMoeda then
                  begin
                     nCotaDep := (nCusto + nCMCusto) * (FcdsBemxDep.FieldByName('TAXADEP').AsFloat / 100);
                     if not (FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO;IDTAXADEP',
                                                VarArrayOf([0,
                                                            FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                            FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[])) then
                     begin
                        FcdsCotaDep.Append;
                        FcdsCotaDep.FieldByName('IDREAVALIACAO').AsFloat := 0;
                        FcdsCotaDep.FieldByName('MOECODIGO').AsFloat     := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
                        FcdsCotaDep.FieldByName('IDTAXADEP').AsFloat     := FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat;
                        FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat      := nCusto;
                        FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat    := nCMCusto;
                        FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat    := nCotaDep;
                        FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat    := FcdsBemxDep.FieldByName('DEPLANC').AsFloat;
                        FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat  := FcdsBemxDep.FieldByName('CMDEP').AsFloat;
                        FcdsCotaDep.Post;
                        bFlgPai := False;
                     end else
                     begin
                        FcdsCotaDep.Edit;
                        if bFlgPai then
                        begin
                           FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat     := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat   + nCusto);
                           FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat   := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat + nCMCusto);
                           bFlgPai := False;
                        end;
                        FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat   := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat   + nCotaDep);
                        FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat   := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat   + FcdsBemxDep.FieldByName('DEPLANC').AsFloat);
                        FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat + FcdsBemxDep.FieldByName('CMDEP').AsFloat);
                        FcdsCotaDep.Post;
                     end;
                  end;
                  FcdsBemxDep.Next;
               end;
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsReavaliacao.First;
            while not FcdsReavaliacao.EOF do
            begin
               FcdsReavalxMoeda.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
               while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
               begin
                  nMoeda   := FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat;
                  nCusto   := FcdsReavalxMoeda.FieldByName('VALORG').AsFloat;
                  nCMCusto := FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat;
                  bFlgPai  := True;
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
                  while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
                  begin
                     if FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat = nMoeda then
                     begin
                        nCotaDep := (nCusto + nCMCusto) * (FcdsReavalxDep.FieldByName('TAXADEP').AsFloat / 100);
                        if not (FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO;IDTAXADEP',
                                                   VarArrayOf([1,
                                                               FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger]),[])) then
                        begin
                           FcdsCotaDep.Append;
                           FcdsCotaDep.FieldByName('IDREAVALIACAO').AsFloat := 1;
                           FcdsCotaDep.FieldByName('MOECODIGO').AsFloat     := FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat;
                           FcdsCotaDep.FieldByName('IDTAXADEP').AsFloat     := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsFloat;
                           FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat      := nCusto;
                           FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat    := nCMCusto;
                           FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat    := nCotaDep;
                           FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat    := FcdsReavalxDep.FieldByName('DEPLANC').AsFloat;
                           FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat  := FcdsReavalxDep.FieldByName('CMDEP').AsFloat;
                           FcdsCotaDep.Post;
                           bFlgPai := False;
                        end else
                        begin
                           FcdsCotaDep.Edit;
                           if bFlgPai then
                           begin
                              FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat + nCusto);
                              FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat + nCMCusto);
                              bFlgPai := False;
                           end;
                           FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat + nCotaDep);
                           FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat + FcdsReavalxDep.FieldByName('DEPLANC').AsFloat);
                           FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat + FcdsReavalxDep.FieldByName('CMDEP').AsFloat);
                           FcdsCotaDep.Post;
                        end;
                     end;
                     FcdsReavalxDep.Next;
                  end;
                  FcdsReavalxMoeda.Next;
               end;
               FcdsReavaliacao.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.First;
            while not FcdsAcrescimoValor.EOF do
            begin
               FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
               while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
               begin
                  nMoeda   := FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat;
                  nCusto   := FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat;
                  nCMCusto := FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat;
                  bFlgPai  := True;
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
                  while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
                  begin
                     if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat = nMoeda then
                     begin
                        nCotaDep := (nCusto + nCMCusto) * (FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat / 100);
                        if not (FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO;IDTAXADEP',
                                                   VarArrayOf([0,
                                                               FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger]),[])) then
                        begin
                           FcdsCotaDep.Append;
                           FcdsCotaDep.FieldByName('IDREAVALIACAO').AsFloat := 0;
                           FcdsCotaDep.FieldByName('MOECODIGO').AsFloat     := FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat;
                           FcdsCotaDep.FieldByName('IDTAXADEP').AsFloat     := FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat;
                           FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat      := nCusto;
                           FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat    := nCMCusto;
                           FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat    := nCotaDep;
                           FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat    := FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat;
                           FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat  := FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat;
                           FcdsCotaDep.Post;
                           bFlgPai := False;
                        end else
                        begin
                           FcdsCotaDep.Edit;
                           if bFlgPai then
                           begin
                              FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat     := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat     + nCusto);
                              FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat   := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat   + nCMCusto);
                              bFlgPai := False;
                           end;
                           FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat   := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat   + nCotaDep);
                           FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat   := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat   + FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat);
                           FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat := Bem.ConvNum(FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat + FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat);
                           FcdsCotaDep.Post;
                        end;
                     end;
                     FcdsAcrescValorxDep.Next;
                  end;
                  FcdsAcrescValorxMoeda.Next;
               end;
               FcdsAcrescimoValor.Next;
            end;
            //----------------------------------------------------------------------------

            sListaBem := sListaBem + cdsSelBens.FieldByName('IDBEM').AsString;    // Vando - SOL 154328-5901 / KTN 1373449

            FcdsSelBens.Next;

            if not FcdsSelBens.eof then sListaBem :=  sListaBem + ','  // Vando - SOL 154328-5901 / KTN 1373449

         end;

         // Vando - SOL 154328-5901 / KTN 1373449 - COMENTADO
         FcdsPlanoPatroxBem.Data := Bem.ListaPlanoPatroxBemMedia(nEmpresaProp, sListaBem);

         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil do Fechamento PróRata
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            nPlanilha := CafxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp,
                                                             nUsuario, datetostr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CafxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra na tabela HISTORICOMOVIMENTACAO a planilha gerada
            //----------------------------------------------------------------------------
            iHistMovBem := 0;
            while iHistMovBem <= ProRata.iaHistMovBem do
            begin
               if not HistMovBem.RegistraPlanHistMovBem(ProRata.aHistMovBem[iHistMovBem],nPlanilha) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               iHistMovBem := iHistMovBem + 1;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil do Remembramento
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
         //===============================================================================
         // Baixa dos Bens Selecionados
         //===============================================================================
         FcdsSelBens.First;
         while not FcdsSelBens.EOF do
         begin
            FcdsBem.Data := Bem.ListaBem(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            //----------------------------------------------------------------------------
            // Calcula a Proporcao a ser baixada
            //----------------------------------------------------------------------------
            if FcdsBem.FieldByName('PROPBAIXA').IsNull then
               nPropBaixa := 100
            else
               nPropBaixa := 100 - FcdsBem.FieldByName('PROPBAIXA').AsFloat;
            //----------------------------------------------------------------------------
            // Alimentando os DataSets Filhos com os dados do bem que será baixado
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,FcdsSelBens.FieldByName('IDBEM').AsFloat);
            //----------------------------------------------------------------------------
            // Realiza a baixa do custo de aquisicao
            //----------------------------------------------------------------------------
            nValContabB   := 0;
            nValContabCM  := 0;
            nValContabD   := 0;
            nValContabCMD := 0;
            //----------------------------------------------------------------------------
            nSeqHist := 0;
            bPrimMov := True;
            FcdsBemxMoeda.First;
            while not FcdsBemxMoeda.EOF do
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                            16,                                      // IDTIPOMOVIMENTACAO
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
                                                            'Baixa para Remembramento');             // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               nBaixaB  := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       nBaixaB) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em BemxMoeda
               //-------------------------------------------------------------------------
               FcdsBemxMoeda.Edit;
               FcdsBemxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
               FcdsBemxMoeda.Post;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  nValContabB  := nBaixaB;
               //-------------------------------------------------------------------------
               FcdsBemxMoeda.Next;
            end;
            if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
               Raise Exception.Create(_dbBemxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            // Realiza a baixa da CM do custo de aquisicao
            //----------------------------------------------------------------------------
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
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                                                                   0,                                       // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                     // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                             0,
                                                             nBaixaCM) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em BemxMoeda
                     //-------------------------------------------------------------------
                     FcdsBemxMoeda.Edit;
                     FcdsBemxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                     FcdsBemxMoeda.Post;
                     //-------------------------------------------------------------------
                     // Captura valor para Contabilização se for MoedaOficial
                     //-------------------------------------------------------------------
                     if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                        nValContabCM := nBaixaCM;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsBemxMoeda.Next;
            end;
            if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
               Raise Exception.Create(_dbBemxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            // Realiza a baixa da Depreciação do Custo de Aquisicao
            //----------------------------------------------------------------------------
            bPrimMov := True;
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               nBaixaD := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
               //-------------------------------------------------------------------------
               if nBaixaD <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
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
                                                                0,                                     // VALVENDAOFI
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
                                                          nBaixaD) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a Baixa em BemxDep
                  //----------------------------------------------------------------------
                  FcdsBemxDep.Edit;
                  FcdsBemxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
                  FcdsBemxDep.Post;
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     nValContabD := nBaixaD;
               end;
               //-------------------------------------------------------------------------
               FcdsBemxDep.Next;
            end;
            if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
               Raise Exception.Create(_dbBemxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Realiza a baixa da CM da Depreciação do Custo de Aquisicao
            //----------------------------------------------------------------------------
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
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                                  26,                                      // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                              // DATAMOVIMENTACAO
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
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                     // OBSBAIXA
                        if nSeqHist = -1 then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                             nBaixaCMD) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em BemxDep
                     //-------------------------------------------------------------------
                     FcdsBemxDep.Edit;
                     FcdsBemxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                     FcdsBemxDep.Post;
                     //-------------------------------------------------------------------
                     // Captura valor para Contabilização se for MoedaOficial
                     //-------------------------------------------------------------------
                     if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                        nValContabCMD := nBaixaCMD;
                  end;
               end;
               //-------------------------------------------------------------------------
               FcdsBemxDep.Next;
            end;
            if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
               Raise Exception.Create(_dbBemxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Lançamento Contábil da Baixa do Bem
            //----------------------------------------------------------------------------
            if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
            begin
               if not CafxContab.ContabilizaRemembramento(nModulo, nEmpresaProp,
                                                          FcdsBem.FieldByName('IDBEM').AsFloat,
                                                          dDataMov,
                                                          FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                          nGrupo,                                           // iIdGrupoFilho
                                                          FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                          sDescGrupo,                                      // iIdGrupoFilho
                                                          FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                          nConjunto,                                       // iIdConjuntoFilho
                                                          FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                          sCentroCusto,                                    // iIdConjuntoFilho
                                                          FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                          FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                          'B',
                                                          nValContabB, nValContabCM,
                                                          nValContabD, nValContabCMD,
                                                          FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                          sDescBem,                                        // Descrição do Filho
                                                          FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                          FloattoStr(nPlaca),                              // Placa do Filho
                                                          iExercicio, iPeriodo, bCtaxCCusto) then
                  Raise Exception.Create(CafxContab.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Registra as alteracoes nos Flags de Controle
            //----------------------------------------------------------------------------
            FcdsBem.Edit;
            FcdsBem.FieldByName('PROPBAIXA').AsFloat := FcdsBem.FieldByName('PROPBAIXA').AsFloat + nPropBaixa;
            if FcdsBem.FieldByName('PROPBAIXA').AsFloat < 100 then
               FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N'
            else
               FcdsBem.FieldByName('BAIXATOTAL').AsString := 'S';
            FcdsBem.Post;
            if not ApplyCds(FcdsBem,_dbBem,[],[]) then
               Raise Exception.Create(_dbBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Realiza a Baixa das REAVALIACOES
            //----------------------------------------------------------------------------
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
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
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
                                                             nBaixaB) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em ReavalxMoeda
                     //-------------------------------------------------------------------
                     FcdsReavalxMoeda.Edit;
                     FcdsReavalxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
                     FcdsReavalxMoeda.Post;
                     //-------------------------------------------------------------------
                     if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     begin
                        //----------------------------------------------------------------
                        // Lançamento Contábil da Baixa das Reavaliações
                        //----------------------------------------------------------------
                        if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
                        begin
                           if not CafxContab.ContabilizaRemembramento(nModulo, nEmpresaProp,
                                                                      FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                      dDataMov,
                                                                      FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                      nGrupo,                                          // iIdGrupoFilho
                                                                      FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                      sDescGrupo,                                      // iIdGrupoFilho
                                                                      FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                      nConjunto,                                       // iIdConjuntoFilho
                                                                      FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                      sCentroCusto,                                    // iIdConjuntoFilho
                                                                      FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                      FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                      'R',
                                                                      nBaixaB, 0, 0, 0,
                                                                      FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                      sDescBem,                                        // Descrição do Filho
                                                                      FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                      FloattoStr(nPlaca),                              // Placa do Filho
                                                                      iExercicio, iPeriodo, bCtaxCCusto) then
                              Raise Exception.Create(CafxContab.MessageInfo);
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsReavalxMoeda.Next;
               end;
               if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
                  Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsReavaliacao.Next
            end;
            //----------------------------------------------------------------------------
            // Realiza a Baixa das CM Reavaliações
            //----------------------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           // Registra na tabela HISTORICOMOVIMENTACAO
                           //-------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           bPrimMov := False;
                        end;
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                                0,
                                                                nBaixaCM) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra a Baixa em ReavalxMoeda
                        //----------------------------------------------------------------
                        FcdsReavalxMoeda.Edit;
                        FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                        FcdsReavalxMoeda.Post;
                        //----------------------------------------------------------------
                        if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                        begin
                           //-------------------------------------------------------------
                           // Lançamento Contábil da Baixa das Reavaliações
                           //-------------------------------------------------------------
                           if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
                           begin
                              if not CafxContab.ContabilizaRemembramento(nModulo, nEmpresaProp,
                                                                         FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                         dDataMov,
                                                                         FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                         nGrupo,                                           // iIdGrupoFilho
                                                                         FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                         sDescGrupo,                                      // iIdGrupoFilho
                                                                         FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                         nConjunto,                                       // iIdConjuntoFilho
                                                                         FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                         sCentroCusto,                                    // iIdConjuntoFilho
                                                                         FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                         FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                         'R',
                                                                         0, nBaixaCM, 0, 0,
                                                                         FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                         sDescBem,                                        // Descrição do Filho
                                                                         FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                         FloattoStr(nPlaca),                              // Placa do Filho
                                                                         iExercicio, iPeriodo, bCtaxCCusto) then
                                 Raise Exception.Create(CafxContab.MessageInfo);
                           end;
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsReavalxMoeda.Next;
               end;
               if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
                  Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsReavaliacao.Next;
            end;
            //----------------------------------------------------------------------------
            // Realiza a baixa da Depreciação da Reavaliacao
            //----------------------------------------------------------------------------
            FcdsReavaliacao.First;
            while not FcdsReavaliacao.EOF do
            begin
               bPrimMov := True;
               FcdsReavalxDep.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
               while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
               begin
                  nBaixaD := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').asFloat) * (nPropBaixa / 100);
                  //----------------------------------------------------------------------
                  if nBaixaD <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                             nBaixaD) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em ReavalxDep
                     //-------------------------------------------------------------------
                     FcdsReavalxDep.Edit;
                     FcdsReavalxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
                     FcdsReavalxDep.Post;
                     //-------------------------------------------------------------------
                     if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     begin
                        //----------------------------------------------------------------
                        // Lançamento Contábil da Baixa das Reavaliações
                        //----------------------------------------------------------------
                        if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
                        begin
                           if not CafxContab.ContabilizaRemembramento(nModulo, nEmpresaProp,
                                                                      FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                      dDataMov,
                                                                      FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                      nGrupo,                                           // iIdGrupoFilho
                                                                      FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                      sDescGrupo,                                      // iIdGrupoFilho
                                                                      FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                      nConjunto,                                       // iIdConjuntoFilho
                                                                      FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                      sCentroCusto,                                    // iIdConjuntoFilho
                                                                      FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                      FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                      'R',
                                                                      0, 0, nBaixaD, 0,
                                                                      FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                      sDescBem,                                        // Descrição do Filho
                                                                      FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                      FloattoStr(nPlaca),                              // Placa do Filho
                                                                      iExercicio, iPeriodo, bCtaxCCusto) then
                              Raise Exception.Create(CafxContab.MessageInfo);
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Next;
               end;
               if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
                  Raise Exception.Create(_dbReavalxDep.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsReavaliacao.Next;
            end;
            //----------------------------------------------------------------------------
            // Realiza a baixa da CM da Depreciação da Reavaliacao
            //----------------------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           // Registra na tabela HISTORICOMOVIMENTACAO
                           //-------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           bPrimMov := False;
                        end;
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                                nBaixaCMD) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra a Baixa em ReavalxDep
                        //----------------------------------------------------------------
                        FcdsReavalxDep.Edit;
                        FcdsReavalxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                        FcdsReavalxDep.Post;
                        //----------------------------------------------------------------
                        if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                        begin
                           //-------------------------------------------------------------
                           // Lançamento Contábil da Baixa das Reavaliações
                           //-------------------------------------------------------------
                           if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
                           begin
                              if not CafxContab.ContabilizaRemembramento(nModulo, nEmpresaProp,
                                                                         FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                         dDataMov,
                                                                         FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                         nGrupo,                                           // iIdGrupoFilho
                                                                         FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                         sDescGrupo,                                      // iIdGrupoFilho
                                                                         FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                         nConjunto,                                       // iIdConjuntoFilho
                                                                         FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                         sCentroCusto,                                    // iIdConjuntoFilho
                                                                         FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                         FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                         'R',
                                                                         0, 0, 0, nBaixaCMD,
                                                                         FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                         sDescBem,                                        // Descrição do Filho
                                                                         FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                         FloattoStr(nPlaca),                              // Placa do Filho
                                                                         iExercicio, iPeriodo, bCtaxCCusto) then
                                 Raise Exception.Create(CafxContab.MessageInfo);
                           end;
                        end;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Next;
               end;
               if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
                  Raise Exception.Create(_dbReavalxDep.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsReavaliacao.Next;
            end;
            //----------------------------------------------------------------------------
            // Baixa o custo dos acrescimos de valor
            //----------------------------------------------------------------------------
            nValContabB   := 0;
            nValContabCM  := 0;
            nValContabD   := 0;
            nValContabCMD := 0;
            //----------------------------------------------------------------------------
            FcdsAcrescimoValor.First;
            while not FcdsAcrescimoValor.EOF do
            begin
               bPrimMov := True;
               FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
               while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
               begin
                  nBaixaB := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat) * (nPropBaixa / 100);
                  if nBaixaB <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                     // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,                  // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,                  // IDMODULO
                                                                  37,                                                       // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                                 // DATAMOVIMENTACAO
                                                                  FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                                  -1,                                                       // DATAULTDEP
                                                                  -1,                                                       // IDGRUPANT
                                                                  -1,                                                       // IDCONJANT
                                                                  -1,                                                       // IDLOCALANT
                                                                  -1,                                                       // IDRESPANT
                                                                  -1,                                                       // PLACAANT
                                                                  -1,                                                       // PLNCODIGO
                                                                  '',                                                       // OBSREAVAL
                                                                   0,                                                       // TIPDEPPRORATA
                                                                  -1,                                                       // IDTIPODESPESA
                                                                  '',                                                       // OBSACRESCIMO
                                                                  -1,                                                       // IDMOTIVOBAIXA
                                                                   0,                                                       // PROPBAIXA
                                                                   0,                                     // VALVENDAOFI
                                                                  '');                                                      // OBSBAIXA
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
                                                             nBaixaB) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em AcrescValorxMoeda
                     //-------------------------------------------------------------------
                     FcdsAcrescValorxMoeda.Edit;
                     FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat - nBaixaB);
                     FcdsAcrescValorxMoeda.Post;
                     //-------------------------------------------------------------------
                     // Captura valor para Contabilização se for MoedaOficial
                     //-------------------------------------------------------------------
                     if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                        nValContabB := nValContabB + nBaixaB;
                  end;
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxMoeda.Next;
               end;
               if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
                  Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsAcrescimoValor.Next;
            end;   
            //----------------------------------------------------------------------------
            // Baixa da CM do custo dos acrescimos de valor
            //----------------------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           // Registra na tabela HISTORICOMOVIMENTACAO
                           //-------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           bPrimMov := False;
                        end;
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                                0,
                                                                nBaixaCM) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra a Baixa em AcrescValorxMoeda
                        //----------------------------------------------------------------
                        FcdsAcrescValorxMoeda.Edit;
                        FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                        FcdsAcrescValorxMoeda.Post;
                        //----------------------------------------------------------------
                        // Captura valor para Contabilização se for MoedaOficial
                        //----------------------------------------------------------------
                        if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                           nValContabCM := nValContabCM + nBaixaCM;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxMoeda.Next;
               end;
               if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
                  Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsAcrescimoValor.Next;
            end;
            //----------------------------------------------------------------------------
            // Realiza a baixa da Depreciação dos Acrescimos de Valor
            //----------------------------------------------------------------------------
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
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
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
                        //----------------------------------------------------------------
                        bPrimMov := False;
                     end;
                     //-------------------------------------------------------------------
                     // Registra o valor no histórico
                     //-------------------------------------------------------------------
                     if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                             FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                             FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                             nBaixaD) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em AcrescValorxDep
                     //-------------------------------------------------------------------
                     FcdsAcrescValorxDep.Edit;
                     FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
                     FcdsAcrescValorxDep.Post;
                     //-------------------------------------------------------------------
                     // Captura valor para Contabilização se for MoedaOficial
                     //-------------------------------------------------------------------
                     if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                        nValContabD := nValContabD + nBaixaD;
                  end;
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Next;
               end;
               if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep, [], []) then
                  Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsAcrescimoValor.Next;
            end;
            //----------------------------------------------------------------------------
            // Realiza a baixa da CM da Depreciação dos Acrescimos de Valor
            //----------------------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           // Registra na tabela HISTORICOMOVIMENTACAO
                           //-------------------------------------------------------------
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
                           //-------------------------------------------------------------
                           bPrimMov := False;
                        end;
                        //----------------------------------------------------------------
                        // Registra o valor no histórico
                        //----------------------------------------------------------------
                        if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                nBaixaCMD) then
                           Raise Exception.Create(HistMovBem.MessageInfo);
                        //----------------------------------------------------------------
                        // Registra a Baixa em AcrescValorxDep
                        //----------------------------------------------------------------
                        FcdsAcrescValorxDep.Edit;
                        FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat - nBaixaCMD);
                        FcdsAcrescValorxDep.Post;
                        //----------------------------------------------------------------
                        // Captura valor para Contabilização se for MoedaOficial
                        //----------------------------------------------------------------
                        if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                           nValContabCMD := nValContabCMD + nBaixaCMD;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Next;
               end;
               if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep, [], []) then
                  Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsAcrescimoValor.Next;
            end;
            //----------------------------------------------------------------------------
            // Lançamento Contábil da Baixa dos Acréscimos
            //----------------------------------------------------------------------------
            if bIntegraContab and (FcdsBem.FieldByName('CONTROLE').AsString = 'T') then
            begin
               if not CafxContab.ContabilizaRemembramento(nModulo, nEmpresaProp,
                                                          FcdsBem.FieldByName('IDBEM').AsFloat,
                                                          dDataMov,
                                                          FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                          nGrupo,                                           // iIdGrupoFilho
                                                          FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                          sDescGrupo,                                      // iIdGrupoFilho
                                                          FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                          nConjunto,                                       // iIdConjuntoFilho
                                                          FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                          sCentroCusto,                                    // iIdConjuntoFilho
                                                          FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                          FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                          'A',
                                                          nValContabB, nValContabCM,
                                                          nValContabD, nValContabCMD,
                                                          FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                          sDescBem,                                        // Descrição do Filho
                                                          FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                          FloattoStr(nPlaca),                              // Placa do Filho
                                                          iExercicio, iPeriodo, bCtaxCCusto) then
                  Raise Exception.Create(CafxContab.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsSelBens.Next;
         end;
         //===============================================================================
         // Entrada do Novo Bem
         //===============================================================================
         FcdsNBemxMoeda.First;
         while not FcdsNBemxMoeda.EOF do
         begin
            if FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO',
                                  VarArrayOf([0,
                                              FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]) then
            begin
               FcdsNBemxMoeda.Edit;
               FcdsNBemxMoeda.FieldByName('IDBEM').Clear;
               FcdsNBemxMoeda.FieldByName('VALORG').AsFloat := FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat;
               FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat  := FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat;
               FcdsNBemxMoeda.Post;
            end else
            begin
               FcdsNBemxMoeda.Edit;
               FcdsNBemxMoeda.FieldByName('IDBEM').Clear;
               FcdsNBemxMoeda.FieldByName('VALORG').AsFloat := 0;
               FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat  := 0;
               FcdsNBemxMoeda.Post;
            end;
            FcdsNBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza os dados que irão para a Tabela BemxDep
         //-------------------------------------------------------------------------------
         FcdsNBemxDep.First;
         while not FcdsNBemxDep.EOF do
         begin
            if FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO;IDTAXADEP',
                                  VarArrayOf([0,
                                              FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                              FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[]) then
            begin
               if (FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat +
                   FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat) <> 0 then
                  nCotaDep := (FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat /
                              (FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat +
                               FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat)) * 100
               else
                  nCotaDep := 0;
               //-------------------------------------------------------------------------
               FcdsNBemxDep.Edit;
               FcdsNBemxDep.FieldByName('IDBEM').Clear;
               FcdsNBemxDep.FieldByName('TAXADEP').AsFloat := nCotaDep;
               FcdsNBemxDep.FieldByName('DEPLANC').AsFloat := FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat;
               FcdsNBemxDep.FieldByName('CMDEP').AsFloat   := FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat;
               FcdsNBemxDep.Post;
            end else
            begin
               nCotaDep := 0;
               FcdsNBemxDep.Edit;
               FcdsNBemxDep.FieldByName('IDBEM').Clear;
               FcdsNBemxDep.FieldByName('TAXADEP').AsFloat := nCotaDep;
               FcdsNBemxDep.FieldByName('DEPLANC').AsFloat := 0;
               FcdsNBemxDep.FieldByName('CMDEP').AsFloat   := 0;
               FcdsNBemxDep.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsNBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados do novo bem nas tabelas
         // BEM, BEMXMOEDA, BEMXDEP, PLANOPATROXBEM
         //-------------------------------------------------------------------------------
         CdsToDbObject(FcdsNBem, _dbBem);
         if not _dbBem.InsertAs(0) then
            Raise Exception.Create(_dbBem.MessageInfo);
         //-------------------------------------------------------------------------------
         FcdsNBemxMoeda.First;
         while not FcdsNBemxMoeda.EOF do
         begin
            CdsToDbObject(FcdsNBemxMoeda, _dbBemxMoeda);
            _dbBemxMoeda.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
            if not _dbBemxMoeda.Insert then
               Raise Exception.Create(_dbBemxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsNBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsNBemxDep.First;
         while not FcdsNBemxDep.EOF do
         begin
            CdsToDbObject(FcdsNBemxDep,_dbBemxDep);
            _dbBemxDep.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
            if not _dbBemxDep.Insert then
               Raise Exception.Create(_dbBemxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsNBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsPlanoPatroxBem.First;
         while not FcdsPlanoPatroxBem.EOF do
         begin
            CdsToDbObject(FcdsPlanoPatroxBem,_dbPlanoPatroxBem);
            _dbPlanoPatroxBem.IDBEM.AsFloat := _dbBem.IdBem.AsFloat;
            if not _dbPlanoPatroxBem.Insert then
               Raise Exception.Create(_dbPlanoPatroxBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsPlanoPatroxBem.Next;
         end;
         //-------------------------------------------------------------------------------
         // Preenche a propriedade IdBem para uso no Investimob
         //-------------------------------------------------------------------------------
         FIdBem := _dbBem.IDBEM.AsInteger;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Entrada do Bem por Remembramento
         //-------------------------------------------------------------------------------
         nSeqHist := 0;
         bPrimMov := True;
         FcdsNBemxMoeda.First;
         while not FcdsNBemxMoeda.EOF do
         begin
            if bPrimMov then
            begin
               nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                           // IDBEM
                                                         _dbBem.IDPESSOA.AsFloat,                        // IDPESSOA
                                                         _dbBem.IDMODULO.AsFloat,                        // IDMODULO
                                                         10,                                             // IDTIPOMOVIMENTACAO
                                                         _dbBem.DTAINCLUSAO.AsDateTime,                  // DATAMOVIMENTACAO
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
               //-------------------------------------------------------------------------
               // Registra os bens baixados na Tabela REMEMBRAMENTO
               //-------------------------------------------------------------------------
               FcdsSelBens.First;
               while not FcdsSelBens.EOF do
               begin
                  if not HistMovBem.RegistraRemembramento(nSeqHist,
                                                          FcdsSelBens.FieldByName('IDBEM').AsFloat,0) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsSelBens.Next;
               end;
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    FcdsNBemxMoeda.FieldByName('VALORG').AsFloat) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsNBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria
         //-------------------------------------------------------------------------------
         nSeqHist := 0;
         bPrimMov := True;
         FcdsNBemxMoeda.First;
         while not FcdsNBemxMoeda.EOF do
         begin
            if FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat <> 0 then
            begin
               if bPrimMov then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                            _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                            _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                            15,                            // IDTIPOMOVIMENTACAO
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
                                                             9,                            // TIPDEPPRORATA
                                                            -1,                            // IDTIPODESPESA
                                                            '',                            // OBSACRESCIMO
                                                            -1,                            // IDMOTIVOBAIXA
                                                             0,                            // PROPBAIXA
                                                             0,                                     // VALVENDAOFI
                                                            '');                           // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra na tabela VLRHISTMOVBEM
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       FcdsNBemxMoeda.FieldByName('CMBEM').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsNBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação
         //-------------------------------------------------------------------------------
         nSeqHist := 0;
         bPrimMov := True;
         FcdsNBemxDep.First;
         while not FcdsNBemxDep.EOF do
         begin
            if FcdsNBemxDep.FieldByName('DEPLANC').AsFloat <> 0 then
            begin
               if bPrimMov then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                            _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                            _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                            17,                            // IDTIPOMOVIMENTACAO
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
                                                             0,                            // TIPDEPPRORATA
                                                            -1,                            // IDTIPODESPESA
                                                            '',                            // OBSACRESCIMO
                                                            -1,                            // IDMOTIVOBAIXA
                                                             0,                            // PROPBAIXA
                                                             0,                            // VALVENDAOFI
                                                            '');                           // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                       FcdsNBemxDep.FieldByName('DEPLANC').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsNBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação
         //-------------------------------------------------------------------------------
         nSeqHist := 0;
         bPrimMov := True;
         FcdsNBemxDep.First;
         while not FcdsNBemxDep.EOF do
         begin
            if FcdsNBemxDep.FieldByName('CMDEP').AsFloat <> 0 then
            begin
               if bPrimMov then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,          // IDBEM
                                                            _dbBem.IDPESSOA.AsFloat,       // IDPESSOA
                                                            _dbBem.IDMODULO.AsFloat,       // IDMODULO
                                                            21,                            // IDTIPOMOVIMENTACAO
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
                                                             9,                            // TIPDEPPRORATA
                                                            -1,                            // IDTIPODESPESA
                                                            '',                            // OBSACRESCIMO
                                                            -1,                            // IDMOTIVOBAIXA
                                                             0,                            // PROPBAIXA
                                                             0,                            // VALVENDAOFI
                                                            '');                           // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                       FcdsNBemxDep.FieldByName('CMDEP').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsNBemxDep.Next;
         end;
         //===============================================================================
         // Registra o Saldo de Reavaliações
         //===============================================================================
         FcdsNReavaliacao.Data  := Bem.ListaReavaliacao(nEmpresaProp, 0);
         FcdsNReavalxMoeda.Data := Bem.ListaReavalxMoeda(nEmpresaProp, 0);
         FcdsNReavalxDep.Data   := Bem.ListaReavalxDep(nEmpresaProp, 0);
         //-------------------------------------------------------------------------------
         // Inicializa Dados Reavaliacao
         //-------------------------------------------------------------------------------
         FcdsNReavaliacao.Append;
         FcdsNReavaliacao.FieldByName('IDBEM').AsFloat := _dbBem.IDBEM.AsFloat;
         FcdsNReavaliacao.FieldByName('IDPESSOA').AsFloat := _dbBem.IDPESSOA.AsFloat;
         FcdsNReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime := dDataMov;
         FcdsNReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 1;
         FcdsNReavaliacao.Post;
         //-------------------------------------------------------------------------------
         CdsToDbObject(FcdsNReavaliacao,_dbReavaliacao);
         if not _dbReavaliacao.Insert then
            Raise Exception.Create(_dbReavaliacao.MessageInfo);
         //-------------------------------------------------------------------------------
         // Inicializa Dados ReavalxMoeda
         //-------------------------------------------------------------------------------
         FcdsNBemxMoeda.First;
         while not FcdsNBemxMoeda.EOF do
         begin
            if FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO',
                                  VarArrayOf([1,
                                              FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]) then
            begin
               FcdsNReavalxMoeda.Append;
               FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
               FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsFloat := FcdsNBemxMoeda.FieldByName('MOECODIGO').AsFloat;
               FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat := FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat;
               FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat  := FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat;
               FcdsNReavalxMoeda.FieldByName('DATAULTCM').AsDateTime := dDataMov;
               FcdsNReavalxMoeda.Post;
            end else
            begin
               FcdsNReavalxMoeda.Append;
               FcdsNReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
               FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsFloat := FcdsNBemxMoeda.FieldByName('MOECODIGO').AsFloat;
               FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat := 0;
               FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat  := 0;
               FcdsNReavalxMoeda.FieldByName('DATAULTCM').AsDateTime := dDataMov;
               FcdsNReavalxMoeda.Post;
            end;
            FcdsNBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Inicializa Dados ReavalxDep
         //-------------------------------------------------------------------------------
         FcdsNBemxDep.First;
         while not FcdsNBemxDep.EOF do
         begin
            if FcdsCotaDep.Locate('IDREAVALIACAO;MOECODIGO;IDTAXADEP',
                                  VarArrayOf([1,
                                              FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                              FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger]),[]) then
            begin
               if (FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat +
                   FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat) <> 0 then
                  nCotaDep := (FcdsCotaDep.FieldByName('SUMCOTADEP').AsFloat /
                              (FcdsCotaDep.FieldByName('SUMCUSTO').AsFloat +
                               FcdsCotaDep.FieldByName('SUMCMCUSTO').AsFloat)) * 100
               else
                  nCotaDep := 0;
               //-------------------------------------------------------------------------
               FcdsNReavalxDep.Append;
               FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
               FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat     := FcdsNBemxDep.FieldByName('MOECODIGO').AsFloat;
               FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat  := FcdsNBemxDep.FieldByName('IDBEMXDEP').AsFloat;
               FcdsNReavalxDep.FieldByName('TAXADEP').AsFloat       := nCotaDep;
               FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat       := FcdsCotaDep.FieldByName('SUMDEPACUM').AsFloat;
               FcdsNReavalxDep.FieldByName('CMDEP').AsFloat         := FcdsCotaDep.FieldByName('SUMCMDEPACUM').AsFloat;
               FcdsNReavalxDep.FieldByName('DATAULTCM').AsDateTime  := dDataMov;
               FcdsNReavalxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               FcdsNReavalxDep.FieldByName('FLGDEPREC').AsInteger   := 0;
               FcdsNReavalxDep.Post;
            end else
            begin
               nCotaDep := 0;
               FcdsNReavalxDep.Append;
               FcdsNReavalxDep.FieldByName('IDREAVALIACAO').AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
               FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat     := FcdsNBemxDep.FieldByName('MOECODIGO').AsFloat;
               FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat  := FcdsNBemxDep.FieldByName('IDBEMXDEP').AsFloat;
               FcdsNReavalxDep.FieldByName('TAXADEP').AsFloat       := nCotaDep;
               FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat       := 0;
               FcdsNReavalxDep.FieldByName('CMDEP').AsFloat         := 0;
               FcdsNReavalxDep.FieldByName('DATAULTCM').AsDateTime  := dDataMov;
               FcdsNReavalxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               FcdsNReavalxDep.FieldByName('FLGDEPREC').AsInteger   := 1;
               FcdsNReavalxDep.Post;
            end;
            //----------------------------------------------------------------------------
            FcdsNBemxDep.Next;
         end;
         //===============================================================================
         // Gravação dos dados nas tabelas REAVALXMOEDA e REAVALXDEP
         //===============================================================================
         FcdsNReavalxMoeda.First;
         while not FcdsNReavalxMoeda.EOF do
         begin
            CdsToDbObject(FcdsNReavalxMoeda,_dbReavalxMoeda);
            _dbReavalxMoeda.IDREAVALIACAO.AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
            if not _dbReavalxMoeda.Insert then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsNReavalxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsNReavalxDep.First;
         while not FcdsNReavalxDep.EOF do
         begin
            CdsToDbObject(FcdsNReavalxDep,_dbReavalxDep);
            _dbReavalxDep.IDREAVALIACAO.AsFloat := _dbReavaliacao.IDREAVALIACAO.AsFloat;
            if not _dbReavalxDep.Insert then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsNReavalxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico do Saldo de Reavaliacao
         //-------------------------------------------------------------------------------
         nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                      // IDBEM
                                                   _dbBem.IDPESSOA.AsFloat,                   // IDPESSOA
                                                   _dbBem.IDMODULO.AsFloat,                   // IDMODULO
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
                                                   'ENTRADA POR REMEMBRAMENTO',               // OBSREAVAL
                                                    0,                                        // TIPDEPPRORATA
                                                   -1,                                        // IDTIPODESPESA
                                                   '',                                        // OBSACRESCIMO
                                                   -1,                                        // IDMOTIVOBAIXA
                                                    0,                                        // PROPBAIXA
                                                    0,                                        // VALVENDAOFI
                                                   '');                                       // OBSBAIXA
         if nSeqHist = -1 then
            Raise Exception.Create(HistMovBem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra o Id da Movimentacao em REAVALIACAO
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE REAVALIACAO ' +
                 ' SET IDMOVIMENTACAO = ' + FloattoStr(nSeqHist) +
                 ' WHERE IDREAVALIACAO = ' + FloattoStr(_dbReavaliacao.IDREAVALIACAO.AsFloat);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Registra na tabela VLRHISTMOVBEM
         //-------------------------------------------------------------------------------
         FcdsNReavalxMoeda.First;
         while not FcdsNReavalxMoeda.EOF do
         begin
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsNReavalxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria
         //-------------------------------------------------------------------------------
         nSeqHist := -1;
         FcdsNReavalxMoeda.First;
         while not FcdsNReavalxMoeda.EOF do
         begin
            if FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
            begin
               if FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat <> 0 then
               begin
                  nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                     // IDBEM
                                                            _dbBem.IDPESSOA.AsFloat,                  // IDPESSOA
                                                            _dbBem.IDMODULO.AsFloat,                  // IDMODULO
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
                                                             0,                                       // VALVENDAOFI
                                                            '');                                      // OBSBAIXA
                  if nSeqHist = -1 then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
            end;
            FcdsNReavalxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra na tabela VLRHISTMOVBEM
         //-------------------------------------------------------------------------------
         if nSeqHist <> -1 then
         begin
            FcdsNReavalxMoeda.First;
            while not FcdsNReavalxMoeda.EOF do
            begin
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       FcdsNReavalxMoeda.FieldByName('CMBEM').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               FcdsNReavalxMoeda.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação
         //-------------------------------------------------------------------------------
         nSeqHist := -1;
         FcdsNReavalxDep.First;
         while not FcdsNReavalxDep.EOF do
         begin
            if FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
            begin
               if FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat = 1 then
               begin
                  if FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat <> 0 then
                  begin
                     nSeqHist := HistMovBem.RegistraHistMovBem(_dbBem.IDBEM.AsFloat,                     // IDBEM
                                                               _dbBem.IDPESSOA.AsFloat,                  // IDPESSOA
                                                               _dbBem.IDMODULO.AsFloat,                  // IDMODULO
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
                                                                0,                                       // VALVENDAOFI
                                                               '');                                      // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                  end;

               end;
            end;
            FcdsNReavalxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra na tabela VLRHISTMOVBEM
         //-------------------------------------------------------------------------------
         if nSeqHist <> -1 then
         begin
            FcdsNReavalxDep.First;
            while not FcdsNReavalxDep.EOF do
            begin
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       FcdsNReavalxDep.FieldByName('DEPLANC').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------   
               FcdsNReavalxDep.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação
         //-------------------------------------------------------------------------------
         nSeqHist := -1;
         FcdsNReavalxDep.First;
         while not FcdsNReavalxDep.EOF do
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
                                                                0,                                       // VALVENDAOFI
                                                               '');                                      // OBSBAIXA
                     if nSeqHist = -1 then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                  end;
               end;
            end;
            FcdsNReavalxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra na tabela VLRHISTMOVBEM
         //-------------------------------------------------------------------------------
         if nSeqHist <> -1 then
         begin
            FcdsNReavalxDep.First;
            while not FcdsNReavalxDep.EOF do
            begin
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsNReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                       FcdsNReavalxDep.FieldByName('CMDEP').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------   
               FcdsNReavalxDep.Next;
            end;
         end;
         //===============================================================================
         // Encerra Contabilização do Remembramento
         //===============================================================================
         if bIntegraContab then
         begin
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
                       ' WHERE IDBEM = ' + floattostr(_dbBem.IDBEM.AsFloat) +
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
               FcdsSelBens.First;
               while not FcdsSelBens.EOF do
               begin
                  sSql := ' SELECT IDMOVIMENTACAO ' +
                          ' FROM HISTORICOMOVIMENTACAO ' +
                          ' WHERE IDBEM = ' + floattostr(FcdsSelBens.FieldByName('IDBEM').AsFloat) +
                          '   AND IDTIPOMOVIMENTACAO = 16 ' +
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
                  FcdsSelBens.Next;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM do Bem Gerado pelo Remembramento
         //-------------------------------------------------------------------------------
         FcdsNBemxMoeda.First;
         while not FcdsNBemxMoeda.EOF do
         begin
            FcdsNBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsNBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
            iFlgPai := 1;
            while (not FcdsNBemxDep.EOF) and (FcdsNBemxDep.FieldByName('MOECODIGO').AsFloat =
                                              FcdsNBemxMoeda.FieldByName('MOECODIGO').AsFloat) do
            begin
               if not Bem.AtualizaSaldoContabBem(_dbBem.IDPESSOA.AsInteger,
                                                 _dbBem.IDBEM.AsInteger,
                                                 dDataMov,
                                                 FcdsNBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                 FcdsNBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 0, 0, 0, 0,
                                                 iGrupo, iLocalizacao, iResponsavel,
                                                 _dbBem.IDCONJUNTO.AsInteger,
                                                 _dbBem.UNIDNEGOC.AsInteger,
                                                 2, iFlgPai) then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               //-------------------------------------------------------------------------
               FcdsNBemxDep.Next;
            end;
            FcdsNBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM dos Bens Baixados pelo Remembramento
         //-------------------------------------------------------------------------------
         FcdsSelBens.First;
         while not FcdsSelBens.EOF do
         begin
            FcdsBem.Data       := Bem.ListaBem(nEmpresaProp, FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsBemxMoeda.Data := Bem.ListaBemxMoeda(nEmpresaProp, FcdsSelBens.FieldByName('IDBEM').AsFloat);
            FcdsBemxDep.Data   := Bem.ListaBemxDep(nEmpresaProp, FcdsSelBens.FieldByName('IDBEM').AsFloat);
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
                  //----------------------------------------------------------------------
                  iFlgPai := 0;
                  FcdsBemxDep.Next;
               end;
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsSelBens.Next;
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
//========================================================================================
// Estorna o Remembramento de um bem
//========================================================================================
function TCtrlMovRemembramento.EstornaRemembramento(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                    dDataMov, dDataEst: TDateTime): Boolean;
var
   iExercicio, iPeriodo, iTotPlan,
   iFlgPai, iPlan                    : Integer;
   sSql                              : String;
   bRemovePlanContab, bPrimBem       : Boolean;
   aPlanilha                         : Array of Extended;
   nPlnCodigo                        : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaRemembramento(nModulo, nEmpresaProp, nUsuario, nBem,
                                                          dDataMov, dDataEst);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM no Bem Gerado
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao Bem Novo estão incorretos!'));
         //-------------------------------------------------------------------------------
         if nModulo <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer o código do MODULO!'))
         else
            if nModulo <> FcdsBem.FieldByName('IDMODULO').AsFloat then
               Raise Exception.Create(CMTranslate('Somente o módulo que cadastrou o Bem Novo pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem Novo!'))
         else
            if nEmpresaProp <> FcdsBem.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o Bem Novo pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         if FcdsBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate('Bem novo em Saída Temporária!');
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
         // verifica se ja houve movimentação no bem gerado
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                 ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp) + #13;
         _cds.Data := GetDataPacket(sSql);
         if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
            Raise Exception.Create(CMTranslate('Existe movimentação no bem gerado pelo Remembramento. Consulte Histórico de Movimentação!'));
         //-------------------------------------------------------------------------------
         // Pesquisa o numero da planilha contabil lancada para o Remembramento
         //-------------------------------------------------------------------------------
         sSql := ' SELECT PLNCODIGO ' + #13 +
                 ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDTIPOMOVIMENTACAO = 10' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         if not _cds.FieldByName('PLNCODIGO').IsNull then
         begin
            nPlnCodigo := _cds.FieldByName('PLNCODIGO').AsFloat;
            if not CafxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               Raise Exception.Create(CafxContab.MessageInfo);
         end else
         begin
            nPlnCodigo := -1;
         end;
         //-------------------------------------------------------------------------------
         // Carrega os bens baixados
         //-------------------------------------------------------------------------------
         FcdsBensBaixados.Data := ListaBensBaixados(nEmpresaProp, nBem);
         //===============================================================================
         // Remove a baixa dos bens baixados para remembramento
         //===============================================================================
         bPrimBem := True;
         FcdsBensBaixados.First;
         while not FcdsBensBaixados.EOF do
         begin
            iTotPlan := 0;
            //----------------------------------------------------------------------------
            // Alimentando os DataSets Filhos com os dados do bem
            // que terá a baixa estornada
            //----------------------------------------------------------------------------
            FcdsBem.Data               := Bem.ListaBem(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,FcdsBensBaixados.FieldByName('IDBEM').AsFloat);
            //----------------------------------------------------------------------------
            // Retorna os Valores Baixados nas Tabela BEMXMOEDA e BEMXDEP
            //----------------------------------------------------------------------------
            _dMTBem.sqlMovBaixaBem.Prepare;
            _dMTBem.sqlMovBaixaBem.ParamByName('IDBEM').AsFloat := FcdsBensBaixados.FieldByName('IDBEM').AsFloat;
            _dMTBem.sqlMovBaixaBem.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
            _dMTBem.sqlMovBaixaBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
            _cds.Data := _dMTBem.sqlMovBaixaBem.Data;
            //----------------------------------------------------------------------------
            _cds.First;
            while not _cds.EOF do
            begin
               //-------------------------------------------------------------------------
               // Posiciona a tabela de acordo com a movimentacao
               //-------------------------------------------------------------------------
               if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 16) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 25) then
                  FcdsBemxMoeda.Locate('MOECODIGO',_cds.FieldByName('MOECODIGO').AsFloat,[])
               else
                  FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                        _cds.FieldByName('IDTAXADEP').AsFloat]), []);
               //-------------------------------------------------------------------------
               // Captura os idmovimentacao com registro de planilha contábil para
               // futura eliminacao do link contábil
               //-------------------------------------------------------------------------
               if not _cds.FieldByName('PLNCODIGO').IsNull then
               begin
                  iTotPlan := iTotPlan + 1;
                  SetLength(aPlanilha, iTotPlan);
                  aPlanilha[iTotPlan - 1] := _cds.FieldByName('IDMOVIMENTACAO').AsInteger;
               end;
               //-------------------------------------------------------------------------
               case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                  16 : begin
                          if _cds.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL then
                          begin
                             FcdsBem.Edit;
                             FcdsBem.FieldByName('PROPBAIXA').AsFloat   := Bem.ConvNum(FcdsBem.FieldByName('PROPBAIXA').AsFloat - _cds.FieldByName('PROPBAIXA').AsFloat);
                             FcdsBem.FieldByName('BAIXATOTAL').AsString := 'N';
                             FcdsBem.Post;
                          end;
                          //--------------------------------------------------------------
                          FcdsBemxMoeda.Edit;
                          FcdsBemxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsBemxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsBemxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  25 : begin
                          FcdsBemxMoeda.Edit;
                          FcdsBemxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsBemxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsBemxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  24 : begin
                          FcdsBemxDep.Edit;
                          FcdsBemxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsBemxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsBemxDep.Post;
                       end;
                  //----------------------------------------------------------------------
                  26 : begin
                          FcdsBemxDep.Edit;
                          FcdsBemxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsBemxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                          FcdsBemxDep.Post;
                       end;
               end;
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
            if not ApplyCds(FcdsBem,_dbBem,[],[]) then
               Raise Exception.Create(_dbBem.MessageInfo);
            if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
               Raise Exception.Create(_dbBemxMoeda.MessageInfo);
            if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
               Raise Exception.Create(_dbBemxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Retorna os Valores Baixados na tabela REAVALIACAO
            //----------------------------------------------------------------------------
            while not FcdsReavaliacao.EOF do
            begin
               _dMTBem.sqlMovBaixaReaval.Prepare;
               _dMTBem.sqlMovBaixaReaval.ParamByName('IDBEM').AsFloat          := FcdsBensBaixados.FieldByName('IDBEM').AsFloat;
               _dMTBem.sqlMovBaixaReaval.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
               _dMTBem.sqlMovBaixaReaval.ParamByName('IDREAVALACRESC').AsFloat := FcdsReavaliacao.Fieldbyname('IDREAVALIACAO').AsFloat;
               _dMTBem.sqlMovBaixaReaval.ParamByName('DATAMOV').AsDateTime     := dDataMov;
               _cds.Data := _dMTBem.sqlMovBaixaReaval.Data;
               //-------------------------------------------------------------------------
               _cds.First;
               while not _cds.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela de acordo com a movimentacao
                  //----------------------------------------------------------------------
                  if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 20) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 28) then
                     FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                   _cds.FieldByName('MOECODIGO').AsFloat]),[])
                  else
                     FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                              _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                              _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
                  //----------------------------------------------------------------------
                  // Captura os idmovimentacao com registro de planilha contábil para
                  // futura eliminacao do link contábil
                  //----------------------------------------------------------------------
                  if not _cds.FieldByName('PLNCODIGO').IsNull then
                  begin
                     iTotPlan := iTotPlan + 1;
                     SetLength(aPlanilha, iTotPlan);
                     aPlanilha[iTotPlan - 1] := _cds.FieldByName('IDMOVIMENTACAO').AsInteger;
                  end;
                  //----------------------------------------------------------------------
                  case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                     20 : begin
                             FcdsReavalxMoeda.Edit;
                             FcdsReavalxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsReavalxMoeda.Post;
                          end;
                     //-------------------------------------------------------------------
                     28 : begin
                             FcdsReavalxMoeda.Edit;
                             FcdsReavalxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsReavalxMoeda.Post;
                          end;
                     //-------------------------------------------------------------------
                     27 : begin
                             FcdsReavalxDep.Edit;
                             FcdsReavalxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsReavalxDep.Post;
                          end;
                     //-------------------------------------------------------------------
                     29 : begin
                             FcdsReavalxDep.Edit;
                             FcdsReavalxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsReavalxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsReavalxDep.Post;
                          end;
                  end;
                  //----------------------------------------------------------------------
                  _cds.Next;
               end;
               FcdsReavaliacao.Next
            end;
            if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Retorna os Valores Baixados na tabela ACRESCIMOVALOR
            //----------------------------------------------------------------------------
            while not FcdsAcrescimoValor.EOF do
            begin
               _dMTBem.sqlMovBaixaAcresc.Prepare;
               _dMTBem.sqlMovBaixaAcresc.ParamByName('IDBEM').AsFloat          := FcdsBensBaixados.FieldByName('IDBEM').AsFloat;
               _dMTBem.sqlMovBaixaAcresc.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
               _dMTBem.sqlMovBaixaAcresc.ParamByName('IDREAVALACRESC').AsFloat := FcdsAcrescimoValor.Fieldbyname('IDACRESCIMO').AsFloat;
               _dMTBem.sqlMovBaixaAcresc.ParamByName('DATAMOV').AsDateTime     := dDataMov;
               _cds.Data := _dMTBem.sqlMovBaixaAcresc.Data;
               //-------------------------------------------------------------------------
               _cds.First;
               while not _cds.EOF do
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela de acordo com a movimentacao
                  //----------------------------------------------------------------------
                  if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 37) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 38) then
                     FcdsAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                      _cds.FieldByName('MOECODIGO').AsFloat]),[])
                  else
                     FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                    _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                    _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
                  //----------------------------------------------------------------------
                  // Captura os idmovimentacao com registro de planilha contábil para
                  // futura eliminacao do link contábil
                  //----------------------------------------------------------------------
                  if not _cds.FieldByName('PLNCODIGO').IsNull then
                  begin
                     iTotPlan := iTotPlan + 1;
                     SetLength(aPlanilha, iTotPlan);
                     aPlanilha[iTotPlan - 1] := _cds.FieldByName('IDMOVIMENTACAO').AsInteger;
                  end;
                  //----------------------------------------------------------------------
                  case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                     37 : begin
                             FcdsAcrescValorxMoeda.Edit;
                             FcdsAcrescValorxMoeda.FieldByName('VALORG').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('VALORG').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsAcrescValorxMoeda.Post;
                          end;
                     //-------------------------------------------------------------------
                     38 : begin
                             FcdsAcrescValorxMoeda.Edit;
                             FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsCurrency := Bem.ConvNum(FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsAcrescValorxMoeda.Post;
                          end;
                     //-------------------------------------------------------------------
                     39 : begin
                             FcdsAcrescValorxDep.Edit;
                             FcdsAcrescValorxDep.FieldByName('DEPLANC').AsCurrency := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsAcrescValorxDep.Post;
                          end;
                     //-------------------------------------------------------------------
                     40 : begin
                             FcdsAcrescValorxDep.Edit;
                             FcdsAcrescValorxDep.FieldByName('CMDEP').AsCurrency := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('CMDEP').AsFloat + _cds.FieldByName('VALOR').AsFloat);
                             FcdsAcrescValorxDep.Post;
                          end;
                  end;
                  //----------------------------------------------------------------------
                  _cds.Next;
               end;
               FcdsAcrescimoValor.Next
            end;
            if not ApplyCds(FcdsAcrescValorxMoeda,_dbAcrescValorxMoeda,[],[]) then
               Raise Exception.Create(_dbAcrescValorxMoeda.MessageInfo);
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Retira o link contábil dos lançamentos de baixa por remembramento
            //----------------------------------------------------------------------------
            iPlan := 0;
            while iPlan <= (iTotPlan - 1) do
            begin
               if aPlanilha[iPlan] > 0 then
               begin
                  sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                          ' SET PLNCODIGO = NULL ' +
                          ' WHERE IDMOVIMENTACAO = ' + floattostr(aPlanilha[iPlan]);
                  if not ExecSQL(sSql, True) then
                     Raise Exception.Create(MessageInfo);
               end;
               iPlan := iPlan + 1;
            end;
            //----------------------------------------------------------------------------
            // Remove os Registros da Baixa por Remembramento do Historico
            //----------------------------------------------------------------------------
            sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                    ' FROM HISTORICOMOVIMENTACAO'+
                    ' WHERE IDBEM = ' + floattostr(FcdsBensBaixados.FieldByName('IDBEM').AsFloat) +
                    '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                    '   AND (IDTIPOMOVIMENTACAO = 16 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR' +
                    '        IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR IDTIPOMOVIMENTACAO = 28 OR' +
                    '        IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 29 OR IDTIPOMOVIMENTACAO = 37 OR' +
                    '        IDTIPOMOVIMENTACAO = 38 OR IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40)' +
                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
            _cds.Data := GetDataPacket(sSql);
            if _cds.IsEmpty then
               Raise Exception.Create(CMTranslate('Não foi possível estornar a Baixa para Remembramento do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
            //----------------------------------------------------------------------------
            while not _cds.Eof do
            begin
               sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover os valores da Baixa para Remembramento do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover o historico da Baixa para Remembramento do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _cds.Next;
            end;
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
            // Estorna o Fechamento PróRata
            //----------------------------------------------------------------------------
            if bPrimBem then
            begin
               if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, FcdsBensBaixados.FieldByName('IDBEM').AsFloat, (dDataMov - 1), dDataEst, True) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end else
            begin
               if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, FcdsBensBaixados.FieldByName('IDBEM').AsFloat, (dDataMov - 1), dDataEst, False) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Atualiza o Saldo Contábil do bem Baixado por Remembramento
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.First;
            while not FcdsBemxMoeda.EOF do
            begin
               iFlgPai := 1;
               FcdsBemxDep.First;
               while not FcdsBemxDep.EOF do
               begin
                  if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat = FcdsBemxMoeda.FieldByName('MOECODIGO').AsFloat then
                  begin
                     if not Bem.AtualizaSaldoContabBem(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                                       FcdsBemxDep.FieldByName('IDBEM').AsInteger,
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
                     //-------------------------------------------------------------------
                     iFlgPai := 0;
                  end;
                  FcdsBemxDep.Next;
               end;
               FcdsBemxMoeda.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsBensBaixados.Next;
         end;
         //-------------------------------------------------------------------------------
         // Retira o link com a Planilha Contábil da Entrada do Bem Novo
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                 ' SET PLNCODIGO = NULL '+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 10 OR IDTIPOMOVIMENTACAO = 17 OR' +
                 '        IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 21)' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Estorna a planilha contábil do remembramento
         //-------------------------------------------------------------------------------
         if nPlnCodigo > 0 then
         begin
            bRemovePlanContab := CafxContab.RemovePlanContab(Trunc(nEmpresaProp));
            //----------------------------------------------------------------------------
            // Estorna / Remove as Planilhas Contábeis
            //----------------------------------------------------------------------------
            if not bRemovePlanContab then
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
                                                               nModulo, 0,
                                                               ParamCAF.USAPLANOPATRO, True) then
               begin
                  Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CafxContab.MessageInfo);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Estorna os lançamentos do Bem Gerado pelo Remembramento
         //-------------------------------------------------------------------------------
         _cds.Data := GetDataPacket(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, IDREAVALACRESC ' + #13 +
                                    ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                                    ' WHERE IDBEM = ' + floattostr(nBem) + #13 +
                                    '   AND IDPESSOA = ' + floattostr(nEmpresaProp) + #13);
         while not _cds.Eof do
         begin
            if _cds.FieldbyName('IDTIPOMOVIMENTACAO').AsInteger = 10 then
            begin
               sSql := ' DELETE FROM REMEMBRAMENTO ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover a lista dos bens baixados do Remembramento do Bem!') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Remove as reavaliacoes
            //----------------------------------------------------------------------------
            if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32 then
            begin
               sSql := ' UPDATE REAVALIACAO ' +
                       ' SET IDMOVIMENTACAO = NULL ' +
                       ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM REAVALXDEP ' +
                       ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
               if not ExecSQL(sSql, False) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM REAVALXMOEDA ' +
                       ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM REAVALIACAO ' +
                       ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALACRESC').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Remove os valores lançados
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         // Remove os Registros de Entrada no Histórico
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove os Registros de Saldos Contábeis do Bem
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM SLDCTBBEMXDEP ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM SALDOCONTABBEM ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove o Cadastro
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM BEMCOTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM PLANOPATROXBEM ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM BEMXDEP ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM BEMXMOEDA ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM BEM ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
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

function TCtrlMovRemembramento.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

