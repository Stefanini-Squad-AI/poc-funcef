unit uCtrlAndamentos;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRadAndamento, uMidasUtil,uCMTypes;

Type
  TCtrlAndamentos = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadAndamento : TDbRadAndamento;
    _Padroes        : TCtrlPadroes;
    FCdsRadAndamento: TClientDataSet;
    procedure SetCdsRadAndamento(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsRadAndamento: TClientDataSet read FCdsRadAndamento write SetCdsRadAndamento;

      function AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
      function Procurar(iIdRadAndamento: Double): OleVariant;
      function ListaRadAndamento : OleVariant;


  end;

implementation


procedure TCtrlAndamentos.DoChangeDataBase;
begin
  inherited;
  _DbRadAndamento.DatabaseName := DataBaseName;
end;

constructor TCtrlAndamentos.Create;
begin
  inherited;
  _DbRadAndamento := TDbRadAndamento.Create(Self);
  _Padroes        := TCtrlPadroes.Create;

end;

destructor TCtrlAndamentos.Destroy;
begin
  _DbRadAndamento.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsRadAndamento]);
  inherited;
end;


procedure TCtrlAndamentos.SetCdsRadAndamento(
  const Value: TClientDataSet);
begin
  FCdsRadAndamento := Value;
end;


function TCtrlAndamentos.Procurar(iIdRadAndamento: Double): OleVariant;
begin
  _DbRadAndamento.Idandamento.AsFloat := iIdRadAndamento;
  Result := GetDataPacket(_DbRadAndamento.SSqlSelect);
end;

function TCtrlAndamentos.ListaRadAndamento : OleVariant;
var sSql : String;
begin
  sSql := 'SELECT * FROM RADANDAMENTO ORDER BY NOME';
  Result := GetDataPacket(sSql);
end;

function TCtrlAndamentos.AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoRadAndamento(Integer(Operacao),iEmpresa, iUsuario, iModulo,CdsRadAndamento.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão de Andamentos',False);
         end else begin
            if (Operacao = opAlterar) then begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteração de Andamento',False);
            end else begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Inclusão de Andamento',False);
            end;
         end;
         if not Result then
            Raise Exception.Create( _Padroes.MessageInfo );

         Result := ApplyCDS(FCdsRadAndamento,_DbRadAndamento,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbRadAndamento.MessageInfo );
         Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

procedure TCtrlAndamentos.OnCreateAppServer;
begin
  inherited;
  FCdsRadAndamento := TClientDataSet.Create(nil);
end;

procedure TCtrlAndamentos.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.


