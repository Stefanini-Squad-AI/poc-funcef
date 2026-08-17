{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/12/2001                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegHoras;

interface

uses SysUtils, Db, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbParamRH,
  uDbFilialPessoa;

type
  TCtrlRegHoras = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
  private
    FDbParamRH: TDbParamRH;
    FDbFilialPessoa: TDbFilialPessoa;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListFunc(IdPessoa: real): OleVariant;
    function ListFerias(IdPessoa: real; DataIni, DataFin: TDateTime): OleVariant;
    function ListFeriados(IdCidades,IdPais: integer; UF: string;
      DataIni, DataFin: TDateTime): OleVariant;
    function ListHorarios(IdHorario: integer): OleVariant;
    function ListTurno(IdHorario: integer): OleVariant;        

    property DbParamRH: TDbParamRH read FDbParamRH write FDbParamRH;
    property DbFilialPessoa: TDbFilialPessoa read FDbFilialPessoa write FDbFilialPessoa;
  end;

implementation

uses uFuncoesUteis;

{ TCtrlRegHoras }

constructor TCtrlRegHoras.Create;
begin
  inherited;
  FDbParamRH := TDbParamRH.Create(Self);
  FDbFilialPessoa := TDbFilialPessoa.Create(Self);
end;

destructor TCtrlRegHoras.Destroy;
begin
  inherited;
  FDbFilialPessoa.Free;
  FDbParamRH.Free;
end;

procedure TCtrlRegHoras.DoChangeDataBase;
begin
  inherited;
  DbParamRH.DataBaseName := DataBaseName;
  FDbFilialPessoa.DataBaseName := DataBaseName;
end;

function TCtrlRegHoras.ListFunc(IdPessoa: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PF.NOME, F.IDPESSOA, F.MATRICULA, F.IDEMPRESA, F.IDESTAB,'+CR_LF+
    '  F.IDHORARIO, F.DATAREFHORARIO, ST.TIPOSIT, DECODE(ST.TIPOSIT,''A'','+CR_LF+
    '    ''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'') ||'+CR_LF+
    '    DECODE(PEFIS.Sexo,''F'',''a)'',''o)'') AS SITUACAO,'+CR_LF+
    '  DECODE(C.IdPais,NULL,E.IDPAIS,C.IdPais) AS IDPAIS,'+CR_LF+
    '  E.IDCIDADES, RTRIM(ES.CODESTADO) AS UF'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,'+CR_LF+
    '  SITFUNC ST, CIDADES C, ESTADO ES'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA        = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (F.IDSITFUNC       = ST.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA        = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA        = PEFIS.IDPESSOA) AND'+CR_LF+
    '  (F.IDESTAB         = PJ.IDPESSOA) AND'+CR_LF+
    '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND'+CR_LF+
    '  (PJ.IDPESSOA       = E.IDPESSOA) AND'+CR_LF+
    '  (E.IDCIDADES       = C.IDCIDADES) AND'+CR_LF+
    '  (C.IDESTADO        = ES.IDESTADO)');
end;

function TCtrlRegHoras.ListFerias(IdPessoa: real; DataIni, DataFin: TDateTime): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  INIGOZOFERIAS, FIMGOZOFERIAS'+CR_LF+
    'FROM'+CR_LF+
    '  FERIAS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA       = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(DataIni))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(DataFin))+',''DD/MM/YYYY''))');
end;

function TCtrlRegHoras.ListFeriados(IdCidades,IdPais: integer; UF: string;
  DataIni, DataFin: TDateTime): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DATAFERIADO, FLGTIPO'+CR_LF+
    'FROM'+CR_LF+
    '  FERIADOS'+CR_LF+
    'WHERE'+CR_LF+
    '  (DATAFERIADO >= TO_DATE('+QuotedStr(DateToStr(DataIni))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (DATAFERIADO <= TO_DATE('+QuotedStr(DateToStr(DataFin))+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (IDPAIS       = '+IntToStr(IdPais)+') AND'+CR_LF+
    '  (((FLGAMBITO  = ''M'') AND (IDCIDADES = '+IntToStr(IdCidades)+')) OR'+CR_LF+
    '   ((FLGAMBITO  = ''E'') AND (CODESTADO = '+QuotedStr(UF)+')) OR'+CR_LF+
    '   (FLGAMBITO   = ''F''))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAFERIADO, FLGTIPO');
end;

function TCtrlRegHoras.ListHorarios(IdHorario: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT * FROM HORATRAB WHERE (IDHORARIO = '+IntToStr(IdHorario)+')');
end;

function TCtrlRegHoras.ListTurno(IdHorario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TS.IDDIASEMANA, TD.INICIOEXPEDIENTE, TD.INICIOALMOCO,'+CR_LF+
    '  TD.FINALALMOCO, TD.FINALEXPEDIENTE'+CR_LF+
    'FROM'+CR_LF+
    '  TURNOSEM TS, TURNODIA TD'+CR_LF+
    'WHERE'+CR_LF+
    '  (TS.IDHORARIO     = '+IntToStr(IdHorario)+') AND'+CR_LF+
    '  (TS.IDTURNODIARIO = TD.IDTURNODIARIO)');
end;

end.
