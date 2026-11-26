{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************
 Nº SOL: 253300/17804
 Nº KINTANA/PPM: 1093186
 Data da Alteração: 27.10.2015
 Responsável: Michelle S. Mota
 Descrição: Melhoria na funcionalidade de cadastro de usuários disponível em
 todos os módulos do PLANUS, conforme documentação produzida.
*********************************************************************************
Autor      : Antonio Marcos (amf)
Rotina     : ProcessaUsuario
Data       : 15.03.2007
Descrição  : Corrige o erro de duplicidade do IDPESSOA e IDUSUARIO
Pendencia  : 24755
---------------------------------------------------------}

unit uDbUsuariosistema;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase, uDbEspacess,
     UdbPessoa, Dialogs, dBaseDados, dbTables, uCmTypes;

Type
  TDbUsuariosistema = class(TCmDbObject)

  private
    _DbEspacess: TDbEspacess;
    _DbPessoa: TDbPessoa;

    FNomeusuario: TCmDbField;
    FMudarsenha: TCmDbField;
    FSenhaautoriz: TCmDbField;
    FFlgausente: TCmDbField;
    FIdespacesso: TCmDbField;
    FDescricao: TCmDbField;
    FValidadesenha: TCmDbField;
    FDesativado: TCmDbField;
    FBloqueado: TCmDbField;
    FSenha: TCmDbField;
    FIdusuario: TCmDbField;
    FSenhapermanente: TCmDbField;
    FNaomudasenha: TCmDbField;
    FNomeCompleto: String;
    FAlteraPessoa: boolean;
    FBloqueiaAteData: TCmDbField;
    FEmail: string;
    FIdPessoa: extended;
    FFlgDispFinanc: TCmDbField;
    FFlgTipoUsu: TCmDbField; //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
    FIdForCli: TCmDbField; //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
    
    procedure SetBloqueado(const Value: TCmDbField);
    procedure SetDesativado(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgausente(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetMudarsenha(const Value: TCmDbField);
    procedure SetNaomudasenha(const Value: TCmDbField);
    procedure SetNomeusuario(const Value: TCmDbField);
    procedure SetSenha(const Value: TCmDbField);
    procedure SetSenhaautoriz(const Value: TCmDbField);
    procedure SetSenhapermanente(const Value: TCmDbField);
    procedure SetValidadesenha(const Value: TCmDbField);
    procedure SetNomeCompleto(const Value: String);
    procedure SetAlteraPessoa(const Value: boolean);
    procedure SetBloqueiaAteData(const Value: TCmDbField);
    procedure SetEmail(const Value: string);
    procedure SetIdPessoa(const Value: extended);
    procedure SetFlgDispFinanc(const Value: TCmDbField);
    procedure SetFlgTipoUsu(const Value: TCmDbField);//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
    procedure SetIdForCli(const Value: TCmDbField);//Michelle Mota - SOL: 253300/17804 - PPM: 1093186

  public

     Property Validadesenha: TCmDbField read FValidadesenha write SetValidadesenha;
     Property Senhapermanente: TCmDbField read FSenhapermanente write SetSenhapermanente;
     Property Senhaautoriz: TCmDbField read FSenhaautoriz write SetSenhaautoriz;
     Property Senha: TCmDbField read FSenha write SetSenha;
     Property Nomeusuario: TCmDbField read FNomeusuario write SetNomeusuario;
     Property Naomudasenha: TCmDbField read FNaomudasenha write SetNaomudasenha;
     Property Mudarsenha: TCmDbField read FMudarsenha write SetMudarsenha;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Flgausente: TCmDbField read FFlgausente write SetFlgausente;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Desativado: TCmDbField read FDesativado write SetDesativado;
     Property Bloqueado: TCmDbField read FBloqueado write SetBloqueado;
     Property BloqueiaAteData: TCmDbField read FBloqueiaAteData write SetBloqueiaAteData; //P.RAMOS-22.11.2004-PEND.17809
     Property FlgDispFinanc: TCmDbField read FFlgDispFinanc write SetFlgDispFinanc; //Bruno Bastos - 131911
     Property FlgTipoUsu: TCmDbField read FFlgTipoUsu write SetFlgTipoUsu; //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
     Property IdForCli: TCmDbField read FIdForCli write SetIdForCli; //Michelle Mota - SOL: 253300/17804 - PPM: 1093186

     Property NomeCompleto: String read FNomeCompleto write SetNomeCompleto;
     property AlteraPessoa: boolean read FAlteraPessoa write SetAlteraPessoa;

     property Email: string read FEmail write SetEmail;

     property IdPessoa: extended read FIdPessoa write SetIdPessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     Destructor Destroy; Override;

     Function Insert: Boolean; Override;
     Function Update: Boolean; Override;

  End;

implementation

Uses uCmControlObject, uCmConectaBanco, uCripto, uCMSql50, Sysutils;

{ TDbUsuariosistema }

constructor TDbUsuariosistema.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  FAlteraPessoa := false;

  ErrorIfNoRowsAffected := False;

  TableName := 'USUARIOSISTEMA';

  fValidadesenha := CreateCmDbField('VALIDADESENHA',ftDateTime,False,False,False,True,'');
  fSenhapermanente := CreateCmDbField('SENHAPERMANENTE',ftString,False,False,False,True,'');
  fSenhaautoriz := CreateCmDbField('SENHAAUTORIZ',ftString,False,False,False,True,'');
  fSenha := CreateCmDbField('SENHA',ftString,True,False,False,True,'');
  fNomeusuario := CreateCmDbField('NOMEUSUARIO',ftString,True,False,False,True,'');
  fNaomudasenha := CreateCmDbField('NAOMUDASENHA',ftString,False,False,False,True,'');
  fMudarsenha := CreateCmDbField('MUDARSENHA',ftString,False,False,False,True,'');
  fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
  fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,False,False,True,'');
  fFlgausente := CreateCmDbField('FLGAUSENTE',ftString,False,False,False,True,'');
  fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
  fDesativado := CreateCmDbField('DESATIVADO',ftString,False,False,False,True,'');
  fBloqueado := CreateCmDbField('BLOQUEADO',ftString,False,False,False,True,'');
  fBloqueiaAteData := CreateCmDbField('BLOQUEIAATEDATA',ftDateTime,False,False,False,True,''); //P.RAMOS-22.11.2004-PEND.17809
  FFlgDispFinanc := CreateCmDbField('FLGDISPFINANC',ftString,True,False,False,True,'');
  FFlgTipoUsu := CreateCmDbField('FLGTIPOUSU',ftString,True,False,False,True,'');//Michelle Mota - SOL: 253300/17804 - PPM: 1093186
  FIdForCli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');//Michelle Mota - SOL: 253300/17804 - PPM: 1093186

end;

destructor TDbUsuariosistema.Destroy;
begin
  //
  inherited;
end;

function TDbUsuariosistema.Insert: Boolean;
var
  bCriaUsuario  : Boolean;
  OldTraceFlags : TTraceFlags;
begin

  //Criar e destruir os DbObjects a cada insert para prevenir erro de lixo
  //proveniente de execuções anteriores

  _DbEspacess := TDbEspacess.Create( Self.Owner );
  _DbPessoa := TDbPessoa.Create( Self.Owner );


  If Sistema.ConnectionSide = cnsServer Then OldTraceFlags := Session.TraceFlags;

  try
   If Sistema.ConnectionSide = cnsServer Then Session.TraceFlags := [];

   _DbEspacess.DataBaseName := DataBaseName;
   _DbPessoa.DataBaseName := DataBaseName;

   If FNomeCompleto = '' Then
   Begin
      MessageInfo := 'Não foi informado o nome completo do Usuário';
      Result := False;
   End
   Else
   Begin  //Testar mudar condição
     bCriaUsuario := (fIdusuario.AsFloat <= 0);

   If bCriaUsuario Then
   Begin
      //Cria o PESSOA para o usuário que esta sendo criado
     _DbPessoa.Razaosocial.AsString := FNomeCompleto;
     _DbPessoa.Nome.AsString := FNomeCompleto;
     _DbPessoa.Tipo.AsString := 'F';

     _DbPessoa.Email.AsSTring := FEmail;

     If Not _DbPessoa.Insert Then
     Begin
       MessageInfo := _DbPessoa.MessageInfo;
       Result := False;
       Exit;
     End
     Else
        fIdusuario.AsFloat := _DbPessoa.Idpessoa.AsFloat;
     End;

     //Gera o IDESPACESS para o usuário que está sendo criado
     if not (bCriaUsuario) then
     begin
        _DbPessoa.Idpessoa.AsFloat := FIdPessoa;
        _DbPessoa.LoadFromDb;//Igor Francisco 21/12/2007
         //Cria o PESSOA para o usuário que esta sendo criado
        //_DbPessoa.Razaosocial.AsString := FNomeCompleto;
        //_DbPessoa.Nome.AsString := FNomeCompleto;
        //_DbPessoa.Tipo.AsString := 'F';

        _DbPessoa.Email.AsSTring := FEmail;

        If Not _DbPessoa.Update Then
        Begin
          MessageInfo := _DbPessoa.MessageInfo;
          Result := False;
          Exit;
        End
        Else
           fIdusuario.AsFloat := _DbPessoa.Idpessoa.AsFloat;
     end;

     If Not _DbEspacess.Insert Then
     Begin
       MessageInfo := _DbEspacess.MessageInfo;
       Result := False;
     End
     Else
     Begin
       //Insere o usuário na tabela USUARIOSISTEMA
       fIdespacesso.AsFloat := _DbEspacess.Idespacesso.AsFloat;
       fIdusuario.AsFloat := _DbPessoa.Idpessoa.AsFloat;

       If bCriaUsuario Then
          FSenha.AsString := CriptografarHash( FSenha.AsString, fIdusuario.AsInteger, 15 );

       Result := Inherited Insert;
     End;
   End;

   //Cria o Usuário no Banco
   if not Sistema.UsuarioUnico then
   begin
      If Result And (iTipoBD_Padrao = 0) Then
      Begin

        Result := TCmControlObject(Owner).ExecSQL('CREATE USER CM'+ IdUsuario.AsString +
                                        ' IDENTIFIED BY ' + TCmConectaBanco.GetSenhaUsuario('CM'+ IdUsuario.AsString, Nomeusuario.AsString,True) + ' DEFAULT TABLESPACE DADOS TEMPORARY TABLESPACE TEMP PROFILE DEFAULT');

        If Result Then
          Result := TCmControlObject(Owner).ExecSQL('GRANT "CM_USER" TO "CM'+ IdUsuario.AsString +'"');

        If Not Result Then
           MessageInfo := TCmControlObject(Owner).MessageInfo;
           
      End;
   end;

  finally
    if Sistema.ConnectionSide = cnsServer Then Session.TraceFlags := OldTraceFlags;

    _DbEspacess.Free;
    _DbPessoa.Free;
  end;


end;


procedure TDbUsuariosistema.SetAlteraPessoa(const Value: boolean);
begin
  FAlteraPessoa := Value;
end;

procedure TDbUsuariosistema.SetBloqueado(const Value: TCmDbField);
begin
  FBloqueado := Value;
end;

procedure TDbUsuariosistema.SetBloqueiaAteData(const Value: TCmDbField);
begin
  FBloqueiaAteData := Value;
end;

procedure TDbUsuariosistema.SetDesativado(const Value: TCmDbField);
begin
  FDesativado := Value;
end;

procedure TDbUsuariosistema.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbUsuariosistema.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TDbUsuariosistema.SetFlgausente(const Value: TCmDbField);
begin
  FFlgausente := Value;
end;

procedure TDbUsuariosistema.SetFlgDispFinanc(const Value: TCmDbField);
begin
  FFlgDispFinanc := Value;
end;

// Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
procedure TDbUsuariosistema.SetFlgTipoUsu(const Value: TCmDbField);
begin
  FFlgTipoUsu := Value;
end;

procedure TDbUsuariosistema.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;
// Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186

procedure TDbUsuariosistema.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbUsuariosistema.SetIdPessoa(const Value: extended);
begin
  FIdPessoa := Value;
end;

procedure TDbUsuariosistema.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbUsuariosistema.SetMudarsenha(const Value: TCmDbField);
begin
  FMudarsenha := Value;
end;

procedure TDbUsuariosistema.SetNaomudasenha(const Value: TCmDbField);
begin
  FNaomudasenha := Value;
end;

procedure TDbUsuariosistema.SetNomeCompleto(const Value: String);
begin
  FNomeCompleto := Value;
end;

procedure TDbUsuariosistema.SetNomeusuario(const Value: TCmDbField);
begin
  FNomeusuario := Value;
end;

procedure TDbUsuariosistema.SetSenha(const Value: TCmDbField);
begin
  FSenha := Value;
end;

procedure TDbUsuariosistema.SetSenhaautoriz(const Value: TCmDbField);
begin
  FSenhaautoriz := Value;
end;

procedure TDbUsuariosistema.SetSenhapermanente(const Value: TCmDbField);
begin
  FSenhapermanente := Value;
end;

procedure TDbUsuariosistema.SetValidadesenha(const Value: TCmDbField);
begin
  FValidadesenha := Value;
end;

function TDbUsuariosistema.Update: Boolean;
var
  OldTraceFlags : TTraceFlags;
begin

  If Sistema.ConnectionSide = cnsServer Then OldTraceFlags := Session.TraceFlags;
  Try
   If Sistema.ConnectionSide = cnsServer Then Session.TraceFlags := [];

    Result := Inherited Update;

    //Altera Senha do Usuário no Banco
    if not Sistema.UsuarioUnico then
    begin
       If Result And (iTipoBD_Padrao = 0)  then
       Begin

         Result := TCmControlObject(Owner).ExecSQL('ALTER USER CM'+ Idusuario.AsString +
                                                   ' IDENTIFIED BY ' + TCmConectaBanco.GetSenhaUsuario('CM'+ Idusuario.AsString, Nomeusuario.AsString,True) + ' DEFAULT TABLESPACE DADOS TEMPORARY TABLESPACE TEMP PROFILE DEFAULT');

         If Not Result Then
            MessageInfo := TCmControlObject(Owner).MessageInfo;

       End;
    end;

    if Result And FAlteraPessoa then
    begin
       Result := TCmControlObject(Owner).ExecSQL('UPDATE PESSOA SET NOME = ' + QuotedStr(FNomeCompleto) +
                                                 ' , EMAIL = ' + QuotedStr(FEmail) +
                                                 ', RAZAOSOCIAL = ' + QuotedStr(FNomeCompleto) +
                                                 ' WHERE IDPESSOA = ' + FIdusuario.AsString);

       If Not Result Then
          MessageInfo := TCmControlObject(Owner).MessageInfo;
    end;

  finally
    if Sistema.ConnectionSide = cnsServer Then Session.TraceFlags := OldTraceFlags;
  end;

end;

end.



