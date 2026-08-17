{
Envio de Mensagens
==================

Exemplos de uso:
----------------

  Envio de apenas um e-mail:
  --------------------------
    ConfiguraServidorPeloRegistro( iIdServidor );
    CtrlMensagens.EnviaEMail( 'destinatario@cmsolucoes.com.br', 'Assunto', 'Mensagem' );


  Envio de apenas uma mensagem CM:
  --------------------------------
    CtrlMensagens.EnviaMensagemCM( iIdUsuarioRemetente, iIdUsuarioDestinatario, 'Assunto', 'Mensagem' );


  Envio de um e-mail e uma mensagem CM:
  -------------------------------------
    CtrlMensagens.ConfiguraServidorPeloRegistro( iIdServidor );
    CtrlMensagens.EnviaEMailMensagemCM( 'destinatario@cmsolucoes.com.br', iIdUsuarioRemetente, iIdUsuarioDestinatario, 'Assunto', 'Mensagem' );


  Envio de e-mails mensagens CM em lote:
  --------------------------------------
    ConfiguraServidorPeloRegistro( iIdServidor );
    LimpaMensagens;
    IncluiMensagem( 0, 'destinatario@cmsolucoes.com.br', 'Asssunto', 'Mensagem' );                  //Apenas e-mail
    IncluiMensagem( iIdUsuarioRemetente, '', 'Assunto', 'Mensagem' );                               //Apenas mensagem CM
    IncluiMensagem( iIdUsuarioRemetente, 'destinatario@cmsolucoes.com.br', 'Assunto', 'Mensagem' ); //E-mail e mensagem CM

    IncluiMensagem( iIdUsuarioRemetente, 'destinatario@cmsolucoes.com.br', 'Assunto',               //Exemplo com tags
     SubstituiTags( 'Caro <#NOMEDESTINATARIO>; ' + #13#10 + #13#10 +
     'Favor desconsiderar esta mensagem. É apenas um teste.' + #13#10 + #13#10 +'<#NOMEREMETENTE>',
     ['NOMEDESTINATARIO', 'NOMEREMETENTE' ], ['Fulano', 'Cicrano' ] ) );

    EnviaMensagens( Sistema.IdUsuario );                                                           //Envia todas as mensagens do lote


  Envio de e-mails pelo conexto (apenas para contexto sem configuração própria:
  -----------------------------------------------------------------------------
    EnviaMensagemContexto( iIdUsuarioRemetente, iIdMsgContexto , ['NOMEDESTINATARIO', 'NOMEREMETENTE' ], ['Fulano', 'Cicrano' ] );



Tags
----

  A função SubstituiTags é utilizada para substituir tags por conteúdos da seguinte forma:

    SubstituiTags( <Mensagem>,                                        //Aqui entra o texto pré-definido, com as tags no corpo da mensagem
                   [ '<Tag 1>', '<Tag 2>', '<Tag n>' ]                //Tags a serem substituídos
                   [ '<Conteúdo 1>', '<Conteúdo 2>', '<Conteúdo n>' ] //Conteúdos que substituirão os tags
                 );

  Obs.: As tags comuns (nome do destinatário, data de envio, etc) só são substituídas automaticamente com o uso de EnviaMensagens
        ou da EnviaMensagemContexto.

}

unit uCtrlMensagens;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     IdSMTP, IdMessage, uCtrlMensagemCM, DBClient;

Type

  //Estrutura de mensagem a ser enviada
  TMensagem = record
    iDestinatarioCM    : integer;
    sDestinatarioEMail : string;
    sAssunto           : string;
    sMensagem          : string;
  end;    

  TCtrlMensagens = class(TCmControlObject)
  private

    cdsLocal : TCmClientDataset;

    //Componente de envio de e-mail
    IdSMTP : TIdSMTP;

    //Ctrl de envio de mensagens CM
    _CtrlMensagemCM : TCtrlMensagemCM;

    cdsMensagem : TClientDataset;

    //Array de mensagens a ser enviadas na operação atual
    aMensagens : array of TMensagem;

    FRequerAutenticacao: boolean;
    FPorta: integer;
    FSenha: string;
    FServidor: string;
    FUsuario: string;
    FNomeRemetenteEmail: string;
    procedure SetPorta(const Value: integer);
    procedure SetRequerAutenticacao(const Value: boolean);
    procedure SetSenha(const Value: string);
    procedure SetServidor(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetConectado(const Value: boolean);
    function GetConectado : boolean;
    procedure SetNomeRemetenteEmail(const Value: string);

  protected

    procedure AfterInitialize; Override;

  public

    //Propriedades de conexão com o servidor de e-mails
    property Servidor           : string read FServidor write SetServidor;
    property Usuario            : string read FUsuario write SetUsuario;
    property Senha              : string read FSenha write SetSenha;
    property NomeRemetenteEmail  : string read FNomeRemetenteEmail write SetNomeRemetenteEmail;
    property Porta              : integer read FPorta write SetPorta;
    property RequerAutenticacao : boolean read FRequerAutenticacao write SetRequerAutenticacao;

    //Controla se o servidor de e-mail deve estar conectado ou não
    property Conectado          : boolean read GetConectado write SetConectado;

    constructor Create; override;

    destructor Destroy; override;

    //Recupera os parãmetros de conexão com os dados de um registro
    function ConfiguraServidorPeloRegistro( iIdEmailConexao : integer ) : boolean;

    //Recupera os parãmetros de conexão com os dados de um contexto
    function ConfiguraServidorPeloContexto( iIdMsgContexto : integer ) : boolean;

    //Envia mensagem(ns) para um cotexto específico
    procedure EnviaMensagemContexto( iIdRemetente, iIdMsgContexto : integer; aTags, aConteudos : array of string );

    //Envia um e-mail para um destinatário
    procedure EnviaEMail( sDestinatario, sAssunto, sMensagem : string;
     bAbreFechaConexao : boolean = True );

    //Envia uma mensagem via CorreioCM
    procedure EnviaMensagemCM( iIdUsuarioRemetente, iIdUsuarioDestinatario : integer;
     sAssunto, sMensagem : string );

    //Envia uma mensagem via e-mail E CorreioCM
    procedure EnviaEMailMensagemCM( sDestinatarioEMail : string;
      iIdUsuarioRemetente, iIdUsuarioDestinatario : integer;
      sAssunto, sMensagem : string; bAbreFechaConexao : boolean = True );

    //Limpa todas as mensagens pendentes de envio
    procedure LimpaMensagens;

    //Inclui uma mensagem na lista de pendentes
    procedure IncluiMensagem( iDestinatarioCM    : integer;
                              sDestinatarioEMail : string;
                              sAssunto            : string;
                              sMensagem           : string );

    //Envia mensagens pendentes
    function EnviaMensagens( iIdRemetente : integer = 0; bAbreFechaConexao : boolean = True ) : boolean;

    //Substitui as tags passadas como parâmetro por seus conteúdos
    function SubstituiTags( strTxt : string; aTags, aConteudos : array of string ) : string;

    //Recupera dados de servidor(es) de e-mail
    function DadosServidor( iIdEmailConexao : integer = 0 ) : OLEVariant;

    //Recupera mensagem(ns) pré-definida(s)
    function DadosMsgPreDef( iIdMsgPreDef : integer = 0 ) : OLEVariant;

  end;

implementation

{ TCtrlMensagens }

procedure TCtrlMensagens.AfterInitialize;
begin
  inherited;
  _CtrlMensagemCM.InitializeAs( Self );
  cdsMensagem := _CtrlMensagemCM.CdsMensagem;
end;

function TCtrlMensagens.ConfiguraServidorPeloContexto( iIdMsgContexto: integer): boolean;
begin
  Result := False;
  try

    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket(
     ' select e.* ' +
     ' from   msgcontexto  c, ' +
     '        emailconexao e ' +
     ' where  c.idemailconexao = e.idemailconexao ' +
     '   and  c.idmsgcontexto  = ' + IntToStr( iIdMsgContexto ) );
     
    if cdsLocal.IsEmpty then
      raise Exception.Create( 'Não foi possível encontrar o servidor do contexto ' + IntToStr( iIdMsgContexto ) + '.' );

    IdSMTP.Host     := cdsLocal.FieldByName('SMTPSERVER').AsString;
    IdSMTP.UserId   := cdsLocal.FieldByName('USERNAME').AsString;
    IdSMTP.Password := cdsLocal.FieldByName('PASSWORD').AsString;
    IdSMTP.Port     := cdsLocal.FieldByName('PORTA').AsInteger;
    if cdsLocal.FieldByName('FLGAUTENTIC').AsInteger = 1 then
      IdSMTP.AuthenticationType := atLogin
    else
      IdSMTP.AuthenticationType := atNone;
    FNomeRemetenteEmail := cdsLocal.FieldByName('NOMEEXIBICAO').AsString;

    Result := True;

  except
    On E : Exception Do
    begin
      Result := False;
      exit;
    end;
  end;
end;

function TCtrlMensagens.ConfiguraServidorPeloRegistro( iIdEmailConexao : integer ): boolean;
begin
  Result := False;
  try

    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket( ' select *                ' +
                                    ' from   emailconexao     ' +
                                    ' where  idemailconexao = ' + IntToStr( iIdEmailConexao ) );

    if cdsLocal.IsEmpty then
      raise Exception.Create( 'Não foi possível encontrar o servidor ' + IntToStr( iIdEmailConexao ) + '.' );

    IdSMTP.Host     := cdsLocal.FieldByName('SMTPSERVER').AsString;
    IdSMTP.UserId   := cdsLocal.FieldByName('USERNAME').AsString;
    IdSMTP.Password := cdsLocal.FieldByName('PASSWORD').AsString;
    IdSMTP.Port     := cdsLocal.FieldByName('PORTA').AsInteger;
    if cdsLocal.FieldByName('FLGAUTENTIC').AsInteger = 1 then
      IdSMTP.AuthenticationType := atLogin
    else
      IdSMTP.AuthenticationType := atNone;
    FNomeRemetenteEmail := cdsLocal.FieldByName('NOMEEXIBICAO').AsString;

    Result := True;

  except
    On E : Exception Do
    begin
      Result := False;
      exit;
    end;
  end;   
end;

constructor TCtrlMensagens.Create;
begin
  inherited;
  cdsLocal := TCmClientDataset.Create( nil );
  IdSMTP := TIdSMTP.Create( nil );
  _CtrlMensagemCM := TCtrlMensagemCM.Create;

  FNomeRemetenteEmail := '';

  SetLength( aMensagens, 0 );
end;

function TCtrlMensagens.DadosMsgPreDef(iIdMsgPreDef: integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := ' select * from msgpredef ';
  if iIdMsgPreDef > 0 then
    sSQL := sSQL + ' where idmsgpredef = ' + IntToStr( iIdMsgPreDef );
  Result := GetDataPacket( sSQL );
end;

function TCtrlMensagens.DadosServidor( iIdEmailConexao: integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := ' select * from emailconexao ';
  if iIdEmailConexao > 0 then
    sSQL := sSQL + ' where idemailconexao = ' + IntToStr( iIdEmailConexao );
  Result := GetDataPacket( sSQL );
end;

destructor TCtrlMensagens.Destroy;
begin
  cdsLocal.Free;
  IdSMTP.Free;
  _CtrlMensagemCM.Free;  
  inherited;
end;

procedure TCtrlMensagens.EnviaEMail( sDestinatario, sAssunto, sMensagem: string;
 bAbreFechaConexao : boolean = True );
var
  Mensagem: TIdMessage;
begin
  Mensagem := TIdMessage.Create( nil );
  try
    if bAbreFechaConexao then
      if Conectado then
        Conectado := False;

    Mensagem.Clear;
    Mensagem.From.Address := '"' + FNomeRemetenteEmail + '"';
    Mensagem.Recipients.Add.Address := sDestinatario;
    Mensagem.Subject      := sAssunto;
    Mensagem.Body.Text    := sMensagem;

    if bAbreFechaConexao then
      Conectado := True;

    IdSMTP.Send( Mensagem );

    if bAbreFechaConexao then
      Conectado := False;

  finally
    Mensagem.Free;
  end;
end;

procedure TCtrlMensagens.EnviaEMailMensagemCM( sDestinatarioEMail : string;
  iIdUsuarioRemetente, iIdUsuarioDestinatario: integer;
  sAssunto, sMensagem: string; bAbreFechaConexao: boolean);
begin
  if sDestinatarioEMail <> '' then
    EnviaEMail( sDestinatarioEMail, sAssunto, sMensagem, bAbreFechaConexao );

  if iIdUsuarioDestinatario <> 0 then
    EnviaMensagemCM( iIdUsuarioRemetente, iIdUsuarioDestinatario, sAssunto, sMensagem );
end;


procedure TCtrlMensagens.EnviaMensagemCM(iIdUsuarioRemetente,
  iIdUsuarioDestinatario: integer; sAssunto, sMensagem: string);
begin
  cdsMensagem.Data := GetDataPacket(
   ' select IDMENSAGEM       , ' +
   '        IDREMETENTE      , ' +
   '        IDDESTINATARIO   , ' +
   '        ASSUNTO          , ' +
   '        MENSAGEM         , ' +
   '        LIDA             , ' +
   '        DATAENVIO        , ' +
   '        DATAPROGRAMA     , ' +
   '        TIPODESTINATARIO , ' +
   '        IDMSGPRE           ' +
   ' from   MENSAGEMCM         ' +
   ' where  1 = 2              ' );

  cdsMensagem.Append;
  cdsMensagem.FieldByName('IDREMETENTE').AsFloat       := iIdUsuarioRemetente;
  cdsMensagem.FieldByName('IDDESTINATARIO').AsFloat    := iIdUsuarioDestinatario;
  cdsMensagem.FieldByName('ASSUNTO').AsString          := sAssunto;
  cdsMensagem.FieldByName('MENSAGEM').AsString         := Copy( sMensagem, 1, 4000 );
  cdsMensagem.FieldByName('LIDA').AsInteger            := 0;
  cdsMensagem.FieldByName('DATAENVIO').AsDateTime      := Now;
  cdsMensagem.FieldByName('DATAPROGRAMA').AsDateTime   := Now;
  cdsMensagem.FieldByName('TIPODESTINATARIO').AsString := 'US';
  cdsMensagem.Post;

  _CtrlMensagemCM.ProcessaMensagem( omEnviar, 0, False, True );
end;


procedure TCtrlMensagens.EnviaMensagemContexto( iIdRemetente, iIdMsgContexto : integer; aTags, aConteudos: array of string);
var
  cdsConfig : TCMClientDataset;
  sMsg : string;
  sEndEmail : string;
  iIdDestinatarioCM : integer;
begin
  try
    cdsConfig := TCMClientDataset.Create( nil );

    try
      cdsConfig.Data := GetDataPacket(
       ' select *                    ' +
       ' from   msgpredef        m , ' +
       '        msgcontexto      c , ' +
       '        msgcontextousu   u , ' +
       '        pessoa           p , ' +
       '        emailconexao     e   ' +
       ' where  m.idmsgcontexto    = c.idmsgcontexto  ' +
       '   and  c.flgconfigpropria = 0                ' +
       '   and  c.idmsgcontexto    = u.idmsgcontexto  ' +
       '   and  u.idpessoa         = p.idpessoa       ' +
       '   and  c.idemailconexao   = e.idemailconexao ' +
       '   and  c.idmsgcontexto    =  ' + IntToStr( iIdMsgContexto ) ) ;

      if cdsConfig.IsEmpty then exit;

      ConfiguraServidorPeloRegistro( cdsConfig.FieldByName('IDEMAILCONEXAO').AsInteger );

      sMsg := SubstituiTags( cdsConfig.FieldByName('TEXTO').AsString, aTags, aConteudos );

      LimpaMensagens;
      cdsConfig.First;
      while not cdsConfig.Eof do
      begin
        sEndEmail         := '';
        iIdDestinatarioCM := 0;

        if cdsConfig.FieldByName('FLGTIPOENVIO').AsInteger > 0 then
        begin
          if cdsConfig.FieldByName('FLGTIPOENVIO').AsInteger in [1, 3] then
            sEndEmail := cdsConfig.FieldByName('EMAIL').AsString;
          if cdsConfig.FieldByName('FLGTIPOENVIO').AsInteger in [2, 3] then
            iIdDestinatarioCM := cdsConfig.FieldByName('IDPESSOA').AsInteger;
        end;

        IncluiMensagem( iIdDestinatarioCM,
                        sEndEmail,
                        cdsConfig.FieldByName('ASSUNTOMSG').AsString,
                        sMsg );

        cdsConfig.Next;
      end;

      EnviaMensagens( iIdRemetente );

   except
      On E : Exception do MessageInfo := E.Message;
   end;

  finally
    cdsConfig.Free;
  end;
end;

function TCtrlMensagens.EnviaMensagens( iIdRemetente : integer = 0; bAbreFechaConexao : boolean = True ) : boolean;
var
  i : integer;
  sMsgAux : string;
  sNomeDestinatarioCM : string;
  cdsLocal : TCMClientDataset;
begin

  Result := True;

  cdsLocal := TCMClientDataset.Create( nil );
  try

    //O envio fica dentro de um try..except porque o não envio de uma mensagem
    //não pode ocasionar um erro, mas retornar um boolean
    try

      if bAbreFechaConexao then
      begin
        if Conectado then Conectado := False;
        Conectado := True;
      end;

      //Varre o array de mensagens pendentes
      for i := 0 to High( aMensagens ) do
      begin
        cdsLocal.Data := GetDataPacket( ' select NOME from PESSOA where IDPESSOA = ' + IntToStr( aMensagens[i].iDestinatarioCM ) );
        sNomeDestinatarioCM := cdsLocal.FieldByName('NOME').AsString;

        sMsgAux := aMensagens[i].sMensagem;

        sMsgAux := SubstituiTags( sMsgAux,
                                  [ 'NOMEDESTINATARIO'                          ,
                                    'EMAILDESTINATARIO'                         ,
                                    'NOMEREMETENTE'                             ,
                                    'DATAHORAENVIO'                             ,
                                    'ASSUNTO'                                 ] ,
                                  [ sNomeDestinatarioCM                         ,
                                    aMensagens[i].sDestinatarioEMail            ,
                                    FNomeRemetenteEmail                         ,
                                    FormatDateTime( 'dd/mm/yyyy hh:nn', Now )   ,
                                    aMensagens[i].sAssunto                    ] );

        //Se houver endereço de email, envia-o
        if aMensagens[i].sDestinatarioEMail <> '' then
          EnviaEMail( aMensagens[i].sDestinatarioEMail,
                      aMensagens[i].sAssunto,
                      sMsgAux,
                      False );

        //Se houver ID de destinatário e de remetente, envia mensagem CM
        if ( aMensagens[i].iDestinatarioCM > 0 ) and ( iIdRemetente > 0 ) then
          EnviaMensagemCM( iIdRemetente, aMensagens[i].iDestinatarioCM,
           aMensagens[i].sAssunto, sMsgAux );

      end;

      if bAbreFechaConexao then
        Conectado := False;

    except
      Result := False;
    end;

  finally
    cdsLocal.Free;
  end;

end;

function TCtrlMensagens.GetConectado: boolean;
begin
  Result := IdSMTP.Connected;
end;


procedure TCtrlMensagens.IncluiMensagem(iDestinatarioCM: integer;
  sDestinatarioEMail, sAssunto, sMensagem: string);
begin
  SetLength( aMensagens, length( aMensagens ) + 1 );
  aMensagens[ High( aMensagens ) ].iDestinatarioCM    := iDestinatarioCM;
  aMensagens[ High( aMensagens ) ].sDestinatarioEMail := sDestinatarioEMail;
  aMensagens[ High( aMensagens ) ].sAssunto           := sAssunto;
  aMensagens[ High( aMensagens ) ].sMensagem          := sMensagem;
end;

procedure TCtrlMensagens.LimpaMensagens;
begin
  SetLength( aMensagens, 0 );
end;

procedure TCtrlMensagens.SetConectado(const Value: boolean);
begin
  if Value then
    IdSMTP.Connect
  else
    IdSMTP.Disconnect;
end;

procedure TCtrlMensagens.SetNomeRemetenteEmail(const Value: string);
begin
  FNomeRemetenteEmail := Value;
end;

procedure TCtrlMensagens.SetPorta(const Value: integer);
begin
  FPorta := Value;
end;

procedure TCtrlMensagens.SetRequerAutenticacao(const Value: boolean);
begin
  FRequerAutenticacao := Value;
end;

procedure TCtrlMensagens.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TCtrlMensagens.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

procedure TCtrlMensagens.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;


function TCtrlMensagens.SubstituiTags(strTxt: string; aTags,
  aConteudos: array of string): string;
var
  i : integer;
begin
  if length( aTags ) <> length( aConteudos ) then exit;
  Result := strTxt;
  for i := 0 to high( aTags ) do
    Result := StringReplace( Result, '<#' + aTags[i] + '>', aConteudos[i], [rfReplaceAll, rfIgnoreCase] );
end;

end.

