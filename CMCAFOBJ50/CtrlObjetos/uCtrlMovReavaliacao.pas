{
//***************************************************************************************
//Rotina.............: ExecutaReavaliacaoII, EstornaReavaliacaoII
//N. SIG.............: 46687
//Data da Alteração..: 26/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na Revaliação de Imóveis, impedindo a geração de qualquer
//                     tipo de movimentçaão que não seja "REVALIAÇÃO PATRIMONIAL".
//***************************************************************************************
Rotina......: AtualizaSaldoContabBem
Nº SIG......: 46687
Data........: 19/03/2018
Responsável.: Marcelo Ferreira
Descrição...: O sistema não deve recalcular o saldo do bem, até a última movimentação já realizada
--------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 240108
Nº KINTANA..: 619627
Data........: 26/12/2014
Responsável.: Fernando Xavier
Descrição...: O sistema apresenta um erro quando fazemos o processo de reavaliação utilizando um 
              arquivo de importação.
--------------------------------------------------------------------------------------------------
Rotina......: ...
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 08/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Salvar os dados em histórico de vida útil e atualização da taxa de depreciacao.
--------------------------------------------------------------------------------------------------
Rotina......: ...
Nº SOL......: 176911
Nº KINTANA..: 1616659
Data........: 27/03/20102
Responsável.: Wylliam Leite da Silva
Descrição...: Foi comentado a verificação:
ApplyCds(FcdsReavaliacao,_dbReavaliacao,[],[])
--------------------------------------------------------------------------------
Rotina......: ...
Nº SOL......: 162352
Nº KINTANA..: 1481685
Data........: 05/12/2011
Responsável.: Helen V. Bianchi
Descrição...: Rotina de Reavaliação Adicionado a Diferença dos Shopping :
Canoas e Patio Paulista , devido um Script ocorrido no Final do ano de 2010
--------------------------------------------------------------------------------
Rotina......: ...
Nº SOL......: 153958
Nº KINTANA..: 1167601
Data........: 20/06/2011
Responsável.: Helen V. Bianchi
Descrição...: Rotina de Reavaliação será adicionado a Movimentações de Decrescimo
--------------------------------------------------------------------------------}
unit uCtrlMovReavaliacao;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uMidasUtil,
     dMTBem, uDBBem, uDBBemxMoeda, uDBBemxDep,
     uDBReavaliacao, uDBReavalxMoeda, uDBReavalxDep,
     uDBAcrescimoValor, uDBAcrescValorxMoeda, uDBAcrescValorxDep,
     uDBSelBaixa, uDBSelBaixaBens,
     uCtrlParamCAF, uCtrlBem, uCtrlHistMovBem, uCtrlGrupoContab,
     uCtrlCAFxContab, uCtrlFechamentoProRata, uCtrlMovAcrescimoValor, uSistema;

Type
   TCtrlMovReavaliacao = class(TCmControlObject)

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
      _dbReavaliacao       : TDBReavaliacao;
      _dbReavalxMoeda      : TDBReavalxMoeda;
      _dbReavalxDep        : TDBReavalxDep;
      _dbAcrescimoValor    : TDBAcrescimoValor;
      _dbAcrescValorxMoeda : TDBAcrescValorxMoeda;
      _dbAcrescValorxDep   : TDBAcrescValorxDep;

      _dbSelBaixa          : TDBSelBaixa;
      _dbSelBaixaBens      : TDBSelBaixaBens;

      _dMTBem : tdtmMTBem;

      ParamCAF    : TCtrlParamCAF;
      HistMovBem  : TCtrlHistMovBem;
      CAFxContab  : TCtrlCAFxContab;
      ProRata     : TCtrlFechamentoProRata;
      Bem         : TCtrlBem;
      GrupoContab : TCtrlGrupoContab;
      AcrescimoValor : TCtrlMovAcrescimoValor;

      bIntegraContab, bCtaxCCusto : Boolean;
      iExercicio, iPeriodo        : Integer;

      FcdsAcrescimoValor: TClientDataSet;
      FcdsReavalxDep: TClientDataSet;
      FcdsReavaliacao: TClientDataSet;
      FcdsBem: TClientDataSet;
      FcdsBemxMoeda: TClientDataSet;
      FcdsAcrescValorxMoeda: TClientDataSet;
      FcdsAcrescValorxDep: TClientDataSet;
      FcdsBemxDep: TClientDataSet;
      FcdsReavalxMoeda: TClientDataSet;
      FcdsNReavalxDep: TClientDataSet;
      FcdsNReavaliacao: TClientDataSet;
      FcdsNReavalxMoeda: TClientDataSet;
      FcdsPaises: TClientDataSet;
      FcdsTaxasDep: TClientDataSet;
      FcdsSaldosContab: TClientDataSet;
      FcdsSelBaixaBens: TClientDataSet;
      Fcds: TClientDataSet;
      FcdsAtuDeprec: TClientDataSet;
      FcdsAtuCusto: TClientDataSet;

      //Helio - SOL Nº 212226 KINTANA Nº 2037651
      FcdsHistoricoVidaUtil: TClientDataSet;

      //----------------------------------------------------------------------------------
      // Barra de Progresso
      //----------------------------------------------------------------------------------
      iPrgBarPos: Integer;
      iPrgBarMax: Integer;
      sPrgBarMsg: String;

      FIdReavaliacao: Integer;

      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxDep(const Value: TClientDataSet);
      procedure SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
      procedure SetcdsBem(const Value: TClientDataSet);
      procedure SetcdsBemxDep(const Value: TClientDataSet);
      procedure SetcdsBemxMoeda(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsReavalxDep(const Value: TClientDataSet);
      procedure SetcdsReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsNReavaliacao(const Value: TClientDataSet);
      procedure SetcdsNReavalxDep(const Value: TClientDataSet);
      procedure SetcdsNReavalxMoeda(const Value: TClientDataSet);
      procedure SetcdsPaises(const Value: TClientDataSet);
      procedure SetcdsTaxasDep(const Value: TClientDataSet);
      procedure SetcdsSaldosContab(const Value: TClientDataSet);
      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsSelBaixaBens(const Value: TClientDataSet);
      procedure SetcdsHistoricoVidaUtil(const Value: TClientDataSet); //Helio - SOL Nº 212226 KINTANA Nº 2037651

      procedure SetIdReavaliacao(const Value: Integer);

      function ListaSaldosContab : OleVariant;
      function CMTranslate(sIgor : String) : String;

    procedure SetcdsAtuCusto(const Value: TClientDataSet);
    procedure SetcdsAtuDeprec(const Value: TClientDataSet);

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
      property cdsNReavaliacao      : TClientDataSet read FcdsNReavaliacao write SetcdsNReavaliacao;
      property cdsNReavalxMoeda     : TClientDataSet read FcdsNReavalxMoeda write SetcdsNReavalxMoeda;
      property cdsNReavalxDep       : TClientDataSet read FcdsNReavalxDep write SetcdsNReavalxDep;
      property cdsPaises            : TClientDataSet read FcdsPaises write SetcdsPaises;
      property cdsTaxasDep          : TClientDataSet read FcdsTaxasDep write SetcdsTaxasDep;
      property cdsSaldosContab      : TClientDataSet read FcdsSaldosContab write SetcdsSaldosContab;
      //----------------------------------------------------------------------------------
      property IdReavaliacao : Integer read FIdReavaliacao write SetIdReavaliacao;
      //----------------------------------------------------------------------------------
      // Seleção para Reavaliação
      //----------------------------------------------------------------------------------
      property cds : TClientDataSet read Fcds write Setcds;
      property cdsSelBaixaBens : TClientDataSet read FcdsSelBaixaBens write SetcdsSelBaixaBens;
      //----------------------------------------------------------------------------------
      property cdsAtuCusto       : TClientDataSet read FcdsAtuCusto write SetcdsAtuCusto;
      property cdsAtuDeprec      : TClientDataSet read FcdsAtuDeprec write SetcdsAtuDeprec;

      //Helio - SOL Nº 212226 KINTANA Nº 2037651
      property cdsHistoricoVidaUtil : TClientDataSet read FcdsHistoricoVidaUtil write SetcdsHistoricoVidaUtil;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function ExecutaReavaliacao(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                  dDataMov : TDateTime; nValLaudo : Extended;
                                  iVidaUtil : Integer; sObsReaval: String;
                                  iTipDepProRata : Integer) : Boolean;
      function EstornaReavaliacao(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                  dDataMov, dDataEst : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaReavaliacaoII(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov : TDateTime; nValLaudo : Extended;
                                    iVidaUtil : Integer; sObsReaval: String;
                                    iTipDepProRata : Integer) : Boolean;
      function EstornaReavaliacaoII(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                    dDataMov, dDataEst : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      function ListaSelReaval(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
      function ListaSelReavalBens(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ExecutaTermoReaval(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                  dDataReaval : TDateTime; iTipDepProRata : Integer;
                                  sBilhete : String) : Boolean;
      function EstornaTermoReaval(nModulo, nEmpresaProp, nUsuario, nSelBaixa : Extended;
                                  dDataMov, dDataEst : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Início
      //Inclído o parâmetro bFazDepreciacao, para impedir a Depreciação de bens do tipo TERRENO 
      function ExecutaRetificaReaval(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                     dDataUltReaval, dDataMov : TDateTime; nValLaudo : Extended;
                                     iVidaUtil : Integer; sObsReaval: String;
                                     iTipDepProRata : Integer; bFazDepreciacao: Boolean = True) : Boolean;
      function EstornaRetificaReaval(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                                     dDataMov, dDataEst, dDataUltReaval : TDateTime) : Boolean;

      function ListDadosImovelxBemReav: Olevariant;
      function ListDadosTipoImovelReav: Olevariant;
      function ListDadosObraReav(pDataReav: TDateTime): Olevariant;
      function ListFornecedorReav: OleVariant;
   end;

implementation

{ TCtrlMovReavaliacao }

constructor TCtrlMovReavaliacao.Create;
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
   _dbSelBaixa          := TDBSelBaixa.Create(Self);
   _dbSelBaixaBens      := TDBSelBaixaBens.Create(Self);

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
   FcdsPaises             := TClientDataSet.Create(nil);
   FcdsTaxasDep           := TClientDataSet.Create(nil);
   Fcds                   := TClientDataSet.Create(nil);
   FcdsSelBaixaBens       := TClientDataSet.Create(nil);

   FcdsNReavaliacao       := TClientDataSet.Create(nil);
   FcdsNReavalxMoeda      := TClientDataSet.Create(nil);
   FcdsNReavalxDep        := TClientDataSet.Create(nil);

   FcdsSaldosContab       := TClientDataSet.Create(nil);

   FcdsAtuDeprec := TClientDataSet.Create(nil);
   FcdsAtuCusto  := TClientDataSet.Create(nil);

   Bem         := TCtrlBem.Create;
   GrupoContab := TCtrlGrupoContab.Create;
   ParamCAF    := TCtrlParamCAF.Create;
   HistMovBem  := TCtrlHistMovBem.Create;
   CAFxContab  := TCtrlCAFxContab.Create;
   ProRata     := TCtrlFechamentoProRata.Create(CAFxContab);
   AcrescimoValor := TCtrlMovAcrescimoValor.Create;
end;

destructor TCtrlMovReavaliacao.Destroy;
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
   GrupoContab.Free;
   ParamCAF.Free;
   HistMovBem.Free;
   CAFxContab.Free;
   ProRata.Free;
   AcrescimoValor.Free;

   _dbBem.Free;
   _dbBemxMoeda.Free;
   _dbBemxDep.Free;
   _dbReavaliacao.Free;
   _dbReavalxMoeda.Free;
   _dbReavalxDep.Free;
   _dbAcrescimoValor.Free;
   _dbAcrescValorxMoeda.Free;
   _dbAcrescValorxDep.Free;
   _dbSelBaixa.Free;
   _dbSelBaixaBens.Free;

   _dMTBem.Free;

   if IsAppServer then
      FreeCDS([FcdsBem, FcdsBemxMoeda, FcdsBemxDep,
               FcdsReavaliacao, FcdsReavalxMoeda, FcdsReavalxDep,
               FcdsAcrescimoValor, FcdsAcrescValorxMoeda, FcdsAcrescValorxDep,
               Fcds, FcdsSelBaixaBens]);

   FcdsPaises.Free;
   FcdsTaxasDep.Free;
   FcdsNReavaliacao.Free;
   FcdsNReavalxMoeda.Free;
   FcdsNReavalxDep.Free;
   FcdsSaldosContab.Free;

   FcdsAtuDeprec.Free;
   FcdsAtuCusto.Free;

   inherited;
end;

procedure TCtrlMovReavaliacao.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CAFxContab.InitializeAs(Self);
   ProRata.InitializeAs(Self);
   AcrescimoValor.InitializeAs(Self);
end;

procedure TCtrlMovReavaliacao.DoChangeDataBase;
begin
   inherited;
   _dbBem.DataBaseName               := DataBaseName;
   _dbBemxMoeda.DataBaseName         := DataBaseName;
   _dbBemxDep.DataBaseName           := DataBaseName;
   _dbReavaliacao.DataBaseName       := DataBaseName;
   _dbReavalxMoeda.DataBaseName      := DataBaseName;
   _dbReavalxDep.DataBaseName        := DataBaseName;
   _dbAcrescimoValor.DataBaseName    := DataBaseName;
   _dbAcrescValorxMoeda.DataBaseName := DataBaseName;
   _dbAcrescValorxDep.DataBaseName   := DataBaseName;
   _dbSelBaixa.DataBaseName          := DataBaseName;
   _dbSelBaixaBens.DataBaseName      := DataBaseName;
end;

procedure TCtrlMovReavaliacao.SetcdsAtuCusto(const Value: TClientDataSet);
begin
  FcdsAtuCusto := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsAtuDeprec(const Value: TClientDataSet);
begin
  FcdsAtuDeprec := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
  FcdsAcrescValorxDep := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
  FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsBem(const Value: TClientDataSet);
begin
  FcdsBem := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsBemxDep(const Value: TClientDataSet);
begin
  FcdsBemxDep := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
  FcdsBemxMoeda := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsReavalxDep(const Value: TClientDataSet);
begin
  FcdsReavalxDep := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsReavalxMoeda := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsNReavaliacao(const Value: TClientDataSet);
begin
  FcdsNReavaliacao := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsNReavalxDep(const Value: TClientDataSet);
begin
  FcdsNReavalxDep := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsNReavalxMoeda(const Value: TClientDataSet);
begin
  FcdsNReavalxMoeda := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsPaises(const Value: TClientDataSet);
begin
  FcdsPaises := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsTaxasDep(const Value: TClientDataSet);
begin
  FcdsTaxasDep := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsSaldosContab(const Value: TClientDataSet);
begin
  FcdsSaldosContab := Value;
end;

procedure TCtrlMovReavaliacao.SetIdReavaliacao(const Value: Integer);
begin
  FIdReavaliacao := Value;
end;

procedure TCtrlMovReavaliacao.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsSelBaixaBens(const Value: TClientDataSet);
begin
  FcdsSelBaixaBens := Value;
end;

procedure TCtrlMovReavaliacao.SetcdsHistoricoVidaUtil(const Value: TClientDataSet);
begin
  FcdsHistoricoVidaUtil := Value;
end;

function TCtrlMovReavaliacao.ListaSelReaval(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT ST.IDSELBAIXA, ST.IDPESSOA, ST.SBTIPOMOV, ST.IDDESTINOBAIXA, ST.SBXTERMO, '+ #13 +
           '        ST.SBXPROCESSO, ST.SBXDATA, ST.IDRESPONSAVEL, ST.SBXFLGEXECUTADO, ST.SBXDTAEXECUTADO, ' + #13 +
           '        P.NOME AS NOMERESP ' + #13 +
           ' FROM SELBAIXA ST, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE ST.SBTIPOMOV = 2 ' + #13;  // 0 - Baixa, 1 - Transferencia, 2 - Reavaliacao
   //----------------------------------------------------------------------------------
   if nIdSelBaixa <> -1 then
      sSql := sSql + '   AND ST.IDSELBAIXA = ' + floattostr(nIdSelBaixa) + #13;
   //----------------------------------------------------------------------------------
   sSql := sSql + '   AND ST.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
                  '   AND ST.IDRESPONSAVEL = P.IDPESSOA(+) ' + #13 +
                  ' ORDER BY ST.SBXDATA, ST.IDSELBAIXA, ST.IDPESSOA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovReavaliacao.ListaSelReavalBens(nIdPessoa, nIdSelBaixa: Extended): OleVariant;
begin
   _dMTBem.sqlListaSelReavalBens.Prepare;
   _dMTBem.sqlListaSelReavalBens.ParamByName('IDPESSOA').AsFloat := nIdPessoa;
   _dMTBem.sqlListaSelReavalBens.ParamByName('IDSELBAIXA').AsFloat := nIdSelBaixa;
   Result := _dMTBem.sqlListaSelReavalBens.Data;
end;

function TCtrlMovReavaliacao.AplicaOperacao(sTipoOperacao: String): Boolean;
var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoSELREAVAL(sTipoOperacao,
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

function TCtrlMovReavaliacao.ListaSaldosContab : OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT (0)      AS IDREAVALIACAO, ' + #13 +
           '        (0)      AS MOECODIGO,     ' + #13 +
           '        (0)      AS IDTAXADEP,     ' + #13 +
           '        (0.0000) AS SLDCONTAB,     ' + #13 +
           '        (0.0000) AS VALORG,        ' + #13 +
           '        (0.0000) AS CMBEM,         ' + #13 +
           '        (0.0000) AS DEPLANC,       ' + #13 +
           '        (0.0000) AS CMDEP          ' + #13 +
           ' FROM GRUPO                        ' + #13 +
           ' WHERE (IDGRUPO = -1)              ' + #13 ;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;
//========================================================================================
// Executa a Reavaliacao Patrimonial de um bem (Método BaixaDep)
//========================================================================================
function TCtrlMovReavaliacao.ExecutaReavaliacaoII(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                  dDataMov: TDateTime; nValLaudo: Extended;
                                                  iVidaUtil: Integer; sObsReaval: String;
                                                  iTipDepProRata: Integer): Boolean;
var
   dDataUltMov, dDataUltDep                : TDateTime;
   nNovaTaxaDep, nSeqHist, nSeqHistContab,
   nMoeValLaudo, nSldContabil,
   nSaldoReaval, nSaldoReavalContab,
   nTaxaDepAnt, nPlanilha, nMoeCodigo,
   nValContabB, nValContabCM,
   nValContabD, nValContabCMD,
   nBaixaB, nBaixaCM,
   nBaixaD, nBaixaCMD                      : Extended;
   iFlgPai, iHistMovBem                    : Integer;
   sSql                                    : String;
   bPrimMov                                : Boolean;
   nValContabB_Dec, nValContabCM_Dec,nValContabD_Dec, nValContabCMD_Dec   : Extended;
   iTipoMov                                : Integer ; //Helen SOL Nº 153958 KINTANA Nº 1167601
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaReavaliacaoII(nModulo, nEmpresaProp, nUsuario, nBem,
                                                          dDataMov, nValLaudo, iVidaUtil,
                                                          sObsReaval, iTipDepProRata);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para reavaliação de bens
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
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if iVidaUtil < 0 then
            raise Exception.Create(CMTranslate('Tempo de Vida Útil Zerado igual a Taxa de Depreciação Zerada!'));
         //-------------------------------------------------------------------------------
         if nValLaudo < 0 then
            raise Exception.Create(CMTranslate('Informe o novo valor do bem!'));
         //-------------------------------------------------------------------------------
         if sObsReaval = '' then
            raise Exception.Create(CMTranslate('Declare as informações relativas ao laudo de reavaliação!'));
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
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '08', dDataMov, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil do Fechamento PróRata
         //-------------------------------------------------------------------------------
         if bIntegraContab then
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
         end;
         //-------------------------------------------------------------------------------
         // Calcula o Fechamento PróRata
         //-------------------------------------------------------------------------------
         ProRata.iaHistMovBem := -1;
         if iTipDepProRata < 2 then
         begin
            if iTipDepProRata = 0 then
            begin
               if not ProRata.ExecutarII(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end else
            begin
               if not ProRata.ExecutarII(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil do Fechamento PróRata
         //-------------------------------------------------------------------------------
         if bIntegraContab and (not CAFxContab.cdsMontaContab.IsEmpty) then
         begin
            nPlanilha := CAFxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp,
                                                             nUsuario, datetostr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CAFxContab.MessageInfo);
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
         // Prepara a montagem da planilha contábil da Reavaliação
         //-------------------------------------------------------------------------------
         if bIntegraContab then
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
         end;
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem que será reavaliado
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp, nBem);
         FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp, nBem);
         FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp, nBem);
         //Cássio Rovaroto - SIG nº 46687 - Início
         if (FcdsBem.FieldByName('IDMODULO').AsFloat = 54) and (dDataMov < StrToDateTime('31/12/2018')) or
            (FcdsBem.FieldByName('IDMODULO').AsFloat = 7) then
         begin
          FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp, nBem);
          FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp, nBem);
          FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp, nBem);
          FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp, nBem);
          FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
         end;
         //Cássio Rovaroto - SIG nº 46687 - Fim
         //-------------------------------------------------------------------------------
         // Calcula o Saldo de Reavaliacao e a nova taxa de depreciacao
         //-------------------------------------------------------------------------------
         nNovaTaxaDep := 0;
         if iVidaUtil > 0 then
            nNovaTaxaDep := (100 / (iVidaUtil / 12)); // iVidaUtil está em número de meses

         //Helio - SOL Nº 212226 KINTANA Nº 2037651
         //registra no historico de vida util
         if (FcdsHistoricoVidaUtil <> nil) and
            (iVidaUtil > 0) then
         begin
             //coloca outros registros como nao vigentes
             sSql := ' UPDATE HISTORICOVIDAUTIL SET VIGENTE = ' + QuotedStr('N') +
             ' WHERE IDIMOVEL  in ( select IDIMOVEL from IMOVELXBEM where IDBEM = ' + floattostr(nBem) +' )'; // SOL 240108 PPM 619627

             if not ExecSQL(sSql, True) and
                (MessageInfo <> 'A instrução executada não modificou registros no Banco de Dados. Verifique') then
               Raise Exception.Create(MessageInfo);

             //salvo no registtro no historico como vigente
             sSql := 'INSERT INTO HISTORICOVIDAUTIL ' +
             ' (VIDAUTIL, TXDEP_ANO, TXDEP_MES, VIGENTE, IDIMOVEL, HIST_EVENTO)' +
             ' VALUES (' +
             IntToStr(iVidaUtil) + ', ' +
             stringReplace(FloatToStr((nNovaTaxaDep * 12)), ',', '.', [rfIgnoreCase, rfReplaceAll]) + ', ' +
             stringReplace(FloatToStr(nNovaTaxaDep), ',', '.', [rfIgnoreCase, rfReplaceAll]) + ', ' +
             QuotedStr('S') + ', ' +
             ' ( select IDIMOVEL from IMOVELXBEM where IDBEM = ' + floattostr(nBem) +' ) ,'  + // SOL 240108 PPM 619627
             QuotedStr(FcdsHistoricoVidaUtil.FieldByName('HIST_EVENTO').AsString) +
             ') ';

             if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //salva historico de vida util
         //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

         //-------------------------------------------------------------------------------
         // Registra os Saldos Contábeis para Atualização
         //-------------------------------------------------------------------------------
         FcdsSaldosContab.Data := ListaSaldosContab;
         //-------------------------------------------------------------------------------
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            nSldContabil := Bem.SaldoContabilA(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                               FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                               dDataMov,
                                               FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                               FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger);

            if Bem.MessageInfo <> '' then
               Raise Exception.Create(Bem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsSaldosContab.Append;
            FcdsSaldosContab.FieldByName('IDREAVALIACAO').AsInteger := 0;
            FcdsSaldosContab.FieldByName('MOECODIGO').AsInteger := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
            FcdsSaldosContab.FieldByName('IDTAXADEP').AsInteger := FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger;
            FcdsSaldosContab.FieldByName('SLDCONTAB').AsCurrency := nSldContabil;
            FcdsSaldosContab.Post;
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsReavalxDep.First;
         while not FcdsReavalxDep.EOF do
         begin
            nSldContabil := Bem.SaldoContabilA(FcdsReavalxDep.FieldByName('IDPESSOA').AsInteger,
                                               FcdsReavalxDep.FieldByName('IDBEM').AsInteger,
                                               dDataMov,
                                               FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                               FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                               FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger);
            if Bem.MessageInfo <> '' then
               Raise Exception.Create(Bem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsSaldosContab.Append;
            FcdsSaldosContab.FieldByName('IDREAVALIACAO').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger;
            FcdsSaldosContab.FieldByName('MOECODIGO').AsInteger := FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger;
            FcdsSaldosContab.FieldByName('IDTAXADEP').AsInteger := FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger;
            FcdsSaldosContab.FieldByName('SLDCONTAB').AsCurrency := nSldContabil;
            FcdsSaldosContab.Post;
            //----------------------------------------------------------------------------
            FcdsReavalxDep.Next;
         end;
         //===============================================================================
         // Gera a Nova Reavaliação
         //===============================================================================
         FcdsPaises.Data := GrupoContab.ListaGrupoTaxaDep(FcdsBem.FieldByname('IDGRUPO').AsFloat,
                                                          FcdsBem.FieldByname('IDPESSOA').AsFloat);
         FcdsTaxasDep.Data := GrupoContab.ListaGrupoTaxaDep(FcdsBem.FieldByname('IDGRUPO').AsFloat,
                                                            FcdsBem.FieldByname('IDPESSOA').AsFloat);
         //-------------------------------------------------------------------------------
         nSeqHistContab := -1;
         nSaldoReavalContab := 0;
         while not FcdsPaises.EOF do
         begin
            //----------------------------------------------------------------------------
            // Inicializa os CDS da reavaliacao do país
            //----------------------------------------------------------------------------
            FcdsNReavaliacao.Data  := Bem.ListaReavaliacao(nEmpresaProp , 0);
            FcdsNReavalxMoeda.Data := Bem.ListaReavalxMoeda(nEmpresaProp, 0);
            FcdsNReavalxDep.Data   := Bem.ListaReavalxDep(nEmpresaProp  , 0);
            //----------------------------------------------------------------------------
            // Gera Reavaliacao para o País
            //----------------------------------------------------------------------------
            FcdsNReavaliacao.Append;
            FcdsNReavaliacao.FieldByName('IDBEM').AsFloat              := FcdsBem.FieldByName('IDBEM').AsFloat;
            FcdsNReavaliacao.FieldByName('IDPESSOA').AsFloat           := FcdsBem.FieldByName('IDPESSOA').AsFloat;
            FcdsNReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime := dDataMov;
            FcdsNReavaliacao.FieldByName('FLGULTREAVAL').AsInteger     := 1;
            FcdsNReavaliacao.Post;
            if not ApplyCds(FcdsNReavaliacao,_dbReavaliacao,[],[]) then
               Raise Exception.Create(_dbReavaliacao.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra no Histórico
            //----------------------------------------------------------------------------
            nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,      // IDBEM
                                                      FcdsBem.FieldByName('IDPESSOA').AsFloat,   // IDPESSOA
                                                      FcdsBem.FieldByName('IDMODULO').AsFloat,   // IDMODULO
                                                      08,                                        // IDTIPOMOVIMENTACAO
                                                      dDataMov,                                  // DATAMOVIMENTACAO
                                                      _dbReavaliacao.IDREAVALIACAO.AsFloat,      // IDREAVALACRESC
                                                      -1,                                        // DATAULTDEP
                                                      -1,                                        // IDGRUPANT
                                                      -1,                                        // IDCONJANT
                                                      -1,                                        // IDLOCALANT
                                                      -1,                                        // IDRESPANT
                                                      -1,                                        // PLACAANT
                                                      -1,                                        // PLNCODIGO
                                                      sObsReaval,                                // OBSREAVAL
                                                      iTipDepProRata,                            // TIPDEPPRORATA
                                                      -1,                                        // IDTIPODESPESA
                                                      '',                                        // OBSACRESCIMO
                                                      -1,                                        // IDMOTIVOBAIXA
                                                       0,                                        // PROPBAIXA
                                                       0,                                     // VALVENDAOFI
                                                      '');                                       // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE REAVALIACAO '+
                    ' SET IDMOVIMENTACAO = ' + FloatToStr(nSeqHist) + ' ' +
                    ' WHERE IDREAVALIACAO = ' + FloatToStr(_dbReavaliacao.IDREAVALIACAO.AsFloat);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FcdsBemxDep.Locate('IDBEMXDEP', VarArrayOf([FcdsPaises.FieldByName('IDTAXADEP').AsInteger]),[]);
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = FcdsPaises.FieldByname('IDTAXADEP').AsInteger then
               begin
                  if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat <> ParamCAF.MOEDAOFICIAL then
                  begin
                     nMoeValLaudo := Bem.ConversaoMoeda(nValLaudo, FcdsBemxDep.FieldByName('MOECODIGO').AsInteger, dDataMov);
                     if nMoeValLaudo < 0 then
                        Raise Exception.Create(Bem.MessageInfo);
                  end else
                  begin
                     nMoeValLaudo := nValLaudo;
                  end;
                  //----------------------------------------------------------------------
                  // Calcula o Saldo de Reavaliacao
                  //----------------------------------------------------------------------
                  nSldContabil := Bem.SaldoContabil(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger);
                  nSaldoReaval := nMoeValLaudo - nSldContabil;
                  //Cássio Rovaroto - SIG nº 46687 - Início
                  //Helen - SOL : 162352 KINTANA : 1481685   - INICIO
                  //if nBem = 21405 then    // Patio Paulista
                  //   nSaldoReaval := nSaldoReaval - 145291.3     ;
                  //if nBem = 80244 then    // Canoas
                  //   nSaldoReaval := nSaldoReaval - 117018     ;
                     //Helen - SOL : 162352 KINTANA : 1481685   - FIM
                  //Cássio Rovaroto - SIG nº 46687 - Fim
                  //----------------------------------------------------------------------
                  // Registra dados para Integração Contábil
                  //----------------------------------------------------------------------
                  if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                     (FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = 1) then
                  begin
                     nSeqHistContab     := nSeqHist;
                     nSaldoReavalContab := nSaldoReaval;
                  end;
                  //----------------------------------------------------------------------
                  // Gera ReavalxMoeda para o País
                  //----------------------------------------------------------------------
                  FcdsNReavalxMoeda.Append;
                  FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsFloat    := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
                  FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat       := nSaldoReaval;
                  FcdsNReavalxMoeda.FieldByName('DATAULTCM').AsDateTime := dDataMov;
                  FcdsNReavalxMoeda.Post;
                  //----------------------------------------------------------------------
                  // Gera ReavalxDep para ReavalxMoeda no País
                  //----------------------------------------------------------------------
                  FcdsTaxasDep.First;
                  while not FcdsTaxasDep.EOF do
                  begin
                     FcdsNReavalxDep.Append;
                     FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat     := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
                     FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat  := FcdsTaxasDep.FieldByName('IDTAXADEP').AsFloat;
                     FcdsNReavalxDep.FieldByName('TAXADEP').AsFloat       := nNovaTaxaDep;
                     FcdsNReavalxDep.FieldByName('DATAULTCM').AsDateTime  := dDataMov;
                     FcdsNReavalxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                     FcdsNReavalxDep.Post;
                     //-------------------------------------------------------------------
                     FcdsTaxasDep.Next;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o Saldo de Reavaliacao no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          nSaldoReaval) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra a nova taxa de depreciação para o custo
                  //----------------------------------------------------------------------
                  nTaxaDepAnt := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
                  FcdsBemxDep.Edit;
                  FcdsBemxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep;
                  FcdsBemxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a taxa de depreciação anterior no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsBemxDep.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat,
                                                      nMoeValLaudo, nTaxaDepAnt) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
               FcdsBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Registra os registros filhos da reavaliacao
            //----------------------------------------------------------------------------
            if not ApplyCds(FcdsNReavalxMoeda,_dbReavalxMoeda,[_dbReavaliacao.IDREAVALIACAO],[_dbReavalxMoeda.IDREAVALIACAO]) then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            if not ApplyCds(FcdsNReavalxDep,_dbReavalxDep,[_dbReavaliacao.IDREAVALIACAO],[_dbReavalxDep.IDREAVALIACAO]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsPaises.Next;
         end;

         //Cássio Rovaroto - SIG nº 46687 - Início
         if (FcdsBem.FieldByName('IDMODULO').AsFloat = 54) and (dDataMov < StrToDateTime('31/12/2018')) or
            (FcdsBem.FieldByName('IDMODULO').AsFloat = 7) then
         begin
         //Cássio Rovaroto - SIG nº 46687 - Fim

           //===============================================================================
           // Baixa os Custos e as suas Depreciações Acumuladas
           //-------------------------------------------------------------------------------
           // Realiza a baixa do custo de aquisicao
           //-------------------------------------------------------------------------------
           nValContabB   := 0;
           nValContabCM  := 0;
           nValContabD   := 0;
           nValContabCMD := 0;
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
                                                         83,                                      // IDTIPOMOVIMENTACAO
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
                                                        100,                                      // PROPBAIXA
                                                          0,                                     // VALVENDAOFI
                                                         'Baixa para Reavaliação');               // OBSBAIXA
               if nSeqHist = -1 then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            nBaixaB := FcdsBemxMoeda.FieldByName('VALORG').asFloat;
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
          bPrimMov := True;
          FcdsBemxMoeda.First;
          while not FcdsBemxMoeda.EOF do
          begin
            if FcdsBemxMoeda.FieldByName('MOECODIGO').asFloat = ParamCAF.MOEDAOFICIAL then
            begin
               nBaixaCM := FcdsBemxMoeda.FieldByName('CMBEM').asFloat;
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
                                                               84,                                      // IDTIPOMOVIMENTACAO
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
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     nValContabCM := nBaixaCM;
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
            nBaixaD := FcdsBemxDep.FieldByName('DEPLANC').asFloat;
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
                                                            85,                                      // IDTIPOMOVIMENTACAO
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
               FcdsBemxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               FcdsBemxDep.FieldByName('FLGDEPREC').AsInteger := 0;
               FcdsBemxDep.Post;
               //-------------------------------------------------------------------------
               // Captura valor para Contabilização se for MoedaOficial
               //-------------------------------------------------------------------------
               if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  nValContabD := nBaixaD;
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
               nBaixaCMD := FcdsBemxDep.FieldByName('CMDEP').asFloat;
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
                                                               86,                                      // IDTIPOMOVIMENTACAO
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
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     nValContabCMD := nBaixaCMD;
               end;
            end;
            //----------------------------------------------------------------------------
            FcdsBemxDep.Next;
          end;
          if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
          //-------------------------------------------------------------------------------
          // Lançamento Contábil da Baixa do Custo
          //-------------------------------------------------------------------------------
          if bIntegraContab then
          begin
            if not CAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
                                                     FcdsBem.FieldByName('IDBEM').AsFloat,
                                                     dDataMov,
                                                     FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                     FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                     FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                     FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                     FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                     FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                     'B',
                                                     nValContabB, nValContabCM,
                                                     nValContabD, nValContabCMD,
                                                     FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                     FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                     iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CAFxContab.MessageInfo);
          end;
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
               nBaixaB  := FcdsReavalxMoeda.FieldByName('VALORG').asFloat;
               if nBaixaB <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                               87,                                                    // IDTIPOMOVIMENTACAO
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
                  nBaixaB  := FcdsReavalxMoeda.FieldByName('VALORG').asFloat;
                  nBaixaCM := FcdsReavalxMoeda.FieldByName('CMBEM').asFloat;
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
                                                                  88,                                                    // IDTIPOMOVIMENTACAO
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
                                                             nBaixaCM) then
                        Raise Exception.Create(HistMovBem.MessageInfo);
                     //-------------------------------------------------------------------
                     // Registra a Baixa em ReavalxMoeda
                     //-------------------------------------------------------------------
                     FcdsReavalxMoeda.Edit;
                     FcdsReavalxMoeda.FieldByName('CMBEM').AsFloat := Bem.ConvNum(FcdsReavalxMoeda.FieldByName('CMBEM').asFloat - nBaixaCM);
                     FcdsReavalxMoeda.Post;
                     //-------------------------------------------------------------------
                     if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     begin
                        //----------------------------------------------------------------
                        // Lançamento Contábil da Baixa das Reavaliações
                        //----------------------------------------------------------------
                        if bIntegraContab then
                        begin
                           if not CAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
                                                                    FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                    dDataMov,
                                                                    FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                    FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                    FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                    FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                    FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                    FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                    'R',
                                                                    nBaixaB, nBaixaCM, 0, 0,
                                                                    FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                    FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                    iExercicio, iPeriodo, bCtaxCCusto) then
                              Raise Exception.Create(CAFxContab.MessageInfo);
                        end;
                     end;
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
               nBaixaD := FcdsReavalxDep.FieldByName('DEPLANC').asFloat;
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
                                                               89,                                                  // IDTIPOMOVIMENTACAO
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
                  FcdsReavalxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                  FcdsReavalxDep.FieldByName('FLGDEPREC').AsInteger := 0;
                  FcdsReavalxDep.Post;
                  //----------------------------------------------------------------------
                  if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento Contábil da Baixa das Reavaliações
                     //-------------------------------------------------------------------
                     if bIntegraContab then
                     begin
                        FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',
                                                VarArrayOf([FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat,
                                                            FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat]),[]);
                        nBaixaB := FcdsReavalxMoeda.FieldByName('VALORG').AsFloat;
                        //----------------------------------------------------------------
                        if not CAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
                                                                 FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                 dDataMov,
                                                                 FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                 FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                 FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                 FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                 FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                 FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                 'R',
                                                                 nBaixaB, 0, nBaixaD, 0,
                                                                 FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                 FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                 iExercicio, iPeriodo, bCtaxCCusto) then
                           Raise Exception.Create(CAFxContab.MessageInfo);
                     end;
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
                  nBaixaCMD := FcdsReavalxDep.FieldByName('CMDEP').asFloat;
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
                                                                  90,                                                  // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                            // DATAMOVIMENTACAO
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
                     //-------------------------------------------------------------------
                     if FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     begin
                        //----------------------------------------------------------------
                        // Lançamento Contábil da Baixa das Reavaliações
                        //----------------------------------------------------------------
                        if bIntegraContab then
                        begin
                           FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',
                                                   VarArrayOf([FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat,
                                                               FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat]),[]);
                           nBaixaB := FcdsReavalxMoeda.FieldByName('VALORG').AsFloat;
                           //-------------------------------------------------------------
                           if not CAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
                                                                    FcdsBem.FieldByName('IDBEM').AsFloat,
                                                                    dDataMov,
                                                                    FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                                    FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                                    FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                                    FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                                    FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                                    FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                                    'R',
                                                                    nBaixaB, 0, 0, nBaixaCMD,
                                                                    FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                                    FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                                    iExercicio, iPeriodo, bCtaxCCusto) then
                              Raise Exception.Create(CAFxContab.MessageInfo);
                        end;
                     end;
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
          nValContabB   := 0;
          nValContabCM  := 0;
          nValContabD   := 0;
          nValContabCMD := 0;

          //Helen SOL Nº 153958 Kintana Nº 1167601
          nValContabB_Dec   := 0;
          nValContabCM_Dec  := 0;
          nValContabD_Dec   := 0;
          nValContabCMD_Dec := 0;
          //-------------------------------------------------------------------------------
          FcdsAcrescimoValor.First;
          while not FcdsAcrescimoValor.EOF do
          begin
            bPrimMov := True;
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO',FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat,[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').asFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').asFloat) do
            begin
               nBaixaB := FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat;
               if nBaixaB <> 0 then
               begin
                  if bPrimMov then
                  begin
                     //Helen SOL Nº 153958 KINTANA Nº 1167601
                     if nBaixaB > 0 then
                        iTipoMov := 91
                     else
                        iTipoMov := 102;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                     // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,                  // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,                  // IDMODULO
{Helen SOL Nº 153958 KINTANA Nº 1167601 - 91 }                 iTipoMov,                                                 // IDTIPOMOVIMENTACAO
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
                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  begin
                     if iTipoMov = 91 then  //Helen SOL Nº 153958 KINTANA Nº 1167601
                        nValContabB := nValContabB + nBaixaB
                     else
                        nValContabB_Dec := nValContabB_Dec + nBaixaB;
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
                  nBaixaCM := FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat;
                  if nBaixaCM <> 0 then
                  begin
                     if bPrimMov then
                     begin
                        //Helen SOL Nº 153958 KINTANA Nº 1167601
                        if nBaixaCM > 0 then
                          iTipoMov := 92
                        else
                          iTipoMov := 103;
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
    {//Helen SOL Nº 153958 KINTANA Nº 1167601 }                   iTipoMov,                                              // IDTIPOMOVIMENTACAO
                                                                  dDataMov,                                              // DATAMOVIMENTACAO
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
                     //-------------------------------------------------------------------
                     // Captura valor para Contabilização se for MoedaOficial
                     //-------------------------------------------------------------------

                         if FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                         begin
                            if iTipoMov = 92 then   //Helen SOL Nº 153958 KINTANA Nº 1167601
                               nValContabCM := nValContabCM + nBaixaCM
                            else
                               nValContabCM_Dec := nValContabCM_Dec + nBaixaCM;
                         end;

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
               nBaixaD := FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat;
               if nBaixaD <> 0 then
               begin
                  if bPrimMov then
                  begin
                      //Helen SOL Nº 153958 KINTANA Nº 1167601
                      if nBaixaD > 0 then
                         iTipoMov := 93
                      else
                      begin
                         iTipoMov := 104;
                         nBaixaD  := nBaixaD * (-1);
                      end;
                     //-------------------------------------------------------------------
                     // Registra na tabela HISTORICOMOVIMENTACAO
                     //-------------------------------------------------------------------
                     nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                               FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                               FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
{Helen SOL Nº 153958 KINTANA Nº 1167601}                       iTipoMov,                                           // IDTIPOMOVIMENTACAO
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
                  //Helen SOL Nº 153958 KINTANA : 1167601
                  if iTipoMov = 104 then
                     FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat - (nBaixaD * (-1)))
                  else
                     FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := Bem.ConvNum(FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat - nBaixaD);
                  FcdsAcrescValorxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                  FcdsAcrescValorxDep.FieldByName('FLGDEPREC').AsInteger   := 0;
                  FcdsAcrescValorxDep.Post;

                  //----------------------------------------------------------------------
                  // Captura valor para Contabilização se for MoedaOficial
                  //----------------------------------------------------------------------
                  if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                  begin
                     if iTipoMov = 93 then //Helen SOL Nº 153958 KINTANA Nº 1167601
                        nValContabD := nValContabD + nBaixaD
                     else
                        nValContabD_Dec := nValContabD_Dec + nBaixaD;
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
                  nBaixaCMD := FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat;
                  if nBaixaCMD <> 0 then
                  begin
                     //Helen SOL Nº 153958 KINTANA Nº 1167601
                      if nBaixaCMD > 0 then
                         iTipoMov := 94
                      else
                         iTipoMov := 105;
                     if bPrimMov then
                     begin
                        //----------------------------------------------------------------
                        // Registra na tabela HISTORICOMOVIMENTACAO
                        //----------------------------------------------------------------
                        nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                                  FcdsBem.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                                  FcdsBem.FieldByName('IDMODULO').AsFloat,             // IDMODULO
{//Helen SOL Nº 153958 KINTANA Nº 1167601}                        iTipoMov,                                             // IDTIPOMOVIMENTACAO
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
                     //-------------------------------------------------------------------
                     // Captura valor para Contabilização se for MoedaOficial
                     //-------------------------------------------------------------------
                     if FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL then
                     begin
                        if iTipoMov = 94 then //Helen SOL Nº 153958 KINTANA Nº 1167601
                           nValContabCMD := nValContabCMD + nBaixaCMD
                        else
                           nValContabCMD_Dec := nValContabCMD_Dec + nBaixaCMD;
                     end;
                     

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
          //-------------------------------------------------------------------------------
          // Lançamento Contábil da Baixa dos Acréscimos
          //-------------------------------------------------------------------------------
          if bIntegraContab then
          begin
            if (nValContabB <> 0) or (nValContabCM <> 0) or
               (nValContabD <> 0) or (nValContabCMD <> 0) then
            begin
               if not CAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
                                                        FcdsBem.FieldByName('IDBEM').AsFloat,
                                                        dDataMov,
                                                        FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                        FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                        FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                        FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                        FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                        FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                        'A',
                                                        nValContabB, nValContabCM,
                                                        nValContabD, nValContabCMD,
                                                        FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                        FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                        iExercicio, iPeriodo, bCtaxCCusto) then
                  Raise Exception.Create(CAFxContab.MessageInfo);

            end;
            //Helen SOL Nº 153958 KINTANA Nº 1167601 - INICIO
             if (nValContabB_Dec <> 0) or (nValContabCM_Dec <> 0) or
                (nValContabD_Dec <> 0) or (nValContabCMD_Dec <> 0) then
            begin
                 if not CAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
                                                            FcdsBem.FieldByName('IDBEM').AsFloat,
                                                            dDataMov,
                                                            FcdsBem.FieldByName('IDGRUPO').AsFloat,          // iIdGrupoPai
                                                            FcdsBem.FieldByName('DESCGRUPO').AsString,       // iIdGrupoPai
                                                            FcdsBem.FieldByName('IDCONJUNTO').AsFloat,       // iIdConjuntoPai
                                                            FcdsBem.FieldByName('CODCENTROCUSTO').AsString,  // iIdConjuntoPai
                                                            FcdsBem.FieldByName('CODSUBCONTA').AsFloat,
                                                            FcdsBem.FieldByName('UNIDNEGOC').AsFloat,
                                                            'D',
                                                            nValContabB_Dec, nValContabCM_Dec,
                                                            nValContabD_Dec, nValContabCMD_Dec,
                                                            FcdsBem.FieldByName('DESBEM').AsString,          // Descrição do Pai
                                                            FcdsBem.FieldByName('PLACA').AsString,           // Placa do Pai
                                                            iExercicio, iPeriodo, bCtaxCCusto) then
                 Raise Exception.Create(CAFxContab.MessageInfo);
            end;
            //Helen SOL Nº 153958 KINTANA Nº 1167601 - FIM

          end;
          //-------------------------------------------------------------------------------
          // Recalcula a Taxa de Depreciacao nos Lançamentos da Tabela REAVALIACAO
          //-------------------------------------------------------------------------------
          FcdsReavaliacao.First;
          while not FcdsReavaliacao.EOF do
          begin
            FcdsReavaliacao.Edit;
            FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 0;
            FcdsReavaliacao.Post;
            //----------------------------------------------------------------------------
            // Registra no Histórico
            //----------------------------------------------------------------------------
            nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                 // IDBEM
                                                      FcdsBem.FieldByName('IDPESSOA').AsFloat,              // IDPESSOA
                                                      FcdsBem.FieldByName('IDMODULO').AsFloat,              // IDMODULO
                                                      53,                                                   // IDTIPOMOVIMENTACAO
                                                      dDataMov,                                             // DATAMOVIMENTACAO
                                                      FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                      -1,                                                   // DATAULTDEP
                                                      -1,                                                   // IDGRUPANT
                                                      -1,                                                   // IDCONJANT
                                                      -1,                                                   // IDLOCALANT
                                                      -1,                                                   // IDRESPANT
                                                      -1,                                                   // PLACAANT
                                                      -1,                                                   // PLNCODIGO
                                                      sObsReaval,                                           // OBSREAVAL
                                                      iTipDepProRata,                                       // TIPDEPPRORATA
                                                      -1,                                                   // IDTIPODESPESA
                                                      '',                                                   // OBSACRESCIMO
                                                      -1,                                                   // IDMOTIVOBAIXA
                                                       0,                                                   // PROPBAIXA
                                                       0,                                                   // VALVENDAOFI
                                                      '');                                                  // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavalxMoeda.Locate('IDREAVALIACAO', VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat]),[]);
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat =
                                                  FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat) do
            begin
               FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO', VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                            FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat =
                                                   FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat) and
                                                  (FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat =
                                                   FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat) do
               begin
                  //----------------------------------------------------------------------
                  // Registra a nova taxa de depreciação para o custo
                  //----------------------------------------------------------------------
                  nTaxaDepAnt := FcdsReavalxDep.FieldByName('TAXADEP').AsFloat;
                  FcdsReavalxDep.Edit;
                  FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep;
                  FcdsReavalxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a taxa de depreciação anterior no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsFloat,
                                                      0, nTaxaDepAnt) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Next;
               end;
               FcdsReavalxMoeda.Next;
            end;
            FcdsReavaliacao.Next;
          end;
          //-------------------------------------------------------------------------------
          // Registra as novas taxas de depreciação para a reavaliacao
          //-------------------------------------------------------------------------------
          if not FcdsReavaliacao.IsEmpty then
          begin
          //Wylliam Leite da Silva Sol: 176911 Kintana: 1616659 - inicio
              {if not ApplyCds(FcdsReavaliacao,_dbReavaliacao,[],[]) then
                Raise Exception.Create(_dbReavaliacao.MessageInfo);}
          //Wylliam Leite da Silva Sol: 176911 Kintana: 1616659 - Fim
            if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
          end;
          //-------------------------------------------------------------------------------
          // Recalcula a Taxa de Depreciacao nos Lançamentos da Tabela ACRESCIMOVALOR
          //-------------------------------------------------------------------------------
          FcdsAcrescimoValor.First;
          while not FcdsAcrescimoValor.EOF do
          begin
            //----------------------------------------------------------------------------
            // Registra no Histórico
            //----------------------------------------------------------------------------
            //Helen SOL Nº 153958 KINTANA Nº 1167601   - INICIO
            //-------------------------------------------------------------------------------
            // verifica se ja houve movimentação no bem após a Reavaliacao
            //-------------------------------------------------------------------------------
            sSql := ' SELECT IDTIPOMOVIMENTACAO ' + #13 +
                     ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                     ' WHERE IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString +
                     '   AND IDREAVALACRESC = ' + FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsString +
                     '   AND IDTIPOMOVIMENTACAO = 95 ';
            _cds.Data := GetDataPacket(sSql);
            if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsString <> ''  then
               iTipoMov := 101
            else
               iTipoMov := 54; //Helen SOL Nº 153958 KINTANA Nº 1167601  - FIM
            nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                      FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                      FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
{Helen SOL Nº 153958 KINTANA Nº 1167601}              iTipoMov,                                              // IDTIPOMOVIMENTACAO
                                                      dDataMov,                                              // DATAMOVIMENTACAO
                                                      FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                      -1,                                                    // DATAULTDEP
                                                      -1,                                                    // IDGRUPANT
                                                      -1,                                                    // IDCONJANT
                                                      -1,                                                    // IDLOCALANT
                                                      -1,                                                    // IDRESPANT
                                                      -1,                                                    // PLACAANT
                                                      -1,                                                    // PLNCODIGO
                                                      sObsReaval,                                            // OBSREAVAL
                                                      iTipDepProRata,                                        // TIPDEPPRORATA
                                                      -1,                                                    // IDTIPODESPESA
                                                      '',                                                    // OBSACRESCIMO
                                                      -1,                                                    // IDMOTIVOBAIXA
                                                       0,                                                    // PROPBAIXA
                                                       0,                                     // VALVENDAOFI
                                                      '');                                                   // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO', VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat]),[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat =
                                                       FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat) do
            begin
               FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO', VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat,
                                                                               FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat =
                                                        FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat) and
                                                       (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat =
                                                        FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat) do
               begin
                  //----------------------------------------------------------------------
                  // Registra a nova taxa de depreciação para o custo
                  //----------------------------------------------------------------------
                  nTaxaDepAnt := FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat;
                  FcdsAcrescValorxDep.Edit;
                  FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep;
                  FcdsAcrescValorxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a taxa de depreciação anterior no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat,
                                                      0, nTaxaDepAnt) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Next;
               end;
               FcdsAcrescValorxMoeda.Next;
            end;
            FcdsAcrescimoValor.Next;
          end;
          //-------------------------------------------------------------------------------
          // Registra as novas taxas de depreciação para o acréscimo de valor
          //-------------------------------------------------------------------------------
          if not FcdsAcrescimoValor.IsEmpty then
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
          //===============================================================================
          // Registrando o Saldo Contábil do Bem (Incluindo os Acréscimos e Excluindo as
          // Reavaliações) como novo Custo de Aquisição e a Nova Taxa de Depreciação
          // baseada na nova vida útil estipulada no laudo
          //-------------------------------------------------------------------------------
          // Realiza a entrada do novo custo de aquisicao
          //-------------------------------------------------------------------------------
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
                                                         81,                                      // IDTIPOMOVIMENTACAO
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
               //-------------------------------------------------------------------------
               bPrimMov := False;
            end;
            //----------------------------------------------------------------------------
            // Registra o valor no histórico
            //----------------------------------------------------------------------------
            FcdsSaldosContab.Locate('IDREAVALIACAO; MOECODIGO; IDTAXADEP',
                                    VarArrayOf([0,
                                                FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                1]),[]);
            if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                    FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                    0,
                                                    FcdsSaldosContab.FieldByName('SLDCONTAB').AsFloat) then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Entrada em BemxMoeda
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Edit;
            FcdsBemxMoeda.FieldByName('VALORG').AsFloat := FcdsSaldosContab.FieldByName('SLDCONTAB').AsFloat;
            FcdsBemxMoeda.Post;
            //----------------------------------------------------------------------------
            FcdsBemxMoeda.Next;
          end;
          if not ApplyCds(FcdsBemxMoeda,_dbBemxMoeda,[],[]) then
            Raise Exception.Create(_dbBemxMoeda.MessageInfo);
          //-------------------------------------------------------------------------------
          // Realiza a entrada dos novos valores das depreciações anteriores
          //-------------------------------------------------------------------------------
          FcdsReavaliacao.First;
          while not FcdsReavaliacao.EOF do
          begin
            bPrimMov := True;
            FcdsReavalxMoeda.Locate('IDREAVALIACAO',FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat,[]);
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').asFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').asFloat) do
            begin
               if bPrimMov then
               begin
                  //----------------------------------------------------------------------
                  // Registra na tabela HISTORICOMOVIMENTACAO
                  //----------------------------------------------------------------------
                  nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                            FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                            FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                            82,                                                    // IDTIPOMOVIMENTACAO
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
                  //----------------------------------------------------------------------
                  bPrimMov := False;
               end;
               //-------------------------------------------------------------------------
               // Registra o valor no histórico
               //-------------------------------------------------------------------------
               FcdsSaldosContab.Locate('IDREAVALIACAO;MOECODIGO;IDTAXADEP',
                                       VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger,
                                                   FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                   1]),[]);
               if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                       FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                       0,
                                                       FcdsSaldosContab.FieldByName('SLDCONTAB').AsFloat) then
                  Raise Exception.Create(HistMovBem.MessageInfo);
               //-------------------------------------------------------------------------
               // Registra a Baixa em ReavalxMoeda
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Edit;
               FcdsReavalxMoeda.FieldByName('VALORG').AsFloat := FcdsSaldosContab.FieldByName('SLDCONTAB').AsFloat;
               FcdsReavalxMoeda.Post;
               //-------------------------------------------------------------------------
               FcdsReavalxMoeda.Next;
            end;
            if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[],[]) then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
          end;
         end;//Cássio Rovaroto - SIG nº 46687
         //-------------------------------------------------------------------------------
         // Registra o Novo Saldo Contábil
         //-------------------------------------------------------------------------------
         FcdsBemxDep.First;
         while not FcdsBemxDep.EOF do
         begin
            iFlgPai := 1;
            nMoeCodigo := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
            while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = nMoeCodigo) do
            begin
               // Apenas o módulo de investimento imobiliário não deve realizar o recálculo do saldo do bem até a última movimentação
               if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                 FcdsBem.FieldByName('IDBEM').AsInteger,
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
                                                 2,
                                                 iFlgPai,
                                                 0, // Alterado por FHBS - 25/09/2018 - SIG46687
                                                 (Sistema.idModulo <> 54) // Alterado por FHBS - 25/09/2018 - SIG46687
                                                 ) then
                  Raise Exception.Create(Bem.MessageInfo);
               //-------------------------------------------------------------------------
               iFlgPai := 0;
               FcdsBemxDep.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Contabiliza a Reavaliação
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Prepara o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CAFxContab.ContabilizaReavaliacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                     FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                     FcdsBem.FieldByName('IDBEM').AsInteger,
                                                     FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                     FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                     FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                     FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                     FcdsBem.FieldByName('PLACA').AsString,
                                                     FcdsBem.FieldByName('DESBEM').AsString,
                                                     FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                     dDataMov, nSaldoReavalContab,
                                                     iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha Contábil
            //----------------------------------------------------------------------------
            nPlanilha := CAFxContab.RegistraPlanilhaContabil(FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                             FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                             nUsuario, DateToStr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha no Historico
            //----------------------------------------------------------------------------
            if nPlanilha > 0 then
            begin
               _dMTBem.sqlAtualizaPlnCodigo.Prepare;
               _dMTBem.sqlAtualizaPlnCodigo.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHistContab;
               _dMTBem.sqlAtualizaPlnCodigo.ParamByName('PLNCODIGO').AsFloat := nPlanilha;
               if not ExecSQL(_dMTBem.sqlAtualizaPlnCodigo.SQLChanged, True) then
                  Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         FIdReavaliacao := _dbReavaliacao.Idreavaliacao.AsInteger;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            FIdReavaliacao := -1;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Estorna a Reavaliacao Patrimonial de um bem (Método BaixaDep)
//========================================================================================
function TCtrlMovReavaliacao.EstornaReavaliacaoII(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                  dDataMov, dDataEst: TDateTime): Boolean;
var
   iFlgPai        : Integer;
   nPlnCodigo     : Extended;
   dDataMaxReaval : TDateTime;
   sSql           : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaReavaliacaoII(nModulo, nEmpresaProp, nUsuario, nBem,
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
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para reavaliação de bens
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
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação no bem após a Reavaliacao
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                 ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
            Raise Exception.Create(CMTranslate('Existe movimentação após a reavaliação do bem. Consulte Histórico de Movimentação!'));
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Pesquisa o número da planilha contabil lancada para a Reavaliação
         //-------------------------------------------------------------------------------
         sSql := ' SELECT PLNCODIGO ' +
                 ' FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDTIPOMOVIMENTACAO = 08 ' +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         if not _cds.FieldByName('PLNCODIGO').IsNull then
         begin
            nPlnCodigo := _cds.FieldByName('PLNCODIGO').AsFloat;
            if not CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               Raise Exception.Create(CAFxContab.MessageInfo);
         end else
         begin
            nPlnCodigo := -1;
         end;
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem
         // que terá a baixa estornada
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,nBem);
         FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,nBem);
         FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,nBem);
         FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,nBem);
         FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,nBem);
         FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,nBem);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,nBem);
         FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,nBem);
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
         // Retorna os Valores Baixados na Reavaliaçao na Tabela BEMXMOEDA e BEMXDEP
         //-------------------------------------------------------------------------------
         _dMTBem.sqlMovBaixaBem.Prepare;
         _dMTBem.sqlMovBaixaBem.ParamByName('IDBEM').AsFloat := nBem;
         _dMTBem.sqlMovBaixaBem.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
         _dMTBem.sqlMovBaixaBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         _cds.Data := _dMTBem.sqlMovBaixaBem.Data;
         //-------------------------------------------------------------------------------
         _cds.First;
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Posiciona a tabela de acordo com a movimentacao
            //----------------------------------------------------------------------------
            if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 83) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 84) then
               FcdsBemxMoeda.Locate('MOECODIGO',_cds.FieldByName('MOECODIGO').AsFloat,[])
            else
               FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                     _cds.FieldByName('IDTAXADEP').AsFloat]), []);
            //----------------------------------------------------------------------------
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               83 : begin
                       FcdsBemxMoeda.Edit;
                       FcdsBemxMoeda.FieldByName('VALORG').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                       FcdsBemxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               84 : begin
                       FcdsBemxMoeda.Edit;
                       FcdsBemxMoeda.FieldByName('CMBEM').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                       FcdsBemxMoeda.Post;
                    end;
               //-------------------------------------------------------------------------
               85 : begin
                       FcdsBemxDep.Edit;
                       FcdsBemxDep.FieldByName('DEPLANC').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                       FcdsBemxDep.Post;
                    end;
               //-------------------------------------------------------------------------
               86 : begin
                       FcdsBemxDep.Edit;
                       FcdsBemxDep.FieldByName('CMDEP').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
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
               if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 87) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 88) then
                  FcdsReavalxMoeda.Locate('IDREAVALIACAO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                _cds.FieldByName('MOECODIGO').AsFloat]),[])
               else
                  FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                           _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                           _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
               //-------------------------------------------------------------------------
               case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                  87 : begin
                          FcdsReavalxMoeda.Edit;
                          FcdsReavalxMoeda.FieldByName('VALORG').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsReavalxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  88 : begin
                          FcdsReavalxMoeda.Edit;
                          FcdsReavalxMoeda.FieldByName('CMBEM').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsReavalxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  89 : begin
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('DEPLANC').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsReavalxDep.Post;
                       end;
                  //----------------------------------------------------------------------
                  90 : begin
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('CMDEP').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
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
            _dMTBem.sqlMovBaixaAcresc.ParamByName('IDBEM').AsFloat := nBem;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('IDREAVALACRESC').AsFloat := FcdsAcrescimoValor.Fieldbyname('IDACRESCIMO').AsFloat;
            _dMTBem.sqlMovBaixaAcresc.ParamByName('DATAMOV').AsDateTime := dDataMov;
            _cds.Data := _dMTBem.sqlMovBaixaAcresc.Data;
            //----------------------------------------------------------------------------
            _cds.First;
            while not _cds.EOF do
            begin
               //-------------------------------------------------------------------------
               // Posiciona a tabela de acordo com a movimentacao
               //-------------------------------------------------------------------------
               if (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 91) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 92) or
{Helen SOL:153958}(_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 102) or (_cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 103) then
                  FcdsAcrescValorxMoeda.Locate('IDACRESCIMO;MOECODIGO',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                   _cds.FieldByName('MOECODIGO').AsFloat]),[])
               else
                  FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                 _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                 _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
               //-------------------------------------------------------------------------
               case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
                  91 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('VALORG').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  92 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  93 : begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('DEPLANC').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end;
                  //----------------------------------------------------------------------
                  94 : begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('CMDEP').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end;
                  //Helen SOL Nº 153958 KINTANA Nº 1167601 (102,103,104,105)
                  102 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('VALORG').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  103 : begin
                          FcdsAcrescValorxMoeda.Edit;
                          FcdsAcrescValorxMoeda.FieldByName('CMBEM').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxMoeda.Post;
                       end;
                  //----------------------------------------------------------------------
                  104 : begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('DEPLANC').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end;
                  //----------------------------------------------------------------------
                  105 : begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('CMDEP').AsCurrency := _cds.FieldByName('VALOR').AsFloat;
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
         // Remove os Registros da Baixa por Reavaliacao do Historico
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF ' +
                 ' FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 81  OR IDTIPOMOVIMENTACAO = 82  OR IDTIPOMOVIMENTACAO = 83 OR ' +
                 '        IDTIPOMOVIMENTACAO = 84  OR IDTIPOMOVIMENTACAO = 85  OR IDTIPOMOVIMENTACAO = 86 OR ' +
                 '        IDTIPOMOVIMENTACAO = 87  OR IDTIPOMOVIMENTACAO = 88  OR IDTIPOMOVIMENTACAO = 89 OR ' +
                 '        IDTIPOMOVIMENTACAO = 90  OR IDTIPOMOVIMENTACAO = 91  OR IDTIPOMOVIMENTACAO = 92 OR ' +
                 '        IDTIPOMOVIMENTACAO = 93  OR IDTIPOMOVIMENTACAO = 94  OR  ' +
{Helen SOL153958}'        IDTIPOMOVIMENTACAO = 102 OR IDTIPOMOVIMENTACAO = 103 OR IDTIPOMOVIMENTACAO = 104 OR IDTIPOMOVIMENTACAO = 105) ' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
        //Cássio Rovaroto - SIG nº 46687 - Início
        // if _cds.IsEmpty then
        //    Raise Exception.Create(CMTranslate('Não foi possível estornar a Reavaliação Patrimonial do Bem ') +
        //                           trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
        //                           floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
        //Cássio Rovaroto - SIG nº 46687 - Fim
         //-------------------------------------------------------------------------------
         while not _cds.Eof do
         begin
            sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os valores da Baixa para Reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(CMTranslate('Não foi possível remover o historico da Baixa para Reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         // Retorna o Tipo de Depreciação PróRata usado
         //-------------------------------------------------------------------------------
         _dMTBem.sqlMovReavalBem.Prepare;
         _dMTBem.sqlMovReavalBem.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlMovReavalBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlMovReavalBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         _cds.DATA := _dMTBem.sqlMovReavalBem.Data;
         //-------------------------------------------------------------------------------
         // Retorna as Taxa de Depreciação Originais
         //-------------------------------------------------------------------------------
         while not _cds.EOF do
         begin
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               08 : begin
                       if FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                                _cds.FieldByName('IDTAXADEP').AsFloat]), []) then
                       begin
                          FcdsBemxDep.Edit;
                          FcdsBemxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsBemxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (1)!'));
                    end;
               53 : begin
                       if FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                   _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                   _cds.FieldByName('IDTAXADEP').AsFloat]),[]) then
                       begin
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsReavalxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (2)!'));
                    end;
               54 : begin
                       if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsInteger,
                                                                                                         _cds.FieldByName('MOECODIGO').AsInteger,
                                                                                                         _cds.FieldByName('IDTAXADEP').AsInteger]),[]) then
                       begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (3)!'));
                    end;
               101 : begin
                       if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsInteger,
                                                                                                         _cds.FieldByName('MOECODIGO').AsInteger,
                                                                                                         _cds.FieldByName('IDTAXADEP').AsInteger]),[]) then
                       begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (4)!'));
                    end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Estorna a Depreciacao PróRata
         //-------------------------------------------------------------------------------
         if _cds.FieldByName('TIPDEPPRORATA').AsInteger = 0 then
         begin
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end else
         begin
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Retorna os Flag de Última Depreciação
         //-------------------------------------------------------------------------------
         dDataMaxReaval := 0;
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            if (FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0) and
               (FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime > dDataMaxReaval) then
               dDataMaxReaval := FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime;
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            if FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime = dDataMaxReaval then
            begin
               FcdsReavaliacao.Edit;
               FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 1;
               FcdsReavaliacao.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsReavaliacao,_dbReavaliacao,[],[]) then
            Raise Exception.Create(_dbReavaliacao.MessageInfo);
         //-------------------------------------------------------------------------------
         // Retira o link com a Planilha Contábil
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                 ' SET PLNCODIGO = NULL '+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 53 OR IDTIPOMOVIMENTACAO = 54 OR IDTIPOMOVIMENTACAO = 101) ' +   //Helen SOL153958 (101)
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
            if CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
            begin
               if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               begin
                  if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, nPlnCodigo,
                                                                   nModulo, nEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataMov)) then
                  begin
                     Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CAFxContab.MessageInfo);
                  end;
               end else
               begin
                  if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlnCodigo,
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
         //-------------------------------------------------------------------------------
         // Remove o lancamento das reavaliacoes
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDREAVALIACAO '+
                 ' FROM REAVALIACAO '+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAREAVALIACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if _cds.IsEmpty then
            Raise Exception.Create(CMTranslate('Não foi possível estornar a Reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
         while not _cds.EOF do
         begin
            sSql := ' DELETE FROM REAVALXDEP ' +
                    ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALIACAO').AsString;
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM REAVALXMOEDA ' +
                    ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALIACAO').AsString;
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            _cds.Next
         end;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM REAVALIACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAREAVALIACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove os Registros da Reavaliacao no Historico
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                 ' FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 53 OR IDTIPOMOVIMENTACAO = 54 OR IDTIPOMOVIMENTACAO = 101 ) ' + //Helen SOL153958(101)
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if _cds.IsEmpty then
            Raise Exception.Create(CMTranslate('Não foi possível estornar a Reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
         //-------------------------------------------------------------------------------
         while not _cds.Eof do
         begin
            if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 08 then
            begin
               sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover os valores da reavaliação do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM HMBREAVAL ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os dados do historico da reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 53 OR IDTIPOMOVIMENTACAO = 54 OR IDTIPOMOVIMENTACAO = 101 ) ' + //Helen SOL153958(101)
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover o historico da reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //-------------------------------------------------------------------------------
         // Atualiza o Saldo Contábil do bem
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.First;
         while not FcdsBemxMoeda.EOF do
         begin
            iFlgPai := 1;
            FcdsBemxDep.First;
            while not FcdsBemxDep.EOF do
            begin
               // SIG 46687 - Início
               // Apenas o módulo de investimento imobiliário não deve realizar o recálculo do saldo do bem até a última movimentação
               // Deleção dos registros de saldo dos imóveis, respeitando a data de realivação informada na interface
               if Sistema.idModulo <> 54 then
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
                    //----------------------------------------------------------------------
                    iFlgPai := 0;
                 end;
               end else
               begin
                  sSql := ' DELETE FROM SLDCTBBEMXDEP ' + #13 +
                          ' WHERE (IDBEM = ' + inttostr(FcdsBemxDep.FieldByName('IDBEM').AsInteger) + ')' + #13 +
                          '   AND (IDPESSOA = ' + inttostr(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger) + ')' + #13 +
                          '   AND (MOECODIGO = ' + inttostr(FcdsBemxDep.FieldByName('MOECODIGO').AsInteger) + ')' + #13 +
                          '   AND (DATASLDBEM = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))';
                  if not ExecSQL(sSql, False) then
                    Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                           trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                           floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico de Saldo!') + #13 + MessageInfo);
                  //----------------------------------------------------------------------------
                  sSql := ' DELETE FROM SALDOCONTABBEM ' + #13 +
                          ' WHERE (IDBEM = ' + inttostr(FcdsBemxDep.FieldByName('IDBEM').AsInteger) + ')' + #13 +
                          '   AND (IDPESSOA = ' + inttostr(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger) + ')' + #13 +
                          '   AND (MOECODIGO = ' + inttostr(FcdsBemxDep.FieldByName('MOECODIGO').AsInteger) + ')' + #13 +
                          '   AND (DATASLDBEM = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))';
                  if not ExecSQL(sSql, False) then
                    Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                           trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                           floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico de Saldo!') + #13 + MessageInfo);
               end;
               // SIG 46687 - Fim

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
//========================================================================================
// Executa um Termo de Reavaliação
//----------------------------------------------------------------------------------------
function TCtrlMovReavaliacao.ExecutaTermoReaval(nModulo, nEmpresaProp, nUsuario, nSelBaixa: Extended;
                                                dDataReaval: TDateTime; iTipDepProRata: Integer;
                                                sBilhete : String) : Boolean;
var
   bTransacao : Boolean;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTermoReaval(nModulo, nEmpresaProp, nUsuario,
                                                        nSelBaixa, dDataReaval,
                                                        iTipDepProRata, sBilhete);
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
         FcdsSelBaixaBens.Data := ListaSelReavalBens(nEmpresaProp, nSelBaixa);
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
         // Processa as Baixas
         //-------------------------------------------------------------------------------
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Reavaliando Placa ') + FcdsSelBaixaBens.FieldByName('PLACA').AsString;
               iPrgBarPos := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            if not ExecutaReavaliacaoII(nModulo, nEmpresaProp, nUsuario,
                                        FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                        dDataReaval,
                                        FcdsSelBaixaBens.FieldByName('VALORLAUDO').AsFloat,
                                        FcdsSelBaixaBens.FieldByName('VIDAUTIL').AsInteger,
                                        FcdsSelBaixaBens.FieldByName('OBSREAVAL').AsString,
                                        iTipDepProRata) then
               Raise Exception.Create(MessageInfo + #13 + #13 + 'na Reavaliação do bem ' +
                                      FcdsSelBaixaBens.FieldByName('PLACA').AsString + ' - ' +
                                      FcdsSelBaixaBens.FieldByName('DESBEM').AsString);
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
         // Seta o Termo como Executado
         //-------------------------------------------------------------------------------
         Fcds.Data := ListaSelReaval(nEmpresaProp, nSelBaixa);
         Fcds.Edit;
         Fcds.FieldByName('SBXFLGEXECUTADO').AsInteger  := 1;
         Fcds.FieldByName('SBXDTAEXECUTADO').AsDateTime := dDataReaval;
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
// Estorna um Termo de Reavaliação
//----------------------------------------------------------------------------------------
function TCtrlMovReavaliacao.EstornaTermoReaval(nModulo, nEmpresaProp, nUsuario,
                                                nSelBaixa: Extended; dDataMov,
                                                dDataEst: TDateTime): Boolean;
var
   bTransacao : Boolean;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaTermoReaval(nModulo, nEmpresaProp, nUsuario,
                                                        nSelBaixa, dDataMov, dDataEst);
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
         FcdsSelBaixaBens.Data := ListaSelReavalBens(nEmpresaProp, nSelBaixa);
         FcdsSelBaixaBens.First;
         while not FcdsSelBaixaBens.EOF do
         begin
            if not EstornaReavaliacaoII(nModulo, nEmpresaProp, nUsuario,
                                        FcdsSelBaixaBens.FieldByName('IDBEM').AsFloat,
                                        dDataMov, dDataEst) then
               Raise Exception.Create(MessageInfo + #13 + #13 + 'no Estorno da Reavaliação do bem ' +
                                      FcdsSelBaixaBens.FieldByName('PLACA').AsString + ' - ' +
                                      FcdsSelBaixaBens.FieldByName('DESBEM').AsString);
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
         Fcds.Data := ListaSelReaval(nEmpresaProp,nSelBaixa);
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
// Executa a retificação da última reavaliação de um bem
//========================================================================================
function TCtrlMovReavaliacao.ExecutaRetificaReaval(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                   dDataUltReaval, dDataMov: TDateTime;
                                                   nValLaudo: Extended; iVidaUtil: Integer;
                                                   sObsReaval: String; iTipDepProRata: Integer;
                                                   bFazDepreciacao: Boolean = True): Boolean;
var
   dDataUltMov, dDataUltDep,
   dDataUltReaval9                         : TDateTime;
   nNovaTaxaDep, nSeqHist, nSeqHistContab,
   nMoeValLaudo, nSldContabil,
   nSaldoReaval, nSaldoReavalContab,
   nTaxaDepAnt, nPlanilha, nMoeCodigo,
   nValContabB, nValContabCM,
   nValContabD, nValContabCMD,
   nDepLancNovo, nDepLancDif,
   nNovaTaxaDep9                           : Extended;
   iFlgPai, iHistMovBem                    : Integer;
   sSql                                    : String;
   bPrimMov, bRegDifLaudo                  : Boolean;
   //-------------------------------------------------------------------------------------
   aHistMovBem  : Array of Extended;
   iaHistMovBem : Integer;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaRetificaReaval(nModulo, nEmpresaProp, nUsuario, nBem,
                                                           dDataUltReaval, dDataMov, nValLaudo, iVidaUtil,
                                                           sObsReaval, iTipDepProRata);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para reavaliação de bens
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
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if iVidaUtil < 0 then
            raise Exception.Create(CMTranslate('Tempo de Vida Útil Zerado igual a Taxa de Depreciação Zerada!'));
         //-------------------------------------------------------------------------------
         if nValLaudo < 0 then
            raise Exception.Create(CMTranslate('Informe o novo valor do bem!'));
         //-------------------------------------------------------------------------------
         if sObsReaval = '' then
            raise Exception.Create(CMTranslate('Declare as informações relativas ao laudo de reavaliação!'));
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
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '08', dDataMov, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil do Fechamento PróRata
         //-------------------------------------------------------------------------------
         if bIntegraContab then
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
         end;
         //-------------------------------------------------------------------------------
         // Calcula o Fechamento PróRata
         //-------------------------------------------------------------------------------
         ProRata.iaHistMovBem := -1;
         if iTipDepProRata < 2 then
         begin
            if iTipDepProRata = 0 then
            begin
               if not ProRata.ExecutarII(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end else
            begin
               if not ProRata.ExecutarII(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Planilha Contábil do Fechamento PróRata
         //-------------------------------------------------------------------------------
         if bIntegraContab and (not CAFxContab.cdsMontaContab.IsEmpty) then
         begin
            nPlanilha := CAFxContab.RegistraPlanilhaContabil(nModulo, nEmpresaProp,
                                                             nUsuario, datetostr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CAFxContab.MessageInfo);
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
         // Prepara a montagem da planilha contábil da Retificação da Reavaliação
         //-------------------------------------------------------------------------------
         if bIntegraContab then
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
         end;
         //-------------------------------------------------------------------------------
         iaHistMovBem := 0;
         //-------------------------------------------------------------------------------
         nSaldoReavalContab := 0;

         //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Início
         if bFazDepreciacao then
         begin
         //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Fim
           //-------------------------------------------------------------------------------
           // Calcula a taxa de depreciacao retificada
           //-------------------------------------------------------------------------------
           nNovaTaxaDep := 0;
           if iVidaUtil > 0 then
              nNovaTaxaDep := (100 / (iVidaUtil / 12));
           //*******************************************************************************
           // Processa a última reavaliação, incluindo a diferença entre os laudos
           //*******************************************************************************
           FcdsReavaliacao.Data  := Bem.ListaReavaliacao(nEmpresaProp, nBem, True);
           FcdsReavalxMoeda.Data := Bem.ListaReavalxMoeda(nEmpresaProp, nBem, FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat);
           FcdsReavalxDep.Data   := Bem.ListaReavalxDep(nEmpresaProp, nBem, FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat);
           //-------------------------------------------------------------------------------
           while not FcdsReavalxMoeda.EOF do
           begin
              FcdsReavalxDep.Locate('MOECODIGO', VarArrayOf([FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
              nSeqHist := -9;
              nMoeValLaudo := 0;
              bRegDifLaudo := True;
              while (not FcdsReavalxDep.EOF) and
                    (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger) do
              begin
                 //-------------------------------------------------------------------------
                 // Registra a Diferença entre o Laudo Anterior e o Laudo Atual
                 //-------------------------------------------------------------------------
                 if bRegDifLaudo then
                 begin
                    nSldContabil := Bem.SaldoContabil(FcdsReavalxDep.FieldByName('IDPESSOA').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDBEM').AsInteger,
                                                       FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                       FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                       FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger);
                    if Bem.MessageInfo <> '' then
                       Raise Exception.Create(Bem.MessageInfo);
                    //----------------------------------------------------------------------
                    if FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat <> ParamCAF.MOEDAOFICIAL then
                    begin
                       nMoeValLaudo := Bem.ConversaoMoeda(nValLaudo, FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime);
                       if nMoeValLaudo < 0 then
                          Raise Exception.Create(Bem.MessageInfo);
                    end else
                    begin
                       nMoeValLaudo := nValLaudo;
                    end;
                    //----------------------------------------------------------------------
                    nSaldoReaval := nMoeValLaudo - nSldContabil;
                    //----------------------------------------------------------------------
                    FcdsReavalxMoeda.Edit;
                    FcdsReavalxMoeda.FieldByName('VALORG').AsFloat := FcdsReavalxMoeda.FieldByName('VALORG').AsFloat + nSaldoReaval;
                    FcdsReavalxMoeda.Post;
                    //----------------------------------------------------------------------
                    nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                 // IDBEM
                                                              FcdsBem.FieldByName('IDPESSOA').AsFloat,              // IDPESSOA
                                                              FcdsBem.FieldByName('IDMODULO').AsFloat,              // IDMODULO
                                                              08,                                                   // IDTIPOMOVIMENTACAO
                                                              dDataMov,                                             // DATAMOVIMENTACAO
                                                              FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                              -1,                                                   // DATAULTDEP
                                                              -1,                                                   // IDGRUPANT
                                                              -1,                                                   // IDCONJANT
                                                              -1,                                                   // IDLOCALANT
                                                              -1,                                                   // IDRESPANT
                                                              -1,                                                   // PLACAANT
                                                              -1,                                                   // PLNCODIGO
                                                              sObsReaval,                                           // OBSREAVAL
                                                              iTipDepProRata,                                       // TIPDEPPRORATA
                                                              -1,                                                   // IDTIPODESPESA
                                                              '',                                                   // OBSACRESCIMO
                                                              -1,                                                   // IDMOTIVOBAIXA
                                                               0,                                                   // PROPBAIXA
                                                               0,                                                   // VALVENDAOFI
                                                              '',                                                   // OBSBAIXA
                                                              -1,
                                                              True);
                    if nSeqHist = -1 then
                       Raise Exception.Create(HistMovBem.MessageInfo);
                    //----------------------------------------------------------------------
                    // Captura o id da movimentacao para registro da planilha contábil
                    //----------------------------------------------------------------------
                    SetLength(aHistMovBem,iaHistMovBem + 1);
                    aHistMovBem[iaHistMovBem] := nSeqHist;
                    iaHistMovBem := iaHistMovBem + 1;
                    //----------------------------------------------------------------------
                    // Registra o Saldo de Reavaliacao no historico
                    //----------------------------------------------------------------------
                    if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                            FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                            0,
                                                            nSaldoReaval) then
                       Raise Exception.Create(HistMovBem.MessageInfo);
                    //----------------------------------------------------------------------
                    if (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                       (FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger = 1) then
                    begin
                       nSaldoReavalContab := nSaldoReaval;
                    end;
                    //----------------------------------------------------------------------
                    bRegDifLaudo := True;
                 end;
                 //-------------------------------------------------------------------------
                 // Registra a taxa de depreciação retificada para o custo
                 //-------------------------------------------------------------------------
                 nTaxaDepAnt := FcdsReavalxDep.FieldByName('TAXADEP').AsFloat;
                 FcdsReavalxDep.Edit;
                 FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep;
                 FcdsReavalxDep.Post;
                 //-------------------------------------------------------------------------
                 // Registra a taxa de depreciação anterior no historico
                 //-------------------------------------------------------------------------
                 if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                     FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat,
                                                     FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsFloat,
                                                     nMoeValLaudo, nTaxaDepAnt) then
                    Raise Exception.Create(HistMovBem.MessageInfo);
                 //-------------------------------------------------------------------------
                 FcdsReavalxDep.Next;
              end;
              FcdsReavalxMoeda.Next;
           end;

           //-------------------------------------------------------------------------------
           // Registra os registros filhos da reavaliacao
           //-------------------------------------------------------------------------------
           if not ApplyCds(FcdsReavalxMoeda,_dbReavalxMoeda,[_dbReavaliacao.IDREAVALIACAO],[_dbReavalxMoeda.IDREAVALIACAO]) then
              Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
           if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[_dbReavaliacao.IDREAVALIACAO],[_dbReavalxDep.IDREAVALIACAO]) then
              Raise Exception.Create(_dbReavalxDep.MessageInfo);
           //*******************************************************************************
           // Registra as Diferenças de Depreciação
           //*******************************************************************************
           //-------------------------------------------------------------------------------
           // Alimentando os DataSets Filhos com os dados do bem que será retificado
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
           // Lança as Diferenças de Depreciação no Custo Aquisição
           //-------------------------------------------------------------------------------
           nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,      // IDBEM
                                                     FcdsBem.FieldByName('IDPESSOA').AsFloat,   // IDPESSOA
                                                     FcdsBem.FieldByName('IDMODULO').AsFloat,   // IDMODULO
                                                     14,                                        // IDTIPOMOVIMENTACAO
                                                     dDataMov,                                  // DATAMOVIMENTACAO
                                                     -1,                                        // IDREAVALACRESC
                                                     -1,                                        // DATAULTDEP
                                                     -1,                                        // IDGRUPANT
                                                     -1,                                        // IDCONJANT
                                                     -1,                                        // IDLOCALANT
                                                     -1,                                        // IDRESPANT
                                                     -1,                                        // PLACAANT
                                                     -1,                                        // PLNCODIGO
                                                     '',                                        // OBSREAVAL
                                                      1,                                        // TIPDEPPRORATA
                                                     -1,                                        // IDTIPODESPESA
                                                     '',                                        // OBSACRESCIMO
                                                     -1,                                        // IDMOTIVOBAIXA
                                                      0,                                        // PROPBAIXA
                                                      0,                                        // VALVENDAOFI
                                                     '',                                        // OBSBAIXA
                                                     -1,
                                                     True);
           if nSeqHist = -1 then
              Raise Exception.Create(HistMovBem.MessageInfo);
           //-------------------------------------------------------------------------------
           // Captura o id da movimentacao para registro da planilha contábil
           //-------------------------------------------------------------------------------
           SetLength(aHistMovBem,iaHistMovBem + 1);
           aHistMovBem[iaHistMovBem] := nSeqHist;
           iaHistMovBem := iaHistMovBem + 1;
           //-------------------------------------------------------------------------------
           while not FcdsBemxMoeda.EOF do
           begin
              FcdsBemxDep.Locate('MOECODIGO', VarArrayOf([FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
              while (not FcdsBemxDep.EOF) and
                    (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = FcdsBemxMoeda.FieldByName('MOECODIGO').AsInteger) do
              begin
                 //-------------------------------------------------------------------------
                 // Calcula a Depreciação que deveria ter sido calculada
                 //-------------------------------------------------------------------------
                 nDepLancNovo := ProRata.CalcularDeprecBemTaxaDif(nModulo, nEmpresaProp, nBem,
                                                                  FcdsBemxDep.FieldByName('MOECODIGO').AsFloat,
                                                                  FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat,
                                                                  dDataMov, dDataUltReaval, nNovaTaxaDep,
                                                                  'B', 0);
                 //-------------------------------------------------------------------------
                 nDepLancDif := nDepLancNovo - (FcdsBemxDep.FieldByName('DEPLANC').AsFloat + FcdsBemxDep.FieldByName('CMDEP').AsFloat);
                 //-------------------------------------------------------------------------
                 FcdsBemxDep.Edit;
                 FcdsBemxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep;
                 FcdsBemxDep.FieldByName('DEPLANC').AsFloat := nDepLancNovo;
                 FcdsBemxDep.Post;
                 //-------------------------------------------------------------------------
                 // Registra a Diferença de Depreciação na Contabilidade
                 //-------------------------------------------------------------------------
                 if bIntegraContab and
                   (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) then
                 begin
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
                 end;
                 //-------------------------------------------------------------------------
                 if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                         FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                         FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                         nDepLancDif) then
                    Raise Exception.Create(HistMovBem.MessageInfo);
                 //-------------------------------------------------------------------------
                 FcdsBemxDep.Next;
              end;
              FcdsBemxMoeda.Next;
           end;
           if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
              Raise Exception.Create(_dbBemxDep.MessageInfo);
           //-------------------------------------------------------------------------------
           // Lança as Diferenças de Depreciação nas Reavaliações
           //-------------------------------------------------------------------------------
           while not FcdsReavaliacao.EOF do
           begin
              nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                 // IDBEM
                                                        FcdsBem.FieldByName('IDPESSOA').AsFloat,              // IDPESSOA
                                                        FcdsBem.FieldByName('IDMODULO').AsFloat,              // IDMODULO
                                                        18,                                                   // IDTIPOMOVIMENTACAO
                                                        dDataMov,                                             // DATAMOVIMENTACAO
                                                        FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                        -1,                                                   // DATAULTDEP
                                                        -1,                                                   // IDGRUPANT
                                                        -1,                                                   // IDCONJANT
                                                        -1,                                                   // IDLOCALANT
                                                        -1,                                                   // IDRESPANT
                                                        -1,                                                   // PLACAANT
                                                        -1,                                                   // PLNCODIGO
                                                        '',                                                   // OBSREAVAL
                                                         1,                                                   // TIPDEPPRORATA
                                                        -1,                                                   // IDTIPODESPESA
                                                        '',                                                   // OBSACRESCIMO
                                                        -1,                                                   // IDMOTIVOBAIXA
                                                         0,                                                   // PROPBAIXA
                                                         0,                                                   // VALVENDAOFI
                                                        '',                                                   // OBSBAIXA
                                                        -1,
                                                        True);
              if nSeqHist = -1 then
                 Raise Exception.Create(HistMovBem.MessageInfo);
              //----------------------------------------------------------------------------
              // Captura o id da movimentacao para registro da planilha contábil
              //----------------------------------------------------------------------------
              SetLength(aHistMovBem,iaHistMovBem + 1);
              aHistMovBem[iaHistMovBem] := nSeqHist;
              iaHistMovBem := iaHistMovBem + 1;
              //----------------------------------------------------------------------------
              FcdsReavalxMoeda.Locate('IDREAVALIACAO', VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger]),[]);
              while (not FcdsReavalxMoeda.EOF) and
                    (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) do
              begin
                 FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO', VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger,
                                                                              FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
                 while (not FcdsReavalxDep.EOF) and
                       (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsInteger = FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsInteger) and
                       (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = FcdsReavalxMoeda.FieldByName('MOECODIGO').AsInteger) do
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a Depreciação que deveria ter sido calculada
                    //----------------------------------------------------------------------
                    nDepLancNovo := ProRata.CalcularDeprecBemTaxaDif(nModulo, nEmpresaProp, nBem,
                                                                     FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat,
                                                                     FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsFloat,
                                                                     dDataMov, dDataUltReaval, nNovaTaxaDep,
                                                                     'R', FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat);
                    //----------------------------------------------------------------------
                    nDepLancDif := nDepLancNovo - (FcdsReavalxDep.FieldByName('DEPLANC').AsFloat + FcdsReavalxdep.FieldByName('CMDEP').AsFloat);
                    //----------------------------------------------------------------------
                    FcdsReavalxDep.Edit;
                    FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep;
                    FcdsReavalxDep.FieldByName('DEPLANC').AsFloat := nDepLancNovo;
                    FcdsReavalxDep.Post;
                    //----------------------------------------------------------------------
                    // Registra a Diferença de Depreciação na Contabilidade
                    //----------------------------------------------------------------------
                    if bIntegraContab and
                      (FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) then
                    begin
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
                                                                dDataMov,nDepLancDif,'R',
                                                                iExercicio, iPeriodo,
                                                                False, bCtaxCCusto) then
                          Raise Exception.Create(CAFxContab.MessageInfo);
                    end;
                    //----------------------------------------------------------------------
                    if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                            FcdsReavalxDep.FieldByName('MOECODIGO').AsInteger,
                                                            FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsInteger,
                                                            nDepLancDif) then
                       Raise Exception.Create(HistMovBem.MessageInfo);
                    //----------------------------------------------------------------------
                    FcdsReavalxDep.Next;
                 end;
                 FcdsReavalxMoeda.Next;
              end;
              FcdsReavaliacao.Next;
           end;
           if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
              Raise Exception.Create(_dbReavalxDep.MessageInfo);
           //-------------------------------------------------------------------------------
           // Lança as Diferenças de Depreciação nos Acréscimos de Valor
           //-------------------------------------------------------------------------------
           while not FcdsAcrescimoValor.EOF do
           begin
              nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                        FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                        FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                        35,                                                    // IDTIPOMOVIMENTACAO
                                                        dDataMov,                                              // DATAMOVIMENTACAO
                                                        FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                        -1,                                                    // DATAULTDEP
                                                        -1,                                                    // IDGRUPANT
                                                        -1,                                                    // IDCONJANT
                                                        -1,                                                    // IDLOCALANT
                                                        -1,                                                    // IDRESPANT
                                                        -1,                                                    // PLACAANT
                                                        -1,                                                    // PLNCODIGO
                                                        '',                                                    // OBSREAVAL
                                                         1,                                                    // TIPDEPPRORATA
                                                        -1,                                                    // IDTIPODESPESA
                                                        '',                                                    // OBSACRESCIMO
                                                        -1,                                                    // IDMOTIVOBAIXA
                                                         0,                                                    // PROPBAIXA
                                                         0,                                                    // VALVENDAOFI
                                                        '',                                                    // OBSBAIXA
                                                        -1,
                                                        True);
              if nSeqHist = -1 then
                 Raise Exception.Create(HistMovBem.MessageInfo);
              //----------------------------------------------------------------------------
              // Captura o id da movimentacao para registro da planilha contábil
              //----------------------------------------------------------------------------
              SetLength(aHistMovBem,iaHistMovBem + 1);
              aHistMovBem[iaHistMovBem] := nSeqHist;
              iaHistMovBem := iaHistMovBem + 1;
              //----------------------------------------------------------------------------
              FcdsAcrescValorxMoeda.Locate('IDACRESCIMO', VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger]),[]);
              while (not FcdsAcrescValorxMoeda.EOF) and
                    (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger) do
              begin
                 FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO', VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger,
                                                                                 FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger]),[]);
                 while (not FcdsAcrescValorxDep.EOF) and
                       (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsInteger) and
                       (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsInteger) do
                 begin
                    if FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime > dDataUltReaval then
                    begin
                       dDataUltReaval9 := FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime;
                       //-------------------------------------------------------------------
                       // Acréscimo de Valor realizado após Reavaliação
                       // Necessário refazer a taxa de depreciação do Acréscimo
                       //-------------------------------------------------------------------
                       FcdsBemxMoeda.Locate('MOECODIGO', VarArrayOf([FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger]),[]);
                       FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                                             FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger]),[]);
                       //-------------------------------------------------------------------
                       nNovaTaxaDep9 := AcrescimoValor.CalculaTaxaDep((FcdsBemxDep.FieldByName('DEPLANC').AsFloat +
                                                                       FcdsBemxDep.FieldByName('CMDEP').AsFloat),
                                                                      (FcdsBemxMoeda.FieldByName('VALORG').AsFloat +
                                                                       FcdsBemxMoeda.FieldByName('CMBEM').AsFloat),
                                                                       FcdsBemxDep.FieldByName('TAXADEP').asFloat,
                                                                       FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime);
                       if nNovaTaxaDep9 < 0 then
                          nNovaTaxaDep9 := 0;
                       //-------------------------------------------------------------------
                       // Registra a taxa de depreciação anterior no historico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                           FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat,
                                                           FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat,
                                                           0,
                                                           FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                    end else
                    begin
                       dDataUltReaval9 := dDataUltReaval;
                       nNovaTaxaDep9 := nNovaTaxaDep;
                    end;
                    //----------------------------------------------------------------------
                    // Calcula a Depreciação que deveria ter sido calculada
                    //----------------------------------------------------------------------
                    nDepLancNovo := ProRata.CalcularDeprecBemTaxaDif(nModulo, nEmpresaProp, nBem,
                                                                     FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat,
                                                                     FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat,
                                                                     dDataMov, dDataUltReaval9, nNovaTaxaDep9,
                                                                     'R', FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat);
                    //----------------------------------------------------------------------
                    nDepLancDif := nDepLancNovo - (FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat + FcdsAcrescValorxdep.FieldByName('CMDEP').AsFloat);
                    //----------------------------------------------------------------------
                    FcdsAcrescValorxDep.Edit;
                    FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := nNovaTaxaDep9;
                    FcdsAcrescValorxDep.FieldByName('DEPLANC').AsFloat := nDepLancNovo;
                    FcdsAcrescValorxDep.Post;
                    //----------------------------------------------------------------------
                    // Registra a Diferença de Depreciação na Contabilidade
                    //----------------------------------------------------------------------
                    if bIntegraContab and
                      (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) then
                    begin
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
                                                                dDataMov,nDepLancDif,'A',
                                                                iExercicio, iPeriodo,
                                                                False, bCtaxCCusto) then
                          Raise Exception.Create(CAFxContab.MessageInfo);
                    end;
                    //----------------------------------------------------------------------
                    if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                            FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsInteger,
                                                            FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                            nDepLancDif) then
                       Raise Exception.Create(HistMovBem.MessageInfo);
                    //----------------------------------------------------------------------
                    FcdsAcrescValorxDep.Next;
                 end;
                 FcdsAcrescValorxMoeda.Next;
              end;
              FcdsAcrescimoValor.Next;
           //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Início
           end;
           //Cássio - SOL Nº 109611 KINTANA Nº 497579 - Fim
           if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
              Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);

           //-------------------------------------------------------------------------------
           // Registra o Novo Saldo Contábil
           //-------------------------------------------------------------------------------
           FcdsBemxDep.First;
           while not FcdsBemxDep.EOF do
           begin
              iFlgPai := 1;
              nMoeCodigo := FcdsBemxDep.FieldByName('MOECODIGO').AsInteger;
              while (not FcdsBemxDep.EOF) and (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = nMoeCodigo) do
              begin
                 if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                   FcdsBem.FieldByName('IDBEM').AsInteger,
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
           end;
         end;
         //-------------------------------------------------------------------------------
         // Contabiliza a Reavaliação
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Prepara o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CAFxContab.ContabilizaReavaliacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                     FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                     FcdsBem.FieldByName('IDBEM').AsInteger,
                                                     FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                     FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                     FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                     FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                     FcdsBem.FieldByName('PLACA').AsString,
                                                     FcdsBem.FieldByName('DESBEM').AsString,
                                                     FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                     dDataMov, nSaldoReavalContab,
                                                     iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha Contábil
            //----------------------------------------------------------------------------
            nPlanilha := CAFxContab.RegistraPlanilhaContabil(FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                             FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                             nUsuario, DateToStr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra na tabela HISTORICOMOVIMENTACAO a planilha gerada
            //----------------------------------------------------------------------------
            if nPlanilha > 0 then
            begin
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
function TCtrlMovReavaliacao.EstornaRetificaReaval(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                   dDataMov, dDataEst, dDataUltReaval: TDateTime): Boolean;
var
   iFlgPai, iTipoBem,
   iTipDepProRata     : Integer;
   nPlnCodigo,
   nsValOrg, nsCmBem,
   nsDepLanc, nsCmDep : Extended;
   sSql               : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaRetificaReaval(nModulo, nEmpresaProp, nUsuario, nBem,
                                                           dDataMov, dDataUltReaval);
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
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para reavaliação de bens
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
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação no bem após a Reavaliacao
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' + #13 +
                 ' FROM HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
            Raise Exception.Create(CMTranslate('Existe movimentação após a retificação da reavaliação do bem. Consulte Histórico de Movimentação!'));
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Pesquisa o número da planilha contabil lancada para a Reavaliação
         //-------------------------------------------------------------------------------
         sSql := ' SELECT PLNCODIGO, TIPDEPPRORATA' +
                 ' FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDTIPOMOVIMENTACAO = 08 ' +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',' + QuotedStr('dd/mm/yyyy') + ')' +
                 '   AND FLGRETIFICAREAVAL = 1 ' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         iTipDepProRata := _cds.FieldByName('TIPDEPPRORATA').AsInteger;
         if not _cds.FieldByName('PLNCODIGO').IsNull then
         begin
            nPlnCodigo := _cds.FieldByName('PLNCODIGO').AsFloat;
            if not CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
               Raise Exception.Create(CAFxContab.MessageInfo);
         end else
         begin
            nPlnCodigo := -1;
         end;
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem
         // que terá a retificação da reavaliação estornada
         //-------------------------------------------------------------------------------
         FcdsBemxMoeda.Data         := Bem.ListaBemxMoeda(nEmpresaProp,nBem);
         FcdsBemxDep.Data           := Bem.ListaBemxDep(nEmpresaProp,nBem);
         FcdsReavaliacao.Data       := Bem.ListaReavaliacao(nEmpresaProp,nBem);
         FcdsReavalxMoeda.Data      := Bem.ListaReavalxMoeda(nEmpresaProp,nBem);
         FcdsReavalxDep.Data        := Bem.ListaReavalxDep(nEmpresaProp,nBem);
         FcdsAcrescimoValor.Data    := Bem.ListaAcrescimoValor(nEmpresaProp,nBem);
         FcdsAcrescValorxMoeda.Data := Bem.ListaAcrescValorxMoeda(nEmpresaProp,nBem);
         FcdsAcrescValorxDep.Data   := Bem.ListaAcrescValorxDep(nEmpresaProp,nBem);
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
         // Retorna o Tipo de Depreciação PróRata usado
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRetReavalBem.Prepare;
         _dMTBem.sqlRetReavalBem.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlRetReavalBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlRetReavalBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         _cds.Data := _dMTBem.sqlRetReavalBem.Data;
         //-------------------------------------------------------------------------------
         // Retorna as Taxas de Depreciação Originais
         //-------------------------------------------------------------------------------
         while not _cds.EOF do
         begin
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               //-------------------------------------------------------------------------
               // Recoloca as taxas originais nos três elementos dos bens
               //-------------------------------------------------------------------------
               08 : begin
                       //-----------------------------------------------------------------
                       // BEMXDEP
                       //-----------------------------------------------------------------
                       if FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                                _cds.FieldByName('IDTAXADEP').AsFloat]), []) then
                       begin
                          FcdsBemxDep.Edit;
                          FcdsBemxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsBemxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (1)!'));
                       //-----------------------------------------------------------------
                       // REAVALXDEP
                       //-----------------------------------------------------------------
                       FcdsReavaliacao.First;
                       while not FcdsReavaliacao.EOF do
                       begin
                          if FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime <= dDataUltReaval then
                          begin
                             FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP', VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,
                                                                                                       _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                       _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
                             while not FcdsReavalxDep.EOF do
                             begin
                                if (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat = FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat) and
                                   (FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat = _cds.FieldByName('MOECODIGO').AsFloat) and
                                   (FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsFloat = _cds.FieldByName('IDTAXADEP').AsFloat) then
                                begin
                                   FcdsReavalxDep.Edit;
                                   FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                                   FcdsReavalxDep.Post;
                                end;
                                FcdsReavalxDep.Next;
                             end;
                          end;
                          FcdsReavaliacao.Next;
                       end;
                       //-----------------------------------------------------------------
                       // ACRESCVALORXDEP
                       //-----------------------------------------------------------------
                       FcdsAcrescimoValor.First;
                       while not FcdsAcrescimoValor.EOF do
                       begin
                          if FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime <= dDataUltReaval then
                          begin
                             FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP', VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat,
                                                                                                             _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                             _cds.FieldByName('IDTAXADEP').AsFloat]),[]);
                             while not FcdsAcrescValorxDep.EOF do
                             begin
                                if (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat = FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat) and
                                   (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat = _cds.FieldByName('MOECODIGO').AsFloat) and
                                   (FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat = _cds.FieldByName('IDTAXADEP').AsFloat) then
                                begin
                                   FcdsAcrescValorxDep.Edit;
                                   FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                                   FcdsAcrescValorxDep.Post;
                                end;
                                FcdsAcrescValorxDep.Next;
                             end;
                          end;
                          FcdsAcrescimoValor.Next;
                       end;
                    end;
               //-------------------------------------------------------------------------
               // Recoloca as taxas originais de acréscimos de valor posteriores
               //-------------------------------------------------------------------------
{               35 : begin
                       if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                         _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                         _cds.FieldByName('IDTAXADEP').AsFloat]),[]) then
                       begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a retificação da reavaliação (4)!'));
                    end;
 }
               //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Início
                35 : begin
                    if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                                             _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                                             _cds.FieldByName('IDTAXADEP').AsFloat]),[]) then
                     begin
                      FcdsAcrescValorxDep.Edit;
                      if _cds.FieldByName('TAXADEPANT') <> nil then
                       FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat
                      else
                       FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := 0;
                      FcdsAcrescValorxDep.Post;
                      end
                      else
                       begin
                        FcdsAcrescValorxDep.Edit;
                        FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := 0;
                        FcdsAcrescValorxDep.Post;
                       end
                     end;
                //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Fim
                //Helen SOL Nº 153958 KINTANA Nº 1167601 - Add 99
                99 : begin
                    if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                                             _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                                             _cds.FieldByName('IDTAXADEP').AsFloat]),[]) then
                     begin
                      FcdsAcrescValorxDep.Edit;
                      if _cds.FieldByName('TAXADEPANT') <> nil then
                       FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat
                      else
                       FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := 0;
                      FcdsAcrescValorxDep.Post;
                      end
                      else
                       begin
                        FcdsAcrescValorxDep.Edit;
                        FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := 0;
                        FcdsAcrescValorxDep.Post;
                       end
                     end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Estorna a Depreciacao PróRata
         //-------------------------------------------------------------------------------
         if iTipDepProRata = 0 then
         begin
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end else
         begin
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end;

         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Início
         if nPlnCodigo > 0 then
         begin
         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Fim
           //-------------------------------------------------------------------------------
           // Retira o link com a Planilha Contábil
           //-------------------------------------------------------------------------------
           sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                   ' SET PLNCODIGO = NULL '+
                   ' WHERE IDBEM = ' + floattostr(nBem) +
                   '   AND DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',' + QuotedStr('dd/mm/yyyy') + ')' +
                   '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 18  OR IDTIPOMOVIMENTACAO = 35 OR IDTIPOMOVIMENTACAO = 99) ' + //Helen - SOL Nº 153958 (99)
                   '   AND FLGRETIFICAREAVAL = 1' +
                   '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
           if not ExecSQL(sSql, True) then
              Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Estorna as planilhas contábeis
         //-------------------------------------------------------------------------------
         if bIntegraContab and (nPlnCodigo > 0) then
         begin
            //----------------------------------------------------------------------------
            // Estorna / Remove as Planilhas Contábeis
            //----------------------------------------------------------------------------
            if CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
            begin
               if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               begin
                  if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, nPlnCodigo,
                                                                   nModulo, nEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataMov)) then
                  begin
                     Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CAFxContab.MessageInfo);
                  end;
               end else
               begin
                  if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlnCodigo,
                                                                  nModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                  begin
                     Raise Exception.Create(CMTranslate('Remoção da Planilha Contabil não Executada !') + #13 + CAFxContab.MessageInfo);
                  end;
               end;
            end else
            begin
               Raise Exception.Create(CAFxContab.MessageInfo);
            end;
         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Início
         end;
         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Fim

         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Início
         if not _cds.IsEmpty then
         begin
         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Fim
           //-------------------------------------------------------------------------------
           // Remove os Registros da Retificação da Reavaliacao no Historico
           //-------------------------------------------------------------------------------
           sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                   ' FROM HISTORICOMOVIMENTACAO ' +
                   ' WHERE IDBEM = ' + floattostr(nBem) +
                   '   AND DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',' + QuotedStr('dd/mm/yyyy') + ')' +
                   '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 18  OR IDTIPOMOVIMENTACAO = 35 OR IDTIPOMOVIMENTACAO = 99) ' + //Helen - SOL Nº 153958 (99)
                   '   AND FLGRETIFICAREAVAL = 1' +
                   '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
           _cds.Data := GetDataPacket(sSql);
           if _cds.IsEmpty then
              Raise Exception.Create(CMTranslate('Não foi possível estornar a Retificação da Reavaliação do Bem ') +
                                     trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                     floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
           //-------------------------------------------------------------------------------

           while not _cds.Eof do
           begin
              sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                      ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
              if not ExecSQL(sSql, True) then
                 Raise Exception.Create(CMTranslate('Não foi possível remover os valores da reavaliação do Bem ') +
                                        trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                        floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
              //----------------------------------------------------------------------------
              sSql := ' DELETE FROM HMBREAVAL ' +
                      ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
              if not ExecSQL(sSql, False) then
                 Raise Exception.Create(CMTranslate('Não foi possível remover os dados do historico da reavaliação do Bem ') +
                                        trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                        floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
              _cds.Next;
           end;
           //-------------------------------------------------------------------------------
           sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                   ' WHERE IDBEM = ' + floattostr(nBem) +
                   '   AND DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataMov)) + ',' + QuotedStr('dd/mm/yyyy') + ')' +
                   '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 18  OR IDTIPOMOVIMENTACAO = 35 OR IDTIPOMOVIMENTACAO = 99) ' + //Helen - SOL Nº 153958 (99)
                   '   AND FLGRETIFICAREAVAL = 1' +
                   '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
           if not ExecSQL(sSql, True) then
              Raise Exception.Create(CMTranslate('Não foi possível remover o historico da reavaliação do Bem ') +
                                     trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                     floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + CMTranslate(' do Histórico!') + #13 + MessageInfo);
         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Início
         end;
         //Cássio - SOL Nº 109725 KINTANA Nº 498220 - Fim
         //-------------------------------------------------------------------------------
         // Atualiza o Saldo Contábil do bem
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
               end;
               FcdsBemxDep.Next;
            end;
            FcdsBemxMoeda.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra nas tabelas cadastrais os saldos atualizados
         //-------------------------------------------------------------------------------
         _cds.Data := GetDataPacket(' SELECT FLGIMOVEL ' +
                                    ' FROM GRUPO ' +
                                    ' WHERE IDGRUPO = ' + FcdsBem.FieldByName('IDGRUPO').AsString);
         iTipoBem := _cds.FieldByName('FLGIMOVEL').AsInteger;
         //-------------------------------------------------------------------------------
         // Processa as tabela Bem e BemxDep
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[23] := ' AND (HM.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovBemxMoeda2.SQL.Strings[33] := ' AND (B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovBemxMoeda2.Prepare;
         _dMTBem.sqlRCMovBemxMoeda2.ParamByName('DATAMOV').AsDate := dDataMov;
         _dMTBem.sqlRCMovBemxMoeda2.ParamByName('IDPESSOA').AsFloat  := nEmpresaProp;
         _dMTBem.sqlRCMovBemxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
         FcdsAtuCusto.Data := _dMTBem.sqlRCMovBemxMoeda2.Data;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovBemxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovBemxDep2.SQL.Strings[30] := ' AND (B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovBemxDep2.Prepare;
         _dMTBem.sqlRCMovBemxDep2.ParamByName('DATAMOV').AsDate := dDataMov;
         _dMTBem.sqlRCMovBemxDep2.ParamByName('IDPESSOA').AsFloat  := nEmpresaProp;
         _dMTBem.sqlRCMovBemxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
         FcdsAtuDeprec.Data := _dMTBem.sqlRCMovBemxDep2.Data;
         //-------------------------------------------------------------------------------
         while not FcdsAtuCusto.EOF do
         begin
            nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
            nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
               nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsAtuCusto.Next;
         end;
         //-------------------------------------------------------------------------------
         while not FcdsAtuDeprec.EOF do
         begin
            nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
            nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
               nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsAtuDeprec.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processa as tabela Reavaliacao e ReavalxDep
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[19] := ' AND (HM.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovReavalxMoeda2.SQL.Strings[29] := ' AND (B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovReavalxMoeda2.Prepare;
         _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('DATAMOV').AsDate := dDataMov;
         _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
         _dMTBem.sqlRCMovReavalxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
         FcdsAtuCusto.Data := _dMTBem.sqlRCMovReavalxMoeda2.Data;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[20] := ' AND (HM.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovReavalxDep2.SQL.Strings[30] := ' AND (B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovReavalxDep2.Prepare;
         _dMTBem.sqlRCMovReavalxDep2.ParamByName('DATAMOV').AsDate := dDataMov;
         _dMTBem.sqlRCMovReavalxDep2.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
         _dMTBem.sqlRCMovReavalxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
         FcdsAtuDeprec.Data := _dMTBem.sqlRCMovReavalxDep2.Data;
         //-------------------------------------------------------------------------------
         while not FcdsAtuCusto.EOF do
         begin
            nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
            nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
               nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsAtuCusto.Next;
         end;
         //-------------------------------------------------------------------------------
         while not FcdsAtuDeprec.EOF do
         begin
            nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
            nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
               nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsAtuDeprec.Next;
         end;
         //-------------------------------------------------------------------------------
         // Processa as tabela AcrescimoValor e AcrescValorxDep
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[17] := ' AND (HM.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovAcresxMoeda2.SQL.Strings[27] := ' AND (B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovAcresxMoeda2.Prepare;
         _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('DATAMOV').AsDate := dDataMov;
         _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
         _dMTBem.sqlRCMovAcresxMoeda2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
         FcdsAtuCusto.Data := _dMTBem.sqlRCMovAcresxMoeda2.Data;
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[18] := ' AND (HM.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         _dMTBem.sqlRCMovAcresxDep2.SQL.Strings[28] := ' AND (B.IDBEM = ' + FcdsBem.FieldByName('IDBEM').AsString + ') ';
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRCMovAcresxDep2.Prepare;
         _dMTBem.sqlRCMovAcresxDep2.ParamByName('DATAMOV').AsDate := dDataMov;
         _dMTBem.sqlRCMovAcresxDep2.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
         _dMTBem.sqlRCMovAcresxDep2.ParamByName('FLGIMOVEL').AsInteger := iTipoBem;
         FcdsAtuDeprec.Data := _dMTBem.sqlRCMovAcresxDep2.Data;
         //-------------------------------------------------------------------------------
         while not FcdsAtuCusto.EOF do
         begin
            nsValOrg := FcdsAtuCusto.FieldByName('VALORG').AsFloat;
            nsCmBem  := FcdsAtuCusto.FieldByName('CMBEM').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuCusto.FieldByName('VALORG').AsFloat - FcdsAtuCusto.FieldByName('VALORG0').AsFloat) >= 0.01 then
               nsValOrg := FcdsAtuCusto.FieldByName('VALORG0').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuCusto.FieldByName('CMBEM').AsFloat - FcdsAtuCusto.FieldByName('CMBEM0').AsFloat) >= 0.01 then
               nsCmBem :=  FcdsAtuCusto.FieldByName('CMBEM0').AsFloat;
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsAtuCusto.Next;
         end;
         //-------------------------------------------------------------------------------
         while not FcdsAtuDeprec.EOF do
         begin
            nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat;
            nsCmDep   := FcdsAtuDeprec.FieldByName('CMDEP').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuDeprec.FieldByName('DEPLANC').AsFloat - FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
               nsDepLanc := FcdsAtuDeprec.FieldByName('DEPLANC0').AsFloat;
            //----------------------------------------------------------------------------
            if abs(FcdsAtuDeprec.FieldByName('CMDEP').AsFloat - FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat) >= 0.01 then
               nsCmDep := FcdsAtuDeprec.FieldByName('CMDEP0').AsFloat;
            //----------------------------------------------------------------------------
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
            //----------------------------------------------------------------------------
            FcdsAtuDeprec.Next;
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
function TCtrlMovReavaliacao.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

function TCtrlMovReavaliacao.ExecutaReavaliacao(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                dDataMov: TDateTime; nValLaudo: Extended;
                                                iVidaUtil: Integer; sObsReaval: String;
                                                iTipDepProRata: Integer): Boolean;
var
   dDataUltMov, dDataUltDep                : TDateTime;
   nNovaTaxaDep, nSeqHist, nSeqHistContab,
   nFator, nMoeValLaudo, nSldContabil,
   nSaldoReaval, nSaldoReavalContab,
   nCota, nTaxaDepCalc, nTaxaDepAnt,
   nPlanilha                               : Extended;
   iFlgPai                                 : Integer;
   sSql                                    : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaReavaliacao(nModulo, nEmpresaProp, nUsuario, nBem,
                                                        dDataMov, nValLaudo, iVidaUtil,
                                                        sObsReaval, iTipDepProRata);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         Raise Exception.Create(CMTranslate('Essa função é obsoleta. Favor usar a ExecutaReavaliacaoII !'));
         //-------------------------------------------------------------------------------
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp, nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para reavaliação de bens
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
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if iVidaUtil < 0 then
            raise Exception.Create(CMTranslate('Tempo de Vida Útil Zerado igual a Taxa de Depreciação Zerada!'));
         //-------------------------------------------------------------------------------
         if nValLaudo <= 0 then
            raise Exception.Create(CMTranslate('Informe o novo valor do bem!'));
         //-------------------------------------------------------------------------------
         if sObsReaval = '' then
            raise Exception.Create(CMTranslate('Declare as informações relativas ao laudo de reavaliação!'));
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
         if not Bem.VerificaPeriodoCAF(nEmpresaProp, nBem,
                                       FcdsBem.FieldByName('FLGIMOVEL').AsInteger,
                                       '08', dDataMov, dDataUltMov, dDataUltDep) then
            Raise Exception.Create(Bem.MessageInfo);
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(trunc(nEmpresaProp), trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Prepara a montagem da planilha contábil
         //-------------------------------------------------------------------------------
         if bIntegraContab then
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
         end;
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem que será reavaliado
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
         if (FcdsBem.FieldByName('CONTROLE').AsString = 'T') and (iTipDepProRata < 2) then
         begin
            if iTipDepProRata = 0 then
            begin
               if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end else
            begin
               if not ProRata.Executar(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, iTipDepProRata) then
                  Raise Exception.Create(ProRata.MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Calcula o Saldo de Reavaliacao e a nova taxa de depreciacao
         //-------------------------------------------------------------------------------
         nNovaTaxaDep := 0;
         if iVidaUtil > 0 then
            nNovaTaxaDep := (100 / (iVidaUtil / 12)); // iVidaUtil está em número de meses

         //Helio - SOL Nº 212226 KINTANA Nº 2037651
         //registra no historico de vida util
         if (FcdsHistoricoVidaUtil <> nil) and
            (iVidaUtil > 0) then
         begin
             //coloca outros registros como nao vigentes
             sSql := ' UPDATE HISTORICOVIDAUTIL SET VIGENTE = ' + QuotedStr('N') +
             ' WHERE IDIMOVEL in ( select IDIMOVEL from IMOVELXBEM where IDBEM = ' + floattostr(nBem) +' )';   // SOL 240108 PPM 619627

             if not ExecSQL(sSql, True) and
                (MessageInfo <> 'A instrução executada não modificou registros no Banco de Dados. Verifique') then
               Raise Exception.Create(MessageInfo);

             //salvo no registtro no historico como vigente
             sSql := 'INSERT INTO HISTORICOVIDAUTIL ' +
             ' (VIDAUTIL, TXDEP_ANO, TXDEP_MES, VIGENTE, IDIMOVEL, HIST_EVENTO)' +
             ' VALUES (' +
             IntToStr(iVidaUtil) + ', ' +
             stringReplace(FloatToStr((nNovaTaxaDep * 12)), ',', '.', [rfIgnoreCase, rfReplaceAll]) + ', ' +
             stringReplace(FloatToStr(nNovaTaxaDep), ',', '.', [rfIgnoreCase, rfReplaceAll]) + ', ' +
             QuotedStr('S') + ', ' +
             //FcdsHistoricoVidaUtil.FieldByName('IDIMOVEL').AsString  + ', ' +
             ' ( select IDIMOVEL from IMOVELXBEM where IDBEM = ' + floattostr(nBem) +' ) , '+ // SOL 240108 PPM 619627
             QuotedStr(FcdsHistoricoVidaUtil.FieldByName('HIST_EVENTO').AsString) +
             ') ';

             if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //salva historico de vida util
         //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

         //-------------------------------------------------------------------------------
         FcdsPaises.Data := GrupoContab.ListaGrupoTaxaDep(FcdsBem.FieldByname('IDGRUPO').AsFloat,
                                                          FcdsBem.FieldByname('IDPESSOA').AsFloat);
         FcdsTaxasDep.Data := GrupoContab.ListaGrupoTaxaDep(FcdsBem.FieldByname('IDGRUPO').AsFloat,
                                                            FcdsBem.FieldByname('IDPESSOA').AsFloat);
         //-------------------------------------------------------------------------------
         // Processa os saldos de Reavaliacao para cada país registrado
         //-------------------------------------------------------------------------------
         nSeqHistContab := -1;
         nSaldoReavalContab := 0;
         while not FcdsPaises.EOF do
         begin
            //----------------------------------------------------------------------------
            // Inicializa os CDS da reavaliacao do país
            //----------------------------------------------------------------------------
            FcdsNReavaliacao.Data  := Bem.ListaReavaliacao(nEmpresaProp , 0);
            FcdsNReavalxMoeda.Data := Bem.ListaReavalxMoeda(nEmpresaProp, 0);
            FcdsNReavalxDep.Data   := Bem.ListaReavalxDep(nEmpresaProp  , 0);
            //----------------------------------------------------------------------------
            // Gera Reavaliacao para o País
            //----------------------------------------------------------------------------
            FcdsNReavaliacao.Append;
            FcdsNReavaliacao.FieldByName('IDBEM').AsFloat              := FcdsBem.FieldByName('IDBEM').AsFloat;
            FcdsNReavaliacao.FieldByName('IDPESSOA').AsFloat           := FcdsBem.FieldByName('IDPESSOA').AsFloat;
            FcdsNReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime := dDataMov;
            FcdsNReavaliacao.FieldByName('FLGULTREAVAL').AsInteger     := 1;
            FcdsNReavaliacao.Post;
            if not ApplyCds(FcdsNReavaliacao,_dbReavaliacao,[],[]) then
               Raise Exception.Create(_dbReavaliacao.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra no Histórico
            //----------------------------------------------------------------------------
            nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,      // IDBEM
                                                      FcdsBem.FieldByName('IDPESSOA').AsFloat,   // IDPESSOA
                                                      FcdsBem.FieldByName('IDMODULO').AsFloat,   // IDMODULO
                                                      08,                                        // IDTIPOMOVIMENTACAO
                                                      dDataMov,                                  // DATAMOVIMENTACAO
                                                      _dbReavaliacao.IDREAVALIACAO.AsFloat,      // IDREAVALACRESC
                                                      -1,                                        // DATAULTDEP
                                                      -1,                                        // IDGRUPANT
                                                      -1,                                        // IDCONJANT
                                                      -1,                                        // IDLOCALANT
                                                      -1,                                        // IDRESPANT
                                                      -1,                                        // PLACAANT
                                                      -1,                                        // PLNCODIGO
                                                      sObsReaval,                                // OBSREAVAL
                                                      iTipDepProRata,                            // TIPDEPPRORATA
                                                      -1,                                        // IDTIPODESPESA
                                                      '',                                        // OBSACRESCIMO
                                                      -1,                                        // IDMOTIVOBAIXA
                                                       0,                                        // PROPBAIXA
                                                       0,                                        // VALVENDAOFI
                                                      '');                                       // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' UPDATE REAVALIACAO '+
                    ' SET IDMOVIMENTACAO = ' + FloatToStr(nSeqHist) + ' ' +
                    ' WHERE IDREAVALIACAO = ' + FloatToStr(_dbReavaliacao.IDREAVALIACAO.AsFloat);
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            FcdsBemxDep.Locate('IDBEMXDEP', VarArrayOf([FcdsPaises.FieldByName('IDTAXADEP').AsInteger]),[]);
            iFlgPai := 1;
            while not FcdsBemxDep.EOF do
            begin
               if FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = FcdsPaises.FieldByname('IDTAXADEP').AsInteger then
               begin
                  if FcdsBemxDep.FieldByName('MOECODIGO').AsFloat <> ParamCAF.MOEDAOFICIAL then
                  begin
                     nMoeValLaudo := Bem.ConversaoMoeda(nValLaudo, FcdsBemxDep.FieldByName('MOECODIGO').AsInteger, dDataMov);
                     if nMoeValLaudo < 0 then
                        Raise Exception.Create(Bem.MessageInfo);
                  end else
                  begin
                     nMoeValLaudo := nValLaudo;
                  end;
                  //----------------------------------------------------------------------
                  // Calcula o Saldo de Reavaliacao
                  //----------------------------------------------------------------------
                  nSldContabil := Bem.SaldoContabil(FcdsBemxDep.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger);
                  nSaldoReaval := nMoeValLaudo - nSldContabil;
                  //----------------------------------------------------------------------
                  // Registra dados para Integração Contábil
                  //----------------------------------------------------------------------
                  if (FcdsBemxDep.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAOFICIAL) and
                     (FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger = 1) then
                  begin
                     nSeqHistContab     := nSeqHist;
                     nSaldoReavalContab := nSaldoReaval;
                  end;
                  //----------------------------------------------------------------------
                  // Gera ReavalxMoeda para o País
                  //----------------------------------------------------------------------
                  FcdsNReavalxMoeda.Append;
                  FcdsNReavalxMoeda.FieldByName('MOECODIGO').AsFloat    := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
                  FcdsNReavalxMoeda.FieldByName('VALORG').AsFloat       := nSaldoReaval;
                  FcdsNReavalxMoeda.FieldByName('DATAULTCM').AsDateTime := dDataMov;
                  FcdsNReavalxMoeda.Post;
                  //----------------------------------------------------------------------
                  // Gera ReavalxDep para ReavalxMoeda no País
                  //----------------------------------------------------------------------
                  FcdsTaxasDep.First;
                  while not FcdsTaxasDep.EOF do
                  begin
                     FcdsNReavalxDep.Append;
                     FcdsNReavalxDep.FieldByName('MOECODIGO').AsFloat     := FcdsBemxDep.FieldByName('MOECODIGO').AsFloat;
                     FcdsNReavalxDep.FieldByName('IDREAVALXDEP').AsFloat  := FcdsTaxasDep.FieldByName('IDTAXADEP').AsFloat;
                     FcdsNReavalxDep.FieldByName('TAXADEP').AsFloat       := nNovaTaxaDep;
                     FcdsNReavalxDep.FieldByName('DATAULTCM').AsDateTime  := dDataMov;
                     FcdsNReavalxDep.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
                     FcdsNReavalxDep.Post;
                     //-------------------------------------------------------------------
                     FcdsTaxasDep.Next;
                  end;
                  //----------------------------------------------------------------------
                  // Registra o Saldo de Reavaliacao no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                          FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                          FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                          nSaldoReaval) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Registra o Novo Saldo Contábil
                  //----------------------------------------------------------------------
                  if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                    FcdsBem.FieldByName('IDBEM').AsInteger,
                                                    dDataMov,
                                                    FcdsBemxDep.FieldByName('MOECODIGO').AsInteger,
                                                    FcdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                    0, 0, 0, 0,
                                                    0, 0, 0, 0,
                                                    nSaldoReaval, 0, 0, 0,
                                                    FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                    FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                    FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                    1, iFlgPai) then
                     Raise Exception.Create(Bem.MessageInfo);
                  //----------------------------------------------------------------------
                  // Calcula a nova taxadep para BemxMoeda / BemxDep
                  //----------------------------------------------------------------------
                  if nNovaTaxaDep <> 0 then
                  begin
                     FcdsBemxMoeda.Locate('MOECODIGO',VarArrayOf([FcdsBemxDep.FieldByName('MOECODIGO').AsInteger]),[]);
                     //-------------------------------------------------------------------
                     // Calculo da nova cota anual de depreciação, dividindo-se o saldo
                     // contábil do bem no dia da reavaliação pela nova vida útil apurada
                     // no laudo. Essa vida útil é fornecida em meses e deve ser ser
                     // convertida para anos, pois a cota cadastrada pelo CAF é anual.
                     //-------------------------------------------------------------------
                     nCota := Bem.ConvNum((FcdsBemxMoeda.FieldByName('VALORG').asFloat +
                                           FcdsBemxMoeda.FieldByName('CMBEM').asFloat -
                                           FcdsBemxDep.FieldByName('DEPLANC').asFloat -
                                           FcdsBemxDep.FieldByName('CMDEP').asFloat) / (iVidaUtil / 12));
                     //-------------------------------------------------------------------
                     // Tendo a cota que deverá ser apropriada anualmente, calcula-se qual
                     // será o percentual que deverá ser aplicado sobre a conta de custo
                     // (Taxa de Depreciação, dividindo-se a cota anual pelo custo.
                     //-------------------------------------------------------------------
                     if (FcdsBemxMoeda.FieldByName('VALORG').asFloat + FcdsBemxMoeda.FieldByName('CMBEM').asFloat) <> 0 then
                     begin
                        nTaxaDepCalc := Bem.ConvNum(nCota / (FcdsBemxMoeda.FieldByName('VALORG').asFloat +
                                                             FcdsBemxMoeda.FieldByName('CMBEM').asFloat)) * 100;
                     end else
                     begin
                        nTaxaDepCalc := 0;
                     end;
                  end else
                  begin
                     nTaxaDepCalc := 0;
                  end;
                  //----------------------------------------------------------------------
                  // Registra a nova taxa de depreciação para o custo
                  //----------------------------------------------------------------------
                  nTaxaDepAnt := FcdsBemxDep.FieldByName('TAXADEP').AsFloat;
                  FcdsBemxDep.Edit;
                  FcdsBemxDep.FieldByName('TAXADEP').AsFloat := nTaxaDepCalc;
                  FcdsBemxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a taxa de depreciação anterior no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsBemxDep.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsBemxDep.FieldByName('IDBEMXDEP').AsFloat,
                                                      nMoeValLaudo, nTaxaDepAnt) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
               end;
               FcdsBemxDep.Next;
            end;
            //----------------------------------------------------------------------------
            // Registra as novas taxas de depreciação para o custo
            //----------------------------------------------------------------------------
            if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
               Raise Exception.Create(_dbBemxDep.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra os registros filhos da reavaliacao
            //----------------------------------------------------------------------------
            if not ApplyCds(FcdsNReavalxMoeda,_dbReavalxMoeda,[_dbReavaliacao.IDREAVALIACAO],[_dbReavalxMoeda.IDREAVALIACAO]) then
               Raise Exception.Create(_dbReavalxMoeda.MessageInfo);
            if not ApplyCds(FcdsNReavalxDep,_dbReavalxDep,[_dbReavaliacao.IDREAVALIACAO],[_dbReavalxDep.IDREAVALIACAO]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
            FcdsPaises.Next;
         end;
         //-------------------------------------------------------------------------------
         // Recalcula a Taxa de Depreciacao nos Lançamentos da Tabela REAVALIACAO
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            FcdsReavaliacao.Edit;
            FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 0;
            FcdsReavaliacao.Post;
            //----------------------------------------------------------------------------
            // Registra no Histórico
            //----------------------------------------------------------------------------
            nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                 // IDBEM
                                                      FcdsBem.FieldByName('IDPESSOA').AsFloat,              // IDPESSOA
                                                      FcdsBem.FieldByName('IDMODULO').AsFloat,              // IDMODULO
                                                      53,                                                   // IDTIPOMOVIMENTACAO
                                                      dDataMov,                                             // DATAMOVIMENTACAO
                                                      FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat, // IDREAVALACRESC
                                                      -1,                                                   // DATAULTDEP
                                                      -1,                                                   // IDGRUPANT
                                                      -1,                                                   // IDCONJANT
                                                      -1,                                                   // IDLOCALANT
                                                      -1,                                                   // IDRESPANT
                                                      -1,                                                   // PLACAANT
                                                      -1,                                                   // PLNCODIGO
                                                      sObsReaval,                                           // OBSREAVAL
                                                      iTipDepProRata,                                       // TIPDEPPRORATA
                                                      -1,                                                   // IDTIPODESPESA
                                                      '',                                                   // OBSACRESCIMO
                                                      -1,                                                   // IDMOTIVOBAIXA
                                                       0,                                                   // PROPBAIXA
                                                       0,                                     // VALVENDAOFI
                                                      '');                                                  // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsReavalxMoeda.Locate('IDREAVALIACAO', VarArrayOf([FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat]),[]);
            while (not FcdsReavalxMoeda.EOF) and (FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat =
                                                  FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat) do
            begin
               FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO', VarArrayOf([FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat,
                                                                            FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               while (not FcdsReavalxDep.EOF) and (FcdsReavalxDep.FieldByName('IDREAVALIACAO').AsFloat =
                                                   FcdsReavalxMoeda.FieldByName('IDREAVALIACAO').AsFloat) and
                                                  (FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat =
                                                   FcdsReavalxMoeda.FieldByName('MOECODIGO').AsFloat) do
               begin
                  //----------------------------------------------------------------------
                  // Calcula a nova taxadep para ReavalxMoeda / ReavalxDep
                  //----------------------------------------------------------------------
                  if nNovaTaxaDep <> 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calculo da nova cota anual de depreciação, dividindo-se o saldo
                     // contábil do bem no dia da reavaliação pela nova vida útil apurada
                     // no laudo. Essa vida útil é fornecida em meses e deve ser ser
                     // convertida para anos, pois a cota cadastrada pelo CAF é anual.
                     //-------------------------------------------------------------------
                     nCota := Bem.ConvNum((FcdsReavalxMoeda.FieldByName('VALORG').asFloat +
                                           FcdsReavalxMoeda.FieldByName('CMBEM').asFloat -
                                           FcdsReavalxDep.FieldByName('DEPLANC').asFloat -
                                           FcdsReavalxDep.FieldByName('CMDEP').asFloat) / (iVidaUtil / 12));
                     //-------------------------------------------------------------------
                     // Tendo a cota que deverá ser apropriada anualmente, calcula-se qual
                     // será o percentual que deverá ser aplicado sobre a conta de custo
                     // (Taxa de Depreciação, dividindo-se a cota anual pelo custo.
                     //-------------------------------------------------------------------
                     if (FcdsReavalxMoeda.FieldByName('VALORG').asFloat + FcdsReavalxMoeda.FieldByName('CMBEM').asFloat) <> 0 then
                     begin
                        nTaxaDepCalc := Bem.ConvNum(nCota / (FcdsReavalxMoeda.FieldByName('VALORG').asFloat +
                                                             FcdsReavalxMoeda.FieldByName('CMBEM').asFloat)) * 100;
                     end else
                     begin
                        nTaxaDepCalc := 0;
                     end;
                  end else
                  begin
                     nTaxaDepCalc := 0;
                  end;
                  //----------------------------------------------------------------------
                  // Registra a nova taxa de depreciação para o custo
                  //----------------------------------------------------------------------
                  nTaxaDepAnt := FcdsReavalxDep.FieldByName('TAXADEP').AsFloat;
                  FcdsReavalxDep.Edit;
                  FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := nTaxaDepCalc;
                  FcdsReavalxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a taxa de depreciação anterior no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsReavalxDep.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsReavalxDep.FieldByName('IDREAVALXDEP').AsFloat,
                                                      0, nTaxaDepAnt) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsReavalxDep.Next;
               end;
               FcdsReavalxMoeda.Next;
            end;
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra as novas taxas de depreciação para a reavaliacao
         //-------------------------------------------------------------------------------
         if not FcdsReavaliacao.IsEmpty then
         begin
            if not ApplyCds(FcdsReavaliacao,_dbReavaliacao,[],[]) then
               Raise Exception.Create(_dbReavaliacao.MessageInfo);
            if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
               Raise Exception.Create(_dbReavalxDep.MessageInfo);
         end;      
         //-------------------------------------------------------------------------------
         // Recalcula a Taxa de Depreciacao nos Lançamentos da Tabela ACRESCIMOVALOR
         //-------------------------------------------------------------------------------
         FcdsAcrescimoValor.First;
         while not FcdsAcrescimoValor.EOF do
         begin
            //----------------------------------------------------------------------------
            // Registra no Histórico
            //----------------------------------------------------------------------------
            nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,                  // IDBEM
                                                      FcdsBem.FieldByName('IDPESSOA').AsFloat,               // IDPESSOA
                                                      FcdsBem.FieldByName('IDMODULO').AsFloat,               // IDMODULO
                                                      54,                                                    // IDTIPOMOVIMENTACAO
                                                      dDataMov,                                              // DATAMOVIMENTACAO
                                                      FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat, // IDREAVALACRESC
                                                      -1,                                                    // DATAULTDEP
                                                      -1,                                                    // IDGRUPANT
                                                      -1,                                                    // IDCONJANT
                                                      -1,                                                    // IDLOCALANT
                                                      -1,                                                    // IDRESPANT
                                                      -1,                                                    // PLACAANT
                                                      -1,                                                    // PLNCODIGO
                                                      sObsReaval,                                            // OBSREAVAL
                                                      iTipDepProRata,                                        // TIPDEPPRORATA
                                                      -1,                                                    // IDTIPODESPESA
                                                      '',                                                    // OBSACRESCIMO
                                                      -1,                                                    // IDMOTIVOBAIXA
                                                       0,                                                    // PROPBAIXA
                                                       0,                                     // VALVENDAOFI
                                                      '');                                                   // OBSBAIXA
            if nSeqHist = -1 then
               Raise Exception.Create(HistMovBem.MessageInfo);
            //----------------------------------------------------------------------------
            FcdsAcrescValorxMoeda.Locate('IDACRESCIMO', VarArrayOf([FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat]),[]);
            while (not FcdsAcrescValorxMoeda.EOF) and (FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat =
                                                       FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat) do
            begin
               FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO', VarArrayOf([FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat,
                                                                               FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat]),[]);
               while (not FcdsAcrescValorxDep.EOF) and (FcdsAcrescValorxDep.FieldByName('IDACRESCIMO').AsFloat =
                                                        FcdsAcrescValorxMoeda.FieldByName('IDACRESCIMO').AsFloat) and
                                                       (FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat =
                                                        FcdsAcrescValorxMoeda.FieldByName('MOECODIGO').AsFloat) do
               begin
                  //----------------------------------------------------------------------
                  // Calcula a nova taxadep para AcrescValorxDep
                  //----------------------------------------------------------------------
                  if nNovaTaxaDep <> 0 then
                  begin
                     //-------------------------------------------------------------------
                     // Calculo da nova cota anual de depreciação, dividindo-se o saldo
                     // contábil do bem no dia da reavaliação pela nova vida útil apurada
                     // no laudo. Essa vida útil é fornecida em meses e deve ser ser
                     // convertida para anos, pois a cota cadastrada pelo CAF é anual.
                     //-------------------------------------------------------------------
                     nCota := Bem.ConvNum((FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat +
                                           FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat -
                                           FcdsAcrescValorxDep.FieldByName('DEPLANC').asFloat -
                                           FcdsAcrescValorxDep.FieldByName('CMDEP').asFloat) / (iVidaUtil / 12));
                     //-------------------------------------------------------------------
                     // Tendo a cota que deverá ser apropriada anualmente, calcula-se qual
                     // será o percentual que deverá ser aplicado sobre a conta de custo
                     // (Taxa de Depreciação, dividindo-se a cota anual pelo custo.
                     //-------------------------------------------------------------------
                     if (FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat + FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat) <> 0 then
                     begin
                        nTaxaDepCalc := Bem.ConvNum(nCota / (FcdsAcrescValorxMoeda.FieldByName('VALORG').asFloat +
                                                             FcdsAcrescValorxMoeda.FieldByName('CMBEM').asFloat)) * 100;
                     end else
                     begin
                        nTaxaDepCalc := 0;
                     end;
                  end else
                  begin
                     nTaxaDepCalc := 0;
                  end;
                  //----------------------------------------------------------------------
                  // Registra a nova taxa de depreciação para o custo
                  //----------------------------------------------------------------------
                  nTaxaDepAnt := FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat;
                  FcdsAcrescValorxDep.Edit;
                  FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := nTaxaDepCalc;
                  FcdsAcrescValorxDep.Post;
                  //----------------------------------------------------------------------
                  // Registra a taxa de depreciação anterior no historico
                  //----------------------------------------------------------------------
                  if not HistMovBem.RegistraHMBReaval(nSeqHist,
                                                      FcdsAcrescValorxDep.FieldByName('MOECODIGO').AsFloat,
                                                      FcdsAcrescValorxDep.FieldByName('IDACRESCIMOXDEP').AsFloat,
                                                      0, nTaxaDepAnt) then
                     Raise Exception.Create(HistMovBem.MessageInfo);
                  //----------------------------------------------------------------------
                  FcdsAcrescValorxDep.Next;
               end;
               FcdsAcrescValorxMoeda.Next;
            end;
            FcdsAcrescimoValor.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registra as novas taxas de depreciação para o acréscimo de valor
         //-------------------------------------------------------------------------------
         if not FcdsAcrescimoValor.IsEmpty then
            if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
               Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Contabiliza a Reavaliação
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Prepara o DataSet que irá acumular a planilha contábil para a integração
            //----------------------------------------------------------------------------
            if not CAFxContab.ContabilizaReavaliacao(FcdsBem.FieldByName('IDMODULO').AsInteger,
                                                     FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                     FcdsBem.FieldByName('IDBEM').AsInteger,
                                                     FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                     FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                     FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                     FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                     FcdsBem.FieldByName('PLACA').AsString,
                                                     FcdsBem.FieldByName('DESBEM').AsString,
                                                     FcdsBem.FieldByName('DESCGRUPO').AsString,
                                                     dDataMov, nSaldoReavalContab,
                                                     iExercicio, iPeriodo, bCtaxCCusto) then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha Contábil
            //----------------------------------------------------------------------------
            nPlanilha := CAFxContab.RegistraPlanilhaContabil(FcdsBem.FieldByName('IDMODULO').AsFloat,
                                                             FcdsBem.FieldByName('IDPESSOA').AsFloat,
                                                             nUsuario, DateToStr(dDataMov));
            if nPlanilha < 0 then
               Raise Exception.Create(CAFxContab.MessageInfo);
            //----------------------------------------------------------------------------
            // Registra a Planilha no Historico
            //----------------------------------------------------------------------------
            _dMTBem.sqlAtualizaPlnCodigo.Prepare;
            _dMTBem.sqlAtualizaPlnCodigo.ParamByName('IDMOVIMENTACAO').AsFloat := nSeqHistContab;
            _dMTBem.sqlAtualizaPlnCodigo.ParamByName('PLNCODIGO').AsFloat := nPlanilha;
            if not ExecSQL(_dMTBem.sqlAtualizaPlnCodigo.SQLChanged, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         FIdReavaliacao := _dbReavaliacao.Idreavaliacao.AsInteger;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            FIdReavaliacao := -1;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Estorna a Reavaliacao Patrimonial de um bem (Método TaxaDep)
//========================================================================================
function TCtrlMovReavaliacao.EstornaReavaliacao(nModulo, nEmpresaProp, nUsuario, nBem: Extended;
                                                dDataMov, dDataEst: TDateTime): Boolean;
var
   iFlgPai        : Integer;
   nPlnCodigo     : Extended;
   dDataMaxReaval : TDateTime;
   sSql           : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaReavaliacao(nModulo, nEmpresaProp, nUsuario, nBem,
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
         // Posiciona a Tabela BEM
         //-------------------------------------------------------------------------------
         FcdsBem.Data := Bem.ListaBem(nEmpresaProp,nBem);
         if FcdsBem.IsEmpty then
            Raise Exception.Create(CMTranslate('Os parâmetros relativos ao bem estão incorretos!'));
         //-------------------------------------------------------------------------------
         // Valida os Parâmetros obrigatórios para reavaliação de bens
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
         if FcdsBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MessageInfo := CMTranslate('Bem Baixado!');
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação no bem após a Reavaliacao
         //-------------------------------------------------------------------------------
         sSql := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV ' +
                 ' FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if (_cds.IsEmpty) or (_cds.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
            Raise Exception.Create(CMTranslate('Existe movimentação após a reavaliação do bem. Consulte Histórico de Movimentação!'));
         //-------------------------------------------------------------------------------
         // Alimenta as propriedades de integração contábil
         //-------------------------------------------------------------------------------
         bIntegraContab := CAFxContab.IntegraContab(Trunc(nEmpresaProp), Trunc(nModulo));
         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos
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
         // Retorna o Tipo de Depreciação PróRata usado
         //-------------------------------------------------------------------------------
         _dMTBem.sqlMovReavalBem.Prepare;
         _dMTBem.sqlMovReavalBem.ParamByName('IDBEM').AsFloat      := nBem;
         _dMTBem.sqlMovReavalBem.ParamByName('IDPESSOA').AsFloat   := nEmpresaProp;
         _dMTBem.sqlMovReavalBem.ParamByName('DATAMOV').AsDateTime := dDataMov;
         _cds.Data := _dMTBem.sqlMovReavalBem.Data;
         //-------------------------------------------------------------------------------
         // Estorna a Depreciacao PróRata
         //-------------------------------------------------------------------------------
         if _cds.FieldByName('TIPDEPPRORATA').AsInteger = 0 then
         begin
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, (dDataMov - 1), dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end else
         begin
            if not ProRata.Estornar(nModulo, nEmpresaProp, nUsuario, nBem, dDataMov, dDataEst) then
               Raise Exception.Create(ProRata.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         FcdsBemxDep.Data := Bem.ListaBemxDep(nEmpresaProp, nBem);
         FcdsReavalxDep.Data := Bem.ListaReavalxDep(nEmpresaProp, nBem);
         FcdsAcrescValorxDep.Data := Bem.ListaAcrescValorxDep(nEmpresaProp, nBem);
         //-------------------------------------------------------------------------------
         // Retorna as Taxa de Depreciação Originais
         //-------------------------------------------------------------------------------
         nPlnCodigo := 0;
         while not _cds.EOF do
         begin
            case _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               08 : begin
                       if not _cds.FieldByName('PLNCODIGO').IsNull then
                          nPlnCodigo := _cds.FieldByName('PLNCODIGO').AsFloat;
                       //-----------------------------------------------------------------
                       if FcdsBemxDep.Locate('MOECODIGO;IDBEMXDEP', VarArrayOf([_cds.FieldByName('MOECODIGO').AsFloat,
                                                                                _cds.FieldByName('IDTAXADEP').AsFloat]), []) then
                       begin
                          FcdsBemxDep.Edit;
                          FcdsBemxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsBemxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (1)!'));
                    end;
               53 : begin
                       if FcdsReavalxDep.Locate('IDREAVALIACAO;MOECODIGO;IDREAVALXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsFloat,
                                                                                                   _cds.FieldByName('MOECODIGO').AsFloat,
                                                                                                   _cds.FieldByName('IDTAXADEP').AsFloat]),[]) then
                       begin
                          FcdsReavalxDep.Edit;
                          FcdsReavalxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsReavalxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (2)!'));
                    end;
               54 : begin
                       if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsInteger,
                                                                                                         _cds.FieldByName('MOECODIGO').AsInteger,
                                                                                                         _cds.FieldByName('IDTAXADEP').AsInteger]),[]) then
                       begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (3)!'));
                    end;
               //Helen SOL Nº 153958 KINTANA Nº 1167601 - Add 101
               101 : begin
                       if FcdsAcrescValorxDep.Locate('IDACRESCIMO;MOECODIGO;IDACRESCIMOXDEP',VarArrayOf([_cds.FieldByName('IDREAVALACRESC').AsInteger,
                                                                                                         _cds.FieldByName('MOECODIGO').AsInteger,
                                                                                                         _cds.FieldByName('IDTAXADEP').AsInteger]),[]) then
                       begin
                          FcdsAcrescValorxDep.Edit;
                          FcdsAcrescValorxDep.FieldByName('TAXADEP').AsFloat := _cds.FieldByName('TAXADEPANT').AsFloat;
                          FcdsAcrescValorxDep.Post;
                       end else
                          Raise Exception.Create(CMTranslate('Erro ao tentar retornar a taxa de depreciação anterior a reavaliação (4)!'));
                    end;
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         if not ApplyCds(FcdsBemxDep,_dbBemxDep,[],[]) then
            Raise Exception.Create(_dbBemxDep.MessageInfo);
         if not ApplyCds(FcdsReavalxDep,_dbReavalxDep,[],[]) then
            Raise Exception.Create(_dbReavalxDep.MessageInfo);
         if not ApplyCds(FcdsAcrescValorxDep,_dbAcrescValorxDep,[],[]) then
            Raise Exception.Create(_dbAcrescValorxDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Retorna os Flag de Última Depreciação
         //-------------------------------------------------------------------------------
         dDataMaxReaval := 0;
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            if (FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0) and
               (FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime > dDataMaxReaval) then
               dDataMaxReaval := FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime;
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsReavaliacao.First;
         while not FcdsReavaliacao.EOF do
         begin
            if FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime = dDataMaxReaval then
            begin
               FcdsReavaliacao.Edit;
               FcdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger := 1;
               FcdsReavaliacao.Next;
            end;
            //----------------------------------------------------------------------------
            FcdsReavaliacao.Next;
         end;
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsReavaliacao,_dbReavaliacao,[],[]) then
            Raise Exception.Create(_dbReavaliacao.MessageInfo);
         //-------------------------------------------------------------------------------
         // Retira o link com a Planilha Contábil
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE HISTORICOMOVIMENTACAO ' +
                 ' SET PLNCODIGO = NULL ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 53 OR IDTIPOMOVIMENTACAO = 54' +
                 '        OR IDTIPOMOVIMENTACAO = 101 )' + //Helen SOL Nº 153958 KINTANA Nº 1167601
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
            if CAFxContab.VerificaPeriodoContabil(Trunc(nEmpresaProp), dDataMov, iExercicio, iPeriodo) then
            begin
               if not CAFxContab.RemovePlanContab(Trunc(nEmpresaProp)) then
               begin
                  if not CAFxContab.LancaContab.EstornaLancaContab(nUsuario, nPlnCodigo,
                                                                   nModulo, nEmpresaProp,
                                                                   ParamCAF.USAPLANOPATRO,
                                                                   datetostr(dDataMov)) then
                  begin
                     Raise Exception.Create(CMTranslate('Estorno da Planilha Contabil não Executado !') + #13 + CAFxContab.MessageInfo);
                  end;
               end else
               begin
                  if not CAFxContab.LancaContab.ExcluiLancaContab(nUsuario, nPlnCodigo,
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
         //-------------------------------------------------------------------------------
         // Remove o lancamento das reavaliacoes
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDREAVALIACAO ' +
                 ' FROM REAVALIACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAREAVALIACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') '+
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if _cds.IsEmpty then
            Raise Exception.Create(CMTranslate('Não foi possível estornar a Reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
         while not _cds.EOF do
         begin
            sSql := ' DELETE FROM REAVALXDEP ' +
                    ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALIACAO').AsString;
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM REAVALXMOEDA ' +
                    ' WHERE IDREAVALIACAO = ' + _cds.FieldByName('IDREAVALIACAO').AsString;
            if not ExecSQL(sSql, False) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
            //----------------------------------------------------------------------------
            _cds.Next
         end;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM REAVALIACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAREAVALIACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ') ' +
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover os dados da reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
         //-------------------------------------------------------------------------------
         // Remove os Registros da Reavaliacao no Historico
         //-------------------------------------------------------------------------------
         sSql := ' SELECT IDMOVIMENTACAO,IDTIPOMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                 ' FROM HISTORICOMOVIMENTACAO'+
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 53 OR IDTIPOMOVIMENTACAO = 54' +
                 '        OR IDTIPOMOVIMENTACAO = 101 )' + //Helen SOL Nº 153958 KINTANA Nº 1167601
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         _cds.Data := GetDataPacket(sSql);
         if _cds.IsEmpty then
            Raise Exception.Create(CMTranslate('Não foi possível estornar a Reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat));
         //-------------------------------------------------------------------------------
         while not _cds.Eof do
         begin
            if _cds.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 08 then
            begin
               sSql := ' DELETE FROM VLRHISTMOVBEM ' +
                       ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(CMTranslate('Não foi possível remover os valores da reavaliação do Bem ') +
                                         trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
            end;
            //----------------------------------------------------------------------------
            sSql := ' DELETE FROM HMBREAVAL ' +
                    ' WHERE IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString;
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(CMTranslate('Não foi possível remover os dados do historico da reavaliação do Bem ') +
                                      trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                 ' WHERE IDBEM = ' + floattostr(nBem) +
                 '   AND DATAMOVIMENTACAO = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')' +
                 '   AND (IDTIPOMOVIMENTACAO = 08 OR IDTIPOMOVIMENTACAO = 53 OR IDTIPOMOVIMENTACAO = 54' +
                 '        OR IDTIPOMOVIMENTACAO = 101 )' + //Helen SOL Nº 153958 KINTANA Nº 1167601
                 '   AND IDPESSOA = ' + floattostr(nEmpresaProp);
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(CMTranslate('Não foi possível remover o historico da reavaliação do Bem ') +
                                   trim(FcdsBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   floattostr(FcdsBem.FieldByName('PLACA').AsFloat) + ' do Histórico!'+#13+MessageInfo);
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

function TCtrlMovReavaliacao.ListDadosImovelxBemReav: Olevariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IM.IMONOME || '' - '' || I.IMONOME AS IMOVEL_EXTENSO, ' +#13#10+
          '       I.IMOCODIGO,                                          ' +#13#10+
          '       IB.IDIMOVEL,                                          ' +#13#10+
          '       IB.IDBEM,                                             ' +#13#10+
          '       IB.IXBPERCENT,                                        ' +#13#10+
          '       IB.IXBGRUPO,                                          ' +#13#10+
          '       B.IDGRUPO,                                            ' +#13#10+
          '       I.CODTIPIMOVEL,                                       ' +#13#10+
          '       B.IDCONJUNTO,                                         ' +#13#10+
          '       C.IDLOCALIZACAO,                                      ' +#13#10+
          '       C.IDRESPONSAVEL,                                      ' +#13#10+
          '       B.DESBEM,                                             ' +#13#10+
          '       G.NOME AS NOME_GRUPO,                                 ' +#13#10+
          '       B.BAIXATOTAL,                                         ' +#13#10+
          '       0 AS VLR_BEM,                                         ' +#13#10+
          '       1 AS SEL_BEM                                          ' +#13#10+
          '  FROM IMOVEL I,                                             ' +#13#10+
          '       IMOVEL IM,                                            ' +#13#10+
          '       IMOVELXBEM IB,                                        ' +#13#10+
          '       BEM B,                                                ' +#13#10+
          '       CONJUNTO C,                                           ' +#13#10+
          '       GRUPO G                                               ' +#13#10+
          ' WHERE IB.IDBEM = B.IDBEM                                    ' +#13#10+
          '   AND (I.IDIMOVEL = IB.IDIMOVEL)                            ' +#13#10+
          '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)                      ' +#13#10+
          '   AND ( B.IDGRUPO = G.IDGRUPO(+))                           ' +#13#10+
          '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )                    ' +#13#10+
          ' ORDER BY IMOVEL_EXTENSO,                                    ' +#13#10+
          '       IB.IDIMOVEL,                                          ' +#13#10+
          '       B.DESBEM                                              ' ;
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlMovReavaliacao.ListDadosObraReav(
  pDataReav: TDateTime): Olevariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT O.IDIMOVEL,                                                                                                 ' +#13#10+
          '       I.IMOCODIGO,                                                                                                ' +#13#10+
          '       L.IDGRUPO,                                                                                                  ' +#13#10+
          '       DECODE(L.IDGRUPO, T.IDGRUPOTERRENO, ''T'', T.IDGRUPOEDIFICACAO, ''E'', T.IDGRUPOINST, ''I'', NULL) AS TIPO, ' +#13#10+
          '       L.DTALANCAMENTO,                                                                                            ' +#13#10+
          '       SUM(L.VALOFI) AS SALDO                                                                                      ' +#13#10+
          '  FROM CAFOBRA O,                                                                                                  ' +#13#10+
          '       CAFOBRALANC L,                                                                                              ' +#13#10+
          '       IMOVEL I,                                                                                                   ' +#13#10+
          '       PARAMINVESTIMOB P,                                                                                          ' +#13#10+
          '       TIPOIMOVEL T                                                                                                ' +#13#10+
          ' WHERE L.IDCAFOBRA = O.IDCAFOBRA                                                                                   ' +#13#10+
          '   AND O.IDIMOVEL = I.IDIMOVEL(+)                                                                                  ' +#13#10+
          '   AND I.IDPESSOA = P.IDPESSOA                                                                                     ' +#13#10+
          '   AND P.CODTIPIMOVELOBRA = T.CODTIPIMOVEL                                                                         ' +#13#10+
          '   AND O.DTAENCERRAOBRA IS NULL                                                                                    ' +#13#10+
          '   AND L.DTALANCAMENTO <= TO_DATE('+ QuotedStr(DateToStr(pDataReav)) + ', ''DD/MM/YYYY'')                          ' +#13#10+
          ' GROUP BY O.IDIMOVEL,                                                                                              ' +#13#10+
          '       I.IMOCODIGO,                                                                                                ' +#13#10+
          '       L.IDGRUPO,                                                                                                  ' +#13#10+
          '       L.DTALANCAMENTO,                                                                                            ' +#13#10+
          '       DECODE(L.IDGRUPO, T.IDGRUPOTERRENO, ''T'', T.IDGRUPOEDIFICACAO, ''E'', T.IDGRUPOINST, ''I'', NULL)          ';
  Result := GetDataPacket(sSQL);  
end;

function TCtrlMovReavaliacao.ListDadosTipoImovelReav: Olevariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT TI.CODTIPIMOVEL,                                                         ' +#13#10+
          '       TI.DESCTIPOIMOVEL,                                                       ' +#13#10+
          '       TI.IDGRUPOTERRENO,                                                       ' +#13#10+
          '       TI.IDGRUPOEDIFICACAO,                                                    ' +#13#10+
          '       TI.IDGRUPOINST,                                                          ' +#13#10+
          '       TI.CODALTMULTA,                                                          ' +#13#10+
          '       TI.CODALTJUROS,                                                          ' +#13#10+
          '       TI.CODALTCORRMON,                                                        ' +#13#10+
          '       TAM.DESCRICAO AS ALTERADOR_MULTA,                                        ' +#13#10+
          '       TAJ.DESCRICAO AS ALTERADOR_JUROS,                                        ' +#13#10+
          '       TAR.DESCRICAO AS ALTERADOR_CORRECAO                                      ' +#13#10+
          '  FROM TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTERADOR TAR   ' +#13#10+
          ' WHERE ( TI.CODALTMULTA = TAM.CODALTERADOR(+) )                                 ' +#13#10+
          '   AND ( TI.CODALTJUROS = TAJ.CODALTERADOR(+) )                                 ' +#13#10+
          '   AND ( TI.CODALTCORRMON = TAR.CODALTERADOR(+) )                               ' +#13#10+
          ' ORDER BY DESCTIPOIMOVEL                                                        ' ;
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlMovReavaliacao.ListFornecedorReav: OleVariant;
var
  sSQL : String;
begin
  sSQL := 'SELECT F.IDFORCLI,                 ' +#13#10+
          '       P.NOME,                     ' +#13#10+
          '       P.RAZAOSOCIAL               ' +#13#10+
          '  FROM PESSOA P, EMPRESAFORN F     ' +#13#10+
          ' WHERE ( F.IDFORCLI = P.IDPESSOA ) ' +#13#10+
          ' ORDER BY P.NOME                   ';
          
  Result := GetDataPacket(sSQL);
end;

end.

