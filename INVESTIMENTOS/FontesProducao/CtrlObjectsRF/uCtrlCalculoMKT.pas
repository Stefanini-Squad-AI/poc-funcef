//******************************************************************************
// Autor     : Marco Turon
// Data      : 29/11/2007
// Código    : AL_2
// Pendencia : 27000
// SOL       :
// Desc      : Ajuste na forma de cálculo de NTN solicitada pelo cliente
//******************************************************************************
// Autor     : Marco Turon
// Data      : 28/08/2007
// Código    : AL_1
// Pendencia : 25678
// SOL       :
// Desc      : Implementação de Marcação a Mercado - Criação da Ctrl
//******************************************************************************
unit uCtrlCalculoMKT;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, Math
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF}, uCMMath, Wwdbgrid, Grids, Graphics,
     uDbItemRenfix, uDbClasseRenfix, uDbCurvasrenfix, uCMFileUtils, uDbClassriscorenfix,
     uDbOperRenFix, uDbOperRenFixXCurvas, uDbHistRenFix, uDbHistRenFixXItens, uDbParamCalcMKT,
     UFuncoesInvest, uCtrlPadroes, uCtrlInvestimento, uCtrlDiasUteis, uCtrlParamInvest,
     uOperComum;

type
   TCtrlCalculoMKT = Class(TCmControlObject)
   private
      CdsAux: TClientDataSet;
      FCdsParamCalcMKT: TClientDataSet;
      FDbParamCalcMKT: TDbParamCalcMKT;
      FCdsMemoriaNTN: TClientDataSet;

      FPrepared: Boolean;

      FCalcForma: Integer;
      FCalcData: TDateTime;
      FCalcIDClasse: Integer;
      FCalcIDInv: Integer;
      FCalcIDOper: Integer;
      FCalcDTAplic: TDateTime;
      FCalcDTVenc: TDateTime;
      FCalcTXEmissao: Double;
      FCalcTXJuros: Double;
      FCalcTXIndic: Double;
      FCalcDiasUteis: Integer;

      FCTVlrPUPar: Double;
      FCTVlrCotacao: Double;
      FCTDataCotacao: TDateTime;

      FCTMMoeCodigo: Integer;
      FCTMValor: Double;
      FCTMSiglaMoeda: String;
      FCTMDescMoeda: String;
      FCTMData: TDateTime;

      FCTMIMoeCodigo: Integer;
      FCTMIValor: Double;
      FCTMISiglaMoeda: String;
      FCTMIDescMoeda: String;
      FCTMIData: TDateTime;

      FCVMValor: Double;
      FCVMVlrSJCom: Double;
      FCVMVlrSJEmi: Double;
      FCVMVlrSCEmi: Double;
      FCVMVlrSCCom: Double;

      FDiasUteis: TCtrlInvDiasUteis;
      FParamInvest: TCtrlParamInvest;

      procedure SetCdsParamCalcMKT(const Value: TClientDataSet);
      procedure SetDbParamCalcMKT(const Value: TDbParamCalcMKT);

      procedure SetCdsMemoriaNTN(const Value: TClientDataSet);

      procedure SetPrepared(const Value: Boolean);

      procedure SetCalcForma(const Value: Integer);
      procedure SetCalcData(const Value: TDateTime);
      procedure SetCalcIDClasse(const Value: Integer);
      procedure SetCalcIDInv(const Value: Integer);
      procedure SetCalcIDOper(const Value: Integer);
      procedure SetCalcDTAplic(const Value: TDateTime);
      procedure SetCalcDTVenc(const Value: TDateTime);
      procedure SetCalcTXEmissao(const Value: Double);
      procedure SetCalcTXJuros(const Value: Double);
      procedure SetCalcTXIndic(const Value: Double);
      procedure SetCalcDiasUteis(const Value: Integer);

      procedure SetCTDataCotacao(const Value: TDateTime);
      procedure SetCTVlrCotacao(const Value: Double);
      procedure SetCTVlrPUPar(const Value: Double);

      procedure SetCTMMoeCodigo(const Value: Integer);
      procedure SetCTMData(const Value: TDateTime);
      procedure SetCTMDescMoeda(const Value: String);
      procedure SetCTMSiglaMoeda(const Value: String);
      procedure SetCTMValor(const Value: Double);

      procedure SetCTMIMoeCodigo(const Value: Integer);
      procedure SetCTMIData(const Value: TDateTime);
      procedure SetCTMIDescMoeda(const Value: String);
      procedure SetCTMISiglaMoeda(const Value: String);
      procedure SetCTMIValor(const Value: Double);

      procedure SetCVMValor(const Value: Double);
      procedure SetCVMVlrSJCom(const Value: Double);
      procedure SetCVMVlrSJEmi(const Value: Double);
      procedure SetCVMVlrSCCom(const Value: Double);
      procedure SetCVMVlrSCEmi(const Value: Double);

      procedure SetDiasUteis(const Value: TCtrlInvDiasUteis);
      procedure SetParamInvest(const Value: TCtrlParamInvest);

   public
      //----------------  Métodos Externos  ------------------------------------
      AtualizaProcTela: procedure(sMsg: String; iMaximo: Integer = 0);
      procedure PintaGridZebrado(Sender: TObject; Field: TField; State:
                                 TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);


      //----------------  Métodos Próprios  ------------------------------------
      constructor Create; override;
      destructor Destroy; override;

      //----------------  Objetos para cadastros  ------------------------------
      property CdsParamCalcMKT: TClientDataSet read FCdsParamCalcMKT write SetCdsParamCalcMKT;
      property DbParamCalcMKT: TDbParamCalcMKT read FDbParamCalcMKT write SetDbParamCalcMKT;

      property CdsMemoriaNTN: TClientDataSet read FCdsMemoriaNTN write SetCdsMemoriaNTN;

      property Prepared: Boolean read FPrepared write SetPrepared;                    // Determina se o objeto esta preparado para calculo

      property CalcForma: Integer read FCalcForma write SetCalcForma;                 // Forma de Calculo (1-NTN 2-LTN 3-LFT)
      property CalcData: TDateTime read FCalcData write SetCalcData;                  // Data do Cálculo
      property CalcIDClasse: Integer read FCalcIDClasse write SetCalcIDClasse;        // ID da Classe do Título
      property CalcIDInv: Integer read FCalcIDInv write SetCalcIDInv;                 // ID do Investimento
      property CalcIDOper: Integer read FCalcIDOper write SetCalcIDOper;              // ID da operação de Aplicação
      property CalcDTAplic: TDateTime read FCalcDTAplic write SetCalcDTAplic;         // Data da Aplicação
      property CalcDTVenc: TDateTime read FCalcDTVenc write SetCalcDTVenc;            // Data de Vencimento
      property CalcTXEmissao: Double read FCalcTXEmissao write SetCalcTXEmissao;      // Taxa de Emissão na Compra
      property CalcTXJuros: Double read FCalcTXJuros write SetCalcTXJuros;            // Taxa de Juros na Compra
      property CalcTXIndic: Double read FCalcTXIndic write SetCalcTXIndic;            // Taxa Indicativa
      property CalcDiasUteis: Integer read FCalcDiasUteis write SetCalcDiasUteis;     // Nº dias uteis entre: data atual e vencimento

      property CTDataCotacao: TDateTime read FCTDataCotacao write SetCTDataCotacao;   // Data da Cotação e do PU par
      property CTVlrCotacao: Double read FCTVlrCotacao write SetCTVlrCotacao;         // Valor da Cotação
      property CTVlrPUPar: Double read FCTVlrPUPar write SetCTVlrPUPar;               // Valor do PU Par

      property CTMMoeCodigo: Integer read FCTMMoeCodigo write SetCTMMoeCodigo;        // Codigo da moeda de previsão de inflação
      property CTMDescMoeda: String read FCTMDescMoeda write SetCTMDescMoeda;         // Descrição da Moeda
      property CTMSiglaMoeda: String read FCTMSiglaMoeda write SetCTMSiglaMoeda;      // Sigla da moeda
      property CTMData: TDateTime read FCTMData write SetCTMData;                     // Data da cotação da moeda
      property CTMValor: Double read FCTMValor write SetCTMValor;                     // Valor da cotação da moeda

      property CTMIMoeCodigo: Integer read FCTMIMoeCodigo write SetCTMIMoeCodigo;     // Codigo da moeda da taxa indicativa
      property CTMIDescMoeda: String read FCTMIDescMoeda write SetCTMIDescMoeda;      // Descrição da Moeda
      property CTMISiglaMoeda: String read FCTMISiglaMoeda write SetCTMISiglaMoeda;   // Sigla da moeda
      property CTMIData: TDateTime read FCTMIData write SetCTMIData;                  // Data da cotação da moeda
      property CTMIValor: Double read FCTMIValor write SetCTMIValor;                  // Valor da cotação da moeda

      property CVMValor: Double read FCVMValor write SetCVMValor;                     // Valor de Mercado
      property CVMVlrSJCom: Double read FCVMVlrSJCom write SetCVMVlrSJCom;            // Somatório de PU de Juros na Compra
      property CVMVlrSJEmi: Double read FCVMVlrSJEmi write SetCVMVlrSJEmi;            // Somatório de PU de Juros na Emissão
      property CVMVlrSCCom: Double read FCVMVlrSCCom write SetCVMVlrSCCom;            // Somatório de PU de Correção na Compra
      property CVMVlrSCEmi: Double read FCVMVlrSCEmi write SetCVMVlrSCEmi;            // Somatório de PU de Correção na Emissão


      //----------------  Objetos Diversos     ---------------------------------
      property DiasUteis: TCtrlInvDiasUteis read FDiasUteis write SetDiasUteis;
      property ParamInvest: TCtrlParamInvest read FParamInvest write SetParamInvest;


      //----------------  Métodos de Listagem  ---------------------------------
      function ListAux(sSql: String): OleVariant;
      function ListParamCalcMKT(iClasse: Integer = -1; iFormato: Integer = -1): OleVariant;
      function ListFormaCalcMKT(iFormato: Integer = -1): OleVariant;
      function ListaInvCalcMKT(iClasse: Integer = -1; iInv: Integer = -1): OleVariant;
      function ListaFluxoNTN(bVazio: Boolean = False): OleVariant;


      //----------------  Métodos de Update em Banco  --------------------------
      function AplicaAtualParamCalcMKT: Boolean;


      //----------------  Métodos do Cálculo  ----------------------------------
      function Prepare(iInv: Integer; dDataAtual: TDateTime; cdsNTN: TClientDataSet = nil): Boolean;
      function UnPrepare(iInv: Integer = 0; dDataAtual: TDateTime = 0) : Boolean;
      function BuscaFormaCalcMKT(iInv: Integer = -1; iClasse: Integer = -1): Integer;
      function BuscaPUPar(iInv: Integer; DataVencto, DataCotacao: TDateTime): Boolean;
      function BuscaCotMoeda(iMoeda: Integer; dDataRef: TDateTime = 0): Boolean;
      function BuscaCotMoedaInd(iMoeda: Integer; dDataRef: TDateTime = 0): Boolean;
      function CalculaValorMKT(iInv: Integer = 0; dDataAtual: TDateTime = 0): Boolean;
      function CalculaNTN: Boolean;
      function CalculaLTN: Boolean;
      function CalculaLFT: Boolean;


   protected
      //----------------  Métodos Protegidos Próprios  -------------------------
      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;
      procedure AfterInitialize;  override;
   end;


var CtrlMKT: TCtrlCalculoMKT;


implementation

{TCtrlRendaFixa}

constructor TCtrlCalculoMKT.Create;
begin
   inherited;
   FDbParamCalcMKT := TDbParamCalcMKT.Create(Self);
   CtrlInvDiaUtil := TCtrlInvDiasUteis.Create;
   FDiasUteis := CtrlInvDiaUtil;
   CdsAux := TClientDataSet.Create(nil);
end;

destructor TCtrlCalculoMKT.Destroy;
begin
   if IsAppServer then
      FreeAndNil(FCdsParamCalcMKT);

   FreeAndNil(CdsAux);
   FreeAndNil(FDbParamCalcMKT);
   FreeAndNil(CtrlInvDiaUtil);

   inherited;
end;

procedure TCtrlCalculoMKT.OnCreateAppServer;
begin
   inherited;
   CdsParamCalcMKT := TClientDataSet.Create(nil);
end;

procedure TCtrlCalculoMKT.DoChangeDataBase;
begin
   inherited;
   FDbParamCalcMKT.DataBaseName := DataBaseName;
//   CtrlInvDiaUtil.DataBaseName := DataBaseName;
end;

function TCtrlCalculoMKT.ListAux(sSql : String): OleVariant;
begin
   Result := GetDataPacket(sSql);
end;

procedure TCtrlCalculoMKT.AfterInitialize;
begin
  inherited;
  CtrlInvDiaUtil.InitializeAs(Padroes);
end;

procedure TCtrlCalculoMKT.SetCdsParamCalcMKT(const Value: TClientDataSet);
begin
  FCdsParamCalcMKT := Value;
end;

procedure TCtrlCalculoMKT.SetDbParamCalcMKT(const Value: TDbParamCalcMKT);
begin
  FDbParamCalcMKT := Value;
end;

procedure TCtrlCalculoMKT.SetCdsMemoriaNTN(const Value: TClientDataSet);
begin
  FCdsMemoriaNTN := Value;
end;

procedure TCtrlCalculoMKT.SetPrepared(const Value: Boolean);
begin
  FPrepared := Value;
end;

function TCtrlCalculoMKT.ListParamCalcMKT(iClasse: Integer = -1; iFormato: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := 'SELECT C.DESCCLASSETIT, F.DESCFORMACALCMKT, P.IDFORMACALCMKT, P.IDCLASSETIT, P.IDPARAMCALCMKT ' + #13 +
           'FROM PARAMCALCMKT P, FORMACALCMKT F, CLASSETITRENFIX C ' + #13 +
           'WHERE P.IDFORMACALCMKT = F.IDFORMACALCMKT ' + #13 +
           '  AND P.IDCLASSETIT = C.IDCLASSETIT ';
           if iClasse > 0 then
              sSql := sSql + '  AND P.IDCLASSETIT = ' + IntToStr(iClasse);
           if iFormato > 0 then
              sSql := sSql + '  AND P.IDFORMACALCMKT = ' + IntToStr(iFormato);
           sSql := sSql + 'ORDER BY C.DESCCLASSETIT, F.DESCFORMACALCMKT ';
   Result := GetDataPacket(sSql);
end;

function TCtrlCalculoMKT.AplicaAtualParamCalcMKT: Boolean;
var bTransLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualParamCalcMKT;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          if not InTransaction then
          begin
             StartTransaction;
             bTransLocal := True;
          end
          else
             bTransLocal := False;
          Result := ApplyCds(FCdsParamCalcMKT, FDbParamCalcMKT, [],[]);
          if not Result then
          begin
             MessageInfo := FDbParamCalcMKT.MessageInfo;
             if bTransLocal then
                Rollback;
          end
          else
          begin
             if bTransLocal then
                Commit;
          end;
       except
          on E:Exception do
          begin
             Result := False;
             if bTransLocal then
                Rollback;
             if Pos('exclusiva', E.Message) > 0 then
                MessageInfo := 'Parâmetro já cadastrado'
             else
                MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlCalculoMKT.ListFormaCalcMKT(iFormato: Integer): OleVariant;
var
   sSql : String;
begin
   sSql := 'SELECT DESCFORMACALCMKT, IDFORMACALCMKT ' + #13 +
           'FROM FORMACALCMKT ';
           if iFormato > 0 then
              sSql := sSql + 'WHERE P.IDFORMACALCMKT = ' + IntToStr(iFormato);
           sSql := sSql + 'ORDER BY DESCFORMACALCMKT ';
   Result := GetDataPacket(sSql);
end;

function TCtrlCalculoMKT.ListaInvCalcMKT(iClasse: Integer = -1; iInv: Integer = -1): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT I.*, P.IDFORMACALCMKT, O.* ' + #13 +
           'FROM INVESTIMENTO I, PARAMCALCMKT P, ' + #13 +
           '     (SELECT * FROM OPERRENFIX WHERE IDOPERRENFIX = IDOPERRENFIXAPLIC) O ' + #13 +
           'WHERE I.IDCLASSETIT = P.IDCLASSETIT ' + #13 +
           '  AND I.IDINVESTIMENTO = O.IDINVESTIMENTO(+) ' + #13;
   if iInv >= 0 then
       sSql := sSql + '  AND I.IDINVESTIMENTO = ' + IntToStr(iInv) + #13;
   if iClasse >= 0 then
       sSql := sSql + '  AND I.IDCLASSETIT = ' + IntToStr(iClasse) + #13;
   sSql := sSql + 'ORDER BY DESCINVESTIMENTO, O.DATAOPERACAO, O.IDOPERRENFIXAPLIC';
   Result := GetDataPacket(sSql);
end;

function TCtrlCalculoMKT.ListaFluxoNTN(bVazio: Boolean = False): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT FL.DATAFLUXO, 0 AS DIAS, 0 AS CUPOMEMISSAO, 0 AS CUPOMCOMPRA, 0 AS PUPAR, 0 AS PUJUREMISS, 0 AS PUJURCOMPRA, ' + #13 +
           '       CASE WHEN (NVL(OP.RECNO,0) = 0) THEN ''V'' ' + #13 +
           '            WHEN (OP.VENCOPERACAO = '''') THEN ''N'' ' + #13 +
           '            ELSE ''S'' ' + #13 +
           '       END AS ULTIMO ' + #13 +
           'FROM   FLUXOINVESTRENFIX FL, ' + #13 +
           '       (SELECT VENCOPERACAO, COUNT(VENCOPERACAO) AS RECNO ' + #13 +
           '        FROM OPERRENFIX ' + #13 +
           '        WHERE IDOPERRENFIX = IDOPERRENFIXAPLIC ' + #13 +
           '          AND IDINVESTIMENTO = ' + IntToStr(OperComum.IIF(bVazio, -1, CalcIDInv)) + #13 +
           '        GROUP BY VENCOPERACAO) OP ' + #13 +
           'WHERE  FL.IDINVESTIMENTO = ' + IntToStr(OperComum.IIF(bVazio, -1, CalcIDInv)) + #13 +
           '  AND  FL.DATAFLUXO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', CalcData)) + ', ' + QuotedStr('dd/mm/yyyy') + ')' + #13 +
           '  AND  FL.DATAFLUXO = OP.VENCOPERACAO(+) ' + #13 +
           'ORDER BY DATAFLUXO';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlCalculoMKT.SetCalcForma(const Value: Integer);
begin
  FCalcForma := Value;
end;

procedure TCtrlCalculoMKT.SetCalcData(const Value: TDateTime);
begin
  FCalcData := Value;
end;

procedure TCtrlCalculoMKT.SetCalcDTAplic(const Value: TDateTime);
begin
  FCalcDTAplic := Value;
end;

procedure TCtrlCalculoMKT.SetCalcDTVenc(const Value: TDateTime);
begin
  FCalcDTVenc := Value;
end;

procedure TCtrlCalculoMKT.SetCalcIDInv(const Value: Integer);
begin
  FCalcIDInv := Value;
end;

procedure TCtrlCalculoMKT.SetCalcIDOper(const Value: Integer);
begin
  FCalcIDOper := Value;
end;

procedure TCtrlCalculoMKT.SetCalcTXEmissao(const Value: Double);
begin
  FCalcTXEmissao := Value;
end;

procedure TCtrlCalculoMKT.SetCalcTXJuros(const Value: Double);
begin
  FCalcTXJuros := Value;
end;

procedure TCtrlCalculoMKT.SetCalcTXIndic(const Value: Double);
begin
  FCalcTXIndic := Value;
end;

procedure TCtrlCalculoMKT.SetCalcDiasUteis(const Value: Integer);
begin
  FCalcDiasUteis := Value;
end;

procedure TCtrlCalculoMKT.SetCTDataCotacao(const Value: TDateTime);
begin
  FCTDataCotacao := Value;
end;

procedure TCtrlCalculoMKT.SetCTVlrCotacao(const Value: Double);
begin
  FCTVlrCotacao := Value;
end;

procedure TCtrlCalculoMKT.SetCTVlrPUPar(const Value: Double);
begin
  FCTVlrPUPar := Value;
end;

procedure TCtrlCalculoMKT.SetCTMMoeCodigo(const Value: Integer);
begin
  FCTMMoeCodigo := Value;
end;

procedure TCtrlCalculoMKT.SetCTMData(const Value: TDateTime);
begin
  FCTMData := Value;
end;

procedure TCtrlCalculoMKT.SetCTMDescMoeda(const Value: String);
begin
  FCTMDescMoeda := Value;
end;

procedure TCtrlCalculoMKT.SetCTMSiglaMoeda(const Value: String);
begin
  FCTMSiglaMoeda := Value;
end;

procedure TCtrlCalculoMKT.SetCTMValor(const Value: Double);
begin
  FCTMValor := Value;
end;

procedure TCtrlCalculoMKT.SetCTMIMoeCodigo(const Value: Integer);
begin
  FCTMIMoeCodigo := Value;
end;

procedure TCtrlCalculoMKT.SetCTMIData(const Value: TDateTime);
begin
  FCTMIData := Value;
end;

procedure TCtrlCalculoMKT.SetCTMIDescMoeda(const Value: String);
begin
  FCTMIDescMoeda := Value;
end;

procedure TCtrlCalculoMKT.SetCTMISiglaMoeda(const Value: String);
begin
  FCTMISiglaMoeda := Value;
end;

procedure TCtrlCalculoMKT.SetCTMIValor(const Value: Double);
begin
  FCTMIValor := Value;
end;

procedure TCtrlCalculoMKT.SetCVMValor(const Value: Double);
begin
  FCVMValor := Value;
end;

procedure TCtrlCalculoMKT.SetCVMVlrSJCom(const Value: Double);
begin
  FCVMVlrSJCom := Value;
end;

procedure TCtrlCalculoMKT.SetCVMVlrSJEmi(const Value: Double);
begin
  FCVMVlrSJEmi := Value;
end;

procedure TCtrlCalculoMKT.SetCVMVlrSCCom(const Value: Double);
begin
  FCVMVlrSCCom := Value;
end;

procedure TCtrlCalculoMKT.SetCVMVlrSCEmi(const Value: Double);
begin
  FCVMVlrSCEmi := Value;
end;

procedure TCtrlCalculoMKT.SetDiasUteis(const Value: TCtrlInvDiasUteis);
begin
  FDiasUteis := Value;
end;

procedure TCtrlCalculoMKT.SetParamInvest(const Value: TCtrlParamInvest);
begin
  FParamInvest := Value;
  // Repassa o ponteiro para o CtrlPInv para a property ParamInvest da DiasUteis
  DiasUteis.ParamInvest := FParamInvest;
end;

procedure TCtrlCalculoMKT.SetCalcIDClasse(const Value: Integer);
begin
  FCalcIDClasse := Value;
end;

// Não esquecer, preparar o método para receber as informações alteradas na tela ao invés de buscar na base
function TCtrlCalculoMKT.Prepare(iInv: Integer; dDataAtual: TDateTime; cdsNTN: TClientDataSet = nil): Boolean;
begin
   try
      try
         FCVMValor := 0;
         FCVMVlrSJCom := 0;
         FCVMVlrSJEmi := 0;
         FCVMVlrSCCom := 0;
         FCVMVlrSCEmi := 0;

         FCalcForma := BuscaFormaCalcMKT(iInv);
         _Cds.Data := ListaInvCalcMKT(-1, iInv);

         FCalcData := dDataAtual;
         FCalcIDClasse := _Cds.FieldByName('IDCLASSETIT').AsInteger;
         FCalcIDInv := _Cds.FieldByName('IDINVESTIMENTO').AsInteger;
         FCalcIDOper := _Cds.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
         if FCalcDTAplic = 0 then
            FCalcDTAplic := _Cds.FieldByName('DATAOPERACAO').AsDateTime;
         if FCalcDTVenc = 0 then
            FCalcDTVenc := _Cds.FieldByName('VENCOPERACAO').AsDateTime;
         if FCalcTXEmissao = 0 then
            FCalcTXEmissao := _Cds.FieldByName('TAXAEMISSAO').AsFloat;
         if FCalcTXJuros = 0 then
            FCalcTXJuros := _Cds.FieldByName('TAXAJUROSMKT').AsFloat;
         if FCTMMoeCodigo > -1 then
            FCTMMoeCodigo := _Cds.FieldByName('MOEDACALCMKT').AsInteger;
         if FCTMIMoeCodigo > -1 then
            FCTMIMoeCodigo := _Cds.FieldByName('MOEDATXINDMKT').AsInteger;

         if  FCalcForma = 1 then
         begin
            if FCTMValor = 0 then
               BuscaCotMoeda(FCTMMoeCodigo, FCalcData);
         end
         else
         begin
            if FCTMIValor = 0 then
               BuscaCotMoedaInd(FCTMIMoeCodigo, FCalcData);
         end;

         if FCalcForma <> 3 then
         begin
            if FCTVlrPUPar = 0 then
            begin
               if not BuscaPUPar(FCalcIDInv, FCalcDTVenc, FCalcData) then
                  Raise Exception.Create(MessageInfo);
            end;
         end;

         FCdsMemoriaNTN := cdsNTN;
         FPrepared := True;
         Result := FPrepared;
      except
         on E:Exception do
         begin
            FPrepared := False;
            Result := FPrepared;
            MessageInfo := E.Message;
         end;
      end;
   finally
     _Cds.Close;
   end;
end;

function TCtrlCalculoMKT.UnPrepare(iInv: Integer = 0; dDataAtual: TDateTime = 0): Boolean;
begin
   try
      FCalcForma := 0;
      FCalcIDClasse := 0;
      if iInv > 0 then
         FCalcIDInv := iInv
      else
         FCalcIDInv := 0;
      if dDataAtual > 0 then
         FCalcData := dDataAtual
      else
         FCalcData := 0;
      FCalcIDOper := 0;
      FCalcDTAplic := 0;
      FCalcDTVenc := 0;
      FCalcTXEmissao := 0;
      FCalcTXJuros := 0;
      FCTMMoeCodigo := 0;
      FCTMIMoeCodigo := 0;
      FCTMDescMoeda := '';
      FCTMSiglaMoeda := '';
      FCTMData := 0;
      FCTMValor := 0;
      FCTMIDescMoeda := '';
      FCTMISiglaMoeda := '';
      FCTMIData := 0;
      FCTMIValor := 0;
      FCTDataCotacao := 0;
      FCTVlrCotacao  := 0;
      FCTVlrPUPar    := 0;

      FCVMValor := 0;
      FCVMVlrSJCom := 0;
      FCVMVlrSJEmi := 0;
      FCVMVlrSCCom := 0;
      FCVMVlrSCEmi := 0;

      FCdsMemoriaNTN := nil;
      FPrepared := False;
      Result := True;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := 'O Cálculo de Mercado não pode ser Despreparado';
      end;
   end;
end;

function TCtrlCalculoMKT.BuscaFormaCalcMKT(iInv: Integer = -1; iClasse: Integer = -1): Integer;
var sSql : String;
begin
   try
      try
         sSql := 'SELECT DISTINCT P.IDFORMACALCMKT ' + #13 +
                 'FROM INVESTIMENTO I, CLASSETITRENFIX C, PARAMCALCMKT P ' + #13 +
                 'WHERE I.IDCLASSETIT = C.IDCLASSETIT ' + #13 +
                 '  AND C.IDCLASSETIT = P.IDCLASSETIT ';
         // Se for passado -1 em ambos os parâmetros, monta um dataset vazio
         if (iInv = -1) and (iClasse = -1) then
            sSql := sSql + '  AND I.IDCLASSETIT = ' + IntToStr(iInv)
         else
         begin
            if iInv >= 0 then
               sSql := sSql + '  AND I.IDINVESTIMENTO = ' + IntToStr(iInv);
            if iClasse >= 0 then
               sSql := sSql + '  AND I.IDCLASSETIT = ' + IntToStr(iClasse);
         end;

         _Cds.Data := GetDataPacket(sSql);
         Result := _Cds.FieldByName('IDFORMACALCMKT').AsInteger;
      except
         On E: Exception do
         begin
            Result := -1;
            MessageInfo := 'Não foi possível buscar a forma de cálculo deste investimento' + #13 +
                           'Mensagem: ' + E.Message;
         end;
      end;
   finally
      _Cds.Close;
   end;
end;

function TCtrlCalculoMKT.BuscaPUPar(iInv: Integer; DataVencto, DataCotacao: TDateTime): Boolean;
var sSql: String;
begin
   try
      try

         FCTDataCotacao := 0;
         FCTVlrCotacao  := 0;
         FCTVlrPUPar    := 0;

         if iInv > 0 then
         begin
            sSql := 'SELECT DATACOTACAO, VLRCOTACAO, VLRPUPAR, IDINVESTIMENTO, DATAVENCTO ' + #13 +
                    'FROM COTACAORENFIX C ' + #13 +
                    'WHERE C.IDINVESTIMENTO = ' + IntToStr(iInv) + #13 +
                    '  AND C.DATACOTACAO = (SELECT MAX(C1.DATACOTACAO) ' + #13 +
                    '                       FROM COTACAORENFIX C1 ' + #13 +
                    '                       WHERE C1.IDINVESTIMENTO = ' + IntToStr(iInv) + #13 +
                    '                         AND C1.DATAVENCTO = TO_DATE( ' + QuotedStr(DateToStr(DataVencto)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13 +
                    '                         AND C1.DATACOTACAO <= TO_DATE( ' + QuotedStr(DateToStr(DataCotacao)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13 +
                    '                         AND NVL(C1.VLRPUPAR,0) <> 0) ';

            _Cds.Data := GetDataPacket(sSql);

            if _Cds.IsEmpty then
               Raise Exception.Create('PU Par não informado');

            FCTDataCotacao := _Cds.FieldByName('DATACOTACAO').AsDateTime;
            FCTVlrCotacao  := _Cds.FieldByName('VLRCOTACAO').AsFloat;
            FCTVlrPUPar    := _Cds.FieldByName('VLRPUPAR').AsFloat;
         end;

         Result := True

      except
         on E: Exception do
         begin
            FCTDataCotacao := 0;
            FCTVlrCotacao  := 0;
            FCTVlrPUPar    := 0;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      _Cds.Close;
   end;
end;

function TCtrlCalculoMKT.BuscaCotMoeda(iMoeda: Integer; dDataRef: TDateTime = 0): Boolean;
var CtrlInv: TCtrlInvestimento;
begin
   try
      try
         CtrlInv := TCtrlInvestimento.Create;
         CtrlInv.InitializeAs(Padroes);

         // Prepara variáveis
         FCTMDescMoeda := '';
         FCTMSiglaMoeda := '';
         FCTMData := 0;
         FCTMValor := 0;

         // Busca qualificação da moeda
         _Cds.Data := CtrlInv.ListMoeda(iMoeda);
         if _Cds.IsEmpty then
            Raise Exception.Create('Moeda não encontrada');

         // Seta variáveis de qualificação da moeda
         FCTMDescMoeda := _Cds.FieldByName('MOEDESC').AsString;
         FCTMSiglaMoeda := _Cds.FieldByName('MOESIGLA').AsString;
         _Cds.Close;

         // Busca última data do mês de referência para pegar a moeda de inflação no mês atual
         if dDataRef = 0 then
            FCTMData := DiasUteis.UltimoDiaMes(FCalcData)
         else
            FCTMData := DiasUteis.UltimoDiaMes(dDataRef);

         // Busca cotação da moeda
         _Cds.Data := CtrlInv.ListCotacaoMoeda(iMoeda, FCTMData);
         if _Cds.IsEmpty then
            Raise Exception.Create('Cotação não encontrada para ' + Trim(FCTMDescMoeda));

         // Seta variáveis de valores da moeda
         FCTMData := _Cds.FieldByName('COTDATA').AsDateTime;
         FCTMValor := _Cds.FieldByName('COTVALOR').AsFloat;

         Result := True;
      except
         on E: Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      _Cds.Close;
      FreeAndNil(CtrlInv);
   end;
end;

function TCtrlCalculoMKT.BuscaCotMoedaInd(iMoeda: Integer; dDataRef: TDateTime): Boolean;
var CtrlInv: TCtrlInvestimento;
begin
   try
      try
         CtrlInv := TCtrlInvestimento.Create;
         CtrlInv.InitializeAs(Padroes);

         // Prepara variáveis
         FCTMIDescMoeda := '';
         FCTMISiglaMoeda := '';
         FCTMIData := 0;
         FCTMIValor := 0;

         // Busca qualificação da moeda
         _Cds.Data := CtrlInv.ListMoeda(iMoeda);
         if _Cds.IsEmpty then
            Raise Exception.Create('Moeda não encontrada');

         // Seta variáveis de qualificação da moeda
         FCTMIDescMoeda := _Cds.FieldByName('MOEDESC').AsString;
         FCTMISiglaMoeda := _Cds.FieldByName('MOESIGLA').AsString;
         _Cds.Close;

         // Busca última data do mês de referência para pegar a moeda de inflação no mês atual
         if dDataRef = 0 then
            FCTMIData := DiasUteis.UltimoDiaMes(FCalcData)
         else
            FCTMIData := DiasUteis.UltimoDiaMes(dDataRef);

         // Busca cotação da moeda
         _Cds.Data := CtrlInv.ListCotacaoMoeda(iMoeda, FCTMIData);
         if _Cds.IsEmpty then
            Raise Exception.Create('Cotação não encontrada para ' + Trim(FCTMIDescMoeda));

         // Seta variáveis de valores da moeda
         FCTMIData := _Cds.FieldByName('COTDATA').AsDateTime;
         FCTMIValor := _Cds.FieldByName('COTVALOR').AsFloat;

         Result := True;
      except
         on E: Exception do
         begin
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   finally
      _Cds.Close;
      FreeAndNil(CtrlInv);
   end;
end;

function TCtrlCalculoMKT.CalculaValorMKT(iInv: Integer = 0; dDataAtual: TDateTime = 0): Boolean;
begin
   try
      // Verifica se o Calculo foi Preparado
      if not FPrepared then
         Raise Exception.Create('O Cálculo de Mercado não está preparado');

      if FCalcForma = 1 then
         CalculaNTN
      else if FCalcForma = 2 then
         CalculaLFT
      else if FCalcForma = 3 then
         CalculaLTN
      else
         Exception.Create('Forma de Cálculo de Mercado Indefinida');

//      // Após o cálculo, desprepara o objeto
//      if not UnPrepare(iInv, dDataAtual) then
//         Raise Exception.Create(MessageInfo);

      Result := True;

   except
      On E: Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlCalculoMKT.CalculaNTN: Boolean;
var _CdsLocal: TClientDataSet;
    i, iDQ, iDT: Integer;
    dtIni, dtFim: TDateTime;
    iDia, iMes, iAno: Word;
begin
   try
      try
         if CdsMemoriaNTN = nil then
         begin
            _CdsLocal := TClientDataSet.Create(nil);
            CdsMemoriaNTN := _CdsLocal;
         end
         else
            _CdsLocal := nil;

         CdsMemoriaNTN.Data := ListaFluxoNTN;

         // Atualiza o ponteiro da barra de progrsso, se houver uma
         if Assigned(AtualizaProcTela) then
            AtualizaProcTela('', CdsMemoriaNTN.RecordCount);

         CVMValor := 0;
         CVMVlrSJCom := 0;
         CVMVlrSJEmi := 0;
         CVMVlrSCCom := 0;
         CVMVlrSCEmi := 0;

         CdsMemoriaNTN.First;
         while not CdsMemoriaNTN.eof do
         begin

            if Assigned(AtualizaProcTela) then
               AtualizaProcTela('Processando dia ' + FormatDateTime('dd/mm/yyyy', CdsMemoriaNTN.FieldByName('DATAFLUXO').AsDateTime), -2);

            CdsMemoriaNTN.Edit;
            CdsMemoriaNTN.FieldByName('DIAS').AsInteger := DiasUteis.IntervaloDiasUteis(CalcData, CdsMemoriaNTN.FieldByName('DATAFLUXO').AsDateTime, -1, 1, '', True, False, False);
            //AL_2 - Ini
            CdsMemoriaNTN.FieldByName('CUPOMEMISSAO').AsFloat := ((Power((CalcTXEmissao/100+1), (1/2))-1)*100);
            // O Último dia é calculado com fórmulas diferentes
            if (CdsMemoriaNTN.FieldByName('ULTIMO').AsString = 'N') or
               ((CdsMemoriaNTN.FieldByName('ULTIMO').AsString = 'V') and (CdsMemoriaNTN.FieldByName('DATAFLUXO').AsDateTime <> FCalcDTVenc)) then
               CdsMemoriaNTN.FieldByName('CUPOMCOMPRA').AsFloat := CdsMemoriaNTN.FieldByName('CUPOMEMISSAO').AsFloat /
                                                                   Power((CalcTXJuros/100+1), (CdsMemoriaNTN.FieldByName('DIAS').AsInteger/252))
            else
               CdsMemoriaNTN.FieldByName('CUPOMCOMPRA').AsFloat := (CdsMemoriaNTN.FieldByName('CUPOMEMISSAO').AsFloat + 100) /
                                                                   Power((CalcTXJuros/100+1), (CdsMemoriaNTN.FieldByName('DIAS').AsInteger/252));
            //AL_2 - Fim
            CdsMemoriaNTN.FieldByName('PUPAR').AsFloat := CTVlrPUPar;
            CdsMemoriaNTN.FieldByName('PUJUREMISS').AsFloat := CTVlrPUPar * CdsMemoriaNTN.FieldByName('CUPOMEMISSAO').AsFloat / 100;
            // O Último dia é calculado com fórmulas diferentes
            if (CdsMemoriaNTN.FieldByName('ULTIMO').AsString = 'N') or
               ((CdsMemoriaNTN.FieldByName('ULTIMO').AsString = 'V') and (CdsMemoriaNTN.FieldByName('DATAFLUXO').AsDateTime <> FCalcDTVenc)) then
               CdsMemoriaNTN.FieldByName('PUJURCOMPRA').AsFloat := CdsMemoriaNTN.FieldByName('PUJUREMISS').AsFloat /
                                                                   Power((CalcTXJuros/100+1), (CdsMemoriaNTN.FieldByName('DIAS').AsInteger/252))
            else
               CdsMemoriaNTN.FieldByName('PUJURCOMPRA').AsFloat := (CdsMemoriaNTN.FieldByName('PUJUREMISS').AsFloat + CTVlrPUPar) /
                                                                   Power((CalcTXJuros/100+1), (CdsMemoriaNTN.FieldByName('DIAS').AsInteger/252));

            // Acunula somataórios a serem exibidos na tela
            CVMVlrSJCom := CVMVlrSJCom + CdsMemoriaNTN.FieldByName('PUJURCOMPRA').AsFloat;
            CVMVlrSJEmi := CVMVlrSJEmi + CdsMemoriaNTN.FieldByName('PUJUREMISS').AsFloat;
            CVMVlrSCCom := CVMVlrSCCom + CdsMemoriaNTN.FieldByName('CUPOMCOMPRA').AsFloat;
            CVMVlrSCEmi := CVMVlrSCEmi + CdsMemoriaNTN.FieldByName('CUPOMEMISSAO').AsFloat;

            CdsMemoriaNTN.Post;
            CdsMemoriaNTN.Next;

            if Assigned(AtualizaProcTela) then
               AtualizaProcTela('');

         end;
         CdsMemoriaNTN.First;

         // Atualiza o Valor de Mercado com a moeda de inflação
         if CTMMoeCodigo <> 0 then
         begin
            DecodeDate(CTMData, iAno, iMes, iDia);
            dtIni := DiasUteis.PriDiaMes(iAno, iMes);
            dtFim := DiasUteis.UltDiaMes(iAno, iMes);
            iDT := DiasUteis.IntervaloDiasUteis(dtIni, dtFim, -1, 1, '', True, False, False);
            iDQ := DiasUteis.IntervaloDiasUteis(dtIni, CalcData, -1, 1, '', True, False, False);

            CVMValor := Power((CTMValor / 100 + 1), (iDQ / iDT)) * CVMVlrSJCom;
         end
         else
            CVMValor := CVMVlrSJCom;

      except
         On E: Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      if Assigned(AtualizaProcTela) then
         AtualizaProcTela('', -1);
      if _CdsLocal <> nil then
         FreeAndNil(_CdsLocal);
   end;
end;

function TCtrlCalculoMKT.CalculaLTN: Boolean;
var iNumDias: Integer;
begin
   try
      if FCalcDiasUteis = 0 then
         FCalcDiasUteis := CtrlInvDiaUtil.IntervaloDiasUteis(FCalcData, FCalcDTVenc, -1, 1, '', True, False, False);
      FCVMValor := 1000 / Power(CTMIValor,(FCalcDiasUteis/252));
   except
      On E: Exception do
      begin
         FCVMValor := 0;
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlCalculoMKT.CalculaLFT: Boolean;
var iNumDias: Integer;
begin
   try
      if FCalcDiasUteis = 0 then
         FCalcDiasUteis := CtrlInvDiaUtil.IntervaloDiasUteis(FCalcData, FCalcDTVenc, -1, 1, '', True, False, False);
      FCVMValor := FCTVlrPUPar / Power(((CTMIValor/100)+1),(FCalcDiasUteis/252));
   except
      On E: Exception do
      begin
         FCVMValor := 0;
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;


procedure TCtrlCalculoMKT.PintaGridZebrado(Sender: TObject; Field: TField; State: TGridDrawState;
                                           Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  // faz com que as linhas do grid tenham cores alternadas, exceto a linha selecionada
  // Se a Celula atual pertence a linha selecionada
  if (Sender as TwwDBGrid).CalcCellRow = (Sender as TwwDBGrid).GetActiveRow then
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end
  else
  begin
     // Se a celula atual não está selecionada nem fixada
     if (not (gdSelected in State)) and (not (gdFixed in State)) then
     begin
        if not Highlight then
        begin
           // linhas ímpares = amarelo, linhas pares = branco
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := $00C0FFFF // amarelo bebê
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     // Se a celula atual é a selecionada
     if State = [gdSelected] then
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

end.



