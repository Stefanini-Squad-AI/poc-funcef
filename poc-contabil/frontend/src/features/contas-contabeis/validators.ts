import { z } from 'zod';

/**
 * Schema de validação — Migração de FCadContasContabMT.pas
 *
 * Reglas de negocio Delphi migradas:
 * - CmeCadastroBeforeConfirma: validações de campos obrigatórios
 * - cmbGrpExit: consistencia Grupo ↔ Natureza
 * - dbeCodigoExit: validação de máscara de código
 * - grpTipoClick: validações de tipo sintética/analítica
 *
 * Mapa de equivalencias: Eventos de Form → Lógica de Negocio/Services → Zod v4
 */

// ─────────────────────────────────────────────────────────────────────────────
// Constantes de validación — alinhadas com CreateContaContabilValidator.cs
// ─────────────────────────────────────────────────────────────────────────────

const GRUPOS_VALIDOS = ['A', 'P', 'R', 'D', 'C', 'O', 'E', 'S'] as const;
const TIPOS_VALIDOS = ['S', 'A'] as const; // Sintética, Analítica
const NATUREZAS_VALIDAS = ['D', 'C', 'N'] as const; // Devedora, Credora, Ambas
const CONVERSOES_VALIDAS = ['N', 'H', 'D', 'C', 'M'] as const;

/**
 * Consistencia Grupo ↔ Natureza (migrado de cmbGrpExit):
 * A→D, P→C, R→C, D→D, C→D, O→N, E→N, S→C
 */
const GRUPO_NATUREZA_MAP: Record<string, string> = {
  A: 'D',
  P: 'C',
  R: 'C',
  D: 'D',
  C: 'D',
  O: 'N',
  E: 'N',
  S: 'C',
};

// ─────────────────────────────────────────────────────────────────────────────
// Schema principal
// ─────────────────────────────────────────────────────────────────────────────

export const contaContabilSchema = z
  .object({
    // PK
    plano: z.number().int().min(1, 'Plano é obrigatório'),
    codigo: z
      .string()
      .min(1, 'Código é obrigatório')
      .max(20, 'Código deve ter no máximo 20 caracteres'),

    // Datos básicos
    descricao: z.string().min(1, 'Descrição é obrigatória').max(100),
    descricaoIdioma: z.string().max(100).optional().nullable(),
    tipo: z.enum(TIPOS_VALIDOS, {
      message: 'Tipo deve ser S (Sintética) ou A (Analítica)',
    }),
    grupo: z.enum(GRUPOS_VALIDOS, {
      message: 'Grupo inválido (A/P/R/D/C/O/E/S)',
    }),
    nivel: z.number().int().min(1, 'Nível deve ser maior que 0').max(20),
    codigoReduzido: z.number().int(),
    natureza: z.enum(NATUREZAS_VALIDAS).optional().nullable(),
    contaCorrespondente: z.string().max(20).optional().nullable(),

    // Checkboxes
    ordemAlfabetica: z.boolean().optional().nullable(),
    aceitaCentroCusto: z.boolean().optional().nullable(),
    permiteAlteracao: z.boolean(),
    inativa: z.boolean(),
    conciliavel: z.boolean().optional().nullable(),
    sumarizaLancamentos: z.boolean().optional().nullable(),
    obrigaSubconta: z.boolean().optional().nullable(),
    contaPadraoSecretaria: z.boolean().optional().nullable(),
    imprimeRelEvolucao: z.boolean().optional().nullable(),
    aceitaMutacoes: z.boolean().optional().nullable(),
    usoExclusivoPga: z.boolean().optional().nullable(),
    estatisticaComLancamento: z.boolean().optional().nullable(),

    // Bloqueio
    bloqueada: z.boolean().optional().nullable(),
    dataBloqueio: z.string().optional().nullable(),

    // Rateio (Delphi: PLARATEIOAP — rdgRateio con 3 valores: N/S/R)
    aceitaRateio: z.enum(['N', 'S', 'R']).optional().nullable(),

    // Conversão de Moeda
    // Migrado de CmeCadastroBeforeConfirma (líneas 1448-1458):
    //   if PLATIPCONVGER = '' then PLATIPCONVGER := 'N';
    // Usamos preprocess para normalizar null/undefined → 'N' antes da validação.
    conversaoOficial: z.preprocess(
      (val) => (val === null || val === undefined || val === '' ? 'N' : val),
      z.enum(CONVERSOES_VALIDAS),
    ),
    conversaoGerencial: z.preprocess(
      (val) => (val === null || val === undefined || val === '' ? 'N' : val),
      z.enum(CONVERSOES_VALIDAS),
    ),
    conversaoGerencial2: z.preprocess(
      (val) => (val === null || val === undefined || val === '' ? 'N' : val),
      z.enum(CONVERSOES_VALIDAS),
    ),
    conversaoGerencial3: z.preprocess(
      (val) => (val === null || val === undefined || val === '' ? 'N' : val),
      z.enum(CONVERSOES_VALIDAS),
    ),

    // Sub-grupos
    subGrupo1: z.number().int().optional().nullable(),
    subGrupo2: z.number().int().optional().nullable(),
    subGrupo3: z.number().int().optional().nullable(),
    subGrupo4: z.number().int().optional().nullable(),

    // Moeda e Juros
    moedaId: z.number().int().optional().nullable(),
    contrapartidaJuros: z.string().max(20).optional().nullable(),
    taxaJuros: z.number().min(0, 'Taxa de juros deve ser >= 0').max(100, 'Taxa de juros deve ser <= 100').optional().nullable(),

    // Contas de Relación
    contrapartida: z.string().max(20).optional().nullable(),
    contaSegregacao: z.string().max(20).optional().nullable(),
    contaSegregacaoFdoAdmCred: z.string().max(20).optional().nullable(),
    contaSegregacaoFdoAdmDeb: z.string().max(20).optional().nullable(),
    contaAglutinacao: z.string().max(20).optional().nullable(),
    contaExtracontabil: z.string().max(20).optional().nullable(),

    // Segregação e Rateio
    segregacaoCriterId: z.number().int().optional().nullable(),
    programaId: z.number().int().optional().nullable(),
    rateioPlanoAdmId: z.number().int().optional().nullable(),

    // Observações
    observacoes: z.string().max(1000).optional().nullable(),
  })
  .superRefine((data, ctx) => {
    // Regra: Consistencia Grupo ↔ Natureza (migrado de cmbGrpExit)
    if (data.natureza && data.grupo) {
      const naturezaEsperada = GRUPO_NATUREZA_MAP[data.grupo];
      if (naturezaEsperada && data.natureza !== naturezaEsperada) {
        ctx.addIssue({
          code: z.ZodIssueCode.custom,
          path: ['natureza'],
          message: `Natureza inconsistente com grupo ${data.grupo}. Esperado: ${naturezaEsperada}`,
        });
      }
    }

    // Regra: Conta sintética não pode ter centro de custo (migrado de grpTipoClick)
    if (data.tipo === 'S' && data.aceitaCentroCusto === true) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        path: ['aceitaCentroCusto'],
        message: 'Conta sintética não pode aceitar centro de custo',
      });
    }

    // Regra: Nível 1 deve ser Sintética (migrado de dbeCodigoExit)
    if (data.nivel === 1 && data.tipo !== 'S') {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        path: ['tipo'],
        message: 'Conta de nível 1 (raiz) deve ser Sintética',
      });
    }

    // Regra: Taxa de juros só faz sentido se houver contrapartida de juros
    if (data.taxaJuros && data.taxaJuros > 0 && !data.contrapartidaJuros) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        path: ['contrapartidaJuros'],
        message: 'Contrapartida de juros é obrigatória quando taxa de juros > 0',
      });
    }
  });

export type TContaContabilSchema = z.infer<typeof contaContabilSchema>;

// ─────────────────────────────────────────────────────────────────────────────
// Defaults — migrados de CmeCadastroInsert (líneas 809-829)
// ─────────────────────────────────────────────────────────────────────────────

export const contaContabilDefaults: TContaContabilSchema = {
  plano: 1,
  codigo: '',
  descricao: '',
  descricaoIdioma: null,
  tipo: 'S',
  grupo: 'A',
  nivel: 1,
  codigoReduzido: 0,
  natureza: 'D',
  contaCorrespondente: null,
  ordemAlfabetica: false,
  aceitaCentroCusto: false,
  permiteAlteracao: true,
  inativa: false,
  conciliavel: false,
  sumarizaLancamentos: false,
  obrigaSubconta: false,
  contaPadraoSecretaria: false,
  imprimeRelEvolucao: true,
  aceitaMutacoes: false,
  usoExclusivoPga: false,
  bloqueada: false,
  dataBloqueio: null,
  aceitaRateio: 'S',
  conversaoOficial: 'N',
  conversaoGerencial: 'N',
  conversaoGerencial2: 'N',
  conversaoGerencial3: 'N',
  subGrupo1: null,
  subGrupo2: null,
  subGrupo3: null,
  subGrupo4: null,
  moedaId: null,
  contrapartidaJuros: null,
  taxaJuros: null,
  contrapartida: null,
  contaSegregacao: null,
  contaSegregacaoFdoAdmCred: null,
  contaSegregacaoFdoAdmDeb: null,
  contaAglutinacao: null,
  contaExtracontabil: null,
  segregacaoCriterId: null,
  programaId: null,
  rateioPlanoAdmId: null,
  observacoes: null,
};
