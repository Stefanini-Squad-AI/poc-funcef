unit uCtrlEventoCaixaCota;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbEventoCaixaCota
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlEventoCaixaCota = Class(TCmControlObject)
   private
      FCdsEventoCaixaCota : TClientDataSet;
      FDbEventoCaixaCota  : TDbEventoCaixaCota;

      procedure SetCdsEventoCaixaCota(const Value: TClientDataSet);
      procedure SetDbEventoCaixaCota(const Value: TDbEventoCaixaCota);

   public
      property CdsEventoCaixaCota : TClientDataSet read FCdsEventoCaixaCota write SetCdsEventoCaixaCota;
      property DbEventoCaixaCota  : TDbEventoCaixaCota read FDbEventoCaixaCota write SetDbEventoCaixaCota;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function AplicaAtualEventoCaixaCota : Boolean;

      function ListEventoCaixaCota(iIdEventoCaixaCota : Integer = 0) : OleVariant;

      function IncluirEventosFixos : Boolean;      

   protected
      procedure DoChangeDataBase; override;

   end;

implementation 

{ TCtrlEventoCaixaCota }

function TCtrlEventoCaixaCota.AplicaAtualEventoCaixaCota: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualEventoCaixaCota(FCdsEventoCaixaCota.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin             
      try
         StartTransaction;

         Result := ApplyCds(FCdsEventoCaixaCota,FDbEventoCaixaCota,[],[]);
         if not Result then
            Raise Exception.Create(FDbEventoCaixaCota.MessageInfo)
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

constructor TCtrlEventoCaixaCota.Create;
begin
  inherited;
   FDbEventoCaixaCota := TDbEventoCaixaCota.Create(Self);
end;

destructor TCtrlEventoCaixaCota.Destroy;
begin
  inherited;
   FreeAndNil(FDbEventoCaixaCota);
   if IsAppServer then FreeAndNil(FCdsEventoCaixaCota );
end;

procedure TCtrlEventoCaixaCota.DoChangeDataBase;
begin
  inherited;
   FDbEventoCaixaCota.DataBaseName := DataBaseName;
end;

function TCtrlEventoCaixaCota.IncluirEventosFixos: Boolean;
var CdsEv : TClientDataSet;
begin
   Result := False;
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IncluirEventosFixos;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         try
            if not InTransaction then
               StartTransaction;

            //--------------------------------------------------
            //Seleção
            CdsEv := TClientDataSet.Create(nil);
            CdsEv.Data := ListEventoCaixaCota;
            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-1',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -1;
               DbEventoCaixaCota.Desccaixacota.AsString := 'SALDO ANTERIOR';
               DbEventoCaixaCota.Stacaixa.AsString := 'S';
               DbEventoCaixaCota.Stacota.AsString := 'N';
               DbEventoCaixaCota.Stasomadiminui.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-2',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -2;
               DbEventoCaixaCota.Desccaixacota.AsString := 'SALDO ATUAL';
               DbEventoCaixaCota.Stacaixa.AsString := 'S';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'A';
               DbEventoCaixaCota.Stasomadiminui.AsString := 'N';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-3',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -3;
               DbEventoCaixaCota.Desccaixacota.AsString := 'PATRIMONIO LIQUIDO';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-4',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -4;
               DbEventoCaixaCota.Desccaixacota.AsString := 'QUANTIDADE DE COTAS';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-5',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -5;
               DbEventoCaixaCota.Desccaixacota.AsString := 'VALOR DA COTA';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-6',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -6;
               DbEventoCaixaCota.Desccaixacota.AsString := 'DEPOSITO - LANCAMENTO';
               DbEventoCaixaCota.Stacaixa.AsString := 'S';
               DbEventoCaixaCota.Stacota.AsString := 'N';
               DbEventoCaixaCota.Stasomadiminui.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-7',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -7;
               DbEventoCaixaCota.Desccaixacota.AsString := 'RETIRADA - LANCAMENTO';
               DbEventoCaixaCota.Stacaixa.AsString := 'S';
               DbEventoCaixaCota.Stacota.AsString := 'N';
               DbEventoCaixaCota.Stasomadiminui.AsString := 'D';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-8',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -8;
               DbEventoCaixaCota.Desccaixacota.AsString := 'RENDA VARIAVEL';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'A';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-9',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -9;
               DbEventoCaixaCota.Desccaixacota.AsString := 'RENDA FIXA';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'A';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-10',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -10;
               DbEventoCaixaCota.Desccaixacota.AsString := 'FUNDOS DE INVESTIMENTOS';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'A';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-11',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -11;
               DbEventoCaixaCota.Desccaixacota.AsString := 'BM&F';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'A';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-12',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -12;
               DbEventoCaixaCota.Desccaixacota.AsString := 'TAXA DE ADMINISTRACAO';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'P';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-13',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -13;
               DbEventoCaixaCota.Desccaixacota.AsString := 'TAXA DE PERFORMANCE';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'P';
               DbEventoCaixaCota.Stacotiza.AsString := 'S';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-16',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -16;
               DbEventoCaixaCota.Desccaixacota.AsString := 'COTAS EMITIDAS';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'A';
               DbEventoCaixaCota.Stacotiza.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-17',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -17;
               DbEventoCaixaCota.Desccaixacota.AsString := 'COTAS RESGATADAS';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'P';
               DbEventoCaixaCota.Stacotiza.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
            end;

            CdsEv.First;
            if not CdsEv.Locate('IDEVENTOCAIXACOTA','-18',[]) then
            begin
               DbEventoCaixaCota.Ideventocaixacota.AsInteger := -18;
               DbEventoCaixaCota.Desccaixacota.AsString := 'PATRIMONIO LIQUIDO';
               DbEventoCaixaCota.Stacota.AsString := 'S';
               DbEventoCaixaCota.Staativopassivo.AsString := 'N';
               DbEventoCaixaCota.Stacotiza.AsString := 'N';
               DbEventoCaixaCota.FLGMANUALAUT.AsString := 'A';
               DbEventoCaixaCota.Insert;
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
         FreeAndNil(CdsEv);
      end;
   end;
end;

function TCtrlEventoCaixaCota.ListEventoCaixaCota(iIdEventoCaixaCota : Integer) : OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT E.IDEVENTOCAIXACOTA, E.DESCCAIXACOTA, E.IDTIPOINVEST, E.IDTIPOOPERACAO, ';
   sSql := sSql + '       E.IDTIPODESPINVEST, E.STACAIXA, E.STACOTA, E.STAATIVOPASSIVO, E.STACOTIZA, ';
   sSql := sSql + '       E.STASOMADIMINUI, E.IDREGRA, E.STACPMF, E.FLGMANUALAUT, ';
   sSql := sSql + '       DECODE(E.FLGMANUALAUT,''M'',''Manual'',''Automático'') AS APURACAO, ';
   sSql := sSql + '       TI.DESCTIPOINVEST, TP.DESCTIPOOPERACAO, TD.DESCTIPODESPINV, R.NOMEREGRA, ';
   sSql := sSql + '       DECODE(TI.DESCTIPOINVEST||TP.DESCTIPOOPERACAO||TD.DESCTIPODESPINV,NULL, '' '',';
   sSql := sSql + '       ''Tipo de Investimento : ''||TI.DESCTIPOINVEST||'' -  ';
   sSql := sSql + '   Tipo de Operação : ''||TP.DESCTIPOOPERACAO||'' -  Despesa : ''||TD.DESCTIPODESPINV ) AS TIPO ';
   sSql := sSql + 'FROM  EVENTOCAIXACOTA E, TIPOINVEST TI, TIPOOPERACAO TP, TIPODESPINVEST TD, REGRA R ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     E.IDTIPOINVEST     = TI.IDTIPOINVEST(+) ';
   sSql := sSql + 'AND  E.IDTIPOINVEST     = TP.IDTIPOINVEST(+) ';
   sSql := sSql + 'AND  E.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+) ';
   sSql := sSql + 'AND  E.IDTIPODESPINVEST = TD.IDTIPODESPINVEST(+) ';
   sSql := sSql + 'AND  E.IDREGRA          = R.IDREGRA(+) ';
   if iIdEventoCaixaCota > 0 then
      sSql := sSql + 'AND  E.IDEVENTOCAIXACOTA = '+IntToStr(iIdEventoCaixaCota);
   sSql := sSql + ' ORDER BY E.DESCCAIXACOTA ';
   Result := GetDataPacket(sSql);   
end;

procedure TCtrlEventoCaixaCota.OnCreateAppServer;
begin
  inherited;
   FCdsEventoCaixaCota := TClientDataSet.Create(nil);
end;

procedure TCtrlEventoCaixaCota.SetCdsEventoCaixaCota(
  const Value: TClientDataSet);
begin
  FCdsEventoCaixaCota := Value;
end;

procedure TCtrlEventoCaixaCota.SetDbEventoCaixaCota(
  const Value: TDbEventoCaixaCota);
begin
  FDbEventoCaixaCota := Value;
end;

end.
