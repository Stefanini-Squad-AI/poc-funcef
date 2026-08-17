{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }        
{*******************************************************}
unit uCtrlPadroes;

interface

Uses uCmControlObject, classes, Sysutils, Provider, uDbLogopcao, uDbHistsenha,
  uDbLogacessosis;

Type
  TCtrlPadroes = class(TCmControlObject)

  protected

  private
    _DbLogopcao: TDbLogopcao;
    _DbHistSenha: TDbHistsenha;
    _DbLogacessosis: TDbLogacessosis;
    
    FSql: TStrings;
    procedure SetSql(const Value: TStrings);

  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function GravaLogOperacoes(dIdpessoa, dIdmodulo, dIdusuario: Double; sDescOperacao: String; bCommit: Boolean = True): Boolean;
    function ExecSqlAndCommit(sSql: String): Boolean;
    function GravaHistoricodeSenha(Const aDataHist: OleVariant): Boolean;
    function GravaLogAcessoSistemas(Idmodulo, IdUsuarioLogin, IdUsuarioLogout: Double): Boolean;

    Property Sql: TStrings read FSql write SetSql;
  End;


Var
  Padroes :TCtrlPadroes;


implementation

Uses uCMTypes;

{ TCtrlPadroes }


constructor TCtrlPadroes.Create;                        
begin
  inherited;
  _DbLogopcao := TDbLogopcao.Create(Self);
  _DbHistSenha := TDbHistsenha.Create(Self);
  _DbLogacessosis := TDbLogacessosis.Create(Self);

  FSql := TStringList.Create;
end;

destructor TCtrlPadroes.Destroy;
begin
  _DbLogopcao.Free;
  _DbHistSenha.Free;
  _DbLogacessosis.Free;

  FSql.Free;
  inherited;
end;

function TCtrlPadroes.ExecSqlAndCommit(sSql: String): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     //Result := Connection.AppServer.ExecSqlAndCommit(sSql);
     result := FConexaoPadrao.ExecSQLAndCommit(sSQL);
     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Try
        StartTransaction;
        
        Result := ExecSQL(sSql);

        If Not Result Then
           Raise Exception.Create(MessageInfo)
        Else
           Commit;

     except
        On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlPadroes.GravaHistoricodeSenha(Const aDataHist: OleVariant): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaHistSenha(aDataHist);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Try
        StartTransaction;

        _Cds.Data := aDataHist;

        Result := ApplyCds(_Cds, _DbHistSenha, [], []);

        If Not Result Then
        Begin
           MessageInfo := _DbLogopcao.MessageInfo;
           Rollback;
        End
        Else
          Commit;

     except
        On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlPadroes.GravaLogOperacoes(dIdpessoa, dIdmodulo,
  dIdusuario: Double; sDescOperacao: String; bCommit: Boolean = True): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaLogOperacoes(dIdpessoa, dIdmodulo,
               dIdusuario, sDescOperacao);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Try
        If bCommit Then StartTransaction;

        _DbLogopcao.Nomeopcao.AsString := sDescOperacao;
        _DbLogopcao.Idusuario.AsFloat := dIdusuario;
        _DbLogopcao.Idpessoa.AsFloat := dIdpessoa;
        _DbLogopcao.Idmodulo.AsFloat := dIdmodulo;
        _DbLogopcao.Datalog.AsDateTime := Date;

        Result := _DbLogopcao.Insert;

        If Not Result Then
        Begin
           MessageInfo := _DbLogopcao.MessageInfo;
           If bCommit Then Rollback;
        End
        Else
          If bCommit Then Commit;

     except
        On E:Exception Do
         Begin
            Result := False;
            If bCommit Then Rollback;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

procedure TCtrlPadroes.SetSql(const Value: TStrings);
begin
  FSql := Value;
end;

function TCtrlPadroes.GravaLogAcessoSistemas(Idmodulo, IdUsuarioLogin, IdUsuarioLogout: Double): Boolean;
  function GravaLog(IdUsuario: Double; sOp: Char): Boolean;
  begin
    if IdUsuario > 0 then
    begin
      _DbLogacessosis.Clear;
      _DbLogacessosis.Idusuario.AsFloat := IdUsuario;
      _DbLogacessosis.Idmodulo.AsFloat := Idmodulo;
      _DbLogacessosis.Flgoperacao.AsString := sOp;
      Result := _DbLogacessosis.Insert;
    end
    else
      Result := True;
  end;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaLogAcessoSistemas(Idmodulo, IdUsuarioLogin, IdUsuarioLogout);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      
      result := GravaLog(IdUsuarioLogin, 'I');

      if result then
        result := GravaLog(IdUsuarioLogout, 'O');

      If Result Then
        commit
      else
        raise Exception.Create(_DbLogacessosis.MessageInfo);
    except
      On E:Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
end;


end.
