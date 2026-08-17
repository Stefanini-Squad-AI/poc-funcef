{-------------------------------------------------------------------------------------------------
Nº SOL......: 245965 
Nº PPM......: 635849
Data........: 26/02/2015
Responsável.: Wylliam Leite da Silva
Descrição...: Ajustes na funcionalidade Registro de Treinamento. 
Rotinas.....: Várias.
--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: varias
{--------------------------------------------------------------------------------------------------
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------
Rotina......: ObtemSeqAno, ObtemAnoCorrente, ObterSigla
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de método para obter o ano e a sequencia para termo de compromisso
--------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/11/2002                                 }
{                                                       }
{*******************************************************}
unit uCtrlRegTrein;


//==================================================================================
//Analista.: Henrique Massão
//Kintana..: 625235
//SOL......: 124003
//Data.....: 04/09/2009
//Descrição: dblckEntid recebe o campo razaosocial e não mais o idpessoa.
//===============================================================================
//Analista.: Cássio Rovaroto de Camargo
//Kintana..: 558945
//SOL......: 116908
//Data.....: 18/06/2009
//Rotina...: ListPessoasNaoInscritasNoCurso
//Descrição: Inclusão do campo IDSITFUNC e TIPOSIT, tabela SITFUNC, para executar o
//           filtro por situação funcional na tela Registro Coletivo de Treinamento.
//----------------------------------------------------------------------------------
//==================================================================================


interface

uses Classes, Db, Controls, SysUtils, uSistema, uCmDbObject, uCmControlObject, CorreioCM,
  uCtrlRad, uCMClientDataSet, uCtrlCustomRH, uCtrlFatorAvalCurso, uCtrlEscalaConceitos,
  uDbHstTrn, uDbAvalCurso, uDbListaPresenca,
  uDbInscritosTurma, uCtrlFuncoesRH, uDbTurma, // Edilaine - SOL 137268-7062 / KTN 1497173
  // Thiago Melo 177768 KTN 1635450 INI
  uDbDespesas,
  // Thiago Melo 177768 KTN 1635450
  Wwquery;

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

    FDbInscritosTurma : TDbInscritosTurma; // Edilaine - SOL 137268-7062 / KTN 1497173
    FDbTurma          : TDbTurma;          // Edilaine - SOL 137268-7062 / KTN 1497173
    FCdsTurma         : TCMClientDataSet;  // Edilaine - SOL 137268-7062 / KTN 1497173
    FCdsInscritos     : TCMClientDataSet;  // Edilaine - SOL 137268-7062 / KTN 1497173

    FCdsHistTrein: TCMClientDataSet;
    FCdsAvalCurso: TCMClientDataSet;
    FCdsAvalAluno: TCMClientDataSet;
    FCdsFatorAval: TCMClientDataSet;
    FCdsEscalaConceitos: TCMClientDataSet;
    // Thiago Melo SOL 177768 Kintana 1635450 INI
    FCdsMensal : TCMClientDataSet;
    FDbMensal  : TDbDespesas;
    //

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

    function ExcluiInscritos(iIdPessoa : integer) : boolean;       // Edilaine - SOL 137268-7062 / KTN 1497173
    function AtualizaRateioTurma( ListaTurma : String ) : boolean; // Edilaine - SOL 137268-7062 / KTN 1497173

  public
    constructor Create(EnviarMensagem, IntegraRAD, AvalicaoCurso, AvalicaoAluno: boolean; IdEmpresa,
      IdUsuario: integer; NomeUsuario, UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListHistorico_Treinamento: OleVariant;
    function ListHistorico_Treinamento_em_Branco: OleVariant;
    function ListHistoricoTreinamentoPorPessoa(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListHistoricoTreinamentoPorCurso(IdCurso: double): OleVariant;
    function ListAvaliacaoCurso(IdPessoa, IdCurso: double; NumSeq, Opcao: integer): OleVariant;
    function ListEntid(IdCurso: double = 0): OleVariant;
    function ListAgendaTrein: OleVariant;
    function ListConceitosEmBranco: OleVariant;
    // Thiago Melo SOL 177768 Kintana 1635450 INI
    function ListaMensalidades (idPessoa, idCurso, NumSeq : Double; Tipo : SmallInt) : OleVariant;
    // Thiago Melo SOL 177768 Kintana 1635450
    procedure SelConceitos;

    function ListPessoasNaoInscritasNoCurso(SelEmpregado: boolean; IdCurso, IdInstrutor,
      IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal: TDate; Ordem: TOrdemPessoas;
      LocalCurso, DataHora: string; sTipoSit : string = ''): OleVariant;
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
    function GetHabilitarParcialmente : boolean;                        // Edilaine - SOL 137268-7062 / KTN 1497173
    function GravarTreinamentoColetivo : boolean;                       // Edilaine - SOL 137268-7062 / KTN 1497173
    function ListaHistoricoPorCurso(IdCurso: double): OleVariant;       // Edilaine - SOL 137268-7062 / KTN 1497173

    function  GerarWherePessoas(NumEspacos: word; IdInstrutor, IdEntidade: double;
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDate;
      LocalCurso, DataHora: string): string;
    procedure AtualizarWherePessoas(Empregado: boolean; IdCurso: double; IdInstrutor,
      IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal: TDate; LocalCurso, DataHora: string);
    function  ExisteRAD_Nao_Concluido: boolean;

    function AtualizarInscricoes(Empregado, AtualizarOutrasDespesas: boolean; IdTipoProcesso,
      FlgControle, FlgAvalCurs: integer; IdCurso, IdInstrutor, IdEntidade: double;
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDate;
      DuracaoTeorica, DuracaoPratica, ValorCurso, ValorViagem, ValorHospedagem,
      ValorOutrasDespesas: double; NomeCurso, LocalCurso, DataHora, Instrutores: string;
      Concluido: boolean): boolean;
    function EfetuarInscricoes(Empregado: boolean; IdTipoProcesso: integer; ListaIdPessoa,
      ListaNomePessoa: string; IdCurso: double; FlgControle, FlgAvalCurso: integer;
      IdEntidade, IdInstrutor: double; DataInicioPlanejado, DataFinalPlanejado, DataInicioReal,
      DataFinalReal: TDate; DurTeorica, DurPratica, ValorCurso, ValorViagem, ValorHospedagem,
      ValorOutrasDesp: double; NomeCurso, LocalCurso, DataHora, Instrutores: string;
      Concluido: boolean): boolean;
    function EliminarInscricoes(ListaIdPessoa, ListaProxNumSeq: string;
      IdCurso: double): boolean;

    function InformarPresenca(ListaIdPessoa, ListaNumSeq: string;
      IdCurso, FlgSemAula: double; DataRealizacao: TDate): boolean;
    function RetirarPresenca(ListaIdPessoa, ListaNumSeq: string; IdCurso: double;
      DataRealizacao: TDate): boolean;

    function MediaAvaliacaoAlunoPorFatores(IdPessoa, IdCurso: double; NumSeq: integer): double;

    function GerarDadosAvalAlunos(FatorVariavelPorCurso: boolean;
      ovDadosAvalAluno: OleVariant): OleVariant;
    function GerarAvaliacoes_Dos_Cursos: boolean;
    function GerarAvaliacoes_Dos_Alunos: boolean;
    function GerarProcessoRAD(IdPessoa: double; Empregado: boolean; NomePessoa,
      CodCentroCusto: string;
      IdTipoProcesso: integer; ControleInterno: boolean; NomeCurso: string): boolean;
    function ObterSigla(idCurso: Double): OleVariant;
    function ObtemAnoCorrente: String;
    function ObtemSeqAno(Sigla: String; Tamanho: Integer): OleVariant;

    procedure EnviarMensagem(NomeCurso: string);
    function GravarHistoricoTreinamento(Empregado: boolean; NomePessoa, CodCentroCusto: string;
      IdTipoProcesso: integer; const sListaRateioTurma : string = ''): boolean;    // Edilaine - SOL 137268-7062 / KTN 1497173
    function GravarAvalAluno: boolean;
    // Thiago Melo SOL 177768 Kintana 1635450 INI
    function GravarMensalidades (idPessoa, idCurso, NumSeq : Double) : boolean;
    // Thiago Melo SOL 177768 Kintana 1635450

    property CdsHistTrein: TCMClientDataSet read FCdsHistTrein write FCdsHistTrein;
    property CdsAvalCurso: TCMClientDataSet read FCdsAvalCurso write FCdsAvalCurso;
    property CdsAvalAluno: TCMClientDataSet read FCdsAvalAluno write FCdsAvalAluno;
    property CdsEscalaConceitos: TCMClientDataSet read FCdsEscalaConceitos;
    // Thiago Melo
    property CdsMensal : TCMClientDataSet read FCdsMensal write FCdsMensal;

    // Edilaine - SOL 137268-7062 / KTN 1497173
    property CdsInscritos : TCMClientDataSet read FCdsInscritos write FCdsInscritos;
    property CdsTurma     : TCMClientDataSet read FCdsTurma write FCdsTurma;

  end;

implementation

uses uCMTypes, Dialogs;

{ TCtrlRegTrein }

constructor TCtrlRegTrein.Create(EnviarMensagem, IntegraRAD, AvalicaoCurso, AvalicaoAluno: boolean;
  IdEmpresa, IdUsuario: integer; NomeUsuario, UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FDbHistTrein := TDbHstTrn.Create(Self);
  FDbAvalCurso := TDbAvalCurso.Create(Self);
  FDbListaPresenca := TDbListaPresenca.Create(Self);
  FCdsFatorAval := TCMClientDataSet.Create(nil);
  FCdsEscalaConceitos := TCMClientDataSet.Create(nil);
  FCtrlFatorAvalCurso := TCtrlFatorAvalCurso.Create;
  FCtrlEscalaConceitos := TCtrlEscalaConceitos.Create;
  // Thiago Melo SOL 177768 Kintana 1635450 INI
  FCdsMensal := TCMClientDataSet.Create(nil);
  FDbMensal  := TDbDespesas.Create(Self);
  // Thiago Melo SOL 177768 Kintana 1635450

  FDbInscritosTurma := TDbInscritosTurma.Create(self); // Edilaine - SOL 137268-7062 / KTN 1497173
  FCdsInscritos     := TCMClientDataSet.Create(nil);   // Edilaine - SOL 137268-7062 / KTN 1497173
  FDbTurma          := TDbTurma.Create(self);          // Edilaine - SOL 137268-7062 / KTN 1497173
  FCdsTurma         := TCMClientDataSet.Create(nil);   // Edilaine - SOL 137268-7062 / KTN 1497173

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

  // Thiago Melo SOL 177768 Kintana 1635450 INI
  FCdsMensal.Free;
  FDbMensal.Free;
  // Thiago Melo SOL 177768 Kintana 1635450

  FDbInscritosTurma.free; // Edilaine - SOL 137268-7062 / KTN 1497173
  FCdsInscritos.Free;     // Edilaine - SOL 137268-7062 / KTN 1497173
  FDbTurma.free;          // Edilaine - SOL 137268-7062 / KTN 1497173
  FCdsTurma.Free;         // Edilaine - SOL 137268-7062 / KTN 1497173

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
  // Thiago Melo SOL 177768 Kintana 1635450 INI
  FDbMensal.DataBaseName    := DataBaseName;
  // Thiago Melo SOL 177768 Kintana 1635450

  FDbInscritosTurma.DataBaseName := DataBaseName; // Edilaine - SOL 137268-7062 / KTN 1497173
  FDbTurma.DataBaseName := DataBaseName;          // Edilaine - SOL 137268-7062 / KTN 1497173
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
      '  H.*, C.DESCRICAO, NVL(DATREINI, DATPLINI) AS DATAREF, 0 AS CONCLUIDO, '+CR_LF+
      '  T.DESCRICAO AS DESCR_TURMA, S.DESCRICAO AS SIGLA, '' '' AS OP_INICIAL ')+CR_LF+   // Edilaine - SOL 137268-7062 / KTN 1497173
    'FROM'+CR_LF+
    '  HSTTRN H, CURSO C, TURMA T, SIGLACURSO S'+CR_LF+   // Edilaine - SOL 137268-7062 / KTN 1497173
    'WHERE'+CR_LF+
    '  (H.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (S.IDSIGLACURSO  = C.IDSIGLACURSO) AND '+CR_LF+   // Edilaine - SOL 137268-7062 / KTN 1497173
    '  (H.IDCURSO  = C.IDCURSO) AND '+CR_LF+             // Edilaine - SOL 137268-7062 / KTN 1497173
    '  (H.IDTURMA(+) = T.IDTURMA)   '+CR_LF+             // Edilaine - SOL 137268-7062 / KTN 1497173
    'ORDER BY'+CR_LF+
    '  DATAREF DESC');
end;

function TCtrlRegTrein.ListHistoricoTreinamentoPorCurso(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  H.DATREINI, H.DATREFIM, H.DATPLINI, H.DATPLFIM, H.FLGCONTROLE, H.IDENTIDINSTR,'+CR_LF+
    '  P.NOME,I.NOME AS INSTRUTOR, H.IDINSTRUTOR, H.LOCALCURSO, H.FLGAVALCURS,'+CR_LF+
    '  H.DATAHORA, H.INSTRUTORES '+CR_LF+
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
    '  A.*, F.DESCRICAO, F.FLGAVALCURSO, F.IDESCALACONCEITOS'+CR_LF+
    'FROM'+CR_LF+
    '  AVALCURSO A, FATORAVALCURSO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (A.IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (A.IDCURSO    = ' +FloatToStr(IdCurso)+ ') AND'+CR_LF+
    '  (A.NUMSEQ     = ' +IntToStr(NumSeq)+ ') AND'+CR_LF+
    '  (NVL(A.FLGCURSOALUNO,0) = ' +IntToStr(Opcao)+ ') AND'+CR_LF+
    ' (A.IDFATORAVAL = F.IDFATORAVAL)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  A.IDFATORAVAL');
end;

function TCtrlRegTrein.ListEntid(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    //Cássio - SOL Nº 116899 KINTANA Nº 559042 - Início
    // Troca de NOME para RAZAOSOCIAL, da tabela PESSOA
    '  P.IDPESSOA, P.RAZAOSOCIAL, UPPER(P.RAZAOSOCIAL) AS UPNOME '+ CR_LF +
    //Cássio - SOL Nº 116899 KINTANA Nº 559042 - Fim
    'FROM'+CR_LF+
    '  PESSOA P, FUNCIONARIO F, INSTRUTORINTERNO IE'+CR_LF+
    'WHERE'+CR_LF+
    '  (IE.IDPESSOA = F.IDPESSOA) AND'+CR_LF+
    '  (IE.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (P.TIPO      = ''F'') AND '+CR_LF+
    '  (P.RAZAOSOCIAL IS NOT NULL)'+  //Henrique Massão SOL 124003 KTN 625235
    IFF(IdCurso>0, ' AND'+CR_LF+'  (IE.IDCURSO = ' +FloatToStr(IdCurso)+')'+CR_LF, CR_LF)+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    //Cássio - SOL Nº 116899 KINTANA Nº 559042 - Início
    // Troca de NOME para RAZAOSOCIAL, da tabela PESSOA
    '  P.IDPESSOA, P.RAZAOSOCIAL, UPPER(P.RAZAOSOCIAL) AS UPNOME ' + CR_LF +
    //Cássio - SOL Nº 116899 KINTANA Nº 559042 - Fim
    'FROM'+CR_LF+
    '  PESSOA P, TERCEIRO T'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.IDPESSOA = P.IDPESSOA)AND '+CR_LF+
    '  (P.RAZAOSOCIAL IS NOT NULL)'+CR_LF+ //Henrique Massão SOL 124003 KTN 625235
    'UNION'+CR_LF+
    //Cássio - SOL Nº 116899 KINTANA Nº 559042 - Início
    'SELECT' + CR_LF +
    '      P.IDPESSOA, P.RAZAOSOCIAL, UPPER(P.RAZAOSOCIAL) AS UPNOME' +CR_LF+
    'FROM ' + CR_LF +
    '  PESSOA P,' + CR_LF +
    '  EMPRESAPROP E' + CR_LF +
    'WHERE ' + CR_LF +
    ' E.IDPESSOA = P.IDPESSOA AND '+CR_LF+
    '  (P.RAZAOSOCIAL IS NOT NULL)'+CR_LF + //Henrique Massão SOL 124003 KTN 625235
    'ORDER BY ' + CR_LF +
    '   3');
    //Cássio - SOL Nº 116899 KINTANA Nº 559042 - Fim
end;

function TCtrlRegTrein.ListAgendaTrein: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  H.LOCALCURSO, H.DATPLINI, H.DATPLFIM, C.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN H, FUNCIONARIO F, CURSO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.DATREINI   IS NULL) AND'+CR_LF+
    '  (H.FLGCONTROLE = 1) AND'+CR_LF+
    '  (H.DATPLINI BETWEEN SYSDATE AND SYSDATE + 7) AND'+CR_LF+
    '  (H.IDCURSO     = C.IDCURSO) AND'+CR_LF+
    '  (H.IDPESSOA    = F.IDPESSOA)'+
    IFF(FUsuXCCusto<>'', ' AND'+CR_LF+'  (F.CODCENTROCUSTO IN ' +FUsuXCCusto+ ')', '')+
    IFF(FUsuXFilial<>'', ' AND'+CR_LF+'  (F.IDESTAB IN ' +FUsuXFilial+ ')', '')+
    IFF(FIdUsuarioGeral<>'', ' AND'+CR_LF+'  (F.IDPESSOA = ' +FIdUsuarioGeral+ ')', '')+CR_LF+
    'ORDER BY'+CR_LF+
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
      Replicate(' ',NumEspacos)+'(H.LOCALCURSO IS NULL)'+CR_LF;

  if (DataHora <> '') then
    Result := Result +
      Replicate(' ',NumEspacos)+'AND'+CR_LF+
      Replicate(' ',NumEspacos)+
        '(REPLACE(REPLACE(REPLACE(H.DATAHORA,CHR(13)),CHR(10)),'' '') = ' +
        QuotedStr(StringReplace(StringReplace(StringReplace(DataHora,#13,'',
        [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'
  else
    Result := Result +
      Replicate(' ',NumEspacos)+'AND (H.DATAHORA IS NULL)';
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
        'Existem ' +_CdsAux.FieldByName('CONTA').asString+ ' Processos RAD Não Concluídos.',
        'Existe 1 Processo RAD Não Concluído.');

  _CdsAux.Free;
end;

function TCtrlRegTrein.ListPessoasNaoInscritasNoCurso(SelEmpregado: boolean;
  IdCurso, IdInstrutor, IdEntidade: double; DataInicioPlanejado, DataFinalPlanejado,
  DataInicioReal, DataFinalReal: TDate; Ordem: TOrdemPessoas;
  LocalCurso, DataHora: string; sTipoSit : string = ''): OleVariant;
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

    Add('  DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'','+
      ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'','+CR_LF+
      ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO');

    Add('FROM');
    Add('  PESSOA P, '+IFF(SelEmpregado, 'FUNCIONARIO F', 'CANDIDAT F'));

    //Cássio - SOL Nº 116908 KINTANA Nº 558945 - Início
    if (sTipoSit <> '') and (SelEmpregado) then
      Add(', SITFUNC S');
    //Cássio - SOL Nº 116908 KINTANA Nº 558945 - Fim

    Add('WHERE');

    if (SelEmpregado) and (FUsuXCCusto <> '') then
      if (Pos(',', FUsuXCCusto) > 0) then
        Add('  (F.CODCENTROCUSTO IN (' +FUsuXCCusto+ ')) AND')
      else
        Add('  (F.CODCENTROCUSTO = ' +FUsuXCCusto+ ') AND');

    if (SelEmpregado) and (FUsuXFilial <> '') then
      if (Pos(',', FUsuXFilial) > 0) then
        Add('  (F.IDESTAB     IN (' +FUsuXFilial+ ')) AND')
      else
        Add('  (F.IDESTAB     = ' +FUsuXFilial+ ') AND');

    Add('  (F.IDPESSOA       =  P.IDPESSOA) AND');
    Add('  (F.IDPESSOA       NOT IN (SELECT H.IDPESSOA');
    Add('                            FROM   HSTTRN H');
    Add('                            WHERE  (H.IDCURSO = ' +FloatToStr(IdCurso)+ ')');
    Add(GerarWherePessoas(35, IdInstrutor, IdEntidade, DataInicioPlanejado,
      DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora)+ '))');

    //Cássio - SOL Nº 116908 KINTANA Nº 558945 - Início
    if (sTipoSit <> '') and (SelEmpregado) then
    begin
      Add('AND S.IDSITFUNC = F.IDSITFUNC ');
      Add('AND S.TIPOSIT IN (''' + sTipoSit + ''')');
    end;
    //Cássio - SOL Nº 116908 KINTANA Nº 558945 - Fim

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
      if (Pos(',', FUsuXCCusto) > 0) then
        Add('  (F.CODCENTROCUSTO IN (' +FUsuXCCusto+ ')) AND')
      else
        Add('  (F.CODCENTROCUSTO = ' +FUsuXCCusto+ ') AND');

    if (FUsuXFilial <> '') then
      if (Pos(',', FUsuXFilial) > 0) then
        Add('  (F.IDESTAB     IN (' +FUsuXFilial+ ')) AND')
      else
        Add('  (F.IDESTAB     = ' +FUsuXFilial+ ') AND');

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
    Add('  DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'','+
      ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'','+CR_LF+
      ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO,');
    Add('  UPPER(P.NOME) AS UPNOME');
    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F,');
    Add('  (SELECT H.IDPESSOA, H.NUMSEQ FROM HSTTRN H');
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
      if (Pos(',', FUsuXCCusto) > 0) then
        Add('  (F.CODCENTROCUSTO IN (' +FUsuXCCusto+ ')) AND')
      else
        Add('  (F.CODCENTROCUSTO = ' +FUsuXCCusto+ ') AND');

    if (FUsuXFilial <> '') then
      if (Pos(',', FUsuXFilial) > 0) then
        Add('  (F.IDESTAB     IN (' +FUsuXFilial+ ')) AND')
      else
        Add('  (F.IDESTAB     = ' +FUsuXFilial+ ') AND');

    Add('  (H1.IDPESSOA      =  F.IDPESSOA) AND');
    Add('  (P.IDPESSOA       =  F.IDPESSOA)');

    Add('UNION SELECT');
    Add('  F.IDPESSOA, P.NOME, H1.NUMSEQ, TO_CHAR(F.IDPESSOA) AS MATRICULA,');
    Add('  ''Candidato'' AS TIPOCONTRATO,');
    Add('  UPPER(P.NOME) AS UPNOME');
    Add('FROM');
    Add('  PESSOA P, CANDIDAT F,');
    Add('  (SELECT H.IDPESSOA, H.NUMSEQ FROM HSTTRN H');
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
    Add('  (H1.IDPESSOA      =  F.IDPESSOA) AND');
    Add('  (P.IDPESSOA       =  F.IDPESSOA)');

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
      if (Pos(',', FUsuXCCusto) > 0) then
        Add('  (F.CODCENTROCUSTO IN (' +FUsuXCCusto+ ')) AND')
      else
        Add('  (F.CODCENTROCUSTO = ' +FUsuXCCusto+ ') AND');

    if (FUsuXFilial <> '') then
      if (Pos(',', FUsuXFilial) > 0) then
        Add('  (F.IDESTAB     IN (' +FUsuXFilial+ ')) AND')
      else
        Add('  (F.IDESTAB     = ' +FUsuXFilial+ ') AND');

    Add('  (F.IDPESSOA       = H1.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = P.IDPESSOA)');

    Add('UNION SELECT');
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
    Add('  (F.IDPESSOA       = H1.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = P.IDPESSOA)');

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
    'SELECT SUM(A.AVALCURSO * 100 / '+CR_LF+
    '    DECODE(NVL(F.FLGAVALCURSO,0),0,NVL(P.VALMAXAVALTRN,100),'+CR_LF+
    '    E.QTDECONCEITOS)) / COUNT(*) AS AVALCURSO'+CR_LF+
    'FROM AVALCURSO A, FATORAVALCURSO F, ESCALACONCEITOS E, PARAMRH P'+CR_LF+
    'WHERE (A.FLGCURSOALUNO = 1)'+CR_LF+
    'AND   (A.IDPESSOA = ' +FloatToStr(IdPessoa)+ ')'+CR_LF+
    'AND   (A.IDCURSO  = ' +FloatToStr(IdCurso) + ')'+CR_LF+
    IFF(NumSeq = -1,'','AND   (A.NUMSEQ   = ' +IntToStr(NumSeq)+ ')'+CR_LF)+
    'AND   (A.IDFATORAVAL = F.IDFATORAVAL)'+CR_LF+
    'AND   (F.IDESCALACONCEITOS = E.IDESCALACONCEITOS(+))');
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
           _CdsFator.FieldByName('IDESCALACONCEITOS').asInteger, [])) then
         Result := FCdsEscalaConceitos.FieldByName('CONCEITO' +
           Trim(_CdsAux.FieldByName('AVALCURSO').asString)).asString
       else
         Result := '';
{-->}end;

begin
  try
    _CdsFator := TCMClientDataSet.Create(nil);
    _CdsAvalAluno := TCMClientDataSet.Create(nil);
    _CdsAval := TCMClientDataSet.Create(nil);
    _CdsAux := TCMClientDataSet.Create(nil);

    // Obtém os Fatores associados ao Curso
    _CdsAvalAluno.Data := ovDadosAvalAluno;
    _CdsFator.Data := FCtrlFatorAvalCurso.ListFatorAvalCurso(0, 1,
      IFF(FatorVariavelPorCurso, _CdsAvalAluno.FieldByName('IDCURSO').asFloat, 0));

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
    _CdsFator.Free;
    _CdsAvalAluno.Free;
    _CdsAval.Free;
    _CdsAux.Free;
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
          MessageInfo := 'Processo RAD Nº '+
                         FCdsHistTrein.FieldByName('IDPROCESSO').asString+
                         ' foi criado.';
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
    'Não esqueça de fazer a sua avaliação do curso ' +Trim(NomeCurso)+
    ' concluído em ' + FCdsHistTrein.FieldByName('DATREFIM').asString));

  if not(bOk) then
    raise Exception.Create('Não foi possível enviar a mensagem para o Curso:' +CR_LF+
      Trim(NomeCurso));
end;

function TCtrlRegTrein.GravarHistoricoTreinamento(Empregado: boolean; NomePessoa,
  CodCentroCusto: string; IdTipoProcesso: integer; const sListaRateioTurma : string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHistoricoTreinamento(Empregado, NomePessoa,
      CodCentroCusto, IdTipoProcesso, FCdsHistTrein.Data, FCdsAvalCurso.Data, FCdsAvalAluno.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsHistTrein.DisableControls;
    try
      // Enviar Todas as mensagens para o Treinando
      if (FEnviarMensagem) then
      begin
        FCdsHistTrein.First;
        while not(FCdsHistTrein.EOF) do
        begin
          if (FCdsHistTrein.FieldByName('CONCLUIDO').asInteger = 1) then
            EnviarMensagem(FCdsHistTrein.FieldByName('DESCRICAO').asString);
          FCdsHistTrein.Next;
        end;
      end;

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

      { // Edilaine - SOL 137268-7062 / KTN 1497173 - comentado
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
      } // Edilaine - SOL 137268-7062 / KTN 1497173 - fim

      // Thiago Melo SOL 177768 Kintana 1635450 INI

      // Gravar Mensalidades / Despesas
      Result := ApplyCds(FCdsMensal, FDbMensal, [], []);
      if not(Result) then
        raise Exception.Create(FDbMensal.MessageInfo);
      // Thiago Melo SOL 177768 Kintana 1635450 FIM


      // Edilaine - SOL 137268-7062 / KTN 1497173
      {alteração de dados da turma: despesas}
      Result := ApplyCds(FCdsTurma, FDbTurma, [], []);
      if not(Result) then
        raise Exception.Create(FDbTurma.MessageInfo);

      {empregados inscritos na turma}
      Result := ApplyCds(FCdsInscritos, FDbInscritosTurma, [], []);
      if not(Result) then
        raise Exception.Create(FDbInscritosTurma.MessageInfo);
      // Edilaine - SOL 137268-7062 / KTN 1497173 - fim

      Commit;

      // Edilaine - SOL 137268-7062 / KTN 1497173
      if sListaRateioTurma <> EmptyStr then
         Result := AtualizaRateioTurma( sListaRateioTurma );

    except
      on E: Exception do
      begin
          Rollback;
        Result := false;

        if Pos('XAK1HSTTRN', E.Message) > 0 then
          MessageInfo := 'Existe duplicidade entre os termos de compromissos, favor verificar ou gerar um novo termo'
        else
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
    Result := Connection.AppServer.GravarAvalAluno(FCdsAvalAluno.Data);
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

function TCtrlRegTrein.EfetuarInscricoes(Empregado: boolean; IdTipoProcesso: integer;
  ListaIdPessoa, ListaNomePessoa: string; IdCurso: double; FlgControle,
  FlgAvalCurso: integer; IdEntidade, IdInstrutor: double; DataInicioPlanejado,
  DataFinalPlanejado, DataInicioReal, DataFinalReal: TDate; DurTeorica, DurPratica, ValorCurso,
  ValorViagem, ValorHospedagem, ValorOutrasDesp: double; NomeCurso, LocalCurso,
  DataHora, Instrutores: string;
  Concluido: boolean): boolean;
var
  bOk: boolean;
  _CdsAux: TCMClientDataSet;
  sIdPessoa, NomePessoa, ProxNumSeq: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EfetuarInscricoes(Empregado, NomePessoa, IdTipoProcesso,
      ListaIdPessoa, IdCurso, FlgControle, FlgAvalCurso, IdEntidade, IdInstrutor,
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal, DurTeorica,
      DurPratica, ValorCurso, ValorViagem, ValorHospedagem, ValorOutrasDesp, NomeCurso,
      LocalCurso, DataHora, Instrutores, Concluido, FCdsHistTrein.Data);
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
        FCdsHistTrein.FieldByName('IDMODULO').asInteger := Sistema.IdModulo;

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
  DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal: TDate;
  DuracaoTeorica, DuracaoPratica, ValorCurso, ValorViagem, ValorHospedagem,
  ValorOutrasDespesas: double; NomeCurso, LocalCurso, DataHora, Instrutores: string;
  Concluido: boolean): boolean;

var
  sSQL: string;
  _CdsBLOB: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtualizarInscricoes(Empregado, AtualizarOutrasDespesas,
      IdTipoProcesso, FlgControle, FlgAvalCurs, IdCurso, IdInstrutor, IdEntidade,
      DataInicioPlanejado, DataFinalPlanejado, DataInicioReal, DataFinalReal, DuracaoTeorica,
      DuracaoPratica, ValorCurso, ValorViagem, ValorHospedagem, ValorOutrasDespesas, NomeCurso,
      LocalCurso, DataHora, Instrutores, Concluido);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      sSQL := 'UPDATE HSTTRN H SET'+CR_LF;

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

{      sSQL := sSQL + ', OBSERVACAO_AP=' + QuotedStr(Observacao)+CR_LF;

      sSQL := sSQL + ', DATAVENCTO=' + QuotedStr(DatetoStr(DataVencto))+CR_LF;

      sSQL := sSQL + ', UNIDNEGOC=' + InttoStr(UnidNegoc)+CR_LF;

      sSQL := sSQL + ', CODCENTRORESPON=' + InttoStr(CentroRespon)+CR_LF;

      sSQL := sSQL + ', CODTIPRECDES=' + InttoStr(TipoDesemb)+CR_LF;

      sSQL := sSQL + ', OBSERVACAO=' + QuotedStr(HistObs)+CR_LF;

      sSQL := sSQL + ', CODCENTROCUSTO=' +InttoStr(CentCust)+CR_LF;

      sSQL := sSQL + ', IDPROGRAMA=' + InttoStr(Programa)+CR_LF;

      sSQL := sSQL + ', IDPESSOA_PATRO=' + InttoStr(IdPatro)+CR_LF;

      sSQL := sSQL + ', IDPLANOPREV=' + InttoStr(Plano)+CR_LF;

      sSQL := sSQL + ', CODDOCUMENTO=' + InttoStr(CodDocumento)+CR_LF;

      sSQL := sSQL + ', IDFORCLI=' + InttoStr(IdforCli)+CR_LF;

      sSQL := sSQL + ', PLNCODIGO=' +FloatToStr(PlnCod)+CR_LF;  }

      StartTransaction;

      // Gravar os Dados dos Cursos
      ExecSQL(sSQL + FWherePessoas);

      // Gravar campos BLOB dos Cursos
      _CdsBLOB := TCMClientDataSet.Create(nil);
      _CdsBLOB.Data := GetDataPacket('SELECT * FROM HSTTRN H ' + FWherePessoas);
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

      _CdsBLOB.Free;

      AtualizarWherePessoas(Empregado, IdCurso, IdInstrutor, IdEntidade, DataInicioPlanejado,
        DataFinalPlanejado, DataInicioReal, DataFinalReal, LocalCurso, DataHora);

      // Atualiza Valor no RAD
      if (FIntegraRAD) and (IdTipoProcesso > 0) then
      begin
        try
          ExecSQL('UPDATE RADINSTPROCESSO SET VLRPROC = ' +
            OraNumero(FloatToStr(ValorCurso + IFF(AtualizarOutrasDespesas, ValorViagem +
            ValorHospedagem + ValorOutrasDespesas,0))) +
            ' WHERE IDPROCESSO IN (SELECT IDPROCESSO FROM HSTTRN H ' +
            FWherePessoas+ ' AND IDPROCESSO IS NOT NULL)');
        except
          raise Exception.Create('- Ao tentar atualizar o processo no RAD.');
        end;
      end;

      Commit;

      // Enviar mensagens para os cursos concluídos
      if (Concluido) then
      begin
        FCdsHistTrein.Data := GetDataPacket('SELECT IDPESSOA FROM HSTTRN H ' +FWherePessoas);
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
        if Assigned(_CdsBLOB) then
          _CdsBLOB.Free;
        Rollback;
        Result := false;
        MessageInfo := 'Não Foi Possível Atualizar os Dados.'+CR_LF+'Erro:'+CR_LF+E.Message;
      end;
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
  DataRealizacao: TDate): boolean;
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
      '                           WHERE  (CODCENTROCUSTO IN ' +FUsuXCCusto+ ')))';

  if (Empregado) and (FUsuXFilial <> '') then
    FWherePessoas := FWherePessoas +CR_LF+
      '       AND (H.IDPESSOA IN (SELECT IDPESSOA'+CR_LF+
      '                           FROM   FUNCIONARIO'+CR_LF+
      '                           WHERE  (IDESTAB IN ' +FUsuXFilial+ ')))';
end;

function TCtrlRegTrein.ObterSigla(idCurso: double): OleVariant;
begin
  Result := GetDataPacket('SELECT S.SIGLA, S.IDSIGLACURSO ' +
                          'FROM CURSO C, SIGLACURSO S ' +
                          'WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ' +
                          'AND C.IDCURSO = ' + FloatToStr(idCurso));
end;

function TCtrlRegTrein.ObtemAnoCorrente: String;
var
  _CdsAno: TCMClientDataSet;
begin
  _CdsAno := TCMClientDataSet.Create(nil);

  _CdsAno.Data:= GetDataPacket('SELECT EXTRACT(YEAR FROM SYSDATE) ANOCORRENTE FROM DUAL');

  Result:= _CdsAno.FieldByName('ANOCORRENTE').AsString;

  _CdsAno.Free;
end;

function TCtrlRegTrein.ObtemSeqAno(Sigla: String; Tamanho: Integer): OleVariant;
begin
  Result:= GetDataPacket('SELECT MAX(TO_NUMBER(SUBSTR(SUBSTR(TERMOCURSO, -10, 11), 1, 5))) SEQ , ' +
                         'MAX(SUBSTR(SUBSTR(TERMOCURSO, -10, 11), 7, 5)) ANO ' +
                         'FROM HSTTRN ' +
                         'WHERE SUBSTR(TERMOCURSO, 1, ' + InttoStr(Tamanho) + ') = ' +  QuotedStr(Sigla));
end;

//  Thiago Melo SOL 177768 Kintana 1635450 INI

function TCtrlRegTrein.ListaMensalidades (idPessoa, idCurso, NumSeq : Double; Tipo : SmallInt) : OleVariant;
var
  CommandSQL : String;
begin
    // inserir novos campos não-visiveis abaixo do FLGATINGIUMETA por causa da apresentação no grid
    CommandSQL :=
    'SELECT NPARCELA          ,' +
    '       DTVENCIMENTOPARC  ,' +
    '       VALORMENSALIDADE  ,' +
    '       VALOREMPREGADO    ,' +
    '       VALOREMPRESA      ,' +
    '       VALOREMPRESA_AT   ,' +
    '       DECODE(FLGTETO, ''S'', ''Sim'', ''   '') as FLGATINGIUMETA,  '+  // Edilaine - SOL 137268-7062 / KTN 1497173
    '       IDPESSOA          ,' +
    '       IDCURSO           ,' +
    '       IDMENSALIDADES    ,' +
    '       METAATUARIAL      ,' +
    '       DTATUALIZACAO     ,' +
    '       QTDPARCPREV       ,' +
    '       NUMSEQ            ,' +
    '       FLGTETO,          '+         // Edilaine - SOL 137268-7062 / KTN 1497173
    '       IDTURMA,          '+         // Edilaine - SOL 137268-7062 / KTN 1497173
    '       PERCEMPRESA,      '+         // Edilaine - SOL 137268-7062 / KTN 1497173
    '       PERCEMPREGADO,    '+         // Edilaine - SOL 137268-7062 / KTN 1497173
    '       TO_CHAR(DTVENCIMENTOPARC, ''YYYYMM'') AS MESANO, '+  // Edilaine - SOL 137268-7062 / KTN 1497173
    '       ''N'' AS FLGNOVO      '+     // Edilaine - SOL 137268-7062 / KTN 1497173
    '  FROM MENSALIDADES';
    case Tipo of
      0: begin
          CommandSQL := CommandSQL + ' WHERE IDPESSOA = ' + FloatToStr(idPessoa) +
          '   ORDER BY NPARCELA';
         end;
      1: begin
        CommandSQL := CommandSQL + ' WHERE IDPESSOA = ' + FloatToStr(idPessoa) +
        '   AND IDCURSO = '  + FloatToStr(idCurso) +
        '   ORDER BY NPARCELA';
      end;
      2 : begin
        CommandSQL := CommandSQL + ' WHERE IDPESSOA = ' + FloatToStr(idPessoa) +
        '   AND IDCURSO = '  + FloatToStr(idCurso) +
        '   AND NUMSEQ  = '  + FloatToStr(NumSeq) +
        '   ORDER BY NPARCELA';
      end;
    end;
    Result := GetDataPacket(CommandSQL);
end;

function TCtrlRegTrein.GravarMensalidades (idPessoa, idCurso, NumSeq : Double) : boolean;
begin
  FCdsMensal.First;
  try
    while not FCdsMensal.Eof do begin
      FCdsMensal.Edit;
      FCdsMensal.FieldByName('IDPESSOA').AsFloat             := idPessoa;
      FCdsMensal.Post;
      FCdsMensal.Next;
    end;
    FCdsMensal.First;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM


function TCtrlRegTrein.GetHabilitarParcialmente: boolean;
var
  sSQL : string;
begin
  sSQL := 'SELECT S.FLGPROPORCIONALIZA  '+
          '  FROM CURSO C, SIGLACURSO S '+
          ' WHERE C.IDSIGLACURSO = S.IDSIGLACURSO '+
          '   AND C.IDCURSO = ' + FU.IFF(FCdsHistTrein.FieldByName('IDCURSO').AsString='','-1', FCdsHistTrein.FieldByName('IDCURSO').AsString);

  _Cds.data := GetDataPacket(sSQL);

  if (not _Cds.IsEmpty) then
  begin
    if _Cds.FieldByName('FLGPROPORCIONALIZA').AsString = '0' then
       Result := False
    else
       Result := True;
  end
  else
    Result := False;

end;


function TCtrlRegTrein.GravarTreinamentoColetivo: boolean;
var
   qryConsisteDados: TwwQuery;
   i: Integer;
begin
  i:= 0;

  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTreinamentoColetivo();
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsHistTrein.DisableControls;
    try
      if not InTransaction then
         StartTransaction;

      // Gravar os Dados da turma
      Result := ApplyCds(FCdsTurma, FDbTurma, [], []);
      if not(Result) then
        raise Exception.Create(FDbTurma.MessageInfo);

      //inicio
      //Verifica se a chave esta preenchida SOL: 245965 PPM: 635849 - Wylliam Leite da Silva - 26/02/2015
      {FCdsHistTrein.First;
      qryConsisteDados := TwwQuery.Create(nil);
      qryConsisteDados.DatabaseName:= 'BaseDados';


      while not (FCdsHistTrein.Eof) do
      begin
           qryConsisteDados.Close;
           qryConsisteDados.SQL.Clear;
           qryConsisteDados.sql.add('select * from HSTTRN');
           qryConsisteDados.sql.add('where idpessoa = ' + FCdsHistTrein.FieldByName('idpessoa').AsString);
           qryConsisteDados.sql.add('and idcurso = ' + FCdsHistTrein.FieldByName('idcurso').AsString);
           qryConsisteDados.sql.add('and numseq = ' + FCdsHistTrein.FieldByName('numseq').AsString);
           qryConsisteDados.Open;
           if not qryConsisteDados.IsEmpty then
              MessageDlg('chave duplicada: idcurso: '+ FCdsHistTrein.FieldByName('idcurso').AsString +
              'idpessoa: ' + FCdsHistTrein.FieldByName('idpessoa').AsString +
              'numseq: ' + FCdsHistTrein.FieldByName('numseq').AsString, mtWarning, [mbOK], 0);

           FCdsHistTrein.Next;
           Inc(i);
      end;
      FreeAndNil(qryConsisteDados); }
      //fim

      // Gravar os Dados do historico
      Result := ApplyCds(FCdsHistTrein, FDbHistTrein, [], []);
      if not(Result) then
        raise Exception.Create(FDbHistTrein.MessageInfo);

      {empregados inscritos na turma}
      Result := ApplyCds(FCdsInscritos, FDbInscritosTurma, [], []);
      if not(Result) then
        raise Exception.Create(FDbInscritosTurma.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;

        if Pos('XAK1HSTTRN', E.Message) > 0 then
          MessageInfo := 'Existe duplicidade entre os termos de compromissos, favor verificar ou gerar um novo termo'
        else
          MessageInfo := E.Message;
      end;
    end;
    FCdsHistTrein.EnableControls;
  end;
end;

function TCtrlRegTrein.ExcluiInscritos(iIdPessoa: integer): boolean;
var
  sSQL1, sSQL2 : string;
begin
  sSQL1 := 'DELETE FROM INSCRITOSTURMA'+
           ' WHERE IDPESSOA  = '+IntToStr( iIdPessoa);

  sSQL2 := 'DELETE FROM HSTTRN'+
           ' WHERE IDPESSOA  = '+IntToStr( iIdPessoa);

  try
     Result := ExecSQL(sSQL1);
     if Result then
        Result := ExecSQL(sSQL2);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRegTrein.ListaHistoricoPorCurso(IdCurso: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT H.IDPESSOA, H.VALOR, H.DESP_VIAG, H.DESP_ESTAD, H.DESP_OUTR, H.IDMODULO, H.IDCURSO, H.ENTREGUE, '+CR_LF+
    '       H.NUMSEQ, H.IDTURMA, H.IDENTIDINSTR, H.DUR_TOT, H.DATREINI, H.DATREFIM, H.DATFID, H.REGISTRO, '+CR_LF+
    '       H.DATPLINI, H.DATPLFIM '+CR_LF+
    '  FROM HSTTRN H'+CR_LF+
    ' WHERE H.IDCURSO = ' +FloatToStr(IdCurso) );
end;

function TCtrlRegTrein.AtualizaRateioTurma(ListaTurma: String): boolean;
var
  sSQL, sValor : string;
begin
  sSQL := 'SELECT T.IDTURMA, T.VALORCURSO, I.QTD, (T.VALORCURSO / NVL(I.QTD, 1)) AS RATEIO  '+
          '  FROM TURMA T, '+
          '       (SELECT IDTURMA, COUNT(*) QTD FROM INSCRITOSTURMA IT  GROUP BY IDTURMA) I '+
          ' WHERE I.IDTURMA = T.IDTURMA  '+
          '   AND T.IDTURMA IN ( '+ListaTurma+' ) ';

   try
     _cds.Data := GetDataPacket( sSQL );

     if not _cds.eof then
     begin
       if not InTransaction then
          StartTransaction;

       while not _cds.eof do
       begin
         sValor := OraNumero(_cds.FieldByName('RATEIO').AsString);
         sSQl := 'UPDATE HSTTRN SET VALOR = '+ sValor +
                 ' WHERE IDTURMA = '+_cds.FieldByName('IDTURMA').AsString;

         ExecSQl( sSQL );

         _cds.next;
       end;

       Commit;
     end;
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

end.
