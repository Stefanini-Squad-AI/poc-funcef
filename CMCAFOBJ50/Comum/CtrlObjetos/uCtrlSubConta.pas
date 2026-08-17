unit uCtrlSubConta;

interface

Uses DB, uDataBase, uDbSubConta, uCmControlObject, dbclient, sysutils,uSistema,Provider,
     wwQuery, uCtrlGeral, ComCtrls,CMProcuraMask, CMProcura,DBTables;

  Type

    TCtrlSubConta = Class(TCmControlObject)

    private
      FAchouSubConta :Boolean;
      FCodSubConta   :Double;
      FNomeSubConta  :String;
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbSubConta  : TDbSubConta;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FcdsSubConta : TClientDataSet;

      procedure SetcdsSubConta(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property AchouSubConta : Boolean        Read FAchouSubConta  Write FAchouSubConta;
      property NomeSubConta  : String         Read FNomeSubConta   Write FNomeSubConta;
      property CodSubConta   : Double         Read FCodSubConta    Write FCodSubConta;

      property CdsSubConta   : TClientDataSet Read FCdsSubConta    Write SetCdsSubConta;

      { Esta função tem como objetivo buscar sequence da tabela subconta }
      function LeUltimoRegSubConta(dIdPessoa:Double) :Double;

      {Esta função retorna campos da tabela subconta}
      function RetornaCamposSubConta(dIdEmpresa,dCodSubConta:Double):OleVariant;

      {Esta funçào tem como objetivo Verifica se a subconta existe}
      Function ListSubConta(dIdEmpresa,dCodSubConta:Double) :OleVariant;

      {Esta função tem o objetivo de gravar as subcontas }
      function Gravar :Boolean;
    End;


implementation

constructor TCtrlSubConta.Create;
begin
  inherited;
  _dbSubConta  := TDbSubConta.Create;

end;

procedure TCtrlSubConta.OnCreateAppServer;
begin
  inherited;
  FcdsSubConta:= TClientDataSet.Create(nil);

end;

destructor TCtrlSubConta.Destroy;
begin
  inherited;

  _dbSubConta.Free;

  if IsAppServer Then FcdsSubConta.Free;

end;

function TCtrlSubConta.LeUltimoRegSubConta(dIdPessoa:Double) :Double;
begin
     _Cds.Data := GetDataPacket('SELECT MAX(CODSUBCONTA) AS PROXIMA FROM SUBCONTA ' +
                                'WHERE IDPESSOA = ' + FloatToStr(dIdPessoa) );

     //----------------------------------------------------------

      Result := _cds.FieldByName('PROXIMA').AsFloat;
end;

function TCtrlSubConta.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarSubConta ( FcdsSubConta.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsSubConta,_dbSubConta,[],[] );
           Msg    := _dbSubConta.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;


function TCtrlSubConta.ListSubConta(dIdEmpresa,dCodSubConta:Double) :OleVariant;
var
  ssql,sOrdena, sfiltro :string;
begin
      sSql := 'SELECT           ' +
              '   CODSUBCONTA,  ' +
              '   NOMESUBCONTA, ' +
              '   IDPESSOA ' +
              'FROM ' +
              '   SUBCONTA  ';

     //----------------------------------------------------------
      sfiltro := '';
      If (dIdEmpresa <> 0) Then
         sfiltro :=  'WHERE (IDPESSOA = '+FloatToStr(dIdEmpresa) + ') ';
     //----------------------------------------------------------
     If dCodSubConta <> 0 Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  ' WHERE (CODSUBCONTA = ' + FloatToStr(dCodSubConta) + ') '
        Else
           sfiltro := sfiltro +  ' AND (CODSUBCONTA = ' + FloatToStr(dCodSubConta) + ') ';
     End;
     //----------------------------------------------------------
     sOrdena := ' ORDER BY  CODSUBCONTA  ';

     sSql := sSql + sFiltro + sOrdena;

     Result    := GetDataPacket(sSql);

end;

function TCtrlSubConta.RetornaCamposSubConta(dIdEmpresa,dCodSubConta:Double) :OleVariant;
var
  ssql:string;
begin

     //----------------------------------------------------------
     _Cds.Data := GetDataPacket('SELECT  CODSUBCONTA,NOMESUBCONTA,IDPESSOA '+
                                'FROM SUBCONTA ' +
                                'WHERE (IDPESSOA    = '+ FloatToStr(dIdEmpresa)  + ') ' +
                                '  AND (CODSUBCONTA = '+ FloatToStr(dCodSubConta) +') ');
     //----------------------------------------------------------
     _Cds.Data := GetDataPacket(sSql);

     If Not _cds.Isempty Then
     Begin
        FAchouSubConta  := True;
        FNomeSubConta   := _Cds.FieldByName('NOMESUBCONTA').AsString;
        FCodSubConta    := _Cds.FieldByName('CODSUBCONTA').AsFloat;
     End Else
     Begin
        FNomeSubConta   := '';
        FCodSubConta    := -1;
        FAchouSubConta  := False;
     End;
    //----------------------------------------------------------

end;

procedure TCtrlSubConta.DoChangeDataBase;
begin
  inherited;
  _qrysql.DatabaseName    := DataBaseName;
  _dbSubConta.DataBaseName := DataBaseName;

end;

procedure TCtrlSubConta.SetCdsSubConta(const Value: TClientDataSet);
begin
  FCdsSubConta := Value;
end;


end.
