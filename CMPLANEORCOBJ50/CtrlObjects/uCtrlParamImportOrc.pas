unit uCtrlParamImportOrc;

{-----------------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos Fernandes de Souza (amf)
  Data         : 13.02.2006
  Pendência    : 21336
  Alteração    : Overload do método GetParam para atender a nova estrutura da tabela
                 PARAMINPORTORC (foi adicionado o field IDMODULO para identificar o módulo
                 responsável pela configuração da planiha. 
-----------------------------------------------------------------------------------------}

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uDbParamImportOrc, uCMTypes;

Type
  TCtrlParamImportOrc = Class(TCmControlObject)

  Protected

    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private

    _dbParamImportOrc: TdbParamImportOrc;
    FCdsParamImportOrc: TClientDataSet;
    Procedure SetCdsParamImportOrc(const Value: TClientDataSet);
  Public

    Constructor Create; Override;
    Destructor  Destroy;Override;

    property CdsParamImportOrc: TClientDataSet read FCdsParamImportOrc write SetCdsParamImportOrc;

    function Grava : Boolean;
    function GetParam : OleVariant; overload; 

    function GetParam(const pIdModulo: extended): OleVariant; overload;
  End;

Implementation


Procedure TCtrlParamImportOrc.OnCreateAppServer;
Begin
  Inherited;

  FCdsParamImportOrc := TClientDataSet.Create(nil);
End;
//************************************************
Procedure TCtrlParamImportOrc.DoChangeDataBase;
Begin
  Inherited;
  _dbParamImportOrc.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlParamImportOrc.Create;
Begin
  Inherited;

  _dbParamImportOrc  := TdbParamImportOrc.Create( Self );
End;
//************************************************
Destructor TCtrlParamImportOrc.Destroy;
Begin
  Inherited;

  _dbParamImportOrc.Free;

  If ( isAppServer ) Then Begin

    FCdsParamImportOrc.Free;
  End;
End;
//************************************************
Function TCtrlParamImportOrc.Grava: Boolean;
Begin
  If ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.Grava(FCdsParamImportOrc.Data);
    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
    MessageInfo := '';
    Try
      StartTransaction;
      Result := ApplyCDS(FCdsParamImportOrc,_DbParamImportOrc,[],[]);
      If Not Result Then Begin
         MessageInfo := _DbParamImportOrc.MessageInfo;
         Abort;
      End Else
         Commit;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
End;

Function TCtrlParamImportOrc.GetParam: OleVariant;
Begin
  Result := GetDataPacket(' SELECT * FROM PARAMIMPORTORC ');
End;


Procedure TCtrlParamImportOrc.SetCdsParamImportOrc(const Value: TClientDataSet);
Begin
  FCdsParamImportOrc := Value;
End;

function TCtrlParamImportOrc.GetParam(const pIdModulo: extended): OleVariant;
begin
  Result := GetDataPacket(' SELECT * FROM PARAMIMPORTORC WHERE IDMODULO = ' + FloatToStr(pIdModulo));
end;

End.


