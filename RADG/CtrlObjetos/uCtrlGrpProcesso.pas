unit uCtrlGrpProcesso;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRadGrupoProcesso, uMidasUtil,uCMTypes;

Type
  TCtrlGrpProcesso = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadGrupoProcesso : TDbRadGrupoProcesso;
    FCdsRadGrupoProcesso: TClientDataSet;
    _Padroes            : TCtrlPadroes;
    procedure SetCdsRadGrupoProcesso(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsRadGrupoProcesso: TClientDataSet read FCdsRadGrupoProcesso write SetCdsRadGrupoProcesso;

      function AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
      function Procurar(iIdRadGrupoProcesso: Double): OleVariant;
      function ListaRadGrupoProcesso : OleVariant;


  end;

implementation


procedure TCtrlGrpProcesso.DoChangeDataBase;
begin
  inherited;
  _DbRadGrupoProcesso.DatabaseName := DataBaseName;
end;

constructor TCtrlGrpProcesso.Create;
begin
  inherited;
  _DbRadGrupoProcesso := TDbRadGrupoProcesso.Create(Self);
  _Padroes            := TCtrlPadroes.Create;
end;

destructor TCtrlGrpProcesso.Destroy;
begin
  inherited;
  _DbRadGrupoProcesso.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsRadGrupoProcesso]);
end;


procedure TCtrlGrpProcesso.SetCdsRadGrupoProcesso(
  const Value: TClientDataSet);
begin
  FCdsRadGrupoProcesso := Value;
end;


function TCtrlGrpProcesso.Procurar(iIdRadGrupoProcesso: Double): OleVariant;
begin
  _DbRadGrupoProcesso.Idgrupoprocesso.AsFloat := iIdRadGrupoProcesso;
  Result := GetDataPacket(_DbRadGrupoProcesso.SSqlSelect);
end;

function TCtrlGrpProcesso.ListaRadGrupoProcesso : OleVariant;
var sSql : String;
begin
  sSql := 'SELECT * FROM RADGRUPOPROCESSO ORDER BY DESCGRUPOPROCESSO';
  Result := GetDataPacket(sSql);
end;

function TCtrlGrpProcesso.AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoRadGrupoProcesso(Integer(Operacao),iEmpresa, iUsuario, iModulo,CdsRadGrupoProcesso.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão de Grupo de Processos',False);
         end else begin
            if (Operacao = opAlterar) then begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteração de Grupo de Processos',False);
            end else begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Inclusão de Grupo de Processos',False);
            end;
         end;
         if not Result then
            Raise Exception.Create( _Padroes.MessageInfo );
         
         Result := ApplyCDS(FCdsRadGrupoProcesso,_DbRadGrupoProcesso,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbRadGrupoProcesso.MessageInfo );
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

procedure TCtrlGrpProcesso.OnCreateAppServer;
begin
  inherited;
  FCdsRadGrupoProcesso := TClientDataSet.Create(nil);
end;

procedure TCtrlGrpProcesso.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.


