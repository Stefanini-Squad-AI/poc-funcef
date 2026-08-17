{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/07/2002                                 }
{                                                       }
{*******************************************************}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Marcio Sanches Spinosa
//Nº SOL......: 149111
//Nº KINTANA..: 1066131
//Data........: 09/01/2013
//Descrição...: Alteração no escopo do relatório, tratamento para substituição
// em tempo de execução das testemunhas e representante entre outros.
//------------------------------------------------------------------------------

unit uCtrlCartaComunicado;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbCarta;

type
  TCtrlCartaComunicado = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbCarta;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListCarta(NumCarta: double): OleVariant;
    function ListMotivo: OleVariant;
    //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
    function CarregarEmpregadosAtivos : OleVariant;
    function getDadosFuncionario(pIdFunc : Integer) : OleVariant;
    //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Fim
    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCartaComunicado }

constructor TCtrlCartaComunicado.Create;
begin
  inherited;
  FDb := TDbCarta.Create(Self);
end;

destructor TCtrlCartaComunicado.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlCartaComunicado.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCartaComunicado.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlCartaComunicado.ListCarta(NumCarta: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(NumCarta=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  NUMCARTA, IDMOTIVO, DATACARTA, ASSUNTO, TEXTO'+CR_LF+
    'FROM'+CR_LF+
    '  CARTA'+CR_LF+
    IFF(NumCarta=-1, 'WHERE (1 = 2)',
      IFF(NumCarta=0, '', 'WHERE'+CR_LF+
        '  (NUMCARTA = ' +FloatToStr(NumCarta)+ ')')));
end;

function TCtrlCartaComunicado.ListMotivo: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDMOTIVO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    'WHERE'+CR_LF+
    '  (GRUPOMOTIVO IN (''A'',''D''))');
end;

function TCtrlCartaComunicado.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
function TCtrlCartaComunicado.CarregarEmpregadosAtivos: OleVariant;
begin
   Result := GetDataPacket('SELECT F.IDPESSOA, P.NOME FROM FUNCIONARIO F ' +
                                   ' INNER JOIN PESSOA P ON (P.IDPESSOA = F.IDPESSOA) ' +
                                   ' INNER JOIN SITFUNC SF ON (SF.IDSITFUNC = F.IDSITFUNC) ' +
                                   ' WHERE F.DATADESLIGAMENTO IS NULL AND SF.TIPOSIT = ''A''' +
                                   ' ORDER BY P.NOME');
end;

function TCtrlCartaComunicado.getDadosFuncionario(
  pIdFunc: Integer): OleVariant;
begin
  Result := GetDataPacket('SELECT P.IDPESSOA, P.NOME, DP.IDDOCUMENTO, DP.NUMDOCUMENTO, DP.ORGAO, DP.IDESTADO, E.CODESTADO, ' +
                          'DECODE(DP.IDDOCUMENTO, 2, ''CPF'', ''RG'') AS TIPODOCUMENTO FROM DOCPESSOA DP '+
                          ' INNER JOIN PESSOA P ON (P.IDPESSOA = DP.IDPESSOA) '+
                          ' LEFT JOIN ESTADO E ON (E.IDESTADO = DP.IDESTADO) '+
                          ' WHERE DP.IDDOCUMENTO IN (2,11) AND P.IDPESSOA = ' + IntToStr(pIdFunc) +
                          ' ORDER BY P.IDPESSOA ');
end;
//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Fim
end.
