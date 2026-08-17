unit uCtrlRubricaIndiv;

interface

uses SysUtils, uCmControlObject, uCmDbObject, IvDictio,  uCmClientDataSet,
  uCMTypes, uCtrlCustomRH, uDbRubricaIndiv;

type
  TCtrlRubricaIndiv = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsRubricaIndiv: TCMClientDataSet;
    FDbRubricaIndiv: TDbRubricaIndiv;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    // Retorna a estrutura da Tabela RubricaIndiv em formato XML para a integração com a
    // tecnologia COM+
    function GetXmlRubricaIndiv(IdPessoa: double; var XmlRubricaIndiv: WideString): boolean;

    function ListRubricaIndiv(IdPessoa: double; IdRubrica: double = 0;
      SeqRubricaIndiv: integer = -1; IdEmpresa: integer = 0): OleVariant;
    function ListPessoaRubricaIndiv(IdRubrica: double; IdEmpresa: integer): OleVariant;
    function ListRubricaXRubricaIndiv(IdPessoa: double; IdEmpresa: integer;
      SelBeneficio: integer = -1): OleVariant;
    function ListRubricasNoMes(IdEmpresa: integer; IdRubricaIncid: double; AnoBarraMes: string): OleVariant;

    function RubricaIndivJaExiste(IdPessoa, IdRubrica: double;
      AnoMesInicio: string): boolean;
    function UltimoNumSeq(IdPessoa, IdRubrica: double; IdEmpresa: integer): integer;

    function GravarRubricaIndiv: boolean;
    function AlteracaoColetivaLancamentos(const AnoMes, IdRubricasSel: string;
      const MesAnoIni: boolean; const Comparador: string; const Permanente,
      IdEmpresa: integer; const ConsideraValor: boolean; const Valor: double): boolean;

    property DbRubricaIndiv: TDbRubricaIndiv read FDbRubricaIndiv write FDbRubricaIndiv;
    property CdsRubricaIndiv: TCMClientDataSet read FCdsRubricaIndiv write FCdsRubricaIndiv;
  end;

implementation

uses uMidasUtil, uCtrlFuncoesRH;

{ TCtrlRubricaIndiv }

constructor TCtrlRubricaIndiv.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FDbRubricaIndiv := TDbRubricaIndiv.Create(Self);
end;

destructor TCtrlRubricaIndiv.Destroy;
begin
  FDbRubricaIndiv.Free;
  if (IsAppServer) then
    FCdsRubricaIndiv.Free;
  inherited;
end;

procedure TCtrlRubricaIndiv.OnCreateAppServer;
begin
  inherited;
  FCdsRubricaIndiv := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRubricaIndiv.DoChangeDataBase;
begin
  inherited;
  FDbRubricaIndiv.DataBaseName := Self.DataBaseName;
end;

function TCtrlRubricaIndiv.GetXmlRubricaIndiv(IdPessoa: double;
  var XmlRubricaIndiv: WideString): boolean;
begin
  try
    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA, IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS,'+CR_LF+
      '       SEQRUBRICAINDIV, IDFAVORECIDO, IDREGRACALCULO, VALORRUBRICA,'+CR_LF+
      '       ANOMESINICIO, FLGPERMANENTE, PARCELAS, FLGTPRUBMANUT'+CR_LF+
      'FROM   RUBRICAINDIV'+CR_LF+
      'WHERE  IDPESSOA = '+FloatToStr(IdPessoa));
    XmlRubricaIndiv := CdsToXmlString(_Cds);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRubricaIndiv.ListRubricaIndiv(IdPessoa, IdRubrica: double;
  SeqRubricaIndiv, IdEmpresa: integer): OleVariant;
var
  sSQL: string;
begin
  if (IdPessoa = -1) then
    sSQL := '  (1 = 2)'
  else
  begin
    sSQL := '  (IDPESSOA        = ' +FloatToStr(IdPessoa)+ ')'+
      IFF((IdRubrica > 0) or (SeqRubricaIndiv > -1) or (IdEmpresa > 0), ' AND', '') +CR_LF;

    if (IdRubrica > 0) then
      sSQL := sSQL + '  (IDRUBRICA       = ' +FloatToStr(IdRubrica)+ ')'+
        IFF((SeqRubricaIndiv > -1) or (IdEmpresa > 0), ' AND', '') +CR_LF;

    if (SeqRubricaIndiv > -1) then
      sSQL := sSQL + '  (SEQRUBRICAINDIV = ' +IntToStr(SeqRubricaIndiv)+ ')'+
        IFF(IdEmpresa > 0, ' AND', '') +CR_LF;

    if (IdEmpresa > 0) then
      sSQL := sSQL + '  (IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ')';
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(sSQL = '  (1 = 2)', ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAINDIV'+CR_LF+
    'WHERE'+CR_LF+
    sSQL);
end;

function TCtrlRubricaIndiv.ListPessoaRubricaIndiv(IdRubrica: double; IdEmpresa: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (FIdUsuarioGeral <> '') then
    sSQL := '  (F.IDPESSOA       = ' +FIdUsuarioGeral+ ') AND'+CR_LF;

  if (FUsuXCCusto <> '') then
    sSQL := sSQL + MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1)+CR_LF;

  if (FUsuXFilial <> '') then
    sSQL := sSQL + MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 1) +CR_LF;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  RI.*, PF.NOME AS FUNCIONARIO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, RUBRICAINDIV RI, PROVDESC PD, RUBRICAXPESS RP, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  (RP.IDRUBRICA      = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RI.IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (F.IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RI.FLGTPRUBMANUT  = ''2'') AND'+CR_LF+
    '  (PD.FLGCONSTAFOLHA = 1) AND'+CR_LF+
    '  (RP.IDRUBRICA      = RI.IDRUBRICA) AND'+CR_LF+
    '  (RP.IDRUBRICA      = PD.IDPROVENTO) AND'+CR_LF+
    '  (RI.IDPESSOA       = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA        = PF.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  ANOMESINICIO DESC, UPPER(PF.NOME), SEQRUBRICAINDIV');
end;

function TCtrlRubricaIndiv.ListRubricaXRubricaIndiv(IdPessoa: double; IdEmpresa,
  SelBeneficio: integer): OleVariant;
var
  sSQL: string;
begin
  case (SelBeneficio) of
    0 :  sSQL := '  (PD.IDBENEFSALAR  IS NULL) AND'+CR_LF;
    1 :  sSQL := '  (PD.IDBENEFSALAR  IS NOT NULL) AND'+CR_LF;
    else sSQL := '';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  RI.*, RP.DESCRPROVDESC AS RUBRICA'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAINDIV RI, RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RI.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (RI.IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RI.FLGTPRUBMANUT  = ''2'') AND'+CR_LF+
    sSQL+
    '  (PD.FLGCONSTAFOLHA = 1) AND'+CR_LF+
    '  (RI.IDRUBRICA      = RP.IDRUBRICA) AND'+CR_LF+
    '  (RP.IDRUBRICA      = PD.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  FLGPERMANENTE DESC, ANOMESINICIO DESC, RP.DESCRPROVDESC, SEQRUBRICAINDIV');
end;

function TCtrlRubricaIndiv.ListRubricasNoMes(IdEmpresa: integer; IdRubricaIncid: double;
  AnoBarraMes: string): OleVariant;
begin
  Result := GetDataPacket(
        'SELECT'+CR_LF+
        '  *'+CR_LF+
        'FROM'+CR_LF+
        '  RUBRICAINDIV'+CR_LF+
        'WHERE'+CR_LF+
        '  (IDEMPRESA    = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
        '  (IDRUBRICA    = ' +FloatToStr(IdRubricaIncid)+ ') AND'+CR_LF+
        '  (ANOMESINICIO = ' +QuotedStr(AnoBarraMes)+ ')');
end;

function TCtrlRubricaIndiv.RubricaIndivJaExiste(IdPessoa,IdRubrica: double;
  AnoMesInicio: string): boolean;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  SEQRUBRICAINDIV'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAINDIV'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (IDRUBRICA    = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (ANOMESINICIO = ' +QuotedStr(AnoMesInicio)+ ')');

  Result := not(_Cds.IsEmpty);
  FreeAndNil(_Cds);
end;

function TCtrlRubricaIndiv.UltimoNumSeq(IdPessoa, IdRubrica: double; IdEmpresa: integer): integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  NVL(MAX(SEQRUBRICAINDIV),0) AS PROX_NUM_SEQ'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAINDIV'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (IDRUBRICA = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')');

  Result := _Cds.FieldByName('PROX_NUM_SEQ').asInteger;

  FreeAndNil(_Cds);
end;

function TCtrlRubricaIndiv.GravarRubricaIndiv: Boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRubricaIndiv(FCdsRubricaIndiv.Data,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsRubricaIndiv, FDbRubricaIndiv, [], []);
      if not(Result) then
        raise Exception.Create(FDbRubricaIndiv.MessageInfo);

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

function TCtrlRubricaIndiv.AlteracaoColetivaLancamentos(const AnoMes, IdRubricasSel: string;
  const MesAnoIni: boolean; const Comparador: string; const Permanente, IdEmpresa: integer;
  const ConsideraValor: boolean; const Valor: double): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AlteracaoColetivaLancamentos(AnoMes, IdRubricasSel,
      MesAnoIni, Comparador, Permanente, IdEmpresa, ConsideraValor, Valor);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(
        'UPDATE RUBRICAINDIV SET' +CR_LF+
        'VALORRUBRICA = ' +
        IFF(ConsideraValor,
          Float2String(Valor),
          'VALORRUBRICA + (VALORRUBRICA * ' +Float2String(Valor)+ ' / 100)') +CR_LF+
        'WHERE  (FLGTPRUBMANUT   = ''2'')' +CR_LF+
        ' AND   (IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ')' +
        IFF(IdRubricasSel='', '', CR_LF+
          ' AND ' + fu.MontaSelSQL('IDRUBRICA', IdRubricasSel,2,6,false))+
        IFF(MesAnoIni, '', CR_LF+
          ' AND   (ANOMESINICIO   ' +Comparador+ ' ' +QuotedStr(AnoMes)+ ')') +
        IFF(Permanente=2, CR_LF+
          ' AND   ((NUMOCORRENCIAS < PARCELAS)' +CR_LF+
          '  OR    (FLGPERMANENTE  = 1))', CR_LF+
          ' AND   (FLGPERMANENTE   = ' +
          IFF(Permanente=0,'1'{lançamentos permanentes},'0'{lançamentos normais})+ ')'));
      if not(Result) then
        raise Exception.Create(MessageInfo);

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
