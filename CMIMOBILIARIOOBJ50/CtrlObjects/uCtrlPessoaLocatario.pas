{-------------------------------------------------------------------------------

     OBJETO DE CONTROLE DE PESSOA - LOCATARIO ( MT )

     Módulo          :  Comuns Imobiliário
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  26/09/2002
     Data de Término :  26/09/2002

 FUNÇÕES PUBLICADAS:

     SelecionaLocatario -  Abre o registro de um Locatario
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26442
Responsável : Daniel Simões
Data        : 27/09/2007
Descrição   : Correção no processo de gravação do locatário para gravar, alterar
              e excluir o Tipo de Cliente...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlPessoaLocatario;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbClixTipoCli, uDbLocatario,
     uDbClientePess; // Daniel - 26442

Type TCtrlPessoaLocatario = Class(TCtrlPessoa)
     private
       FCdsTiposCli: TClientDataSet;
       FCdsClientePess: TClientDataSet; // Daniel - 26442

       procedure SetCdsTiposCli(const Value: TClientDataSet);
       procedure SetCdsClientePess(const Value: TClientDataSet); // Daniel - 26442

     protected
       DbLocatario : TDbLocatario;

       _DbClixTipoCli: TDbClixTipoCli;

       _DbClientePess : TDbClientePess; // Daniel - 26442

       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public

       property CdsTiposCli: TClientDataSet read FCdsTiposCli write SetCdsTiposCli;
       property CdsClientePess: TClientDataSet read FCdsClientePess write SetCdsClientePess; // Daniel - 26442

       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaLocatario(const rIdPessoa: Double): OleVariant;
       function    SelecionaForCli   (const rIdPessoa: Double): OLEVariant;
       function    SelTipos(rIdForCli: Double): Olevariant;
       function    SelTiposCli(rIdForCli: Double): Olevariant;
       function    LookupClientePess(const rIdPessoa: Double): OleVariant; // Daniel - 26442
     end;

implementation

{ TCtrlPessoaLocatario }



constructor TCtrlPessoaLocatario.Create;
begin
  inherited;

  DbLocatario    := TDbLocatario.Create( Self );
  _DbClixTipoCli := TDbClixTipoCli.Create( Self );
  _DbClientePess := TDbClientePess.Create( Self ); // Daniel - 26442

end;



destructor TCtrlPessoaLocatario.Destroy;
begin
  FreeAndNil( DbLocatario );
  _DbClixTipoCli.Free;
  _DbClientePess.Free; // Daniel - 26442

  inherited;
end;



procedure TCtrlPessoaLocatario.DoChangeDatabase;
begin
  inherited;

  DbLocatario.DataBaseName    := DataBaseName;
  _DbClixTipoCli.DataBaseName := DataBaseName;
  _DbClientePess.DataBaseName := DataBaseName; // Daniel - 26442
end;

// Daniel - 26442 - Início -----------------------------------------------------
function TCtrlPessoaLocatario.LookupClientePess(const rIdPessoa: Double): OleVariant;
var sSql : String;
begin
  sSql   := '';
  sSql   := 'SELECT * FROM CLIENTEPESS WHERE IDPESSOA = '+FloatToStr(rIdPessoa);
  Result := GetDataPacket(sSql);
end;
// Daniel - 26442 - Fim --------------------------------------------------------

function TCtrlPessoaLocatario.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
// Daniel - 26442 - Início -----------------------------------------------------
{ Alteração na estrutura da rotina abaixo para realizar alterações e exclusões
  de acordo com a soliciação da pendência... }
  // Exclui o registro do Subtipo para deleção
  if ( Operacao = opApagar ) Then begin
    cdsSubTipo.Delete;

    Result := ApplyCds(CdsTiposCli, _DbClixTipoCli, [], [] );
    if not Result then raise Exception.Create(_DbClixTipoCli.MessageInfo);

    Result := ExecSQL('DELETE FROM EMPRESACLIENTE WHERE IDFORCLI = '+_DbPessoa.Idpessoa.AsString);
    if not Result then raise Exception.Create('Erro ao excluir o Locatário.');

    Result := ApplyCds(CdsClientePess, _DbClientePess, [], [] );
    if not Result then raise Exception.Create(_DbClientePess.MessageInfo);

  end else begin
    Result := ApplyCds(CdsClientePess, _DbClientePess, [_DbPessoa.Idpessoa], [_DbClientePess.Idpessoa] );
    if not Result then raise Exception.Create(_DbClientePess.MessageInfo);

    Result := ApplyCds(CdsTiposCli, _DbClixTipoCli, [_DbPessoa.Idpessoa], [_DbClixTipoCli.Idpessoa] );
    if not Result then raise Exception.Create(_DbClixTipoCli.MessageInfo);
  end;

    // Aplica alterações no subtipo
  Result := ApplyCds(CdsSubTipo , DbLocatario, [_DbPessoa.Idpessoa], [DbLocatario.IdLocatario] );
  if not Result then Mensagem := DbLocatario.MessageInfo;
// Daniel - 26442 - Fim --------------------------------------------------------
end;



function TCtrlPessoaLocatario.SelecionaForCli(const rIdPessoa: Double): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT T.IDTIPOCLIENTE,             '+#13+
          '       T.DESCRICAO AS TIPOCLIENTE   '+#13+
          '  FROM TIPOCLIENTE T, CLIENTEPESS C '+#13+
          ' WHERE C.IDPESSOA = ' + FloatToStr( rIdPessoa ) +#13+
          '   AND C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+)';
  Result := GetDataPacket( sSql );
end;



function TCtrlPessoaLocatario.SelecionaLocatario(const rIdPessoa: Double): OleVariant;
begin
  DbLocatario.IdLocatario.AsFloat := rIdPessoa;
  Result := GetDataPacket( DbLocatario.SSqlSelect );
end;



function TCtrlPessoaLocatario.SelTipos(rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   IDTIPOCLIENTE, DESCRICAO ' +
                           ' FROM ' +
                           '   TIPOCLIENTE ' +
                           ' WHERE ' +
                           '   (IDTIPOCLIENTE NOT IN ' +
                           '    (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + FloatToStr(rIdForCli) + ')) ');
end;



function TCtrlPessoaLocatario.SelTiposCli(rIdForCli: Double): Olevariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '   X.IDPESSOA, X.IDTIPOCLIENTE, T.DESCRICAO ' +
                           ' FROM ' +
                           '   CLIXTIPOCLI X, TIPOCLIENTE T ' +
                           ' WHERE ' +
                           '   (T.IDTIPOCLIENTE = X.IDTIPOCLIENTE) AND ' +
                           '   (X.IDPESSOA = ' + FloatToStr(rIdForCli) + ') ');
end;

// Daniel - 26442 - Início -----------------------------------------------------
procedure TCtrlPessoaLocatario.SetCdsClientePess(const Value: TClientDataSet);
begin
  FCdsClientePess := Value;
end;
// Daniel - 26442 - Fim --------------------------------------------------------

procedure TCtrlPessoaLocatario.SetCdsTiposCli(const Value: TClientDataSet);
begin
  FCdsTiposCli := Value;
end;



end.
