{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 25/02/2002                             }
{                                                       }
{*******************************************************}
{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina ......: ListaUnidNegocioAtivas
SOL..........: 163982/6901
Kintana......: 1472467
Data.........: 01/11/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi criada esta rotina para retornar apenas aas atividades ativas.
--------------------------------------------------------------------------------
Rotina ......: ListaUnidNegocio
SOL..........: 163982
Kintana......: 1404974
Data.........: 20/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi alterado o select para retornar também o campo ATIVO e foram
               criadas as rotinas : ListaAtividades, recuperaAtividadePerd e
               carregaAtividade.
--------------------------------------------------------------------------------}

unit uCtrlUnidNegocio;

interface

Uses DB, uDataBase, dbclient, sysutils, wwQuery, provider, uCmControlObject,
     UCmDbObject, uDbUnidNegocio,
     uCMClientDataSet; //Vinicius Maciel - SOL 163982 KTN 1404974

Type
  { tapSoSinteticaAP => Somente as Ativ/Proj Sinteticas
    tapSoAnaliticaAP    => Somente as Ativ/Proj Analiticas
    tapAmbos => Todas as Ativ/Proj
  }
  TTipoAtivProj = (tapSoSinteticaAP, tapSoAnaliticaAP, tapAmbos);
  { toapCodigo  => Ordernar as Ativ/Proj por codigo
    toapNome    => Ordernar as Ativ/Proj por nome
  }
  TTipoOrdemAtivProj = (toapCodigo, toapNome);

  TCtrlUnidNegocio = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
     //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUnidNegocio: TDbUnidNegocio;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    function carregaAtividade(sCodAtividade: String): OleVariant;  //Vinicius Maciel - SOL 163982 KTN 1404974



 public
    Property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    Constructor Create; Override;
    Destructor  Destroy;Override;
    Function ListaUnidNegocio(idEmpresa: Double; iUnidNegoc: Double = 0;
             sUneCodigo: String = ''; TipoAtivProj: TTipoAtivProj = tapAmbos;
     //Vinicius Maciel - SOL 163982/6901 KTN 1472467
            // TipoOrdemAtivProj: TTipoOrdemAtivProj = toapNome): OleVariant;
             TipoOrdemAtivProj: TTipoOrdemAtivProj = toapNome; sAtivo : String = '' ): OleVariant;
    Function ListaUnidNegocioAtivas(idEmpresa: Double): OleVariant;
    //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
    function ListaUnidNegocioLike( idEmpresa: Double; sUneCodigo: String ): OleVariant;
    Function Gravar: Boolean;
    function recuperaAtividadePerd(sCodAtividade: String): String;
    function ListaAtividades(idEmpresa: Double): OleVariant;
  end;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

procedure TCtrlUnidNegocio.DoChangeDataBase;
begin
  inherited;
  _DbUnidNegocio.DatabaseName := DataBaseName;
end;

constructor TCtrlUnidNegocio.Create;
begin
  inherited;
  _DbUnidNegocio := TDbUnidNegocio.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlUnidNegocio.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbUnidNegocio.Free;

  inherited;
end;

function TCtrlUnidNegocio.ListaUnidNegocio( idEmpresa: Double; iUnidNegoc: Double;
         sUneCodigo: String; TipoAtivProj: TTipoAtivProj;
         //Vinicius Maciel - SOL 163982/6901 KTN 1472467
         //TipoOrdemAtivProj: TTipoOrdemAtivProj): OleVariant;
         TipoOrdemAtivProj: TTipoOrdemAtivProj; sAtivo : String ): OleVariant;
         //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
var
  sSQl: String;         
begin
  sSql := ' SELECT IDPESSOA, UNIDNEGOC, NOME, UNETIPO, UNECODIGO, IDUSUARIO ' +
//Vinicius Maciel - SOL 163982 KTN 1404974
          ' , ATIVO ' +
//Vinicius Maciel - SOL 163982 KTN 1404974  - Fim
            ' FROM UNIDNEGOCIO ' +
           ' WHERE (IDPESSOA = ' + FloatToStr( IdEmpresa ) + ') ';

  If iUnidNegoc <> 0 Then
     sSql := sSql + ' AND (UNIDNEGOC = ' + FloatToStr( iUnidNegoc ) + ') ';

  If sUneCodigo <> '' Then
     sSql := sSql + ' AND (UNECODIGO = ' + QuotedStr( sUneCodigo ) + ') ';

  Case TipoAtivProj Of
       tapSoSinteticaAP: sSql := sSql + ' AND (UNETIPO = ''S'') ';
       tapSoAnaliticaAP: sSql := sSql + ' AND (UNETIPO = ''A'') ';
  End;

  if sAtivo <> '' then
  sSql := sSql + ' AND (ATIVO = ' + QuotedStr( sAtivo ) + ') '; //Vinicius Maciel - SOL 163982 KTN 1404974

  Case TipoOrdemAtivProj Of
       toapCodigo: sSql := sSql + 'ORDER BY UNECODIGO';
       toapNome  : sSql := sSql + 'ORDER BY NOME';
  End;

  Result := GetDataPacket( sSql );
end;

function TCtrlUnidNegocio.ListaUnidNegocioLike( idEmpresa: Double;
         sUneCodigo: String ): OleVariant;
var
  sSQl: String;
begin
  sSql := 'SELECT UNECODIGO ' +
            'FROM UNIDNEGOCIO ' +
           'WHERE IDPESSOA = ' + FloatToStr( IdEmpresa ) +
            ' AND UNECODIGO <> ' + QuotedStr( sUneCodigo ) +
            ' AND UNECODIGO LIKE ' + QuotedStr( sUneCodigo + '%' ) +
          ' ORDER BY UNECODIGO';
  Result := GetDataPacket( sSql );
end;

function TCtrlUnidNegocio.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarUnidNegocio( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbUnidNegocio, [], [] );
        Msg    := _DbUnidNegocio.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;


//Vinicius Maciel - SOL 163982 KTN 1404974
function TCtrlUnidNegocio.ListaAtividades( idEmpresa: Double): OleVariant;
var
  sSQl: String;
begin
  sSql := 'SELECT IDPESSOA, UNIDNEGOC, NOME, UNETIPO, UNECODIGO, IDUSUARIO ' +
            'FROM UNIDNEGOCIO ' +
           'WHERE (IDPESSOA = ' + FloatToStr( IdEmpresa ) + ') '+
           'AND UNETIPO = '+QuotedStr('A') + ' AND ATIVO = '+QuotedStr('S');
  Result := GetDataPacket( sSql );
end;
//Vinicius Maciel - SOL 163982 KTN 1404974 - Fim

procedure TCtrlUnidNegocio.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

//Vinicius Maciel - SOL 163982 KTN 1404974
function TCtrlUnidNegocio.recuperaAtividadePerd(sCodAtividade : String) : String;
var
    CdsAux : TCMClientDataSet;
begin
    CdsAux := TcmClientDataSet.create(nil);
    CdsAux.Data := carregaAtividade(sCodAtividade);
    Result := CdsAux.FieldByName('Nome').asString;
    CdsAux.Free;
end;


function TCtrlUnidNegocio.carregaAtividade(sCodAtividade : String) :OleVariant;
var
    sSQl : String;
begin
    sSQL := 'SELECT NOME FROM UNIDNEGOCIO WHERE UNIDNEGOC = '+sCodAtividade;
    result := GetDataPacket(sSQL);
end;
//Vinicius Maciel - SOL 163982 KTN 1404974 - FIM

//Vinicius Maciel - SOL 163982/6901 KTN 1472467
function TCtrlUnidNegocio.ListaUnidNegocioAtivas( idEmpresa: Double): OleVariant;
var
  sSQl: String;         
begin
    sSql := ' SELECT IDPESSOA, UNIDNEGOC, NOME, UNETIPO, UNECODIGO, IDUSUARIO ' +
            ' , ATIVO ' +
            ' FROM UNIDNEGOCIO ' +
            ' WHERE (IDPESSOA = ' + FloatToStr( IdEmpresa ) + ') ';
    sSql := sSql + ' AND (UNETIPO = ''A'') ';
    sSQL := sSql + ' AND (ATIVO = ''S'') ';
    sSql := sSql + 'ORDER BY NOME';
  Result := GetDataPacket( sSql );
end;
//Vinicius Maciel - SOL 163982/6901 KTN 1472467  - FIM
end.

