{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHstAlterCad;

interface

uses SysUtils, Forms, Db, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uDbHstEndPess, uDbHstAltCad;

type
  TCtrlHstAlterCad = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHstEndPess: TDbHstEndPess;
    FDbHstAltCad: TDbHstAltCad;    

    FCdsHstEndPess: TCMClientDataSet;
    FCdsHstAltCad: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListMestre(IdPessoa: double): OleVariant;
    function ListHstAltCad(IdPessoa: double): OleVariant;
    function ListHstEndPess(IdPessoa: double): OleVariant;
    function ListCodAltCad: OleVariant;

    function Gravar: boolean;

    property CdsHstEndPess: TCMClientDataSet read FCdsHstEndPess write FCdsHstEndPess;
    property CdsHstAltCad: TCMClientDataSet read FCdsHstAltCad write FCdsHstAltCad;    
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHstAlterCad }

constructor TCtrlHstAlterCad.Create;
begin
  inherited;
  FDbHstEndPess := TDbHstEndPess.Create(Self);
  FDbHstAltCad := TDbHstAltCad.Create(Self);
end;

destructor TCtrlHstAlterCad.Destroy;
begin
  FDbHstEndPess.Free;
  FDbHstAltCad.Free;
  if (IsAppServer) then
  begin
    FCdsHstEndPess.Free;
    FCdsHstAltCad.Free;
  end;
  inherited;
end;

procedure TCtrlHstAlterCad.OnCreateAppServer;
begin
  inherited;
  FCdsHstEndPess := TCMClientDataSet.Create(nil);
  FCdsHstAltCad := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHstAlterCad.DoChangeDataBase;
begin
  inherited;
  FDbHstEndPess.DataBaseName := DataBaseName;
  FDbHstAltCad.DataBaseName := DataBaseName;
end;

function TCtrlHstAlterCad.ListMestre(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  (''  '' || P.NOME) AS NOME, P.IDPESSOA, ST.TIPOSIT, F.MATRICULA,'+CR_LF+
    '  TO_CHAR(DECODE(ST.TIPOSIT,NULL,'+CR_LF+
    '    ' +QuotedStr(('Indefinida'))+ ','+CR_LF+
    '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
    '      ''A'',' +QuotedStr(('(Ativo)'))+ ','+CR_LF+
    '      ''F'',' +QuotedStr(('(Afastado)'))+ ','+CR_LF+
    '      ''D'',' +QuotedStr(('(Demitido)'))+ CR_LF+
    '    ))'+CR_LF+
    '  )) AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FUNCIONARIO F, SITFUNC ST'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (P.IDPESSOA  = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDSITFUNC = ST.IDSITFUNC)');
end;

function TCtrlHstAlterCad.ListHstEndPess(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.IDPESSOA, H.DATAALT, H.LOGRADOURO, H.COMPLEMENTO,'+CR_LF+
    '  H.BAIRRO, H.CEP, H.IDCIDADES, H.NUMERO,'+CR_LF+
    '  LTRIM(RTRIM(C.NOME)) AS CIDADE,'+CR_LF+
    '  LTRIM(RTRIM(E.NOMEESTADO)) AS ESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTENDPESS H, CIDADES C, ESTADO E'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (H.IDCIDADES = C.IDCIDADES) AND'+CR_LF+
    '  (C.IDESTADO  = E.IDESTADO)');
end;

function TCtrlHstAlterCad.ListHstAltCad(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, DATAALT, CODALTERACAO, ALTERACAO,'+CR_LF+
    '  TO_CHAR(DECODE(CODALTERACAO,'+CR_LF+
    '    ''ESTCV'','+CR_LF+
    '    TO_CHAR(DECODE(ALTERACAO,'+CR_LF+
    '      ''S'',' +QuotedStr(('Solteiro(a)'))+ ','+CR_LF+
    '      ''C'',' +QuotedStr(('Casado(a)'))+ ','+CR_LF+
    '      ''D'',' +QuotedStr(('Separado(a)'))+ ','+CR_LF+
    '      ''J'',' +QuotedStr(('Separado(a) Judicialmente'))+ ','+CR_LF+
    '      ''E'',' +QuotedStr(('Desquitado(a)'))+ ','+CR_LF+
    '      ''V'',' +QuotedStr(('Viúvo(a)'))+ ','+CR_LF+
    '      ''O'',' +QuotedStr(('Outro'))+CR_LF+
    '    )),'+CR_LF+
    '    ALTERACAO'+CR_LF+
    '  )) AS VALORALTERACAO,'+CR_LF+
    '  TO_CHAR(DECODE(CODALTERACAO,'+CR_LF+
    '    ''MATRI'',' +QuotedStr(('Matrícula'))+ ','+CR_LF+
    '    ''NOME'',' +QuotedStr(('Nome'))+ ','+CR_LF+
    '    ''CPF'',' +QuotedStr(('CPF'))+ ','+CR_LF+
    '    ''CTPS'',' +QuotedStr(('CTPS'))+ ','+CR_LF+
    '    ''PIS'',' +QuotedStr(('PIS/PASEP'))+ ','+CR_LF+
    '    ''DTNAS'',' +QuotedStr(('Data de Nascimento'))+ ','+CR_LF+
    '    ''DTADM'',' +QuotedStr(('Data de Admissão'))+ ','+CR_LF+
    '    ''HORTR'',' +QuotedStr(('Horário de Trabalho'))+ ','+CR_LF+
    '    ''NOMCH'',' +QuotedStr(('Nome do Chefe'))+ ','+CR_LF+
    '    ''GRINS'',' +QuotedStr(('Grau de Instrução'))+ ','+CR_LF+
    '    ''ESTCV'',' +QuotedStr(('Estado Civil'))+ ','+CR_LF+
    '    ''NOMSI'',' +QuotedStr(('Sindicato'))+ ','+CR_LF+
    '    ''PROFI'',' +QuotedStr(('Profissão'))+ ','+CR_LF+
    '    ''NIRRF'',' +QuotedStr(('Qtde. Dependentes I. Renda'))+ ','+CR_LF+
    '    ''NSALF'',' +QuotedStr(('Qtde. Dependentes Sal. Fam.'))+ ','+CR_LF+
    '    ''NTELE'',' +QuotedStr(('Telefone'))+CR_LF+
    '  )) AS CAMPO,'+CR_LF+
    '  TO_CHAR(DECODE(CODALTERACAO,'+CR_LF+
    '    ''MATRI'',''C'','+CR_LF+
    '    ''NOME'',''C'','+CR_LF+
    '    ''HORTR'',''C'','+CR_LF+
    '    ''NOMCH'',''C'','+CR_LF+
    '    ''GRINS'',''C'','+CR_LF+
    '    ''NOMSI'',''C'','+CR_LF+
    '    ''PROFI'',''C'','+CR_LF+
    '    ''NTELE'',''C'','+CR_LF+
    '    ''CPF'',''N'','+CR_LF+
    '    ''CTPS'',''N'','+CR_LF+
    '    ''PIS'',''N'','+CR_LF+
    '    ''NIRRF'',''N'','+CR_LF+
    '    ''NSALF'',''N'','+CR_LF+
    '    ''DTNAS'',''D'','+CR_LF+
    '    ''DTADM'',''D'','+CR_LF+
    '    ''ESTCV'',''L'''+CR_LF+
    '  )) AS TIPOCAMPO,'+CR_LF+
    '  TO_CHAR(DECODE(CODALTERACAO,'+CR_LF+
    '    ''ESTCV'',1,'+CR_LF+
    '    ''NIRRF'',2,'+CR_LF+
    '    ''NSALF'',2,'+CR_LF+
    '    ''DTNAS'',10,'+CR_LF+
    '    ''DTADM'',10,'+CR_LF+
    '    ''MATRI'',13,'+CR_LF+
    '    ''CPF'',18,'+CR_LF+
    '    ''CTPS'',18,'+CR_LF+
    '    ''PIS'',18,'+CR_LF+
    '    ''NTELE'',20,'+CR_LF+
    '    ''GRINS'',30,'+CR_LF+
    '    ''HORTR'',40,'+CR_LF+
    '    ''NOME'',60,'+CR_LF+
    '    ''NOMCH'',60,'+CR_LF+
    '    ''NOMSI'',60,'+CR_LF+
    '    ''PROFI'',60'+CR_LF+
    '  )) AS MAX_TAM_CAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTALTCAD'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = '+FloatToStr(IdPessoa)+')');
end;

function TCtrlHstAlterCad.ListCodAltCad: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODALTERACAO, CODSEFIP'+CR_LF+
    'FROM'+CR_LF+
    '  CODALTCAD');
end;

function TCtrlHstAlterCad.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHstAlterCad(FCdsHstAltCad.Data, FCdsHstEndPess.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsHstEndPess, FDbHstEndPess, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsHstAltCad, FDbHstAltCad, [], []);
        if not(Result) then
          raise Exception.Create(FDbHstAltCad.MessageInfo);
      end
      else
        raise Exception.Create(FDbHstEndPess.MessageInfo);

      Commit;
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

end.
