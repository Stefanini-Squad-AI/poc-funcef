unit uCtrlImobFechamento;
{
-------------------------------------------------------------------------------
Nº SIG......: 133192
Data........: 05/05/2023
Responsável.: Cássio Florencio Rovaroto
Descrição...: Alteração na fórmula de cálculo do fator de depreciação.
--------------------------------------------------------------------------------
Nº SIG......: 113136
Data........: 04/07/2022
Responsável.: Cássio Florencio Rovaroto 
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
Rotina......: CalculaFatorDepreciacao
Nº SIG......: 123892
Data........: 15/03/2022
Responsável.: Cássio Florencio Rovaroto
Descrição...: Alteração na fórmula de cálculo do Fator de Depreciação para
              fechamento a partir de 2022.
-------------------------------------------------------------------------------
Rotina......: CalculaFatorDepreciacao, ExecutaFechamentoREAVALIACAO
Nº SIG......: 123092 
Data........: 10/02/2022
Responsável.: Cássio Florencio Rovaroto
Descrição...: Adequação da depreciação para executar a depreciação acumulada.
-------------------------------------------------------------------------------
Rotina......: ExecutaFechamentoBEM, ExecutaFechamentoREAVALIACAO
Nº SIG......: 121349
Data........: 17/12/2021
Responsável.: Cássio Florencio Rovaroto
Descrição...: Adequações para atendimento da CNPC nº 43/2021, para depreciação
              de imóveis no ativo imobilizado.
-------------------------------------------------------------------------------
Nº SOL......: 270853
Nº PPM......: 1340151
Data........: 23/03/2016
Responsável.: Peterson Victor
Descrição...: Alterações do SOL260961 executar apenas para o modulo InvestImob
-------------------------------------------------------------------------------
Nº SOL......: 260961/18046
Nº PPM......: 1236800
Data........: 04/02/2016
Responsável.: Peterson Victor
Descrição...: Depreciar apenas os Imoveis com taxa cadastrada
-------------------------------------------------------------------------------
Rotina......: ExecutaFechamentoBEM, ExecutaFechamentoACRESCIMO, ExecutaFechamentoREAVALIACAO
Nº SOL......: 247348/17114
Nº PPM......: 748753
Data........: 30/04/2015
Responsável.: Felipe A. Santos
Descrição...: Avanço da data de fechamento mesmo que nenhum imóvel tenha sido depreciado.
-------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 172333
Nº KINTANA..: 1549630
Data........: 01/03/2013
Responsável.: Helen V. Bianchi
Descrição...: Add depreciação apenas para Imoveis adquirido fora do Ano vigente
-------------------------------------------------------------------------------}

interface

uses DB, uCmDbObject, uCmControlObject, wwStoreP,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes, Math, uCMMath,
     dMTFechamento, uDBPlanoGrupo,
     uCtrlBem, uCtrlParamCAF, uCtrlConjunto, uCtrlGrupoContab,
     uCtrlHistMovBem, uCtrlImobCafxContab, uDiasUteis,Dialogs, uCtrlImovel, DCAF,
     UFuncoesImob,
     uCtrlProvisaoImovel, uCMClientDataSet;

type
   TCtrlImobFechamento = class(TCmControlObject)

   protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbUpdGrupo          : TDBPlanoGrupo;

      _dMTFechamento       : tdtmMTFechamento;

      Bem                  : TCtrlBem;
      ParamCAF             : TCtrlParamCAF;
      Conjunto             : TCtrlConjunto;
      GrupoContab          : TCtrlGrupoContab;
      HistMovBem           : TCtrlHistMovBem;
      CafxContab           : TCtrlImobCafxContab;
      DiasUteis            : TDiasUteis;
      ProvisaoImovel       : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG nº 113136

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
      FcdsSaldoContabBem : TClientDataSet;
      FcdsBemxMoedaxDep: TClientDataSet;
      FcdsHistFecBem: TClientDataSet;
      FcdsCAFMoedas: TClientDataSet;

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
      iPrgBarPos: Integer;
      iPrgBarMax: Integer;
      sPrgBarMsg: String;
      //----------------------------------------------------------------------------------
      dDataUltMov:     TDateTime;
      
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
      procedure SetcdsBemxMoedaxDep(const Value: TClientDataSet);
      procedure SetcdsHistFecBem(const Value: TClientDataSet);
      procedure SetcdsCAFMoedas(const Value: TClientDataSet);
      //----------------------------------------------------------------------------------
      // Funções Privativas
      //----------------------------------------------------------------------------------
      procedure CarregarDadosFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                        dDataMov : tDateTime);
      function DataFechamentoAnterior(iModulo, iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                      bSomenteImoveis : boolean) : tDateTime;
      function ExecutaFechamentoBEM(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                    bSomenteImoveis : Boolean;
                                    sBilhete : String) : boolean;
      function ExecutaFechamentoREAVALIACAO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                            bSomenteImoveis : Boolean;
                                            sBilhete : String) : boolean;
      function ExecutaFechamentoACRESCIMO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                          bSomenteImoveis : Boolean;
                                          sBilhete : String) : boolean;
      //Cássio Rovaroto - SIG nº 113136 - Início
      function ExecutaProvisaoCustoImovel(iModulo, iEmpresaProp, iUsuario: Integer;
                                     dDataMov : TDateTime): Boolean;
      //Cássio Rovaroto - SIG nº 113136 - Fim                                     
      //----------------------------------------------------------------------------------
      function GeraCAFMoedasProp : Boolean;

      function BuscaDataUltMovimentacao(iBem: Integer; dDataMov: TDateTime): TDateTime;

      function CMTranslate(sIgor : String) : String;
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
      property cdsSaldoContabBem    : TClientDataSet read FcdsSaldoContabBem    write SetcdsSaldoContabBem;
      property cdsBemxMoedaxDep     : TClientDataSet read FcdsBemxMoedaxDep     write SetcdsBemxMoedaxDep;
      property cdsHistFecBem        : TClientDataSet read FcdsHistFecBem        write SetcdsHistFecBem;
      property cdsCAFMoedas         : TClientDataSet read FcdsCAFMoedas         write SetcdsCAFMoedas;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Funções Públicas
      //----------------------------------------------------------------------------------
      function CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime) : Extended;
      function CalculaFatorDepreciacao(iModulo : Integer; dDataMov, dDataAnt, dDataIni : tDateTime;
                                       bSomenteImoveis : Boolean; dDataUltMov: TDateTime = -1) : Extended;
      function UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer) : tDateTime;
      function ProximaDataFechamento(iModulo, iEmpresaProp,
                                     iGrupoDepIni, iGrupoDepFim : Integer;
                                     bSomenteImoveis : boolean) : tDateTime;
      function DataFechamentoOk(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
      function AtualizaSaldoContabBem(iEmpresaProp, iBem: Integer; dDataSld: tDateTime;
                                      iGrupo, iLocalizacao, iResponsavel : Integer;
                                      bFechamento : Boolean): Boolean;
      //----------------------------------------------------------------------------------
      function ExecutaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                 dDataMov : TDateTime; bSomenteImoveis : Boolean;
                                 sBilhete : String) : Boolean;
      function EstornaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                 dDataMov, dDataEst : TDateTime; bSomenteImoveis : Boolean;
                                 sBilhete : String) : Boolean;
   end;

implementation

{ TCtrlFechamento }

constructor TCtrlImobFechamento.Create;
begin
   inherited;
   _dbUpdGrupo           := TDBPlanoGrupo.Create(Self);

   _dMTFechamento := TdtmMTFechamento.Create(Self);

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
   FcdsSaldoContabBem    := TClientDataSet.Create(nil);
   FcdsBemxMoedaxDep     := TClientDataSet.Create(nil);
   FcdsHistFecBem        := TClientDataSet.Create(nil);
   FcdsCAFMoedas         := TClientDataSet.Create(nil);

   Bem                   := TCtrlBem.Create;
   ParamCAF              := TCtrlParamCAF.Create;
   Conjunto              := TCtrlConjunto.Create;
   HistMovBem            := TCtrlHistMovBem.Create;
   CafxContab            := TCtrlImobCafxContab.Create;
   GrupoContab           := TCtrlGrupoContab.Create;
   DiasUteis             := TDiasUteis.Create;
   ProvisaoImovel        := TCtrlProvisaoImovel.Create; //Cássio Rovaroto - SIG nº 113136
end;

destructor TCtrlImobFechamento.Destroy;
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
   FcdsSaldoContabBem.Free;
   FcdsBemxMoedaxDep.Free;
   FcdsHistFecBem.Free;
   FcdsCAFMoedas.Free;

   _dbUpdGrupo.Free;

   _dMTFechamento.Free;

   Bem.Free;
   ParamCAF.Free;
   Conjunto.Free;
   HistMovBem.Free;
   CafxContab.Free;
   GrupoContab.Free;
   DiasUteis.Free;

   FreeAndNil(ProvisaoImovel); //Cássio Rovaroto - SIG nº 113136

   inherited;
end;

procedure TCtrlImobFechamento.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   ParamCAF.InitializeAs(Self);
   Conjunto.InitializeAs(Self);
   HistMovBem.InitializeAs(Self);
   CafxContab.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
   ProvisaoImovel.InitializeAs(Self); //Cássio Rovaroto - SIG nº 113136
   
end;

procedure TCtrlImobFechamento.DoChangeDataBase;
begin
   inherited;
   _dbUpdGrupo.DataBaseName := DataBaseName;
end;

procedure TCtrlImobFechamento.SetcdsBem(const Value: TClientDataSet);
begin
   FcdsBem := Value;
end;

procedure TCtrlImobFechamento.SetcdsBemxMoeda(const Value: TClientDataSet);
begin
   FcdsBemxMoeda := Value;
end;

procedure TCtrlImobFechamento.SetcdsBemxDep(const Value: TClientDataSet);
begin
   FcdsBemxDep := Value;
end;

procedure TCtrlImobFechamento.SetcdsReavaliacao(const Value: TClientDataSet);
begin
   FcdsReavaliacao := Value;
end;

procedure TCtrlImobFechamento.SetcdsReavalxMoeda(const Value: TClientDataSet);
begin
   FcdsReavalxMoeda := Value;
end;

procedure TCtrlImobFechamento.SetcdsReavalxDep(const Value: TClientDataSet);
begin
   FcdsReavalxDep := Value;
end;

procedure TCtrlImobFechamento.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
   FcdsAcrescimoValor := Value;
end;

procedure TCtrlImobFechamento.SetcdsAcrescValorxMoeda(const Value: TClientDataSet);
begin
   FcdsAcrescValorxMoeda := Value;
end;

procedure TCtrlImobFechamento.SetcdsAcrescValorxDep(const Value: TClientDataSet);
begin
   FcdsAcrescValorxDep := Value;
end;

procedure TCtrlImobFechamento.SetcdsUpdGrupo(const Value: TClientDataSet);
begin
   FcdsUpdGrupo := Value;
end;

procedure TCtrlImobFechamento.SetcdsMovContabBem(const Value: TClientDataSet);
begin
   FcdsMovContabBem := Value;
end;

procedure TCtrlImobFechamento.SetcdsSaldoContabBem(const Value: TClientDataSet);
begin
   FcdsSaldoContabBem := Value;
end;

procedure TCtrlImobFechamento.SetcdsBemxMoedaxDep(const Value: TClientDataSet);
begin
  FcdsBemxMoedaxDep := Value;
end;

procedure TCtrlImobFechamento.SetcdsHistFecBem(const Value: TClientDataSet);
begin
  FcdsHistFecBem := Value;
end;

procedure TCtrlImobFechamento.SetcdsCAFMoedas(const Value: TClientDataSet);
begin
  FcdsCAFMoedas := Value;
end;

function TCtrlImobFechamento.GeraCAFMoedasProp: Boolean;
begin
   FcdsCAFMoedas.Data := GetDataPacket(' SELECT MOECODIGO, (2) AS NUMDECIMAIS, ' + #13 +
                                       '        (''S'') AS FLGARREDONDA ' + #13 +
                                       ' FROM CAFMOEDAS ');
   Result := True;
end;
//========================================================================================
// Carga dos CDS para a execução do Fechamento
//========================================================================================
procedure TCtrlImobFechamento.CarregarDadosFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
                                                  dDataMov : tDateTime);
begin
   _dMTFechamento.sqlFechamentoBem.Prepare;
   _dMTFechamento.sqlFechamentoBem.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
   _dMTFechamento.sqlFechamentoBem.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   _dMTFechamento.sqlFechamentoBem.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   _dMTFechamento.sqlFechamentoBem.ParamByName('PDATAMOV').AsDate         := dDataMov;
   FcdsBem.Data := _dMTFechamento.sqlFechamentoBem.Data;
   _dMTFechamento.sqlFechamentoReavaliacao.Prepare;
   _dMTFechamento.sqlFechamentoReavaliacao.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
   _dMTFechamento.sqlFechamentoReavaliacao.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   _dMTFechamento.sqlFechamentoReavaliacao.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   _dMTFechamento.sqlFechamentoReavaliacao.ParamByName('PDATAMOV').AsDate         := dDataMov;
   FcdsReavaliacao.Data := _dMTFechamento.sqlFechamentoReavaliacao.Data;
   _dMTFechamento.sqlFechamentoAcrescimoValor.Prepare;
   _dMTFechamento.sqlFechamentoAcrescimoValor.ParamByName('PIDPESSOA').AsInteger     := iEmpresaProp;
   _dMTFechamento.sqlFechamentoAcrescimoValor.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   _dMTFechamento.sqlFechamentoAcrescimoValor.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   _dMTFechamento.sqlFechamentoAcrescimoValor.ParamByName('PDATAMOV').AsDate         := dDataMov;
   FcdsAcrescimoValor.Data := _dMTFechamento.sqlFechamentoAcrescimoValor.Data;
   //-------------------------------------------------------------------------------------
   FcdsUpdGrupo.Data := GrupoContab.ListaPlanoGrupo(iEmpresaProp);
   GeraCAFMoedasProp;
end;
//========================================================================================
// Função que retorna a data do último fechamento
//----------------------------------------------------------------------------------------
function TCtrlImobFechamento.UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer) : tDateTime;
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
   begin
      if _cds.FieldByName('DATAMOVIMENTACAO').IsNull then
      begin
         Result := -1;
      end else
      begin
         Result := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime;
      end;
   end else
   begin
      Result := -1;
   end;
end;
//========================================================================================
// Função que retorna a data do próximo fechamento
//----------------------------------------------------------------------------------------
function TCtrlImobFechamento.ProximaDataFechamento(iModulo, iEmpresaProp,
                                               iGrupoDepIni, iGrupoDepFim : Integer;
                                               bSomenteImoveis : boolean) : tDateTime;
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;
   dDataUltMov                : TDateTime;
   sSql                       : String;

begin
   ParamCAF.CarregaProp(iEmpresaProp);
   //-------------------------------------------------------------------------------------
   dDataUltMov := UltimaDataFechamento(iEmpresaProp, iGrupoDepIni, iGrupoDepFim);
   //-------------------------------------------------------------------------------------
   if dDataUltMov = -1 then
   begin
      sSql := ' SELECT MAX(B.DATAINICIODEP) AS MAXDATAINI '+ #13 +
              ' FROM BEM B, '+ #13 +
              '      GRUPO G '+ #13 +
              ' WHERE (G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ' OR G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')' + #13 +
              '   AND B.IDPESSOA = ' + inttostr(iEmpresaProp) + #13 +
              '   AND G.TIPO = ''A'' ' + #13 +
              '   AND B.IDGRUPO = G.IDGRUPO ' + #13;
      _cds.Data := GetDataPacket( sSql );
      //----------------------------------------------------------------------------------
      if not _cds.IsEmpty then
      begin
         if not _cds.FieldByName('MAXDATAINI').IsNull then
         begin
            dDataUltMov := _cds.FieldByName('MAXDATAINI').AsDateTime;
         end else
         begin
            DecodeDate(date(), iAno, iMes, iDia);
            dDataUltMov := EncodeDate(iAno, iMes, iDia);
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (iModulo = 7) or (((iModulo <> 7) or bSomenteImoveis) and (ParamCAF.FLGDIARIO <> 'S')) then
   begin
      //----------------------------------------------------------------------------------
      // Calculo Anual
      //----------------------------------------------------------------------------------
      if ParamCAF.FLGTIPOCALC = 'A' then
      begin
         DecodeDate(dDataUltMov, iAno, iMes, iDia);
         if (iMes = 31) and (iDia = 12) then
         begin
            iAnoFim := iAno + 1
         end else
         begin
            iAnoFim := iAno;
         end;   
         iMesFim := 12;
         iDiaFim := 31;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Mensal
      //----------------------------------------------------------------------------------
      if ParamCAF.FLGTIPOCALC = 'M' then
      begin
         DecodeDate(dDataUltMov, iAno, iMes, iDia);
         if iDia >= 28 then
         begin
            DecodeDate(dDataUltMov + 28, iAno, iMes, iDia)
         end else
         begin
            DecodeDate(dDataUltMov, iAno, iMes, iDia)
         end;
         DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
      end else
      //----------------------------------------------------------------------------------
      // Calculo Diário
      //----------------------------------------------------------------------------------
      if ParamCAF.FLGTIPOCALC = 'D' then
      begin
         DecodeDate(dDataUltMov + 1, iAnoFim, iMesFim, iDiaFim);
      end;
   end else
   begin
      DecodeDate(dDataUltMov + 1, iAnoFim, iMesFim, iDiaFim);
   end;
   //-------------------------------------------------------------------------------------
   Result := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
// Função que retorna a data do fechamento anterior
//----------------------------------------------------------------------------------------
function TCtrlImobFechamento.DataFechamentoAnterior(iModulo, iEmpresaProp,
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
function TCtrlImobFechamento.DataFechamentoOk(iEmpresaProp, iGrupoDepIni, iGrupoDepFim : Integer;
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
function TCtrlImobFechamento.CalculaFatorCorrecaoMonetaria(dDataMov, dDataAnt : tDateTime) : Extended;
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
//========================================================================================
function TCtrlImobFechamento.CalculaFatorDepreciacao(iModulo : Integer;
                                                 dDataMov, dDataAnt, dDataIni : tDateTime;
                                                 bSomenteImoveis : Boolean;
                                                 dDataUltMov: TDateTime  = -1) : Extended;
var
   iMesIni,iAnoIni,iDiaIni,
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno,iNDias,
   iMesInit,iAnoInit,iDiaInit,
   iDayInc                    : Word;
   sAnoIni,sAnoFim            : String;
   dDataInit, dDataRef           : tDateTime;
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
         if (iMesIni = iMesFim) and (iDiaIni = 01) then
         begin
            Result := (1 / 12);
         end else
         begin
            if (iAnoIni <> iAnoFim) and (dDataUltMov <> -1) then
            begin
              dDataRef := dDataUltMov;
              DecodeDate(dDataRef, iAnoIni, iMesIni, iDiaIni);
            end
            else
              dDataRef := dDataAnt;

            iNDias := round(dDataMov - dDataRef) + iDayInc;

            if (dDataMov = dDataRef) or (dDataRef = 0) then
            begin
               Result := 0;
            end else
            begin
               if (iMesIni = iMesFim) and (iDiaIni > 01) then
               begin
                  DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
                  Result := (1 / 12 / iDia) * iNDias;
               end else
               //-------------------------------------------------------------------------
               begin
                  dDataInit := dDataMov - 31;
                  DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
                  DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
                  dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
                  //----------------------------------------------------------------------
                  //SIG nº 133192 - Início
                  if dDataMov >= StrToDate('31/01/2022') then // SIG 123092 e SIG 123892
                      Result :=  (1 / 12) * (365.25 / 30.4375)
                  else
                    if (dDataInit = dDataRef) or
                       ((iMesIni = iMesFim) and (iDiaIni <> 01)) then
                      Result := (1 / 12)
                    else
                      Result := (1 / 12) * (iNDias / 30.4375);
               end;
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
// Função que executa o fechamento de um periodo do CAF, executando a depreciação e
// a correção monetária dos bens.
//----------------------------------------------------------------------------------------
function TCtrlImobFechamento.ExecutaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                           dDataMov : tDateTime; bSomenteImoveis : Boolean;
                                           sBilhete : String) : Boolean;
var
   iHistMovBem : Integer;
   dDataUltDep : tDateTime;
   nPlanilha   : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaFechamento(iModulo, iEmpresaProp, iUsuario,
                                                       dDataMov, bSomenteImoveis);
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
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;;
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
         if iModulo <= 0 then
            Raise Exception.Create('É obrigatório fornecer o código do MODULO!');
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
            MessageInfo := CMTranslate('Data Anterior ao Último Fechamento Realizado ! ') + DatetoStr(dDataUltDep);
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
            sPrgBarMsg := CMTranslate('Preparando...');
            //Cássio Rovaroto - SIG nº 113136 - Início
            //iPrgBarMax  := 1;
            iPrgBarMax := 2;
            //Cássio Rovaroto - SIG nº 113136 - Fim
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         CarregarDadosFechamento(iEmpresaProp,iGrupoDepIni,iGrupoDepFim,dDataMov);
         //-------------------------------------------------------------------------------
         // Calcula a depreciação dos três componentes do saldo contábil dos bens
         //-------------------------------------------------------------------------------
         if not ExecutaFechamentoBEM(iModulo, iEmpresaProp, dDataMov, bSomenteImoveis, sBilhete) then
            Raise Exception.Create(MessageInfo);

         if not ExecutaFechamentoREAVALIACAO(iModulo, iEmpresaProp, dDataMov, bSomenteImoveis, sBilhete) then
            Raise Exception.Create(MessageInfo);

         if not ExecutaFechamentoACRESCIMO(iModulo, iEmpresaProp, dDataMov, bSomenteImoveis, sBilhete) then
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
               sPrgBarMsg := CMTranslate('Registrando a Planilha Contábil...');
               //Cássio Rovaroto - SIG nº 113136 - Início
              //iPrgBarMax  := 1;
              iPrgBarMax := 2;
            //Cássio Rovaroto - SIG nº 113136 - Fim
               iPrgBarPos  := 0;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
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

         //----------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //----------------------------------------------------------------------------
         try
          sPrgBarMsg := CMTranslate('Executando provisão de custos de imóveis... ');
          iPrgBarMax := 2;
          iPrgBarPos  := 1;
          DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //----------------------------------------------------------------------------

         //Cássio Rovaroto - SIG nº 113136 - Início
         if not ExecutaProvisaoCustoImovel(iModulo, iEmpresaProp, iUsuario, dDataMov) then
          Raise Exception.Create(MessageInfo);
         //Cássio Rovaroto - SIG nº 113136 - Fim
         
         try
            sPrgBarMsg := CMTranslate('Finalizando...');
            //Cássio Rovaroto - SIG nº 113136 - Início
            //iPrgBarPos := 1;
            //iPrgBarMax := 1;
            iPrgBarPos := 2;
            iPrgBarMax := 2;
            //Cássio Rovaroto - SIG nº 113136 - Fim
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
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
// Função que calcula a depreciação/correção monetária na Tabela BEM
//----------------------------------------------------------------------------------------
function TCtrlImobFechamento.ExecutaFechamentoBEM(iModulo, iEmpresaProp : Integer;
                                              dDataMov : TDateTime;
                                              bSomenteImoveis : Boolean;
                                              sBilhete : String) : Boolean;
var
   nValCmBem, nCmBem,
   nValDepLanc, nDepLanc,
   nValCmDep, nCmDep        : Currency;
   nIdBem, nMoeCodigo,
   nFatorCM, nFatorDep,
   nSeqHist, nTaxaDep,
   nValMin                  : Extended;
   iFatorDec,
   iFlgPai, iFlgDeprec      : Integer;
   bCalcCM, bCalcDep,
   bCalcCMDEP               : Boolean;
   sFatorDec                : String;
   iAno_Dep, iMes_Dep, iDia_Dep,iAno_Atu, iMes_Atu, iDia_Atu : Word; //Helen - SOL:172333 KTN: 1549630
begin
   try
      //----------------------------------------------------------------------------------
      // Interface com a Aplicação Cliente (Barra de Progresso)
      //----------------------------------------------------------------------------------
      try
         sPrgBarMsg := CMTranslate('Iniciando...');
         iPrgBarMax  := FcdsBem.RecordCount;
         iPrgBarPos  := 0;
         DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
      except

      end;
      //----------------------------------------------------------------------------------

      // Peterson Victor SOL 270853
      if iModulo = 54 then
      begin
        // Peterson Victor SOL 260961/18046 PPM 1236800 Inicio
        FcdsBem.Filtered := False;
        FcdsBem.Filter := ' TXDEP_ANO  > 0 ';
        FcdsBem.Filtered := True;
        FcdsBem.First;
        // Peterson Victor SOL 260961/18046 PPM 1236800 Fim
      end;

      if not FcdsBem.IsEmpty then
      begin
        bFlgPrimBem := True;
        while not FcdsBem.EOF do
        begin
           nIdBem := FcdsBem.FieldByName('IDBEM').AsFloat;
           dDataUltMov := BuscaDataUltMovimentacao(FcdsBem.FieldByName('IDBEM').AsInteger, dDataMov);
           //-------------------------------------------------------------------------------
           // Processa os calculos por moeda
           //-------------------------------------------------------------------------------
           bUpdDatGrupo := False;
           while (not FcdsBem.EOF) and (FcdsBem.FieldByName('IDBEM').AsFloat = nIdBem) do
           begin
              bCalcCM   := False;
              nCmBem    := 0;
              nCmDep    := 0;
              nValCmBem := FcdsBem.FieldByName('CMBEM').AsFloat;
              //----------------------------------------------------------------------------
              // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
              // monetária estiver ativado, processar a correção monetária do custo
              //----------------------------------------------------------------------------
              if (FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
              begin
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo da correção monetária para o BEM
                 //-------------------------------------------------------------------------
                 nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBem.FieldByName('DATAULTCM').AsDateTime);
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
                    nCmBem := (FcdsBem.FieldByName('VALORG').AsFloat + FcdsBem.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                    if abs(nCmBem) >= 0.01 then
                       nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nCmBem) >= 0.01 then
                    begin
                       nValCmBem := FcdsBem.FieldByName('CMBEM').AsFloat + nCmBem;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,               // IDBEM
                                                                 FcdsBem.FieldByName('IDPESSOA').AsFloat,            // IDPESSOA
                                                                 FcdsBem.FieldByName('IDMODULO').AsFloat,            // IDMODULO
                                                                 15,                                                 // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                           // DATAMOVIMENTACAO
                                                                 -1,                                                 // IDREAVALACRESC
                                                                 FcdsBem.FieldByName('DATAULTCM').AsDateTime,  // DATAULTDEP
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
                                                                 0,
                                                                 '');                                                // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsBem.FieldByName('MOECODIGO').AsInteger,
                                                               0,
                                                               nCmBem) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor na tabela BemxMoeda
                       //-------------------------------------------------------------------
                       _dMTFechamento.sqlAtuBemxMoeda.Prepare;
                       _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDBEM').AsFloat        := FcdsBem.FieldByName('IDBEM').AsFloat;
                       _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDPESSOA').AsFloat     := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                       _dMTFechamento.sqlAtuBemxMoeda.ParamByName('MOECODIGO').AsInteger  := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                       _dMTFechamento.sqlAtuBemxMoeda.ParamByName('CMBEM').AsFloat        := nValCmBem;
                       _dMTFechamento.sqlAtuBemxMoeda.ParamByName('DATAULTCM').AsDate     := dDataMov;
                       if not ExecSQL(_dMTFechamento.sqlAtuBemxMoeda.SQLChanged, True) then
                          Raise Exception.Create(MessageInfo);
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
                                                                         dDataMov,nCmBem,nCmDep,'FB',
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
              nMoeCodigo := FcdsBem.FieldByName('MOECODIGO').AsFloat;
              //----------------------------------------------------------------------------
              // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
              // por Taxa de Depreciação na Moeda no Bem
              //----------------------------------------------------------------------------
              iFlgPai := 1;
              while (not FcdsBem.EOF) and (FcdsBem.FieldByName('IDBEM').AsFloat = nIdBem) and
                                          (FcdsBem.FieldByName('MOECODIGO').AsFloat = nMoeCodigo) do
              begin
                 //-------------------------------------------------------------------------
                 // Interface com a Aplicação Cliente (Barra de Progresso)
                 //-------------------------------------------------------------------------
                 try
                    iPrgBarPos  := iPrgBarPos + 1;
                    sPrgBarMsg := CMTranslate('Processando Fase 1 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
                    DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                 except

                 end;
                 //-------------------------------------------------------------------------
                 bCalcCmDep  := False;
                 nValCmDep   := FcdsBem.FieldByName('CMDEP').AsFloat;
                 nCmDep      := 0;
                 bCalcDep    := False;
                 nValDepLanc := FcdsBem.FieldByName('DEPLANC').AsFloat;
                 nDepLanc    := 0;
                 //-------------------------------------------------------------------------
                 // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                 // correção monetária estiver ativado, processar a correção monetária da
                 // Depreciação Acumulada
                 //-------------------------------------------------------------------------
                 if (FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula o fator de tempo da correção monetária
                    //----------------------------------------------------------------------
                    nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsBem.FieldByName('DATAULTCMDEP').AsDateTime);
                    //----------------------------------------------------------------------
                    if nFatorCM > 0 then
                    begin
                       //-------------------------------------------------------------------
                       // Calcula a Correção Monetária da Depreciação Acumulada
                       //-------------------------------------------------------------------
                       nCmDep := (FcdsBem.FieldByName('DEPLANC').AsFloat + FcdsBem.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                       if abs(nCmDep) >= 0.01 then
                          nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                       //-------------------------------------------------------------------
                       // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                       // caso contrário, deixar para acumular na próxima depreciação.
                       //-------------------------------------------------------------------
                       if abs(nCmDep) >= 0.01 then
                       begin
                          nValCmDep := FcdsBem.FieldByName('CMDEP').AsFloat + nCmDep;
                          //----------------------------------------------------------------
                          // Registra na tabela HISTORICOMOVIMENTACAO
                          //----------------------------------------------------------------
                          nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,            // IDBEM
                                                                    FcdsBem.FieldByName('IDPESSOA').AsFloat,         // IDPESSOA
                                                                    FcdsBem.FieldByName('IDMODULO').AsFloat,         // IDMODULO
                                                                    21,                                              // IDTIPOMOVIMENTACAO
                                                                    dDataMov,                                        // DATAMOVIMENTACAO
                                                                    -1,                                              // IDREAVALACRESC
                                                                    FcdsBem.FieldByName('DATAULTCMDEP').AsDateTime, // DATAULTDEP
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
                                                                    0,                                               // VALVENDAOFI
                                                                    '');                                             // OBSBAIXA
                          if nSeqHist = -1 then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor no histórico
                          //----------------------------------------------------------------
                          if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                  FcdsBem.FieldByName('MOECODIGO').AsInteger,
                                                                  FcdsBem.FieldByName('IDBEMXDEP').AsInteger,
                                                                  nCmDep) then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor na tabela BEMXDEP
                          //----------------------------------------------------------------
                          _dMTFechamento.sqlAtuBemxDep1.Prepare;
                          _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDBEM').AsFloat        := FcdsBem.FieldByName('IDBEM').AsFloat;
                          _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDPESSOA').AsFloat     := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                          _dMTFechamento.sqlAtuBemxDep1.ParamByName('MOECODIGO').AsInteger  := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                          _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDTAXADEP').AsInteger  := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                          _dMTFechamento.sqlAtuBemxDep1.ParamByName('CMDEP').AsFloat        := nValCmDep;
                          _dMTFechamento.sqlAtuBemxDep1.ParamByName('DATAULTCM').AsDate     := dDataMov;
                          if not ExecSQL(_dMTFechamento.sqlAtuBemxDep1.SQLChanged, True) then
                             Raise Exception.Create(MessageInfo);
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
                                                                            dDataMov,nCmBem,nCmDep,'FB',
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
                 if FcdsBem.FieldByName('DATAULTDEP').AsDateTime = 0 then
                 begin
                    nFatorDep := CalculaFatorDepreciacao(iModulo, dDataMov,
                                                         FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                         FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                         bSomenteImoveis);
                 end else
                 begin
                    nFatorDep := CalculaFatorDepreciacao(iModulo, dDataMov,
                                                         FcdsBem.FieldByName('DATAULTDEP').AsDateTime,
                                                         FcdsBem.FieldByName('DATAINICIODEP').AsDateTime,
                                                         bSomenteImoveis,
                                                         dDataUltMov);
                 end;
                 //-------------------------------------------------------------------------
                 // Captura o flag de controle de fim de periodo de depreciação
                 //-------------------------------------------------------------------------
                 if FcdsBem.FieldByName('FLGDEPREC').IsNull then
                    iFlgDeprec := 0
                 else
                    iFlgDeprec := FcdsBem.FieldByName('FLGDEPREC').AsInteger;
                 //-------------------------------------------------------------------------
                 // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                 // for diferente de zero e a taxa de depreciação for diferente de zero,
                 // Calcular o valor a depreciar no periodo.
                 //-------------------------------------------------------------------------
                 //Helen - SOL: 172333 KTN: 1549630 - Inicio
                  _cds.Data := GetDataPacket( ' SELECT '+ #13 +
                                              ' IDBEM,DTAINCLUSAO,DATAINICIODEP   '+ #13 +
                                              ' FROM BEM '+ #13 +
                                   ' WHERE IDBEM = ' + FcdsBem.FieldByName('IDBEM').asString) ;
                 iAno_Dep := 0;
                 DecodeDate(_cds.FieldByName('DATAINICIODEP').AsDateTime, iAno_Dep, iMes_Dep, iDia_Dep);
                 DecodeDate(dDataMov, iAno_Atu, iMes_Atu, iDia_Atu);
                { if (iFlgDeprec = 0) and (nFatorDep > 0) and
                    (FcdsBem.FieldByName('TAXADEP').AsFloat > 0) then}
                if (iFlgDeprec = 0) and (nFatorDep > 0) and (FcdsBem.FieldByName('TAXADEP').AsFloat > 0)
                    and (iAno_Atu > iAno_Dep) then
                 //Helen - SOL: 172333 KTN: 1549630 - Fim
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a quota proporcional de depreciação do bem
                    //----------------------------------------------------------------------
                    nTaxaDep := ((FcdsBem.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                    //Cássio Rovaroto - SIG nº 133192 - Início
                    // A partir dos fechamentos de 2023, considerar a depreciação acumulada no cálculo:
                    if DateToStr(dDataMov) <= '31/12/2022' then
                      nDepLanc := (nTaxaDep * (FcdsBem.FieldByName('VALORG').AsFloat + nValCmBem))
                    else
                      nDepLanc := (nTaxaDep * ((FcdsBem.FieldByName('VALORG').AsFloat -
                                                FcdsBem.FieldByName('DEPLANC').AsFloat) +
                                                nValCmBem));
                    //Cássio Rovaroto - SIG nº 133192 - Fim                             
                    //----------------------------------------------------------------------
                    // Converte para a Precisão da Moeda
                    //----------------------------------------------------------------------
                    if FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
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
                       if FcdsCAFMoedas.Locate('MOECODIGO',FcdsBem.FieldByName('MOECODIGO').AsInteger,[]) then
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
                    if (nValDepLanc + nDepLanc + nValCmDep) >= (FcdsBem.FieldByName('VALORG').AsFloat + nValCmBem) then
                    begin
                       nDepLanc := (FcdsBem.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                       iFlgDeprec := 1;
                    end;
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nDepLanc) >= nValMin then
                    begin
                       nValDepLanc := FcdsBem.FieldByName('DEPLANC').AsFloat + nDepLanc;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsBem.FieldByName('IDBEM').AsFloat,             // IDBEM
                                                                 FcdsBem.FieldByName('IDPESSOA').AsFloat,          // IDPESSOA
                                                                 FcdsBem.FieldByName('IDMODULO').AsFloat,          // IDMODULO
                                                                 14,                                               // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                         // DATAMOVIMENTACAO
                                                                 -1,                                               // IDREAVALACRESC
                                                                 FcdsBem.FieldByName('DATAULTDEP').AsDateTime,     // DATAULTDEP
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
                                                                 0,                                                // VALVENDAOFI
                                                                 '');                                              // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsBem.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsBem.FieldByName('IDBEMXDEP').AsInteger,
                                                               nDepLanc) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra os valores na tabela BEMXDEP
                       //-------------------------------------------------------------------
                       _dMTFechamento.sqlAtuBemxDep2.Prepare;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDBEM').AsFloat         := FcdsBem.FieldByName('IDBEM').AsFloat;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDPESSOA').AsFloat      := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('DEPLANC').AsFloat       := nValDepLanc;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDate     := dDataMov;
                       _dMTFechamento.sqlAtuBemxDep2.ParamByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                       if not ExecSQL(_dMTFechamento.sqlAtuBemxDep2.SQLChanged, True) then
                          Raise Exception.Create(MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra a Depreciação na Contabilidade
                       // Qdo estiver processando a Moeda Oficial do País de EmpresaProp
                       //-------------------------------------------------------------------
                       if bIntegraContab and
                         (FcdsBem.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
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
                                                                   dDataMov,nDepLanc,'FB',
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
                    // Atualiza a tabela SALDOCONTABBEM
                    //----------------------------------------------------------------------
                    if not Bem.AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                                      FcdsBem.FieldByName('IDBEM').AsInteger,
                                                      dDataMov,
                                                      FcdsBem.FieldByName('MOECODIGO').AsInteger,
                                                      FcdsBem.FieldByName('IDBEMXDEP').AsInteger,
                                                      0, nCmBem, nDepLanc, nCmDep,
                                                      0, 0, 0, 0,
                                                      0, 0, 0, 0,
                                                      FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                      FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                      FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                                      FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                      FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                      0, iFlgPai) then
                       Raise Exception.Create(Bem.MessageInfo);

                    // Felipe A. Santos SOL 247348/17114 PPM 748753 - início Comentário
                    {//----------------------------------------------------------------------
                    // Registra na tabela GRUPO a atualização da data do último fechamento
                    //----------------------------------------------------------------------
                    if bUpdDatGrupo and ((FcdsBem.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
                    begin
                       bFlgPrimBem := False;
                       if FcdsUpdGrupo.Locate('IDGRUPO', FcdsBem.FieldByname('IDGRUPO').AsInteger,[]) then
                       begin
                          FcdsUpdGrupo.Edit;
                          FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                          FcdsUpdGrupo.Post;
                       end;
                    end;}
                    // Felipe A. Santos SOL 247348/17114 PPM 748753 - fim Comentário
                 end;

                 // Felipe A. Santos SOL 247348/17114 PPM 748753 - Início

                 //----------------------------------------------------------------------
                 // Registra na tabela GRUPO a atualização da data do último fechamento
                 //----------------------------------------------------------------------
                 if ((FcdsBem.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
                 begin
                    bFlgPrimBem := False;
                    if FcdsUpdGrupo.Locate('IDGRUPO', FcdsBem.FieldByname('IDGRUPO').AsInteger,[]) then
                    begin
                       FcdsUpdGrupo.Edit;
                       FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                       FcdsUpdGrupo.Post;
                    end;
                 end;

                 // Felipe A. Santos SOL 247348/17114 PPM 748753 - fim

                 //-------------------------------------------------------------------------
                 iFlgPai := 0;
                 //-------------------------------------------------------------------------
                 // Avança para a próxima moeda x legislação
                 //-------------------------------------------------------------------------
                 FcdsBem.Next;
              end;
           end;
        end;
      end
      else
      if iModulo = 54 then // Peterson Victor SOL 270853
      begin
        // Peterson Victor SOL 260961/18046 PPM 1236800 Inicio
        FcdsBem.Filtered := False;
        FcdsBem.Filter := ' ';
        FcdsBem.First;

        while not FcdsBem.EOF do
        begin
           if ((FcdsBem.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
           begin
              bFlgPrimBem := False;

              if FcdsUpdGrupo.Locate('IDGRUPO', FcdsBem.FieldByname('IDGRUPO').AsInteger,[]) then
              begin
                 FcdsUpdGrupo.Edit;
                 FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                 FcdsUpdGrupo.Post;
              end;
           end;
           FcdsBem.Next;
        end;
        // Peterson Victor SOL 260961/18046 PPM 1236800 Fim
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
function TCtrlImobFechamento.ExecutaFechamentoREAVALIACAO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                                      bSomenteImoveis : Boolean;
                                                      sBilhete : String) : boolean;
var
   nValCmBem, nCmBem,
   nValCmDep, nCmDep,
   nValDepLanc, nDepLanc         : Currency;
   nIdReavaliacao, nMoeCodigo,
   nFatorCM, nFatorDep,
   nSeqHist, nTaxaDep,
   nValMin                       : Extended;
   iFatorDec,
   iFlgPai, iFlgDeprec           : Integer;
   bCalcCM, bCalcDEP, bCalcCMDEP : Boolean;
   sFatorDec                     : String;
   nAcumValorG                   : Currency;
   iIdBem                        : Integer;

begin
   nAcumValorG := 0;
   try
      //----------------------------------------------------------------------------------
      // Interface com a Aplicação Cliente (Barra de Progresso)
      //----------------------------------------------------------------------------------
      try
         sPrgBarMsg := CMTranslate('Iniciando...');
         iPrgBarMax  := FcdsReavaliacao.RecordCount;
         iPrgBarPos  := 0;
         DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
      except

      end;
      //----------------------------------------------------------------------------------

      // Peterson Victor SOL 270853
      if iModulo = 54 then
      begin
        // Peterson Victor SOL 260961/18046 PPM 1236800 Inicio
        FcdsReavaliacao.Filtered := False;
        FcdsReavaliacao.Filter := ' TXDEP_ANO  > 0 ';
        FcdsReavaliacao.Filtered := True;
        FcdsReavaliacao.First;
        // Peterson Victor SOL 260961/18046 PPM 1236800 Fim
      end;

      if not FcdsReavaliacao.IsEmpty then
      begin
        bFlgPrimBem := True;
        iIdbem := -1;
        while not FcdsReavaliacao.EOF do
        begin
           nIdReavaliacao := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;

           if iIdBem <> FcdsReavaliacao.FieldByName('IDBEM').AsInteger then
            nAcumValorG := 0;
           iIdBem :=  FcdsReavaliacao.FieldByName('IDBEM').AsInteger;
           //-------------------------------------------------------------------------------
           // Processa os calculos por moeda
           //-------------------------------------------------------------------------------
           bUpdDatGrupo := False;
           while (not FcdsReavaliacao.EOF) and (FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger = nIdReavaliacao) do
           begin
              bCalcCM   := False;
              nCmBem    := 0;
              nCmDep    := 0;
              nValCmBem := FcdsReavaliacao.FieldByName('CMBEM').AsFloat;
              //----------------------------------------------------------------------------
              // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
              // monetária estiver ativado, processar a correção monetária do custo
              //----------------------------------------------------------------------------
              if (FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
              begin
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo da correção monetária para o BEM
                 //-------------------------------------------------------------------------
                 nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavaliacao.FieldByName('DATAULTCM').AsDateTime);
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
                    nCmBem := (FcdsReavaliacao.FieldByName('VALORG').AsFloat + FcdsReavaliacao.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                    if abs(nCmBem) >= 0.01 then
                       nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nCmBem) >= 0.01 then
                    begin
                       nValCmBem := FcdsReavaliacao.FieldByName('CMBEM').AsFloat + nCmBem;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsReavaliacao.FieldByName('IDBEM').AsFloat,          // IDBEM
                                                                 FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat,       // IDPESSOA
                                                                 FcdsReavaliacao.FieldByName('IDMODULO').AsFloat,       // IDMODULO
                                                                 22,                                                    // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                              // DATAMOVIMENTACAO
                                                                 FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,  // IDREAVALACRESC
                                                                 FcdsReavaliacao.FieldByName('DATAULTCM').AsDateTime,   // DATAULTDEP
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
                                                                 0,                                                     // VALVENDAOFI
                                                                 '');                                                   // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,
                                                               0,
                                                               nCmBem) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor na tabela ReavalxMoeda
                       //-------------------------------------------------------------------
                       _dMTFechamento.sqlAtuReavxMoeda.Prepare;
                       _dMTFechamento.sqlAtuReavxMoeda.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
                       _dMTFechamento.sqlAtuReavxMoeda.ParamByName('MOECODIGO').AsInteger     := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                       _dMTFechamento.sqlAtuReavxMoeda.ParamByName('CMBEM').AsFloat           := nValCmBem;
                       _dMTFechamento.sqlAtuReavxMoeda.ParamByName('DATAULTCM').AsDate        := dDataMov;
                       if not ExecSQL(_dMTFechamento.sqlAtuReavxMoeda.SQLChanged, True) then
                          Raise Exception.Create(MessageInfo);
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
                                                                         dDataMov,nCmBem,nCmDep,'FR',
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
              nMoeCodigo := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
              //----------------------------------------------------------------------------
              // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
              // por Taxa de Depreciação na Moeda na Reavaliacao
              //----------------------------------------------------------------------------
              iFlgPai := 1;
              while (not FcdsReavaliacao.EOF) and (FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger = nIdReavaliacao) and
                                                  (FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = nMoeCodigo) do
              begin
                 bCalcCmDep  := False;
                 nValCmDep   := FcdsReavaliacao.FieldByName('CMDEP').AsFloat;
                 nCmDep      := 0;
                 bCalcDep    := False;
                 nValDepLanc := FcdsReavaliacao.FieldByName('DEPLANC').AsFloat;
                 nDepLanc    := 0;

                 //Cássio Rovaroto - SIG nº 133192 - Início
                 if DateToStr(dDataMov) < '01/01/2022' then
                  nAcumValorG := nAcumValorG + FcdsReavaliacao.FieldByName('VALORG').AsFloat
                 else
                  nAcumValorG := nAcumValorG + (FcdsReavaliacao.FieldByName('VALORG').AsFloat -
                                                FcdsReavaliacao.FieldByName('DEPLANC').AsFloat);
                 //Cássio Rovaroto - SIG nº 133192 - Fim 
                 //-------------------------------------------------------------------------
                 // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                 // correção monetária estiver ativado, processar a correção monetária da
                 // Depreciação Acumulada
                 //-------------------------------------------------------------------------
                 if (FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                    (ParamCAF.FLGCALCCM = 1) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula o fator de tempo da correção monetária
                    //----------------------------------------------------------------------
                    nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsReavaliacao.FieldByName('DATAULTCMDEP').AsDateTime);
                    //----------------------------------------------------------------------
                    if nFatorCM > 0 then
                    begin
                       //-------------------------------------------------------------------
                       // Calcula a Correção Monetária da Depreciação Acumulada
                       //-------------------------------------------------------------------
                       nCmDep := (FcdsReavaliacao.FieldByName('DEPLANC').AsFloat + FcdsReavaliacao.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                       if abs(nCmDep) >= 0.01 then
                          nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                       //-------------------------------------------------------------------
                       // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                       // caso contrário, deixar para acumular na próxima depreciação.
                       //-------------------------------------------------------------------
                       if abs(nCmDep) >= 0.01 then
                       begin
                          nValCmDep := FcdsReavaliacao.FieldByName('CMDEP').AsFloat + nCmDep;
                          //----------------------------------------------------------------
                          // Registra na tabela HISTORICOMOVIMENTACAO
                          //----------------------------------------------------------------
                          nSeqHist := HistMovBem.RegistraHistMovBem(FcdsReavaliacao.FieldByName('IDBEM').AsFloat,         // IDBEM
                                                                    FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat,      // IDPESSOA
                                                                    FcdsReavaliacao.FieldByName('IDMODULO').AsFloat,      // IDMODULO
                                                                    19,                                                   // IDTIPOMOVIMENTACAO
                                                                    dDataMov,                                             // DATAMOVIMENTACAO
                                                                    FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,  // IDREAVALACRESC
                                                                    FcdsReavaliacao.FieldByName('DATAULTCMDEP').AsDateTime, // DATAULTDEP
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
                                                                    0,                                     // VALVENDAOFI
                                                                    '');                                                  // OBSBAIXA
                          if nSeqHist = -1 then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor no histórico
                          //----------------------------------------------------------------
                          if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                  FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,
                                                                  FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger,
                                                                  nCmDep) then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor na tabela ReavalxDep
                          //----------------------------------------------------------------
                          _dMTFechamento.sqlAtuReavxDep1.Prepare;
                          _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
                          _dMTFechamento.sqlAtuReavxDep1.ParamByName('MOECODIGO').AsInteger     := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                          _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDTAXADEP').AsInteger     := FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger;
                          _dMTFechamento.sqlAtuReavxDep1.ParamByName('CMDEP').AsFloat           := nValCmDep;
                          _dMTFechamento.sqlAtuReavxDep1.ParamByName('DATAULTCM').AsDate        := dDataMov;
                          if not ExecSQL(_dMTFechamento.sqlAtuReavxDep1.SQLChanged, True) then
                             Raise Exception.Create(MessageInfo);
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
                                                                            dDataMov,nCmBem,nCmDep,'FR',
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
                                                      FcdsReavaliacao.FieldByName('DATAULTDEP').AsDateTime,
                                                      FcdsReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime,
                                                      bSomenteImoveis);
                 //-------------------------------------------------------------------------
                 // Captura o flag de controle de fim de periodo de depreciação
                 //-------------------------------------------------------------------------
                 if FcdsReavaliacao.FieldByName('FLGDEPREC').IsNull then
                    iFlgDeprec := 0
                 else
                    iFlgDeprec := FcdsReavaliacao.FieldByName('FLGDEPREC').AsInteger;
                 //-------------------------------------------------------------------------
                 // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                 // for diferente de zero e a taxa de depreciação for diferente de zero,
                 // Calcular o valor a depreciar no periodo.
                 //-------------------------------------------------------------------------
                 if (iFlgDeprec = 0) and
                    (nFatorDep > 0) and
                    (FcdsReavaliacao.FieldByName('TAXADEP').AsFloat > 0) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a quota proporcional de depreciação do bem
                    //----------------------------------------------------------------------
                    nTaxaDep := ((FcdsReavaliacao.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                    //nDepLanc := (nTaxaDep * (FcdsReavaliacao.FieldByName('VALORG').AsFloat + nValCmBem));
                    nDepLanc := (nTaxaDep * (nAcumValorG + nValCmBem));
                    //----------------------------------------------------------------------
                    // Converte para a Precisão da Moeda
                    //----------------------------------------------------------------------
                    if FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
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
                       if FcdsCAFMoedas.Locate('MOECODIGO',FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,[]) then
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
                    if DateToStr(dDataMov) < '01/01/2022' then
                    begin
                      if abs(nValDepLanc + nDepLanc + nValCmDep) >=
                         abs(FcdsReavaliacao.FieldByName('VALORG').AsFloat + nValCmBem) then
                      begin
                         nDepLanc := (FcdsReavaliacao.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                         iFlgDeprec := 1;
                      end
                      else
                        iFlgDeprec := 1;
                    end;
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nDepLanc) >= nValMin then
                    begin
                       nValDepLanc := FcdsReavaliacao.FieldByName('DEPLANC').AsFloat + nDepLanc;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsReavaliacao.FieldByName('IDBEM').AsFloat,           // IDBEM
                                                                 FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat,        // IDPESSOA
                                                                 StrToFloat(IntToStr(iModulo)),                          // IDMODULO
                                                                 18,                                                     // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                               // DATAMOVIMENTACAO
                                                                 FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,   // IDREAVALACRESC
                                                                 FcdsReavaliacao.FieldByName('DATAULTDEP').AsDateTime,   // DATAULTDEP
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
                                                                 0,                                     // VALVENDAOFI
                                                                 '');                                                    // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger,
                                                               nDepLanc) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra os valores na tabela ReavalxDep
                       //-------------------------------------------------------------------
                       _dMTFechamento.sqlAtuReavxDep2.Prepare;
                       _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
                       _dMTFechamento.sqlAtuReavxDep2.ParamByName('MOECODIGO').AsInteger     := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                       _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDTAXADEP').AsInteger     := FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger;
                       _dMTFechamento.sqlAtuReavxDep2.ParamByName('DEPLANC').AsFloat         := nValDepLanc;
                       _dMTFechamento.sqlAtuReavxDep2.ParamByName('DATAULTDEP').AsDate       := dDataMov;
                       _dMTFechamento.sqlAtuReavxDep2.ParamByName('FLGDEPREC').AsInteger     := iFlgDeprec;
                       if not ExecSQL(_dMTFechamento.sqlAtuReavxDep2.SQLChanged, True) then
                          Raise Exception.Create(MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra a Depreciação na Contabilidade
                       //-------------------------------------------------------------------
                       if bIntegraContab and
                         (FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
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
                                                                   dDataMov,nDepLanc, 'FR',
                                                                   iExercicio, iPeriodo,
                                                                   bSomenteImoveis, bCtaxCCusto) then
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
                    // Atualiza a tabela SALDOCONTABBEM
                    //----------------------------------------------------------------------
                    if cdsReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 0 then
                    begin
                       if not Bem.AtualizaSaldoContabBem(FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                         dDataMov,
                                                         FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger,
                                                         0, 0, 0, 0,
                                                         0, nCmBem, nDepLanc, nCmDep,
                                                         0, 0, 0, 0,
                                                         FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDLOCALIZACAO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDRESPONSAVEL').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDCONJUNTO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('UNIDNEGOC').AsInteger,
                                                         0, iFlgPai) then
                          Raise Exception.Create(Bem.MessageInfo);
                    end else
                    begin
                       if not Bem.AtualizaSaldoContabBem(FcdsReavaliacao.FieldByName('IDPESSOA').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDBEM').AsInteger,
                                                         dDataMov,
                                                         FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger,
                                                         0, 0, 0, 0,
                                                         0, 0, 0, 0,
                                                         0, nCmBem, nDepLanc, nCmDep,
                                                         FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDLOCALIZACAO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDRESPONSAVEL').AsInteger,
                                                         FcdsReavaliacao.FieldByName('IDCONJUNTO').AsInteger,
                                                         FcdsReavaliacao.FieldByName('UNIDNEGOC').AsInteger,
                                                         0, iFlgPai) then
                          Raise Exception.Create(Bem.MessageInfo);
                    end;
                    // Felipe A. Santos SOL 247348/17114 PPM 748753 - Início comentário
                    {
                    //----------------------------------------------------------------------
                    // Registra na tabela GRUPO a atualização da data do último fechamento
                    //----------------------------------------------------------------------
                    if bUpdDatGrupo and ((FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
                    begin
                       bFlgPrimBem := False;
                       if FcdsUpdGrupo.Locate('IDGRUPO', FcdsReavaliacao.FieldByname('IDGRUPO').AsInteger,[]) then
                       begin
                          FcdsUpdGrupo.Edit;
                          FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                          FcdsUpdGrupo.Post;
                       end;
                    end; }
                    // Felipe A. Santos SOL 247348/17114 PPM 748753 - fim comentário
                 end;

                 // Felipe A. Santos SOL 247348/17114 PPM 748753 - Início
                 //----------------------------------------------------------------------
                 // Registra na tabela GRUPO a atualização da data do último fechamento
                 //----------------------------------------------------------------------
                 if ((FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
                 begin
                    bFlgPrimBem := False;
                    if FcdsUpdGrupo.Locate('IDGRUPO', FcdsReavaliacao.FieldByname('IDGRUPO').AsInteger,[]) then
                    begin
                       FcdsUpdGrupo.Edit;
                       FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                       FcdsUpdGrupo.Post;
                    end;
                 end;
                 // Felipe A. Santos SOL 247348/17114 PPM 748753 - fim

                 //-------------------------------------------------------------------------
                 iFlgPai := 0;
                 //-------------------------------------------------------------------------
                 // Avança para a próxima taxa de depreciação x moeda
                 //-------------------------------------------------------------------------
                 FcdsReavaliacao.Next;
                 //-------------------------------------------------------------------------
                 // Interface com a Aplicação Cliente (Barra de Progresso)
                 //-------------------------------------------------------------------------
                 try
                    iPrgBarPos  := iPrgBarPos + 1;
                    sPrgBarMsg := CMTranslate('Processando Fase 2 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
                    DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                 except

                 end;
              end;
           end;
        end;
      end
      else
      if iModulo = 54 then  // Peterson Victor SOL 270853
      begin
        // Peterson Victor SOL 260961/18046 PPM 1236800 Inicio
        FcdsReavaliacao.Filtered := False;
        FcdsReavaliacao.Filter := ' ';
        FcdsReavaliacao.First;

        while not FcdsReavaliacao.EOF do
        begin
           if ((FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
           begin
              bFlgPrimBem := False;
              if FcdsUpdGrupo.Locate('IDGRUPO', FcdsReavaliacao.FieldByname('IDGRUPO').AsInteger,[]) then
              begin
                 FcdsUpdGrupo.Edit;
                 FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                 FcdsUpdGrupo.Post;
              end;
           end;

           FcdsReavaliacao.Next;
        end;
        // Peterson Victor SOL 260961/18046 PPM 1236800 Fim
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
function TCtrlImobFechamento.ExecutaFechamentoACRESCIMO(iModulo, iEmpresaProp : Integer; dDataMov : tDateTime;
                                                    bSomenteImoveis : Boolean;
                                                    sBilhete : String) : boolean;
var
   nValCmBem, nCmBem,
   nValCmDep, nCmDep,
   nValDepLanc, nDepLanc         : Currency;
   nIdAcrescimo, nMoeCodigo,
   nFatorCM, nFatorDep,
   nSeqHist, nTaxaDep, nValMin   : Extended;
   iFatorDec,
   iFlgPai, iFlgDeprec           : Integer;
   bCalcCM, bCalcDEP, bCalcCMDEP : Boolean;
   sFatorDec                     : String;  

begin
   try
      //----------------------------------------------------------------------------------
      // Interface com a Aplicação Cliente (Barra de Progresso)
      //----------------------------------------------------------------------------------
      try
         sPrgBarMsg := CMTranslate('Iniciando...');
         iPrgBarMax  := FcdsAcrescimoValor.RecordCount;
         iPrgBarPos  := 0;
         DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
      except

      end;
      //----------------------------------------------------------------------------------

      // Peterson Victor SOL 270853
      if iModulo = 54 then
      begin

        // Peterson Victor SOL 260961/18046 PPM 1236800 Inicio
        FcdsAcrescimoValor.Filtered := False;
        FcdsAcrescimoValor.Filter := ' TXDEP_ANO  > 0 ';
        FcdsAcrescimoValor.Filtered := True;
        FcdsAcrescimoValor.First;
        // Peterson Victor SOL 260961/18046 PPM 1236800 Fim
      end;
        
      if not FcdsAcrescimoValor.IsEmpty then
      begin

        bFlgPrimBem := True;

        while not FcdsAcrescimoValor.EOF do
        begin
           nIdAcrescimo := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat;
           //-------------------------------------------------------------------------------
           // Processa os calculos por moeda
           //-------------------------------------------------------------------------------
           bUpdDatGrupo := False;
           while (not FcdsAcrescimoValor.EOF) and (FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat = nIdAcrescimo) do
           begin
              bCalcCM   := False;
              nCmBem    := 0;
              nCmDep    := 0;
              nValCmBem := FcdsAcrescimoValor.FieldByName('CMBEM').AsFloat;
              //----------------------------------------------------------------------------
              // Se a Moeda processada for a oficial e o parâmetro de cálculo da correção
              // monetária estiver ativado, processar a correção monetária do custo do
              // Acréscimo de Valor
              //----------------------------------------------------------------------------
              if (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and (ParamCAF.FLGCALCCM = 1) then
              begin
                 //-------------------------------------------------------------------------
                 // Calcula o fator de tempo da correção monetária para o BEM
                 //-------------------------------------------------------------------------
                 nFatorCM := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescimoValor.FieldByName('DATAULTCM').AsDateTime);
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
                    nCmBem := (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + FcdsAcrescimoValor.FieldByName('CMBEM').AsFloat) * (nFatorCM - 1);
                    if abs(nCmBem) >= 0.01 then
                       nCmBem := strtofloat(FormatFloat('#0.00',((nCmBem * 100) / 100)));
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nCmBem) >= 0.01 then
                    begin
                       nValCmBem := FcdsAcrescimoValor.FieldByName('CMBEM').AsFloat + nCmBem;
                       //-------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat,           // IDBEM
                                                                 FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat,        // IDPESSOA
                                                                 StrToFloat(IntToStr(iModulo)),                             // IDMODULO
                                                                 34,                                                        // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                                  // DATAMOVIMENTACAO
                                                                 FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat,  // IDREAVALACRESC
                                                                 FcdsAcrescimoValor.FieldByName('DATAULTCM').AsDateTime, // DATAULTDEP
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
                                                                 0,                                     // VALVENDAOFI
                                                                 '');                                                       // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger,
                                                               0,
                                                               nCmBem) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor na tabela AcrescValorxMoeda
                       //-------------------------------------------------------------------
                       _dMTFechamento.sqlAtuAcresxMoeda.Prepare;
                       _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger;
                       _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                       _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('CMBEM').AsFloat         := nValCmBem;
                       _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('DATAULTCM').AsDate      := dDataMov;
                       if not ExecSQL(_dMTFechamento.sqlAtuAcresxMoeda.SQLChanged, True) then
                          Raise Exception.Create(MessageInfo);
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
                                                                         dDataMov,nCmBem,nCmDep,'FA',
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
              nMoecodigo := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsFloat;
              //----------------------------------------------------------------------------
              // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
              // por Taxa de Depreciação na moeda no acréscimo
              //----------------------------------------------------------------------------
              iFlgPai := 1;
              while (not FcdsAcrescimoValor.EOF) and (FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat = nIdAcrescimo) and
                                                     (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsFloat = nMoeCodigo) do
              begin
                 //-------------------------------------------------------------------------
                 // Interface com a Aplicação Cliente (Barra de Progresso)
                 //-------------------------------------------------------------------------
                 try
                    iPrgBarPos  := iPrgBarPos + 1;
                    sPrgBarMsg := CMTranslate('Processando Fase 3 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
                    DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                 except

                 end;
                 //-------------------------------------------------------------------------
                 bCalcCmDep  := False;
                 nValCmDep   := FcdsAcrescimoValor.FieldByName('CMDEP').AsFloat;
                 nCmDep      := 0;
                 bCalcDep    := False;
                 nValDepLanc := FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat;
                 nDepLanc    := 0;
                 //-------------------------------------------------------------------------
                 // Se a Moeda processada for a oficial e o parâmetro de cálculo da
                 // correção monetária estiver ativado, processar a correção monetária da
                 // Depreciação Acumulada
                 //-------------------------------------------------------------------------
                 if (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) and
                    (ParamCAF.FLGCALCCM = 1) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula o fator de tempo da correção monetária
                    //----------------------------------------------------------------------
                    nFatorCM  := CalculaFatorCorrecaoMonetaria(dDataMov, FcdsAcrescimoValor.FieldByName('DATAULTCMDEP').AsDateTime);
                    //----------------------------------------------------------------------
                    if nFatorCM > 0 then
                    begin
                       //-------------------------------------------------------------------
                       // Calcula a Correção Monetária da Depreciação Acumulada
                       //-------------------------------------------------------------------
                       nCmDep := (FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat + FcdsAcrescimoValor.FieldByName('CMDEP').AsFloat) * (nFatorCM - 1);
                       if abs(nCmDep) >= 0.01 then
                          nCmDep := strtofloat(FormatFloat('#0.00',((nCmDep * 100) / 100)));
                       //-------------------------------------------------------------------
                       // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                       // caso contrário, deixar para acumular na próxima depreciação.
                       //-------------------------------------------------------------------
                       if abs(nCmDep) >= 0.01 then
                       begin
                          nValCmDep := FcdsAcrescimoValor.FieldByName('CMDEP').AsFloat + nCmDep;
                          //----------------------------------------------------------------
                          // Registra na tabela HISTORICOMOVIMENTACAO
                          //----------------------------------------------------------------
                          nSeqHist := HistMovBem.RegistraHistMovBem(FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat,           // IDBEM
                                                                    FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat,        // IDPESSOA
                                                                    FcdsAcrescimoValor.FieldByName('IDMODULO').AsFloat,        // IDMODULO
                                                                    36,                                                        // IDTIPOMOVIMENTACAO
                                                                    dDataMov,                                                  // DATAMOVIMENTACAO
                                                                    FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat,     // IDREAVALACRESC
                                                                    FcdsAcrescimoValor.FieldByName('DATAULTCMDEP').AsDateTime, // DATAULTDEP
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
                                                                    0,                                     // VALVENDAOFI
                                                                    '');                                                       // OBSBAIXA
                          if nSeqHist = -1 then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor no histórico
                          //----------------------------------------------------------------
                          if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                                  FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger,
                                                                  FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                                  nCmDep) then
                             Raise Exception.Create(HistMovBem.MessageInfo);
                          //----------------------------------------------------------------
                          // Registra o valor na tabela AcrescValorxDep
                          //----------------------------------------------------------------
                          _dMTFechamento.sqlAtuAcresxDep1.Prepare;
                          _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger;
                          _dMTFechamento.sqlAtuAcresxDep1.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                          _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger;
                          _dMTFechamento.sqlAtuAcresxDep1.ParamByName('CMDEP').AsFloat         := nValCmDep;
                          _dMTFechamento.sqlAtuAcresxDep1.ParamByName('DATAULTCM').AsDate      := dDataMov;
                          if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep1.SQLChanged, True) then
                             Raise Exception.Create(MessageInfo);
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
                                                                            dDataMov,nCmBem,nCmDep,'FA',
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
                                                      FcdsAcrescimoValor.FieldByName('DATAULTDEP').AsDateTime,
                                                      FcdsAcrescimoValor.FieldByName('DATAACRESCIMO').AsDateTime,
                                                      bSomenteImoveis);
                 //-------------------------------------------------------------------------
                 // Captura o flag de controle de fim de periodo de depreciação
                 //-------------------------------------------------------------------------
                 if FcdsAcrescimoValor.FieldByName('FLGDEPREC').IsNull then
                    iFlgDeprec := 0
                 else
                    iFlgDeprec := FcdsAcrescimoValor.FieldByName('FLGDEPREC').AsInteger;
                 //-------------------------------------------------------------------------
                 // Se o bem ainda estiver no periodo de depreciação e se o fator temporal
                 // for diferente de zero e a taxa de depreciação for diferente de zero,
                 // Calcular o valor a depreciar no periodo.
                 //-------------------------------------------------------------------------
                 if (iFlgDeprec = 0) and
                    (nFatorDep > 0) and
                    (FcdsAcrescimoValor.FieldByName('TAXADEP').AsFloat > 0) then
                 begin
                    //----------------------------------------------------------------------
                    // Calcula a quota proporcional de depreciação do bem
                    //----------------------------------------------------------------------
                    nTaxaDep := ((FcdsAcrescimoValor.FieldByName('TAXADEP').AsFloat / 100) * nFatorDep);
                    //Cássio Rovaroto - SIG nº 133192 - Início
                    if DateToStr(dDataMov) <= '31/12/2022' then
                      nDepLanc := (nTaxaDep * (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + nValCmBem))
                    else
                      nDepLanc := (nTaxaDep * ((FcdsAcrescimoValor.FieldByName('VALORG').AsFloat -
                                                FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat)+
                                                nValCmBem));
                    //Cássio Rovaroto - SIG nº 133192 - Fim
                    //----------------------------------------------------------------------
                    // Converte para a Precisão da Moeda
                    //----------------------------------------------------------------------
                    if FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MOEDAPADRAO then
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
                       if FcdsCAFMoedas.Locate('MOECODIGO',FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger,[]) then
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
                    if ((nValDepLanc + nDepLanc + nValCmDep) >=
                        (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + nValCmBem)) then
                    begin
                       nDepLanc := (FcdsAcrescimoValor.FieldByName('VALORG').AsFloat + nValCmBem) - (nValDepLanc + nValCmDep);
                       iFlgDeprec := 1;
                    end;
                    //----------------------------------------------------------------------
                    // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
                    // caso contrário, deixar para acumular na próxima depreciação.
                    //----------------------------------------------------------------------
                    if abs(nDepLanc) >= nValMin then
                    begin
                       nValDepLanc := FcdsAcrescimoValor.FieldByName('DEPLANC').AsFloat + nDepLanc;
                       //----------------------------------------------------------------------
                       // Registra na tabela HISTORICOMOVIMENTACAO
                       //-------------------------------------------------------------------
                       nSeqHist := HistMovBem.RegistraHistMovBem(FcdsAcrescimoValor.FieldByName('IDBEM').AsFloat,                // IDBEM
                                                                 FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat,             // IDPESSOA
                                                                 FcdsAcrescimoValor.FieldByName('IDMODULO').AsFloat,             // IDMODULO
                                                                 35,                                                             // IDTIPOMOVIMENTACAO
                                                                 dDataMov,                                                       // DATAMOVIMENTACAO
                                                                 FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat,          // IDREAVALACRESC
                                                                 FcdsAcrescimoValor.FieldByName('DATAULTDEP').AsDateTime,        // DATAULTDEP
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
                                                                 0,                                     // VALVENDAOFI
                                                                 '');                                                            // OBSBAIXA
                       if nSeqHist = -1 then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra o valor no histórico
                       //-------------------------------------------------------------------
                       if not HistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                               FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                               nDepLanc) then
                          Raise Exception.Create(HistMovBem.MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra os valores na tabela AcrescValorxDep
                       //-------------------------------------------------------------------
                       _dMTFechamento.sqlAtuAcresxDep2.Prepare;
                       _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger;
                       _dMTFechamento.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                       _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger;
                       _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := nValDepLanc;
                       _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDate     := dDataMov;
                       _dMTFechamento.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := iFlgDeprec;
                       if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep2.SQLChanged, True) then
                          Raise Exception.Create(MessageInfo);
                       //-------------------------------------------------------------------
                       // Registra a Depreciação na Contabilidade
                       //-------------------------------------------------------------------
                       if bIntegraContab and
                         (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger = ParamCAF.MoedaOficial) then
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
                                                                   dDataMov,nDepLanc,'FA',
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
                    // Atualiza a tabela SALDOCONTABBEM
                    //----------------------------------------------------------------------
                    if not Bem.AtualizaSaldoContabBem(FcdsAcrescimoValor.FieldByName('IDPESSOA').AsInteger,
                                                      FcdsAcrescimoValor.FieldByName('IDBEM').AsInteger,
                                                      dDataMov,
                                                      FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger,
                                                      FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger,
                                                      0, nCmBem, nDepLanc, nCmDep,
                                                      0, 0, 0, 0,
                                                      0, 0, 0, 0,
                                                      FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger,
                                                      FcdsAcrescimoValor.FieldByName('IDLOCALIZACAO').AsInteger,
                                                      FcdsAcrescimoValor.FieldByName('IDRESPONSAVEL').AsInteger,
                                                      FcdsAcrescimoValor.FieldByName('IDCONJUNTO').AsInteger,
                                                      FcdsAcrescimoValor.FieldByName('UNIDNEGOC').AsInteger,
                                                      0, iFlgPai) then
                       Raise Exception.Create(Bem.MessageInfo);
                    // Felipe A. Santos SOL 247348/17114 PPM 748753 - Início comentário
                    {//----------------------------------------------------------------------
                    // Registra na tabela GRUPO a atualização da data do último fechamento
                    //----------------------------------------------------------------------
                    if bUpdDatGrupo and ((FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
                    begin
                       bFlgPrimBem := False;
                       if FcdsUpdGrupo.Locate('IDGRUPO', FcdsAcrescimoValor.FieldByname('IDGRUPO').AsInteger,[]) then
                       begin
                          FcdsUpdGrupo.Edit;
                          FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                          FcdsUpdGrupo.Post;
                       end;
                    end;}
                    // Felipe A. Santos SOL 247348/17114 PPM 748753 - fim comentário
                 end;
                 // Felipe A. Santos SOL 247348/17114 PPM 748753 - Início
                 //----------------------------------------------------------------------
                 // Registra na tabela GRUPO a atualização da data do último fechamento
                 //----------------------------------------------------------------------
                 if ((FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
                 begin
                    bFlgPrimBem := False;
                    if FcdsUpdGrupo.Locate('IDGRUPO', FcdsAcrescimoValor.FieldByname('IDGRUPO').AsInteger,[]) then
                    begin
                       FcdsUpdGrupo.Edit;
                       FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                       FcdsUpdGrupo.Post;
                    end;
                 end;
                 // Felipe A. Santos SOL 247348/17114 PPM 748753 - fim

                 //-------------------------------------------------------------------------
                 iFlgPai := 0;
                 //-------------------------------------------------------------------------
                 // Avança para a próxima taxa de depreciação x moeda
                 //-------------------------------------------------------------------------
                 FcdsAcrescimoValor.Next;
              end;
           end;
        end;
      end
      else
      if iModulo = 54 then       // Peterson Victor SOL 270853
      begin
        // Peterson Victor SOL 260961/18046 PPM 1236800 Inicio
        FcdsAcrescimoValor.Filtered := False;
        FcdsAcrescimoValor.Filter := ' ';
        FcdsAcrescimoValor.First;

        while not FcdsAcrescimoValor.EOF do
        begin
           if ((FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem) then
           begin
              bFlgPrimBem := False;
              if FcdsUpdGrupo.Locate('IDGRUPO', FcdsAcrescimoValor.FieldByname('IDGRUPO').AsInteger,[]) then
              begin
                 FcdsUpdGrupo.Edit;
                 FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataMov;
                 FcdsUpdGrupo.Post;
              end;
           end;

           FcdsAcrescimoValor.Next;
        end;
        // Peterson Victor SOL 260961/18046 PPM 1236800 Fim
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
function TCtrlImobFechamento.EstornaFechamento(iModulo, iEmpresaProp, iUsuario : Integer;
                                           dDataMov, dDataEst : tDateTime;
                                           bSomenteImoveis : Boolean;
                                           sBilhete : String) : Boolean;
Var
   sSql                      : String;
   aPlanilha                 : Array of Integer;
   iaPlanilha, iPlan         : Integer;
   dDataUltDep,
   dDataAntDep               : TDateTime;
   nIdBem, nIdReavaliacao,
   nIdAcrescimo, nMoeCodigo  : Extended;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.EstornaFechamento(iModulo, iEmpresaProp, iUsuario, dDataMov,
                                                       dDataEst, bSomenteImoveis);
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
            sPrgBarMsg := CMTranslate('Preparando...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresaProp) then
         begin
            MessageInfo := CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo;
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
            MessageInfo := CMTranslate('Data deve ser a do Último Fechamento Realizado ! ') + DatetoStr(dDataUltDep);
            Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação após o fechamento
         //-------------------------------------------------------------------------------
         if HistMovBem.ExisteMovimentacao(iGrupoDepIni, iGrupoDepFim, iEmpresaProp, dDataMov) then
         begin
            MessageInfo := CMTranslate('Existem Bens com movimentações após o Fechamento.') + #13 +
                           CMTranslate('Consulte Histórico de Movimentações!') ;
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
            sPrgBarMsg := CMTranslate('Inicializando...');
         except

         end;

         //Cássio Rovaroto - SIG nº 113136 - Início
         if not ProvisaoImovel.EstornaProvisaoCustoImovel(iUsuario, iModulo, iEmpresaProp, 202, dDataMov, bIntegraContab, ParamCAF.USAPLANOPATRO) then
            raise Exception.Create(MessageInfo);
         //Cássio Rovaroto - SIG nº 113136 - Fim
         
         //-------------------------------------------------------------------------------
         // Preenche o Vetor com os id's a serem processados
         //-------------------------------------------------------------------------------
         sSql := ' SELECT /*+ RULE */ DISTINCT B.IDGRUPO, HM.IDBEM, HM.PLNCODIGO ' +
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
            sPrgBarMsg := CMTranslate('Inicializando...');
         except

         end;
         //-------------------------------------------------------------------------------
         iaPlanilha :=  0;
         while not _cds.EOF do
         begin
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
            sPrgBarMsg := CMTranslate('Estorna Planilha Contábil...');
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
            _dMTFechamento.sqlRemHistPlnCodigo.Prepare;
            _dMTFechamento.sqlRemHistPlnCodigo.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
            _dMTFechamento.sqlRemHistPlnCodigo.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
            _dMTFechamento.sqlRemHistPlnCodigo.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
            _dMTFechamento.sqlRemHistPlnCodigo.ParamByName('DATAMOV').AsDate        := dDataMov;
            if not ExecSQL(_dMTFechamento.sqlRemHistPlnCodigo.SQLChanged, True) then
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
                     MessageInfo := CMTranslate('Estorno da Planilha Contabil não Executado !');
                     Raise Exception.Create(MessageInfo);
                  end;
               end else
               begin
                  if not CafxContab.LancaContab.ExcluiLancaContab(iUsuario, aPlanilha[iPlan],
                                                                  iModulo, 0, ParamCAF.USAPLANOPATRO, True) then
                  begin
                     MessageInfo := CMTranslate('Remoção da Planilha Contabil não Executada !');
                     Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            sPrgBarMsg := CMTranslate('Preparando Retorno de Valores...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Inicializando
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlEstFechamentoBem.Prepare;
         _dMTFechamento.sqlEstFechamentoBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlEstFechamentoBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlEstFechamentoBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlEstFechamentoBem.ParamByName('DATAMOV').AsDate        := dDataMov;
         FcdsBem.Data := _dMTFechamento.sqlEstFechamentoBem.Data;
         _dMTFechamento.sqlEstFechamentoReavaliacao.Prepare;
         _dMTFechamento.sqlEstFechamentoReavaliacao.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlEstFechamentoReavaliacao.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlEstFechamentoReavaliacao.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlEstFechamentoReavaliacao.ParamByName('DATAMOV').AsDate        := dDataMov;
         FcdsReavaliacao.Data := _dMTFechamento.sqlEstFechamentoReavaliacao.Data;
         _dMTFechamento.sqlEstFechamentoAcrescimo.Prepare;
         _dMTFechamento.sqlEstFechamentoAcrescimo.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlEstFechamentoAcrescimo.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlEstFechamentoAcrescimo.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlEstFechamentoAcrescimo.ParamByName('DATAMOV').AsDate        := dDataMov;
         FcdsAcrescimoValor.Data := _dMTFechamento.sqlEstFechamentoAcrescimo.Data;
         //-------------------------------------------------------------------------------
         FcdsUpdGrupo.Data := GrupoContab.ListaPlanoGrupo(iEmpresaProp);
         //-------------------------------------------------------------------------------
         // Estorna os Lançamentos do Fechamento
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := FcdsBem.RecordCount;
            iPrgBarPos  := 0;
            sPrgBarMsg := CMTranslate('Retornando Valores...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Processando os Bens
         //-------------------------------------------------------------------------------
         bFlgPrimBem := True;
         while not FcdsBem.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Retornando Valores Fase 1 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
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
            nIdBem := FcdsBem.FieldByName('IDBEM').AsFloat;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsBem.EOF) and (FcdsBem.FieldByName('IDBEM').AsFloat = nIdBem) do
            begin
               if (FcdsBem.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL) and (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Correção Monetária
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlHistFecCMBem.Prepare;
                  _dMTFechamento.sqlHistFecCMBem.ParamByName('IDBEM').AsFloat        := FcdsBem.FieldByName('IDBEM').AsFloat;
                  _dMTFechamento.sqlHistFecCMBem.ParamByName('IDPESSOA').AsFloat     := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlHistFecCMBem.ParamByName('DATAMOV').AsDate       := dDataMov;
                  _dMTFechamento.sqlHistFecCMBem.ParamByName('MOECODIGO').AsInteger  := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                  FcdsHistFecBem.Data := _dMTFechamento.sqlHistFecCMBem.Data;
                  //----------------------------------------------------------------------
                  if not FcdsHistFecBem.IsEmpty then
                  begin
                     _dMTFechamento.sqlAtuBemxMoeda.Prepare;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDBEM').AsFloat        := FcdsBem.FieldByName('IDBEM').AsFloat;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('IDPESSOA').AsFloat     := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('MOECODIGO').AsInteger  := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('CMBEM').AsFloat        := FcdsBem.FieldByName('CMBEM').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuBemxMoeda.ParamByName('DATAULTCM').AsDate     := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTFechamento.sqlAtuBemxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               nMoeCodigo := FcdsBem.FieldByName('MOECODIGO').AsFloat;
               //-------------------------------------------------------------------------
               // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
               // por Taxa de Depreciação na Moeda no Bem
               //-------------------------------------------------------------------------
               while (not FcdsBem.EOF) and (FcdsBem.FieldByName('IDBEM').AsFloat = nIdBem) and
                                           (FcdsBem.FieldByName('MOECODIGO').AsFloat = nMoeCodigo) do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciacao e sua Correção Monetária
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlHistFecDEP.Prepare;
                  _dMTFechamento.sqlHistFecDEP.ParamByName('IDBEM').AsFloat       := FcdsBem.FieldByName('IDBEM').AsFloat;
                  _dMTFechamento.sqlHistFecDEP.ParamByName('IDPESSOA').AsFloat    := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlHistFecDEP.ParamByName('DATAMOV').AsDate      := dDataMov;
                  _dMTFechamento.sqlHistFecDEP.ParamByName('MOECODIGO').AsInteger := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                  _dMTFechamento.sqlHistFecDEP.ParamByName('IDTAXADEP').AsInteger := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                  FcdsHistFecBem.Data := _dMTFechamento.sqlHistFecDEP.Data;
                  //----------------------------------------------------------------------
                  while not FcdsHistFecBem.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Correção Monetária da Depreciação Calculada
                     //-------------------------------------------------------------------
                     if FcdsHistFecBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21 then
                     begin
                        _dMTFechamento.sqlAtuBemxDep1.Prepare;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDBEM').AsFloat        := FcdsBem.FieldByName('IDBEM').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDPESSOA').AsFloat     := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('MOECODIGO').AsInteger  := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('IDTAXADEP').AsInteger  := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('CMDEP').AsFloat        := FcdsBem.FieldByName('CMDEP').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep1.ParamByName('DATAULTCM').AsDate     := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                        if not ExecSQL(_dMTFechamento.sqlAtuBemxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if FcdsHistFecBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14 then
                     begin
                        _dMTFechamento.sqlAtuBemxDep2.Prepare;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDBEM').AsFloat         := FcdsBem.FieldByName('IDBEM').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDPESSOA').AsFloat      := FcdsBem.FieldByName('IDPESSOA').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsBem.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsBem.FieldByName('IDBEMXDEP').AsInteger;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('DEPLANC').AsFloat       := FcdsBem.FieldByName('DEPLANC').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('DATAULTDEP').AsDate     := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                        _dMTFechamento.sqlAtuBemxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                        if not ExecSQL(_dMTFechamento.sqlAtuBemxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     FcdsHistFecBem.Next;
                  end;
                  FcdsBem.Next;
                  //----------------------------------------------------------------------
                  // Interface com a Aplicação Cliente (Barra de Progresso)
                  //----------------------------------------------------------------------
                  try
                     iPrgBarPos  := iPrgBarPos + 1;
                     sPrgBarMsg := CMTranslate('Retornando Valores Fase 1 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
                     DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                  except

                  end;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados na tabela PLANOGRUPO
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
            Raise Exception.Create(_dbUpdGrupo.MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax := FcdsReavaliacao.RecordCount;
            iPrgBarPos := 0;
            sPrgBarMsg := CMTranslate('Retornando Valores...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Processando as Reavaliacoes
         //-------------------------------------------------------------------------------
         bFlgPrimBem := True;
         while not FcdsReavaliacao.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Retornando Valores Fase 2 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Registra na tabela GRUPO a atualização da data do último fechamento
            //----------------------------------------------------------------------------
            if (FcdsReavaliacao.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem then
            begin
               bFlgPrimBem := False;
               if FcdsUpdGrupo.Locate('IDGRUPO', FcdsReavaliacao.FieldByname('IDGRUPO').AsInteger,[]) then
               begin
                  FcdsUpdGrupo.Edit;
                  FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataAntDep;
                  FcdsUpdGrupo.Post;
               end;
            end;
            //----------------------------------------------------------------------------
            nIdReavaliacao := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsReavaliacao.EOF) and (FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat = nIdReavaliacao) do
            begin
               if (FcdsReavaliacao.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL) and (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Correção Monetária
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlHistFecCMBemReav.Prepare;
                  _dMTFechamento.sqlHistFecCMBemReav.ParamByName('IDREAVALIACAO').AsFloat := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat;
                  _dMTFechamento.sqlHistFecCMBemReav.ParamByName('IDPESSOA').AsFloat      := FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlHistFecCMBemReav.ParamByName('DATAMOV').AsDate        := dDataMov;
                  _dMTFechamento.sqlHistFecCMBemReav.ParamByName('MOECODIGO').AsInteger   := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                  FcdsHistFecBem.Data := _dMTFechamento.sqlHistFecCMBemReav.Data;
                  //----------------------------------------------------------------------
                  if not FcdsHistFecBem.IsEmpty then
                  begin
                     _dMTFechamento.sqlAtuReavxMoeda.Prepare;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('IDREAVALIACAO').AsFloat := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('CMBEM').AsFloat         := FcdsReavaliacao.FieldByName('CMBEM').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuReavxMoeda.ParamByName('DATAULTCM').AsDate      := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTFechamento.sqlAtuReavxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               nMoeCodigo := FcdsReavaliacao.FieldByName('MOECODIGO').AsFloat;
               //-------------------------------------------------------------------------
               // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
               // por Taxa de Depreciação na Moeda na Reavaliacao
               //-------------------------------------------------------------------------
               while (not FcdsReavaliacao.EOF) and (FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat = nIdReavaliacao) and
                                                   (FcdsReavaliacao.FieldByName('MOECODIGO').AsFloat = nMoeCodigo) do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciacao e sua Correção Monetária
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlHistFecDEPReav.Prepare;
                  _dMTFechamento.sqlHistFecDEPReav.ParamByName('IDREAVALIACAO').AsFloat := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat;
                  _dMTFechamento.sqlHistFecDEPReav.ParamByName('IDPESSOA').AsFloat      := FcdsReavaliacao.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlHistFecDEPReav.ParamByName('DATAMOV').AsDate        := dDataMov;
                  _dMTFechamento.sqlHistFecDEPReav.ParamByName('MOECODIGO').AsInteger   := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                  _dMTFechamento.sqlHistFecDEPReav.ParamByName('IDTAXADEP').AsInteger   := FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger;
                  FcdsHistFecBem.Data := _dMTFechamento.sqlHistFecDEPReav.Data;
                  //----------------------------------------------------------------------
                  while not FcdsHistFecBem.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Correção Monetária da Depreciação Calculada
                     //-------------------------------------------------------------------
                     if FcdsHistFecBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19 then
                     begin
                        _dMTFechamento.sqlAtuReavxDep1.Prepare;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('MOECODIGO').AsInteger     := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('IDTAXADEP').AsInteger     := FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('CMDEP').AsFloat           := FcdsReavaliacao.FieldByName('CMDEP').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuReavxDep1.ParamByName('DATAULTCM').AsDate        := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                        if not ExecSQL(_dMTFechamento.sqlAtuReavxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if FcdsHistFecBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18 then
                     begin
                        _dMTFechamento.sqlAtuReavxDep2.Prepare;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDREAVALIACAO').AsInteger := FcdsReavaliacao.FieldByName('IDREAVALIACAO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('MOECODIGO').AsInteger     := FcdsReavaliacao.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('IDTAXADEP').AsInteger     := FcdsReavaliacao.FieldByName('IDREAVALXDEP').AsInteger;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('DEPLANC').AsFloat         := FcdsReavaliacao.FieldByName('DEPLANC').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('DATAULTDEP').AsDate       := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                        _dMTFechamento.sqlAtuReavxDep2.ParamByName('FLGDEPREC').AsInteger     := 0;
                        if not ExecSQL(_dMTFechamento.sqlAtuReavxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     FcdsHistFecBem.Next;
                  end;
                  FcdsReavaliacao.Next;
                  //----------------------------------------------------------------------
                  // Interface com a Aplicação Cliente (Barra de Progresso)
                  //----------------------------------------------------------------------
                  try
                     iPrgBarPos  := iPrgBarPos + 1;
                     sPrgBarMsg := CMTranslate('Retornando Valores Fase 2 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
                     DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                  except

                  end;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados na tabela PLANOGRUPO
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
            Raise Exception.Create(_dbUpdGrupo.MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := FcdsAcrescimoValor.RecordCount;
            iPrgBarPos  := 0;
            sPrgBarMsg := CMTranslate('Retornando Valores...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Processando os Acrescimos de Valor
         //-------------------------------------------------------------------------------
         bFlgPrimBem := True;
         while not FcdsAcrescimoValor.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Retornando Valores Fase 3 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Registra na tabela GRUPO a atualização da data do último fechamento
            //----------------------------------------------------------------------------
            if (FcdsAcrescimoValor.FieldByName('IDGRUPO').AsInteger <> FcdsUpdGrupo.FieldByName('IDGRUPO').AsInteger) or bFlgPrimBem then
            begin
               bFlgPrimBem := False;
               if FcdsUpdGrupo.Locate('IDGRUPO', FcdsAcrescimoValor.FieldByname('IDGRUPO').AsInteger,[]) then
               begin
                  FcdsUpdGrupo.Edit;
                  FcdsUpdGrupo.FieldByName('DATAULTFEC').AsDateTime := dDataAntDep;
                  FcdsUpdGrupo.Post;
               end;
            end;
            //----------------------------------------------------------------------------
            nIdAcrescimo := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat;
            //----------------------------------------------------------------------------
            // Processa os calculos por moeda
            //----------------------------------------------------------------------------
            while (not FcdsAcrescimoValor.EOF) and (FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat = nIdAcrescimo) do
            begin
               if (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsFloat = ParamCAF.MOEDAOFICIAL) and (ParamCAF.FLGCALCCM = 1) then
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Correção Monetária
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlHistFecCMBemAcres.Prepare;
                  _dMTFechamento.sqlHistFecCMBemAcres.ParamByName('IDACRESCIMO').AsFloat := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat;
                  _dMTFechamento.sqlHistFecCMBemAcres.ParamByName('IDPESSOA').AsFloat    := FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlHistFecCMBemAcres.ParamByName('DATAMOV').AsDate      := dDataMov;
                  _dMTFechamento.sqlHistFecCMBemAcres.ParamByName('MOECODIGO').AsInteger := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                  FcdsHistFecBem.Data := _dMTFechamento.sqlHistFecCMBemAcres.Data;
                  //----------------------------------------------------------------------
                  if not FcdsHistFecBem.IsEmpty then
                  begin
                     _dMTFechamento.sqlAtuAcresxMoeda.Prepare;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('CMBEM').AsFloat         := FcdsAcrescimoValor.FieldByName('CMBEM').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                     _dMTFechamento.sqlAtuAcresxMoeda.ParamByName('DATAULTCM').AsDate      := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                     if not ExecSQL(_dMTFechamento.sqlAtuAcresxMoeda.SQLChanged, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               nMoeCodigo := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsFloat;
               //-------------------------------------------------------------------------
               // Processa os calculos da CORREÇÃO MONETÁRIA E DEPRECIAÇÃO
               // por Taxa de Depreciação na Moeda na Reavaliacao
               //-------------------------------------------------------------------------
               while (not FcdsAcrescimoValor.EOF) and (FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat = nIdAcrescimo) and
                                                      (FcdsAcrescimoValor.FieldByName('MOECODIGO').AsFloat = nMoeCodigo) do
               begin
                  //----------------------------------------------------------------------
                  // Retorna a Depreciacao e sua Correção Monetária
                  //----------------------------------------------------------------------
                  _dMTFechamento.sqlHistFecDEPAcres.Prepare;
                  _dMTFechamento.sqlHistFecDEPAcres.ParamByName('IDACRESCIMO').AsFloat := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat;
                  _dMTFechamento.sqlHistFecDEPAcres.ParamByName('IDPESSOA').AsFloat    := FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat;
                  _dMTFechamento.sqlHistFecDEPAcres.ParamByName('DATAMOV').AsDate      := dDataMov;
                  _dMTFechamento.sqlHistFecDEPAcres.ParamByName('MOECODIGO').AsInteger := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                  _dMTFechamento.sqlHistFecDEPAcres.ParamByName('IDTAXADEP').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger;
                  FcdsHistFecBem.Data := _dMTFechamento.sqlHistFecDEPAcres.Data;
                  //----------------------------------------------------------------------
                  while not FcdsHistFecBem.EOF do
                  begin
                     //-------------------------------------------------------------------
                     // Retorna a Correção Monetária da Depreciação Calculada
                     //-------------------------------------------------------------------
                     if FcdsHistFecBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36 then
                     begin
                        _dMTFechamento.sqlAtuAcresxDep1.Prepare;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDACRESCIMO').AsFloat   := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsFloat;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('MOECODIGO').AsFloat     := FcdsAcrescimoValor.FieldByName('IDPESSOA').AsFloat;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('CMDEP').AsFloat         := FcdsAcrescimoValor.FieldByName('CMDEP').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuAcresxDep1.ParamByName('DATAULTCM').AsDate      := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                        if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep1.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     // Retorna a Depreciação Calculada
                     //-------------------------------------------------------------------
                     if FcdsHistFecBem.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35 then
                     begin
                        _dMTFechamento.sqlAtuAcresxDep2.Prepare;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDACRESCIMO').AsInteger := FcdsAcrescimoValor.FieldByName('IDACRESCIMO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('MOECODIGO').AsInteger   := FcdsAcrescimoValor.FieldByName('MOECODIGO').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('IDTAXADEP').AsInteger   := FcdsAcrescimoValor.FieldByName('IDACRESCIMOXDEP').AsInteger;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DEPLANC').AsFloat       := FcdsAcrescimoValor.FieldByName('DEPLANC').asFloat - FcdsHistFecBem.FieldByName('VALOR').AsFloat;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('DATAULTDEP').AsDate     := FcdsHistFecBem.FieldByName('DATAULTDEP').AsDateTime;
                        _dMTFechamento.sqlAtuAcresxDep2.ParamByName('FLGDEPREC').AsInteger   := 0;
                        if not ExecSQL(_dMTFechamento.sqlAtuAcresxDep2.SQLChanged, True) then
                           Raise Exception.Create(MessageInfo);
                     end;
                     //-------------------------------------------------------------------
                     FcdsHistFecBem.Next;
                  end;
                  FcdsAcrescimoValor.Next;
                  //----------------------------------------------------------------------
                  // Interface com a Aplicação Cliente (Barra de Progresso)
                  //----------------------------------------------------------------------
                  try
                     iPrgBarPos  := iPrgBarPos + 1;
                     sPrgBarMsg := CMTranslate('Retornando Valores Fase 3 (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
                     DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
                  except

                  end;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Gravação dos dados na tabela PLANOGRUPO
         //-------------------------------------------------------------------------------
         if not ApplyCds(FcdsUpdGrupo,_dbUpdGrupo,[],[]) then
            Raise Exception.Create(_dbUpdGrupo.MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 4;
            iPrgBarPos  := 0;
            sPrgBarMsg := CMTranslate('Removendo Lançamentos (Passo 1)...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Remove os Saldos Contábeis
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlFecRemSldCtbBemxDep.Prepare;
         _dMTFechamento.sqlFecRemSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlFecRemSldCtbBemxDep.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlFecRemSldCtbBemxDep.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlFecRemSldCtbBemxDep.ParamByName('DATAMOV').AsDate        := dDataMov;
         if not ExecSQL(_dMTFechamento.sqlFecRemSldCtbBemxDep.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 4;
            iPrgBarPos  := 1;
            sPrgBarMsg := CMTranslate('Removendo Lançamentos (Passo 2)...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlFecRemSaldoContabBem.Prepare;
         _dMTFechamento.sqlFecRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlFecRemSaldoContabBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlFecRemSaldoContabBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlFecRemSaldoContabBem.ParamByName('DATAMOV').AsDate        := dDataMov;
         if not ExecSQL(_dMTFechamento.sqlFecRemSaldoContabBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Ajustar os Saldos Contábeis dos bens processados
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlEstFechamentoBens.Prepare;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('DATAMOV').AsDate        := dDataMov;
         FcdsBem.Data := _dMTFechamento.sqlEstFechamentoBens.Data;
         //-------------------------------------------------------------------------------
         // Remove o Registro do Fechamento do Historico de Movimentações
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 4;
            iPrgBarPos  := 2;
            sPrgBarMsg := CMTranslate('Removendo Lançamentos (Passo 3)...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlFecRemVlrHistMovBem.Prepare;
         _dMTFechamento.sqlFecRemVlrHistMovBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlFecRemVlrHistMovBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlFecRemVlrHistMovBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlFecRemVlrHistMovBem.ParamByName('DATAMOV').AsDate        := dDataMov;
         if not ExecSQL(_dMTFechamento.sqlFecRemVlrHistMovBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 4;
            iPrgBarPos  := 3;
            sPrgBarMsg := CMTranslate('Removendo Lançamentos (Passo 4)...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlFecRemHistMovBem.Prepare;
         _dMTFechamento.sqlFecRemHistMovBem.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlFecRemHistMovBem.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlFecRemHistMovBem.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlFecRemHistMovBem.ParamByName('DATAMOV').AsDate        := dDataMov;
         if not ExecSQL(_dMTFechamento.sqlFecRemHistMovBem.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax  := 4;
            iPrgBarPos  := 4;
            sPrgBarMsg := CMTranslate('Registrando no Banco ...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         Commit;
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Atualiza o Saldo Contabil dos Bens
         //-------------------------------------------------------------------------------
         _dMTFechamento.sqlEstFechamentoBens.Prepare;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('IDPESSOA').AsInteger    := iEmpresaProp;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('GRUPODEPINI').AsInteger := iGrupoDepIni;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('GRUPODEPFIM').AsInteger := iGrupoDepFim;
         _dMTFechamento.sqlEstFechamentoBens.ParamByName('DATAMOV').AsDate        := dDataMov;
         FcdsBem.Data := _dMTFechamento.sqlEstFechamentoBens.Data;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            iPrgBarMax := FcdsBem.RecordCount;
            iPrgBarPos := 0;
            sPrgBarMsg := CMTranslate('Ajustando Saldo Contábil...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         while not FcdsBem.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               iPrgBarPos := iPrgBarPos + 1;
               sPrgBarMsg := CMTranslate('Ajustando Saldo Contábil (') + inttostr(iPrgBarPos) + CMTranslate(' em ') + inttostr(iPrgBarMax) + ')...';
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if not AtualizaSaldoContabBem(FcdsBem.FieldByName('IDPESSOA').AsInteger,
                                          FcdsBem.FieldByName('IDBEM').AsInteger,
                                          dDataMov,
                                          FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                          FcdsBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                          FcdsBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                          True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            if (iPrgBarPos mod 100) = 0 then
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
            sPrgBarMsg := CMTranslate('Finalizando...');
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
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
function TCtrlImobFechamento.AtualizaSaldoContabBem(iEmpresaProp, iBem : Integer;
                                                dDataSld : tDateTime;
                                                iGrupo, iLocalizacao, iResponsavel : Integer;
                                                bFechamento : boolean) : Boolean;
Var
   nSValOrg, nSCmBem,
   nSReavValOrg, nSReavCmBem,
   nSUltReavValOrg, nSUltReavCmBem,
   nSDepLanc, nSCmDep,
   nSReavDepLanc, nSReavCmDep,
   nSUltReavDepLanc, nSUltReavCmDep : Extended;
   iaGrupo,
   iaLocalizacao,
   iaResponsavel : Integer;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.FecAtualizaSaldoContabBem(iEmpresaProp, iBem,
                                                               dDataSld, iGrupo, iLocalizacao,
                                                               iResponsavel, bFechamento);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         if not bFechamento then
         begin
            //-------------------------------------------------------------------------------
            // Remove os Lançamentos Iguais ou Posteriores a Data do Lançamento
            //-------------------------------------------------------------------------------
            _dMTFechamento.sqlRemSldCtbBemxDep.Prepare;
            _dMTFechamento.sqlRemSldCtbBemxDep.ParamByName('IDBEM').AsInteger     := iBem;
            _dMTFechamento.sqlRemSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTFechamento.sqlRemSldCtbBemxDep.ParamByName('DATASLD').AsDate      := dDataSld;
            if not ExecSQL(_dMTFechamento.sqlRemSldCtbBemxDep.SQLChanged, False) then
               Raise Exception.Create(MessageInfo);
            _dMTFechamento.sqlRemSaldoContabBem.Prepare;
            _dMTFechamento.sqlRemSaldoContabBem.ParamByName('IDBEM').AsInteger     := iBem;
            _dMTFechamento.sqlRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTFechamento.sqlRemSaldoContabBem.ParamByName('DATASLD').AsDate      := dDataSld;
            if not ExecSQL(_dMTFechamento.sqlRemSaldoContabBem.SQLChanged, False) then
               Raise Exception.Create(MessageInfo);
         end;      
         //----------------------------------------------------------------------------------
         // Processa o Bem
         //----------------------------------------------------------------------------------
         _dMTFechamento.sqlBemxMoedaxDep.Prepare;
         _dMTFechamento.sqlBemxMoedaxDep.ParamByName('IDBEM').AsInteger     := iBem;
         _dMTFechamento.sqlBemxMoedaxDep.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
         FcdsBemxMoedaxDep.Data := _dMTFechamento.sqlBemxMoedaxDep.Data;
         //----------------------------------------------------------------------------------
         while not FcdsBemxMoedaxDep.EOF do
         begin
            //-------------------------------------------------------------------------------
            // Levanta o último saldo contábil do bem
            //-------------------------------------------------------------------------------
            _dMTFechamento.sqlSaldoContabBem.Prepare;
            _dMTFechamento.sqlSaldoContabBem.ParamByName('IDBEM').AsInteger     := iBem;
            _dMTFechamento.sqlSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTFechamento.sqlSaldoContabBem.ParamByName('DATASLD').AsDate      := dDataSld;
            _dMTFechamento.sqlSaldoContabBem.ParamByName('MOECODIGO').AsInteger := FcdsBemxMoedaxDep.FieldbyName('MOECODIGO').AsInteger;
            _dMTFechamento.sqlSaldoContabBem.ParamByName('IDTAXADEP').AsInteger := FcdsBemxMoedaxDep.FieldbyName('IDBEMXDEP').AsInteger;
            FcdsSaldoContabBem.Data := _dMTFechamento.sqlSaldoContabBem.Data;
            //-------------------------------------------------------------------------------
            if not cdsSaldoContabBem.IsEmpty then
            begin
               nSValOrg         := FcdsSaldoContabBem.FieldByName('VALORG').AsFloat;
               nSCmBem          := FcdsSaldoContabBem.FieldByName('CMBEM').AsFloat;
               nSReavValOrg     := FcdsSaldoContabBem.FieldByName('REAVVALORG').AsFloat;
               nSReavCmBem      := FcdsSaldoContabBem.FieldByName('REAVCMBEM').AsFloat;
               nSUltReavValOrg  := FcdsSaldoContabBem.FieldByName('ULTREAVVALORG').AsFloat;
               nSUltReavCmBem   := FcdsSaldoContabBem.FieldByName('ULTREAVCMBEM').AsFloat;
               nSDepLanc        := FcdsSaldoContabBem.FieldByName('DEPLANC').AsFloat;
               nSCmDep          := FcdsSaldoContabBem.FieldByName('CMDEP').AsFloat;
               nSReavDepLanc    := FcdsSaldoContabBem.FieldByName('REAVDEPLANC').AsFloat;
               nSReavCmDep      := FcdsSaldoContabBem.FieldByName('REAVCMDEP').AsFloat;
               nSUltReavDepLanc := FcdsSaldoContabBem.FieldByName('ULTREAVDEPLANC').AsFloat;
               nSUltReavCmDep   := FcdsSaldoContabBem.FieldByName('ULTREAVCMDEP').AsFloat;
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
            iaGrupo       := iGrupo;
            iaLocalizacao := iLocalizacao;
            iaResponsavel := iResponsavel;
            //----------------------------------------------------------------------------
            // Valores movimentados no bem por moeda x taxa depreciação
            //----------------------------------------------------------------------------
            _dMTFechamento.sqlMovContabBem.Prepare;
            _dMTFechamento.sqlMovContabBem.ParamByName('IDBEM').AsInteger     := iBem;
            _dMTFechamento.sqlMovContabBem.ParamByName('IDPESSOA').AsInteger  := iEmpresaProp;
            _dMTFechamento.sqlMovContabBem.ParamByName('MOECODIGO').AsInteger := FcdsBemxMoedaxDep.FieldbyName('MOECODIGO').AsInteger;
            _dMTFechamento.sqlMovContabBem.ParamByName('IDTAXADEP').AsInteger := FcdsBemxMoedaxDep.FieldbyName('IDBEMXDEP').AsInteger;
            _dMTFechamento.sqlMovContabBem.ParamByName('DATAMOV').AsDate      := dDataSld;
            FcdsMovContabBem.Data := _dMTFechamento.sqlMovContabBem.Data;
            //----------------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
               // Registra o Saldo
               //-------------------------------------------------------------------------
               _dMTFechamento.sqlInsSaldoContabBem.Prepare;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('IDBEM').AsInteger         := iBem;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger      := iEmpresaProp;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('MOECODIGO').AsInteger     := FcdsBemxMoedaxDep.FieldbyName('MOECODIGO').AsInteger;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('DATASLDBEM').AsDate       := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('VALORG').AsFloat          := nSValOrg;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('CMBEM').AsFloat           := nSCmBem;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('REAVVALORG').AsFloat      := nSReavValOrg;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('REAVCMBEM').AsFloat       := nSReavCmBem;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsFloat   := nSUltReavValOrg;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsFloat    := nSUltReavCmBem;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('IDGRUPO').AsInteger       := iaGrupo;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('IDLOCALIZACAO').AsInteger := iaLocalizacao;
               _dMTFechamento.sqlInsSaldoContabBem.ParamByName('IDRESPONSAVEL').AsInteger := iaResponsavel;
               if not ExecSQL(_dMTFechamento.sqlInsSaldoContabBem.SQLChanged, True) then
                  Raise Exception.Create(CMTranslate('Atualizando Saldo Moeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTFechamento.sqlInsSldCtbBemxDep.Prepare;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('IDBEM').AsInteger           := iBem;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('IDPESSOA').AsInteger        := iEmpresaProp;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('MOECODIGO').AsInteger       := FcdsBemxMoedaxDep.FieldbyName('MOECODIGO').AsInteger;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('IDSLDCTBBEMXDEP').AsInteger := FcdsBemxMoedaxDep.FieldbyName('IDBEMXDEP').AsInteger;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('DATASLDBEM').AsDate         := FcdsMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('DEPLANC').AsFloat           := nSDepLanc;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('CMDEP').AsFloat             := nSCmDep;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('REAVDEPLANC').AsFloat       := nSReavDepLanc;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('REAVCMDEP').AsFloat         := nSReavCmDep;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('ULTREAVDEPLANC').AsFloat    := nSUltReavDepLanc;
               _dMTFechamento.sqlInsSldCtbBemxDep.ParamByName('ULTREAVCMDEP').AsFloat      := nSUltReavCmDep;
               if not ExecSQL(_dMTFechamento.sqlInsSldCtbBemxDep.SQLChanged, True) then
                  Raise Exception.Create(CMTranslate('Atualizando Saldo Dep') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               FcdsMovContabBem.Next
            end;
            FcdsBemxMoedaxDep.Next;
         end;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlImobFechamento.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

function TCtrlImobFechamento.BuscaDataUltMovimentacao(iBem: Integer; dDataMov: TDateTime): TDateTime;
var
   sSQL : String;
begin
   sSQL := ' SELECT MAX(DATAMOVIMENTACAO) AS DATAMOVIMENTACAO '+ #13 +
           '   FROM HISTORICOMOVIMENTACAO ' + #13 +
           '  WHERE (IDBEM = ' + IntToStr(iBem) + ')' + #13 +
           '    AND DATAMOVIMENTACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataMov)) + ', ''DD/MM/YYYY'')';
   _cds.Data := GetDataPacket( sSQL );
   //-------------------------------------------------------------------------------------
   if not _cds.IsEmpty then
   begin
      if _cds.FieldByName('DATAMOVIMENTACAO').IsNull then
      begin
         Result := -1;
      end else
      begin
         Result := _cds.FieldByName('DATAMOVIMENTACAO').AsDateTime;
      end;
   end else
   begin
      Result := -1;
   end;
end;

function TCtrlImobFechamento.ExecutaProvisaoCustoImovel(iModulo, iEmpresaProp, iUsuario: Integer;
  dDataMov: TDateTime): Boolean;
var
  cdsProvisaoImovel: TClientDataSet;
  dSaldoContabBem, dSaldoProvisaoBem,
  dSaldoAnteriorProvisaoBem,
  dVariacaoProvisaoBem: Double;
  nSeqHist: Extended;

begin
  Result := True;
  dSaldoContabBem := 0;
  dSaldoProvisaoBem := 0;
  dSaldoAnteriorProvisaoBem := 0;
  dVariacaoProvisaoBem := 0;
  cdsProvisaoImovel := TClientDataSet.Create(nil);
  try
    try
      if not FcdsBem.IsEmpty then
      begin
        ProvisaoImovel.InicializaContabProvisao;

        FcdsBem.Filtered := False;
        FcdsBem.First;
        while not FcdsBem.EOF do
        begin
         //Buscar se imóvel do bem possui provisão;
          cdsProvisaoImovel.Data := ProvisaoImovel.GetProvisaoBemImovel(FcdsBem.FieldByName('IDBEM').AsInteger, dDataMov);
          if not cdsProvisaoImovel.IsEmpty then
          begin
            //Buscar saldo atual do bem;
            dSaldoContabBem := ProvisaoImovel.SaldoContabilBem(iEmpresaProp,
                                                               FcdsBem.FieldByName('IDBEM').AsInteger,
                                                               FcdsBem.FieldByName('MOECODIGO').AsInteger,
                                                               FcdsBem.FieldByName('IDBEMXDEP').AsInteger,
                                                               dDataMov);

            if not ProvisaoImovel.ExecutaProvisaoCusto(FcdsBem.FieldByName('IDBEM').AsInteger,
                                                       iEmpresaProp,
                                                       iModulo,
                                                       FcdsBem.FieldByName('MOECODIGO').AsInteger,
                                                       cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').asInteger,
                                                       cdsProvisaoImovel.FieldByName('IDIMOVEL').asInteger,
                                                       FcdsBem.FieldByName('IDGRUPO').AsInteger,
                                                       FcdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                                       FcdsBem.FieldByName('UNIDNEGOC').AsInteger,
                                                       FcdsBem.FieldByName('CODSUBCONTA').AsInteger,
                                                       cdsProvisaoImovel.FieldByName('CODTIPIMOVEL').asString,
                                                       FcdsBem.FieldByName('PLACA').asString,
                                                       FcdsBem.FieldByName('DESBEM').AsString,
                                                       '',
                                                       dDataMov,
                                                       dSaldoContabBem,
                                                       cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                       True,
                                                       True) then
              raise Exception.Create(ProvisaoImovel.MessageInfo);
          end;
          FcdsBem.Next;
        end;

        if ProvisaoImovel.bContabProvisao then
        begin
         if not ProvisaoImovel.ContabilizaProvisao(iModulo,
                                                   iEmpresaProp,
                                                   iUsuario,
                                                   dDataMov) then
          raise Exception.Create(ProvisaoImovel.MessageInfo);
        end;

      end;
    except
      on e: Exception do
      begin
        MessageInfo := e.Message;
        Result := False;
      end;
    end;
  finally
    FreeAndNil(cdsProvisaoImovel);
  end;
end;
end.

