unit uCtrlParamCotaInvest;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbParamCotaInvest, uCtrlDiasUteis, uCtrlPadroes
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlParamCotaInvest = Class(TCmControlObject)
   private
    CtrlDiasUteis : TCtrlDiasUteis;

    _Cds : TClientDataSet;

    FcdsParamCotaInvest : TClientDataSet;
    FDbParamCotaInvest  : TDbParamCotaInvest;

    procedure SetcdsParamCotaInvest(const Value: TClientDataSet);
    procedure SetDbParamCotaInvest(const Value: TDbParamCotaInvest);

   public
      property cdsParamCotaInvest : TClientDataSet read FcdsParamCotaInvest write SetcdsParamCotaInvest;
      property DbParamCotaInvest  : TDbParamCotaInvest read FDbParamCotaInvest write SetDbParamCotaInvest;

      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;

      function ListParamCotaInvest(iIdParamCotaInvest : Integer = -1; iIdCarteiraInvest : Integer = -1)  : OleVariant;

      function AplicaAtualParamCotaInvest : Boolean;

      function  AtualizaDataFech(iIdCarteiraInvest : Integer = -1; dDataFech : TDateTime = 0)  : Boolean;

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{ TCtrlParamCotaInvest }

constructor TCtrlParamCotaInvest.Create;
begin
  inherited;
   _Cds := TClientDataSet.Create(nil);
     
   FDbParamCotaInvest := TDbParamCotaInvest.Create(Self);

   CtrlDiasUteis := TCtrlDiasUteis.Create;
   CtrlDiasUteis.InitializeAs(Padroes);   
end;

destructor TCtrlParamCotaInvest.Destroy;
begin
   FreeAndNil(_Cds);

   FreeAndNil(FDbParamCotaInvest);
   if IsAppServer then FreeAndNil(FCdsParamCotaInvest);

   FreeAndNil(CtrlDiasUteis);

  inherited;

end;

procedure TCtrlParamCotaInvest.DoChangeDataBase;
begin
  inherited;
   FDbParamCotaInvest.DataBaseName := DataBaseName;
end;

function TCtrlParamCotaInvest.AplicaAtualParamCotaInvest: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualParamCotaInvest(FCdsParamCotaInvest.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         Result := ApplyCds(FCdsParamCotaInvest,FDbParamCotaInvest,[],[]);
         if not Result then
            Raise Exception.Create(FDbParamCotaInvest.MessageInfo)
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

function TCtrlParamCotaInvest.ListParamCotaInvest(iIdParamCotaInvest, iIdCarteiraInvest : Integer): OleVariant;
var  sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT P.IDPARAMCOTAINVEST, P.IDCARTEIRAINVEST, P.DATAULTFECH, P.DATAINICIAL, P.DATAENCERRAMENTO, ';
   sSql := sSql + '       P.QTDDECQTD, P.QTDDECVLR, P.VLRCOTAINICIAL, P.MOECODIGO, P.PERCTXPERFORM, PERCTXADM, ';
   sSql := sSql + '       C.DESCCARTINVEST, M.MOEDESC ';
   sSql := sSql + 'FROM PARAMCOTAINVEST P, CARTEIRAINVEST C, MOEDA M ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '     C.IDCARTEIRAINVEST = P.IDCARTEIRAINVEST ';
   sSql := sSql + 'AND  M.MOECODIGO(+)     = P.MOECODIGO ';
   if (iIdParamCotaInvest > 0) then
      sSql := sSql + ' AND P.IDPARAMCOTAINVEST = '+IntToStr(iIdParamCotaInvest);
   if (iIdCarteiraInvest  > 0) then
      sSql := sSql + ' AND P.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest);
   sSql := sSql + ' ORDER BY P.DATAULTFECH, C.DESCCARTINVEST ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlParamCotaInvest.OnCreateAppServer;
begin
  inherited;
   FCdsParamCotaInvest := TClientDataSet.Create(nil);
end;

procedure TCtrlParamCotaInvest.SetcdsParamCotaInvest(const Value: TClientDataSet);
begin
  FCdsParamCotaInvest := Value;
end;

procedure TCtrlParamCotaInvest.SetDbParamCotaInvest(const Value: TDbParamCotaInvest);
begin
  FDbParamCotaInvest := Value;
end;

function TCtrlParamCotaInvest.AtualizaDataFech(iIdCarteiraInvest: Integer; dDataFech: TDateTime): Boolean;
var bTransaction : Boolean;
begin
   Result := False;
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AtualizaDataFech(iIdCarteiraInvest, dDataFech);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      bTransaction := False;
      try
         _Cds.Data := ListParamCotaInvest(-1,iIdCarteiraInvest);
         if not _Cds.IsEmpty then
         begin
            if not InTransaction then
            begin
               StartTransaction;
               bTransaction := True;
            end;

            FDbParamCotaInvest.Idparamcotainvest.AsInteger := _Cds.FieldByName('IDPARAMCOTAINVEST').AsInteger;
            FDbParamCotaInvest.LoadFromDb;
            FDbParamCotaInvest.Dataultfech.AsDateTime := dDataFech;
            if Not FDbParamCotaInvest.Update then
               Raise Exception.Create(FDbParamCotaInvest.MessageInfo);

            if bTransaction then
               Commit;

            Result := True;
         end;
      except
         on E:Exception do
         begin
            if InTransaction then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

end.
