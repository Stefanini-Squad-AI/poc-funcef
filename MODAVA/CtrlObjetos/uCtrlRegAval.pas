{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegAval;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbHstAval,
  uFuncoesUteis;

type
  TCtrlRegAval = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbHstAval;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListMestre(IdPessoa: double; TipoProcura: TTipoProcura): OleVariant;
    function ListDetalhe(IdPessoa: double): OleVariant;

    function ProximoNumSeq(CodTipAval: real): integer;

    function GravarRegAval: boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes;

{ TCtrlRegAval }

constructor TCtrlRegAval.Create;
begin
  inherited;
  FDbDet := TDbHstAval.Create(Self);
end;

destructor TCtrlRegAval.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlRegAval.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegAval.DoChangeDataBase;
begin
  inherited;
  FDbDet.DatabaseName := DataBaseName;
end;

function TCtrlRegAval.ListMestre(IdPessoa: double; TipoProcura: TTipoProcura): OleVariant;
begin
  if (TipoProcura = tpEmpregado) then
    Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  F.MATRICULA, P.NOME, C.TITULO, S.DESCRICAO, F.IDPESSOA'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
      '  (F.IDPESSOA  = P.IDPESSOA) AND'+CR_LF+
      '  (F.IDCARGO   = C.IDCARGO(+)) AND'+CR_LF+
      '  (F.IDSITFUNC = S.IDSITFUNC(+))')
  else
    Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  CA.IDPESSOA AS MATRICULA, P.NOME, C.TITULO,'+CR_LF+
      '  (''Candidato'') AS DESCRICAO, CA.IDPESSOA'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOA P, CANDIDAT CA, CARGO C'+CR_LF+
      'WHERE'+CR_LF+
      '  (CA.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
      '  (CA.IDPESSOA  = P.IDPESSOA) AND'+CR_LF+
      '  (CA.IDCARGO   = C.IDCARGO(+))');
end;

function TCtrlRegAval.ListDetalhe(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.IDPESSOA, H.CODTIPOAVAL, H.NUMSEQ, H.DATAREAL, H.AVALIACAO,'+CR_LF+
    '  H.OBSERVAVAL, H.AVALIADOR, H.DATAPLAN, H.FORTES, H.FRACOS,'+CR_LF+
    '  H.LIMITACOES, H.METAS, H.MEDIDAS, H.RESUMO, H.COMENT,'+CR_LF+
    '  T.DESCRTIPOAVAL, NVL(H.DATAREAL, H.DATAPLAN) AS DATAREF'+CR_LF+
    'FROM'+CR_LF+
    '  HSTAVAL H, TIPOAVAL T'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA    = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (H.CODTIPOAVAL = T.CODTIPOAVAL) AND'+CR_LF+
    '  (T.FLGTIPOAVAL = 2)');
end;

function TCtrlRegAval.ProximoNumSeq(CodTipAval: real): integer;
begin
  Result := 0;
  FCdsDet.First;
  while not(FCdsDet.EOF) do
  begin
    if (FCdsDet.FieldByName('CODTIPOAVAL').asInteger = CodTipAval) and
       (FCdsDet.FieldByName('IDPESSOA').asInteger > Result) then
      Result := FCdsDet.FieldByName('NUMSEQ').asInteger;

    FCdsDet.Next;
  end;
end;

function TCtrlRegAval.GravarRegAval: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegAval(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if not(Result) then
        MessageInfo := FDbDet.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
