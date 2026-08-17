unit uCtrlImobCAFxContab;
//******************************************************************************
//Nº SIG......: 113136 
//Data........: 04/07/2022
//Responsável.: Cássio Florencio Rovaroto 
//Descrição...: Implementação do provisionamento para perdas do custo de imóveis.
//******************************************************************************
//N. Sol..........: 258132
//N. Kintana......: 989009
//Data............: 23/05/2012
//Responsável.....: William Moreira da Silva
//Descrição.......: O calculo do terreno, era calculado errado
//******************************************************************************
//N. Sol..........: 179583/9621
//N. Kintana......: 1663224
//Data............: 23/05/2012
//Responsável.....: Helen V. Bianchi
//Descrição.......: Tratar mensagens incorretas e replicadas
//******************************************************************************


interface
uses SysUtils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCmClientDataSet, uCMTypes, uCtrlContab, uCtrlPeriodo, uCtrlLancamento,
     uCtrlImobLancamento, uCmSqlParams, uCtrlSegregacao, uCtrlImobSegregacao,
     uCtrlDocumento, uCtrlImobDocumento, uCMFileUtils, uCtrlPadroes, uCtrlConjunto,
     uCtrlGrupoContab, dMTBem, uCtrlParamCaf, uDbBem, uDbBemXMoeda, uDbBemXDep,
     uDbSaldoContabBem, uDbSldCtbBemXDep, uDbImagemBem, uDbPlanoPatroxImovel,
     uDiasUteis, uDbPlanoPatroxBem, uCtrlHistMovBem, uCtrlContaContabil, Math,
     uSistema, uCMMath, uComunsImobiliario;//, uCtrlImobFechamentoProRata;//William Moreira da Silva
type
   TCtrlImobCAFxContab = class(TCmControlObject)
    private
      FcdsMontaContab     : TClientDataSet;
      FcdsParamCAFxContab : TClientDataSet;

      //ProRata  : TCtrlImobFechamentoProRata;//William Moreira da Silva

      _dMTBem : tdtmMTBem;
      ParamCAF          : TCtrlParamCAF;
      Conjunto          : TCtrlConjunto;

      function ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano : Integer;
                                  sTipoLanc : String; Var iFlgSegrega : Integer) : String;
      function ContaContabilComCC(iEmpresa, iGrupo, iTipoMov, iPlano : Integer;
                                  sTipoLanc, sCodCentroCusto : String;
                                  Var iFlgSegrega : Integer) : String;
      function LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov : Integer;
                                 sTipoLanc: String;
                                 iPlano : Integer;
                                 Var sPlaConta : String;
                                 Var iFlgSegrega : Integer;
                                 bCtaxCCusto : Boolean = False;
                                 sCodCentroCusto : string = '') : Boolean;

      function MontaPlanilhaContabil(iModulo, iEmpresaProp, iTipoContab : Integer;
                                     iPlano : Integer;
                                     sContaDeb, sContaCre,
                                     sCcDeb, sCcCre : String;
                                     iFlgSegregaDeb, iFlgSegregaCre : Integer;
                                     iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo : Integer;
                                     sGrupo : String; nValLanc : Extended;
                                     sNomeContaDeb, sObrigaSubContaDeb,
                                     sNomeContaCre, sObrigaSubContaCre,
                                     sPlaTipConvOfiDeb,sPlaTipConvGerDeb,
                                     sPlaTipConvOfiCre,sPlaTipConvGerCre,
                                     sNumDoc,sHistor1,sHistor2,sHistor3,
                                     sHistor4,sHistor5 : String; bProvisao : Boolean = False) : Boolean;

      function ModulodoGrupo(iEmpresaProp, iGrupo : Integer) : Integer;
      function BuscaCodigoImovel(const iIdBem: Integer; const iCafObra: Integer = -1) : String;
      function ConvNum(nValor : Extended) : Extended;
      function AjustaNum(nMoeCodigo : Extended; nValor : Currency) : Currency;
      function CMTranslate(sIgor : String) : String;
      Function BuscaDescMovto(const iTipoMov:Integer) : String;
      function BuscaFlagTipoFechamento(const iIdGrupo: Integer) : Byte;
      function BuscaPlanoPatroxImovel(nIdImovel: integer): OLEVariant;
    protected
      procedure AfterInitialize; override;
      procedure SetcdsMontaContab(const Value: TClientDataSet);
      procedure SetcdsParamCAFxContab(const Value: TClientDataSet);
    public
      (*Cássio - SOL 92381 KINTANA 394180
        Objetos que possuem métodos para realizar a segregação na origem dos imóveis*)
      ImobLancaContab   : TCtrlImobLancamento;
      ImobSegregacao    : TCtrlImobSegregacao;

      LancaContab       : TCtrlLancamento;
      Segregacao        : TCtrlSegregacao;
      ContaContab       : TCtrlContaContabil;
      PeriodoContab     : TCtrlPeriodo;
      
      property cdsMontaContab     : TClientDataSet read FcdsMontaContab write SetcdsMontaContab;
      property cdsParamCAFxContab : TClientDataSet read FcdsParamCAFxContab write SetcdsParamCAFxContab;
      constructor Create; override;
      destructor Destroy; override;
      function ListaPlanoPatroxBem(nIdPessoa, nIdBem : Extended) : OleVariant;
      //Cássio - SOL Nº 124540 KINTANA Nº 633512
      //Retorna o Plano e Patrocinadora que Segregam o imóvel envolvido na Obra
      function ListaPlanoPatroObra(nIdGrupo, nIdCafObra : Extended) : OleVariant;
      function IntegraContab(iEmpresa, iModulo : Integer) : Boolean;
      function InicializaMontaContab : Boolean;
      function MontaParamCAFxContab(iEmpresa, iPlano : Integer) : Boolean;
      function VerificaPeriodoContabil(fEmpresa : Extended; dData: TDateTime;
                                       Var iExercicio, iPeriodo : Integer) : Boolean;
      function VerificaContaxCC(iPlano, iEmpresaProp : Integer;
                                sPlaConta, sCodCentroCusto : String) : Boolean;


      function RegistraPlanilhaContabil(nModulo, nEmpresaProp, nUsuario : Extended;
                                        sDataLanc : String{; nIdImovel: Integer = -1}) : Extended;
      function RemovePlanContab(iEmpresaProp : Integer) : boolean;

      function ContabilizaEntrada(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                  iAtivProjeto, iSubConta : Integer;
                                  sPlaca, sDesBem, sGrupo : String;
                                  dDataLanc : TDateTime;
                                  nValOrg : Extended;
                                  iExercicio, iPeriodo : Integer; bCtaxCCusto: Boolean) : Boolean;

      function ContabilizaCorrecaoMonetaria(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                            iAtivProjeto, iSubConta : Integer;
                                            sPlaca, sDesBem, sGrupo : String;
                                            dDataLanc : TDatetime; nCmBem, nCmDep : Extended;
                                            sTipoTab : String;
                                            iExercicio, iPeriodo : Integer) : Boolean;

      function ContabilizaDepreciacao(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                      iAtivProjeto, iSubConta : Integer;
                                      sPlaca, sDesBem, sGrupo : String;
                                      dDataLanc : TDatetime; nDepLanc : Extended;
                                      sTipoTab : String;
                                      iExercicio, iPeriodo : Integer;
                                      bSomenteImoveis, bCtaxCCusto : Boolean) : Boolean;

      function ContabilizaTransferencia(nModulo, nEmpresaProp, nBem,
                                        nGrupoAtual, nGrupoNovo : Extended;
                                        sGrupoAtual, sGrupoNovo : String;
                                        nConjuntoAtual, nConjuntoNovo : Extended;
                                        sCCustoAtual, sCCustoNovo : String;
                                        dDataLanc : TDateTime;
                                        nValorB, nValorCMB, nValorD, nValorCMD : Extended;
                                        sDesBem, sTipoTab : String;
                                        nSubConta, nAtivProjeto : Extended; sPlaca : String;
                                        iExercicio, iPeriodo : Integer;
                                        bCtaxCCusto : Boolean) : Boolean;

      function ContabilizaBaixa(nModulo, nEmpresaProp, nBem : Extended;
                                dDataLanc : TDateTime;
                                nGrupo, nConjunto, nSubConta, nAtivProjeto : Extended;
                                nBaixaB, nBaixaCMB, nBaixaD, nBaixaCMD : Extended;
                                sTipoTab, sDesBem, sPlaca, sGrupo, sPlaContaDestino : String;
                                iExercicio, iPeriodo : Integer;
                                bCtaxCCusto : Boolean) : Boolean;

     function ContabilizaResultadoBaixa(nModulo, nEmpresaProp, nBem : Extended;
                                         dDataLanc : TDateTime;
                                         nGrupo, nConjunto, nSubConta, nAtivProjeto : Extended;
                                         nValResult : Extended;
                                         sDesBem, sPlaca, sGrupo, sPlaContaDestino : String;
                                         iExercicio, iPeriodo : Integer;
                                         bCtaxCCusto : Boolean) : Boolean;

      function ContabilizaDesmembramento(nModulo, nEmpresaProp, nBem,
                                         dDataLanc : TDateTime;
                                         nGrupoPai, nGrupoFilho : Extended;
                                         sGrupoPai, sGrupoFilho : String;
                                         nConjuntoPai, nConjuntoFilho : Extended;
                                         sCCustoPai, sCCustoFilho : String;
                                         nSubConta, nAtivProjeto : Extended;
                                         sTipoTab : String;
                                         nValorB, nValorCMB, nValorD, nValorCMD : Extended;
                                         sDesBemPai, sDesBemFilho : String;
                                         sPlacaPai, sPlacaFilho : String;
                                         iExercicio, iPeriodo : Integer;
                                         bCtaxCCusto : Boolean) : Boolean;

      function ContabilizaRemembramento(nModulo, nEmpresaProp, nBem,
                                        dDataLanc : TDateTime;
                                        nGrupoPai, nGrupoFilho : Extended;
                                        sGrupoPai, sGrupoFilho : String;
                                        nConjuntoPai, nConjuntoFilho : Extended;
                                        sCCustoPai, sCCustoFilho : String;
                                        nSubConta, nAtivProjeto : Extended;
                                        sTipoTab : String;
                                        nValorB, nValorCMB, nValorD, nValorCMD : Extended;
                                        sDesBemPai, sDesBemFilho : String;
                                        sPlacaPai, sPlacaFilho : String;
                                        iExercicio, iPeriodo : Integer;
                                        bCtaxCCusto : Boolean) : Boolean;
      //----------------------------------------------------------------------------------
      function ContabilizaLancObra(nModulo, nEmpresaProp, nUsuario, nCafObra, nGrupo : Extended;
                                   iExercicio, iPeriodo : Integer;
                                   dDataLanc : TDateTime; nValOfi : Extended;
                                   sGrupo, sDescObra : String;
                                   nAtivProjeto, nSubConta : Extended;
                                   bCtaxCCusto : Boolean; iIdimovel: Integer = -1) : Extended;
      //----------------------------------------------------------------------------------
      function ContabilizaEncerraObra(nModulo, nEmpresaProp, nBem, nConjunto,
                                      nGrupoObra, nGrupoBem : Extended;
                                      sGrupoObra, sGrupoBem : String;
                                      iExercicio, iPeriodo  : Integer;
                                      dDataLanc : TDateTime; nValor : Extended;
                                      sDescObra, sDescBem : String;
                                      nAtivProjeto, nSubConta, nPlaca : Extended;
                                      bCtaxCCusto : Boolean) : boolean;
      //----------------------------------------------------------------------------------
      function ContabilizaReavaliacao(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                      iAtivProjeto, iSubConta : Integer;
                                      sPlaca, sDesBem, sGrupo : String;
                                      dDataLanc : TDateTime; nSaldoReaval : Extended;
                                      iExercicio, iPeriodo : Integer; bCtaxCCusto: Boolean) : Boolean;
      function ContabilizaReavalBaixa(nModulo, nEmpresaProp, nBem,
                                      dDataLanc : TDateTime;
                                      nGrupo : Extended; sGrupo : String;
                                      nConjunto : Extended; sCCusto : String;
                                      nSubConta, nAtivProjeto : Extended;
                                      sTipoTab : String;
                                      nValorB, nValorCMB, nValorD, nValorCMD : Extended;
                                      sDesBem, sPlaca : String;
                                      iExercicio, iPeriodo : Integer;
                                      bCtaxCCusto : Boolean) : Boolean;
      //----------------------------------------------------------------------------------
      function ContabilizaAcrescimoValor(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                         iAtivProjeto, iSubConta : Integer;
                                         sPlaca, sDesBem, sGrupo : String;
                                         dDataLanc : TDateTime; nValAcres : Extended;
                                         iExercicio, iPeriodo : Integer; bCtaxCCusto: Boolean) : Boolean;

      function ContabilizaProvisaoCusto(iModulo, iEmpresa, iBem, iGrupo, iConjunto,
                                      iAtivProjeto, iSubConta : Integer;
                                      sPlaca, sDesBem, sGrupo : String;
                                      dDataLanc : TDatetime; nValorProvisao : Extended;
                                      iExercicio, iPeriodo : Integer;
                                      bCtaxCCusto : Boolean; bBaixa: Boolean = False): Boolean;
   end;
implementation

{ TCtrlImobCAFxContab }

procedure TCtrlImobCAFxContab.AfterInitialize;
begin
  inherited;
  ContaContab.InitializeAs(Self);
  PeriodoContab.InitializeAs(Self);
  ImobSegregacao.InitializeAs(Self);
  ImobLancaContab.InitializeAs(ImobSegregacao);
  Segregacao.InitializeAs(Self);
  LancaContab.InitializeAs(Segregacao);
  ParamCAF.InitializeAs(Self);
  Conjunto.InitializeAs(Self);

end;

function TCtrlImobCAFxContab.AjustaNum(nMoeCodigo: Extended;
  nValor: Currency): Currency;
var
   nValMin   : Currency;
   iFatorDec : Integer;
   sFatorDec : String;

begin
   Result := nValor;
   if nMoeCodigo = ParamCAF.MOEDAPADRAO then
   begin
      nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
      if abs(nValor) >= nValMin then
      begin
         iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
         if ParamCAF.MOEPADRAODECIMAIS > 0 then
         begin
            sFatorDec := '#0.' + StringOfChar('0', ParamCAF.MOEPADRAODECIMAIS);
         end else
         begin
            sFatorDec := '#0';
         end;
         Result := strtofloat(FormatFloat(sFatorDec,((nValor * iFatorDec) / iFatorDec)));
      end;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT MOECODIGO, (2) AS NUMDECIMAIS, ' + #13 +
                                 '        (''S'') AS FLGARREDONDA ' + #13 +
                                 ' FROM CAFMOEDAS ');
      if _cds.Locate('MOECODIGO',nMoeCodigo,[]) then
      begin
         nValMin := 1 / Power(10, abs(_cds.FieldByName('NUMDECIMAIS').AsInteger));
         if abs(nValor) >= nValMin then
         begin
            iFatorDec := 10 * _cds.FieldByName('NUMDECIMAIS').AsInteger;
            if _cds.FieldByName('NUMDECIMAIS').AsInteger > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',_cds.FieldByName('NUMDECIMAIS').AsInteger);
            end else
            begin
               sFatorDec := '#0';
            end;
            Result := strtofloat(FormatFloat(sFatorDec,((nValor * iFatorDec) / iFatorDec)));
         end;
      end else
      begin
         nValMin := 0.01;
         if abs(nValor) >= nValMin then
            Result := strtofloat(FormatFloat('#0.00',((nValor * 100) / 100)));
      end;
   end;  
end;

function TCtrlImobCAFxContab.BuscaCodigoImovel(const iIdBem,
  iCafObra: Integer): String;
var
   sSql : String;
   cdsTemp : TClientDataSet;
begin
 Result := '';
 try
    if iIdBem > 0 then begin
       sSql := 'SELECT IMOCODIGO                 '+#13+
               '  FROM IMOVEL I, IMOVELXBEM IXB  '+#13+
               ' WHERE IXB.IDIMOVEL = I.IDIMOVEL '+#13+
               '   AND IXB.IDBEM = ' + IntToStr( iIdBem );
    end else begin
       sSql := 'SELECT IMOCODIGO               '+#13+
               '  FROM IMOVEL I, CAFOBRA O     '+#13+
               ' WHERE O.IDIMOVEL = I.IDIMOVEL '+#13+
               '   AND O.IDCAFOBRA = ' + IntToStr( iCafObra );
    end;
    cdsTemp := TClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );
    if not cdsTemp.FieldByName('IMOCODIGO').IsNull then
       Result := ' - Imóvel: ' + cdsTemp.FieldByName('IMOCODIGO').AsString;
 finally
    FreeAndNil( cdsTemp );
 end;
end;

function TCtrlImobCAFxContab.BuscaDescMovto(
  const iTipoMov: Integer): String;
var cdsTemp : TClientDataSet;
begin
   cdsTemp := TClientDataSet.Create(nil);
   try
      cdsTemp := TClientDataSet.Create(nil);
      cdsTemp.Data := GetDataPacket('SELECT DESCTIPOMOVIMENTACAO '+
                                    '  FROM TIPOMOVIMENTACAO '+
                                    ' WHERE IDTIPOMOVIMENTACAO = ' + IntToStr(iTipoMov) );
      Result := cdsTemp.FieldByName('DESCTIPOMOVIMENTACAO').AsString;
   finally
      cdsTemp.Free;
   end;
end;

function TCtrlImobCAFxContab.BuscaFlagTipoFechamento(
  const iIdGrupo: Integer): Byte;
var cdsTemp : TClientDataSet;
begin
   cdsTemp := TClientDataSet.Create(nil);
   try
      cdsTemp.Data := GetDataPacket('SELECT FLGTIPOFECHAMENTO '+
                                    '  FROM GRUPO '+
                                    ' WHERE IDGRUPO = ' + IntToStr(iIdGrupo) );
      Result := cdsTemp.FieldByName('FLGTIPOFECHAMENTO').AsInteger;
   finally
      cdsTemp.Free;
   end;
end;

function TCtrlImobCAFxContab.CMTranslate(sIgor: String): String;
begin
  Result := sIgor;
end;

function TCtrlImobCAFxContab.ContabilizaAcrescimoValor(iModulo, iEmpresa,
  iBem, iGrupo, iConjunto, iAtivProjeto, iSubConta: Integer; sPlaca,
  sDesBem, sGrupo: String; dDataLanc: TDateTime; nValAcres: Extended;
  iExercicio, iPeriodo: Integer; bCtaxCCusto: Boolean): Boolean;
var
   iTipoMov, iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre      : Integer;
   nValLanc, nParticip1                : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre      : String;
   FcdsCcRD                            : TClientDataSet;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxCCustoDeb1, sMaxCCustoCre1          : String;
   nMaxCCusto1, nSomaRateios1              : Extended;

begin
   Result := True;
   FcdsCcRD := TClientDataSet.Create(nil);
   try
      try
         iTipoMov := 9;
         //-------------------------------------------------------------------------------
         // Carga dos parametros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresa) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;
         //-------------------------------------------------------------------------------
         // Contas Contábeis não definidas por Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
            //----------------------------------------------------------------------------
            // Busca conta a débito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
            begin
               raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Acréscimo de Valor no Grupo ') + sGrupo +
                                      CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                      CMTranslate(' não cadastrada !'))
            end;
            //----------------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCredito, iFlgSegregaCre) then
            begin
               raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Acréscimo de Valor no Grupo ') + sGrupo +
                                      CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                      CMTranslate(' não cadastrada !'))
            end;
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor2   := trim(sPlaca);
         if iModulo in [54,64,135] then                                      // InvestImob
            sHistor2 := sHistor2 + BuscaCodigoImovel(iBem);
         sHistor3   := trimleft(copy(sDesBem, 1,40));
         sHistor4   := trimleft(copy(sDesBem,41,80));
         sHistor5   := '';
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         //-------------------------------------------------------------------------------
         nParticip1 := 0;
         //-------------------------------------------------------------------------------
         // A diferença entre os valores contabilizados e a soma dos seus rateios deve
         // ser lançada no Centro de Custo com a maior proporção
         //-------------------------------------------------------------------------------
         nMaxCCusto1 := 0.000000;
         nSomaRateios1 := 0.00;
         iMaxFlgSegregaDeb1 := 0;
         iMaxFlgSegregaCre1 := 0;
         //-------------------------------------------------------------------------------
         // Busca Rateio da Depreciação do Bem
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
         while not FcdsCcRD.EOF do
         begin
            if nParticip1 < 100 then
            begin
               sHistor1 := CMTranslate('Acréscimo de Valor Patrimonial');
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  // Busca conta a débito
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
                  begin
                     raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Acréscimo de Valor no Grupo ') + sGrupo +
                                            CMTranslate(' no Centro de Custo ') + sCCDeb +
                                            CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                            CMTranslate(' não cadastrada !'))
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                     sDebito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaDeb      := ContaContab.NomeConta;
               sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
               sTipConvOfiDeb     := ContaContab.TipoConvOfi;
               sTipConvGerDeb     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcDeb = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sDebito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  // Busca conta a crédito
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
                  begin
                     raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Acréscimo de Valor no Grupo ') + sGrupo +
                                            CMTranslate(' no Centro de Custo ') + sCCCre +
                                            CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                            CMTranslate(' não cadastrada !'))
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                     sCredito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaCre      := ContaContab.NomeConta;
               sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaCre := ContaContab.ObrigaSubConta;
               sTipConvOfiCre     := ContaContab.TipoConvOfi;
               sTipConvGerCre     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcCre = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sCredito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  nParticip1 := 100;
               //-------------------------------------------------------------------------
               nValLanc := ConvNum((nValAcres * nParticip1) / 100);
               nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
               //-------------------------------------------------------------------------
               // Acumula os valores proporcionais e apura o centro de custo
               // com a maior proporção
               //-------------------------------------------------------------------------
               nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
               if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
               begin
                  sMaxDebito1            := sDebito;
                  sMaxCredito1           := sCredito;
                  iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
                  iMaxFlgSegregaCre1     := iFlgSegregaCre;
                  sMaxNomeContaDeb1      := sNomeContaDeb;
                  sMaxNomeContaCre1      := sNomeContaCre;
                  sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
                  sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
                  sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
                  sMaxTipConvOfiCre1     := sTipConvOfiCre;
                  sMaxTipConvGerDeb1     := sTipConvGerDeb;
                  sMaxTipConvGerCre1     := sTipConvGerCre;
                  //----------------------------------------------------------------------
                  sMaxCCustoDeb1         := sCcDeb;
                  sMaxCCustoCre1         := sCcCre;
                  nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta,
                                            sDebito, sCredito, sCcDeb, sCcCre,
                                            iFlgSegregaDeb, iFlgSegregaCre, iSubConta, iAtivProjeto,
                                            iEmpresa, iBem, iGrupo, sGrupo, nValLanc,
                                            sNomeContaDeb,sObrigaSubContaDeb,
                                            sNomeContaCre,sObrigaSubContaCre,
                                            sTipConvOfiDeb,sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                            sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsCcRD.Next;
         end;
         FcdsCcRD.Close;
         //-------------------------------------------------------------------------------
         // A diferença entre os valores contabilizados e a soma dos seus rateios deve
         // ser lançada no Centro de Custo com a maior proporção
         //-------------------------------------------------------------------------------
         if ConvNum(nSomaRateios1 - nValAcres) <> 0 then
         begin
            if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta,
                                         sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                         iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                         iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo, sGrupo,
                                         ConvNum(nSomaRateios1 - nValAcres),
                                         sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                         sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                         sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                         sMaxTipConvOfiCre1,sMaxTipConvGerCre1,
                                         sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      FcdsCcRD.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaBaixa(nModulo, nEmpresaProp,
  nBem: Extended; dDataLanc: TDateTime; nGrupo, nConjunto, nSubConta,
  nAtivProjeto, nBaixaB, nBaixaCMB, nBaixaD, nBaixaCMD: Extended; sTipoTab,
  sDesBem, sPlaca, sGrupo, sPlaContaDestino: String; iExercicio,
  iPeriodo: Integer; bCtaxCCusto: Boolean): Boolean;
var
   FcdsCcRD : TClientDataSet;
   iPlanoConta,
   iTipoMov1, iTipoMov2,
   iTipoMov3, iTipoMov4,
   iFlgSegregaDeb, iFlgSegregaCre,
   iFlgSegregaCMDeb, iFlgSegregaCMCre,
   iFlgSegregaDDeb, iFlgSegregaDCre,
   iFlgSegregaCMDDeb, iFlgSegregaCMDCre      : Integer;
   sDebito, sCredito,
   sDebitoD, sCreditoD,
   sDebitoCM, sCreditoCM,
   sDebitoCMD, sCreditoCMD,
   sHistor1, sHistor2,
   sHistor3, sHistor4,
   sHistor5, sNumDoc,
   sCCDeb, sCCCre,
   sNomeContaDeb, sNomeContaCre,
   sObrigaCcDeb, sObrigaCcCre,
   sObrigaSubContaDeb, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvOfiCre,
   sTipConvGerDeb, sTipConvGerCre,
   sMensErro                                 : String;
   bOk                                       : boolean;
   nParticip1, nParticip2,
   nParticip3, nParticip4,
   nValLanc                                  : Extended;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
   iMaxFlgSegregaDeb2, iMaxFlgSegregaCre2,
   iMaxFlgSegregaDeb3, iMaxFlgSegregaCre3,
   iMaxFlgSegregaDeb4, iMaxFlgSegregaCre4  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxDebito2, sMaxCredito2,
   sMaxDebito3, sMaxCredito3,
   sMaxDebito4, sMaxCredito4,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxNomeContaDeb2, sMaxNomeContaCre2,
   sMaxNomeContaDeb3, sMaxNomeContaCre3,
   sMaxNomeContaDeb4, sMaxNomeContaCre4,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxObrigaSubContaDeb2,
   sMaxObrigaSubContaCre2,
   sMaxObrigaSubContaDeb3,
   sMaxObrigaSubContaCre3,
   sMaxObrigaSubContaDeb4,
   sMaxObrigaSubContaCre4,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxTipConvOfiDeb2, sMaxTipConvOfiCre2,
   sMaxTipConvGerDeb2, sMaxTipConvGerCre2,
   sMaxTipConvOfiDeb3, sMaxTipConvOfiCre3,
   sMaxTipConvGerDeb3, sMaxTipConvGerCre3,
   sMaxTipConvOfiDeb4, sMaxTipConvOfiCre4,
   sMaxTipConvGerDeb4, sMaxTipConvGerCre4,
   sMaxCCustoDeb1, sMaxCCustoCre1,
   sMaxCCustoDeb2, sMaxCCustoCre2,
   sMaxCCustoDeb3, sMaxCCustoCre3,
   sMaxCCustoDeb4, sMaxCCustoCre4          : String;
   nMaxCCusto1, nSomaRateios1,
   nMaxCCusto2, nSomaRateios2,
   nMaxCCusto3, nSomaRateios3,
   nMaxCCusto4, nSomaRateios4              : Extended;
   iTipoFechamento : Byte;
begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  iTipoFechamento := buscaFlagTipoFechamento(trunc(nGrupo));

  try
    try
      //-------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);

      //-------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //-------------------------------------------------------------------------------
      iPlanoConta := ParamCAF.PLANOVIGENTE;
      //-------------------------------------------------------------------------------
       if sTipoTab = 'B' then
       begin
        iTipoMov1 := 06;
        iTipoMov2 := 25;
        iTipoMov3 := 24;
        iTipoMov4 := 26;
        sMensErro := CMTranslate('(Aquisição)');
       end
       else
        if sTipoTab = 'R' then
        begin
          //----------------------------------------------------------------------------
          if nBaixaB > 0 then
            iTipoMov1 := 20
          else
            iTipoMov1 := 70;
          //----------------------------------------------------------------------------
          if nBaixaD > 0 then
            iTipoMov3 := 27
          else
            iTipoMov3 := 71;
          //----------------------------------------------------------------------------
          iTipoMov2 := 28;
          iTipoMov4 := 29;
          //----------------------------------------------------------------------------
          sMensErro := CMTranslate(' (Reavaliação) ');
        end
        else
          if sTipoTab = 'A' then
          begin
            iTipoMov1 := 37;
            iTipoMov2 := 38;
            iTipoMov3 := 39;
            iTipoMov4 := 40;
            sMensErro := CMTranslate(' (Acréscimo) ');
          end
          else
          begin
            iTipoMov1 := 0;
            iTipoMov2 := 0;
            iTipoMov3 := 0;
            iTipoMov4 := 0;
            sMensErro := CMTranslate(' (Erro) ');
          end;
          //-------------------------------------------------------------------------------
          // Contas Contábeis não definidas por Centros de Custo
          //-------------------------------------------------------------------------------
          if not bCtaxCCusto then
          begin
            //----------------------------------------------------------------------------
            // Busca conta a débito para a baixa do custo do bem
            //----------------------------------------------------------------------------
            bOk := True;
            if sPlaContaDestino = '' then
               bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb)
            else
              if iTipoMov1 <> 70 then
                sDebito := sPlaContaDestino
              else
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb);
            //----------------------------------------------------------------------------
            if (not bOk) or (sDebito = '') then
              raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa do Custo no Grupo ') + sGrupo +
                                     CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                     CMTranslate(' não cadastrada !') + sMensErro);
            //----------------------------------------------------------------------------
            // Busca conta a crédito para a baixa do custo do bem
            //----------------------------------------------------------------------------
            bOk := True;
            if sPlaContaDestino = '' then
               bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre)
            else
               if iTipoMov1 = 70 then
                sCredito := sPlaContaDestino
               else
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre);
              //----------------------------------------------------------------------------
            if (not bOk) or (sCredito = '') then
              raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa do Custo no Grupo ') + sGrupo +
                                     CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                     CMTranslate(' não cadastrada !') + sMensErro);
              //----------------------------------------------------------------------------
            if nBaixaCMB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito para a baixa da correção monetária do custo
               //-------------------------------------------------------------------------
               bOk := True;
               if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb)
               else
                  if iTipoMov3 <> 70 then
                     sDebitoCM := sPlaContaDestino
                  else
                     bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb);
               //-------------------------------------------------------------------------
              if (not bOk) or (sDebitoCM = '') then
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa da Correção Monetária do Custo no Grupo ') + sGrupo +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                         CMTranslate(' não cadastrada !'));
               //-------------------------------------------------------------------------
               // Busca conta a crédito para a baixa da correção monetária do custo
               //-------------------------------------------------------------------------
               bOk := True;
               if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre)
               else
                  if iTipoMov3 = 70 then
                     sCreditoCM := sPlaContaDestino
                  else
                     bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre);
               //-------------------------------------------------------------------------
               if (not bOk) or (sCreditoCM = '') then
                  raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa da Correção Monetária do Custo no Grupo ') +
                                         sGrupo + CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                         CMTranslate(' não cadastrada !'));
            end;
            //----------------------------------------------------------------------------
            if nBaixaD <> 0 then
            begin
              //-------------------------------------------------------------------------
              // Busca conta a débito para a baixa da depreciação
              //-------------------------------------------------------------------------
              bOk := True;
              if sPlaContaDestino = '' then
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb)
              else
                if iTipoMov3 = 71 then
                  sDebitoD := sPlaContaDestino
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb);
                //-------------------------------------------------------------------------
              if (not bOk) or (sDebitoD = '') then
                raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa da Depreciação Acumulada no Grupo ') +
                                       sGrupo + CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) + CMTranslate(' não cadastrada !') + sMensErro);
              //-------------------------------------------------------------------------
              // Busca conta a crédito para a baixa da depreciação
              //-------------------------------------------------------------------------
              bOk := True;

              if sPlaContaDestino = '' then
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre)
              else
                if iTipoMov3 <> 71 then
                  sCreditoD := sPlaContaDestino
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre);
              //-------------------------------------------------------------------------
              if (not bOk) or (sCreditoD = '') then
                raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa da Depreciação Acumulada no Grupo ') +
                                       sGrupo + CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
            end;
              //----------------------------------------------------------------------------
            if nBaixaCMD <> 0 then
            begin
              //-------------------------------------------------------------------------
              // Busca conta a débito para a baixa da correção monetária da depreciacao
              //-------------------------------------------------------------------------
              bOk := True;
              if sPlaContaDestino = '' then
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb)
              else
                if iTipoMov3 = 71 then
                  sDebitoCMD := sPlaContaDestino
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb);
                //-------------------------------------------------------------------------
              if (not bOk) or (sDebitoCMD = '') then
                raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa da Correção Monetária da ') +
                                       CMTranslate('Depreciação Acumulada no Grupo ') + sGrupo +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro);
              //-------------------------------------------------------------------------
              // Busca conta a crédito para a baixa da correção monetária da depreciacao
              //-------------------------------------------------------------------------
              bOk := True;
              if sPlaContaDestino = '' then
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre)
              else
                if iTipoMov3 <> 71 then
                  sCreditoCMD := sPlaContaDestino
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre);
              //-------------------------------------------------------------------------
              if (not bOk) or (sCreditoCMD = '') then
                raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa da Correção Monetária da ') +
                                       CMTranslate('Depreciação Acumulada no Grupo ') + sGrupo +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro);
          end;
        end;
        //-------------------------------------------------------------------------------
        // Processamento do Rateio dos Custos
        //-------------------------------------------------------------------------------
        sHistor2   := trim(sPlaca);
        if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then
          sHistor2 := sHistor2 + BuscaCodigoImovel(Trunc(nBem));

        sHistor3   := trimleft(copy(sDesBem, 1,40));
        sHistor4   := trimleft(copy(sDesBem,41,80));
        sHistor5   := '';
        sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
        nParticip1 := 0;
        nParticip2 := 0;
        nParticip3 := 0;
        nParticip4 := 0;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        nMaxCCusto1 := 0.000000; nSomaRateios1 := 0.00; iMaxFlgSegregaDeb1 := 0; iMaxFlgSegregaCre1 := 0;
        nMaxCCusto2 := 0.000000; nSomaRateios2 := 0.00; iMaxFlgSegregaDeb2 := 0; iMaxFlgSegregaCre2 := 0;
        nMaxCCusto3 := 0.000000; nSomaRateios3 := 0.00; iMaxFlgSegregaDeb3 := 0; iMaxFlgSegregaCre3 := 0;
        nMaxCCusto4 := 0.000000; nSomaRateios4 := 0.00; iMaxFlgSegregaDeb4 := 0; iMaxFlgSegregaCre4 := 0;
        //-------------------------------------------------------------------------------
        // Busca Rateio da Depreciação do Bem
        //-------------------------------------------------------------------------------
        FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjunto);
        while not FcdsCcRD.EOF do
        begin
          if nParticip1 < 100 then
          begin
            sHistor1 := CMTranslate('Baixa Custo ') + sMensErro;
            //-------------------------------------------------------------------------
            // Montagem da Partida Dobrada
            //-------------------------------------------------------------------------
            sCCDeb := '';
            sCCCre := '';
            //-------------------------------------------------------------------------
            // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
            //-------------------------------------------------------------------------
            if bCtaxCCusto then
            begin
              sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
              //----------------------------------------------------------------------
              // Busca conta a débito
              //----------------------------------------------------------------------
              bOk := True;
              if sPlaContaDestino = '' then
                bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb)
              else
                if iTipoMov1 <> 70 then
                  sDebito := sPlaContaDestino
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb);
                //----------------------------------------------------------------------
                if (not bOk) or (sDebito = '') then
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa do Custo no Grupo ') + sGrupo +
                                         CMTranslate(' no Centro de Custo ') + sCCDeb +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
              end;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //-------------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebito, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;

              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //-------------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end;
              //-------------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //-------------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //----------------------------------------------------------------------
                bOk := True;
                if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre)
                else
                  if iTipoMov1 = 70 then
                    sCredito := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre);
                //----------------------------------------------------------------------
                if (not bOk) or (sCredito = '') then
                  raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa do Custo no Grupo ') + sGrupo +
                                         CMTranslate('no Centro de Custo ') + sCCCre +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
              end;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //-------------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sCredito, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //-------------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end;
              //-------------------------------------------------------------------------
              if (sCCDeb = '') and (sCCCre = '') then
                nParticip1 := 100;
              //-------------------------------------------------------------------------
              nValLanc := ConvNum((nBaixaB * nParticip1) / 100);
              nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
              //-------------------------------------------------------------------------
              // Acumula os valores proporcionais e apura o centro de custo
              // com a maior proporção
              //-------------------------------------------------------------------------
              nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
              if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
              begin
                sMaxDebito1            := sDebito;
                sMaxCredito1           := sCredito;
                iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
                iMaxFlgSegregaCre1     := iFlgSegregaCre;
                sMaxNomeContaDeb1      := sNomeContaDeb;
                sMaxNomeContaCre1      := sNomeContaCre;
                sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
                sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
                sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
                sMaxTipConvOfiCre1     := sTipConvOfiCre;
                sMaxTipConvGerDeb1     := sTipConvGerDeb;
                sMaxTipConvGerCre1     := sTipConvGerCre;
                //----------------------------------------------------------------------
                sMaxCCustoDeb1         := sCcDeb;
                sMaxCCustoCre1         := sCcCre;
                nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
              end;
              //-------------------------------------------------------------------------
              if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                           iFlgSegregaDeb, iFlgSegregaCre,
                                           Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                           Trunc(nBem), Trunc(nGrupo), sGrupo, abs(nValLanc),
                                           sNomeContaDeb,sObrigaSubContaDeb,
                                           sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                           sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                           sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                Raise Exception.Create(MessageInfo);
          end;
          //----------------------------------------------------------------------------
          if nBaixaCMB <> 0 then
          begin
            if nParticip2 < 100 then
            begin
              sHistor1 := CMTranslate('Baixa Correção Monetária ') + sMensErro;
              //----------------------------------------------------------------------
              // Montagem da Partida Dobrada
              //----------------------------------------------------------------------
              sCCDeb := '';
              sCCCre := '';
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //-------------------------------------------------------------------
                // Busca conta a débito
                //-------------------------------------------------------------------
                bOk := True;
                if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb)
                else
                  if iTipoMov1 <> 70 then
                    sDebitoCM := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb);
                //-------------------------------------------------------------------
                if (not bOk) or (sDebitoCM = '') then
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa da Correção Monetária do Custo no Grupo ') + sGrupo +
                                         CMTranslate(' no Centro de Custo ') + sCCDeb +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebitoCM, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCM,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip2 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end;
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //-------------------------------------------------------------------
                bOk := True;
                if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre)
                else
                  if iTipoMov1 = 70 then
                    sCreditoCM := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre);
                //-------------------------------------------------------------------
                if (not bOk) or (sCreditoCM = '') then
                  raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa da Correção Monetária do Custo no Grupo ') + sGrupo +
                                         CMTranslate('no Centro de Custo ') + sCCCre +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
                end;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Crédito é válida
                //----------------------------------------------------------------------
                if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                      sCreditoCM, False, False) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end;
                sNomeContaCre      := ContaContab.NomeConta;
                sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                sTipConvOfiCre     := ContaContab.TipoConvOfi;
                STipConvGerCre     := ContaContab.TipoConvGeren;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Crédito obriga centro de custo
                //----------------------------------------------------------------------
                if sObrigaCcCre = 'S' then
                begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCM,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end
                  else
                  begin
                    sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                    nParticip2 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
                end;
                //----------------------------------------------------------------------
                if (sCCDeb = '') and (sCCCre = '') then
                  nParticip2 := 100;
                //----------------------------------------------------------------------
                nValLanc := ConvNum((nBaixaCMB * nParticip2) / 100);
                nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
                //----------------------------------------------------------------------
                // Acumula os valores proporcionais e apura o centro de custo
                // com a maior proporção
                //----------------------------------------------------------------------
                nSomaRateios2 := ConvNum(nSomaRateios2 + nValLanc);

                if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto2 then
                begin
                  sMaxDebito2            := sDebitoCM;
                  sMaxCredito2           := sCreditoCM;
                  iMaxFlgSegregaDeb2     := iFlgSegregaCMDeb;
                  iMaxFlgSegregaCre2     := iFlgSegregaCMCre;
                  sMaxNomeContaDeb2      := sNomeContaDeb;
                  sMaxNomeContaCre2      := sNomeContaCre;
                  sMaxObrigaSubContaDeb2 := sObrigaSubContaDeb;
                  sMaxObrigaSubContaCre2 := sObrigaSubContaCre;
                  sMaxTipConvOfiDeb2     := sTipConvOfiDeb;
                  sMaxTipConvOfiCre2     := sTipConvOfiCre;
                  sMaxTipConvGerDeb2     := sTipConvGerDeb;
                  sMaxTipConvGerCre2     := sTipConvGerCre;
                  //-------------------------------------------------------------------
                  sMaxCCustoDeb2         := sCcDeb;
                  sMaxCCustoCre2         := sCcCre;
                  nMaxCCusto2            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
                //----------------------------------------------------------------------
                if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, sCreditoCM, sCcDeb, sCcCre,
                                             iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                             Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                             Trunc(nBem), Trunc(nGrupo), sGrupo, nValLanc,
                                             sNomeContaDeb,sObrigaSubContaDeb,
                                             sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                             sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                             sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
              end;
          end;
          //----------------------------------------------------------------------------
          if nBaixaD <> 0 then
          begin
            if nParticip3 < 100 then
            begin
              Case iTipoFechamento of
                0 : sHistor1 := CMTranslate('Baixa Depreciação ') + sMensErro;
                1 : sHistor1 := CMTranslate('Baixa Amortização ') + sMensErro;
              end;
              //----------------------------------------------------------------------
              // Montagem da Partida Dobrada
              //----------------------------------------------------------------------
              sCCDeb := '';
              sCCCre := '';
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //-------------------------------------------------------------------
                // Busca conta a débito
                //-------------------------------------------------------------------
                bOk := True;
                if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb)
                else
                  if iTipoMov3 = 71 then
                    sDebitoD := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb);
                //-------------------------------------------------------------------
                if (not bOk) or (sDebitoD = '') then
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa da Depreciação do Custo no Grupo ') + sGrupo +
                                         CMTranslate(' no Centro de Custo ') + sCCDeb +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
                end;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Débito é válida
                //----------------------------------------------------------------------
                if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                      sDebitoD, False, False) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end;
                sNomeContaDeb      := ContaContab.NomeConta;
                sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                sTipConvGerDeb     := ContaContab.TipoConvGeren;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Débito obriga centro de custo
                //----------------------------------------------------------------------
                if sObrigaCcDeb = 'S' then
                begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoD,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end
                  else
                  begin
                    sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                    nParticip3 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
                end;
                //----------------------------------------------------------------------
                // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                //----------------------------------------------------------------------
                if bCtaxCCusto then
                begin
                  sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //-------------------------------------------------------------------
                  bOk := True;
                  if sPlaContaDestino = '' then
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre)
                  else

                  if iTipoMov3 <> 71 then
                    sCreditoD := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre);

                  //-------------------------------------------------------------------
                  if (not bOk) or (sCreditoD = '') then
                    raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa da Depreciação do Custo no Grupo ') + sGrupo +
                                           CMTranslate('no Centro de Custo ')+sCCCre +
                                           CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                           CMTranslate(' não cadastrada !')+sMensErro);
                end;

                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Crédito é válida
                //----------------------------------------------------------------------
                if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                      sCreditoD, False, False) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end;

                sNomeContaCre      := ContaContab.NomeConta;
                sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                sTipConvOfiCre     := ContaContab.TipoConvOfi;
                sTipConvGerCre     := ContaContab.TipoConvGeren;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Crédito obriga centro de custo
                //----------------------------------------------------------------------
                if sObrigaCcCre = 'S' then
                begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoD,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end
                  else
                  begin
                    sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                    nParticip3 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
                end;
                //----------------------------------------------------------------------
                if (sCCDeb = '') and (sCCCre = '') then
                  nParticip3 := 100;
                //----------------------------------------------------------------------
                nValLanc := ConvNum((nBaixaD * nParticip3) / 100);
                nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
                //----------------------------------------------------------------------
                // Acumula os valores proporcionais e apura o centro de custo
                // com a maior proporção
                //----------------------------------------------------------------------
                nSomaRateios3 := ConvNum(nSomaRateios3 + nValLanc);

                if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto3 then
                begin
                  sMaxDebito3            := sDebitoD;
                  sMaxCredito3           := sCreditoD;
                  iMaxFlgSegregaDeb3     := iFlgSegregaDDeb;
                  iMaxFlgSegregaCre3     := iFlgSegregaDCre;
                  sMaxNomeContaDeb3      := sNomeContaDeb;
                  sMaxNomeContaCre3      := sNomeContaCre;
                  sMaxObrigaSubContaDeb3 := sObrigaSubContaDeb;
                  sMaxObrigaSubContaCre3 := sObrigaSubContaCre;
                  sMaxTipConvOfiDeb3     := sTipConvOfiDeb;
                  sMaxTipConvOfiCre3     := sTipConvOfiCre;
                  sMaxTipConvGerDeb3     := sTipConvGerDeb;
                  sMaxTipConvGerCre3     := sTipConvGerCre;
                  //-------------------------------------------------------------------
                  sMaxCCustoDeb3         := sCcDeb;
                  sMaxCCustoCre3         := sCcCre;
                  nMaxCCusto3            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
                //----------------------------------------------------------------------
                if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, sCreditoD, sCcDeb, sCcCre,
                                             iFlgSegregaDDeb, iFlgSegregaDCre,
                                             Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                             Trunc(nBem), Trunc(nGrupo), sGrupo, abs(nValLanc),
                                             sNomeContaDeb,sObrigaSubContaDeb,
                                             sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                             sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                             sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
              end;
          end;
          //----------------------------------------------------------------------------
          if nBaixaCMD <> 0 then
          begin
            if nParticip4 < 100 then
            begin
              Case iTipoFechamento of
                0 : sHistor1 := CMTranslate('Baixa Depreciação ') + sMensErro;
                1 : sHistor1 := CMTranslate('Baixa Amortização ') + sMensErro;
              end;
              //----------------------------------------------------------------------
              // Montagem da Partida Dobrada
              //----------------------------------------------------------------------
              sCCDeb := '';
              sCCCre := '';

              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //-------------------------------------------------------------------
                // Busca conta a débito
                //-------------------------------------------------------------------
                bOk := True;

                if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb)
                else
                  if iTipoMov3 = 71 then
                    sDebitoCMD := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb);
                //-------------------------------------------------------------------
                if (not bOk) or (sDebitoCMD = '') then
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Baixa da Correção Monetária da Depreciação do Custo no Grupo ') + sGrupo +
                                         CMTranslate(' no Centro de Custo ')+sCCDeb+
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                         CMTranslate(' não cadastrada !')+sMensErro);
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebitoCMD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;

              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;

              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCMD,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip4 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end;
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //-------------------------------------------------------------------
                bOk := True;

                if sPlaContaDestino = '' then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre)
                else
                  if iTipoMov3 <> 71 then
                    sCreditoCMD := sPlaContaDestino
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre);
                //-------------------------------------------------------------------
                if (not bOk) or (sCreditoCMD = '') then
                  raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Baixa da Correção Monetária da Depreciação do Custo no Grupo ') + sGrupo +
                                         CMTranslate('no Centro de Custo ') + sCCCre +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                         CMTranslate(' não cadastrada !') + sMensErro);
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sCreditoCMD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;

              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCMD,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip4 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end;
              //----------------------------------------------------------------------
              if (sCCDeb = '') and (sCCCre = '') then
                nParticip4 := 100;
              //----------------------------------------------------------------------
              nValLanc := ConvNum((nBaixaCMD * nParticip4) / 100);
              nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
              //----------------------------------------------------------------------
              // Acumula os valores proporcionais e apura o centro de custo
              // com a maior proporção
              //----------------------------------------------------------------------
              nSomaRateios4 := ConvNum(nSomaRateios4 + nValLanc);
              if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto4 then
              begin
                sMaxDebito4            := sDebitoCMD;
                sMaxCredito4           := sCreditoCMD;
                iMaxFlgSegregaDeb4     := iFlgSegregaCMDDeb;
                iMaxFlgSegregaCre4     := iFlgSegregaCMDCre;
                sMaxNomeContaDeb4      := sNomeContaDeb;
                sMaxNomeContaCre4      := sNomeContaCre;
                sMaxObrigaSubContaDeb4 := sObrigaSubContaDeb;
                sMaxObrigaSubContaCre4 := sObrigaSubContaCre;
                sMaxTipConvOfiDeb4     := sTipConvOfiDeb;
                sMaxTipConvOfiCre4     := sTipConvOfiCre;
                sMaxTipConvGerDeb4     := sTipConvGerDeb;
                sMaxTipConvGerCre4     := sTipConvGerCre;
                //-------------------------------------------------------------------
                sMaxCCustoDeb4         := sCcDeb;
                sMaxCCustoCre4         := sCcCre;
                nMaxCCusto4            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
              end;
              //----------------------------------------------------------------------
              if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, sCreditoCMD, sCcDeb, sCcCre,
                                           iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                           Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                           Trunc(nBem), Trunc(nGrupo), sGrupo, nValLanc,
                                           sNomeContaDeb,sObrigaSubContaDeb,
                                           sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                           sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                           sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                Raise Exception.Create(MessageInfo);
            end;
          end;
          //----------------------------------------------------------------------------
          FcdsCcRD.Next;
        end;
        FcdsCcRD.Close;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios1 - nBaixaB) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                       iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupo), sGrupo,
                                       ConvNum(nSomaRateios1 - nBaixaB),
                                       sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                       sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                       sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                       sMaxTipConvOfiCre1,sMaxTipConvGerCre1,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios2 - nBaixaCMB) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito2, sMaxCredito2, sMaxCcustoDeb2, sMaxCcustoCre2,
                                       iMaxFlgSegregaDeb2, iMaxFlgSegregaCre2,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupo), sGrupo,
                                       ConvNum(nSomaRateios2 - nBaixaCMB),
                                       sMaxNomeContaDeb2, sMaxObrigaSubContaDeb2,
                                       sMaxNomeContaCre2, sMaxObrigaSubContaCre2,
                                       sMaxTipConvOfiDeb2, sMaxTipConvGerDeb2,
                                       sMaxTipConvOfiCre2,sMaxTipConvGerCre2,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios3 - nBaixaD) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito3, sMaxCredito3, sMaxCcustoDeb3, sMaxCcustoCre3,
                                       iMaxFlgSegregaDeb3, iMaxFlgSegregaCre3,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupo), sGrupo,
                                       ConvNum(nSomaRateios3 - nBaixaD),
                                       sMaxNomeContaDeb3, sMaxObrigaSubContaDeb3,
                                       sMaxNomeContaCre3, sMaxObrigaSubContaCre3,
                                       sMaxTipConvOfiDeb3, sMaxTipConvGerDeb3,
                                       sMaxTipConvOfiCre3,sMaxTipConvGerCre3,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios4 - nBaixaCMD) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito4, sMaxCredito4, sMaxCcustoDeb4, sMaxCcustoCre4,
                                       iMaxFlgSegregaDeb4, iMaxFlgSegregaCre4,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupo), sGrupo,
                                       ConvNum(nSomaRateios4 - nBaixaCMD),
                                       sMaxNomeContaDeb4, sMaxObrigaSubContaDeb4,
                                       sMaxNomeContaCre4, sMaxObrigaSubContaCre4,
                                       sMaxTipConvOfiDeb4, sMaxTipConvGerDeb4,
                                       sMaxTipConvOfiCre4,sMaxTipConvGerCre4,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        Result := True;
    except
      on E : Exception do
      begin
        MessageInfo := E.Message;
        Result := False;
      end;
    end;
  finally
    FcdsCcRd.Free;
  end;
end;

function TCtrlImobCAFxContab.ContabilizaCorrecaoMonetaria(iModulo,
  iEmpresa, iBem, iGrupo, iConjunto, iAtivProjeto, iSubConta: Integer;
  sPlaca, sDesBem, sGrupo: String; dDataLanc: TDatetime; nCmBem,
  nCmDep: Extended; sTipoTab: String; iExercicio,
  iPeriodo: Integer): Boolean;
var
   iTipoMov, iPlanoConta,
   iFlgSegregaCMDeb, iFlgSegregaCMCre  : Integer;
   nValCM, nValLanc, nParticip1        : Extended;
   sDebitoCM, sCreditoCM,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre,
   sTipoMov                            : String;
   FcdsCcRD                            : TClientDataSet;
begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  try
    try
      //-------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(iEmpresa) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
      //-------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //-------------------------------------------------------------------------------
      iPlanoConta := ParamCAF.PLANOVIGENTE;
      //-------------------------------------------------------------------------------
      // Resolve qual é a correção monetária que será contabilizada
      //-------------------------------------------------------------------------------
      if (sTipoTab = 'B') or (sTipoTab = 'FB') then
      begin
        if nCmBem <> 0 then
        begin
          iTipoMov := 15;
          sTipoMov := CMTranslate('do Custo de Aquisição');
          nValCM   := nCmBem;
        end
        else
          if nCmDep <> 0 then
          begin
            iTipoMov := 21;
            sTipoMov := CMTranslate('da Depreciação do Custo de Aquisição');
            nValCM   := nCmDep;
          end
          else
          begin
            iTipoMov := 15;
            sTipoMov := '';
            nValCM   := 0;
          end;
      end
      else
        if (sTipoTab = 'R') or (sTipoTab = 'FR') then
        begin
          if nCmBem <> 0 then
          begin
            iTipoMov := 22;
            sTipoMov := CMTranslate('do Saldo de Reavaliação');
            nValCM   := nCmBem;
          end
          else
            if nCmDep <> 0 then
            begin
              iTipoMov := 19;
              sTipoMov := CMTranslate('da Depreciação do Saldo de Reavaliação');
              nValCM   := nCmDep;
            end
            else
            begin
              iTipoMov := 15;
              sTipoMov := '';
              nValCM   := 0;
            end;
        end
        else
          if (sTipoTab = 'A') or (sTipoTab = 'FA') then
          begin
            if nCmBem <> 0 then
            begin
              iTipoMov := 34;
              sTipoMov := CMTranslate('do Acréscimo de Valor');
              nValCM   := nCmBem;
            end
            else
              if nCmDep <> 0 then
              begin
                iTipoMov := 36;
                sTipoMov := CMTranslate('da Depreciação do Acréscimo de Valor');
                nValCM   := nCmDep;
              end
              else
              begin
                iTipoMov := 15;
                sTipoMov := '';
                nValCM   := 0;
              end;
          end
          else
          begin
            iTipoMov := 15;
            sTipoMov := '';
            nValCM   := 0;
          end;
        //-------------------------------------------------------------------------------
        // Busca conta a débito para a Correção Monetária
        //-------------------------------------------------------------------------------
        if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb) then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Correção Monetária ') + sTipoMov +
                         CMTranslate(' no Grupo ') + sGrupo +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) + CMTranslate(' não cadastrada !');
          Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        // Busca conta a crédito para a Correção Monetária
        //-------------------------------------------------------------------------------
        if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre) then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Correção Monetária ') + sTipoMov +
                         CMTranslate(' no Grupo ') + sGrupo +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) + CMTranslate(' não cadastrada !');
          Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        // Processamento do Rateio dos Custos
        //-------------------------------------------------------------------------------
        if (sTipoTab = 'B') or (sTipoTab = 'R') or (sTipoTab = 'A') then
        begin
          sHistor2 := trim(sPlaca);
          if iModulo in [54,64,135] then
            sHistor2 := sHistor2 + BuscaCodigoImovel(iBem);
          sHistor3 := trimleft(copy(sDesBem, 1,40));
          sHistor4 := trimleft(copy(sDesBem,41,80));
        end
        else
        begin
          sHistor2 := sGrupo;
          sHistor3 := '';
          sHistor4 := '';
        end;
          sHistor5   := '';
          sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
          nParticip1 := 0;
          //-------------------------------------------------------------------------------
          // Busca Rateio de Custos do Bem
          //-------------------------------------------------------------------------------
          FcdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
          while not FcdsCcRD.EOF do
          begin
            if nParticip1 < 100 then
            begin
              sHistor1 := CMTranslate('Correção Monetária ') + sTipoMov;
              //-------------------------------------------------------------------------
              // Montagem da Partida Dobrada
              //-------------------------------------------------------------------------
              sCCDeb := '';
              sCCCre := '';
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //-------------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                    sDebitoCM, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
                sNomeContaDeb      := ContaContab.NomeConta;
                sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                sTipConvGerDeb     := ContaContab.TipoConvGeren;
                //-------------------------------------------------------------------------
                // Verifica se a conta contábil a Débito obriga centro de custo
                //-------------------------------------------------------------------------
                if sObrigaCcDeb = 'S' then
                begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sDebitoCM,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end
                  else
                  begin
                    sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                    nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
                end;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //-------------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                    sCreditoCM, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //-------------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sCreditoCM,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end;
              //-------------------------------------------------------------------------
              if (sCCDeb = '') and (sCCCre = '') then
                nParticip1 := 100;
              //-------------------------------------------------------------------------
              nValLanc := ConvNum((nValCM * nParticip1) / 100);
              nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
              //-------------------------------------------------------------------------
              if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta, sDebitoCM, sCreditoCM, sCcDeb, sCcCre,
                                           iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                           iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo,
                                           sGrupo, nValLanc,sNomeContaDeb,sObrigaSubContaDeb,
                                           sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                           sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                           sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                Raise Exception.Create(MessageInfo);
          end;
          //----------------------------------------------------------------------------
          FcdsCcRD.Next;
        end;
        FcdsCcRD.Close;
    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        Result := False;
      end;
    end;
  finally
    FcdsCcRD.Free;
  end;
end;

function TCtrlImobCAFxContab.ContabilizaDepreciacao(iModulo, iEmpresa,
  iBem, iGrupo, iConjunto, iAtivProjeto, iSubConta: Integer; sPlaca,
  sDesBem, sGrupo: String; dDataLanc: TDatetime; nDepLanc: Extended;
  sTipoTab: String; iExercicio, iPeriodo: Integer; bSomenteImoveis,
  bCtaxCCusto: Boolean): Boolean;
var
   iTipoMov, iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre      : Integer;
   nValLanc                            : Currency;
   nParticip1                          : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre,
   sTipoMov                            : String;
   FcdsCcRD                            : TClientDataSet;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxCCustoDeb1, sMaxCCustoCre1          : String;
   nMaxCCusto1, nSomaRateios1              : Extended;
   //------------
   iTipoFechamento                         : Byte;
begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  iTipoFechamento := buscaFlagTipoFechamento(iGrupo);
  try
    try
      //-------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(iEmpresa) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
      //-------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //-------------------------------------------------------------------------------
      iPlanoConta := ParamCAF.PLANOVIGENTE;
      //-------------------------------------------------------------------------------
      // Resolve qual é a Depreciação que será contabilizada
      //-------------------------------------------------------------------------------
      if (sTipoTab = 'B') or (sTipoTab = 'FB') then
      begin
        iTipoMov := 14;
        sTipoMov := CMTranslate('do Custo de Aquisição');
      end
      else
        if (sTipoTab = 'R') or (sTipoTab = 'FR') then
        begin
          if nDepLanc > 0 then
          begin
            iTipoMov := 18;
            sTipoMov := CMTranslate('do Saldo de Reavaliação');
          end
          else
          begin
            iTipoMov := 69;
            sTipoMov := CMTranslate('do Saldo de Reavaliação Negativa');
          end;
        end
        else
          if (sTipoTab = 'A') or (sTipoTab = 'FA') then
          begin
            iTipoMov := 35;
            sTipoMov := CMTranslate('do Acréscimo de Valor');
          end
          else
          begin
            iTipoMov := 00;
            sTipoMov := '';
          end;
          //-------------------------------------------------------------------------------
          // Contas Contábeis não são definidas pelos Centros de Custo
          //-------------------------------------------------------------------------------
          if not bCtaxCCusto then
          begin
            //----------------------------------------------------------------------------
            // Busca conta a débito para a Depreciação
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
            begin
               MessageInfo := CMTranslate('Conta a Débito para o Movimento de Depreciação ') + sTipoMov +
                              CMTranslate(' no Grupo ') + sGrupo +
                              CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) + CMTranslate(' não cadastrada !');
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Busca conta a crédito para a Depreciação
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCredito, iFlgSegregaCre) then
            begin
               MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Depreciação ') + sTipoMov +
                              CMTranslate(' no Grupo ') + sGrupo +
                              CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) + CMTranslate(' não cadastrada !');
               Raise Exception.Create(MessageInfo);
            end;
          end;
          //-------------------------------------------------------------------------------
          // Processamento do Rateio dos Custos
          //-------------------------------------------------------------------------------
          if (sTipoTab = 'B') or (sTipoTab = 'R') or (sTipoTab = 'A') then
          begin
            sHistor2 := trim(sPlaca);
            if iModulo in [54,64,135] then
              sHistor2 := sHistor2 + BuscaCodigoImovel(iBem);
            sHistor3 := trimleft(copy(sDesBem, 1,40));
            sHistor4 := trimleft(copy(sDesBem,41,80));
          end
          else
          begin
            sHistor2 := trim(sGrupo);
            sHistor3 := '';
            sHistor4 := '';
          end;
          sHistor5   := '';
          sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
          nParticip1 := 0;
          //-------------------------------------------------------------------------------
          // A diferença entre os valores contabilizados e a soma dos seus rateios deve
          // ser lançada no Centro de Custo com a maior proporção
          //-------------------------------------------------------------------------------
          nMaxCCusto1        := 0.000000;
          nSomaRateios1      := 0.00;
          iMaxFlgSegregaDeb1 := 0;
          iMaxFlgSegregaCre1 := 0;
          //-------------------------------------------------------------------------------
          // Busca Rateio de Custos do Bem
          //-------------------------------------------------------------------------------
          FcdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
          while not FcdsCcRD.EOF do
          begin
            if nParticip1 < 100 then
            begin
              Case iTipoFechamento of
                0 : sHistor1 := CMTranslate('Depreciação ') + sTipoMov;
                1 : sHistor1 := CMTranslate('Amortização ') + sTipoMov;
              end;
              //-------------------------------------------------------------------------
              // Montagem da Partida Dobrada
              //-------------------------------------------------------------------------
              sCCDeb := '';
              sCCCre := '';
              //-------------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //-------------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //----------------------------------------------------------------------
                if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
                begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Depreciação ') + sTipoMov +
                                 CMTranslate(' no Grupo ') + sGrupo + CMTranslate(' no Centro de Custo ') + sCCDeb +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) + CMTranslate(' não cadastrada !');
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //-------------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                    sDebito, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //-------------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sDebito,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end
              else
                sCCDeb := '';
              //-------------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //-------------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                //----------------------------------------------------------------------
                if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
                begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Depreciação ') + sTipoMov +
                                 CMTranslate(' no Grupo ') + sGrupo + CMTranslate(' no Centro de Custo ') + sCCCre +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +CMTranslate(' não cadastrada !');
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //-------------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                    sCredito, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;
              //-------------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //-------------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sCredito,
                                                 FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                end;
              end
              else
                sCCCre := '';
              //-------------------------------------------------------------------------
              if (sCCDeb = '') and (sCCCre = '') then
                nParticip1 := 100;
              //-------------------------------------------------------------------------
              nValLanc := ConvNum((nDepLanc * nParticip1) / 100);
              nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
              //-------------------------------------------------------------------------
              // Acumula os valores proporcionais e apura o centro de custo
              // com a maior proporção
              //-------------------------------------------------------------------------
              nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
              if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
              begin
                sMaxDebito1            := sDebito;
                sMaxCredito1           := sCredito;
                iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
                iMaxFlgSegregaCre1     := iFlgSegregaCre;
                sMaxNomeContaDeb1      := sNomeContaDeb;
                sMaxNomeContaCre1      := sNomeContaCre;
                sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
                sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
                sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
                sMaxTipConvOfiCre1     := sTipConvOfiCre;
                sMaxTipConvGerDeb1     := sTipConvGerDeb;
                sMaxTipConvGerCre1     := sTipConvGerCre;
                //----------------------------------------------------------------------
                sMaxCCustoDeb1         := sCcDeb;
                sMaxCCustoCre1         := sCcCre;
                nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
              end;
              //-------------------------------------------------------------------------
              if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                           iFlgSegregaDeb, iFlgSegregaCre,
                                           iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo,
                                           sGrupo, abs(nValLanc),sNomeContaDeb,sObrigaSubContaDeb,
                                           sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                           sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                           sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                Raise Exception.Create(MessageInfo);
          end;
          //----------------------------------------------------------------------------
          FcdsCcRD.Next;
        end;
        FcdsCcRD.Close;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios1 - nDepLanc) <> 0 then
        begin
          if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta,
                                       sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                       iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                       iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo, sGrupo,
                                       ConvNum(nDepLanc - nSomaRateios1),
                                       sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                       sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                       sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                       sMaxTipConvOfiCre1,sMaxTipConvGerCre1,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
    except
      on E : Exception do
      begin
        MessageInfo := E.Message;
        Result := False;
      end;
    end;
  finally
    FcdsCcRD.Free;
  end;
end;

function TCtrlImobCAFxContab.ContabilizaDesmembramento(nModulo,
  nEmpresaProp, nBem, dDataLanc: TDateTime; nGrupoPai,
  nGrupoFilho: Extended; sGrupoPai, sGrupoFilho: String; nConjuntoPai,
  nConjuntoFilho: Extended; sCCustoPai, sCCustoFilho: String; nSubConta,
  nAtivProjeto: Extended; sTipoTab: String; nValorB, nValorCMB, nValorD,
  nValorCMD: Extended; sDesBemPai, sDesBemFilho, sPlacaPai,
  sPlacaFilho: String; iExercicio, iPeriodo: Integer;
  bCtaxCCusto: Boolean): Boolean;
type
   TRateio = Record
      CENTROCUSTOPAI    : String;
      CENTROCUSTOFILHO  : String;
      PARTICIPACAOPAI   : Extended;
      PARTICIPACAOFILHO : Extended;
   end;

var
   aCcRD : array [1..25] of TRateio;
   iMaxCcRD, iCcRD, iCcRDPai, iCcRDFilho  : Integer;
   //-------------------------------------------------------------------------------------
   FcdsCcRD                               : TClientDataSet;
   bOk, bProcessar                        : Boolean;
   iPlanoConta,
   iTipoMov1, iTipoMov2,
   iTipoMov3, iTipoMov4,
   iFlgSegregaDeb, iFlgSegregaCre,
   iFlgSegregaCMDeb, iFlgSegregaCMCre,
   iFlgSegregaDDeb, iFlgSegregaDCre,
   iFlgSegregaCMDDeb, iFlgSegregaCMDCre   : Integer;
   sMensErro, sObrigaCC,
   sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sHistor1, sHistor2, sHistor3,
   sHistor4, sHistor5,
   sNomeContaDeb, sObrigaCcDeb,
   sObrigaSubContaDeb,
   sTipConvOfiDeb, sTipConvGerDeb,
   sNomeContaCre, sObrigaCcCre,
   sObrigaSubContaCre,
   sTipConvOfiCre, sTipConvGerCre,
   sNumDoc, sCCDeb, sCCCre                : String;
   nParticip1, nParticip2, nParticip3,
   nParticip4, nParticip5, nParticip6,
   nParticip7, nParticip8,
   nFatorDeb, nFatorCre,
   nValLancDeb, nValLancCre               : Extended;
begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  try
    try
    //-------------------------------------------------------------------------------
    // Carga dos parâmetros do sistema
    //-------------------------------------------------------------------------------
    if not ParamCAF.CarregaProp(nEmpresaProp) then
      Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
    //-------------------------------------------------------------------------------
    // Captura o Plano de Contas Vigente
    //-------------------------------------------------------------------------------
    iPlanoConta := ParamCAF.PLANOVIGENTE;
    //-------------------------------------------------------------------------------
    // Seleciona qual é o componente do saldo que será processado
    //-------------------------------------------------------------------------------
    if sTipoTab = 'B' then
    begin
      iTipoMov1 := 01;
      iTipoMov2 := 15;
      iTipoMov3 := 14;
      iTipoMov4 := 21;
      sMensErro := '';
    end
    else
      if sTipoTab = 'R' then
      begin
        if nValorB > 0 then
        begin
          iTipoMov1 := 08;
        end
        else
        begin
          iTipoMov1 := 23;
        end;
        iTipoMov2 := 22;
        iTipoMov3 := 18;
        iTipoMov4 := 19;
        sMensErro := CMTranslate(' (Reavaliação) ');
      end
      else
      begin
        iTipoMov1 := 09;
        iTipoMov2 := 34;
        iTipoMov3 := 35;
        iTipoMov4 := 36;
        sMensErro := CMTranslate(' (Acréscimo) ');
      end;
      //-------------------------------------------------------------------------------
      // Contas Contábeis não definidas por Centros de Custo
      //-------------------------------------------------------------------------------
      if not bCtaxCCusto then
      begin
        if nValorB <> 0 then
        begin
        //-------------------------------------------------------------------------
        // Busca conta a débito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'C', iPlanoConta, sDebito, iFlgSegregaDeb);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoFilho +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                         CMTranslate(' não cadastrada !') + sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------
        // Busca conta a crédito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'D', iPlanoConta, sCredito, iFlgSegregaCre)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre);

        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoPai +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                         CMTranslate(' não cadastrada !') + sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
      end;
      //----------------------------------------------------------------------------
      if nValorCMB <> 0 then
      begin
        //-------------------------------------------------------------------------
        // Busca conta a débito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'C', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoFilho +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                         CMTranslate(' não cadastrada !') + sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------
        // Busca conta a crédito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'D', iPlanoConta, sCreditoCM, iFlgSegregaCMCre)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoPai +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                         CMTranslate(' não cadastrada !') + sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
      end;
      //----------------------------------------------------------------------------
      if nValorD <> 0 then
      begin
        //-------------------------------------------------------------------------
        // Busca conta a débito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'C', iPlanoConta, sDebitoD, iFlgSegregaDDeb)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoFilho +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                         CMTranslate(' não cadastrada !') + sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------
        // Busca conta a crédito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'D', iPlanoConta, sCreditoD, iFlgSegregaDCre);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoPai +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                         CMTranslate(' não cadastrada !') + sMensErro;
           Raise Exception.Create(MessageInfo);
        end;
      end;
      //----------------------------------------------------------------------------
      if nValorCMD <> 0 then
      begin
        //-------------------------------------------------------------------------
        // Busca conta a débito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'C', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoFilho +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                         CMTranslate(' não cadastrada !') + sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------
        // Busca conta a crédito
        //-------------------------------------------------------------------------
        if iTipoMov1 <> 23 then
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre)
        else
          bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'D', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre);
        if not bOk then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoPai +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                         CMTranslate(' não cadastrada !')+sMensErro;
          Raise Exception.Create(MessageInfo);
        end;
      end;
    end;
    //-------------------------------------------------------------------------------
    // Transfere para arrays os rateios de custo, para permitir que as transferências
    // de local sejam possíveis sem afetar a transação
    //-------------------------------------------------------------------------------
    FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjuntoPai);
    iMaxCcRD := 1;
    while not FcdsCcRD.EOF do
    begin
       aCcRD[iMaxCcRD].CENTROCUSTOPAI  := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
       aCcRD[iMaxCcRD].PARTICIPACAOPAI := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
       aCcRD[iMaxCcRD].CENTROCUSTOFILHO  := '';
       aCcRD[iMaxCcRD].PARTICIPACAOFILHO := 0;
       iMaxCcRD := iMaxCcRD + 1;
       FcdsCcRD.Next;
    end;
    //-------------------------------------------------------------------------------
    FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjuntoFilho);
    iCcRD := 1;
    while not FcdsCcRD.EOF do
    begin
      aCcRD[iCcRD].CENTROCUSTOFILHO  := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
      aCcRD[iCcRD].PARTICIPACAOFILHO := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
      iCcRD := iCcRD + 1;
      if iCcRD > iMaxCcRD then
      begin
        iMaxCcRD := iCcRD;
        aCcRD[iMaxCcRD].CENTROCUSTOPAI  := '';
        aCcRD[iMaxCcRD].PARTICIPACAOPAI := 0;
      end;
      FcdsCcRD.Next;
    end;
    FcdsCcRD.Close;
    //-------------------------------------------------------------------------------
    // Passa o Centro de Custo do Conjunto Filho, caso haja tranferência de local
    //-------------------------------------------------------------------------------
    if sCCustoFilho <> sCCustoPai then
    begin
      iCcRD := 1;
      while iCcRD < iMaxCcRD do
      begin
        if aCcRD[iCcRD].CENTROCUSTOFILHO = sCCustoPai then
          aCcRD[iCcRD].CENTROCUSTOFILHO := sCCustoFilho;
        iCcRD := iCcRD + 1;
      end;
    end;
    //-------------------------------------------------------------------------------
    // Verifica se existe mudanca de Conta Contabil e/ou Centro de Custo.
    // Caso não haja mudança, não gera planilha contabil.
    //-------------------------------------------------------------------------------
    bProcessar := True;
    if ((sDebito  = sCredito)  and (sDebitoCM  = sCreditoCM) and
        (sDebitoD = sCreditoD) and (sDebitoCMD = sCreditoCMD)) then
    begin
      bProcessar := False;
      //----------------------------------------------------------------------------
      // Verifica se existem centros de custos para as contas acima
      //----------------------------------------------------------------------------
      sObrigaCC := 'N';
      if sDebito <> '' then
      begin
        if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                              sDebito, False, False) then
        begin
          MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
          Raise Exception.Create(MessageInfo);
        end;
        sObrigaCc := ContaContab.ObrigaCentroCusto;
      end;
      if sObrigaCC = 'N' then
        if sDebitoCM <> '' then
        begin
          if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                sDebitoCM, False, False) then
          begin
            MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
            Raise Exception.Create(MessageInfo);
          end;
          sObrigaCc := ContaContab.ObrigaCentroCusto;
        end;
        if sObrigaCC = 'N' then
          if sCreditoD <> '' then
          begin
            if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                  sCreditoD, False, False) then
            begin
              MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
              Raise Exception.Create(MessageInfo);
            end;
            sObrigaCc := ContaContab.ObrigaCentroCusto;
          end;

        if sObrigaCC = 'N' then
          if sCreditoCMD <> '' then
            if sCreditoD <> '' then
            begin
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sCreditoCMD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sObrigaCc := ContaContab.ObrigaCentroCusto;
            end;
          //----------------------------------------------------------------------------
          if sObrigaCC = 'S' then
          begin
            iCcRDPai := 1;
            while iCcRDPai < iMaxCcRD do
            begin
              iCcRDFilho := 1;
              while iCcRDFilho < iMaxCcRD do
              begin
                if (aCcRD[iCcRDPai].CENTROCUSTOPAI <> aCcRD[iCcRDFilho].CENTROCUSTOFILHO) and
                   (aCcRD[iCcRDPai].CENTROCUSTOPAI <> '') and (aCcRD[iCcRDFilho].CENTROCUSTOFILHO <> '') then
                  bProcessar := True;
                iCcRDFilho  := iCcRDFilho  + 1;
              end;
              iCcRDPai := iCcRDPai + 1;
            end;
          end;
        end;
        if not bProcessar then
        begin
          Result := True;
          Exit;
        end;
        //-------------------------------------------------------------------------------
        // Processamento do Rateio dos Custos
        //-------------------------------------------------------------------------------
        sHistor1   := CMTranslate('Desmembramento de Bem');
        sHistor2   := trim(sPlacaPai);
        if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then
            sHistor2 := sHistor2 + BuscaCodigoImovel(Trunc(nBem));
         sHistor3   := trimleft(copy(sDesBemPai, 1,40));
         sHistor4   := trimleft(copy(sDesBemPai,41,80));
         sHistor5   := '';
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         //-------------------------------------------------------------------------------
         nParticip1 := 0;
         nParticip2 := 0;
         nParticip3 := 0;
         nParticip4 := 0;
         nParticip5 := 0;
         nParticip6 := 0;
         nParticip7 := 0;
         nParticip8 := 0;
         //-------------------------------------------------------------------------------
         // Processa a Baixa dos valores da Conta Contábil / Centro de Custo Atuais
         //-------------------------------------------------------------------------------
         iCcRD := 1;
         while iCcRD < iMaxCcRD do
         begin
            //----------------------------------------------------------------------------
            // Custo
            //----------------------------------------------------------------------------
            if nValorB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip1 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'C', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebito, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip1 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip1 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip1 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip2 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'D', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCredito, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCCCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip2 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip2 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip2 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorB * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorB * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia do Custo de Aquisicao');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                                  iFlgSegregaDeb, iFlgSegregaCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai,abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, '', sCcDeb, '',
                                                  iFlgSegregaDeb, iFlgSegregaCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho,abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCredito, '', sCcCre,
                                                  iFlgSegregaDeb, iFlgSegregaCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai,abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Correção Monetária
            //----------------------------------------------------------------------------
            if nValorCMB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip3 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'C', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCM,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip3 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip3 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip3 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip4 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'D', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCM,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip4 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip4 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip4 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorCMB * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorCMB * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia da Correcao Monetaria');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, sCreditoCM, sCcDeb, sCcCre,
                                                  iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, '', sCcDeb, '',
                                                  iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoCM, '', sCcCre,
                                                  iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Depreciação
            //----------------------------------------------------------------------------
            if nValorD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip5 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'C', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoD,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip5 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip5 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip5 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip6 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'D', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoD,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip6 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip6 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip6 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorD * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorD * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia da Depreciacao');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, sCreditoD, sCcDeb, sCcCre,
                                                  iFlgSegregaDDeb, iFlgSegregaDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai,abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, '', sCcDeb, '',
                                                  iFlgSegregaDDeb, iFlgSegregaDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai,abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoD, '', sCcCre,
                                                  iFlgSegregaDDeb, iFlgSegregaDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Correção Monetária da Depreciacao
            //----------------------------------------------------------------------------
            if nValorCMD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip7 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'C', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCMD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCMD,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip7 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip7 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip7 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip8 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'D', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCMD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCMD,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip8 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip8 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip8 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorCMD * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorCMD * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia da Correção Monetária da Depreciacao');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, sCreditoCMD, sCcDeb, sCcCre,
                                                  iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, '', sCcDeb, '',
                                                  iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoCMD, '', sCcCre,
                                                  iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            iCcRD := iCcRD + 1;
         end;
         Result := True;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      FcdsCcRd.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaEncerraObra(nModulo, nEmpresaProp,
  nBem, nConjunto, nGrupoObra, nGrupoBem: Extended; sGrupoObra,
  sGrupoBem: String; iExercicio, iPeriodo: Integer; dDataLanc: TDateTime;
  nValor: Extended; sDescObra, sDescBem: String; nAtivProjeto, nSubConta,
  nPlaca: Extended; bCtaxCCusto: Boolean): boolean;
var
   FcdsCcRD                            : TClientDataSet;
   iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre      : Integer;
   nValLanc, nParticip1                : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre      : String;

begin
   Result := False;
   FcdsCcRD := TClientDataSet.Create(nil);
   try
      try
         //-------------------------------------------------------------------------------
         // Carga dos parametros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;
         //-------------------------------------------------------------------------------
         // Contas Contábeis não são definidas pelos Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
            //----------------------------------------------------------------------------
            // Busca conta a débito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoBem), 01, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
            begin
               MessageInfo := CMTranslate('Conta a Débito para o Movimento de Entrada no Grupo ') +
                              sGrupoBem + CMTranslate(' não cadastrada !');
               Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoObra), 67, 'D', iPlanoConta, sCredito, iFlgSegregaCre) then
            begin
               MessageInfo := CMTranslate('Conta a Débito para o Movimento de Lançamentos em Obra no Grupo ') +
                              sGrupoObra + CMTranslate(' não cadastrada !');
               Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor2   := CMTranslate('Obra : ') + trimleft(copy(sDescObra, 1,33));
         sHistor3   := trimleft(copy(sDescObra,34,80));
         sHistor4   := CMTranslate('Bem : ') + trimleft(copy(sDescBem, 1,34));
         sHistor5   := trimleft(copy(sDescBem,35,80));
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         nParticip1 := 0;
         //-------------------------------------------------------------------------------
         // Busca Rateio de Custos do Bem
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjunto);
         while not FcdsCcRD.EOF do
         begin
            if nParticip1 < 100 then
            begin
               sHistor1 := CMTranslate('Encerramento de Obra');
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoBem), 01, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
                  begin
                     MessageInfo := CMTranslate('Conta a Débito para o Movimento de Entrada no Grupo ') +
                                    CMTranslate(' no Centro de Custo ') + sCCDeb + sGrupoBem + CMTranslate(' não cadastrada !');
                     Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sDebito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaDeb      := ContaContab.NomeConta;
               sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
               sTipConvOfiDeb     := ContaContab.TipoConvOfi;
               sTipConvGerDeb     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcDeb = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end else
                  sCCDeb := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoObra), 67, 'D', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
                  begin
                     MessageInfo := CMTranslate('Conta a Débito para o Lançamento em Obras ') +
                                    CMTranslate('no Grupo ') + sGrupoObra + CMTranslate(' no Centro de Custo ') + sCCCre + CMTranslate(' não cadastrada !');
                     Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sCredito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaCre      := ContaContab.NomeConta;
               sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaCre := ContaContab.ObrigaSubConta;
               sTipConvOfiCre     := ContaContab.TipoConvOfi;
               sTipConvGerCre     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcCre = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end else
                  sCCCre := '';
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  nParticip1 := 100;
               //-------------------------------------------------------------------------
               nValLanc := ConvNum((nValor * nParticip1) / 100);
               nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                            iFlgSegregaDeb, iFlgSegregaCre,
                                            Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                            Trunc(nBem), Trunc(nGrupoBem), sGrupoBem, nValLanc,
                                            sNomeContaDeb,sObrigaSubContaDeb,
                                            sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                            sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                            sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsCcRD.Next;
         end;
         FcdsCcRD.Close;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      FcdsCcRD.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaEntrada(iModulo, iEmpresa, iBem,
  iGrupo, iConjunto, iAtivProjeto, iSubConta: Integer; sPlaca, sDesBem,
  sGrupo: String; dDataLanc: TDateTime; nValOrg: Extended; iExercicio,
  iPeriodo: Integer; bCtaxCCusto: Boolean): Boolean;
var
   iTipoMov1, iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre          : Integer;
   nParticip1, nValLanc                    : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre          : String;
   FcdsCcRD                                : TClientDataSet;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxCCustoDeb1, sMaxCCustoCre1          : String;
   nMaxCCusto1, nSomaRateios1              : Extended;

begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  try
    try
      iTipoMov1 := 01;
      //-------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(iEmpresa) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
      //-------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //-------------------------------------------------------------------------------
      iPlanoConta := ParamCAF.PLANOVIGENTE;
      //-------------------------------------------------------------------------------
      // Contas Contábeis não definidas por Centros de Custo
      //-------------------------------------------------------------------------------
      if not bCtaxCCusto then
      begin
      //----------------------------------------------------------------------------
      // Busca conta a débito para o custo de Entrada do Bem
      //----------------------------------------------------------------------------
        if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Entrada no Grupo ') + sGrupo +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
          Raise Exception.Create(MessageInfo);
        end;
        //----------------------------------------------------------------------------
        // Busca conta a crédito para o custo de Entrada do Bem
        //----------------------------------------------------------------------------
        if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre) then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Entrada no Grupo ') + sGrupo +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
          Raise Exception.Create(MessageInfo);
        end;
      end;
      //-------------------------------------------------------------------------------
      // Composição do Histórico Contábil
      //-------------------------------------------------------------------------------
      sHistor2 := Trim(sPlaca);

      if iModulo in [54,64,135] then                                      // InvestImob
        sHistor2 := sHistor2 + ' ' + BuscaCodigoImovel(iBem);
      //-------------------------------------------------------------------------------
      sHistor3 := trimleft(copy(sDesBem, 1,40));
      sHistor4 := trimleft(copy(sDesBem,41,80));
      sHistor5 := '';
      sNumDoc := FormatDateTime('yyyymmdd',dDataLanc);
      //-------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //-------------------------------------------------------------------------------
      nParticip1 := 0;
      //-------------------------------------------------------------------------------
      // A diferença entre os valores contabilizados e a soma dos seus rateios deve
      // ser lançada no Centro de Custo com a maior proporção
      //-------------------------------------------------------------------------------
      nMaxCCusto1 := 0.000000;
      nSomaRateios1 := 0.00;
      iMaxFlgSegregaDeb1 := 0;
      iMaxFlgSegregaCre1 := 0;
      //-------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //-------------------------------------------------------------------------------
      FcdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
      while not FcdsCcRD.EOF do
      begin
        if nParticip1 < 100 then
        begin
          sHistor1 := CMTranslate('Entrada de Bem ');
          //-------------------------------------------------------------------------
          // Montagem da Partida Dobrada do Custo
          //-------------------------------------------------------------------------
          sCCDeb := '';
          sCCCre := '';
          //-------------------------------------------------------------------------
          // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
          //-------------------------------------------------------------------------
          if bCtaxCCusto then
          begin
            sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
            //----------------------------------------------------------------------
            // Busca conta a débito
            //----------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Movimento de Entrada no Grupo ') + sGrupo +
                             CMTranslate(' no Centro de Custo ') + sCCDeb +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Débito é válida
          //-------------------------------------------------------------------------
          if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                sDebito, False, False) then
          begin
            MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
            Raise Exception.Create(MessageInfo);
          end;
          sNomeContaDeb      := ContaContab.NomeConta;
          sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
          sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
          sTipConvOfiDeb     := ContaContab.TipoConvOfi;
          sTipConvGerDeb     := ContaContab.TipoConvGeren;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Débito obriga centro de custo
          //-------------------------------------------------------------------------
          if sObrigaCcDeb = 'S' then
          begin
            if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sDebito,
                                             FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
            begin
              MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
              Raise Exception.Create(MessageInfo);
            end
            else
            begin
              sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
              nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
            end;
          end;
          //-------------------------------------------------------------------------
          // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
          //-------------------------------------------------------------------------
          if bCtaxCCusto then
          begin
            sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
            //----------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
            begin
              MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Entrada no Grupo ') + sGrupo +
                             CMTranslate(' no Centro de Custo ') + sCCCre +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Crédito é válida
          //-------------------------------------------------------------------------
          if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                sCredito, False, False) then
          begin
            MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
            Raise Exception.Create(MessageInfo);
          end;
          sNomeContaCre      := ContaContab.NomeConta;
          sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
          sObrigaSubContaCre := ContaContab.ObrigaSubConta;
          sTipConvOfiCre     := ContaContab.TipoConvOfi;
          sTipConvGerCre     := ContaContab.TipoConvGeren;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Crédito obriga centro de custo
          //-------------------------------------------------------------------------
          if sObrigaCcCre = 'S' then
          begin
            if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sCredito,
                                             FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
            begin
              MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
              Raise Exception.Create(MessageInfo);
            end
            else
            begin
              sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
              nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
            end;
          end;
          //-------------------------------------------------------------------------
          if (sCCDeb = '') and (sCCCre = '') then
            nParticip1 := 100;
          //-------------------------------------------------------------------------
          nValLanc := ConvNum((nValOrg * nParticip1) / 100);
          nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
          //-------------------------------------------------------------------------
          // Acumula os valores proporcionais e apura o centro de custo
          // com a maior proporção
          //-------------------------------------------------------------------------
          nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
          if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
          begin
            sMaxDebito1            := sDebito;
            sMaxCredito1           := sCredito;
            iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
            iMaxFlgSegregaCre1     := iFlgSegregaCre;
            sMaxNomeContaDeb1      := sNomeContaDeb;
            sMaxNomeContaCre1      := sNomeContaCre;
            sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
            sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
            sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
            sMaxTipConvOfiCre1     := sTipConvOfiCre;
            sMaxTipConvGerDeb1     := sTipConvGerDeb;
            sMaxTipConvGerCre1     := sTipConvGerCre;
          //----------------------------------------------------------------------
            sMaxCCustoDeb1         := sCcDeb;
            sMaxCCustoCre1         := sCcCre;
            nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
          end;
          //-------------------------------------------------------------------------
          if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                       iFlgSegregaDeb, iFlgSegregaCre,
                                       iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo,
                                       sGrupo, nValLanc,sNomeContaDeb,sObrigaSubContaDeb,
                                       sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                       sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
          end;
          //----------------------------------------------------------------------------
          FcdsCcRD.Next;
        end;
        FcdsCcRD.Close;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios1 - nValOrg) <> 0 then
        begin
          if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta,
                                       sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                       iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                       iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo, sGrupo,
                                       ConvNum(nSomaRateios1 - nValOrg),
                                       sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                       sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                       sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                       sMaxTipConvOfiCre1,sMaxTipConvGerCre1,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        Result := False;
      end;
    end;
  finally
    FcdsCcRD.Free;
  end;
end;

function TCtrlImobCAFxContab.ContabilizaLancObra(nModulo, nEmpresaProp,
  nUsuario, nCafObra, nGrupo: Extended; iExercicio, iPeriodo: Integer;
  dDataLanc: TDateTime; nValOfi: Extended; sGrupo, sDescObra: String;
  nAtivProjeto, nSubConta: Extended; bCtaxCCusto: Boolean; iIdimovel: Integer): Extended;
const
   iTipoMovimentacao = 67;

var
   iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre      : Integer;
   nValLanc, nParticip1, nPlanilha     : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre      : String;
   FcdsCcRD                            : TClientDataSet;
begin
   Result := 0;
   FcdsCcRD := TClientDataSet.Create(nil);
   try
      try
         //-------------------------------------------------------------------------------
         // Inicializa a query de montagem da Planilha Contábil
         //-------------------------------------------------------------------------------
         if not InicializaMontaContab then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Carga dos parametros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;

         //-------------------------------------------------------------------------------
         // Contas Contábeis não são definidas pelos Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
          //----------------------------------------------------------------------------
          // Busca conta a débito
          //----------------------------------------------------------------------------
          if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMovimentacao, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Lançamento de Valores em Obras ') +
                             CMTranslate('no Grupo ') + sGrupo + CMTranslate(' não cadastrada !');
              Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMovimentacao, 'C', iPlanoConta, sCredito, iFlgSegregaCre) then
            begin
               MessageInfo := CMTranslate('Conta a Crédito para o Lançamento de Valores em Obras ') +
                              CMTranslate('no Grupo ') + sGrupo + CMTranslate(' não cadastrada !');
               Raise Exception.Create(MessageInfo);
            end;
          end;
          //-------------------------------------------------------------------------------
          // Processamento do Rateio dos Custos
          //-------------------------------------------------------------------------------
          sHistor2   := trimleft(copy(sDescObra, 1,40));
          sHistor3   := trimleft(copy(sDescObra,41,80));
          sHistor4   := '';
          if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then         // InvestImob
              sHistor4 := sHistor4 + BuscaCodigoImovel(-1, Trunc(nCafObra));
          sHistor5   := '';
          sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
          nParticip1 := 0;
          //-------------------------------------------------------------------------------
          // Busca Rateio de Custos do Bem
          //-------------------------------------------------------------------------------
          _dMTBem.sqlCafObraRateio.Prepare;
          _dMTBem.sqlCafObraRateio.ParamByName('IDCAFOBRA').AsFloat := nCafObra;
          _dMTBem.sqlCafObraRateio.ParamByName('IDPESSOA').AsFloat  := nEmpresaProp;
          FcdsCcRD.Data := _dMTBem.sqlCafObraRateio.Data;
          while not FcdsCcRD.EOF do
          begin
            if nParticip1 < 100 then
            begin
               sHistor1 := CMTranslate('Lancamento em Obra');
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMovimentacao, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
                  begin
                     MessageInfo := CMTranslate('Conta a Débito para o Lançamento em Obras ') +
                                    CMTranslate(' no Centro de Custo ') + sCCDeb + CMTranslate('no Grupo ') + sGrupo + CMTranslate(' não cadastrada !');
                     Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sDebito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaDeb      := ContaContab.NomeConta;
               sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
               sTipConvOfiDeb     := ContaContab.TipoConvOfi;
               sTipConvGerDeb     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcDeb = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end else
                  sCCDeb := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMovimentacao, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
                  begin
                     MessageInfo := CMTranslate('Conta a Crédito para o Lançamento em Obras ')+
                                    CMTranslate('no Grupo ') + sGrupo + CMTranslate(' no Centro de Custo ') + sCCCre + CMTranslate(' não cadastrada !');
                     Raise Exception.Create(MessageInfo);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sCredito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaCre      := ContaContab.NomeConta;
               sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaCre := ContaContab.ObrigaSubConta;
               sTipConvOfiCre     := ContaContab.TipoConvOfi;
               sTipConvGerCre     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcCre = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end else
                  sCCCre := '';
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  nParticip1 := 100;
               //-------------------------------------------------------------------------
               nValLanc := ConvNum((nValOfi * nParticip1) / 100);
               nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);

               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 1, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                            iFlgSegregaDeb, iFlgSegregaCre,
                                            Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                            Trunc(nCafObra), Trunc(nGrupo), sGrupo, nValLanc,
                                            sNomeContaDeb,sObrigaSubContaDeb,
                                            sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                            sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                            sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsCcRD.Next;
          end;
          FcdsCcRD.Close;
          //-------------------------------------------------------------------------------
          nPlanilha := RegistraPlanilhaContabil(nModulo, nEmpresaProp,
                                               //nUsuario,datetostr(dDataLanc), iIdimovel);
                                               nUsuario,datetostr(dDataLanc));
          if nPlanilha < 0 then
              Raise Exception.Create(MessageInfo);
          //-------------------------------------------------------------------------------
         Result := nPlanilha;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := -1;
         end;
      end;
   finally
      FcdsCcRD.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaReavalBaixa(nModulo, nEmpresaProp,
  nBem, dDataLanc: TDateTime; nGrupo: Extended; sGrupo: String;
  nConjunto: Extended; sCCusto: String; nSubConta, nAtivProjeto: Extended;
  sTipoTab: String; nValorB, nValorCMB, nValorD, nValorCMD: Extended;
  sDesBem, sPlaca: String; iExercicio, iPeriodo: Integer;
  bCtaxCCusto: Boolean): Boolean;
var
   FcdsCcRD                               : TClientDataSet;
   bOk, bProcessar                        : Boolean;
   iPlanoConta,
   iTipoMov1, iTipoMov2,
   iTipoMov3, iTipoMov4,
   iFlgSegregaDeb, iFlgSegregaCre,
   iFlgSegregaCMDeb, iFlgSegregaCMCre,
   iFlgSegregaDDeb, iFlgSegregaDCre,
   iFlgSegregaCMDDeb, iFlgSegregaCMDCre   : Integer;
   sMensErro, sObrigaCC,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sHistor1, sHistor2, sHistor3,
   sHistor4, sHistor5,
   sNomeContaDeb, sObrigaCcDeb,
   sObrigaSubContaDeb,
   sTipConvOfiDeb, sTipConvGerDeb,
   sNomeContaCre, sObrigaCcCre,
   sObrigaSubContaCre,
   sTipConvOfiCre, sTipConvGerCre,
   sNumDoc, sCCDeb, sCCCre                : String;
   nParticip1, nParticip2, nParticip3,
   nFatorDeb, nFatorCre,
   nValLanc                               : Extended;

   iTipoFechamento : Byte;
begin
   Result := True;
   FcdsCcRD := TClientDataSet.Create(nil);

   iTipoFechamento := buscaFlagTipoFechamento(trunc(nGrupo));
   try
      try
         //-------------------------------------------------------------------------------
         // Carga dos parametros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;
         //-------------------------------------------------------------------------------
         // Seleciona qual é o componente do saldo que será processado
         //-------------------------------------------------------------------------------
         iTipoMov1 := -1;
         iTipoMov2 := -1;
         iTipoMov3 := -1;
         iTipoMov4 := -1;
         //-------------------------------------------------------------------------------
         if sTipoTab = 'B' then
         begin
            iTipoMov1 := 01;
            iTipoMov2 := 15;
            iTipoMov3 := 14;
            iTipoMov4 := 21;
            sMensErro := '';
         end else
         if sTipoTab = 'R' then
         begin
            if (nValorB + nValorCMB) > 0 then
            begin
               iTipoMov1 := 08;
               iTipoMov2 := 22;
               iTipoMov3 := 18;
               iTipoMov4 := 19;
            end else
            if (nValorB + nValorCMB) < 0 then
            begin
               iTipoMov1 := 23;
               iTipoMov2 := 22;
               iTipoMov3 := 69;
               iTipoMov4 := 19;
            end;
            //----------------------------------------------------------------------------
            if (nValorD + nValorCMD) > 0 then
            begin
               iTipoMov1 := 08;
               iTipoMov2 := 22;
               iTipoMov3 := 18;
               iTipoMov4 := 19;
            end else
            if (nValorD + nValorCMD) < 0 then
            begin
               iTipoMov1 := 23;
               iTipoMov2 := 22;
               iTipoMov3 := 69;
               iTipoMov4 := 19;
            end;
            sMensErro := CMTranslate(' (Reavaliação) ');
         end else
         if sTipoTab = 'A' then
         begin
            iTipoMov1 := 09;
            iTipoMov2 := 34;
            iTipoMov3 := 35;
            iTipoMov4 := 36;
            sMensErro := CMTranslate(' (Acréscimo) ');
         end;
         //-------------------------------------------------------------------------------
         // Contas Contábeis não definidas por Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
            if nValorCMB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta,
                                           sDebitoCM, iFlgSegregaCMDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta,
                                           sCreditoCM, iFlgSegregaCMCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Baixa por Reavaliação da Correção Monetária no Grupo ') + sGrupo +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'D', iPlanoConta,
                                           sCreditoCM, iFlgSegregaCMCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'C', iPlanoConta,
                                           sDebitoCM, iFlgSegregaCMDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Baixa por Reavaliação da Correção Monetária no Grupo ') + sGrupo +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'C', iPlanoConta,
                                           sDebitoD, iFlgSegregaDDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'D', iPlanoConta,
                                           sCreditoD, iFlgSegregaDCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Baixa por Reavaliação da Depreciação no Grupo ') + sGrupo +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta,
                                           sCreditoD, iFlgSegregaDCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta,
                                           sDebitoD, iFlgSegregaDDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Baixa por Reavaliação da Depreciação no Grupo ') + sGrupo +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorCMD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'C', iPlanoConta,
                                           sDebitoCMD, iFlgSegregaCMDDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'D', iPlanoConta,
                                           sCreditoCMD, iFlgSegregaCMDCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Baixa por Reavaliação da Correção Monetária da Depreciação no Grupo ') + sGrupo +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta,
                                           sCreditoCMD, iFlgSegregaCMDCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta,
                                           sDebitoCMD, iFlgSegregaCMDDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Baixa por Reavaliação da Correção Monetária da Depreciação no Grupo ') + sGrupo +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor1   := CMTranslate('Reavaliação Patrimonial');
         sHistor2   := trim(sPlaca);
         if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then         // InvestImob
            sHistor2 := sHistor2 + BuscaCodigoImovel(Trunc(nBem));
         sHistor3   := trimleft(copy(sDesBem, 1,40));
         sHistor4   := trimleft(copy(sDesBem,41,80));
         sHistor5   := '';
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         //-------------------------------------------------------------------------------
         nParticip1 := 0;
         nParticip2 := 0;
         nParticip3 := 0;
         //-------------------------------------------------------------------------------
         // Processa a Transferencia dos Valores das Contas de Correção Monetária do Custo,
         // da Depreciação Acumulada e da sua Correção Monetária para a Conta de Custo
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjunto);
         while not FcdsCcRD.EOF do
         begin
            if nValorCMB <> 0 then
            begin
               if nParticip1 < 100 then
               begin
                  sHistor1 := CMTranslate('Baixa Correção Monetária por Reavaliação ') + sMensErro;
                  //----------------------------------------------------------------------
                  // Montagem da Partida Dobrada
                  //----------------------------------------------------------------------
                  sCCDeb := '';
                  sCCCre := '';
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta,
                                                 sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta,
                                                 sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Baixa por Reavaliação da Correção Monetária no Grupo ') + sGrupo +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb + CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'D', iPlanoConta,
                                                 sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov2, 'C', iPlanoConta,
                                                 sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Baixa por Reavaliação da Correção Monetária no Grupo ') + sGrupo +
                                       CMTranslate('no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCM,
                                                      FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                        nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCM,
                                                      FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                        nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  if (sCCDeb = '') and (sCCCre = '') then
                     nParticip1 := 100;
                  //----------------------------------------------------------------------
                  nValLanc := ConvNum((nValorCMB * nParticip1) / 100);
                  nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, sCreditoCM, sCcDeb, sCcCre,
                                               iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                               Trunc(nBem), Trunc(nGrupo), sGrupo, abs(nValLanc),
                                               sNomeContaDeb,sObrigaSubContaDeb,
                                               sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                               sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                     Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorD <> 0 then
            begin
               if nParticip2 < 100 then
               begin
                 Case iTipoFechamento of
                   0 : sHistor1 := CMTranslate('Baixa Depreciação por Reavaliação ') + sMensErro;
                   1 : sHistor1 := CMTranslate('Baixa Amortização por Reavaliação ') + sMensErro;
                 end;
                  //----------------------------------------------------------------------
                  // Montagem da Partida Dobrada
                  //----------------------------------------------------------------------
                  sCCDeb := '';
                  sCCCre := '';
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'C', iPlanoConta,
                                                 sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov3, 'D', iPlanoConta,
                                                 sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Baixa por Reavaliação da Depreciação no Grupo ') + sGrupo +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta,
                                                 sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta,
                                                 sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Baixa por Reavaliação da Depreciação no Grupo ') + sGrupo +
                                       CMTranslate('no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoD,
                                                      FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                        nParticip2 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoD,
                                                      FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                        nParticip2 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  if (sCCDeb = '') and (sCCCre = '') then
                     nParticip2 := 100;
                  //----------------------------------------------------------------------
                  nValLanc := ConvNum((nValorD * nParticip2) / 100);
                  nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, sCreditoD, sCcDeb, sCcCre,
                                               iFlgSegregaDDeb, iFlgSegregaDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                               Trunc(nBem), Trunc(nGrupo), sGrupo, abs(nValLanc),
                                               sNomeContaDeb,sObrigaSubContaDeb,
                                               sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                               sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                     Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorCMD <> 0 then
            begin
               if nParticip3 < 100 then
               begin
                 Case iTipoFechamento of
                   0 : sHistor1 := CMTranslate('Baixa C.M.Depreciação por Reavaliação') + sMensErro;
                   1 : sHistor1 := CMTranslate('Baixa C.M.Amortização por Reavaliação') + sMensErro;
                 end;
                  //----------------------------------------------------------------------
                  // Montagem da Partida Dobrada
                  //----------------------------------------------------------------------
                  sCCDeb := '';
                  sCCCre := '';
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'C', iPlanoConta,
                                                 sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov4, 'D', iPlanoConta,
                                                 sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Baixa por Reavaliação da Correção Monetária da Depreciação no Grupo ') + sGrupo +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     //-------------------------------------------------------------------
                     // Busca conta a Crédito
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta,
                                                 sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta,
                                                 sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Baixa por Reavaliação da Correção Monetária da Depreciação no Grupo ') + sGrupo +
                                       CMTranslate('no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCMD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCMD,
                                                      FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                        nParticip3 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCMD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCMD,
                                                      FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                        nParticip3 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  if (sCCDeb = '') and (sCCCre = '') then
                     nParticip3 := 100;
                  //----------------------------------------------------------------------
                  nValLanc := ConvNum((nValorCMD * nParticip3) / 100);
                  nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
                  //----------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, sCreditoCMD, sCcDeb, sCcCre,
                                               iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                               Trunc(nBem), Trunc(nGrupo), sGrupo, abs(nValLanc),
                                               sNomeContaDeb,sObrigaSubContaDeb,
                                               sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                               sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                     Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            FcdsCcRD.Next;
         end;
         FcdsCcRD.Close;
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      FcdsCcRd.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaReavaliacao(iModulo, iEmpresa,
  iBem, iGrupo, iConjunto, iAtivProjeto, iSubConta: Integer; sPlaca,
  sDesBem, sGrupo: String; dDataLanc: TDateTime; nSaldoReaval: Extended;
  iExercicio, iPeriodo: Integer; bCtaxCCusto: Boolean): Boolean;
var
   iTipoMov, iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre        : Integer;
   nValLanc, nParticip1                  : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre        : String;
   FcdsCcRD                              : TClientDataSet;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxCCustoDeb1, sMaxCCustoCre1          : String;
   nMaxCCusto1, nSomaRateios1              : Extended;

begin
   Result := True;
   FcdsCcRD := TClientDataSet.Create(nil);
   try
      try
         if nSaldoReaval > 0 then
         begin
            iTipoMov := 08;
         end else
         if nSaldoReaval < 0 then
         begin
            iTipoMov := 23;
         end else
         begin
            Result := True;
            Exit;
         end;
         //-------------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(iEmpresa) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;
         //-------------------------------------------------------------------------------
         // Contas Contábeis não definidas por Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
            //----------------------------------------------------------------------------
            // Busca conta a débito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
            begin
               if iTipoMov = 08 then
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Reavaliação no Grupo ') + sGrupo +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                         CMTranslate(' não cadastrada !'))
               else
                  raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Reavaliação Negativa no Grupo ') + sGrupo +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                         CMTranslate(' não cadastrada !'));
            end;
            //----------------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCredito, iFlgSegregaCre) then
            begin
               if iTipoMov = 08 then
                  raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Reavaliação no Grupo ') + sGrupo +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                         CMTranslate(' não cadastrada !'))
               else
                  raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Reavaliação Negativa no Grupo ') + sGrupo +
                                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                         CMTranslate(' não cadastrada !'));
            end;
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor2   := trim(sPlaca);
         if iModulo in [54,64,135] then                                      // InvestImob
            sHistor2 := sHistor2 + BuscaCodigoImovel(iBem);
         sHistor3   := trimleft(copy(sDesBem, 1,40));
         sHistor4   := trimleft(copy(sDesBem,41,80));
         sHistor5   := '';
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         //-------------------------------------------------------------------------------
         nParticip1 := 0;
         //-------------------------------------------------------------------------------
         // A diferença entre os valores contabilizados e a soma dos seus rateios deve
         // ser lançada no Centro de Custo com a maior proporção
         //-------------------------------------------------------------------------------
         nMaxCCusto1 := 0.000000;
         nSomaRateios1 := 0.00;
         iMaxFlgSegregaDeb1 := 0;
         iMaxFlgSegregaCre1 := 0;
         //-------------------------------------------------------------------------------
         // Busca Rateio da Depreciação do Bem
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
         while not FcdsCcRD.EOF do
         begin
            if nParticip1 < 100 then
            begin
               if iTipoMov = 08 then
                  sHistor1 := CMTranslate('Reavaliação Patrimonial')
               else
                  sHistor1 := CMTranslate('Reavaliação Patrimonial Negativa');
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada do Custo
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  // Busca conta a débito
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
                  begin

                     if iTipoMov = 08 then
                        raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Reavaliação no Grupo ') + sGrupo +
                                               CMTranslate(' no Centro de Custo ') + sCCDeb +
                                               CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                               CMTranslate(' não cadastrada !'))
                     else
                        raise Exception.Create(CMTranslate('Conta a Débito para o Movimento de Reavaliação Negativa no Grupo ') + sGrupo +
                                               CMTranslate(' no Centro de Custo ') + sCCDeb +
                                               CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                               CMTranslate(' não cadastrada !'));
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                     sDebito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaDeb      := ContaContab.NomeConta;
               sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
               sTipConvOfiDeb     := ContaContab.TipoConvOfi;
               sTipConvGerDeb     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcDeb = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sDebito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  // Busca conta a crédito
                  //----------------------------------------------------------------------
                  if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
                  begin
                     if iTipoMov = 08 then
                        raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Reavaliação no Grupo ') + sGrupo +
                                               CMTranslate(' no Centro de Custo ') + sCCCre +
                                               CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                               CMTranslate(' não cadastrada !'))
                     else
                        raise Exception.Create(CMTranslate('Conta a Crédito para o Movimento de Reavaliação Negativa no Grupo ') + sGrupo +
                                               CMTranslate(' no Centro de Custo ') + sCCCre +
                                               CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov) +
                                               CMTranslate(' não cadastrada !'));
                  end;
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                     sCredito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaCre      := ContaContab.NomeConta;
               sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaCre := ContaContab.ObrigaSubConta;
               sTipConvOfiCre     := ContaContab.TipoConvOfi;
               sTipConvGerCre     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcCre = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sCredito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  nParticip1 := 100;
               //-------------------------------------------------------------------------
               nValLanc := ConvNum((nSaldoReaval * nParticip1) / 100);
               nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
               //-------------------------------------------------------------------------
               // Acumula os valores proporcionais e apura o centro de custo
               // com a maior proporção
               //-------------------------------------------------------------------------
               nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
               if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
               begin
                  sMaxDebito1            := sDebito;
                  sMaxCredito1           := sCredito;
                  iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
                  iMaxFlgSegregaCre1     := iFlgSegregaCre;
                  sMaxNomeContaDeb1      := sNomeContaDeb;
                  sMaxNomeContaCre1      := sNomeContaCre;
                  sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
                  sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
                  sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
                  sMaxTipConvOfiCre1     := sTipConvOfiCre;
                  sMaxTipConvGerDeb1     := sTipConvGerDeb;
                  sMaxTipConvGerCre1     := sTipConvGerCre;
                  //----------------------------------------------------------------------
                  sMaxCCustoDeb1         := sCcDeb;
                  sMaxCCustoCre1         := sCcCre;
                  nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                            iFlgSegregaDeb, iFlgSegregaCre,
                                            iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo,
                                            sGrupo, abs(nValLanc),sNomeContaDeb,sObrigaSubContaDeb,
                                            sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                            sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                            sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsCcRD.Next;
         end;
         FcdsCcRD.Close;
         //-------------------------------------------------------------------------------
         // A diferença entre os valores contabilizados e a soma dos seus rateios deve
         // ser lançada no Centro de Custo com a maior proporção
         //-------------------------------------------------------------------------------
         if ConvNum(nSomaRateios1 - nSaldoReaval) <> 0 then
         begin
            if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta,
                                         sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                         iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                         iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo, sGrupo,
                                         ConvNum(nSomaRateios1 - nSaldoReaval),
                                         sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                         sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                         sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                         sMaxTipConvOfiCre1, sMaxTipConvGerCre1,
                                         sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
               Raise Exception.Create(MessageInfo);
         end;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      FcdsCcRD.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaRemembramento(nModulo,
  nEmpresaProp, nBem, dDataLanc: TDateTime; nGrupoPai,
  nGrupoFilho: Extended; sGrupoPai, sGrupoFilho: String; nConjuntoPai,
  nConjuntoFilho: Extended; sCCustoPai, sCCustoFilho: String; nSubConta,
  nAtivProjeto: Extended; sTipoTab: String; nValorB, nValorCMB, nValorD,
  nValorCMD: Extended; sDesBemPai, sDesBemFilho, sPlacaPai,
  sPlacaFilho: String; iExercicio, iPeriodo: Integer;
  bCtaxCCusto: Boolean): Boolean;
type
   TRateio = Record
      CENTROCUSTOPAI    : String;
      CENTROCUSTOFILHO  : String;
      PARTICIPACAOPAI   : Extended;
      PARTICIPACAOFILHO : Extended;
   end;

var
   aCcRD                                  : array [1..25] of TRateio;
   iMaxCcRD, iCcRD, iCcRDPai, iCcRDFilho : Integer;
   //-------------------------------------------------------------------------------------
   FcdsCcRD                               : TClientDataSet;
   bOk, bProcessar                        : Boolean;
   iPlanoConta,
   iTipoMov1, iTipoMov2,
   iTipoMov3, iTipoMov4,
   iFlgSegregaDeb, iFlgSegregaCre,
   iFlgSegregaCMDeb, iFlgSegregaCMCre,
   iFlgSegregaDDeb, iFlgSegregaDCre,
   iFlgSegregaCMDDeb, iFlgSegregaCMDCre   : Integer;
   sMensErro, sObrigaCC,
   sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sHistor1, sHistor2, sHistor3,
   sHistor4, sHistor5,
   sNomeContaDeb, sObrigaCcDeb,
   sObrigaSubContaDeb,
   sTipConvOfiDeb, sTipConvGerDeb,
   sNomeContaCre, sObrigaCcCre,
   sObrigaSubContaCre,
   sTipConvOfiCre, sTipConvGerCre,
   sNumDoc, sCCDeb, sCCCre                : String;
   nParticip1, nParticip2, nParticip3,
   nParticip4, nParticip5, nParticip6,
   nParticip7, nParticip8,
   nFatorDeb, nFatorCre,
   nValLancDeb, nValLancCre               : Extended;

begin
   Result := True;
   FcdsCcRD := TClientDataSet.Create(nil);
   try
      try
         //-------------------------------------------------------------------------------
         // Carga dos parametros do sistema
         //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;
         //-------------------------------------------------------------------------------
         // Seleciona qual é o componente do saldo que será processado
         //-------------------------------------------------------------------------------
         if sTipoTab = 'B' then
         begin
            iTipoMov1 := 01;
            iTipoMov2 := 15;
            iTipoMov3 := 14;
            iTipoMov4 := 21;
            sMensErro := '';
         end else
         if sTipoTab = 'R' then
         begin
            if nValorB > 0 then
            begin
               iTipoMov1 := 08;
            end else
            begin
               iTipoMov1 := 23;
            end;
            iTipoMov2 := 22;
            iTipoMov3 := 18;
            iTipoMov4 := 19;
            sMensErro := CMTranslate(' (Reavaliação) ');
         end else
         begin
            iTipoMov1 := 09;
            iTipoMov2 := 34;
            iTipoMov3 := 35;
            iTipoMov4 := 36;
            sMensErro := CMTranslate(' (Acréscimo) ');
         end;
         //-------------------------------------------------------------------------------
         // Contas Contábeis não definidas por Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
            if nValorB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'C', iPlanoConta, sDebito, iFlgSegregaDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoFilho +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'D', iPlanoConta, sCredito, iFlgSegregaCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoPai +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorCMB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'C', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoFilho +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'D', iPlanoConta, sCreditoCM, iFlgSegregaCMCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoPai +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'C', iPlanoConta, sDebitoD, iFlgSegregaDDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoFilho +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'D', iPlanoConta, sCreditoD, iFlgSegregaDCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoPai +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
            //----------------------------------------------------------------------------
            if nValorCMD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Busca conta a débito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'C', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoFilho +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
               //-------------------------------------------------------------------------
               // Busca conta a crédito
               //-------------------------------------------------------------------------
               if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre)
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'D', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre);
               if not bOk then
               begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoPai +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Transfere para arrays os rateios de custo, para permitir que as transferências
         // de local sejam possíveis sem afetar a transação
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjuntoPai);
         iMaxCcRD := 1;
         while not FcdsCcRD.EOF do
         begin
            aCcRD[iMaxCcRD].CENTROCUSTOPAI  := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
            aCcRD[iMaxCcRD].PARTICIPACAOPAI := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
            aCcRD[iMaxCcRD].CENTROCUSTOFILHO   := '';
            aCcRD[iMaxCcRD].PARTICIPACAOFILHO  := 0;
            iMaxCcRD := iMaxCcRD + 1;
            FcdsCcRD.Next;
         end;
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjuntoFilho);
         iCcRD := 1;
         while not FcdsCcRD.EOF do
         begin
            aCcRD[iCcRD].CENTROCUSTOFILHO  := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
            aCcRD[iCcRD].PARTICIPACAOFILHO := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
            iCcRD := iCcRD + 1;
            if iCcRD > iMaxCcRD then
            begin
               iMaxCcRD := iCcRD;
               aCcRD[iMaxCcRD].CENTROCUSTOPAI  := '';
               aCcRD[iMaxCcRD].PARTICIPACAOPAI := 0;
            end;
            FcdsCcRD.Next;
         end;
         FcdsCcRD.Close;
         //-------------------------------------------------------------------------------
         // Centro de Custo do Conjunto Filho, caso haja tranferência de local
         //-------------------------------------------------------------------------------
         if sCCustoFilho <> sCCustoPai then
         begin
            iCcRD := 1;
            while iCcRD < iMaxCcRD do
            begin
               if aCcRD[iCcRD].CENTROCUSTOFILHO = sCCustoPai then
                  aCcRD[iCcRD].CENTROCUSTOFILHO := sCCustoFilho;
               iCcRD := iCcRD + 1;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Verifica se existe mudanca de Conta Contabil e/ou Centro de Custo.
         // Caso não haja mudança, não gera planilha contabil.
         //-------------------------------------------------------------------------------
         bProcessar := True;
         if ((sDebito  = sCredito)  and (sDebitoCM  = sCreditoCM) and
             (sDebitoD = sCreditoD) and (sDebitoCMD = sCreditoCMD)) then
         begin
            bProcessar := False;
            //----------------------------------------------------------------------------
            // Verifica se existem centros de custos para as contas acima
            //----------------------------------------------------------------------------
            sObrigaCC := 'N';
            if sDebito <> '' then
            begin
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sDebito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sObrigaCc := ContaContab.ObrigaCentroCusto;
            end;
            if sObrigaCC = 'N' then
               if sDebitoCM <> '' then
               begin
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sObrigaCc := ContaContab.ObrigaCentroCusto;
               end;
            if sObrigaCC = 'N' then
               if sCreditoD <> '' then
               begin
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sObrigaCc := ContaContab.ObrigaCentroCusto;
               end;
            if sObrigaCC = 'N' then
               if sCreditoCMD <> '' then
                  if sCreditoD <> '' then
                  begin
                     if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                           sCreditoCMD, False, False) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end;
                     sObrigaCc := ContaContab.ObrigaCentroCusto;
                  end;
            //----------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               iCcRDPai := 1;
               while iCcRDPai < iMaxCcRD do
               begin
                  iCcRDFilho := 1;
                  while iCcRDFilho < iMaxCcRD do
                  begin
                     if (aCcRD[iCcRDPai].CENTROCUSTOPAI <> aCcRD[iCcRDFilho].CENTROCUSTOFILHO) and
                        (aCcRD[iCcRDPai].CENTROCUSTOPAI <> '') and (aCcRD[iCcRDFilho].CENTROCUSTOFILHO <> '') then
                        bProcessar := True;
                     iCcRDFilho  := iCcRDFilho  + 1;
                  end;
                  iCcRDPai := iCcRDPai + 1;
               end;
            end;
         end;
         if not bProcessar then
         begin
            Result := True;
            Exit;
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor1   := CMTranslate('Remembramento de Bem');
         sHistor2   := trim(sPlacaPai);
         if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then         // InvestImob
            sHistor2 := sHistor2 + BuscaCodigoImovel(Trunc(nBem));
         sHistor3   := trimleft(copy(sDesBemPai, 1,40));
         sHistor4   := trimleft(copy(sDesBemPai,41,80));
         sHistor5   := '';
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         //-------------------------------------------------------------------------------
         nParticip1 := 0;
         nParticip2 := 0;
         nParticip3 := 0;
         nParticip4 := 0;
         nParticip5 := 0;
         nParticip6 := 0;
         nParticip7 := 0;
         nParticip8 := 0;
         //-------------------------------------------------------------------------------
         // Processa a Baixa dos valores da Conta Contábil / Centro de Custo Atuais
         //-------------------------------------------------------------------------------
         iCcRD := 1;
         while iCcRD < iMaxCcRD do
         begin
            //----------------------------------------------------------------------------
            // Custo
            //----------------------------------------------------------------------------
            if nValorB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip1 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov1, 'C', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebito, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip1 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip1 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip1 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip2 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'D', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento do Custo no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCredito, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCCCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip2 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip2 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip2 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorB * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorB * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia do Custo de Aquisicao');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                                  iFlgSegregaDeb, iFlgSegregaCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, '', sCcDeb, '',
                                                  iFlgSegregaDeb, iFlgSegregaCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCredito, '', sCcCre,
                                                  iFlgSegregaDeb, iFlgSegregaCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Correção Monetária
            //----------------------------------------------------------------------------
            if nValorCMB <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip3 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov2, 'C', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCM,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip3 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip3 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip3 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip4 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'D', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCM, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCM,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip4 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip4 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip4 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorCMB * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorCMB * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia da Correcao Monetaria');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, sCreditoCM, sCcDeb, sCcCre,
                                                  iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, '', sCcDeb, '',
                                                  iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoCM, '', sCcCre,
                                                  iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Depreciação
            //----------------------------------------------------------------------------
            if nValorD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip5 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'C', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoD,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip5 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip5 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip5 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip6 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov3, 'D', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Depreciação no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoD,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip6 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip6 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip6 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorD * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorD * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia da Depreciacao');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, sCreditoD, sCcDeb, sCcCre,
                                                  iFlgSegregaDDeb, iFlgSegregaDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, '', sCcDeb, '',
                                                  iFlgSegregaDDeb, iFlgSegregaDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoD, '', sCcCre,
                                                  iFlgSegregaDDeb, iFlgSegregaDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            // Correção Monetária da Depreciacao
            //----------------------------------------------------------------------------
            if nValorCMD <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Entrada do Custo Filho
               //-------------------------------------------------------------------------
               if nParticip7 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCDeb := aCcRD[iCcRD].CENTROCUSTOPAI;
                     //-------------------------------------------------------------------
                     // Busca conta a débito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'C', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoPai), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Débito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoPai +
                                       CMTranslate(' no Centro de Custo ') + sCCDeb +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sDebitoCMD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaDeb      := ContaContab.NomeConta;
                  sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                  sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                  sTipConvGerDeb     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Débito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcDeb = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCMD,
                                                      aCcRD[iCcRD].CENTROCUSTOPAI) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcDeb     := aCcRD[iCcRD].CENTROCUSTOPAI;
                        nParticip7 := aCcRD[iCcRD].PARTICIPACAOPAI;
                     end;
                  end else
                  begin
                     sCCDeb     := '';
                     nParticip7 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorDeb := nParticip7 / 100;
               end else
               begin
                  nFatorDeb := 0;
               end;
               //-------------------------------------------------------------------------
               // Rateio por Centro de Custo da Baixa do Custo Pai
               //-------------------------------------------------------------------------
               if nParticip8 < 100 then
               begin
                  //----------------------------------------------------------------------
                  // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                  //----------------------------------------------------------------------
                  if bCtaxCCusto then
                  begin
                     sCCCre := aCcRD[iCcRD].CENTROCUSTOFILHO;
                     //-------------------------------------------------------------------
                     // Busca conta a crédito
                     //-------------------------------------------------------------------
                     // Se for reavaliacao negativa, inverter o tipo de lançamento
                     //-------------------------------------------------------------------
                     if iTipoMov1 <> 23 then
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre)
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoFilho), iTipoMov4, 'D', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre);
                     if not bOk then
                     begin
                        MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Desmembramento da Correção Monetária da Depreciação no Grupo ') + sGrupoFilho +
                                       CMTranslate(' no Centro de Custo ') + sCCCre +
                                       CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                       CMTranslate(' não cadastrada !') + sMensErro;
                        Raise Exception.Create(MessageInfo);
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito é válida
                  //----------------------------------------------------------------------
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCMD, False, False) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end;
                  sNomeContaCre      := ContaContab.NomeConta;
                  sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                  sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                  sTipConvOfiCre     := ContaContab.TipoConvOfi;
                  sTipConvGerCre     := ContaContab.TipoConvGeren;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil a Crédito obriga centro de custo
                  //----------------------------------------------------------------------
                  if sObrigaCcCre = 'S' then
                  begin
                     if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCMD,
                                                      aCcRD[iCcRD].CENTROCUSTOFILHO) then
                     begin
                        MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end else
                     begin
                        sCcCre     := aCcRD[iCcRD].CENTROCUSTOFILHO;
                        nParticip8 := aCcRD[iCcRD].PARTICIPACAOFILHO;
                     end;
                  end else
                  begin
                     sCCCre     := '';
                     nParticip8 := 100;
                  end;
                  //----------------------------------------------------------------------
                  nFatorCre := nParticip8 / 100;
               end else
               begin
                  nFatorCre := 0;
               end;
               //-------------------------------------------------------------------------
               nValLancDeb := ConvNum(nValorCMD * nFatorDeb);
               nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
               nValLancCre := ConvNum(nValorCMD * nFatorCre);
               nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
               //-------------------------------------------------------------------------
               sHistor5 := CMTranslate('Tranferencia da Correção Monetária da Depreciacao');
               if (nGrupoPai <> nGrupoFilho) or (sCCDeb <> '') or (sCCCre <> '') then
               begin
                  if nValLancDeb = nValLancCre then
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento em Partida Dobrada
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, sCreditoCMD, sCcDeb, sCcCre,
                                                  iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb),sNomeContaDeb,sObrigaSubContaDeb,
                                                  sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                                  sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     //-------------------------------------------------------------------
                     // Lançamento a Débito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, '', sCcDeb, '',
                                                  iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoPai),
                                                  sGrupoPai, abs(nValLancDeb), sNomeContaDeb,
                                                  sObrigaSubContaDeb,'','',
                                                  sTipConvOfiDeb, sTipConvGerDeb,'','',
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                     //-------------------------------------------------------------------
                     // Lançamento a Crédito
                     //-------------------------------------------------------------------
                     if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoCMD, '', sCcCre,
                                                  iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                                  Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoFilho),
                                                  sGrupoFilho, abs(nValLancCre),'','',sNomeContaCre,
                                                  sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                  sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            iCcRD := iCcRD + 1;
         end;
         Result := True;
      except
         On E : Exception Do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      FcdsCcRd.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaResultadoBaixa(nModulo,
  nEmpresaProp, nBem: Extended; dDataLanc: TDateTime; nGrupo, nConjunto,
  nSubConta, nAtivProjeto, nValResult: Extended; sDesBem, sPlaca, sGrupo,
  sPlaContaDestino: String; iExercicio, iPeriodo: Integer;
  bCtaxCCusto: Boolean): Boolean;
var
   FcdsCcRD                                  : TClientDataSet;
   iPlanoConta,
   iTipoMov1,
   iFlgSegregaDeb, iFlgSegregaCre            : Integer;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4,
   sHistor5, sNumDoc,
   sCCDeb, sCCCre,
   sNomeContaDeb, sNomeContaCre,
   sObrigaCcDeb, sObrigaCcCre,
   sObrigaSubContaDeb, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvOfiCre,
   sTipConvGerDeb, sTipConvGerCre            : String;
   bOk                                       : Boolean;
   nParticip1,
   nValLanc                                  : Extended;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxCCustoDeb1, sMaxCCustoCre1          : String;
   nMaxCCusto1, nSomaRateios1              : Extended;
begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  try
    try
      //-------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //-------------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(nEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         //-------------------------------------------------------------------------------
         // Captura o Plano de Contas Vigente
         //-------------------------------------------------------------------------------
         iPlanoConta := ParamCAF.PLANOVIGENTE;
         //-------------------------------------------------------------------------------
         if nValResult > 0 then
            iTipoMov1 := 30
         else
            iTipoMov1 := 31;
         //-------------------------------------------------------------------------------
         if iTipoMov1 = 30 then
            sHistor1 := CMTranslate('Lucro na Alienacao de Bem')
         else
            sHistor1 := CMTranslate('Prejuízo na Alienacao de Bem');
         //-------------------------------------------------------------------------------
         // Contas Contábeis não são definidas pelos Centros de Custo
         //-------------------------------------------------------------------------------
         if not bCtaxCCusto then
         begin
            //----------------------------------------------------------------------------
            // Busca conta a débito
            //----------------------------------------------------------------------------
            bOk := True;
            if sPlaContaDestino = '' then
               bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb)
            else
               if iTipoMov1 <> 31 then
                  sDebito := sPlaContaDestino
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb);
            //----------------------------------------------------------------------------
            if (not bOk) or (sDebito = '') then
               raise Exception.Create(CMTranslate('Conta a Débito para o Lançamento do ') + sHistor1 + CMTranslate(' no Grupo ') + sGrupo +
                                      CMTranslate(' não cadastrada !'));
            //----------------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------------
            bOk := True;
            if sPlaContaDestino = '' then
               bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre)
            else
               if iTipoMov1 = 31 then
                  sCredito := sPlaContaDestino
               else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre);
            //----------------------------------------------------------------------------
            if (not bOk) or (sCredito = '') then
               raise Exception.Create(CMTranslate('Conta a Crédito para o Lançamento do ') + sHistor1 + CMTranslate(' no Grupo ') + sGrupo +
                                      CMTranslate(' não cadastrada !'));
         end;
         //-------------------------------------------------------------------------------
         // Processamento do Rateio dos Custos
         //-------------------------------------------------------------------------------
         sHistor2   := trim(sPlaca);
         if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then         // InvestImob
            sHistor2 := sHistor2 + BuscaCodigoImovel(Trunc(nBem));
         sHistor3   := trimleft(copy(sDesBem,1,40));
         sHistor4   := trimleft(copy(sDesBem,41,80));
         sHistor5   := '';
         sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
         //-------------------------------------------------------------------------------
         nParticip1 := 0;
         //-------------------------------------------------------------------------------
         // A diferença entre os valores contabilizados e a soma dos seus rateios deve
         // ser lançada no Centro de Custo com a maior proporção
         //-------------------------------------------------------------------------------
         nMaxCCusto1 := 0.000000;
         nSomaRateios1 := 0.00;
         iMaxFlgSegregaDeb1 := 0;
         iMaxFlgSegregaCre1 := 0;
         //-------------------------------------------------------------------------------
         // Busca Rateio de Custos do Bem
         //-------------------------------------------------------------------------------
         FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjunto);
         while not FcdsCcRD.EOF do
         begin
            if nParticip1 < 100 then
            begin
               //-------------------------------------------------------------------------
               // Montagem da Partida Dobrada
               //-------------------------------------------------------------------------
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  // Busca conta a débito
                  //----------------------------------------------------------------------
                  bOk := True;
                  if sPlaContaDestino = '' then
                     bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb)
                  else
                     if iTipoMov1 <> 31 then
                        sDebito := sPlaContaDestino
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb);
                  //----------------------------------------------------------------------
                  if (not bOk) or (sDebito = '') then
                     raise Exception.Create(CMTranslate('Conta a Débito para o Lançamento do ') + sHistor1 + CMTranslate(' no Grupo ') + sGrupo +
                                            CMTranslate(' no Centro de Custo ') + sCCDeb + CMTranslate(' não cadastrada !'));
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sDebito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaDeb      := ContaContab.NomeConta;
               sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
               sTipConvOfiDeb     := ContaContab.TipoConvOfi;
               sTipConvGerDeb     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Débito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcDeb = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end else
                  sCCDeb := '';
               //-------------------------------------------------------------------------
               // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
               //-------------------------------------------------------------------------
               if bCtaxCCusto then
               begin
                  sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  //----------------------------------------------------------------------
                  bOk := True;
                  if sPlaContaDestino = '' then
                     bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre)
                  else
                     if iTipoMov1 = 31 then
                        sCredito := sPlaContaDestino
                     else
                        bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupo), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre);
                  //----------------------------------------------------------------------
                  if (not bOk) or (sCredito = '') then
                     raise Exception.Create(CMTranslate('Conta a Credito para o Lançamento do ') + sHistor1 + CMTranslate(' no Grupo ') + sGrupo +
                                            CMTranslate(' no Centro de Custo ') + sCCCre + CMTranslate(' não cadastrada !'));
               end;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito é válida
               //-------------------------------------------------------------------------
               if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                     sCredito, False, False) then
               begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
               end;
               sNomeContaCre      := ContaContab.NomeConta;
               sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
               sObrigaSubContaCre := ContaContab.ObrigaSubConta;
               sTipConvOfiCre     := ContaContab.TipoConvOfi;
               sTipConvGerCre     := ContaContab.TipoConvGeren;
               //-------------------------------------------------------------------------
               // Verifica se a conta contábil a Crédito obriga centro de custo
               //-------------------------------------------------------------------------
               if sObrigaCcCre = 'S' then
               begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                   FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
                  begin
                     MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                     Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end;
               end else
                  sCCCre := '';
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  nParticip1 := 100;
               //-------------------------------------------------------------------------
               nValLanc := ConvNum((nValResult * nParticip1) / 100);
               nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
               //-------------------------------------------------------------------------
               // Acumula os valores proporcionais e apura o centro de custo
               // com a maior proporção
               //-------------------------------------------------------------------------
               nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
               if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
               begin
                  sMaxDebito1            := sDebito;
                  sMaxCredito1           := sCredito;
                  iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
                  iMaxFlgSegregaCre1     := iFlgSegregaCre;
                  sMaxNomeContaDeb1      := sNomeContaDeb;
                  sMaxNomeContaCre1      := sNomeContaCre;
                  sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
                  sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
                  sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
                  sMaxTipConvOfiCre1     := sTipConvOfiCre;
                  sMaxTipConvGerDeb1     := sTipConvGerDeb;
                  sMaxTipConvGerCre1     := sTipConvGerCre;
                  //----------------------------------------------------------------------
                  sMaxCCustoDeb1         := sCcDeb;
                  sMaxCCustoCre1         := sCcCre;
                  nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end;
               //-------------------------------------------------------------------------
               if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                            iFlgSegregaDeb, iFlgSegregaCre,
                                            Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                            Trunc(nBem), Trunc(nGrupo), sGrupo, abs(nValLanc),
                                            sNomeContaDeb,sObrigaSubContaDeb,
                                            sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                            sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                            sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            FcdsCcRD.Next;
         end;
         FcdsCcRD.Close;
         //-------------------------------------------------------------------------------
         // A diferença entre os valores contabilizados e a soma dos seus rateios deve
         // ser lançada no Centro de Custo com a maior proporção
         //-------------------------------------------------------------------------------
         if ConvNum(nSomaRateios1 - nValResult) <> 0 then
         begin
            if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta,
                                         sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                         iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                         Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                         Trunc(nBem), Trunc(nGrupo), sGrupo,
                                         ConvNum(nSomaRateios1 - nValResult),
                                         sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                         sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                         sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                         sMaxTipConvOfiCre1,sMaxTipConvGerCre1,
                                         sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
               Raise Exception.Create(MessageInfo);
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
   finally
      FcdsCcRD.Free;
   end;
end;

function TCtrlImobCAFxContab.ContabilizaTransferencia(nModulo,
  nEmpresaProp, nBem, nGrupoAtual, nGrupoNovo: Extended; sGrupoAtual,
  sGrupoNovo: String; nConjuntoAtual, nConjuntoNovo: Extended;
  sCCustoAtual, sCCustoNovo: String; dDataLanc: TDateTime; nValorB,
  nValorCMB, nValorD, nValorCMD: Extended; sDesBem, sTipoTab: String;
  nSubConta, nAtivProjeto: Extended; sPlaca: String; iExercicio,
  iPeriodo: Integer; bCtaxCCusto: Boolean): Boolean;
type
   TRateio = Record
      CENTROCUSTOATUAL  : String;
      CENTROCUSTONOVO   : String;
      PARTICIPACAOATUAL : Extended;
      PARTICIPACAONOVO  : Extended;
   end;

var
   aCcRD                                  : array [1..25] of TRateio;
   iMaxCcRD, iCcRD, iCcRDAtual, iCcRDNovo : Integer;
   //-------------------------------------------------------------------------------------
   FcdsCcRD                               : TClientDataSet;
   bOk, bProcessar                        : Boolean;
   iPlanoConta,
   iTipoMov1, iTipoMov2,
   iTipoMov3, iTipoMov4,
   iFlgSegregaDeb, iFlgSegregaCre,
   iFlgSegregaCMDeb, iFlgSegregaCMCre,
   iFlgSegregaDDeb, iFlgSegregaDCre,
   iFlgSegregaCMDDeb, iFlgSegregaCMDCre   : Integer;
   sMensErro, sObrigaCC,
   sDebito, sCredito,
   sDebitoCM, sCreditoCM,
   sDebitoD, sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sHistor1, sHistor2, sHistor3,
   sHistor4, sHistor5,
   sNomeContaDeb, sObrigaCcDeb,
   sObrigaSubContaDeb,
   sTipConvOfiDeb, sTipConvGerDeb,
   sNomeContaCre, sObrigaCcCre,
   sObrigaSubContaCre,
   sTipConvOfiCre, sTipConvGerCre,
   sNumDoc, sCCDeb, sCCCre                : String;
   nParticip1, nParticip2, nParticip3,
   nParticip4, nParticip5, nParticip6,
   nParticip7, nParticip8,
   nFatorDeb, nFatorCre,
   nValLancDeb, nValLancCre               : Extended;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
   iMaxFlgSegregaDeb2, iMaxFlgSegregaCre2,
   iMaxFlgSegregaDeb3, iMaxFlgSegregaCre3,
   iMaxFlgSegregaDeb4, iMaxFlgSegregaCre4,
   iMaxFlgSegregaDeb5, iMaxFlgSegregaCre5,
   iMaxFlgSegregaDeb6, iMaxFlgSegregaCre6,
   iMaxFlgSegregaDeb7, iMaxFlgSegregaCre7,
   iMaxFlgSegregaDeb8, iMaxFlgSegregaCre8  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxDebito2, sMaxCredito2,
   sMaxDebito3, sMaxCredito3,
   sMaxDebito4, sMaxCredito4,
   sMaxDebito5, sMaxCredito5,
   sMaxDebito6, sMaxCredito6,
   sMaxDebito7, sMaxCredito7,
   sMaxDebito8, sMaxCredito8,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxNomeContaDeb2, sMaxNomeContaCre2,
   sMaxNomeContaDeb3, sMaxNomeContaCre3,
   sMaxNomeContaDeb4, sMaxNomeContaCre4,
   sMaxNomeContaDeb5, sMaxNomeContaCre5,
   sMaxNomeContaDeb6, sMaxNomeContaCre6,
   sMaxNomeContaDeb7, sMaxNomeContaCre7,
   sMaxNomeContaDeb8, sMaxNomeContaCre8,
   sMaxObrigaSubContaDeb1, sMaxObrigaSubContaCre1,
   sMaxObrigaSubContaDeb2, sMaxObrigaSubContaCre2,
   sMaxObrigaSubContaDeb3, sMaxObrigaSubContaCre3,
   sMaxObrigaSubContaDeb4, sMaxObrigaSubContaCre4,
   sMaxObrigaSubContaDeb5, sMaxObrigaSubContaCre5,
   sMaxObrigaSubContaDeb6, sMaxObrigaSubContaCre6,
   sMaxObrigaSubContaDeb7, sMaxObrigaSubContaCre7,
   sMaxObrigaSubContaDeb8, sMaxObrigaSubContaCre8,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1, sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxTipConvOfiDeb2, sMaxTipConvOfiCre2, sMaxTipConvGerDeb2, sMaxTipConvGerCre2,
   sMaxTipConvOfiDeb3, sMaxTipConvOfiCre3, sMaxTipConvGerDeb3, sMaxTipConvGerCre3,
   sMaxTipConvOfiDeb4, sMaxTipConvOfiCre4, sMaxTipConvGerDeb4, sMaxTipConvGerCre4,
   sMaxTipConvOfiDeb5, sMaxTipConvOfiCre5, sMaxTipConvGerDeb5, sMaxTipConvGerCre5,
   sMaxTipConvOfiDeb6, sMaxTipConvOfiCre6, sMaxTipConvGerDeb6, sMaxTipConvGerCre6,
   sMaxTipConvOfiDeb7, sMaxTipConvOfiCre7, sMaxTipConvGerDeb7, sMaxTipConvGerCre7,
   sMaxTipConvOfiDeb8, sMaxTipConvOfiCre8, sMaxTipConvGerDeb8, sMaxTipConvGerCre8,
   sMaxCCustoDeb1, sMaxCCustoCre1,
   sMaxCCustoDeb2, sMaxCCustoCre2,
   sMaxCCustoDeb3, sMaxCCustoCre3,
   sMaxCCustoDeb4, sMaxCCustoCre4,
   sMaxCCustoDeb5, sMaxCCustoCre5,
   sMaxCCustoDeb6, sMaxCCustoCre6,
   sMaxCCustoDeb7, sMaxCCustoCre7,
   sMaxCCustoDeb8, sMaxCCustoCre8 : String;
   nMaxCCusto1, nSomaRateios1,
   nMaxCCusto2, nSomaRateios2,
   nMaxCCusto3, nSomaRateios3,
   nMaxCCusto4, nSomaRateios4,
   nMaxCCusto5, nSomaRateios5,
   nMaxCCusto6, nSomaRateios6,
   nMaxCCusto7, nSomaRateios7,
   nMaxCCusto8, nSomaRateios8 : Extended;
   //-------------------------------------------------------------------------------------
   sCreditoPos, sCreditoNeg,
   sDebitoPos, sDebitoNeg : String;
   bUsarAbs : Boolean;
   //---------------------------------------------------------------------------
   iTipoFechamento : Byte;
begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  iTipoFechamento := buscaFlagTipoFechamento(trunc(nGrupoAtual));

  try
    try
      //-------------------------------------------------------------------------------
      // Carga dos parametros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);

      //-------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //-------------------------------------------------------------------------------
      iPlanoConta := ParamCAF.PLANOVIGENTE;

      //-------------------------------------------------------------------------------
      // Seleciona qual é o componente do saldo que será processado
      //-------------------------------------------------------------------------------
      if sTipoTab = 'B' then
      begin
        iTipoMov1 := 01;
        iTipoMov2 := 15;
        iTipoMov3 := 14;
        iTipoMov4 := 21;
        sMensErro := '';
      end
      else
        if sTipoTab = 'R' then
        begin
          //----------------------------------------------------------------------------
          // Verifica se as contas patrimoniais de reavaliacao são iguais
          //----------------------------------------------------------------------------
          LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), 08, 'D', iPlanoConta, sCreditoPos, iFlgSegregaDeb);
          LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), 23, 'C', iPlanoConta, sCreditoNeg, iFlgSegregaDeb);
          LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo) , 08, 'D', iPlanoConta, sDebitoPos , iFlgSegregaDeb);
          LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo) , 23, 'C', iPlanoConta, sDebitoNeg , iFlgSegregaDeb);
          //----------------------------------------------------------------------------
          if (sCreditoPos = sCreditoNeg) and (sDebitoPos = sDebitoNeg) then
            bUsarAbs := False
          else
            if (sCreditoPos <> sCreditoNeg) and (sDebitoPos <> sDebitoNeg) then
              bUsarAbs := True
            else
            begin
              MessageInfo := CMTranslate('A Estrutura da Parametrização Contábil dos Grupos Contábeis e suas Contas de Reavaliação Patrimonial são Incompatíveis');
              Raise Exception.Create(MessageInfo);
            end;
          //----------------------------------------------------------------------------
          if nValorB > 0 then
          begin
            iTipoMov1 := 08;
            iTipoMov3 := 18;
          end
          else
          begin
            iTipoMov1 := 23;
            iTipoMov3 := 69;
          end;
            iTipoMov2 := 22;
            iTipoMov4 := 19;
            sMensErro := CMTranslate(' (Reavaliação) ');
        end
        else
        begin
          iTipoMov1 := 09;
          iTipoMov2 := 34;
          iTipoMov3 := 35;
          iTipoMov4 := 36;
          sMensErro := CMTranslate(' (Acréscimo) ');
        end;
        //-------------------------------------------------------------------------------
        // Contas Contábeis não definidas por Centros de Custo
        //-------------------------------------------------------------------------------
        if not bCtaxCCusto then
        begin
          if nValorB <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Busca conta a débito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov1, 'C', iPlanoConta, sDebito, iFlgSegregaDeb);
            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência do Custo no Grupo ') + sGrupoNovo +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
            //-------------------------------------------------------------------------
            // Busca conta a crédito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov1, 'D', iPlanoConta, sCredito, iFlgSegregaCre)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre);

            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência do Custo no Grupo ') + sGrupoAtual +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //----------------------------------------------------------------------------
          if nValorCMB <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Busca conta a débito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov2, 'C', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb);
            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência da Correção Monetária no Grupo ') + sGrupoNovo +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
            //-------------------------------------------------------------------------
            // Busca conta a crédito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov2, 'D', iPlanoConta, sCreditoCM, iFlgSegregaCMCre)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre);

            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência da Correção Monetária no Grupo ') + sGrupoAtual +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //----------------------------------------------------------------------------
          if nValorD <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Busca conta a débito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov3, 'C', iPlanoConta, sDebitoD, iFlgSegregaDDeb)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb);

            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência da Depreciação no Grupo ') + sGrupoNovo +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
            //-------------------------------------------------------------------------
            // Busca conta a crédito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov3, 'D', iPlanoConta, sCreditoD, iFlgSegregaDCre);

            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência da Depreciação no Grupo ') + sGrupoAtual +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //----------------------------------------------------------------------------
          if nValorCMD <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Busca conta a débito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov4, 'C', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb);

            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência da Correção Monetária da Depreciação no Grupo ') + sGrupoNovo +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
            //-------------------------------------------------------------------------
            // Busca conta a crédito
            //-------------------------------------------------------------------------
            if iTipoMov1 <> 23 then
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre)
            else
              bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov4, 'D', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre);

            if not bOk then
            begin
              MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência da Correção Monetária da Depreciação no Grupo ') + sGrupoAtual +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                             CMTranslate(' não cadastrada !') + sMensErro;
              Raise Exception.Create(MessageInfo);
            end;
          end;
        end;
        //-------------------------------------------------------------------------------
        // Transfere para arrays os rateios de custo, para permitir que as transferências
        // de local sejam possíveis sem afetar a transação
        //-------------------------------------------------------------------------------
        FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjuntoAtual);
        iMaxCcRD := 1;
        while not FcdsCcRD.EOF do
        begin
          aCcRD[iMaxCcRD].CENTROCUSTOATUAL  := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
          aCcRD[iMaxCcRD].PARTICIPACAOATUAL := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
          aCcRD[iMaxCcRD].CENTROCUSTONOVO   := '';
          aCcRD[iMaxCcRD].PARTICIPACAONOVO  := 0;
          iMaxCcRD := iMaxCcRD + 1;
          FcdsCcRD.Next;
        end;
        //-------------------------------------------------------------------------------
        FcdsCcRD.Data := Conjunto.ListaRateioCustos(nEmpresaProp, nConjuntoNovo);
        iCcRD := 1;
        while not FcdsCcRD.EOF do
        begin
          aCcRD[iCcRD].CENTROCUSTONOVO  := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
          aCcRD[iCcRD].PARTICIPACAONOVO := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
          iCcRD := iCcRD + 1;

          if iCcRD > iMaxCcRD then
          begin
            iMaxCcRD := iCcRD;
            aCcRD[iMaxCcRD].CENTROCUSTOATUAL  := '';
            aCcRD[iMaxCcRD].PARTICIPACAOATUAL := 0;
          end;
          FcdsCcRD.Next;
        end;
        FcdsCcRD.Close;
        //-------------------------------------------------------------------------------
        // Atualiza o Centro de Custo do Conjunto Novo, caso haja tranferência de local
        //-------------------------------------------------------------------------------
        if sCCustoNovo <> sCCustoAtual then
        begin
          iCcRD := 1;
          while iCcRD < iMaxCcRD do
          begin
            if aCcRD[iCcRD].CENTROCUSTONOVO = sCCustoAtual then
              aCcRD[iCcRD].CENTROCUSTONOVO := sCCustoNovo;
            iCcRD := iCcRD + 1;
          end;
        end;
        //-------------------------------------------------------------------------------
        // Verifica se existe mudanca de Conta Contabil e/ou Centro de Custo.
        // Caso não haja mudança, não gera planilha contabil.
        //-------------------------------------------------------------------------------
        bProcessar := True;
        if ((sDebito  = sCredito)  and (sDebitoCM  = sCreditoCM) and
            (sDebitoD = sCreditoD) and (sDebitoCMD = sCreditoCMD)) then
        begin
          bProcessar := False;
          //----------------------------------------------------------------------------
          // Verifica se existem centros de custos para as contas acima
          //----------------------------------------------------------------------------
          sObrigaCC := 'N';
          if sDebito <> '' then
          begin
            if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                  sDebito, False, False) then
            begin
              MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
              Raise Exception.Create(MessageInfo);
            end;

            sObrigaCc := ContaContab.ObrigaCentroCusto;
          end;

          if sObrigaCC = 'N' then
            if sDebitoCM <> '' then
            begin
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebitoCM, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sObrigaCc := ContaContab.ObrigaCentroCusto;
            end;

            if sObrigaCC = 'N' then
              if sCreditoD <> '' then
              begin
                if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                      sCreditoD, False, False) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end;
                sObrigaCc := ContaContab.ObrigaCentroCusto;
              end;

            if sObrigaCC = 'N' then
              if sCreditoCMD <> '' then
                if sCreditoD <> '' then
                begin
                  if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                        sCreditoCMD, False, False) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end;
                  sObrigaCc := ContaContab.ObrigaCentroCusto;
                end;

            //----------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
              iCcRDAtual := 1;
              while iCcRDAtual < iMaxCcRD do
              begin
                iCcRDNovo := 1;
                while iCcRDNovo < iMaxCcRD do
                begin
                  if (aCcRD[iCcRDAtual].CENTROCUSTOATUAL <> aCcRD[iCcRDNovo].CENTROCUSTONOVO) and
                     (aCcRD[iCcRDAtual].CENTROCUSTOATUAL <> '') and (aCcRD[iCcRDNovo].CENTROCUSTONOVO <> '') then
                    bProcessar := True;
                  iCcRDNovo  := iCcRDNovo  + 1;
                end;
                iCcRDAtual := iCcRDAtual + 1;
              end;
            end;
        end;
        if not bProcessar then
        begin
          Result := True;
          Exit;
        end;
        //-------------------------------------------------------------------------------
        // Composição do Histórico Contábil
        //-------------------------------------------------------------------------------
        sHistor2   := trim(sPlaca);
        if (nModulo = 54) or (nModulo = 64) or (nModulo = 135) then
          sHistor2 := sHistor2 + BuscaCodigoImovel(Trunc(nBem));
        sHistor3   := trimleft(copy(sDesBem, 1,40));
        sHistor4   := trimleft(copy(sDesBem,41,80));
        sHistor5   := '';
        sNumDoc    := FormatDateTime('yyyymmdd',dDataLanc);
        //-------------------------------------------------------------------------------
        // Processamento do Rateio dos Custos
        //-------------------------------------------------------------------------------
        nParticip1 := 0;
        nParticip2 := 0;
        nParticip3 := 0;
        nParticip4 := 0;
        nParticip5 := 0;
        nParticip6 := 0;
        nParticip7 := 0;
        nParticip8 := 0;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        nMaxCCusto1 := 0.000000; nSomaRateios1 := 0.00; iMaxFlgSegregaDeb1 := 0; iMaxFlgSegregaCre1 := 0;
        nMaxCCusto2 := 0.000000; nSomaRateios2 := 0.00; iMaxFlgSegregaDeb2 := 0; iMaxFlgSegregaCre2 := 0;
        nMaxCCusto3 := 0.000000; nSomaRateios3 := 0.00; iMaxFlgSegregaDeb3 := 0; iMaxFlgSegregaCre3 := 0;
        nMaxCCusto4 := 0.000000; nSomaRateios4 := 0.00; iMaxFlgSegregaDeb4 := 0; iMaxFlgSegregaCre4 := 0;
        nMaxCCusto5 := 0.000000; nSomaRateios5 := 0.00; iMaxFlgSegregaDeb5 := 0; iMaxFlgSegregaCre5 := 0;
        nMaxCCusto6 := 0.000000; nSomaRateios6 := 0.00; iMaxFlgSegregaDeb6 := 0; iMaxFlgSegregaCre6 := 0;
        nMaxCCusto7 := 0.000000; nSomaRateios7 := 0.00; iMaxFlgSegregaDeb7 := 0; iMaxFlgSegregaCre7 := 0;
        nMaxCCusto8 := 0.000000; nSomaRateios8 := 0.00; iMaxFlgSegregaDeb8 := 0; iMaxFlgSegregaCre8 := 0;
        //-------------------------------------------------------------------------------
        // Processa a Baixa dos valores da Conta Contábil / Centro de Custo Atuais
        //-------------------------------------------------------------------------------
        iCcRD := 1;
        while iCcRD < iMaxCcRD do
        begin
          //----------------------------------------------------------------------------
          // Custo
          //----------------------------------------------------------------------------
          if nValorB <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //-------------------------------------------------------------------------
            if nParticip1 < 100 then
            begin
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := aCcRD[iCcRD].CENTROCUSTONOVO;
                //-------------------------------------------------------------------
                // Busca conta a débito
                //-------------------------------------------------------------------
                // Se for reavaliacao negativa, inverter o tipo de lançamento
                //-------------------------------------------------------------------
                if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb)
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov1, 'C', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb);

                if not bOk then
                begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência do Custo no Grupo ') + sGrupoNovo +
                                 CMTranslate(' no Centro de Custo ') + sCCDeb +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebito, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;

              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebito,
                                                 aCcRD[iCcRD].CENTROCUSTONOVO) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  nParticip1 := aCcRD[iCcRD].PARTICIPACAONOVO;
                end;
              end
              else
              begin
                sCCDeb     := '';
                nParticip1 := 100;
              end;
              //----------------------------------------------------------------------
              nFatorDeb := nParticip1 / 100;
            end
            else
            begin
              nFatorDeb := 0;
            end;
            //-------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //-------------------------------------------------------------------------
            if nParticip2 < 100 then
            begin
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := aCcRD[iCcRD].CENTROCUSTOATUAL;
                //-------------------------------------------------------------------
                // Busca conta a crédito
                //-------------------------------------------------------------------
                // Se for reavaliacao negativa, inverter o tipo de lançamento
                //-------------------------------------------------------------------
                if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov1, 'D', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre)
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre);

                if not bOk then
                begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência do Custo no Grupo ') + sGrupoAtual +
                                 CMTranslate(' no Centro de Custo ') + sCCCre +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sCredito, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;

              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCredito,
                                                 aCcRD[iCcRD].CENTROCUSTOATUAL) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCCCre     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  nParticip2 := aCcRD[iCcRD].PARTICIPACAOATUAL;
                end;
                end
                else
                begin
                  sCCCre     := '';
                  nParticip2 := 100;
                end;
                //----------------------------------------------------------------------
                nFatorCre := nParticip2 / 100;
              end
              else
              begin
                nFatorCre := 0;
              end;
              //-------------------------------------------------------------------------
              nValLancDeb := ConvNum(nValorB * nFatorDeb);
              nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
              nValLancCre := ConvNum(nValorB * nFatorCre);
              nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
              //-------------------------------------------------------------------------
              sHistor1 := CMTranslate('Tranferencia do Custo de Aquisicao');

              if (nGrupoAtual <> nGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
              begin
                //----------------------------------------------------------------------
                // Acumula os valores proporcionais e apura o centro de custo
                // com a maior proporção
                //----------------------------------------------------------------------
                nSomaRateios1 := ConvNum(nSomaRateios1 + nValLancDeb);
                nSomaRateios2 := ConvNum(nSomaRateios2 + nValLancCre);
                if aCcRD[iCcRD].PARTICIPACAONOVO > nMaxCCusto1 then
                begin
                  sMaxDebito1            := sDebito;
                  iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
                  sMaxNomeContaDeb1      := sNomeContaDeb;
                  sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
                  sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
                  sMaxTipConvGerDeb1     := sTipConvGerDeb;
                  //-------------------------------------------------------------------
                  sMaxCCustoDeb1         := sCcDeb;
                  nMaxCCusto1            := aCcRD[iCcRD].PARTICIPACAONOVO;
                end;

                if aCcRD[iCcRD].PARTICIPACAOATUAL > nMaxCCusto2 then
                begin
                  sMaxCredito2           := sCredito;
                  iMaxFlgSegregaCre2     := iFlgSegregaCre;
                  sMaxNomeContaCre2      := sNomeContaCre;
                  sMaxObrigaSubContaCre2 := sObrigaSubContaCre;
                  sMaxTipConvOfiCre2     := sTipConvOfiCre;
                  sMaxTipConvGerCre2     := sTipConvGerCre;
                  //-------------------------------------------------------------------
                  sMaxCCustoCre2         := sCcCre;
                  nMaxCCusto2            := aCcRD[iCcRD].PARTICIPACAOATUAL;
                end;
                //----------------------------------------------------------------------
                if bUsarAbs then
                begin
                  nValLancDeb := abs(nValLancDeb);
                  nValLancCre := abs(nValLancCre);
                end;
                //----------------------------------------------------------------------
                if nValLancDeb = nValLancCre then
                begin
                  //-------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                               iFlgSegregaDeb, iFlgSegregaCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancDeb, sNomeContaDeb,sObrigaSubContaDeb,
                                               sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                               sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  //-------------------------------------------------------------------
                  // Lançamento a Débito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta, sDebito, '', sCcDeb, '',
                                               iFlgSegregaDeb, iFlgSegregaCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoNovo),
                                               sGrupoNovo, nValLancDeb, sNomeContaDeb,
                                               sObrigaSubContaDeb,'','',
                                               sTipConvOfiDeb, sTipConvGerDeb,'','',
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                  //-------------------------------------------------------------------
                  // Lançamento a Crédito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, '', sCredito, '', sCcCre,
                                               iFlgSegregaDeb, iFlgSegregaCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancCre,'','',sNomeContaCre,
                                               sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end;
              end;
            end;
            //----------------------------------------------------------------------------
            // Correção Monetária
            //----------------------------------------------------------------------------
            if nValorCMB <> 0 then
            begin
              //-------------------------------------------------------------------------
              // Rateio por Centro de Custo da Entrada do Custo Novo
              //-------------------------------------------------------------------------
              if nParticip3 < 100 then
              begin
                //----------------------------------------------------------------------
                // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                //----------------------------------------------------------------------
                if bCtaxCCusto then
                begin
                  sCCDeb := aCcRD[iCcRD].CENTROCUSTONOVO;
                  //-------------------------------------------------------------------
                  // Busca conta a débito
                  //-------------------------------------------------------------------
                  // Se for reavaliacao negativa, inverter o tipo de lançamento
                  //-------------------------------------------------------------------
                  if iTipoMov1 <> 23 then
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov2, 'D', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb)
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov2, 'C', iPlanoConta, sDebitoCM, iFlgSegregaCMDeb, bCtaxCCusto, sCCDeb);

                  if not bOk then
                  begin
                    MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência da Correção Monetária no Grupo ') + sGrupoNovo +
                                   CMTranslate(' no Centro de Custo ') + sCCDeb +
                                   CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                   CMTranslate(' não cadastrada !') + sMensErro;
                    Raise Exception.Create(MessageInfo);
                  end;
                end;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Débito é válida
                //----------------------------------------------------------------------
                if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                      sDebitoCM, False, False) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end;

                sNomeContaDeb      := ContaContab.NomeConta;
                sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
                sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
                sTipConvOfiDeb     := ContaContab.TipoConvOfi;
                sTipConvGerDeb     := ContaContab.TipoConvGeren;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Débito obriga centro de custo
                //----------------------------------------------------------------------
                if sObrigaCcDeb = 'S' then
                begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCM,
                                                   aCcRD[iCcRD].CENTROCUSTONOVO) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end
                  else
                  begin
                    sCcDeb     := aCcRD[iCcRD].CENTROCUSTONOVO;
                    nParticip3 := aCcRD[iCcRD].PARTICIPACAONOVO;
                  end;
                end
                else
                begin
                  sCCDeb     := '';
                  nParticip3 := 100;
                end;
                //----------------------------------------------------------------------
                nFatorDeb := nParticip3 / 100;
              end
              else
              begin
                nFatorDeb := 0;
              end;
              //-------------------------------------------------------------------------
              // Rateio por Centro de Custo da Baixa do Custo Atual
              //-------------------------------------------------------------------------
              if nParticip4 < 100 then
              begin
                //----------------------------------------------------------------------
                // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
                //----------------------------------------------------------------------
                if bCtaxCCusto then
                begin
                  sCCCre := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  //-------------------------------------------------------------------
                  // Busca conta a crédito
                  //-------------------------------------------------------------------
                  // Se for reavaliacao negativa, inverter o tipo de lançamento
                  //-------------------------------------------------------------------
                  if iTipoMov1 <> 23 then
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov2, 'D', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre)
                  else
                    bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov2, 'C', iPlanoConta, sCreditoCM, iFlgSegregaCMCre, bCtaxCCusto, sCCCre);

                  if not bOk then
                  begin
                    MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência da Correção Monetária no Grupo ') + sGrupoAtual +
                                   CMTranslate(' no Centro de Custo ') + sCCCre +
                                   CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov2) +
                                   CMTranslate(' não cadastrada !') + sMensErro;
                    Raise Exception.Create(MessageInfo);
                  end;
                end;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Crédito é válida
                //----------------------------------------------------------------------
                if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                      sCreditoCM, False, False) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end;
                sNomeContaCre      := ContaContab.NomeConta;
                sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
                sObrigaSubContaCre := ContaContab.ObrigaSubConta;
                sTipConvOfiCre     := ContaContab.TipoConvOfi;
                sTipConvGerCre     := ContaContab.TipoConvGeren;
                //----------------------------------------------------------------------
                // Verifica se a conta contábil a Crédito obriga centro de custo
                //----------------------------------------------------------------------
                if sObrigaCcCre = 'S' then
                begin
                  if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCM,
                                                   aCcRD[iCcRD].CENTROCUSTOATUAL) then
                  begin
                    MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                  end
                  else
                  begin
                    sCcCre     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                    nParticip4 := aCcRD[iCcRD].PARTICIPACAOATUAL;
                  end;
                end
                else
                begin
                  sCCCre     := '';
                  nParticip4 := 100;
                end;
                //----------------------------------------------------------------------
                nFatorCre := nParticip4 / 100;
              end
              else
              begin
                nFatorCre := 0;
              end;
              //-------------------------------------------------------------------------
              nValLancDeb := ConvNum(nValorCMB * nFatorDeb);
              nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
              nValLancCre := ConvNum(nValorCMB * nFatorCre);
              nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
              //-------------------------------------------------------------------------
              sHistor1 := CMTranslate('Tranferencia da Correcao Monetaria');

              if (nGrupoAtual <> nGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
              begin
                //----------------------------------------------------------------------
                // Acumula os valores proporcionais e apura o centro de custo
                // com a maior proporção
                //----------------------------------------------------------------------
                nSomaRateios3 := ConvNum(nSomaRateios3 + nValLancDeb);
                nSomaRateios4 := ConvNum(nSomaRateios4 + nValLancCre);
                if aCcRD[iCcRD].PARTICIPACAONOVO > nMaxCCusto3 then
                begin
                  sMaxDebito3            := sDebitoCM;
                  iMaxFlgSegregaDeb3     := iFlgSegregaCMDeb;
                  sMaxNomeContaDeb3      := sNomeContaDeb;
                  sMaxObrigaSubContaDeb3 := sObrigaSubContaDeb;
                  sMaxTipConvOfiDeb3     := sTipConvOfiDeb;
                  sMaxTipConvGerDeb3     := sTipConvGerDeb;
                  //-------------------------------------------------------------------
                  sMaxCCustoDeb3         := sCcDeb;
                  nMaxCCusto3            := aCcRD[iCcRD].PARTICIPACAONOVO;
                end;

                if aCcRD[iCcRD].PARTICIPACAOATUAL > nMaxCCusto4 then
                begin
                  sMaxCredito4           := sCreditoCM;
                  iMaxFlgSegregaCre4     := iFlgSegregaCMCre;
                  sMaxNomeContaCre4      := sNomeContaCre;
                  sMaxObrigaSubContaCre4 := sObrigaSubContaCre;
                  sMaxTipConvOfiCre4     := sTipConvOfiCre;
                  sMaxTipConvGerCre4     := sTipConvGerCre;
                  //-------------------------------------------------------------------
                  sMaxCCustoCre4         := sCcCre;
                  nMaxCCusto4            := aCcRD[iCcRD].PARTICIPACAOATUAL;
                end;
                //----------------------------------------------------------------------
                if bUsarAbs then
                begin
                  nValLancDeb := abs(nValLancDeb);
                  nValLancCre := abs(nValLancCre);
                end;
                //----------------------------------------------------------------------
                if nValLancDeb = nValLancCre then
                begin
                  //-------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, sCreditoCM, sCcDeb, sCcCre,
                                               iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancDeb, sNomeContaDeb,sObrigaSubContaDeb,
                                               sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                               sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  //-------------------------------------------------------------------
                  // Lançamento a Débito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCM, '', sCcDeb, '',
                                               iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoNovo),
                                               sGrupoNovo, nValLancDeb, sNomeContaDeb,
                                               sObrigaSubContaDeb,'','',
                                               sTipConvOfiDeb, sTipConvGerDeb,'','',
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                    //-------------------------------------------------------------------
                    // Lançamento a Crédito
                    //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoCM, '', sCcCre,
                                               iFlgSegregaCMDeb, iFlgSegregaCMCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancCre, '', '',sNomeContaCre,
                                               sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end;
              end;
          end;
          //----------------------------------------------------------------------------
          // Depreciação
          //----------------------------------------------------------------------------
          if nValorD <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //-------------------------------------------------------------------------
            if nParticip5 < 100 then
            begin
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := aCcRD[iCcRD].CENTROCUSTOATUAL;
                //-------------------------------------------------------------------
                // Busca conta a débito
                //-------------------------------------------------------------------
                // Se for reavaliacao negativa, inverter o tipo de lançamento
                //-------------------------------------------------------------------
                if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov3, 'C', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb)
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov3, 'D', iPlanoConta, sDebitoD, iFlgSegregaDDeb, bCtaxCCusto, sCCDeb);

                if not bOk then
                begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência da Depreciação no Grupo ') + sGrupoAtual +
                                 CMTranslate(' no Centro de Custo ') + sCCDeb +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebitoD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoD,
                                                 aCcRD[iCcRD].CENTROCUSTOATUAL) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  nParticip5 := aCcRD[iCcRD].PARTICIPACAOATUAL;
                end;
              end
              else
              begin
                sCCDeb     := '';
                nParticip5 := 100;
              end;
              //----------------------------------------------------------------------
              nFatorDeb := nParticip5 / 100;
            end
            else
            begin
              nFatorDeb := 0;
            end;
            //-------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //-------------------------------------------------------------------------
            if nParticip6 < 100 then
            begin
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := aCcRD[iCcRD].CENTROCUSTONOVO;
                //-------------------------------------------------------------------
                // Busca conta a crédito
                //-------------------------------------------------------------------
                // Se for reavaliacao negativa, inverter o tipo de lançamento
                //-------------------------------------------------------------------
                if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov3, 'C', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre)
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov3, 'D', iPlanoConta, sCreditoD, iFlgSegregaDCre, bCtaxCCusto, sCCCre);

                if not bOk then
                begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência da Depreciação no Grupo ') + sGrupoNovo +
                                 CMTranslate(' no Centro de Custo ') + sCCCre +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov3) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sCreditoD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;

              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoD,
                                                 aCcRD[iCcRD].CENTROCUSTONOVO) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcCre     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  nParticip6 := aCcRD[iCcRD].PARTICIPACAONOVO;
                end;
              end
              else
              begin
                sCCCre     := '';
                nParticip6 := 100;
              end;
              //----------------------------------------------------------------------
              nFatorCre := nParticip6 / 100;
              end
              else
              begin
                nFatorCre := 0;
              end;
              //-------------------------------------------------------------------------
              nValLancDeb := ConvNum(nValorD * nFatorDeb);
              nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
              nValLancCre := ConvNum(nValorD * nFatorCre);
              nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
              //-------------------------------------------------------------------------
              Case iTipoFechamento of
                0 : sHistor1 := CMTranslate('Transferencia da Depreciacao');
                1 : sHistor1 := CMTranslate('Transferencia da Amortização');
              end;
              if (nGrupoAtual <> nGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
              begin
                //----------------------------------------------------------------------
                // Acumula os valores proporcionais e apura o centro de custo
                // com a maior proporção
                //----------------------------------------------------------------------
                nSomaRateios5 := ConvNum(nSomaRateios5 + nValLancDeb);
                nSomaRateios6 := ConvNum(nSomaRateios6 + nValLancCre);
                if aCcRD[iCcRD].PARTICIPACAOATUAL > nMaxCCusto5 then
                begin
                  sMaxDebito5            := sDebitoD;
                  iMaxFlgSegregaDeb5     := iFlgSegregaDDeb;
                  sMaxNomeContaDeb5      := sNomeContaDeb;
                  sMaxObrigaSubContaDeb5 := sObrigaSubContaDeb;
                  sMaxTipConvOfiDeb5     := sTipConvOfiDeb;
                  sMaxTipConvGerDeb5     := sTipConvGerDeb;
                  //-------------------------------------------------------------------
                  sMaxCCustoDeb5         := sCcDeb;
                  nMaxCCusto5            := aCcRD[iCcRD].PARTICIPACAOATUAL;
                end;

                if aCcRD[iCcRD].PARTICIPACAONOVO > nMaxCCusto6 then
                begin
                  sMaxCredito6           := sCreditoD;
                  iMaxFlgSegregaCre6     := iFlgSegregaDCre;
                  sMaxNomeContaCre6      := sNomeContaCre;
                  sMaxObrigaSubContaCre6 := sObrigaSubContaCre;
                  sMaxTipConvOfiCre6     := sTipConvOfiCre;
                  sMaxTipConvGerCre6     := sTipConvGerCre;
                  //-------------------------------------------------------------------
                  sMaxCCustoCre6         := sCcCre;
                  nMaxCCusto6            := aCcRD[iCcRD].PARTICIPACAONOVO;
                end;
                //----------------------------------------------------------------------
                if bUsarAbs then
                begin
                  nValLancDeb := abs(nValLancDeb);
                  nValLancCre := abs(nValLancCre);
                end;
                //----------------------------------------------------------------------
                if nValLancDeb = nValLancCre then
                begin
                  //-------------------------------------------------------------------
                  // Lançamento em Partida Dobrada
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, sCreditoD, sCcDeb, sCcCre,
                                               iFlgSegregaDDeb, iFlgSegregaDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancDeb, sNomeContaDeb,sObrigaSubContaDeb,
                                               sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                               sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  //-------------------------------------------------------------------
                  // Lançamento a Débito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoD, '', sCcDeb, '',
                                               iFlgSegregaDDeb, iFlgSegregaDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancDeb, sNomeContaDeb,
                                               sObrigaSubContaDeb, '', '',
                                               sTipConvOfiDeb, sTipConvGerDeb, '', '',
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);

                  //-------------------------------------------------------------------
                  // Lançamento a Crédito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoD, '', sCcCre,
                                               iFlgSegregaDDeb, iFlgSegregaDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoNovo),
                                               sGrupoNovo, nValLancCre, '','',sNomeContaCre,
                                               sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end;
              end;
          end;
          //----------------------------------------------------------------------------
          // Correção Monetária da Depreciacao
          //----------------------------------------------------------------------------
          if nValorCMD <> 0 then
          begin
            //-------------------------------------------------------------------------
            // Rateio por Centro de Custo da Entrada do Custo Novo
            //-------------------------------------------------------------------------
            if nParticip7 < 100 then
            begin
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCDeb := aCcRD[iCcRD].CENTROCUSTOATUAL;
                //-------------------------------------------------------------------
                // Busca conta a débito
                //-------------------------------------------------------------------
                // Se for reavaliacao negativa, inverter o tipo de lançamento
                //-------------------------------------------------------------------
                if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov4, 'C', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb)
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoAtual), iTipoMov4, 'D', iPlanoConta, sDebitoCMD, iFlgSegregaCMDDeb, bCtaxCCusto, sCCDeb);

                if not bOk then
                begin
                  MessageInfo := CMTranslate('Conta a Débito para o Movimento de Transferência da Correção Monetária da Depreciação no Grupo ') + sGrupoAtual +
                                 CMTranslate(' no Centro de Custo ') + sCCDeb +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                 CMTranslate(' não cadastrada !') + sMensErro;
                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sDebitoCMD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaDeb      := ContaContab.NomeConta;
              sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
              sTipConvOfiDeb     := ContaContab.TipoConvOfi;
              sTipConvGerDeb     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Débito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcDeb = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sDebitoCMD,
                                                 aCcRD[iCcRD].CENTROCUSTOATUAL) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcDeb     := aCcRD[iCcRD].CENTROCUSTOATUAL;
                  nParticip7 := aCcRD[iCcRD].PARTICIPACAOATUAL;
                end;
              end
              else
              begin
                sCCDeb     := '';
                nParticip7 := 100;
              end;
              //----------------------------------------------------------------------
              nFatorDeb := nParticip7 / 100;
            end
            else
            begin
              nFatorDeb := 0;
            end;
            //-------------------------------------------------------------------------
            // Rateio por Centro de Custo da Baixa do Custo Atual
            //-------------------------------------------------------------------------
            if nParticip8 < 100 then
            begin
              //----------------------------------------------------------------------
              // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
              //----------------------------------------------------------------------
              if bCtaxCCusto then
              begin
                sCCCre := aCcRD[iCcRD].CENTROCUSTONOVO;
                //-------------------------------------------------------------------
                // Busca conta a crédito
                //-------------------------------------------------------------------
                // Se for reavaliacao negativa, inverter o tipo de lançamento
                //-------------------------------------------------------------------
                if iTipoMov1 <> 23 then
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov4, 'C', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre)
                else
                  bOk := LeParamCAFxContab(Trunc(nEmpresaProp), Trunc(nGrupoNovo), iTipoMov4, 'D', iPlanoConta, sCreditoCMD, iFlgSegregaCMDCre, bCtaxCCusto, sCCCre);

                if not bOk then
                begin
                  MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Transferência da Correção Monetária da Depreciação no Grupo ') + sGrupoNovo +
                                 CMTranslate(' no Centro de Custo ') + sCCCre +
                                 CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov4) +
                                 CMTranslate(' não cadastrada !') + sMensErro;

                  Raise Exception.Create(MessageInfo);
                end;
              end;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito é válida
              //----------------------------------------------------------------------
              if not ContaContab.TestaContaContabil(iPlanoConta, Trunc(nEmpresaProp), iPeriodo, iExercicio,
                                                    sCreditoCMD, False, False) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              sNomeContaCre      := ContaContab.NomeConta;
              sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
              sObrigaSubContaCre := ContaContab.ObrigaSubConta;
              sTipConvOfiCre     := ContaContab.TipoConvOfi;
              sTipConvGerCre     := ContaContab.TipoConvGeren;
              //----------------------------------------------------------------------
              // Verifica se a conta contábil a Crédito obriga centro de custo
              //----------------------------------------------------------------------
              if sObrigaCcCre = 'S' then
              begin
                if not ContaContab.TestaContaxCC(iPlanoConta, Trunc(nEmpresaProp), sCreditoCMD,
                                                 aCcRD[iCcRD].CENTROCUSTONOVO) then
                begin
                  MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  sCcCre     := aCcRD[iCcRD].CENTROCUSTONOVO;
                  nParticip8 := aCcRD[iCcRD].PARTICIPACAONOVO;
                end;
              end
              else
              begin
                sCCCre     := '';
                nParticip8 := 100;
              end;
              //----------------------------------------------------------------------
              nFatorCre := nParticip8 / 100;
            end
            else
            begin
              nFatorCre := 0;
            end;
            //-------------------------------------------------------------------------
            nValLancDeb := ConvNum(nValorCMD * nFatorDeb);
            nValLancDeb := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancDeb);
            nValLancCre := ConvNum(nValorCMD * nFatorCre);
            nValLancCre := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLancCre);
            //-------------------------------------------------------------------------

            Case iTipoFechamento of
              0 : sHistor1 := CMTranslate('Tranferencia da Correção Monetária da Depreciacao');
              1 : sHistor1 := CMTranslate('Tranferencia da Correção Monetária da Amortização');
            end;

            if (nGrupoAtual <> nGrupoNovo) or (sCCDeb <> '') or (sCCCre <> '') then
            begin
              //----------------------------------------------------------------------
              // Acumula os valores proporcionais e apura o centro de custo
              // com a maior proporção
              //----------------------------------------------------------------------
              nSomaRateios7 := ConvNum(nSomaRateios7 + nValLancDeb);
              nSomaRateios8 := ConvNum(nSomaRateios8 + nValLancCre);
              if aCcRD[iCcRD].PARTICIPACAOATUAL > nMaxCCusto7 then
              begin
                sMaxDebito7            := sDebitoCMD;
                iMaxFlgSegregaDeb7     := iFlgSegregaCMDDeb;
                sMaxNomeContaDeb7      := sNomeContaDeb;
                sMaxObrigaSubContaDeb7 := sObrigaSubContaDeb;
                sMaxTipConvOfiDeb7     := sTipConvOfiDeb;
                sMaxTipConvGerDeb7     := sTipConvGerDeb;
                //-------------------------------------------------------------------
                sMaxCCustoDeb7         := sCcDeb;
                nMaxCCusto7            := aCcRD[iCcRD].PARTICIPACAOATUAL;
              end;

              if aCcRD[iCcRD].PARTICIPACAONOVO > nMaxCCusto8 then
              begin
                sMaxCredito8           := sCreditoCMD;
                iMaxFlgSegregaCre8     := iFlgSegregaCMDCre;
                sMaxNomeContaCre8      := sNomeContaCre;
                sMaxObrigaSubContaCre8 := sObrigaSubContaCre;
                sMaxTipConvOfiCre8     := sTipConvOfiCre;
                sMaxTipConvGerCre8     := sTipConvGerCre;
                //-------------------------------------------------------------------
                sMaxCCustoCre8         := sCcCre;
                nMaxCCusto8            := aCcRD[iCcRD].PARTICIPACAONOVO;
              end;
              //----------------------------------------------------------------------
              if bUsarAbs then
              begin
                nValLancDeb := abs(nValLancDeb);
                nValLancCre := abs(nValLancCre);
              end;

              //----------------------------------------------------------------------
              if nValLancDeb = nValLancCre then
              begin
                //-------------------------------------------------------------------
                // Lançamento em Partida Dobrada
                //-------------------------------------------------------------------
                if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, sCreditoCMD, sCcDeb, sCcCre,
                                             iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                             Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                             sGrupoAtual, nValLancDeb ,sNomeContaDeb,sObrigaSubContaDeb,
                                             sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                             sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                             sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                  Raise Exception.Create(MessageInfo);
                end
                else
                begin
                  //-------------------------------------------------------------------
                  // Lançamento a Débito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, sDebitoCMD, '', sCcDeb, '',
                                               iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoAtual),
                                               sGrupoAtual, nValLancDeb, sNomeContaDeb,
                                               sObrigaSubContaDeb,'','',
                                               sTipConvOfiDeb, sTipConvGerDeb,'','',
                                               sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                  //-------------------------------------------------------------------
                  // Lançamento a Crédito
                  //-------------------------------------------------------------------
                  if not MontaPlanilhaContabil(Trunc(nModulo), trunc(nEmpresaProp), 0, iPlanoConta, '', sCreditoCMD, '', sCcCre,
                                               iFlgSegregaCMDDeb, iFlgSegregaCMDCre,
                                               Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp), Trunc(nBem), Trunc(nGrupoNovo),
                                               sGrupoNovo, nValLancCre ,'','',sNomeContaCre,
                                               sObrigaSubContaCre,'','',sTipConvOfiCre,sTipConvGerCre,
                                                sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
                    Raise Exception.Create(MessageInfo);
                end;
              end;
          end;
          //----------------------------------------------------------------------------
          iCcRD := iCcRD + 1;
        end;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios1 - nValorB) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito1, '', sMaxCcustoDeb1, '',
                                       iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoNovo), sGrupoNovo,
                                       ConvNum(nSomaRateios1 - nValorB),
                                       sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1, '', '',
                                       sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1, '', '',
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios2 - nValorB) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       '', sMaxCredito2, '', sMaxCcustoCre2,
                                       iMaxFlgSegregaDeb2, iMaxFlgSegregaCre2,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoAtual), sGrupoAtual,
                                       ConvNum(nSomaRateios2 - nValorB),
                                       '', '', sMaxNomeContaCre2, sMaxObrigaSubContaCre2,
                                       '', '', sMaxTipConvOfiCre2,sMaxTipConvGerCre2,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios3 - nValorCMB) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito3, '', sMaxCcustoDeb3, '',
                                       iMaxFlgSegregaDeb3, iMaxFlgSegregaCre3,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoNovo), sGrupoNovo,
                                       ConvNum(nSomaRateios3 - nValorCMB),
                                       sMaxNomeContaDeb3, sMaxObrigaSubContaDeb3, '', '',
                                       sMaxTipConvOfiDeb3, sMaxTipConvGerDeb3, '', '',
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios4 - nValorCMB) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       '', sMaxCredito4, '', sMaxCcustoCre4,
                                       iMaxFlgSegregaDeb4, iMaxFlgSegregaCre4,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoAtual), sGrupoAtual,
                                       ConvNum(nSomaRateios4 - nValorCMB),
                                       '', '', sMaxNomeContaCre4, sMaxObrigaSubContaCre4,
                                       '', '', sMaxTipConvOfiCre4,sMaxTipConvGerCre4,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios5 - nValorD) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito5, '', sMaxCcustoDeb5, '',
                                       iMaxFlgSegregaDeb5, iMaxFlgSegregaCre5,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoAtual), sGrupoAtual,
                                       ConvNum(nSomaRateios5 - nValorD),
                                       sMaxNomeContaDeb5, sMaxObrigaSubContaDeb5, '', '',
                                       sMaxTipConvOfiDeb5, sMaxTipConvGerDeb5, '', '',
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios6 - nValorD) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       '', sMaxCredito6, '', sMaxCcustoCre6,
                                       iMaxFlgSegregaDeb6, iMaxFlgSegregaCre6,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoNovo), sGrupoNovo,
                                       ConvNum(nSomaRateios6 - nValorD),
                                       '', '', sMaxNomeContaCre6, sMaxObrigaSubContaCre6,
                                       '', '', sMaxTipConvOfiCre6,sMaxTipConvGerCre6,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;

        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios7 - nValorCMD) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       sMaxDebito7, '', sMaxCcustoDeb7, '',
                                       iMaxFlgSegregaDeb7, iMaxFlgSegregaCre7,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoAtual), sGrupoAtual,
                                       ConvNum(nSomaRateios7 - nValorCMD),
                                       sMaxNomeContaDeb7, sMaxObrigaSubContaDeb7, '', '',
                                       sMaxTipConvOfiDeb7, sMaxTipConvGerDeb7, '', '',
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios8 - nValorCMD) <> 0 then
        begin
          if not MontaPlanilhaContabil(Trunc(nModulo), Trunc(nEmpresaProp), 0, iPlanoConta,
                                       '', sMaxCredito8, '', sMaxCcustoCre8,
                                       iMaxFlgSegregaDeb8, iMaxFlgSegregaCre8,
                                       Trunc(nSubConta), Trunc(nAtivProjeto), Trunc(nEmpresaProp),
                                       Trunc(nBem), Trunc(nGrupoNovo), sGrupoNovo,
                                       ConvNum(nSomaRateios8 - nValorCMD),
                                       '', '', sMaxNomeContaCre8, sMaxObrigaSubContaCre8,
                                       '', '', sMaxTipConvOfiCre8,sMaxTipConvGerCre8,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
        Result := True;
    except
      on E : Exception do
      begin
        MessageInfo := E.Message;
        Result := False;
      end;
    end;
  finally
    FcdsCcRd.Free;
  end;
end;

function TCtrlImobCAFxContab.ContaContabilComCC(iEmpresa, iGrupo, iTipoMov,
  iPlano: Integer; sTipoLanc, sCodCentroCusto: String;
  var iFlgSegrega: Integer): String;
var
   iQtd : Integer;
begin
   if not FcdsParamCAFxContab.IsEmpty then
   begin
      FcdsParamCAFxContab.Locate('IDGRUPO;IDTIPOMOVIMENTACAO;TIPOLANCAMENTO',
                                 VarArrayOf([iGrupo,iTipoMov,sTipoLanc]),[]);
      Result := trim(FcdsParamCAFxContab.FieldByName('PLACONTA').AsString);
      iFlgSegrega := FcdsParamCAFxContab.FieldByName('FLGSEGREGA').AsInteger;
      //----------------------------------------------------------------------------------
      iQtd := 0;
      while (not FcdsParamCAFxContab.EOF) and
            (FcdsParamCAFxContab.FieldByName('IDGRUPO').AsInteger = iGrupo) and
            (FcdsParamCAFxContab.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = iTipoMov) and
            (FcdsParamCAFxContab.FieldByName('TIPOLANCAMENTO').AsString = sTipoLanc) do
      begin
         iQtd := iQtd + 1;
         FcdsParamCAFxContab.Next;
      end;
      if iQtd <> 1 then
      begin
         Result := '';
         iFlgSegrega := -1;
      end;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO, FLGSEGREGA ' + #13 +
                                 ' FROM CONTASTIPOSMOVIMENTOGRUPOS ' + #13 +
                                 ' WHERE IDGRUPO = ' + inttostr(iGrupo) + #13 +
                                 '   AND IDTIPOMOVIMENTACAO = ' + inttostr(iTipoMov) + #13 +
                                 '   AND TIPOLANCAMENTO = ' + #39 + sTipoLanc + #39 + #13 +
                                 '   AND IDPESSOA = ' + inttostr(iEmpresa) + #13 +
                                 '   AND PLANO = ' + inttostr(iPlano) + #13);
      if _cds.RecordCount = 1 then
      begin
         Result := trim(_cds.FieldByName('PLACONTA').AsString);
         iFlgSegrega := _cds.FieldByName('FLGSEGREGA').AsInteger;
      end else
      begin
         Result := '';
         iFlgSegrega := -1;
      end;
   end;

end;

function TCtrlImobCAFxContab.ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov,
  iPlano: Integer; sTipoLanc: String; var iFlgSegrega: Integer): String;
var
   iQtd : Integer;
begin
   if not FcdsParamCAFxContab.IsEmpty then
   begin
      FcdsParamCAFxContab.Locate('IDGRUPO;IDTIPOMOVIMENTACAO;TIPOLANCAMENTO',
                                 VarArrayOf([iGrupo,iTipoMov,sTipoLanc]),[]);
      Result := trim(FcdsParamCAFxContab.FieldByName('PLACONTA').AsString);
      iFlgSegrega := FcdsParamCAFxContab.FieldByName('FLGSEGREGA').AsInteger;
      //----------------------------------------------------------------------------------
      iQtd := 0;
      while (not FcdsParamCAFxContab.EOF) and
            (FcdsParamCAFxContab.FieldByName('IDGRUPO').AsInteger = iGrupo) and
            (FcdsParamCAFxContab.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = iTipoMov) and
            (FcdsParamCAFxContab.FieldByName('TIPOLANCAMENTO').AsString = sTipoLanc) do
      begin
         iQtd := iQtd + 1;
         FcdsParamCAFxContab.Next;
      end;
      if iQtd <> 1 then
      begin
         Result := '';
         iFlgSegrega := -1;
      end;
   end else
   begin
      _cds.Data := GetDataPacket(' SELECT PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO, FLGSEGREGA ' + #13 +
                                 ' FROM CONTASTIPOSMOVIMENTOGRUPOS ' + #13 +
                                 ' WHERE IDGRUPO = ' + inttostr(iGrupo) + #13 +
                                 '   AND IDTIPOMOVIMENTACAO = ' + inttostr(iTipoMov) + #13 +
                                 '   AND TIPOLANCAMENTO = ' + #39 + sTipoLanc + #39 + #13 +
                                 '   AND IDPESSOA = ' + inttostr(iEmpresa) + #13 +
                                 '   AND PLANO = ' + inttostr(iPlano) + #13);
      if _cds.RecordCount = 1 then
      begin
         Result := trim(_cds.FieldByName('PLACONTA').AsString);
         iFlgSegrega := _cds.FieldByName('FLGSEGREGA').AsInteger;
      end else
      begin
         Result := '';
         iFlgSegrega := -1;
      end;
   end;
end;

function TCtrlImobCAFxContab.ConvNum(nValor: Extended): Extended;
begin
  Result := StrToFloat(Format('%20.5f',[nValor]));
end;

constructor TCtrlImobCAFxContab.Create;
begin
  inherited;
  FcdsMontaContab     := TClientDataSet.Create(nil);
  FcdsParamCAFxContab := TClientDataSet.Create(nil);

  _dMTBem := TdtmMTBem.Create(Self);
  ImobLancaContab := TCtrlImobLancamento.Create;
  LancaContab  := TCtrlLancamento.Create;
  ContaContab := TCtrlContaContabil.Create;
  PeriodoContab := TCtrlPeriodo.Create;
  ImobSegregacao := TCtrlImobSegregacao.Create;
  Segregacao  := TCtrlSegregacao.Create;
  ParamCAF  := TCtrlParamCAF.Create;
  Conjunto  := TCtrlConjunto.Create;

end;

destructor TCtrlImobCAFxContab.Destroy;
begin
  FreeAndNil(FcdsMontaContab);
  FreeAndNil(FcdsParamCAFxContab);
  FreeAndNil(ImobLancaContab);
  FreeAndNil(LancaContab);
  FreeAndNil(ContaContab);
  FreeAndNil(PeriodoContab);
  FreeAndNil(ImobSegregacao);
  FreeAndNil(Segregacao);
  FreeAndNil(ParamCAF);
  FreeAndNil(Conjunto);
  inherited;                 
end;

function TCtrlImobCAFxContab.InicializaMontaContab: Boolean;
begin
try
  //----------------------------------------------------------------------------------
  // Prepara o DataSet que irá acumular a planilha contábil para a integração
  //----------------------------------------------------------------------------------
    _dMTBem.sqlMontaContab.Prepare;
    FcdsMontaContab.Data := _dMTBem.sqlMontaContab.Data;
    Result := True;
  except
    On E : Exception Do
    begin
      MessageInfo := E.Message;
      Result := False;
    end;
  end;
end;

function TCtrlImobCAFxContab.IntegraContab(iEmpresa,
  iModulo: Integer): Boolean;
begin
  try
    //----------------------------------------------------------------------------------
    // Carga dos parametros do sistema
    //----------------------------------------------------------------------------------
    if not ParamCAF.CarregaProp(iEmpresa) then
       Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
    //----------------------------------------------------------------------------------
    if not ImobSegregacao.Active then
       ImobSegregacao.GetParams(iEmpresa);
    //----------------------------------------------------------------------------------
    if (iModulo = 54) or (iModulo = 64) or (iModulo = 135) then
    begin
       if (ParamCAF.INTEGRACONTAB = 'S') and (ParamCAF.FLGINTCAFCONT = 'S') then
          Result := True
       else
          Result := False;
    end else
       if ParamCAF.INTEGRACONTAB = 'S' then
          Result := True
       else
          Result := False;
  except
    On E : Exception Do
    begin
       MessageInfo := E.Message;
       Result := False;
    end;
 end;
end;

function TCtrlImobCAFxContab.LeParamCAFxContab(iEmpresa, iGrupo,
  iTipoMov: Integer; sTipoLanc: String; iPlano: Integer;
  var sPlaConta: String; var iFlgSegrega: Integer; bCtaxCCusto: Boolean;
  sCodCentroCusto: string): Boolean;
begin
   if (not bCtaxCCusto) or (trim(sCodCentroCusto) = '') then
   begin
      sPlaConta := ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano, sTipoLanc, iFlgSegrega);
   end else
   begin
      sPlaConta := ContaContabilComCC(iEmpresa, iGrupo, iTipoMov, iPlano, sTipoLanc, sCodCentroCusto, iFlgSegrega);
      if sPlaConta = '' then
         sPlaConta := ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano, sTipoLanc, iFlgSegrega);
   end;
   Result := sPlaConta <> '';
end;

function TCtrlImobCAFxContab.ModulodoGrupo(iEmpresaProp,
  iGrupo: Integer): Integer;
begin
   _cds.Data := GetDataPacket(' SELECT G.FLGIMOVEL ' +
                              ' FROM PLANOGRUPO PG, ' +
                              '      GRUPO G ' +
                              ' WHERE PG.IDGRUPO = ' + inttostr(iGrupo) +
                              '   AND PG.IDPESSOA = ' + inttostr(iEmpresaProp) +
                              '   AND PG.IDGRUPO = G.IDGRUPO ');
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('FLGIMOVEL').AsInteger = 0 then
      Result := 7
   else
      Result := 8;
end;

function TCtrlImobCAFxContab.ListaPlanoPatroxBem(nIdPessoa,
  nIdBem: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PPB.IDBEM,PPB.IDPESSOA,PPB.IDPLANOPREV,PPB.IDPATRO,PPB.PPBPERCRATEIO, ' + #13 +
           '        P.NOME AS NOMEPATRO, PLANO.NOME AS NOMEPLANOPREV ' + #13 +
           ' FROM PLANOPATROXBEM PPB, ' + #13 +
           '      PLANPREVCONTABIL PLANO, ' + #13 +
           '      PATRO, ' + #13 +
           '      PESSOA P ' + #13 +
           ' WHERE PPB.IDPESSOA = '+ floattostr(nIdPessoa) + #13 +
           '   AND PPB.IDBEM = ' + floattostr(nIdBem) + #13 +
           '   AND PPB.IDPLANOPREV = PLANO.IDPLANOPREV(+) ' + #13 +
           '   AND PPB.IDPATRO = PATRO.IDPESSOA(+) ' + #13 +
           '   AND PATRO.IDPESSOA = P.IDPESSOA(+) ' + #13 +
           ' ORDER BY PPB.PPBPERCRATEIO DESC';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlImobCAFxContab.MontaParamCAFxContab(iEmpresa,
  iPlano: Integer): Boolean;
begin
  try
    if FcdsParamCAFxContab.IsEmpty then
    begin
      _dMTBem.sqlParamCAFxContab2.Prepare;
      _dMTBem.sqlParamCAFxContab2.ParamByName('IDPESSOA').AsInteger := iEmpresa;
      _dMTBem.sqlParamCAFxContab2.ParamByName('PLANO').AsInteger := iPlano;
      FcdsParamCAFxContab.Data := _dMTBem.sqlParamCAFxContab2.Data;
     //-------------------------------------------------------------------------------
     if FcdsParamCAFxContab.IsEmpty then
      Raise Exception.Create(CMTranslate('Não existe parametrização contábil cadastrada no plano de contas ' + IntToStr(iPlano)));
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

function TCtrlImobCAFxContab.MontaPlanilhaContabil(iModulo, iEmpresaProp,
  iTipoContab, iPlano: Integer; sContaDeb, sContaCre, sCcDeb,
  sCcCre: String; iFlgSegregaDeb, iFlgSegregaCre, iSubConta, iAtivProjeto,
  iEmpresa, iBem, iGrupo: Integer; sGrupo: String; nValLanc: Extended;
  sNomeContaDeb, sObrigaSubContaDeb, sNomeContaCre, sObrigaSubContaCre,
  sPlaTipConvOfiDeb, sPlaTipConvGerDeb, sPlaTipConvOfiCre,
  sPlaTipConvGerCre, sNumDoc, sHistor1, sHistor2, sHistor3, sHistor4,
  sHistor5: String; bProvisao : Boolean = False): Boolean;
Var
   iPatro, iPlanoPrev,
   iCodSubContaDeb,
   iCodSubContaCre,
   iIdSegregaCriter     : Integer;
   nValOfi, nPercRateio : Currency;
   sContaSegregaCriter,
   sTipoLanc            : String;
   cdsRatPP             : TClientDataSet;
   fVlrTotCre,
   fVlrTotDeb,
   fVlrCre,
   fVlrDeb           : Currency;


begin
   if nValLanc = 0 then
   begin
      Result := True;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   cdsRatPP := TClientDataSet.Create(nil);
   fVlrTotCre := 0;
   fVlrCre := 0;
   fVlrDeb := 0;
   fVlrTotDeb := 0;
   Result := True;
   try
      try
         //-------------------------------------------------------------------------------
         // Tratamento dos Campos CHAR
         //-------------------------------------------------------------------------------
         sContaDeb := trim(sContaDeb);
         sContaCre := trim(sContaCre);
         sCcDeb := trim(sCcDeb);
         sCcCre := trim(sCcCre);
         //-------------------------------------------------------------------------------
         // Verifica se a SubConta está associada a Conta Contábil a Debito
         //-------------------------------------------------------------------------------
         if sObrigaSubContaDeb = 'S' then
         begin
            if not ContaContab.TestaContaxSC(iPlano, iEmpresa, iSubConta, sContaDeb) then
            begin
               if iSubConta <= 0 then
               begin
                  Raise Exception.Create(CMTranslate('A SubConta é obrigatória na Conta Contábil ') + sContaDeb +
                                         CMTranslate(' no Plano ') + inttostr(iPlano) + CMTranslate('. Informe-a.'));
               end else
               begin
                  Raise Exception.Create(CMTranslate('Associe a SubConta ') + inttostr(iSubConta) +
                                         CMTranslate(' à Conta Contábil ') + sContaDeb + CMTranslate(' no Plano ') + inttostr(iPlano) +
                                         CMTranslate(' usando o Cadastro de Plano de Contas no Sistema Contabilidade'));
               end;
            end else
            begin
               iCodSubContaDeb := iSubConta;
            end;
         end else
            iCodSubContaDeb := 0;
         //-------------------------------------------------------------------------------
         // Verifica se a SubConta está associada a Conta Contábil a Credito
         //-------------------------------------------------------------------------------
         if sObrigaSubContaCre = 'S' then
         begin
            if not ContaContab.TestaContaxSC(iPlano, iEmpresa, iSubConta, sContaCre) then
            begin
               if iSubConta <= 0 then
               begin
                  Raise Exception.Create(CMTranslate('A SubConta é obrigatória na Conta Contábil ') + sContaCre +
                                         CMTranslate(' no Plano ') + inttostr(iPlano) + CMTranslate('. Informe-a.'));
               end else
               begin
                  Raise Exception.Create(CMTranslate('Associe a SubConta ') + inttostr(iSubConta) +
                                         CMTranslate(' à Conta Contábil ') + sContaCre + CMTranslate(' no Plano ') + inttostr(iPlano) +
                                         CMTranslate(' usando o Cadastro de Plano de Contas no Sistema da Contabilidade'));
               end;
            end else
            begin
               iCodSubContaCre := iSubConta;
            end;
         end else
            iCodSubContaCre := 0;
         //-------------------------------------------------------------------------------
         // Processa o registro de acordo com o parâmetro iTIPOCONTAB
         // 0 - Normal
         // 1 - Lançamento em Obra
         // 2 - Desmembramento
         //-------------------------------------------------------------------------------
         // Contabilização da movimentação dos bens, exceto Desmembramento e Obras
         //-------------------------------------------------------------------------------
         if iTipoContab = 0 then
         begin
            //----------------------------------------------------------------------------
            // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
            // Caso não haja rateio definido, usa os Parâmetros do Sistema.
            //
            // Versão modificada para incluir a Segregação de Recursos
            //----------------------------------------------------------------------------
            cdsRatPP.Data := ListaPlanoPatroxBem(iEmpresa, iBem);
            //----------------------------------------------------------------------------
            repeat
               if cdsRatPP.IsEmpty then
               begin
                  if (ParamCAF.FLGSEGREGAVIRTUAL = 'S') then
                  begin
                     if not ImobSegregacao.Active then
                        ImobSegregacao.GetParams(iEmpresaProp);
                     //-------------------------------------------------------------------
                     // Se CAF - Plano Previdenciário ADMINISTRATIVO
                     //-------------------------------------------------------------------
                     if ModulodoGrupo(iEmpresaProp, iGrupo) = 7 then
                     begin
                        iPatro := ParamCAF.IDPATRO;

                        // Vinicius - Pendencia 23919 - 19/01/2007
                        // Buscar plano comum, quando o administrativo não estiver definido
                        if ParamCAF.IDPLANOPREVADM > 0 then
                             iPlanoPrev := ParamCAF.IDPLANOPREVADM
                        else iPlanoPrev := ParamCAF.IDPLANOPREV;
                        // Fim - 23919

                     end else
                     //-------------------------------------------------------------------
                     // Se InvestImob - Plano Previdenciário COMUM
                     //-------------------------------------------------------------------
                     begin
                      iPatro := ParamCAF.IDPATRO;
                      iPlanoPrev := ParamCAF.IDPLANOPREV;
                     end;
                     //Cássio -  SOL Nº 124540 KINTANA 633512 - Início
                     //Não haverá o uso de critério de segregação
                     iIdSegregaCriter := -1;
                     //Cássio -  SOL Nº 124540 KINTANA 633512 - Fim
                  end else
                  begin
                     // Vinicius - Pendencia 23919 - 19/01/2007
                     // Buscar plano e patro do parametro do CAF, se vazio, buscar do Global.
                     if ParamCAF.PATROPADRAO > 0 then
                          iPatro := ParamCAF.PATROPADRAO
                     else iPatro := ParamCAF.IDPATRO;
                     if ParamCAF.PLANPREVPADRAO > 0 then
                          iPlanoPrev := ParamCAF.PLANPREVPADRAO
                     else iPlanoPrev := ParamCAF.IDPLANOPREV;
                     // Fim - 23919

                     iIdSegregaCriter := -1;
                  end;
                  nPercRateio := 1;
               end else
               begin
                  iPatro := cdsRatPP.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev := cdsRatPP.FieldByName('IDPLANOPREV').AsInteger;
                  nPercRateio := cdsRatPP.FieldByName('PPBPERCRATEIO').AsFloat;
                  iIdSegregaCriter := -1;
               end;
               //-------------------------------------------------------------------------
               // Realiza o registro como partida simples
               //-------------------------------------------------------------------------
               if (ParamCAF.PACDOBRADA = 'N') or (trim(sContaDeb) = '') or (trim(sContaCre) = '') then
               begin
                  nValOfi := abs(nValLanc);
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Debito
                  //----------------------------------------------------------------------
                  if trim(sContaDeb) <> '' then
                  begin
                     sTipoLanc := 'D';
                     if (bProvisao) or (not (FcdsMontaContab.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV;IDSEGREGACRITER',
                             VarArrayOf([iPlano,sContaDeb,sTipoLanc,sCcDeb,iCodSubContaDeb,iAtivProjeto,iPatro,iPlanoPrev,iIdSegregaCriter]),[]))) then
                     begin
                        FcdsMontaContab.Append;
                        FcdsMontaContab.FieldByName('PLANO').AsInteger := iPlano;
                        FcdsMontaContab.FieldByName('PLACONTA').AsString := sContaDeb;
                        FcdsMontaContab.FieldByName('LACDEBCRE').AsString := sTipoLanc;
                        FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString := sCcDeb;
                        //----------------------------------------------------------------
                        if iCodSubContaDeb <> 0 then
                           FcdsMontaContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                        else
                           FcdsMontaContab.FieldByName('CODSUBCONTA').Clear;
                        //----------------------------------------------------------------
                        FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger := iAtivProjeto;
                        FcdsMontaContab.FieldByName('IDPATRO').AsInteger := iPatro;
                        FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger := iPlanoPrev;
                        FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                        FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').AsString := sPlaTipConvOfiDeb;
                        FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').AsString := sPlaTipConvGerDeb;
                        FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').Clear;
                        FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').Clear;
                        FcdsMontaContab.FieldByName('LACNUMDOC').AsString := sNumDoc;
                        FcdsMontaContab.FieldByName('LACHIST1').AsString := sHistor1;
                        FcdsMontaContab.FieldByName('LACHIST2').AsString := sHistor2;
                        FcdsMontaContab.FieldByName('LACHIST3').AsString := sHistor3;
                        FcdsMontaContab.FieldByName('LACHIST4').AsString := sHistor4;
                        FcdsMontaContab.FieldByName('LACHIST5').AsString := sHistor5;
                        //----------------------------------------------------------------
                        if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then //and (cdsRatPP.RecordCount > 1) then
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := nValOfi - fVlrTotDeb
                        else
                        begin
                          fVlrDeb := (nValOfi * nPercRateio)/ 100;
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat :=  ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                        end;
                        fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                     end else
                     begin
                        FcdsMontaContab.Edit;
                        if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + (nValOfi - fVlrTotDeb)
                        else
                        begin
                          fVlrDeb :=  (nValOfi * nPercRateio)/100;
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                        end;
                        fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                     end;
                     FcdsMontaContab.Post;
                  end;
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Credito
                  //----------------------------------------------------------------------
                  if trim(sContaCre) <> '' then
                  begin
                     sTipoLanc := 'C';
                     if (bProvisao) or (not (FcdsMontaContab.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV;IDSEGREGACRITER',
                             VarArrayOf([iPlano,sContaCre,sTipoLanc,sCcCre,iCodSubContaCre,iAtivProjeto,iPatro,iPlanoPrev,iIdSegregaCriter]),[]))) then
                     begin
                        FcdsMontaContab.Append;
                        FcdsMontaContab.FieldByName('PLANO').AsInteger := iPlano;
                        FcdsMontaContab.FieldByName('PLACONTA').AsString := sContaCre;
                        FcdsMontaContab.FieldByName('LACDEBCRE').AsString := sTipoLanc;
                        FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString := sCcCre;
                        //----------------------------------------------------------------
                        if iCodSubContaCre <> 0 then
                           FcdsMontaContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                        else
                           FcdsMontaContab.FieldByName('CODSUBCONTA').Clear;
                        //----------------------------------------------------------------
                        FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger := iAtivProjeto;
                        FcdsMontaContab.FieldByName('IDPATRO').AsInteger := iPatro;
                        FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger := iPlanoPrev;
                        FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                        FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').Clear;
                        FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').Clear;
                        FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').AsString := sPlaTipConvOfiCre;
                        FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').AsString := sPlaTipConvGerCre;
                        FcdsMontaContab.FieldByName('LACNUMDOC').AsString := sNumDoc;
                        FcdsMontaContab.FieldByName('LACHIST1').AsString := sHistor1;
                        FcdsMontaContab.FieldByName('LACHIST2').AsString := sHistor2;
                        FcdsMontaContab.FieldByName('LACHIST3').AsString := sHistor3;
                        FcdsMontaContab.FieldByName('LACHIST4').AsString := sHistor4;
                        FcdsMontaContab.FieldByName('LACHIST5').AsString := sHistor5;
                        //----------------------------------------------------------------
                        if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := (nValOfi - fVlrTotCre)
                        else
                        begin
                          fVlrCre := (nValOfi * nPercRateio)/100;
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                        end;
                          fVlrTotCre := fVlrTotCre + FcdsMontaContab.FieldByName('LACVALOR').AsFloat;
                     end else
                     begin
                        FcdsMontaContab.Edit;
                        if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + (nValOfi - fVlrTotCre)
                        else
                        begin
                          fVlrCre := (nValOfi * nPercRateio)/100;
                          FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                          fVlrTotCre := fVlrTotCre + ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                        end;
                     end;
                     FcdsMontaContab.Post;
                  end;
               end else
               //-------------------------------------------------------------------------
               // Realiza o registro como PARTIDA DOBRADA
               //-------------------------------------------------------------------------
               begin
                  nValOfi := nValLanc;
                  //----------------------------------------------------------------------
                  if (bProvisao) or (not (FcdsMontaContab.Locate('PLANO;PLACONTADEB;PLACONTACRE;CODCENTROCUSTODEB;CODCENTROCUSTOCRE;CODSUBCONTADEB;CODSUBCONTACRE;UNIDNEGOC;IDPATRO;IDPLANOPREV;IDSEGREGACRITER',
                                                 VarArrayOf([iPlano,sContaDeb,sContaCre,sCcDeb,sCcCre,iCodSubContaDeb,iCodSubContaCre,iAtivProjeto,iPatro,iPlanoPrev,iIdSegregaCriter]),[]))) then
                  begin
                     FcdsMontaContab.Append;
                     FcdsMontaContab.FieldByName('PLANO').AsInteger := iPlano;
                     FcdsMontaContab.FieldByName('PLACONTADEB').AsString := sContaDeb;
                     FcdsMontaContab.FieldByName('PLACONTACRE').AsString := sContaCre;
                     FcdsMontaContab.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                     FcdsMontaContab.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                     //-------------------------------------------------------------------
                     if iCodSubContaDeb <> 0 then
                        FcdsMontaContab.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                     else
                        FcdsMontaContab.FieldByName('CODSUBCONTADEB').Clear;
                     //-------------------------------------------------------------------
                     if iCodSubContaCre <> 0 then
                        FcdsMontaContab.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                     else
                        FcdsMontaContab.FieldByName('CODSUBCONTACRE').Clear;
                     //-------------------------------------------------------------------
                     FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                     FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                     FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                     FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                     FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').AsString := sPlaTipConvOfiDeb;
                     FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').AsString := sPlaTipConvGerDeb;
                     FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').AsString := sPlaTipConvOfiCre;
                     FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').AsString := sPlaTipConvGerCre;
                     FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                     FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                     FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                     FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                     FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                     FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;
                     //-------------------------------------------------------------------
                     if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                     begin
                      FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := nValOfi - fVlrTotDeb;
                     end
                     else
                     begin
                      fVlrDeb :=  (nValOfi * nPercRateio) /100;
                      FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                     end;
                     fVlrTotDeb := fVlrTotDeb + FcdsMontaContab.FieldByName('LACVALOR').AsFloat;
                  end
                  else
                  begin
                     FcdsMontaContab.Edit;
                     if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                     begin
                      FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + (nValOfi - fVlrTotDeb);
                     end
                     else
                     begin
                      fVlrDeb := (nValOfi * nPercRateio)/100;
                      FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                      fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                     end;
                  end;
                  FcdsMontaContab.Post;
               end;
               //-------------------------------------------------------------------------
               if not cdsRatPP.IsEmpty then
                  cdsRatPP.Next;
               //-------------------------------------------------------------------------
               ;
            until cdsRatPP.EOF;
         end else
         //-------------------------------------------------------------------------------
         // Contabilização de lançamentos em Obra
         //-------------------------------------------------------------------------------
         if iTipoContab = 1 then
         begin
          nValOfi := nValLanc;
          //Cássio - SOL Nº124540 KINATNA Nº 633557 - Início
          cdsRatPP.Data := ListaPlanoPatroObra(iGrupo,iBem);
          repeat
            if cdsRatPP.IsEmpty then
            begin
              //----------------------------------------------------------------------------
              if ParamCAF.FLGSEGREGAVIRTUAL = 'S' then
              begin
                if not ImobSegregacao.Active then
                  ImobSegregacao.GetParams(iEmpresaProp);
                //-------------------------------------------------------------------------
                // Se CAF - Plano Previdenciário ADMINISTRATIVO
                //-------------------------------------------------------------------------
                if ModulodoGrupo(iEmpresaProp, iGrupo) = 7 then
                begin
                  iPatro := ParamCAF.IDPATRO;
                  iPlanoPrev := ParamCAF.IDPLANOPREVADM;
                end
                else
                //-------------------------------------------------------------------------
                // Se InvestImob - Plano Previdenciário COMUM
                //-------------------------------------------------------------------------
                begin
                  iPatro := ParamCAF.IDPATRO;
                  iPlanoPrev := ParamCAF.IDPLANOPREV;
                end;
                  iIdSegregaCriter := -1;
              end
              else
              begin
                iPatro := ParamCAF.PATROPADRAO;
                iPlanoPrev := ParamCAF.PLANPREVPADRAO;
                iIdSegregaCriter := -1;
              end;
            end
            else
            begin
              iPatro := cdsRatPP.FieldByName('IDPATRO').AsInteger;
              iPlanoPrev := cdsRatPP.FieldByName('IDPLANOPREV').AsInteger;
              nPercRateio := cdsRatPP.FieldByName('PPIPERCENTRATEIO').AsFloat; /// 100;
              iIdSegregaCriter := -1;
            end;
            //----------------------------------------------------------------------------
            // Realiza o registro como partida simples
            //----------------------------------------------------------------------------
            if ParamCAF.PACDOBRADA = 'N' then
            begin
               //-------------------------------------------------------------------------
               // Realiza o registro da Conta a Debito
               //-------------------------------------------------------------------------
               sTipoLanc := 'D';
               if not (FcdsMontaContab.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV;IDSEGREGACRITER',
                       VarArrayOf([iPlano,sContaDeb,sTipoLanc,sCcDeb,iCodSubContaDeb,iAtivProjeto,iPatro,iPlanoPrev,iIdSegregaCriter]),[])) then
               begin
                  FcdsMontaContab.Append;
                  FcdsMontaContab.FieldByName('PLANO').AsInteger           := iPlano;
                  FcdsMontaContab.FieldByName('PLACONTA').AsString         := sContaDeb;
                  FcdsMontaContab.FieldByName('LACDEBCRE').AsString        := sTipoLanc;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString   := sCcDeb;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                  FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                  FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                  FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').AsString := sPlaTipConvOfiDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').AsString := sPlaTipConvGerDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').Clear;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').Clear;
                  FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                  FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                  FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                  FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                  FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                  FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;
                  //----------------------------------------------------------------------
                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := nValOfi - fVlrTotDeb
                  else
                  begin
                    fVlrDeb := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat :=  ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  end;
                  fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
               end else
               begin
                FcdsMontaContab.Edit;
                if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                  FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + (nValOfi - fVlrTotDeb)
                else
                begin
                  fVlrDeb := (nValOfi * nPercRateio)/100;
                  FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                end;
               end;
               FcdsMontaContab.Post;
               //-------------------------------------------------------------------------
               // Realiza o registro da Conta a Credito
               //-------------------------------------------------------------------------
               sTipoLanc := 'C';
               if not (FcdsMontaContab.Locate('PLANO;PLACONTA;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV;IDSEGREGACRITER',
                       VarArrayOf([iPlano,sContaCre,sTipoLanc,sCcCre,iCodSubContaCre,iAtivProjeto,iPatro,iPlanoPrev,iIdSegregaCriter]),[])) then
               begin
                  FcdsMontaContab.Append;
                  FcdsMontaContab.FieldByName('PLANO').AsInteger           := iPlano;
                  FcdsMontaContab.FieldByName('PLACONTA').AsString         := sContaCre;
                  FcdsMontaContab.FieldByName('LACDEBCRE').AsString        := sTipoLanc;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString   := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                  FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                  FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                  FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').Clear;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').Clear;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').AsString := sPlaTipConvOfiCre;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').AsString := sPlaTipConvGerCre;
                  FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                  FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                  FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                  FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                  FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                  FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;
                  //----------------------------------------------------------------------
                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := nValOfi - fVlrTotCre
                  else
                  begin
                    fVlrCre := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                  end;
                  fVlrTotCre := fVlrTotCre + FcdsMontaContab.FieldByName('LACVALOR').AsFloat;
               end else
               begin
                  FcdsMontaContab.Edit;
                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + (nValOfi - fVlrTotCre)
                  else
                  begin
                    fVlrCre := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                    fVlrTotCre := fVlrTotCre + ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                  end;
               end;
               FcdsMontaContab.Post;
            end
            else
            //----------------------------------------------------------------------------
            // Realiza o registro como partida dobrada
            //----------------------------------------------------------------------------
            begin
               if not (FcdsMontaContab.Locate('PLANO;PLACONTADEB;PLACONTACRE;CODCENTROCUSTODEB;CODCENTROCUSTOCRE;CODSUBCONTADEB;CODSUBCONTACRE;UNIDNEGOC;IDPATRO;IDPLANOPREV;IDSEGREGACRITER',
                                              VarArrayOf([iPlano,sContaDeb,sContaCre,sCcDeb,sCcCre,iCodSubContaDeb,iCodSubContaCre,iAtivProjeto,iPatro,iPlanoPrev,iIdSegregaCriter]),[])) then
               begin
                  FcdsMontaContab.Append;
                  FcdsMontaContab.FieldByName('PLANO').AsInteger            := iPlano;
                  FcdsMontaContab.FieldByName('PLACONTADEB').AsString       := sContaDeb;
                  FcdsMontaContab.FieldByName('PLACONTACRE').AsString       := sContaCre;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTADEB').Clear;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTACRE').Clear;
                  //----------------------------------------------------------------------
                  FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                  FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                  FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                  FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').AsString := sPlaTipConvOfiDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').AsString := sPlaTipConvGerDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').AsString := sPlaTipConvOfiCre;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').AsString := sPlaTipConvGerCre;
                  FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                  FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                  FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                  FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                  FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                  FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;
                  //----------------------------------------------------------------------
                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then //and (cdsRatPP.RecordCount > 1) then
                  begin
                    FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := nValOfi - fVlrTotDeb;
                  end
                  else
                  begin
                    fVlrDeb := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  end;
                  fVlrTotDeb := fVlrTotDeb + FcdsMontaContab.FieldByName('LACVALOR').AsFloat;
               end else
               begin
                  FcdsMontaContab.Edit;
                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) and (cdsRatPP.RecordCount > 1) then
                  begin
                    FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + (nValOfi - fVlrTotDeb);
                  end
                  else
                  begin
                    fVlrDeb := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := FcdsMontaContab.FieldByName('LACVALOR').AsFloat + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                    fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  end;
               end;
               FcdsMontaContab.Post;
            end;
            if not cdsRatPP.eof then
              cdsRatPP.Next;
          until
            cdsRatPP.Eof;
         end
         else
         //-------------------------------------------------------------------------------
         // Contabilização da movimentação Desmembramento
         //-------------------------------------------------------------------------------
         if iTipoContab = 2 then
         begin
            nValOfi := abs(nValLanc);
            //----------------------------------------------------------------------------
            // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
            // Caso não haja rateio definido, usa os Parâmetros do Sistema.
            //----------------------------------------------------------------------------
            cdsRatPP.Data := ListaPlanoPatroxBem(iEmpresa, iBem);
            //----------------------------------------------------------------------------
            repeat
               if cdsRatPP.IsEmpty then
               begin
                  if ParamCAF.FLGSEGREGAVIRTUAL = 'S' then
                  begin
                     if not ImobSegregacao.Active then
                        ImobSegregacao.GetParams(iEmpresaProp);
                     //-------------------------------------------------------------------
                     // Se CAF - Plano Previdenciário ADMINISTRATIVO
                     //-------------------------------------------------------------------
                     if ModulodoGrupo(iEmpresaProp, iGrupo) = 7 then
                     begin
                        iPatro := ParamCAF.IDPATRO;
                        iPlanoPrev := ParamCAF.IDPLANOPREVADM;
                     end else
                     //-------------------------------------------------------------------
                     // Se InvestImob - Plano Previdenciário COMUM
                     //-------------------------------------------------------------------
                     begin
                        iPatro := ParamCAF.IDPATRO;
                        iPlanoPrev := ParamCAF.IDPLANOPREV;
                     end;
                     iIdSegregaCriter := -1;
                  end else
                  begin
                     iPatro := ParamCAF.PATROPADRAO;
                     iPlanoPrev := ParamCAF.PLANPREVPADRAO;
                     iIdSegregaCriter := -1;
                  end;
                  nPercRateio := 1;
               end else
               begin
                  iPatro := cdsRatPP.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev := cdsRatPP.FieldByName('IDPLANOPREV').AsInteger;
                  nPercRateio := cdsRatPP.FieldByName('PPBPERCRATEIO').AsFloat;
                  iIdSegregaCriter := -1;
               end;
               //-------------------------------------------------------------------------
               // Realiza o registro como partida simples
               //-------------------------------------------------------------------------
               if ParamCAF.PACDOBRADA = 'N' then
               begin
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Debito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'D';
                  //----------------------------------------------------------------------
                  FcdsMontaContab.Append;
                  FcdsMontaContab.FieldByName('PLANO').AsInteger           := iPlano;
                  FcdsMontaContab.FieldByName('PLACONTA').AsString         := sContaDeb;
                  FcdsMontaContab.FieldByName('LACDEBCRE').AsString        := sTipoLanc;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString   := sCcDeb;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                  FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                  FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                  FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').AsString := sPlaTipConvOfiDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').AsString := sPlaTipConvGerDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').Clear;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').Clear;
                  FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                  FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                  FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                  FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                  FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                  FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;

                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := nValOfi - fVlrTotDeb
                  else
                  begin
                    fVlrDeb := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  end;

                  fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Credito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'C';
                  //----------------------------------------------------------------------
                  FcdsMontaContab.Append;
                  FcdsMontaContab.FieldByName('PLANO').AsInteger           := iPlano;
                  FcdsMontaContab.FieldByName('PLACONTA').AsString         := sContaCre;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString   := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTA').Clear;
                  //----------------------------------------------------------------------
                  FcdsMontaContab.FieldByName('LACDEBCRE').AsString        := sTipoLanc;
                  FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                  FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                  FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                  FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').Clear;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').Clear;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').AsString := sPlaTipConvOfiCre;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').AsString := sPlaTipConvGerCre;
                  FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                  FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                  FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                  FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                  FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                  FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;

                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := nValOfi - fVlrTotCre
                  else
                  begin
                    fVlrCre := (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsFloat := ComunsImobiliario.ConvNumSegregacao(fVlrCre);
                  end;
                  fVlrTotCre := fVlrTotCre + ComunsImobiliario.ConvNumSegregacao(fVlrCre);
               end else
               //-------------------------------------------------------------------------
               // Realiza o registro como partida dobrada
               //-------------------------------------------------------------------------
               begin
                  FcdsMontaContab.Append;
                  FcdsMontaContab.FieldByName('PLANO').AsInteger            := iPlano;
                  FcdsMontaContab.FieldByName('PLACONTADEB').AsString       := sContaDeb;
                  FcdsMontaContab.FieldByName('PLACONTACRE').AsString       := sContaCre;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                  FcdsMontaContab.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTADEB').Clear;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     FcdsMontaContab.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                  else
                     FcdsMontaContab.FieldByName('CODSUBCONTACRE').Clear;
                  //----------------------------------------------------------------------
                  FcdsMontaContab.FieldByName('UNIDNEGOC').AsInteger       := iAtivProjeto;
                  FcdsMontaContab.FieldByName('IDPATRO').AsInteger         := iPatro;
                  FcdsMontaContab.FieldByName('IDPLANOPREV').AsInteger     := iPlanoPrev;
                  FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFIDEB').AsString := sPlaTipConvOfiDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERDEB').AsString := sPlaTipConvGerDeb;
                  FcdsMontaContab.FieldByName('PLATIPCONVOFICRE').AsString := sPlaTipConvOfiCre;
                  FcdsMontaContab.FieldByName('PLATIPCONVGERCRE').AsString := sPlaTipConvGerCre;
                  FcdsMontaContab.FieldByName('LACNUMDOC').AsString        := sNumDoc;
                  FcdsMontaContab.FieldByName('LACHIST1').AsString         := sHistor1;
                  FcdsMontaContab.FieldByName('LACHIST2').AsString         := sHistor2;
                  FcdsMontaContab.FieldByName('LACHIST3').AsString         := sHistor3;
                  FcdsMontaContab.FieldByName('LACHIST4').AsString         := sHistor4;
                  FcdsMontaContab.FieldByName('LACHIST5').AsString         := sHistor5;

                  if (cdsRatPP.RecNo = cdsRatPP.RecordCount) then
                  begin
                    FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := nValOfi - fVlrTotDeb;
                  end
                  else
                  begin
                    fVlrDeb :=  (nValOfi * nPercRateio)/100;
                    FcdsMontaContab.FieldByName('LACVALOR').AsCurrency := ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
                  end;
                  fVlrTotDeb := fVlrTotDeb + ComunsImobiliario.ConvNumSegregacao(fVlrDeb);
               end;
               FcdsMontaContab.Post;
               //-------------------------------------------------------------------------
               if not cdsRatPP.IsEmpty then
                  cdsRatPP.Next;
               //-------------------------------------------------------------------------
            until cdsRatPP.EOF;
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
   finally
      cdsRatPP.Free
   end;

end;

//----------------------------------------------------------------------------------------------------------//
//  Método que faz a integração com a Contabilidade. Existem duas maneiras de fazer a Integração Contábil:  //
//                                                                                                          //
//    - Segregação na Origem, através do método InsereLancaContab, da classe TCtrlImobCAFxContab,           //
//      usando o ID do Imóvel com parâmetro;                                                                //
//    - Segregação normal, utilizando os Critérios de Segregação da Contabilidade, através do               //
//      método InsereLancaContab, da classe TCtrlLancamento.                                                //
//                                                                                                          //
//  O que define qual método utilizar é retorno da função que verifica se existem planos                    //
//  previdenciários definidos no Cadastro do Imóvel.                                                        //
//----------------------------------------------------------------------------------------------------------//
function TCtrlImobCAFxContab.RegistraPlanilhaContabil(nModulo,
  nEmpresaProp, nUsuario: Extended; sDataLanc: String{; nIdImovel: Integer}): Extended;
var
   nPlnCodigo, nAtivProjeto : Extended;
   sContaDeb, sContaCred,
   sCCDebito, sCCCredito,
   sSubContaD, sSubContaC   : String;
   sCodDebCred              : Char;
   sHist1, sHist2, sHist3, sHist4, sHist5 : String;
   //Cássio - SOL Nº 125345 KINTANA Nº 644559
   iIdPlanoPrev, iIdPatro : integer;
   cdsAuxPlanilha :  TCmClientDataSet;
   dValorSegreg, dValorTotal : Double;
begin
  try
    nPlnCodigo   := 0;
    //Cássio - SOL Nº 125345 KINTANA Nº 644559 - Início
    cdsAuxPlanilha       := TCMClientDataSet.Create(nil);
    iIdPlanoPrev := 0;
    iIdPatro     := 0;
    dValorSegreg := 0;
    dValorTotal  := 0;
    //Cássio - SOL Nº 125345 KINTANA Nº 644559 - Fim
    try
      // Carga dos parametros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(nEmpresaProp) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
      //----------------------------------------------------------------------------------

      FcdsMontaContab.First;
      //William Moreira da Silva - SOL 258132 PPM 989009 - Inicio
      while not FcdsMontaContab.eof do
      begin
        if FcdsMontaContab.FieldByName('LACDEBCRE').AsString = 'D' then
           dValorTotal := dValorTotal - abs(FcdsMontaContab.FieldByName('LACVALOR').asFloat)//Debito
        else
            dValorTotal := dValorTotal + abs(FcdsMontaContab.FieldByName('LACVALOR').asFloat);//Credito
        FcdsMontaContab.Next;
      end;
      //William Moreira da Silva - SOL 258132 PPM 989009- Fim

      FcdsMontaContab.First;
      while not FcdsMontaContab.EOF do
      begin
        sContaDeb  := '';
        sContaCred := '';
        sCCDebito  := '';
        sCCCredito := '';
        sSubContaD := '0';
        sSubContaC := '0';
        //-------------------------------------------------------------------------------
        // Alimenta os elementos contábeis de acordo com o tipo de partida
        //-------------------------------------------------------------------------------
        if ((ParamCAF.PACDOBRADA = 'N') and (ParamCAF.FLGCONTABFECHAM = 1)) or
            (FcdsMontaContab.FieldByName('PLACONTADEB').AsString = '') or
            (FcdsMontaContab.FieldByName('PLACONTACRE').AsString = '') then
        begin
          if FcdsMontaContab.FieldByName('LACDEBCRE').AsString = 'D' then
          begin
            sCodDebCred    := '0';
            sContaDeb      := FcdsMontaContab.FieldByName('PLACONTA').AsString;
            sCcDebito      := FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString;
            sSubContaD     := FcdsMontaContab.FieldByName('CODSUBCONTA').AsString;
          end
          else
          begin
            sCodDebCred    := '1';
            sContaCred     := FcdsMontaContab.FieldByName('PLACONTA').AsString;
            sCcCredito     := FcdsMontaContab.FieldByName('CODCENTROCUSTO').AsString;
            sSubContaC     := FcdsMontaContab.FieldByName('CODSUBCONTA').AsString;
          end;
        end
        else
        begin
          sCodDebCred    := '2';
          sContaDeb      := FcdsMontaContab.FieldByName('PLACONTADEB').AsString;
          sContaCred     := FcdsMontaContab.FieldByName('PLACONTACRE').AsString;
          sCcDebito      := FcdsMontaContab.FieldByName('CODCENTROCUSTODEB').AsString;
          sCcCredito     := FcdsMontaContab.FieldByName('CODCENTROCUSTOCRE').AsString;
          sSubContaD     := FcdsMontaContab.FieldByName('CODSUBCONTADEB').AsString;
          sSubContaC     := FcdsMontaContab.FieldByName('CODSUBCONTACRE').AsString;
        end;
        //-------------------------------------------------------------------------------
        if (FcdsMontaContab.FieldByName('UNIDNEGOC').AsFloat = 0) or
           (FcdsMontaContab.FieldByName('UNIDNEGOC').IsNull) then
          nAtivProjeto := ParamCAF.ATIVPROJETO
        else
          nAtivProjeto := FcdsMontaContab.FieldByName('UNIDNEGOC').AsFloat;
        //-------------------------------------------------------------------------------
        if sSubContaD = '' then
          sSubContaD := '0';

        if sSubContaC = '' then
          sSubContaC := '0';
        //-------------------------------------------------------------------------------
        sHist1 := '';
        sHist2 := '';
        sHist3 := '';
        sHist4 := '';
        sHist5 := '';

        if ParamCaf.AGRUPAHISTORICOCTB then
        begin
          sHist1 := FcdsMontaContab.FieldByName('LACHIST1').AsString + ' ' +
                    FcdsMontaContab.FieldByName('LACHIST2').AsString + ' ' +
                    FcdsMontaContab.FieldByName('LACHIST3').AsString + ' ' +
                    FcdsMontaContab.FieldByName('LACHIST4').AsString + ' ' +
                    FcdsMontaContab.FieldByName('LACHIST5').AsString;
        end
        else
        begin
          sHist1 := FcdsMontaContab.FieldByName('LACHIST1').AsString;
          sHist2 := FcdsMontaContab.FieldByName('LACHIST2').AsString;
          sHist3 := FcdsMontaContab.FieldByName('LACHIST3').AsString;
          sHist4 := FcdsMontaContab.FieldByName('LACHIST4').AsString;
          sHist5 := FcdsMontaContab.FieldByName('LACHIST5').AsString;
        end;

        if FcdsMontaContab.FieldByName('LACVALOR').AsFloat <> 0 then
        begin
          //------------------------------------------------------------------------------------
          //Cássio - SOL 92381 KINTANA 394180
          // Verifica se existem planos previdenciários definidos no Cadastro do Imóvel, a partir
          // do Id do Imóvel.
          //------------------------------------------------------------------------------------
          if not ImobLancaContab.InsereLancaContab(sCodDebCred,                                        // 0 => Débito, 1 => Crédito e 2 => Partida Dobrada
                                                     nEmpresaProp,                                       // Empresa proprietária
                                                     nModulo,                                            // Módulo responsável
                                                     nUsuario,                                           // Usuário
                                                     FcdsMontaContab.FieldByName('PLANO').AsFloat,       // Plano Contábil
                                                     nAtivProjeto,                                       // Atividade/Projeto
                                                     StrToFloat(sSubContaD),                             // SubConta a Débito
                                                     StrToFloat(sSubContaC),                             // SubConta a Crédito
                                                     FcdsMontaContab.FieldByName('IDPLANOPREV').AsFloat, // Plano Previdenciario
                                                     FcdsMontaContab.FieldByName('IDPATRO').AsFloat,     // Patrocinadora
                                                     nPlnCodigo,                                         // Planilha
                                                     0,                                                  // Numero Lancamento
                                                     sDataLanc,                                          // Data do lançamento
                                                     FcdsMontaContab.FieldByName('LACNUMDOC').AsString,  // Número do Documento
                                                     sHist1,   // Historico 1
                                                     sHist2,   // Historico 2
                                                     sHist3,   // Historico 3
                                                     sHist4,   // Historico 4
                                                     sHist5,   // Historico 5
                                                     ParamCAF.TIPOPERCTB,                                // Tipo de Operação
                                                     sCCDebito,                                          // Centro de Custo a Débito
                                                     sContaDeb,                                          // Conta Contábil a Débito
                                                     sCCCredito,                                         // Centro de Custo a Crédito
                                                     sContaCred,                                         // Conta Contábil a Crédito
                                                     '',                                                 // Codigo Historico
                                                     FcdsMontaContab.FieldByName('LACVALOR').AsFloat,    // Valor do Lançamento
                                                     False,
                                                     ParamCAF.USAPLANOPATRO,
                                                     FcdsMontaContab.FieldByName('IDSEGREGACRITER').AsInteger,
                                                     StrToDate(sDataLanc), -1, -1, True, -1, False,
                                                     dValorTotal) then
                                                     //FcdsMontaContab.FieldByName('LACVALOR').AsFloat) then
              begin
                MessageInfo := CMTranslate('Integração Contábil : ') + ImobLancaContab.MessageInfo;
                Raise Exception.Create(MessageInfo);
              end;
              //----------------------------------------------------------------------------
              nPlnCodigo := ImobLancaContab.RetornoPlnCodigo;
        end;
        FcdsMontaContab.Next;
      end;
      //----------------------------------------------------------------------------------
      FcdsMontaContab.Close;
      Result := nPlnCodigo;
    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        Result := -1;
      end;
    end;
  finally
    FreeAndNil(cdsAuxPlanilha);
  end;
end;

function TCtrlImobCAFxContab.RemovePlanContab(
  iEmpresaProp: Integer): boolean;
begin
  if ParamCAF.INTEGRACONTAB = EmptyStr then
  begin
    if not ParamCAF.CarregaProp(iEmpresaProp) then
    begin
      MessageInfo := 'Parâmetros do sistema inválidos!' + #13 + ParamCAF.MessageInfo;;
      Raise Exception.Create(MessageInfo);
    end;
  end;

  _cds.Data := GetDataPacket(' SELECT PACESTORNA FROM PARAMCONTAB ' +
                             ' WHERE (IDPESSOA = ' + IntToStr(iEmpresaProp) + ')');

  Result := (_cds.FieldByName('PACESTORNA').AsString = 'N') AND (ParamCAF.FLGREMOVEPLANCTB = 'S');
end;

procedure TCtrlImobCAFxContab.SetcdsMontaContab(
  const Value: TClientDataSet);
begin
  FcdsMontaContab := Value;
end;

procedure TCtrlImobCAFxContab.SetcdsParamCAFxContab(
  const Value: TClientDataSet);
begin
  FcdsParamCAFxContab := Value;
end;

function TCtrlImobCAFxContab.VerificaContaxCC(iPlano,
  iEmpresaProp: Integer; sPlaConta, sCodCentroCusto: String): Boolean;
begin
  _dMTBem.sqlVerificaContaxCC.Prepare;
  _dMTBem.sqlVerificaContaxCC.ParamByName('PLANO').AsInteger         := iPlano;
  _dMTBem.sqlVerificaContaxCC.ParamByName('IDEMPRESA').AsInteger     := iEmpresaProp;
  _dMTBem.sqlVerificaContaxCC.ParamByName('PLACONTA').AsString       := sPlaConta;
  _dMTBem.sqlVerificaContaxCC.ParamByName('CODCENTROCUSTO').AsString := sCodCentroCusto;
  _cds.Data := _dMTBem.sqlVerificaContaxCC.Data;
  //-------------------------------------------------------------------------------------
  Result := not _cds.IsEmpty;
end;

function TCtrlImobCAFxContab.VerificaPeriodoContabil(fEmpresa: Extended;
  dData: TDateTime; var iExercicio, iPeriodo: Integer): Boolean;
begin
  try
  //----------------------------------------------------------------------------------
  // Lê o periodo ao qual a data da movimentação pertence, verificando se é unico
  //----------------------------------------------------------------------------------
    if not PeriodoContab.RetornaPeriodoExercicioData(fEmpresa,datetostr(dData)) then
      raise Exception.Create(CMTranslate('Integração Contábil : ') + PeriodoContab.MessageInfo);

    iExercicio := PeriodoContab.Exercicio;
    iPeriodo   := PeriodoContab.Periodo;
    //----------------------------------------------------------------------------------
    // Verifica se o periodo existe
    //----------------------------------------------------------------------------------
    if not PeriodoContab.TestaPeriodoExiste(fEmpresa, iPeriodo, iExercicio) then
      raise Exception.Create(CMTranslate('Integração Contábil : ') + PeriodoContab.MessageInfo);
    //----------------------------------------------------------------------------------
    // Verifica se o periodo está bloquedo pela contabilidade
    //----------------------------------------------------------------------------------
    //Helen - SOL: 179583/9621 KTN 1663624 - Add a variavel bMsgBloqueio
  //if PeriodoContab.TestaPeriodoBloqueado(fEmpresa, TBBLOQUEADO, iPeriodo, iExercicio,False) then
    if PeriodoContab.TestaPeriodoBloqueado(fEmpresa, TBBLOQUEADO, iPeriodo, iExercicio,False,False) then
      raise Exception.Create(CMTranslate('Integração Contábil : Período bloqueado pela Contabilidade!'));
    //----------------------------------------------------------------------------------
    // Verifica se o periodo está bloquedo pela integração
    //----------------------------------------------------------------------------------
    //Helen - SOL: 179583/9621 KTN 1663624 - Add a variavel bMsgBloqueio
  //if PeriodoContab.TestaPeriodoBloqueado(fEmpresa, TBBLOQUEADO, iPeriodo, iExercicio,False) then
    if PeriodoContab.TestaPeriodoBloqueado(fEmpresa, TBINTEGRADO, iPeriodo, iExercicio,False,False) then
      raise Exception.Create(CMTranslate('Integração Contábil : Período bloqueado pela Integração!'));
    //----------------------------------------------------------------------------------
    Result := True
  except
    On E : Exception Do
    begin
      MessageInfo := E.Message;
      Result := False;
    end;
  end;
end;
function TCtrlImobCAFxContab.BuscaPlanoPatroxImovel(
  nIdImovel: integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO ' +#10+
          '  FROM PLANOPATROXIMOVEL ' +#10+
          ' WHERE IDIMOVEL = ' + IntToStr(nIdImovel);
  Result := GetDataPacket(sSQL);

end;

function TCtrlImobCAFxContab.ListaPlanoPatroObra(nIdGrupo,
  nIdCafObra: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := 'SELECT P.IDPATRO, P.IDPLANOPREV, P.PPIPERCENTRATEIO ' + #13 +
           '  FROM CAFOBRA C, PLANOPATROXIMOVEL P               ' + #13 +
           ' WHERE C.IDIMOVEL = P.IDIMOVEL                      ' + #13 +
           '   AND C.IDGRUPO =  ' + FloatToStr(nIdGrupo)          + #13 +
           '   AND C.IDCAFOBRA = ' + FloatToStr(nIdCafObra)       + #13 +
           ' ORDER BY P.PPIPERCENTRATEIO                        ';

   Result := GetDataPacket(sSql);
end;

function TCtrlImobCAFxContab.ContabilizaProvisaoCusto(iModulo, iEmpresa,
  iBem, iGrupo, iConjunto, iAtivProjeto, iSubConta: Integer; sPlaca,
  sDesBem, sGrupo: String; dDataLanc: TDatetime; nValorProvisao: Extended;
  iExercicio, iPeriodo: Integer;
  bCtaxCCusto: Boolean; bBaixa: Boolean = False): Boolean;
var
   iTipoMov1, iPlanoConta,
   iFlgSegregaDeb, iFlgSegregaCre          : Integer;
   nParticip1, nValLanc                    : Extended;
   sDebito, sCredito,
   sHistor1, sHistor2,
   sHistor3, sHistor4, sHistor5,
   sNumDoc, sCCDeb, sCCCre,
   sObrigaCCDeb, sObrigaCCCre,
   sNomeContaDeb, sObrigaSubContaDeb,
   sNomeContaCre, sObrigaSubContaCre,
   sTipConvOfiDeb, sTipConvGerDeb,
   sTipConvOfiCre, sTipConvGerCre          : String;
   FcdsCcRD                                : TClientDataSet;
   //-------------------------------------------------------------------------------------
   iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1  : Integer;
   sMaxDebito1, sMaxCredito1,
   sMaxNomeContaDeb1, sMaxNomeContaCre1,
   sMaxObrigaSubContaDeb1,
   sMaxObrigaSubContaCre1,
   sMaxTipConvOfiDeb1, sMaxTipConvOfiCre1,
   sMaxTipConvGerDeb1, sMaxTipConvGerCre1,
   sMaxCCustoDeb1, sMaxCCustoCre1          : String;
   nMaxCCusto1, nSomaRateios1              : Extended;

begin
  Result := True;
  FcdsCcRD := TClientDataSet.Create(nil);
  try
    try
      if bBaixa then
        iTipoMov1 := 203
      else
        iTipoMov1 := 202;
      //-------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //-------------------------------------------------------------------------------
      if not ParamCAF.CarregaProp(iEmpresa) then
        Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
      //-------------------------------------------------------------------------------
      // Captura o Plano de Contas Vigente
      //-------------------------------------------------------------------------------
      iPlanoConta := ParamCAF.PLANOVIGENTE;
      //-------------------------------------------------------------------------------
      // Contas Contábeis não definidas por Centros de Custo
      //-------------------------------------------------------------------------------
      if not bCtaxCCusto then
      begin
      //----------------------------------------------------------------------------
      // Busca conta a débito para o valor de Próvisão do Bem
      //----------------------------------------------------------------------------
        if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb) then
        begin
          MessageInfo := CMTranslate('Conta a Débito para o Movimento de Provisão no Grupo ') + sGrupo +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
          Raise Exception.Create(MessageInfo);
        end;
        //----------------------------------------------------------------------------
        // Busca conta a crédito para o valor de Entrada do Bem
        //----------------------------------------------------------------------------
        if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre) then
        begin
          MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Provisão no Grupo ') + sGrupo +
                         CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
          Raise Exception.Create(MessageInfo);
        end;
      end;
      //-------------------------------------------------------------------------------
      // Composição do Histórico Contábil
      //-------------------------------------------------------------------------------
      sHistor2 := Trim(sPlaca)  + ' ' + BuscaCodigoImovel(iBem);
      if (Length(sDesBem) <= 40) then
        sHistor3 := trimleft(copy(sDesBem, 1, Length(sDesBem)))
      else
      begin
        sHistor3 := trimleft(copy(sDesBem, 1,40));
        sHistor4 := trimleft(copy(sDesBem,41,40));
        sHistor5 := trimleft(copy(sDesBem,81,40));
      end;

      sNumDoc := FormatDateTime('yyyymmdd',dDataLanc);
      //-------------------------------------------------------------------------------
      // Processamento do Rateio dos Custos
      //-------------------------------------------------------------------------------
      nParticip1 := 0;
      //-------------------------------------------------------------------------------
      // A diferença entre os valores contabilizados e a soma dos seus rateios deve
      // ser lançada no Centro de Custo com a maior proporção
      //-------------------------------------------------------------------------------
      nMaxCCusto1 := 0.000000;
      nSomaRateios1 := 0.00;
      iMaxFlgSegregaDeb1 := 0;
      iMaxFlgSegregaCre1 := 0;
      //-------------------------------------------------------------------------------
      // Busca Rateio da Depreciação do Bem
      //-------------------------------------------------------------------------------
      FcdsCcRD.Data := Conjunto.ListaRateioCustos(iEmpresa, iConjunto);
      while not FcdsCcRD.EOF do
      begin
        if nParticip1 < 100 then
        begin
          if bBaixa then
           sHistor1 := CMTranslate('Reversão de provisão do Bem ')
          else
            sHistor1 := CMTranslate('Provisão do Bem ');
          //-------------------------------------------------------------------------
          // Montagem da Partida Dobrada do Custo
          //-------------------------------------------------------------------------
          sCCDeb := '';
          sCCCre := '';
          //-------------------------------------------------------------------------
          // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
          //-------------------------------------------------------------------------
          if bCtaxCCusto then
          begin
            sCCDeb := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
            //----------------------------------------------------------------------
            // Busca conta a débito
            //----------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'D', iPlanoConta, sDebito, iFlgSegregaDeb, bCtaxCCusto, sCCDeb) then
            begin
              MessageInfo := CMTranslate('Conta a Débito para o Movimento de Provisão no Grupo ') + sGrupo +
                             CMTranslate(' no Centro de Custo ') + sCCDeb +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Débito é válida
          //-------------------------------------------------------------------------
          if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                sDebito, False, False) then
          begin
            MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
            Raise Exception.Create(MessageInfo);
          end;
          sNomeContaDeb      := ContaContab.NomeConta;
          sObrigaCcDeb       := ContaContab.ObrigaCentroCusto;
          sObrigaSubContaDeb := ContaContab.ObrigaSubConta;
          sTipConvOfiDeb     := ContaContab.TipoConvOfi;
          sTipConvGerDeb     := ContaContab.TipoConvGeren;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Débito obriga centro de custo
          //-------------------------------------------------------------------------
          if sObrigaCcDeb = 'S' then
          begin
            if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sDebito,
                                             FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
            begin
              MessageInfo := CMTranslate('Integração Contábil : ')+ ContaContab.MessageInfo;
              Raise Exception.Create(MessageInfo);
            end
            else
            begin
              sCcDeb     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
              nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
            end;
          end;
          //-------------------------------------------------------------------------
          // Se a Conta Contábil for definida pelo Centro de Custo, Pesquisar.
          //-------------------------------------------------------------------------
          if bCtaxCCusto then
          begin
            sCCCre := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
            //----------------------------------------------------------------------
            // Busca conta a crédito
            //----------------------------------------------------------------------
            if not LeParamCAFxContab(iEmpresa, iGrupo, iTipoMov1, 'C', iPlanoConta, sCredito, iFlgSegregaCre, bCtaxCCusto, sCCCre) then
            begin
              MessageInfo := CMTranslate('Conta a Crédito para o Movimento de Provisão no Grupo ') + sGrupo +
                             CMTranslate(' no Centro de Custo ') + sCCCre +
                             CMTranslate(' Tipo de Movimentação: ') + BuscaDescMovto(iTipoMov1) + CMTranslate(' não cadastrada !');
              Raise Exception.Create(MessageInfo);
            end;
          end;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Crédito é válida
          //-------------------------------------------------------------------------
          if not ContaContab.TestaContaContabil(iPlanoConta, iEmpresa, iPeriodo, iExercicio,
                                                sCredito, False, False) then
          begin
            MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
            Raise Exception.Create(MessageInfo);
          end;
          sNomeContaCre      := ContaContab.NomeConta;
          sObrigaCcCre       := ContaContab.ObrigaCentroCusto;
          sObrigaSubContaCre := ContaContab.ObrigaSubConta;
          sTipConvOfiCre     := ContaContab.TipoConvOfi;
          sTipConvGerCre     := ContaContab.TipoConvGeren;
          //-------------------------------------------------------------------------
          // Verifica se a conta contábil a Crédito obriga centro de custo
          //-------------------------------------------------------------------------
          if sObrigaCcCre = 'S' then
          begin
            if not ContaContab.TestaContaxCC(iPlanoConta, iEmpresa, sCredito,
                                             FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString) then
            begin
              MessageInfo := CMTranslate('Integração Contábil : ') + ContaContab.MessageInfo;
              Raise Exception.Create(MessageInfo);
            end
            else
            begin
              sCcCre     := FcdsCcRD.FieldByName('CODCENTROCUSTO').AsString;
              nParticip1 := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
            end;
          end;
          //-------------------------------------------------------------------------
          if (sCCDeb = '') and (sCCCre = '') then
            nParticip1 := 100;
          //-------------------------------------------------------------------------
          nValLanc := ConvNum((nValorProvisao * nParticip1) / 100);
          nValLanc := AjustaNum(ParamCAF.MOEDAOFICIAL, nValLanc);
          //-------------------------------------------------------------------------
          // Acumula os valores proporcionais e apura o centro de custo
          // com a maior proporção
          //-------------------------------------------------------------------------
          nSomaRateios1 := ConvNum(nSomaRateios1 + nValLanc);
          if FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat > nMaxCCusto1 then
          begin
            sMaxDebito1            := sDebito;
            sMaxCredito1           := sCredito;
            iMaxFlgSegregaDeb1     := iFlgSegregaDeb;
            iMaxFlgSegregaCre1     := iFlgSegregaCre;
            sMaxNomeContaDeb1      := sNomeContaDeb;
            sMaxNomeContaCre1      := sNomeContaCre;
            sMaxObrigaSubContaDeb1 := sObrigaSubContaDeb;
            sMaxObrigaSubContaCre1 := sObrigaSubContaCre;
            sMaxTipConvOfiDeb1     := sTipConvOfiDeb;
            sMaxTipConvOfiCre1     := sTipConvOfiCre;
            sMaxTipConvGerDeb1     := sTipConvGerDeb;
            sMaxTipConvGerCre1     := sTipConvGerCre;
          //----------------------------------------------------------------------
            sMaxCCustoDeb1         := sCcDeb;
            sMaxCCustoCre1         := sCcCre;
            nMaxCCusto1            := FcdsCcRD.FieldByName('PARTICIPACAO').AsFloat;
          end;
          //-------------------------------------------------------------------------
          if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta, sDebito, sCredito, sCcDeb, sCcCre,
                                       iFlgSegregaDeb, iFlgSegregaCre,
                                       iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo,
                                       sGrupo, nValLanc,sNomeContaDeb,sObrigaSubContaDeb,
                                       sNomeContaCre,sObrigaSubContaCre,sTipConvOfiDeb,
                                       sTipConvGerDeb,sTipConvOfiCre,sTipConvGerCre,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5, true) then
            Raise Exception.Create(MessageInfo);
          end;
          //----------------------------------------------------------------------------
          FcdsCcRD.Next;
        end;
        FcdsCcRD.Close;
        //-------------------------------------------------------------------------------
        // A diferença entre os valores contabilizados e a soma dos seus rateios deve
        // ser lançada no Centro de Custo com a maior proporção
        //-------------------------------------------------------------------------------
        if ConvNum(nSomaRateios1 - nValorProvisao) <> 0 then
        begin
          if not MontaPlanilhaContabil(iModulo, iEmpresa, 0, iPlanoConta,
                                       sMaxDebito1, sMaxCredito1, sMaxCcustoDeb1, sMaxCcustoCre1,
                                       iMaxFlgSegregaDeb1, iMaxFlgSegregaCre1,
                                       iSubConta, iAtivProjeto, iEmpresa, iBem, iGrupo, sGrupo,
                                       ConvNum(nSomaRateios1 - nValorProvisao),
                                       sMaxNomeContaDeb1, sMaxObrigaSubContaDeb1,
                                       sMaxNomeContaCre1, sMaxObrigaSubContaCre1,
                                       sMaxTipConvOfiDeb1, sMaxTipConvGerDeb1,
                                       sMaxTipConvOfiCre1,sMaxTipConvGerCre1,
                                       sNumDoc,sHistor1,sHistor2,sHistor3,sHistor4,sHistor5) then
            Raise Exception.Create(MessageInfo);
        end;
        //-------------------------------------------------------------------------------
    except
      on e : Exception do
      begin
        MessageInfo := e.Message;
        Result := False;
      end;
    end;
  finally
    FcdsCcRD.Free;
  end;
end;

end.
