{--------------------------------------------------------------------------------------------------
Pendência   : SOL 193131 KINTANA 1886224
Responsável : Higor Nayde
Data        : 31/05/2013
Descrição   :  Incluir campo denominado "Quantidade de dias" e exibi-lo na grid da funcionalidade
---------------------------------------------------------------------------------------------------
Pendência   : SIG 122182
Responsável : Ewerton Beltramini
Data        : 14/02/2022
Descrição   :  Incluir campo denominado "Quantidade de Anos" e exibi-lo na grid da funcionalidade
---------------------------------------------------------------------------------------------------
}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAdvertenciaSuspensao;

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uDbHstSitFunc, Wwquery, uDataBase, DbClient,
   {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

type
  TCtrlAdvertenciaSuspensao = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListAdvertenciaSuspensao(IdPessoa: double): OleVariant;
    procedure Salvar(pCDs : TCMClientDataSet);
    procedure InserirAdvertencia(pCds : TCMClientDataSet);
    function AtualizarDados(pCds : TCMClientDataSet) : Boolean;
    Function LerSequencia( pTabela : String ) : integer;
    procedure ApagarAdvertencia(pStrIDADvertencia : string);


  end;

implementation

uses uFuncoesUteis;

{ TCtrlAdvertenciaSuspensao }

constructor TCtrlAdvertenciaSuspensao.Create;
begin
inherited;
end;

destructor TCtrlAdvertenciaSuspensao.Destroy;
begin
  inherited;
end;

procedure TCtrlAdvertenciaSuspensao.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlAdvertenciaSuspensao.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlAdvertenciaSuspensao.Gravar: boolean;
begin
//  if (ConnectionSide = cnsClient) then
//  begin
//    Result := Connection.AppServer.Gravar(FCdsAdvertenciaSuspensao.Data);
//    if not(Result) then
//      MessageInfo := Connection.AppServer.MessageInfo;
//  end
//  else
//  begin
//    try
//      Result := ApplyCds(FCdsAdvertenciaSuspensao, FDbAdvertenciaSuspensao, [], []);
//      if not(Result) then
//        MessageInfo := FDbAdvertenciaSuspensao.MessageInfo;
//    except
//      on E: Exception do
//      begin
//        Result := false;
//        MessageInfo := E.Message;
//      end;
//    end;
//  end;
end;

function TCtrlAdvertenciaSuspensao.ListAdvertenciaSuspensao(
  IdPessoa: double): OleVariant;
begin
   Result := GetDataPacket('SELECT IDADVERTSUSP, '+
                                   'IDPESSOA, '+
                                   'DECODE(TIPO, ''A'', ''Advertência'',''S'',''Suspensão'',''R'',''Apuração de Responsabilidade'', '''', null)  as TIPO, ' +
                                   'DATAATO, ' +
                                   'DATAADVSUSP, ' +
                                   'QUANTDIAS, ' + //higor SOL 193131 KINTANA 1886224
                                   'QUANTANOS, ' + //Ewerton Beltramini 14/02/2022 - SIG 122182
                                   'MOTIVO '+
                           'FROM ADVERTSUSP '+
                           'WHERE IDPESSOA = ' + FloatToStr(IdPessoa));
end;

procedure TCtrlAdvertenciaSuspensao.InserirAdvertencia(pCds : TCMClientDataSet);
  var sSQl : string;
      pQry : TwwQuery;
begin

   pQry := TwwQuery.Create(nil);
   pQry.DatabaseName := 'BaseDados';

   pQry.Close;
   pQry.SQL.Clear;       //higor SOL 193131 KINTANA 1886224
   pQry.SQL.Add('INSERT INTO ADVERTSUSP VALUES ( :pId , :pIdPessoa, :pTipo, :pDataAto, :pDataSusp, :pMotivo, :pQuantDias, :pQuantAnos)');  //Ewerton Beltramini 14/02/2022 - SIG 122182
   pQry.Params.ParamByName('pId').DataType         := ftInteger;
   pQry.Params.ParamByName('pIdPessoa').DataType   := ftInteger;
   pQry.Params.ParamByName('pTipo').DataType       := ftString;
   pQry.Params.ParamByName('pDataAto').DataType    := ftDate;
   pQry.Params.ParamByName('pDataSusp').DataType   := ftDate;
   pQry.Params.ParamByName('pMotivo').DataType     := ftString;
   pQry.Params.ParamByName('pQuantDias').DataType  := ftInteger;   //higor SOL 193131 KINTANA 1886224
   pQry.Params.ParamByName('pQuantAnos').DataType  := ftInteger;   //Ewerton Beltramini 14/02/2022 - SIG 122182

   pQry.Params.ParamByName('pId').Value            := LerSequencia('ADVERTSUSP');
   pQry.Params.ParamByName('pIdPessoa').Value      := pCds.FieldByName('IDPESSOA').AsInteger;
   pQry.Params.ParamByName('pTipo').Value          := pCds.FieldByName('TIPO').AsString;
   pQry.Params.ParamByName('pDataAto').Value       := pCds.FieldByName('DATAATO').AsDateTime;
   pQry.Params.ParamByName('pDataSusp').Value      := pCds.FieldByName('DATAADVSUSP').AsDateTime;
   pQry.Params.ParamByName('pMotivo').Value        := pCds.FieldByName('MOTIVO').AsString;
   pQry.Params.ParamByName('pQuantDias').Value     := pCds.FieldByName('QUANTDIAS').AsInteger;  //higor SOL 193131 KINTANA 1886224
   pQry.Params.ParamByName('pQuantAnos').Value     := pCds.FieldByName('QUANTANOS').AsInteger;  //Ewerton Beltramini 14/02/2022 - SIG 122182
   pQry.ExecSQL;

   FreeAndNil(pQry);
end;

function TCtrlAdvertenciaSuspensao.LerSequencia(pTabela: String): Integer;
var oCds :   TCMClientDataSet;
begin

  oCds := TCMClientDataSet.Create(nil);

  oCds.Data := GetDataPacket(' SELECT NVL(MAX(IDADVERTSUSP),0) + 1 AS ID FROM ADVERTSUSP ');
  Result := oCds.FieldByName('ID').AsInteger;
end;

function TCtrlAdvertenciaSuspensao.AtualizarDados(
  pCds: TCMClientDataSet): Boolean;
var qry : TwwQuery;
begin
  qry := TwwQuery.Create(nil);
  qry.DatabaseName := 'BaseDados';

  qry.Close;
  qry.SQL.Clear;  //higor SOL 193131 KINTANA 1886224
  qry.SQL.Add('UPDATE ADVERTSUSP SET DATAATO = :PDATAATO, TIPO = :PTIPO, DATAADVSUSP = :PDATAADVSUSP, QUANTDIAS = :PQUANTDIAS, QUANTANOS = :PQUANTANOS, MOTIVO = :PMOTIVO WHERE IDADVERTSUSP = :PIDADVERTSUSP');    //Ewerton Beltramini 14/02/2022 - SIG 122182
  qry.Params.ParamByName('PDATAATO').DataType := ftDate;
  qry.Params.ParamByName('PDATAADVSUSP').DataType := ftDate;
  qry.Params.ParamByName('PQUANTDIAS').DataType := ftInteger;
  qry.Params.ParamByName('PQUANTANOS').DataType := ftInteger;     //Ewerton Beltramini 14/02/2022 - SIG 122182
  qry.Params.ParamByName('PMOTIVO').DataType := ftString;
  qry.Params.ParamByName('PIDADVERTSUSP').DataType := ftInteger;
  qry.Params.ParamByName('PTIPO').DataType := ftString;

  qry.Params.ParamByName('PDATAATO').Value        := pCds.FieldByName('DATAATO').AsDateTime;
  qry.Params.ParamByName('PDATAADVSUSP').Value    := pCds.FieldByName('DATAADVSUSP').AsDateTime;
  qry.Params.ParamByName('PQUANTDIAS').Value   := pCds.FieldByName('QUANTDIAS').AsInteger; //higor SOL 193131 KINTANA 1886224
  qry.Params.ParamByName('PQUANTANOS').Value   := pCds.FieldByName('QUANTANOS').AsInteger; //Ewerton Beltramini 14/02/2022 - SIG 122182
  qry.Params.ParamByName('PMOTIVO').Value         := pCds.FieldByName('MOTIVO').AsString;
  qry.Params.ParamByName('PIDADVERTSUSP').Value   := pCds.FieldByName('IDADVERTSUSP').AsInteger;
  qry.Params.ParamByName('PTIPO').Value   := pCds.FieldByName('TIPO').AsString;

  qry.ExecSQL;

  FreeAndNil(qry);

end;

procedure TCtrlAdvertenciaSuspensao.Salvar(pCDs : TCMClientDataSet);
begin
  if (pCDs.FieldByName('IDADVERTSUSP').AsInteger = 0) then
    InserirAdvertencia(pCDs)
  else
    AtualizarDados(pCDs);
end;

procedure TCtrlAdvertenciaSuspensao.ApagarAdvertencia(
  pStrIDADvertencia : string);
var qry : TwwQuery;
begin
  qry := TwwQuery.Create(nil);
  qry.DatabaseName := 'BaseDados';

  qry.Close;
  qry.Sql.Clear;
  qry.SQL.Add('DELETE ADVERTSUSP WHERE IDADVERTSUSP IN ('+ pStrIDADvertencia + ')');
  qry.ExecSQL;

  FreeAndNil(qry);

end;


end.
