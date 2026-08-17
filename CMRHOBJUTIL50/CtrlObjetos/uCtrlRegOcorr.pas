{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegOcorr;

interface

uses Classes, Db, Controls, SysUtils, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uDbHstAsMed;

type
  TCtrlRegOcorr = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsHstAsMed: TCMClientDataSet;
    FDbHstAsMed: TDbHstAsMed;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListRegOcorr(IdPessoa: double = 0; CodTipoOcMed: double = 0;
      NumSeq: integer = 0): OleVariant;
    function ListHistorico(IdPessoa: double): OleVariant;
    function ListAgendaAsm: OleVariant;

    function GetProxNumSeq(IdPessoa: double; CodTipoOcMed: integer): integer;

    function InserirOcorrencia(IdPessoa: double; CodTipoOcMed: integer; DataIni, DataFim: TDateTime;
      IdExaminador: double; Avaliador, CodCID: string; Licenca, Avaliacao: double): boolean;

    function GravarRegOcorr: boolean;

    property CdsHstAsMed: TCMClientDataSet read FCdsHstAsMed write FCdsHstAsMed;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegOcorr }

constructor TCtrlRegOcorr.Create;
begin
  inherited;
  FDbHstAsMed := TDbHstAsMed.Create(Self);
end;

destructor TCtrlRegOcorr.Destroy;
begin
  FDbHstAsMed.Free;
  if (IsAppServer) then
    FCdsHstAsMed.Free;
  inherited;
end;

procedure TCtrlRegOcorr.OnCreateAppServer;
begin
  inherited;
  FCdsHstAsMed := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegOcorr.DoChangeDataBase;
begin
  inherited;
  FDbHstAsMed.DataBaseName := DataBaseName;
end;

function TCtrlRegOcorr.ListRegOcorr(IdPessoa, CodTipoOcMed: double; NumSeq: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdPessoa = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL + CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  HSTASMED'+CR_LF+
    'WHERE'+CR_LF;

  if (IdPessoa = -1) then
    sSQL := sSQL + '  (1 = 2)'
  else
  begin
    if (IdPessoa > 0) then
      sSQL := sSQL + '  (IDPESSOA = '+FloatToStr(IdPessoa)+')';

    if (CodTipoOcMed > 0) then
    begin
      if (IdPessoa > 0) then
        sSQL := sSQL + ' AND'+CR_LF;

      sSQL := sSQL + '  (CODTIPOOCMED = '+FloatToStr(CodTipoOcMed)+')';
    end;

    if (NumSeq > 0) then
      sSQL := sSQL + ' AND' +CR_LF+ '  (NUMSEQ = '+IntToStr(NumSeq)+')';
  end;

  Result := GetDataPacket(sSQL);
end;

function TCtrlRegOcorr.ListHistorico(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.*, H.CODTIPOOCMED AS CODTIPOOCMED_OLD, T.DESCRTIPOOCMED,'+CR_LF+
    '  NVL(DATAREAL,DATAPLAN) AS DATAREF, H.IDEXAMINADOR'+CR_LF+
    'FROM'+CR_LF+
    '  HSTASMED H, TIPOCMED T'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.CODTIPOOCMED = T.CODTIPOOCMED)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAREF DESC');
end;

function TCtrlRegOcorr.ListAgendaAsm: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  H.DATAPLAN, P.NOME, TM.DESCRTIPOOCMED,' +CR_LF+
    '  (CASE' +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''E'' THEN ' +QuotedStr(('Efetivo')) +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''S'' THEN ' +QuotedStr(('Efetivo Especial')) +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''T'' THEN ' +QuotedStr(('Temporário')) +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''G'' THEN ' +QuotedStr(('Estagiário')) +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''3'' THEN ' +QuotedStr(('Terceiro')) +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''P'' THEN ' +QuotedStr(('Prop/Dir s/ Vinc')) +CR_LF+
    '     WHEN F.TIPOCONTRATO = ''A'' THEN ' +QuotedStr(('Autônomo')) +CR_LF+
    '     ELSE ' +QuotedStr(('Indefinido')) +CR_LF+
    '   END) AS TIPO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, HSTASMED H, FUNCIONARIO F, TIPOCMED TM' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.DATAREAL       IS NULL) AND' +CR_LF+
    '  (H.DATAPLAN       >= TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.DATAPLAN       <= TO_DATE(' +QuotedStr(DateToStr(Date+7))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.CODTIPOOCMED    = TM.CODTIPOOCMED) AND' +CR_LF+
    IFF(FUsuXCCusto<>'', MontaSelSQL('F.CODCENTROCUSTO',FUsuXCCusto,2,1)+CR_LF, '')+
    IFF(FUsuXFilial<>'', MontaSelSQL('F.IDESTAB',FUsuXFilial,2,8)+CR_LF, '')+
    IFF(FIdUsuarioGeral<>'', '  (F.IDPESSOA        = ' +FIdUsuarioGeral+ ') AND'+CR_LF, '')+
    '  (H.IDPESSOA        = F.IDPESSOA) AND' +CR_LF+
    '  (H.IDPESSOA        = P.IDPESSOA)' +CR_LF+
    'UNION' +CR_LF+
    'SELECT DISTINCT' +CR_LF+
    '  H.DATAPLAN, P.NOME, TM.DESCRTIPOOCMED,' +CR_LF+
    '  (' +QuotedStr(('Candidato'))+ ') AS TIPO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, HSTASMED H, CANDIDAT C, TIPOCMED TM' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.DATAREAL       IS NULL) AND' +CR_LF+
    '  (H.DATAPLAN       >= TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.DATAPLAN       <= TO_DATE(' +QuotedStr(DateToStr(Date+7))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.CODTIPOOCMED    = TM.CODTIPOOCMED) AND' +CR_LF+
    '  (H.IDPESSOA        = C.IDPESSOA) AND' +CR_LF+
    '  (H.IDPESSOA        = P.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  DATAPLAN');
end;

function TCtrlRegOcorr.GetProxNumSeq(IdPessoa: double; CodTipoOcMed: integer): integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NUMSEQ) AS MAX_NUM'+CR_LF+
    'FROM'+CR_LF+
    '  HSTASMED'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (CODTIPOOCMED = ' +IntToStr(CodTipoOcMed)+ ')');

  Result := _Cds.FieldByName('MAX_NUM').asInteger + 1;

  _Cds.Free;
end;

function TCtrlRegOcorr.InserirOcorrencia(IdPessoa: double; CodTipoOcMed: integer;
  DataIni, DataFim: TDateTime; IdExaminador: double; Avaliador, CodCID: string;
  Licenca, Avaliacao: double): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InserirOcorrenciaMedica(IdPessoa, CodTipoOcMed,
      DataIni, DataFim, IdExaminador, Avaliador, CodCID, Licenca, Avaliacao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      _Cds.Data := GetDataPacket(
        'SELECT NUMSEQ'+CR_LF+
        'FROM   HSTASMED'+CR_LF+
        'WHERE  (IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
        '       (CODTIPOOCMED = ' +IntToStr(CodTipoOcMed)+ ') AND'+CR_LF+
        '       (DATAREAL     = TO_CHAR(' +QuotedStr(DateToStr(DataIni))+ ',''DD/MM/YYYY''))');
      if not(_Cds.IsEmpty) then
        raise Exception.Create(
         ('Já existe esse Tipo de Ocorrência nessa data.') +CR_LF+
         ('Verifique no módulo Medicina do Trabalho.'));

      StartTransaction;

      Result := ExecSQL(
        'INSERT INTO HSTASMED (IDPESSOA,CODTIPOOCMED,NUMSEQ,DATAREAL,' +
        'EXAMINADOR,IDEXAMINADOR,CODCID,AVALIACAO,LICENCA)' +CR_LF+
        'VALUES(' +
        FloatToStr(IdPessoa) +','+
        IntToStr(CodTipoOcMed) +','+
        IntToStr(GetProxNumSeq(IdPessoa, CodTipoOcMed)) +','+
        'TO_DATE(' +QuotedStr(DateToStr(DataIni))+ ',''DD/MM/YYYY''),' +
        QuotedStr(Trim(Avaliador)) +','+
        IFF(IdExaminador=0, 'NULL', FloatToStr(IdExaminador)) +','+
        QuotedStr(Trim(CodCID)) +','+
        FloatToStr(Avaliacao) +','+
        FloatToStr(Licenca) +')');

      if (Result) then
        Commit
      else
        raise Exception.Create(MessageInfo);
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

function TCtrlRegOcorr.GravarRegOcorr: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegOcorr(FCdsHstAsMed.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsHstAsMed.DisableControls;
    try
      StartTransaction;

      Result := ApplyCds(FCdsHstAsMed, FDbHstAsMed, [], []);
      if not(Result) then
        raise Exception.Create(FDbHstAsMed.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsHstAsMed.EnableControls;
  end;
end;

end.
