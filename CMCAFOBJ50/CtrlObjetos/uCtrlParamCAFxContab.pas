unit uCtrlParamCAFxContab;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------------
Rotina......: ListaTiposMovimentoGrupos , ListaParamCAFxContab ,ProcurarParamCAFxContab ,
              ReconstroiTipoMovimentacao
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado o campo IDTIPODESPESA
--------------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------------


interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uMidasUtil,
     uDBTiposMovimentoGrupos, uDBContasTiposMovimentoGrupos,
     uDBTipoMovimentacao, dMTBem;

Type
   TCtrlParamCAFxContab = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dMTBem : TdtmMTBem;

      _dbTipoMovimentacao           : TDbTipoMovimentacao;
      _dbTiposMovimentoGrupos       : TDbTiposMovimentoGrupos;
      _dbContasTiposMovimentoGrupos : TDbContasTiposMovimentoGrupos;

      Fcds,
      FcdsContasTiposMovimentoGrupos : TClientDataSet;
      FcdsTipoMovimentacao: TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsContasTiposMovimentoGrupos(const Value: TClientDataSet);
      procedure SetcdsTipoMovimentacao(const Value: TClientDataSet);

   Public
      property cds : TClientDataSet read Fcds write Setcds;
      property cdsContasTiposMovimentoGrupos : TClientDataSet read FcdsContasTiposMovimentoGrupos write SetcdsContasTiposMovimentoGrupos;
      property cdsTipoMovimentacao : TClientDataSet read FcdsTipoMovimentacao write SetcdsTipoMovimentacao;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      //Helen - SOL Nº142550 KINTANA Nº 911790 Add nIdTipoDespesa
      function ProcurarParamCAFxContab(nIdPessoa, nIdGrupo, nIdTipoMov, nIdTipoDespesa : Extended) : OleVariant;
      function ListaTipoMovimentacao : OleVariant;
      //Helen - SOL Nº142550 KINTANA Nº 911790 Add nIdTipoDespesa
      function ListaTiposMovimentoGrupos(nIdPessoa : Extended; nIdGrupo : Extended = -1; nIdTipoMov: Extended = -1; nIdTipoDespesa: Extended = -1): OleVariant;
      function ListaParamCAFxContab(nIdPessoa : Extended; nIdGrupo : Extended = -1; nIdTipoMov : Extended = -1; nIdTipoDespesa: Extended = -1; sTipoLanc : String = ''): OleVariant;

      function ListaContabPlano(nPlano : Extended): OleVariant;
      function ListaContabPlanoConta(nPlano : Extended; sPlaConta : String = '') : OleVariant;
      //----------------------------------------------------------------------------------
      function ReconstroiTipoMovimentacao: Boolean;
   end;

implementation

{ TCtrlParamCAFxContab }

constructor TCtrlParamCAFxContab.Create;
begin
   inherited;
   _dbTipoMovimentacao := TDbTipoMovimentacao.Create(Self);
   _dbTiposMovimentoGrupos := TDbTiposMovimentoGrupos.Create(Self);
   _dbContasTiposMovimentoGrupos := TDbContasTiposMovimentoGrupos.Create(Self);

   _dMTBem := TdtmMTBem.Create(Self);

   FcdsTipoMovimentacao := TClientDataSet.Create(nil);
end;

destructor TCtrlParamCAFxContab.Destroy;
begin
   inherited;
   if IsAppServer then
      FreeCDS([Fcds,FcdsContasTiposMovimentoGrupos]);

   FcdsTipoMovimentacao.Free;

   _dbTiposMovimentoGrupos.Free;
   _dbContasTiposMovimentoGrupos.Free;
   _dMTBem.Free;
end;

procedure TCtrlParamCAFxContab.DoChangeDataBase;
begin
   inherited;
   _dbTipoMovimentacao.DataBaseName := DataBaseName;
   _dbTiposMovimentoGrupos.DataBaseName := DataBaseName;
   _dbContasTiposMovimentoGrupos.DataBaseName := DataBaseName;
end;

function TCtrlParamCAFxContab.AplicaOperacao(sTipoOperacao: String): Boolean;
Var
   sMensagem : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoPARAMCAFXCONTAB(sTipoOperacao,
                                                                   Fcds.Data,
                                                                   FcdsContasTiposMovimentoGrupos.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            Result := ApplyCds(Fcds,_dbTiposMovimentoGrupos,[],[]);
            sMensagem := _dbTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(FcdsContasTiposMovimentoGrupos,_dbContasTiposMovimentoGrupos,[],[]);
            sMensagem := _dbContasTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

         end else // Remoção
         begin
            Result := ApplyCds(FcdsContasTiposMovimentoGrupos,_dbContasTiposMovimentoGrupos,[],[]);
            sMensagem := _dbContasTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);

            Result := ApplyCds(Fcds,_dbTiposMovimentoGrupos,[],[]);
            sMensagem := _dbTiposMovimentoGrupos.MessageInfo;
            if not Result then Raise Exception.Create(sMensagem);
         end;
         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;
//Helen - SOL Nº142550 KINTANA Nº 911790 Add nIdTipoDespesa
function TCtrlParamCAFxContab.ListaTiposMovimentoGrupos(nIdPessoa, nIdGrupo, nIdTipoMov, nIdTipoDespesa: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT TMG.IDPESSOA, TMG.IDGRUPO, TMG.IDTIPOMOVIMENTACAO, TMG.FLGUSADEPRECIACAO, TMG.IDTIPODESPESA '+ #13 +
           ' FROM TIPOSMOVIMENTOGRUPOS TMG '+ #13 +
           ' WHERE (TMG.IDPESSOA = ' + floattostr(nIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   //if nIdTipoMov <> -1 then
   if nIdGrupo <> -1 then
      sSql := sSql + '   AND (TMG.IDGRUPO = ' + floattostr(nIdGrupo) + ') ' + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdTipoMov <> -1 then
      sSql := sSql + '   AND (TMG.IDTIPOMOVIMENTACAO = ' + floattostr(nIdTipoMov) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdTipoDespesa <> -1 then
      sSql := sSql + '   AND (TMG.IDTIPODESPESA = ' + floattostr(nIdTipoDespesa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAFxContab.ListaParamCAFxContab(nIdPessoa, nIdGrupo, nIdTipoMov, nIdTipoDespesa: Extended; sTipoLanc : String): OleVariant;
begin
   _dMTBem.sqlParamCAFxContab.SQL.Strings[13] := ' WHERE TMG.IDPESSOA = ' + floattostr(nIdPessoa);
   //-------------------------------------------------------------------------------------
   if nIdGrupo <> -1 then
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[14] := '   AND TMG.IDGRUPO = ' + floattostr(nIdGrupo);
   end else
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[14] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if nIdTipoMov <> -1 then
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[15] := '   AND TMG.IDTIPOMOVIMENTACAO = ' + floattostr(nIdTipoMov);
   end else
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[15] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   //Helen - SOL Nº142550 KINTANA Nº 911790 Add IdTipoDespesa
   if nIdTipoDespesa <> -1 then
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[16] := '   AND TMG.IDTIPODESPESA = ' + floattostr(nIdTipoDespesa);
   end else
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[16] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (sTipoLanc = 'D') or (sTipoLanc = 'C') then
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[17] := '   AND CTMG.TIPOLANCAMENTO = ' + #39 + sTipoLanc + #39;
   end else
   begin
      _dMTBem.sqlParamCAFxContab.SQL.Strings[17] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   _dMTBem.sqlParamCAFxContab.Prepare;
   Result := _dMTBem.sqlParamCAFxContab.Data;
end;

function TCtrlParamCAFxContab.ListaContabPlano(nPlano : Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PLANO, DESCPLANO, MASCARA '+
           ' FROM PLANO '+
           ' WHERE (PLANO = ' + floattostr(nPlano) + ') ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlParamCAFxContab.ListaContabPlanoConta(nPlano : Extended; sPlaConta : String): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT PLANO, PLANOME, RTRIM(PLACONTA) AS PLACONTA, PLATIPO ' + #13 +
           ' FROM PLANOCONTA ' + #13 +
           ' WHERE (PLANO = ' + floattostr(nPlano) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if sPlaConta <> '' then
      sSql := sSql + '   AND (LTRIM(RTRIM(PLACONTA)) = ' + #39 + sPlaConta + #39 + ') ' + #13 ;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (PLAINATIVA = ''A'') ' + #13 +
                  ' ORDER BY PLACONTA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlParamCAFxContab.OnCreateAppServer;
begin
   inherited;
   fCds                           := TClientDataSet.Create(nil);
   fCdsContasTiposMovimentoGrupos := TClientDataSet.Create(nil);
end;

function TCtrlParamCAFxContab.ProcurarParamCAFxContab(nIdPessoa, nIdGrupo, nIdTipoMov, nIdTipoDespesa: Extended): OleVariant;
begin
   _dbContasTiposMovimentoGrupos.IDPESSOA.AsFloat           := nIdPessoa;
   _dbContasTiposMovimentoGrupos.IDGRUPO.AsFloat            := nIdGrupo;
   _dbContasTiposMovimentoGrupos.IDTIPOMOVIMENTACAO.AsFloat := nIdTipoMov;
   //Helen - SOL Nº142550 KINTANA Nº 911790 Add nIdTipoDespesa
   _dbContasTiposMovimentoGrupos.IDTIPODESPESA.AsFloat      := nIdTipoDespesa;

   Result := GetDataPacket(_dbContasTiposMovimentoGrupos.sSQLSelect);
end;

procedure TCtrlParamCAFxContab.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlParamCAFxContab.SetcdsContasTiposMovimentoGrupos(const Value: TClientDataSet);
begin
   FcdsContasTiposMovimentoGrupos := Value;
end;

procedure TCtrlParamCAFxContab.SetcdsTipoMovimentacao(const Value: TClientDataSet);
begin
  FcdsTipoMovimentacao := Value;
end;

function TCtrlParamCAFxContab.ReconstroiTipoMovimentacao: Boolean;
const
    //cMaxTipoMov = 95;//Helen - SOL Nº142550 KINTANA Nº 911790
    cMaxTipoMov = 96;

type
   TrecTipoMov = record
     DESCTIPOMOVIMENTACAO : String;
     LANCAMENTO           : String;
     IDCONTAB             : Integer;
   end;

var
   aTipoMov   : array [1..cMaxTipoMov] of TrecTipoMov;
   iAux       : Integer;
   sSql       : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ReconstroiTipoMovimentacao;
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Alimenta o Vetor dos Tipos de Movimentação
         //-------------------------------------------------------------------------------
         aTipoMov[01].DESCTIPOMOVIMENTACAO := 'ENTRADA COM CONTROLE TOTAL';
         aTipoMov[02].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE RESPONSAVEL';
         aTipoMov[03].DESCTIPOMOVIMENTACAO := 'ENTRADA COM CONTROLE FISICO';
         aTipoMov[04].DESCTIPOMOVIMENTACAO := 'TROCA DO NUMERO DA PLACA DE TOMBAMENTO';
         aTipoMov[05].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE GRUPO';
         aTipoMov[06].DESCTIPOMOVIMENTACAO := 'BAIXA CUSTO AQUISICAO';
         aTipoMov[07].DESCTIPOMOVIMENTACAO := 'ENTRADA POR DESMEMBRAMENTO';
         aTipoMov[10].DESCTIPOMOVIMENTACAO := 'ENTRADA POR REMEMBRAMENTO';
         aTipoMov[13].DESCTIPOMOVIMENTACAO := 'BAIXA PARA DESMEMBRAMENTO';
         aTipoMov[16].DESCTIPOMOVIMENTACAO := 'BAIXA PARA REMEMBRAMENTO';
         aTipoMov[08].DESCTIPOMOVIMENTACAO := 'REAVALIACAO PATRIMONIAL';
         aTipoMov[09].DESCTIPOMOVIMENTACAO := 'ACRESCIMO DE VALOR';
         aTipoMov[95].DESCTIPOMOVIMENTACAO := 'DECRESCIMO DE VALOR                     ';
         aTipoMov[11].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE LOCAL';
         aTipoMov[12].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA DE CONJUNTO';
         aTipoMov[14].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO';
         aTipoMov[15].DESCTIPOMOVIMENTACAO := 'CORRECAO MONETARIA';
         aTipoMov[17].DESCTIPOMOVIMENTACAO := 'INCLUSAO DE DEPRECIACAO';
         aTipoMov[18].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DA REAVALIACAO';
         aTipoMov[19].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA DEPR. DA REAVALIACAO';
         aTipoMov[20].DESCTIPOMOVIMENTACAO := 'BAIXA REAVALIACAO';
         aTipoMov[21].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA DEPRECIACAO';
         aTipoMov[22].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA REAVALIACAO';
         aTipoMov[23].DESCTIPOMOVIMENTACAO := 'REAVALIACAO PATRIMONIAL NEGATIVA';
         aTipoMov[24].DESCTIPOMOVIMENTACAO := 'BAIXA DEPRECIACAO';
         aTipoMov[25].DESCTIPOMOVIMENTACAO := 'BAIXA CORR. MONET. DO BEM';
         aTipoMov[26].DESCTIPOMOVIMENTACAO := 'BAIXA CORR. MONET. DA DEPRECIACAO';
         aTipoMov[27].DESCTIPOMOVIMENTACAO := 'BAIXA DEPRECIACAO DA REAVALIACAO';
         aTipoMov[28].DESCTIPOMOVIMENTACAO := 'BAIXA CORR. MONET. DA REAVALIACAO';
         aTipoMov[29].DESCTIPOMOVIMENTACAO := 'BAIXA CORR MONET DA DEPR. DA REAVAL.';
         aTipoMov[30].DESCTIPOMOVIMENTACAO := 'LUCRO NA ALIENACAO DE BEM';
         aTipoMov[31].DESCTIPOMOVIMENTACAO := 'PREJUIZO NA ALIENACAO DE BEM';
         aTipoMov[32].DESCTIPOMOVIMENTACAO := 'INCLUSAO DE SALDO DE REAVALIACAO';
         aTipoMov[33].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DE SALDO DE REAVALIACAO';
         aTipoMov[34].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DO ACRESCIMO DE VALOR';
         aTipoMov[35].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DO ACRESCIMO DE VALOR';
         aTipoMov[36].DESCTIPOMOVIMENTACAO := 'CORR. MONET. DA DEPR. DO ACRESC. VALOR';
         aTipoMov[37].DESCTIPOMOVIMENTACAO := 'BAIXA ACRESCIMO DE VALOR';
         aTipoMov[38].DESCTIPOMOVIMENTACAO := 'BAIXA CORR. MONET. DO ACRESC. VALOR';
         aTipoMov[39].DESCTIPOMOVIMENTACAO := 'BAIXA DEPRECIACAO DO ACRESC. VALOR';
         aTipoMov[40].DESCTIPOMOVIMENTACAO := 'BAIXA CORR. MONET DA DEPR. DO ACRESC.';
         aTipoMov[41].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - AQUISICAO';
         aTipoMov[42].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - C.M. AQUISICAO';
         aTipoMov[43].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - DEPRECIACAO';
         aTipoMov[44].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - C.M. DEPRECIACAO';
         aTipoMov[45].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - REAVALIACAO';
         aTipoMov[46].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - C.M. REAVALIACAO';
         aTipoMov[47].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - DEPREC.REAVAL.';
         aTipoMov[48].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - C.M.DEPREC.REAVAL.';
         aTipoMov[49].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - ACRESCIMO VALOR';
         aTipoMov[50].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - C.M. ACRESCIMO';
         aTipoMov[51].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - DEPREC. ACRESCIMO';
         aTipoMov[52].DESCTIPOMOVIMENTACAO := 'AJUSTE LANCAMENTO - C.M.DEPREC ACRESC.';
         aTipoMov[53].DESCTIPOMOVIMENTACAO := 'REAVALIACAO DE SALDO DE REAVALIACAO';
         aTipoMov[54].DESCTIPOMOVIMENTACAO := 'REAVALIACAO DE ACRESCIMO DE VALOR';
         aTipoMov[55].DESCTIPOMOVIMENTACAO := 'ATUALIZACAO MONETARIA';
         aTipoMov[56].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA CORRECAO MONETARIA';
         aTipoMov[57].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA DEPRECIACAO';
         aTipoMov[58].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA C.M. DA DEPRECIACAO';
         aTipoMov[59].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA REAVALIACAO';
         aTipoMov[60].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA CORR.MONET. DA REAVAL.';
         aTipoMov[61].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA DEPREC. DA REAVAL.';
         aTipoMov[62].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA C.M. DA DEPREC DA REAVAL';
         aTipoMov[63].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DO ACRESC.VALOR';
         aTipoMov[64].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA CORR.MONET. DO ACRESC.';
         aTipoMov[65].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA DEPREC. DO ACRESC.';
         aTipoMov[66].DESCTIPOMOVIMENTACAO := 'ATUAL.MONET. DA C.M. DA DEPREC DO ACRESC';
         aTipoMov[67].DESCTIPOMOVIMENTACAO := 'LANCAMENTO DE OBRA';
         aTipoMov[68].DESCTIPOMOVIMENTACAO := 'ENTRADA POR ENCERRAMENTO DE OBRA';
         aTipoMov[69].DESCTIPOMOVIMENTACAO := 'DEPRECIACAO DA REAVALIACAO NEGATIVA';
         aTipoMov[70].DESCTIPOMOVIMENTACAO := 'BAIXA REAVALIACAO NEGATIVA';
         aTipoMov[71].DESCTIPOMOVIMENTACAO := 'BAIXA DEPRECIACAO DA REAVAL.NEGATIVA';
         aTipoMov[72].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[73].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[74].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[75].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[76].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[77].DESCTIPOMOVIMENTACAO := '';
         //-------------------------------------------------------------------------------
         // Movimento para Transferencia de Atividade/Projeto
         //-------------------------------------------------------------------------------
         aTipoMov[78].DESCTIPOMOVIMENTACAO := 'TRANSFERENCIA ATIVIDADE/PROJETO';
         //-------------------------------------------------------------------------------
         aTipoMov[79].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[80].DESCTIPOMOVIMENTACAO := '';
         aTipoMov[81].DESCTIPOMOVIMENTACAO := 'ENTRADA POR REAVALIACAO                 ';
         aTipoMov[82].DESCTIPOMOVIMENTACAO := 'ENTRADA POR REAVALIACAO - SALDO REAVAL. ';
         aTipoMov[83].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. CUSTO AQUISICAO       ';
         aTipoMov[84].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. C.M. CUSTO            ';
         aTipoMov[85].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. DEPREC. CUSTO         ';
         aTipoMov[86].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. C.M. DEPREC. CUSTO    ';
         aTipoMov[87].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. REAVALIACAO           ';
         aTipoMov[88].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. C.M. REAVALIACAO      ';
         aTipoMov[89].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. DEPREC. REAVALIACAO   ';
         aTipoMov[90].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. C.M. DEPREC. REAVAL.  ';
         aTipoMov[91].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. ACRESCIMO DE VALOR    ';
         aTipoMov[92].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. C.M. ACRESC.VALOR     ';
         aTipoMov[93].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. DEPREC. ACRESC.VALOR  ';
         aTipoMov[94].DESCTIPOMOVIMENTACAO := 'BAIXA POR REAVAL. C.M. DEP. ACRESC.VALOR';
         //Helen - SOL Nº142550 KINTANA Nº 911790
         aTipoMov[96].DESCTIPOMOVIMENTACAO := 'BAIXA DECRESCIMO DE VALOR';
         //-------------------------------------------------------------------------------
         aTipoMov[01].LANCAMENTO := 'S';
         aTipoMov[02].LANCAMENTO := 'N';
         aTipoMov[03].LANCAMENTO := 'N';
         aTipoMov[04].LANCAMENTO := 'N';
         aTipoMov[05].LANCAMENTO := 'N';
         aTipoMov[06].LANCAMENTO := 'S';
         aTipoMov[07].LANCAMENTO := 'N';
         aTipoMov[08].LANCAMENTO := 'S';
         aTipoMov[09].LANCAMENTO := 'S';
         aTipoMov[95].LANCAMENTO := 'S';
         aTipoMov[10].LANCAMENTO := 'N';
         aTipoMov[11].LANCAMENTO := 'N';
         aTipoMov[12].LANCAMENTO := 'N';
         aTipoMov[13].LANCAMENTO := 'N';
         aTipoMov[14].LANCAMENTO := 'S';
         aTipoMov[15].LANCAMENTO := 'S';
         aTipoMov[16].LANCAMENTO := 'N';
         aTipoMov[17].LANCAMENTO := 'N';
         aTipoMov[18].LANCAMENTO := 'S';
         aTipoMov[19].LANCAMENTO := 'S';
         aTipoMov[20].LANCAMENTO := 'S';
         aTipoMov[21].LANCAMENTO := 'S';
         aTipoMov[22].LANCAMENTO := 'S';
         aTipoMov[23].LANCAMENTO := 'S';
         aTipoMov[24].LANCAMENTO := 'S';
         aTipoMov[25].LANCAMENTO := 'S';
         aTipoMov[26].LANCAMENTO := 'S';
         aTipoMov[27].LANCAMENTO := 'S';
         aTipoMov[28].LANCAMENTO := 'S';
         aTipoMov[29].LANCAMENTO := 'S';
         aTipoMov[30].LANCAMENTO := 'S';
         aTipoMov[31].LANCAMENTO := 'S';
         aTipoMov[32].LANCAMENTO := 'N';
         aTipoMov[33].LANCAMENTO := 'N';
         aTipoMov[34].LANCAMENTO := 'S';
         aTipoMov[35].LANCAMENTO := 'S';
         aTipoMov[36].LANCAMENTO := 'S';
         aTipoMov[37].LANCAMENTO := 'S';
         aTipoMov[38].LANCAMENTO := 'S';
         aTipoMov[39].LANCAMENTO := 'S';
         aTipoMov[40].LANCAMENTO := 'S';
         aTipoMov[41].LANCAMENTO := 'N';
         aTipoMov[42].LANCAMENTO := 'N';
         aTipoMov[43].LANCAMENTO := 'N';
         aTipoMov[44].LANCAMENTO := 'N';
         aTipoMov[45].LANCAMENTO := 'N';
         aTipoMov[46].LANCAMENTO := 'N';
         aTipoMov[47].LANCAMENTO := 'N';
         aTipoMov[48].LANCAMENTO := 'N';
         aTipoMov[49].LANCAMENTO := 'N';
         aTipoMov[50].LANCAMENTO := 'N';
         aTipoMov[51].LANCAMENTO := 'N';
         aTipoMov[52].LANCAMENTO := 'N';
         aTipoMov[53].LANCAMENTO := 'N';
         aTipoMov[54].LANCAMENTO := 'N';
         aTipoMov[55].LANCAMENTO := 'N';
         aTipoMov[56].LANCAMENTO := 'N';
         aTipoMov[57].LANCAMENTO := 'N';
         aTipoMov[58].LANCAMENTO := 'N';
         aTipoMov[59].LANCAMENTO := 'N';
         aTipoMov[60].LANCAMENTO := 'N';
         aTipoMov[61].LANCAMENTO := 'N';
         aTipoMov[62].LANCAMENTO := 'N';
         aTipoMov[63].LANCAMENTO := 'N';
         aTipoMov[64].LANCAMENTO := 'N';
         aTipoMov[65].LANCAMENTO := 'N';
         aTipoMov[66].LANCAMENTO := 'N';
         aTipoMov[67].LANCAMENTO := 'S';
         aTipoMov[68].LANCAMENTO := 'N';
         aTipoMov[69].LANCAMENTO := 'S';
         aTipoMov[70].LANCAMENTO := 'S';
         aTipoMov[71].LANCAMENTO := 'S';
         aTipoMov[81].LANCAMENTO := 'N';
         aTipoMov[82].LANCAMENTO := 'N';
         aTipoMov[83].LANCAMENTO := 'N';
         aTipoMov[84].LANCAMENTO := 'N';
         aTipoMov[85].LANCAMENTO := 'N';
         aTipoMov[86].LANCAMENTO := 'N';
         aTipoMov[87].LANCAMENTO := 'N';
         aTipoMov[88].LANCAMENTO := 'N';
         aTipoMov[89].LANCAMENTO := 'N';
         aTipoMov[90].LANCAMENTO := 'N';
         aTipoMov[91].LANCAMENTO := 'N';
         aTipoMov[92].LANCAMENTO := 'N';
         aTipoMov[93].LANCAMENTO := 'N';
         aTipoMov[94].LANCAMENTO := 'N';
         //Helen - SOL Nº142550 KINTANA Nº 911790
         aTipoMov[96].LANCAMENTO := 'S';
         //-------------------------------------------------------------------------------
         aTipoMov[01].IDCONTAB := 03;
         aTipoMov[02].IDCONTAB := 03;
         aTipoMov[03].IDCONTAB := 03;
         aTipoMov[04].IDCONTAB := 03;
         aTipoMov[05].IDCONTAB := 03;
         aTipoMov[06].IDCONTAB := 03;
         aTipoMov[07].IDCONTAB := 03;
         aTipoMov[08].IDCONTAB := 03;
         aTipoMov[09].IDCONTAB := 03;
         aTipoMov[95].IDCONTAB := 03;
         aTipoMov[10].IDCONTAB := 03;
         aTipoMov[11].IDCONTAB := 03;
         aTipoMov[12].IDCONTAB := 03;
         aTipoMov[13].IDCONTAB := 03;
         aTipoMov[14].IDCONTAB := 03;
         aTipoMov[15].IDCONTAB := 03;
         aTipoMov[16].IDCONTAB := 03;
         aTipoMov[17].IDCONTAB := 03;
         aTipoMov[18].IDCONTAB := 03;
         aTipoMov[19].IDCONTAB := 03;
         aTipoMov[20].IDCONTAB := 03;
         aTipoMov[21].IDCONTAB := 03;
         aTipoMov[22].IDCONTAB := 03;
         aTipoMov[23].IDCONTAB := 03;
         aTipoMov[24].IDCONTAB := 03;
         aTipoMov[25].IDCONTAB := 03;
         aTipoMov[26].IDCONTAB := 03;
         aTipoMov[27].IDCONTAB := 03;
         aTipoMov[28].IDCONTAB := 03;
         aTipoMov[29].IDCONTAB := 03;
         aTipoMov[30].IDCONTAB := 03;
         aTipoMov[31].IDCONTAB := 03;
         aTipoMov[32].IDCONTAB := 03;
         aTipoMov[33].IDCONTAB := 03;
         aTipoMov[34].IDCONTAB := 03;
         aTipoMov[35].IDCONTAB := 03;
         aTipoMov[36].IDCONTAB := 03;
         aTipoMov[37].IDCONTAB := 03;
         aTipoMov[38].IDCONTAB := 03;
         aTipoMov[39].IDCONTAB := 03;
         aTipoMov[40].IDCONTAB := 03;
         aTipoMov[41].IDCONTAB := 03;
         aTipoMov[42].IDCONTAB := 03;
         aTipoMov[43].IDCONTAB := 03;
         aTipoMov[44].IDCONTAB := 03;
         aTipoMov[45].IDCONTAB := 03;
         aTipoMov[46].IDCONTAB := 03;
         aTipoMov[47].IDCONTAB := 03;
         aTipoMov[48].IDCONTAB := 03;
         aTipoMov[49].IDCONTAB := 03;
         aTipoMov[50].IDCONTAB := 03;
         aTipoMov[51].IDCONTAB := 03;
         aTipoMov[52].IDCONTAB := 03;
         aTipoMov[53].IDCONTAB := 03;
         aTipoMov[54].IDCONTAB := 03;
         aTipoMov[55].IDCONTAB := 03;
         aTipoMov[56].IDCONTAB := 03;
         aTipoMov[57].IDCONTAB := 03;
         aTipoMov[58].IDCONTAB := 03;
         aTipoMov[59].IDCONTAB := 03;
         aTipoMov[60].IDCONTAB := 03;
         aTipoMov[61].IDCONTAB := 03;
         aTipoMov[62].IDCONTAB := 03;
         aTipoMov[63].IDCONTAB := 03;
         aTipoMov[64].IDCONTAB := 03;
         aTipoMov[65].IDCONTAB := 03;
         aTipoMov[66].IDCONTAB := 03;
         aTipoMov[67].IDCONTAB := 03;
         aTipoMov[68].IDCONTAB := 03;
         aTipoMov[69].IDCONTAB := 03;
         aTipoMov[70].IDCONTAB := 03;
         aTipoMov[71].IDCONTAB := 03;
         aTipoMov[81].IDCONTAB := 03;
         aTipoMov[82].IDCONTAB := 03;
         aTipoMov[83].IDCONTAB := 03;
         aTipoMov[84].IDCONTAB := 03;
         aTipoMov[85].IDCONTAB := 03;
         aTipoMov[86].IDCONTAB := 03;
         aTipoMov[87].IDCONTAB := 03;
         aTipoMov[88].IDCONTAB := 03;
         aTipoMov[89].IDCONTAB := 03;
         aTipoMov[90].IDCONTAB := 03;
         aTipoMov[91].IDCONTAB := 03;
         aTipoMov[92].IDCONTAB := 03;
         aTipoMov[93].IDCONTAB := 03;
         aTipoMov[94].IDCONTAB := 03;
         //Helen - SOL Nº142550 KINTANA Nº 911790
         aTipoMov[96].IDCONTAB := 03;
         //-------------------------------------------------------------------------------
         FcdsTipoMovimentacao.Data := ListaTipoMovimentacao;
         iAux := 1;
         while iAux <= cMaxTipoMov do
         begin
            if aTipoMov[iAux].DESCTIPOMOVIMENTACAO <> '' then
            begin
               if not FcdsTipoMovimentacao.Locate('IDTIPOMOVIMENTACAO',iAux,[]) then
               begin
                  FcdsTipoMovimentacao.Append;
                  FcdsTipoMovimentacao.FieldByName('IDTIPOMOVIMENTACAO').AsInteger  := iAux;
                  FcdsTipoMovimentacao.FieldByName('DESCTIPOMOVIMENTACAO').AsString := aTipoMov[iAux].DESCTIPOMOVIMENTACAO;
                  FcdsTipoMovimentacao.FieldByName('LANCAMENTO').AsString           := aTipoMov[iAux].LANCAMENTO;
                  FcdsTipoMovimentacao.FieldByName('IDCONTAB').AsInteger            := aTipoMov[iAux].IDCONTAB;
                  FcdsTipoMovimentacao.Post;
               end else
               //-------------------------------------------------------------------------
               begin
                  FcdsTipoMovimentacao.Edit;
                  FcdsTipoMovimentacao.FieldByName('DESCTIPOMOVIMENTACAO').AsString := aTipoMov[iAux].DESCTIPOMOVIMENTACAO;
                  FcdsTipoMovimentacao.FieldByName('LANCAMENTO').AsString           := aTipoMov[iAux].LANCAMENTO;
                  FcdsTipoMovimentacao.FieldByName('IDCONTAB').AsInteger            := aTipoMov[iAux].IDCONTAB;
                  FcdsTipoMovimentacao.Post;
               end;
               //-------------------------------------------------------------------------
            end;
            iAux := iAux + 1;
         end;
         if not ApplyCds(FcdsTipoMovimentacao,_dbTipoMovimentacao,[],[]) then
            Raise Exception.Create(_dbTipoMovimentacao.MessageInfo);
         //-------------------------------------------------------------------------------
         iAux := 1;
         while iAux <= cMaxTipoMov do
         begin
            if aTipoMov[iAux].DESCTIPOMOVIMENTACAO = '' then
            begin
               sSql := ' DELETE FROM CONTASTIPOSMOVIMENTOGRUPOS ' +
                       ' WHERE IDTIPOMOVIMENTACAO = ' + inttostr(iAux);
               if not ExecSQL(sSql, False) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM TIPOSMOVIMENTOGRUPOS ' +
                       ' WHERE IDTIPOMOVIMENTACAO = ' + inttostr(iAux);
               if not ExecSQL(sSql, False) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               sSql := ' DELETE FROM TIPOMOVIMENTACAO ' +
                       ' WHERE IDTIPOMOVIMENTACAO = ' + inttostr(iAux);
               if not ExecSQL(sSql, False) then
                  Raise Exception.Create(MessageInfo);
            end;
            iAux := iAux + 1;
         end;
         //-------------------------------------------------------------------------------
         Result := True;
         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlParamCAFxContab.ListaTipoMovimentacao: OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO, LANCAMENTO, IDCONTAB '+ #13 +
           ' FROM TIPOMOVIMENTACAO ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

end.

