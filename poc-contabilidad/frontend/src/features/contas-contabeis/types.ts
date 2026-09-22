/**
 * Tipos para o domínio de Contas Contábeis
 * Alinhado com a tabela Oracle PLANOCONTA (PK compuesta: PLANO + PLACONTA)
 *
 * Migração de: FCadContasContabMT.pas → frmCadContasContabMT
 * Mapa de equivalencias: Componentes Visuales Delphi → DTOs → FUNCEF Design System
 */

// ─────────────────────────────────────────────────────────────────────────────
// Plano Contábil (dropdown) — alinhado com PlanoContabilResponse.cs
// Migração de: dblkPlanoContabil (TCMDBLookupCombo) no Delphi
// Backend: GET /api/planoscontabeis
// ─────────────────────────────────────────────────────────────────────────────

export interface PlanoContabil {
  /** Identificador do plano (Delphi: PLANO / Oracle: IDPLANO) */
  id: number;
  /** Nome/descrição (Delphi: DESCPLANO / Oracle: NOME) */
  nome: string;
  /** Máscara de formatação (ex: 9.9.9.99.999) */
  mascara: string | null;
  /** Indica se o plano está ativo */
  ativo: boolean;
}

// ─────────────────────────────────────────────────────────────────────────────
// Response (GET) — alinhado com ContaContabilResponse.cs
// ─────────────────────────────────────────────────────────────────────────────

export interface ContaContabil {
  // PK
  plano: number
  codigo: string

  // Datos básicos (dbeCodigo, dbeGrau, grpTipo, cmbGrp, dbeCodReduz, grpNatureza, dbeDescPort, dbeDescOIdi, dbeCorresp)
  descricao: string
  descricaoIdioma?: string | null
  tipo: string // 'S' = Sintética, 'A' = Analítica (grpTipo)
  grupo: string // A/P/R/D/C/O/E/S (cmbGrp)
  nivel: number // Grau (dbeGrau)
  codigoReduzido: number // (dbeCodReduz)
  natureza?: string | null // D/C/N (grpNatureza)
  contaCorrespondente?: string | null // (dbeCorresp)

  // Checkboxes (defaults de CmeCadastroInsert líneas 813-829)
  ordemAlfabetica?: boolean | null // (chkListaAlfabetica)
  aceitaCentroCusto?: boolean | null // (chkCentroCusto)
  permiteAlteracao: boolean // (chkPermiteAlteracao) default: true
  inativa: boolean // (chkInativa) default: false — Oracle 'I'/'A'
  conciliavel?: boolean | null // (chkConcilia)
  sumarizaLancamentos?: boolean | null // (chkSumariza)
  obrigaSubconta?: boolean | null // (chkObrigaSubConta)
  contaPadraoSecretaria?: boolean | null // (chkPadraoSec)
  imprimeRelEvolucao?: boolean | null // (chkImprimeRel)
  aceitaMutacoes?: boolean | null // (chkAceitaMutacoes)
  usoExclusivoPga?: boolean | null // (chkUsoPga)

  // Bloqueio (chkBloqueada, dteBloqueada)
  bloqueada?: boolean | null
  dataBloqueio?: string | null

  // Rateio (rdgRateio — Delphi: PLARATEIOAP con 3 valores: N/S/R)
  aceitaRateio?: string | null

  // Conversão de Moeda (cmbConvOficial, cmbConvGer, cmbConvGer2, cmbConvGer3)
  conversaoOficial?: string | null // 'S' / 'N'
  conversaoGerencial?: string | null
  conversaoGerencial2?: string | null
  conversaoGerencial3?: string | null

  // Sub-grupos (cmbSubGrupo1-4)
  subGrupo1?: number | null
  subGrupo2?: number | null
  subGrupo3?: number | null
  subGrupo4?: number | null

  // Moeda e Juros (cmbMoeda, dbeContraJuros, dbeTaxaJuros)
  moedaId?: number | null
  contrapartidaJuros?: string | null
  taxaJuros?: number | null

  // Contas de Relación (dbeSegregacao, dbeContraPartida, etc.)
  contrapartida?: string | null
  contaSegregacao?: string | null
  contaSegregacaoFdoAdmCred?: string | null
  contaSegregacaoFdoAdmDeb?: string | null
  contaAglutinacao?: string | null
  contaExtracontabil?: string | null

  // Segregação e Rateio (cmbSegregacao, cmbPrograma, cmbRateioPlanoAdm)
  segregacaoCriterId?: number | null
  programaId?: number | null
  rateioPlanoAdmId?: number | null

  // Observações (mmoObservacoes)
  observacoes?: string | null

  // Auditoría
  usuarioInclusao?: number | null
  createdAt: string
  updatedAt?: string | null
}

// ─────────────────────────────────────────────────────────────────────────────
// Request (POST/PUT) — alinhado com ContaContabilRequest.cs
// Defaults de CmeCadastroInsert (líneas 809-829)
// ─────────────────────────────────────────────────────────────────────────────

export interface CreateContaContabilRequest {
  // PK
  plano: number
  codigo: string

  // Datos básicos
  descricao: string
  descricaoIdioma?: string | null
  tipo: string // default: 'S'
  grupo: string // default: 'A'
  nivel: number // default: 1
  codigoReduzido: number
  natureza?: string | null
  contaCorrespondente?: string | null

  // Checkboxes
  ordemAlfabetica?: boolean | null
  aceitaCentroCusto?: boolean | null
  permiteAlteracao: boolean // default: true
  inativa: boolean // default: false
  conciliavel?: boolean | null
  sumarizaLancamentos?: boolean | null
  obrigaSubconta?: boolean | null
  contaPadraoSecretaria?: boolean | null
  imprimeRelEvolucao?: boolean | null
  aceitaMutacoes?: boolean | null
  usoExclusivoPga?: boolean | null

  // Bloqueio
  bloqueada?: boolean | null
  dataBloqueio?: string | null

  // Rateio
  aceitaRateio?: string | null

  // Conversão de Moeda
  conversaoOficial?: string | null
  conversaoGerencial?: string | null
  conversaoGerencial2?: string | null
  conversaoGerencial3?: string | null

  // Sub-grupos
  subGrupo1?: number | null
  subGrupo2?: number | null
  subGrupo3?: number | null
  subGrupo4?: number | null

  // Moeda e Juros
  moedaId?: number | null
  contrapartidaJuros?: string | null
  taxaJuros?: number | null

  // Contas de Relación
  contrapartida?: string | null
  contaSegregacao?: string | null
  contaSegregacaoFdoAdmCred?: string | null
  contaSegregacaoFdoAdmDeb?: string | null
  contaAglutinacao?: string | null
  contaExtracontabil?: string | null

  // Segregação e Rateio
  segregacaoCriterId?: number | null
  programaId?: number | null
  rateioPlanoAdmId?: number | null

  // Observações
  observacoes?: string | null
}

export interface UpdateContaContabilRequest extends CreateContaContabilRequest {}

// ─────────────────────────────────────────────────────────────────────────────
// Enums / Constantes — alinhados com Delphi grpTipo, cmbGrp, grpNatureza
// ─────────────────────────────────────────────────────────────────────────────

/** Tipo de conta (grpTipo) — Delphi: 'S' = Sintética, 'A' = Analítica */
export const TIPO_CONTA = {
  SINTETICA: 'S',
  ANALITICA: 'A',
} as const

/** Grupo da conta (cmbGrp) — Delphi: A/P/R/D/C/O/E/S */
export const GRUPO_CONTA = {
  ATIVO: 'A',
  PASSIVO: 'P',
  RESULTADO: 'R',
  DEDUCAO: 'D',
  CUSTOS: 'C',
  OUTRAS: 'O',
  EXERCICIO: 'E',
  SINTETICA: 'S',
} as const

// ─────────────────────────────────────────────────────────────────────────────
// Rateio Plano/Patrocinadora (dropdown) — alinhado com RateioPlanoPatroResponse.cs
// Migração de: dblkRateioPlanoPatro (TwwDBLookupCombo) no Delphi
// Backend: GET /api/rateiosplanopatro
// ─────────────────────────────────────────────────────────────────────────────

export interface RateioPlanoPatro {
  /** ID único do rateio (Delphi: IDRATADMPLANPATRO) */
  id: number
  /** Nome/descrição (Delphi: DESCRICAO — "Nome do Rateio") */
  descricao: string
  /** ID do plano previdenciário (Delphi: IDPLANOPREV) */
  planoPrevId?: number | null
  /** ID da patrocinadora (Delphi: IDPATRO) */
  patroId?: number | null
  /** Indica se o rateio está ativo */
  ativo: boolean
}

// ─────────────────────────────────────────────────────────────────────────────
// Critério de Segregação (dropdown) — alinhado com SegregacaoCriterResponse.cs
// Migração de: dblkSegregacao (TwwDBLookupCombo) no Delphi
// Backend: GET /api/segregacoescriter
// ─────────────────────────────────────────────────────────────────────────────

export interface SegregacaoCriter {
  /** ID único do critério (Delphi: IDSEGREGACRITER) */
  id: number
  /** Descrição (Delphi: DESCRICAO) */
  descricao: string
  /** Ordem (Delphi: ORDEM) */
  ordem?: number | null
  /** Tipo de segregação (Delphi: FLGTIPOSEGREGA) */
  tipoSegrega?: string | null
  /** Tipo de cotação (Delphi: FLGTIPOCOTACAO) */
  tipoCotacao?: string | null
}

// ─────────────────────────────────────────────────────────────────────────────
// Programa do Critério (dropdown) — alinhado com ProgramaResponse.cs
// Migração de: cboPrograma (TwwDBIncrementalSearch) no Delphi
// Backend: GET /api/programas
// ─────────────────────────────────────────────────────────────────────────────

export interface Programa {
  /** ID único do programa (Delphi: IDPROGRAMA) */
  id: number
  /** Descrição (Delphi: DESCPROGRAMA) */
  descricao: string
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-Grupo (dropdown) — alinhado com SubGrupoResponse.cs
// Migração de: dblkSubGrupo1-4 (TwwDBLookupCombo) no Delphi
//   LookupTable = CdsSubGrupo, LookupField = 'CODSUBGRP', display = 'DESCSUBGRP'
// Backend: GET /api/subgrupos
// ─────────────────────────────────────────────────────────────────────────────

export interface SubGrupo {
  /** ID único do sub-grupo (Delphi: CODSUBGRP) */
  id: number
  /** Descrição (Delphi: DESCSUBGRP) */
  descricao: string
}

// ─────────────────────────────────────────────────────────────────────────────
// Moeda (dropdown) — alinhado com MoedaResponse.cs
// Migração de: dblkMoeda (TwwDBLookupCombo) no Delphi
//   LookupTable = CdsMoeda, LookupField = 'MOECODIGO', display = 'MOEDESC'
// Backend: GET /api/moedas
// ─────────────────────────────────────────────────────────────────────────────

export interface Moeda {
  /** ID único da moeda (Delphi: MOECODIGO) */
  id: number
  /** Descrição (Delphi: MOEDESC) */
  descricao: string
  /** Sigla (Delphi: MOESIGLA) — ex: R$, US$, EUR */
  sigla?: string | null
}

// ─────────────────────────────────────────────────────────────────────────────
// Parâmetros Globais da Empresa — alinhado com ParamGlobalResponse.cs
// Migração de: uCtrlParamIntegra.pas → GetParams(IdEmpresa)
// Backend: GET /api/paramglobal/{idEmpresa}
// Tabela: PARAMGLOBAL WHERE IDPESSOA = Sistema.IdEmpresa
// ─────────────────────────────────────────────────────────────────────────────

export interface ParamGlobal {
  /** ID da empresa/pessoa (Delphi: IDPESSOA = Sistema.IdEmpresa) */
  idPessoa: number
  /** S=Segregação Virtual (novo), N=Rateio (antigo) — Delphi: FLGSEGREGAVIRTUAL */
  segregaVirtual: boolean
  /** S=Segrega OR Administrativo — Delphi: FLGSEGREGAORADM */
  segregaOrAdm: boolean
  /** S=Segrega OR Comum — Delphi: FLGSEGREGAORCOMUM */
  segregaOrComum: boolean
  /** ID do plano prev. administrativo — Delphi: IDPLANOPREVADM */
  idPlanoPrevAdm?: number | null
  /** ID da patrocinadora global — Delphi: IDPATRO */
  idPatro?: number | null
  /** ID do plano prev. global — Delphi: IDPLANOPREV */
  idPlanoPrev?: number | null
  /** S=Obriga centro de custo — Delphi: FLGOBRIGACC */
  obrigaCC: boolean
}

// ─────────────────────────────────────────────────────────────────────────────
// ParamContab — Parâmetros Contábeis por Empresa
// Migração de: uCtrlContab.pas → TCtrlContab (PARAMCONTAB)
// Backend: GET /api/paramcontab/{idEmpresa}
// Tabela: PARAMCONTAB WHERE IDPESSOA = Sistema.IdEmpresa
// Colunas: PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
// ─────────────────────────────────────────────────────────────────────────────

export interface ParamContab {
  /** ID da empresa/pessoa (Delphi: IDPESSOA = Sistema.IdEmpresa) */
  idPessoa: number

  /** ID da Moeda Oficial (0 = desabilita combo). Delphi: CtrlContab.MoedaOficial → PACMOEDAOFICIAL */
  moedaOficial: number

  /** ID da Moeda Gerencial 1 (0 = desabilita combo). Delphi: CtrlContab.MoedaGerencial → PACMOEDAGERENCIAL */
  moedaGerencial: number

  /** ID da Moeda Gerencial 2 (0 = desabilita combo). Delphi: CtrlContab.MoedaGeren1 → PACMOEDAGEREN1 */
  moedaGeren1: number

  /** ID da Moeda Gerencial 3 (0 = desabilita combo). Delphi: CtrlContab.MoedaGeren2 → PACMOEDAGEREN2 */
  moedaGeren2: number

  // ===== Contadores de PLAREDUZ por grupo (legacy: uDbParamcontab.pas) =====
  // Próximo PLAREDUZ = PACREDUZ{GRUPO} + 1
  // Usado no frontend para pré-calcular o código reduzido ao selecionar grupo
  // (migração de cmbGrpExit → CriaCodReduz, FCadContasContabMT.pas líneas 621-666)

  /** Último PLAREDUZ grupo A (Ativo). Delphi: PACREDUZA */
  pacReduzA: number

  /** Último PLAREDUZ grupo P (Passivo). Delphi: PACREDUZP */
  pacReduzP: number

  /** Último PLAREDUZ grupo R (Receita). Delphi: PACREDUZR */
  pacReduzR: number

  /** Último PLAREDUZ grupo D (Despesa). Delphi: PACREDUZD */
  pacReduzD: number

  /** Último PLAREDUZ grupo C (Custo). Delphi: PACREDUZC */
  pacReduzC: number

  /** Último PLAREDUZ grupo E (Estatística). Delphi: PACREDUZE */
  pacReduzE: number

  /** Último PLAREDUZ grupo O (Outros). Delphi: PACREDUZO */
  pacReduzO: number
}

/** Natureza da conta (grpNatureza) — Delphi: D/C/N */
export const NATUREZA_CONTA = {
  DEVEDORA: 'D',
  CREDORA: 'C',
  AMBAS: 'N',
} as const

/** Conversão de moeda — Delphi: 5 opções (N/H/D/C/M) */
export const CONVERSAO_MOEDA = {
  NAO_CONVERTE: 'N',
  HISTORICO_MEDIO: 'H',
  DIARIO: 'D',
  MOEDA_CORRENTE_ULTIMO_DIA: 'C',
  MANUAL: 'M',
} as const

/** Labels para conversão de moeda (exibição na UI) */
export const CONVERSAO_LABELS: Record<string, string> = {
  N: 'Não Converte',
  H: 'Histórico Médio',
  D: 'Diário',
  C: 'Moeda Corrente do Último Dia',
  M: 'Manual',
}

// Labels para exibição na UI
export const GRUPO_LABELS: Record<string, string> = {
  A: 'Ativo',
  P: 'Passivo',
  R: 'Receita',
  D: 'Despesa',
  C: 'Custo',
  O: 'Outros',
  E: 'Estatística',
  S: 'Patrimônio Social',
}

export const TIPO_LABELS: Record<string, string> = {
  S: 'Sintética',
  A: 'Analítica',
}

export const NATUREZA_LABELS: Record<string, string> = {
  D: 'Devedora',
  C: 'Credora',
  N: 'Ambas',
}

// ─────────────────────────────────────────────────────────────────────────────
// Centro de Custo (disponíveis) — alinhado com CentroCustoResponse.cs
// Migração de: FCadContasContabMT.pas → CdsCCusto (grid esquerdo)
//   ListCCustoCadContas: SELECT ... FROM CENTCUST WHERE NOT EXISTS (CONTASXCC)
// Backend: GET /api/centroscusto?idEmpresa=1&plano=1&placConta=1.1.1.01
// ─────────────────────────────────────────────────────────────────────────────

export interface CentroCusto {
  /** ID da empresa (Delphi: IDPESSOA) */
  idPessoa: number
  /** Código do centro de custo (Delphi: CODCENTROCUSTO) */
  codCentroCusto: string
  /** Nome (Delphi: NOME) */
  nome: string
  /** 'A' = Analítico, 'S' = Sintético (Delphi: STATUSGRUPOCDC) */
  statusGrupoCdc: string
  /** Código externo (Delphi: CODEXTERNO) */
  codExterno?: string | null
  /** Ativo: 'S' = Sim, 'N' = Não (Delphi: ATIVO) */
  ativo: string
}

// ─────────────────────────────────────────────────────────────────────────────
// Conta × Centro de Custo (associados) — alinhado com ContasxCCResponse.cs
// Migração de: FCadContasContabMT.pas → CdsContasxCC (grid direito)
//   ListContasxCC: SELECT ... FROM CENTCUST C, CONTASXCC CC WHERE ...
// Backend: GET /api/contasxcc?idEmpresa=1&plano=1&placConta=1.1.1.01
// ─────────────────────────────────────────────────────────────────────────────

export interface ContasxCC {
  /** ID da relação (Delphi: IDCONTACC) */
  idContaCc: number
  /** Plano contábil (Delphi: PLANO) */
  plano: number
  /** Código da conta (Delphi: PLACONTA) */
  placConta: string
  /** Código do centro de custo (Delphi: CODCENTROCUSTO) */
  codCentroCusto: string
  /** Nome do CC (join CENTCUST.NOME) */
  nome: string
  /** 'A' = Analítico, 'S' = Sintético (join CENTCUST.STATUSGRUPOCDC) */
  statusGrupoCdc: string
  /** Código externo (join CENTCUST.CODEXTERNO) */
  codExterno?: string | null
  /** ID da empresa (Delphi: IDEMPRESA) */
  idEmpresa: number
  /** ID do usuário (Delphi: IDUSUARIOINCLUSAO) */
  idUsuarioInclusao: number
  /** Data de inclusão (Delphi: DTINCLUSAO) */
  dtInclusao: string
}

// ─────────────────────────────────────────────────────────────────────────────
// Commands para associar/desassociar CC
// Migração de: btnVaiUm/btnVaiTodos (associate) / btnVoltaUm/btnVoltaTodos (disassociate)
// Backend: POST /api/contasxcc/associate | POST /api/contasxcc/disassociate
// ─────────────────────────────────────────────────────────────────────────────

export interface AssociateContasxCCRequest {
  plano: number
  placConta: string
  idEmpresa: number
  idUsuarioInclusao: number
  codCentrosCusto: string[]
}

export interface DisassociateContasxCCRequest {
  plano: number
  placConta: string
  idEmpresa: number
  codCentrosCusto: string[]
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-Conta (maestro) — alinhado com SubContaResponse.cs
// Migração de: FCadContasContabMT.pas → CdsSubConta (grid esquerdo)
//   ListSubContaCadContas: SELECT ... FROM SUBCONTA WHERE NOT EXISTS (CONTASXSUBC)
// Backend: GET /api/subcontas?idEmpresa=1&plano=1&placConta=1.1.1.01
// ─────────────────────────────────────────────────────────────────────────────

export interface SubConta {
  /** ID da empresa (Delphi: IDPESSOA) */
  idPessoa: number
  /** Código da sub-conta (Delphi: CODSUBCONTA) */
  codSubConta: number
  /** Nome da sub-conta (Delphi: NOMESUBCONTA) */
  nomeSubConta: string
  /** Ativo: 'S' = Sim, 'N' = Não (Delphi: ATIVO) */
  ativo: string
}

// ─────────────────────────────────────────────────────────────────────────────
// Conta × Sub-Conta (associados) — alinhado com ContasxSCResponse.cs
// Migração de: FCadContasContabMT.pas → CdsContasxSC (grid direito)
//   ListContasxSC: SELECT ... FROM CONTASXSUBC WHERE ...
// Backend: GET /api/contasxsc?idEmpresa=1&plano=1&placConta=1.1.1.01
// ─────────────────────────────────────────────────────────────────────────────

export interface ContasxSC {
  /** ID da empresa (Delphi: IDPESSOA) */
  idPessoa: number
  /** ID do usuário (Delphi: IDUSUARIO) */
  idUsuario: number
  /** Plano contábil (Delphi: PLANO) */
  plano: number
  /** Código da conta (Delphi: PLACONTA) */
  placConta: string
  /** Código da sub-conta (Delphi: CODSUBCONTA) */
  codSubConta: number
  /** Nome da sub-conta (Delphi: NOMESUBCONTA) */
  nomeSubConta: string
  /** Data de inclusão (Delphi: DTINCLUSAO) */
  dtInclusao: string
}

// ─────────────────────────────────────────────────────────────────────────────
// Commands para associar/desassociar Sub-Contas
// Migração de: btnVaiUm2/btnVaiTodos2 (associate) / btnVoltaUm2/btnVoltaTodos2 (disassociate)
// Backend: POST /api/contasxsc/associate | POST /api/contasxsc/disassociate
// ─────────────────────────────────────────────────────────────────────────────

export interface AssociateContasxSCRequest {
  plano: number
  placConta: string
  idEmpresa: number
  idUsuario: number
  codSubContas: number[]
}

export interface DisassociateContasxSCRequest {
  plano: number
  placConta: string
  idEmpresa: number
  codSubContas: number[]
}
