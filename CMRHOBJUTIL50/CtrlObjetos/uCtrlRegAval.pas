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

uses Db, SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbHstAval, uCtrlFuncoesRH;

type
  TCtrlRegAval = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHstAval: TDbHstAval;
    FCdsHstAval: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHstAval(ListaIdPessoa: string = ''): OleVariant;
    function ListHistorico_e_Tipo(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListDetalhe(IdPessoa: double): OleVariant;

    function ListMestreAvalDesemp(IdPessoa: double): OleVariant;
    function ListDetalheAvalDesemp(IdPessoa: double): OleVariant;

    function ListPessoaHistAval(IdPessoa: double; CodTipAval, NumSeq: integer): OleVariant;

    function ListAtendimento(IdPessoa, IdModulo: double): OleVariant;
    function ListAgendaAval(const SelEmpregado: boolean): OleVariant;
    
    function ExcluiAtendimento(IdEfetAtendimento: double): boolean;

    function GetProxNumSeqPessoa(IdPessoa: double; CodTipAval: integer): integer;
    function GetProxNumSeq(CodTipAval: integer): integer;

    function GravarRegAval: boolean;

    property CdsHstAval: TCMClientDataSet read FCdsHstAval write FCdsHstAval;
  end;

implementation

uses uCMTypes, uCmCustomCdbObject;

{ TCtrlRegAval }

constructor TCtrlRegAval.Create;
begin
  inherited;
  FDbHstAval := TDbHstAval.Create(Self);
end;

destructor TCtrlRegAval.Destroy;
begin
  FDbHstAval.Free;
  if (IsAppServer) then
    FCdsHstAval.Free;
  inherited;
end;

procedure TCtrlRegAval.OnCreateAppServer;
begin
  inherited;
  FCdsHstAval := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegAval.DoChangeDataBase;
begin
  inherited;
  FDbHstAval.DataBaseName := DataBaseName;
end;

function TCtrlRegAval.ListHstAval(ListaIdPessoa: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  *' +CR_LF+
    'FROM' +CR_LF+
    '  HSTAVAL' +CR_LF+
    IFF(ListaIdPessoa='', '',
      'WHERE' +CR_LF+
      MontaLinhaSelSQL('  (IDPESSOA', ListaIdPessoa, 1, false) +CR_LF)+
    'ORDER BY' +CR_LF+
    '  IDPESSOA, DATAREAL, CODTIPOAVAL');
end;

function TCtrlRegAval.ListHistorico_e_Tipo(IdPessoa: double; Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos<>'', Campos,
      '  HA.DATAREAL, HA.AVALIADOR, HA.COMENT, HA.AVALIACAO, TA.DESCRTIPOAVAL'+CR_LF)+
    'FROM'+CR_LF+
    '  HSTAVAL HA, TIPOAVAL TA'+CR_LF+
    'WHERE'+CR_LF+
    '  (HA.IDPESSOA    = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (HA.CODTIPOAVAL = TA.CODTIPOAVAL)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  HA.DATAREAL DESC');
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
    '  (T.FLGTIPOAVAL = 2)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  DATAREF DESC');
end;

function TCtrlRegAval.ListMestreAvalDesemp(IdPessoa: double): OleVariant;
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
    '  (T.FLGTIPOAVAL < 2)');
end;

function TCtrlRegAval.ListDetalheAvalDesemp(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.IDPESSOA, H.CODTIPOAVAL, H.IDFATORAVAL, H.NUMSEQ, H.GRAU,'+CR_LF+
    '  F.DESCRFATORAVAL, H.IDGRUPOFATORAVAL, G.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTDESEMP H, FATORAVAL F, GRUPOFATORAVAL G'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA         = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (H.IDFATORAVAL      = F.IDFATORAVAL) AND'+CR_LF+
    '  (F.IDGRUPOFATORAVAL = G.IDGRUPOFATORAVAL(+))');
end;

function TCtrlRegAval.ListPessoaHistAval(IdPessoa: double; CodTipAval,
  NumSeq: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  F.MATRICULA, P.NOME, H.IDPESSOA, H.CODTIPOAVAL, H.NUMSEQ, H.DATAPLAN,'+CR_LF+
    '  H.DATAREAL, H.AVALIACAO, H.AVALIADOR, H.FORTES, H.FRACOS, H.LIMITACOES,'+CR_LF+
    '  H.METAS, H.MEDIDAS, H.RESUMO, H.OBSERVAVAL, H.COMENT, C.CODGRPFUNC'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, HSTAVAL H, FUNCIONARIO F, TIPOAVAL T, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.FLGTIPOAVAL IN (0,1)) AND'+CR_LF+
    '  (H.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.CODTIPOAVAL = ' +IntToStr(CodTipAval)+ ') AND'+CR_LF+
    '  (H.NUMSEQ      = ' +IntToStr(NumSeq)+ ') AND'+CR_LF+
    '  (H.CODTIPOAVAL = T.CODTIPOAVAL) AND'+CR_LF+
    '  (H.IDPESSOA    = F.IDPESSOA) AND'+CR_LF+
    '  (H.IDPESSOA    = P.IDPESSOA) AND'+CR_LF+
    '  (F.IDCARGO     = C.IDCARGO)');
end;

function TCtrlRegAval.ListAtendimento(IdPessoa, IdModulo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  EA.*, ATN.*, PSQ.DESCRICAO AS PESQUISA, PSQ.OBSERVACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PSQEFETATEND EA, PSQATENDIMENTO ATN, PSQPESQUISA PSQ'+CR_LF+
    'WHERE'+CR_LF+
    '  (EA.IDPESSOA         = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (EA.IDMODULO         = ' +FloatToStr(IdModulo)+ ') AND'+CR_LF+
    '  (EA.IDPSQATENDIMENTO = ATN.IDPSQATENDIMENTO) AND'+CR_LF+
    '  (ATN.IDPSQPESQUISA   = PSQ.IDPSQPESQUISA)'+CR_LF+
    'ORDER BY EA.DATAEFETATEND DESC');
end;

function TCtrlRegAval.ListAgendaAval(const SelEmpregado: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  H.DATAPLAN, TA.DESCRTIPOAVAL, P.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, HSTAVAL H, ' +
      IFF(SelEmpregado, 'FUNCIONARIO', 'CANDIDAT')+ ' F, TIPOAVAL TA' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.DATAREAL       IS NULL) AND' +CR_LF+
    '  (H.DATAPLAN       >= TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.DATAPLAN       <= TO_DATE(' +QuotedStr(DateToStr(Date+7))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.CODTIPOAVAL     = TA.CODTIPOAVAL) AND' +CR_LF+
    IFF(SelEmpregado,
      IFF(FUsuXCCusto<>'', MontaSelSQL('F.CODCENTROCUSTO',FUsuXCCusto,2,1)+CR_LF, '')+
      IFF(FUsuXFilial<>'', MontaSelSQL('F.IDESTAB',FUsuXFilial,2,8)+CR_LF, '')+
      IFF(FIdUsuarioGeral<>'', '  (F.IDPESSOA        = ' +FIdUsuarioGeral+ ') AND'+CR_LF, ''), '')+
    '  (H.IDPESSOA        = F.IDPESSOA) AND' +CR_LF+
    '  (H.IDPESSOA        = P.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  DATAPLAN');
end;

function TCtrlRegAval.ExcluiAtendimento(IdEfetAtendimento: double): boolean;
begin
  try
    StartTransaction;
    ExecSql('DELETE FROM PSQDADOSEFETATEND WHERE IDPSQEFETATEND = '+
      FloatToStr(IdEfetAtendimento));
    ExecSql('DELETE FROM PSQEFETATEND WHERE IDPSQEFETATEND = '+
      FloatToStr(IdEfetAtendimento));
    Commit;
    Result := true;
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRegAval.GetProxNumSeqPessoa(IdPessoa: double; CodTipAval: integer): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NUMSEQ) AS NUMSEQ'+CR_LF+
    'FROM'+CR_LF+
    '  HSTAVAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (CODTIPOAVAL = ' +IntToStr(CodTipAval)+ ')');

  Result := _Cds.FieldByName('NUMSEQ').asInteger + 1;
end;

function TCtrlRegAval.GetProxNumSeq(CodTipAval: integer): integer;
var
  c: byte;
  ValorCampo: array of variant;
begin
  FCdsHstAval.DisableControls;

  // Guardo os campos do registro
  SetLength(ValorCampo, FCdsHstAval.FieldCount);
  for c:=0 to FCdsHstAval.FieldCount-1 do
    ValorCampo[c] := FCdsHstAval.Fields[c].Value;

  FCdsHstAval.Post;
  FCdsHstAval.Delete;
  FCdsHstAval.First;
  Result := 0;
  while not(FCdsHstAval.EOF) do
  begin
    if (FCdsHstAval.FieldByName('CODTIPOAVAL').asInteger = CodTipAval) and
       (FCdsHstAval.FieldByName('NUMSEQ').asInteger > Result) then
      Result := FCdsHstAval.FieldByName('NUMSEQ').asInteger;

    FCdsHstAval.Next;
  end;
  Result := Result + 1;

  // Recupero os campos do registro
  FCdsHstAval.Insert;
  for c:=0 to FCdsHstAval.FieldCount-1 do
    FCdsHstAval.Fields[c].Value := ValorCampo[c];

  FCdsHstAval.EnableControls;
end;

function TCtrlRegAval.GravarRegAval: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegAval(FCdsHstAval.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHstAval, FDbHstAval, [], []);
      if not(Result) then
        raise Exception.Create(FDbHstAval.MessageInfo);

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
