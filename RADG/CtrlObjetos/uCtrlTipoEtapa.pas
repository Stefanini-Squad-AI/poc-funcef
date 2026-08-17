unit uCtrlTipoEtapa;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRadTipoEtapa, uMidasUtil,uCMTypes;

Type
  TCtrlTipoEtapa = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadTipoEtapa: TDbRadTipoEtapa;
    _Padroes        : TCtrlPadroes;
    FCdsRadTipoEtapa: TClientDataSet;
    procedure SetCdsRadTipoEtapa(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsRadTipoEtapa: TClientDataSet read FCdsRadTipoEtapa write SetCdsRadTipoEtapa;

      function AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
      function Procurar(iIdRadTipoEtapa: Double): OleVariant;
      function ListaRadTipoEtapa(iIdTipoProcesso : Double) : OleVariant;


  end;

implementation


procedure TCtrlTipoEtapa.DoChangeDataBase;
begin
  inherited;
  _DbRadTipoEtapa.DatabaseName := DataBaseName;
end;

constructor TCtrlTipoEtapa.Create;
begin
  inherited;
  _DbRadTipoEtapa := TDbRadTipoEtapa.Create(Self);
  _Padroes        := TCtrlPadroes.Create;
end;

destructor TCtrlTipoEtapa.Destroy;
begin
  _DbRadTipoEtapa.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsRadTipoEtapa]);
  inherited;
end;


procedure TCtrlTipoEtapa.SetCdsRadTipoEtapa(
  const Value: TClientDataSet);
begin
  FCdsRadTipoEtapa := Value;
end;


function TCtrlTipoEtapa.Procurar(iIdRadTipoEtapa: Double): OleVariant;
begin
  _DbRadTipoEtapa.Idtipoetapa.AsFloat := iIdRadTipoEtapa;
  Result := GetDataPacket(_DbRadTipoEtapa.SSqlSelect);
end;

function TCtrlTipoEtapa.ListaRadTipoEtapa(iIdTipoProcesso : Double) : OleVariant;
var sSql : String;
begin
   if iIdTipoProcesso <> 0 then begin
      sSql := 'SELECT                         '+
              '      EXP.IDTIPOPROCESSO,      '+
              '      EXP.IDTIPOETAPA,         '+
              '      ETP.NOME                 '+
              'FROM                           '+
              '      RADTIPOETAPAXPROC EXP,   '+
              '      RADTIPOETAPA ETP         '+
              'WHERE (EXP.IDTIPOPROCESSO = '+FloatToStr(iIdTipoProcesso)+') '+
              '  AND (EXP.IDTIPOETAPA  = ETP.IDTIPOETAPA) '+
              'ORDER BY NOME';
   end else begin
      sSql := 'SELECT * FROM RADTIPOETAPA ORDER BY NOME';
   end;
   Result := GetDataPacket(sSql);
end;

function TCtrlTipoEtapa.AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoRadTipoEtapa(Integer(Operacao),iEmpresa, iUsuario, iModulo,cdsRadTipoEtapa.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão de Etapa',False);
         end else begin
            if (Operacao = opAlterar) then begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteração de Etapa',False);
            end else begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Inclusão de Etapa',False);
            end;
         end;
         if not Result then
            Raise Exception.Create( _Padroes.MessageInfo );
         Result := ApplyCDS(FCdsRadTipoEtapa,_DbRadTipoEtapa,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbRadTipoEtapa.MessageInfo );
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

procedure TCtrlTipoEtapa.OnCreateAppServer;
begin
  inherited;
  FCdsRadTipoEtapa := TClientDataSet.Create(nil);
end;

procedure TCtrlTipoEtapa.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.


