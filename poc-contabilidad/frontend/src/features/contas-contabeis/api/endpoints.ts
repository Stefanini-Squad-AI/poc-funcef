export const endpoints = {
  planos: (incluirInativos: boolean = false) =>
    `/api/planoscontabeis?incluirInativos=${incluirInativos}`,
  rateios: (incluirInativos: boolean = false) =>
    `/api/rateiosplanopatro?incluirInativos=${incluirInativos}`,
  segregacoesCriter: () => '/api/segregacoescriter',
  programas: () => '/api/programas',
  paramGlobal: (idEmpresa: number) => `/api/paramglobal/${idEmpresa}`,
  paramContab: (idEmpresa: number) => `/api/paramcontab/${idEmpresa}`,
  subGrupos: () => '/api/subgrupos',
  moedas: () => '/api/moedas',
  centrosCusto: (idEmpresa: number, plano: number, placConta: string) =>
    `/api/centroscusto?idEmpresa=${idEmpresa}&plano=${plano}&placConta=${encodeURIComponent(placConta)}`,
  contasxCC: (idEmpresa: number, plano: number, placConta: string) =>
    `/api/contasxcc?idEmpresa=${idEmpresa}&plano=${plano}&placConta=${encodeURIComponent(placConta)}`,
  associateContasxCC: () => '/api/contasxcc/associate',
  disassociateContasxCC: () => '/api/contasxcc/disassociate',
  subContas: (idEmpresa: number, plano: number, placConta: string) =>
    `/api/subcontas?idEmpresa=${idEmpresa}&plano=${plano}&placConta=${encodeURIComponent(placConta)}`,
  contasxSC: (idEmpresa: number, plano: number, placConta: string) =>
    `/api/contasxsc?idEmpresa=${idEmpresa}&plano=${plano}&placConta=${encodeURIComponent(placConta)}`,
  associateContasxSC: () => '/api/contasxsc/associate',
  disassociateContasxSC: () => '/api/contasxsc/disassociate',
  tree: (incluirInativas: boolean = false, plano?: number) =>
    `/api/contascontabeis/tree?incluirInativas=${incluirInativas}${plano ? `&plano=${plano}` : ''}`,
  getById: (plano: number, codigo: string) =>
    `/api/contascontabeis/${plano}/${codigo}`,
  create: () => '/api/contascontabeis',
  update: (plano: number, codigo: string) =>
    `/api/contascontabeis/${plano}/${codigo}`,
  delete: (plano: number, codigo: string) =>
    `/api/contascontabeis/${plano}/${codigo}`,
};
