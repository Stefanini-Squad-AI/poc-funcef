unit uCtrlHistCota;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMMath,
     uDbHistCota, uCtrlCarteiraXEvento, uCtrlHistCaixa, UDiasUteisInvest, uCtrlPadroes,
     uDbParamCotaInvest, uCtrlParamCotaInvest, Wwquery, URegra, uCtrlEventoCaixaCota,
     uCtrlInvFI, uCtrlInvRF, uCMFileUtils, uCtrlInvRV
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlHistCota = Class(TCmControlObject)
   private
    _Cds         : TClientDataSet;
    FCdsHistCota : TClientDataSet;

    FDbHistCota  : TDbHistCota;
    FDbParamCotaInvest : TDbParamCotaInvest;

    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlHistCaixa : TCtrlHistCaixa;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlInvFI : TCtrlInvFI;
    CtrlInvRF : TCtrlInvRF;
    CtrlInvRV : TCtrlInvRV;

    FCdsAtivo: TClientDataSet;
    FCdsPassivo: TClientDataSet;

    procedure SetCdsHistCota(const Value: TClientDataSet);
    procedure SetDbHistCota(const Value: TDbHistCota);
    procedure SetDbParamCotaInvest(const Value: TDbParamCotaInvest);
    procedure SetCdsAtivo(const Value: TClientDataSet);
    procedure SetCdsPassivo(const Value: TClientDataSet);

   public
      property CdsHistCota : TClientDataSet read FCdsHistCota write SetCdsHistCota;
      property CdsAtivo : TClientDataSet read FCdsAtivo write SetCdsAtivo;
      property CdsPassivo : TClientDataSet read FCdsPassivo write SetCdsPassivo;

      property DbHistCota  : TDbHistCota read FDbHistCota write SetDbHistCota;

      property DbParamCotaInvest : TDbParamCotaInvest read FDbParamCotaInvest write SetDbParamCotaInvest;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function ListHistCota(iIdHistCota: Integer = -1;
                            sStaAtivoPassivo: String = ''; sStaCotiza: String = '';
                            dDataCalc: TDateTime = 0;
                            iIdCarteiraInvest : Integer = -1): OleVariant;

      function ListApuraCota(dDataCalc : TDateTime = 0; iIdCarteiraInvest : Integer = -1) : OleVariant;

      function ListTotalCota(iIdHistCota: Integer = -1;
                             sStaAtivoPassivo: String = ''; sStaCotiza: String = '';
                             dDataCalc: TDateTime = 0;
                             iIdCarteiraInvest : Integer = -1): OleVariant;

      function AplicaAtualHistCota : Boolean;

      function AplicaAtualAtivoPassivo : Boolean;

      function ApuraCalculoCota(dDataCalc : TDateTime = 0; iIdCarteiraInvest : Integer = -1) : Boolean;

      function BuscaSaldoBmf(dDataCalc : TDateTime; iIdCarteiraInvest : Integer): Double;

      function ApuraTaxaAdm(dDataCalc : TDateTime; iIdCarteiraInvest : Integer): Double;

      function ApuraTaxaPerf(dDataCalc : TDateTime; iIdCarteiraInvest : Integer): Double;

      function AlimentaEventoAuto(dDataCalc : TDateTime; iIdCarteiraInvest : Integer) : Boolean;

      function ListLanctoHistCota(dDataIni : TDateTime = 0; dDataFim : TDateTime = 0;
                                  iIdCarteiraInvest : Integer = -1; iIdEventoCaixaCota : Integer = 0; 
                                  sStaAtivoPassivo: String = ''): OleVariant;

      function ListHistApuracao(dDataIni : TDateTime = 0; dDataFim : TDateTime = 0;
                                iIdEventoCaixaCota : Integer = 0;
                                iIdCarteiraInvest : Integer = -1): OleVariant;

      function ListGuiaRelLanctoCota(dDataIni : TDateTime = 0; dDataFim : TDateTime = 0;
                                     iIdCarteiraInvest : Integer = -1): OleVariant;

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{ TCtrlHistCota }

function TCtrlHistCota.AlimentaEventoAuto(dDataCalc: TDateTime; iIdCarteiraInvest: Integer): Boolean;
var fValorRVariavel, fValorRFixa, fValorFundos, fValorBmf, fValorTxPerf, fValorTxAdm : Double;
    CdsAux, CdsBuscaEvAuto : TClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AlimentaEventoAuto(dDataCalc, iIdCarteiraInvest);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      fValorRVariavel := 0;
      fValorRFixa     := 0;
      fValorFundos    := 0;
      try
         try
            if not InTransaction then
               StartTransaction;

            //Seleção do dia atual
            CdsAux := TClientDataSet.Create(nil);
            CdsAux.Data := ListHistCota(-1,'','', dDataCalc, iIdCarteiraInvest);

            //Disponibilidade
            CdsBuscaEvAuto := TClientDataSet.Create(nil);
            CdsBuscaEvAuto.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0,iIdCarteiraInvest,0,'','S','','A','','A');
            while not CdsBuscaEvAuto.Eof do
            begin
               if CdsBuscaEvAuto.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -8 then
               begin
                  if CtrlInvRV.BuscaSaldoTotal(dDataCalc,0,iIdCarteiraInvest) then
                     fValorRVariavel := CtrlInvRV.SaldoTotal;

                  CdsAux.First;
                  if CdsAux.Locate('IDEVENTOCAIXACOTA','-8',[]) then
                  begin
                     FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
                     FDbHistCota.Delete;
                  end;

                  FDbHistCota.Vlrhistcota.AsFloat         := fValorRVariavel;
                  FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-8, iIdCarteiraInvest);
                  FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
                  FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
                  FDbHistCota.Insert;

               end;

               if CdsBuscaEvAuto.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -9 then
               begin
                  if CtrlInvRF.SaldoTotalRenFix(dDataCalc, 0, 0, iIdCarteiraInvest, 0, 0) then
                     fValorRFixa := CtrlInvRF.SaldoTotal;
                  CdsAux.First;
                  if CdsAux.Locate('IDEVENTOCAIXACOTA','-9',[]) then
                  begin
                     FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
                     FDbHistCota.Delete;
                  end;

                  FDbHistCota.Vlrhistcota.AsFloat         := fValorRFixa;
                  FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-9, iIdCarteiraInvest);
                  FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
                  FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
                  FDbHistCota.Insert;

               end;

               if CdsBuscaEvAuto.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -10 then
               begin
                  if CtrlInvFI.BuscaSaldoFundos(dDataCalc, -1, iIdCarteiraInvest) then
                     fValorFundos := CtrlInvFI.TotSldFundo;
                  CdsAux.First;
                  if CdsAux.Locate('IDEVENTOCAIXACOTA','-10',[]) then
                  begin
                     FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
                     FDbHistCota.Delete;
                  end;

                  FDbHistCota.Vlrhistcota.AsFloat         := fValorFundos;
                  FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-10, iIdCarteiraInvest);
                  FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
                  FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
                  FDbHistCota.Insert;

               end;

               if CdsBuscaEvAuto.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -11 then
               begin
                  fValorBmf := BuscaSaldoBmf(dDataCalc, iIdCarteiraInvest);
                  CdsAux.First;
                  if CdsAux.Locate('IDEVENTOCAIXACOTA','-11',[]) then
                  begin
                     FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
                     FDbHistCota.Delete;
                  end;

                  FDbHistCota.Vlrhistcota.AsFloat         := fValorFundos;
                  FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-11, iIdCarteiraInvest);
                  FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
                  FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
                  FDbHistCota.Insert;

               end;

               CdsBuscaEvAuto.Next;
            end;

            //Exigibilidade
            CdsBuscaEvAuto.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0,iIdCarteiraInvest,0,'','S','','P','','A');
            while not CdsBuscaEvAuto.Eof do
            begin
               if CdsBuscaEvAuto.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -12 then
               begin
                  fValorTxPerf := ApuraTaxaPerf(dDataCalc, iIdCarteiraInvest);
                  CdsAux.First;
                  if CdsAux.Locate('IDEVENTOCAIXACOTA','-12',[]) then
                  begin
                     FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
                     FDbHistCota.Delete;
                  end;

                  FDbHistCota.Vlrhistcota.AsFloat         := fValorTxPerf;
                  FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-12, iIdCarteiraInvest);
                  FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
                  FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
                  FDbHistCota.Insert;

               end;

               if CdsBuscaEvAuto.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -13 then
               begin
                  fValorTxAdm := ApuraTaxaAdm(dDataCalc, iIdCarteiraInvest);
                  CdsAux.First;
                  if CdsAux.Locate('IDEVENTOCAIXACOTA','-13',[]) then
                  begin
                     FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
                     FDbHistCota.Delete;
                  end;

                  FDbHistCota.Vlrhistcota.AsFloat         := fValorTxAdm;
                  FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-13, iIdCarteiraInvest);
                  FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
                  FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
                  FDbHistCota.Insert;

               end;

               CdsBuscaEvAuto.Next;
            end;
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
      finally
         FreeAndNil(CdsAux);
         FreeAndNil(CdsBuscaEvAuto);
      end;
   end;
end;

function TCtrlHistCota.AplicaAtualAtivoPassivo: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualHistCota(FCdsHistCota.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         if not InTransaction then
            StartTransaction;

         Result := ApplyCds(FCdsAtivo,FDbHistCota,[],[]);
         if not Result then
            Raise Exception.Create(FDbHistCota.MessageInfo);

         Result := ApplyCds(FCdsPassivo,FDbHistCota,[],[]);
         if not Result then
            Raise Exception.Create(FDbHistCota.MessageInfo);

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

function TCtrlHistCota.AplicaAtualHistCota: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualHistCota(FCdsHistCota.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         if not InTransaction then
            StartTransaction;

         Result := ApplyCds(FCdsHistCota,FDbHistCota,[],[]);
         if not Result then
            Raise Exception.Create(FDbHistCota.MessageInfo)
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

function TCtrlHistCota.ApuraCalculoCota(dDataCalc: TDateTime; iIdCarteiraInvest: Integer): Boolean;
var CdsParametro, CdsAux : TClientDataSet;
    fQtdCotasAnt, fQtdCotas, fVlrCotaDia, fVlrPatrLiq, fVlrPatrLiqFinal,
    fQtdCotaEmitir, fVlrCotaEmitir, fQtdCotaResg, fVlrCotaResg : Double;
begin
   Result := False;
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ApuracaoCalculoCota(dDataCalc, iIdCarteiraInvest);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      fVlrCotaDia  := 0;
      fVlrPatrLiq  := 0;
      fQtdCotas    := 0;
      fQtdCotasAnt := 0;
      try
         try
            if not InTransaction then
               StartTransaction;

            //--------------------------------------------------
            //Seleção do dia atual
            CdsAux  := TClientDataSet.Create(nil);
            CdsAux.Data := ListHistCota(-1,'','', dDataCalc, iIdCarteiraInvest);

            CdsAux.First;
            //Exclui Cotas Emitidas
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-16',[]) then
            begin
               FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
               FDbHistCota.Delete;
            end;

            CdsAux.First;
            //Exclui Cotas Resgatadas
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-17',[]) then
            begin
               FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
               FDbHistCota.Delete;
            end;

            CdsAux.First;
            //Exclui o Patrimônio Líquido Final
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-18',[]) then
            begin
               FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
               FDbHistCota.Delete;
            end;

            CdsAux.First;
            //Exclui o Patrimônio Líquido
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-3',[]) then
            begin
               FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
               FDbHistCota.Delete;
            end;

            CdsAux.First;
            //Exclui a Quantidade de Cotas
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-4',[]) then
            begin
               fQtdCotas := CdsAux.FieldByName('VLRHISTCOTA').AsFloat;
               FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
               FDbHistCota.Delete;
            end;

            CdsAux.First;
            //Exclui o Valor de Cota
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-5',[]) then
            begin
               FDbHistCota.Idhistcota.AsInteger := CdsAux.FieldByName('IDHISTCOTA').AsInteger;
               FDbHistCota.Delete;
            end;

            //--------------------------------------------------
            //Apuração do patrimônio líquido final
            CdsAux.First;
            while not CdsAux.Eof do
            begin
               if not ((CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -3) or
                       (CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -4) or
                       (CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -5) or
                       (CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -16) or
                       (CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -17) or
                       (CdsAux.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -18)) then
               begin
                  if CdsAux.FieldByName('STAATIVOPASSIVO').AsString = 'A' then
                     fVlrPatrLiqFinal := fVlrPatrLiqFinal + CdsAux.FieldByName('VLRHISTCOTA').AsFloat
                  else if CdsAux.FieldByName('STAATIVOPASSIVO').AsString = 'P' then
                     fVlrPatrLiqFinal := fVlrPatrLiqFinal - CdsAux.FieldByName('VLRHISTCOTA').AsFloat;
               end;
               CdsAux.Next;
            end;

//            if fVlrPatrLiqFinal <= 0 then
//               Raise Exception.Create('Não exite valor de Patrimônio para a Carteira.');

            FDbHistCota.Vlrhistcota.AsFloat         := fVlrPatrLiqFinal;
            FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-3, iIdCarteiraInvest);
            if FDbHistCota.Idcarteiraxevento.AsInteger = 0 then
               Raise Exception.Create('O evento "Patrimônio Líquido Final" não está vinculado para a Carteira.');
            FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
            FDbHistCota.Insert;

            fVlrPatrLiq := fVlrPatrLiqFinal;

            //Apura Cotas a Emitidas
            CdsAux.Data := CtrlHistCaixa.ListHistCaixa(-1,'',dDataCalc,iIdCarteiraInvest, -6);
            FDbHistCota.Vlrhistcota.AsFloat         := CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;
            FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-16, iIdCarteiraInvest);
            if FDbHistCota.Idcarteiraxevento.AsInteger = 0 then
               Raise Exception.Create('O evento "Cotas Emitidas" não está vinculado para a Carteira.');
            FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
            FDbHistCota.Insert;
            fVlrPatrLiq := fVlrPatrLiq - CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;
            fVlrCotaEmitir := CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;

            //Apura Cotas a Resgatadas
            CdsAux.Data := CtrlHistCaixa.ListHistCaixa(-1,'',dDataCalc,iIdCarteiraInvest, -7);
            FDbHistCota.Vlrhistcota.AsFloat         := CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;
            FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-17, iIdCarteiraInvest);
            if FDbHistCota.Idcarteiraxevento.AsInteger = 0 then
               Raise Exception.Create('O evento "Cotas Resgatadas" não está vinculado para a Carteira.');
            FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
            FDbHistCota.Insert;
            fVlrPatrLiq := fVlrPatrLiq + CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;
            fVlrCotaResg := CdsAux.FieldByName('VLRHISTCAIXA').AsFloat;

            //Patrimônio Líquido
            FDbHistCota.Vlrhistcota.AsFloat         := fVlrPatrLiq;
            FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-18, iIdCarteiraInvest);
            if FDbHistCota.Idcarteiraxevento.AsInteger = 0 then
               Raise Exception.Create('O evento "Patrimônio Líquido" não está vinculado para a Carteira.');
            FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
            FDbHistCota.Insert;

            //--------------------------------------------------
            //Busca parâmetro da carteira
            CdsParametro := TClientDataSet.Create(nil);
            CdsParametro.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, iIdCarteiraInvest);

            //Seleção do dia anterior
            CdsAux.Close;
            CdsAux.Data := ListApuraCota(DiasUteisInvest.UltDiaUtilAnterior(dDataCalc,-1,1,'',True,False,False),
                                        iIdCarteiraInvest);
            CdsAux.First;
            if CdsAux.Locate('IDEVENTOCAIXACOTA','-4',[]) then
               fQtdCotasAnt := CdsAux.FieldByName('VLRHISTCOTA').AsFloat;

            if fQtdCotasAnt = 0 then
            begin
               if fVlrCotaDia <= 0 then
                  fVlrCotaDia := CdsParametro.FieldByName('VLRCOTAINICIAL').AsFloat;
               if fVlrCotaDia <= 0 then
                  fVlrCotaDia := 1;
                  
               fQtdCotas := RoundCM(fVlrPatrLiqFinal/fVlrCotaDia, CdsParametro.FieldByName('QTDDECQTD').AsInteger);
            end
            else
               fQtdCotas := fQtdCotasAnt;

            fVlrCotaDia := RoundCM(fVlrPatrLiq/fQtdCotas, CdsParametro.FieldByName('QTDDECVLR').AsInteger);

            fQtdCotaEmitir := RoundCM(fVlrCotaEmitir/fVlrCotaDia, CdsParametro.FieldByName('QTDDECQTD').AsInteger);

            fQtdCotaResg := RoundCM(fVlrCotaResg/fVlrCotaDia, CdsParametro.FieldByName('QTDDECQTD').AsInteger);

            fQtdCotas := fQtdCotas + fQtdCotaEmitir - fQtdCotaResg;

            if fQtdCotas < 1 then
               fQtdCotas := 0;

            if fQtdCotas = 0 then
               fVlrCotaDia := 0
            else
               fVlrCotaDia := RoundCM(fVlrPatrLiqFinal/fQtdCotas, CdsParametro.FieldByName('QTDDECVLR').AsInteger);

            //Grava quantidade de cotas do dia
            FDbHistCota.Vlrhistcota.AsFloat         := fQtdCotas;
            FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-4, iIdCarteiraInvest);
            if FDbHistCota.Idcarteiraxevento.AsInteger = 0 then
               Raise Exception.Create('O evento "Quantidade de Cotas" não está vinculado para a Carteira.');
            FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
            FDbHistCota.Insert;

            //Grava valor de cotas do dia
            FDbHistCota.Vlrhistcota.AsFloat         := fVlrCotaDia;
            FDbHistCota.Idcarteiraxevento.AsInteger := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-5, iIdCarteiraInvest);
            if FDbHistCota.Idcarteiraxevento.AsInteger = 0 then
               Raise Exception.Create('O evento "Valor da Cota" não está vinculado para a Carteira.');
            FDbHistCota.Idcarteirainvest.AsInteger  := iIdCarteiraInvest;
            FDbHistCota.Datahistcota.AsDateTime     := dDataCalc;
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
      finally
         FreeAndNil(CdsAux);
         FreeAndNil(CdsParametro);
      end;
   end;
end;

function TCtrlHistCota.BuscaSaldoBmf(dDataCalc: TDateTime;  iIdCarteiraInvest: Integer): Double;
begin
   Result := 0;
end;

constructor TCtrlHistCota.Create;
begin
  inherited;
   _Cds := TClientDataSet.Create(nil);

   FDbParamCotaInvest := TDbParamCotaInvest.Create(Self);

   FDbHistCota := TDbHistCota.Create(Self);

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);

   CtrlHistCaixa := TCtrlHistCaixa.Create;
   CtrlHistCaixa.InitializeAs(Padroes);

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);

   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);

   CtrlInvFI := TCtrlInvFI.Create;
   CtrlInvFI.InitializeAs(Padroes);

   CtrlInvRF := TCtrlInvRF.Create;
   CtrlInvRF.InitializeAs(Padroes);

   CtrlInvRV := TCtrlInvRV.Create;
   CtrlInvRV.InitializeAs(Padroes);

end;

destructor TCtrlHistCota.Destroy;
begin
  inherited;
   FreeAndNil(_Cds);
   FreeAndNil(CtrlEventoCaixaCota);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(FDbHistCota);
   if IsAppServer then FreeAndNil(FCdsHistCota);

end;

procedure TCtrlHistCota.DoChangeDataBase;
begin
  inherited;
   FDbParamCotaInvest.DataBaseName := DataBaseName;
   FDbHistCota.DataBaseName := DataBaseName;
end;

function TCtrlHistCota.ListApuraCota(dDataCalc: TDateTime; iIdCarteiraInvest: Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + ' SELECT ECC.DESCCAIXACOTA, HC.VLRHISTCOTA, ECC.IDEVENTOCAIXACOTA ';
   sSql := sSql + ' FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + ' WHERE ';
   sSql := sSql + '      HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + ' AND  ECC.IDEVENTOCAIXACOTA IN (-3,-4,-5,-16,-17,-18) ';
   sSql := sSql + ' AND  ECC.STACOTA          = ''S'' ';
   sSql := sSql + ' AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + ' AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   if dDataCalc > 0 then
      sSql := sSql + ' AND  HC.DATAHISTCOTA     = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+')';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  HC.IDCARTEIRAINVEST = '+IntToStr(iIdCarteiraInvest);

   sSql := sSql + ' ORDER BY ECC.IDEVENTOCAIXACOTA DESC ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistCota.ListHistCota(iIdHistCota: Integer;
                                    sStaAtivoPassivo, sStaCotiza: String;
                                    dDataCalc: TDateTime;
                                    iIdCarteiraInvest : Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC.DATAHISTCOTA, ';
   sSql := sSql + '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, ';
   sSql := sSql + '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO, ECC.IDTIPOOPERACAO, ';
   sSql := sSql + '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGMANUALAUT, ';
   sSql := sSql + '   CI.DESCCARTINVEST ';
   sSql := sSql + 'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + 'AND  ECC.STACOTA          = ''S'' ';
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   if iIdHistCota > 0 then
      sSql := sSql + ' AND HC.IDHISTCOTA       = '+IntToStr(iIdHistCota);
   if sStaAtivoPassivo <> '' then
      sSql := sSql + ' AND  ECC.STAATIVOPASSIVO  = '+QuotedStr(sStaAtivoPassivo);
   if sStaCotiza <> '' then
      sSql := sSql + ' AND  ECC.STACOTIZA        = '+QuotedStr(sStaCotiza);
   if dDataCalc > 0 then
      sSql := sSql + ' AND  HC.DATAHISTCOTA      = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+')';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   sSql := sSql + ' ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistCota.ListTotalCota(iIdHistCota: Integer;
                                     sStaAtivoPassivo, sStaCotiza: String; dDataCalc: TDateTime;
                                     iIdCarteiraInvest: Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   SUM(NVL(HC.VLRHISTCOTA,0)) AS VLRTOTAL ';
   sSql := sSql + 'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + 'AND  ECC.STACOTA          = ''S'' ';
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   if iIdHistCota > 0 then
      sSql := sSql + ' AND HC.IDHISTCOTA       = '+IntToStr(iIdHistCota);
   if sStaAtivoPassivo <> '' then
      sSql := sSql + ' AND  ECC.STAATIVOPASSIVO  = '+QuotedStr(sStaAtivoPassivo);
   if sStaCotiza <> '' then
      sSql := sSql + ' AND  ECC.STACOTIZA        = '+QuotedStr(sStaCotiza);
   if dDataCalc > 0 then
      sSql := sSql + ' AND  HC.DATAHISTCOTA      = TO_DATE('+QuotedStr(DateToStr(dDataCalc))+','+QuotedStr('DD/MM/YYYY')+')';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   Result := GetDataPacket(sSql);
end;

procedure TCtrlHistCota.OnCreateAppServer;
begin
  inherited;
   FCdsHistCota := TClientDataSet.Create(nil);
end;

procedure TCtrlHistCota.SetCdsAtivo(const Value: TClientDataSet);
begin
  FCdsAtivo := Value;
end;

procedure TCtrlHistCota.SetCdsHistCota(const Value: TClientDataSet);
begin
  FCdsHistCota := Value;
end;

procedure TCtrlHistCota.SetCdsPassivo(const Value: TClientDataSet);
begin
  FCdsPassivo := Value;
end;

procedure TCtrlHistCota.SetDbHistCota(const Value: TDbHistCota);
begin
  FDbHistCota := Value;
end;

procedure TCtrlHistCota.SetDbParamCotaInvest(const Value: TDbParamCotaInvest);
begin
  FDbParamCotaInvest := Value;
end;

function TCtrlHistCota.ApuraTaxaAdm(dDataCalc: TDateTime; iIdCarteiraInvest: Integer): Double;
var qryAux     : TwwQuery;
    RegraAdm   : TRegra ;
    iIdCarteiraXEvento : Integer;
    sDecSep    : Char;
begin
   Result := 0;
   try
      try
         RegraAdm                 := TRegra.Create(Nil);
         RegraAdm.DatabaseName    := 'BaseDados';
   //      RegraAdm.TipoCliente     := tcFundacao;

         qryAux := TwwQuery.Create(Nil);
         qryAux.DatabaseName := 'BaseDados';

         iIdCarteiraXEvento := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-12, iIdCarteiraInvest);
         if iIdCarteiraXEvento > 0 then
         begin
            _Cds.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(iIdCarteiraXEvento);
            if ((not _Cds.IsEmpty) and (_Cds.FieldByName('IDREGRA').AsInteger <> 0)) then
            begin

               RegraAdm.RuleName := _Cds.FieldByName('IDREGRA').AsString;

               _Cds.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, iIdCarteiraInvest);

               FazQuery(qryAux,'SELECT '+
                               QuotedStr(DateToStr(DiasUteisInvest.UltDiaUtilAnterior(dDataCalc,-1,1,'',True,False,False))) + ' AS DATAINICIO, '+
                               QuotedStr(DateToStr(dDataCalc)) + ' AS DATAFINAL, '+
                               '100 AS PERCENTUAL, '+
                               '0.00 AS TAXA, '+
                               '-1 AS IDCIDADES, '+
                               ' 1 AS IDPAIS, '+
                               ''' '' AS CODESTADO, '+
                               ''' '' AS MOECODIGO, ' +
                               QuotedStr(DateToStr(dDataCalc)) + ' AS DATAATUAL '+
                               'FROM DUAL');

               RegraAdm.QueryIn  := qryAux;

               try
                  sDecSep := DecimalSeparator;
                  //RegraAdm.PassoaPasso;
                  RegraAdm.Execute;
               except
                  begin
                     DecimalSeparator := sDecSep;
                     Raise Exception.Create(RegraAdm.MessageInfo);
                  end;
               end;

               Result := StrToFloatCM(RegraAdm.Result);
            end;
         end;
      except
         on E:Exception do
            MessageInfo := E.Message;
      end;
   finally
      FreeAndNil(RegraAdm);
      FreeAndNil(qryAux);
   end;
end;

function TCtrlHistCota.ApuraTaxaPerf(dDataCalc: TDateTime; iIdCarteiraInvest: Integer): Double;
var qryAux     : TwwQuery;
    RegraPerf  : TRegra ;
    iIdCarteiraXEvento : Integer;
    sDecSep    : Char;
begin
   Result := 0;
   try
      try
         RegraPerf              := TRegra.Create(Nil);
         RegraPerf.DatabaseName := 'BaseDados';
   //      RegraPerf.TipoCliente     := tcFundacao;

         qryAux := TwwQuery.Create(Nil);
         qryAux.DatabaseName := 'BaseDados';

         iIdCarteiraXEvento := CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-13, iIdCarteiraInvest);
         if iIdCarteiraXEvento > 0 then
         begin
            _Cds.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(iIdCarteiraXEvento);
            if ((not _Cds.IsEmpty) and (_Cds.FieldByName('IDREGRA').AsInteger <> 0)) then
            begin
               RegraPerf.RuleName := _Cds.FieldByName('IDREGRA').AsString;

               _Cds.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, iIdCarteiraInvest);

               FazQuery(qryAux,'SELECT '+
                               QuotedStr(DateToStr(DiasUteisInvest.UltDiaUtilAnterior(dDataCalc,-1,1,'',True,False,False))) + ' AS DATAINICIO, '+
                               QuotedStr(DateToStr(dDataCalc)) + ' AS DATAFINAL, '+
                               '100 AS PERCENTUAL, '+
                               '0.00 AS TAXA, '+
                               '-1 AS IDCIDADES, '+
                               ' 1 AS IDPAIS, '+
                               ''' '' AS CODESTADO, '+
                               ''' '' AS MOECODIGO, ' +
                               QuotedStr(DateToStr(dDataCalc)) + ' AS DATAATUAL '+
                               'FROM DUAL');

               RegraPerf.QueryIn  := qryAux;

               try
                  sDecSep := DecimalSeparator;

                  //RegraPerf.PassoaPasso;
                  RegraPerf.Execute;
               except
                  on E:Exception do
                  begin
                     DecimalSeparator := sDecSep;
                     Raise Exception.Create(RegraPerf.MessageInfo);
                  end;
               end;

               Result := StrToFloatCM(RegraPerf.Result);
            end;
         end;
      except
         on E:Exception do
            MessageInfo := E.Message;
      end;
   finally
      FreeAndNil(RegraPerf);
      FreeAndNil(qryAux);
   end;
end;

function TCtrlHistCota.ListLanctoHistCota(dDataIni, dDataFim: TDateTime;
                                          iIdCarteiraInvest, iIdEventoCaixaCota: Integer;
                                          sStaAtivoPassivo: String): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC.DATAHISTCOTA, ';
   sSql := sSql + '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, ';
   sSql := sSql + '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO, ECC.IDTIPOOPERACAO, ';
   sSql := sSql + '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGMANUALAUT, ';
   sSql := sSql + '   CI.DESCCARTINVEST, ECC.STACOTIZA ';
   sSql := sSql + 'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.DATAHISTCOTA   BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIni))+','+QuotedStr('DD/MM/YYYY')+') '+
                  'AND                            TO_DATE('+QuotedStr(DateToStr(dDataFim))+','+QuotedStr('DD/MM/YYYY')+') ';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   if iIdEventoCaixaCota <> 0 then
      sSql := sSql + ' AND  ECC.IDEVENTOCAIXACOTA  = '+IntToStr(iIdEventoCaixaCota);
   if sStaAtivoPassivo <> '' then
      sSql := sSql + ' AND  ECC.STAATIVOPASSIVO  = '+QuotedStr(sStaAtivoPassivo);
   sSql := sSql + ' AND  ECC.STACOTA          = ''S'' ';   
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   sSql := sSql + 'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + ' ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistCota.ListHistApuracao(dDataIni, dDataFim: TDateTime;
                                        iIdEventoCaixaCota, iIdCarteiraInvest: Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC.DATAHISTCOTA, ';
   sSql := sSql + '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, ';
   sSql := sSql + '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO, ECC.IDTIPOOPERACAO, ';
   sSql := sSql + '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGMANUALAUT, ';
   sSql := sSql + '   CI.DESCCARTINVEST ';
   sSql := sSql + 'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.DATAHISTCOTA   BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIni))+','+QuotedStr('DD/MM/YYYY')+') '+
                  'AND                            TO_DATE('+QuotedStr(DateToStr(dDataFim))+','+QuotedStr('DD/MM/YYYY')+') ';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   if iIdEventoCaixaCota <> 0 then
      sSql := sSql + ' AND  ECC.IDEVENTOCAIXACOTA  = '+IntToStr(iIdEventoCaixaCota);
   sSql := sSql + 'AND  ECC.STACOTA          = ''S'' ';
   sSql := sSql + 'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   sSql := sSql + ' ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA ';
   Result := GetDataPacket(sSql);
end;

function TCtrlHistCota.ListGuiaRelLanctoCota(dDataIni, dDataFim: TDateTime;
                                             iIdCarteiraInvest: Integer): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   HC.DATAHISTCOTA,  CI.DESCCARTINVEST, CI.IDCARTEIRAINVEST ';
   sSql := sSql + 'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTEIRAINVEST CI ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     HC.DATAHISTCOTA   BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIni))+','+QuotedStr('DD/MM/YYYY')+') '+
                  'AND                            TO_DATE('+QuotedStr(DateToStr(dDataFim))+','+QuotedStr('DD/MM/YYYY')+') ';
   if iIdCarteiraInvest > 0 then
      sSql := sSql + ' AND  HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   sSql := sSql + 'AND  ECC.STACOTA          = ''S'' ';
   sSql := sSql + 'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) ';
   sSql := sSql + 'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) ';
   sSql := sSql + 'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) ';
   sSql := sSql + 'GROUP BY  CI.IDCARTEIRAINVEST, CI.DESCCARTINVEST, HC.DATAHISTCOTA ';
   sSql := sSql + 'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA ';
   Result := GetDataPacket(sSql);
end;

end.
