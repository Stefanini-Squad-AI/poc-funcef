unit uCtrlFluxo;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRadFluxo, uMidasUtil,uCMTypes, uCMClientDataSet;

Type
  TCtrlFluxo = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadFluxo : TDbRadFluxo;
    FCdsRadFluxo: TCMClientDataSet;
    _Padroes    : TCtrlPadroes;
    procedure SetCdsRadFluxo(const Value: TCMClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsRadFluxo: TCMClientDataSet read FCdsRadFluxo write SetCdsRadFluxo;

      function AplicaOperacao(Operacao : TOperacao; iTipoProc,iEmpresa, iUsuario, iModulo : Double): Boolean;
      function Procurar(iIdTipoProcesso,iIdTipoEtapa,iIdTipoEtapaAnt,iIdAndamento: Double): OleVariant;
      function ListaRadFluxo(iIdTipoProcesso,iIdTipoEtapa : Double): OleVariant;
  end;

implementation


procedure TCtrlFluxo.DoChangeDataBase;
begin
  inherited;
  _DbRadFluxo.DatabaseName := DataBaseName;
end;

constructor TCtrlFluxo.Create;
begin
  inherited;
  _DbRadFluxo := TDbRadFluxo.Create(Self);
  _Padroes    := TCtrlPadroes.Create;
end;

destructor TCtrlFluxo.Destroy;
begin
  inherited;
  _DbRadFluxo.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsRadFluxo]);
end;


procedure TCtrlFluxo.SetCdsRadFluxo(
  const Value: TCMClientDataSet);
begin
  FCdsRadFluxo := Value;
end;


function TCtrlFluxo.Procurar(iIdTipoProcesso,iIdTipoEtapa,iIdTipoEtapaAnt,iIdAndamento: Double): OleVariant;
begin
  _DbRadFluxo.Idtipoprocesso.AsFloat := iIdTipoProcesso;
  _DbRadFluxo.Idtipoetapa.AsFloat    := iIdTipoEtapa;
  _DbRadFluxo.Idetapaant.AsFloat     := iIdTipoEtapaAnt;
  _DbRadFluxo.Idandamento.AsFloat    := iIdAndamento;
  Result := GetDataPacket(_DbRadFluxo.SSqlSelect);
end;

function TCtrlFluxo.ListaRadFluxo(iIdTipoProcesso,iIdTipoEtapa : Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT                      '+
           '      F.IDTIPOPROCESSO,     '+
           '      F.IDTIPOETAPA,        '+
           '      F.IDANDAMENTO,        '+
           '      F.IDETAPAANT,         '+
           '      A.NOME AS ETAPAANTES, '+
           '      AN.NOME AS ANDAMENTO  '+
           'FROM                        '+
           '      RADFLUXO F,           '+
           '     RADANDAMENTO AN,       '+
           '     RADTIPOETAPA A         '+
           'WHERE (F.IDTIPOPROCESSO = '+FloatToStr(iIdTipoProcesso)+')    ';
   if iIdTipoEtapa <> 0 then
      sSql := sSql +'  AND (F.IDTIPOETAPA = '+FloatToStr(iIdTipoEtapa)+')    ';
   sSql := sSql +'  AND (F.IDETAPAANT = A.IDTIPOETAPA)   '+
                 '  AND (F.IDANDAMENTO = AN.IDANDAMENTO) ';
   Result := GetDataPacket(sSql);
end;

function TCtrlFluxo.AplicaOperacao(Operacao : TOperacao; iTipoProc,iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoRadFluxo(Integer(Operacao),iTipoProc,iEmpresa, iUsuario, iModulo,CdsRadFluxo.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            FCdsRadFluxo.Data := ListaRadFluxo(iTipoProc,0);
            FCdsRadFluxo.First;
            while not FCdsRadFluxo.Eof do
               FCdsRadFluxo.Delete;
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão do Fluxo de Processo',False);
         end else begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Atualização do Fluxo de Processo',False);
         end;
         if not Result then
            Raise Exception.Create( _Padroes.MessageInfo );
         Result := ApplyCDS(FCdsRadFluxo,_DbRadFluxo,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbRadFluxo.MessageInfo );
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

procedure TCtrlFluxo.OnCreateAppServer;
begin
  inherited;
  FCdsRadFluxo := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFluxo.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.


