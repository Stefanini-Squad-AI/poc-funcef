unit uCtrlPlanoData;

interface

Uses DB, uDataBase, uDbPlanoData, uCmControlObject, dbclient, sysutils,Provider,
       ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlPlanoData = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlanoData  : TDbPlanoData;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FcdsPlanoData : TClientDataSet;

      procedure SetcdsPlanoData(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsPlanoData: TClientDataSet Read FCdsPlanoData Write SetCdsPlanoData;

      {Esta função tem o Objetivo de retornar regsitros da tabela de Plano}
      Function ListPlanoData(dPlanoData :Double):OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

    End;


implementation

{ TCtrlPlanoData }

constructor TCtrlPlanoData.Create;
begin
  inherited;
  _dbPlanoData  := TDbPlanoData.Create(Self);
end;

destructor TCtrlPlanoData.Destroy;
begin
  inherited;

  _dbPlanoData.Free;
  if isAppServer then FCdsPlanoData.Free;

end;


function TCtrlPlanoData.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPlanoData ( FcdsPlanoData.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsPlanoData,_dbPlanoData,[],[] );
           Msg    := _dbPlanoData.MessageInfo;
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


procedure TCtrlPlanoData.DoChangeDataBase;
begin
  inherited;
  _dbPlanoData.DataBaseName := DataBaseName;

end;

function TCtrlPlanoData.ListPlanoData(dPlanoData:Double): OleVariant;
var
  sSql, sfiltro :string;

begin
          sSql := 'SELECT ' +
                  '   PLANO,        ' +
                  '   IDPLANODATA,  ' +
                  '   IDPESSOA,     ' +
                  '   DATAINICIO,   ' +
                  '   DATAFIM,      ' +
                  '   PLANOANTERIOR ' +
                  'FROM ' +
                  '   PLANODATA ';
      //----------------------------------------------------------
      sfiltro := '';
      If (dPlanoData <> 0) Then
         sfiltro :=   'WHERE (IDPLANODATA = ' + FloatToStr(dPlanoData) + ') ';
     //----------------------------------------------------------

     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);

end;

procedure TCtrlPlanoData.SetCdsPlanoData(const Value: TClientDataSet);
begin
  FCdsPlanoData := Value;
end;



procedure TCtrlPlanoData.OnCreateAppServer;
begin
  inherited;
  FCdsPlanoData := TClientDataSet.Create(nil);

end;

end.
