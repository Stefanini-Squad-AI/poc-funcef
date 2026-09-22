import { api } from '@/core/api';
import { endpoints } from './endpoints';
import type {
  ContaContabil,
  CreateContaContabilRequest,
  UpdateContaContabilRequest,
  PlanoContabil,
  RateioPlanoPatro,
  SegregacaoCriter,
  Programa,
  ParamGlobal,
  ParamContab,
  SubGrupo,
  Moeda,
  CentroCusto,
  ContasxCC,
  AssociateContasxCCRequest,
  DisassociateContasxCCRequest,
  SubConta,
  ContasxSC,
  AssociateContasxSCRequest,
  DisassociateContasxSCRequest,
} from '../types';

export const contasContabeisApi = {
  getPlanos: (incluirInativos: boolean = false) =>
    api.get<PlanoContabil[]>(endpoints.planos(incluirInativos)),

  getRateios: (incluirInativos: boolean = false) =>
    api.get<RateioPlanoPatro[]>(endpoints.rateios(incluirInativos)),

  getSegregacoesCriter: () =>
    api.get<SegregacaoCriter[]>(endpoints.segregacoesCriter()),

  getProgramas: () =>
    api.get<Programa[]>(endpoints.programas()),

  getParamGlobal: (idEmpresa: number) =>
    api.get<ParamGlobal>(endpoints.paramGlobal(idEmpresa)),

  getParamContab: (idEmpresa: number) =>
    api.get<ParamContab>(endpoints.paramContab(idEmpresa)),

  getSubGrupos: () =>
    api.get<SubGrupo[]>(endpoints.subGrupos()),

  getMoedas: () =>
    api.get<Moeda[]>(endpoints.moedas()),

  getCentrosCusto: (idEmpresa: number, plano: number, placConta: string) =>
    api.get<CentroCusto[]>(endpoints.centrosCusto(idEmpresa, plano, placConta)),

  getContasxCC: (idEmpresa: number, plano: number, placConta: string) =>
    api.get<ContasxCC[]>(endpoints.contasxCC(idEmpresa, plano, placConta)),

  associateContasxCC: (data: AssociateContasxCCRequest) =>
    api.post(endpoints.associateContasxCC(), data),

  disassociateContasxCC: (data: DisassociateContasxCCRequest) =>
    api.post(endpoints.disassociateContasxCC(), data),

  getSubContas: (idEmpresa: number, plano: number, placConta: string) =>
    api.get<SubConta[]>(endpoints.subContas(idEmpresa, plano, placConta)),

  getContasxSC: (idEmpresa: number, plano: number, placConta: string) =>
    api.get<ContasxSC[]>(endpoints.contasxSC(idEmpresa, plano, placConta)),

  associateContasxSC: (data: AssociateContasxSCRequest) =>
    api.post(endpoints.associateContasxSC(), data),

  disassociateContasxSC: (data: DisassociateContasxSCRequest) =>
    api.post(endpoints.disassociateContasxSC(), data),

  getTree: (incluirInativas: boolean = false, plano?: number) =>
    api.get<ContaContabil[]>(endpoints.tree(incluirInativas, plano)),

  getById: (plano: number, codigo: string) =>
    api.get<ContaContabil>(endpoints.getById(plano, codigo)),

  create: (data: CreateContaContabilRequest) =>
    api.post<ContaContabil, CreateContaContabilRequest>(endpoints.create(), data),

  update: (plano: number, codigo: string, data: UpdateContaContabilRequest) =>
    api.put<ContaContabil, UpdateContaContabilRequest>(
      endpoints.update(plano, codigo),
      data,
    ),

  delete: (plano: number, codigo: string) =>
    api.delete<void>(endpoints.delete(plano, codigo)),
};
