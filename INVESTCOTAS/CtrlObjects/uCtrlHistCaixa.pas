unit uCtrlHistCaixa;

interface


uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbHistCaixa, uCtrlCarteiraXEvento, UDiasUteisInvest, uCtrlPadroes,
     uDbHistCota
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlHistCaixa = Class(TCmControlObject)
   private
    FCdsHistCaixa : TClientDataSet;
    FDbHistCaixa  : TDbHistCaixa;
    FDbHistCota   : TDbHistCota;

    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;

    procedure SetCdsHistCaixa(const Value: TClientDataSet);
    procedure SetDbHistCaixa(const Value: TDbHistCaixa);
    procedure SetDbHistCota(const Value: TDbHistCota);

   public
      property CdsHistCaixa : TClientDataSet read FCdsHistCaixa write SetCdsHistCaixa;
      property DbHistCaixa  : TDbHistCaixa read FDbHistCaixa write SetDbHistCaixa;
      property DbHistCota   : TDbHistCota read FDbHistCota write SetDbHistCota;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function AplicaAtualHistCaixa : Boolean;

      function ListHistCaixa(iIdHistCaixa : Integer = -1;
                             sStaSomaDiminui : String = '';
                             dData : TDateTime = 0;
                             iIdCarteiraInvest : Integer = -1;
                             iIdEventoCaixaCota : Integer = 0) : OleVariant;

      function BuscaSaldo(dDataCalc : TDateTime = 0; iIdCarteiraInvest : Integer = -1; iIdCarteiraXEvento : Integer = -1) : Double;

      function ApuraCalculoCaixa(dDataCalc : TDateTime = 0; iIdCarteiraInvest : Integer = -1) : Boolean;

      function ListLanctoCaixa(dDataIni : TDateTime = 0; dDataFim : TDateTime = 0;
                               iIdCarteiraInvest : Integer = -1; iIdEventoCaixaCota : Integer = -1) : OleVariant;

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{ TCtrlHistCaixa }

function TCtrlHistCaixa.AplicaAtualHistCaixa: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualHistCaixa(FCdsHistCaixa.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         if not InTransaction then
            StartTransaction;

         Result := ApplyCds(FCdsHistCaixa,FDbHistCaixa,[],[]);
         if not Result then
            Raise Exception.Create(FDbHistCaixa.MessageInfo)
         else
            Commit;
      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlHistCaixa.BuscaSaldo(dDataCalc: TDateTime;  iIdCarteiraInvest: Integer; iIdCarteiraXEvento: Integer): Double;
var CdsBuscaSaldo : TClientDataSet;
    sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT SLDHISTCAIXA ';
   sSql := sSql + 'FROM HISTCAIXA  ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '      IDCARTEIRAXEVENTO  = '+IntToStr(iIdCarteiraXEvento);
   if dDataCalc > 0 then
      sSql := sSql + ' AND  DATAHISTCAIXA      = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+') ';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  IDCARTEIRAINVEST   = ' + IntToStr(iIdCarteiraInvest);

   CdsBuscaSaldo := TClientDataSet.Create(nil);
   CdsBuscaSaldo.Data := GetDataPacket(sSql);

   Result := CdsBuscaSaldo.FieldByName('SLDHISTCAIXA').AsFloat;

   FreeAndNil(CdsBuscaSaldo);
end;

function TCtrlHistCaixa.ApuraCalculoCaixa(dDataCalc: TDateTime;  iIdCarteiraInvest: Integer): Boolean;
var CdsAux : TClientDataSet;
    sSql : String;
    iIdCarteiraXEvento : Integer;
    fVlrSaldoAnt : Double;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ApuraCalculoCaixa(dDataCalc,iIdCarteiraInvest);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         if not InTransaction then
            StartTransaction;

         //Busca id do saldo anterior
         iIdCarteiraXEvento := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-1, iIdCarteiraInvest);
         if iIdCarteiraXEvento <= 0 then
            Raise Exception.Create('Não foi encontrado o evento Saldo Anterior para a Carteira.');

         sSql := '';
         sSql := sSql + 'DELETE FROM HISTCAIXA WHERE ';
         sSql := sSql + '    IDCARTEIRAXEVENTO = '+IntToStr(iIdCarteiraXEvento);
         sSql := sSql + 'AND DATAHISTCAIXA     = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+')';
         if not ExecSQL(sSql) then
            Raise Exception.Create(MessageInfo);

         //Busca id do saldo atual
         iIdCarteiraXEvento := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-2, iIdCarteiraInvest);
         if iIdCarteiraXEvento <= 0 then
            Raise Exception.Create('Não foi encontrado o evento Saldo Atual para a Carteira.');

         //Saldo Anterior
         fVlrSaldoAnt := BuscaSaldo(DiasUteisInvest.UltDiaUtilAnterior(dDataCalc,-1,1,'',True,False,False),
                                    iIdCarteiraInvest, iIdCarteiraXEvento);
         sSql := '';
         sSql := sSql + 'DELETE FROM HISTCAIXA WHERE ';
         sSql := sSql + '    IDCARTEIRAXEVENTO = '+IntToStr(iIdCarteiraXEvento);
         sSql := sSql + 'AND DATAHISTCAIXA     = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+')';
         if not ExecSQL(sSql) then
            Raise Exception.Create(MessageInfo);

         sSql := '';
         sSql := sSql + 'DELETE FROM HISTCOTA WHERE ';
         sSql := sSql + '    IDCARTEIRAXEVENTO = '+IntToStr(iIdCarteiraXEvento);
         sSql := sSql + 'AND DATAHISTCOTA      = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+')';
         if not ExecSQL(sSql) then
            Raise Exception.Create(MessageInfo);

         CdsAux := TClientDataSet.Create(nil);
         CdsAux.Data := ListHistCaixa(-1,'', dDataCalc, iIdCarteiraInvest);
         CdsAux.First;

         FDbHistCaixa.Vlrhistcaixa.AsFloat        := 0;
         FDbHistCaixa.Sldhistcaixa.AsFloat        := fVlrSaldoAnt;
         FDbHistCaixa.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-1, iIdCarteiraInvest);
         FDbHistCaixa.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
         FDbHistCaixa.Datahistcaixa.AsDateTime    := dDataCalc;
         FDbHistCaixa.Insert;

         while not CdsAux.Eof do
         begin
            if CdsAux.FieldByName('STASOMADIMINUI').AsString = 'S' then
               fVlrSaldoAnt := fVlrSaldoAnt + CdsAux.FieldByName('VLRHISTCAIXA').AsFloat
            else if CdsAux.FieldByName('STASOMADIMINUI').AsString = 'D' then
               fVlrSaldoAnt := fVlrSaldoAnt - CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;

            if not ExecSQL('DELETE FROM HISTCAIXA WHERE IDHISTCAIXA = '+CdsAux.FieldByName('IDHISTCAIXA').AsString) then
               Raise Exception.Create(MessageInfo);

            //Eventos
            FDbHistCaixa.Vlrhistcaixa.AsFloat        := CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;
            FDbHistCaixa.Sldhistcaixa.AsFloat        := fVlrSaldoAnt;
            FDbHistCaixa.Idcarteiraxevento.AsInteger :=
                         CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger,
                                                                    iIdCarteiraInvest);
            FDbHistCaixa.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCaixa.Datahistcaixa.AsDateTime    := dDataCalc;
            FDbHistCaixa.Insert;

            CdsAux.Next;
         end;

         //Saldo Atual
         FDbHistCaixa.Vlrhistcaixa.AsFloat        := 0;
         FDbHistCaixa.Sldhistcaixa.AsFloat        := fVlrSaldoAnt;
         FDbHistCaixa.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-2, iIdCarteiraInvest);
         FDbHistCaixa.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
         FDbHistCaixa.Datahistcaixa.AsDateTime    := dDataCalc;
         FDbHistCaixa.Insert;

         FDbHistCota.Vlrhistcota.AsFloat          := fVlrSaldoAnt;
         FDbHistCota.Idcarteiraxevento.AsInteger  := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-2, iIdCarteiraInvest);
         FDbHistCota.Idcarteirainvest.AsInteger   := iIdCarteiraInvest;
         FDbHistCota.Datahistcota.AsDateTime      := dDataCalc;
         FDbHistCota.Insert;

         if InTransaction then
            Commit;

         Result := True;

      except
         on E:Exception do
         begin
            if InTransaction then
               Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;

      FreeAndNil(CdsAux);
   end;

end;

constructor TCtrlHistCaixa.Create;
begin
  inherited;
   FDbHistCaixa := TDbHistCaixa.Create(Self);

   FDbHistCota := TDbHistCota.Create(Self);   

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);
end;

destructor TCtrlHistCaixa.Destroy;
begin
  inherited;
   FreeAndNil(FDbHistCota);  
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(FDbHistCaixa);
   if IsAppServer then FreeAndNil(FCdsHistCaixa);

end;

procedure TCtrlHistCaixa.DoChangeDataBase;
begin
  inherited;
   FDbHistCota.DataBaseName  := DataBaseName;
   FDbHistCaixa.DataBaseName := DataBaseName;
end;

function TCtrlHistCaixa.ListHistCaixa(iIdHistCaixa: Integer;
                                      sStaSomaDiminui : String;
                                      dData : TDateTime;
                                      iIdCarteiraInvest : Integer;
                                      iIdEventoCaixaCota : Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '     HC.IDHISTCAIXA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC.DATAHISTCAIXA, ';
   sSql := sSql + '     NVL(HC.VLRHISTCAIXA,0) AS VLRHISTCAIXA, NVL(HC.SLDHISTCAIXA,0) AS SLDHISTCAIXA, ';
   sSql := sSql + '     HC.IDOPERACAOINVEST, HC.IDCARTEIRAINVEST, ';
   sSql := sSql + '     HC.IDCARTEIRAGERENC, HC.IDOPERACAODIREITO, HC.DESCINVESTIMENTO, HC.TIPMOVCAIXA, ';
   sSql := sSql + '     ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STASOMADIMINUI, ECC.IDTIPOOPERACAO, ';
   sSql := sSql + '     ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGMANUALAUT, ';
   sSql := sSql + '     CI.DESCCARTINVEST ';
   sSql := sSql + 'FROM HISTCAIXA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + 'AND  ECC.STACAIXA         = ''S'' ';
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   if iIdHistCaixa > 0 then
      sSql := sSql + 'AND  HC.IDHISTCAIXA       = '+IntToStr(iIdHistCaixa)+' ';
   if sStaSomaDiminui <> '' then
      sSql := sSql + 'AND  ECC.STASOMADIMINUI   = '+QuotedStr(sStaSomaDiminui)+' ';
   if dData > 0 then
      sSql := sSql + 'AND  HC.DATAHISTCAIXA     = TO_DATE('+QuotedStr(DateToStr(dData))+','+QuotedStr('DD/MM/YYYY')+') ';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + 'AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest)+' ';
   if iIdEventoCaixaCota <> 0 then
       sSql := sSql + 'AND  ECC.IDEVENTOCAIXACOTA = '+IntToStr(iIdEventoCaixaCota);
   sSql := sSql + ' ORDER BY HC.DATAHISTCAIXA, HC.IDHISTCAIXA ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlHistCaixa.OnCreateAppServer;
begin
  inherited;
   FCdsHistCaixa := TClientDataSet.Create(nil);
end;

procedure TCtrlHistCaixa.SetCdsHistCaixa(const Value: TClientDataSet);
begin
  FCdsHistCaixa := Value;
end;

procedure TCtrlHistCaixa.SetDbHistCaixa(const Value: TDbHistCaixa);
begin
  FDbHistCaixa := Value;
end;

procedure TCtrlHistCaixa.SetDbHistCota(const Value: TDbHistCota);
begin
  FDbHistCota := Value;
end;

function TCtrlHistCaixa.ListLanctoCaixa(dDataIni, dDataFim: TDateTime; iIdCarteiraInvest, iIdEventoCaixaCota: Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '     HC.IDHISTCAIXA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC.DATAHISTCAIXA, ';
   sSql := sSql + '     NVL(HC.VLRHISTCAIXA,0) AS VLRHISTCAIXA, NVL(HC.SLDHISTCAIXA,0) AS SLDHISTCAIXA, ';
   sSql := sSql + '     HC.IDOPERACAOINVEST, HC.IDCARTEIRAINVEST, ';
   sSql := sSql + '     HC.IDCARTEIRAGERENC, HC.IDOPERACAODIREITO, HC.DESCINVESTIMENTO, HC.TIPMOVCAIXA, ';
   sSql := sSql + '     ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STASOMADIMINUI, ECC.IDTIPOOPERACAO, ';
   sSql := sSql + '     ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGMANUALAUT, ';
   sSql := sSql + '     CI.DESCCARTINVEST ';
   sSql := sSql + 'FROM HISTCAIXA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.DATAHISTCAIXA BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIni))+','+QuotedStr('DD/MM/YYYY')+') '+
                  'AND                           TO_DATE('+QuotedStr(DateToStr(dDataFim))+','+QuotedStr('DD/MM/YYYY')+') ';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + 'AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest)+' ';
   if iIdEventoCaixaCota <> 0 then
      sSql := sSql + 'AND  ECC.IDEVENTOCAIXACOTA = '+IntToStr(iIdEventoCaixaCota)+' ';
   sSql := sSql + 'AND  ECC.STACAIXA         = ''S'' ';
   sSql := sSql + 'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   sSql := sSql + ' ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCAIXA, HC.IDHISTCAIXA ';
   Result := GetDataPacket(sSql);
end;

end.
