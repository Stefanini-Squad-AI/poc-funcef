unit uCtrlEtapaxGrupoAut;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils,uDbRadEtapaxGrpResp,
     CmEventosCadastro,uMidasUtil,uCMTypes,
     uCtrlPadroes;

Type

  TCtrlEtapaxGrupoAut = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadEtapaxGrpResp  : TDbRadEtapaxGrpResp;
    _Padroes             : TCtrlPadroes;
    FCdsEtapaxGrupo: TClientDataSet;
    procedure SetCdsEtapaxGrupo(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      property CdsEtapaxGrupo: TClientDataSet read FCdsEtapaxGrupo write SetCdsEtapaxGrupo;
      function ProcurarEtapaxGrupo(iIdProcesso, iIdEtapa: Double): OleVariant;
      function ProcurarGrpDisp(iIdProcesso, iIdEtapa: Double): OleVariant;
      function AplicaOperacao(iEmpresa, iUsuario, iModulo : Double): Boolean;
  end;

implementation


procedure TCtrlEtapaxGrupoAut.DoChangeDataBase;
begin
  inherited;
  _DbRadEtapaxGrpResp.DatabaseName  := DataBaseName;
end;

constructor TCtrlEtapaxGrupoAut.Create;
begin
  inherited;
  _DbRadEtapaxGrpResp  := TDbRadEtapaxGrpResp.Create(Self);
  _Padroes             := TCtrlPadroes.Create;
end;

destructor TCtrlEtapaxGrupoAut.Destroy;
begin
  inherited;
  _DbRadEtapaxGrpResp.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsEtapaxGrupo]);
end;

procedure TCtrlEtapaxGrupoAut.SetCdsEtapaxGrupo(const Value: TClientDataSet);
begin
  FCdsEtapaxGrupo := Value;
end;

function TCtrlEtapaxGrupoAut.ProcurarEtapaxGrupo(iIdProcesso, iIdEtapa: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT                      '+
           '     EXA.IDTIPOPROCESSO,    '+
           '     EXA.IDTIPOETAPA,       '+
           '     EXA.IDGRUPOAUTORIZA,   '+
           '     E.NOME AS ETAPA,       '+
           '     P.NOME AS PROC,        '+
           '     A.NOMEGRUPOAUT         '+
           'FROM                        '+
           '     RADETAPAXGRPRESP EXA,  '+
           '     RADTIPOETAPA E,        '+
           '     RADTIPOPROCESSO P,     '+
           '     RADGRUPOAUTORIZA A     '+
           'WHERE                       '+
           '          (EXA.IDTIPOPROCESSO  = '+FloatToStr(iIdProcesso)+') '+
           '  AND (EXA.IDTIPOETAPA     = '+FloatToStr(iIdEtapa)+')        '+
           '  AND (EXA.IDTIPOPROCESSO  = P.IDTIPOPROCESSO)                '+
           '  AND (EXA.IDTIPOETAPA     =  E.IDTIPOETAPA)                  '+
           '  AND (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)               '+
           'ORDER BY A.NOMEGRUPOAUT                                       ';
  Result := GetDataPacket(sSql);
end;

function TCtrlEtapaxGrupoAut.AplicaOperacao(iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoGrupoRespon(iEmpresa, iUsuario, iModulo,CdsEtapaxGrupo.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Atualização de Etapa x Grupo de Autorização ',False);
         if not Result then
            Raise Exception.Create( _Padroes.MessageInfo );
         
         Result := ApplyCDS(FCdsEtapaxGrupo,_DbRadEtapaxGrpResp,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbRadEtapaxGrpResp.MessageInfo );
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

procedure TCtrlEtapaxGrupoAut.OnCreateAppServer;
begin
  inherited;
  FCdsEtapaxGrupo := TClientDataSet.Create(nil);
end;

function TCtrlEtapaxGrupoAut.ProcurarGrpDisp(iIdProcesso, iIdEtapa: Double): OleVariant;
var sSql : String;
begin
   sSql :='SELECT                                                                      '+
          '        GRP.IDGRUPOAUTORIZA ,                                               '+
          '        GRP.NOMEGRUPOAUT                                                    '+
          'FROM                                                                        '+
	  '        RADGRUPOAUTORIZA GRP                                                '+
	  'WHERE                                                                       '+
          '      ( GRP.IDGRUPOAUTORIZA NOT IN ( SELECT IDGRUPOAUTORIZA                 '+
          '			             FROM RADETAPAXGRPRESP                     '+
          '                                     WHERE (IDTIPOPROCESSO = '+FloatToStr(iIdProcesso)+')      '+
          '                                        AND(IDTIPOETAPA    = '+FloatToStr(iIdEtapa)+') ) ) '+
          'ORDER BY GRP.NOMEGRUPOAUT ';
  Result := GetDataPacket(sSql);
end;

procedure TCtrlEtapaxGrupoAut.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.



