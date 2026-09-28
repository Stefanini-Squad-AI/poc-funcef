'use client';

import { Controller, UseFormReturn, useWatch } from 'react-hook-form';
import { useEffect, useState } from 'react';
import {
  Card,
  Input,
  NativeSelect,
  Checkbox,
  RadioGroup,
  RadioGroupItem,
  Label,
} from '@funcef-componentes/react';
import type { TContaContabilSchema } from '../validators';
import type { ParamContab } from '../types';
import { usePlanosContabeis, useRateiosPlanoPatro, useSegregacoesCriter, useProgramas, useParamGlobal, useContasTree, useParamContab } from '../hooks';
import { ContaLookup as ContaLookupWithSearch } from './conta-lookup';

type FormValues = TContaContabilSchema;

/**
 * Mapa Grupo → Natureza (migrado de cmbGrpExit en FCadContasContabMT.pas líneas 613-670)
 * Al seleccionar un Grupo, la Natureza se auto-completa:
 *   A(Ativo)→D(Devedora), P(Passivo)→C(Credora), R(Receita)→C,
 *   D(Despesa)→D, C(Custo)→D, O(Outros)→N, E(Estatística)→N, S(Patrimônio)→C
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

/**
 * Calcula o próximo código reduzido (PLAREDUZ) baseado no grupo e nos parâmetros contábeis.
 * Migração de: uCtrlPlanoConta.pas → CriaCodReduz (linhas 422-431)
 *   Próximo PLAREDUZ = PARAMCONTAB.PACREDUZ{GRUPO} + 1
 * No legacy, cmbGrpExit (FCadContasContabMT.pas líneas 621-666) chama CriaCodReduz
 * e atribui o resultado a dbeCodReduz.text imediatamente ao selecionar o grupo.
 */
function calcularProximoCodigoReduzido(paramContab: ParamContab | null, grupo: string | undefined): number {
  if (!paramContab || !grupo) return 0;
  switch (grupo) {
    case 'A': return paramContab.pacReduzA + 1;
    case 'P': return paramContab.pacReduzP + 1;
    case 'R': return paramContab.pacReduzR + 1;
    case 'D': return paramContab.pacReduzD + 1;
    case 'C': return paramContab.pacReduzC + 1;
    case 'E': return paramContab.pacReduzE + 1;
    case 'O': return paramContab.pacReduzO + 1;
    default: return 0;
  }
}

/**
 * Calcula o grau (nível) a partir do código e da máscara do plano.
 * Migração de: FuncaoGeral.CalcGrauMax + dbeCodigoExit (líneas 571-572)
 * O grau é o número de pontos (separadores) no código + 1.
 * Ex: "1" → grau 1, "1.1" → grau 2, "1.1.1" → grau 3, "1.1.1.01" → grau 4
 */
function calcularGrau(codigo: string): number {
  if (!codigo || codigo.trim() === '') return 1;
  const pontos = codigo.split('.').filter((s) => s.trim() !== '');
  return pontos.length;
}

/**
 * Calcula o grau máximo a partir da máscara do plano.
 * Migração de: FuncaoGeral.CalcGrauMax
 * Ex: "9.99.99.99" → 4 níveis, "9.99.99" → 3 níveis
 */
function calcularGrauMax(mascara: string | null | undefined): number {
  if (!mascara || mascara.trim() === '') return 1;
  const pontos = mascara.split('.').filter((s) => s.trim() !== '');
  return pontos.length;
}

/**
 * Tab 1: Informações Gerais (TabSheet1)
 * Layout reordenado para coincidir com el DFM Delphi (FCadContasContabMT.dfm).
 *
 * Orden visual Delphi (por Top/Left):
 *   Fila 1: Plano | Código | Grau | Tipo(Sintética/Analítica) | Grupo | Cód.Reduzido
 *   Fila 2: Natureza | Descrição em Português
 *   Fila 3: Descrição em outro Idioma | Conta Correspondente
 *   Parâmetros (2 columnas):
 *     Izq: OrdAlf, CentCust, Altera, Inativa, Concilia, ImprimeRelEvolu
 *     Der: Subconta, Sumariza, PL, Bloqueia+data, ContaPadrao, ComLancamento
 *   Rateio: 3 opciones (Conta para Rateio / Base / Não Processada)
 */
export function TabInformacoesGerais({ form, isEditing = false, contaCarregada = false }: { form: UseFormReturn<FormValues>; isEditing?: boolean; contaCarregada?: boolean }) {
  const {
    register,
    control,
    formState: { errors },
  } = form;

  // Modo consulta: conta carregada via Procurar sem clicar em Alterar.
  // Equivalente ao OpIdle (dsBrowse) do Delphi — todos os campos read-only.
  // O <fieldset disabled> no conta-contabil-form.tsx desabilita controles nativos,
  // mas componentes Radix UI (Checkbox, RadioGroup) renderizam <button> e precisam
  // do prop disabled explícito.
  const consultaMode = contaCarregada && !isEditing;

  // Carrega planos contábeis para o dropdown (dblkPlanoContabil no Delphi)
  const { planos, isLoading: isLoadingPlanos } = usePlanosContabeis();

  // Carrega rateios por plano/patrocinadora para o dropdown (dblkRateioPlanoPatro no Delphi)
  const { rateios, isLoading: isLoadingRateios } = useRateiosPlanoPatro();

  // Carrega critérios de segregação para o dropdown (dblkSegregacao no Delphi)
  const { segregacoes, isLoading: isLoadingSegregacoes } = useSegregacoesCriter();

  // Carrega programas para o dropdown (cboPrograma no Delphi)
  const { programas, isLoading: isLoadingProgramas } = useProgramas();

  // Carrega Parâmetros Globais da empresa (PARAMGLOBAL.FLGSEGREGAVIRTUAL)
  // Migração de: uCtrlParamIntegra.pas → GetParams(Sistema.IdEmpresa)
  // No legacy, IdEmpresa vem do login. Aqui, via env NEXT_PUBLIC_ID_EMPRESA (default: 1).
  const ID_EMPRESA = Number(process.env.NEXT_PUBLIC_ID_EMPRESA ?? '1');
  const { paramGlobal } = useParamGlobal(ID_EMPRESA);

  // Carrega Parâmetros Contábeis da empresa (PARAMCONTAB.PACREDUZ*)
  // Migração de: uCtrlContab.pas → TCtrlContab
  // Usado para pré-calcular o código reduzido ao selecionar grupo
  // (migração de cmbGrpExit → CriaCodReduz, FCadContasContabMT.pas líneas 621-666)
  const { paramContab } = useParamContab(ID_EMPRESA);

  // ─── Regras de negocio migradas de FCadContasContabMT.pas ───

  // Watch campos reactivos para auto-complete
  const watchedGrupo = useWatch({ control, name: 'grupo' });
  const watchedCodigo = useWatch({ control, name: 'codigo' });
  const watchedNivel = useWatch({ control, name: 'nivel' });
  const watchedPlano = useWatch({ control, name: 'plano' });
  const bloqueada = useWatch({ control, name: 'bloqueada' });
  const watchedTipo = useWatch({ control, name: 'tipo' });

  // SegregaVirtual: parâmetro do sistema que define se a empresa usa Segregação Virtual.
  // Migração de FCadContasContabMT.pas FormCreate (líneas 380-383).
  // Quando true: desabilita rateio, habilita segregação/programa.
  // Quando false (default): habilita rateio, desabilita segregação/programa.
  // Origem: tabela PARAMGLOBAL.FLGSEGREGAVIRTUAL WHERE IDPESSOA = Sistema.IdEmpresa
  // Nesta POC: lido do backend via GET /api/paramglobal/{idEmpresa}
  //   idEmpresa configurável via env NEXT_PUBLIC_ID_EMPRESA (ver arquivo .env do frontend)
  // Fallback: false (modo Rateio/antigo) enquanto carrega ou se não encontrar a empresa
  const SEGREGA_VIRTUAL = paramGlobal?.segregaVirtual ?? false;

  // Carrega árvore de contas do plano selecionado para validações de código
  // Migração de: dbeCodigoExit → CtrlPlanoConta.ContaExiste (líneas 517, 541)
  const { contas: contasExistentes, isLoading: isLoadingContas } = useContasTree(false, watchedPlano);

  // Estado para bloqueio do grupo
  // Migração de: dbeCodigoExit — mensagens de erro e bloqueio de cmbGrp (líneas 519, 544, 603-604)
  // Nota: codigoError agora usa form.setError('codigo', ...) para bloquear o guardado
  //       alinhado com o legacy que limpa o código e sai do procedimento (dbeCodigo.text := ''; exit)
  const [grupoLocked, setGrupoLocked] = useState(false);

  // Regra 1: Grupo → Natureza + Auto-gerar PLAREDUZ (migrado de cmbGrpExit, líneas 613-670)
  // Al seleccionar un Grupo, la Natureza se auto-completa:
  // A→D, P→C, R→C, D→D, C→D, O→N, E→N, S→C
  // No legacy, cmbGrpExit também chama CriaCodReduz para auto-gerar o código reduzido
  // e mostra o valor imediatamente no campo dbeCodReduz.
  // Aqui, calculamos PACREDUZ{GRUPO} + 1 e mostramos no campo (read-only).
  // O backend recebe o valor já calculado e não precisa auto-gerar.
  useEffect(() => {
    if (watchedGrupo && GRUPO_NATUREZA_MAP[watchedGrupo]) {
      form.setValue('natureza', GRUPO_NATUREZA_MAP[watchedGrupo] as never);
      // Pré-calcular codigoReduzido = PACREDUZ{GRUPO} + 1 (migrado de cmbGrpExit → CriaCodReduz)
      if (!isEditing && !contaCarregada) {
        const proximoReduz = calcularProximoCodigoReduzido(paramContab, watchedGrupo);
        form.setValue('codigoReduzido', proximoReduz);
      }
    }
  }, [watchedGrupo, form, isEditing, contaCarregada, paramContab]);

  // Regra 2: Código → Grau (migrado de dbeCodigoExit, líneas 571-572)
  // El grau se calcula automáticamente contando los puntos del código
  useEffect(() => {
    if (watchedCodigo) {
      const grau = calcularGrau(watchedCodigo);
      form.setValue('nivel', grau);
    }
  }, [watchedCodigo, form]);

  // Regra 3: Grau → Tipo (migrado de dbeCodigoExit, líneas 573-580)
  // Se grau = grauMax → Analítica; se grau = 1 → Sintética
  const planoSelecionado = planos?.find((p) => p.id === watchedPlano);
  const grauMax = calcularGrauMax(planoSelecionado?.mascara);

  useEffect(() => {
    if (watchedNivel === grauMax) {
      form.setValue('tipo', 'A');
    } else if (watchedNivel === 1) {
      form.setValue('tipo', 'S');
    }
  }, [watchedNivel, grauMax, form]);

  // Regra 4: grpTipoClick (migrado de FCadContasContabMT.pas líneas 986-999)
  // Quando Tipo = Sintética (S): habilita Ordem Alfabética, desabilita Centro de Custo
  // Quando Tipo = Analítica (A): desabilita Ordem Alfabética, habilita Centro de Custo
  const ordemAlfabeticaDisabled = watchedTipo === 'A';
  const aceitaCentroCustoDisabled = watchedTipo === 'S';

  // Regra 4 (complementar): Resetar checkboxes ao serem desabilitados
  // Quando o checkbox fica desabilitado pela mudança de Tipo, seu valor deve voltar a false
  useEffect(() => {
    if (watchedTipo === 'A') {
      form.setValue('ordemAlfabetica', false);
    }
    if (watchedTipo === 'S') {
      form.setValue('aceitaCentroCusto', false);
    }
  }, [watchedTipo, form]);

  // Regra 5: chkBloqueiaClick (migrado de FCadContasContabMT.pas líneas 672-683)
  // Quando o checkbox "Bloqueada" é desmarcado, a data de bloqueio deve ser limpa
  // e o campo desabilitado. No Delphi, também muda a cor (clBtnFace).
  useEffect(() => {
    if (!bloqueada) {
      form.setValue('dataBloqueio', null);
    }
  }, [bloqueada, form]);

  // Regra 6: FormShow — chkUsoExcPga := False (migrado de líneas 764-766)
  // Ao montar o componente (equivalente ao FormShow do Delphi), resetar usoExclusivoPga
  useEffect(() => {
    form.setValue('usoExclusivoPga', false);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Regra 7: dbeCodigoExit — validação de conta existente, conta pai e grupo do pai
  // (migrado de FCadContasContabMT.pas líneas 488-611)
  // Verifica: (a) se a conta já existe, (b) se o pai existe, (c) se o pai é sintético,
  // (d) se o pai tem grupo 'E' → força grupo='E' e bloqueia o combo
  useEffect(() => {
    // Não validar enquanto carrega a lista de contas — evita falso "não tem pai"
    // quando o cache do React Query ainda está sendo atualizado (ex: após criar conta pai)
    if (!watchedCodigo || !contasExistentes || isLoadingContas) {
      if (!watchedCodigo) {
        form.clearErrors('codigo');
        setGrupoLocked(false);
      }
      return;
    }

    // (a) Verifica se conta já está cadastrada (Delphi líneas 517-522)
    //     Skip em modo edição/consulta (isEditing || contaCarregada):
    //     a conta existe, isso é esperado. Esta validação só se aplica
    //     em modo inserção (nova conta). Sem este skip, ao carregar uma
    //     conta via Procurar o useEffect dispara e seta o erro
    //     "Conta já cadastrada." no campo código, bloqueando o salvamento
    //     de alterações (handleSalvar aborta por form.formState.errors).
    if (!isEditing && !contaCarregada) {
      const existe = contasExistentes.some(
        (c) => c.codigo === watchedCodigo && c.plano === watchedPlano,
      );
      if (existe) {
        form.setError('codigo', { type: 'manual', message: 'Conta já cadastrada.' });
        setGrupoLocked(false);
        return;
      }
    }

    // Calcula grau e código do pai
    const grau = calcularGrau(watchedCodigo);

    // (b) e (c) Verifica conta pai (Delphi líneas 536-561)
    if (grau > 1) {
      const parts = watchedCodigo.split('.');
      const parentCode = parts.slice(0, -1).join('.');
      const parent = contasExistentes.find(
        (c) => c.codigo === parentCode && c.plano === watchedPlano,
      );
      if (!parent) {
        form.setError('codigo', { type: 'manual', message: 'A conta digitada não tem pai.' });
        setGrupoLocked(false);
        return;
      }
      if (parent.tipo === 'A') {
        form.setError('codigo', { type: 'manual', message: 'A Conta Pai da conta digitada é Analítica.' });
        setGrupoLocked(false);
        return;
      }

      // (d) Se pai tem grupo 'E' → força grupo='E' e bloqueia combo (Delphi líneas 600-607)
      if (parent.grupo === 'E') {
        form.setValue('grupo', 'E');
        setGrupoLocked(true);
        // Dispara a regra Grupo→Natureza (cmbGrpExit) para 'E' → 'N'
        form.setValue('natureza', 'N');
      } else {
        setGrupoLocked(false);
      }
    } else {
      setGrupoLocked(false);
    }

    form.clearErrors('codigo');
  }, [watchedCodigo, watchedPlano, contasExistentes, isLoadingContas, form, isEditing, contaCarregada]);

  return (
    <div className="space-y-6">
      {/* ───────────────── IDENTIFICAÇÃO ───────────────── */}
      {/* Delphi TabSheet1 filas 1-3 (Top=2-93) */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Identificação da Conta</h2>
        <div className="grid grid-cols-1 md:grid-cols-12 gap-4">
          {/* Fila 1: Plano | Código | Grau | Tipo | Grupo | Cód.Reduzido */}
          <div className="md:col-span-3">
            <Label className="text-sm font-medium">Plano Contábil <span className="text-red-500">*</span></Label>
            <Controller
              name="plano"
              control={control}
              render={({ field }) => (
                <NativeSelect
                  value={field.value ?? ''}
                  onChange={(e) => field.onChange(e.target.value === '' ? undefined : Number(e.target.value))}
                  disabled={isLoadingPlanos || isEditing}
                >
                  <option value="">
                    {isLoadingPlanos ? 'Carregando...' : 'Selecione...'}
                  </option>
                  {planos?.map((plano) => (
                    <option key={plano.id} value={plano.id}>
                      {plano.id} - {plano.nome}
                    </option>
                  ))}
                </NativeSelect>
              )}
            />
            {errors.plano && <span className="text-xs text-red-500">{errors.plano.message}</span>}
          </div>

          <div className="md:col-span-2">
            <Label className="text-sm font-medium">Código <span className="text-red-500">*</span></Label>
            <Input
              {...register('codigo')}
              placeholder="Ex: 1.1.1.01"
              disabled={isEditing}
              aria-invalid={!!errors.codigo}
            />
            {errors.codigo && <span className="text-xs text-red-500">{errors.codigo.message}</span>}
          </div>

          <div className="md:col-span-1">
            <Label className="text-sm font-medium">Grau <span className="text-red-500">*</span></Label>
            <Input
              type="number"
              {...register('nivel', { valueAsNumber: true })}
              placeholder="1"
              readOnly
              className="bg-muted/50 cursor-not-allowed"
              title="Grau calculado automaticamente a partir do Código"
            />
            {errors.nivel && <span className="text-xs text-red-500">{errors.nivel.message}</span>}
          </div>

          {/* Tipo (grpTipo) — entre Grau e Grupo no Delphi (Left=340) */}
          <div className="md:col-span-3">
            <Label className="text-sm font-medium block mb-2">Tipo <span className="text-red-500">*</span></Label>
            <Controller
              name="tipo"
              control={control}
              render={({ field }) => (
                <RadioGroup
                  value={field.value}
                  onValueChange={field.onChange}
                  className="flex gap-4"
                  disabled={consultaMode}
                >
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="S" id="sintetica" />
                    <Label htmlFor="sintetica" className="text-sm">Sintética</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="A" id="analitica" />
                    <Label htmlFor="analitica" className="text-sm">Analítica</Label>
                  </div>
                </RadioGroup>
              )}
            />
            {errors.tipo && <span className="text-xs text-red-500">{errors.tipo.message}</span>}
          </div>

          <div className="md:col-span-2">
            <Label className="text-sm font-medium">Grupo <span className="text-red-500">*</span></Label>
            <Controller
              name="grupo"
              control={control}
              render={({ field }) => (
                <NativeSelect
                  value={field.value ?? ''}
                  onChange={(e) => field.onChange(e.target.value)}
                  disabled={grupoLocked}
                >
                  <option value="A">Ativo</option>
                  <option value="P">Passivo</option>
                  <option value="R">Receita</option>
                  <option value="D">Despesa</option>
                  <option value="C">Custo</option>
                  <option value="O">Outros</option>
                  <option value="E">Estatística</option>
                  <option value="S">Patrimônio Social</option>
                </NativeSelect>
              )}
            />
            {errors.grupo && <span className="text-xs text-red-500">{errors.grupo.message}</span>}
          </div>

          <div className="md:col-span-1">
            <Label className="text-sm font-medium">Cód.Reduzido</Label>
            <Input
              type="number"
              {...register('codigoReduzido', { valueAsNumber: true })}
              placeholder="Selecione um grupo"
              readOnly={!isEditing && !contaCarregada}
              className={!isEditing && !contaCarregada ? 'bg-muted/50 cursor-not-allowed' : ''}
              title={!isEditing && !contaCarregada ? 'Auto-calculado ao selecionar grupo (PACREDUZ + 1)' : ''}
            />
            {errors.codigoReduzido && (
              <span className="text-xs text-red-500">{errors.codigoReduzido.message}</span>
            )}
          </div>

          {/* Fila 2: Natureza (full width) */}
          <div className="md:col-span-12">
            <Label className="text-sm font-medium block mb-2">Natureza</Label>
            <Controller
              name="natureza"
              control={control}
              render={({ field }) => (
                <RadioGroup
                  value={field.value ?? undefined}
                  onValueChange={field.onChange}
                  className="flex gap-4"
                  disabled={consultaMode}
                >
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="D" id="dev" />
                    <Label htmlFor="dev" className="text-sm">Devedora</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="C" id="cred" />
                    <Label htmlFor="cred" className="text-sm">Credora</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="N" id="ambas" />
                    <Label htmlFor="ambas" className="text-sm">Devedora ou Credora</Label>
                  </div>
                </RadioGroup>
              )}
            />
            {errors.natureza && (
              <span className="text-xs text-red-500">{errors.natureza.message}</span>
            )}
          </div>

          {/* Fila 3: Descrição em Português (col 1) | Conta Correspondente (col 2) */}
          <div className="md:col-span-8">
            <Label className="text-sm font-medium">Descrição em Português <span className="text-red-500">*</span></Label>
            <Input {...register('descricao')} placeholder="Nome da conta" />
            {errors.descricao && (
              <span className="text-xs text-red-500">{errors.descricao.message}</span>
            )}
          </div>

          <div className="md:col-span-4">
            <Label className="text-sm font-medium">Conta Correspondente</Label>
            <Input {...register('contaCorrespondente')} placeholder="—" />
          </div>

          {/* Fila 4: Descrição em outro Idioma (mesma coluna e ancho que Português) */}
          <div className="md:col-span-8">
            <Label className="text-sm font-medium">Descrição em outro Idioma</Label>
            <Input {...register('descricaoIdioma')} placeholder="English / Español" />
          </div>
        </div>
      </Card>

      {/* ───────────────── PARÂMETROS ───────────────── */}
      {/* Delphi GroupBox4 (Top=115) — 2 colunas + rdgRateio (Top=116) */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Parâmetros</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-3">
          {/* Columna izquierda (Left=7 no Delphi) */}
          <div className="space-y-3">
            <CheckboxField form={form} name="ordemAlfabetica" id="alfabetica" label="Lista em ordem alfabética" disabled={consultaMode || ordemAlfabeticaDisabled} />
            <CheckboxField form={form} name="aceitaCentroCusto" id="ccusto" label="Obriga Centro de Custo" disabled={consultaMode || aceitaCentroCustoDisabled} />
            <CheckboxField form={form} name="permiteAlteracao" id="alteracao" label="Permite movimentação pela Contabilidade" disabled={consultaMode} />
            <CheckboxField form={form} name="inativa" id="inativa" label="Inativa" labelClassName="text-sm font-medium text-red-600" disabled={consultaMode} />
            <CheckboxField form={form} name="conciliavel" id="concilia" label="Concilia" disabled={consultaMode} />
            <CheckboxField form={form} name="imprimeRelEvolucao" id="relatorio" label="Imprime no Rel. de Evolução das Contas" disabled={consultaMode} />
          </div>

          {/* Columna derecha (Left=276 no Delphi) */}
          <div className="space-y-3">
            <CheckboxField form={form} name="obrigaSubconta" id="subconta" label="Obriga Sub-Conta / Contas Auxiliares" disabled={consultaMode} />
            <CheckboxField form={form} name="sumarizaLancamentos" id="summarizar" label="Sumarizar Lançamentos no Diário e Razão" disabled={consultaMode} />
            <CheckboxField form={form} name="aceitaMutacoes" id="mutacoes" label="Altera Patrimônio Líquido" disabled={consultaMode} />
            {/* Conta Padrão da Secretaria — Delphi: chkContaPadrao (PLASECRETARIA) */}
            <CheckboxField form={form} name="contaPadraoSecretaria" id="padraoSec" label="Conta Padrão da Secretaria" disabled={consultaMode} />
            {/* Bloqueada até — Delphi: chkBloqueia (PLABLOQUE) + dteBloqueada (PLABLOQUEDATA) */}
            <div className="flex items-center gap-2">
              <CheckboxField form={form} name="bloqueada" id="bloqueada" label="Bloqueada até" disabled={consultaMode} />
              <Input
                type="date"
                className="h-8 text-xs"
                disabled={consultaMode || !bloqueada}
                {...register('dataBloqueio')}
              />
            </div>
            <CheckboxField form={form} name="estatisticaComLancamento" id="estatistica" label="Conta Estatística com Movimento" disabled={consultaMode} />
          </div>
        </div>

        {/* Rateio (rdgRateio) — 3 opções no Delphi: N/S/R */}
        {/* Delphi: rdgRateio.Enabled = not SegregaVirtual */}
        <div className={`mt-4 pt-4 border-t${SEGREGA_VIRTUAL ? ' opacity-50 pointer-events-none' : ''}`}>
          <Label className="text-sm font-medium block mb-2">Segreg. Investimento ( antiga )</Label>
          <Controller
            name="aceitaRateio"
            control={control}
            render={({ field }) => (
              <RadioGroup
                value={field.value ?? undefined}
                onValueChange={field.onChange}
                className="flex gap-4"
                disabled={consultaMode || SEGREGA_VIRTUAL}
              >
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="N" id="rateio-nao" />
                  <Label htmlFor="rateio-nao" className="text-sm">Conta para Rateio</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="S" id="rateio-sim" />
                  <Label htmlFor="rateio-sim" className="text-sm">Conta Base de Rateio</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <RadioGroupItem value="R" id="rateio-naoproc" />
                  <Label htmlFor="rateio-naoproc" className="text-sm">Conta Não Processada</Label>
                </div>
              </RadioGroup>
            )}
          />
        </div>

        {/* Rateio por Plano/Patro (dblkRateioPlanoPatro) — lookup combo no Delphi */}
        {/* Delphi: Label20 Caption='Rateio por Plano/Patro', TwwDBLookupCombo, DataField=IDRATADMPLANPATRO */}
        <div className="mt-4 pt-4 border-t">
          <Label className="text-sm font-medium block mb-2">Rateio por Plano/Patro</Label>
          <Controller
            name="rateioPlanoAdmId"
            control={control}
            render={({ field }) => (
              <NativeSelect
                value={field.value ?? ''}
                onChange={(e) => field.onChange(e.target.value === '' ? null : Number(e.target.value))}
                disabled={isLoadingRateios || SEGREGA_VIRTUAL}
                className="max-w-md"
              >
                <option value="">
                  {isLoadingRateios ? 'Carregando...' : 'Selecione...'}
                </option>
                {rateios?.map((rateio) => (
                  <option key={rateio.id} value={rateio.id}>
                    {rateio.descricao}
                  </option>
                ))}
              </NativeSelect>
            )}
          />
          <p className="text-xs text-muted-foreground mt-1">
            Configuração de rateio administrativo por plano/patrocinadora
          </p>
        </div>
      </Card>

      {/* ───────────────── SEGREGAÇÃO DE RECURSOS ───────────────── */}
      {/* Delphi: Label17 (Top=248) + dblkSegregacao (Top=260) + Label22 (Top=248) + cboPrograma (Top=260) */}
      {/* Delphi: Label23 (Top=283) + edtContaExtracontab (Top=296) + chkUsoExcPga (Top=263) */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Segregação de Recursos</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {/* Critério para Segreg. de Recursos — Delphi: dblkSegregacao (IDSEGREGACRITER) */}
          <div>
            <Label className="text-sm font-medium block mb-2">Critério para Segreg. de Recursos</Label>
            <Controller
              name="segregacaoCriterId"
              control={control}
              render={({ field }) => (
                <NativeSelect
                  value={field.value ?? ''}
                  onChange={(e) => field.onChange(e.target.value === '' ? null : Number(e.target.value))}
                  disabled={isLoadingSegregacoes || !SEGREGA_VIRTUAL}
                  className="max-w-md"
                >
                  <option value="">
                    {isLoadingSegregacoes ? 'Carregando...' : 'Selecione...'}
                  </option>
                  {segregacoes?.map((seg) => (
                    <option key={seg.id} value={seg.id}>
                      {seg.descricao}
                    </option>
                  ))}
                </NativeSelect>
              )}
            />
          </div>

          {/* Programa do Critério — Delphi: cboPrograma (IDPROGRAMA) */}
          <div>
            <Label className="text-sm font-medium block mb-2">Programa do Critério</Label>
            <Controller
              name="programaId"
              control={control}
              render={({ field }) => (
                <NativeSelect
                  value={field.value ?? ''}
                  onChange={(e) => field.onChange(e.target.value === '' ? null : Number(e.target.value))}
                  disabled={isLoadingProgramas || !SEGREGA_VIRTUAL}
                  className="max-w-md"
                >
                  <option value="">
                    {isLoadingProgramas ? 'Carregando...' : 'Selecione...'}
                  </option>
                  {programas?.map((prog) => (
                    <option key={prog.id} value={prog.id}>
                      {prog.descricao}
                    </option>
                  ))}
                </NativeSelect>
              )}
            />
          </div>
        </div>

        {/* Conta Extracontábil — Delphi: Label23 (Top=283) + edtContaExtracontab (Top=296) */}
        <div className="mt-4">
          <ContaLookupWithSearch form={form} name="contaExtracontabil" label="Conta Extracontábil" plano={watchedPlano} />
        </div>

        {/* Uso PGA — Delphi: chkUsoExcPga (FLGUSOEXCPGA, ValueChecked=I, ValueUnchecked=A) */}
        <div className="mt-4 pt-4 border-t">
          <CheckboxField form={form} name="usoExclusivoPga" id="usoPga" label="Uso PGA" disabled={consultaMode} />
        </div>
      </Card>

      {/* ───────────────── SEGREGAÇÃO ───────────────── */}
      {/* Delphi: cmContaSegreg (Top=327) + CMContaAglutinacao (Top=327) */}
      {/* Delphi: gbSegregaFDOADM (GroupBox, Top=401) — CMContaSegregFDOAdmCred + CMContaSegregFDOADMDeb */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Segregação</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <ContaLookupWithSearch form={form} name="contaSegregacao" label="Conta para Segregação dos Planos" plano={watchedPlano} />
          <ContaLookupWithSearch form={form} name="contaAglutinacao" label="Conta para Aglutinação" plano={watchedPlano} />
        </div>
        {/* Segregação Fundo Administrativo — Delphi: gbSegregaFDOADM (GroupBox, Top=401) */}
        <div className="mt-4 pt-4 border-t">
          <h3 className="text-sm font-semibold mb-3 text-muted-foreground">Segregação Fundo Administrativo</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <ContaLookupWithSearch form={form} name="contaSegregacaoFdoAdmCred" label="Conta Crédito" plano={watchedPlano} />
            <ContaLookupWithSearch form={form} name="contaSegregacaoFdoAdmDeb" label="Conta Débito" plano={watchedPlano} />
          </div>
        </div>
      </Card>
    </div>
  );
}

// ─── Helper: Checkbox com Controller ───
function CheckboxField({
  form,
  name,
  id,
  label,
  labelClassName = 'text-sm',
  disabled = false,
}: {
  form: UseFormReturn<FormValues>;
  name: keyof FormValues;
  id: string;
  label: string;
  labelClassName?: string;
  disabled?: boolean;
}) {
  return (
    <div className={`flex items-center space-x-2${disabled ? ' opacity-50 pointer-events-none' : ''}`}>
      <Controller
        name={name as never}
        control={form.control}
        render={({ field }) => (
          <Checkbox
            id={id}
            checked={(field.value as boolean) ?? false}
            onCheckedChange={field.onChange}
            disabled={disabled}
          />
        )}
      />
      <Label htmlFor={id} className={labelClassName}>
        {label}
      </Label>
    </div>
  );
}

