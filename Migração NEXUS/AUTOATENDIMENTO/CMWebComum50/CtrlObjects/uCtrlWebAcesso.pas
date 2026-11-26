{
--------------------------------------------------------------------------------
Pendência   : SOL 170664 Kintana 1519740
Responsável : Fanuel Marinho
Data        : 14/03/2012
Descrição   : Apresenta erro na tela DADOS PESSOAIS
--------------------------------------------------------------------------------
Pendência   : SOL 161750 Kintana 1367563
Responsável : Fanuel Junior
Data        : 21/07/2011
Descrição   : Ajustar o update da senha e a apresentação da tela
--------------------------------------------------------------------------------
Pendência   : SOL 148511 KINTANA 1044664
Responsável : Fanuel Junior
Data        : 02/12/2010
Descrição   : Alterar a SQL do'SelecionaWebAcesso' para retornar o login-pessoa
              do registro selecionado
--------------------------------------------------------------------------------
Pendência   : SOL 147119 KINTANA 1011511
Responsável : BRUNO AZEVEDO
Data        : 09/11/2010
Descrição   : Verificar também o IDTITULAR na alteração de senhas.
--------------------------------------------------------------------------------
Pendência   : SOL 142368 KINTANA 915921
Responsável : BRUNO AZEVEDO
Data        : 30/08/2010
Descrição   : Ao criar um novo login, verificar a existência pelo IDTITULAR.
--------------------------------------------------------------------------------
Pendência   : SOL 142745 KINTANA 916306
Responsável : BRUNO AZEVEDO
Data        : 27/08/2010
Descrição   : Ajuste na inclusão de novos participantes no auto atendimento.
--------------------------------------------------------------------------------
}
unit uCtrlWebAcesso;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes, uDbWebAcesso,
     JCLStrings, uCmCrypto, uCmFileUtils;

Type
  TCtrlWebAcesso = class(TCmControlObject)
  private
    FCdsWebAcesso: TCMClientDataSet;
    FDbWebAcesso: TDbWebAcesso;
    procedure SetCdsWebAcesso(const Value: TCMClientDataSet);
    procedure SetDbWebAcesso(const Value: TDbWebAcesso);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebAcesso : TDbWebAcesso read FDbWebAcesso write SetDbWebAcesso;
    property CdsWebAcesso : TCMClientDataSet read FCdsWebAcesso write SetCdsWebAcesso;

    function SelecionaWebAcesso( iIdPessoa : integer; iIdTitular : integer ) : OleVariant;
    function GravaWebAcesso : Boolean;

    //Seleciona pelo login
    function SelecionaPorLogin( sLoginPessoal : string ) : OleVariant;

    //Verifica se a pessoa é (ou foi) participante de planos previdenciários
    function Participante( iIdPessoa : integer ) : boolean;

    //Seleciona todos os titulares do qual determinada pessoa é dependente
    function TitularDepend( iIdPessoa : integer ) : OLEVariant;

    //Seleciona todos os titulares do qual determinada pessoa é beneficiário
    function TitularBenef( iIdPessoa : integer ) : OLEVariant;

    //Seleciona todos os registros
    function SelecionaTodos : OleVariant;

    //Seleciona todos que não possuem senha
    function SelecionaSemSenha : OleVariant;

    //Seleciona pela query
    function SelecionaPorQuery( sQry : string ) : OleVariant;

    //Seleciona ID, nome e senha (pelo login), para o Auto-Atendimento
    function SelecionaDadosAA( sLoginPessoal : string  ): OleVariant;

    //Seleciona login e nome (pelo id)
    function SelecionaLoginNome( iIdPessoa, iIdTitular : integer  ): OleVariant;

    //Grava senha
    function GravaSenha( iIdPessoa: integer; sLogin, sSenha, sLembrete : string; iIdUsuario : integer; bCripto : boolean ) : Boolean;

    //Recupera matricula
    function RecuperaMatricula( iIdPessoa : integer ) : String;

    //Recupera dados na conexão com o AutoAtendimento
    function RecuperaDadosConexao( iIdPessoa, iIdTitular: integer ) : OLEVariant;

    //Recupera data de nascimento
    function RecuperaDataNasc( iIdPessoa : integer ) : TDateTime;

    //Recupera data de nascimento
    function RecuperaAcessoCentral : OleVariant;

    //Retorna os campos de configuração necessários à Central
    function DadosWebConfiguracao : OleVariant;

    //Recupera o nome do usuário
    function NomeUsuario( iIdUsuario : integer ) : OleVariant;

    //Seleciona dados de mala-direta pelo login
    function MalaDiretaPorLogin( sLoginPessoal : string ) : OleVariant;

    //Seleciona dados de mala-direta de todos os registros
    function MalaDiretaTodos : OleVariant;

    //Seleciona dados de mala-direta de todos os registros não exportados
    function MalaDiretaNaoExportados : OleVariant;

    //Seleciona dados de mala-direta pela query
    function MalaDiretaPorQuery( sQry : string ) : OleVariant;

    // pendência 15548
    // Grava Senha e Login
    function GravaLoginSenha(piIdPessoa, piIdUsuario : integer; psLogin,
                             psSenha, psLembrete : String; piFlgStatus : integer;
                             pbCripto, pbExiste, pbAlteraSenha : Boolean;
                             piIdTitular: Integer = 0) : Boolean;

    //Altera a quantidade de tentativas de acesso.
    //Modo: 0 - zera a quantidade; 1 - incrementa a quantidade
    function AlteraQtdeAcessos( iIdPessoa : integer; Modo : integer; iNumSenhaBlq : integer ) : boolean;

    // pendência 15548
    function recuperaInscricao(pIdpessoa : integer): String;
    function excluiAcesso(pIdpessoa : integer): Boolean;

    //Registra exportação de senha para o participante
    function RegistraExportacao( iIdPessoa : integer ) : boolean;


  published

end;

implementation

{ TCtrlWebAcesso }

constructor TCtrlWebAcesso.Create;
begin
  inherited;
  FDbWebAcesso  := TDbWebAcesso.Create( Self );
end;

destructor TCtrlWebAcesso.Destroy;
begin
  FDbWebAcesso.Free;
  if IsAppServer then FCdsWebAcesso.Free;
  inherited;
end;

procedure TCtrlWebAcesso.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebAcesso.DataBaseName    := DataBaseName
  else
    FDbWebAcesso.dbADOConnection := dbADOConnection;
end;

function TCtrlWebAcesso.GravaWebAcesso: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebAcesso( CdsWebAcesso.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebAcesso, FDbWebAcesso, [], [] );

      Msg := FDbWebAcesso.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrlWebAcesso.OnCreateAppServer;
begin
  inherited;
  FCdsWebAcesso := TCMClientDataSet.Create( nil );
end;

function TCtrlWebAcesso.SelecionaWebAcesso( iIdPessoa : integer ; iIdTitular : integer ) : OleVariant;
var
   sSql: string;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebAcesso( iIdPessoa )
  else
  begin
 //    FDbWebAcesso.IdPessoa.AsInteger := iIdPessoa;
 //   Result := GetDataPacket( FDbWebAcesso.SSqlSelect );
      //Fanuel Junior
      sSql := ' SELECT  SENHAPESSOAL, LOGINPESSOAL, IDPESSOA, ' +
              ' DTALTERA, IDUSUARIO, FLGSTATUS, '  +
              ' NUMTENTACESS, DTULTEXPORT, LEMBRETE ' +
              ' FROM WEBACESSO WHERE IDPESSOA = '+IntToStr(iIdPessoa) +
              ' AND IDTITULAR =  '+IntToStr(iIdTitular);

      Result := GetDataPacket( sSql );
   end;
end;

procedure TCtrlWebAcesso.SetCdsWebAcesso(
  const Value: TCMClientDataSet);
begin
  FCdsWebAcesso := Value;
end;

procedure TCtrlWebAcesso.SetDbWebAcesso(
  const Value: TDbWebAcesso);
begin
  FDbWebAcesso := Value;
end;

function TCtrlWebAcesso.SelecionaPorLogin( sLoginPessoal: string): OleVariant;
begin
  Result := GetDataPacket( ' select IDPESSOA,      ' +
                           '        LOGINPESSOAL,  ' +
                           '        SENHAPESSOAL   ' +
                           '   from WEBACESSO      ' +
                           '  where upper( LOGINPESSOAL ) = ' + QuotedStr( UpperCase( sLoginPessoal ) ) );
end;

function TCtrlWebAcesso.SelecionaSemSenha: OleVariant;
begin
  Result := GetDataPacket( ' select   IDPESSOA,            ' +
                           '          LOGINPESSOAL,        ' +
                           '          SENHAPESSOAL         ' +
                           ' from     WEBACESSO            ' +
                           ' where    SENHAPESSOAL is null ' +
                           ' order by LOGINPESSOAL         ' );
end;

function TCtrlWebAcesso.SelecionaTodos: OleVariant;
begin
  Result := GetDataPacket( ' select   IDPESSOA,     ' +
                           '          LOGINPESSOAL, ' +
                           '          SENHAPESSOAL  ' +
                           ' from     WEBACESSO     ' +
                           ' order by LOGINPESSOAL  ' );
end;

function TCtrlWebAcesso.SelecionaDadosAA(sLoginPessoal: string): OleVariant;
begin
  Result := GetDataPacket( ' select     ps.IDPESSOA,                     ' +
                           '            ps.NOME,                         ' +
                           '            w.SENHAPESSOAL,                  ' +
                           '            w.FLGSTATUS,                     ' +
                           '            w.IDTITULAR                      ' + //BRUNO AZEVEDO SOL KINTANA
                           '   from     PESSOA       ps,                 ' +
                           '            WEBACESSO    w                   ' +
                           '  where     ps.IDPESSOA     = w.IDPESSOA     ' +
                           '    and     upper( w.LOGINPESSOAL ) = ' + QuotedStr( UpperCase( sLoginPessoal) ) );
end;

function TCtrlWebAcesso.SelecionaLoginNome(iIdPessoa, iIdTitular: integer): OleVariant;
begin
  Result := GetDataPacket( ' select    w.LOGINPESSOAL,               ' +
                           '           p.NOME,                       ' +
                           '           w.SENHAPESSOAL,               ' +
                           '           w.LEMBRETE                    ' +
                           '  from     WEBACESSO    w,               ' +
                           '           PESSOA       p                ' +
                           ' where     p.IDPESSOA   = w.IDPESSOA     ' +
                           '   and     p.IDPESSOA   = ' + IntToSTr( iIdPessoa ) +
                           '   and     w.IDTITULAR  = ' + IntToSTr( iIdTitular ) ); //BRUNO AZEVEDO SOL 142368 KINTANA 915921
end;

function TCtrlWebAcesso.GravaSenha( iIdPessoa: integer; sLogin, sSenha, sLembrete: string; iIdUsuario : integer; bCripto : boolean ): Boolean;
var
  sSQL, sAux : string;
  sSenhaFinal, sSenhaAux : string;
  CMCrypto : TCMCrypto;
  iPos : integer;
  cdsLocal : TCmClientDataSet;
  iIdTitular: Integer; //BRUNO AZEVEDO SOL 147119 KINTANA 1011511
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarSenha( iIdPessoa, sSenha );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    CmCrypto := TCmCrypto.Create;
    try

      try
        Result := False;

        StartTransaction;

        //Valida caracteres
        sSenhaAux := UpperCase( trim( sSenha ) );
        for iPos := 1 to length( sSenhaAux ) do
        begin
          if Pos( sSenhaAux[iPos], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890/-_.@' ) <= 0 then
          begin
            if sLogin <> '' then
              sAux := #13#10 + 'Login do usuário: ' + sLogin
            else
              sAux := '';
            raise Exception.Create( 'Caractere inválido na composição da senha: ' + sSenhaAux[iPos] + sAux );
          end;
        end;

        sSenhaFinal := StrPadRight( sSenha, 20, ' ' );

        if bCripto then
          sSenhaFinal := CMCrypto.CMEncryptStr( sSenhaFinal,
           '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' );

        //BRUNO AZEVEDO SOL 147119 KINTANA 1011511
        cdsLocal := TCmClientDataSet.Create( nil );
        try
          cdsLocal.Data := GetDataPacket(
           ' select idtitular from webacesso ' +
           '  where IDPESSOA     = ' + IntToStr( iIdPessoa ) +
           '    AND LOGINPESSOAL = ' + QuotedStr( sLogin ));
           
          iIdTitular := cdsLocal.FieldByName('IDTITULAR').AsInteger;

          cdsLocal.Close;
        finally
          cdsLocal.Free;
        end;
        //BRUNO AZEVEDO SOL 147119 KINTANA 1011511

        sSQL := ' update WEBACESSO                                        ' +
                ' set    SENHAPESSOAL = ' + QuotedStr( sSenhaFinal ) + ', ' +
                '        LEMBRETE     = ' + QuotedStr( sLembrete   ) + ', ' +
                '        IDUSUARIO    = ' + IntToStr( iIdUsuario   ) + ', ' +
                '        DTALTERA     = sysdate                         , ' +
                '        NUMTENTACESS =  0,                               ' +
                '        FLGSTATUS    =  0                                ' +
                ' where  IDPESSOA     = ' + IntToStr( iIdPessoa )           +
                //BRUNO AZEVEDO SOL 147119 KINTANA 1011511
                '   and  IDTITULAR    = ' + IntToStr( iIdTitular );

        Result := ExecSQL( sSQL );

        Commit;
      except
        On E : Exception Do
        begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
        end;
      end;

    finally
      CmCrypto.Free;
    end;

  end;

end;

function TCtrlWebAcesso.RecuperaMatricula(iIdPessoa: integer): String;
var
  cdsLocal : TCmClientDataSet;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' select decode( d.MATRICULA, null, e.MATRICULA, d.MATRICULA ) as MATRICULA ' +
     ' from   DEPENTIT  d,                                                       ' +
     '        ELEGPATRO e                                                        ' +
     ' where  d.IDPESSOA = e.IDPESSOA (+)                                        ' +
     '   and  d.IDPESSOA = ' + IntToStr( iIdPessoa )                               +
     //Pendência 25797 - 11/07/2007
     ' order by decode(d.IDDEPENDENCIA, ''PRP'', 0, 1) ' );
     //Fim Pendência 25797

    Result := cdsLocal.FieldByName('MATRICULA').AsString;

    cdsLocal.Close;
  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebAcesso.RecuperaDataNasc(iIdPessoa: integer): TDateTime;
var
  cdsLocal : TCmClientDataSet;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' select DATANASC      ' +
     ' from   PESSOAFISICA  ' +
     ' where  IDPESSOA =    ' + IntToStr( iIdPessoa ) );

    if not cdsLocal.FieldByName('DATANASC').IsNull then
      Result := cdsLocal.FieldByName('DATANASC').AsDateTime
    else
      Result := 0;

    cdsLocal.Close;
  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebAcesso.RecuperaAcessoCentral: OleVariant;
begin
  Result := GetDataPacket(
   ' select WEBBASE,                ' +
   '        WEBLOGIN,               ' +
   '        WEBSENHA                ' +
   ' from   PARAMCENTRALAP          ' );
end;

function TCtrlWebAcesso.DadosWebConfiguracao: OleVariant;
begin
  Result := GetDataPacket( ' select SENHACRIPTO      ' +
                           '   from WEBCONFIGURACAO  ' );
end;

function TCtrlWebAcesso.NomeUsuario( iIdUsuario : integer ): OleVariant;
begin
  Result := GetDataPacket( ' select NOMEUSUARIO      ' +
                           '   from USUARIOSISTEMA   ' +
                           '  where IDUSUARIO = ' + IntToStr( iIdUsuario ) );
end;

function TCtrlWebAcesso.MalaDiretaPorLogin( sLoginPessoal: string ): OleVariant;
begin
  Result := GetDataPacket(
   ' select p.IDPESSOA,                      ' +
   '        p.NOME,                          ' +
   '        e.LOGRADOURO,                    ' +
   '        e.NUMERO,                        ' +
   '        e.COMPLEMENTO,                   ' +
   '        e.BAIRRO,                        ' +
   '        c.NOME as CIDADE,                ' +
   '        s.CODESTADO as ESTADO,           ' +
   '        e.CEP,                           ' +
   '        c.NUMSEED,                       ' +
   '        w.LOGINPESSOAL,                  ' +
   '        w.SENHAPESSOAL,                  ' +
   '        w.DTULTEXPORT                    ' +
   '   from WEBACESSO      w,                ' +
   '        PESSOA         p,                ' +
   '        ENDPESS        e,                ' +
   '        CIDADES        c,                ' +
   '        ESTADO         s                 ' +
   '  where p.IDPESSOA     = w.IDPESSOA      ' +
   '    and p.IDPESSOA     = e.IDPESSOA  (+) ' +
   '    and e.IDCIDADES    = c.IDCIDADES (+) ' +
   '    and c.IDESTADO     = s.IDESTADO  (+) ' +
   '    and upper( w.LOGINPESSOAL ) = ' + QuotedStr( UpperCase( sLoginPessoal ) ) +
   '  order by p.IDPESSOA                    ' );
end;

function TCtrlWebAcesso.MalaDiretaTodos: OleVariant;
begin
  Result := GetDataPacket(
   ' select p.IDPESSOA,                      ' +
   '        p.NOME,                          ' +
   '        e.LOGRADOURO,                    ' +
   '        e.NUMERO,                        ' +
   '        e.COMPLEMENTO,                   ' +
   '        e.BAIRRO,                        ' +
   '        c.NOME as CIDADE,                ' +
   '        s.CODESTADO as ESTADO,           ' +
   '        e.CEP,                           ' +
   '        c.NUMSEED,                       ' +
   '        w.LOGINPESSOAL,                  ' +
   '        w.SENHAPESSOAL,                  ' +
   '        w.DTULTEXPORT                    ' +
   '   from WEBACESSO      w,                ' +
   '        PESSOA         p,                ' +
   '        ENDPESS        e,                ' +
   '        CIDADES        c,                ' +
   '        ESTADO         s                 ' +
   '  where p.IDPESSOA     = w.IDPESSOA      ' +
   '    and p.IDPESSOA     = e.IDPESSOA  (+) ' +
   '    and e.IDCIDADES    = c.IDCIDADES (+) ' +
   '    and c.IDESTADO     = s.IDESTADO  (+) ' +
   '  order by p.IDPESSOA                    ' );
end;

function TCtrlWebAcesso.MalaDiretaPorQuery(sQry: string): OleVariant;
begin
  Result := GetDataPacket(
   ' select p.IDPESSOA,                      ' +
   '        p.NOME,                          ' +
   '        e.LOGRADOURO,                    ' +
   '        e.NUMERO,                        ' +
   '        e.COMPLEMENTO,                   ' +
   '        e.BAIRRO,                        ' +
   '        c.NOME as CIDADE,                ' +
   '        s.CODESTADO as ESTADO,           ' +
   '        e.CEP,                           ' +
   '        c.NUMSEED,                       ' +
   '        w.LOGINPESSOAL,                  ' +
   '        w.SENHAPESSOAL,                  ' +
   '        w.DTULTEXPORT                    ' +
   '   from WEBACESSO      w,                ' +
   '        PESSOA         p,                ' +
   '        ENDPESS        e,                ' +
   '        CIDADES        c,                ' +
   '        ESTADO         s                 ' +
   '  where p.IDPESSOA     = w.IDPESSOA      ' +
   '    and p.IDPESSOA     = e.IDPESSOA  (+) ' +
   '    and e.IDCIDADES    = c.IDCIDADES (+) ' +
   '    and c.IDESTADO     = s.IDESTADO  (+) ' +
   '    and upper( w.LOGINPESSOAL ) in (' + UpperCase( sQry ) + ') ' +
   '  order by p.IDPESSOA                    ' );
end;

function TCtrlWebAcesso.SelecionaPorQuery(sQry: string): OleVariant;
begin
  Result := GetDataPacket( ' select IDPESSOA,                        ' +
                           '        LOGINPESSOAL,                    ' +
                           '        SENHAPESSOAL                     ' +
                           '   from WEBACESSO                        ' +
                           '  where LOGINPESSOAL in ( ' + sQry + ' ) ' );
end;

function TCtrlWebAcesso.GravaLoginSenha(piIdPessoa, piIdUsuario: integer;
                                        psLogin, psSenha, psLembrete: String;
                                        piFlgStatus : integer;
                                        pbCripto, pbExiste, pbAlteraSenha: Boolean;
                                        piIdTitular: Integer = 0): Boolean;
var
  sSenhaFinal, sSenhaAux, sSenha, sSql : string;
  CMCrypto : TCMCrypto;
  iPos : integer;
begin
  result := true;
  sSenha := psSenha;
  sSql := '';
  CmCrypto := TCmCrypto.Create;
  try
    try
      StartTransaction;
      if (pbCripto) and (sSenha <> '') then
      begin
        sSenhaAux := UpperCase( trim( sSenha ) );
        for iPos := 1 to length( sSenhaAux ) do
        begin
          if Pos( sSenhaAux[iPos], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890/-_.@' ) <= 0 then
            raise Exception.Create( 'Caractere inválido na composição da senha: ' + sSenhaAux[iPos] );
        end;

        sSenhaFinal := StrPadRight( sSenha, 20, ' ' );

        if pbCripto then
          sSenhaFinal := CMCrypto.CMEncryptStr( sSenhaFinal,
           '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' );
        sSenha := sSenhaFinal;
      end;

      if (pbExiste) then
      begin
        sSql := sSql + ' UPDATE WEBACESSO SET LOGINPESSOAL = ' + quotedStr(psLogin);
        if pbAlteraSenha then
          sSql := sSql + ', SENHAPESSOAL = '   + quotedStr(sSenha);
        sSql := sSql +   ', LEMBRETE = '       + quotedStr(psLembrete);
        //Fanuel Junior SOL161750 Kintana1367563
        //sSql := sSql +   ', DTALTERA = '       + 'TO_DATE(' + quotedStr(DateToStr(date)) + ', ''DD/MM/YYYY'')';
        sSql := sSql +   ', DTALTERA =   SYSDATE ';
        sSql := sSql +   ', IDUSUARIO = '      + intToStr(piIdUsuario);
        sSql := sSql +   ', FLGSTATUS = '      + intToStr(piFlgStatus);
        sSql := sSql +   ', NUMTENTACESS = 0 ';
        sSql := sSql +   ' WHERE IDPESSOA = '  + intToStr(piIdPessoa);
        //BRUNO AZEVEDO SOL 142368 KINTANA 915921
        if (piIdTitular > 0) then begin
          sSql := sSql +   ' AND IDTITULAR = '  + intToStr(piIdTitular);
        end;
        //BRUNO AZEVEDO SOL 142368 KINTANA 915921
      end
      else
      begin
        sSql := sSql + ' INSERT INTO WEBACESSO (IDTITULAR, IDPESSOA, LOGINPESSOAL, ';
        if pbAlteraSenha then
          sSql := sSql + ' SENHAPESSOAL, ';
        sSql := sSql + ' LEMBRETE, DTALTERA, IDUSUARIO, FLGSTATUS, NUMTENTACESS ) VALUES (';
        sSql := sSql + intToStr(piIdTitular)+' ,' + intToStr(piIdPessoa)+' ,' + quotedStr(psLogin) +' ,';
        if pbAlteraSenha then
          sSql := sSql + quotedStr(sSenha)  +', ';

        //BRUNO AZEVEDO SOL 142745 KINTANA 916306
        sSql := sSql + quotedStr(psLembrete) + ', (SYSDATE)' + ' ,'+  //Fanuel Junior SOL161750 Kintana1367563
                       intToStr(piIdUsuario) +', ' + intToStr(piFlgStatus) + ', 0 )';
        
      end;

      execSql(sSql);
      Commit;
    except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;

  finally
    CmCrypto.Free;
  end;

end;

function TCtrlWebAcesso.recuperaInscricao(pIdpessoa: integer): String;
var
  cdsLocal : TCmClientDataSet;
begin
  Result := '';
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    //Pendência 26167 - 09/10/2007
    cdsLocal.Data := GetDataPacket(' SELECT V.INSCRICAONUMERO FROM VWPARTICIPDEPEN V, '+
                                   ' PARTPREVPLAN P ' +
                                   ' WHERE V.IDPESSOA = ' + IntToStr( pIdPessoa ) +
                                   ' AND V.IDPESSOA = P.IDPESSOA ' +
                                   ' AND V.IDPLANOPREV = P.IDPLANOPREV ' +
                                   //Pendência 26167 - 22/10/2007
                                   ' AND P.INSCRICAONUMERO = V.INSCRICAONUMERO ' +
                                   ' AND P.INSCRICAODATA = (SELECT MAX(INSCRICAODATA) ' +
                                   ' FROM PARTPREVPLAN ' +
                                   ' WHERE IDPESSOA = P.IDPESSOA) ' +
                                   ' ORDER BY DECODE(V.IDDEPENDENCIA, ''PRP'', 0, 1) ');
    //Fim Pendência 26167

    Result := cdsLocal.FieldByName('INSCRICAONUMERO').AsString;

    cdsLocal.Close;
  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebAcesso.excluiAcesso(pIdpessoa: integer): Boolean;
begin
  try
    StartTransaction;
    ExecSql('DELETE FROM WEBACESSO WHERE IDPESSOA = ' +intToStr(pIdpessoa));
    result := true;
    commit;
  except
    On E : Exception Do
    begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;

//Fanuel Marinho SOL170664 Kintana1519740
function TCtrlWebAcesso.RecuperaDadosConexao(iIdPessoa, iIdTitular: integer) : OLEVariant;
begin
  Result := GetDataPacket(
   ' select decode( MATDEP, null, MATRICULA, MATDEP ) as MATRICULA,                          ' +
   '        INSCRICAONUMERO                                                                  ' +
   ' from   ( select MATRICULA, IDPESSOA                                                     ' +
   '          from   ELEGPATRO                                                               ' +
   '          where  IDPESSOA     = ' + IntToStr( iIdPessoa )                                  +
   '           and   DATAADMISSAO = ( select max( DATAADMISSAO )                             ' +
   '                                  from     ELEGPATRO                                     ' +
   '                                  where    IDPESSOA = ' + IntToStr( iIdPessoa ) + ' ) )  ELEGPATRO, ' +
   '        ( select INSCRICAONUMERO                                                         ' +
   '          from   PARTPREVPLAN                                                            ' +
   '          where  IDPESSOA      = ' + IntToStr( iIdTitular )                                 +
   '           and   INSCRICAODATA = ( select max( INSCRICAODATA )                           ' +
   '                                  from     PARTPREVPLAN                                  ' +
   '                                  where    IDPESSOA = ' + IntToStr( iIdTitular ) + ' ) ) X, ' +
   '        ( select MATRICULA as MATDEP  , IDPESSOA                                         ' +
   '          from   DEPENTIT                                                                ' +
   '          where  IDPESSOA = ' + IntToStr( iIdPessoa ) + '                                ' +
   //BRUNO AZEVEDO SOL KINTANA
   '            AND  IDTITULAR = ' + IntToStr( iIdTitular ) + '                              ' +
   //BRUNO AZEVEDO SOL KINTANA
   {Pendência 23553 - 17/10/2006}
   '          order by decode( IDDEPENDENCIA, ''PRP'', ''   '', IDDEPENDENCIA ) ) DEPENTIT  ' +
   '          WHERE ELEGPATRO.IDPESSOA(+)  = DEPENTIT.IDPESSOA ' );
   {Fim Pendência 23553}
end;


function TCtrlWebAcesso.AlteraQtdeAcessos( iIdPessoa : integer; Modo: integer; iNumSenhaBlq : integer ): boolean;
var
  cdsLocal : TCMClientDataset;
  iQtde : integer;
  sQtde, sStatus : string;
begin
  Result := False;

  sStatus := '';

  if Modo = 0 then
    sQtde := '0'
  else
  begin

    cdsLocal := TCMClientDataset.Create( nil );
    try
      cdsLocal.Data := GetDataPacket(
                        ' select NUMTENTACESS from WEBACESSO where IDPESSOA = ' + IntToStr( iIdPessoa ) );

      iQtde := cdsLocal.FieldByName('NUMTENTACESS').AsInteger + 1;

      if ( iQtde = iNumSenhaBlq ) and ( iNumSenhaBlq > 0 ) then
      begin
        sStatus := ' , FLGSTATUS = 1 ';
        Result := True;
      end;

      sQtde := IntToStr( iQtde );

    finally
      cdsLocal.Free;
    end;

  end;

  ExecSQL( ' update WEBACESSO                               ' +
           ' set    NUMTENTACESS = ' + sQtde                  +
           sStatus                                            +
           ' where  IDPESSOA     = ' + IntToStr( iIdPessoa ) );
end;

function TCtrlWebAcesso.RegistraExportacao(iIdPessoa: integer): boolean;
begin
  Result := ExecSQL( ' update WEBACESSO             ' +
                     ' set    DTULTEXPORT = sysdate ' +
                     ' where  IDPESSOA    = ' + IntToStr( iIdPessoa ) );
end;

function TCtrlWebAcesso.MalaDiretaNaoExportados: OleVariant;
begin
  Result := GetDataPacket(
   ' select p.IDPESSOA,                      ' +
   '        p.NOME,                          ' +
   '        e.LOGRADOURO,                    ' +
   '        e.NUMERO,                        ' +
   '        e.COMPLEMENTO,                   ' +
   '        e.BAIRRO,                        ' +
   '        c.NOME as CIDADE,                ' +
   '        s.CODESTADO as ESTADO,           ' +
   '        e.CEP,                           ' +
   '        c.NUMSEED,                       ' +
   '        w.LOGINPESSOAL,                  ' +
   '        w.SENHAPESSOAL,                  ' +
   '        w.DTULTEXPORT                    ' +
   '   from WEBACESSO      w,                ' +
   '        PESSOA         p,                ' +
   '        ENDPESS        e,                ' +
   '        CIDADES        c,                ' +
   '        ESTADO         s                 ' +
   '  where p.IDPESSOA     = w.IDPESSOA      ' +
   '    and p.IDPESSOA     = e.IDPESSOA  (+) ' +
   '    and e.IDCIDADES    = c.IDCIDADES (+) ' +
   '    and c.IDESTADO     = s.IDESTADO  (+) ' +
   '    and w.DTULTEXPORT  is null           ' +
   '  order by p.IDPESSOA                    ' );
end;


function TCtrlWebAcesso.TitularDepend( iIdPessoa: integer ) : OLEVariant;
begin
  Result := GetDataPacket( ' select IDTITULAR                          ' +
                           ' from   DEPENTIT                           ' +
                           ' where  IDPESSOA <> IDTITULAR              ' +
                           '   and  IDPESSOA = ' + IntToStr( iIdPessoa ) );
end;

function TCtrlWebAcesso.TitularBenef(iIdPessoa: integer): OLEVariant;
begin
  Result := GetDataPacket( ' select IDTITULAR                          ' +
                           ' from   BENEFBFCIARIO                      ' +
                           ' where  IDPESSOA <> IDTITULAR              ' +
                           '   and  IDPESSOA = ' + IntToStr( iIdPessoa ) );
end;


function TCtrlWebAcesso.Participante( iIdPessoa : integer ) : boolean;
var
  cds : TCMClientDataSet;
begin
  cds := TCMClientDataSet.Create( nil );
  try

    cds.Data := GetDataPacket(
     ' select IDPESSOA                           ' +
     ' from   PARTPREVPLAN                       ' +
     ' where  IDPESSOA = ' + IntToStr( iIdPessoa ) );

    Result := not cds.IsEmpty;

  finally
    cds.Free;
  end;
end;

end.

