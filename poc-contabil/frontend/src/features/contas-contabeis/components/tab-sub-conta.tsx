'use client';

import { useState, useMemo, useEffect, forwardRef, useImperativeHandle } from 'react';
import { UseFormReturn, useWatch } from 'react-hook-form';
import {
  Card,
  Button,
  toast,
  AlertDialog,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogCancel,
  AlertDialogAction,
} from '@funcef-componentes/react';
import { ChevronRight, ChevronLeft, ChevronsRight, ChevronsLeft, Loader2, AlertTriangle } from 'lucide-react';
import type { TContaContabilSchema } from '../validators';
import {
  useSubContas,
  useContasxSC,
  useAssociateContasxSC,
  useDisassociateContasxSC,
} from '../hooks';

type FormValues = TContaContabilSchema;

/**
 * Tab 4: Conta x Sub-Conta (TabSheet5 no DFM)
 * Migração de: FCadContasContabMT.pas → TabSheet5
 *
 * Layout dual-list (migrado dos grids Delphi):
 *   ┌─── Sub-Contas (CdsSubConta) ──┐  [>>] [>] [<] [<<]  ┌── Associados (CdsContasxSC) ──┐
 *   │  grid esquerdo                 │                      │  grid direito                  │
 *   └────────────────────────────────┘                      └────────────────────────────────┘
 *
 * Botões:
 *   btnVaiTodos2 (>>): associa todas as sub-contas disponíveis
 *   btnVaiUm2   (>):  associa a selecionada
 *   btnVoltaUm2 (<):  desassocia a selecionada
 *   btnVoltaTodos2 (<<): desassocia todas (com confirmação)
 *
 * IMPORTANTE: Os movimentos (>>, >, <, <<) são LOCAIS (em memória), replicando
 * o comportamento do Delphi onde CdsContasxSC é um dataset em memória.
 * As alterações só são persistidas no backend quando o usuário clica em
 * "Salvar Associações".
 *
 * Labels (DFM): Label15 = "Sub-Contas", Label16 = "Sub-Contas relacionadas à Conta Contábil"
 */
export interface TabSubContasRef {
  salvarAssociacoes: () => Promise<void>;
  hasChanges: boolean;
}

export const TabSubContas = forwardRef<TabSubContasRef, { form: UseFormReturn<FormValues>; contaCarregada?: boolean }>(function TabSubContas({ form, contaCarregada = false }, ref) {
  const plano = useWatch({ control: form.control, name: 'plano' });
  const codigo = useWatch({ control: form.control, name: 'codigo' });
  const obrigaSubconta = useWatch({ control: form.control, name: 'obrigaSubconta' });

  // ID da empresa fixo para o POC (Delphi: Sistema.IdEmpresa)
  const idEmpresa = 1;
  const placConta = codigo ?? '';

  // Habilitado apenas se a conta obriga sub-conta (chkSubConta.checked = PLASUBCONTA='S')
  // e se a conta já está salva no backend (contaCarregada). No Delphi, as associações
  // ficam em datasets em memória (CdsContasxSC) e são persistidas junto com a conta.
  // No POC, via API que requer a conta já exista no backend.
  const enabled = !!obrigaSubconta && !!plano && !!placConta && contaCarregada;

  const { subContas, isLoading: loadingDisponiveis } = useSubContas(idEmpresa, plano ?? 0, placConta, enabled);
  const { contasxSC, isLoading: loadingAssociados } = useContasxSC(idEmpresa, plano ?? 0, placConta, enabled);
  const associateMutation = useAssociateContasxSC(idEmpresa, plano ?? 0, placConta);
  const disassociateMutation = useDisassociateContasxSC(idEmpresa, plano ?? 0, placConta);

  const [selectedDisponiveis, setSelectedDisponiveis] = useState<Set<number>>(new Set());
  const [selectedAssociados, setSelectedAssociados] = useState<Set<number>>(new Set());
  const [confirmVoltaTodos, setConfirmVoltaTodos] = useState(false);

  // ─── Mudanças locais (não persistidas no backend) ───
  // No Delphi, CdsContasxSC é um dataset em memória — as associações só são
  // persistidas no Gravar. Aqui replicamos: os movimentos são locais e só
  // persistem quando o usuário clica em "Salvar Associações".
  // localAdded: codSubContas movidas de disponíveis → associados (associar no save)
  // localRemoved: codSubContas movidas de associados → disponíveis (desassociar no save)
  const [localAdded, setLocalAdded] = useState<Set<number>>(new Set());
  const [localRemoved, setLocalRemoved] = useState<Set<number>>(new Set());
  const [isSaving, setIsSaving] = useState(false);

  // Resetar estado local quando a conta muda (criar nova conta, selecionar outra conta)
  useEffect(() => {
    setLocalAdded(new Set());
    setLocalRemoved(new Set());
    setSelectedDisponiveis(new Set());
    setSelectedAssociados(new Set());
  }, [placConta, plano]);

  const isLoading = loadingDisponiveis || loadingAssociados;

  // Sets para lookup rápido dos dados originais da API
  const apiDisponiveisCods = useMemo(() => new Set((subContas ?? []).map(d => d.codSubConta)), [subContas]);
  const apiAssociadosCods = useMemo(() => new Set((contasxSC ?? []).map(a => a.codSubConta)), [contasxSC]);

  // Listas de display = dados da API + mudanças locais
  const displayDisponiveis = useMemo(() => {
    const result: { codSubConta: number; nomeSubConta: string }[] = [];
    // Disponíveis da API não movidos para associados
    for (const d of (subContas ?? [])) {
      if (!localAdded.has(d.codSubConta)) {
        result.push({ codSubConta: d.codSubConta, nomeSubConta: d.nomeSubConta });
      }
    }
    // Associados da API movidos de volta para disponíveis
    for (const a of (contasxSC ?? [])) {
      if (localRemoved.has(a.codSubConta)) {
        result.push({ codSubConta: a.codSubConta, nomeSubConta: a.nomeSubConta });
      }
    }
    return result;
  }, [subContas, contasxSC, localAdded, localRemoved]);

  const displayAssociados = useMemo(() => {
    const result: { codSubConta: number; nomeSubConta: string }[] = [];
    // Associados da API não movidos para disponíveis
    for (const a of (contasxSC ?? [])) {
      if (!localRemoved.has(a.codSubConta)) {
        result.push({ codSubConta: a.codSubConta, nomeSubConta: a.nomeSubConta });
      }
    }
    // Disponíveis da API movidos para associados
    for (const d of (subContas ?? [])) {
      if (localAdded.has(d.codSubConta)) {
        result.push({ codSubConta: d.codSubConta, nomeSubConta: d.nomeSubConta });
      }
    }
    return result;
  }, [subContas, contasxSC, localAdded, localRemoved]);

  const hasChanges = localAdded.size > 0 || localRemoved.size > 0;

  // ─── Handlers ───

  const toggleDisponivel = (cod: number) => {
    setSelectedDisponiveis((prev) => {
      const next = new Set(prev);
      if (next.has(cod)) next.delete(cod);
      else next.add(cod);
      return next;
    });
  };

  const toggleAssociado = (cod: number) => {
    setSelectedAssociados((prev) => {
      const next = new Set(prev);
      if (next.has(cod)) next.delete(cod);
      else next.add(cod);
      return next;
    });
  };

  // btnVaiUm2Click: mover selecionados para associados (local)
  const handleVaiUm = () => {
    const codigos = Array.from(selectedDisponiveis);
    if (codigos.length === 0) return;

    setLocalAdded(prev => new Set([...prev, ...codigos.filter(c => apiDisponiveisCods.has(c))]));
    setLocalRemoved(prev => {
      const next = new Set(prev);
      codigos.forEach(c => next.delete(c));
      return next;
    });
    setSelectedDisponiveis(new Set());
  };

  // btnVaiTodos2Click: mover todos para associados (local)
  const handleVaiTodos = () => {
    if (displayDisponiveis.length === 0) return;
    setLocalAdded(new Set(apiDisponiveisCods));
    setLocalRemoved(new Set());
    setSelectedDisponiveis(new Set());
  };

  // btnVoltaUm2Click: mover selecionados para disponíveis (local)
  const handleVoltaUm = () => {
    const codigos = Array.from(selectedAssociados);
    if (codigos.length === 0) return;

    setLocalRemoved(prev => new Set([...prev, ...codigos.filter(c => apiAssociadosCods.has(c))]));
    setLocalAdded(prev => {
      const next = new Set(prev);
      codigos.forEach(c => next.delete(c));
      return next;
    });
    setSelectedAssociados(new Set());
  };

  // btnVoltaTodos2Click: mover todos para disponíveis (local, com confirmação)
  const handleVoltaTodos = () => {
    if (displayAssociados.length === 0) return;
    setConfirmVoltaTodos(true);
  };

  const handleConfirmVoltaTodos = () => {
    setLocalRemoved(new Set(apiAssociadosCods));
    setLocalAdded(new Set());
    setSelectedAssociados(new Set());
    setConfirmVoltaTodos(false);
  };

  // Salvar: persistir mudanças locais no backend
  const handleSalvar = async () => {
    const toAssociate = Array.from(localAdded);
    const toDisassociate = Array.from(localRemoved);

    if (toAssociate.length === 0 && toDisassociate.length === 0) return;

    setIsSaving(true);
    try {
      if (toAssociate.length > 0) {
        await associateMutation.mutateAsync(toAssociate);
      }
      if (toDisassociate.length > 0) {
        await disassociateMutation.mutateAsync(toDisassociate);
      }
      setLocalAdded(new Set());
      setLocalRemoved(new Set());
    } catch {
      toast.error('Erro ao salvar associações de sub-contas');
      throw new Error('save-failed');
    } finally {
      setIsSaving(false);
    }
  };

  useImperativeHandle(ref, () => ({
    salvarAssociacoes: handleSalvar,
    hasChanges,
  }));

  // ─── Render ───

  if (!obrigaSubconta) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Sub-Contas</h2>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <AlertTriangle className="w-4 h-4" />
          <p>
            Esta conta não obriga Sub-Conta (campo "Obriga Sub-Conta/Contas Auxiliares" desmarcado).
          </p>
        </div>
      </Card>
    );
  }

  if (!contaCarregada) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Sub-Contas</h2>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <AlertTriangle className="w-4 h-4" />
          <p>
            Salve a conta contábil primeiro para poder associar sub-contas.
          </p>
        </div>
      </Card>
    );
  }

  if (!placConta) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Sub-Contas</h2>
        <p className="text-sm text-muted-foreground">
          Selecione ou informe o código da conta contábil para gerenciar as sub-contas.
        </p>
      </Card>
    );
  }

  return (
    <Card className="p-5">
      <h2 className="text-base font-semibold mb-1 text-primary">Sub-Contas</h2>
      <p className="text-xs text-muted-foreground mb-4">
        Associação de Sub-Contas à Conta Contábil <b>{plano} / {placConta}</b>
      </p>

      {isLoading ? (
        <div className="flex items-center justify-center py-12">
          <Loader2 className="w-6 h-6 animate-spin text-muted-foreground" />
        </div>
      ) : (
        <div className="flex gap-4 items-stretch">
          {/* ─── Grid Esquerdo: Sub-Contas disponíveis (CdsSubConta) ─── */}
          <div className="flex-1">
            <div className="flex items-center justify-between mb-2">
              <h3 className="text-sm font-semibold text-muted-foreground">
                Sub-Contas ({displayDisponiveis.length})
              </h3>
            </div>
            <div className="border rounded-lg h-80 overflow-y-auto">
              <table className="w-full text-sm">
                <thead className="sticky top-0 bg-muted/50 border-b">
                  <tr>
                    <th className="px-2 py-1.5 text-left w-8"></th>
                    <th className="px-2 py-1.5 text-left">Cód.</th>
                    <th className="px-2 py-1.5 text-left">Nome</th>
                  </tr>
                </thead>
                <tbody>
                  {displayDisponiveis.map((sc) => {
                    const isSelected = selectedDisponiveis.has(sc.codSubConta);
                    return (
                      <tr
                        key={sc.codSubConta}
                        onClick={() => toggleDisponivel(sc.codSubConta)}
                        className={`cursor-pointer border-b hover:bg-muted/30 ${
                          isSelected ? 'bg-primary/10' : ''
                        }`}
                      >
                        <td className="px-2 py-1.5">
                          <input
                            type="checkbox"
                            checked={isSelected}
                            readOnly
                            className="pointer-events-none"
                          />
                        </td>
                        <td className="px-2 py-1.5 font-mono text-xs">{sc.codSubConta}</td>
                        <td className="px-2 py-1.5">{sc.nomeSubConta}</td>
                      </tr>
                    );
                  })}
                  {displayDisponiveis.length === 0 && (
                    <tr>
                      <td colSpan={3} className="px-2 py-8 text-center text-muted-foreground">
                        Nenhuma sub-conta disponível
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>

          {/* ─── Botões (btnVai2/Volta2) ─── */}
          <div className="flex flex-col justify-center gap-2">
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVaiTodos}
              disabled={isSaving || displayDisponiveis.length === 0}
              title="Associar todos (btnVaiTodos2)"
            >
              <ChevronsRight className="w-4 h-4" />
            </Button>
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVaiUm}
              disabled={isSaving || selectedDisponiveis.size === 0}
              title="Associar selecionado (btnVaiUm2)"
            >
              <ChevronRight className="w-4 h-4" />
            </Button>
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVoltaUm}
              disabled={isSaving || selectedAssociados.size === 0}
              title="Desassociar selecionado (btnVoltaUm2)"
            >
              <ChevronLeft className="w-4 h-4" />
            </Button>
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVoltaTodos}
              disabled={isSaving || displayAssociados.length === 0}
              title="Desassociar todos (btnVoltaTodos2)"
            >
              <ChevronsLeft className="w-4 h-4" />
            </Button>
          </div>

          {/* ─── Grid Direito: Sub-Contas associadas (CdsContasxSC) ─── */}
          <div className="flex-1">
            <div className="flex items-center justify-between mb-2">
              <h3 className="text-sm font-semibold text-muted-foreground">
                Sub-Contas relacionadas à Conta Contábil ({displayAssociados.length})
              </h3>
            </div>
            <div className="border rounded-lg h-80 overflow-y-auto">
              <table className="w-full text-sm">
                <thead className="sticky top-0 bg-muted/50 border-b">
                  <tr>
                    <th className="px-2 py-1.5 text-left w-8"></th>
                    <th className="px-2 py-1.5 text-left">Cód.</th>
                    <th className="px-2 py-1.5 text-left">Nome</th>
                  </tr>
                </thead>
                <tbody>
                  {displayAssociados.map((sc) => {
                    const isSelected = selectedAssociados.has(sc.codSubConta);
                    return (
                      <tr
                        key={`assoc-${sc.codSubConta}`}
                        onClick={() => toggleAssociado(sc.codSubConta)}
                        className={`cursor-pointer border-b hover:bg-muted/30 ${
                          isSelected ? 'bg-primary/10' : ''
                        }`}
                      >
                        <td className="px-2 py-1.5">
                          <input
                            type="checkbox"
                            checked={isSelected}
                            readOnly
                            className="pointer-events-none"
                          />
                        </td>
                        <td className="px-2 py-1.5 font-mono text-xs">{sc.codSubConta}</td>
                        <td className="px-2 py-1.5">{sc.nomeSubConta}</td>
                      </tr>
                    );
                  })}
                  {displayAssociados.length === 0 && (
                    <tr>
                      <td colSpan={3} className="px-2 py-8 text-center text-muted-foreground">
                        Nenhuma sub-conta associada
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      )}

      {/* ─── Indicador de alterações pendentes ─── */}
      {hasChanges && (
        <div className="mt-4 text-xs text-amber-600 flex items-center gap-1">
          <AlertTriangle className="w-3.5 h-3.5" />
          Alterações não salvas: {localAdded.size} associação(ões) nova(s), {localRemoved.size} desassociação(ões)
        </div>
      )}

      {/* ─── Diálogo de confirmação: Desassociar todas ─── */}
      <AlertDialog open={confirmVoltaTodos} onOpenChange={setConfirmVoltaTodos}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Confirmar desassociação</AlertDialogTitle>
            <AlertDialogDescription>
              Deseja desassociar todas as {displayAssociados.length} sub-contas?
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancelar</AlertDialogCancel>
            <AlertDialogAction
              onClick={handleConfirmVoltaTodos}
            >
              Desassociar todas
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </Card>
  );
});
