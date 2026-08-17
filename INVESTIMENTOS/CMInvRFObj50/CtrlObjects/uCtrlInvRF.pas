unit uCtrlInvRF;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMMath,
     uCmClientDataSet, uCMFileUtils, uCMTypes, uFuncoesInvest;

type
   // Vetor enumerado contendo os tipos de operação Aplicação, Resgate, Todos
   TTipoOper = set of (A, R, T);

   TCtrlInvRF = Class(TCmControlObject)
   private
      // ------------------- Objetos de Ambiente -------------------------------
      sSql: String;

      // ------------------- Propriedades da Control ---------------------------
      FSaldoTotal: Double;
      FVlrTotOperacoes: Double;
      FVlrTotCompras: Double;
      FVlrTotVendas: Double;

      procedure SetSaldoTotal(const Value: Double);
      procedure SetVlrTotOperacoes(const Value: Double);
      procedure SetVlrTotCompras(const Value: Double);
      procedure SetVlrTotVendas(const Value: Double);

   public
      // ------------------- Metodos da Control --------------------------------
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;
      // ------------------- Propriedades da Control ---------------------------
      property SaldoTotal: Double read FSaldoTotal write SetSaldoTotal;
      property VlrTotOperacoes: Double read FVlrTotOperacoes write SetVlrTotOperacoes;
      property VlrTotCompras: Double read FVlrTotCompras write SetVlrTotCompras;
      property VlrTotVendas: Double read FVlrTotVendas write SetVlrTotVendas;



      // ------------------- Metodos de Listagem -------------------------------
      function ListSldHistRenFix(dDataSaldo: TDateTime;
                                 iIdHistRenfix : integer = 0;
                                 iInvestimento: Integer = -1;
                                 iOperacao: Integer = -1; iClasseTit: Integer = -1;
                                 iTipoProc: Integer = 1; iOper: Boolean = False) : OleVariant;
      function ListVlrOper(dDataOper: TDateTime; sTipoOper: TTipoOper = [T];
                           iPlanPrev: Integer = -1; iClasseTit: Integer = -1;
                           iCarteira: Integer = 0; iInvestimento: Integer = -1; iOperAplic: Integer = -1): OleVariant;



      // ------------------- Metodos de Update ---------------------------------



      // ------------------- Metodos de Processamento --------------------------



      // ------------------- Métodos Diversos ----------------------------------
      function SaldoTotalRenFix(dDataSaldo: TDateTime;
                                iPlanoPatro: Integer = 0; iClasseTit: Integer = 0;
                                iCarteira: Integer = 1;iInvestimento: Integer = 0; iOperAplic: Integer = 0): Boolean;
      function BuscaVlrOperado(dDataOper: TDateTime; sTipoOper: TTipoOper = [T];
                               iPlanoPatro: Integer = 0; iClasseTit: Integer = 0;
                               iCarteira: Integer = 0; iInvestimento: Integer = 0; iOperAplic: Integer = 0): Boolean;


   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  Override;
   end;

implementation

{ TCtrlInvRF }

procedure TCtrlInvRF.DoChangeDataBase;
begin
   inherited;
   //FDbObject.DataBaseName := DataBaseName;
end;

procedure TCtrlInvRF.AfterInitialize;
begin
   inherited;
   //CtrlObject.InitializeAs(Padroes);
end;

// ------------------- Metodos da Públicos -------------------------------------
// ------------------- Metodos da Control --------------------------------------
constructor TCtrlInvRF.Create;
begin
   inherited;
   //FDbObject := TDbObject.Create(Self);
   //CtrlObject := TCtrlObject.Create;
   //CtrlObject.InitializeAs(Padroes);
   //UnitdeFuncoes := TUnitdeFoncoes.Create;

end;

destructor TCtrlInvRF.Destroy;
begin
   inherited;
   //FreeAndNil(FDbObject);
   //if IsAppServer then
   //   FreeAndNil(FCds);

end;

procedure TCtrlInvRF.OnCreateAppServer;
begin
   inherited;
   //FCds := TClientDataSet.Create(nil);

end;

// ------------------- Propriedades da Control ---------------------------------

procedure TCtrlInvRF.SetSaldoTotal(const Value: Double);
begin
  FSaldoTotal := Value;
end;

procedure TCtrlInvRF.SetVlrTotCompras(const Value: Double);
begin
  FVlrTotCompras := Value;
end;

procedure TCtrlInvRF.SetVlrTotVendas(const Value: Double);
begin
  FVlrTotVendas := Value;
end;

procedure TCtrlInvRF.SetVlrTotOperacoes(const Value: Double);
begin
  FVlrTotOperacoes := Value;
end;


// ------------------- Metodos de Listagem -------------------------------------

{ ------------------------------------------------------------------------------
  Metodo de listagem para buscar os saldos de todos os investimentos
  Busca o saldo total do dia filtrado por
   - Data
   - Investimento
   - Aplicação
   - Classe
   - Flag que indica quando é processo das operações de títulos com cotação
  O Resultado do método e um set de dados (DataSet)
------------------------------------------------------------------------------ }
function TCtrlInvRF.ListSldHistRenFix(dDataSaldo: TDateTime;
                                      iIdHistRenfix : integer = 0;
                                      iInvestimento: Integer = -1;
                                      iOperacao: Integer = -1; iClasseTit: Integer = -1;
                                      iTipoProc: Integer = 1; iOper: Boolean = False) : OleVariant;
begin
   sSql := sSql +
           'SELECT  ' + #13 +
           '   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTBPATR,HR.PLNCODIGO, ' + #13 +
           '   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEIRAINVEST,HR.IDOPERRENFIXAPLIC, ' + #13 +
           '   HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHISTRENFIX,HR.QTDHISTRENFIX, ' + #13 +
           '   HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX,HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX, ' + #13 +
           '   IV.DESCINVESTIMENTO, IV.IDCLASSETIT, IV.CARENCIA, EM.SIGLAEMISSOR, CL.DESCCLASSETIT, ' + #13 +
           '   HR.IDOPERRENFIXORIG, CL.FLGUSAQTD  ' + #13 +
           'FROM  HISTRENFIX HR, INVESTIMENTO IV, EMISSOR EM, CLASSETITRENFIX CL ' + #13 +
           'WHERE (HR.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
           '  AND HR.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL') + #13 +
           '  AND HR.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL') + #13 +
           '  AND (HR.IDHISTRENFIX IN ' + #13 +
           '          (SELECT MAX(H1.IDHISTRENFIX) ' + #13 +
           '           FROM HISTRENFIX H1 ' + #13 +
           '           WHERE (H1.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
           '             AND H1.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL') + #13 +
           '             AND H1.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL') + #13;
   if iIdHistRenfix > 0 then
      sSql := sSql +
           '             AND (H1.IDHISTRENFIX <= ' + IntToStr(iIdHistRenfix) + ') ' + #13;
   if iTipoProc in [0,2] then
   begin
      sSql := sSql +
           '             AND (H1.TIPMOVHISRENFIX = ''OPE'') ' + #13 +
           '             AND (H1.IDTIPOOPERACAO NOT IN (-166,-167)) ' + #13 +
           '             AND (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13;
   end
   else if iTipoProc = 3 then
   begin
      sSql := sSql +
           '             AND (H1.TIPMOVHISRENFIX = ''TRC'') ' + #13 +
           '             AND (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13;
   end;
   if not iOper then
      sSql := sSql +
           '              AND (H1.IDTIPOOPERACAO NOT IN (-17,-18,-19)) ' + #13;
   sSql := sSql +
           '              AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN ' + #13 +
           '                       (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC ' + #13 +
           '                        FROM HISTRENFIX H2 ' + #13 +
           '                        WHERE (H2.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13 +
           '                          AND H2.IDINVESTIMENTO ' + FuncoesInvest.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL') + #13 +
           '                          AND H2.IDOPERRENFIXAPLIC ' + FuncoesInvest.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL') + #13;

   if iTipoProc in [0,2] then
   begin
      sSql := sSql +
           '                          AND (H2.TIPMOVHISRENFIX = ''OPE'') ' + #13 +
           '                          AND (H2.IDTIPOOPERACAO NOT IN (-166,-167)) ' + #13 +
           '                          AND (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13;
   end
   else if iTipoProc = 3 then
   begin
      sSql := sSql +
           '                          AND (H2.TIPMOVHISRENFIX = ''TRC'') ' + #13 +
           '                          AND (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13;
   end;
   if not iOper then
      sSql := sSql +
           '                          AND (H2.IDTIPOOPERACAO NOT IN (-17,-18,-19)) ' + #13;
   sSql := sSql +
           '                        GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)) ' + #13 +
           '            GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC)) ' + #13;

   if iClasseTit > 0 then
      sSql := sSql +
           '  AND IV.IDCLASSETIT  = ' + IntToStr(iClasseTit) + #13;

   if iTipoProc in [0,2] then
   begin
      sSql := sSql +
           '   AND (HR.TIPMOVHISRENFIX = ''OPE'') ' + #13 +
           '   AND (HR.IDTIPOOPERACAO NOT IN (-166,-167)) ' + #13 +
           '   AND (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13;
   end
   else if iTipoProc = 3 then
   begin
      sSql := sSql +
           '   AND (HR.TIPMOVHISRENFIX = ''TRC'') ' + #13 +
           '   AND (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ' + #13;
   end;
   sSql := sSql +
           '   AND (HR.SALDOQTDHISTRENFI > 0) ' + #13 +
           '   AND (IV.IDTIPOINVEST = 1)  ' + #13 +
           '   AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO) ' + #13 +
           '   AND (IV.IDEMISSOR = EM.IDEMISSOR) ' + #13 +
           '   AND (IV.IDCLASSETIT = CL.IDCLASSETIT) ' + #13 +
           ' ORDER BY DESCCLASSETIT, DESCINVESTIMENTO';

   Result := GetDataPacket(sSql);
end;


{ ------------------------------------------------------------------------------
  Metodo de listagem para buscar as operações efetuadas no dia
  Busca o operações do dia filtradas por
   - Data da operação
   - Tipo de Operação [A (Aplicação), R (Resgate), T (Todas)]
   - PlanoPatro
   - Classe
   - Investimento
   - Aplicação
  O Resultado do método e um set de dados (DataSet)
------------------------------------------------------------------------------ }
function TCtrlInvRF.ListVlrOper(dDataOper: TDateTime; sTipoOper: TTipoOper = [T];
                                iPlanPrev: Integer = -1; iClasseTit: Integer = -1;
                                iCarteira: Integer = 0; iInvestimento: Integer = -1; iOperAplic: Integer = -1): OleVariant;
begin
   sSql := sSql +
           'SELECT O.DATAOPERACAO, O.QTDEOPERACAO, O.PUOPERACAO, O.VLROPERACAO, O.VENCOPERACAO, O.DATAEMISSAO, O.PUEMISSAO, O.PUMERCADO, ' + #13 +
           '       O.FLGCARTHIPO, O.QTDCARTHIPO, O.OBSERVACAO, O.FLGNEGOCIACAO, O.CODDOCUMENTO, O.PLNCODIGO, O.BOLETA, O.DATALIQUIDACAO, ' + #13 +
           '       O.IDTIPOOPERACAO, T.NATUREZAOPERACAO, O.IDPLANPREVCTBPATR, O.IDINVESTIMENTO, O.IDCUSTODIANTE, O.IDCARTEIRAINVEST, O.IDOPERRENFIX, O.IDOPERRENFIXAPLIC, O.IDCLASSRISCORENFIX, ' + #13 +
           '       O.IDOPERRENFIXORIG, O.PERCTRANSF, O.IDINVESTIMLASTRO, O.FLGDTRENTAB, O.IDUSUARIO ' + #13 +
           'FROM OPERRENFIX O, TIPOOPERACAO T, INVESTIMENTO I ' + #13 +
           'WHERE O.DATAOPERACAO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataOper)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13 +
           '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO ' + #13 +
           '  AND O.IDINVESTIMENTO = I.IDINVESTIMENTO ' + #13;

   if sTipoOper = [A] then
      sSql := sSql +
           '  AND O.IDOPERRENFIX = O.IDOPERRENFIXAPLIC ' + #13
   else if sTipoOper = [R] then
      sSql := sSql +
           '  AND T.NATUREZAOPERACAO = ''D''' + #13;

   if iPlanPrev > 0 then
      sSql := sSql +
           '  AND O.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + #13;

   if iClasseTit > 0 then
      sSql := sSql +
           '  AND I.IDCLASSETIT = ' + IntToStr(iClasseTit) + #13;

   if iCarteira > 0 then
      sSql := sSql +
           '  AND O.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + #13;

   if iInvestimento > 0 then
      sSql := sSql +
           '  AND O.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + #13;

   if iOperAplic > 0 then
      sSql := sSql +
           '  AND O.IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic) + #13;

   sSql := sSql +
           'ORDER BY BOLETA';

   Result := GetDataPacket(sSql);

end;


// ------------------- Metodos de Update ---------------------------------------




// ------------------- Metodos de Processamento --------------------------------
{ ------------------------------------------------------------------------------
  Metodo de processo para buscar saldos de renda fixa
  Busca o saldo total do dia filtrado por
   - Data do saldo
   - PlanoPatro
   - Classe
   - Investimento
   - Aplicação
  O Resultado do método pode ser lido na property "SaldoTotalRF"
------------------------------------------------------------------------------ }
function TCtrlInvRF.SaldoTotalRenFix(dDataSaldo: TDateTime;
                                     iPlanoPatro: Integer = 0; iClasseTit: Integer = 0;
                                     iCarteira: Integer = 1; iInvestimento: Integer = 0; iOperAplic: Integer = 0): Boolean;
var cdsLocal: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.SaldoTotalRenFix(dDataSaldo, iPlanoPatro, iClasseTit, iInvestimento, iOperAplic);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try //Finally

         Result := False;
         FSaldoTotal := 0;
         cdsLocal := TCMClientDataSet.Create(nil);

         try //Except

            cdsLocal.Data := ListSldHistRenFix(dDataSaldo, iInvestimento, iOperAplic, iClasseTit);

            while not cdsLocal.Eof do
            begin
               if (((iPlanoPatro <= 0) or (cdsLocal.FieldByname('IDPLANPREVCTBPATR').AsInteger = iPlanoPatro)) and
                   ((iCarteira <= 0) or (cdsLocal.FieldByName('IDCARTEIRAINVEST').AsInteger = iCarteira))) then
                  FSaldoTotal := FSaldoTotal + cdsLocal.FieldByname('SALDOVLRHISTRENFI').AsFloat;
               cdsLocal.Next;
            end;

            Result := True;

         except
            On E: Exception do
            begin
               FSaldoTotal := 0;
               Result := False;
               MessageInfo := E.Message
            end;
         end;
      finally
         cdsLocal.Close;
         FreeAndNil(cdsLocal)
      end;
   end;
end;

{ ------------------------------------------------------------------------------
  Metodo de processo para buscar valores operados diariamente no renda fixa
  Busca o valor total de operações (Compra, Vendas e Fluxos) filtrados por:
   - Data da Operação
   - PlanoPatro
   - Classe
   - Investimento
   - Aplicação
  O Resultado do método pode ser lido nas properties
   - VlrTotOperacoes
   - VlrTotCompras
   - VlrTotVendas
   - VlrTotFluxo
------------------------------------------------------------------------------ }
function TCtrlInvRF.BuscaVlrOperado(dDataOper: TDateTime; sTipoOper: TTipoOper = [T];
                                    iPlanoPatro: Integer = 0; iClasseTit: Integer = 0;
                                    iCarteira: Integer = 0; iInvestimento: Integer = 0; iOperAplic: Integer = 0): Boolean;
var cdsLocal: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.BuscaVlrOperado(dDataOper, iPlanoPatro, iClasseTit, iInvestimento, iOperAplic);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try  //Finally

         Result := False;
         FVlrTotOperacoes := 0;
         FVlrTotCompras := 0;
         FVlrTotVendas := 0;
         cdsLocal := TCMClientDataSet.Create(nil);

         try //Except

            cdsLocal.Data := ListVlrOper(dDataOper, sTipoOper, iPlanoPatro, iClasseTit, iCarteira, iInvestimento, iOperAplic);

            while not cdsLocal.Eof do
            begin
               if cdsLocal.FieldByName('NATUREZAOPERACAO').AsString = 'A' then
                  FVlrTotCompras := FSaldoTotal + Abs(cdsLocal.FieldByName('VLROPERACAO').AsFloat)
               else if cdsLocal.FieldByName('NATUREZAOPERACAO').AsString = 'D' then
                  FVlrTotVendas := FVlrTotVendas - Abs(cdsLocal.FieldByName('VLROPERACAO').AsFloat);

               cdsLocal.Next;
            end;

            // Volume de Operado no dia
            FVlrTotOperacoes := FVlrTotCompras + FVlrTotVendas;

            Result := True;

         except
            On E: Exception do
            begin
               FVlrTotOperacoes := 0;
               FVlrTotCompras := 0;
               FVlrTotVendas := 0;
               Result := False;
               MessageInfo := E.Message
            end;
         end;
      finally
         cdsLocal.Close;
         FreeAndNil(cdsLocal)
      end;
   end;
end;

end.

