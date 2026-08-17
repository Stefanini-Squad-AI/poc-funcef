unit uCtrlSubGrupo;

interface

Uses DB, uDataBase, uDbSubGrupo, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
     uCMTypes;

  Type

    TCtrlSubGrupo = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbSubGrupo  : TDbSubGrupo;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsSubGrupo : TClientDataSet;

      procedure SetCdsSubGrupo(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
     public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsSubGrupo: TClientDataSet Read FCdsSubGrupo Write SetCdsSubGrupo;

      {Esta função tem como objetivo listar os subgrupos}
      Function ListSubGrupos(dCodSubGrupo:Double) :OleVariant;

      {Esta função tem o objetivo de gravar os subgrupos}
      Function Gravar :Boolean;

    End;


implementation

constructor TCtrlSubGrupo.Create;
begin
  inherited;
  _dbSubGrupo  := TDbSubGrupo.Create(Self);
end;

procedure TCtrlSubGrupo.OnCreateAppServer;
begin
  inherited;
  FCdsSubGrupo := TClientDataSet.Create(nil);

end;


destructor TCtrlSubGrupo.Destroy;
begin
  inherited;

  _dbSubGrupo.Free;

  if isAppServer then  FCdsSubGrupo.Free;

end;


function TCtrlSubGrupo.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarSubGrupo ( FcdsSubGrupo.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsSubGrupo,_dbSubGrupo,[],[] );
           Msg    := _dbSubGrupo.MessageInfo;
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

procedure TCtrlSubGrupo.DoChangeDataBase;
begin
  inherited;
  _dbSubGrupo.DataBaseName := DataBaseName;

end;

procedure TCtrlSubGrupo.SetCdsSubGrupo(const Value: TClientDataSet);
begin
  FCdsSubGrupo := Value;
end;


function TCtrlSubGrupo.ListSubGrupos(dCodSubGrupo:Double) :OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin

      sSql := 'SELECT  ' +
              '  CODSUBGRP,        ' +
              '  DESCSUBGRP,        ' +
              '  IDUSUARIOINCLUSAO ' +
              'FROM  ' +
              '   SUBGRUPO ';

      //--------------------------------------
      sfiltro := '';
      If (dCodSubGrupo <> 0) Then
         sfiltro :=   'WHERE (CODSUBGRP = ' + FloatToStr(dCodSubGrupo) + ') ';
     //----------------------------------------------------------
     sOrdena := 'ORDER BY DESCSUBGRP ';

     sSql := Ssql + sFiltro + sOrdena;

     Result := GetDataPacket(sSql);
end;


end.
