//André Tavares - pendência 17624 - 09/11/2004 - criada a coluna CODTIPDOC para o relacinamento das tabelas RADGRAUTXGRRESPON x TIPODOCRECPAG

unit uCtrlGrupoAut;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uDbRadGrAutxGrRespon, uDbRadGrupoAutoriza,
     CmEventosCadastro, uMidasUtil,uCMTypes, uCtrlPadroes;

Type
  { upSoPool => Somente as UHs do Pool
    upSoCond => Somente as UHs do Condominio
    upTodas => Todas as UHs
  }
  TCtrlGrupoAut = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadGrAutxGrRespon: TDbRadGrAutxGrRespon;
    _DbRadGrupoAutoriza : TDbRadGrupoAutoriza;
    _Padroes       : TCtrlPadroes;
    FCdsGrupoAut: TClientDataSet;
    FCdsAutXRespon: TClientDataSet;
    procedure SetCdsGrupoAut(const Value: TClientDataSet);
    procedure SetCdsAutXRespon(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      property CdsGrupoAut: TClientDataSet read FCdsGrupoAut write SetCdsGrupoAut;
      property CdsAutXRespon: TClientDataSet read FCdsAutXRespon write SetCdsAutXRespon;
      function Procurar(iIdGrupoAut: Double): OleVariant;
      function ProcurarAutxRespon(iIdGrupoAut,iIdEmpresa: Double): OleVariant;
      function AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
      Function ListaGrupoAut: OleVariant;
  end;

implementation


procedure TCtrlGrupoAut.DoChangeDataBase;
begin
  inherited;
  _DbRadGrAutxGrRespon.DatabaseName := DataBaseName;
  _DbRadGrupoAutoriza.DatabaseName  := DataBaseName;
end;

constructor TCtrlGrupoAut.Create;
begin
  inherited;
  _DbRadGrAutxGrRespon:= TDbRadGrAutxGrRespon.Create(Self);
  _DbRadGrupoAutoriza := TDbRadGrupoAutoriza.Create(Self);
  _Padroes            := TCtrlPadroes.Create;
end;

destructor TCtrlGrupoAut.Destroy;
begin
  inherited;
  _DbRadGrAutxGrRespon.Free;
  _DbRadGrupoAutoriza.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsGrupoAut,FCdsAutXRespon]);
end;

function TCtrlGrupoAut.ListaGrupoAut : OleVariant;
var sSQl : String;
begin
   sSQl := 'SELECT IDGRUPOAUTORIZA,NOMEGRUPOAUT '+
           'FROM RADGRUPOAUTORIZA '+
           'ORDER BY NOMEGRUPOAUT';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlGrupoAut.SetCdsGrupoAut(const Value: TClientDataSet);
begin
  FCdsGrupoAut := Value;
end;


function TCtrlGrupoAut.Procurar(iIdGrupoAut: Double): OleVariant;
begin
  _DbRadGrupoAutoriza.Idgrupoautoriza.AsFloat := iIdGrupoAut;
  Result := GetDataPacket(_DbRadGrupoAutoriza.SSqlSelect);
end;

procedure TCtrlGrupoAut.SetCdsAutXRespon(const Value: TClientDataSet);
begin
  FCdsAutXRespon := Value;
end;

function TCtrlGrupoAut.AplicaOperacao(Operacao: TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoGrupoAut(Integer(Operacao),iEmpresa, iUsuario, iModulo,CdsGrupoAut.Data,CdsAutXRespon.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão de Grupo de Autorização',False);
            if not Result then
               Raise Exception.Create( _Padroes.MessageInfo );
            FCdsAutXRespon.First;
            while not FCdsAutXRespon.Eof do
               FCdsAutXRespon.delete;
            Result := ApplyCDS(FCdsAutXRespon,_DbRadGrAutxGrRespon,[],[]);
            If Not Result Then Begin
               MessageInfo := _DbRadGrAutxGrRespon.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
            Result := ApplyCDS(FCdsGrupoAut,_DbRadGrupoAutoriza,[],[]);
            if not Result then begin
               MessageInfo := _DbRadGrupoAutoriza.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
         end else begin
            if (Operacao = opAlterar) then begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteração de Grupo de Autorização',False);
            end else begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Inclusão de Grupo de Autorização',False);
            end;
            if not Result then
               Raise Exception.Create( _Padroes.MessageInfo );
            Result := ApplyCDS(FCdsGrupoAut,_DbRadGrupoAutoriza,[],[]);
            if not Result then begin
               MessageInfo := _DbRadGrupoAutoriza.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
            Result := ApplyCDS(FCdsAutXRespon,_DbRadGrAutxGrRespon,[_DbRadGrupoAutoriza.Idgrupoautoriza],[_DbRadGrAutxGrRespon.Idgrupoautoriza],True);
            If Not Result Then Begin
               MessageInfo := _DbRadGrAutxGrRespon.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
         end;
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

function TCtrlGrupoAut.ProcurarAutxRespon(iIdGrupoAut,iIdEmpresa: Double): OleVariant;
var sSql : String;
begin
   sSQl := 'SELECT                      '+
           '      AUT.IDGRPRESPON,      '+
           '      AUT.IDGRUPOAUTORIZA,  '+
           '      AUT.CODCENTRORESPON,  '+
           '      AUT.IDPESSOA,         '+
           '      AUT.CODGRUPOPROD,     '+
           '      AUT.CODCENTROCUSTO,   '+
           '      AUT.IDEMPRESA,        '+
           '      AUT.UNIDNEGOC,        '+
           '      AUT.NUMAUTORIZACAO,   '+
           '      AUT.VLRINICIAL,       '+
           '      AUT.VLRFINAL,         '+
           '      AUT.MOECODIGO,        '+
           '      AUT.SEQAUTORIZACAO,   '+
           '      AUT.CODTIPDOC,        '+ // André Tavares - pendência 17624 - 09/11/2004
           '      CC.NOME,              '+
           '      GP.DESCGRUPOPROD,     '+
           '      CR.NOME AS DESCCENTRESP,   '+
           '      UN.NOME AS DESCUNIDNEG,    '+
           '      GRP.NOME AS DESCGRPRESPON, '+
           '      TDRP.DESCRICAO AS TIPODOCUMENTO '+ // André Tavares - pendência 17624 - 09/11/2004
           'FROM                             '+
           '    RADGRAUTXGRRESPON AUT,       '+
           '    CENTCUST CC,                 '+
           '    GRUPPROD GP,                 '+
           '    CENTRESPON CR,               '+
           '    UNIDNEGOCIO UN,              '+
           '    RADGRPRESPON GRP,            '+
           '    TIPODOCRECPAG TDRP           '+ // André Tavares - pendência 17624 - 09/11/2004
           ' WHERE                           '+
           '         ( AUT.IDGRUPOAUTORIZA = '+FloatToStr(iIdGrupoAut)+') '+
           '    AND  ( AUT.IDPESSOA = '+FloatToStr(iIdEmpresa)+')         '+
           '    AND  ( AUT.IDEMPRESA = CC.IDEMPRESA(+))                   '+
           '    AND  ( AUT.IDPESSOA = CR.IDPESSOA(+))                     '+
           '    AND  ( AUT.IDPESSOA = UN.IDPESSOA(+))                     '+
           '    AND  ( AUT.IDGRPRESPON = GRP.IDGRPRESPON)                 '+
           '    AND  ( AUT.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))         '+
           '    AND  ( AUT.CODGRUPOPROD = GP.CODGRUPOPROD(+))             '+
           '    AND  ( AUT.CODCENTRORESPON = CR.CODCENTRORESPON(+))       '+
           '    AND  ( AUT.UNIDNEGOC = UN.UNIDNEGOC(+))                   '+
           '    AND  ( AUT.CODTIPDOC = TDRP.CODTIPDOC(+))                 '+
           ' ORDER BY AUT.SEQAUTORIZACAO                                  ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlGrupoAut.OnCreateAppServer;
begin
  inherited;
  FCdsGrupoAut   := TClientDataSet.Create(nil);
  FCdsAutXRespon := TClientDataSet.Create(nil);
end;

procedure TCtrlGrupoAut.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.



