{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 25/03/2002                             }
{                                                       }
{*******************************************************}
// ATUALIZAÇÕES
{--------------------------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Alteração na Function ListaTipoDocPessoa - Inclusão de campos novos
--------------------------------------------------------------------------------------------------
Nº SOL......: 250389/17574
Nº PPM..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------------------------
Rotina......: cdsDet, _DbTipoDocPessoaxmasc,  RecuperaMascaras e deletaFilho
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foram acrescentadas as rotinas para o cadastro de multiplas mascaras no cadastro de
			  documentação.
-------------------------------------------------------------------------------------------------- }
unit uCtrlTipoDocPessoa;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbTipoDocPessoa,uDbTipoDocPessoaxmasc;

Type
  TCtrlTipoDocPessoa = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbTipoDocPessoa: TDbTipoDocPessoa;
    _DbTipoDocPessoaxmasc: TDbTipoDocPessoaxmasc;
    FcdsDet: TClientDataSet;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsDet(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property cdsDet: TClientDataSet read FcdsDet write SetcdsDet;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    function ListaTipoDocPessoa( IdTipoDocPessoa: Double = 0; sTipo: String = ''; iOrdem: Integer = 0 ): OleVariant;
    Function Gravar: Boolean;
    function RecuperaMascaras (sCodDocumento: double): OLEVariant;
    procedure deletaFilho (sCodDocumento: string);
    function VerificaDocAssociado(sCodDocumento: String): Integer; // Michelle Mota - SIG 22093
    End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlTipoDocPessoa.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipoDocPessoa( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbTipoDocPessoa, [], [] );
        Msg    := _DbTipoDocPessoa.MessageInfo;
		//Vinicius Maciel SOL138283 Kintana 840489
        If Not Result Then
           Raise Exception.Create( Msg );
        Result := ApplyCds( fcdsDet, _DbTipoDocPessoaxmasc, _DbTipoDocPessoa.IDDOCUMENTO, _DbTipoDocPessoaxmasc.IDDOCUMENTO );
        Msg    := _DbTipoDocPessoaxmasc.MessageInfo;
		//Vinicius Maciel SOL138283 Kintana 840489 - FIM
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

constructor TCtrlTipoDocPessoa.Create;
begin
  inherited;
  _DbTipoDocPessoa := TDbTipoDocPessoa.Create(Self);
  _DbTipoDocPessoaxmasc := TDbTipoDocPessoaxmasc.Create(Self);//Vinicius Maciel SOL138283 Kintana 840489
  FCds := TClientDataSet.Create( nil );
  FCdsDet:= TClientDataSet.Create( nil );//Vinicius Maciel SOL138283 Kintana 840489
end;

destructor TCtrlTipoDocPessoa.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;
	//Vinicius Maciel SOL138283 Kintana 840489
  if FcdsDet.Active Then
     FcdsDet.Close;
	//Vinicius Maciel SOL138283 Kintana 840489 - FIM
  Fcds := nil;
  Fcds.Free;
	//Vinicius Maciel SOL138283 Kintana 840489
  FcdsDet :=nil;
  FcdsDet.Free;
//Vinicius Maciel SOL138283 Kintana 840489 - FIM
  _DbTipoDocPessoa.Free;
  _DbTipoDocPessoaxmasc.Free;//Vinicius Maciel SOL138283 Kintana 840489
  inherited;
end;

procedure TCtrlTipoDocPessoa.DoChangeDataBase;
begin
  inherited;
  _DbTipoDocPessoa.DataBaseName      := DatabaseName;
  _DbTipoDocPessoaxmasc.DataBaseName := DatabaseName;//Vinicius Maciel SOL138283 Kintana 840489
end;

function TCtrlTipoDocPessoa.ListaTipoDocPessoa( IdTipoDocPessoa: Double;
         sTipo: String; iOrdem: Integer ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT T.OBRIGAUF, T.OBRIGAORGAO, T.OBRIGAEMISSAO, T.NOMEDOCUMENTO, ' +
         'T.MASCARA, T.IDREGRA, T.IDDOCUMENTO, T.FLGOBRIGAVALIDADE, T.DOCCHAVE, ' +
         'T.FISICAJURIDICA, R.NOMEREGRA ' +
         //Vinicius Maciel SOL138283 Kintana 840489
         ', T.FLGMULTIPLAMASCARA , T.OBRIGAPRMHAB, T.OBRIGACATG' +    //Higor Nayde Nº SOL250389/17574 NºPPM992385
          //Vinicius Maciel SOL138283 Kintana 840489 - FIM
         {Início - Michelle Mota - SIG 22093}
         ', T.EXIBEUF, T.EXIBEORGAO, T.EXIBEEMISSAO ' +
         ', T.EXIBEVALIDADE, T.EXIBEPRMHAB, T.EXIBECATG ' +
         ', T.EXIBEPAIS, T.OBRIGAPAIS ' +
         {Término - Michelle Mota - SIG 22093}
         ' FROM TIPODOCPESSOA T, REGRA R ' +
         'WHERE ';

  If UpperCase( sTipo ) <> '' Then
     Sql := Sql + '( T.FISICAJURIDICA = ' + QuotedStr( UpperCase( sTipo ) ) + ' OR ' +
                  '  T.FISICAJURIDICA = ' + QuotedStr( 'A' ) + ' ) AND ';

  If IdTipoDocPessoa <> 0 Then
     Sql := Sql + 'T.IDDOCUMENTO = ' + FloatToStr( IdTipoDocPessoa ) + ' AND ';

  Sql := Sql + 'T.IDREGRA = R.IDREGRA(+) ';

  Case iOrdem Of
       0: Sql := Sql + 'ORDER BY T.NOMEDOCUMENTO';
       1: Sql := Sql + 'ORDER BY T.IDDOCUMENTO';
  End;

  Result := GetDataPacket( Sql );
end;

procedure TCtrlTipoDocPessoa.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;
//Vinicius Maciel SOL138283 Kintana 840489
procedure TCtrlTipoDocPessoa.SetcdsDet(const Value: TClientDataSet);
begin
  FcdsDet := Value;
end;



procedure TCtrlTipoDocPessoa.deletaFilho (sCodDocumento: string);
var
sSQL : string;
begin
  sSQL := 'DELETE FROM TIPODOCPESSOAXMASC WHERE IDDOCUMENTO = ' + QuotedStr(sCodDocumento);
  ExecSQL(sSQL);
end;

function TCtrlTipoDocPessoa.RecuperaMascaras (sCodDocumento: double): OLEVariant;
var
	sSQL: string;
begin
	sSQL:= 'Select TX.IDTIPODOCPESSOAXMASC,' +
        'TX.IDDOCUMENTO, ' +
        'TX.NOME, ' +
        'TX.MASCARA' +
        ' FROM TIPODOCPESSOAXMASC TX';
        If sCodDocumento <> 0 Then
	sSQL:=sSQL +' WHERE TX.IDDOCUMENTO = '+ FloatToStr(sCodDocumento);
	Result:= GetDataPacket (sSQL);
end;
//Vinicius Maciel SOL138283 Kintana 840489 - FIM

// Início -Darivaldo Alencar/ Michelle Mota - SIG 22093
function TCtrlTipoDocPessoa.VerificaDocAssociado(sCodDocumento: String): Integer;
var
    sSQL: string;
    CdsAux : TClientDataSet;
begin
    sSQL:= 'SELECT '+
    ' COUNT(1) AS QTDE ' +
    ' FROM DOCPESSOA DC';

    If (sCodDocumento <> '0') Then
       sSQL:=sSQL +' WHERE DC.IDDOCUMENTO = '+ (sCodDocumento);

    CdsAux := TClientDataSet.Create( nil );
    CdsAux.Data := GetDataPacket(sSQL);

    Result := CdsAux.FieldByName('QTDE').AsInteger;

    Freeandnil(CdsAux);
end;
// Término - Darivaldo Alencar/ Michelle Mota - SIG 22093
end.

