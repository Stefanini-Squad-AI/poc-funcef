unit uCtrlGrupoRespon;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils,uDbRadgrprespon,uDbRadresponxgrp,
     CmEventosCadastro,uMidasUtil,uCMTypes,
     uCtrlPadroes,usistema;

Type

  TCtrlGrupoRespon = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadGrpRespon  : TDbRadGrpRespon;
    _dbRadResponxGrp : TdbRadResponxGrp;
    _Padroes         : TCtrlPadroes;
    FCdsGrupoRespon: TClientDataSet;
    FCdsGrpxUsu: TClientDataSet;
    procedure SetCdsGrupoRespon(const Value: TClientDataSet);
    procedure SetCdsGrpxUsu(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      property CdsGrupoRespon: TClientDataSet read FCdsGrupoRespon write SetCdsGrupoRespon;
      property CdsGrpxUsu: TClientDataSet read FCdsGrpxUsu write SetCdsGrpxUsu;
      function Procurar(iIdGrupoRespon: Double): OleVariant;
      function Procurarg(iIdGrupoRespon: Double): OleVariant;
      function ListaGrupoRespon : OleVariant;
      function ProcurarUsuxGrupo(iIdGrupoRespon: Double): OleVariant;
      function ProcurarUsuDisp(iIdGrupoRespon: Double): OleVariant;
      function AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
  end;

implementation


procedure TCtrlGrupoRespon.DoChangeDataBase;
begin
  inherited;
  _dbRadGrpRespon.DatabaseName  := DataBaseName;
  _dbRadResponxGrp.DatabaseName := DataBaseName;
end;

constructor TCtrlGrupoRespon.Create;
begin
  inherited;
  _dbRadGrpRespon  := TdbRadGrpRespon.Create(Self);
  _dbRadResponxGrp := TdbRadResponxGrp.Create(Self);
  _Padroes         := TCtrlPadroes.Create;
end;

destructor TCtrlGrupoRespon.Destroy;
begin
  inherited;
  _dbRadGrpRespon.Free;
  _dbRadResponxGrp.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsGrupoRespon,FCdsGrpxUsu]);
end;

procedure TCtrlGrupoRespon.SetCdsGrupoRespon(const Value: TClientDataSet);
begin
  FCdsGrupoRespon := Value;
end;


function TCtrlGrupoRespon.Procurar(iIdGrupoRespon: Double): OleVariant;
begin
  _DbRadGrpRespon.Idgrprespon.AsFloat := iIdGrupoRespon;
  Result := GetDataPacket(_DbRadGrpRespon.SSqlSelect);
  _DbRadGrpRespon.Idgrprespon.AsFloat:= -1;


end;

function TCtrlGrupoRespon.Procurarg(iIdGrupoRespon: Double): OleVariant;
begin
  _DbRadGrpRespon.Idgrprespon.AsFloat := iIdGrupoRespon;
  Result := GetDataPacket(_DbRadGrpRespon.SSqlSelect);
  _DbRadGrpRespon.Idgrprespon.AsFloat := -1;
end;

function TCtrlGrupoRespon.ProcurarUsuxGrupo(iIdGrupoRespon: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT RXP.IDUSUARIO,     '+
           '       P.NOME,            '+
           '       RXP.IDGRPRESPON,   '+
           '       USU.NOMEUSUARIO    '+
           '    ,RXP.FLGSUBSTITUTO,RXP.FLGAVISORAD  ' +
           'FROM RADRESPONXGRP RXP,   '+
           '     USUARIOSISTEMA USU,  '+
           '     PESSOA P             '+
           'WHERE (RXP.IDGRPRESPON = '+FloatToStr(iIdGrupoRespon)+') '+
           '  AND (RXP.IDUSUARIO = USU.IDUSUARIO)  '+
           '  AND (P.IDPESSOA = USU.IDUSUARIO)     '+ 
           'ORDER BY USU.NOMEUSUARIO                ';
  Result := GetDataPacket(sSql);
end;

procedure TCtrlGrupoRespon.SetCdsGrpxUsu(const Value: TClientDataSet);
begin
  FCdsGrpxUsu := Value;
end;

function TCtrlGrupoRespon.AplicaOperacao(Operacao: TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoGrupoRespon(Integer(Operacao),iEmpresa, iUsuario, iModulo,CdsGrupoRespon.Data,CdsGrpxUsu.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão de Grupo de Responsabilidade',False);
            if not Result then
               Raise Exception.Create( _Padroes.MessageInfo );
            FCdsGrpxUsu.First;
            while not FCdsGrpxUsu.Eof do
               FCdsGrpxUsu.delete;
            Result := ApplyCDS(FCdsGrpxUsu,_DbRadResponxGrp,[],[]);
            if not Result then
               Raise Exception.Create( _DbRadResponxGrp.MessageInfo );

            Result := ApplyCDS(FCdsGrupoRespon,_DbRadGrpRespon,[],[]);
            if not Result then
               Raise Exception.Create( _DbRadGrpRespon.MessageInfo );
         end else begin
            if (Operacao = opAlterar) then begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteração de Grupo de Responsabilidade',False);
            end else begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Inclusão de Grupo de Responsabilidade',False);
            end;
            if not Result then
               Raise Exception.Create( _Padroes.MessageInfo );
            
            Result := ApplyCDS(FCdsGrupoRespon,_DbRadGrpRespon,[],[]);
            If Not Result Then
               Raise Exception.Create( _DbRadGrpRespon.MessageInfo );
            
            Result := ApplyCDS(FCdsGrpxUsu,_DbRadResponxGrp,[_DbRadGrpRespon.Idgrprespon],[_DbRadResponxGrp.Idgrprespon],True);
            if not Result then
               Raise Exception.Create( _DbRadResponxGrp.MessageInfo );
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

procedure TCtrlGrupoRespon.OnCreateAppServer;
begin
  inherited;
  FCdsGrupoRespon := TClientDataSet.Create(nil);
  FCdsGrpxUsu     := TClientDataSet.Create(nil);
end;



function TCtrlGrupoRespon.ProcurarUsuDisp(
  iIdGrupoRespon: Double): OleVariant;
var sSql : String;
begin
   sSql :='SELECT USU.IDUSUARIO, '+
          '       USU.NOMEUSUARIO, '+
          '       P.NOME           '+
          'FROM USUARIOSISTEMA USU, PESSOA P  '+
          'WHERE NOT EXISTS (SELECT X.IDUSUARIO '+
	  '          	     FROM RADRESPONXGRP X '+
	  '                  WHERE (X.IDGRPRESPON = '+FloatToStr(iIdGrupoRespon)+')'+
          '                    AND (X.IDUSUARIO = USU.IDUSUARIO) ) '+
          '                    AND (P.IDPESSOA  = USU.IDUSUARIO)   '+
          'ORDER BY USU.NOMEUSUARIO ';
  Result := GetDataPacket(sSql);
end;

function TCtrlGrupoRespon.ListaGrupoRespon: OleVariant;
var sSql : String;
begin
   sSql := 'SELECT IDGRPRESPON, NOME, NIVEL '+
           'FROM RADGRPRESPON '+
           'ORDER BY NOME ';
  Result := GetDataPacket(sSql);
end;

procedure TCtrlGrupoRespon.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

end.



