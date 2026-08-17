unit uCtrlDiasBloqMod;

interface

Uses DB, uDataBase, uDbDiasBloqMod, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlDiasBloqMod = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbDiasBloqMod  : TDbDiasBloqMod;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsDiasBloqMod : TClientDataSet;

      procedure SetCdsDiasBloqMod(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
     public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsDiasBloqMod: TClientDataSet Read FCdsDiasBloqMod Write SetCdsDiasBloqMod;

      {Esta função tem como objetivo listar os subgrupos}
      Function ListDiasBloqMod(dPessoa,dModulo:Double) :OleVariant;


      {Esta função tem como objetivo listar os subgrupos}
      Function ListModulos :OleVariant;

      {Esta função tem o objetivo de gravar os subgrupos}
      Function Gravar :Boolean;

    End;


implementation

constructor TCtrlDiasBloqMod.Create;
begin
  inherited;
  _dbDiasBloqMod  := TDbDiasBloqMod.Create(Self);
end;

procedure TCtrlDiasBloqMod.OnCreateAppServer;
begin
  inherited;
  FCdsDiasBloqMod := TClientDataSet.Create(nil);

end;


destructor TCtrlDiasBloqMod.Destroy;
begin
  inherited;

  _dbDiasBloqMod.Free;

  if isAppServer then  FCdsDiasBloqMod.Free;

end;


function TCtrlDiasBloqMod.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarDiasBloqMod ( FcdsDiasBloqMod.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsDiasBloqMod,_dbDiasBloqMod,[],[] );
           Msg    := _dbDiasBloqMod.MessageInfo;

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

procedure TCtrlDiasBloqMod.DoChangeDataBase;
begin
  inherited;
  _dbDiasBloqMod.DataBaseName := DataBaseName;

end;

procedure TCtrlDiasBloqMod.SetCdsDiasBloqMod(const Value: TClientDataSet);
begin
  FCdsDiasBloqMod := Value;
end;


function TCtrlDiasBloqMod.ListDiasBloqMod(dPessoa,dModulo:Double) :OleVariant;
var
  sSql, sfiltro :string;
begin

      sSql := 'SELECT IDPESSOA, IDMODULO, NUMDIAS FROM DIASBLOQMOD ';

      //--------------------------------------
      sfiltro := '';
      If (dPessoa <> 0) Then
         sfiltro :=   'WHERE (IDPESSOA = ' + FloatToStr(dPessoa) + ') ';
     //----------------------------------------------------------
      if dModulo <> 0 then
         If sFiltro = '' Then
            sFiltro :=  'WHERE (IDMODULO = '+FloatToStr(dModulo)+') '
         else
            sFiltro := sFiltro +  'AND (IDMODULO = '+FloatToStr(dModulo)+') ';
     //----------------------------------------------------------
     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);
end;


function TCtrlDiasBloqMod.ListModulos: OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT NOMEMODULO, IDMODULO FROM  MODULO ORDER BY NOMEMODULO ';
    Result := GetDataPacket(sSql);

end;

end.
