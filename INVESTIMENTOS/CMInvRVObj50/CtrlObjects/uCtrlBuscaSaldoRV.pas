unit uCtrlBuscaSaldoRV;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet, uCMTypes,
     uCtrlPadroes, uCMFileUtils;

type
   TBuscaSaldoRV = Class(TCmControlObject)
   private
      // ------------------- Objetos de Ambiente -------------------------------
      sSql: String;

      // ------------------- Propriedades da Control ---------------------------
      FIdHistCartInv: Integer;
      FSldQtdCustodiaCCI: Double;
      FSaldoIRApurado: Double;
      FSaldoIOFApurado: Double;
      FSaldoIOFProv: Double;
      FSaldoVariacao: Double;
      FSldQtdCustodiaCC: Double;
      FSaldoCusto: Double;
      FSaldoQtdTotal: Double;
      FSldQtdCCI: Double;
      FSaldoVlrTotal: Double;
      FSldQtdCC: Double;
      FSaldoIRProv: Double;
      FDataSaldo: TDateTime;
      FSldQtdLibCustodia: Double;
      FSldQtdBloqCustodia: Double;
      FSldProvPerda: Double;

      procedure SetIdHistCartInv(const Value: Integer);
      procedure SetDataSaldo(const Value: TDateTime);
      procedure SetSaldoCusto(const Value: Double);
      procedure SetSaldoIOFApurado(const Value: Double);
      procedure SetSaldoIOFProv(const Value: Double);
      procedure SetSaldoIRApurado(const Value: Double);
      procedure SetSaldoIRProv(const Value: Double);
      procedure SetSaldoQtdTotal(const Value: Double);
      procedure SetSaldoVariacao(const Value: Double);
      procedure SetSaldoVlrTotal(const Value: Double);
      procedure SetSldQtdCC(const Value: Double);
      procedure SetSldQtdCCI(const Value: Double);
      procedure SetSldProvPerda(const Value: Double);
      procedure SetSldQtdCustodiaCC(const Value: Double);
      procedure SetSldQtdCustodiaCCI(const Value: Double);
      procedure SetSldQtdBloqCustodia(const Value: Double);
      procedure SetSldQtdLibCustodia(const Value: Double);

   public
      // ------------------- Metodos da Control --------------------------------
      Constructor Create; Override;
      Destructor Destroy; Override;
      procedure OnCreateAppServer; override;

      // ------------------- Propriedades da Control ---------------------------
      property IdHistCartInv : Integer     read FIdHistCartInv      write SetIdHistCartInv;       // IDHISTCARTINV
      property DataSaldo : TDateTime       read FDataSaldo          write SetDataSaldo;           // DATAMOVCARTINV,
      property SaldoQtdTotal : Double      read FSaldoQtdTotal      write SetSaldoQtdTotal;       // SALDOQTDEINVCART
      property SaldoVlrTotal : Double      read FSaldoVlrTotal      write SetSaldoVlrTotal;       // SALDOVLRINVCART
      property SaldoCusto : Double         read FSaldoCusto         write SetSaldoCusto;          // SALDOAQUI,
      property SaldoVariacao : Double      read FSaldoVariacao      write SetSaldoVariacao;       // SALDOVARIACAO,
      property SaldoIRProv : Double        read FSaldoIRProv        write SetSaldoIRProv;         // SALDOIRPROV,
      property SaldoIRApurado : Double     read FSaldoIRApurado     write SetSaldoIRApurado;      // SALDOIRAPU,
      property SaldoIOFProv : Double       read FSaldoIOFProv       write SetSaldoIOFProv;        // SALDOIOFPROV,
      property SaldoIOFApurado : Double    read FSaldoIOFApurado    write SetSaldoIOFApurado;     // SALDOIOFAPU,
      property SaldoQtdCC : Double         read FSldQtdCC           write SetSldQtdCC;            // SALDOQTDECPMF
      property SaldoQtdCCI : Double        read FSldQtdCCI          write SetSldQtdCCI;           // SALDOQTDEINVCART - SALDOQTDECPMF
      property SaldoProvPerda : Double     read FSldProvPerda       write SetSldProvPerda;        // SALDOPROVPERDA
      property SldQtdCustodiaCC : Double   read FSldQtdCustodiaCC   write SetSldQtdCustodiaCC;
      property SldQtdCustodiaCCI : Double  read FSldQtdCustodiaCCI  write SetSldQtdCustodiaCCI;
      property SldQtdLibCustodia  : Double read FSldQtdLibCustodia  write SetSldQtdLibCustodia;
      property SldQtdBloqCustodia : Double read FSldQtdBloqCustodia write SetSldQtdBloqCustodia;

      // ------------------- Metodos de Listagem -------------------------------



      // ------------------- Metodos de Update ---------------------------------



      // ------------------- Metodos de Processamento --------------------------
      function Executa(dDataRef: TDateTime;
                       iPlanPrev, iInvestimento, iCarteira: Integer;
                       iCarteiraGerenc: Integer = -1;
                       iHistCartInv: Integer = high(integer);
                       iCustodiante: integer = -1;
                       sLote: String = '';
                       iMotivoBloqueio: Integer = -1;
                       iHistCustodia: Integer = high(integer);
                       iTipoConta : Integer = 0): Boolean;



      // ------------------- Métodos Diversos ----------------------------------


   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  Override;

   end;

implementation

{TCtrlBuscaSaldos}

// ------------------- Metodos da Protegidos -----------------------------------
procedure TBuscaSaldoRV.DoChangeDataBase;
begin
   inherited;
   //FDbObject.DataBaseName := DataBaseName;
end;

procedure TBuscaSaldoRV.AfterInitialize;
begin
   inherited;
   //CtrlObject.InitializeAs(Padroes);
end;


// ------------------- Metodos da Públicos -------------------------------------
// ------------------- Metodos da Control --------------------------------------
constructor TBuscaSaldoRV.Create;
begin
   inherited;
   //FDbObject := TDbObject.Create(Self);
   //CtrlObject := TCtrlObject.Create;
   //CtrlObject.InitializeAs(Padroes);
   //UnitdeFuncoes := TUnitdeFoncoes.Create;

end;

destructor TBuscaSaldoRV.Destroy;
begin
   //FreeAndNil(FDbObject);
   //if IsAppServer then
   //   FreeAndNil(FCds);

   inherited;
end;

procedure TBuscaSaldoRV.OnCreateAppServer;
begin
   inherited;
   //FCds := TClientDataSet.Create(nil);
end; 

// ------------------- Propriedades da Control ---------------------------------
procedure TBuscaSaldoRV.SetDataSaldo(const Value: TDateTime);
begin
  FDataSaldo := Value;
end;

procedure TBuscaSaldoRV.SetIdHistCartInv(const Value: Integer);
begin
  FIdHistCartInv := Value;
end;

procedure TBuscaSaldoRV.SetSaldoCusto(const Value: Double);
begin
  FSaldoCusto := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIOFApurado(const Value: Double);
begin
  FSaldoIOFApurado := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIOFProv(const Value: Double);
begin
  FSaldoIOFProv := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIRApurado(const Value: Double);
begin
  FSaldoIRApurado := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIRProv(const Value: Double);
begin
  FSaldoIRProv := Value;
end;

procedure TBuscaSaldoRV.SetSaldoQtdTotal(const Value: Double);
begin
  FSaldoQtdTotal := Value;
end;

procedure TBuscaSaldoRV.SetSaldoVariacao(const Value: Double);
begin
  FSaldoVariacao := Value;
end;

procedure TBuscaSaldoRV.SetSaldoVlrTotal(const Value: Double);
begin
  FSaldoVlrTotal := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCC(const Value: Double);
begin
  FSldQtdCC := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCCI(const Value: Double);
begin
  FSldQtdCCI := Value;
end;

procedure TBuscaSaldoRV.SetSldProvPerda(const Value: Double);
begin
  FSldProvPerda := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCustodiaCC(const Value: Double);
begin
  FSldQtdCustodiaCC := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCustodiaCCI(const Value: Double);
begin
  FSldQtdCustodiaCCI := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdBloqCustodia(const Value: Double);
begin
  FSldQtdBloqCustodia := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdLibCustodia(const Value: Double);
begin
  FSldQtdLibCustodia := Value;
end;

// ------------------- Metodos de Listagem -------------------------------------




// ------------------- Metodos de Update ---------------------------------------




// ------------------- Metodos de Processamento --------------------------------
function TBuscaSaldoRV.Executa(dDataRef: TDateTime;
                               iPlanPrev, iInvestimento, iCarteira: Integer;
                               iCarteiraGerenc: Integer = -1;
                               iHistCartInv: Integer = high(integer);
                               iCustodiante: integer = -1;
                               sLote: String = '';
                               iMotivoBloqueio: Integer = -1;
                               iHistCustodia: Integer = high(integer);
                               iTipoConta : Integer = 0): Boolean;
var bPrimeiro: Boolean;
begin
   try // Except
      Result := True;
      bPrimeiro := True;

      FIdHistCartInv      := 0;
      FDataSaldo          := 0;
      FSaldoQtdTotal      := 0;
      FSaldoVlrTotal      := 0;
      FSaldoCusto         := 0;
      FSaldoVariacao      := 0;
      FSaldoIRProv        := 0;
      FSaldoIRApurado     := 0;
      FSaldoIOFProv       := 0;
      FSaldoIOFApurado    := 0;
      FSldQtdCC           := 0;
      FSldQtdCCI          := 0;
      FSldProvPerda       := 0;
      FSldQtdLibCustodia  := 0;
      FSldQtdBloqCustodia := 0;
      FSldQtdCustodiaCC   := 0;
      FSldQtdCustodiaCCI  := 0;

      sSql :=
         'SELECT H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,' + #13 +
         '       H1.SALDOVLRINVCART, H1.SALDOQTDECPMF, H1.SALDOQTDEINVCART,' + #13 +
         '       H1.SALDOAQUI, H1.SALDOVARIACAO, H1.SALDOPROVPERDA,' + #13 +
         '       H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAPU, ' + #13 +
         '       (H1.SALDOQTDEINVCART - H1.SALDOQTDECPMF) AS SALDOQTDECCI ' + #13 +
         'FROM HISTCARTINV H1, (SELECT IDTIPOOPERDIRDIV,IDTIPOOPERDIRJUR,IDTIPOOPERDIRMUL FROM PARAMINVEST) P1 ' + #13;

      // Filtra o PlanoPatro
      if iPlanPrev > 0 then
      begin
         sSql := sSql + 'WHERE (H1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
         bPrimeiro := False;
      end;

      // Filtra a Carteira Própria
      if (iCarteira > 0) and (bPrimeiro) then
      begin
         sSql := sSql + 'WHERE (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
         bPrimeiro := False;
      end
      else
      if (iCarteira > 0) and (not bPrimeiro) then
         sSql := sSql + '  AND (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

      //Filtra a Carteira Gerencial
      if iCarteiraGerenc > 0 then
      begin
         if bPrimeiro then
         begin
            sSql := sSql + 'WHERE (H1.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
            bPrimeiro := False;
         end
         else
            sSql := sSql + '  AND (H1.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
      end
      else
      begin
         if bPrimeiro then
         begin
            sSql := sSql + 'WHERE (H1.IDCARTEIRAGERENC IS NULL)' + #13;
            bPrimeiro := False;
         end
         else
            sSql := sSql + '  AND (H1.IDCARTEIRAGERENC IS NULL)' + #13;
      end;

      // Filtra o Investimento
      if (iInvestimento > 0) and (bPrimeiro) then
      begin
         sSql := sSql + 'WHERE (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
         bPrimeiro := False;
      end
      else
      if (iInvestimento > 0) and (not bPrimeiro) then
         sSql := sSql + '  AND (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

      // Filtra o Lote
      if (sLote <> '') and (bPrimeiro) then
      begin
         sSql := sSql + 'WHERE (H1.IDLOTE = ' + sLote + ')' + #13;
         bPrimeiro := False;
      end
      else
      if (sLote <> '') and (not bPrimeiro) then
         sSql := sSql + '  AND (H1.IDLOTE = ' + sLote + ')' + #13;

      sSql := sSql +
      '  AND (H1.IDHISTCARTINV = ' + #13 +
      '          (SELECT MAX(H2.IDHISTCARTINV) ' + #13 +
      '           FROM HISTCARTINV H2 ' + #13;

      bPrimeiro := True;
      // Filtra o Plano Patro
      if iPlanPrev > 0 then
      begin
         sSql := sSql + '           WHERE (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
         bPrimeiro := False;
      end;

      // Filtra a Carteira Própria
      if (iCarteira > 0) and (bPrimeiro) then
      begin
         sSql := sSql + '           WHERE (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
         bPrimeiro := False;
      end
      else
      if (iCarteira > 0) and (not bPrimeiro) then
         sSql := sSql + '             AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

      // Filtra a Carteira Gerencial
      if iCarteiraGerenc > 0 then
      begin
         if bPrimeiro then
         begin
            sSql := sSql + '           WHERE (H2.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
            bPrimeiro := False;
         end
         else
            sSql := sSql + '             AND (H2.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
      end
      else
      begin
         if bPrimeiro then
         begin
            sSql := sSql + '           WHERE (H2.IDCARTEIRAGERENC IS NULL)' + #13;
            bPrimeiro := False;
         end
         else
            sSql := sSql + '             AND (H2.IDCARTEIRAGERENC IS NULL)' + #13;
      end;

      // Filtra o Investimento
      if (iInvestimento > 0) and (bPrimeiro) then
      begin
         sSql := sSql + '           WHERE (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
         bPrimeiro := False;
      end
      else
      if (iInvestimento > 0) and (not bPrimeiro) then
         sSql := sSql + '             AND (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

      // Filtra o Lote
      if (sLote <> '') and (bPrimeiro) then
      begin
         sSql := sSql + '           WHERE (H2.IDLOTE = ' + sLote + ')' + #13;
         bPrimeiro := False;
      end
      else
      if (sLote <> '') and (not bPrimeiro) then
         sSql := sSql + '             AND (H2.IDLOTE = ' + sLote + ')' + #13;

      sSql := sSql +
      '             AND (H2.DATAMOVCARTINV = ' + #13 +
      '                     (SELECT MAX(H3.DATAMOVCARTINV) ' + #13 +
      '                      FROM HISTCARTINV H3 ' + #13;

      bPrimeiro := True;
      // Filtra o Plano Patro
      if iPlanPrev > 0 then
      begin
         sSql := sSql + '                      WHERE (H3.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
         bPrimeiro := False;
      end;

      // Filtra a Carteira Prõpria
      if (iCarteira > 0) and (bPrimeiro) then
      begin
         sSql := sSql + '                      WHERE (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
         bPrimeiro := False;
      end
      else
      if (iCarteira > 0) and (not bPrimeiro) then
         sSql := sSql + '                        AND (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

      // Filtra a Carteira Genrencial
      if iCarteiraGerenc > 0 then
      begin
         if bPrimeiro then
         begin
            sSql := sSql + '                      WHERE (H3.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
            bPrimeiro := False;
         end
         else
            sSql := sSql + '                        AND (H3.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
      end
      else
      begin
         if bPrimeiro then
         begin
            sSql := sSql + '                      WHERE (H3.IDCARTEIRAGERENC IS NULL)' + #13;
            bPrimeiro := False;
         end
         else
            sSql := sSql + '                        AND (H3.IDCARTEIRAGERENC IS NULL)' + #13;
      end;

      // Filtra o Investimento
      if (iInvestimento > 0) and (bPrimeiro) then
      begin
         sSql := sSql + '                      WHERE (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
         bPrimeiro := False;
      end
      else
      if (iInvestimento > 0) and (not bPrimeiro) then
         sSql := sSql + '                        AND (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

      // Filtra o Lote
      if (sLote <> '') and (bPrimeiro) then
      begin
         sSql := sSql + '                      WHERE (H3.IDLOTE = ' + sLote + ')' + #13;
         bPrimeiro := False;
      end
      else
      if (sLote <> '') and (not bPrimeiro) then
         sSql := sSql + '                        AND (H3.IDLOTE = ' + sLote + ')' + #13;

      // Filtra a Data
      if bPrimeiro then
         sSql := sSql + '                      WHERE ((H3.DATAMOVCARTINV   < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13
      else
         sSql := sSql + '                        AND ((H3.DATAMOVCARTINV   < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13;

      sSql := sSql +
      '                              ((H3.DATAMOVCARTINV = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) AND ' + #13 +
      '                                (H3.IDHISTCARTINV    < ' + IntToStr(iHistCartInv) + ' ))) ' + #13 +
      '                        AND ((H3.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000), ' + #13 +
      '                                                        NVL(P1.IDTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000), ' + #13 +
      '                                                        NVL(P1.IDTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000), ' + #13 +
      '                                                        -70, -10070, -10170)) OR ' + #13 +
      '                             (H3.IDTIPOOPERACAO IS NULL)) ' + #13 +
      '                     )' + #13 +
      '                 ) ' + #13 +
      '             AND ((H2.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000), ' + #13 +
      '                                             NVL(P1.IDTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000), ' + #13 +
      '                                             NVL(P1.IDTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000), ' + #13 +
      '                                             -70, -10070, -10170)) OR ' + #13 +
      '                  (H2.IDTIPOOPERACAO IS NULL)) ' + #13 +
      '             AND (H2.IDHISTCARTINV < ' + IntToStr(iHistCartInv) + ') ' + #13 +
      '          ) ' + #13 +
      '      ) ' + #13 +
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0) ' + #13 +
      ' ' + #13 +
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC ';

      _Cds.Data := GetDataPacket(sSQL);
//      CMDebugToFile(sSql, 'C:\sSql.txt');
//      _Cds.SaveToFile('C:_Cds.cds');
      if _Cds.IsEmpty then
          Raise Exception.Create('Saldo não encontrado.')
      else
      begin
         FIdHistCartInv      := _Cds.FieldByName('IDHISTCARTINV').AsInteger;
         FDataSaldo          := _Cds.FieldByName('DATAMOVCARTINV').AsDateTime;
         FSaldoQtdTotal      := _Cds.FieldByName('SALDOQTDEINVCART').AsFloat;
         FSaldoVlrTotal      := _Cds.FieldByName('SALDOVLRINVCART').AsFloat;
         FSaldoCusto         := _Cds.FieldByName('SALDOAQUI').AsFloat;
         FSaldoVariacao      := _Cds.FieldByName('SALDOVARIACAO').AsFloat;
         FSaldoIRProv        := _Cds.FieldByName('SALDOIRPROV').AsFloat;
         FSaldoIRApurado     := _Cds.FieldByName('SALDOIRAPU').AsFloat;
         FSaldoIOFProv       := _Cds.FieldByName('SALDOIOFPROV').AsFloat;
         FSaldoIOFApurado    := _Cds.FieldByName('SALDOIOFAPU').AsFloat;
         FSldQtdCC           := _Cds.FieldByName('SALDOQTDECPMF').AsFloat;
         FSldQtdCCI          := (_Cds.FieldByName('SALDOQTDEINVCART').AsFloat - _Cds.FieldByName('SALDOQTDECPMF').AsFloat);
         //AL_7
         FSldProvPerda       := _Cds.FieldByName('SALDOPROVPERDA').AsFloat;

         //AL_9 - Ini
         if (iInvestimento > 0) and (iPlanPrev > 0) and (iCarteira > 0) and
            (iCustodiante > 0) then
         begin
            if sLote = '' then
               sLote := ' IS NULL'
            else
               sLote := ' = ' + sLote;

            sSql := '';
            sSql :=
               // AL_3
               'SELECT H.SALDOLIBERADO, H.SALDOBLOQUEADO, H.SALDOQTDECPMF ' + #13 +
               'FROM HISTCUSTODIA H ' + #13 +
               'WHERE (H.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13 +
               '  AND (H.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ')' + #13 +
               '  AND (H.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13 +
               '  AND (H.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ')' + #13 +
               '  AND (H.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotivoBloqueio)+ ')' + #13 +
               '  AND (H.IDLOTE ' + sLote + ')' + #13 +
               '  AND (H.IDCUSTODIA = (SELECT MAX(H1.IDCUSTODIA) ' + #13 +
               '                       FROM HISTCUSTODIA H1 ' + #13 +
               '                       WHERE (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13 +
               '                         AND (H1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ')' + #13 +
               '                         AND (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13 +
               '                         AND (H1.IDCUSTODIANTE = ' + IntToStr(iCustodiante)+ ')' + #13 +
               '                         AND (H1.IDMOTIVOBLOQUEIO  = ' + IntToStr(iMotivoBloqueio)+ ')' + #13 +
               '                         AND (H1.IDLOTE ' + sLote + ')' + #13 +
               '                         AND (H1.DATAMOVCUSTOD = (SELECT MAX(H2.DATAMOVCUSTOD) ' + #13 +
               '                                                  FROM HISTCUSTODIA H2 ' + #13 +
               '                                                  WHERE (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13 +
               '                                                    AND (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ')' + #13 +
               '                                                    AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13 +
               '                                                    AND (H2.IDCUSTODIANTE = ' + IntToStr(iCustodiante)+ ')' + #13 +
               '                                                    AND (H2.IDMOTIVOBLOQUEIO  = ' + IntToStr(iMotivoBloqueio)+ ')' + #13 +
               '                                                    AND (H2.IDLOTE ' + sLote + ')' + #13 +
               '                                                    AND ((H2.DATAMOVCUSTOD < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13 +
               '                                                         ((H2.DATAMOVCUSTOD = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) AND ' + #13 +
               '                                                          (H2.IDCUSTODIA < ' + IntToStr(iHistCustodia) + '))) ))' + #13 +
               '                         AND (H1.IDCUSTODIA < ' + IntToStr(iHistCustodia) + ')) )';

            _Cds.Data := GetDataPacket(sSQL);
            if _Cds.IsEmpty then
                Raise Exception.Create('Saldo na Custódia não encontrado.')
            else
            begin
               FSldQtdLibCustodia  := _Cds.FieldByName('SALDOLIBERADO').AsFloat;
               FSldQtdBloqCustodia := _Cds.FieldByName('SALDOBLOQUEADO').AsFloat;
               if iMotivoBloqueio = -1 then
               begin
                  FSldQtdCustodiaCC   := _Cds.FieldByName('SALDOQTDECPMF').AsFloat;
                  FSldQtdCustodiaCCI  := (_Cds.FieldByName('SALDOLIBERADO').AsFloat - _Cds.FieldByName('SALDOQTDECPMF').AsFloat);
               end
               else
               begin
                  FSldQtdCustodiaCC   := _Cds.FieldByName('SALDOQTDECPMF').AsFloat;
                  FSldQtdCustodiaCCI  := (_Cds.FieldByName('SALDOBLOQUEADO').AsFloat - _Cds.FieldByName('SALDOQTDECPMF').AsFloat);
               end;
            end;
         end;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

// ------------------- Métodos Diversos ----------------------------------------


end.
