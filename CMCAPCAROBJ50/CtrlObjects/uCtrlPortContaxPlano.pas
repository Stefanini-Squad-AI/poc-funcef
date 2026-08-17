Unit uCtrlPortContaxPLano;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbPortcontaxplano, uSistema, DB, uDataBase,
  DbClient, uCMTypes, Classes, uCtrlPadroes;

Type
  TCtrlPortContaxPlano = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbPortContaxPlano: TDbPortContaxPlano;
    FCdsContaxPlano: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;


    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);
    procedure SetCdsContaxPlano(const Value: TClientDataSet);

  public
    _Cds : TClientDataSet;

    Property cds: TClientDataSet read Fcds write Setcds;
    Property CdsContaxPlano: TClientDataSet read FCdsContaxPlano write SetCdsContaxPlano;
    // Métodos
    Constructor Create; override;
    Destructor Destroy; override;
    //  Informa os Compradore existentes
    Function ListPortContaxPlano( CODPORTADOR: double = 0; idpessoa: double = 0): OleVariant;
    Function GravarPortContaxPlano(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlPortadorforma }

Constructor TCtrlPortContaxPlano.Create;
Begin
  Inherited;
  _DbPortContaxPlano := TDbPortContaxPlano.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlPortContaxPlano.Destroy;
Begin
  _DbPortContaxPlano.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlPortContaxPlano.DoChangeDataBase;
Begin
  Inherited;
  _DbPortContaxPlano.DataBaseName := DataBaseName;
End;

Function TCtrlPortContaxPlano.ListPortContaxPlano(CODPORTADOR: double = 0; idpessoa: double = 0): OleVariant;
Var
  ssql: String;
Begin


  ssql := ' SELECT   ' + #13 +
          ' C.NOME,C.IDPLANOPREV , P.IDPORTCONTAXPLANO, P.CODPORTADOR   ' + #13 +
          ' FROM   ' + #13 +
          ' PORTCONTAXPLANO P , PLANPREVCONTABIL C  ' + #13 ;

  If Codportador <> 0 Then
  begin
  ssql := ssql + 'WHERE ';
  ssql := ssql + 'Codportador = ' + floattostr(Codportador);
  ssql := ssql + ' AND P.IDPLANOPREV = C.IDPLANOPREV '  ;
  end
  else
  ssql := ssql + 'WHERE  1=2';
  ssql := ssql + ' ORDER BY C.NOME               ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlPortContaxPlano.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlPortContaxPlano.GravarPortContaxPlano(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarPortContaxPlano;
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(_Cds, _DbPortContaxPlano, [], []);
      Msg := _DbPortContaxPlano.MessageInfo;
      if not Result then
        raise Exception.create(Msg);
      Commit;
    except
      on E: Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;

End;

Procedure TCtrlPortContaxPlano.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);

End;

procedure TCtrlPortContaxPlano.SetCdsContaxPlano(const Value: TClientDataSet);
begin
 FCdsContaxPlano := Value;
end;



Procedure TCtrlPortContaxPlano.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

