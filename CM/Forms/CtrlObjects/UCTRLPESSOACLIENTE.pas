{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe de controle do Cadastro de Clientes          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlPessoaCliente;
                              
interface

Uses  SysUtils, Classes, DbClient, uCmControlObject, uCtrlPessoa, uDbEmpresacliente,
      uDbClientepess, uDbForClixAgreg, uDbClixReceb, uDbClixTipoCli, uCMTypes;

Type
  TCtrlPessoaCliente = Class(TCtrlPessoa)
  private
    FCdsEmpresaCliente: TClientDataSet;
    FCdsTiposCli: TClientDataSet;
    FCdsTipoRecebCli: TClientDataSet;
    FCdsImAgregCli: TClientDataSet;
    FCriaSubConta: Boolean;
    procedure SetCdsEmpresaCliente(const Value: TClientDataSet);
    procedure SetCdsImAgregCli(const Value: TClientDataSet);
    procedure SetCdsTipoRecebCli(const Value: TClientDataSet);
    procedure SetCdsTiposCli(const Value: TClientDataSet);
    procedure SetCriaSubConta(const Value: Boolean);
  protected
    _DbEmpresacliente: TDbEmpresacliente;
    _DbClientepess: TDbClientepess;
    _DbForClixAgreg: TDbForClixAgreg;
    _DbClixReceb: TDbClixReceb;
    _DbClixTipoCli: TDbClixTipoCli;

    procedure DoChangeDataBase; Override;

    function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; Override;
    procedure OnCreateAppServer; Override;
    function ExecAppServer(Operacao: TOperacao): Boolean; Override;
  public

    Constructor Create; Override;
    Destructor Destroy; Override;

    property CdsEmpresaCliente: TClientDataSet read FCdsEmpresaCliente write SetCdsEmpresaCliente;
    property CdsTipoRecebCli: TClientDataSet read FCdsTipoRecebCli write SetCdsTipoRecebCli;
    property CdsImAgregCli: TClientDataSet read FCdsImAgregCli write SetCdsImAgregCli;
    property CdsTiposCli: TClientDataSet read FCdsTiposCli write SetCdsTiposCli;
    property CriaSubConta: Boolean read FCriaSubConta write SetCriaSubConta;

    function SelCliente(rIdpessoa: Double): OleVariant;
    function SelEmpresaCliente(rIdpessoa, rIdForCli: Double): OleVariant;

    function SelTipoReceb(rIdPessoa, rIdForCli: Double): OleVariant;
    function SelTipoRecebCli(rIdPessoa, rIdForCli: Double): OleVariant;
    function SelImpAgreg(rIdPessoa, rIdForCli: Double): OleVariant;
    function SelImpAgregCli(rIdPessoa, rIdForCli: Double): Olevariant;
    function SelTipos(rIdForCli: Double): Olevariant;
    function SelTiposCli(rIdForCli: Double): Olevariant;

    function VerificaCodCorresp(sCodCorresp: String; rIdPessoa: Double): Boolean;
    function VerificaCodCorrespHotel(sCodCorresp: String; rIdPessoa, rIdEmpresa: Double): Boolean;

    function SelDadosCliente(rIdEmpresa, rIdForCli: Double; acdsSubTipo, acdsEmpresaCliente,
    acdsTipoReceb, acdsTipoRecebCli, acdsImAgreg, acdsImAgregCli, acdsTipos,
    acdsTiposCli: TCLientDataSet): Boolean;

  end;

implementation

Uses uMidasUtil;

{ TCtrlPessoaCliente }

constructor TCtrlPessoaCliente.Create;
begin
  inherited;
  _DbEmpresacliente := TDbEmpresacliente.Create(self);
  _DbClientepess := TDbClientepess.Create(self);
  _DbForClixAgreg := TDbForClixAgreg.Create(self);
  _DbClixReceb := TDbClixReceb.Create(self);
  _DbClixTipoCli := TDbClixTipoCli.Create(self);

  FCriaSubConta := false;
end;

destructor TCtrlPessoaCliente.Destroy;
begin
  _DbEmpresacliente.Free;
  _DbClientepess.Free;
  _DbForClixAgreg.Free;
  _DbClixReceb.Free;
  _DbClixTipoCli.Free;

  If IsAppServer Then
  Begin
     FCdsEmpresaCliente.Free;
     FCdsTiposCli.Free;
     FCdsTipoRecebCli.Free;
     FCdsImAgregCli.Free;
  End;

  inherited;
end;

procedure TCtrlPessoaCliente.DoChangeDataBase;
begin
  inherited;
  _DbEmpresacliente.DataBaseName := DataBaseName;
  _DbClientepess.DataBaseName := DataBaseName;
  _DbForClixAgreg.DataBaseName := DataBaseName;
  _DbClixReceb.DataBaseName := DataBaseName;
  _DbClixTipoCli.DataBaseName := DataBaseName;
end;

procedure TCtrlPessoaCliente.OnCreateAppServer;
begin
  inherited;
  FCdsEmpresaCliente := TClientDataSet.Create(nil);
  FCdsTiposCli := TClientDataSet.Create(nil);
  FCdsTipoRecebCli := TClientDataSet.Create(nil);
  FCdsImAgregCli := TClientDataSet.Create(nil);
end;

function TCtrlPessoaCliente.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   Try
      If ( Operacao = opApagar ) Then
      Begin
        EmptyCds([CdsSubTipo, CdsEmpresaCliente, CdsTiposCli, CdsTipoRecebCli, CdsImAgregCli]);

        Result := ApplyCds(CdsTiposCli , _DbClixTipoCli, [], [] );
        If Not Result Then Raise Exception.Create(_DbClixTipoCli.MessageInfo);

        Result := ApplyCds(CdsTipoRecebCli , _DbClixReceb, [], [] );
        If Not Result Then Raise Exception.Create(_DbClixReceb.MessageInfo);

        Result := ApplyCds(CdsImAgregCli , _DbForClixAgreg, [], [] );
        If Not Result Then Raise Exception.Create(_DbForClixAgreg.MessageInfo);

        Result := ApplyCds(CdsEmpresaCliente , _DbEmpresacliente, [], [] );
        If Not Result Then Raise Exception.Create(_DbEmpresacliente.MessageInfo);

        Result := ApplyCds(CdsSubTipo , _DbClientepess, [], [] );
        If Not Result Then Raise Exception.Create(_DbClientepess.MessageInfo);
      End
      Else
      Begin
         Result := ApplyCds(CdsSubTipo , _DbClientepess, [_DbPessoa.Idpessoa], [_DbClientepess.Idpessoa] );
         If Not Result Then Raise Exception.Create(_DbClientepess.MessageInfo);

         Result := ApplyCds(CdsEmpresaCliente , _DbEmpresacliente, [_DbPessoa.Idpessoa], [_DbEmpresacliente.IdForCli] );
         If Not Result Then Raise Exception.Create(_DbEmpresacliente.MessageInfo);

         Result := ApplyCds(CdsTiposCli , _DbClixTipoCli, [_DbPessoa.Idpessoa], [_DbClixTipoCli.Idpessoa] );
         If Not Result Then Raise Exception.Create(_DbClixTipoCli.MessageInfo);

         Result := ApplyCds(CdsTipoRecebCli , _DbClixReceb, [_DbPessoa.Idpessoa], [_DbClixReceb.Idpessoa] );
         If Not Result Then Raise Exception.Create(_DbClixReceb.MessageInfo);

         Result := ApplyCds(CdsImAgregCli , _DbForClixAgreg, [_DbPessoa.Idpessoa], [_DbForClixAgreg.Idforcli] );
         If Not Result Then Raise Exception.Create(_DbForClixAgreg.MessageInfo);
      End;
   Except
      On E:Exception Do
      Begin
        Result := false;
        Mensagem := E.Message;
      End;
   End;
end;

function TCtrlPessoaCliente.SelCliente(rIdpessoa: Double): OleVariant;
begin
  _DbClientepess.Idpessoa.AsFloat := rIdpessoa;
  Result := GetDataPacket(_DbClientepess.sSqlSelect);
end;

function TCtrlPessoaCliente.SelEmpresaCliente(rIdpessoa,
  rIdForCli: Double): OleVariant;
begin
  _DbEmpresacliente.IdForCli.AsFloat := rIdForCli;
  _DbEmpresacliente.Idpessoa.AsFloat := rIdpessoa;
  Result := GetDataPacket(_DbEmpresacliente.sSqlSelect);
end;

function TCtrlPessoaCliente.SelImpAgreg(rIdPessoa,
  rIdForCli: Double): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   TIPOAGRE.DESCCUSTAGREG, ' +
                           '   TIPOAGRE.CODTIPOCUSTAGREG ' +
                           ' FROM ' +
                           '  TIPOAGRE, TIPOALTERADOR ' +
                           ' WHERE ' +
                           '   (TIPOAGRE.CODTRATFISCD IN (''B'',''8'',''9'',''A'')) AND ' +
                           '   (((TIPOAGRE.CODTRATFISCD = ''8'') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ((TIPOAGRE.CODTRATFISCD = ''A'') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR (TIPOALTERADOR.ACRESDECRES IS NULL)) AND ' +
                           '   (TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+)) AND ' +
                           '   (TIPOAGRE.CODTIPOCUSTAGREG NOT IN ' +
                           '   (SELECT ' +
                           '     F.CODTIPOCUSTAGREG ' +
                           '    FROM ' +
                           '     FORCLIXAGREG F ' +
                           '    WHERE ' +
                           '     (F.IDFORCLI = ' + FloatToStr(rIdForCli) + ') AND ' +
                           '     (F.IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '     (F.RECPAG = ''R'')))  ');
end;

function TCtrlPessoaCliente.SelImpAgregCli(rIdPessoa,
  rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   T.DESCCUSTAGREG, F.IDPESSOA, F.IDFORCLI, F.CODTIPOCUSTAGREG, ' +
                           '   F.RECPAG ' +
                           ' FROM ' +
                           '  TIPOAGRE T, FORCLIXAGREG F ' +
                           ' WHERE ' +
                           '   (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND ' +
                           '   (F.IDFORCLI = ' + FloatToStr(rIdForCli) + ') AND ' +
                           '   (F.IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '   (F.RECPAG = ''R'') ');
end;

function TCtrlPessoaCliente.SelTipoReceb(rIdPessoa,
  rIdForCli: Double): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT ' +
                           ' FROM ' +
                           '    TIPORECEBDESEMB ' +
                           ' WHERE ' +
                           '    (RECPAG = ''R'') AND ' +
                           '    (IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '    (CODTIPRECDES NOT IN ' +
                           '     (SELECT ' +
                           '        CODTIPRECDES ' +
                           '      FROM ' +
                           '        CLIXRECEB ' +
                           '      WHERE ' +
                           '        (RECPAG = ''R'') AND ' +
                           '        (IDEMPRESA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '        (IDPESSOA  = ' + FloatToStr(rIdForCli) + '))) ');
end;

function TCtrlPessoaCliente.SelTipoRecebCli(rIdPessoa,
  rIdForCli: Double): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    DS.IDCLIXRECEB,DS.CODTIPRECDES,DS.RECPAG,DS.IDPESSOA,DS.IDEMPRESA,TP.DESCRICAO,TP.ANASINT ' +
                           ' FROM ' +
                           '    CLIXRECEB DS,TIPORECEBDESEMB TP ' +
                           ' WHERE ' +
                           '     (DS.RECPAG = ''R'') AND ' +
                           '     (DS.IDEMPRESA = ' + FloatToStr(rIdPessoa) + ') AND ' +
                           '     (DS.IDPESSOA = ' + FloatToStr(rIdForCli) + ')  AND ' +
                           '     (TP.RECPAG = DS.RECPAG) AND ' +
                           '     (TP.IDPESSOA = DS.IDEMPRESA) AND ' +
                           '     (DS.CODTIPRECDES = TP.CODTIPRECDES) ');
end;

function TCtrlPessoaCliente.SelTipos(rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   IDTIPOCLIENTE, DESCRICAO ' +
                           ' FROM ' +
                           '   TIPOCLIENTE ' +
                           ' WHERE ' +
                           '   (IDTIPOCLIENTE NOT IN ' +
                           '    (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + FloatToStr(rIdForCli) + ')) ');
end;

function TCtrlPessoaCliente.SelTiposCli(rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   X.IDPESSOA, X.IDTIPOCLIENTE, T.DESCRICAO ' +
                           ' FROM ' +
                           '   CLIXTIPOCLI X, TIPOCLIENTE T ' +
                           ' WHERE ' +
                           '   (T.IDTIPOCLIENTE = X.IDTIPOCLIENTE) AND ' +
                           '   (X.IDPESSOA = ' + FloatToStr(rIdForCli) + ') ');
end;

procedure TCtrlPessoaCliente.SetCdsEmpresaCliente(
  const Value: TClientDataSet);
begin
  FCdsEmpresaCliente := Value;
end;

procedure TCtrlPessoaCliente.SetCdsImAgregCli(const Value: TClientDataSet);
begin
  FCdsImAgregCli := Value;
end;

procedure TCtrlPessoaCliente.SetCdsTipoRecebCli(
  const Value: TClientDataSet);
begin
  FCdsTipoRecebCli := Value;
end;

procedure TCtrlPessoaCliente.SetCdsTiposCli(const Value: TClientDataSet);
begin
  FCdsTiposCli := Value;
end;

function TCtrlPessoaCliente.VerificaCodCorresp(sCodCorresp: String;
  rIdPessoa: Double): Boolean;
begin
  Result := (Trim(sCodCorresp) = '') OR (Trim(sCodCorresp) = '-');

  If Not Result Then
  Begin
    _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM CLIENTEPESS WHERE RTRIM(CODCLIENTE) = RTRIM(' + QuotedStr(sCodCorresp) + ') AND IDPESSOA <> ' + FloatToStr(rIdPessoa));

    Result := _Cds.IsEmpty;

    If Not Result Then  MessageInfo := 'Código Correspondente já cadastrado';
  End;
end;

function TCtrlPessoaCliente.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaCliente(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data,  CdsEmpresaCliente.Data,
            CdsTipoRecebCli.Data, CdsImAgregCli.Data, CdsTiposCli.Data,
            fCriaSubConta);
end;

function TCtrlPessoaCliente.SelDadosCliente(rIdEmpresa, rIdForCli: Double;
  acdsSubTipo, acdsEmpresaCliente, acdsTipoReceb, acdsTipoRecebCli,
  acdsImAgreg, acdsImAgregCli, acdsTipos,
  acdsTiposCli: TCLientDataSet): Boolean;
Var
   ovSubTipo, ovEmpresaCliente, ovTipoReceb,
   ovTipoRecebCli, ovImAgreg, ovImAgregCli, ovTipos, ovTiposCli: OleVariant;

begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.SelDadosCli(rIdEmpresa, rIdForCli, ovSubTipo,
     ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg, ovImAgregCli, ovTipos, ovTiposCli);


     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo
     Else
     Begin
       aCdsSubTipo.Data := ovSubTipo;
       aCdsEmpresaCliente.Data := ovEmpresaCliente;
       aCdsTipoReceb.Data := ovTipoReceb;
       aCdsTipoRecebCli.Data := ovTipoRecebCli;
       aCdsImAgreg.Data := ovImAgreg;
       aCdsImAgregCli.Data := ovImAgregCli;
       aCdsTipos.Data := ovTipos;
       aCdsTiposCli.Data := ovTiposCli;
     End;
  End
  Else
  Begin
     Try

       aCdsSubTipo.Data := SelCliente(rIdForCli);
       aCdsEmpresaCliente.Data := SelEmpresaCliente(rIdEmpresa, rIdForCli);
       aCdsTipoReceb.Data := SelTipoReceb(rIdEmpresa, rIdForCli);
       aCdsTipoRecebCli.Data := SelTipoRecebCli(rIdEmpresa, rIdForCli);
       aCdsImAgreg.Data := SelImpAgreg(rIdEmpresa, rIdForCli);
       aCdsImAgregCli.Data := SelImpAgregCli(rIdEmpresa, rIdForCli);
       aCdsTipos.Data := SelTipos(rIdForCli);
       aCdsTiposCli.Data := SelTiposCli(rIdForCli);

       Result := True;
     Except
       On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
     End;
  End;
end;

function TCtrlPessoaCliente.VerificaCodCorrespHotel(sCodCorresp: String;
  rIdPessoa, rIdEmpresa: Double): Boolean;
begin
  Result := (Trim(sCodCorresp) = '');

  If Not Result Then
  Begin
    _Cds.Data := GetDataPacket('SELECT IDFORCLI FROM EMPRESACLIENTE WHERE RTRIM(CODCORRESPEMPRESA) = RTRIM(' + QuotedStr(sCodCorresp) + ') AND IDFORCLI <> ' + FloatToStr(rIdPessoa) + ' AND IDPESSOA <> ' + FloatToStr(rIdEmpresa));

    Result := _Cds.IsEmpty;

    If Not Result Then  MessageInfo := 'Código Correspondente Hotel já cadastrado';
  End;
end;

procedure TCtrlPessoaCliente.SetCriaSubConta(const Value: Boolean);
begin
  FCriaSubConta := Value;
  _DbEmpresacliente.CriaSubConta := fCriaSubConta;
end;

end.


