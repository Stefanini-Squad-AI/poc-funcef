unit uCtrlConfigCheque;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbConfigCheque, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505}  {$ELSE}, uCMTypes{$ENDIF};

type
  TCtrlConfigCheque = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbConfigCheque : TDbConfigCheque;
    Fcds   : TClientDataSet;
    // Eventos dos ClientDataSet´s
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    // Métodos
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //  Informa os Compradore existentes
    Function  ListConfigCheque( IDTEMPLCHEQUE : double = 0 ) : OleVariant;
    function GravarConfigCheque  : Boolean;
End;

implementation

{ TCtrlConfigCheque }

constructor TCtrlConfigCheque.Create;
begin
  inherited;
  _DbConfigCheque := TDbConfigCheque.Create(self);
end;

destructor TCtrlConfigCheque.Destroy;
begin
  _DbConfigCheque.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlConfigCheque.DoChangeDataBase;
begin
  inherited;
  _DbConfigCheque.DataBaseName := DataBaseName;
end;

function TCtrlConfigCheque.ListConfigCheque( IDTEMPLCHEQUE : double = 0 ) : OleVariant;
var ssql : string;
    cdslocal : TClientDataSet;
begin
   CdsLocal  := TClientDataSet.Create(nil);
   ssql := 'SELECT C.IDCONFIGCHEQUE ,  C.IDTEMPLCHEQUE , C.CAMPOCHEQUE , '+
           '  C.LINHACHEQUE , C.COLUNACHEQUE, ''                                  '' DESCRICAO'+
           '  FROM CONFIGCHEQUE C '+
           '  WHERE (1=1)';
   if IDTEMPLCHEQUE <> 0 then
      ssql := ssql + ' and C.IDTEMPLCHEQUE = ' + floattostr(IDTEMPLCHEQUE);

   ssql := ssql + ' ORDER BY C.CAMPOCHEQUE ';
   CdsLocal.data := GetDataPacket(ssql);
   CdsLocal.First;
   while not CdsLocal.eof do
   begin
      CdsLocal.edit;
     Case Round(CdsLocal.fieldbyname('CAMPOCHEQUE').asinteger) Of
        0: CdsLocal.fieldbyname('DESCRICAO').Value := 'Valor Cheque';
        1: CdsLocal.fieldbyname('DESCRICAO').Value := 'Extenso 1';
        2: CdsLocal.fieldbyname('DESCRICAO').Value := 'Extenso 2';
        3: CdsLocal.fieldbyname('DESCRICAO').Value := 'Portador';
        4: CdsLocal.fieldbyname('DESCRICAO').Value := 'Local';
        5: CdsLocal.fieldbyname('DESCRICAO').Value := 'Dia';
        6: CdsLocal.fieldbyname('DESCRICAO').Value := 'Mes';
        7: CdsLocal.fieldbyname('DESCRICAO').Value := 'Ano';
        8: CdsLocal.fieldbyname('DESCRICAO').Value := 'Local Cheque Diferido';
        9: CdsLocal.fieldbyname('DESCRICAO').Value := 'Dia Cheque Diferido';
       10: CdsLocal.fieldbyname('DESCRICAO').Value := 'Mes Cheque Diferido';
       11: CdsLocal.fieldbyname('DESCRICAO').Value := 'Ano Cheque Diferido';
       12: CdsLocal.fieldbyname('DESCRICAO').Value := 'Margem Inf';
     end;
     CdsLocal.next;
   end;
   result := CdsLocal.data;
   CdsLocal.free;
end;

procedure TCtrlConfigCheque.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlConfigCheque.GravarConfigCheque: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarConfigCheque(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbConfigCheque,[],[]);
        Msg    := _DbConfigCheque.MessageInfo;
        If Not Result Then Raise Exception.create(Msg);
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

procedure TCtrlConfigCheque.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
