unit uCtrlParamorcamento;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils,wwQuery, provider, uDbParamorcamento,
  uCMTypes, Classes;

Type
  TCtrlParamorcamento = class(TCmControlObject)

  Protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private

    _dbParamorcamento: TdbParamorcamento;
    FCdsParamorcamento: TClientDataSet;
    procedure SetCdsParamorcamento(const Value: TClientDataSet);
  public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    function AplicaOperacaoParamOrcamento : Boolean;
    function Procurar(idpessoa:Double): OleVariant;
    Function ListaMoeda : OleVariant;
    Function ListaParamOrcamento(pidEmpresa: Integer): OleVariant;
    Function ListaPlanoOrc: OleVariant;

    procedure AltIdcontaorcresult(idcontaorcresult: string; idpessoa:integer);
    procedure AltIdcontaorcde(idcontaorcde: string; idpessoa:integer);
    procedure AltIdcontaorcpara(idcontaorcpara: string; idpessoa:integer);

    property CdsParamorcamento: TClientDataSet read  FCdsParamorcamento write SetCdsParamorcamento;
  End;

implementation


procedure TCtrlParamorcamento.DoChangeDataBase;
begin
  inherited;
  _dbParamorcamento.DatabaseName := DataBaseName;
end;

procedure TCtrlParamorcamento.OnCreateAppServer;
begin
  inherited;
  FCdsParamorcamento := TClientDataSet.Create(nil);
end;

constructor TCtrlParamorcamento.Create;
begin
  inherited;
  _dbParamorcamento := TdbParamorcamento.Create(Self);
end;

destructor TCtrlParamorcamento.Destroy;
begin
  inherited;
  _dbParamorcamento.Free;
  if isAppServer then begin
    FreeCds([FCdsParamorcamento]);
  end;
end;

function TCtrlParamorcamento.AplicaOperacaoParamOrcamento: Boolean;
begin
   If ConnectionSide = cnsClient then begin

      Result := Connection.AppServer.AplicaOperacaoParamOrcamento( FCdsParamorcamento.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsParamorcamento,_DbParamorcamento,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbParamorcamento.MessageInfo;
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
end;

function TCtrlParamorcamento.Procurar(idpessoa:Double): OleVariant;
begin
   _DbParamorcamento.Idpessoa.AsFloat := idpessoa;
   Result := GetDataPacket(_DbParamorcamento.SSqlSelect);
end;

procedure TCtrlParamorcamento.SetCdsParamorcamento(
  const Value: TClientDataSet);
begin
  FCdsParamorcamento := Value;
end;

procedure TCtrlParamorcamento.AltIdcontaorcresult(idcontaorcresult: string;
  idpessoa:integer);
var sSql: string;
begin
  sSql := 'UPDATE PARAMORCAMENTO SET IDCONTAORCRESULT = ''' +
          idcontaorcresult + ''' WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlParamorcamento.AltIdcontaorcde(idcontaorcde: string;
  idpessoa:integer);
var sSql: string;
begin
  sSql := 'UPDATE PARAMORCAMENTO SET IDCONTAORCDE = ''' +
          idcontaorcde + ''' WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlParamorcamento.AltIdcontaorcpara(idcontaorcpara: string;
  idpessoa:integer);
var sSql: string;
begin
  sSql := 'UPDATE PARAMORCAMENTO SET IDCONTAORCPARA = ''' +
          idcontaorcpara + ''' WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;
//************************************************
Function TCtrlParamOrcamento.ListaMoeda : OleVariant;
Var
  SqlLocal : TStringList;

Begin
  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT MOECODIGO,MOEDESC FROM MOEDA ORDER BY MOEDESC' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlParamOrcamento.ListaParamOrcamento( pidEmpresa : Integer ) : OleVariant;
Var
  SqlLocal : TStringList;

Begin
  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT * FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr( pidEmpresa ) );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlParamOrcamento.ListaPlanoOrc : OleVariant;
Var
  SqlLocal : TStringList;

Begin
  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT * FROM PLANOORCAMENTARIO ORDER BY NOMEPLANOORC' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
End.

