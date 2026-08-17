{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegTrein;

interface

uses Classes, Db, Controls, SysUtils, uCmDbObject, uCmControlObject, IvDictio,
  CorreioCM, uCtrlRad, uCMClientDataSet, uCtrlCustomRH, uCtrlFatorAvalCurso,
  uCtrlEscalaConceitos, uDbHstTrn, uDbAvalCurso, uDbListaPresenca;

type
  TOrdemPessoas = (opNome, opTipoNome);

  TCtrlRegTrein = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlFatorAvalCurso: TCtrlFatorAvalCurso;
    FCtrlEscalaConceitos: TCtrlEscalaConceitos;
    FCtrlRad: TCtrlRad;

    FCdsHistTrein: TCMClientDataSet;
    FCdsAvalCurso: TCMClientDataSet;
    FCdsAvalAluno: TCMClientDataSet;
    FCdsFatorAval: TCMClientDataSet;
    FCdsEscalaConceitos: TCMClientDataSet;

    FDbHistTrein: TDbHstTrn;
    FDbAvalCurso: TDbAvalCurso;
    FDbListaPresenca: TDbListaPresenca;

    FEnviarMensagem: boolean;
    FIntegraRAD: boolean;
    FAvalicaoCurso: boolean;
    FAvalicaoAluno: boolean;
    FIdEmpresa: integer;
    FIdUsuario: integer;
    FNomeUsuario: string;
    FWherePessoas: string;
  public
    constructor Create(EnviarMensagem, IntegraRAD, AvalicaoCurso, AvalicaoAluno: boolean;
      IdEmpresa, IdUsuario: integer; NomeUsuario, UsuXFilial, UsuXCCusto,
      IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListHistorico_Treinamento: OleVariant;
    function ListHistorico_Treinamento_em_Branco: OleVariant;
    function ListHistoricoTreinamentoPorPessoa(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListHistoricoTreinamentoPorCurso(IdCurso: double): OleVariant;
    function ListAvaliacaoCurso(IdPessoa, IdCurso: double; NumSeq, Opcao: integer): OleVariant;
    function ListEntid(IdCurso: double = 0): OleVariant;
    function ListAgendaTrein: OleVariant;
    function ListConceitosEmBranco: OleVariant;
    procedure SelConceitos;

    function ListPessoasNaoInscritasNoCurso(SelEmpregado: boolean; IdCurso, IdInstrutor,
      IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal: TDate; Ordem: TOrdemPessoas;
      LocalCurso, DataHora: string): OleVariant;
    function ListPessoasInscritasNoCurso(SelHistorico: boolean; IdCurso, IdInstrutor,
      IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal: TDate; LocalCurso, DataHora: string): OleVariant;

    function ListPessoasAusentes(IdCurso, IdInstrutor, IdEntidade: double;
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal, DataRealizacao: TDate; Ordem: TOrdemPessoas;
      LocalCurso, DataHora: string): OleVariant;
    function ListPessoasPresentes(IdCurso, IdInstrutor, IdEntidade: double;
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal, DataRealizacao: TDate;
      LocalCurso, DataHora: string): OleVariant;

    function GetProxNumSeq: integer;
    function GetUltNumSeq(IdCurso: double): OleVariant;

    procedure SetWherePessoas(WherePessoas: string);
    function  GerarWherePessoas(NumEspacos: word; IdInstrutor, IdEntidade: double;
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDate;
      LocalCurso, DataHora: string): string;
    procedure AtualizarWherePessoas(Empregado: boolean; IdCurso: double; IdInstrutor,
      IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal: TDate; LocalCurso, DataHora: string);
    function  ExisteRAD_Nao_Concluido: boolean;

    function AtualizarInscricoes(Empregado, AtualizarOutrasDespesas: boolean; IdTipoProcesso,
      FlgControle, FlgAvalCurs: integer; IdCurso, IdInstrutor, IdEntidade: double;
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDateTime;
      DuracaoTeorica, DuracaoPratica, ValorCurso, ValorViagem, ValorHospedagem,
      ValorOutrasDespesas: double; NomeCurso, LocalCurso, DataHora, Instrutores: string;
      Concluido: boolean): boolean;
    function EfetuarInscricoes(Empregado: boolean; IdModulo, IdTipoProcesso: integer;
      ListaIdPessoa, ListaNomePessoa: string; IdCurso: double; FlgControle,
      FlgAvalCurso: integer; IdEntidade, IdInstrutor: double; DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal: TDateTime; DurTeorica, DurPratica,
      ValorCurso, ValorViagem, ValorHospedagem, ValorOutrasDesp: double; NomeCurso,
      LocalCurso, DataHora, Instrutores: string; Concluido: boolean): boolean;

    function EliminarInscricoes(ListaIdPessoa, ListaProxNumSeq: string;
      IdCurso: double): boolean;

    function InformarPresenca(ListaIdPessoa, ListaNumSeq: string;
      IdCurso, FlgSemAula: double; DataRealizacao: TDate): boolean;
    function RetirarPresenca(ListaIdPessoa, ListaNumSeq: string; IdCurso: double;
      DataRealizacao: TDateTime): boolean;

    function MediaAvaliacaoAlunoPorFatores(IdPessoa, IdCurso: double; NumSeq: integer): double;

    function GerarDadosAvalAlunos(FatorVariavelPorCurso: boolean;
      ovDadosAvalAluno: OleVariant): OleVariant;
    function GerarAvaliacoes_Dos_Cursos: boolean;
    function GerarAvaliacoes_Dos_Alunos: boolean;
    function GerarProcessoRAD(IdPessoa: double; Empregado: boolean; NomePessoa,
      CodCentroCusto: string;
      IdTipoProcesso: integer; ControleInterno: boolean; NomeCurso: string): boolean;
    procedure EnviarMensagem(NomeCurso: string);
    function GravarHistoricoTreinamento(Empregado: boolean; NomePessoa, CodCentroCusto: string;
      IdTipoProcesso: integer): boolean;
    function GravarAvalAluno: boolean;

    property CdsHistTrein: TCMClientDataSet read FCdsHistTrein write FCdsHistTrein;
    property CdsAvalCurso: TCMClientDataSet read FCdsAvalCurso write FCdsAvalCurso;
    property CdsAvalAluno: TCMClientDataSet read FCdsAvalAluno write FCdsAvalAluno;
    property CdsEscalaConceitos: TCMClientDataSet read FCdsEscalaConceitos;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_AVISO_RAD = 'Existem :1 Processos RAD Não Concluídos.';
  MSG_RAD_CRIADO = 'Processo RAD Nº :1 foi criado.';
  MSG_AVISO_AVAL = 'Não esqueça de fazer a sua avaliação do curso ":1" concluído em :2';
  
{ TCtrlRegTrein }

constructor TCtrlRegTrein.Create(EnviarMensagem, IntegraRAD, AvalicaoCurso,
  AvalicaoAluno: boolean; IdEmpresa, IdUsuario: integer; NomeUsuario,
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FDbHistTrein := TDbHstTrn.Create(Self);
  FDbAvalCurso := TDbAvalCurso.Create(Self);
  FDbListaPresenca := TDbListaPresenca.Create(Self);
  FCdsFatorAval := TCMClientDataSet.Create(nil);
  FCdsEscalaConceitos := TCMClientDataSet.Create(nil);
  FCtrlFatorAvalCurso := TCtrlFatorAvalCurso.Create;
  FCtrlEscalaConceitos := TCtrlEscalaConceitos.Create;

  FEnviarMensagem := EnviarMensagem;
  FAvalicaoCurso := AvalicaoCurso;
  FAvalicaoAluno := AvalicaoAluno;
  FIdEmpresa := IdEmpresa;
  FIdUsuario := IdUsuario;
  FNomeUsuario := NomeUsuario;
  FIntegraRAD := IntegraRAD;
  if (FIntegraRAD) then
    FCtrlRad := TCtrlRad.Create;

  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  inherited Create;
end;

destructor TCtrlRegTrein.Destroy;
begin
  FCtrlFatorAvalCurso.Free;
  FCtrlEscalaConceitos.Free;
  FDbHistTrein.Free;
  FDbAvalCurso.Free;
  FDbListaPresenca.Free;
  FCdsFatorAval.Free;
  FCdsEscalaConceitos.Free;
  if (IsAppServer) then
  begin
    FCdsHistTrein.Free;
    FCdsAvalCurso.Free;
    FCdsAvalAluno.Free;
  end;
  if (FIntegraRAD) then
    FCtrlRad.Free;
  inherited;
end;

procedure TCtrlRegTrein.OnCreateAppServer;
begin
  inherited;
  FCdsHistTrein := TCMClientDataSet.Create(nil);
  FCdsAvalCurso := TCMClientDataSet.Create(nil);
  FCdsAvalAluno := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegTrein.DoChangeDataBase;
begin
  inherited;
  FDbHistTrein.DataBaseName := DataBaseName;
  FDbAvalCurso.DataBaseName := DataBaseName;
  FDbListaPresenca.DataBaseName := DataBaseName;
end;

procedure TCtrlRegTrein.AfterInitialize;
begin
  inherited;
  FCtrlFatorAvalCurso.InitializeAs(Self);
  FCtrlEscalaConceitos.InitializeAs(Self);
  if (FIntegraRAD) then
    FCtrlRad.InitializeAs(Self);
end;

function TCtrlRegTrein.ListHistorico_Treinamento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN');
end;

function TCtrlRegTrein.ListHistorico_Treinamento_em_Branco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT /*+ OPTIMIZER_MODE RULE */'+CR_LF+
    '  H.*, 0 AS CONCLUIDO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN H'+CR_LF+
    'WHERE'+CR_LF+
    '  (1 = 2)');
end;

function TCtrlRegTrein.ListHistoricoTreinamentoPorPessoa(IdPessoa: double; Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos<>'', Campos,
      '  H.*, C.DESCRICAO, NVL(DATREINI, DATPLINI) AS DATAREF, 0 AS CONCLUIDO')+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN H, CURSO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.IDCURSO  = C.IDCURSO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAREF DESC');
end;

function TCtrlRegTrein.ListHistoricoTreinamentoPorCurso(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  H.DATREINI, H.DATREFIM, H.DATPLINI, H.DATPLFIM, H.FLGCONTROLE, H.IDENTIDINSTR,'+CR_LF+
    '  P.NOME,I.NOME AS INSTRUTOR, H.IDINSTRUTOR, H.LOCALCURSO, H.FLGAVALCURS,'+CR_LF+
    '  H.DATAHORA, H.INSTRUTORES'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOA I, HSTTRN H'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
    '  (H.IDENTIDINSTR = P.IDPESSOA(+)) AND'+CR_LF+
    '  (H.IDINSTRUTOR  = I.IDPESSOA(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  H.DATREINI DESC, H.DATPLINI DESC');
end;

function TCtrlRegTrein.ListAvaliacaoCurso(IdPessoa, IdCurso: double; NumSeq, Opcao: integer): OleVariant;
begin
  // Opcao = 0 (Avaliação do Curso pelo Aluno), Opcao = 1 (Avaliação do Aluno pelo Instrutor)
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  A.*, F.DESCRICAO, F.FLGAVALCURSO, F.IDESCALACONCEITOS, NVL(P.VALMAXAVALTRN,100) AS VALMAX,'+CR_LF+
    '  NVL(E.QTDECONCEITOS,1) AS QTDECONCEITOS'+CR_LF+
    'FROM'+CR_LF+
    '  AVALCURSO A, FATORAVALCURSO F, PARAMRH P, ESCALACONCEITOS E'+CR_LF+
    'WHERE'+CR_LF+
    '  (A.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (A.IDCURSO    = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
    '  (A.NUMSEQ     = ' +IntToStr(NumSeq)+ ') AND'+CR_LF+
    '  (NVL(A.FLGCURSOALUNO,0) = ' +IntToStr(Opcao)+ ') AND'+CR_LF+
    '  (A.IDFATORAVAL = F.IDFATORAVAL) AND'+CR_LF+
    '  (F.IDESCALACONCEITOS = E.IDESCALACONCEITOS(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  A.IDFATORAVAL');
end;

function TCtrlRegTrein.ListEntid(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    '(SELECT'+CR_LF+
    '   P.IDPESSOA, P.NOME, UPPER(P.NOME) AS UPNOME'+CR_LF+
    ' FROM'+CR_LF+
    '   PESSOA P, FUNCIONARIO F, INSTRUTORINTERNO IE'+CR_LF+
    ' WHERE'+CR_LF+
    '   (IE.IDPESSOA = F.IDPESSOA) AND'+CR_LF+
    '   (IE.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '   (P.TIPO      = ''F'')'+
    IFF(IdCurso>0, ' AND'+CR_LF+'  (IE.IDCURSO = ' +FloatToStr(IdCurso)+'))'+CR_LF, ')'+CR_LF)+
    'UNION'+CR_LF+
    '(SELECT'+CR_LF+
    '   P.IDPESSOA, P.NOME, UPPER(P.NOME) AS UPNOME'+CR_LF+
    ' FROM'+CR_LF+
    '   PESSOA P, TERCEIRO T'+CR_LF+
    ' WHERE'+CR_LF+
    '   (T.IDPESSOA = P.IDPESSOA))'+CR_LF+
    'UNION'+CR_LF+
    '(SELECT'+CR_LF+
    '   IDPESSOA, NOMEEMPRESA AS NOME, UPPER(NOMEEMPRESA) AS UPNOME'+CR_LF+
    ' FROM'+CR_LF+
    '   EMPRESAPROP)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  3');
end;

function TCtrlRegTrein.ListAgendaTrein: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  H.LOCALCURSO, H.DATPLINI, H.DATPLFIM, C.DESCRICAO' +CR_LF+
    'FROM' +CR_LF+
    '  HSTTRN H, FUNCIONARIO F, CURSO C' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.DATREINI       IS NULL) AND' +CR_LF+
    '  (H.FLGCONTROLE     = 1) AND' +CR_LF+
    '  (H.DATPLINI       >= TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.DATPLINI       <= TO_DATE(' +QuotedStr(DateToStr(Date+7))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.IDCURSO         = C.IDCURSO) AND' +CR_LF+
    IFF(FUsuXCCusto<>'', MontaSelSQL('F.CODCENTROCUSTO',FUsuXCCusto,2,1)+CR_LF, '')+
    IFF(FUsuXFilial<>'', MontaSelSQL('F.IDESTAB',FUsuXFilial,2,8)+CR_LF, '')+
    IFF(FIdUsuarioGeral<>'', '  (F.IDPESSOA        = ' +FIdUsuarioGeral+ ') AND'+CR_LF, '')+
    '  (H.IDPESSOA        = F.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  DATPLINI');
end;

function TCtrlRegTrein.ListConceitosEmBranco: OleVariant;
begin                   
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS COD_ESCALA, 0 AS IDESCALACONCEITOS,' +CR_LF+
    '  RPAD(''1'',20,''1'') AS NOME' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
end;

procedure TCtrlRegTrein.SelConceitos;
begin
  FCdsEscalaConceitos.Data := FCtrlEscalaConceitos.ListGeral;
end;

procedure TCtrlRegTrein.SetWherePessoas(WherePessoas: string);
begin
  FWherePessoas := WherePessoas;
end;

function TCtrlRegTrein.GerarWherePessoas(NumEspacos: word; IdInstrutor, IdEntidade: double;
  DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDate;
  LocalCurso, DataHora: string): string;
begin
  if (IdInstrutor > 0) then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.IDINSTRUTOR = ' +FloatToStr(IdInstrutor)+ ')'+CR_LF;

  if (IdEntidade > 0) then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.IDENTIDINSTR = ' +FloatToStr(IdEntidade)+ ')'+CR_LF;

  if (DataInicioPlanejado > 0) then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.DATPLINI = TO_DATE('+
      QuotedStr(DateToStr(DataInicioPlanejado))+ ',''DD/MM/YYYY''))'+CR_LF
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND (H.DATPLINI IS NULL)'+CR_LF;

  if (DataFinalPlanejado > 0) then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.DATPLFIM = TO_DATE('+
      QuotedStr(DateToStr(DataFinalPlanejado))+ ',''DD/MM/YYYY''))'+CR_LF
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND (H.DATPLFIM IS NULL)'+CR_LF;

  if (DataInicioReal > 0) then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.DATREINI = TO_DATE('+
      QuotedStr(DateToStr(DataInicioReal)) + ',''DD/MM/YYYY''))'+CR_LF
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND (H.DATREINI IS NULL)'+CR_LF;

  if (DataFinalReal > 0) then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.DATREFIM = TO_DATE('+
      QuotedStr(DateToStr(DataFinalReal)) + ',''DD/MM/YYYY''))'+CR_LF
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND (H.DATREFIM IS NULL)'+CR_LF;

  if (LocalCurso <> '') then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'(H.LOCALCURSO = ' +QuotedStr(LocalCurso)+ ')'+CR_LF
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+'((RTRIM(NVL(H.LOCALCURSO,'''')) = '''') OR'+CR_LF+
      Replicate(' ',NumEspacos)+'     (H.LOCALCURSO       IS NULL))';

  if (DataHora <> '') then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+
        '(REPLACE(REPLACE(REPLACE(H.DATAHORA,CHR(13),''''),CHR(10),''''),LPAD('' '',1,'' ''),'''') = ' +
        QuotedStr(StringReplace(StringReplace(StringReplace(DataHora,#13,'',
        [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND ((RTRIM(NVL(H.DATAHORA,'''')) = '''') OR'+CR_LF+
      Replicate(' ',NumEspacos)+'     (H.DATAHORA       IS NULL))';
end;

function TCtrlRegTrein.ExisteRAD_Nao_Concluido: boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT COUNT(*) AS CONTA'+CR_LF+
    'FROM   HSTTRN H, RADINSTPROCESSO R ' +FWherePessoas+CR_LF+
    '   AND (H.IDPROCESSO = R.IDPROCESSO)'+CR_LF+
    '   AND (R.FLGOK(+)  <> ''S'')');

  Result := (_CdsAux.FieldByName('CONTA').asInteger > 0);
  if (Result) then
    MessageInfo := 'Não Foi Possível Atualizar os Dados.' +CR_LF+
      IFF(_CdsAux.FieldByName('CONTA').asInteger>1,
        CMTranslateMsg(MSG_AVISO_RAD, [_CdsAux.FieldByName('CONTA').asString]),
        'Existe 1 Processo RAD Não Concluído.');

  _CdsAux.Free;
end;

function TCtrlRegTrein.ListPessoasNaoInscritasNoCurso(SelEmpregado: boolean;
  IdCurso, IdInstrutor, IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado,
  DataInicioReal, DataFinalReal: TDate; Ordem: TOrdemPessoas;
  LocalCurso, DataHora: string): OleVariant;
var
  SQL: TStringList;
begin
  SQL := TStringList.Create;
  with (SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA, P.NOME, '+
      IFF(SelEmpregado, 'F.MATRICULA,', 'TO_CHAR(F.IDPESSOA) AS MATRICULA,'));
    Add('  DECODE(F.TIPOCONTRATO,');
    Add('    ''E'',' +QuotedStr(('Efetivo'))+ ',');
    Add('    ''T'',' +QuotedStr(('Temporário'))+ ',');
    Add('    ''G'',' +QuotedStr(('Estagiário'))+ ',');
    Add('    ''3'',' +QuotedStr(('Terceiro'))+ ',');
    Add('    ''A'',' +QuotedStr(('Autônomo'))+ ',');
    Add('    ''S'',' +QuotedStr(('Efet. Esp.'))+ ',');
    Add('    ''P'',' +QuotedStr(('Proprietário'))+ ',');
    Add('    ' +QuotedStr(('Indefinido'))+ ') AS TIPOCONTRATO');
    Add('FROM');
    Add('  PESSOA P, '+IFF(SelEmpregado, 'FUNCIONARIO F', 'CANDIDAT F'));
    Add('WHERE');

    if (SelEmpregado) and (FUsuXCCusto <> '') then
      Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

    if (SelEmpregado) and (FUsuXFilial <> '') then
      Add(MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 4));

    Add('  (F.IDPESSOA       =  P.IDPESSOA) AND');
    Add('  (F.IDPESSOA  NOT IN (SELECT H.IDPESSOA');
    Add('                       FROM   HSTTRN H');
    Add('                       WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(30, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora)+ '))');
    Add('ORDER BY');
    case (Ordem) of
      opNome     : Add('  UPPER(P.NOME)');
      opTipoNome : Add('  TIPOCONTRATO, UPPER(P.NOME)');
    end;
  end;
  Result := GetDataPacket(SQL);
  SQL.Free;  
end;

function TCtrlRegTrein.ListPessoasInscritasNoCurso(SelHistorico: boolean; IdCurso,
  IdInstrutor, IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
  DataFinalReal: TDate; LocalCurso, DataHora: string): OleVariant;
var
  SQL: TStringList;
begin
  SQL := TStringList.Create;
  with (SQL) do                  
  begin
    Clear;
    // Empregados Inscritos
    Add('SELECT');
    Add('  UPPER(P.NOME) AS UPNOME, F.IDPESSOA, P.NOME, ' +
      IFF(SelHistorico, 'H1.*', 'H1.NUMSEQ'));
    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F,');
    Add('  (SELECT ' +IFF(SelHistorico, 'H.*', 'H.IDPESSOA, H.NUMSEQ'));
    Add('   FROM   HSTTRN H');
    Add('   WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(10, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora));
    Add('  ) H1');
    Add('WHERE');

    if (FUsuXCCusto <> '') then
      Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

    if (FUsuXFilial <> '') then
      Add(MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 4));

    Add('  (F.IDPESSOA       = H1.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = P.IDPESSOA)');
    // Candidatos Inscritos
    Add('UNION');
    Add('SELECT');
    Add('  UPPER(P.NOME) AS UPNOME, F.IDPESSOA, P.NOME, ' +
      IFF(SelHistorico, 'H1.*', 'H1.NUMSEQ'));
    Add('FROM');
    Add('  PESSOA P, CANDIDAT F,');
    Add('  (SELECT ' +IFF(SelHistorico, 'H.*', 'H.IDPESSOA, H.NUMSEQ'));
    Add('   FROM   HSTTRN H');
    Add('   WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(10, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora));
    Add('  ) H1');
    Add('WHERE');
    Add('  (F.IDPESSOA       = H1.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = P.IDPESSOA)');
    Add('ORDER BY 1');
  end;
  Result := GetDataPacket(SQL);
  SQL.Free;
end;

function TCtrlRegTrein.ListPessoasAusentes(IdCurso, IdInstrutor, IdEntidade: double;
  DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal,
  DataRealizacao: TDate; Ordem: TOrdemPessoas;
  LocalCurso, DataHora: string): OleVariant;
var
  SQL: TStringList;
begin
  SQL := TStringList.Create;
  with (SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA, P.NOME, H1.NUMSEQ, F.MATRICULA,');
    Add('  DECODE(F.TIPOCONTRATO,');
    Add('    ''E'',' +QuotedStr(('Efetivo'))+ ',');
    Add('    ''T'',' +QuotedStr(('Temporário'))+ ',');
    Add('    ''G'',' +QuotedStr(('Estagiário'))+ ',');
    Add('    ''3'',' +QuotedStr(('Terceiro'))+ ',');
    Add('    ''A'',' +QuotedStr(('Autônomo'))+ ',');
    Add('    ''S'',' +QuotedStr(('Efet. Esp.'))+ ',');
    Add('    ''P'',' +QuotedStr(('Proprietário'))+ ',');
    Add('    ' +QuotedStr(('Indefinido'))+ ') AS TIPOCONTRATO,');
    Add('  UPPER(P.NOME) AS UPNOME');
    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F,');
    Add('  (SELECT H.IDPESSOA, H.NUMSEQ');
    Add('   FROM   HSTTRN H');
    Add('   WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(10, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora));
    Add('      AND (NOT EXISTS (SELECT IDPESSOA');
    Add('                       FROM   LISTAPRESENCA L');
    Add('                       WHERE  (L.DATAPRESENCA = TO_DATE('+
      QuotedStr(DateToStr(DataRealizacao))+ ',''DD/MM/YYYY'')) AND');
    Add('                              (L.IDPESSOA     = H.IDPESSOA) AND');
    Add('                              (L.IDCURSO      = H.IDCURSO) AND');
    Add('                              (L.NUMSEQ       = H.NUMSEQ)))) H1');
    Add('WHERE');

    if (FUsuXCCusto <> '') then
      Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

    if (FUsuXFilial <> '') then
      Add(MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 4));

    Add('  (H1.IDPESSOA      =  F.IDPESSOA) AND');
    Add('  (P.IDPESSOA       =  F.IDPESSOA)');
    Add('UNION');
    Add('SELECT');
    Add('  F.IDPESSOA, P.NOME, H1.NUMSEQ, TO_CHAR(F.IDPESSOA) AS MATRICULA,');
    Add('  ' +QuotedStr(('Candidato'))+ ' AS TIPOCONTRATO,');
    Add('  UPPER(P.NOME) AS UPNOME');
    Add('FROM');
    Add('  PESSOA P, CANDIDAT F,');
    Add('  (SELECT H.IDPESSOA, H.NUMSEQ');
    Add('   FROM   HSTTRN H');
    Add('   WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(10, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora));
    Add('      AND (NOT EXISTS (SELECT IDPESSOA');
    Add('                       FROM   LISTAPRESENCA L');
    Add('                       WHERE  (L.DATAPRESENCA = TO_DATE('+
      QuotedStr(DateToStr(DataRealizacao))+ ',''DD/MM/YYYY'')) AND');
    Add('                              (L.IDPESSOA     = H.IDPESSOA) AND');
    Add('                              (L.IDCURSO      = H.IDCURSO) AND');
    Add('                              (L.NUMSEQ       = H.NUMSEQ)))) H1');
    Add('WHERE');
    Add('  (H1.IDPESSOA =  F.IDPESSOA) AND');
    Add('  (P.IDPESSOA  =  F.IDPESSOA)');
    Add('ORDER BY');
    case (Ordem) of
      opNome     : Add('  6');
      opTipoNome : Add('  5, 6');
    end;
  end;
  Result := GetDataPacket(SQL);
  SQL.Free;
end;

function TCtrlRegTrein.ListPessoasPresentes(IdCurso, IdInstrutor, IdEntidade: double;
  DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal,
  DataRealizacao: TDate; LocalCurso, DataHora: string): OleVariant;
var
  SQL: TStringList;
begin
  SQL := TStringList.Create;
  with (SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA, F.MATRICULA, P.NOME, H1.NUMSEQ, H1.FLGSEMAULA,');
    Add('  UPPER(P.NOME) AS UPNOME');
    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F,');
    Add('  (SELECT H.IDPESSOA, H.NUMSEQ, L.FLGSEMAULA');
    Add('   FROM   HSTTRN H, LISTAPRESENCA L');
    Add('   WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(10, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora));
    Add('   AND  (L.DATAPRESENCA = TO_DATE('+
      QuotedStr(DateToStr(DataRealizacao))+ ',''DD/MM/YYYY''))');
    Add('   AND  (L.IDPESSOA     = H.IDPESSOA)');
    Add('   AND  (L.IDCURSO      = H.IDCURSO)');
    Add('   AND  (L.NUMSEQ       = H.NUMSEQ)) H1');
    Add('WHERE');

    if (FUsuXCCusto <> '') then
      Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

    if (FUsuXFilial <> '') then
      Add(MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 4));

    Add('  (F.IDPESSOA       = H1.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = P.IDPESSOA)');
    Add('UNION');
    Add('SELECT');
    Add('  F.IDPESSOA, TO_CHAR(F.IDPESSOA) AS MATRICULA, P.NOME, H1.NUMSEQ, H1.FLGSEMAULA,');
    Add('  UPPER(P.NOME) AS UPNOME');
    Add('FROM');
    Add('  PESSOA P, CANDIDAT F,');
    Add('  (SELECT H.IDPESSOA, H.NUMSEQ, L.FLGSEMAULA');
    Add('   FROM   HSTTRN H, LISTAPRESENCA L');
    Add('   WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(10, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora));
    Add('   AND  (L.DATAPRESENCA = TO_DATE('+
      QuotedStr(DateToStr(DataRealizacao))+ ',''DD/MM/YYYY''))');
    Add('   AND  (L.IDPESSOA     = H.IDPESSOA)');
    Add('   AND  (L.IDCURSO      = H.IDCURSO)');
    Add('   AND  (L.NUMSEQ       = H.NUMSEQ)) H1');
    Add('WHERE');
    Add('  (F.IDPESSOA = H1.IDPESSOA) AND');
    Add('  (F.IDPESSOA = P.IDPESSOA)');   
    Add('ORDER BY 6');
  end;
  Result := GetDataPacket(SQL);
  SQL.Free;
end;

function TCtrlRegTrein.GetProxNumSeq: integer;
var
  IdCargo: double;
  c, iMaxNumSeq: integer;
  ArrCampos: array of variant;
begin
  if (FCdsHistTrein.IsEmpty) then
    Result := 1
  else
  begin
    FCdsHistTrein.DisableControls;

    SetLength(ArrCampos, FCdsHistTrein.FieldCount);
    for c:=0 to FCdsHistTrein.FieldCount-1 do
      ArrCampos[c] := FCdsHistTrein.Fields[c].Value;
    IdCargo := FCdsHistTrein.FieldByName('IDCURSO').asFloat;
    FCdsHistTrein.Cancel;

    FCdsHistTrein.Filter := 'IDCURSO = ' +FloatToStr(IdCargo);
    FCdsHistTrein.Filtered := true;
    FCdsHistTrein.First;

    if not(FCdsHistTrein.IsEmpty) then
    begin
      iMaxNumSeq := FCdsHistTrein.FieldByName('NUMSEQ').asInteger;
      while not(FCdsHistTrein.EOF) do
      begin
        if (FCdsHistTrein.FieldByName('NUMSEQ').asInteger > iMaxNumSeq) then
          iMaxNumSeq := FCdsHistTrein.FieldByName('NUMSEQ').asInteger;
        FCdsHistTrein.Next;
      end;
      Result := iMaxNumSeq + 1;
    end
    else
      Result := 1;

    FCdsHistTrein.Filtered := false;
    FCdsHistTrein.Filter := '';

    FCdsHistTrein.Insert;
    for c:=0 to FCdsHistTrein.FieldCount-1 do
      FCdsHistTrein.Fields[c].Value := ArrCampos[c];

    FCdsHistTrein.EnableControls;
  end;
end;

function TCtrlRegTrein.GetUltNumSeq(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, MAX(NUMSEQ) AS ULT_NUM_SEQ'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDCURSO  = ' +FloatToStr(IdCurso)+ ')'+CR_LF+
    'GROUP BY'+CR_LF+
    '  IDPESSOA');
end;

function TCtrlRegTrein.MediaAvaliacaoAlunoPorFatores(IdPessoa, IdCurso: double;
  NumSeq: integer): double;
var
  CdsAux: TCMClientDataSet;
begin
  CdsAux := TCMClientDataSet.Create(Nil);
  CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  SUM(A.AVALCURSO * 100 /'+CR_LF+
    '      TO_NUMBER(DECODE(NVL(F.FLGAVALCURSO,0),'+CR_LF+
    '        0,NVL(P.VALMAXAVALTRN,100),'+CR_LF+
    '        E.QTDECONCEITOS)'+CR_LF+
    '      )) / COUNT(*) AS AVALCURSO'+CR_LF+
    'FROM'+CR_LF+
    '  AVALCURSO A, FATORAVALCURSO F, ESCALACONCEITOS E, PARAMRH P'+CR_LF+
    'WHERE'+CR_LF+
    '  (A.IDPESSOA          = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (A.IDCURSO           = ' +FloatToStr(IdCurso) + ') AND'+CR_LF+
    '  (A.FLGCURSOALUNO     = 1) AND'+CR_LF+
    IFF(NumSeq = -1,'','  (A.NUMSEQ            = ' +IntToStr(NumSeq)+ ') AND'+CR_LF)+
    '  (A.IDFATORAVAL       = F.IDFATORAVAL) AND'+CR_LF+
    '  (F.IDESCALACONCEITOS = E.IDESCALACONCEITOS(+))');
  Result := CdsAux.FieldByName('AVALCURSO').asFloat;
  CdsAux.Free;
end;

function TCtrlRegTrein.GerarDadosAvalAlunos(FatorVariavelPorCurso: boolean;
  ovDadosAvalAluno: OleVariant): OleVariant;
var
  _CdsFator, _CdsAvalAluno, _CdsAval, _CdsAux: TCMClientDataSet;

{-->}function ObterEstruturaAvaliacao: OleVariant;
     var
       sSQL: string;
     begin
       sSQL :=
         'SELECT' +CR_LF+
         '  0 AS IDPESSOA, 0 AS IDCURSO, 0 AS NUMSEQ,' +CR_LF+
         '  RPAD(''1'',66,''1'') AS NOME' +CR_LF;

       while not(_CdsFator.EOF) do
       begin
         sSQL := sSQL +
           '  ,0 AS IDFATORAVAL' + IntToStr(_CdsFator.RecNo) +CR_LF+
           '  ,0 AS IDESCALACONCEITOS' + IntToStr(_CdsFator.RecNo) +CR_LF+
           '  ,0 AS FLGAVALCURSO' + IntToStr(_CdsFator.RecNo) +CR_LF+
           '  ,RPAD(''1'',20,''1'') AS COD_AVAL' + IntToStr(_CdsFator.RecNo) +CR_LF+
           '  ,RPAD(''1'',20,''1'') AS DESCR_AVAL' + IntToStr(_CdsFator.RecNo) +CR_LF+
           '  ,RPAD(''1'',200,''1'') AS NOME_AVAL' + IntToStr(_CdsFator.RecNo) +CR_LF;

         _CdsFator.Next;
       end;

       sSQL := sSQL +
         'FROM' +CR_LF+
         '  DUAL' +CR_LF+
         'WHERE' +CR_LF+
         '  (1 = 2)';

       Result := GetDataPacket(sSQL);
{-->}end;

{-->}function GetEscalaConceito: string;
     begin
       if (FCdsEscalaConceitos.Locate('IDESCALACONCEITOS',
           _CdsFator.FieldByName('IDESCALACONCEITOS').asInteger, [])) and
          (Trim(_CdsAux.FieldByName('AVALCURSO').asString) <> '0') and
          (Trim(_CdsAux.FieldByName('AVALCURSO').asString) <> '') then
       begin
         Result := FCdsEscalaConceitos.FieldByName('CONCEITO' +
           Trim(_CdsAux.FieldByName('AVALCURSO').asString)).asString
       end
       else
         Result := '';
{-->}end;

begin
  _CdsFator := TCMClientDataSet.Create(nil);
  _CdsAvalAluno := TCMClientDataSet.Create(nil);
  _CdsAval := TCMClientDataSet.Create(nil);
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    // Obtém os Fatores associados ao Curso
    _CdsAvalAluno.Data := ovDadosAvalAluno;
    //*_CdsFator.Data := FCtrlFatorAvalCurso.ListFatorAvalCurso(0, 1,
    //*  IFF(FatorVariavelPorCurso, _CdsAvalAluno.FieldByName('IDCURSO').asFloat, 0));

    // Obtém a estrutura do ClientDataSet de avaliações
    _CdsAval.Data := ObterEstruturaAvaliacao;

    while not(_CdsAvalAluno.EOF) do
    begin
      _CdsAval.Insert;

      _CdsAval.FieldByName('IDPESSOA').asFloat := _CdsAvalAluno.FieldByName('IDPESSOA').asFloat;
      _CdsAval.FieldByName('NOME').asString := _CdsAvalAluno.FieldByName('NOME').asString;
      _CdsAval.FieldByName('IDCURSO').asFloat := _CdsAvalAluno.FieldByName('IDCURSO').asFloat;
      _CdsAval.FieldByName('NUMSEQ').asInteger := _CdsAvalAluno.FieldByName('NUMSEQ').asInteger;

      _CdsAux.Data := ListAvaliacaoCurso(_CdsAvalAluno.FieldByName('IDPESSOA').asFloat,
        _CdsAvalAluno.FieldByName('IDCURSO').asFloat,
        _CdsAvalAluno.FieldByName('NUMSEQ').asInteger, 1);

      _CdsFator.First;
      while not(_CdsFator.EOF) do
      begin
        if (_CdsFator.FieldByName('INDAPLICACAO').asInteger = 0) then
        begin // Somente Fatores de Avaliação de Alunos
          _CdsFator.Next;
          continue;
        end;

        _CdsAval.FieldByName('IDFATORAVAL' + IntToStr(_CdsFator.RecNo)).asInteger :=
          _CdsFator.FieldByName('IDFATORAVAL').asInteger;
        _CdsAval.FieldByName('IDESCALACONCEITOS' + IntToStr(_CdsFator.RecNo)).asInteger :=
          _CdsFator.FieldByName('IDESCALACONCEITOS').asInteger;
        _CdsAval.FieldByName('FLGAVALCURSO' + IntToStr(_CdsFator.RecNo)).asInteger :=
          _CdsFator.FieldByName('FLGAVALCURSO').asInteger;
        _CdsAval.FieldByName('NOME_AVAL' + IntToStr(_CdsFator.RecNo)).asString :=
          _CdsFator.FieldByName('DESCRICAO').asString;

        if (_CdsAux.Locate('IDFATORAVAL', _CdsFator.FieldByName('IDFATORAVAL').Value, [])) then
        begin
          if (_CdsAux.FieldByName('FLGAVALCURSO').asInteger = 1) then
          begin
            _CdsAval.FieldByName('COD_AVAL' + IntToStr(_CdsFator.RecNo)).asString :=
              _CdsAux.FieldByName('AVALCURSO').asString;
            _CdsAval.FieldByName('DESCR_AVAL' + IntToStr(_CdsFator.RecNo)).asString :=
              GetEscalaConceito;
          end
          else
            _CdsAval.FieldByName('DESCR_AVAL' + IntToStr(_CdsFator.RecNo)).asString :=
              Trim(_CdsAux.FieldByName('AVALCURSO').asString);
        end;

        _CdsFator.Next;
      end;

      _CdsAval.Post;

      _CdsAvalAluno.Next;
    end;

    FCdsEscalaConceitos.Filtered := false;

    Result := _CdsAval.Data;
  finally
    FreeObject(_CdsFator);
    FreeObject(_CdsAvalAluno);
    FreeObject(_CdsAval);
    FreeObject(_CdsAux);
  end;
end;

function TCtrlRegTrein.GerarAvaliacoes_Dos_Cursos: boolean;
begin
  try
    FCdsFatorAval.Data := FCtrlFatorAvalCurso.ListFatorAvalCurso(0, 0,
      FCdsHistTrein.FieldByName('IDCURSO').asFloat);

    if (FCdsFatorAval.IsEmpty) then
      raise Exception.Create('Cadastre os Fatores de Avaliação dos Cursos.');

    FCdsAvalCurso.Data := ListAvaliacaoCurso(FCdsHistTrein.FieldByName('IDPESSOA').asFloat,
      FCdsHistTrein.FieldByName('IDCURSO').asFloat,
      FCdsHistTrein.FieldByName('NUMSEQ').asInteger, 0);

    if (FCdsAvalCurso.IsEmpty) then
    begin
      FCdsFatorAval.First;
      while not(FCdsFatorAval.EOF) do
      begin
        FCdsAvalCurso.Insert;
        FCdsAvalCurso.FieldByName('IDPESSOA').asFloat :=
          FCdsHistTrein.FieldByName('IDPESSOA').asFloat;
        FCdsAvalCurso.FieldByName('IDCURSO').asFloat :=
          FCdsHistTrein.FieldByName('IDCURSO').asFloat;
        FCdsAvalCurso.FieldByName('NUMSEQ').asInteger :=
          FCdsHistTrein.FieldByName('NUMSEQ').asInteger;
        FCdsAvalCurso.FieldByName('FLGAVALCURSO').asInteger :=
          FCdsFatorAval.FieldByName('FLGAVALCURSO').asInteger;
        FCdsAvalCurso.FieldByName('IDFATORAVAL').asInteger :=
          FCdsFatorAval.FieldByName('IDFATORAVAL').asInteger;
        FCdsAvalCurso.FieldByName('DESCRICAO').asString :=
          FCdsFatorAval.FieldByName('DESCRICAO').asString;
        FCdsAvalCurso.FieldByName('OBSERVACAO').asString :=
          FCdsFatorAval.FieldByName('OBSERVACAO').asString;
        FCdsAvalCurso.FieldByName('IDESCALACONCEITOS').asInteger :=
          FCdsFatorAval.FieldByName('IDESCALACONCEITOS').asInteger;
        FCdsAvalCurso.FieldByName('FLGCURSOALUNO').asInteger := 0;
        FCdsAvalCurso.Post;

        FCdsFatorAval.Next;
      end;
      FCdsAvalCurso.First;
    end;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRegTrein.GerarAvaliacoes_Dos_Alunos: boolean;
begin
  try
    FCdsFatorAval.Data := FCtrlFatorAvalCurso.ListFatorAvalCurso(0, 1,
      FCdsHistTrein.FieldByName('IDCURSO').asFloat);

    if (FCdsFatorAval.IsEmpty) then
      raise Exception.Create('Cadastre os Fatores de Avaliação dos Alunos.');

    FCdsAvalAluno.Data := ListAvaliacaoCurso(FCdsHistTrein.FieldByName('IDPESSOA').asFloat,
      FCdsHistTrein.FieldByName('IDCURSO').asFloat,
      FCdsHistTrein.FieldByName('NUMSEQ').asInteger, 1);

    if (FCdsAvalAluno.IsEmpty) then
    begin
      FCdsFatorAval.First;
      while not(FCdsFatorAval.EOF) do
      begin
        FCdsAvalAluno.Insert;
        FCdsAvalAluno.FieldByName('IDPESSOA').asFloat :=
          FCdsHistTrein.FieldByName('IDPESSOA').asFloat;
        FCdsAvalAluno.FieldByName('IDCURSO').asFloat :=
          FCdsHistTrein.FieldByName('IDCURSO').asFloat;
        FCdsAvalAluno.FieldByName('NUMSEQ').asInteger :=
          FCdsHistTrein.FieldByName('NUMSEQ').asInteger;
        FCdsAvalAluno.FieldByName('FLGAVALCURSO').asInteger :=
          FCdsFatorAval.FieldByName('FLGAVALCURSO').asInteger;
        FCdsAvalAluno.FieldByName('IDFATORAVAL').asInteger :=
          FCdsFatorAval.FieldByName('IDFATORAVAL').asInteger;
        FCdsAvalAluno.FieldByName('DESCRICAO').asString :=
          FCdsFatorAval.FieldByName('DESCRICAO').asString;
        FCdsAvalAluno.FieldByName('OBSERVACAO').asString :=
          FCdsFatorAval.FieldByName('OBSERVACAO').asString;
        FCdsAvalAluno.FieldByName('IDESCALACONCEITOS').asInteger :=
          FCdsFatorAval.FieldByName('IDESCALACONCEITOS').asInteger;
        FCdsAvalAluno.FieldByName('FLGCURSOALUNO').asInteger := 1;
        FCdsAvalAluno.Post;

        FCdsFatorAval.Next;
      end;
      FCdsAvalAluno.First;
    end;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRegTrein.GerarProcessoRAD(IdPessoa: double; Empregado: boolean;
  NomePessoa, CodCentroCusto: string;
  IdTipoProcesso: integer; ControleInterno: boolean; NomeCurso: string): boolean;
begin
  MessageInfo := '';
  try
    if (FIntegraRAD) and (IdTipoProcesso > 0) then
    begin
      if (FCdsHistTrein.FieldByName('IDPROCESSO').asInteger <= 0) and
         (FCdsHistTrein.FieldByName('DATREINI').asString = '') and
         (FCdsHistTrein.FieldByName('DATREFIM').asString = '') and
         (ControleInterno) Then
      begin
        FCtrlRad.TipoProcesso := IdTipoProcesso;
        FCtrlRad.IdPessoa := FIdEmpresa;
        FCtrlRad.IdPessResp := trunc(IdPessoa);
        FCtrlRad.OBS := 'Treinamento de: ' +NomePessoa+CR_LF+
                   'Curso: ' +NomeCurso+CR_LF+
                   IFF(FCdsHistTrein.FieldByName('DATPLINI').IsNull,
                   'Com o início a ser definido',
                   'Iniciando em: ' +FCdsHistTrein.FieldByName('DATPLINI').asString)+CR_LF+
                   IFF(FCdsHistTrein.FieldByName('DATPLFIM').IsNull,
                   'Término a ser definido',
                   'Terminando em: ' +FCdsHistTrein.FieldByName('DATPLFIM').asString)+CR_LF+
                   'Carga Horária: '+FCdsHistTrein.FieldByName('DUR_TOT').asString+CR_LF+
                   IFF(FCdsHistTrein.FieldByName('LOCALCURSO').IsNull,'',
                   'Local: '+FCdsHistTrein.FieldByName('LOCALCURSO').AsString);
        FCtrlRad.Valor := FCdsHistTrein.FieldByName('VALOR').asFloat +
          FCdsHistTrein.FieldByName('DESP_VIAG').asFloat +
          FCdsHistTrein.FieldByName('DESP_ESTAD').asFloat +
          FCdsHistTrein.FieldByName('DESP_OUTR').asFloat;

        FCtrlRad.IdEmpresa := FIdEmpresa;
        if (Empregado) then
          FCtrlRad.CodCentroCusto := CodCentroCusto;

        FCdsHistTrein.Edit;
        FCdsHistTrein.FieldByName('IDPROCESSO').asInteger := FCtrlRad.IniciarProcesso;
        FCdsHistTrein.Post;

        if (FCdsHistTrein.FieldByName('IDPROCESSO').asInteger < 0) then
          raise Exception.Create('Erro ao tentar instanciar o processo no RAD.')
        else
          MessageInfo := CMTranslateMsg(MSG_RAD_CRIADO, [FCdsHistTrein.FieldByName('IDPROCESSO').asString]);
      end
      else
      if (FCdsHistTrein.FieldByName('IDPROCESSO').asInteger > 0) then
      begin
        try
          ExecSQL('UPDATE RADINSTPROCESSO SET VLRPROC = ' +
            OraNumero(FloatToStr(FCdsHistTrein.FieldByName('VALOR').asFloat +
              FCdsHistTrein.FieldByName('DESP_VIAG').asFloat +
              FCdsHistTrein.FieldByName('DESP_ESTAD').asFloat +
              FCdsHistTrein.FieldByName('DESP_OUTR').asFloat)) +
            ' WHERE IDPROCESSO = ' +FCdsHistTrein.FieldByName('IDPROCESSO').asString);
        except
          raise Exception.Create('Erro ao tentar atualizar o processo no RAD.');
        end;
      end;
    end;
    Result := true;
  except
    Result := false;
  end;
end;

procedure TCtrlRegTrein.EnviarMensagem(NomeCurso: string);
var
  bOk: boolean;
begin
  bOk := (EnviarMensagemCM(FIdUsuario, FCdsHistTrein.FieldByName('IDPESSOA').asInteger,
    Trim(FNomeUsuario), 'Avaliação de Treinamento', tdUsuario,
    CMTranslateMsg(MSG_AVISO_AVAL, [NomeCurso, FCdsHistTrein.FieldByName('DATREFIM').asString])));

  if not(bOk) then
    raise Exception.Create('Não foi possível enviar a mensagem para o Curso:' +CR_LF+
      Trim(NomeCurso));
end;

function TCtrlRegTrein.GravarHistoricoTreinamento(Empregado: boolean; NomePessoa,
  CodCentroCusto: string; IdTipoProcesso: integer): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHistoricoTreinamento(FCdsHistTrein.Data,
      FCdsAvalCurso.Data, FCdsAvalAluno.Data, Empregado, NomePessoa, CodCentroCusto,
      IdTipoProcesso, FIntegraRAD, FAvalicaoAluno, FIdEmpresa, FIdUsuario,
      FNomeUsuario, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);

    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsHistTrein.DisableControls;

    // Enviar Todas as mensagens para o Treinando
    if (FEnviarMensagem) then
    try
      FCdsHistTrein.First;
      while not(FCdsHistTrein.EOF) do
      begin
        if (FCdsHistTrein.FieldByName('CONCLUIDO').asInteger = 1) then
          EnviarMensagem(FCdsHistTrein.FieldByName('DESCRICAO').asString);
        FCdsHistTrein.Next;
      end;
    except
      // Somente para ignorar o aviso de envio das mensagens, caso existam.
    end;

    try
      StartTransaction;

      // Integração com o RAD
      if (FIntegraRAD) then
      begin
        FCdsHistTrein.First;
        while not(FCdsHistTrein.EOF) do
        begin
          if not(GerarProcessoRAD(FCdsHistTrein.FieldByName('IDPESSOA').asFloat,
                 Empregado, NomePessoa, CodCentroCusto, IdTipoProcesso,
                 FCdsHistTrein.FieldByName('FLGCONTROLE').asInteger = 1,
                 FCdsHistTrein.FieldByName('DESCRICAO').asString)) then
            raise Exception.Create(MessageInfo);

          FCdsHistTrein.Next;
        end;
      end;

      // Gravar os Dados dos Cursos
      Result := ApplyCds(FCdsHistTrein, FDbHistTrein, [], []);
      if not(Result) then
        raise Exception.Create(FDbHistTrein.MessageInfo);

      // Gravar os Avaliações dos Cursos
      if (FAvalicaoCurso) then
      begin
        Result := ApplyCds(FCdsAvalCurso, FDbAvalCurso, [], []);
        if not(Result) then
          raise Exception.Create(FDbAvalCurso.MessageInfo);
      end;

      // Gravar os Avaliações dos Alunos
      if (FAvalicaoAluno) then
      begin
        Result := ApplyCds(FCdsAvalAluno, FDbAvalCurso, [], []);
        if not(Result) then
          raise Exception.Create(FDbAvalCurso.MessageInfo);
      end;

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsHistTrein.EnableControls;
  end;
end;

function TCtrlRegTrein.GravarAvalAluno: boolean;
var
  c, iNum: integer;
  sValAvaliacao: string;
  _CdsAux: TCMClientDataSet;

{-->}function GetAvaliacaoAtual(Num: integer): string;
     begin
       if (FCdsAvalAluno.FieldByName('FLGAVALCURSO' + IntToStr(Num)).asInteger = 1) then
         Result := Trim(FCdsAvalAluno.FieldByName('COD_AVAL' + IntToStr(Num)).asString)
       else
         Result := Trim(FCdsAvalAluno.FieldByName('DESCR_AVAL' + IntToStr(Num)).asString);
{-->}end;

{-->}procedure IncluirAvaliacoes(NumAval: integer);
     begin
       if (sValAvaliacao <> '') then // Só gravar quando for informada a Avaliação
       begin
         _CdsAux.Insert;
         _CdsAux.FieldByName('IDPESSOA').asFloat :=
           FCdsAvalAluno.FieldByName('IDPESSOA').asFloat;
         _CdsAux.FieldByName('IDCURSO').asFloat :=
           FCdsAvalAluno.FieldByName('IDCURSO').asFloat;
         _CdsAux.FieldByName('NUMSEQ').asInteger :=
           FCdsAvalAluno.FieldByName('NUMSEQ').asInteger;
         _CdsAux.FieldByName('OBSERVACAO').Clear;
         _CdsAux.FieldByName('FLGCURSOALUNO').asInteger := 1;
         _CdsAux.FieldByName('IDFATORAVAL').asInteger :=
           FCdsAvalAluno.FieldByName('IDFATORAVAL' + IntToStr(NumAval)).asInteger;
         _CdsAux.FieldByName('AVALCURSO').asString := sValAvaliacao;
         _CdsAux.Post;
       end;  
{-->}end;

{-->}procedure AlterarAvaliacoes;
     begin
       // Apagar a Avaliação caso o valor não seja passado
       if (sValAvaliacao = '') then
         _CdsAux.Delete
       else
       // Só gravar quando a Avaliação for diferente da que está armazenada no BD
       if (sValAvaliacao <> _CdsAux.FieldByName('AVALCURSO').asString) then
       begin
         _CdsAux.Edit;
         _CdsAux.FieldByName('AVALCURSO').asString := sValAvaliacao;
         _CdsAux.Post;
       end;
{-->}end;

begin
  if (ConnectionSide = cnsClient) then
  begin
    // Deve ser passado para a Aplicação Servidora somente o registro atual
    _CdsAux := TCMClientDataSet.Create(nil);
    _CdsAux.Data := FCdsAvalAluno.Data;
    _CdsAux.EmptyDataSet;
    _CdsAux.Insert;
    for c:=0 to FCdsAvalAluno.FieldCount-1 do
      _CdsAux.Fields[c].Value := FCdsAvalAluno.Fields[c].Value;
    _CdsAux.Post;
    Result := Connection.AppServer.GravarAvalAluno(_CdsAux.Data, FUsuXFilial,
      FUsuXCCusto, FIdUsuarioGeral);
    _CdsAux.Free;
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsAux := TCMClientDataSet.Create(nil);
    FCdsAvalAluno.DisableControls;
    try
      // Calcular o número de Avaliações
      iNum := 0;
      for c:=0 to FCdsAvalAluno.FieldCount-1 do
        if (Copy(FCdsAvalAluno.Fields[c].FieldName,1,8) = 'COD_AVAL') then
          Inc(iNum);

      _CdsAux.Data := ListAvaliacaoCurso(FCdsAvalAluno.FieldByName('IDPESSOA').asFloat,
        FCdsAvalAluno.FieldByName('IDCURSO').asFloat,
        FCdsAvalAluno.FieldByName('NUMSEQ').asInteger, 1);

      StartTransaction;
      for c:=1 to iNum do
      begin
        sValAvaliacao := GetAvaliacaoAtual(c);

        if (_CdsAux.IsEmpty) or not(_CdsAux.Locate('IDFATORAVAL',
            FCdsAvalAluno.FieldByName('IDFATORAVAL' + IntToStr(c)).asInteger, [])) then
          IncluirAvaliacoes(c)
        else
          AlterarAvaliacoes;

        _CdsAux.Next;
      end;

      Result := ApplyCds(_CdsAux, FDbAvalCurso, [], []);
      if not(Result) then
        raise Exception.Create(FDbAvalCurso.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsAvalAluno.EnableControls;
    _CdsAux.Free;
  end;
end;

function TCtrlRegTrein.EfetuarInscricoes(Empregado: boolean; IdModulo, IdTipoProcesso: integer;
  ListaIdPessoa, ListaNomePessoa: string; IdCurso: double; FlgControle, FlgAvalCurso: integer;
  IdEntidade, IdInstrutor: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
  DataFinalReal: TDateTime; DurTeorica, DurPratica, ValorCurso, ValorViagem, ValorHospedagem,
  ValorOutrasDesp: double; NomeCurso, LocalCurso, DataHora, Instrutores: string;
  Concluido: boolean): boolean;
var
  bOk: boolean;
  _CdsAux: TCMClientDataSet;
  sIdPessoa, NomePessoa, ProxNumSeq: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EfetuarInscricoes(FIntegraRAD, IdModulo, FIdEmpresa,
      FIdUsuario, FNomeUsuario, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, Empregado,
      IdTipoProcesso, ListaIdPessoa, ListaNomePessoa, IdCurso, FlgControle, FlgAvalCurso,
      IdEntidade, IdInstrutor, DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal, DurTeorica, DurPratica, ValorCurso, ValorViagem, ValorHospedagem,
      ValorOutrasDesp, NomeCurso, LocalCurso, DataHora, Instrutores, Concluido,
      FCdsHistTrein.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsHistTrein.EmptyDataSet;
    try
      StartTransaction;

      while (ListaIdPessoa <> '') do
      begin
        ExtraiString(ListaIdPessoa, sIdPessoa, ',');
        ExtraiString(ListaNomePessoa, NomePessoa, ',');

        if (Pos('=',sIdPessoa) > 0) then
        begin
          ProxNumSeq := sIdPessoa;
          ExtraiString(ProxNumSeq, sIdPessoa, '=');
        end
        else
          ProxNumSeq := '1';

        FCdsHistTrein.Insert;
        FCdsHistTrein.FieldByName('IDPESSOA').asString := sIdPessoa;
        FCdsHistTrein.FieldByName('IDCURSO').asFloat := IdCurso;
        FCdsHistTrein.FieldByName('NUMSEQ').asString := ProxNumSeq;
        FCdsHistTrein.FieldByName('FLGCONTROLE').asInteger := FlgControle;
        FCdsHistTrein.FieldByName('FLGAVALCURS').asInteger := FlgAvalCurso;
        FCdsHistTrein.FieldByName('IDMODULO').asInteger := IdModulo;

        if (IdEntidade > 0) then
          FCdsHistTrein.FieldByName('IDENTIDINSTR').asFloat := IdEntidade;

        if (IdInstrutor > 0) then
          FCdsHistTrein.FieldByName('IDINSTRUTOR').asFloat := IdInstrutor;

        if (DataInicioPlanejado > 0) then
          FCdsHistTrein.FieldByName('DATPLINI').asDateTime := DataInicioPlanejado;

        if (DataFinalPlanejado > 0) then
          FCdsHistTrein.FieldByName('DATPLFIM').asDateTime := DataFinalPlanejado;

        if (DataInicioReal > 0) then
          FCdsHistTrein.FieldByName('DATREINI').asDateTime := DataInicioReal;

        if (DataFinalReal > 0) then
          FCdsHistTrein.FieldByName('DATREFIM').asDateTime := DataFinalReal;

        FCdsHistTrein.FieldByName('DUR_TEOR').asFloat := DurTeorica;
        FCdsHistTrein.FieldByName('DUR_PRAT').asFloat := DurPratica;
        FCdsHistTrein.FieldByName('DUR_TOT').asFloat := DurTeorica + DurPratica;
        FCdsHistTrein.FieldByName('VALOR').asFloat := ValorCurso;
        FCdsHistTrein.FieldByName('DESP_VIAG').asFloat := ValorViagem;
        FCdsHistTrein.FieldByName('DESP_ESTAD').asFloat := ValorHospedagem;
        FCdsHistTrein.FieldByName('DESP_OUTR').asFloat := ValorOutrasDesp;
        FCdsHistTrein.FieldByName('LOCALCURSO').asString := Trim(LocalCurso);
        FCdsHistTrein.FieldByName('DATAHORA').asString := DataHora;
        FCdsHistTrein.FieldByName('INSTRUTORES').asString := Instrutores;
        FCdsHistTrein.Post;

        // Integração com o RAD
        if (FIntegraRAD) then
        begin
          _CdsAux := TCMClientDataSet.Create(nil);
          _CdsAux.Data := GetDataPacket('SELECT CODCENTROCUSTO FROM FUNCIONARIO WHERE'+
            '(IDPESSOA = ' +sIdPessoa+ ')');
          bOk := GerarProcessoRAD(FCdsHistTrein.FieldByName('IDPESSOA').asFloat,
            Empregado, NomePessoa, _CdsAux.FieldByName('CODCENTROCUSTO').asString,
            IdTipoProcesso, FCdsHistTrein.FieldByName('FLGCONTROLE').asInteger = 1,
            Trim(NomeCurso));
          _CdsAux.Free;

          if not(bOk) then
            raise Exception.Create(MessageInfo);
        end;
      end;

      // Gravar os Dados dos Cursos
      Result := ApplyCds(FCdsHistTrein, FDbHistTrein, [], []);
      if not(Result) then
        raise Exception.Create(FDbHistTrein.MessageInfo);

      Commit;

      // Enviar mensagens
      if (Concluido) then
      begin
        FCdsHistTrein.First;
        while not(FCdsHistTrein.EOF) do
        begin
          EnviarMensagem(NomeCurso);
          FCdsHistTrein.Next;
        end;
      end;
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

function TCtrlRegTrein.EliminarInscricoes(ListaIdPessoa, ListaProxNumSeq: string;
  IdCurso: double): boolean;
var
  sIdPessoa, ProxNumSeq: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EliminarInscricoes(ListaIdPessoa, ListaProxNumSeq, IdCurso);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      while (ListaIdPessoa <> '') do
      begin
        ExtraiString(ListaIdPessoa, sIdPessoa, ',');
        ExtraiString(ListaProxNumSeq, ProxNumSeq, ',');

        Result := ExecSQL(
          'DELETE LISTAPRESENCA'+CR_LF+
          'WHERE  (IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
          '       (IDCURSO  = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
          '       (NUMSEQ   = ' +ProxNumSeq+ ')');
        if not(Result) then
          raise Exception.Create(MessageInfo);

        Result := ExecSQL(
          'DELETE HSTTRN'+CR_LF+
          'WHERE  (IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
          '       (IDCURSO  = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
          '       (NUMSEQ   = ' +ProxNumSeq+ ')');
        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;

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
end;

function TCtrlRegTrein.AtualizarInscricoes(Empregado, AtualizarOutrasDespesas: boolean;
  IdTipoProcesso, FlgControle, FlgAvalCurs: integer; IdCurso, IdInstrutor, IdEntidade: double;
  DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDateTime;
  DuracaoTeorica, DuracaoPratica, ValorCurso, ValorViagem, ValorHospedagem,
  ValorOutrasDespesas: double; NomeCurso, LocalCurso, DataHora, Instrutores: string;
  Concluido: boolean): boolean;
var
  sSQL, sWherePessoas: string;
  _CdsBLOB: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtualizarInscricoes(FIntegraRAD, FIdEmpresa,
      FIdUsuario, FNomeUsuario, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, Empregado,
      AtualizarOutrasDespesas, IdTipoProcesso, FlgControle, FlgAvalCurs, IdCurso, IdInstrutor,
      IdEntidade, DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal,
      DuracaoTeorica, DuracaoPratica, ValorCurso, ValorViagem, ValorHospedagem,
      ValorOutrasDespesas, NomeCurso, LocalCurso, DataHora, Instrutores, Concluido,
      FWherePessoas);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsBLOB := TCMClientDataSet.Create(nil);
    try
      try
        // Excluir os Aliases da tabela da Histórico
        sWherePessoas := TrocaCaracter(FWherePessoas, 'H.', '');

        sSQL := 'UPDATE HSTTRN SET'+CR_LF;

        if (IdInstrutor > 0) then
          sSQL := sSQL+ ' IDINSTRUTOR=' +FloatToStr(IdInstrutor)+CR_LF
        else
          sSQL := sSQL+ ' IDINSTRUTOR=NULL'+CR_LF;

        if (IdEntidade > 0) then
          sSQL := sSQL+ ', IDENTIDINSTR=' +FloatToStr(IdEntidade)+CR_LF
        else
          sSQL := sSQL+ ', IDENTIDINSTR=NULL'+CR_LF;

        if (DataInicioPlanejado > 0) then
          sSQL := sSQL+ ', DATPLINI=TO_DATE('+
            QuotedStr(DateToStr(DataInicioPlanejado))+ ',''DD/MM/YYYY'')'+CR_LF
        else
          sSQL := sSQL+ ', DATPLINI=NULL'+CR_LF;

        if (DataFinalPlanejado > 0) then
          sSQL := sSQL+ ', DATPLFIM=TO_DATE('+
            QuotedStr(DateToStr(DataFinalPlanejado))+ ',''DD/MM/YYYY'')'+CR_LF
        else
          sSQL := sSQL+ ', DATPLFIM=NULL'+CR_LF;

        if (DataInicioReal > 0) then
          sSQL := sSQL+ ', DATREINI=TO_DATE('+
            QuotedStr(DateToStr(DataInicioReal)) + ',''DD/MM/YYYY'')'+CR_LF
        else
          sSQL := sSQL+ ', DATREINI=NULL'+CR_LF;

        if (DataFinalReal > 0) then
          sSQL := sSQL+ ', DATREFIM=TO_DATE('+
            QuotedStr(DateToStr(DataFinalReal)) + ',''DD/MM/YYYY'')'+CR_LF
        else
          sSQL := sSQL+ ', DATREFIM=NULL'+CR_LF;

        sSQL := sSQL +', FLGCONTROLE='+ IntToStr(FlgControle)+CR_LF;
        sSQL := sSQL +', FLGAVALCURS='+ IntToStr(FlgAvalCurs)+CR_LF;
        sSQL := sSQL +', DUR_TEOR='+ Float2String(DuracaoTeorica)+CR_LF;
        sSQL := sSQL +', DUR_PRAT='+ Float2String(DuracaoPratica)+CR_LF;
        sSQL := sSQL +', DUR_TOT='+ Float2String(DuracaoTeorica + DuracaoPratica)+CR_LF;
        sSQL := sSQL +', VALOR='+ Float2String(ValorCurso)+CR_LF;

        if (AtualizarOutrasDespesas) then
        begin
          sSQL := sSQL + ', DESP_VIAG=' +Float2String(ValorViagem)+CR_LF;
          sSQL := sSQL + ', DESP_ESTAD=' +Float2String(ValorHospedagem)+CR_LF;
          sSQL := sSQL + ', DESP_OUTR=' +Float2String(ValorOutrasDespesas)+CR_LF;
        end;

        sSQL := sSQL + ', LOCALCURSO=' +QuotedStr(LocalCurso)+CR_LF;

        StartTransaction;

        // Gravar os Dados dos Cursos
        ExecSQL(sSQL + sWherePessoas);

        // Gravar campos BLOB dos Cursos
        _CdsBLOB.Data := GetDataPacket('SELECT * FROM HSTTRN ' + sWherePessoas);
        while not(_CdsBLOB.EOF) do
        begin
          _CdsBLOB.Edit;
          _CdsBLOB.FieldByName('DATAHORA').asString := DataHora;
          _CdsBLOB.FieldByName('INSTRUTORES').asString := Instrutores;
          _CdsBLOB.Post;
          _CdsBLOB.Next;
        end;

        Result := ApplyCds(_CdsBLOB, FDbHistTrein, [], []);
        if not(Result) then
          raise Exception.Create(FDbHistTrein.MessageInfo);
      
        AtualizarWherePessoas(Empregado, IdCurso, IdInstrutor, IdEntidade,
          DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal,
          LocalCurso, DataHora);

        // Excluir os Aliases da tabela da Histórico
        sWherePessoas := TrocaCaracter(FWherePessoas, 'H.', '');

        // Atualiza Valor no RAD
        if (FIntegraRAD) and (IdTipoProcesso > 0) then
        begin
          try
            ExecSQL('UPDATE RADINSTPROCESSO SET VLRPROC = ' +
              OraNumero(FloatToStr(ValorCurso + IFF(AtualizarOutrasDespesas, ValorViagem +
              ValorHospedagem + ValorOutrasDespesas,0))) +
              ' WHERE IDPROCESSO IN (SELECT IDPROCESSO FROM HSTTRN ' +
              sWherePessoas+ ' AND IDPROCESSO IS NOT NULL)');
          except
            raise Exception.Create('- Ao tentar atualizar o processo no RAD.');
          end;
        end;

        Commit;

        // Enviar mensagens para os cursos concluídos
        if (Concluido) then
        begin
          FCdsHistTrein.Data := GetDataPacket('SELECT IDPESSOA FROM HSTTRN H ' +sWherePessoas);
          while not(FCdsHistTrein.EOF) do
          begin
            EnviarMensagem(NomeCurso);
            FCdsHistTrein.Next;
          end;
        end;

        Result := true;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo :=
            ('Não Foi Possível Atualizar os Dados.') +CR_LF+
            ('Erro:') +CR_LF+ E.Message;
        end;
      end;
    finally
      FreeObject(_CdsBLOB);
    end;
  end;
end;

function TCtrlRegTrein.InformarPresenca(ListaIdPessoa, ListaNumSeq: string;
  IdCurso, FlgSemAula: double; DataRealizacao: TDate): boolean;
var
  sIdPessoa, sNumSeq: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.InformarPresenca(ListaIdPessoa, ListaNumSeq, IdCurso,
      FlgSemAula, DataRealizacao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      while (ListaIdPessoa <> '') do
      begin
        ExtraiString(ListaIdPessoa, sIdPessoa, ',');
        ExtraiString(ListaNumSeq, sNumSeq, ',');

        Result := ExecSQL(
          'INSERT INTO LISTAPRESENCA (IDPESSOA, IDCURSO, NUMSEQ, FLGSEMAULA, DATAPRESENCA) VALUES ('+
          sIdPessoa+ ', '+
          FloatToStr(IdCurso)+ ', '+
          sNumSeq+', '+
          FloatToStr(FlgSemAula)+ ', '+
          'TO_DATE(' +QuotedStr(DateToStr(DataRealizacao))+ ',''DD/MM/YYYY''))');

        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;

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
end;

function TCtrlRegTrein.RetirarPresenca(ListaIdPessoa, ListaNumSeq: string; IdCurso: double;
  DataRealizacao: TDateTime): boolean;
var
  sIdPessoa, sNumSeq: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.RetirarPresenca(ListaIdPessoa, ListaNumSeq, IdCurso,
      DataRealizacao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      while (ListaIdPessoa <> '') do
      begin
        ExtraiString(ListaIdPessoa, sIdPessoa, ',');
        ExtraiString(ListaNumSeq, sNumSeq, ',');

        Result := ExecSQL(
          'DELETE LISTAPRESENCA'+CR_LF+
          'WHERE  (IDPESSOA     = ' +sIdPessoa+ ') AND'+CR_LF+
          '       (IDCURSO      = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
          '       (NUMSEQ       = ' +sNumSeq+ ') AND'+CR_LF+
          '       (DATAPRESENCA = TO_DATE(' +
            QuotedStr(DateToStr(DataRealizacao))+ ',''DD/MM/YYYY''))');
            
        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;

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
end;

procedure TCtrlRegTrein.AtualizarWherePessoas(Empregado: boolean; IdCurso: double;
  IdInstrutor, IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
  DataFinalReal: TDate; LocalCurso, DataHora: string);
begin
  // Salva Condições para eventual atualização posterior
  FWherePessoas :=
    'WHERE (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')'+CR_LF+
    GerarWherePessoas(7, IdInstrutor, IdEntidade, DataInicioPlanejado, DataFinalPlanejado,
      DataInicioReal, DataFinalReal, LocalCurso, DataHora);

  if (Empregado) and (FUsuXCCusto <> '') then
    FWherePessoas := FWherePessoas +CR_LF+
      '       AND (H.IDPESSOA IN (SELECT IDPESSOA'+CR_LF+
      '                           FROM   FUNCIONARIO'+CR_LF+
      '                           WHERE  ' +MontaLinhaSelSQL('  (CODCENTROCUSTO',FUsuXCCusto,1,false)+ '))';

  if (Empregado) and (FUsuXFilial <> '') then
    FWherePessoas := FWherePessoas +CR_LF+
      '       AND (H.IDPESSOA IN (SELECT IDPESSOA'+CR_LF+
      '                           FROM   FUNCIONARIO'+CR_LF+
      '                           WHERE  ' +MontaLinhaSelSQL('  (IDESTAB', FUsuXFilial, 1,false)+ '))';
end;

end.
