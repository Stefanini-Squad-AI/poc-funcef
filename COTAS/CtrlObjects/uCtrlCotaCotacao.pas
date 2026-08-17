//************************************************************************************************//
// Data      : 21/08/2007
// Código    : AL_9
// Pendencia : 25659
// SOL       : 47728
// Descrição : Implementação da busca do maior id da tabela "HISTFUNDO" grupado pelo index da mesma
//************************************************************************************************//
// Data      : 21/08/2007
// Código    : AL_8
// Pendencia : 25659
// SOL       : 47728
// Descrição : Alteração na rotina "DiasUteis.DiaUtil(" para não considerar feriado extraordinário
//************************************************************************************************//
// Data      : 18/07/2007
// Código    : AL_7
// Descrição : Implementação do fluxo de memória de cálculo no relatório de perfil consolidado
//************************************************************************************************//
// Data      : 08/03/2007
// Código    : AL_6
// Pendencia : 23433
// SOL       : 43744
// Descrição : Ajuste no remanejamento de lançamentos de dias não úteis oara o dia útil seguinte
//************************************************************************************************//
// Data      : 26/01/2007
// Código    : AL_5
// Pendencia : 22362
// SOL       : 43207
// Descrição : Ajuste no SQL para pegar Imoveis carimbados por Plano Patro na ParamGlobal quando
//             a tabela PLANOPATROXIMOVEL estiver vazia (Carimbados na origem)
//************************************************************************************************//
// Data      : 26/01/2007
// Código    : AL_4
// Pendencia : 22362
// SOL       : 43207
// Descrição : Retirando a variável com "array" de idativos das queries, nenhum banco faz a
//              cláusula IN com mais de 1000 itens
//********************************************************************************************************
//Data	     : 16/01/2007
//Codigo     : AL_3
//Pendência  : 22502
//Função     : Implementada a separação do Lucro / Prejuízo para Rentabilizar e não cotizar
//********************************************************************************************************
//Data	     : 11/01/2007
//Codigo     : AL_2
//Pendência  : 23433
//SOL        : 46744
//Função     : Quanto o Ativo tem somente uma movimentação no período e esta movimentação
//               é em dia não útil, o sistema não atualiza a cota deste ativo.
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_1
//Função     : Acerto na Cotização após Resgates quando a Cotização é com a cota do dia anterior
//--------------------------------------------------------------------------------------------------
{Rotina    : RetornaCotaPonderada
Data      : 25/01/2005
Descrição : Inclusão dessa rotina, para calcular a qtd de cotas a partir da cota ponderada.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ProcessaCotaModulos, ProcessaCotas, MontaSQLAtivos
Data      : 19/01/2005
Descrição : Passando o parâmetro sIdAtivos. Este parâmetro será utilizado para calcular apenas ativos
            específicos, ao invés de se calcular toda carteira

Métodos Retirados: ListaCotaCotacao, SelecionaCotaCotacao, CalculaCota
                   AberturaAtivo, TestaDataAbert, UltDataMovim, SomaCotaMovim,
                   PossuiCotaCotacao, PrimDataMovim
---------------------------------------------------------------------------------------------------}

unit uCtrlCotaCotacao;

interface

uses
   SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
   uCMTypes, uDbCotaMovim, uDbCotaCotacao, uDbCotaCalculo, uDbCota,
   DbClient, DB, uCtrlCota, uDiasUteis, uSistema, uCMMath,
   uTypesCota, uCMFileUtils, uCtrlListTerceiros, uCtrlParamCota,
   uDBFluxoCota;

   // Retorna um número formatado no padrão Ingles (".") --> formato do banco
   function NumeroIngles(fValor: extended): String;

type
   TMoviment = record
      fCota  : extended;
      fCaixa : extended;
   end;

   TCotacao = record
      IDCotaCotacao     : Integer;
      IDAtivo           : Integer;
      IDPlano           : Integer;
      IDPatro           : Integer;
      Periodo           : Integer;
      Exercicio         : Integer;
      dData             : TDateTime;
      fQtdCotas         : Extended;
      fVlrCota          : Extended;
      fVlrPatrimonio    : Extended;
      fVlrCotizado      : Extended;
      fVlrRentabilizado : Extended;
      iOrigem           : Integer;
      bPrimeiraCota     : Boolean;
      dDataIni          : TDateTime;
   end;

   TCtrlCotaCotacao = class(TCMControlObject)
   private
      FCdsCotaCotacao: TCMClientDataSet;
      FDbCotaCotacao : TDbCotacotacao;
      //AL_7
      FDbFluxoCota   : TDbFluxoCota;
      FDbCotaCalculo : TDbCotaCalculo;
      FCdsCotaCalculo: TCMClientDataSet;
      FDbCota: TDbCota;
      CtrlCota: TCtrlCota;
      DiasUteis: TDiasUteis;

      FCdsAtivosAConsolidar   : TCMClientDataSet;
      FCdsAtivosConsolidados  : TCMClientDataSet;

      CtrlListTerceiros : TCtrlListTerceiros;
      CtrlParamCota : TCtrlParamCota;

      procedure SetCdsAtivosAConsolidar(const Value: TCMClientDataSet);
      procedure SetCdsAtivosConsolidados(const Value: TCMClientDataSet);

      procedure SetCdsCotaCotacao(const Value: TCMClientDataSet);
      procedure SetDbCotaCalculo(const Value: TDbCotaCalculo);
      procedure SetDbCotaCotacao(const Value: TDbCotaCotacao);
      //AL_7
      procedure SetDBFluxoCota(const Value: TDbFluxoCota);

      procedure SetCdsCotaCalculo(const Value: TCMClientDataSet);
      procedure SetDbCota(const Value: TDbCota);

      //AL_7
      function GravaCota(const rCotacao : TCotacao; cdsFluxo: TCMClientDataSet = nil): Boolean;
      function CotaAnterior(const IDAtivo   : Integer;
                            const IDPlano   : Integer;
                            const IDPatro   : Integer;
                            const dData     : TDateTime
                           ): TCotacao;

      function DataFechamento(const TipoCota: tTipoCota): TDateTime;

      function MontaSQLAtivos(const dDataFechamento   : TDateTime;
                              const dDataFim          : TDateTime;
                              const TipoCota          : tTipoCota;
                              const CdsAtivos         : TCMClientDataSet = nil
                             ): String;

      function MontaSQLSaldoAtivos(const dDataCota   : TDateTime;
                                   const TipoCota   : tTipoCota
                                  ): String;

      function MontaSQLMovimento(const IDAtivo           : Integer;
                                 const IDPlano           : Integer;
                                 const IDPatro           : Integer;
                                 const dDataFechamento   : TDateTime;
                                 const dDataFim          : TDateTime;
                                 const TipoCota          : tTipoCota): String;

      //AL_7
      function MontaSQLFluxoCota(const IDAtivo           : Integer;
                                 const IDPlano           : Integer;
                                 const IDPatro           : Integer;
                                 const dData             : TDateTime;
                                 const TipoCota          : tTipoCota): String;

      function ProcessaPrimeirasCotas(const dDataCota     : TDateTime;
                                      const TipoCota      : tTipoCota;
                                      const bRecalculo    : Boolean;
                                      var   sErro         : String;
                                      const sNomeBilhete  : String
                                     ): Boolean;

      function ExisteCotaAtivo(const IDAtivo : Integer;
                               const IDPlano : Integer;
                               const IDPatro : Integer;
                               const dData   : TDateTime
                              ): Boolean;

      function CalculaCotas(const IDAtivo           : Integer;
                            const IDPlano           : Integer;
                            const IDPatro           : Integer;
                            const dDataFechamento   : TDateTime;
                            const dDataFim          : TDateTime;
                            const TipoCota          : tTipoCota): Boolean;

      function CalculaValorCota(const rCotacao : TCotacao;
                                const dData    : TDateTime
                               ): TCotacao;



      function RetornaCotaPonderada(Const dData   : TDateTime;
                                    const CdsAtivos : TCMClientDataSet;
                                    Const sPlanos : String;
                                    Const iPatro  : Integer) : Extended;

      function ProcessaCotas(const dDataFim      : TDateTime;
                             const TipoCota      : tTipoCota;
                             const bFechamento   : Boolean;
                             var   sErro         : String;
                             const sNomeBilhete  : String;
                             const pCdsAtivos       : TCMClientDataSet = nil;
                             const iIdPlano        : Integer = -1;
                             const iIdPatro        : Integer = -1): Boolean;
   protected

      procedure AfterInitialize; Override;
      procedure OnCreateAppServer; Override;

      procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;

   public

      constructor Create;  override;
      destructor  Destroy; override;

      // tabela COTACALCULO
      property DbCotaCalculo: TDbCotaCalculo read FDbCotaCalculo write SetDbCotaCalculo;
      property CdsCotaCalculo: TCMClientDataSet read FCdsCotaCalculo write SetCdsCotaCalculo;

      // tabela COTACOTACAO
      property CdsCotaCotacao : TCMClientDataSet read FCdsCotaCotacao write SetCdsCotaCotacao;
      property DbCotaCotacao  : TDbCotaCotacao   read FDbCotaCotacao  write SetDbCotaCotacao;

      //tabela FLUXOCOTA - Apensas INSERT no momento da gravação da CotaCotacao
      property DBFluxoCota: TDbFluxoCota read FDBFluxoCota write SetDBFluxoCota;

      // tabela COTA  - APENAS UPDATE NA DATA DA PRIMEIERA COTA
      property DbCota: TDbCota read FDbCota write SetDbCota;

      function ListaCotaCalculo(const iIdCotaCotacao: integer = -1; const iIdCotaMovim: integer = -1): OleVariant;
      function ListaCotaMovim(const iIdCotaMovim: integer = -1; const iIdCotaTipoOper: integer = -1; const iIdCota: integer = -1; const dData: tDateTime = -1; const sFlgUltimo: String = ''; const sTipoMovimento: String = ''): OLEVariant;
      //AL_7
      function ListaFluxoCota(cdsAtivos: TCMClientDataSet; sDataIni,sDataFim: string; iIdPlano : integer = -1; iIdPatro : integer = -1; iIdPlanoSPC : Integer = -1): OleVariant;

      function GravaCotaCotacao : Boolean;
      function ProcessaCotaModulos(const dDataFim      : TDateTime;
                                   const bManual       : Boolean;
                                   const bEP           : Boolean;
                                   const bImob         : Boolean;
                                   const bRF           : Boolean;
                                   const bRV           : Boolean;
                                   const bBMF          : Boolean;
                                   const bFundoRF      : Boolean;
                                   const bFundoRV      : Boolean;
                                   const bFundoImob    : Boolean;
                                   const bFundoDIC     : Boolean;
                                   const bFechamento   : Boolean;
                                   const sNomeBilhete  : String;
                                   const CdsAtivos     : TCMClientDataSet = nil;
                                   const iIdPlano      : Integer = -1;
                                   const iIdPatro      : Integer = -1
                                  ): Boolean;

      function ProcessaPrimeiraCotaModulos(const dDataFim      : TDateTime;
                                           const bManual       : Boolean;
                                           const bEP           : Boolean;
                                           const bImob         : Boolean;
                                           const bRF           : Boolean;
                                           const bRV           : Boolean;
                                           const bBMF          : Boolean;
                                           const bFundoRF      : Boolean;
                                           const bFundoRV      : Boolean;
                                           const bFundoImob    : Boolean;
                                           const bFundoDIC     : Boolean;
                                           const bRecalculo    : Boolean;
                                           const sNomeBilhete  : String
                                          ): Boolean;

      function CalculaPrimeiraCota(const IDAtivo : Integer;
                                   const IDPlano : Integer;
                                   const IDPatro : Integer;
                                   const dData   : TDateTime;
                                   const fValor  : Extended
                               ): TCotacao;

      function ConsolidaCotas(const dDataIni     : TDateTime;
                              const dDataFim     : TDateTime;
                              const IDPlano      : Integer;
                              const IDPatro      : Integer;
                              const sNomeBilhete : String;
                              const CdsAtivos    : TCMClientDataSet = nil;
                              const iPlanoSPC    : Integer = -1): Boolean;

      function ApagaCota(const IDAtivo  : Integer;
                         const IDPlano  : Integer;
                         const IDPatro  : Integer;
                         const dDataIni : TDateTime;
                         const dDataFim : TDateTime
                        ): Boolean;

      function ApagaCotaPorSegmento(const TipoCota : tTipoCota;
                                    const dDataIni : TDateTime;
                                    const dDataFim : TDateTime
                                   ): Boolean;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      property CdsAtivosAConsolidar    : TCMClientDataSet   read FCdsAtivosAConsolidar  write SetCdsAtivosAConsolidar;
      property CdsAtivosConsolidados   : TCMClientDataSet   read FCdsAtivosConsolidados write SetCdsAtivosConsolidados;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

   published

   end;



implementation
{ TCtrlCotaCotacao }

procedure TCtrlCotaCotacao.AfterInitialize;
begin
   inherited;

   FDbCotaCalculo.DataBaseName   := DataBaseName;
   FDbCotaCotacao.DataBaseName   := DataBaseName;
   FDbCota.DataBaseName          := DataBaseName;
   //AL_7
   FDbFluxoCota.DataBaseName     := DataBaseName;

   CtrlCota.InitializeAs(self);
   DiasUteis.InitializeAs(self);
  CtrlListTerceiros.InitializeAs(Self);
  CtrlParamCota.InitializeAs(Self);
  CtrlParamCota.GetParams(Sistema.IDEmpresa);
end;

constructor TCtrlCotaCotacao.Create;
begin
  inherited;
  FDbCotaCalculo := TDbCotaCalculo.Create ( Self );
  FDbCotaCotacao := TDbCotaCotacao.Create ( Self );
  //AL_7
  FDbFluxoCota   := TDbFluxoCota.Create(Self);
  FDbCota := TDbCota.Create ( Self );
  CtrlCota := TCtrlCota.Create;
  DiasUteis := TDiasUteis.Create;
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlParamCota := TCtrlParamCota.Create;
end;

destructor TCtrlCotaCotacao.Destroy;
begin
  FreeAndNil (FDbCotaCalculo);
  FreeAndNil (FDbCotaCotacao);
  FreeAndNil (FDbCota);
  FreeAndNil (CtrlCota);
  FreeAndNil (DiasUteis);
  //AL_7
  FreeAndNil (FDbFluxoCota);

  FreeAndNil(CtrlListTerceiros);
  FreeAndNil(CtrlParamCota);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsCotaCotacao);
    FreeAndNil (FCdsCotaCalculo);
  end;
  inherited;
end;

function TCtrlCotaCotacao.GravaCotaCotacao: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCotaMovim( CdsCotaCotacao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsCotaCotacao, DbCotaCotacao, [], [] );
      if not Result then raise Exception.Create( DbCotaCotacao.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
//       Fim pendência 17912
//==================================================
end;

function TCtrlCotaCotacao.ListaCotaCalculo(const iIdCotaCotacao,
  iIdCotaMovim: integer): OleVariant;
var
  sSql, sParam : String;
begin
  sParam := '';
  if iIdCotaCotacao  <> -1 then sParam := sParam + '   AND ( C.IDCOTACOTACAO = ' + IntToStr (iIdCotaCotacao) + ' ) '+ #13;
  if iIdCotaMovim    <> -1 then sParam := sParam + '   AND ( M.IDCOTAMOVIM   = ' + IntToStr (iIdCotaMovim)   + ' ) '+ #13;

  sSql := 'SELECT ' + #13 +
          '   C.IDCOTACOTACAO, C.IDCOTA, C.DATA, C.FLGULTIMO, C.PREVREAL, C.QTDCOTAS, C.VLRCOTA, ' + #13 +
          '   M.IDCOTAMOVIM, M.IDCOTATIPOOPER, M.DATA, M.VALOR, M.ENTRADASAIDA, M.OBSERVACAO, M.FLGCONCILIADO ' + #13 +
          'FROM ' + #13 +
          '   COTACOTACAO C, COTACALCULO CC, COTAMOVIM M ' + #13 +
          'WHERE ' + #13 +
          '   ( C.IDCOTACOTACAO = CC.IDCOTACOTACAO ) ' + #13 +
          '   AND ( CC.IDCOTAMOVIM = M.IDCOTAMOVIM ) ' + #13 +
          sParam;

  Result := GetDataPacket ( sSql );
end;


function TCtrlCotaCotacao.ListaCotaMovim(const iIdCotaMovim,
  iIdCotaTipoOper, iIdCota: integer; const dData: tDateTime;
  const sFlgUltimo, sTipoMovimento: String): OLEVariant;
var
  sSql, sParam : String;
begin
  sParam := '';
  if iIdCotaMovim    <> -1 then sParam := sParam + '   AND ( M.IDCOTAMOVIM    = ' + IntToStr (iIdCotaMovim)    + ' ) '+ #13;
  if iIdCotaTipoOper <> -1 then sParam := sParam + '   AND ( M.IDCOTATIPOOPER = ' + IntToStr (iIdCotaTipoOper) + ' ) '+ #13;
  if iIdCota         <> -1 then sParam := sParam + '   AND ( M.IDCOTA         = ' + IntToStr (iIdCota)         + ' ) '+ #13;
  if dData           <> -1 then sParam := sParam + '   AND ( M.DATA = TO_DATE('   + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ', ''DD/MM/YYYY'') ) '+ #13;
  if sFlgUltimo      <> '' then sParam := sParam + '   AND ( M.FLGULTIMO      = ' + QuotedStr(sFlgUltimo)      + ' ) '+ #13;
  if sTipoMovimento  <> '' then sParam := sParam + '   AND ( T.TIPOMOVIMENTO  = ' + QuotedStr(sTipoMovimento)  + ' ) '+ #13;

  sSql := 'SELECT ' + #13 +
          '   M.IDCOTAMOVIM, M.IDCOTATIPOOPER, M.IDCOTA, M.DATA, M.FLGULTIMO, ' + #13 +
          '   M.PREVREAL, M.VALOR, M.ENTRADASAIDA, M.OBSERVACAO, M.FLGCONCILIADO, ' + #13 +
          '   T.DESCRICAO AS DES_TIPOOPER, T.HIERARQUIA, T.TIPOMOVIMENTO, ' + #13 +
          '   C.DESCRICAO AS DES_COTA ' + #13 +
          'FROM ' + #13 +
          '   COTAMOVIM M, COTATIPOOPER T, COTA C ' + #13 +
          'WHERE ' + #13 +
          '   ( M.IDCOTATIPOOPER = T.IDCOTATIPOOPER ) ' + #13 +
          '   AND ( M.IDCOTA = C.IDCOTA ) ' + #13 +
          sParam +
          'ORDER BY ' + #13 +
          '   M.FLGULTIMO, M.IDCOTAMOVIM ';

  Result := GetDataPacket ( sSql );
end;

//AL_7
function TCtrlCotaCotacao.ListaFluxoCota(cdsAtivos: TCMClientDataSet;
                                         sDataIni,sDataFim: string;
                                         iIdPlano : integer = -1; iIdPatro : integer = -1;
                                         iIdPlanoSPC : Integer = -1): OleVariant;
var sSQL: string;
    i: Integer;
begin
   cdsAtivos.First;
   i := 0;

   sSQL :=
   'SELECT '                                                                                                        + #13 +
   '  F.IDCOTACOTACAO, '                                                                                            + #13 +
   '  F.HISTORICO, '                                                                                                + #13 +
   '  DECODE(F.FLGCOTA, ''C'', F.VALOR, 0) AS VALORCOTIZADO, '                                                      + #13 +
   '  DECODE(F.FLGCOTA, ''R'', F.VALOR, 0) AS VALORRENTABILIZADO, '                                                 + #13 +
   '  VALOR, FLGCOTA '                                                                                              + #13 +
   'FROM '                                                                                                          + #13 +
   '    FLUXOCOTA F, '                                                                                              + #13 +
   '    COTACOTACAO C '                                                                                            + #13 +
   'WHERE '                                                                                                         + #13 +
   '        F.IDCOTACOTACAO = C.IDCOTACOTACAO(+) '                                                                  + #13 +
   '    AND C.IDATIVOCOTA  IN ('+ cdsAtivos.Fields[0].AsString;

   cdsAtivos.Next;
   while not cdsAtivos.Eof do
   begin
      Inc(i);
      if i > 999 then
      begin
         sSQL := sSQL + ') OR ' + #13 + '        C.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
         i := 0;
      end
      else
         sSQL := sSQL + ', ' + cdsAtivos.Fields[0].AsString;
      cdsAtivos.Next;
   end;
   sSQL := sSQL + ') '                                                                                              + #13 +
   '    AND C.DATA BETWEEN TO_DATE('+ QuotedStr(sDataIni) +', ''dd/mm/yyyy'') AND '                        + #13 +
   '                       TO_DATE('+ QuotedStr(sDataFim) +', ''dd/mm/yyyy'') ';

   if iIdPlanoSPC > 0 then
   begin
      sSQL := sSQL + '   AND C.IDPLANO   IN (' + CtrlListTerceiros.AlimentaVarPlano(-1,iIdPlanoSPC) + ')';
   end
   else
   begin
      if iIDPlano > 0 then
         sSQL := sSQL + '   AND C.IDPLANO   = ' + IntToStr(iIdPlano);

      if iIDPatro > 0 then
         sSQL := sSQL + '   AND C.IDPATRO   = ' + IntToStr(iIdPatro);
   end;

   Result := GetDataPacket(sSQL);

end;


procedure TCtrlCotaCotacao.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
var
  _CdsLocal: TCMClientDataSet;
  iIdCotaMovim: integer;
begin
  inherited;
  // verificações das regras de negócio para manipulação das tabelas
  Accept := true;
  _CdsLocal := TCMClientDataSet.Create ( nil );
  try
    if AnsiUpperCase(sTableName) = 'COTAMOVIM' then begin
      if CdsState in [usModified, usInserted] then begin

        // descobrir a data da primeira cota - so permitir lançamentos posteriores
        _CdsLocal.Data := CtrlCota.ListaCota (-1, -1, aCds.FieldByName('IDCOTA').AsInteger);
        if ( (FormatDateTime('yyyymmdd', _CdsLocal.FieldByName('DATAPRIMEIRA').AsDateTime)) >= (FormatDateTime('yyyymmdd', aCds.FieldByName('DATA').AsDateTime)) ) then begin
          MessageInfo := 'A primeira cota foi calculada no dia '+FormatDateTime('dd/mm/yyyy', _CdsLocal.FieldByName('DATAPRIMEIRA').AsDateTime)+' todos os lançamentos devem ser posteriores!';
          Accept := false;
        end;

        // verificar se ja existe um lançamento com a mesma data, cota e tipooperacao
        if (Accept) then begin
          // verificar se ja existe um valor cadastrado para este dia que ainda não tenha sido utilizado e que o valor seja diferente
          _CdsLocal.Data := ListaCotaMovim (-1,
                                            aCds.FieldByName('IDCOTATIPOOPER').AsInteger,
                                            aCds.FieldByName('IDCOTA').AsInteger,
                                            aCds.FieldByName('DATA').AsDateTime,
                                            'S');
          // foi encontrada uma ocorrência para este registro
          if (not _CdsLocal.IsEmpty) then begin
            iIdCotaMovim := _CdsLocal.FieldByName('IDCOTAMOVIM').AsInteger;
            if ( iIdCotaMovim <> aCds.FieldByName('IDCOTAMOVIM').AsInteger ) then begin  // se for alteração não pode ser o mesmo registro
              // verificar agora se este registro ja foi utilizado, se não foi não permitir nova inclusão
              _CdsLocal.Data := ListaCotaCalculo(-1, iIdCotaMovim);
              if _CdsLocal.IsEmpty then begin
                MessageInfo := 'Esta cota com esta operação já foi registrada neste dia, favor alterá-la!';
                Accept := false;
              end else begin
                // se já foi utilizada, verificar se algum valor é diferente
                // alguns campos, é claro, já são iguais senão nós nem estaríamos aqui
                if (_CdsLocal.FieldByName('PREVREAL').AsString = aCds.FieldByName('PREVREAL').AsString) AND
                   (_CdsLocal.FieldByName('VALOR').AsString = aCds.FieldByName('VALOR').AsString) AND
                   (_CdsLocal.FieldByName('ENTRADASAIDA').AsString = aCds.FieldByName('ENTRADASAIDA').AsString) then begin
                  MessageInfo := 'Já existe um registro com as mesmas características cadastrado!';
                  Accept := false;
                end;
              end
            end;
          end;
        end;

        if (Accept) and (CdsState = usModified) then begin
          _CdsLocal.Data := ListaCotaCalculo (-1, aCds.FieldByName('IDCOTAMOVIM').AsInteger);
          if not _CdsLocal.IsEmpty then begin
            MessageInfo := 'Esta movimentação já foi utilizada em uma apuração e não pode ser alterada!';
            Accept := false;
          end;
        end;
      end;
    end;
  finally
    freeandnil (_CdsLocal);
  end;
end;

procedure TCtrlCotaCotacao.OnCreateAppServer;
begin
  inherited;
  FCdsCotaCotacao := TCMClientDataSet.Create( nil );
  FCdsCotaCalculo := TCMClientDataSet.Create( nil );
end;

procedure TCtrlCotaCotacao.SetCdsCotaCalculo(
  const Value: TCMClientDataSet);
begin
  FCdsCotaCalculo := Value;
end;


procedure TCtrlCotaCotacao.SetDbCota(const Value: TDbCota);
begin
  FDbCota := Value;
end;

procedure TCtrlCotaCotacao.SetDbCotaCalculo(const Value: TDbCotaCalculo);
begin
  FDbCotaCalculo := Value;
end;

procedure TCtrlCotaCotacao.SetDbCotaCotacao(const Value: TDbCotaCotacao);
begin
  FDbCotaCotacao := Value;
end;


function TCtrlCotaCotacao.ConsolidaCotas(const dDataIni     : TDateTime;
                                         const dDataFim     : TDateTime;
                                         const IDPlano      : Integer;
                                         const IDPatro      : Integer;
                                         const sNomeBilhete : String;
                                         const CdsAtivos    : TCMClientDataSet = nil;
                                         const iPlanoSPC    : Integer = -1): Boolean;
var
   cdsCotacoes             : TCMClientDataSet;
   cdsCotacoesConsolidadas : TCMClientDataSet;

   sSQL        : String;
   sData       : String;
   sDataIni    : String;
   sDataFim    : String;

   bPrimeiro   : Boolean;
   bCotacao    : Boolean;

   dDataAtu    : TDateTime;
   dDataAnt    : TDateTime;

   IDAtivo     : Integer;
   i           : integer;
   iRegistro   : Integer;
   iRegistros  : Integer;

   fPatrimonio : Extended;
   fValorCota  : Extended;
   fCotaAnt    : Extended;
   fQtdCotaIni : Extended;
   fQtdCotaFim : Extended;
   fCotiza     : Extended;
   fRentab     : Extended;
   fPrimeiraCota:Extended;

   sPlanos     : String;

   fPatrAnt    : Extended;
   fUltVlCota  : Extended;

   fQtdCotaAnt : Extended;


begin
   Result := False;

   // ----------------------------------------------------------------------------------------------
   if not(fCdsAtivosAConsolidar.Active) then
   begin
      MessageInfo := 'Não foram encontrados ativos a consolidar';
      Exit;
   end;

   if not(fCdsAtivosConsolidados.Active) then
   begin
      MessageInfo := 'Não é possível gravar os ativos consolidados';
      Exit;
   end;

   sDataIni := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataIni));
   sDataFim := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim));
   // ----------------------------------------------------------------------------------------------

   sPlanos := CtrlListTerceiros.AlimentaVarPlano(IDPlano,iPlanoSPC);

   // ----------------------------------------------------------------------------------------------
   // Abre o ClientDataSet onde serão inseridas as cotações
   // ----------------------------------------------------------------------------------------------
   cdsCotacoesConsolidadas := TCMClientDataSet.Create(nil);
   cdsCotacoes             := TCMClientDataSet.Create(nil);

   sSQL :=
   'SELECT '                                                + #13 +
   '   TO_DATE(''31/12/1899'', ''DD/MM/YYYY'') AS DATA, '   + #13 +
   '   0.01 AS VLRPATRIMONIO, '                             + #13 +
   '   0.01 AS VLRCOTIZADO, '                               + #13 +
   '   0.01 AS VLRRENTABILIZADO, '                          + #13 +
   '   0    AS COTACAO '                                    + #13 +
   'FROM '                                                  + #13 +
   '   DUAL '                                               + #13 +
   'WHERE '                                                 + #13 +
   '   1 = 2';

   cdsCotacoesConsolidadas.Data := GetDataPacket(sSQL);
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // MostraFormProgresso
   DoProgresso([sNomeBilhete,
                0,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                0,                                 // Mínimo de Registros  (em cima)
                fcdsAtivosAConsolidar.RecordCount,  // Total de Registros   (em cima)
                0,                                 // Registro Atual       (em cima)
                'Processando Ativos...',
                0,                                 // Mínimo de Registros  (em baixo)
                0,                                 // Total de Registros   (em baixo)
                0,                                 // Registro Atual       (em baixo)
                ' '
                ]
               );
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // Itera pelos ativos passados, buscando as cotações e inserindo-as no cds de cotações, para
   // posterior cálculo
   // ----------------------------------------------------------------------------------------------
   fCdsAtivosAConsolidar.First;

   while not(fCdsAtivosAConsolidar.EOF) do
   begin
      IDAtivo := fCdsAtivosAConsolidar.FieldByName('IDATIVOCOTA').AsInteger;

      // -------------------------------------------------------------------------------------------
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,                                 // Mínimo de Registros  (em cima)
                   fcdsAtivosAConsolidar.RecordCount,  // Total de Registros   (em cima)
                   fcdsAtivosAConsolidar.RecNo,        // Registro Atual       (em cima)
                   'Processando Ativos...',
                   0,                                 // Mínimo de Registros  (em baixo)
                   0,                                 // Total de Registros   (em baixo)
                   0,                                 // Registro Atual       (em baixo)
                   ' '
                   ]
                  );
      // -------------------------------------------------------------------------------------------

      iRegistros  := trunc(dDataFim) - trunc(dDataIni);
      iRegistro   := 0;

      // -------------------------------------------------------------------------------------------
      // MostraFormProgresso
      DoProgresso([sNomeBilhete,
                   0,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,                                 // Mínimo de Registros  (em cima)
                   fcdsAtivosAConsolidar.RecordCount,  // Total de Registros   (em cima)
                   fcdsAtivosAConsolidar.RecNo,        // Registro Atual       (em cima)
                   'Processando Ativos...',
                   0,                                 // Mínimo de Registros  (em baixo)
                   iRegistros,                        // Total de Registros   (em baixo)
                   0,                                 // Registro Atual       (em baixo)
                   'Processando Cotações...'
                   ]
                  );
      // -------------------------------------------------------------------------------------------

      for i := trunc(dDataIni) to trunc(dDataFim) do
      begin
         sData := QuotedStr(FormatDateTime('dd/mm/yyyy', i));

         inc(iRegistro);

         // -------------------------------------------------------------------------------------------
         // AndaFormProgresso
         DoProgresso([sNomeBilhete,
                      1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                      0,                                 // Mínimo de Registros  (em cima)
                      fcdsAtivosAConsolidar.RecordCount,  // Total de Registros   (em cima)
                      fcdsAtivosAConsolidar.RecNo,        // Registro Atual       (em cima)
                      'Processando Ativos...',
                      0,                                 // Mínimo de Registros  (em baixo)
                      iRegistros,                        // Total de Registros   (em baixo)
                      iRegistro,                         // Registro Atual       (em baixo)
                      'Processando Cotações...'
                      ]
                     );
         // -------------------------------------------------------------------------------------------

         sSQL :=
         'SELECT '                                                                     + #13 +
         '   CC1.DATA, CC1.VLRPATRIMONIO, CC1.QTDCOTA, CC1.VLRCOTA, CC1.VLRCOTIZADO, ' + #13 +
         '   CC1.VLRRENTABILIZADO '                                                    + #13 +
         'FROM '                                                                       + #13 +
         '   COTACOTACAO CC1'                                                          + #13 +
         'WHERE '                                                                      + #13 +
         '       CC1.IDATIVOCOTA  = ' + FormatFloat('#0', IDAtivo)                     + #13 +
         '   AND CC1.DATA         = ( '                                                + #13 +
         '                          SELECT '                                           + #13 +
         '                             MAX(DATA) '                                     + #13 +
         '                          FROM '                                             + #13 +
         '                             COTACOTACAO CC2 '                               + #13 +
         '                          WHERE '                                            + #13 +
         '                                 CC2.DATA       <= TO_DATE(' + sData + ', ''dd/mm/yyyy'') '    + #13 +
         '                             AND CC2.IDATIVOCOTA = CC1.IDATIVOCOTA '         + #13 +
         '                             AND CC2.IDPLANO     = CC1.IDPLANO '             + #13 +
         '                             AND CC2.IDPATRO     = CC1.IDPATRO '             + #13 +
         '                          ) '                                                + #13;

         if sPlanos <> '' then sSQL := sSQL +
         '   AND CC1.IDPLANO         IN (' + sPlanos + ')'                             + #13;

         if IDPatro > 0 then sSQL := sSQL +
         '   AND CC1.IDPATRO          = ' + FormatFloat('#0', IDPatro)                  + #13;

         cdsCotacoes.Data := GetDataPacket(sSQL);

         // ----------------------------------------------------------------------------------------
         cdsCotacoes.First;
         while not(cdsCotacoes.EOF) do
         begin
            cdsCotacoesConsolidadas.Insert;

            cdsCotacoesConsolidadas.FieldByName('DATA').AsDateTime               := i;
            cdsCotacoesConsolidadas.FieldByName('VLRPATRIMONIO').AsFloat         := cdsCotacoes.FieldByName('VLRPATRIMONIO').AsFloat;

            if cdsCotacoes.FieldByName('DATA').AsDateTime = i then
            begin
               cdsCotacoesConsolidadas.FieldByName('VLRCOTIZADO').AsFloat        := cdsCotacoes.FieldByName('VLRCOTIZADO').AsFloat;
               cdsCotacoesConsolidadas.FieldByName('VLRRENTABILIZADO').AsFloat   := cdsCotacoes.FieldByName('VLRRENTABILIZADO').AsFloat;
               cdsCotacoesConsolidadas.FieldByName('COTACAO').AsInteger          := 1;
            end
            else
            begin
               cdsCotacoesConsolidadas.FieldByName('VLRCOTIZADO').AsFloat        := 0;
               cdsCotacoesConsolidadas.FieldByName('VLRRENTABILIZADO').AsFloat   := 0;
               cdsCotacoesConsolidadas.FieldByName('COTACAO').AsInteger          := 0;
            end;

            cdsCotacoesConsolidadas.Post;
            cdsCotacoes.Next;
         end;
         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------

      fCdsAtivosAConsolidar.Next;
   end;

   // ----------------------------------------------------------------------------------------------

   fPatrimonio := 0;
   fValorCota  := RetornaCotaPonderada(dDataIni,CdsAtivos,sPlanos,IDPatro);
   fCotaAnt    := fValorCota;
   fPrimeiraCota := fValorCota;
   fQtdCotaIni := 0;
   fCotiza     := 0;
   fRentab     := 0;
   bPrimeiro   := True;
   bCotacao    := False;

   fUltVlCota := 0;

   // ----------------------------------------------------------------------------------------------
   // Reordena as cotações por data, e passa a iterar pelas mesmas, fazendo o cálculo e inserindo no
   // DataSet de retorno para a tela
   // ----------------------------------------------------------------------------------------------
   cdsCotacoesConsolidadas.IndexFieldNames := 'DATA';
   cdsCotacoesConsolidadas.First;

   // ----------------------------------------------------------------------------------------------
   // MostraFormProgresso
   DoProgresso([sNomeBilhete,
                0,                                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                0,                                  // Mínimo de Registros  (em cima)
                fcdsAtivosAConsolidar.RecordCount,  // Total de Registros   (em cima)
                fcdsAtivosAConsolidar.RecNo,        // Registro Atual       (em cima)
                'Processando Ativos...',
                0,                                  // Mínimo de Registros  (em baixo)
                cdsCotacoesConsolidadas.RecordCount,// Total de Registros   (em baixo)
                0,                                  // Registro Atual       (em baixo)
                'Processando Cotações...'
                ]
               );
   // ----------------------------------------------------------------------------------------------

   while not(cdsCotacoesConsolidadas.EOF) do
   begin
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,                                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,                                  // Mínimo de Registros  (em cima)
                   fcdsAtivosAConsolidar.RecordCount,  // Total de Registros   (em cima)
                   fcdsAtivosAConsolidar.RecNo,        // Registro Atual       (em cima)
                   'Processando Ativos...',
                   0,                                  // Mínimo de Registros  (em baixo)
                   cdsCotacoesConsolidadas.RecordCount,// Total de Registros   (em baixo)
                   cdsCotacoesConsolidadas.RecNo,      // Registro Atual       (em baixo)
                   'Processando Cotações...'
                   ]
                  );
      // -------------------------------------------------------------------------------------------

      dDataAnt := cdsCotacoesConsolidadas.FieldByName('DATA').AsDateTime;

      // -------------------------------------------------------------------------------------------
      // Acumula os valores
      // -------------------------------------------------------------------------------------------
      fPatrimonio := fPatrimonio + cdsCotacoesConsolidadas.FieldByName('VLRPATRIMONIO').AsFloat;
      fCotiza     := fCotiza     + cdsCotacoesConsolidadas.FieldByName('VLRCOTIZADO').AsFloat;
      fRentab     := fRentab     + cdsCotacoesConsolidadas.FieldByName('VLRRENTABILIZADO').AsFloat;


      //AL_8
      if DiasUteis.DiaUtil(Sistema.IDEmpresa,cdsCotacoesConsolidadas.FieldByName('DATA').AsDateTime,True,False,False) then
         bCotacao := True
      else
         if cdsCotacoesConsolidadas.FieldByName('COTACAO').AsInteger = 1 then
            bCotacao := True
         else
            bCotacao := False;

      // -------------------------------------------------------------------------------------------

      cdsCotacoesConsolidadas.Next;

      if not(cdsCotacoesConsolidadas.EOF) then
      begin
         dDataAtu  := cdsCotacoesConsolidadas.FieldByName('DATA').AsDateTime;
      end
      else
      begin
         dDataAtu  := 0;
      end;

      // -------------------------------------------------------------------------------------------
      // A cada dia, faz o insert no cdsAtivosConsolidados e zera os acumuladores
      // -------------------------------------------------------------------------------------------
      if (dDataAtu <> dDataAnt) then
      begin
         // ----------------------------------------------------------------------------------------
         // Faz o Cálculo
         // ----------------------------------------------------------------------------------------
         if bPrimeiro then
         begin
            fQtdCotaIni := (fPatrimonio - fCotiza) / fValorCota;
            bPrimeiro   := False;
         end
         else
         begin
            if ((fCotaAnt = 0) and (fPatrAnt = 0)) then
            begin
                 fValorCota := fUltVlCota;
                 fCotaAnt   := fValorCota;
            end
            else
            begin
                 fValorCota := 0;
                 if fQtdCotaIni <> 0 then fValorCota  := (fPatrimonio - fCotiza) / fQtdCotaIni;
            end;
         end;

         fQtdCotaFim := 0;
         if fValorCota <> 0 then
         begin
            fQtdCotaFim := fPatrimonio / fValorCota;
            if CtrlParamCota.FlgCotizaDataAnt then
               fQtdCotaFim := fQtdCotaIni + (fCotiza / fCotaAnt);
         end;
         if (((fPatrimonio - fCotiza) = 0) and
             (fPatrimonio = 0) and
             (fCotiza     = 0) and
             (fRentab     = 0) and
             (fQtdCotaFim = 0)) then
         begin
            bCotacao := False;
         end;

         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // Faz o Insert
         // ----------------------------------------------------------------------------------------
         if bCotacao then
         begin
            fcdsAtivosConsolidados.Insert;

            if dDataAnt = CtrlParamCota.DtPrimeira then
            begin
                 fcdsAtivosConsolidados.FieldByName('DATA').AsDateTime          := dDataAnt;
                 fcdsAtivosConsolidados.FieldByName('VLRPATRIMONIOINI').AsFloat := 0;
                 fcdsAtivosConsolidados.FieldByName('VLRPATRIMONIOFIM').AsFloat := fPatrimonio;
                 fcdsAtivosConsolidados.FieldByName('QTDCOTAFIM').AsFloat       := fPatrimonio / CtrlParamCota.VlrPrimeira;
                 fcdsAtivosConsolidados.FieldByName('VLRCOTA').AsFloat          := CtrlParamCota.VlrPrimeira;
                 fcdsAtivosConsolidados.FieldByName('VLRCOTIZADO').AsFloat      := fCotiza;
                 fcdsAtivosConsolidados.FieldByName('VLRRENTABILIZADO').AsFloat := fRentab;
                 fcdsAtivosConsolidados.FieldByName('PERCENTDIA').AsFloat       := 0;
                 fcdsAtivosConsolidados.FieldByName('PERCENTPERIODO').AsFloat   := 0;
            end
            else
                if CtrlParamCota.FlgCotizaDataAnt then
                begin
                     fcdsAtivosConsolidados.FieldByName('DATA').AsDateTime          := dDataAnt;
                     fcdsAtivosConsolidados.FieldByName('VLRPATRIMONIOINI').AsFloat := fPatrAnt;
                     fcdsAtivosConsolidados.FieldByName('VLRPATRIMONIOFIM').AsFloat := fPatrimonio;
                     fcdsAtivosConsolidados.FieldByName('QTDCOTAFIM').AsFloat       := fQtdCotaIni + (fCotiza / fCotaAnt);

                     try
                        fcdsAtivosConsolidados.FieldByName('VLRCOTA').AsFloat       := (fPatrimonio / fcdsAtivosConsolidados.FieldByName('QTDCOTAFIM').AsFloat);
                     except
                           fcdsAtivosConsolidados.FieldByName('VLRCOTA').AsFloat    := 0;
                     end;

                     fcdsAtivosConsolidados.FieldByName('VLRCOTIZADO').AsFloat      := fCotiza;
                     fcdsAtivosConsolidados.FieldByName('VLRRENTABILIZADO').AsFloat := fRentab;
                     fcdsAtivosConsolidados.FieldByName('PERCENTDIA').AsFloat       := 0;

                     if fCotaAnt <> 0 then
                     begin
                        fcdsAtivosConsolidados.FieldByName('PERCENTDIA').AsFloat    := (fValorCota - fCotaAnt) / fCotaAnt * 100;
                     end;

                     fcdsAtivosConsolidados.FieldByName('PERCENTPERIODO').AsFloat   := (fValorCota - fPrimeiraCota) / fPrimeiraCota * 100;
                end
                else
                begin
                     fcdsAtivosConsolidados.FieldByName('DATA').AsDateTime           := dDataAnt;
                     fcdsAtivosConsolidados.FieldByName('VLRPATRIMONIOINI').AsFloat  := fPatrimonio - fCotiza;
                     fcdsAtivosConsolidados.FieldByName('VLRPATRIMONIOFIM').AsFloat  := fPatrimonio;
                     fcdsAtivosConsolidados.FieldByName('QTDCOTAFIM').AsFloat        := fQtdCotaFim;
                     fcdsAtivosConsolidados.FieldByName('VLRCOTA').AsFloat           := fValorCota;
                     fcdsAtivosConsolidados.FieldByName('VLRCOTIZADO').AsFloat       := fCotiza;
                     fcdsAtivosConsolidados.FieldByName('VLRRENTABILIZADO').AsFloat  := fRentab;
                     fcdsAtivosConsolidados.FieldByName('PERCENTDIA').AsFloat        := 0;

                     if fCotaAnt <> 0 then
                     begin
                        fcdsAtivosConsolidados.FieldByName('PERCENTDIA').AsFloat     := (fValorCota - fCotaAnt) / fCotaAnt * 100;
                     end;

                     fcdsAtivosConsolidados.FieldByName('PERCENTPERIODO').AsFloat    := (fValorCota - fPrimeiraCota) / fPrimeiraCota * 100;
                end;

            fcdsAtivosConsolidados.Post;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // Zera os acumuladores
         // ----------------------------------------------------------------------------------------
         bCotacao    := False;

         fPatrAnt    := fPatrimonio;
         fPatrimonio := 0;
         fCotiza     := 0;
         fRentab     := 0;
         fQtdCotaIni := fQtdCotaFim;
         fCotaAnt    := fValorCota;

         if fValorCota <> 0 then
            fUltVlCota := fValorCota;
         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------
   end;
   // ----------------------------------------------------------------------------------------------

   // EscondeFormProgresso
   DoProgresso([sNomeBilhete,
                2,                                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                0,                                  // Mínimo de Registros  (em cima)
                0,                                  // Total de Registros   (em cima)
                0,                                  // Registro Atual       (em cima)
                'Processando Ativos...',
                0,                                  // Mínimo de Registros  (em baixo)
                0,                                  // Total de Registros   (em baixo)
                0,                                  // Registro Atual       (em baixo)
                ' '
                ]
               );
   // -------------------------------------------------------------------------------------------

   Result := True;
end;

function TCtrlCotaCotacao.ProcessaCotaModulos(const dDataFim      : TDateTime;
                                              const bManual       : Boolean;
                                              const bEP           : Boolean;
                                              const bImob         : Boolean;
                                              const bRF           : Boolean;
                                              const bRV           : Boolean;
                                              const bBMF          : Boolean;
                                              const bFundoRF      : Boolean;
                                              const bFundoRV      : Boolean;
                                              const bFundoImob    : Boolean;
                                              const bFundoDIC     : Boolean;
                                              const bFechamento   : Boolean;
                                              const sNomeBilhete  : String;
                                              const CdsAtivos     : TCMClientDataSet = nil;
                                              const iIdPlano      : Integer = -1;
                                              const iIdPatro      : Integer = -1
                                             ): Boolean;
var
   bErro : Boolean;

   sErro : String;
   sLog  : String;
begin
   // ----------------------------------------------------------------------------------------------
   // MostraFormProgresso
   DoProgresso([sNomeBilhete,
                0,   // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                0,   // Mínimo de Registros  (em cima)
                10,  // Total de Registros   (em cima)
                0,   // Registro Atual       (em cima)
                'Processando Segmentos...',
                0,   // Mínimo de Registros  (em baixo)
                0,   // Total de Registros   (em baixo)
                0,   // Registro Atual       (em baixo)
                ' ',
                ' ']
               );
   // ----------------------------------------------------------------------------------------------

   try
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bManual then
      begin                                                                                   //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttHstMovCota, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas Manuais: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Cotas Manuais ';

      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   1,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      if bEP then
      begin                                                                                   //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttEmprestimo, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Empréstimos: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Empréstimos ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   2,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bImob then
      begin                                                                                    //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttImobiliario, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas do Imobiliário: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento do Imobiliário ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   3,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bRF then
      begin                                                                           //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttRF, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Renda Fixa: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Renda Fixa ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   4,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bRV then
      begin                                                                           //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttRV, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Renda Variável: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Renda Variável ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   5,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bBMF then
      begin                                                                            //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttBMF, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de BM&&F: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de BM&&F ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   6,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoRF then
      begin                                                                                //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttFundoRF, bFechamento, sErro, sNomeBilhete, CdsAtivos , iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos de Renda Fixa: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos de Renda Fixa ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   7,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoRV then
      begin                                                                                //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttFundoRV, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos de Renda Variável: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos de Renda Variável ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   8,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ']
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoImob then
      begin                                                                                  //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttFundoImob, bFechamento, sErro, sNomeBilhete, CdsAtivos , iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos Imobiliários: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos Imobiliários ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   9,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoDIC then
      begin                                                                                 //AL_4
         bErro := not(ProcessaCotas(dDataFim, ttFundoDIC, bFechamento, sErro, sNomeBilhete, CdsAtivos, iIdPlano, iIdPatro));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos de Direito Creditório';
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos de Direito Creditório ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   10,           // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
   finally
      Result := not(bErro);

      // -------------------------------------------------------------------------------------------
      // EscondeFormProgresso
      DoProgresso([sNomeBilhete,
                   2,   // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,   // Mínimo de Registros  (em cima)
                   10,  // Total de Registros   (em cima)
                   10,   // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,   // Mínimo de Registros  (em baixo)
                   0,   // Total de Registros   (em baixo)
                   0,   // Registro Atual       (em baixo)
                   ' ']
                  );
      // -------------------------------------------------------------------------------------------
   end;
end;



function TCtrlCotaCotacao.ProcessaPrimeiraCotaModulos(const dDataFim      : TDateTime;
                                                      const bManual       : Boolean;
                                                      const bEP           : Boolean;
                                                      const bImob         : Boolean;
                                                      const bRF           : Boolean;
                                                      const bRV           : Boolean;
                                                      const bBMF          : Boolean;
                                                      const bFundoRF      : Boolean;
                                                      const bFundoRV      : Boolean;
                                                      const bFundoImob    : Boolean;
                                                      const bFundoDIC     : Boolean;
                                                      const bRecalculo    : Boolean;
                                                      const sNomeBilhete  : String
                                                     ): Boolean;
var
   bErro : Boolean;

   sErro : String;
   sLog  : String;
   sData : String;
begin
   sData    := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim));

   // ----------------------------------------------------------------------------------------------

   // MostraFormProgresso
   DoProgresso([sNomeBilhete,
                0,   // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                0,   // Mínimo de Registros  (em cima)
                10,  // Total de Registros   (em cima)
                0,   // Registro Atual       (em cima)
                'Processando Segmentos...',
                0,   // Mínimo de Registros  (em baixo)
                0,   // Total de Registros   (em baixo)
                0,   // Registro Atual       (em baixo)
                ' ',
                ' ']
               );
   // ----------------------------------------------------------------------------------------------

   bErro := False;

   try
      sLog := '';

      if bEP then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttEmprestimo, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Empréstimos: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Empréstimos ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   2,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bImob then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttImobiliario, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas do Imobiliário: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento do Imobiliário ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   3,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bRF then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttRF, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Renda Fixa: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Renda Fixa ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   4,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bRV then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttRV, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Renda Variável: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Renda Variável ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   5,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // ----------------------------------------------------------------------------------------------
      sLog := '';

      if bBMF then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttBMF, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de BM&&F: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de BM&&F ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   6,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoRF then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttFundoRF, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos de Renda Fixa: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos de Renda Fixa ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   7,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoRV then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttFundoRV, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos de Renda Variável: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos de Renda Variável ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   8,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoImob then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttFundoImob, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos Imobiliários: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos Imobiliários ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   9,            // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
      sLog := '';

      if bFundoDIC then
      begin
         bErro := not(ProcessaPrimeirasCotas(dDataFim, ttFundoDIC, bRecalculo, sErro, sNomeBilhete));

         if bErro then
         begin
            MessageInfo := 'Ocorreu um ERRO no cálculo das Cotas de Fundos de Direito Creditório: ' + #13 + sErro;
            Exit;
         end;
      end;

      if sErro <> '' then
      begin
         sLog := sErro + #10 + #13;
      end;

      sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
      sLog := sLog + 'Término do processamento de Fundos de Direito Creditório ';

      // Anda com a parte de cima do form de progresso
      // AndaFormProgresso
      DoProgresso([sNomeBilhete,
                   1,            // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,            // Mínimo de Registros  (em cima)
                   10,           // Total de Registros   (em cima)
                   10,           // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,            // Mínimo de Registros  (em baixo)
                   0,            // Total de Registros   (em baixo)
                   0,            // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------

   finally
      Result := not(bErro);

      // -------------------------------------------------------------------------------------------
      // EscondeFormProgresso
      DoProgresso([sNomeBilhete,
                   2,   // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   0,   // Mínimo de Registros  (em cima)
                   10,  // Total de Registros   (em cima)
                   10,   // Registro Atual       (em cima)
                   'Processando Segmentos...',
                   0,   // Mínimo de Registros  (em baixo)
                   0,   // Total de Registros   (em baixo)
                   0,   // Registro Atual       (em baixo)
                   ' ',
                   sLog]
                  );
      // -------------------------------------------------------------------------------------------
   end;
end;




function TCtrlCotaCotacao.ProcessaCotas(const dDataFim      : TDateTime;
                                        const TipoCota      : tTipoCota;
                                        const bFechamento   : Boolean;
                                        var   sErro         : String;
                                        const sNomeBilhete  : String;
                                        const pCdsAtivos       : TCMClientDataSet = nil;
                                        const iIdPlano        : Integer = -1;
                                        const iIdPatro        : Integer = -1): Boolean;
var
   cdsAtivos         : TCMClientDataSet;
   dDataFechamento   : TDateTime;

   sSql              : String;
   sLog              : String;
   sTipoAtivo        : String;
   sAtivoExtenso     : String;

   iNumeroModulo     : Integer;
   iQuant            : Integer;
   iRegistro         : Integer;


begin
   cdsAtivos := TCMClientDataSet.Create(nil);

   case TipoCota of
      ttHstMovCota:  begin iNumeroModulo := 1;  sTipoAtivo := 'MANUAL ';      sAtivoExtenso := 'Cotas Manuais ';                 end;
      ttEmprestimo:  begin iNumeroModulo := 2;  sTipoAtivo := 'EP ';          sAtivoExtenso := 'Empréstimo ';                    end;
      ttImobiliario: begin iNumeroModulo := 3;  sTipoAtivo := 'IMOB ';        sAtivoExtenso := 'Imobiliário';                    end;
      ttRF:          begin iNumeroModulo := 4;  sTipoAtivo := 'RF ';          sAtivoExtenso := 'Renda Fixa';                     end;
      ttRV:          begin iNumeroModulo := 5;  sTipoAtivo := 'RV ';          sAtivoExtenso := 'Renda Variável';                 end;
      ttBMF:         begin iNumeroModulo := 6;  sTipoAtivo := 'BMF ';         sAtivoExtenso := 'BM&&F';                          end;
      ttFundoRF:     begin iNumeroModulo := 7;  sTipoAtivo := 'FUNDORF ';     sAtivoExtenso := 'Fundos de Renda Fixa';           end;
      ttFundoRV:     begin iNumeroModulo := 8;  sTipoAtivo := 'FUNDORV ';     sAtivoExtenso := 'Fundos de Renda Variável';       end;
      ttFundoImob:   begin iNumeroModulo := 9;  sTipoAtivo := 'FUNDOIMOB ';   sAtivoExtenso := 'Fundos Imobiliários';            end;
      ttFundoDIC:    begin iNumeroModulo := 10; sTipoAtivo := 'FUNDODIC ';    sAtivoExtenso := 'Fundos de Direito Creditório';   end;
   end;

   try
      // -------------------------------------------------------------------------------------------
      // Busca a última data de fechamento
      // -------------------------------------------------------------------------------------------
      dDataFechamento   := DataFechamento(TipoCota);
      // -------------------------------------------------------------------------------------------

      if dDataFim <= dDataFechamento then
      begin
         sLog     := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
         sLog     := sLog + 'A Data de Término é igual ou anterior à Data de Fechamento para os Ativos de ' + sAtivoExtenso;
         sErro    := sLog;
         Result   := True;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      // Seleciona os distinct(Ativos + Plano + Patro) que tiverem movimentacao entre a DataFim e a
      // data do último fechamento
      // -------------------------------------------------------------------------------------------
      sSQL := MontaSQLAtivos(dDataFechamento,
                             dDataFim,
                             TipoCota,
                             pCdsAtivos
                            );

      try
         cdsAtivos.Data := GetDataPacket(sSQL);
      except
         sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
         sLog := sLog + 'Erro ao buscar lista dos Ativos de ' + sAtivoExtenso + ' com movimentação entre ' +
                        FormatDateTime('dd/mm/yyyy', dDataFechamento) + ' e ' + FormatDateTime('dd/mm/yyyy', dDataFim);

         sErro    := sLog;
         Result   := False;
         Exit;
      end;

      Result := True;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // Itera pela seleção acima, calculando as cotas
      // -------------------------------------------------------------------------------------------
      if not(cdsAtivos.IsEmpty) then
      begin
         iQuant    := cdsAtivos.RecordCount;
         iRegistro := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete,
                      0,                        // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                      0,                        // Mínimo de Registros  (em cima)
                      10,                       // Total de Registros   (em cima)
                      iNumeroModulo,            // Registro Atual       (em cima)
                      'Processando Segmentos...',
                      0,                        // Mínimo de Registros  (em baixo)
                      iQuant,                   // Total de Registros   (em baixo)
                      iRegistro,                // Registro Atual       (em baixo)
                      'Processando Ativos de ' + sAtivoExtenso + '...',
                      ' ']
                     );

         StartTransaction;

         try
            cdsAtivos.First;
            while not(cdsAtivos.EOF) do
            begin
               sLog := '';
               // ----------------------------------------------------------------------------------
               // Apaga as cotas calculadas após o último fechamento
               // ----------------------------------------------------------------------------------
               if ApagaCota(cdsAtivos.FieldByName('IDATIVOCOTA').AsInteger,
                            cdsAtivos.FieldByName('IDPLANO').AsInteger,
                            cdsAtivos.FieldByName('IDPATRO').AsInteger,
                            (dDataFechamento + 1),    // começa do 1º dia após fechamento
                            StrToDate('01/01/2104')   // apaga até o fim
                           ) then
               begin
                  sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                  sLog := sLog + 'Exclusão das cotas posteriores ao fechamento do ativo ' +
                          cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                          cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                          cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';
               end
               else
               begin
                  sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                  sLog := sLog + 'Erro ao excluir cotas posteriores ao fechamento do ativo ' +
                          cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                          cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                          cdsAtivos.FieldByName('NOMEPATRO').AsString;

                  Result := False;
                  RollBack;
                  Exit;
               end;
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               // Calcula e grava as cotas do Ativo em questão
               // ----------------------------------------------------------------------------------
               if CalculaCotas(cdsAtivos.FieldByName('IDATIVOCOTA').AsInteger,
                               cdsAtivos.FieldByName('IDPLANO').AsInteger,
                               cdsAtivos.FieldByName('IDPATRO').AsInteger,
                               (dDataFechamento + 1),
                               dDataFim,
                               TipoCota) then
               begin
                  if sLog <> '' then sLog := sLog + #13;
                  sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                  sLog := sLog + 'Calculada primeira cota do ativo ' +
                          cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                          cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                          cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';
               end
               else
               begin
                  if sLog <> '' then sLog := sLog + #13;
                  sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                  sLog := sLog + 'Erro no cálculo da primeira cota do ativo ' +
                          cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                          cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                          cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';

                  sErro  := sLog;
                  Result := False;
                  Rollback;
                  Exit;
               end;
               // -------------------------------------------------------------------------------------
               cdsAtivos.Next;

               inc(iRegistro);

               // AndaFormProgresso
               DoProgresso([sNomeBilhete,
                            1,               // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                            0,               // Mínimo de Registros  (em cima)
                            10,              // Total de Registros   (em cima)
                            iNumeroModulo,   // Registro Atual       (em cima)
                            'Processando Segmentos...',
                            0,               // Mínimo de Registros  (em baixo)
                            iQuant,          // Total de Registros   (em baixo)
                            iRegistro,       // Registro Atual       (em baixo)
                            'Processando Ativos de ' + sAtivoExtenso + '...',
                            sLog]
                           );
               // -------------------------------------------------------------------------------------
            end;

            if bFechamento then
            begin
               sSQL :=
               'UPDATE '          + #13 +
               '   PARAMCOTA '    + #13 +
               'SET '             + #13 +
               '   DTFECHA' + sTipoAtivo + ' = TO_DATE('+ QuotedStr(DateToStr(dDataFim))+ ', ''DD/MM/YYYY'')';

               try
                  ExecSQL(sSQL);
               except
                  Result   := False;
                  sErro    := 'Erro na atualizacão da data de Fechamento, para o segmento de ' + sAtivoExtenso;
                  RollBack;
                  Exit;
               end;
            end;

         except
            Result := False;
            Rollback;
         end;

         Result := True;
         Commit;
      end
      else
      begin
         sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
         sLog := sLog + 'Não foi encontrado movimento para os Ativos de ' + sAtivoExtenso + ' entre ' +
                        FormatDateTime('dd/mm/yyyy', dDataFechamento) + ' e ' + FormatDateTime('dd/mm/yyyy', dDataFim);

         sErro := sLog;
      end;
      // -------------------------------------------------------------------------------------------
   finally
      FreeAndNil(cdsAtivos);
   end;
end;



function TCtrlCotaCotacao.ProcessaPrimeirasCotas(const dDataCota     : TDateTime;
                                                 const TipoCota      : tTipoCota;
                                                 const bRecalculo    : Boolean;
                                                 var   sErro         : String;
                                                 const sNomeBilhete  : String
                                                ): Boolean;
var
   cdsAtivos      : TCMClientDataSet;
   rCotacao       : TCotacao;

   bCalculaCota   : Boolean;

   sLog           : String;
   sSQL           : String;
   sTipoAtivo     : String;
   sAtivoExtenso  : String;
   sNomeAtivo     : String;
   sPlano         : String;
   sPatro         : String;

   iNumeroModulo  : Integer;
   iQuant         : Integer;
   iRegistro      : Integer;
begin
   cdsAtivos := TCMClientDataSet.Create(nil);

   case TipoCota of
      ttHstMovCota:  begin iNumeroModulo := 1;                                                                                   end;
      ttEmprestimo:  begin iNumeroModulo := 2;  sTipoAtivo := 'EP ';          sAtivoExtenso := 'Empréstimo ';                    end;
      ttImobiliario: begin iNumeroModulo := 3;  sTipoAtivo := 'IMOB ';        sAtivoExtenso := 'Imobiliário';                    end;
      ttRF:          begin iNumeroModulo := 4;  sTipoAtivo := 'RF ';          sAtivoExtenso := 'Renda Fixa';                     end;
      ttRV:          begin iNumeroModulo := 5;  sTipoAtivo := 'RV ';          sAtivoExtenso := 'Renda Variável';                 end;
      ttBMF:         begin iNumeroModulo := 6;  sTipoAtivo := 'BMF ';         sAtivoExtenso := 'BM&&F';                          end;
      ttFundoRF:     begin iNumeroModulo := 7;  sTipoAtivo := 'FUNDORF ';     sAtivoExtenso := 'Fundos de Renda Fixa';           end;
      ttFundoRV:     begin iNumeroModulo := 8;  sTipoAtivo := 'FUNDORV ';     sAtivoExtenso := 'Fundos de Renda Variável';       end;
      ttFundoImob:   begin iNumeroModulo := 9;  sTipoAtivo := 'FUNDOIMOB ';   sAtivoExtenso := 'Fundos Imobiliários';            end;
      ttFundoDIC:    begin iNumeroModulo := 10; sTipoAtivo := 'FUNDODIC ';    sAtivoExtenso := 'Fundos de Direito Creditório';   end;
   end;

   try
      // -------------------------------------------------------------------------------------------
      // Seleciona os distinct(Ativos + Plano + Patro) que tiverem movimentacao entre a DataFim e a
      // data do último fechamento
      // -------------------------------------------------------------------------------------------
      sSQL := MontaSQLSaldoAtivos(dDataCota, TipoCota);

      try
         cdsAtivos.Data := GetDataPacket(sSQL);
      except
         sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
         sLog := sLog + 'Erro ao buscar saldo dos Ativos de ' + sAtivoExtenso + ' em ' +
                        FormatDateTime('dd/mm/yyyy', dDataCota);

         sErro    := sLog;
         Result   := False;
         Exit;
      end;

      Result := True;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // Itera pela seleção acima, calculando as cotas
      // -------------------------------------------------------------------------------------------
      if not(cdsAtivos.IsEmpty) then
      begin
         iQuant    := cdsAtivos.RecordCount;
         iRegistro := 0;

         // MostraFormProgresso
         DoProgresso([sNomeBilhete,
                      0,               // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                      0,               // Mínimo de Registros  (em cima)
                      10,              // Total de Registros   (em cima)
                      iNumeroModulo,   // Registro Atual       (em cima)
                      'Processando Segmentos...',
                      0,               // Mínimo de Registros  (em baixo)
                      iQuant,          // Total de Registros   (em baixo)
                      iRegistro,       // Registro Atual       (em baixo)
                      'Processando Ativos de ' + sAtivoExtenso + '...',
                      ' ']
                     );

         StartTransaction;

         cdsAtivos.First;
         while not(cdsAtivos.EOF) do
         begin
            sLog := '';
            // -------------------------------------------------------------------------------------
            // Calcula e grava as cotas do Ativo em questão
            // -------------------------------------------------------------------------------------
            try
               // ----------------------------------------------------------------------------------
               if bRecalculo then
               begin
                  if ApagaCota(cdsAtivos.FieldByName('IDATIVOCOTA').AsInteger,
                               cdsAtivos.FieldByName('IDPLANO').AsInteger,
                               cdsAtivos.FieldByName('IDPATRO').AsInteger,
                               CtrlParamCota.DtPrimeira,
                               StrToDate('01/01/2104')
                              ) then
                  begin
                     sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                     sLog := sLog + 'Exclusão das cotas do ativo ' +
                             cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                             cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                             cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';

                     bCalculaCota := True;
                  end
                  else
                  begin
                     sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                     sLog := sLog + 'Erro ao excluir a cota inicial do ativo ' +
                             cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                             cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                             cdsAtivos.FieldByName('NOMEPATRO').AsString;

                     bCalculaCota := False;
                  end;
               end
               else
               begin
                  bCalculaCota := not(ExisteCotaAtivo(cdsAtivos.FieldByName('IDATIVOCOTA').AsInteger,
                                                      cdsAtivos.FieldByName('IDPLANO').AsInteger,
                                                      cdsAtivos.FieldByName('IDPATRO').AsInteger,
                                                      -1
                                                     ));

                  if not(bCalculaCota) then
                  begin
                     if sLog <> '' then sLog := sLog + #13;
                     sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                     sLog := sLog + 'Já existem cotações para o ativo ' +
                             cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                             cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                             cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';
                  end;
               end;
               // ----------------------------------------------------------------------------------

               // ----------------------------------------------------------------------------------
               if bCalculaCota then
               begin
                  rCotacao := CalculaPrimeiraCota(cdsAtivos.FieldByName('IDATIVOCOTA').AsInteger,
                                                  cdsAtivos.FieldByName('IDPLANO').AsInteger,
                                                  cdsAtivos.FieldByName('IDPATRO').AsInteger,
                                                  dDataCota,
                                                  cdsAtivos.FieldByName('SALDO').AsCurrency
                                                 );

                  if rCotacao.fVlrCota = -1 then
                  begin
                     if sLog <> '' then sLog := sLog + #13;
                     sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                     sLog := sLog + 'Erro no cálculo da primeira cota do ativo ' +
                             cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                             cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                             cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';

                     sErro  := sLog;
                     Result := False;
                     Rollback;
                  end
                  else
                  begin
                     rCotacao.iOrigem  := iNumeroModulo;
                  end;

                  rCotacao.dDataIni := rCotacao.dData;

                  if GravaCota(rCotacao) then
                  begin
                     // ----------------------------------------------------------------------------
                     if sLog <> '' then sLog := sLog + #13;
                     sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                     sLog := sLog + 'Calculada primeira cota do ativo ' +
                             cdsAtivos.FieldByName('NOMEATIVO').AsString + ' (' +
                             cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                             cdsAtivos.FieldByName('NOMEPATRO').AsString + ') ';
                     // ----------------------------------------------------------------------------
                  end
                  else
                  begin
                     // ----------------------------------------------------------------------------
                     if sLog <> '' then sLog := sLog + #13;
                     sLog := sLog + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
                     sLog := sLog + 'Erro ao gravar primeira cota do ativo ' +
                             cdsAtivos.FieldByName('NOMEATIVO').AsString + ' ('  +
                             cdsAtivos.FieldByName('NOMEPLANO').AsString + ' / ' +
                             cdsAtivos.FieldByName('NOMEPATRO').AsString + ') '  + ' - ' +
                             MessageInfo;

                     sErro := sLog;
                     // ----------------------------------------------------------------------------
                  end;
               end;
               // ----------------------------------------------------------------------------------

            except
               Result := False;
               RollBack;
            end;
            // -------------------------------------------------------------------------------------

            cdsAtivos.Next;
            inc(iRegistro);

            // -------------------------------------------------------------------------------------
            // AndaFormProgresso
            DoProgresso([sNomeBilhete,
                         1,               // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                         0,               // Mínimo de Registros  (em cima)
                         10,              // Total de Registros   (em cima)
                         iNumeroModulo,   // Registro Atual       (em cima)
                         'Processando Segmentos...',
                         0,               // Mínimo de Registros  (em baixo)
                         iQuant,          // Total de Registros   (em baixo)
                         iRegistro,       // Registro Atual       (em baixo)
                         'Processando Ativos de ' + sAtivoExtenso + '...',
                         sLog]
                        );
            // -------------------------------------------------------------------------------------

            if Result = False then Exit;
         end;

         sSQL :=
         'UPDATE '         + #13 +
         '   PARAMCOTA '   + #13 +
         'SET '            + #13 +
         '   DTPRIM'  + sTipoAtivo + ' = TO_DATE('+ QuotedStr(DateToStr(dDataCota))+ ', ''DD/MM/YYYY'') , ' + #13 +
         '   DTFECHA' + sTipoAtivo + ' = TO_DATE('+ QuotedStr(DateToStr(dDataCota))+ ', ''DD/MM/YYYY'')';

         try
            ExecSQL(sSQL);
         except
            Result   := False;
            sErro    := 'Erro na atualizacão das datas de Primeira Cota e Fechamento, ' +
                        'para o segmento de ' + sAtivoExtenso;
            RollBack;
            Exit;
         end;

         Result := True;
         Commit;
      end
      else
      begin
         sLog := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ';
         sLog := sLog + 'Não foi encontrado saldo para os Ativos de ' + sAtivoExtenso + ' em ' +
                        FormatDateTime('dd/mm/yyyy', dDataCota);

         sErro := sLog;
      end;
      // -------------------------------------------------------------------------------------------
   finally
      FreeAndNil(cdsAtivos);
   end;
end;



function TCtrlCotaCotacao.CalculaPrimeiraCota(const IDAtivo : Integer;
                                              const IDPlano : Integer;
                                              const IDPatro : Integer;
                                              const dData   : TDateTime;
                                              const fValor  : Extended
                                             ): TCotacao;
var
   rCotacaoNova : TCotacao;
begin
   try
      rCotacaoNova.IDAtivo    := IDAtivo;
      rCotacaoNova.IDPlano    := IDPlano;
      rCotacaoNova.IDPatro    := IDPatro;

      rCotacaoNova.dData      := dData;

      rCotacaoNova.Periodo    := StrToInt(FormatDateTime('mm', dData));
      rCotacaoNova.Exercicio  := StrToInt(FormatDateTime('yyyy', dData));

      // ----------------------------------------------------------------------------------------------
      // Cálculo dos Valores
      // ----------------------------------------------------------------------------------------------
      rCotacaoNova.fVlrPatrimonio      := fValor;
      rCotacaoNova.fVlrCota            := CtrlParamCota.VlrPrimeira;
      rCotacaoNova.fQtdCotas           := rCotacaoNova.fVlrPatrimonio / rCotacaoNova.fVlrCota;
      rCotacaoNova.fVlrCotizado        := rCotacaoNova.fVlrPatrimonio;
      rCotacaoNova.fVlrRentabilizado   := 0;
      // ----------------------------------------------------------------------------------------------

   except
      rCotacaoNova.fVlrCota            := -1;
   end;

   Result := rCotacaoNova;
end;



function TCtrlCotaCotacao.DataFechamento(const TipoCota: tTipoCota): TDateTime;
var
   dDataPrim : TDateTime;
   dDataFech : TDateTime;

begin

     Result := 0;

     case TipoCota of
        ttHstMovCota  : begin
                             dDataPrim := CtrlParamCota.DtPrimManual;
                             dDataFech := CtrlParamCota.DtFechaManual;
                        end;
        ttEmprestimo  : begin
                             dDataPrim := CtrlParamCota.DtPrimEP;
                             dDataFech := CtrlParamCota.DtFechaEP;
                        end;
        ttImobiliario : begin
                             dDataPrim := CtrlParamCota.DtPrimImob;
                             dDataFech := CtrlParamCota.DtFechaImob;
                        end;
        ttRF          : begin
                             dDataPrim := CtrlParamCota.DtPrimRF;
                             dDataFech := CtrlParamCota.DtFechaRF;
                        end;
        ttRV          : begin
                             dDataPrim := CtrlParamCota.DtPrimRV;
                             dDataFech := CtrlParamCota.DtFechaRV;
                        end;
        ttBMF         : begin
                             dDataPrim := CtrlParamCota.DtPrimBMF;
                             dDataFech := CtrlParamCota.DtFechaBMF;
                        end;
        ttFundoRF     : begin
                             dDataPrim := CtrlParamCota.DtPrimFundoRF;
                             dDataFech := CtrlParamCota.DtFechaFundoRF;
                        end;
        ttFundoRV     : begin
                             dDataPrim := CtrlParamCota.DtPrimFundoRV;
                             dDataFech := CtrlParamCota.DtFechaFundoRV;
                        end;
        ttFundoImob   : begin
                             dDataPrim := CtrlParamCota.DtPrimFundoImob;
                             dDataFech := CtrlParamCota.DtFechaFundoImob;
                        end;
        ttFundoDIC    : begin
                             dDataPrim := CtrlParamCota.DtPrimFundoDIC;
                             dDataFech := CtrlParamCota.DtFechaFundoDIC;
                        end;
     end;

     if dDataPrim = 0 then
     begin
          Result := 0;
          Exit;
     end;

     if (dDataFech > dDataPrim) then
     begin
          Result := dDataFech;
     end;

     if Result = 0 then
        Result := dDataPrim;
end;

function TCtrlCotaCotacao.MontaSQLAtivos(const dDataFechamento : TDateTime;
                                         const dDataFim        : TDateTime;
                                         const TipoCota        : tTipoCota;
                                         const CdsAtivos       : TCMClientDataSet = nil
                                        ): String;
var
   sDataFechamento   : String;
   sDataFim          : String;
   //AL_4
   i: Integer;
begin
   // ----------------------------------------------------------------------------------------------
   // Seleciona os distinct(Ativos + Plano + Patro) que tiverem movimentacao entre a DataFim e a
   // data do último fechamento
   // ----------------------------------------------------------------------------------------------

   sDataFechamento   := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFechamento));
   sDataFim          := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim));
   i := 0;

   case TipoCota of
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttHstMovCota: begin
         Result :=
         'SELECT DISTINCT '                                                                  + #13 +
         '   HST.IDATIVOCOTA, HST.IDPLANOPREV AS IDPLANO, HST.IDPATRO, '                     + #13 +
         '   ATC.DESCRICAO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO '      + #13 +
         'FROM '                                                                             + #13 +
         '   HSTMOVCOTA       HST, '                                                         + #13 +
         '   ATIVOCOTA        ATC, '                                                         + #13 +
         '   PLANPREVCONTABIL PPC, '                                                         + #13 +
         '   PESSOA           PTR  '                                                         + #13 +
         'WHERE '                                                                            + #13 +
         '       HST.DATA        BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '  +
                                   ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '  + #13 +
         '   AND HST.IDATIVOCOTA = ATC.IDATIVOCOTA '                                         + #13 +
         '   AND HST.IDPLANOPREV = PPC.IDPLANOPREV '                                         + #13 +
         '   AND HST.IDPATRO     = PTR.IDPESSOA '                                            + #13;

         //AL_4
         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (ATC.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'ATC.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttEmprestimo: begin
         Result :=
         'SELECT DISTINCT '                                                                              + #13 +
         '   TCE.TCEDESCRICAO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '              + #13 +
         '   ATC.IDATIVOCOTA, CON.IDPLANOORIGEM AS IDPLANO, CON.IDPATRO '                                + #13 +
         'FROM '                                                                                         + #13 +
         '   ATIVOCOTA        ATC, '                                                                     + #13 +
         '   PLANPREVCONTABIL PPC, '                                                                     + #13 +
         '   PESSOA           PTR, '                                                                     + #13 +
         '   HISTMOVEMPTMO    HME, '                                                                     + #13 +
         '   CONTRATOEMPTMO   CON, '                                                                     + #13 +
         '   TIPOCONTREMPTMO  TCE, '                                                                     + #13 +
         '   TIPOEMPTMO       TEP, '                                                                     + #13 +
         '   ITEMXTIPOCONTR   ITC  '                                                                     + #13 +
         'WHERE '                                                                                        + #13 +
         '       TEP.IDEMPRESAPROP        = ' + FormatFloat('#0', Sistema.IDEmpresa)                     + #13 +
         '   AND CON.FLGSITUACAO          <> ''C'' '                                                     + #13 +

         '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +

         '   AND ITC.FLGMOVCOTA           IN (''R'', ''C'') '                                            + #13 +

         '   AND HME.HMEDATAPREVISTA      BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '     +
                                            ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '     + #13 +

         '   AND ATC.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
         '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                       + #13 +
         '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
         '   AND CON.IDPLANOORIGEM        = PPC.IDPLANOPREV '                                            + #13 +
         '   AND CON.IDPATRO              = PTR.IDPESSOA '                                               + #13 +
         '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                           + #13 +
         '   AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                           + #13 +
         '   AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                      + #13;
         //AL_4
         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (ATC.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'ATC.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;

      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttImobiliario: begin
         //AL_4
         Result :=
         'SELECT DISTINCT ' + #13 +
         '   A.IDATIVOCOTA, I.IMONOME AS NOMEATIVO, ' + #13 +
         '   DECODE(FT.IDPLANOPREV, NULL, PPC1.NOME, PPC2.NOME ) AS NOMEPLANO, ' + #13 +
         '   DECODE(FT.IDPATRO, NULL, PTR1.NOME, PTR2.NOME ) AS NOMEPATRO, ' + #13 +
         '   DECODE(FT.IDPLANOPREV, NULL, PG.IDPLANOPREV, FT.IDPLANOPREV ) AS IDPLANO, ' + #13 +
         '   DECODE(FT.IDPATRO, NULL, PG.IDPATRO, FT.IDPATRO ) AS IDPATRO ' + #13 +
         'FROM ' + #13 +
         '   IMOVEL           I, ' + #13 +
         '   PLANPREVCONTABIL PPC1, ' + #13 +
         '   PLANPREVCONTABIL PPC2, ' + #13 +
         '   PESSOA           PTR1, ' + #13 +
         '   PESSOA           PTR2, ' + #13 +
         '   ATIVOCOTA        A, ' + #13 +
         '   PARAMGLOBAL      PG, ' + #13 +
         '   ( ' + #13 +
         '   SELECT ' + #13 +
         '      I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA, ' + #13 +
         '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) AS TOT_RECEBIDO, ' + #13 +
         '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) AS TOT_PAGO ' + #13 +
         '   FROM ' + #13 +
         '      DOCUMENTO         D, ' + #13 +
         '      LANCTODOCUM       LD, ' + #13 +
         '      LANCAMENTOSIMOVEL LI, ' + #13 +
         '      IMOVEL            I, ' + #13 +
         '      RECBTOPAGTO       RP, ' + #13 +
         '      TIPOCUSTORECIMOV  TC, ' + #13 +
         '      ( ' + #13 +
         '      SELECT ' + #13 +
         '         CODDOCUMENTO, VALOR ' + #13 +
         '      FROM ' + #13 +
         '         LANCTODOCUM ' + #13 +
         '      WHERE ' + #13 +
         '         RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ' + #13 +
         '      ) TR1 ' + #13 +
         '   WHERE ' + #13 +
         '          D.CODDOCUMENTO       = LI.CODDOCUMENTO ' + #13 +
         '      AND D.CODDOCUMENTO       = LD.CODDOCUMENTO ' + #13 +
         '      AND D.CODDOCUMENTO       = TR1.CODDOCUMENTO ' + #13 +
         '      AND LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO ' + #13 +
         '      AND D.CODDOCUMENTO       = RP.CODDOCUMENTO(+) ' + #13 +
         '      AND LI.IDIMOVEL          = I.IDIMOVEL ' + #13 +
         '      AND TC.FLGMOVCOTA        IN (''R'', ''C'') ' + #13 +
         '      AND RP.DATABAIXA         BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') ' + #13 +
         '                                   AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
         '   GROUP ' + #13 +
         '      BY I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA ' + #13 +
         '   ) RM, ' + #13 +
         '   ( ' + #13 +
         '    SELECT IM.IDIMOVEL, ' + #13 +
         '           DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) AS IDPATRO, ' + #13 +
         '           DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) AS IDPLANOPREV, ' + #13 +
         '           DECODE(NVL(TT.TOTAL,0), 0, 100, DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL )) AS FATOR ' + #13 +
         '    FROM ' + #13 +
         '      PLANOPATROXIMOVEL PI, IMOVEL IM, PARAMGLOBAL PG, ' + #13 +
         '           ( ' + #13 +
         '           SELECT ' + #13 +
         '             IDIMOVEL, SUM( NVL(PPIPERCENTRATEIO,0) ) AS TOTAL ' + #13 +
         '           FROM ' + #13 +
         '             PLANOPATROXIMOVEL ' + #13 +
         '           GROUP BY ' + #13 +
         '           IDIMOVEL ' + #13 +
         '           ) TT ' + #13 +
         '           WHERE ' + #13 +
         '                 PI.IDIMOVEL = TT.IDIMOVEL(+) ' + #13 +
         '             AND IM.IDIMOVEL = PI.IDIMOVEL(+) ' + #13 +
         '             AND IM.IDPESSOA = PG.IDPESSOA '    + #13 +
         '             AND IM.FLGTIPOIMOVEL = 1 '         + #13 +
         '       ) FT ' + #13 +
         'WHERE ' + #13 +
         '       I.FLGATIVO       = 1 ' + #13 +
         '   AND I.IDIMOVELMESTRE IS NOT NULL ' + #13 +
         '   AND I.IDIMOVEL       = A.IDIMOVEL ' + #13 +
         '   AND I.IDPESSOA       = PG.IDPESSOA ' + #13 +
         '   AND PG.IDPLANOPREV   = PPC1.IDPLANOPREV(+) ' + #13 +
         '   AND PG.IDPATRO       = PTR1.IDPESSOA(+) ' + #13 +
         '   AND FT.IDPLANOPREV   = PPC2.IDPLANOPREV(+) ' + #13 +
         '   AND FT.IDPATRO       = PTR2.IDPESSOA(+) ' + #13 +
         '   AND I.IDIMOVEL       = FT.IDIMOVEL ' + #13 +
         '   AND I.IDIMOVEL       = RM.IDIMOVEL ' + #13;

         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda fixa
      ttRF: begin
         Result :=
         'SELECT DISTINCT '                                                                           + #13 +
         '   INV.DESCINVESTIMENTO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '       + #13 +
         '   A1.IDATIVOCOTA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO '                                  + #13 +
         'FROM '                                                                                      + #13 +
         '   HISTRENFIX          H1,  '                                                               + #13 +
         '   ATIVOCOTA           A1,  '                                                               + #13 +
         '   INVESTIMENTO        INV, '                                                               + #13 +
         '   PLANPREVCONTABIL    PPC, '                                                               + #13 +
         '   PESSOA              PTR, '                                                               + #13 +
         '   PLANPREVCONTABPATRO PA,  '                                                               + #13 +
         '   TIPOOPERACAO        TP   '                                                               + #13 +
         'WHERE '                                                                                     + #13 +
         '       H1.DATAHISTRENFIX     BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '     +
                                         ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '     + #13 +

         '   AND TP.FLGMOVCOTA         IN (''R'', ''C'') '                                            + #13 +

         '   AND H1.IDINVESTIMENTO     = INV.IDINVESTIMENTO '                                         + #13 +
         '   AND PA.IDPLANOPREV        = PPC.IDPLANOPREV '                                            + #13 +
         '   AND PA.IDPATRO            = PTR.IDPESSOA '                                               + #13 +

         '   AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
         '   AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
         '   AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13;

         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A1.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda Variável
      ttRV: begin
         Result :=
         'SELECT DISTINCT '                                                                           + #13 +
         '   INV.DESCINVESTIMENTO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '       + #13 +
         '   A1.IDATIVOCOTA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO '                                  + #13 +

         'FROM '                                                                                      + #13 +
         '   HISTCARTINV         H1,  '                                                               + #13 +
         '   ATIVOCOTA           A1,  '                                                               + #13 +
         '   INVESTIMENTO        INV, '                                                               + #13 +
         '   PLANPREVCONTABIL    PPC, '                                                               + #13 +
         '   PESSOA              PTR, '                                                               + #13 +
         '   PLANPREVCONTABPATRO PA,  '                                                               + #13 +
         '   TIPOOPERACAO        TP   '                                                               + #13 +

         'WHERE '                                                                                     + #13 +
         '       H1.IDTIPOINVEST       = 2 '                                                          + #13 +

         '   AND H1.DATAMOVCARTINV     BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '    +
                                         ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

         '   AND H1.IDCARTEIRAGERENC   IS NULL '                                                      + #13 +
         '   AND TP.FLGMOVCOTA         IN (''R'', ''C'') '                                            + #13 +

         '   AND H1.IDINVESTIMENTO     = INV.IDINVESTIMENTO '                                         + #13 +
         '   AND PA.IDPLANOPREV        = PPC.IDPLANOPREV '                                            + #13 +
         '   AND PA.IDPATRO            = PTR.IDPESSOA '                                               + #13 +

         '   AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
         '   AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
         '   AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13;

         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A1.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttBMF: Result := '';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRF: begin
         Result :=
         'SELECT DISTINCT '                                                                     + #13 +
         '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
         '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
         '   PA.IDPATRO, '                                                                      + #13 +
         '   A1.IDATIVOCOTA '                                                                   + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1,  '                                                        + #13 +
         '   TIPOOPERACAO         TP,  '                                                        + #13 +
         '   ATIVOCOTA            A1,  '                                                        + #13 +
         '   FUNDOINVEST          FIN, '                                                        + #13 +
         '   PLANPREVCONTABIL     PPC, '                                                        + #13 +
         '   PESSOA               PTR, '                                                        + #13 +
         '   PLANPREVCONTABPATRO  PA  '                                                         + #13 +

         'WHERE '                                                                               + #13 +
         //AL_9
         '       H1.IDTIPOINVEST       = 5 '                                                    + #13 +
         '   AND H1.IDPLANPREVCTBPATR > 0 '                                                     + #13 +
         '   AND H1.IDFUNDOINVEST     > 0 '                                                     + #13 +
         '   AND H1.DATAAPLICACAO     <= TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

         '   AND H1.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') '    + #13 +
         '                           AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

         '   AND H1.TIPMOVFUNDO      <> ''PIR'' '                                               + #13 +

         '   AND TP.FLGMOVCOTA       IN (''R'', ''C'') '                                        + #13 +

         '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
         '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
         '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13;
         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A1.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRV: begin
         Result :=
         'SELECT DISTINCT '                                                                     + #13 +
         '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
         '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
         '   PA.IDPATRO, '                                                                      + #13 +
         '   A1.IDATIVOCOTA '                                                                   + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1,  '                                                        + #13 +
         '   FUNDOINVEST          FIN, '                                                        + #13 +
         '   PLANPREVCONTABIL     PPC, '                                                        + #13 +
         '   PESSOA               PTR, '                                                        + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         '       H1.IDTIPOINVEST      = 6 '                                                     + #13 +
         '   AND H1.IDPLANPREVCTBPATR > 0 '                                                     + #13 +
         '   AND H1.IDFUNDOINVEST     > 0 '                                                     + #13 +
         '   AND H1.DATAAPLICACAO     <= TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +
         '   AND H1.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') '    + #13 +
         '                           AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

         '   AND H1.TIPMOVFUNDO      <> ''PIR'' '                                               + #13 +

         '   AND TP.FLGMOVCOTA       IN (''R'', ''C'') '                                        + #13 +

         '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
         '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
         '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13;

         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A1.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoImob: begin
         Result :=
         'SELECT DISTINCT '                                                                     + #13 +
         '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
         '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
         '   PA.IDPATRO, '                                                                      + #13 +
         '   A1.IDATIVOCOTA '                                                                   + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1,  '                                                        + #13 +
         '   FUNDOINVEST          FIN, '                                                        + #13 +
         '   PLANPREVCONTABIL     PPC, '                                                        + #13 +
         '   PESSOA               PTR, '                                                        + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         '       H1.IDTIPOINVEST      = 7 '                                                     + #13 +
         '   AND H1.IDPLANPREVCTBPATR > 0 '                                                     + #13 +
         '   AND H1.IDFUNDOINVEST     > 0 '                                                     + #13 +
         '   AND H1.DATAAPLICACAO     <= TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +
         '   AND H1.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') '    + #13 +
         '                           AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

         '   AND H1.TIPMOVFUNDO      <> ''PIR'' '                                               + #13 +

         '   AND TP.FLGMOVCOTA       IN (''R'', ''C'') '                                        + #13 +

         '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
         '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
         '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13;

         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A1.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;

      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoDIC: begin
         Result :=
         'SELECT DISTINCT '                                                                     + #13 +
         '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
         '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
         '   PA.IDPATRO, '                                                                      + #13 +
         '   A1.IDATIVOCOTA '                                                                   + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1,  '                                                        + #13 +
         '   FUNDOINVEST          FIN, '                                                        + #13 +
         '   PLANPREVCONTABIL     PPC, '                                                        + #13 +
         '   PESSOA               PTR, '                                                        + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         //AL_9
         '       H1.IDTIPOINVEST      = 9 '                                                     + #13 +
         '   AND H1.IDPLANPREVCTBPATR > 0 '                                                     + #13 +
         '   AND H1.IDFUNDOINVEST     > 0 '                                                     + #13 +
         '   AND H1.DATAAPLICACAO     <= TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +
         '   AND H1.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') '    + #13 +
         '                           AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

         '   AND H1.TIPMOVFUNDO      <> ''PIR'' '                                               + #13 +

         '   AND TP.FLGMOVCOTA       IN (''R'', ''C'') '                                        + #13 +

         '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
         '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
         '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13;
         //AL_4
         if cdsAtivos <> nil then
         begin
            if not cdsAtivos.IsEmpty then
            begin
               cdsAtivos.First;
               Result := Result + '   AND (A1.IDATIVOCOTA IN ('+ cdsAtivos.Fields[0].AsString;
               cdsAtivos.Next;
               while not cdsAtivos.Eof do
               begin
                  Inc(i);
                  if i > 999 then
                  begin
                     Result := Result + ') OR ' + #13 + 'A1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
                     i := 0;
                  end
                  else
                     Result := Result + ', ' + cdsAtivos.Fields[0].AsString;
                  cdsAtivos.Next;
               end;
               Result := Result + ')) ';
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
   end;
end;



function TCtrlCotaCotacao.MontaSQLSaldoAtivos(const dDataCota   : TDateTime;
                                              const TipoCota   : tTipoCota
                                             ): String;
var
   sDataCota : String;
begin
   // ----------------------------------------------------------------------------------------------
   // Seleciona os distinct(Ativos + Plano + Patro) que tiverem movimentacao entre a DataFim e a
   // data do último fechamento
   // ----------------------------------------------------------------------------------------------

   sDataCota := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataCota));

   case TipoCota of
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttHstMovCota: Result := '';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttEmprestimo: Result :=
      'SELECT '                                                                                 + #13 +
      '   ATC.IDATIVOCOTA, CON.IDPLANOORIGEM AS IDPLANO, CON.IDPATRO, '                         + #13 +
      '   TCE.TCEDESCRICAO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '        + #13 +
      '   SUM(DECODE(GREATEST(NVL(H1.ORDEM,0), NVL(H2.ORDEM,0)), '                              + #13 +
      '              H1.ORDEM, '                                                                + #13 +
      '              HISTMOVEMPTMOOUTROSVALOR.HMESALDODEV, '                                    + #13 +
      '              HISTMOVEMPTMOCONCATUVALOR.HMESALDODEV) '                                   + #13 +
      '      ) AS SALDO '                                                                       + #13 +
      'FROM '                                                                                   + #13 +
      '   ATIVOCOTA        ATC, '                                                               + #13 +
      '   PLANPREVCONTABIL PPC, '                                                               + #13 +
      '   PESSOA           PTR, '                                                               + #13 +
      '   CONTRATOEMPTMO   CON, '                                                               + #13 +
      '   TIPOCONTREMPTMO  TCE, '                                                               + #13 +
      '   TIPOEMPTMO       TEP, '                                                               + #13 +
      '   ( '                                                                                   + #13 +
      '   SELECT /*+INDEX(HISTMOVEMPTMO XIE26HISTMOVEMPTMO)*/ DISTINCT '                        + #13 +
      '      HISTMOVEMPTMO.IDCONTRATOEMPTMO, HISTMOVEMPTMO.HMETXJUROS '                         + #13 +
      '   FROM '                                                                                + #13 +
      '      HISTMOVEMPTMO '                                                                    + #13 +
      '   WHERE '                                                                               + #13 +
      '          HMEDATAPREVISTA      = TO_DATE(' + sDataCota + ', ''dd/mm/yyyy'') '            + #13 +
      '      AND HMETIPOMOV           IN (0, 1, 2, 3, 5, 6, 8) '                                + #13 +
      '      AND NVL(FLGESTORNADO, 0) = 0 '                                                     + #13 +
      '   ) HST, '                                                                              + #13 +
      '   ( '                                                                                   + #13 +
      '   SELECT /*+INDEX(HME XIE26HISTMOVEMPTMO)*/ '                                           + #13 +
      '      MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, 2 AS ORDEM, HME.IDCONTRATOEMPTMO '    + #13 +
      '   FROM '                                                                                + #13 +
      '      HISTMOVEMPTMO   HME '                                                              + #13 +
      '   WHERE '                                                                               + #13 +
      '          HME.HMETIPOMOV       IN (1, 2, 3, 6, 8) '                                      + #13 +
      '      AND NVL(FLGESTORNADO, 0) = 0 '                                                     + #13 +
      '      AND HME.HMEDATAPREVISTA  = TO_DATE(' + sDataCota + ', ''dd/mm/yyyy'') '            + #13 +
      '   GROUP BY '                                                                            + #13 +
      '      HME.IDCONTRATOEMPTMO '                                                             + #13 +
      '   ) H1, '                                                                               + #13 +
      '   ( '                                                                                   + #13 +
      '   SELECT /*+INDEX(HME XIE26HISTMOVEMPTMO)*/ '                                           + #13 +
      '      MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, 1 AS ORDEM, HME.IDCONTRATOEMPTMO '    + #13 +
      '   FROM '                                                                                + #13 +
      '      HISTMOVEMPTMO   HME '                                                              + #13 +
      '   WHERE '                                                                               + #13 +
      '          HME.HMETIPOMOV       IN (0, 5) '                                               + #13 +
      '      AND NVL(FLGESTORNADO, 0) = 0 '                                                     + #13 +
      '      AND HME.HMEDATAPREVISTA  = TO_DATE(' + sDataCota + ', ''dd/mm/yyyy'') '            + #13 +
      '   GROUP BY '                                                                            + #13 +
      '      HME.IDCONTRATOEMPTMO '                                                             + #13 +
      '   ) H2, '                                                                               + #13 +
      '   HISTMOVEMPTMO HISTMOVEMPTMOOUTROSVALOR, '                                             + #13 +
      '   HISTMOVEMPTMO HISTMOVEMPTMOCONCATUVALOR '                                             + #13 +
      'WHERE '                                                                                  + #13 +
      '       TEP.IDEMPRESAPROP        = ' + FormatFloat('#0', Sistema.IDEmpresa)               + #13 +
      '   AND CON.FLGSITUACAO          <> ''C'' '                                               + #13 +
      '   AND ATC.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                + #13 +
      '   AND CON.IDPLANOORIGEM        = PPC.IDPLANOPREV '                                      + #13 +
      '   AND CON.IDPATRO              = PTR.IDPESSOA '                                         + #13 +
      '   AND HST.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                 + #13 +
      '   AND HST.IDCONTRATOEMPTMO     = H1.IDCONTRATOEMPTMO(+) '                               + #13 +
      '   AND HST.IDCONTRATOEMPTMO     = H2.IDCONTRATOEMPTMO(+) '                               + #13 +
      '   AND H1.IDHISTMOVEMPTMO       = HISTMOVEMPTMOOUTROSVALOR.IDHISTMOVEMPTMO(+) '          + #13 +
      '   AND H2.IDHISTMOVEMPTMO       = HISTMOVEMPTMOCONCATUVALOR.IDHISTMOVEMPTMO(+) '         + #13 +
      '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                + #13 +
      '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                     + #13 +
      'GROUP BY '                                                                               + #13 +
      '   CON.IDPLANOORIGEM, CON.IDPATRO, ATC.IDATIVOCOTA, '                                    + #13 +
      '   TCE.TCEDESCRICAO, PPC.NOME, PTR.NOME ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttImobiliario: Result :=
      //AL_5 - Ini - Fazer igual a uCtrlHstMovCota linha 1235 rotina MovCotaAtivoImobiliario
      'SELECT ' + #13 +
      '   A.IDATIVOCOTA, FT.IDPATRO, FT.IDPLANOPREV AS IDPLANO, ' + #13 +
      '   I.IMONOME AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '+ #13 +
      '   NVL(ROUND(SUM(RR.VLRREAVALIA * FT.FATOR), 2), 0) AS SALDO ' + #13 +
      'FROM ' + #13 +
      '   REAVALIAXREAVALIA RR, ' + #13 +
      '   IMOVEL            I, ' + #13 +
      '   ATIVOCOTA         A, ' + #13 +
      '   PLANPREVCONTABIL  PPC, ' + #13 +
      '   PESSOA            PTR, ' + #13 +
      '   ( ' + #13 +
      '    SELECT IM.IDIMOVEL, ' + #13 +
      '           DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) AS IDPATRO, ' + #13 +
      '           DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) AS IDPLANOPREV, ' + #13 +
      '           DECODE(NVL(TT.TOTAL,0), 0, 100, DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL )) AS FATOR ' + #13 +
      '    FROM ' + #13 +
      '      PLANOPATROXIMOVEL PI, IMOVEL IM, PARAMGLOBAL PG, ' + #13 +
      '     ( ' + #13 +
      '      SELECT ' + #13 +
      '        IDIMOVEL, SUM( NVL(PPIPERCENTRATEIO,0) ) AS TOTAL ' + #13 +
      '      FROM ' + #13 +
      '        PLANOPATROXIMOVEL ' + #13 +
      '      GROUP BY ' + #13 +
      '        IDIMOVEL ' + #13 +
      '     ) TT ' + #13 +
      '    WHERE ' + #13 +
      '          PI.IDIMOVEL = TT.IDIMOVEL(+) ' + #13 +
      '      AND IM.IDIMOVEL = PI.IDIMOVEL(+) ' + #13 +
      '      AND IM.IDPESSOA = PG.IDPESSOA '    + #13 +
      '      AND IM.FLGTIPOIMOVEL = 1 '         + #13 +
      '   ) FT ' + #13 +
      'WHERE ' + #13 +
      '       RR.DATAREAVALIACAO = ( ' + #13 +
      '                            SELECT ' + #13 +
      '                               MAX(R.DATAREAVALIACAO) ' + #13 +
      '                            FROM ' + #13 +
      '                               REAVALIAXREAVALIA R ' + #13 +
      '                            WHERE ' + #13 +
      '                                   R.DATAREAVALIACAO <= TO_DATE(' + sDataCota + ', ''dd/mm/yyyy'') ' + #13 +
      '                               AND R.IDIMOVEL = I.IDIMOVEL ' + #13 +
      '                           ) ' + #13 +
      '   AND FT.IDPATRO     = PTR.IDPESSOA ' + #13 +
      '   AND FT.IDPLANOPREV = PPC.IDPLANOPREV ' + #13 +
      '   AND I.IDIMOVEL     = RR.IDIMOVEL ' + #13 +
      '   AND I.IDIMOVEL     = FT.IDIMOVEL ' + #13 +
      '   AND I.IDIMOVEL     = A.IDIMOVEL ' + #13 +
      'GROUP BY ' + #13 +
      '   I.IMONOME, PPC.NOME, PTR.NOME, ' + #13 +
      '   A.IDATIVOCOTA, FT.IDPATRO, FT.IDPLANOPREV ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda fixa
      ttRF: Result :=
      'SELECT '                                                                                                   + #13 +
      '   HR.DATAHISTRENFIX, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, A1.IDATIVOCOTA, '                             + #13 +
      '   INV.DESCINVESTIMENTO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '                      + #13 +
      '   SUM((NVL(HR.SALDOVLRHISTRENFI, 0) + NVL(HIP.PUACUITEM, 0) + NVL(HIB.PUACUITEM, 0))) AS SALDO '          + #13 +
      'FROM '                                                                                                     + #13 +
      '   HISTRENFIX          HR,  '                                                                              + #13 +
      '   OPERRENFIX          OP,  '                                                                              + #13 +
      '   ATIVOCOTA           A1,  '                                                                              + #13 +
      '   INVESTIMENTO        INV, '                                                                              + #13 +
      '   PLANPREVCONTABIL    PPC, '                                                                              + #13 +
      '   PESSOA              PTR, '                                                                              + #13 +
      '   PLANPREVCONTABPATRO PA,  '                                                                              + #13 +
      '   (SELECT * FROM HISTRENFIXXITENS WHERE IDITEMRENFIX = -15) HIP, '                                        + #13 +
      '   (SELECT * FROM HISTRENFIXXITENS WHERE IDITEMRENFIX = -15) HIB  '                                        + #13 +
      'WHERE '                                                                                                    + #13 +
      '       ((OP.VENCOPERACAO >= TO_DATE( ' + sDataCota + ', ''dd/mm/yyyy'')) OR (OP.VENCOPERACAO IS NULL)) '   + #13 +
      '   AND HR.IDHISTRENFIX IN '                                                                                + #13 +
      '       ( '                                                                                                 + #13 +
      '       SELECT '                                                                                            + #13 +
      '          MAX(H1.IDHISTRENFIX) '                                                                           + #13 +
      '       FROM '                                                                                              + #13 +
      '          HISTRENFIX H1 '                                                                                  + #13 +
      '       WHERE '                                                                                             + #13 +
      '          (H1.DATAHISTRENFIX || H1.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN '    + #13 +
      '          ( '                                                                                              + #13 +
      '          SELECT '                                                                                         + #13 +
      '             MAX(H2.DATAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC ' + #13 +
      '          FROM '                                                                                           + #13 +
      '             HISTRENFIX H2 '                                                                               + #13 +
      '          WHERE '                                                                                          + #13 +
      '             H2.DATAHISTRENFIX <= TO_DATE( ' + sDataCota + ', ''dd/mm/yyyy'') '                            + #13 +
      '          GROUP BY '                                                                                       + #13 +
      '             H2.IDPLANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC '                               + #13 +
      '          ) '                                                                                              + #13 +
      '       GROUP BY '                                                                                          + #13 +
      '          H1.DATAHISTRENFIX, H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC '               + #13 +
      '       ) '                                                                                                 + #13 +

      '   AND HR.IDINVESTIMENTO     = INV.IDINVESTIMENTO '                                                        + #13 +
      '   AND PA.IDPLANOPREV        = PPC.IDPLANOPREV '                                                           + #13 +
      '   AND PA.IDPATRO            = PTR.IDPESSOA '                                                              + #13 +
      '   AND HR.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                                         + #13 +
      '   AND HR.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                                      + #13 +
      '   AND HR.IDOPERRENFIXAPLIC  = OP.IDOPERRENFIX '                                                           + #13 +
      '   AND HR.SALDOQTDHISTRENFI  > 0 '                                                                         + #13 +
      '   AND HR.IDHISTRENFIX       = HIP.IDHISTRENFIX(+) '                                                       + #13 +
      '   AND HR.IDHISTRENFIX       = HIB.IDHISTRENFIX(+) '                                                       + #13 +
      'GROUP BY '                                                                                                 + #13 +
      '   INV.DESCINVESTIMENTO, PPC.NOME, PTR.NOME, '                                                             + #13 +
      '   HR.DATAHISTRENFIX, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA '                                         + #13 +
      'HAVING '                                                                                                   + #13 +
      '   SUM((NVL(HR.SALDOVLRHISTRENFI,0) + NVL(HIP.PUACUITEM,0) + NVL(HIB.PUACUITEM,0))) <> 0 '                 + #13 +
      'ORDER BY '                                                                                                 + #13 +
      '   A1.IDATIVOCOTA, PA.IDPLANOPREV, PA.IDPATRO, HR.DATAHISTRENFIX ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda Variável
      ttRV: Result :=
      'SELECT '                                                                           + #13 +   
      '   H1.DATAMOVCARTINV AS DATA, '                                                    + #13 +
      '   PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, A1.IDATIVOCOTA, '                        + #13 +
      '   INV.DESCINVESTIMENTO AS NOMEATIVO, PPC.NOME AS NOMEPLANO, '                     + #13 +
      '   PTR.NOME AS NOMEPATRO, '                                                        + #13 +
      '   SUM(H1.SALDOVLRINVCART) AS SALDO '                                              + #13 +

      'FROM '                                                                             + #13 +
      '   HISTCARTINV          H1,  '                                                     + #13 +
      '   ATIVOCOTA            A1,  '                                                     + #13 +
      '   INVESTIMENTO         INV, '                                                     + #13 +                         
      '   PLANPREVCONTABIL     PPC, '                                                     + #13 +                         
      '   PESSOA               PTR, '                                                     + #13 +                         
      '   PLANPREVCONTABPATRO  PA   '                                                     + #13 +

      'WHERE '                                                                            + #13 +
      '       H1.IDTIPOINVEST       = 2 '                                                 + #13 +
      '   AND H1.IDCARTEIRAGERENC   IS NULL '                                             + #13 +
      '   AND H1.IDHISTCARTINV      IN '                                                  + #13 +
      '       ( '                                                                         + #13 +
      '       SELECT '                                                                    + #13 +
      '          MAX(H2.IDHISTCARTINV) '                                                  + #13 +
      '       FROM '                                                                      + #13 +
      '          HISTCARTINV H2 '                                                         + #13 +
      '       WHERE '                                                                     + #13 +
      '              (H2.IDTIPOINVEST     = 2) '                                          + #13 +
      '          AND (H2.IDCARTEIRAGERENC IS NULL) '                                      + #13 +

      '          AND (H2.DATAMOVCARTINV || H2.IDPLANPREVCTBPATR || H2.IDCARTEIRAINVEST || H2.IDINVESTIMENTO ) IN '         + #13 +
      '              ( '                                                                                                   + #13 +
      '              SELECT '                                                                                              + #13 +
      '                 (MAX(H3.DATAMOVCARTINV) || H3.IDPLANPREVCTBPATR || H3.IDCARTEIRAINVEST || H3.IDINVESTIMENTO ) '    + #13 +
      '              FROM '                                                                                                + #13 +
      '                 HISTCARTINV H3 '                                                                                   + #13 +
      '              WHERE '                                                                                               + #13 +
      '                     (H3.IDTIPOINVEST     = 2) '                                                                    + #13 +
      '                 AND (H3.IDCARTEIRAGERENC IS NULL) '                                                                + #13 +
      '                 AND (H3.DATAMOVCARTINV   <= TO_DATE( ' + sDataCota + ', ''dd/mm/yyyy'')) '                         + #13 +
      '              GROUP BY '                                                                                            + #13 +
      '                 H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO '                                     + #13 +
      '              ) '                                                                                                   + #13 +

      '       GROUP BY '                                                                  + #13 +
      '          H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO '           + #13 +
      '       ) '                                                                         + #13 +

      '   AND H1.IDINVESTIMENTO              = INV.IDINVESTIMENTO '                       + #13 +
      '   AND PA.IDPLANOPREV                 = PPC.IDPLANOPREV '                          + #13 +
      '   AND PA.IDPATRO                     = PTR.IDPESSOA '                             + #13 +
      '   AND (NVL(H1.SALDOQTDEINVCART, 0)  <> 0) '                                       + #13 +
      '   AND (H1.IDINVESTIMENTO             = A1.IDINVESTIMENTO) '                       + #13 +
      '   AND (H1.IDPLANPREVCTBPATR          = PA.IDPLANPREVCTBPATR) '                    + #13 +

      'GROUP BY '                                                                         + #13 +
      '   INV.DESCINVESTIMENTO, PPC.NOME, PTR.NOME, '                                     + #13 +
      '   H1.DATAMOVCARTINV, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA '                 + #13 +

      'HAVING '                                                                           + #13 +
      '   SUM(H1.SALDOVLRINVCART) <> 0 ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttBMF: Result := '';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRF: Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, '                  + #13 +
      '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
      '   A1.IDATIVOCOTA, SUM(H1.SALDOVLRFUNDO) AS SALDO '                                   + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO           H1,  '                                                         + #13 +
      //AL_9
      '       ( '                                                                            + #13 +
      '       SELECT '                                                                       + #13 +
      '          MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '       FROM '                                                                         + #13 +
      '          HISTFUNDO H2, ATIVOCOTA A2  '                                               + #13 +
      '       WHERE '                                                                        + #13 +
      '              H2.IDTIPOINVEST  = 5 '                                                  + #13 +
      '          AND H2.IDPLANPREVCTBPATR > 0 '                                              + #13 +
      '          AND H2.IDFUNDOINVEST     > 0 '                                              + #13 +
      '          AND H2.DATAMOVFUNDO = TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '         + #13 +
      '          AND H2.TIPMOVFUNDO  <> ''PIR'' '                                            + #13 +
      '          AND H2.IDFUNDOINVEST = A2.IDFUNDOINVEST '                                   + #13 +
      '       GROUP BY H2.IDTIPOINVEST, '                                                    + #13 +
      '          H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, H2.DATAAPLICACAO '                  + #13 +
      '       ) HM, '                                                                        + #13 +
      //AL_9
      '   ATIVOCOTA           A1,  '                                                         + #13 +
      '   FUNDOINVEST         FIN, '                                                         + #13 +
      '   PLANPREVCONTABIL    PPC, '                                                         + #13 +
      '   PESSOA              PTR, '                                                         + #13 +
      '   PLANPREVCONTABPATRO PA   '                                                         + #13 +

      'WHERE '                                                                               + #13 +
      '       H1.IDHISTFUNDO = H1.IDHISTFUNDO '                                              + #13 +

      '   AND H1.SALDOQTDCOTAS     > 0 '                                                     + #13 +
      '   AND H1.IDCOMPOSICAOFUNDO IS NULL '                                                 + #13 +

      '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
      '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
      '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   FIN.DESCFUNDOINVEST, PPC.NOME, PTR.NOME, '                                         + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA '                      + #13 +

      'HAVING '                                                                              + #13 +
      '   SUM(H1.SALDOVLRFUNDO) <> 0 '                                                       + #13 +

      'ORDER BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRV: Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, '                  + #13 +
      '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
      '   A1.IDATIVOCOTA, SUM(H1.SALDOVLRFUNDO) AS SALDO '                                   + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO           H1,  '                                                         + #13 +
      '   ATIVOCOTA           A1,  '                                                         + #13 +
      '   FUNDOINVEST         FIN, '                                                         + #13 +
      '   PLANPREVCONTABIL    PPC, '                                                         + #13 +
      '   PESSOA              PTR, '                                                         + #13 +
      '   PLANPREVCONTABPATRO PA   '                                                         + #13 +

      'WHERE '                                                                               + #13 +
      '       H1.IDHISTFUNDO IN '                                                            + #13 +
      '       ( '                                                                            + #13 +
      '       SELECT '                                                                       + #13 +
      '          MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '       FROM '                                                                         + #13 +
      '          HISTFUNDO H2, '                                                             + #13 +
      '          ATIVOCOTA A2  '                                                             + #13 +
      '       WHERE '                                                                        + #13 +
      '              H2.DATAMOVFUNDO <= TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '        + #13 +

      '          AND (H2.DATAMOVFUNDO || H2.IDPLANPREVCTBPATR || H2.IDFUNDOINVEST || H2.DATAAPLICACAO) IN '       + #13 +
      '              ( '                                                                                          + #13 +
      '              SELECT '                                                                                     + #13 +
      '                 MAX(H3.DATAMOVFUNDO) || H3.IDPLANPREVCTBPATR || H3.IDFUNDOINVEST || H3.DATAAPLICACAO '    + #13 +
      '              FROM '                                                                                       + #13 +
      '                 HISTFUNDO H3, '                                                                           + #13 +
      '                 ATIVOCOTA A3  '                                                                           + #13 +
      '              WHERE '                                                                                      + #13 +
      '                     H3.DATAMOVFUNDO  <= TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '                     + #13 +
      '                 AND H3.IDTIPOINVEST   = 6 '                                                               + #13 +
      '                 AND H3.TIPMOVFUNDO   <> ''PIR'' '                                                         + #13 +
      '                 AND H3.IDFUNDOINVEST  = A3.IDFUNDOINVEST '                                                + #13 +
      '              GROUP BY '                                                                                   + #13 +
      '                 H3.IDPLANPREVCTBPATR, H3.IDFUNDOINVEST, H3.DATAAPLICACAO '                                + #13 +
      '              ) '                                                                                          + #13 +

      '          AND H2.IDTIPOINVEST  = 6 '                                                  + #13 +
      '          AND H2.TIPMOVFUNDO  <> ''PIR'' '                                            + #13 +
      '          AND H2.IDFUNDOINVEST = A2.IDFUNDOINVEST '                                   + #13 +
      '       GROUP BY '                                                                     + #13 +
      '          H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, H2.DATAAPLICACAO '                  + #13 +
      '       ) '                                                                            + #13 +

      '   AND H1.SALDOQTDCOTAS     > 0 '                                                     + #13 +
      '   AND H1.IDCOMPOSICAOFUNDO IS NULL '                                                 + #13 +

      '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
      '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
      '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   FIN.DESCFUNDOINVEST, PPC.NOME, PTR.NOME, '                                         + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA '                      + #13 +

      'HAVING '                                                                              + #13 +
      '   SUM(H1.SALDOVLRFUNDO) <> 0 '                                                       + #13 +

      'ORDER BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoImob: Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, '                  + #13 +
      '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
      '   A1.IDATIVOCOTA, SUM(H1.SALDOVLRFUNDO) AS SALDO '                                   + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO           H1,  '                                                         + #13 +
      '   ATIVOCOTA           A1,  '                                                         + #13 +
      '   FUNDOINVEST         FIN, '                                                         + #13 +
      '   PLANPREVCONTABIL    PPC, '                                                         + #13 +
      '   PESSOA              PTR, '                                                         + #13 +
      '   PLANPREVCONTABPATRO PA   '                                                         + #13 +

      'WHERE '                                                                               + #13 +
      '       H1.IDHISTFUNDO IN '                                                            + #13 +
      '       ( '                                                                            + #13 +
      '       SELECT '                                                                       + #13 +
      '          MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '       FROM '                                                                         + #13 +
      '          HISTFUNDO H2, '                                                             + #13 +
      '          ATIVOCOTA A2  '                                                             + #13 +
      '       WHERE '                                                                        + #13 +
      '              H2.DATAMOVFUNDO <= TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '        + #13 +

      '          AND (H2.DATAMOVFUNDO || H2.IDPLANPREVCTBPATR || H2.IDFUNDOINVEST || H2.DATAAPLICACAO) IN '       + #13 +
      '              ( '                                                                                          + #13 +
      '              SELECT '                                                                                     + #13 +
      '                 MAX(H3.DATAMOVFUNDO) || H3.IDPLANPREVCTBPATR || H3.IDFUNDOINVEST || H3.DATAAPLICACAO '    + #13 +
      '              FROM '                                                                                       + #13 +
      '                 HISTFUNDO H3, '                                                                           + #13 +
      '                 ATIVOCOTA A3  '                                                                           + #13 +
      '              WHERE '                                                                                      + #13 +
      '                     H3.DATAMOVFUNDO  <= TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '                     + #13 +
      '                 AND H3.IDTIPOINVEST   = 7 '                                                               + #13 +
      '                 AND H3.TIPMOVFUNDO   <> ''PIR'' '                                                         + #13 +
      '                 AND H3.IDFUNDOINVEST  = A3.IDFUNDOINVEST '                                                + #13 +
      '              GROUP BY '                                                                                   + #13 +
      '                 H3.IDPLANPREVCTBPATR, H3.IDFUNDOINVEST, H3.DATAAPLICACAO '                                + #13 +
      '              ) '                                                                                          + #13 +

      '          AND H2.IDTIPOINVEST  = 7 '                                                  + #13 +
      '          AND H2.TIPMOVFUNDO  <> ''PIR'' '                                            + #13 +
      '          AND H2.IDFUNDOINVEST = A2.IDFUNDOINVEST '                                   + #13 +
      '       GROUP BY '                                                                     + #13 +
      '          H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, H2.DATAAPLICACAO '                  + #13 +
      '       ) '                                                                            + #13 +

      '   AND H1.SALDOQTDCOTAS     > 0 '                                                     + #13 +
      '   AND H1.IDCOMPOSICAOFUNDO IS NULL '                                                 + #13 +

      '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
      '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
      '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   FIN.DESCFUNDOINVEST, PPC.NOME, PTR.NOME, '                                         + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA '                      + #13 +

      'HAVING '                                                                              + #13 +
      '   SUM(H1.SALDOVLRFUNDO) <> 0 '                                                       + #13 +

      'ORDER BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoDIC: Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, '                  + #13 +
      '   FIN.DESCFUNDOINVEST AS NOMEATIVO, PPC.NOME AS NOMEPLANO, PTR.NOME AS NOMEPATRO, '  + #13 +
      '   A1.IDATIVOCOTA, SUM(H1.SALDOVLRFUNDO) AS SALDO '                                   + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO           H1,  '                                                         + #13 +
      '   ATIVOCOTA           A1,  '                                                         + #13 +
      '   FUNDOINVEST         FIN, '                                                         + #13 +
      '   PLANPREVCONTABIL    PPC, '                                                         + #13 +
      '   PESSOA              PTR, '                                                         + #13 +
      '   PLANPREVCONTABPATRO PA   '                                                         + #13 +

      'WHERE '                                                                               + #13 +
      '       H1.IDHISTFUNDO IN '                                                            + #13 +
      '       ( '                                                                            + #13 +
      '       SELECT '                                                                       + #13 +
      '          MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '       FROM '                                                                         + #13 +
      '          HISTFUNDO H2, '                                                             + #13 +
      '          ATIVOCOTA A2  '                                                             + #13 +
      '       WHERE '                                                                        + #13 +
      '              H2.DATAMOVFUNDO <= TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '        + #13 +

      '          AND (H2.DATAMOVFUNDO || H2.IDPLANPREVCTBPATR || H2.IDFUNDOINVEST || H2.DATAAPLICACAO) IN '       + #13 +
      '              ( '                                                                                          + #13 +
      '              SELECT '                                                                                     + #13 +
      '                 MAX(H3.DATAMOVFUNDO) || H3.IDPLANPREVCTBPATR || H3.IDFUNDOINVEST || H3.DATAAPLICACAO '    + #13 +
      '              FROM '                                                                                       + #13 +
      '                 HISTFUNDO H3, '                                                                           + #13 +
      '                 ATIVOCOTA A3  '                                                                           + #13 +
      '              WHERE '                                                                                      + #13 +
      '                     H3.DATAMOVFUNDO  <= TO_DATE( ' + sDataCota + ', ''DD/MM/YYYY'') '                     + #13 +
      '                 AND H3.IDTIPOINVEST   = 9 '                                                               + #13 +
      '                 AND H3.TIPMOVFUNDO   <> ''PIR'' '                                                         + #13 +
      '                 AND H3.IDFUNDOINVEST  = A3.IDFUNDOINVEST '                                                + #13 +
      '              GROUP BY '                                                                                   + #13 +
      '                 H3.IDPLANPREVCTBPATR, H3.IDFUNDOINVEST, H3.DATAAPLICACAO '                                + #13 +
      '              ) '                                                                                          + #13 +

      '          AND H2.IDTIPOINVEST  = 9 '                                                  + #13 +
      '          AND H2.TIPMOVFUNDO  <> ''PIR'' '                                            + #13 +
      '          AND H2.IDFUNDOINVEST = A2.IDFUNDOINVEST '                                   + #13 +
      '       GROUP BY '                                                                     + #13 +
      '          H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, H2.DATAAPLICACAO '                  + #13 +
      '       ) '                                                                            + #13 +

      '   AND H1.SALDOQTDCOTAS     > 0 '                                                     + #13 +
      '   AND H1.IDCOMPOSICAOFUNDO IS NULL '                                                 + #13 +

      '   AND H1.IDFUNDOINVEST     = FIN.IDFUNDOINVEST '                                     + #13 +
      '   AND PA.IDPLANOPREV       = PPC.IDPLANOPREV '                                       + #13 +
      '   AND PA.IDPATRO           = PTR.IDPESSOA '                                          + #13 +

      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   FIN.DESCFUNDOINVEST, PPC.NOME, PTR.NOME, '                                         + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA '                      + #13 +

      'HAVING '                                                                              + #13 +
      '   SUM(H1.SALDOVLRFUNDO) <> 0 '                                                       + #13 +

      'ORDER BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO ';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
   end;
end;



function TCtrlCotaCotacao.CalculaCotas(const IDAtivo           : Integer;
                                       const IDPlano           : Integer;
                                       const IDPatro           : Integer;
                                       const dDataFechamento   : TDateTime;
                                       const dDataFim          : TDateTime;
                                       const TipoCota          : tTipoCota): Boolean;
var
   dDataAtual        : TDateTime;
   dDataAnt          : TDateTime;
   sSQL              : String;
   cdsMovimento      : TCMClientDataSet;
   rCotacao          : tCotacao;
   rCotacaoAnterior  : tCotacao;
   iNumeroModulo     : Integer;

   dDataIni          : TDateTime;
   bCalcula          : Boolean;
   CdsMovAnt: TCMClientDataSet;
   //AL_7
   cdsFluxoMov: TCMClientDataSet;

begin
   case TipoCota of
      ttHstMovCota:  iNumeroModulo := 1;
      ttEmprestimo:  iNumeroModulo := 2;
      ttImobiliario: iNumeroModulo := 3;
      ttRF:          iNumeroModulo := 4;
      ttRV:          iNumeroModulo := 5;
      ttBMF:         iNumeroModulo := 6;
      ttFundoRF:     iNumeroModulo := 7;
      ttFundoRV:     iNumeroModulo := 8;
      ttFundoImob:   iNumeroModulo := 9;
      ttFundoDIC:    iNumeroModulo := 10;
   end;

   // ----------------------------------------------------------------------------------------------
   // Busca a ultima cota calculada anterior ou igual ao último fechamento e retorna para um
   // registro (data, quant, valor, patrimonio)
   // ----------------------------------------------------------------------------------------------
   rCotacaoAnterior := CotaAnterior(IDAtivo,
                                    IDPlano,
                                    IDPatro,
                                    dDataFechamento
                                   );
   // ----------------------------------------------------------------------------------------------

   try
      //AL_6 - Devem ser criados dentro do bloco Try
      cdsMovimento := TCMClientDataSet.Create(nil);
      CdsMovAnt    := TCMClientDataSet.Create(nil);
      //AL_7
      cdsFluxoMov  := TCMClientDataSet.Create(nil);
      // -------------------------------------------------------------------------------------------
      // Seleciona as movimentações do (Ativos + Plano + Patro), agrupando por (data + tipo (R, C)),
      // ordenado por (data + C, R))
      // -------------------------------------------------------------------------------------------
      sSQL := MontaSQLMovimento(IDAtivo,
                                IDPlano,
                                IDPatro,
                                dDataFechamento,
                                dDataFim,
                                TipoCota);

      cdsMovimento.Data := GetDataPacket(sSQL);
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // Itera pela seleção acima
      // -------------------------------------------------------------------------------------------
      if not(cdsMovimento.IsEmpty) then
      begin

         try
            rCotacaoAnterior.fVlrCotizado      := 0;
            rCotacaoAnterior.fVlrRentabilizado := 0;

            dDataIni := 0;

            //AL_6
            // Antes de Processar as cotas é necessário preparar o Cds, jogando os
            //    valores Cotizados ou Rentabilizados em dias não úteis para o próximo dia útil imediatamente seguinte.
            // O próximo registro de movimento pode não ser no próximo dia conseguinte.
            // Ex. Poupança bloqueada
            //     Movimento no sábado dia 19/08/2006 - Deve ser jogado para o dia 21/08/2008,
            //       porém o próximo movimento registrado no investimento é uma Transferência em 01/09/2006

            if CtrlParamCota.FlgDiaUtil then
            begin
               // Capta um "Clone" do cds de movimento
               CdsMovAnt.Data := cdsMovimento.Data;

               // Utiliza este "Clone" para localizar os movimentos em datas indevidas
               CdsMovAnt.First;
               while not CdsMovAnt.Eof do
               begin
                  //Se o Movimento é em dia não útil
                  //AL_8
                  if not DiasUteis.DiaUtil(Sistema.IDEmpresa,CdsMovAnt.FieldByName('DATA').AsDateTime,True,False,False) then
                  begin
                     //Capta o próximo dia útil
                     dDataAtual := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa, CdsMovAnt.FieldByName('DATA').AsDateTime,True,True,False);

                     //Insere mais um movimento deste valor no dia útil posterior;
                     cdsMovimento.Insert;
                     cdsMovimento.FieldByName('DATA').AsDateTime       := dDataAtual;
                     cdsMovimento.FieldByName('IDPLANO').AsInteger     := CdsMovAnt.FieldByName('IDPLANO').AsInteger;
                     cdsMovimento.FieldByName('IDPATRO').AsInteger     := CdsMovAnt.FieldByName('IDPATRO').AsInteger;
                     cdsMovimento.FieldByName('IDATIVOCOTA').AsInteger := CdsMovAnt.FieldByName('IDATIVOCOTA').AsInteger;
                     cdsMovimento.FieldByName('FLGCOTA').AsString      := CdsMovAnt.FieldByName('FLGCOTA').AsString;
                     cdsMovimento.FieldByName('VALOR').AsFloat         := CdsMovAnt.FieldByName('VALOR').AsFloat;
                     cdsMovimento.Post;

                     //Exclui todas as movimentações para esta data não útil já na primeira passagem
                     while cdsMovimento.Locate('DATA', CdsMovAnt.FieldByName('DATA').AsDateTime, []) do
                        cdsMovimento.Delete;
                  end;

                  CdsMovAnt.Next;

               end;
            end;

            cdsMovimento.First;
            while not(cdsMovimento.EOF) do
            begin
               dDataAnt := cdsMovimento.FieldByName('DATA').AsDateTime;

               //AL_8
               if ((not DiasUteis.DiaUtil(Sistema.IDEmpresa,dDataAnt,True,False,False)) and
                   (dDataIni = 0) and
                   (CtrlParamCota.FlgDiaUtil) and
                   (dDataAnt <> CtrlParamCota.DtPrimeira)) then
               begin
                    dDataIni := dDataAnt;
               end;

               if cdsMovimento.FieldByName('FLGCOTA').AsString = 'C' then
                  rCotacaoAnterior.fVlrCotizado := rCotacaoAnterior.fVlrCotizado + cdsMovimento.FieldByName('VALOR').AsFloat;

               if cdsMovimento.FieldByName('FLGCOTA').AsString = 'R' then
                  rCotacaoAnterior.fVlrRentabilizado := rCotacaoAnterior.fVlrRentabilizado + cdsMovimento.FieldByName('VALOR').AsFloat;

               if dDataIni <> 0 then
               begin
                  //AL_8
                  if DiasUteis.DiaUtil(Sistema.IDEmpresa,dDataAnt,True,False,False) then
                      bCalcula := True
                  else
                      bCalcula := False;
               end
               else
                   bCalcula := True;

               // ----------------------------------------------------------------------------------
               // Calcula a cota resultante de cada movimentação, guardando o resultado no registro
               // ----------------------------------------------------------------------------------

               cdsMovimento.Next;

               if not(cdsMovimento.EOF) then
               begin
                  dDataAtual  := cdsMovimento.FieldByName('DATA').AsDateTime;
               end
               else
               begin
                  dDataAtual  := 0;
               end;

               // ----------------------------------------------------------------------------------
               // A cada dia, descarrega o registro na tabela de cotas
               // ----------------------------------------------------------------------------------
               if ((dDataAtual <> dDataAnt) and
                   (bCalcula)) then // bCalcula - para não gravar cota em dia não útil.
               begin
                    rCotacao         := CalculaValorCota(rCotacaoAnterior,dDataAnt);
                    rCotacao.iOrigem := iNumeroModulo;

                    if dDataIni = 0 then
                        rCotacao.dDataIni := rCotacao.dData
                    else
                        rCotacao.dDataIni := dDataIni;

                    rCotacaoAnterior := rCotacao;

                    //AL_7
                    // Capta o Fluxo desta cota
                    sSQL := MontaSQLFluxoCota(IDAtivo, IDPlano, IDPatro, dDataAnt, TipoCota);
                    cdsFluxoMov.Data := GetDataPacket(sSQL);

                    // Passa o cds de fluxo para atualização no momento da gravação da cota
                    GravaCota(rCotacao, cdsFluxoMov);
                    //AL_7 - Fim

                    dDataIni                           := 0;
                    rCotacaoAnterior.fVlrCotizado      := 0;
                    rCotacaoAnterior.fVlrRentabilizado := 0;
                    rCotacaoAnterior.bPrimeiraCota     := False;
               end;
            end;

            //AL_2 - Se existiu um dia "inútil" que não foi calculado (No último dia do relatório)
            if not bCalcula then
            begin
               // Cotiza o dia no próximo dia útil
               //AL_8
               while not DiasUteis.DiaUtil(Sistema.IDEmpresa, dDataAnt,True,False,False) do
                  dDataAnt := dDataAnt + 1;

               rCotacao         := CalculaValorCota(rCotacaoAnterior,dDataAnt);
               rCotacao.iOrigem := iNumeroModulo;

               if dDataIni = 0 then
                   rCotacao.dDataIni := rCotacao.dData
               else
                   rCotacao.dDataIni := dDataIni;

               rCotacaoAnterior := rCotacao;

               //AL_7
               // Capta o Fluxo desta cota
               sSQL := MontaSQLFluxoCota(IDAtivo, IDPlano, IDPatro, dDataAnt, TipoCota);
               cdsFluxoMov.Data := GetDataPacket(sSQL);

               // Passa o cds de fluxo para atualização no momento da gravação da cota
               GravaCota(rCotacao, cdsFluxoMov);
               //AL_7 - Fim


            end;

            Result := True;

         except
            Result := False;
            Exit;
         end;
      end
      else
      begin
         Result := True;
      end;
      // -------------------------------------------------------------------------------------------
   finally
      FreeAndNil(cdsMovimento);
      //AL_6
      FreeAndNil(CdsMovAnt);
      //AL_7
      FreeAndNil(cdsFluxoMov);
   end;
end;


function TCtrlCotaCotacao.CalculaValorCota(const rCotacao : TCotacao;
                                           const dData    : TDateTime
                                          ): TCotacao;
var
   rCotacaoNova         : TCotacao;
   fNovaCota            : Extended;
   fNovaQuantidade      : Extended;
   fNovoPatrimonio      : Extended;

begin

   rCotacaoNova.IDAtivo           := rCotacao.IDAtivo;
   rCotacaoNova.IDPlano           := rCotacao.IDPlano;
   rCotacaoNova.IDPatro           := rCotacao.IDPatro;
   rCotacaoNova.dData             := dData;
   rCotacaoNova.Periodo           := StrToInt(FormatDateTime('mm', dData));
   rCotacaoNova.Exercicio         := StrToInt(FormatDateTime('yyyy', dData));
   rCotacaoNova.fVlrCotizado      := rCotacao.fVlrCotizado;
   rCotacaoNova.fVlrRentabilizado := rCotacao.fVlrRentabilizado;
   rCotacaoNova.bPrimeiraCota     := rCotacao.bPrimeiraCota;


   if rCotacao.bPrimeiraCota then
   begin
      fNovaCota := CtrlParamCota.VlrPrimeira;
      fNovoPatrimonio := rCotacaoNova.fVlrCotizado + rCotacaoNova.fVlrRentabilizado;
      fNovaQuantidade := fNovoPatrimonio / fNovaCota;
   end
   else
   if CtrlParamCota.FlgCotizaDataAnt then
   begin
      {*** Cotizando Fluxo ***}
      fNovoPatrimonio := RoundCM((rCotacao.fVlrPatrimonio + rCotacaoNova.fVlrCotizado),2);
      fNovaCota       := rCotacao.fVlrCota;

      if fNovaCota = 0 then
         fNovaQuantidade := 0
      else
         fNovaQuantidade := fNovoPatrimonio / fNovaCota;

      {*** Novo Valor da Cota ***}
      fNovoPatrimonio := RoundCM((fNovoPatrimonio + rCotacaoNova.fVlrRentabilizado),2);

      if fNovaQuantidade = 0 then
         fNovaCota := 0
      else
         fNovaCota := fNovoPatrimonio / fNovaQuantidade;
   end
   else
   begin
      {*** Novo Valor da Cota ***}
      fNovoPatrimonio := rCotacao.fVlrPatrimonio + rCotacaoNova.fVlrRentabilizado;
      fNovaQuantidade := rCotacao.fQtdCotas;

      if fNovaQuantidade = 0 then
         fNovaCota := 0
      else
         fNovaCota := fNovoPatrimonio / fNovaQuantidade;

      {*** Cotizando Fluxo ***}
      fNovoPatrimonio := rCotacao.fVlrPatrimonio + rCotacaoNova.fVlrCotizado;
      fNovaCota       := rCotacao.fVlrCota;

      if rCotacao.bPrimeiraCota then
         fNovaCota := CtrlParamCota.VlrPrimeira;

      if fNovaCota = 0 then
         fNovaQuantidade := 0
      else
         fNovaQuantidade := fNovoPatrimonio / fNovaCota;
   end;

   rCotacaoNova.fQtdCotas      := fNovaQuantidade;
   rCotacaoNova.fVlrCota       := fNovaCota;
   rCotacaoNova.fVlrPatrimonio := fNovoPatrimonio;

   Result := rCotacaoNova;
end;

function TCtrlCotaCotacao.MontaSQLMovimento(const IDAtivo           : Integer;
                                            const IDPlano           : Integer;
                                            const IDPatro           : Integer;
                                            const dDataFechamento   : TDateTime;
                                            const dDataFim          : TDateTime;
                                            const TipoCota          : tTipoCota): String;
var
   sDataFechamento   : String;
   sDataFim          : String;
begin
   // ----------------------------------------------------------------------------------------------
   // Seleciona as movimentações do (Ativos + Plano + Patro), agrupando por (data + tipo (R, C)),
   // ordenado por (data + C, R))
   // ----------------------------------------------------------------------------------------------

   sDataFechamento   := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFechamento));
   sDataFim          := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim));

   case TipoCota of
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttHstMovCota: begin
      Result :=
      'SELECT '                                                                                 + #13 +
      '   HST.IDATIVOCOTA, HST.IDPLANOPREV AS IDPLANO, HST.IDPATRO, '                           + #13 +
      '   HST.DATA, '                                                                           + #13 +
      '   SUM(DECODE(CTO.RECDES, ''R'', HST.VALOR, ''D'', (HST.VALOR * (-1)), 0)) AS VALOR, '   + #13 +
      '   CTO.FLGCOTA '                                                                         + #13 +
      'FROM '                                                                                   + #13 +
      '   HSTMOVCOTA   HST, '                                                                   + #13 +
      '   COTATIPOOPER CTO  '                                                                   + #13 +
      'WHERE '                                                                                  + #13 +
      '       HST.IDATIVOCOTA    = ' + FormatFloat('#0', IDAtivo)                               + #13 +
      '   AND HST.IDPLANOPREV    = ' + FormatFloat('#0', IDPlano)                               + #13 +
      '   AND HST.IDPATRO        = ' + FormatFloat('#0', IDPatro)                               + #13 +

      '   AND DATA BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '                   +
      '                AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '                   + #13 +

      '   AND HST.IDCOTATIPOOPER = CTO.IDCOTATIPOOPER '                                         + #13 +
      'GROUP BY '                                                                               + #13 +
      '   HST.IDATIVOCOTA, HST.IDPLANOPREV, HST.IDPATRO, HST.DATA, TP.FLGMOVCOTA '              + #13 +
      'ORDER BY '                                                                               + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '    HST.DATA, TP.FLGMOVCOTA '
      else
         Result := Result + '    HST.DATA, TP.FLGMOVCOTA DESC ';
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttEmprestimo: begin
      Result :=
      'SELECT '                                                                                       + #13 +
      '   ATC.IDATIVOCOTA, CON.IDPLANOORIGEM AS IDPLANO, CON.IDPATRO, '                               + #13 +
      '   HME.HMEDATAPREVISTA AS DATA, ITC.FLGMOVCOTA AS FLGCOTA, '                                   + #13 +

      '   SUM(DECODE(ITC.ITCEVENTO, 0, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
      '                             1, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
      '                             2, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
      '                             3, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
      '                             4, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
      '                             5, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
      '                             6, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
      '                             7, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
      '                             8, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
      '                                NVL(HME.HMEVLRPREVISTO, 0) '                                   + #13 +
      '             ) '                                                                               + #13 +
      '      ) AS VALOR '                                                                             + #13 +

      'FROM '                                                                                         + #13 +
      '   ATIVOCOTA       ATC, '                                                                      + #13 +
      '   HISTMOVEMPTMO   HME, '                                                                      + #13 +
      '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
      '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
      '   TIPOEMPTMO      TEP, '                                                                      + #13 +
      '   ITEMXTIPOCONTR  ITC  '                                                                      + #13 +

      'WHERE '                                                                                        + #13 +
      '       TEP.IDEMPRESAPROP        = ' + FormatFloat('#0', Sistema.IDEmpresa)                     + #13 +
      '   AND CON.FLGSITUACAO          <> ''C'' '                                                     + #13 +

      '   AND ATC.IDATIVOCOTA          = ' + FormatFloat('#0', IDAtivo)                               + #13 +
      '   AND CON.IDPLANOORIGEM        = ' + FormatFloat('#0', IDPlano)                               + #13 +
      '   AND CON.IDPATRO              = ' + FormatFloat('#0', IDPatro)                               + #13 +

      '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
      '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13 +
      '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +

      '   AND ITC.FLGMOVCOTA           IN (''C'', ''R'') '                                            + #13 +

      '   AND HME.HMEDATAPREVISTA      BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '     +
                                         ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '     + #13 +

      '   AND ATC.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                       + #13 +
      '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
      '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                           + #13 +
      '   AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                           + #13 +
      '   AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                      + #13 +

      'GROUP BY '                                                                                     + #13 +
      '   ATC.IDATIVOCOTA, CON.IDPLANOORIGEM, CON.IDPATRO, ATC.IDATIVOCOTA, '                         + #13 +
      '   HME.HMEDATAPREVISTA, ITC.FLGMOVCOTA '                                                       + #13 +

      'ORDER BY '                                                                                     + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   HME.HMEDATAPREVISTA, ITC.FLGMOVCOTA '
      else
         Result := Result + '   HME.HMEDATAPREVISTA, ITC.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttImobiliario: begin
      //AL_5 - Ini - Fazer igual a uCtrlHstMovCota linha 1235 rotina MovCotaAtivoImobiliario
      Result :=
      'SELECT '                                                                           + #13 +
      '   A.IDATIVOCOTA, '                                                                + #13 +
      '   DECODE(FT.IDPLANOPREV, NULL, PG.IDPLANOPREV, FT.IDPLANOPREV ) AS IDPLANO, '     + #13 +
      '   DECODE(FT.IDPATRO, NULL, PG.IDPATRO, FT.IDPATRO ) AS IDPATRO, '                 + #13 +
      '   RM.DATABAIXA  AS DATA, '                                                        + #13 +
      '   RM.FLGMOVCOTA AS FLGCOTA, '                                                     + #13 +
      '   NVL(ROUND(SUM(DECODE(NVL(FT.FATOR, 0), '                                                 + #13 +
      '                        0, (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0)), '               + #13 +
      '                           (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0)) * FT.FATOR) '    + #13 +
      '            ), '                                                                            + #13 +
      '       2), 0) AS VALOR '                                                                    + #13 +

      'FROM '                                                                             + #13 +
      '   IMOVEL      I, '                                                                + #13 +
      '   ATIVOCOTA   A, '                                                                + #13 +
      '   PARAMGLOBAL PG, '                                                               + #13 +
      '   ( '                                                                             + #13 +
      '   SELECT '                                                                        + #13 +
      '      I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA, '                                   + #13 +

      '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) AS TOT_RECEBIDO, '     + #13 +
      '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) AS TOT_PAGO '          + #13 +

      '   FROM '                                                                          + #13 +
      '      DOCUMENTO         D, '                                                       + #13 +
      '      LANCTODOCUM       LD, '                                                      + #13 +
      '      LANCAMENTOSIMOVEL LI, '                                                      + #13 +
      '      IMOVEL            I, '                                                       + #13 +
      '      RECBTOPAGTO       RP, '                                                      + #13 +
      '      TIPOCUSTORECIMOV  TC, '                                                      + #13 +
      '      ( '                                                                          + #13 +
      '      SELECT '                                                                     + #13 +
      '         CODDOCUMENTO, VALOR '                                                     + #13 +
      '      FROM '                                                                       + #13 +
      '         LANCTODOCUM '                                                             + #13 +
      '      WHERE '                                                                      + #13 +
      '         RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) '                    + #13 +
      '      ) TR1 '                                                                      + #13 +
      '   WHERE '                                                                         + #13 +
      '          D.CODDOCUMENTO       = LI.CODDOCUMENTO '                                 + #13 +
      '      AND D.CODDOCUMENTO       = LD.CODDOCUMENTO '                                 + #13 +
      '      AND D.CODDOCUMENTO       = TR1.CODDOCUMENTO '                                + #13 +
      '      AND LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO '                            + #13 +
      '      AND D.CODDOCUMENTO       = RP.CODDOCUMENTO(+) '                              + #13 +
      '      AND LI.IDIMOVEL          = I.IDIMOVEL '                                      + #13 +

      '      AND TC.FLGMOVCOTA        IN (''R'', ''C'') '                                 + #13 +

      '      AND RP.DATABAIXA         BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '   +
                                        ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '   + #13 +

      '   GROUP '                                                                         + #13 +
      '      BY I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA '                                 + #13 +
      '   ) RM, '                                                                         + #13 +

      '   ( ' + #13 +
      '    SELECT IM.IDIMOVEL, ' + #13 +
      '           DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) AS IDPATRO, ' + #13 +
      '           DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) AS IDPLANOPREV, ' + #13 +
      '           DECODE(NVL(TT.TOTAL,0), 0, 100, DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL )) AS FATOR ' + #13 +
      '    FROM ' + #13 +
      '      PLANOPATROXIMOVEL PI, IMOVEL IM, PARAMGLOBAL PG, ' + #13 +
      '     ( ' + #13 +
      '      SELECT ' + #13 +
      '        IDIMOVEL, SUM( NVL(PPIPERCENTRATEIO,0) ) AS TOTAL ' + #13 +
      '      FROM ' + #13 +
      '        PLANOPATROXIMOVEL ' + #13 +
      '      GROUP BY ' + #13 +
      '        IDIMOVEL ' + #13 +
      '     ) TT ' + #13 +
      '    WHERE ' + #13 +
      '          DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) = ' + FormatFloat('#0', IDPlano) + #13 +
      '      AND DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) = ' + FormatFloat('#0', IDPatro) + #13 +
      '      AND PI.IDIMOVEL = TT.IDIMOVEL(+) ' + #13 +
      '      AND IM.IDIMOVEL = PI.IDIMOVEL(+) ' + #13 +
      '      AND IM.IDPESSOA = PG.IDPESSOA '    + #13 +
      '      AND IM.FLGTIPOIMOVEL = 1 '         + #13 +
      '   ) FT ' + #13 +

      'WHERE '                                                                            + #13 +

      '       A.IDATIVOCOTA    = ' + FormatFloat('#0', IDAtivo)                           + #13 +
      '   AND I.IDIMOVEL       = A.IDIMOVEL '                                             + #13 +
      '   AND I.IDPESSOA       = PG.IDPESSOA '                                            + #13 +
      '   AND I.IDIMOVEL       = FT.IDIMOVEL '                                            + #13 +
      '   AND I.IDIMOVEL       = RM.IDIMOVEL '                                            + #13 +
      '   AND I.IDIMOVELMESTRE IS NOT NULL '                                              + #13 +
      '   AND I.FLGATIVO       = 1 '                                                      + #13 +

      'GROUP BY '                                                                         + #13 +
      '   A.IDATIVOCOTA, '                                                                + #13 +
      '   DECODE(FT.IDPLANOPREV, NULL, PG.IDPLANOPREV, FT.IDPLANOPREV ), '                + #13 +
      '   DECODE(FT.IDPATRO, NULL, PG.IDPATRO, FT.IDPATRO ), '                            + #13 +
      '   RM.DATABAIXA, RM.FLGMOVCOTA '                                                   + #13 +

      'ORDER BY '                                                                         + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   RM.DATABAIXA, RM.FLGMOVCOTA '
      else
         Result := Result + '   RM.DATABAIXA, RM.FLGMOVCOTA DESC';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda Fixa
      ttRF: begin
      Result :=
      // Criada essa camada mais externa de agrupamento, para que haja, no máximo, 1 registro de
      // cotização e 1 registro de rentabilização para cada dia
      'SELECT '                                                                                       + #13 +
      '   DATA, IDPLANO, IDPATRO, IDATIVOCOTA, FLGCOTA, SUM(VALOR) AS VALOR '                         + #13 +
      'FROM '                                                                                         + #13 +
      '   ( '                                                                                         + #13 +
      '   SELECT '                                                                                    + #13 +
      '      H1.DATAHISTRENFIX AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, '                      + #13 +
      '      A1.IDATIVOCOTA, TP.FLGMOVCOTA AS FLGCOTA, '                                              + #13 +
      '      SUM(DECODE(NATURMOVHISTRENFI, ''D'', ABS(H1.VLRHISTRENFIX) * (-1), H1.VLRHISTRENFIX)) AS VALOR '  + #13 +
      '   FROM '                                                                                      + #13 +
      '      HISTRENFIX          H1, '                                                                + #13 +
      '      ATIVOCOTA           A1, '                                                                + #13 +
      '      PLANPREVCONTABPATRO PA, '                                                                + #13 +
      '      TIPOOPERACAO        TP  '                                                                + #13 +

      '   WHERE '                                                                                     + #13 +
      '          H1.DATAHISTRENFIX     BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '     +
                                         ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '     + #13 +
      '      AND TP.IDTIPOINVEST       = 1 '                                                          + #13 +

      '      AND A1.IDATIVOCOTA        = ' + FormatFloat('#0', IDAtivo)                               + #13 +
      '      AND PA.IDPLANOPREV        = ' + FormatFloat('#0', IDPlano)                               + #13 +
      '      AND PA.IDPATRO            = ' + FormatFloat('#0', IDPatro)                               + #13 +
      '      AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
      '      AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
      '      AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13 +
      '      AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                            + #13 +
      '   GROUP BY '                                                                                  + #13 +
      '      H1.DATAHISTRENFIX, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, TP.FLGMOVCOTA '           + #13 +
      '   HAVING '                                                                                    + #13 +
      '      SUM(DECODE(NATURMOVHISTRENFI, ''D'', ABS(H1.VLRHISTRENFIX) * (-1), H1.VLRHISTRENFIX)) <> 0 '   + #13 +

      // -------------------------------------------------------------------------------------------

      '   UNION ALL '                                                                                 + #13 +

      // -------------------------------------------------------------------------------------------

      '   SELECT '                                                                                    + #13 +
      '      H1.DATAHISTRENFIX AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, '                      + #13 +
      '      A1.IDATIVOCOTA, ''R'' AS FLGCOTA, '                                                      + #13 +
      '      (SUM(HL.LUCRO) - SUM(HP.PREJUIZO)) AS VALOR '                                            + #13 +

      '   FROM '                                                                                      + #13 +
      '      HISTRENFIX          H1, '                                                                + #13 +
      '      ATIVOCOTA           A1, '                                                                + #13 +
      '      PLANPREVCONTABPATRO PA, '                                                                + #13 +
      '      TIPOOPERACAO        TP, '                                                                + #13 +
      '      ( '                                                                                      + #13 +
      '      SELECT '                                                                                 + #13 +
      '         IDHISTRENFIX, ABS(PUITEM) AS LUCRO '                                                    + #13 +
      '      FROM '                                                                                   + #13 +
      '         HISTRENFIXXITENS '                                                                    + #13 +
      '      WHERE '                                                                                  + #13 +
      '         IDITEMRENFIX = -9 '                                                                   + #13 +
      '      ) HL, '                                                                                  + #13 +
      '      ( '                                                                                      + #13 +
      '      SELECT '                                                                                 + #13 +
      '         IDHISTRENFIX, ABS(PUITEM) AS PREJUIZO '                                                 + #13 +
      '      FROM '                                                                                   + #13 +
      '         HISTRENFIXXITENS '                                                                    + #13 +
      '      WHERE '                                                                                  + #13 +
      '         IDITEMRENFIX = -10 '                                                                  + #13 +
      '      ) HP '                                                                                   + #13 +

      '   WHERE '                                                                                     + #13 +
      '          H1.DATAHISTRENFIX     BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '     +
                                         ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '     + #13 +
      '      AND TP.IDTIPOINVEST       = 1 '                                                          + #13 +
      '      AND A1.IDATIVOCOTA        = ' + FormatFloat('#0', IDAtivo)                               + #13 +
      '      AND PA.IDPLANOPREV        = ' + FormatFloat('#0', IDPlano)                               + #13 +
      '      AND PA.IDPATRO            = ' + FormatFloat('#0', IDPatro)                               + #13 +
      '      AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
      '      AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
      '      AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13 +
      '      AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                            + #13 +
      '      AND H1.IDHISTRENFIX       = HL.IDHISTRENFIX '                                            + #13 +
      '      AND H1.IDHISTRENFIX       = HP.IDHISTRENFIX '                                            + #13 +
      '   GROUP BY '                                                                                  + #13 +
      '      H1.DATAHISTRENFIX, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, TP.FLGMOVCOTA '           + #13 +
      '   HAVING '                                                                                    + #13 +
      '      (SUM(HL.LUCRO) - SUM(HP.PREJUIZO)) <> 0 '                                                + #13 +
      '   ) '                                                                                         + #13 +
      // -------------------------------------------------------------------------------------------

      'GROUP BY '                                                                                     + #13 +
      '   DATA, IDPLANO, IDPATRO, IDATIVOCOTA, FLGCOTA '                                              + #13 +

      'ORDER BY '                                                                                     + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   DATA, FLGCOTA '
      else
         Result := Result + '   DATA, FLGCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda Variável
      ttRV: begin
      Result :=
      //AL_3 - Ini - Rentabilização forçada de Lucro Prejuizo
      'SELECT '                                                                                    + #13 +
      '   H1.DATAMOVCARTINV AS DATA, PA.IDPLANOPREV AS IDPLANO, PA.IDPATRO, A1.IDATIVOCOTA, '      + #13 +
      '   DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA) AS FLGCOTA, '                    + #13 +
      '   SUM(H1.VLRMOVCARTINV) AS VALOR '                                                         + #13 +

      'FROM '                                                                                      + #13 +
      '   HISTCARTINV         H1, '                                                                + #13 +
      '   ATIVOCOTA           A1, '                                                                + #13 +
      '   PLANPREVCONTABPATRO PA, '                                                                + #13 +
      '   TIPOOPERACAO        TP  '                                                                + #13 +

      'WHERE '                                                                                     + #13 +
      '       H1.IDTIPOINVEST       = 2 '                                                          + #13 +
      '   AND TP.IDTIPOINVEST       = 2 '                                                     + #13 +

      '   AND H1.DATAMOVCARTINV     BETWEEN TO_DATE(' + sDataFechamento + ', ''dd/mm/yyyy'') '    +
                                      ' AND TO_DATE(' + sDataFim        + ', ''dd/mm/yyyy'') '    + #13 +

      '   AND H1.IDCARTEIRAGERENC   IS NULL '                                                      + #13 +
      '   AND A1.IDATIVOCOTA        = ' + FormatFloat('#0', IDAtivo)                               + #13 +
      '   AND PA.IDPLANOPREV        = ' + FormatFloat('#0', IDPlano)                               + #13 +
      '   AND PA.IDPATRO            = ' + FormatFloat('#0', IDPatro)                               + #13 +
      '   AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
      '   AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
      '   AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13 +
      '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                            + #13 +
      'GROUP BY '                                                                                  + #13 +
      //AL_3
      '   H1.DATAMOVCARTINV, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, '                         + #13 +
      '   DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA) '                                + #13 +
      'HAVING '                                                                                    + #13 +
      '   SUM(H1.VLRMOVCARTINV) <> 0 '                                                             + #13 +
      'ORDER BY '                                                                                  + #13;
      //AL_3
      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   H1.DATAMOVCARTINV, DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA)  '
      else
         Result := Result + '   H1.DATAMOVCARTINV, DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA) DESC ';
      end;
      //AL_3 - Fim - Rentabilização forçada de Lucro Prejuizo

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttBMF: Result := '';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRF: begin
      Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, '                                                         + #13 +
      '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
      '   PA.IDPATRO, '                                                                      + #13 +
      '   A1.IDATIVOCOTA, '                                                                  + #13 +
      '   TP.FLGMOVCOTA AS FLGCOTA, '                                                        + #13 +
      '   SUM(DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO))) AS VALOR' + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO            H1, '                                                         + #13 +
      //AL_9
      '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '   FROM '                                                                             + #13 +
      '      HISTFUNDO            H2, '                                                      + #13 +
      '      TIPOOPERACAO         T2, '                                                      + #13 +
      '      ATIVOCOTA            A2, '                                                      + #13 +
      '      PLANPREVCONTABPATRO  P2 '                                                       + #13 +

      '   WHERE '                                                                            + #13 +
      '          H2.IDTIPOINVEST      = 5 '                                                  + #13 +
      '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
      '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
      '      AND H2.DATAAPLICACAO    <=  TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') ' + #13 +
      '                              AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
      '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +

      '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
      '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
      '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +

      '      AND T2.IDTIPOINVEST      = 5 '                                                  + #13 +
      '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +

      '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
      '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
      '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
      '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
      '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO, T2.FLGMOVCOTA) HM, '                   + #13 +

      '   TIPOOPERACAO         TP, '                                                         + #13 +
      '   ATIVOCOTA            A1, '                                                         + #13 +
      '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

      'WHERE '                                                                               + #13 +
      //AL_9
      '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +

      '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
      '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
      '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
      //AL_9
      '   AND TP.IDTIPOINVEST      = 5 '                                                     + #13 +
      '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +

      '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +
      //AL_9
      'GROUP BY H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, TP.FLGMOVCOTA ' + #13 +

      'ORDER BY '                                                                            + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA '
      else
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRV: begin
      Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, '                                                         + #13 +
      '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
      '   PA.IDPATRO, '                                                                      + #13 +
      '   A1.IDATIVOCOTA, '                                                                  + #13 +
      '   TP.FLGMOVCOTA AS FLGCOTA, '                                                        + #13 +
      '   SUM(DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO))) AS VALOR' + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO            H1, '                                                         + #13 +
      //AL_9
      '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '   FROM '                                                                             + #13 +
      '      HISTFUNDO            H2, '                                                      + #13 +
      '      TIPOOPERACAO         T2, '                                                      + #13 +
      '      ATIVOCOTA            A2, '                                                      + #13 +
      '      PLANPREVCONTABPATRO  P2 '                                                       + #13 +

      '   WHERE '                                                                            + #13 +
      '          H2.IDTIPOINVEST      = 6 '                                                  + #13 +
      '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
      '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
      '      AND H2.DATAAPLICACAO    <=  TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') ' + #13 +
      '                              AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
      '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +

      '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
      '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
      '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +

      '      AND T2.IDTIPOINVEST      = 6 '                                                  + #13 +
      '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +

      '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
      '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
      '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
      '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
      '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO, T2.FLGMOVCOTA) HM, '                   + #13 +

      '   TIPOOPERACAO         TP, '                                                         + #13 +
      '   ATIVOCOTA            A1, '                                                         + #13 +
      '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

      'WHERE '                                                                               + #13 +
      //AL_9
      '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +

      '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
      '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
      '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
      //AL_9
      '   AND TP.IDTIPOINVEST      = 6 '                                                     + #13 +
      '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +

      '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, TP.FLGMOVCOTA '       + #13 +

      'ORDER BY '                                                                            + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA  '
      else
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoImob: begin
      Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, '                                                         + #13 +
      '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
      '   PA.IDPATRO, '                                                                      + #13 +
      '   A1.IDATIVOCOTA, '                                                                  + #13 +
      '   TP.FLGMOVCOTA AS FLGCOTA, '                                                        + #13 +
      '   SUM(DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO))) AS VALOR' + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO            H1, '                                                         + #13 +
      //AL_9
      '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '   FROM '                                                                             + #13 +
      '      HISTFUNDO            H2, '                                                      + #13 +
      '      TIPOOPERACAO         T2, '                                                      + #13 +
      '      ATIVOCOTA            A2, '                                                      + #13 +
      '      PLANPREVCONTABPATRO  P2 '                                                       + #13 +

      '   WHERE '                                                                            + #13 +
      '          H2.IDTIPOINVEST      = 7 '                                                  + #13 +
      '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
      '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
      '      AND H2.DATAAPLICACAO    <=  TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') ' + #13 +
      '                              AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
      '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +

      '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
      '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
      '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +

      '      AND T2.IDTIPOINVEST      = 7 '                                                  + #13 +
      '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +

      '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
      '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
      '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
      '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
      '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO, T2.FLGMOVCOTA) HM, '                   + #13 +

      '   TIPOOPERACAO         TP, '                                                         + #13 +
      '   ATIVOCOTA            A1, '                                                         + #13 +
      '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

      'WHERE '                                                                               + #13 +
      '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +

      '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
      '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
      '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
      //AL_9
      '   AND TP.IDTIPOINVEST      = 7 '                                                     + #13 +
      '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +

      '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, TP.FLGMOVCOTA '       + #13 +

      'ORDER BY '                                                                            + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA  '
      else
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;


      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoDIC: begin
      Result :=
      'SELECT '                                                                              + #13 +
      '   H1.DATAMOVFUNDO AS DATA, '                                                         + #13 +
      '   PA.IDPLANOPREV AS IDPLANO, '                                                       + #13 +
      '   PA.IDPATRO, '                                                                      + #13 +
      '   A1.IDATIVOCOTA, '                                                                  + #13 +
      '   TP.FLGMOVCOTA AS FLGCOTA, '                                                        + #13 +
      '   SUM(DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO))) AS VALOR' + #13 +

      'FROM '                                                                                + #13 +
      '   HISTFUNDO            H1, '                                                         + #13 +
      //AL_9
      '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
      '   FROM '                                                                             + #13 +
      '      HISTFUNDO            H2, '                                                      + #13 +
      '      TIPOOPERACAO         T2, '                                                      + #13 +
      '      ATIVOCOTA            A2, '                                                      + #13 +
      '      PLANPREVCONTABPATRO  P2 '                                                       + #13 +

      '   WHERE '                                                                            + #13 +
      '          H2.IDTIPOINVEST      = 9 '                                                  + #13 +
      '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
      '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
      '      AND H2.DATAAPLICACAO    <=  TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.DATAMOVFUNDO BETWEEN TO_DATE( ' + sDataFechamento + ', ''dd/mm/yyyy'') ' + #13 +
      '                              AND TO_DATE( ' + sDataFim        + ', ''dd/mm/yyyy'') ' + #13 +
      '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
      '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +

      '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
      '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
      '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +

      '      AND T2.IDTIPOINVEST      = 9 '                                                  + #13 +
      '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +

      '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
      '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
      '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
      '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
      '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO, T2.FLGMOVCOTA) HM, '                   + #13 +

      '   TIPOOPERACAO         TP, '                                                         + #13 +
      '   ATIVOCOTA            A1, '                                                         + #13 +
      '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

      'WHERE '                                                                               + #13 +
      //AL_9
      '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +

      '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
      '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
      '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
      //AL_9
      '   AND TP.IDTIPOINVEST      = 9 '                                                     + #13 +
      '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +

      '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
      '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
      '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +

      'GROUP BY '                                                                            + #13 +
      '   H1.DATAMOVFUNDO, PA.IDPLANOPREV, PA.IDPATRO, A1.IDATIVOCOTA, TP.FLGMOVCOTA '       + #13 +

      'ORDER BY '                                                                            + #13;

      if CtrlParamCota.FlgCotizaDataAnt then
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA '
      else
         Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
   end;
end;

function TCtrlCotaCotacao.MontaSQLFluxoCota(const IDAtivo           : Integer;
                                            const IDPlano           : Integer;
                                            const IDPatro           : Integer;
                                            const dData             : TDateTime;
                                            const TipoCota          : tTipoCota): String;
var
   sData   : String;
begin
   // ----------------------------------------------------------------------------------------------
   // Seleciona as movimentações do (Ativos + Plano + Patro), sem agrupar por (data + tipo (R, C)),
   // ordenado por (data + C, R))
   // ----------------------------------------------------------------------------------------------

   sData := QuotedStr(FormatDateTime('dd/mm/yyyy', dData));

   case TipoCota of
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttHstMovCota:
      begin
         Result :=
         'SELECT '                                                                                 + #13 +
         '   ''Movimentação Manual'' AS HISTORICO, '                                               + #13 +
         '   DECODE(CTO.RECDES, ''R'', HST.VALOR, ''D'', (HST.VALOR * (-1)), 0) AS VALOR, '        + #13 +
         '   CTO.FLGCOTA '                                                                         + #13 +
         'FROM '                                                                                   + #13 +
         '   HSTMOVCOTA   HST, '                                                                   + #13 +
         '   COTATIPOOPER CTO  '                                                                   + #13 +
         'WHERE '                                                                                  + #13 +
         '       HST.IDATIVOCOTA    = ' + FormatFloat('#0', IDAtivo)                               + #13 +
         '   AND HST.IDPLANOPREV    = ' + FormatFloat('#0', IDPlano)                               + #13 +
         '   AND HST.IDPATRO        = ' + FormatFloat('#0', IDPatro)                               + #13 +
         '   AND DATA               = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '                     + #13 +
         '   AND HST.IDCOTATIPOOPER = CTO.IDCOTATIPOOPER '                                         + #13 +
         '   AND DECODE(CTO.RECDES, ''R'', HST.VALOR, ''D'', (HST.VALOR * (-1)), 0) <> 0 '         + #13 +
         'ORDER BY '                                                                               + #13;
         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '    HST.DATA, TP.FLGMOVCOTA '
         else
            Result := Result + '    HST.DATA, TP.FLGMOVCOTA DESC ';
      end;
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttEmprestimo:
      begin
         Result :=
         'SELECT '                                                                                       + #13 +
         // Substituir pelo campo correto
         '   ''Movimentação de Empréstimo'' AS HISTORICO , '                                                           + #13 +
         '   SUM(DECODE(ITC.ITCEVENTO, 0, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             1, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             2, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             3, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             4, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             5, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             6, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             7, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             8, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                                NVL(HME.HMEVLRPREVISTO, 0) '                                   + #13 +
         '             ) '                                                                               + #13 +
         '      ) AS VALOR, '                                                                            + #13 +
         '   ITC.FLGMOVCOTA AS FLGCOTA, '                                                                + #13 +
         'FROM '                                                                                         + #13 +
         '   ATIVOCOTA       ATC, '                                                                      + #13 +
         '   HISTMOVEMPTMO   HME, '                                                                      + #13 +
         '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
         '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
         '   TIPOEMPTMO      TEP, '                                                                      + #13 +
         '   ITEMXTIPOCONTR  ITC  '                                                                      + #13 +

         'WHERE '                                                                                        + #13 +
         '       TEP.IDEMPRESAPROP        = ' + FormatFloat('#0', Sistema.IDEmpresa)                     + #13 +
         '   AND CON.FLGSITUACAO          <> ''C'' '                                                     + #13 +
         '   AND ATC.IDATIVOCOTA          = ' + FormatFloat('#0', IDAtivo)                               + #13 +
         '   AND CON.IDPLANOORIGEM        = ' + FormatFloat('#0', IDPlano)                               + #13 +
         '   AND CON.IDPATRO              = ' + FormatFloat('#0', IDPatro)                               + #13 +
         '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                          + #13 +
         '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                          + #13 +
         '   AND ITC.FLGMOVCOTA           IN (''C'', ''R'') '                                            + #13 +
         '   AND HME.HMEDATAPREVISTA      = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '                     + #13 +
         '   AND ATC.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
         '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                       + #13 +
         '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                      + #13 +
         '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                           + #13 +
         '   AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                           + #13 +
         '   AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                      + #13 +
         'HAVING '                                                                                       + #13 +
         '   SUM(DECODE(ITC.ITCEVENTO, 0, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             1, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             2, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             3, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             4, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             5, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             6, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                             7, NVL(HME.HMEVLRPREVISTO, 0) * (-1), '                           + #13 +
         '                             8, NVL(HME.HMEVLRPREVISTO, 0), '                                  + #13 +
         '                                NVL(HME.HMEVLRPREVISTO, 0) ) ) <> 0 '                          + #13 +

         'ORDER BY '                                                                                     + #13;
         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   HME.HMEDATAPREVISTA, ITC.FLGMOVCOTA '
         else
            Result := Result + '   HME.HMEDATAPREVISTA, ITC.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttImobiliario:
      begin
         Result :=
         'SELECT '                                                                           + #13 +
         '   RM.DESCCUSTORECIMO AS HISTORICO, '                                              + #13 +
         '   NVL(ROUND(SUM(DECODE(NVL(FT.FATOR, 0), '                                                 + #13 +
         '                        0, (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0)), '               + #13 +
         '                           (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0)) * FT.FATOR) '    + #13 +
         '            ), '                                                                            + #13 +
         '       2), 0) AS VALOR, '                                                                   + #13 +
         '   RM.FLGMOVCOTA AS FLGCOTA '                                                     + #13 +

         'FROM '                                                                             + #13 +
         '   IMOVEL      I, '                                                                + #13 +
         '   ATIVOCOTA   A, '                                                                + #13 +
         '   PARAMGLOBAL PG, '                                                               + #13 +
         '   ( '                                                                             + #13 +
         '   SELECT '                                                                        + #13 +
         '      I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA, '                                   + #13 +
         '      TC.DESCCUSTORECIMO, '                                                        + #13 +
         '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) AS TOT_RECEBIDO, '     + #13 +
         '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) AS TOT_PAGO '          + #13 +

         '   FROM '                                                                          + #13 +
         '      DOCUMENTO         D, '                                                       + #13 +
         '      LANCTODOCUM       LD, '                                                      + #13 +
         '      LANCAMENTOSIMOVEL LI, '                                                      + #13 +
         '      IMOVEL            I, '                                                       + #13 +
         '      RECBTOPAGTO       RP, '                                                      + #13 +
         '      TIPOCUSTORECIMOV  TC, '                                                      + #13 +
         '      ( '                                                                          + #13 +
         '      SELECT '                                                                     + #13 +
         '         CODDOCUMENTO, VALOR '                                                     + #13 +
         '      FROM '                                                                       + #13 +
         '         LANCTODOCUM '                                                             + #13 +
         '      WHERE '                                                                      + #13 +
         '         RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) '                    + #13 +
         '      ) TR1 '                                                                      + #13 +
         '   WHERE '                                                                         + #13 +
         '          D.CODDOCUMENTO       = LI.CODDOCUMENTO '                                 + #13 +
         '      AND D.CODDOCUMENTO       = LD.CODDOCUMENTO '                                 + #13 +
         '      AND D.CODDOCUMENTO       = TR1.CODDOCUMENTO '                                + #13 +
         '      AND LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO '                            + #13 +
         '      AND D.CODDOCUMENTO       = RP.CODDOCUMENTO(+) '                              + #13 +
         '      AND LI.IDIMOVEL          = I.IDIMOVEL '                                      + #13 +
         '      AND TC.FLGMOVCOTA        IN (''R'', ''C'') '                                 + #13 +
         '      AND RP.DATABAIXA         = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '          + #13 +

         '   GROUP '                                                                         + #13 +
         '      BY I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA, TC.DESCCUSTORECIMO '             + #13 +
         '   ) RM, '                                                                         + #13 +

         '   ( '                                                                             + #13 +
         '    SELECT IM.IDIMOVEL, '                                                          + #13 +
         '           DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) AS IDPATRO, '                  + #13 +
         '           DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) AS IDPLANOPREV, '  + #13 +
         '           DECODE(NVL(TT.TOTAL,0), 0, 100, DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL )) AS FATOR ' + #13 +
         '    FROM '                                                                         + #13 +
         '      PLANOPATROXIMOVEL PI, IMOVEL IM, PARAMGLOBAL PG, '                           + #13 +
         '     ( '                                                                           + #13 +
         '      SELECT '                                                                     + #13 +
         '        IDIMOVEL, SUM( NVL(PPIPERCENTRATEIO,0) ) AS TOTAL '                        + #13 +
         '      FROM '                                                                       + #13 +
         '        PLANOPATROXIMOVEL '                                                        + #13 +
         '      GROUP BY '                                                                   + #13 +
         '        IDIMOVEL '                                                                 + #13 +
         '     ) TT '                                                                        + #13 +
         '    WHERE '                                                                        + #13 +
         '          DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) = ' + FormatFloat('#0', IDPlano)             + #13 +
         '      AND DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) = ' + FormatFloat('#0', IDPatro) + #13 +
         '      AND PI.IDIMOVEL = TT.IDIMOVEL(+) '                                           + #13 +
         '      AND IM.IDIMOVEL = PI.IDIMOVEL(+) '                                           + #13 +
         '      AND IM.IDPESSOA = PG.IDPESSOA '                                              + #13 +
         '      AND IM.FLGTIPOIMOVEL = 1 '                                                   + #13 +
         '   ) FT '                                                                          + #13 +

         'WHERE '                                                                            + #13 +

         '       A.IDATIVOCOTA    = ' + FormatFloat('#0', IDAtivo)                           + #13 +
         '   AND I.IDIMOVEL       = A.IDIMOVEL '                                             + #13 +
         '   AND I.IDPESSOA       = PG.IDPESSOA '                                            + #13 +
         '   AND I.IDIMOVEL       = FT.IDIMOVEL '                                            + #13 +
         '   AND I.IDIMOVEL       = RM.IDIMOVEL '                                            + #13 +
         '   AND I.IDIMOVELMESTRE IS NOT NULL '                                              + #13 +
         '   AND I.FLGATIVO       = 1 '                                                      + #13 +

         'HAVING '                                                                           + #13 +
         '   NVL(ROUND(SUM(DECODE(NVL(FT.FATOR, 0), '                                              + #13 +
         '                        0, (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0)), '            + #13 +
         '                           (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0)) * FT.FATOR) ' + #13 +
         '            ), 2), 0) <> 0 '                                                             + #13 +

         'GROUP BY '                                                                         + #13 +
         '   A.IDATIVOCOTA, '                                                                + #13 +
         '   DECODE(FT.IDPLANOPREV, NULL, PG.IDPLANOPREV, FT.IDPLANOPREV ), '                + #13 +
         '   DECODE(FT.IDPATRO, NULL, PG.IDPATRO, FT.IDPATRO ), '                            + #13 +
         '   RM.DATABAIXA, RM.FLGMOVCOTA, RM.DESCCUSTORECIMO '                               + #13 +

         'ORDER BY '                                                                         + #13;
         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   RM.DATABAIXA, RM.FLGMOVCOTA '
         else
            Result := Result + '   RM.DATABAIXA, RM.FLGMOVCOTA DESC';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda Fixa
      ttRF:
      begin
         Result :=
         // Criada essa camada mais externa de agrupamento, para que haja, no máximo, 1 registro de
         // cotização e 1 registro de rentabilização para cada dia
         'SELECT '                                                                                    + #13 +
         '   H1.HISTMOVRENFIX AS HISTORICO, '                                                         + #13 +
         '   DECODE(NATURMOVHISTRENFI, ''D'', ABS(H1.VLRHISTRENFIX) * (-1), H1.VLRHISTRENFIX) AS VALOR, '  + #13 +
         '   TP.FLGMOVCOTA AS FLGCOTA '                                                               + #13 +
         'FROM '                                                                                      + #13 +
         '   HISTRENFIX          H1, '                                                                + #13 +
         '   ATIVOCOTA           A1, '                                                                + #13 +
         '   PLANPREVCONTABPATRO PA, '                                                                + #13 +
         '   TIPOOPERACAO        TP  '                                                                + #13 +

         'WHERE '                                                                                     + #13 +
         '    H1.DATAHISTRENFIX     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '                        + #13 +
         '   AND A1.IDATIVOCOTA        = ' + FormatFloat('#0', IDAtivo)                               + #13 +
         '   AND PA.IDPLANOPREV        = ' + FormatFloat('#0', IDPlano)                               + #13 +
         '   AND PA.IDPATRO            = ' + FormatFloat('#0', IDPatro)                               + #13 +
         '   AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
         '   AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
         '   AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13 +
         '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                            + #13 +
         '   AND DECODE(NATURMOVHISTRENFI, ''D'', ABS(H1.VLRHISTRENFIX) * (-1), H1.VLRHISTRENFIX) <> 0' + #13 +

         // -------------------------------------------------------------------------------------------

         'UNION ALL '                                                                                 + #13 +

         // -------------------------------------------------------------------------------------------

         'SELECT '                                                                                    + #13 +
         '   ''Lucro / Prejuízo'' AS HISTORICO, '                                                     + #13 +
         '   (HL.LUCRO - HP.PREJUIZO) AS VALOR, '                                                     + #13 +
         '   ''R'' AS FLGCOTA '                                                                       + #13 +
         'FROM '                                                                                      + #13 +
         '   HISTRENFIX          H1, '                                                                + #13 +
         '   ATIVOCOTA           A1, '                                                                + #13 +
         '   PLANPREVCONTABPATRO PA, '                                                                + #13 +
         '   TIPOOPERACAO        TP, '                                                                + #13 +
         '   ( '                                                                                      + #13 +
         '   SELECT '                                                                                 + #13 +
         '      IDHISTRENFIX, ABS(PUITEM) AS LUCRO '                                                  + #13 +
         '   FROM '                                                                                   + #13 +
         '      HISTRENFIXXITENS '                                                                    + #13 +
         '   WHERE '                                                                                  + #13 +
         '      IDITEMRENFIX = -9 '                                                                   + #13 +
         '   ) HL, '                                                                                  + #13 +
         '   ( '                                                                                      + #13 +
         '   SELECT '                                                                                 + #13 +
         '      IDHISTRENFIX, ABS(PUITEM) AS PREJUIZO '                                               + #13 +
         '   FROM '                                                                                   + #13 +
         '      HISTRENFIXXITENS '                                                                    + #13 +
         '   WHERE '                                                                                  + #13 +
         '      IDITEMRENFIX = -10 '                                                                  + #13 +
         '   ) HP '                                                                                   + #13 +

         'WHERE '                                                                                     + #13 +
         '      H1.DATAHISTRENFIX     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '                      + #13 +
         '  AND A1.IDATIVOCOTA        = ' + FormatFloat('#0', IDAtivo)                                + #13 +
         '  AND PA.IDPLANOPREV        = ' + FormatFloat('#0', IDPlano)                                + #13 +
         '  AND PA.IDPATRO            = ' + FormatFloat('#0', IDPatro)                                + #13 +
         '  AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                           + #13 +
         '  AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                        + #13 +
         '  AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                           + #13 +
         '  AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                             + #13 +
         '  AND H1.IDHISTRENFIX       = HL.IDHISTRENFIX '                                             + #13 +
         '  AND H1.IDHISTRENFIX       = HP.IDHISTRENFIX '                                             + #13 +
         '  AND (HL.LUCRO - HP.PREJUIZO) <> 0 ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      // Renda Variável
      ttRV:
      begin
         Result :=
         //AL_3 - Ini - Rentabilização forçada de Lucro Prejuizo
         'SELECT '                                                                                    + #13 +
         '   H1.HISTMOVCARTINV AS HISTORICO, '                                                        + #13 +
         '   H1.VLRMOVCARTINV AS VALOR, '                                                             + #13 +
         '   DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA) AS FLGCOTA '                     + #13 +

         'FROM '                                                                                      + #13 +
         '   HISTCARTINV         H1, '                                                                + #13 +
         '   ATIVOCOTA           A1, '                                                                + #13 +
         '   PLANPREVCONTABPATRO PA, '                                                                + #13 +
         '   TIPOOPERACAO        TP  '                                                                + #13 +

         'WHERE '                                                                                     + #13 +
         '       H1.IDTIPOINVEST       = 2 '                                                          + #13 +
         '   AND TP.IDTIPOINVEST       = 2 '                                                          + #13 +
         '   AND H1.DATAMOVCARTINV     = TO_DATE(' + sData + ', ''dd/mm/yyyy'') '                     + #13 +
         '   AND H1.IDCARTEIRAGERENC   IS NULL '                                                      + #13 +
         '   AND A1.IDATIVOCOTA        = ' + FormatFloat('#0', IDAtivo)                               + #13 +
         '   AND PA.IDPLANOPREV        = ' + FormatFloat('#0', IDPlano)                               + #13 +
         '   AND PA.IDPATRO            = ' + FormatFloat('#0', IDPatro)                               + #13 +
         '   AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                          + #13 +
         '   AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                       + #13 +
         '   AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                          + #13 +
         '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                            + #13 +
         '   AND H1.VLRMOVCARTINV <> 0 '                                                             + #13 +
         'ORDER BY '                                                                                  + #13;
         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   H1.DATAMOVCARTINV, DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA)  '
         else
            Result := Result + '   H1.DATAMOVCARTINV, DECODE(H1.TIPMOVCARTINV, ''LUC'', ''R'', TP.FLGMOVCOTA) DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttBMF: Result := '';
      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRF:
      begin
         Result :=
         'SELECT '                                                                              + #13 +
         '   H1.HISTMOVFUNDO AS HISTORICO, '                                                    + #13 +
         '   DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) AS VALOR, ' + #13 +
         '   TP.FLGMOVCOTA AS FLGCOTA '                                                        + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         //AL_9
         '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
         '   FROM '                                                                             + #13 +
         '      HISTFUNDO            H2, '                                                      + #13 +
         '      TIPOOPERACAO         T2, '                                                      + #13 +
         '      ATIVOCOTA            A2, '                                                      + #13 +
         '      PLANPREVCONTABPATRO  P2  '                                                      + #13 +
         '   WHERE '                                                                            + #13 +
         '          H2.IDTIPOINVEST      = 5 '                                                  + #13 +
         '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
         '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
         '      AND H2.DATAAPLICACAO    <= TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.DATAMOVFUNDO      = TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
         '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +
         '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
         '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
         '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +
         '      AND T2.IDTIPOINVEST      = 5 '                                                  + #13 +
         '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +
         '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
         '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
         '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
         '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
         '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO ) HM, '                                 + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1, '                                                         + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         //AL_9
         '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +
         '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
         '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
         '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
         //AL_9
         '   AND TP.IDTIPOINVEST      = 5 '                                                     + #13 +
         '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +
         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +
         '   AND DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) <> 0 ' + #13 +

         'ORDER BY '                                                                            + #13;
         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA '
         else
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoRV:
      begin
         Result :=
         'SELECT '                                                                              + #13 +
         '   H1.HISTMOVFUNDO AS HISTORICO, '                                                    + #13 +
         '   DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) AS VALOR, ' + #13 +
         '   TP.FLGMOVCOTA AS FLGCOTA '                                                        + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         //AL_9
         '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
         '   FROM '                                                                             + #13 +
         '      HISTFUNDO            H2, '                                                      + #13 +
         '      TIPOOPERACAO         T2, '                                                      + #13 +
         '      ATIVOCOTA            A2, '                                                      + #13 +
         '      PLANPREVCONTABPATRO  P2  '                                                      + #13 +
         '   WHERE '                                                                            + #13 +
         '          H2.IDTIPOINVEST      = 6 '                                                  + #13 +
         '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
         '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
         '      AND H2.DATAAPLICACAO    <= TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.DATAMOVFUNDO      = TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
         '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +
         '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
         '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
         '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +
         '      AND T2.IDTIPOINVEST      = 5 '                                                  + #13 +
         '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +
         '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
         '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
         '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
         '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
         '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO ) HM, '                                 + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1, '                                                         + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         //AL_9
         '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +
         '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
         '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
         '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
         //AL_9
         '   AND TP.IDTIPOINVEST      = 6 '                                                     + #13 +
         '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +
         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +
         '   AND DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) <> 0 ' + #13 +

         'ORDER BY '                                                                            + #13;
         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA  '
         else
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoImob:
      begin
         Result :=
         'SELECT '                                                                              + #13 +
         '   H1.HISTMOVFUNDO AS HISTORICO, '                                                    + #13 +
         '   DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) AS VALOR, ' + #13 +
         '   TP.FLGMOVCOTA AS FLGCOTA '                                                        + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         //AL_9
         '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
         '   FROM '                                                                             + #13 +
         '      HISTFUNDO            H2, '                                                      + #13 +
         '      TIPOOPERACAO         T2, '                                                      + #13 +
         '      ATIVOCOTA            A2, '                                                      + #13 +
         '      PLANPREVCONTABPATRO  P2  '                                                      + #13 +
         '   WHERE '                                                                            + #13 +
         '          H2.IDTIPOINVEST      = 7 '                                                  + #13 +
         '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
         '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
         '      AND H2.DATAAPLICACAO    <= TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.DATAMOVFUNDO      = TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
         '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +
         '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
         '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
         '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +
         '      AND T2.IDTIPOINVEST      = 7 '                                                  + #13 +
         '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +
         '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
         '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
         '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
         '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
         '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO ) HM, '                                 + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1, '                                                         + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         //AL_9
         '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +
         '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
         '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
         '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
         //AL_9
         '   AND TP.IDTIPOINVEST      = 7 '                                                     + #13 +
         '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +
         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +
         '   AND DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) <> 0 ' + #13 +

         'ORDER BY '                                                                            + #13;

         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA  '
         else
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
      ttFundoDIC:
      begin
         Result :=
         'SELECT '                                                                              + #13 +
         '   H1.HISTMOVFUNDO AS HISTORICO, '                                                    + #13 +
         '   DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) AS VALOR, ' + #13 +
         '   TP.FLGMOVCOTA AS FLGCOTA '                                                        + #13 +

         'FROM '                                                                                + #13 +
         '   HISTFUNDO            H1, '                                                         + #13 +
         //AL_9
         '  (SELECT MAX(H2.IDHISTFUNDO) AS IDHISTFUNDO '                                        + #13 +
         '   FROM '                                                                             + #13 +
         '      HISTFUNDO            H2, '                                                      + #13 +
         '      TIPOOPERACAO         T2, '                                                      + #13 +
         '      ATIVOCOTA            A2, '                                                      + #13 +
         '      PLANPREVCONTABPATRO  P2  '                                                      + #13 +
         '   WHERE '                                                                            + #13 +
         '          H2.IDTIPOINVEST      = 9 '                                                  + #13 +
         '      AND H2.IDPLANPREVCTBPATR > 0 '                                                  + #13 +
         '      AND H2.IDFUNDOINVEST     > 0 '                                                  + #13 +
         '      AND H2.DATAAPLICACAO    <= TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.DATAMOVFUNDO      = TO_DATE( ' + sData + ', ''dd/mm/yyyy'') '            + #13 +
         '      AND H2.TIPMOVFUNDO      <> ''PIR'' '                                            + #13 +
         '      AND H2.VLRMOVFUNDO      <> 0 '                                                  + #13 +
         '      AND A2.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                       + #13 +
         '      AND P2.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                       + #13 +
         '      AND P2.IDPATRO           = ' + FormatFloat('#0', IDPatro)                       + #13 +
         '      AND T2.IDTIPOINVEST      = 9 '                                                  + #13 +
         '      AND T2.FLGMOVCOTA         IN (''C'', ''R'') '                                   + #13 +
         '      AND H2.IDTIPOOPERACAO    = T2.IDTIPOOPERACAO '                                  + #13 +
         '      AND H2.IDFUNDOINVEST     = A2.IDFUNDOINVEST '                                   + #13 +
         '      AND H2.IDPLANPREVCTBPATR = P2.IDPLANPREVCTBPATR '                               + #13 +
         '   GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUNDOINVEST, '                + #13 +
         '            H2.DATAAPLICACAO, H2.DATAMOVFUNDO ) HM, '                                 + #13 +
         '   TIPOOPERACAO         TP, '                                                         + #13 +
         '   ATIVOCOTA            A1, '                                                         + #13 +
         '   PLANPREVCONTABPATRO  PA '                                                          + #13 +

         'WHERE '                                                                               + #13 +
         //AL_9
         '       H1.IDHISTFUNDO       = HM.IDHISTFUNDO '                                        + #13 +
         '   AND A1.IDATIVOCOTA       = ' + FormatFloat('#0', IDAtivo)                          + #13 +
         '   AND PA.IDPLANOPREV       = ' + FormatFloat('#0', IDPlano)                          + #13 +
         '   AND PA.IDPATRO           = ' + FormatFloat('#0', IDPatro)                          + #13 +
         //AL_9
         '   AND TP.IDTIPOINVEST      = 9 '                                                     + #13 +
         '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                      + #13 +
         '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                     + #13 +
         '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                      + #13 +
         '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                  + #13 +
         '   AND DECODE(H1.NATURMOVFUNDO,' + '''' + 'D' + '''' + ',(ABS(H1.VLRMOVFUNDO) * -1),(H1.VLRMOVFUNDO)) <> 0 ' + #13 +

         'ORDER BY '                                                                            + #13;

         if CtrlParamCota.FlgCotizaDataAnt then
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA '
         else
            Result := Result + '   H1.DATAMOVFUNDO, TP.FLGMOVCOTA DESC ';
      end;

      //--------------------------------------------------------------------------------------------
      //--------------------------------------------------------------------------------------------
   end;
end;



function TCtrlCotaCotacao.GravaCota(const rCotacao : TCotacao; cdsFluxo: TCMClientDataSet = nil): Boolean;
begin
   // ----------------------------------------------------------------------------------------------
   // Grava o histórico de cotas
   // ----------------------------------------------------------------------------------------------

   FDbCotaCotacao.Data.AsDateTime            := rCotacao.dData;
   FDbCotaCotacao.IDAtivoCota.AsFloat        := rCotacao.IDAtivo;
   FDbCotaCotacao.IDPlano.AsInteger          := rCotacao.IDPlano;
   FDbCotaCotacao.IDPatro.AsInteger          := rCotacao.IDPatro;
   FDbCotaCotacao.PerNumero.AsInteger        := rCotacao.Periodo;
   FDbCotaCotacao.PerExercicio.AsInteger     := rCotacao.Exercicio;

   FDbCotaCotacao.Vlrcota.AsFloat            := rCotacao.fVlrCota;
   FDbCotaCotacao.Qtdcota.AsFloat            := rCotacao.fQtdCotas;
   FDbCotaCotacao.Vlrpatrimonio.AsFloat      := rCotacao.fVlrPatrimonio;
   FDbCotaCotacao.VlrCotizado.AsFloat        := rCotacao.fVlrCotizado;
   FDbCotaCotacao.VlrRentabilizado.AsFloat   := rCotacao.fVlrRentabilizado;
   FDbCotaCotacao.Origem.AsInteger           := rCotacao.iOrigem;

   if rCotacao.dDataIni <> 0 then
       FDbCotaCotacao.DataIni.AsDateTime := rCotacao.dDataIni
   else
       FDbCotaCotacao.DataIni.AsDateTime := rCotacao.dData;

   Result := True;

   if not(FDbCotaCotacao.Insert) then
   begin
      Result      := False;
      MessageInfo := FDbCotaCotacao.MessageInfo;
   end
   //AL_7
   else
   begin
      // Se o cds de fluxo foi passado
      if cdsFluxo <> nil then
      begin
         // Grava o Fluxo (Memória de cálculo da cota)
         cdsFluxo.First;
         while not cdsFluxo.Eof do
         begin
            FDbFluxoCota.Clear;
            FDbFluxoCota.Idcotacotacao.AsInteger := FDbCotaCotacao.Idcotacotacao.AsInteger;
            FDbFluxoCota.Historico.AsString := cdsFluxo.FieldByName('HISTORICO').AsString;
            FDbFluxoCota.Valor.AsFloat := cdsFluxo.FieldByName('VALOR').AsFloat;
            FDbFluxoCota.Flgcota.AsString := cdsFluxo.FieldByName('FLGCOTA').AsString;
            if not(FDbFluxoCota.Insert) then
            begin
               Result      := False;
               MessageInfo := FDbFluxoCota.MessageInfo;
               Break;
            end;
            cdsFluxo.Next;
         end;
      end;
   end;

   // ----------------------------------------------------------------------------------------------
end;



function TCtrlCotaCotacao.CotaAnterior(const IDAtivo   : Integer;
                                       const IDPlano   : Integer;
                                       const IDPatro   : Integer;
                                       const dData     : TDateTime
                                      ): TCotacao;
var
   cdsCotaAnterior   : TCMClientDataSet;
   sSQL              : String;
   sData             : String;
   rCotacao          : TCotacao;
begin
   // ----------------------------------------------------------------------------------------------
   // Busca a ultima cota calculada anterior ou igual ao último fechamento e retorna para um
   // registro (data, quant, valor, patrimonio)
   // ----------------------------------------------------------------------------------------------

   sData := QuotedStr(FormatDateTime('dd/mm/yyyy', dData));

   cdsCotaAnterior   := TCMClientDataSet.Create(nil);

   try
      sSQL :=
      'SELECT '                                                               + #13 +
      '   CCO.IDCOTACOTACAO, '                                                + #13 +
      '   CCO.DATA, '                                                         + #13 +
      '   CCO.IDATIVOCOTA, CCO.IDPLANO, CCO.IDPATRO, '                        + #13 +
      '   CCO.PERNUMERO, CCO.PEREXERCICIO, '                                  + #13 +
      '   CCO.VLRCOTA, CCO.QTDCOTA, CCO.VLRPATRIMONIO '                       + #13 +
      'FROM '                                                                 + #13 +
      '   COTACOTACAO CCO, '                                                  + #13 +
      '   ( '                                                                 + #13 +
      '   SELECT '                                                            + #13 +
      '      MAX(DATA) AS DATA '                                              + #13 +
      '   FROM '                                                              + #13 +
      '      COTACOTACAO '                                                    + #13 +
      '   WHERE '                                                             + #13 +
      '          IDATIVOCOTA    = ' + FormatFloat('#0', IDAtivo)              + #13 +
      '      AND IDPLANO        = ' + FormatFloat('#0', IDPlano)              + #13 +
      '      AND IDPATRO        = ' + FormatFloat('#0', IDPatro)              + #13 +
      '      AND DATA          <= TO_DATE(' + sData + ', ''dd/mm/yyyy'') '    + #13 +
      '   ) MAX '                                                             + #13 +
      'WHERE '                                                                + #13 +
      '       CCO.IDATIVOCOTA    = ' + FormatFloat('#0', IDAtivo)             + #13 +
      '   AND CCO.IDPLANO        = ' + FormatFloat('#0', IDPlano)             + #13 +
      '   AND CCO.IDPATRO        = ' + FormatFloat('#0', IDPatro)             + #13 +
      '   AND CCO.DATA           = MAX.DATA ';

      cdsCotaAnterior.Data       := GetDataPacket(sSQL);

      rCotacao.IDAtivo           := IDAtivo;
      rCotacao.IDPlano           := IDPlano;
      rCotacao.IDPatro           := IDPatro;

      if not(cdsCotaAnterior.IsEmpty) then
      begin
         rCotacao.IDCotaCotacao  := cdsCotaAnterior.FieldByName('IDCOTACOTACAO').AsInteger;
         rCotacao.Periodo        := StrToInt(FormatDateTime('mm', cdsCotaAnterior.FieldByName('DATA').AsDateTime));
         rCotacao.Exercicio      := StrToInt(FormatDateTime('yyyy', cdsCotaAnterior.FieldByName('DATA').AsDateTime));
         rCotacao.dData          := cdsCotaAnterior.FieldByName('DATA').AsDateTime;
         rCotacao.fQtdCotas      := cdsCotaAnterior.FieldByName('QTDCOTA').AsFloat;
         rCotacao.fVlrCota       := cdsCotaAnterior.FieldByName('VLRCOTA').AsFloat;
         rCotacao.fVlrPatrimonio := cdsCotaAnterior.FieldByName('VLRPATRIMONIO').AsFloat;
         rCotacao.bPrimeiraCota  := false;
      end
      else
      begin
         rCotacao.IDCotaCotacao  := -1;
         rCotacao.Periodo        := -1;
         rCotacao.Exercicio      := -1;
         rCotacao.dData          := -1;
         rCotacao.fQtdCotas      := 0;
         rCotacao.fVlrCota       := CtrlParamCota.VlrPrimeira;
         rCotacao.fVlrPatrimonio := 0;
         rCotacao.bPrimeiraCota  := true;
      end;

      Result := rCotacao;

   finally
      FreeAndNil(cdsCotaAnterior);
   end;
end;




procedure TCtrlCotaCotacao.SetCdsCotaCotacao(const Value: TCMClientDataSet);
begin
   FCdsCotaCotacao := Value;
end;



function NumeroIngles(fValor: extended): String;
var
   cAux : char;
begin
   cAux := DecimalSeparator;
   DecimalSeparator  := '.';

   Result := FloatToStr(fValor);

   DecimalSeparator  := cAux;
end;



procedure TCtrlCotaCotacao.SetCdsAtivosAConsolidar(const Value: TCMClientDataSet);
begin
   FCdsAtivosAConsolidar := Value;
end;



procedure TCtrlCotaCotacao.SetCdsAtivosConsolidados(const Value: TCMClientDataSet);
begin
   FCdsAtivosConsolidados := Value;
end;



function TCtrlCotaCotacao.ExisteCotaAtivo(const IDAtivo : Integer;
                                          const IDPlano : Integer;
                                          const IDPatro : Integer;
                                          const dData   : TDateTime
                                         ): Boolean;
var
   sSQL     : String;
   sData    : String;
   cdsCota  : TCMClientDataSet;
begin
   Result   := False;
   cdsCota  := TCMClientDataSet.Create(nil);
   sData    := QuotedStr(FormatDateTime('dd/mm/yyyy', dData));

   sSQL     :=
   'SELECT '                                                + #13 +
   '   IDATIVOCOTA '                                        + #13 +
   'FROM '                                                  + #13 +
   '   COTACOTACAO CCO '                                    + #13 +
   'WHERE '                                                 + #13 +
   '       CCO.IDATIVOCOTA = ' + FormatFloat('#0', IDAtivo) + #13 +
   '   AND CCO.IDPLANO     = ' + FormatFloat('#0', IDPlano) + #13 +
   '   AND CCO.IDPATRO     = ' + FormatFloat('#0', IDPatro) + #13;

   if dData > -1 then sSQL := sSQL +
   '   AND CCO.DATA      = TO_DATE(' + sData + ', ''dd/mm/yyyy'') ';

   try
      try
         cdsCota.Data := GetDataPacket(sSQL);

         if not(cdsCota.IsEmpty) then Result := True;
      except

      end;

   finally
      FreeAndNil(cdsCota);
   end;
end;



function TCtrlCotaCotacao.ApagaCota(const IDAtivo  : Integer;
                                    const IDPlano  : Integer;
                                    const IDPatro  : Integer;
                                    const dDataIni : TDateTime;
                                    const dDataFim : TDateTime
                                   ): Boolean;
var
   sSQL     : String;
   sSQL2    : String;
   sSQLFluxo: String;
   sDataIni : String;
   sDataFim : String;
begin
   //AL_7 - Ini
   sSQL2 := '';
   if (IDAtivo = -1) and (IDPlano = -1) and (IDPatro = -1) and (dDataIni = -1) and (dDataFim = -1) then
   begin
      sSQLFluxo :=
      'DELETE FROM FLUXOCOTA ';
      sSQL :=
      'DELETE FROM COTACOTACAO ';

      sSQL2 :=
      'UPDATE '                           + #13 +
      '   PARAMCOTA '                     + #13 +
      'SET '                              + #13 +
      '   DTFECHAMANUAL       = NULL, '   + #13 +
      '   DTFECHAEP           = NULL, '   + #13 +
      '   DTFECHAIMOB         = NULL, '   + #13 +
      '   DTFECHARF           = NULL, '   + #13 +
      '   DTFECHARV           = NULL, '   + #13 +
      '   DTFECHABMF          = NULL, '   + #13 +
      '   DTFECHAFUNDORF      = NULL, '   + #13 +
      '   DTFECHAFUNDORV      = NULL, '   + #13 +
      '   DTFECHAFUNDOIMOB    = NULL, '   + #13 +
      '   DTFECHAFUNDODIC     = NULL, '   + #13 +

      '   DTABREMANUAL        = NULL, '   + #13 +
      '   DTABREEP            = NULL, '   + #13 +
      '   DTABREIMOB          = NULL, '   + #13 +
      '   DTABRERF            = NULL, '   + #13 +
      '   DTABRERV            = NULL, '   + #13 +
      '   DTABREBMF           = NULL, '   + #13 +
      '   DTABREFUNDORF       = NULL, '   + #13 +
      '   DTABREFUNDORV       = NULL, '   + #13 +
      '   DTABREFUNDOIMOB     = NULL, '   + #13 +
      '   DTABREFUNDODIC      = NULL, '   + #13 +
      '   DTPRIMMANUAL        = NULL, '   + #13 +

      '   DTPRIMEP            = NULL, '   + #13 +
      '   DTPRIMIMOB          = NULL, '   + #13 +
      '   DTPRIMRF            = NULL, '   + #13 +
      '   DTPRIMRV            = NULL, '   + #13 +
      '   DTPRIMBMF           = NULL, '   + #13 +
      '   DTPRIMFUNDORF       = NULL, '   + #13 +
      '   DTPRIMFUNDORV       = NULL, '   + #13 +
      '   DTPRIMFUNDOIMOB     = NULL, '   + #13 +
      '   DTPRIMFUNDODIC      = NULL  ';
   end
   else
   begin
      sDataIni := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataIni));
      sDataFim := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim));

      sSQLFluxo :=
      'DELETE FROM FLUXOCOTA '                                                   + #13 +
      'WHERE IDCOTACOTACAO IN '                                                  + #13 +
      '          (SELECT IDCOTACOTACAO '                                         + #13 +
      '           FROM COTACOTACAO CCO '                                         + #13 +
      '           WHERE CCO.DATA BETWEEN TO_DATE(' + sDataIni + ', ''dd/mm/yyyy'') AND '  + #13 +
      '                                  TO_DATE(' + sDataFim + ', ''dd/mm/yyyy'') '      + #13;
      if IDAtivo > 0 then sSQL := sSQL +
         '             AND CCO.IDATIVOCOTA   = ' + FormatFloat('#0', IDAtivo)    + #13;
      if IDPlano > 0 then sSQL := sSQL +
         '             AND CCO.IDPLANO       = ' + FormatFloat('#0', IDPlano)    + #13;
      if IDPatro > 0 then sSQL := sSQL +
         '             AND CCO.IDPATRO       = ' + FormatFloat('#0', IDPatro)    + #13;
      sSQLFluxo := sSQLFluxo + ') ';

      sSQL :=
      'DELETE FROM COTACOTACAO CCO '                                             + #13 +
      'WHERE '                                                                   + #13 +
      '       CCO.DATA      BETWEEN TO_DATE(' + sDataIni + ', ''dd/mm/yyyy'') '  +
                               'AND TO_DATE(' + sDataFim + ', ''dd/mm/yyyy'') '  + #13;

      if IDAtivo > 0 then sSQL := sSQL +
      '   AND CCO.IDATIVOCOTA   = ' + FormatFloat('#0', IDAtivo)                 + #13;

      if IDPlano > 0 then sSQL := sSQL +
      '   AND CCO.IDPLANO       = ' + FormatFloat('#0', IDPlano)                 + #13;

      if IDPatro > 0 then sSQL := sSQL +
      '   AND CCO.IDPATRO       = ' + FormatFloat('#0', IDPatro);

   end;

   try
      if sSQL2 <> '' then
         ExecSQL(sSQL2);

      ExecSQL(sSQLFluxo);
      ExecSQL(sSQL);

      Result := True;
   except
      Result := False;
   end;
   //AL_7 - Fim
end;



function TCtrlCotaCotacao.ApagaCotaPorSegmento(const TipoCota : tTipoCota;
                                               const dDataIni : TDateTime;
                                               const dDataFim : TDateTime
                                              ): Boolean;
var
   sSQL          : String;
   sDataIni      : String;
   sDataFim      : String;
   sTipoAtivo    : String;
   iNumeroModulo : Integer;
begin
   case TipoCota of
      ttHstMovCota  : begin iNumeroModulo := 1;  sTipoAtivo := 'MANUAL ';    end;
      ttEmprestimo  : begin iNumeroModulo := 2;  sTipoAtivo := 'EP ';        end;
      ttImobiliario : begin iNumeroModulo := 3;  sTipoAtivo := 'IMOB ';      end;
      ttRF          : begin iNumeroModulo := 4;  sTipoAtivo := 'RF ';        end;
      ttRV          : begin iNumeroModulo := 5;  sTipoAtivo := 'RV ';        end;
      ttBMF         : begin iNumeroModulo := 6;  sTipoAtivo := 'BMF ';       end;
      ttFundoRF     : begin iNumeroModulo := 7;  sTipoAtivo := 'FUNDORF ';   end;
      ttFundoRV     : begin iNumeroModulo := 8;  sTipoAtivo := 'FUNDORV ';   end;
      ttFundoImob   : begin iNumeroModulo := 9;  sTipoAtivo := 'FUNDOIMOB '; end;
      ttFundoDIC    : begin iNumeroModulo := 10; sTipoAtivo := 'FUNDODIC ';  end;
   end;

   sDataIni := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataIni));
   sDataFim := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim));

   //AL_7 - Exclui o Fluxo da Cota (Memória de Cálculo)
   // ----------------------------------------------------------------------------------------------
   sSQL :=
   'DELETE FROM FLUXOCOTA '                                                   + #13 +
   'WHERE IDCOTACOTACAO IN '                                                  + #13 +
   '       (SELECT IDCOTACOTACAO '                                            + #13 +
   '        FROM COTACOTACAO CCO '                                            + #13 +
   '        WHERE CCO.DATA BETWEEN TO_DATE(' + sDataIni + ', ''dd/mm/yyyy'') AND ' + #13 +
   '                               TO_DATE(' + sDataFim + ', ''dd/mm/yyyy'') '     + #13 +
   '          AND CCO.ORIGEM   = ' + IntToStr(iNumeroModulo) + ')';

   try
      ExecSQL(sSQL);

      Result := True;
   except
      Result := False;
   end;

   // Exclui a Cota
   // ----------------------------------------------------------------------------------------------
   sSQL :=
   'DELETE FROM COTACOTACAO CCO '                                             + #13 +
   'WHERE '                                                                   + #13 +
   '       CCO.DATA     BETWEEN TO_DATE(' + sDataIni + ', ''dd/mm/yyyy'') '   +
                           'AND TO_DATE(' + sDataFim + ', ''dd/mm/yyyy'') '   + #13 +
   '   AND CCO.ORIGEM   = ' + IntToStr(iNumeroModulo);

   try
      ExecSQL(sSQL);

      Result := True;
   except
      Result := False;
   end;

   // Limpa a data do último fechamento
   // ----------------------------------------------------------------------------------------------
   sSQL :=
   'UPDATE PARAMCOTA SET DTFECHA' + sTipoAtivo + ' = NULL';

   try
      ExecSQL(sSQL);

      Result := True;
   except
      Result := False;
   end;
   // ----------------------------------------------------------------------------------------------
end;

function TCtrlCotaCotacao.RetornaCotaPonderada(Const dData   : TDateTime;
                                               Const CdsAtivos : TCMClientDataSet;
                                               Const sPlanos : String;
                                               Const iPatro  : Integer) : Extended;
var
   cdsCotaPonderada : TCMClientDataSet;
   sSQL             : String;

   eTotPatr : Extended;
   eTotCota : Extended;
   iCount, i : Integer;

begin
   if dData = CtrlParamCota.DtPrimeira then
   begin
        Result := CtrlParamCota.VlrPrimeira;
        Exit;
   end;

   cdsCotaPonderada := TCMClientDataSet.Create(nil);
   //AL_4
   cdsAtivos.First;
   i := 0;

   sSQL :=
   'SELECT '                                                                     + #13 +
   '   CC1.DATA, CC1.VLRPATRIMONIO, CC1.QTDCOTA, CC1.VLRCOTA, CC1.VLRCOTIZADO, ' + #13 +
   '   CC1.VLRRENTABILIZADO '                                                    + #13 +
   'FROM '                                                                       + #13 +
   '   COTACOTACAO CC1'                                                          + #13 +
   'WHERE '                                                                      + #13 +
   '       (CC1.IDATIVOCOTA  IN (' + cdsAtivos.Fields[0].AsString;
   cdsAtivos.Next;
   while not cdsAtivos.Eof do
   begin
      Inc(i);
      if i > 999 then
      begin
         sSQL := sSQL + ') OR ' + #13 + '       CC1.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
         i := 0;
      end
      else
         sSQL := sSQL + ', ' + cdsAtivos.Fields[0].AsString;
      cdsAtivos.Next;
   end;
   sSQL := sSQL + ')) '                                                           + #13 +
   '   AND CC1.DATA         = ( '                                                + #13 +
   '                          SELECT '                                           + #13 +
   '                             MAX(DATA) '                                     + #13 +
   '                          FROM '                                             + #13 +
   '                             COTACOTACAO CC2 '                               + #13 +
   '                          WHERE '                                            + #13 +
   '                                 CC2.DATA       <= TO_DATE(' + '''' + DateToStr(dData) + '''' + ', ''DD/MM/YYYY'') '    + #13 +
   '                             AND CC2.IDATIVOCOTA = CC1.IDATIVOCOTA '         + #13 +
   '                             AND CC2.IDPLANO     = CC1.IDPLANO '             + #13 +
   '                             AND CC2.IDPATRO     = CC1.IDPATRO '             + #13 +
   '                          ) '                                                + #13 +
   '   AND(NVL(CC1.QTDCOTA, 0) <> 0)      '                                      + #13 +
   '   AND(NVL(CC1.VLRPATRIMONIO, 0) <> 0)        '                              + #13;

   if sPlanos <> '' then sSQL := sSQL +
   '   AND CC1.IDPLANO        IN (' + sPlanos + ')'                              + #13;

   if iPatro > 0 then sSQL := sSQL +
   '   AND CC1.IDPATRO          = ' + FormatFloat('#0', iPatro)                  + #13;

   cdsCotaPonderada.Data := GetDataPacket(sSQL);

   cdsCotaPonderada.First;

   eTotPatr := 0;
   eTotCota := 0;

   iCount := cdsCotaPonderada.RecordCount;

   while not cdsCotaPonderada.Eof do
   begin
      if iCount = 1 then
      begin
         Result := cdsCotaPonderada.FieldByName('VLRCOTA').AsFloat;
         Exit;
      end;

      eTotPatr := eTotPatr + (cdsCotaPonderada.FieldByName('QTDCOTA').AsFloat *
                              cdsCotaPonderada.FieldByName('VLRCOTA').AsFloat);

      eTotCota := eTotCota + cdsCotaPonderada.FieldByName('QTDCOTA').AsFloat;


      cdsCotaPonderada.Next;
   end;

   try
      Result := (eTotPatr / eTotCota);
   except
         Result := CtrlParamCota.VlrPrimeira;
   end;
end;

procedure TCtrlCotaCotacao.SetDBFluxoCota(const Value: TDbFluxoCota);
begin
  FDBFluxoCota := Value;
end;

end.
