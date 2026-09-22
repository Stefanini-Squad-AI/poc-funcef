/**
 * Fábrica central de query-keys do React Query — evita arrays inline
 * (`['contas', 'tree']`) espalhados pela base.
 *
 * Padrão por grupo: `all` (raiz), `list()` (coleção), `detail(id)`.
 */
export const queryKeys = {
  contasContabeis: {
    all: ['contas-contabeis'] as const,
    tree: () => [...queryKeys.contasContabeis.all, 'tree'] as const,
    detail: (plano: number, codigo: string) =>
      [...queryKeys.contasContabeis.all, 'detail', plano, codigo] as const,
  },
  planosContabeis: {
    all: ['planos-contabeis'] as const,
    list: () => [...queryKeys.planosContabeis.all, 'list'] as const,
  },
  rateiosPlanoPatro: {
    all: ['rateios-plano-patro'] as const,
    list: () => [...queryKeys.rateiosPlanoPatro.all, 'list'] as const,
  },
  segregacoesCriter: {
    all: ['segregacoes-criter'] as const,
    list: () => [...queryKeys.segregacoesCriter.all, 'list'] as const,
  },
  programas: {
    all: ['programas'] as const,
    list: () => [...queryKeys.programas.all, 'list'] as const,
  },
  subGrupos: {
    all: ['sub-grupos'] as const,
    list: () => [...queryKeys.subGrupos.all, 'list'] as const,
  },
  moedas: {
    all: ['moedas'] as const,
    list: () => [...queryKeys.moedas.all, 'list'] as const,
  },
  paramGlobal: {
    all: ['param-global'] as const,
    detail: (idEmpresa: number) =>
      [...queryKeys.paramGlobal.all, 'detail', idEmpresa] as const,
  },
  paramContab: {
    all: ['param-contab'] as const,
    detail: (idEmpresa: number) =>
      [...queryKeys.paramContab.all, 'detail', idEmpresa] as const,
  },
  centrosCusto: {
    all: ['centros-custo'] as const,
    list: (idEmpresa: number, plano: number, placConta: string) =>
      [...queryKeys.centrosCusto.all, 'list', idEmpresa, plano, placConta] as const,
  },
  contasxCC: {
    all: ['contas-x-cc'] as const,
    list: (idEmpresa: number, plano: number, placConta: string) =>
      [...queryKeys.contasxCC.all, 'list', idEmpresa, plano, placConta] as const,
  },
  subContas: {
    all: ['sub-contas'] as const,
    list: (idEmpresa: number, plano: number, placConta: string) =>
      [...queryKeys.subContas.all, 'list', idEmpresa, plano, placConta] as const,
  },
  contasxSC: {
    all: ['contas-x-sc'] as const,
    list: (idEmpresa: number, plano: number, placConta: string) =>
      [...queryKeys.contasxSC.all, 'list', idEmpresa, plano, placConta] as const,
  },
} as const;
