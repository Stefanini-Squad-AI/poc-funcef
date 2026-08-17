unit uCtrlEtapaxObjeto;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils,uDbRadObjetoxEtapa,
     CmEventosCadastro,uMidasUtil,uCMTypes,
     uCtrlPadroes;

Type

  TCtrlEtapaxObjeto = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadObjetoxEtapa  : TDbRadObjetoxEtapa;
    _Padroes            : TCtrlPadroes;
    FCdsEtapaxObjeto: TClientDataSet;
    procedure SetCdsEtapaxObjeto(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      property CdsEtapaxObjeto: TClientDataSet read FCdsEtapaxObjeto write SetCdsEtapaxObjeto;
      function ProcurarEtapaxObjeto(iIdProcesso, iIdEtapa: Double): OleVariant;
      function ProcurarObjDisp(iIdProcesso, iIdEtapa, iIdModulo: Double): OleVariant;
      function AplicaOperacao(iEmpresa, iUsuario, iModulo : Double): Boolean;
  end;

implementation


procedure TCtrlEtapaxObjeto.DoChangeDataBase;
begin
  inherited;
  _DbRadObjetoxEtapa.DatabaseName  := DataBaseName;
end;

constructor TCtrlEtapaxObjeto.Create;
begin
  inherited;
  _DbRadObjetoxEtapa  := TDbRadObjetoxEtapa.Create(Self);
  _Padroes            := TCtrlPadroes.Create;
end;

destructor TCtrlEtapaxObjeto.Destroy;
begin
  inherited;
  _DbRadObjetoxEtapa.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsEtapaxObjeto]);
end;

procedure TCtrlEtapaxObjeto.SetCdsEtapaxObjeto(const Value: TClientDataSet);
begin
  FCdsEtapaxObjeto := Value;
end;

function TCtrlEtapaxObjeto.ProcurarEtapaxObjeto(iIdProcesso, iIdEtapa: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT                     '+
           '      OXE.IDTIPOETAPA,     '+
           '      OXE.IDTIPOPROCESSO,  '+
           '      OXE.IDOBJETO,        '+
           '      OXE.ORDEM,           '+
           '      OBJ.DESCOBJETO,      '+
           '      OBJ.NOMEOBJETO       '+
           'FROM                       '+
           '    RADOBJETOXETAPA OXE,   '+
           '    RADOBJETO OBJ          '+
           'WHERE                      '+
           '       (OXE.IDTIPOPROCESSO = '+FloatToStr(iIdProcesso)+') '+
           '   AND (OXE.IDTIPOETAPA    = '+FloatToStr(iIdEtapa)+')    '+
           '   AND (OXE.IDOBJETO       = OBJ.IDOBJETO)  ';
   Result := GetDataPacket(sSql);
end;

function TCtrlEtapaxObjeto.AplicaOperacao(iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoGrupoRespon(iEmpresa, iUsuario, iModulo,CdsEtapaxObjeto.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Atualização de Etapa x Objetos RAD',False);
         if not Result then
            Raise Exception.Create( _Padroes.MessageInfo );
         
         Result := ApplyCDS(FCdsEtapaxObjeto,_DbRadObjetoxEtapa,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbRadObjetoxEtapa.MessageInfo );
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

procedure TCtrlEtapaxObjeto.OnCreateAppServer;
begin
  inherited;
  FCdsEtapaxObjeto := TClientDataSet.Create(nil);
end;

function TCtrlEtapaxObjeto.ProcurarObjDisp(iIdProcesso, iIdEtapa, iIdModulo: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT            '+
           '    IDOBJETO,     '+
           '    IDMODULO,     '+
           '    DESCOBJETO,   '+
       	   '    NOMEOBJETO    '+
           'FROM              '+
           '    RADOBJETO     '+
           'WHERE             '+
           '         ( IDMODULO = '+FloatToStr(iIdModulo)+' )  '+
           '     AND ( IDOBJETO NOT IN ( SELECT IDOBJETO    '+
           '	                         FROM   RADOBJETOXETAPA '+
           '                             WHERE  (IDTIPOPROCESSO = '+FloatToStr(iIdProcesso)+') '+
           '                                AND (IDTIPOETAPA    = '+FloatToStr(iIdEtapa)+') )) '+
           'ORDER BY DESCOBJETO ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlEtapaxObjeto.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.



