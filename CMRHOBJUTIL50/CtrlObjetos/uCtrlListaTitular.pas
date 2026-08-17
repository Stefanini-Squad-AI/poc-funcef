{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 10/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlListaTitular;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbPessoaFisica;

type
  TCtrlListaTitular = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPessoaFisica;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTitular(ListaIdPessoa: string): OleVariant;
    
    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlListaTitular }

constructor TCtrlListaTitular.Create;
begin
  inherited;
  FDb := TDbPessoaFisica.Create(Self);
end;

destructor TCtrlListaTitular.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlListaTitular.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlListaTitular.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlListaTitular.ListTitular(ListaIdPessoa: string): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME, PF.*,'+CR_LF+
    '  NVL(PF.NUMDEPTOT,0)  AS NUMDEPTOT,  DEPENDENTE.NUM_TOT,'+CR_LF+
    '  NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, DEPENDENTE.NUM_IRRF,'+CR_LF+
    '  NVL(PF.NUMDEPSALF,0) AS NUMDEPSALF, DEPENDENTE.NUM_SAL_FAM,'+CR_LF+
    '  0 AS MUDANUM'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F,'+CR_LF+
    '  (SELECT'+CR_LF+
    '     DP.IDTITULAR, COUNT(*) NUM_TOT,'+CR_LF+
    '     SUM(DP.FLGCONTAIMPOSTOR) NUM_IRRF, SUM(DP.FLGCONTASALARIOF) NUM_SAL_FAM'+CR_LF+
    '   FROM'+CR_LF+
    '     DEPENTIT DP, DEPEN D'+CR_LF+
    '   WHERE'+CR_LF;

  if (Pos(',',ListaIdPessoa) > 0) then
    sSQL := sSQL + '      (DP.IDTITULAR     IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '      (DP.IDTITULAR     = ' +ListaIdPessoa+ ') AND'+CR_LF;

  sSQL := sSQL +
    '     (DP.IDDEPENDENCIA <> ''PRP'') AND'+CR_LF+
    '     (DP.IDDEPENDENCIA  = D.IDDEPENDENCIA)'+CR_LF+
    '   GROUP BY'+CR_LF+
    '     DP.IDTITULAR) DEPENDENTE'+CR_LF+
    'WHERE'+CR_LF;

  if (Pos(',',ListaIdPessoa) > 0) then
    sSQL := sSQL + '  (F.IDPESSOA IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '  (F.IDPESSOA  = ' +ListaIdPessoa+ ') AND'+CR_LF;

  sSQL := sSQL +
    '  (F.IDPESSOA = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA = DEPENDENTE.IDTITULAR)';

  Result := GetDataPacket(sSQL);
end;

function TCtrlListaTitular.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarListaTitularDependente(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCds.First;
      while not(FCds.EOF) do
      begin
        if (FCds.FieldByName('MUDANUM').asInteger = 1) then
        begin
          FCds.Edit;
          FCds.FieldByName('NUMDEPIRRF').asInteger := FCds.FieldByName('NUM_IRRF').asInteger;
          FCds.FieldByName('NUMDEPSALF').asInteger := FCds.FieldByName('NUM_SAL_FAM').asInteger;
          FCds.FieldByName('NUMDEPTOT').asInteger := FCds.FieldByName('NUM_TOT').asInteger;
          FCds.Post;
        end;
        FCds.Next;
      end;

      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

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
