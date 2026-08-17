unit uCtrlPlano;

interface

Uses DB, uDataBase, uDbPlano, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlPlano = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlano  : TDbPlano;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FcdsPlano : TClientDataSet;

      procedure SetcdsPlano(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsPlano: TClientDataSet Read FCdsPlano Write SetCdsPlano;

      {Esta função tem o Objetivo de retornar regsitros da tabela de Plano}
      Function ListPlano(dPlano :Double):OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

    End;


implementation

{ TCtrlPlano }

constructor TCtrlPlano.Create;
begin
  inherited;
  _dbPlano  := TDbPlano.Create(Self);
end;

destructor TCtrlPlano.Destroy;
begin
  inherited;

  _dbPlano.Free;
  if isAppServer then FCdsPlano.Free;

end;


function TCtrlPlano.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPlano ( FcdsPlano.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsPlano,_dbPlano,[],[] );
           Msg    := _dbPlano.MessageInfo;
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


procedure TCtrlPlano.DoChangeDataBase;
begin
  inherited;
  _dbPlano.DataBaseName := DataBaseName;

end;

function TCtrlPlano.ListPlano(dPlano:Double): OleVariant;
var
  sSql, sfiltro, sOrdena :string;

begin
          sSql := 'SELECT ' +
                  '   PLANO,             ' +
                  '   IDUSUARIOINCLUSAO, ' +
                  '   DESCPLANO,         ' +
                  '   MASCARA           '  +
                  'FROM ' +
                  '   PLANO ';
      //----------------------------------------------------------
      sfiltro := '';
      If (dPlano <> 0) Then
         sfiltro :=   'WHERE (PLANO = ' + FloatToStr(dPlano) + ') ';
     //----------------------------------------------------------
     sOrdena := 'ORDER BY DESCPLANO ';

     sSql := Ssql + sFiltro + sOrdena;

     Result := GetDataPacket(sSql);

end;

procedure TCtrlPlano.SetCdsPlano(const Value: TClientDataSet);
begin
  FCdsPlano := Value;
end;



procedure TCtrlPlano.OnCreateAppServer;
begin
  inherited;
  FCdsPlano := TClientDataSet.Create(nil);

end;

end.
