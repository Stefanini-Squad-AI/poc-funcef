unit uCtrlCarteiraXEvento;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbCarteiraXEvento
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlCarteiraXEvento = Class(TCmControlObject)
   private
      FCdsCarteiraXEvento : TClientDataSet;
      FDbCarteiraXEvento  : TDbCarteiraXEvento;

    procedure SetCdsCarteiraXEvento(const Value: TClientDataSet);
    procedure SetDbCarteiraXEvento(const Value: TDbCarteiraXEvento);

   public
      property CdsCarteiraXEvento : TClientDataSet read FCdsCarteiraXEvento write SetCdsCarteiraXEvento;
      property DbCarteiraXEvento  : TDbCarteiraXEvento read FDbCarteiraXEvento write SetDbCarteiraXEvento;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function AplicaAtualCarteiraXEvento : Boolean;

      function ListCarteiraXEvento(iIdCarteiraXEvento : Integer = 0; iIdCarteiraInvest : Integer = 0; iIdEventoCaixaCota : Integer = 0;
                                   sStaCaixa  : String = ''; sStaCota : String = '';
                                   sStaSomaDiminui : String = ''; sStaAtivoPassivo : String = '';
                                   sStaCotiza : String = ''; sFlgManualAut : String = '') : OleVariant;
                                   
      function BuscaIdCarteiraXEvento(iIdEventoCaixaCota : Integer = 0; iIdCarteiraInvest : Integer = -1) : Integer;
   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{ TCtrlCarteiraXEvento }

function TCtrlCarteiraXEvento.AplicaAtualCarteiraXEvento: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualCarteiraXEvento(FCdsCarteiraXEvento.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         Result := ApplyCds(FCdsCarteiraXEvento,FDbCarteiraXEvento,[],[]);
         if not Result then
            Raise Exception.Create(FDbCarteiraXEvento.MessageInfo)
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

function TCtrlCarteiraXEvento.BuscaIdCarteiraXEvento(iIdEventoCaixaCota,  iIdCarteiraInvest: Integer): Integer;
var CdsBusca : TClientDataSet;
    sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT ';
   sSql := sSql + '   IDCARTEIRAXEVENTO ';
   sSql := sSql + 'FROM CARTEIRAXEVENTO ';
   if (iIdEventoCaixaCota <> 0) or (iIdCarteiraInvest > 0) then
      sSql := sSql + 'WHERE ';
   if iIdEventoCaixaCota <> 0 then
      sSql := sSql + '    IDEVENTOCAIXACOTA  = ' + IntToStr(iIdEventoCaixaCota);
   if iIdCarteiraInvest > 0 then
      sSql := sSql + 'AND IDCARTEIRAINVEST   = ' + IntToStr(iIdCarteiraInvest);

   CdsBusca := TClientDataSet.Create(nil);
   CdsBusca.Data := GetDataPacket(sSql);

   Result := CdsBusca.FieldByName('IDCARTEIRAXEVENTO').AsInteger;

   FreeAndNil(CdsBusca);
end;

constructor TCtrlCarteiraXEvento.Create;
begin
  inherited;
   FDbCarteiraXEvento := TDbCarteiraXEvento.Create(Self);
end;

destructor TCtrlCarteiraXEvento.Destroy;
begin
  inherited;
   FreeAndNil(FDbCarteiraXEvento);
   if IsAppServer then FreeAndNil(FCdsCarteiraXEvento);
end;

procedure TCtrlCarteiraXEvento.DoChangeDataBase;
begin
  inherited;
   FDbCarteiraXEvento.DataBaseName := DataBaseName;
end;

function TCtrlCarteiraXEvento.ListCarteiraXEvento(iIdCarteiraXEvento, iIdCarteiraInvest, iIdEventoCaixaCota : Integer;
                                                  sStaCaixa, sStaCota, sStaSomaDiminui,
                                                  sStaAtivoPassivo, sStaCotiza, sFlgManualAut : String) : OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT CX.IDCARTEIRAXEVENTO, CX.IDEVENTOCAIXACOTA, CX.IDCARTEIRAGERENC, CX.IDCARTEIRAINVEST, ';
   sSql := sSql + '       CX.IDREGRA, CI.DESCCARTINVEST, R.NOMEREGRA, ';
   sSql := sSql + '       EC.DESCCAIXACOTA, EC.STACAIXA, EC.STASOMADIMINUI, EC.STACOTA, EC.STAATIVOPASSIVO  ';
   sSql := sSql + 'FROM   CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC, CARTEIRAINVEST CI, REGRA R ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '      (CX.IDCARTEIRAINVEST    = CI.IDCARTEIRAINVEST) ';
   sSql := sSql + '  AND (EC.IDEVENTOCAIXACOTA   = CX.IDEVENTOCAIXACOTA) ';
   sSql := sSql + '  AND (EC.IDREGRA             = R.IDREGRA(+)) ';
   if iIdCarteiraXEvento > 0 then
      sSql := sSql + '  AND CX.IDCARTEIRAXEVENTO = '+IntToStr(iIdCarteiraXEvento);
   if iIdCarteiraInvest > 0 then
      sSql := sSql + '  AND CX.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   if iIdEventoCaixaCota <> 0 then
      sSql := sSql + '  AND CX.IDEVENTOCAIXACOTA = '+IntToStr(iIdEventoCaixaCota);
   if sStaCaixa <> '' then
      sSql := sSql + '  AND EC.STACAIXA          = '+QuotedStr(sStaCaixa);
   if sStaCota  <> '' then
      sSql := sSql + '  AND EC.STACOTA           = '+QuotedStr(sStaCota);
   if sStaSomaDiminui <> '' then
      sSql := sSql + '  AND EC.STASOMADIMINUI    = '+QuotedStr(sStaSomaDiminui);
   if sStaAtivoPassivo <> '' then
      sSql := sSql + '  AND EC.STAATIVOPASSIVO   = '+QuotedStr(sStaAtivoPassivo);
   if sStaCotiza <> '' then
      sSql := sSql + '  AND EC.STACOTIZA         = '+QuotedStr(sStaCotiza);
   if sFlgManualAut <> '' then
      sSql := sSql + '  AND EC.FLGMANUALAUT      = '+QuotedStr(sFlgManualAut);
   sSql := sSql + ' ORDER BY CI.DESCCARTINVEST, EC.DESCCAIXACOTA';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlCarteiraXEvento.OnCreateAppServer;
begin
  inherited;
   FCdsCarteiraXEvento := TClientDataSet.Create(nil);
end;

procedure TCtrlCarteiraXEvento.SetCdsCarteiraXEvento(
  const Value: TClientDataSet);
begin
  FCdsCarteiraXEvento := Value;
end;

procedure TCtrlCarteiraXEvento.SetDbCarteiraXEvento(
  const Value: TDbCarteiraXEvento);
begin
  FDbCarteiraXEvento := Value;
end;

end.
