unit uCtrlHistMovBem;

interface

Uses Controls, DB, uDataBase, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uSistema, uMidasUtil,
     uDBTipoMovimentacao, uDBHistMovBem, uDBVlrHistMovBem;

Type
   TCtrlHistMovBem = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbHistMovBem     : TDBHistMovBem;
      _dbVlrHistMovBem  : TDBVlrHistMovBem;

      FcdsVlrHistMovBem: TClientDataSet;
      FcdsHistMovBem: TClientDataSet;

      procedure SetcdsHistMovBem(const Value: TClientDataSet);
      procedure SetcdsVlrHistMovBem(const Value: TClientDataSet);

   Public
      property cdsHistMovBem : TClientDataSet read FcdsHistMovBem write SetcdsHistMovBem;
      property cdsVlrHistMovBem : TClientDataSet read FcdsVlrHistMovBem write SetcdsVlrHistMovBem;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function RegistraHistMovBem(nBem, nEmpresaProp, nModulo, nTipoMovimentacao : Extended;
                                  dDataMovimentacao : TDate;
                                  nReavalAcresc : Extended;
                                  dDataUltDep : TDate;
                                  nGrupAnt, nConjAnt, nLocalAnt, nRespAnt, nPlacaAnt,
                                  nPlanilha, nTaxaDepAnt, nValorgLaudo : Extended;
                                  sObsReaval : String; iTipDepProRata, iIdTaxaDep : Integer;
                                  nTipoDespesa : Extended; sObsAcrescimo : string;
                                  nMotivoBaixa, nPropBaixa : Extended;
                                  sObsBaixa : string) : Extended;

      function RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nValor : Extended) : Boolean;

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
   _dbHistMovBem     := TDBHistMovBem.Create;
   _dbVlrHistMovBem  := TDBVlrHistMovBem.Create;
end;

destructor TCtrlHistMovBem.Destroy;
begin
   if IsAppServer then
      FreeCDS([fCdsHistMovBem,fCdsVlrHistMovBem]);

   _dbHistMovBem.Free;
   _dbVlrHistMovBem.Free;

   inherited;
end;

procedure TCtrlHistMovBem.DoChangeDataBase;
begin
   inherited;
   _dbHistMovBem.Free;
   _dbVlrHistMovBem.Free;
end;

procedure TCtrlHistMovBem.OnCreateAppServer;
begin
   inherited;
   fCdsHistMovBem     := TClientDataSet.Create(nil);
   fCdsVlrHistMovBem  := TClientDataSet.Create(nil);
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
  iTipDepProRata    : Identifica a depreciação ProRata                  (TIPDEPPRORATA)
  iIdTaxaDep        : Código identificando o tipo de depreciação que foi
                      calculado : 0 - [DataMovimentacao - 1], 1 - [DataMovimentacao], 2 - [Fechamento]
  nTipoDespesa      : id do Tipo de Despesa para acrescimo de valor     (IDTIPODESPESA)
  sObsAcrescimo     : Observação relativa ao acréscimo de valor         (OBSACRESCIMO)
  nMotivoBaixa      : id do motivo para baixa de bem                    (IDMOTIVOBAIXA)
  nPropBaixa        : Proporção da baixa de bem (0-100)                 (PROPBAIXA)
  sObsBaixa         : Observação relativa a baixa de bem                (OBSBAIXA)
-----------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RegistraHistMovBem(nBem, nEmpresaProp, nModulo, nTipoMovimentacao : Extended;
                                            dDataMovimentacao : TDate;
                                            nReavalAcresc : Extended;
                                            dDataUltDep : TDate;
                                            nGrupAnt, nConjAnt, nLocalAnt, nRespAnt, nPlacaAnt,
                                            nPlanilha, nTaxaDepAnt, nValorgLaudo : Extended;
                                            sObsReaval : String; iTipDepProRata, iIdTaxaDep : Integer;
                                            nTipoDespesa : Extended; sObsAcrescimo : string;
                                            nMotivoBaixa, nPropBaixa : Extended;
                                            sObsBaixa : string) : Extended;
var
   sMensagem     : String;
   bResult       : Boolean;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.RegistraHistMovBem(nBem, nEmpresaProp, nModulo,
                                                        nTipoMovimentacao, dDataMovimentacao,
                                                        nReavalAcresc, dDataUltDep,
                                                        nGrupAnt, nConjAnt, nLocalAnt, nRespAnt,
                                                        nPlacaAnt, nPlanilha, nTaxaDepAnt,
                                                        nValorgLaudo, sObsReaval, iTipDepProRata,
                                                        iIdTaxaDep, nTipoDespesa, sObsAcrescimo,
                                                        nMotivoBaixa, nPropBaixa, sObsBaixa);
      if Result = -1 then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         with _dbHistMovBem do
         begin
            IDBEM.asFloat                := nBem;
            IDPESSOA.asFloat             := nEmpresaProp;
            IDMODULO.asFloat             := nModulo;
            IDTIPOMOVIMENTACAO.asFloat   := nTipoMovimentacao;
            DATAMOVIMENTACAO.asDateTime  := dDataMovimentacao;
            //----------------------------------------------------------------------------
            if nReavalAcresc = -1 then
               IDREAVALACRESC.Clear
            else
               IDREAVALACRESC.AsFloat    := nReavalAcresc;
            //----------------------------------------------------------------------------
            if dDataUltDep = -1 then
               DATAULTDEP.Clear
            else
               DATAULTDEP.AsDateTime := dDataUltDep;
            //----------------------------------------------------------------------------
            if nGrupAnt = -1 then
               IDGRUPANT.Clear
            else
               IDGRUPANT.AsFloat := nGrupAnt;
            //----------------------------------------------------------------------------
            if nConjAnt = -1 then
               IDCONJANT.Clear
            else
               IDCONJANT.AsFloat := nConjAnt;
            //----------------------------------------------------------------------------
            if nLocalAnt = -1 then
               IDLOCALANT.Clear
            else
               IDLOCALANT.AsFloat := nLocalAnt;
            //----------------------------------------------------------------------------
            if nRespAnt = -1 then
               IDRESPANT.Clear
            else
               IDRESPANT.AsFloat := nRespAnt;
            //----------------------------------------------------------------------------
            if nPlacaAnt = -1 then
               PLACAANT.Clear
            else
               PLACAANT.AsFloat := nPlacaAnt;
            //----------------------------------------------------------------------------
            if nPlanilha = -1 then
               PLNCODIGO.Clear
            else
               PLNCODIGO.asFloat := nPlanilha;
            //----------------------------------------------------------------------------
            if nTaxaDepAnt = -1 then
               TAXADEPANT.Clear
            else
               TAXADEPANT.AsFloat := nTaxaDepAnt;
            //----------------------------------------------------------------------------
            if nValorgLaudo = -1 then
               VALORGLAUDO.Clear
            else
               VALORGLAUDO.AsFloat := nValorgLaudo;
            //----------------------------------------------------------------------------
            OBSREAVAL.AsString := sObsReaval;
            //----------------------------------------------------------------------------
            // Códigos :
            // 0 - [DataMovimentacao - 1] , 1 - [DataMovimentacao] , 2 - [Fechamento]
            //----------------------------------------------------------------------------
            TIPDEPPRORATA.asInteger := iTipDepProRata;
            //----------------------------------------------------------------------------
            IDTAXADEP.asInteger := iIdTaxaDep;
            //----------------------------------------------------------------------------
            if nTipoDespesa = -1 then
               IDTIPODESPESA.Clear
            else
               IDTIPODESPESA.AsFloat := nTipoDespesa;
            //----------------------------------------------------------------------------
            OBSACRESCIMO.asString := sObsAcrescimo;
            //----------------------------------------------------------------------------
            if nMotivoBaixa = -1 then
               IDMOTIVOBAIXA.Clear
            else
               IDMOTIVOBAIXA.AsFloat := nMotivoBaixa;
            //----------------------------------------------------------------------------
            if nPropBaixa = -1 then
               PROPBAIXA.Clear
            else
               PROPBAIXA.AsFloat := nPropBaixa;
            //----------------------------------------------------------------------------
            OBSBAIXA.asString := sObsBaixa;
            //----------------------------------------------------------------------------
            FLGNCAF.asInteger := 1;
         end;
         //-------------------------------------------------------------------------------
         bResult   := _dbHistMovBem.Insert;
         sMensagem := _dbHistMovBem.MessageInfo;
         if not bResult then Raise Exception.Create(sMensagem);
         //-------------------------------------------------------------------------------
         Result := _dbHistMovBem.IDMOVIMENTACAO.AsInteger;
      except
         On E : Exception Do
         begin
            Result := -1;
            MessageInfo := E.Message;
         end;
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
  nValor            : Valor do Lançamento                               (VALOR)
-----------------------------------------------------------------------------------------}
function TCtrlHistMovBem.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nValor : Extended) : Boolean;
var
   sMensagem     : String;
   bResult       : Boolean;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.RegistraVlrHistMovBem(nSeqHist, nMoeCodigo, nValor);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         with _dbVlrHistMovBem do
         begin
            IDMOVIMENTACAO.asFloat := nSeqHist;
            MOECODIGO.asFloat      := nMoeCodigo;
            if abs(nValor) >= 0.01 then
            begin
               VALOR.AsFloat := strtofloat(FormatFloat('#0.00',((nValor * 100) / 100)));
            end else
            begin
               VALOR.AsFloat := nValor;
            end;
         end;
         //-------------------------------------------------------------------------------
         bResult   := _dbVlrHistMovBem.Insert;
         sMensagem := _dbVlrHistMovBem.MessageInfo;
         if not bResult then Raise Exception.Create(sMensagem);
         //-------------------------------------------------------------------------------
         Result := True;
      except
         On E : Exception Do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
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
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.RemoveMovimentacao(nBem, nEmpresaProp, nModulo,
                                                        dDataMovimentacao, sTipoMovimentacao,
                                                        iTipDepProRata, nSeqHist);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         //-------------------------------------------------------------------------------
         // Se o parametro idmovimentacao existir, ignorar o resto
         //-------------------------------------------------------------------------------
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
                    '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMovimentacao) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' + #13 +
                    '   AND (IDTIPOMOVIMENTACAO IN ('+sTipoMovimentacao+'))' + #13;
            //----------------------------------------------------------------------------
            if iTipDepProRata <> -1 then
               sSql := sSql + '   AND (TIPDEPPRORATA = '+inttostr(iTipDepProRata)+'))';
            //----------------------------------------------------------------------------
            _cds.Data := GetDataPacket(sSql);
            while not _cds.Eof do
            begin
               if _cds.FieldByName('NCAF').AsInteger <= 0 then
               begin
                  //----------------------------------------------------------------------
                  // Remove os lançamentos da modelagem antiga
                  //----------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
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
               //-------------------------------------------------------------------------
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
end;

procedure TCtrlHistMovBem.SetcdsHistMovBem(const Value: TClientDataSet);
begin
  FcdsHistMovBem := Value;
end;

procedure TCtrlHistMovBem.SetcdsVlrHistMovBem(const Value: TClientDataSet);
begin
  FcdsVlrHistMovBem := Value;
end;

end.
