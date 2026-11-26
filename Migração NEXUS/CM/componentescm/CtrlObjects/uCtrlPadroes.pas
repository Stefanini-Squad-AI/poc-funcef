// Alterações:
{

Rotina............: Diversas
N. Sol.............: 127807
N. Kintana......: 715252
Data...............: 01/02/2010
Responsável...: Daniel Begnami
Descrição........: Verificação antes de inicar a transação

--------------------------------------------------------------------------------------------------


Rotina............: Destroy
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}
{ --------------------------------------------------------------------------------------------------
Rotina    : GravaLogOperacoes
Data      : 11/12/2003
Autor     : André Pontes
Pendencia : -
Descrição : Limitação do tamanho da string passada para o campo de observação, para evitar erros
            Copy(sDescOperacao, 1, 60)
---------------------------------------------------------------------------------------------------}

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
     uDbLogAcessoSis ;

Type
  TCtrlPadroes = class(TCmControlObject)

  protected
    procedure DoChangeDataBase; Override;

  private
    _DbLogopcao: TDbLogopcao;
    _DbHistSenha: TDbHistsenha;
    _DbLogAcessoSis: TDbLogacessosis;
    FSql: TStrings;
    procedure SetSql(const Value: TStrings);

  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function GravaLogOperacoes(dIdpessoa, dIdmodulo, dIdusuario: Double; sDescOperacao: String; bCommit: Boolean = True): Boolean;
    function ExecSqlAndCommit(sSql: String): Boolean;
    function GravaHistoricodeSenha(aDataHist: OleVariant): Boolean;


    function GravaLogAcessoSistemas(Idmodulo: Double; sOperacao,sMaquina: string): Boolean;

    Property Sql: TStrings read FSql write SetSql;
  End;


Var
  Padroes :TCtrlPadroes;


implementation

Uses uCMTypes, uDataBase ;

{ TCtrlPadroes }


constructor TCtrlPadroes.Create;                        
begin
  inherited;
  _DbLogopcao     := TDbLogopcao.Create(Self);
  _DbHistSenha    := TDbHistsenha.Create(Self);
  _DbLogAcessoSis := TDbLogacessosis.Create(self);

  FSql := TStringList.Create;
end;




destructor TCtrlPadroes.Destroy;
begin
  // Ricardo A. SOL: 103843 KTN: 464129
  FreeAndNil( _DbLogopcao );
  FreeAndNil( _DbHistSenha );
  FreeAndNil( _DbLogAcessoSis );
  FreeAndNil( FSql );
  inherited;
end;




procedure TCtrlPadroes.DoChangeDataBase;
begin
  inherited;
  _DbLogopcao.DataBaseName     := DataBaseName;
  _DbHistSenha.DataBaseName    := DataBaseName;
  _DbLogAcessoSis.DataBaseName := DataBaseName;
end;

function TCtrlPadroes.ExecSqlAndCommit(sSql: String): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExecSqlAndCommit(sSql);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Try

        // SOL127807 - Daniel Begnami
        if not InTransaction then
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


function TCtrlPadroes.GravaHistoricodeSenha(aDataHist: OleVariant): Boolean;
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

        // SOL127807 - Daniel Begnami
        if not InTransaction then
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




function TCtrlPadroes.GravaLogAcessoSistemas(Idmodulo: Double; sOperacao, sMaquina: string): Boolean;

begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaLogAcessoSistemas(Idmodulo, sOperacao, sMaquina);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try

      // SOL127807 - Daniel Begnami
      if not InTransaction then
        StartTransaction;

      _DbLogacessosis.Clear;
      _DbLogacessosis.Idmodulo.AsFloat     := Idmodulo;
      _DbLogacessosis.Flgoperacao.AsString := sOperacao;
      _DbLogacessosis.Maquina.AsString     := sMaquina;

      Result := _DbLogacessosis.Insert;

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
      end;
    end;
  end;
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
        If bCommit Then
        // SOL127807 - Daniel Begnami
        if not InTransaction then
          StartTransaction;

        _DbLogopcao.Nomeopcao.AsString := Copy(sDescOperacao, 1, 60);

        _DbLogopcao.Idusuario.AsFloat  := dIdusuario;
        _DbLogopcao.Idpessoa.AsFloat   := dIdpessoa;
        _DbLogopcao.Idmodulo.AsFloat   := dIdmodulo;
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

end.
