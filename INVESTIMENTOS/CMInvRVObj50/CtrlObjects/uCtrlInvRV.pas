unit uCtrlInvRV;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMMath,
     uCmClientDataSet, uCMFileUtils, uCMTypes, uFuncoesInvest, uCtrlBuscaSaldoRV,
     uCtrlPadroes;

type
   // Vetor enumerado contendo os tipos de operação Aplicação, Resgate, Todos
   TTipoOper = set of (A, R, T);

   TCtrlInvRV = Class(TCmControlObject)
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
      function ListInvAtivos(dDataSaldo: TDateTime = 0;
                             iPlanPrev: Integer = 0; iCarteira: Integer = 0;
                             iInvestimento: Integer = 0): OleVariant;

      function ListTPOperCPVD(sTipoOper: TTipoOper = [T]): OleVariant;

      function ListVlrOper(dDataOper: TDateTime;
                           iPlanPrev: Integer = -1; iCarteira: Integer = 0;
                           iInvestimento: Integer = -1): OleVariant;

      // ------------------- Metodos de Update ---------------------------------



      // ------------------- Metodos de Processamento --------------------------
      function BuscaSaldoTotal(dDataSaldo: TDateTime;
                               iPlanoPatro: Integer = 0; iCarteira: Integer = 1;
                               iInvestimento: Integer = 0): Boolean;

      function BuscaVlrOperado(dDataOper: TDateTime;
                               iPlanoPatro: Integer = 0; iCarteira: Integer = 0;
                               iInvestimento: Integer = 0; sTipoOper: TTipoOper = [T]): Boolean;



      // ------------------- Métodos Diversos ----------------------------------


   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  Override;
   end;

implementation

{ TCtrlInvRV }

// ------------------- Metodos da Protegidos -----------------------------------
procedure TCtrlInvRV.DoChangeDataBase;
begin
   inherited;
   //FDbObject.DataBaseName := DataBaseName;
end;

procedure TCtrlInvRV.AfterInitialize;
begin
   inherited;
   //CtrlObject.InitializeAs(Padroes);
end;

// ------------------- Metodos da Públicos -------------------------------------
// ------------------- Metodos da Control --------------------------------------
constructor TCtrlInvRV.Create;
begin
   inherited;
   //FDbObject := TDbObject.Create(Self);
   //CtrlObject := TCtrlObject.Create;
   //CtrlObject.InitializeAs(Padroes);
   //UnitdeFuncoes := TUnitdeFoncoes.Create;

end;

destructor TCtrlInvRV.Destroy;
begin
   //FreeAndNil(FDbObject);
   //if IsAppServer then
   //   FreeAndNil(FCds);

   inherited;
end;

procedure TCtrlInvRV.OnCreateAppServer;
begin
   inherited;
   //FCds := TClientDataSet.Create(nil);
end;

// ------------------- Propriedades da Control ---------------------------------

procedure TCtrlInvRV.SetSaldoTotal(const Value: Double);
begin
  FSaldoTotal := Value;
end;

procedure TCtrlInvRV.SetVlrTotCompras(const Value: Double);
begin
  FVlrTotCompras := Value;
end;

procedure TCtrlInvRV.SetVlrTotVendas(const Value: Double);
begin
  FVlrTotVendas := Value;
end;

procedure TCtrlInvRV.SetVlrTotOperacoes(const Value: Double);
begin
  FVlrTotOperacoes := Value;
end;


// ------------------- Metodos de Listagem -------------------------------------

{ ------------------------------------------------------------------------------
  Metodo de listagem para buscar todos os investimentos já operados no sistema
  Busca investimentos filtrado por
   - Data
   - PlanoPatro
   - Carteira
   - Investimento
  O Resultado do método e um set de dados (DataSet)
------------------------------------------------------------------------------ }
function TCtrlInvRV.ListInvAtivos(dDataSaldo: TDateTime = 0;
                                  iPlanPrev: Integer = 0; iCarteira: Integer = 0;
                                  iInvestimento: Integer = 0): OleVariant;
begin
   sSql := sSql +
           'SELECT HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, HC.IDINVESTIMENTO ' + #13 +
           'FROM HISTCARTINV HC, INVESTIMENTO IV ' + #13 +
           'WHERE HC.IDHISTCARTINV IN ' + #13 +
           '        (SELECT MAX(H1.IDHISTCARTINV) ' + #13 +
           '         FROM HISTCARTINV H1 ' + #13 +
           '         WHERE H1.DATAMOVCARTINV <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSaldo)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13;
   if iPlanPrev > 0 then
      sSql := sSql +
           '           AND H1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + #13;

   if iCarteira > 0 then
      sSql := sSql +
           '           AND H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + #13;

   if iInvestimento > 0 then
      sSql := sSql +
           '           AND H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + #13;

   sSql := sSql +
           '         GROUP BY H1.IDPLANPREVCTBPATR, H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO) ' + #13 +
           '  AND HC.IDINVESTIMENTO = IV.IDINVESTIMENTO(+) ' + #13 +
           '  AND IV.FLGATIVO = ''S''' + #13 +
           'ORDER BY HC.IDINVESTIMENTO';
   Result := GetDataPacket(sSql);

end;

{ ------------------------------------------------------------------------------
  Metodo de listagem para buscar os Tipos de Operações
  Busca o operações do dia filtradas por
   - Tipo de Operação [A (Aplicação), R (Resgate), T (Todas)]
  O Resultado do método e um set de dados (DataSet)
------------------------------------------------------------------------------ }
function TCtrlInvRV.ListTPOperCPVD(sTipoOper: TTipoOper): OleVariant;
begin
   if sTipoOper = [A] then
      sSql := sSql +
              'SELECT T.*, ''CP'' AS TIPO ' + #13 +
              'FROM TIPOOPERACAO ' + #13 +
              'WHERE IDTIPOINVEST = 2 ' + #13 +
              '  AND (NVL(FLGOPGERENC,''N'') <> ''S'') ' + #13 +
              '  AND (NATUREZAOPERACAO =  ''A'') ' + #13 +
              '  OR  ((NATUREZAOPERACAO = ''R'') AND (FLGOPDIREITO =''S'') AND (IDTIPOOPERACAO <> -70) AND (IDTIPOOPERACAO <> -10070) ) ' + #13 +
              '  OR  ((IDTIPOOPERACAO = -159) OR (IDTIPOOPERACAO = -10159)) ' + #13 +
              'ORDER BY SIGN(IDTIPOOPERACAO) DESC, DESCTIPOOPERACAO'
   else if sTipoOper = [R] then
      sSql := sSql +
              'SELECT T.*, ''VD'' AS TIPO ' + #13 +
              'FROM TIPOOPERACAO ' + #13 +
              'WHERE IDTIPOINVEST = 2 ' + #13 +
              '  AND (NVL(FLGOPGERENC,''N'') <> ''S'') ' + #13 +
              '  AND (NATUREZAOPERACAO =  ''D'') ' + #13 +
              '  OR  ((IDTIPOOPERACAO = -158) OR (IDTIPOOPERACAO = -10158)) ' + #13 +
              'ORDER BY SIGN(IDTIPOOPERACAO) DESC, DESCTIPOOPERACAO'
   else if sTipoOper = [T] then
      sSql := sSql +
              'SELECT T.*, ''CP'' AS TIPO, SIGN(T.IDTIPOOPERACAO) AS ORDEM, T.DESCTIPOOPERACAO AS DESCRICAO ' + #13 +
              'FROM TIPOOPERACAO T' + #13 +
              'WHERE IDTIPOINVEST = 2 ' + #13 +
              '  AND (NVL(FLGOPGERENC,''N'') <> ''S'') ' + #13 +
              '  AND ((NATUREZAOPERACAO =  ''D'') OR (NATUREZAOPERACAO =  ''A'')) ' + #13 +
              '  OR  ((NATUREZAOPERACAO = ''R'') AND (FLGOPDIREITO =''S'') AND (IDTIPOOPERACAO <> -70) AND (IDTIPOOPERACAO <> -10070) ) ' + #13 +
              '  OR  ((IDTIPOOPERACAO = -158) OR (IDTIPOOPERACAO = -10158)) ' + #13 +
              '  OR  ((IDTIPOOPERACAO = -159) OR (IDTIPOOPERACAO = -10159)) ' + #13 +
              'UNION ' + #13 +
              'SELECT T.*, ''VD'' AS TIPO, SIGN(T.IDTIPOOPERACAO) AS ORDEM, T.DESCTIPOOPERACAO AS DESCRICAO ' + #13 +
              'FROM TIPOOPERACAO ' + #13 +
              'WHERE IDTIPOINVEST = 2 ' + #13 +
              '  AND (NVL(FLGOPGERENC,''N'') <> ''S'') ' + #13 +
              '  AND (NATUREZAOPERACAO =  ''D'') ' + #13 +
              '  OR  ((IDTIPOOPERACAO = -158) OR (IDTIPOOPERACAO = -10158)) ' + #13 +
              'ORDER BY TIPO, ORDEM DESC, DESCRICAO';

   Result := GetDataPacket(sSql);

end;

{ ------------------------------------------------------------------------------
  Metodo de listagem para buscar as operações efetuadas no dia
  Busca o operações do dia filtradas por
   - Data da operação
   - PlanoPatro
   - Carteira
   - Investimento
  O Resultado do método e um set de dados (DataSet)
------------------------------------------------------------------------------ }
function TCtrlInvRV.ListVlrOper(dDataOper: TDateTime;
                                iPlanPrev: Integer = -1; iCarteira: Integer = 0;
                                iInvestimento: Integer = -1): OleVariant;
begin
   sSql := sSql +
           'SELECT IDTIPOOPERACAO, IDOPERACAOINVEST, IDINVESTIMENTO, IDCARTEIRAINVEST, DATAMOVCARTINV, QTDEMOVINVCART, ' + #13 +
           '       VLRMOVCARTINV, MOVIMAQUI, VLRVARIACAO, NATURMOVCARTINV, HISTMOVCARTINV, TIPMOVCARTINV ' + #13 +
           'FROM HISTCARTINV ' + #13 +
           'WHERE DATAMOVCARTINV = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataOper)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13 +
           '  AND ( (TIPMOVCARTINV <> ''ATU'') AND (TIPMOVCARTINV <> ''DOP'') AND (TIPMOVCARTINV <> ''LUC'') )' + #13;

   if iPlanPrev > 0 then
      sSql := sSql +
           '  AND IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + #13;

   if iCarteira > 0 then
      sSql := sSql +
           '  AND IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + #13;

   if iInvestimento > 0 then
      sSql := sSql +
           '  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento) + #13;

   sSql := sSql +
           'ORDER BY DATAMOVCARTINV, IDHISTCARTINV';

   Result := GetDataPacket(sSql);

end;


// ------------------- Metodos de Update ---------------------------------------




// ------------------- Metodos de Processamento --------------------------------
{ ------------------------------------------------------------------------------
  Metodo de processo para buscar saldos de renda variável
  Busca o saldo total do dia filtrado por
   - Data do saldo
   - PlanoPatro
   - Carteira
   - Investimento
  O Resultado do método pode ser lido na property "SaldoTotal"
------------------------------------------------------------------------------ }
function TCtrlInvRV.BuscaSaldoTotal(dDataSaldo: TDateTime;
                                    iPlanoPatro: Integer = 0; iCarteira: Integer = 1;
                                    iInvestimento: Integer = 0): Boolean;
var cdsLocal: TCMClientDataSet;
    CtrlBuscaSaldo: TBuscaSaldoRV;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.BuscaSaldoTotal(dDataSaldo, iPlanoPatro, iCarteira, iInvestimento);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try //Finally

         Result := False;
         FSaldoTotal := 0;
         CtrlBuscaSaldo := TBuscaSaldoRV.Create;
         CtrlBuscaSaldo.InitializeAs(Padroes);
         cdsLocal := TCMClientDataSet.Create(nil);

         try //Except

            cdsLocal.Data := ListInvAtivos(dDataSaldo, iPlanoPatro, iCarteira, iInvestimento);

            while not cdsLocal.Eof do
            begin
               CtrlBuscaSaldo.Executa(dDataSaldo,
                                      cdsLocal.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      cdsLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                                      cdsLocal.FieldByName('IDCARTEIRAINVEST').AsInteger);
               FSaldoTotal := FSaldoTotal + CtrlBuscaSaldo.SaldoVlrTotal;
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
         FreeAndNil(cdsLocal);
         FreeAndNil(CtrlBuscaSaldo);
      end;
   end;
end;

{ ------------------------------------------------------------------------------
  Metodo de processo para buscar valores operados diariamente no renda variável
  Busca o valor total de operações (Compra e Vendas) filtrados por:
   - Data da Operação
   - PlanoPatro
   - Carteira
   - Investimento
   - Tipo de Operação [A (Aplicação), R (Resgate), T (Todas)]
  O Resultado do método pode ser lido nas properties
   - VlrTotOperacoes
   - VlrTotCompras
   - VlrTotVendas
------------------------------------------------------------------------------ }
function TCtrlInvRV.BuscaVlrOperado(dDataOper: TDateTime;
                                    iPlanoPatro: Integer = 0; iCarteira: Integer = 0;
                                    iInvestimento: Integer = 0; sTipoOper: TTipoOper = [T]): Boolean;
var cdsLocal, cdsTPOper: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.BuscaVlrOperado(dDataOper, iPlanoPatro, iCarteira, iInvestimento);
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
         cdsTPOper := TCMClientDataSet.Create(nil);

         try //Except

            cdsLocal.Data := ListVlrOper(dDataOper, iPlanoPatro, iCarteira, iInvestimento);
            cdsTPOper.Data := ListTPOperCPVD(sTipoOper);

            while not cdsLocal.Eof do
            begin
               if cdsTPOper.Locate('IDTIPOOPERACAO', cdsLocal.FieldByName('IDTIPOOPERACAO').AsInteger, []) then
               begin
                  if cdsTPOper.FieldByName('TIPO').AsString = 'CP' then
                     FVlrTotCompras := FSaldoTotal + Abs(cdsLocal.FieldByName('VLRMOVCARTINV').AsFloat)
                  else if cdsTPOper.FieldByName('TIPO').AsString = 'VD' then
                     FVlrTotVendas := FVlrTotVendas - Abs(cdsLocal.FieldByName('VLRMOVCARTINV').AsFloat);
               end;
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
               MessageInfo := E.Message;
            end;
         end;
      finally
         cdsLocal.Close;
         FreeAndNil(cdsLocal);
         FreeAndNil(cdsTPOper);
      end;
   end;
end;

end.

