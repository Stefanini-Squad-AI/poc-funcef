unit uCtrlInvFI;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMMath,
     uCMFileUtils, uCMTypes, uFuncoesInvest;

type
   TCtrlInvFI = Class(TCmControlObject)
   private
    FVlrTotCustoAtual: Double;
    FTotQtdFundo: Double;
    FVlrTotIrProv: Double;
    FTotCotasMovFundo: Double;
    FVlrTotVariacao: Double;
    FTotSldLiquido: Double;
    FVlrTotAplicado: Double;
    FVlrTotMovFundo: Double;
    FVlrTotIofProv: Double;
    FTotSldFundo: Double;
    procedure SetTotCotasMovFundo(const Value: Double);
    procedure SetTotQtdFundo(const Value: Double);
    procedure SetTotSldFundo(const Value: Double);
    procedure SetTotSldLiquido(const Value: Double);
    procedure SetVlrTotAplicado(const Value: Double);
    procedure SetVlrTotCustoAtual(const Value: Double);
    procedure SetVlrTotIofProv(const Value: Double);
    procedure SetVlrTotIrProv(const Value: Double);
    procedure SetVlrTotMovFundo(const Value: Double);
    procedure SetVlrTotVariacao(const Value: Double);


   public
      // ------------------- Metodos da Control --------------------------------
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;
      // ------------------- Propriedades da Control ---------------------------
      property VlrTotAplicado: Double read FVlrTotAplicado write SetVlrTotAplicado;
      property VlrTotIrProv: Double read FVlrTotIrProv write SetVlrTotIrProv;
      property VlrTotIofProv: Double read FVlrTotIofProv write SetVlrTotIofProv;
      property VlrTotVariacao: Double read FVlrTotVariacao write SetVlrTotVariacao;
      property TotCotasMovFundo: Double read FTotCotasMovFundo write SetTotCotasMovFundo;
      property VlrTotMovFundo: Double read FVlrTotMovFundo write SetVlrTotMovFundo;
      property TotQtdFundo: Double read FTotQtdFundo write SetTotQtdFundo;
      property TotSldFundo: Double read FTotSldFundo write SetTotSldFundo;
      property VlrTotCustoAtual: Double read FVlrTotCustoAtual write SetVlrTotCustoAtual;
      property TotSldLiquido: Double read FTotSldLiquido write SetTotSldLiquido;

      // ------------------- Metodos de Listagem -------------------------------
      function ListSldHistFundos(dDataSaldo: TDateTime;
                                 iIdCarteira: Integer = -1;      
                                 iIdFundos: Integer = -1;
                                 iIdPlanPrevCtbPatr: Integer = -1;
                                 iIdTipoInvest: Integer = -1;
                                 iIdTipoCota: Integer = -1;
                                 sTipoMov : String = ''; sNatureza : String = '') : OleVariant;

      // ------------------- Metodos de Update ---------------------------------



      // ------------------- Metodos de Processamento --------------------------



      // ------------------- Métodos Diversos ----------------------------------
      function BuscaSaldoFundos(dDataSaldo: TDateTime;
                                iIdTipoResult: Integer = -1;
                                iIdCarteira: Integer = -1;
                                iIdFundos: Integer = -1;
                                iIdPlanPrevCtbPatr: Integer = -1;
                                iIdTipoInvest: Integer = -1;
                                iIdTipoCota: Integer = -1;
                                sTipoMov : String = ''; sNatureza : String = '') : Boolean;


   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  Override;
   end;

implementation

{ TCtrlInvRF }

procedure TCtrlInvFI.DoChangeDataBase;
begin
   inherited;
   //FDbObject.DataBaseName := DataBaseName;
end;

procedure TCtrlInvFI.AfterInitialize;
begin
   inherited;
   //CtrlObject.InitializeAs(Padroes);
end;

// ------------------- Metodos da Públicos -------------------------------------
// ------------------- Metodos da Control --------------------------------------
constructor TCtrlInvFI.Create;
begin
   inherited;
   //FDbObject := TDbObject.Create(Self);
   //CtrlObject := TCtrlObject.Create;
   //CtrlObject.InitializeAs(Padroes);
   //UnitdeFuncoes := TUnitdeFoncoes.Create;

end;

destructor TCtrlInvFI.Destroy;
begin
   inherited;
   //FreeAndNil(FDbObject);
   //if IsAppServer then
   //   FreeAndNil(FCds);

end;

procedure TCtrlInvFI.OnCreateAppServer;
begin
   inherited;
   //FCds := TClientDataSet.Create(nil);

end;

// ------------------- Propriedades da Control ---------------------------------


// ------------------- Metodos de Update ---------------------------------------


// ------------------- Metodos de Processamento --------------------------------


// ------------------- Metodos de Listagem -------------------------------------

function TCtrlInvFI.ListSldHistFundos(dDataSaldo: TDateTime;
                                      iIdCarteira, iIdFundos, iIdPlanPrevCtbPatr, iIdTipoInvest, iIdTipoCota: Integer;
                                      sTipoMov, sNatureza : String): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql+'SELECT DISTINCT /*+INDEX (H1.XPKHISTFUNDO)*/ '+#13+
                '       FI.DESCFUNDOINVEST   , TF.DESCTIPOFUNDOINV  , PL.PLANPRVCONTABPATRO, TC.DESCTIPOCOTA, '+#13+
                '       H1.IDHISTFUNDO       , H1.CODDOCUMENTO      , H1.PLNCODIGO         , H1.PLANO             , '+#13+
                '       H1.IDTIPOINVEST      , H1.IDTIPOOPERACAO    , H1.IDCARTEIRAINVEST  , H1.IDFUNDOINVEST     , '+#13+
                '       H1.DATAAPLICACAO     , H1.DATAMOVFUNDO      , H1.HISTMOVFUNDO      , H1.NATURMOVFUNDO     , '+#13+
                '       H1.TIPMOVFUNDO       , H1.VLRAPLICADO       , NVL(H1.VLRIRPROV,0) AS VLRIRPROV  , NVL(H1.VLRIOFPROV,0) AS VLRIOFPROV , '+#13+
                '       H1.VLRVARIACAO       , H1.COTASMOVFUNDO     , H1.VLRMOVFUNDO       , H1.FLGCALCSALDO      , '+#13+
                '       H1.SALDOQTDCOTAS     , H1.SALDOVLRFUNDO     , H1.COTAAPLICACAO AS VLRCOTAAPLICACAO, '+#13+
                '       H1.SALDOQTDCOTASBLQ  , '+#13+
                '       CF.VLRCOTA AS VLRCOTAATUAL, '+#13+
                '      (H1.SALDOVLRFUNDO-(NVL(H1.VLRIOFPROV,0))) AS  SALDOLIQUIDO '+#13+
                'FROM HISTFUNDO H1, COTAFUNDO CF, VWPLANPREVCTBPATR PL, TIPOCOTA TC, TIPOFUNDOINVEST TF, '+#13+
                '    (SELECT HF1.IDFUNDOINVEST, HF1.DESCFUNDOINVEST, HF1.IDTIPOFUNDOINVEST '+#13+
                '     FROM   HISTFUNDOINVEST HF1 '+#13+
                '     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN '+#13+
                '           (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') '+#13+
                '            FROM HISTFUNDOINVEST HF '+#13+
                '            WHERE '+#13+
                '                (HF.IDTIPOFUNDOINVEST > 0 '+#13;
   if iIdFundos > 0 then
      sSql := sSql+'            AND (HF.IDFUNDOINVEST     = '+IntToStr(iIdFundos)+') '+#13
   else
      sSql := sSql+'            AND (HF.IDFUNDOINVEST     > 0) '+#13;

   if iIdCarteira > 0 then
      sSql := sSql+'            AND (HF.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteira)+') '+#13
   else
      sSql := sSql+'            AND (HF.IDCARTEIRAINVEST  > 0) '+#13;

   if dDataSaldo > 0 then
      sSql := sSql+'            AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DateToStr(dDataSaldo))+','+QuotedStr('DD/MM/YYYY')+')+1) '+#13;
   sSql := sSql+'            GROUP BY HF.IDFUNDOINVEST))) FI '+#13+
                'WHERE '+#13+
                '    (H1.IDHISTFUNDO IN ( '+#13+
                '                SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ MAX(H.IDHISTFUNDO) AS IDHISTFUNDO '+#13+
                '                FROM HISTFUNDO H, '+#13+
                '                    (SELECT IDTIPOINVEST, IDTIPOOPERACAO '+#13+
                '                     FROM TIPOOPERACAO '+#13;
   if iIdTipoInvest > 0 then
      sSql := sSql+'                     WHERE (IDTIPOINVEST = '+IntToStr(iIdTipoInvest)+') AND (NATUREZAOPERACAO <> ''R'')) TP '+#13
   else
      sSql := sSql+'                     WHERE (IDTIPOINVEST > 0) AND (NATUREZAOPERACAO <> ''R'')) TP '+#13;

   sSql := sSql+'                WHERE '+#13;

   if iIdTipoInvest > 0 then
      sSql := sSql+'                    (H.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') '+#13
   else
      sSql := sSql+'                    (H.IDTIPOINVEST      > 0) '+#13;

   if iIdPlanPrevCtbPatr > 0 then
      sSql := sSql+'                AND (H.IDPLANPREVCTBPATR = '+IntToStr(iIdPlanPrevCtbPatr)+') '+#13
   else
      sSql := sSql+'                AND (H.IDPLANPREVCTBPATR > 0) '+#13;

   if iIdFundos > 0 then
      sSql := sSql+'                AND (H.IDFUNDOINVEST     = '+IntToStr(iIdFundos)+') '+#13
   else
      sSql := sSql+'                AND (H.IDFUNDOINVEST     > 0) '+#13;

   sSql := sSql+'                AND (H.DATAAPLICACAO    <= TO_DATE('+QuotedStr(DateToStr(dDataSaldo))+','+QuotedStr('DD/MM/YYYY')+')) '+#13+
                '                AND (H.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DateToStr(dDataSaldo))+','+QuotedStr('DD/MM/YYYY')+')) '+#13;

   if iIdTipoCota > 0 then
      sSql := sSql+'                AND (H.IDTIPOCOTA     = '+IntToStr(iIdTipoCota)+') '+#13;

   if sTipoMov <> '' then
      sSql := sSql+'                AND (H.TIPMOVFUNDO    = '+QuotedStr(sTipoMov)+') '+#13
   else
      sSql := sSql+'                AND (H.TIPMOVFUNDO   <> ''PIR'') '+#13;

   if sNatureza <> '' then
      sSql := sSql+'                AND (H.NATURMOVFUNDO  = '+QuotedStr(sNatureza)+') '+#13;

   sSql := sSql+'                AND (TP.IDTIPOINVEST      = H.IDTIPOINVEST) '+#13+
                '                AND (TP.IDTIPOOPERACAO    = H.IDTIPOOPERACAO) '+#13+
                '                GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO, H.DATAMOVFUNDO)) '+#13;

   sSql := sSql+'AND (H1.SALDOQTDCOTAS > 0) '+#13+
                'AND (CF.IDFUNDOINVEST(+)  = H1.IDFUNDOINVEST) '+#13+
                'AND (CF.DATACOTA(+)       = H1.DATAMOVFUNDO) '+#13+
                'AND (TC.IDTIPOCOTA(+)     = H1.IDTIPOCOTA) '+#13+
                'AND (PL.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR) '+#13+
                'AND (FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST) '+#13+
                'AND (TF.IDTIPOINVEST      = H1.IDTIPOINVEST) '+#13+
                'AND (TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST) '+#13+
                'ORDER BY PL.PLANPRVCONTABPATRO, TF.DESCTIPOFUNDOINV, FI.DESCFUNDOINVEST, H1.DATAAPLICACAO, TC.DESCTIPOCOTA '+#13;
   Result := GetDataPacket(sSql);
end;

// ------------------- Métodos Diversos ----------------------------------

function TCtrlInvFI.BuscaSaldoFundos(dDataSaldo: TDateTime;
                                     iIdTipoResult, iIdCarteira, iIdFundos, iIdPlanPrevCtbPatr, iIdTipoInvest, iIdTipoCota : Integer;
                                     sTipoMov, sNatureza : String): Boolean;
var sSql : String;
    _CdsLocal : TClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.BuscaSaldoFundos(dDataSaldo, iIdTipoResult, iIdCarteira, iIdFundos, iIdPlanPrevCtbPatr,
                                                      iIdTipoInvest, iIdTipoCota, sTipoMov, sNatureza);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         FVlrTotCustoAtual:= 0;
         FTotQtdFundo:= 0;
         FVlrTotIrProv:= 0;
         FTotCotasMovFundo:= 0;
         FVlrTotVariacao:= 0;
         FTotSldLiquido:= 0;
         FVlrTotAplicado:= 0;
         FVlrTotMovFundo:= 0;
         FVlrTotIofProv:= 0;
         FTotSldFundo:= 0;
         try      
            sSql := '';
            sSql := sSql+'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/ '+#13+
                         '   SUM(NVL(H1.VLRAPLICADO,0))   AS VLRAPLICADO, '+#13+
                         '   SUM(NVL(H1.VLRIRPROV,0))     AS VLRIRPROV, '+#13+
                         '   SUM(NVL(H1.VLRIOFPROV,0))    AS VLRIOFPROV, '+#13+
                         '   SUM(NVL(H1.VLRVARIACAO,0))   AS VLRVARIACAO, '+#13+
                         '   SUM(NVL(H1.COTASMOVFUNDO,0)) AS COTASMOVFUNDO, '+#13+
                         '   SUM(NVL(H1.VLRMOVFUNDO,0))   AS VLRMOVFUNDO, '+#13+
                         '   SUM(NVL(H1.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS, '+#13+
                         '   SUM(NVL(H1.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO, '+#13+
                         '   SUM(NVL(H1.VLRCUSTOATUAL,0)) AS VLRCUSTOATUAL, '+#13+
                         '   SUM((NVL(H1.SALDOVLRFUNDO,0)-(NVL(H1.VLRIOFPROV,0)+NVL(H1.VLRIRPROV,0)))) AS  SALDOLIQUIDO '+#13+
                         'FROM '+#13+
                         '   HISTFUNDO H1, '+#13+
                         '    (SELECT HF1.IDFUNDOINVEST, HF1.DESCFUNDOINVEST, HF1.IDTIPOFUNDOINVEST '+#13+
                         '     FROM   HISTFUNDOINVEST HF1 '+#13+
                         '     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN '+#13+
                         '           (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') '+#13+
                         '            FROM HISTFUNDOINVEST HF '+#13+
                         '            WHERE '+#13+
                         '                (HF.IDTIPOFUNDOINVEST    > 0) '+#13;
            if iIdFundos > 0 then
               sSql := sSql+'            AND (HF.IDFUNDOINVEST     = '+IntToStr(iIdFundos)+') '+#13
            else
               sSql := sSql+'            AND (HF.IDFUNDOINVEST     > 0) '+#13;

            if iIdCarteira > 0 then
               sSql := sSql+'            AND (HF.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteira)+') '+#13
            else
               sSql := sSql+'            AND (HF.IDCARTEIRAINVEST  > 0) '+#13;

            if dDataSaldo > 0 then
               sSql := sSql+'            AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DateToStr(dDataSaldo))+','+QuotedStr('DD/MM/YYYY')+')+1) '+#13;

            sSql := sSql+'            GROUP BY HF.IDFUNDOINVEST))) FI '+#13+
                         'WHERE '+#13+
                         '     (H1.IDHISTFUNDO IN (SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ MAX(H.IDHISTFUNDO) AS IDHISTFUNDO '+#13+
                         '                         FROM HISTFUNDO H, '+#13+
                         '                              (SELECT IDTIPOINVEST, IDTIPOOPERACAO '+#13+
                         '                               FROM TIPOOPERACAO '+#13;
            if iIdTipoInvest > 0 then
               sSql := sSql+'                               WHERE (IDTIPOINVEST = '+IntToStr(iIdTipoInvest)+') AND (NATUREZAOPERACAO <> ''R'')) TP '+#13
            else
               sSql := sSql+'                               WHERE (IDTIPOINVEST > 0) AND (NATUREZAOPERACAO <> ''R'')) TP '+#13;

            sSql := sSql+'                         WHERE '+#13;

            if iIdTipoInvest > 0 then
               sSql := sSql+'                             (H.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') '+#13
            else
               sSql := sSql+'                             (H.IDTIPOINVEST      > 0) '+#13;

            if iIdPlanPrevCtbPatr > 0 then
               sSql := sSql+'                         AND (H.IDPLANPREVCTBPATR = '+IntToStr(iIdPlanPrevCtbPatr)+') '+#13
            else
               sSql := sSql+'                         AND (H.IDPLANPREVCTBPATR > 0) '+#13;

            if iIdFundos > 0 then
               sSql := sSql+'                         AND (H.IDFUNDOINVEST     = '+IntToStr(iIdFundos)+') '+#13
            else
               sSql := sSql+'                         AND (H.IDFUNDOINVEST     > 0) '+#13;

            sSql := sSql+'                         AND (H.DATAAPLICACAO    <= TO_DATE('+QuotedStr(DateToStr(dDataSaldo))+','+QuotedStr('DD/MM/YYYY')+')) '+#13+
                         '                         AND (H.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DateToStr(dDataSaldo))+','+QuotedStr('DD/MM/YYYY')+')) '+#13;

            if iIdTipoCota > 0 then
               sSql := sSql+'                         AND (H.IDTIPOCOTA     = '+IntToStr(iIdTipoCota)+') '+#13;

            if sTipoMov <> '' then
               sSql := sSql+'                         AND (H.TIPMOVFUNDO    = '+QuotedStr(sTipoMov)+') '+#13
            else
               sSql := sSql+'                         AND (H.TIPMOVFUNDO   <> ''PIR'') '+#13;

            if sNatureza <> '' then
               sSql := sSql+'                         AND (H.NATURMOVFUNDO  = '+QuotedStr(sNatureza)+') '+#13;

            sSql := sSql+'                         AND (TP.IDTIPOINVEST      = H.IDTIPOINVEST) '+#13+
                         '                         AND (TP.IDTIPOOPERACAO    = H.IDTIPOOPERACAO) '+#13+
                         '                         GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO, H.DATAMOVFUNDO)) '+#13+
                         'AND (H1.SALDOQTDCOTAS > 0) '+#13+
                         'AND (H1.IDFUNDOINVEST = FI.IDFUNDOINVEST)'+#13;
            _CdsLocal      := TClientDataSet.Create(nil);
            _CdsLocal.Data := GetDataPacket(sSql);

            FVlrTotAplicado := _CdsLocal.FieldByName('VLRAPLICADO').AsFloat;
            FVlrTotIrProv := _CdsLocal.FieldByName('VLRIRPROV').AsFloat;
            FVlrTotIofProv := _CdsLocal.FieldByName('VLRIOFPROV').AsFloat;
            FVlrTotVariacao := _CdsLocal.FieldByName('VLRVARIACAO').AsFloat;
            FTotCotasMovFundo := _CdsLocal.FieldByName('COTASMOVFUNDO').AsFloat;
            FVlrTotMovFundo := _CdsLocal.FieldByName('VLRMOVFUNDO').AsFloat;
            FTotQtdFundo := _CdsLocal.FieldByName('SALDOQTDCOTAS').AsFloat;
            FTotSldFundo := _CdsLocal.FieldByName('SALDOVLRFUNDO').AsFloat;
            FVlrTotCustoAtual := _CdsLocal.FieldByName('VLRCUSTOATUAL').AsFloat;
            FTotSldLiquido := _CdsLocal.FieldByName('SALDOLIQUIDO').AsFloat;

            Result := True;            
         except
            On E: Exception do
            begin
               FVlrTotCustoAtual:= 0;
               FTotQtdFundo:= 0;
               FVlrTotIrProv:= 0;
               FTotCotasMovFundo:= 0;
               FVlrTotVariacao:= 0;
               FTotSldLiquido:= 0;
               FVlrTotAplicado:= 0;
               FVlrTotMovFundo:= 0;
               FVlrTotIofProv:= 0;
               FTotSldFundo:= 0;
               
               Result := False;
               MessageInfo := E.Message
            end;
         end;

      finally
         FreeAndNil(_CdsLocal);
      end;
   end;
end;

procedure TCtrlInvFI.SetTotCotasMovFundo(const Value: Double);
begin
  FTotCotasMovFundo := Value;
end;

procedure TCtrlInvFI.SetTotQtdFundo(const Value: Double);
begin
  FTotQtdFundo := Value;
end;

procedure TCtrlInvFI.SetTotSldFundo(const Value: Double);
begin
  FTotSldFundo := Value;
end;

procedure TCtrlInvFI.SetTotSldLiquido(const Value: Double);
begin
  FTotSldLiquido := Value;
end;

procedure TCtrlInvFI.SetVlrTotAplicado(const Value: Double);
begin
  FVlrTotAplicado := Value;
end;

procedure TCtrlInvFI.SetVlrTotCustoAtual(const Value: Double);
begin
  FVlrTotCustoAtual := Value;
end;

procedure TCtrlInvFI.SetVlrTotIofProv(const Value: Double);
begin
  FVlrTotIofProv := Value;
end;

procedure TCtrlInvFI.SetVlrTotIrProv(const Value: Double);
begin
  FVlrTotIrProv := Value;
end;

procedure TCtrlInvFI.SetVlrTotMovFundo(const Value: Double);
begin
  FVlrTotMovFundo := Value;
end;

procedure TCtrlInvFI.SetVlrTotVariacao(const Value: Double);
begin
  FVlrTotVariacao := Value;
end;

end.

