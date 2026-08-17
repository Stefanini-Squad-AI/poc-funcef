unit uCtrlConfigbloquete;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbConfigbloquete, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505} {$ELSE} ,uCMTypes{$ENDIF};

type
  TCtrlConfigbloquete = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbConfigbloquete : TDbConfigbloquete;
    Fcds   : TClientDataSet;
    // Eventos dos ClientDataSet´s
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    // Métodos
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //  Informa os Compradore existentes
    Function  ListConfigbloquete( CODBLOQCHE : double = 0 ) : OleVariant;
    function GravarConfigbloquete  : Boolean;
End;


implementation

{ TCtrlConfigbloquete }

constructor TCtrlConfigbloquete.Create;
begin
  inherited;
  _DbConfigbloquete := TDbConfigbloquete.Create(self);
end;

destructor TCtrlConfigbloquete.Destroy;
begin
  _DbConfigbloquete.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlConfigbloquete.DoChangeDataBase;
begin
  inherited;
  _DbConfigbloquete.DataBaseName := DataBaseName;
end;

function TCtrlConfigbloquete.ListConfigbloquete( CODBLOQCHE : double = 0 ) : OleVariant;
var ssql : string;
    cdslocal : TClientDataSet;
begin
   CdsLocal  := TClientDataSet.Create(nil);
   ssql := 'SELECT   '+
           '  C.IDCONFIGBLOQUETO ,  C.CODBLOQCHE , C.CAMPOBLOQUETO ,  '+
           '   C.LINHABLOQUETO , C.COLUNABLOQUETO, ''                                        ''  DESCCAMPO  '+
           ' FROM CONFIGBLOQUETE C ';
   if CODBLOQCHE <> 0  then
      ssql := ssql + ' WHERE C.CODBLOQCHE = ' + floattostr(CODBLOQCHE);
   ssql := ssql + '  ORDER BY C.CAMPOBLOQUETO' ;
   CdsLocal.data := GetDataPacket(ssql);
   CdsLocal.First;
   while not CdsLocal.eof do
   begin
      CdsLocal.edit;

      Case Round(CdsLocal.fieldbyname('CAMPOBLOQUETO').asinteger) Of
         0: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Local Pgto';
         1: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Vencimento';
         2: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Data Doc';
         3: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Número Doc';
         4: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Espécie Doc';
         5: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Aceite';
         6: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Data Process';
         7: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Nosso Número';
         8: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Carteira';
         9: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Espécie';
         10: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Quantidade';
         11: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Valor Outra Moeda';
         12: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Valor Nominal';
         13: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Pagáve Até';
         14: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Desconto Até';
         15: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Mensagem 1';
         16: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Mensagem 2';
         17: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Mensagem 3';
         18: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Mensagem 4';
         19: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Mensagem 5';
         20: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Nome Do Sacado';
         21: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Endereço do Sacado';
         22: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Logradouro';
         23: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Bairro, Cidade, Estado e Cep';
         24: CdsLocal.fieldbyname('DESCCAMPO').Value := 'Margem Inferior';
      end;
      CdsLocal.next;
   end;
   result := CdsLocal.data;
   CdsLocal.free;
end;

procedure TCtrlConfigbloquete.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlConfigbloquete.GravarConfigbloquete: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarConfigbloquete(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbConfigbloquete,[],[]);
        Msg    := _DbConfigbloquete.MessageInfo;
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

procedure TCtrlConfigbloquete.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
