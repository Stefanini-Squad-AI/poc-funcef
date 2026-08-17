unit uCtrlHistMovBem;

interface

Uses Controls, DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider, uMidasUtil, Math, uCMMath,
     dMTBem, uCtrlParamCAF,
     uDBTipoMovimentacao, uDBHistMovBem, uDBVlrHistMovBem,
     uDBHMBReaval, uDBDesmembramento, uDBRemembramento;

Type
   TCtrlHistMovBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbHistMovBem : TDBHistMovBem;
      _dbVlrHistMovBem : TDBVlrHistMovBem;
      _dbHMBReaval : TDBHMBReaval;
      _dbDesmembramento : TDBDesmembramento;
      _dbRemembramento : TDBRemembramento;
      _dMTBem : TdtmMTBem;

      ParamCAF : TCtrlParamCAF;
      ParamCAFOk : Boolean;

      iFatorDec : Integer;
      sFatorDec : String; 

      function CMTranslate(sIgor : String) : String;

   Public
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Consulta
      //----------------------------------------------------------------------------------
      function ExisteMovimentacao(iFlgImovelIni, iFlgImovelFim,
                                  iIdPessoa : Integer; dDataMov : TDateTime) : Boolean;
      //----------------------------------------------------------------------------------
      // Persistencia
      //----------------------------------------------------------------------------------
      function RegistraHistMovBem(nBem, nEmpresaProp, nModulo, nTipoMovimentacao : Extended;
                                  dDataMovimentacao : TDate;
                                  nReavalAcresc : Extended;
                                  dDataUltDep : TDate;
                                  nGrupAnt, nConjAnt, nLocalAnt, nRespAnt, nPlacaAnt,
                                  nPlanilha : Extended;
                                  sObsReaval : String; iTipDepProRata : Integer;
                                  nTipoDespesa : Extended; sObsAcrescimo : string;
                                  nMotivoBaixa, nPropBaixa, nValVendaOfi : Extended;
                                  sObsBaixa : string; nCafObra : Extended = -1;
                                  bFlgRetificaReaval : Boolean = False) : Extended;

      function RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nIdTaxaDep, nValor : Extended) : Boolean;

      function RegistraHMBReaval(nSeqHist, nMoeCodigo, nIdTaxaDep,
                                 nValorLaudo, nTaxaDepAnt : Extended) : Boolean;

      function RegistraDesmembramento(nSeqHist, nIdBemResultante,
                                      nProporcao : Extended) : Boolean;

      function RegistraRemembramento(nSeqHist, nIdBemBaixado,
                                     nProporcao : Extended) : Boolean;

      function RegistraPlanHistMovBem(nSeqHist, nPlanilha : Extended) : Boolean;

      function RemoveMovimentacao(nBem, nEmpresaProp, nModulo : Extended;
                                  dDataMovimentacao : tDate = -1;
                                  sTipoMovimentacao : String = '';
                                  iTipDepProRata : Integer = -1;
                                  nSeqHist : Extended = -1) : Boolean;
   end;

implementation

{ TCtrlHistMovBem }

constructor TCtrlHistMovBem.Create;
begin
   inherited;
   _dbHistMovBem := TDBHistMovBem.Create(Self);
   _dbVlrHistMovBem := TDBVlrHistMovBem.Create(Self);
   _dbHMBReaval := TDBHMBReaval.Create(Self);
   _dbDesmembramento := TDBDesmembramento.Create(Self);
   _dbRemembramento := TDBRemembramento.Create(Self);

   _dMTBem := TdtmMTBem.Create(Self);

   ParamCAF := TCtrlParamCAF.Create;
   ParamCAFOk := False;
end;

destructor TCtrlHistMovBem.Destroy;
begin
   _dbHistMovBem.Free;
   _dbVlrHistMovBem.Free;
   _dbHMBReaval.Free;
   _dbDesmembramento.Free;
   _dbRemembramento.Free;
   _dMTBem.Free;

   ParamCAF.Free;
   inherited;
end;

function TCtrlHistMovBem.CMTranslate(sIgor : String) : String;
begin
   Result := sIgor;
end;

procedure TCtrlHistMovBem.AfterInitialize;
begin
   inherited;
   ParamCAF.InitializeAs(Self);
end;

procedure TCtrlHistMovBem.DoChangeDataBase;
begin
   inherited;
   _dbHistMovBem.DataBaseName := DataBaseName;
   _dbVlrHistMovBem.DataBaseName := DataBaseName;
   _dbHMBReaval.DataBaseName := DataBaseName;
   _dbDesmembramento.DataBaseName := DataBaseName;
   _dbRemembramento.DataBaseName := DataBaseName;
end;
//========================================================================================
function TCtrlHistMovBem.ExisteMovimentacao(iFlgImovelIni, iFlgImovelFim,
                                            iIdPessoa : Integer; dDataMov : TDateTime) : Boolean;
begin
   with _dMTBem do
   begin
      sqlExisteMovimentacao.Prepare;
      sqlExisteMovimentacao.ParamByName('IDPESSOA').AsInteger     := iIdPessoa;
      sqlExisteMovimentacao.ParamByName('FLGIMOVELINI').AsInteger := iFlgImovelIni;
      sqlExisteMovimentacao.ParamByName('FLGIMOVELFIM').AsInteger := iFlgImovelFim;
      sqlExisteMovimentacao.ParamByName('DATAMOV').AsDateTime     := dDataMov;
      _cds.Data := sqlExisteMovimentacao.Data;
   end;
   //-------------------------------------------------------------------------------------
   if not _cds.IsEmpty then
      Result := True
   else
      Result := False;
end;
{=========================================================================================
  Função que registra movimentação

  Parâmetros :
------------------------------------------------------------------------------------------
   Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
------------------------------------------------------------------------------------------

  nBem              : id do Bem movimentado                             (IDBEM)
  nEmpresaProp      : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
  nModulo           : id do Módulo que incluiu o bem                    (IDMODULO)
  nTipoMovimentacao : id do Tipo de Movimentacao                        (IDTIPOMOVIMENTACAO)
  dDataMovimentacao : data de registro da Movimentação                  (DATAMOVIMENTACAO)
  nReavalAcresc     : id da Reavaliacao/Acrescimo movimentado           (IDREAVALACRESC)
  dDataUltDep       : Data da depreciacao anterior a atual              (DATAULTDEP)
  nGrupAnt          : id do grupo anterior do bem                       (IDGRUPANT)
  nConjAnt          : id do conjunto anterior do bem                    (IDCONJANT)
  nLocalAnt         : id do local anterior do bem                       (IDLOCALANT)
  nRespAnt          : id do responsavel anterior do bem                 (IDRESPANT)
  nPlacaAnt         : número da placa de patrimônio                     (PLACAANT)
  nPlanilha         : id da Planilha de Lancamento na Contabilidade     (PLNCODIGO)
  nTaxaDepAnt       : Taxa de depreciação anterior                      (TAXADEPANT)
  nValorgLaudo      : Valor dado ao bem no laudo de reavaliação         (VALORGLAUDO)
  sObsReaval        : Observações relativas a reavaliação               (OBSREAVAL)
  iTipDepProRata    : Código identificando o tipo de depreciação que    (TIPDEPPRORATA)
                      foi calculada : 0 - [DataMovimentacao - 1],
                                      1 - [DataMovimentacao],
                                      2 - [Fechamento]
  nTipoDespesa      : id do Tipo de Despesa para acrescimo de valor     (IDTIPODESPESA)
  sObsAcrescimo     : Observação relativa ao acréscimo de valor         (OBSACRESCIMO)
  nMotivoBaixa      : id do motivo para baixa de bem                    (IDMOTIVOBAIXA)
  nPropBaixa        : Proporção da baixa de bem (0-100)                 (PROPBAIXA)
  sObsBaixa         : Observação relativa a baixa de bem                (OBSBAIXA)
  nCafObra          : id da Obra que gerou um bem                       (IDCAFOBRA)
-----------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RegistraHistMovBem(nBem, nEmpresaProp, nModulo, nTipoMovimentacao : Extended;
                                            dDataMovimentacao : TDate;
                                            nReavalAcresc : Extended;
                                            dDataUltDep : TDate;
                                            nGrupAnt, nConjAnt, nLocalAnt, nRespAnt, nPlacaAnt,
                                            nPlanilha : Extended;
                                            sObsReaval : String; iTipDepProRata : Integer;
                                            nTipoDespesa : Extended; sObsAcrescimo : string;
                                            nMotivoBaixa, nPropBaixa, nValVendaOfi : Extended;
                                            sObsBaixa : string; nCafObra : Extended;
                                            bFlgRetificaReaval : Boolean) : Extended;
var
   sMensagem     : String;
   bResult       : Boolean;

begin
   try
      //----------------------------------------------------------------------------------
      // Carga dos parâmetros do sistema
      //----------------------------------------------------------------------------------
      if not ParamCAFOk then
      begin
         if not ParamCAF.CarregaProp(nEmpresaProp) then
            Raise Exception.Create(CMTranslate('Parâmetros do sistema inválidos!') + #13 + ParamCAF.MessageInfo);
         ParamCAFOk := True;
      end;
      //----------------------------------------------------------------------------------
      with _dbHistMovBem do
      begin
         IDBEM.AsFloat := nBem;
         IDPESSOA.AsFloat := nEmpresaProp;
         IDMODULO.AsFloat := nModulo;
         IDTIPOMOVIMENTACAO.AsFloat := nTipoMovimentacao;
         DATAMOVIMENTACAO.AsDateTime := dDataMovimentacao;
         //-------------------------------------------------------------------------------
         if nReavalAcresc = -1 then
            IDREAVALACRESC.Clear
         else
            IDREAVALACRESC.AsFloat := nReavalAcresc;
         //-------------------------------------------------------------------------------
         if dDataUltDep = -1 then
            DATAULTDEP.Clear
         else
            DATAULTDEP.AsDateTime := dDataUltDep;
         //-------------------------------------------------------------------------------
         if nGrupAnt = -1 then
            IDGRUPANT.Clear
         else
            IDGRUPANT.AsFloat := nGrupAnt;
         //-------------------------------------------------------------------------------
         if nConjAnt = -1 then
            IDCONJANT.Clear
         else
            IDCONJANT.AsFloat := nConjAnt;
         //-------------------------------------------------------------------------------
         if nLocalAnt = -1 then
            IDLOCALANT.Clear
         else
            IDLOCALANT.AsFloat := nLocalAnt;
         //-------------------------------------------------------------------------------
         if nRespAnt = -1 then
            IDRESPANT.Clear
         else
            IDRESPANT.AsFloat := nRespAnt;
         //-------------------------------------------------------------------------------
         if nPlacaAnt = -1 then
            PLACAANT.Clear
         else
            PLACAANT.AsFloat := nPlacaAnt;
         //-------------------------------------------------------------------------------
         if nPlanilha = -1 then
            PLNCODIGO.Clear
         else
            PLNCODIGO.asFloat := nPlanilha;
         //-------------------------------------------------------------------------------
         OBSREAVAL.AsString := sObsReaval;
         //-------------------------------------------------------------------------------
         // Códigos :
         // 0 - [DataMovimentacao - 1] , 1 - [DataMovimentacao] , 2 - [Fechamento]
         //-------------------------------------------------------------------------------
         TIPDEPPRORATA.asInteger := iTipDepProRata;
         //-------------------------------------------------------------------------------
         if nTipoDespesa = -1 then
            IDTIPODESPESA.Clear
         else
            IDTIPODESPESA.AsFloat := nTipoDespesa;
         //-------------------------------------------------------------------------------
         OBSACRESCIMO.asString := sObsAcrescimo;
         //-------------------------------------------------------------------------------
         if nMotivoBaixa = -1 then
            IDMOTIVOBAIXA.Clear
         else
            IDMOTIVOBAIXA.AsFloat := nMotivoBaixa;
         //-------------------------------------------------------------------------------
         if nPropBaixa = -1 then
            PROPBAIXA.Clear
         else
            PROPBAIXA.AsFloat := nPropBaixa;
         //-------------------------------------------------------------------------------
         if nValVendaOfi = 0 then
            VALVENDAOFI.Clear
         else
            VALVENDAOFI.AsFloat := nValVendaOfi;
         //-------------------------------------------------------------------------------
         OBSBAIXA.asString := sObsBaixa;
         //-------------------------------------------------------------------------------
         if nCafObra = -1 then
            IDCAFOBRA.Clear
         else
            IDCAFOBRA.AsFloat := nCafObra;
         //-------------------------------------------------------------------------------
         if bFlgRetificaReaval then
            FLGRETIFICAREAVAL.AsFloat := 1
         else
            FLGRETIFICAREAVAL.AsFloat := 0;
         //-------------------------------------------------------------------------------
         FLGNCAF.asInteger := 2;
      end;
      //----------------------------------------------------------------------------------
      bResult   := _dbHistMovBem.Insert;
      sMensagem := _dbHistMovBem.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);
      //----------------------------------------------------------------------------------
      Result := _dbHistMovBem.IDMOVIMENTACAO.AsInteger;
   except
      On E : Exception Do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;
{=========================================================================================
  Função que registra o valor da movimentação

  Parâmetros :
------------------------------------------------------------------------------------------
   Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
------------------------------------------------------------------------------------------

  nSeqHist          : id do HistoricoMovimentacao                       (IDMOVIMENTACAO)
  nMoeCodigo        : id da Moeda                                       (MOECODIGO)
  nIdTaxaDep        : id da TaxaDep                                     (IDTAXADEP)
  nValor            : Valor do Lançamento                               (VALOR)
-----------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nIdTaxaDep,
                                               nValor : Extended) : Boolean;
var
   nValMin : Extended;

begin
   try
      _dbVlrHistMovBem.IDMOVIMENTACAO.AsFloat := nSeqHist;
      _dbVlrHistMovBem.MOECODIGO.AsFloat := nMoeCodigo;
      _dbVlrHistMovBem.IDTAXADEP.AsFloat := nIdTaxaDep;
      _dbVlrHistMovBem.VALOR.AsFloat := nValor;
      //----------------------------------------------------------------------------------
      if nMoecodigo = ParamCAF.MOEDAPADRAO then
      begin
         nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
         if abs(nValor) >= nValMin then
         begin
            iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
            if ParamCAF.MOEPADRAODECIMAIS > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
            end else
            begin
               sFatorDec := '#0';
            end;
            _dbVlrHistMovBem.VALOR.AsFloat := strtofloat(FormatFloat(sFatorDec,((nValor * iFatorDec) / iFatorDec)));
         end;
      end;
      //----------------------------------------------------------------------------------
      if not _dbVlrHistMovBem.Insert then
         Raise Exception.Create(_dbVlrHistMovBem.MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      on E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
//  Função que registra o valor da movimentação
//
//  nSeqHist          : id do HistoricoMovimentacao                       (IDMOVIMENTACAO)
//  nMoeCodigo        : id da Moeda                                       (MOECODIGO)
//  nIdTaxaDep        : id da TaxaDep                                     (IDTAXADEP)
//  nValorLaudo       : Valor do Laudo de Reavaliação                     (VALORLAUDO)
//  nTaxaDepAnt       : Taxa de Depreciação Anterior                      (TAXADEPANT)
//----------------------------------------------------------------------------------------
function TCtrlHistMovBem.RegistraHMBReaval(nSeqHist, nMoeCodigo, nIdTaxaDep,
                                           nValorLaudo, nTaxaDepAnt : Extended) : Boolean;
var
   nValMin : Extended;

begin
   try
      _dbHMBReaval.IDMOVIMENTACAO.AsFloat := nSeqHist;
      _dbHMBReaval.MOECODIGO.AsFloat := nMoeCodigo;
      _dbHMBReaval.IDTAXADEP.AsFloat := nIdTaxaDep;
      _dbHMBReaval.TAXADEPANT.AsFloat := nTaxaDepAnt;
      _dbHMBReaval.VALORLAUDO.AsFloat := nValorLaudo;
      //----------------------------------------------------------------------------------
      if nMoecodigo = ParamCAF.MOEDAPADRAO then
      begin
         nValMin := 1 / Power(10, abs(ParamCAF.MOEPADRAODECIMAIS));
         if abs(nValorLaudo) >= nValMin then
         begin
            iFatorDec := 10 * ParamCAF.MOEPADRAODECIMAIS;
            if ParamCAF.MOEPADRAODECIMAIS > 0 then
            begin
               sFatorDec := '#0.' + StringOfChar('0',ParamCAF.MOEPADRAODECIMAIS);
            end else
            begin
               sFatorDec := '#0';
            end;
            _dbHMBReaval.VALORLAUDO.AsFloat := strtofloat(FormatFloat(sFatorDec,((nValorLaudo * iFatorDec) / iFatorDec)));
         end;
      end;
      //----------------------------------------------------------------------------------
      if not _dbHMBReaval.Insert then
         Raise Exception.Create(_dbHMBReaval.MessageInfo);
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
//========================================================================================
//  Função que registra o valor da movimentação
//
//  Parâmetros :
//----------------------------------------------------------------------------------------
//   Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
//----------------------------------------------------------------------------------------
//
//  nSeqHist          : id do HistoricoMovimentacao                          (IDMOVIMENTACAO)
//  nIdBemResultante  : id do bem resultante                                 (IDBEMRESULTANTE)
//  nProporcao        : Proporcao do bem resultante em relação ao bem origem (PROPORCAO)
//----------------------------------------------------------------------------------------
function TCtrlHistMovBem.RegistraDesmembramento(nSeqHist, nIdBemResultante,
                                                nProporcao : Extended) : Boolean;
var
   sMensagem     : String;
   bResult       : Boolean;

begin
   try
      _dbDesmembramento.IDMOVIMENTACAO.asFloat  := nSeqHist;
      _dbDesmembramento.IDBEMRESULTANTE.asFloat := nIdBemResultante;
      _dbDesmembramento.PROPORCAO.AsFloat       := nProporcao;
      //----------------------------------------------------------------------------------
      bResult   := _dbDesmembramento.Insert;
      sMensagem := _dbDesmembramento.MessageInfo;
      if not bResult then Raise Exception.Create(sMensagem);
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
{=========================================================================================
  Função que registra o valor da movimentação

  Parâmetros :
------------------------------------------------------------------------------------------
   Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
------------------------------------------------------------------------------------------

  nSeqHist          : id do HistoricoMovimentacao                          (IDMOVIMENTACAO)
  nIdBemBaixado     : id do bem resultante                                 (IDBEMBAIXADO)
  nProporcao        : Proporcao do bem resultante em relação ao bem origem (PROPORCAO)
-----------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RegistraRemembramento(nSeqHist, nIdBemBaixado,
                                               nProporcao : Extended) : Boolean;
begin
   try
      _dbRemembramento.IDMOVIMENTACAO.asFloat  := nSeqHist;
      _dbRemembramento.IDBEMBAIXADO.asFloat := nIdBemBaixado;
      if nProporcao > 0 then
         _dbRemembramento.PROPORCAO.AsFloat := nProporcao
      else
         _dbRemembramento.PROPORCAO.Clear;
      //----------------------------------------------------------------------------------
      if not _dbRemembramento.Insert then
         Raise Exception.Create(_dbRemembramento.MessageInfo);
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
{=========================================================================================
  Função que registra a planilha contábil de uma movimentação

  Parâmetros :
------------------------------------------------------------------------------------------
   Obs.: passar (-1) para os os parâmetros numéricos não preenchidos (incluindo data)
------------------------------------------------------------------------------------------

  nSeqHist          : id do HistoricoMovimentacao                       (IDMOVIMENTACAO)
  nPlanilha         : id da planilha gerada                             (PLNCODIGO)
-----------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RegistraPlanHistMovBem(nSeqHist, nPlanilha : Extended) : Boolean;
begin
   try
      //----------------------------------------------------------------------------------
      // Posiciona para alteração
      //----------------------------------------------------------------------------------
      _dbHistMovBem.IDMOVIMENTACAO.AsFloat := nSeqHist;
      if not _dbHistMovBem.LoadFromDB then
         Raise Exception.Create(_dbHistMovBem.MessageInfo);
      //----------------------------------------------------------------------------------
      _dbHistMovBem.PLNCODIGO.AsFloat := nPlanilha;
      //----------------------------------------------------------------------------------
      if not _dbHistMovBem.Update then
         Raise Exception.Create(_dbHistMovBem.MessageInfo);
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
{/========================================================================================
// Função que remove um lançamento no historico
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//  fBem              : id do Bem movimentado                             (IDBEM)
//  fEmpresaProp      : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
//  fModulo           : id do Módulo que incluiu o bem                    (IDMODULO)
//  dDataMovimentacao : data de registro da Movimentação                  (DATAMOVIMENTACAO)
//  sTipoMovimentacao : Lista de Tipos de Movimentacao                    (IDTIPOMOVIMENTACAO)
//  iTipDepProRata    : Flag do tipo de depreciação                       (TIPDEPPRORATA)
//  fTipoMovimentacao : id do Tipo de Movimentacao                        (IDTIPOMOVIMENTACAO)
//---------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RemoveMovimentacao(nBem, nEmpresaProp, nModulo : Extended;
                                            dDataMovimentacao : tDate = -1;
                                            sTipoMovimentacao : String = '';
                                            iTipDepProRata : Integer = -1;
                                            nSeqHist : Extended = -1) : Boolean;
var
   sSql : String;

begin
   try
      //----------------------------------------------------------------------------------
      // Se o parametro idmovimentacao existir, ignorar o resto
      //----------------------------------------------------------------------------------
       if nSeqHist <> -1 then
      begin
         sSql := ' DELETE FROM BAIXABEM ' + #13  +
                 ' WHERE (IDMOVIMENTACAO = ' + floattostr(nSeqHist) + ') ' + #13;
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM ACRESCVALOR ' + #13 +
                 ' WHERE (IDMOVIMENTACAO = ' + floattostr(nSeqHist) + ') ' + #13;
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' + #13 +
                 ' WHERE (IDMOVIMENTACAO = ' + floattostr(nSeqHist) + ') ' + #13;
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
      end else
      begin
         sSql := ' SELECT IDMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF' + #13 +
                 ' FROM HISTORICOMOVIMENTACAO' + #13 +
                 ' WHERE (IDBEM    = ' + floattostr(nBem) + ')' + #13 +
                 '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ')' + #13 +
                 '   AND (DATAMOVIMENTACAO = TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dDataMovimentacao) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' + #13 +
                 '   AND (IDTIPOMOVIMENTACAO IN ('+sTipoMovimentacao+'))' + #13;
         //-------------------------------------------------------------------------------
         if iTipDepProRata <> -1 then
            sSql := sSql + '   AND (TIPDEPPRORATA = '+inttostr(iTipDepProRata)+'))';
         //-------------------------------------------------------------------------------
         _cds.Data := GetDataPacket(sSql);
         while not _cds.Eof do
         begin
            if _cds.FieldByName('NCAF').AsInteger <= 0 then
            begin
               //-------------------------------------------------------------------------
               // Remove os lançamentos da modelagem antiga
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM VALORMOVIMENTACAO ' + #13  +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM DEPRECIACAOBEM ' + #13  +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM DEPRECIACAOREAVAL ' + #13  +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM DEPRECIACAOACRESC ' + #13  +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            if _cds.FieldByName('NCAF').AsInteger <= 1 then  // Nova Modelagem
            begin
               sSql := ' DELETE FROM BAIXABEM ' + #13  +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM ACRESCVALOR ' + #13 +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            if _cds.FieldByName('NCAF').AsInteger <= 2 then  // Três Camadas
            begin
               sSql := ' DELETE FROM VLRHISTMOVBEM ' + #13 +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               sSql := ' DELETE FROM HISTORICOMOVIMENTACAO ' + #13 +
                       ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ' + #13 ;
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
      end;
      Result := True;
   except
      On E : Exception Do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

end.
