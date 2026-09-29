'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import { useForm, useWatch } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import {
  Badge,
  Button,
  Tabs,
  TabsList,
  TabsTrigger,
  TabsContent,
  toast,
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogClose,
  DialogFooter,
  Command,
  CommandInput,
  CommandList,
  CommandItem,
  CommandEmpty,
  CommandGroup,
  AlertDialog,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogCancel,
  AlertDialogAction,
} from '@funcef-componentes/react';
import { Plus, Pencil, Trash2, Search, Save, X, HelpCircle, Loader2 } from 'lucide-react';
import {
  contaContabilSchema,
  contaContabilDefaults,
  type TContaContabilSchema,
} from '../validators';
import { useCreateConta, useUpdateConta, useDeleteConta } from '../hooks/use-contas-mutations';
import { useContasTree } from '../hooks/use-contas-tree';
import { contasContabeisApi } from '../api/client';
import type { ContaContabil, UpdateContaContabilRequest } from '../types';
import { TabInformacoesGerais } from './tab-informacoes-gerais';
import { TabSubGruposMoeda } from './tab-subgrupos-moeda';
import { TabCentroCusto, type TabCentroCustoRef } from './tab-centro-custo';
import { TabSubContas, type TabSubContasRef } from './tab-sub-conta';
import {
  TabArvoreContas,
  TabObservacoes,
} from './tab-outros';

type FormValues = TContaContabilSchema;

/**
 * Formulário de Cadastro de Contas Contábeis
 *
 * Migração de: FCadContasContabMT.pas → frmCadContasContabMT
 * Mapa de equivalencias: Formularios VCL (.dfm) → App Router routes + React 19 State
 *
 * TPageControl Delphi → Tabs FUNCEF:
 * 1. Informações Gerais    → TabSheet1
 * 2. Sub-Grupos & Moedas   → TabSheet3
 * 3. Conta x C.Custo       → TabSheet4
 * 4. Conta x Sub-Conta     → TabSheet5
 * 5. Árvore de Contas Contábeis → TabSheet2
 * 6. Detalhes              → TabSheet6
 */
export function ContaContabilForm() {
  const [activeTab, setActiveTab] = useState('gerais');
  // Regra 7: CmeCadastroEdit (migrado de FCadContasContabMT.pas líneas 879-886)
  // Ao editar, Plano e Código devem ser desabilitados (readOnly).
  // Ao inserir, todos os campos são habilitados.
  const [isEditing, setIsEditing] = useState(false);
  // No legacy, Alterar e Excluir só habilitam após Procurar e selecionar uma conta
  const [contaCarregada, setContaCarregada] = useState(false);
  // Modo inserção (opInserir do Delphi). Quando true, Inserir e Procurar ficam desabilitados
  // (equivalente ao AtualizaBotoes do Delphi que desabilita btnInserir e btnProcurar em opInserir).
  const [isInserting, setIsInserting] = useState(false);
  const createMutation = useCreateConta();
  const updateMutation = useUpdateConta();
  const deleteMutation = useDeleteConta();

  // ─── Procurar: diálogo de busca (migrado de sbtnProcurarClick → MontaSelect.Executar) ───
  const [procurarOpen, setProcurarOpen] = useState(false);

  // ─── Excluir: diálogo de confirmação (migrado de CmeCadastroDelete → CmeCadastroApplyDelete) ───
  // No Delphi, CmeCadastroDelete faz validações pré-delete (lançamentos, filhos) e pede confirmação.
  // CmeCadastroApplyDelete chama CtrlPlanoConta.Apagar para executar o DELETE.
  const [excluirOpen, setExcluirOpen] = useState(false);
  // Diálogo de confirmação ao cancelar quando há obrigação pendente
  const [cancelarObrigacaoOpen, setCancelarObrigacaoOpen] = useState(false);
  // Carrega todas as contas (incluindo inativas) para o diálogo de procura
  const { contas: todasContas, isLoading: procurandoContas } = useContasTree(true);

  const form = useForm<FormValues>({
    resolver: zodResolver(contaContabilSchema),
    defaultValues: contaContabilDefaults,
  });

  const { reset } = form;
  const planoSelecionado = useWatch({ control: form.control, name: 'plano' });
  const aceitaCentroCusto = useWatch({ control: form.control, name: 'aceitaCentroCusto' });
  const obrigaSubconta = useWatch({ control: form.control, name: 'obrigaSubconta' });
  const [isSaving, setIsSaving] = useState(false);

  // Refs para os tabs de associações (salvar junto com o botão "Salvar" geral)
  const subContasRef = useRef<TabSubContasRef>(null);
  const centroCustoRef = useRef<TabCentroCustoRef>(null);

  // ─── Bloqueio por obrigação pendente ───
  // Após criar uma conta com obrigaSubconta e/ou aceitaCentroCusto, a tela fica
  // bloqueada até o usuário associar pelo menos uma subconta/CC. O usuário não pode
  // mudar de aba, navegar, Procurar, Inserir, Alterar, Excluir, nem refrescar o browser.
  // Equivalente ao if (PLASUBCONTA='S') and (CdsContasxSC.isEmpty) do Delphi —
  // no Delphi o save é abortado; no POC a conta é salva mas o usuário é obrigado
  // a completar as associações antes de fazer qualquer outra coisa.
  const [obrigacaoPendente, setObrigacaoPendente] = useState<'subconta' | 'ccusto' | 'ambos' | null>(null);

  // Prevenir refresh/navegação do browser quando há obrigação pendente
  useEffect(() => {
    if (!obrigacaoPendente) return;
    const handler = (e: BeforeUnloadEvent) => {
      e.preventDefault();
      e.returnValue = '';
    };
    window.addEventListener('beforeunload', handler);
    return () => window.removeEventListener('beforeunload', handler);
  }, [obrigacaoPendente]);

  // Callback chamado pelas tabs após associar/desassociar.
  // Verifica via API se as associações obrigatórias já existem e desbloqueia se sim.
  const verificarObrigacoes = useCallback(async () => {
    const values = form.getValues();
    if (!values.plano || !values.codigo) return;

    let subcontaOk = true;
    let ccustoOk = true;

    if (obrigacaoPendente === 'subconta' || obrigacaoPendente === 'ambos') {
      try {
        const resp = await contasContabeisApi.getContasxSC(1, values.plano, values.codigo);
        subcontaOk = !!(resp.data && resp.data.length > 0);
      } catch { subcontaOk = false; }
    }
    if (obrigacaoPendente === 'ccusto' || obrigacaoPendente === 'ambos') {
      try {
        const resp = await contasContabeisApi.getContasxCC(1, values.plano, values.codigo);
        ccustoOk = !!(resp.data && resp.data.length > 0);
      } catch { ccustoOk = false; }
    }

    if (subcontaOk && ccustoOk) {
      setObrigacaoPendente(null);
      toast.success('Associações obrigatórias concluídas. Cadastro finalizado com sucesso.');
      // Volta ao estado inicial (opVazio)
      reset(contaContabilDefaults);
      setIsInserting(false);
      setContaCarregada(false);
      setIsEditing(false);
      setActiveTab('gerais');
    }
  }, [obrigacaoPendente, form, reset]);

  const onSubmit = async (data: FormValues) => {
    if (contaCarregada) {
      // CmeCadastroApplyEdit → CtrlPlanoConta.Gravar (UPDATE)
      // Validação if (PLASUBCONTA='S') and (CdsContasxSC.isEmpty) já executada
      // em handleSalvar antes de chegar aqui — se passou, as associações existem.
      await updateMutation.mutateAsync({
        plano: data.plano,
        codigo: data.codigo,
        data: data as UpdateContaContabilRequest,
      });
      if (obrigacaoPendente) {
        // Não resetar o form nem limpar o estado — verificarObrigacoes()
        // fará o reset após confirmar que as associações obrigatórias existem.
        // Se resetarmos aqui, verificarObrigacoes() não terá acesso ao
        // plano/codigo para verificar as associações via API.
        toast.success('Conta contábil alterada com sucesso');
      } else {
        // No Delphi, após ApplyEdit a conta permanece carregada em modo
        // consulta (CmeCadastroAfterPost). Mantemos o form com os dados
        // e contaCarregada=true para que as queries do tab (CC/subconta)
        // continuem habilitadas e mostrem as associações persistidas.
        toast.success('Conta contábil alterada com sucesso');
        setIsEditing(false);
        // contaCarregada permanece true — modo consulta
      }
    } else {
      // CmeCadastroApplyInsert → CtrlPlanoConta.Gravar (INSERT)
      //
      // Migração da validação Delphi: if (PLASUBCONTA='S') and (CdsContasxSC.isEmpty)
      // No Delphi, CdsContasxSC é um dataset em memória — a validação corre antes do
      // save e bloqueia se vazio. No POC, as associações são via API que requer a conta
      // já exista. A conta é salva, e a tela fica BLOQUEADA até o usuário associar
      // pelo menos uma subconta/CC. O usuário não pode mudar de aba, navegar, nem
      // refrescar o browser. Quando associa, verificarObrigacoes() desbloqueia.
      const response = await createMutation.mutateAsync(data);
      const contaCriada = response.data;

      if (data.obrigaSubconta || data.aceitaCentroCusto) {
        // Carregar a conta criada no form e entrar em modo edição
        const { createdAt, updatedAt, usuarioInclusao, ...contaFields } = contaCriada;
        form.reset({
          ...contaContabilDefaults,
          ...contaFields,
          estatisticaComLancamento: false,
        } as FormValues);
        setIsEditing(true);
        setIsInserting(false);
        setContaCarregada(true);

        // Determinar tipo de obrigação pendente
        if (data.obrigaSubconta && data.aceitaCentroCusto) {
          setObrigacaoPendente('ambos');
          toast.warning('Conta salva, mas OBRIGA Sub-Conta e Centro de Custo. Associe-os antes de continuar.');
          setActiveTab('subconta');
        } else if (data.obrigaSubconta) {
          setObrigacaoPendente('subconta');
          toast.warning('Conta salva, mas OBRIGA Sub-Conta. Associe as subcontas antes de continuar.');
          setActiveTab('subconta');
        } else {
          setObrigacaoPendente('ccusto');
          toast.warning('Conta salva, mas OBRIGA Centro de Custo. Associe os centros de custo antes de continuar.');
          setActiveTab('ccusto');
        }
      } else {
        toast.success('Conta contábil salva com sucesso');
        reset(contaContabilDefaults);
        setIsInserting(false);
        setContaCarregada(false);
        setIsEditing(false);
        setActiveTab('gerais');
      }
    }
  };

  // Handler para o botão Salvar — usa form.trigger() em vez de handleSubmit
  // para evitar o ZodError não capturado do zodResolver v3 (que corrompe isSubmitting).
  // form.trigger() valida sem lançar e seta os erros nos campos do formulário.
  //
  // Migração de CmeCadastroBeforeConfirma (FCadContasContabMT.pas líneas 1396-1477):
  //   1. Campos obrigatórios (código, plano, grupo, descrição) → validados pelo Zod schema
  //   2. Centro de Custo obrigatório quando PLACCUST='S' → validado abaixo (só em UPDATE)
  //   3. Subconta obrigatória quando PLASUBCONTA='S' → validado abaixo (só em UPDATE)
  //   4. Normalização conversão vacía → 'N' → tratado pelo preprocess no Zod schema
  //
  // Migração de VerificaPreenchimento (líneas 1596-1634):
  //   ConflitoSegregaCriter e ConflitoPrograma — requer endpoints de backend
  //   não implementados no POC. TODO: implementar quando backend tiver validação.
  const handleSalvar = async () => {
    // 1. Validar schema (campos obrigatórios + regras de consistência)
    //    Usamos safeParse() diretamente em vez de form.trigger() porque
    //    zodResolver v3.10.0 tem um bug que lança ZodError em vez de
    //    retornar errors, o que impede form.trigger() de setar os erros
    //    nos campos. Com safeParse() + form.setError() temos controle total.
    const values = form.getValues();
    const result = contaContabilSchema.safeParse(values);
    if (!result.success) {
      // Setar cada erro no campo correspondente do formulário
      for (const issue of result.error.issues) {
        const fieldName = issue.path[0] as keyof FormValues;
        form.setError(fieldName, {
          type: 'manual',
          message: issue.message,
        });
      }
      // Mostrar toast e mudar para o tab onde estão os campos com erro
      toast.error('Preencha todos os campos obrigatórios antes de salvar.');
      setActiveTab('gerais');
      return;
    }

    // 1b. Verificar erros manuais setados por validações de UI (ex: conta pai)
    //     Migração de dbeCodigoExit (FCadContasContabMT.pas líneas 541-546):
    //     no legacy, se a conta não tem pai, o código é limpo e o procedimento sai.
    //     Aqui, form.setError('codigo', ...) é setado por TabInformacoesGerais.
    if (Object.keys(form.formState.errors).length > 0) {
      toast.error('Corrija os erros indicados antes de salvar.');
      setActiveTab('gerais');
      return;
    }


    // 2. Validação de Centro de Custo (migrado de CmeCadastroBeforeConfirma línea 1434)
    //    No Delphi: if (PLACCUST = 'S') and (CdsContasxCC.isEmpty) then error
    //    Só validado em UPDATE (contaCarregada) — em INSERT a conta ainda não existe
    //    no backend, então não há associações de CC para verificar.
    //    Skip quando obrigaPendente: as associações ainda são locais, serão
    //    persistidas no passo 5 e verificadas no passo 6 (verificarObrigacoes).
    //
    //    IMPORTANTE: Considera mudanças locais (associadosCount do ref) para evitar
    //    que o usuário salve sem CCs após desassociar todos localmente.
    if (contaCarregada && values.aceitaCentroCusto && !obrigacaoPendente) {
      const localCount = centroCustoRef.current?.associadosCount;
      if (localCount !== undefined) {
        // O tab está montado e tem o count local — usa diretamente
        if (localCount === 0) {
          toast.error(
            'Conta obriga Centro de Custo. Obrigatório indicar os centros de custo vinculados a esta conta.',
          );
          setActiveTab('ccusto');
          return;
        }
      } else {
        // Fallback: tab não montado, consulta a API
        try {
          const contasxCCResp = await contasContabeisApi.getContasxCC(
            1,
            values.plano,
            values.codigo,
          );
          const contasxCC = contasxCCResp.data;
          if (!contasxCC || contasxCC.length === 0) {
            toast.error(
              'Conta obriga Centro de Custo. Obrigatório indicar os centros de custo vinculados a esta conta.',
            );
            setActiveTab('ccusto');
            return;
          }
        } catch {
          // Se não conseguir verificar, continua (erro de rede já tratado pelo toast)
        }
      }
    }

    // 3. Validação de Subconta (migrado de CmeCadastroBeforeConfirma línea 1441)
    //    No Delphi: if (PLASUBCONTA = 'S') and (CdsContasxSC.isEmpty) then error
    //    Skip quando obrigaPendente: as associações ainda são locais.
    //
    //    IMPORTANTE: Considera mudanças locais (associadosCount do ref) para evitar
    //    que o usuário salve sem subcontas após desassociar todas localmente.
    if (contaCarregada && values.obrigaSubconta && !obrigacaoPendente) {
      const localCount = subContasRef.current?.associadosCount;
      if (localCount !== undefined) {
        if (localCount === 0) {
          toast.error(
            'Conta obriga Subconta. Obrigatório indicar as subcontas vinculadas a esta conta.',
          );
          setActiveTab('subconta');
          return;
        }
      } else {
        try {
          const contasxSCResp = await contasContabeisApi.getContasxSC(
            1,
            values.plano,
            values.codigo,
          );
          const contasxSC = contasxSCResp.data;
          if (!contasxSC || contasxSC.length === 0) {
            toast.error(
              'Conta obriga Subconta. Obrigatório indicar as subcontas vinculadas a esta conta.',
            );
            setActiveTab('subconta');
            return;
          }
        } catch {
          // Se não conseguir verificar, continua
        }
      }
    }

    // 4. Gravar (CmeCadastroApplyInsert/ApplyEdit → CtrlPlanoConta.Gravar)
    setIsSaving(true);
    try {
      // 4a. Salvar associações ANTES de onSubmit (para UPDATE).
      //     Motivo: onSubmit faz reset(contaContabilDefaults) que limpa
      //     plano/codigo do form, o que faria as mutations do tab (que
      //     usam useWatch para plano/codigo) usar valores errados
      //     (plano=0, placConta=''), resultando em associações fantasmas
      //     que não se persistem corretamente no backend.
      //
      //     Para INSERT (contaCarregada=false), isto é skipado — a conta
      //     ainda não existe. Para INSERT com obrigaPendente (segundo save),
      //     contaCarregada=true e onSubmit não reseta o form, então funciona.
      if (contaCarregada) {
        // 4a-1. Se aceitaCentroCusto foi desmarcado, desassociar todos os CCs
        if (!values.aceitaCentroCusto) {
          try {
            const contasxCCResp = await contasContabeisApi.getContasxCC(
              1, values.plano, values.codigo,
            );
            const ccCods = (contasxCCResp.data ?? []).map(c => c.codCentroCusto);
            if (ccCods.length > 0) {
              await contasContabeisApi.disassociateContasxCC({
                plano: values.plano,
                placConta: values.codigo,
                idEmpresa: 1,
                codCentrosCusto: ccCods,
              });
            }
          } catch { /* erro de rede já tratado pelo toast */ }
        }
        // 4a-2. Se obrigaSubconta foi desmarcado, desassociar todas as subcontas
        if (!values.obrigaSubconta) {
          try {
            const contasxSCResp = await contasContabeisApi.getContasxSC(
              1, values.plano, values.codigo,
            );
            const scCods = (contasxSCResp.data ?? []).map(s => s.codSubConta);
            if (scCods.length > 0) {
              await contasContabeisApi.disassociateContasxSC({
                plano: values.plano,
                placConta: values.codigo,
                idEmpresa: 1,
                codSubContas: scCods,
              });
            }
          } catch { /* erro de rede já tratado pelo toast */ }
        }
        // 4a-3. Salvar mudanças locais dos tabs (quando ainda aceita/obriga)
        try {
          await subContasRef.current?.salvarAssociacoes();
        } catch { /* erro já tratado no tab */ }
        try {
          await centroCustoRef.current?.salvarAssociacoes();
        } catch { /* erro já tratado no tab */ }
      }

      // 4b. Gravar a conta (INSERT ou UPDATE)
      await onSubmit(values);

      // 5. Se há obrigação pendente, verificar se foi cumprida
      if (obrigacaoPendente) {
        await verificarObrigacoes();
      }
    } catch {
      // Erro de rede/mutação — o toast de erro já é exibido pelo hook
    } finally {
      setIsSaving(false);
    }
  };

  // Cancelar: equivalente ao CmeCadastroCancel do Delphi.
  // - Se há conta carregada (opAlterar cancelado): volta para modo consulta (opIdle),
  //   mantendo os dados no formulário, mas desabilitando todos os campos.
  // - Se não há conta carregada (opInserir cancelado): reseta o formulário para defaults.
  const handleCancel = () => {
    // Se há obrigação pendente (conta criada mas associações obrigatórias não concluídas),
    // mostrar pop-up de confirmação — o usuário perderá a conta criada.
    if (obrigacaoPendente) {
      setCancelarObrigacaoOpen(true);
      return;
    }
    if (contaCarregada) {
      setIsEditing(false); // volta para modo consulta — formulário desabilitado
    } else {
      reset(contaContabilDefaults); // cancela inserção — limpa o formulário
      setIsInserting(false); // volta ao estado inicial (opVazio)
    }
  };

  // Confirmar cancelamento quando há obrigação pendente:
  // Elimina a conta criada e vacia o formulário.
  const handleConfirmarCancelamento = async () => {
    const plano = form.getValues('plano');
    const codigo = form.getValues('codigo');
    try {
      await deleteMutation.mutateAsync({ plano, codigo });
      toast.info(`Conta ${codigo} excluída. As associações obrigatórias não foram concluídas.`);
    } catch {
      toast.error('Erro ao excluir a conta. Tente novamente.');
    }
    setObrigacaoPendente(null);
    reset(contaContabilDefaults);
    setContaCarregada(false);
    setIsEditing(false);
    setIsInserting(false);
    setActiveTab('gerais');
    setCancelarObrigacaoOpen(false);
  };

  // Excluir: equivalente ao CmeCadastroApplyDelete do Delphi.
  // Após confirmação no AlertDialog, chama CtrlPlanoConta.Apagar (DELETE via API).
  // Em caso de sucesso: limpa o formulário, volta ao estado inicial (opVazio).
  // Em caso de erro (409 Conflict — conta tem filhos/lançamentos): o MutationCache
  // mostra o toast de erro automaticamente; apenas fechamos o dialog e mantemos os dados.
  const handleExcluir = async () => {
    const plano = form.getValues('plano');
    const codigo = form.getValues('codigo');
    try {
      await deleteMutation.mutateAsync({ plano, codigo });
      toast.success(`Conta ${codigo} excluída com sucesso`);
      reset(contaContabilDefaults);
      setContaCarregada(false);
      setIsEditing(false);
      setIsInserting(false);
      setExcluirOpen(false);
    } catch {
      // Erro já tratado pelo MutationCache (toast.error automático).
      // Fecha o dialog mas mantém os dados no formulário para o usuário ver a conta.
      setExcluirOpen(false);
    }
  };

  // Procurar: ao selecionar uma conta, busca o registro completo e carrega no form
  // No legacy, Procurar carrega o registro em modo CONSULTA (não editável).
  // Só após clicar em Alterar é que o form entra em modo edição (CmeCadastroEdit).
  const handleSelectConta = async (conta: ContaContabil) => {
    try {
      const response = await contasContabeisApi.getById(conta.plano, conta.codigo);
      // Strip audit fields que não pertencem ao schema do form
      const { createdAt, updatedAt, usuarioInclusao, ...contaFields } = response.data;
      // estatisticaComLancamento está no schema mas não no tipo ContaContabil
      form.reset({
        ...contaContabilDefaults,
        ...contaFields,
        estatisticaComLancamento: false,
      } as FormValues);
      setIsEditing(false); // modo consulta — Alterar deve ser clicado para editar
      setIsInserting(false); // não está em modo inserção
      setContaCarregada(true);
      setProcurarOpen(false);
      toast.success(`Conta ${conta.codigo} carregada com sucesso`);
    } catch {
      toast.error('Erro ao carregar a conta contábil');
    }
  };

  return (
    <div className="flex flex-col h-full max-w-7xl mx-auto font-sans overflow-hidden">
      {/* HEADER — fixo (sticky) */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 border-b pb-4 shrink-0 px-6 pt-6">
        <div>
          <div className="flex items-center gap-2">
            <h1 className="text-2xl font-bold tracking-tight text-foreground">
              Cadastro de Contas Contábeis
            </h1>
            <Badge variant="outline">Módulo Contábil</Badge>
          </div>
          <p className="text-sm text-muted-foreground">
            Gestão do plano de contas, parâmetros e regras de segregação
          </p>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <Button
            variant="outline"
            size="sm"
            type="button"
            // Procurar só fica desabilitado durante edição (opAlterar) ou quando
            // há obrigação pendente (bloqueio de navegação).
            disabled={isEditing || !!obrigacaoPendente}
            onClick={() => setProcurarOpen(true)}
          >
            <Search className="w-4 h-4 mr-2" /> Procurar
          </Button>
          <Button
            variant="outline"
            size="sm"
            type="button"
            disabled={!contaCarregada || isEditing || !!obrigacaoPendente}
            onClick={() => {
              reset(contaContabilDefaults);
              setIsEditing(false);
              setContaCarregada(false);
              setIsInserting(true); // entra em modo inserção (opInserir)
            }}
          >
            <Plus className="w-4 h-4 mr-2" /> Inserir
          </Button>
          <Button
            variant="outline"
            size="sm"
            type="button"
            disabled={!contaCarregada || isEditing || !!obrigacaoPendente}
            onClick={() => setIsEditing(true)}
          >
            <Pencil className="w-4 h-4 mr-2" /> Alterar
          </Button>
          <Button
            variant="destructive"
            size="sm"
            type="button"
            disabled={!contaCarregada || isEditing || !!obrigacaoPendente}
            onClick={() => setExcluirOpen(true)}
          >
            <Trash2 className="w-4 h-4 mr-2" /> Excluir
          </Button>
          <Button
            variant="default"
            size="sm"
            onClick={handleSalvar}
            disabled={isSaving || (contaCarregada && !isEditing)}
          >
            {isSaving ? (
              <Loader2 className="w-4 h-4 mr-2 animate-spin" />
            ) : (
              <Save className="w-4 h-4 mr-2" />
            )}
            Salvar
          </Button>
        </div>
      </div>

      {/* ─── Diálogo Procurar (MontaSelect.Executar) ─── */}
      <Dialog open={procurarOpen} onOpenChange={setProcurarOpen}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle>Procurar Conta Contábil</DialogTitle>
            <DialogDescription>
              Selecione uma conta contábil para carregar no formulário.
            </DialogDescription>
          </DialogHeader>
          <Command className="rounded-lg border shadow-sm">
            <CommandInput placeholder="Buscar por código ou descrição..." />
            <CommandList>
              {procurandoContas ? (
                <div className="flex items-center justify-center py-6">
                  <Loader2 className="w-5 h-5 animate-spin text-muted-foreground" />
                </div>
              ) : (
                <>
                  <CommandEmpty>
                    Nenhuma conta contábil encontrada.
                  </CommandEmpty>
                  <CommandGroup>
                    {(todasContas ?? []).map((conta: ContaContabil) => (
                      <CommandItem
                        key={`${conta.plano}-${conta.codigo}`}
                        value={`${conta.codigo} ${conta.descricao}`}
                        onSelect={() => { void handleSelectConta(conta); }}
                      >
                        <div className="flex flex-col w-full">
                          <span className="font-mono text-sm font-medium">
                            {conta.codigo}
                            {conta.inativa && (
                              <span className="ml-2 text-xs text-destructive">(Inativa)</span>
                            )}
                          </span>
                          <span className="text-xs text-muted-foreground">
                            {conta.descricao}
                          </span>
                        </div>
                      </CommandItem>
                    ))}
                  </CommandGroup>
                </>
              )}
            </CommandList>
          </Command>
          <DialogFooter>
            <DialogClose
              type="button"
              className="inline-flex items-center justify-center rounded-md border border-input bg-background px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground"
            >
              Cancelar
            </DialogClose>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      {/* ─── Diálogo Excluir (CmeCadastroDelete → confirmação → CmeCadastroApplyDelete) ─── */}
      <AlertDialog open={excluirOpen} onOpenChange={setExcluirOpen}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Confirmar exclusão</AlertDialogTitle>
            <AlertDialogDescription>
              Tem certeza que deseja excluir a conta contábil{' '}
              <span className="font-mono font-semibold text-foreground">
                {form.getValues('codigo')}
              </span>
              ? Esta ação não pode ser desfeita.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel type="button">Cancelar</AlertDialogCancel>
            <AlertDialogAction
              type="button"
              onClick={(e) => {
                e.preventDefault();
                void handleExcluir();
              }}
            >
              {deleteMutation.isPending ? (
                <Loader2 className="w-4 h-4 mr-2 animate-spin" />
              ) : (
                <Trash2 className="w-4 h-4 mr-2" />
              )}
              Excluir
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>

      {/* ─── Diálogo Cancelar com obrigação pendente ─── */}
      <AlertDialog open={cancelarObrigacaoOpen} onOpenChange={setCancelarObrigacaoOpen}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Confirmar cancelamento</AlertDialogTitle>
            <AlertDialogDescription>
              Tem certeza que deseja cancelar? A conta{' '}
              <span className="font-mono font-semibold text-foreground">
                {form.getValues('codigo')}
              </span>{' '}
              foi criada, mas as associações obrigatórias não foram concluídas.
              A conta será <b>excluída</b> e todos os dados do formulário serão perdidos.
              Esta ação não pode ser desfeita.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel type="button">Voltar</AlertDialogCancel>
            <AlertDialogAction
              type="button"
              variant="destructive"
              onClick={(e) => {
                e.preventDefault();
                void handleConfirmarCancelamento();
              }}
            >
              {deleteMutation.isPending ? (
                <Loader2 className="w-4 h-4 mr-2 animate-spin" />
              ) : (
                <Trash2 className="w-4 h-4 mr-2" />
              )}
              Sim, excluir e limpar
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>

      {/* TABS — lista de abas fixa, conteúdo scrollável */}
      <Tabs
        value={activeTab}
        onValueChange={(v) => {
          // Bloquear mudança de aba quando há obrigação pendente — só permite
          // ir para as abas de subconta e ccusto (onde estão as associações).
          if (obrigacaoPendente && v !== 'subconta' && v !== 'ccusto') return;
          setActiveTab(v);
        }}
        className="w-full flex-1 min-h-0 flex flex-col px-6 pb-6"
      >
        <TabsList className="mb-4 shrink-0">
          <TabsTrigger value="gerais" disabled={!!obrigacaoPendente}>Informações Gerais</TabsTrigger>
          <TabsTrigger value="subgrupos" disabled={!!obrigacaoPendente}>Sub-Grupos & Moedas</TabsTrigger>
          <TabsTrigger value="ccusto" disabled={!!obrigacaoPendente && obrigacaoPendente !== 'ambos' && obrigacaoPendente !== 'ccusto'}>
            Conta x C.Custo{aceitaCentroCusto ? <span className="text-red-500 ml-0.5">*</span> : null}
          </TabsTrigger>
          <TabsTrigger value="subconta" disabled={!!obrigacaoPendente && obrigacaoPendente !== 'ambos' && obrigacaoPendente !== 'subconta'}>
            Conta x Sub-Conta{obrigaSubconta ? <span className="text-red-500 ml-0.5">*</span> : null}
          </TabsTrigger>
          <TabsTrigger value="arvore" disabled={!!obrigacaoPendente}>Árvore de Contas Contábeis</TabsTrigger>
          <TabsTrigger value="observacoes" disabled={!!obrigacaoPendente}>Detalhes</TabsTrigger>
        </TabsList>

        {/* Em modo consulta (Procurar sem Alterar), todos os campos são desabilitados via <fieldset disabled>.
            Ao clicar em Alterar, isEditing=true → fieldset habilitado, mas Plano/Código permanecem
            desabilitados via prop isEditing em TabInformacoesGerais (CmeCadastroEdit do Delphi). */}
        <TabsContent value="gerais" className="flex-1 min-h-0 overflow-y-auto data-[state=active]:flex data-[state=active]:flex-col">
          <form onSubmit={(e) => { e.preventDefault(); void handleSalvar(); }}>
            <fieldset disabled={contaCarregada && !isEditing} className="border-0 p-0 m-0">
              <TabInformacoesGerais form={form} isEditing={isEditing} contaCarregada={contaCarregada} />
            </fieldset>
          </form>
        </TabsContent>

        <TabsContent value="subgrupos" className="flex-1 min-h-0 overflow-y-auto data-[state=active]:flex data-[state=active]:flex-col">
          <form onSubmit={(e) => { e.preventDefault(); void handleSalvar(); }}>
            <fieldset disabled={contaCarregada && !isEditing} className="border-0 p-0 m-0">
              <TabSubGruposMoeda form={form} />
            </fieldset>
          </form>
        </TabsContent>

        <TabsContent value="arvore" className="flex-1 min-h-0 overflow-y-auto data-[state=active]:flex data-[state=active]:flex-col">
          <TabArvoreContas plano={planoSelecionado} />
        </TabsContent>

        <TabsContent value="observacoes" className="flex-1 min-h-0 overflow-y-auto data-[state=active]:flex data-[state=active]:flex-col">
          <form onSubmit={(e) => { e.preventDefault(); void handleSalvar(); }}>
            <fieldset disabled={contaCarregada && !isEditing} className="border-0 p-0 m-0">
              <TabObservacoes form={form} />
            </fieldset>
          </form>
        </TabsContent>

        {/*
          BUG FIX: Renderizar os tabs de CC e subconta sempre montados (fora do
          TabsContent) para preservar o estado local (localAdded/localRemoved)
          ao trocar de aba. O TabsContent do kit desmonta o conteúdo quando não
          está ativo, perdendo as seleções locais. Controlamos a visibilidade
          via display CSS baseado em activeTab.
        */}
        <div
          className="flex-1 min-h-0 overflow-y-auto"
          style={{ display: activeTab === 'ccusto' ? 'flex' : 'none', flexDirection: 'column' }}
        >
          <fieldset disabled={contaCarregada && !isEditing} className="border-0 p-0 m-0">
            <TabCentroCusto ref={centroCustoRef} form={form} contaCarregada={contaCarregada} />
          </fieldset>
        </div>

        <div
          className="flex-1 min-h-0 overflow-y-auto"
          style={{ display: activeTab === 'subconta' ? 'flex' : 'none', flexDirection: 'column' }}
        >
          <fieldset disabled={contaCarregada && !isEditing} className="border-0 p-0 m-0">
            <TabSubContas ref={subContasRef} form={form} contaCarregada={contaCarregada} />
          </fieldset>
        </div>
      </Tabs>

      {/* FOOTER — fixo na parte inferior, sempre visível */}
      <FormFooter
        onCancel={handleCancel}
        onSave={handleSalvar}
        isSubmitting={isSaving}
        canSave={!isSaving && !(contaCarregada && !isEditing)}
      />
    </div>
  );
}

// ─── Footer fixo com botões Cancelar/Salvar/Ajuda ───
function FormFooter({
  onCancel,
  onSave,
  isSubmitting,
  canSave,
}: {
  onCancel: () => void;
  onSave: () => void;
  isSubmitting: boolean;
  canSave: boolean;
}) {
  return (
    <div className="flex items-center justify-between pt-4 border-t shrink-0 px-6 pb-6">
      <Button type="button" variant="ghost" size="sm">
        <HelpCircle className="w-4 h-4 mr-2" /> Ajuda
      </Button>
      <div className="flex gap-2">
        <Button type="button" variant="outline" onClick={onCancel}>
          <X className="w-4 h-4 mr-2" /> Cancelar
        </Button>
        <Button type="button" variant="default" disabled={!canSave} onClick={onSave}>
          {isSubmitting ? (
            <Loader2 className="w-4 h-4 mr-2 animate-spin" />
          ) : (
            <Save className="w-4 h-4 mr-2" />
          )}
          Salvar
        </Button>
      </div>
    </div>
  );
}
