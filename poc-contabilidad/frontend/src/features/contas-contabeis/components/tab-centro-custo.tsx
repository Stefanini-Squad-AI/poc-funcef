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
  useCentrosCusto,
  useContasxCC,
  useAssociateContasxCC,
  useDisassociateContasxCC,
} from '../hooks';

type FormValues = TContaContabilSchema;

/**
 * Tab 3: Conta x C.Custo (TabSheet4 no DFM)
 * Migração de: FCadContasContabMT.pas → TabSheet4
 *
 * IMPORTANTE: Os movimentos (>>, >, <, <<) são LOCAIS (em memória), replicando
 * o comportamento do Delphi onde CdsContasxCC é um dataset em memória.
 * As alterações só são persistidas no backend quando o usuário clica em
 * "Salvar Associações".
 *
 * Regra: Sintéticos (STATUSGRUPOCDC='S') não podem ser relacionados.
 * A tab só é habilitada quando chkCentCust (aceitaCentroCusto) = true.
 */
export interface TabCentroCustoRef {
  salvarAssociacoes: () => Promise<void>;
  hasChanges: boolean;
}

export const TabCentroCusto = forwardRef<TabCentroCustoRef, { form: UseFormReturn<FormValues>; contaCarregada?: boolean }>(function TabCentroCusto({ form, contaCarregada = false }, ref) {
  const plano = useWatch({ control: form.control, name: 'plano' });
  const codigo = useWatch({ control: form.control, name: 'codigo' });
  const aceitaCentroCusto = useWatch({ control: form.control, name: 'aceitaCentroCusto' });

  const idEmpresa = 1;
  const placConta = codigo ?? '';

  const enabled = !!aceitaCentroCusto && !!plano && !!placConta && contaCarregada;

  const { centrosCusto, isLoading: loadingDisponiveis } = useCentrosCusto(idEmpresa, plano ?? 0, placConta, enabled);
  const { contasxCC, isLoading: loadingAssociados } = useContasxCC(idEmpresa, plano ?? 0, placConta, enabled);
  const associateMutation = useAssociateContasxCC(idEmpresa, plano ?? 0, placConta);
  const disassociateMutation = useDisassociateContasxCC(idEmpresa, plano ?? 0, placConta);

  const [selectedDisponiveis, setSelectedDisponiveis] = useState<Set<string>>(new Set());
  const [selectedAssociados, setSelectedAssociados] = useState<Set<string>>(new Set());
  const [confirmVoltaTodos, setConfirmVoltaTodos] = useState(false);

  // ─── Mudanças locais (não persistidas no backend) ───
  const [localAdded, setLocalAdded] = useState<Set<string>>(new Set());
  const [localRemoved, setLocalRemoved] = useState<Set<string>>(new Set());
  const [isSaving, setIsSaving] = useState(false);

  // Resetar estado local quando a conta muda (criar nova conta, selecionar outra conta)
  useEffect(() => {
    setLocalAdded(new Set());
    setLocalRemoved(new Set());
    setSelectedDisponiveis(new Set());
    setSelectedAssociados(new Set());
  }, [placConta, plano]);

  const isLoading = loadingDisponiveis || loadingAssociados;

  const apiDisponiveisCods = useMemo(() => new Set((centrosCusto ?? []).map(d => d.codCentroCusto)), [centrosCusto]);
  const apiAssociadosCods = useMemo(() => new Set((contasxCC ?? []).map(a => a.codCentroCusto)), [contasxCC]);

  type DisplayCC = {
    codCentroCusto: string;
    nome: string;
    codExterno?: string | null;
    statusGrupoCdc: string;
  };

  const displayDisponiveis = useMemo<DisplayCC[]>(() => {
    const result: DisplayCC[] = [];
    for (const d of (centrosCusto ?? [])) {
      if (!localAdded.has(d.codCentroCusto)) {
        result.push({ codCentroCusto: d.codCentroCusto, nome: d.nome, codExterno: d.codExterno, statusGrupoCdc: d.statusGrupoCdc });
      }
    }
    for (const a of (contasxCC ?? [])) {
      if (localRemoved.has(a.codCentroCusto)) {
        result.push({ codCentroCusto: a.codCentroCusto, nome: a.nome, codExterno: a.codExterno, statusGrupoCdc: 'A' });
      }
    }
    return result;
  }, [centrosCusto, contasxCC, localAdded, localRemoved]);

  const displayAssociados = useMemo<DisplayCC[]>(() => {
    const result: DisplayCC[] = [];
    for (const a of (contasxCC ?? [])) {
      if (!localRemoved.has(a.codCentroCusto)) {
        result.push({ codCentroCusto: a.codCentroCusto, nome: a.nome, codExterno: a.codExterno, statusGrupoCdc: 'A' });
      }
    }
    for (const d of (centrosCusto ?? [])) {
      if (localAdded.has(d.codCentroCusto)) {
        result.push({ codCentroCusto: d.codCentroCusto, nome: d.nome, codExterno: d.codExterno, statusGrupoCdc: d.statusGrupoCdc });
      }
    }
    return result;
  }, [centrosCusto, contasxCC, localAdded, localRemoved]);

  const hasChanges = localAdded.size > 0 || localRemoved.size > 0;

  // ─── Handlers ───

  const toggleDisponivel = (cod: string) => {
    setSelectedDisponiveis((prev) => {
      const next = new Set(prev);
      if (next.has(cod)) next.delete(cod);
      else next.add(cod);
      return next;
    });
  };

  const toggleAssociado = (cod: string) => {
    setSelectedAssociados((prev) => {
      const next = new Set(prev);
      if (next.has(cod)) next.delete(cod);
      else next.add(cod);
      return next;
    });
  };

  const handleVaiUm = () => {
    const codigos = Array.from(selectedDisponiveis);

    const sinteticos = displayDisponiveis.filter(
      (cc) => codigos.includes(cc.codCentroCusto) && cc.statusGrupoCdc === 'S',
    );
    if (sinteticos.length > 0) {
      const nomes = sinteticos.map((s) => s.nome).join(', ');
      toast.error(`Centros de Custo Sintéticos não podem ser relacionados: ${nomes}`);
      return;
    }

    if (codigos.length === 0) return;

    setLocalAdded(prev => new Set([...prev, ...codigos.filter(c => apiDisponiveisCods.has(c))]));
    setLocalRemoved(prev => {
      const next = new Set(prev);
      codigos.forEach(c => next.delete(c));
      return next;
    });
    setSelectedDisponiveis(new Set());
  };

  const handleVaiTodos = () => {
    const analiticosCods = (centrosCusto ?? [])
      .filter(cc => cc.statusGrupoCdc !== 'S')
      .map(cc => cc.codCentroCusto);
    setLocalAdded(new Set(analiticosCods));
    setLocalRemoved(new Set());
    setSelectedDisponiveis(new Set());
  };

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
      toast.error('Erro ao salvar associações de centros de custo');
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

  if (!aceitaCentroCusto) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Centros de Custo</h2>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <AlertTriangle className="w-4 h-4" />
          <p>
            Esta conta não aceita Centro de Custo (campo "Aceita C.Custo" desmarcado).
          </p>
        </div>
      </Card>
    );
  }

  if (!contaCarregada) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Centros de Custo</h2>
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <AlertTriangle className="w-4 h-4" />
          <p>
            Salve a conta contábil primeiro para poder associar centros de custo.
          </p>
        </div>
      </Card>
    );
  }

  if (!placConta) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Centros de Custo</h2>
        <p className="text-sm text-muted-foreground">
          Selecione ou informe o código da conta contábil para gerenciar os centros de custo.
        </p>
      </Card>
    );
  }

  return (
    <Card className="p-5">
      <h2 className="text-base font-semibold mb-1 text-primary">Centros de Custo</h2>
      <p className="text-xs text-muted-foreground mb-4">
        Migração de TabSheet4 — Associação de Centros de Custo à Conta Contábil {plano}/{placConta}
      </p>

      {isLoading ? (
        <div className="flex items-center justify-center py-12">
          <Loader2 className="w-6 h-6 animate-spin text-muted-foreground" />
        </div>
      ) : (
        <div className="flex gap-4 items-stretch">
          {/* ─── Grid Esquerdo: Disponíveis (CdsCCusto) ─── */}
          <div className="flex-1">
            <div className="flex items-center justify-between mb-2">
              <h3 className="text-sm font-semibold text-muted-foreground">
                Centros de Custo ({displayDisponiveis.length})
              </h3>
            </div>
            <div className="border rounded-lg h-80 overflow-y-auto">
              <table className="w-full text-sm">
                <thead className="sticky top-0 bg-muted/50 border-b">
                  <tr>
                    <th className="px-2 py-1.5 text-left w-8"></th>
                    <th className="px-2 py-1.5 text-left">Cód.</th>
                    <th className="px-2 py-1.5 text-left">Nome</th>
                    <th className="px-2 py-1.5 text-left">Ext.</th>
                    <th className="px-2 py-1.5 text-left">Tipo</th>
                  </tr>
                </thead>
                <tbody>
                  {displayDisponiveis.map((cc) => {
                    const isSelected = selectedDisponiveis.has(cc.codCentroCusto);
                    const isSintetico = cc.statusGrupoCdc === 'S';
                    return (
                      <tr
                        key={cc.codCentroCusto}
                        onClick={() => toggleDisponivel(cc.codCentroCusto)}
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
                        <td className="px-2 py-1.5 font-mono text-xs">{cc.codCentroCusto}</td>
                        <td className="px-2 py-1.5">{cc.nome}</td>
                        <td className="px-2 py-1.5 font-mono text-xs text-muted-foreground">
                          {cc.codExterno ?? '-'}
                        </td>
                        <td className="px-2 py-1.5">
                          <span
                            className={`text-xs px-1.5 py-0.5 rounded ${
                              isSintetico
                                ? 'bg-orange-100 text-orange-700'
                                : 'bg-green-100 text-green-700'
                            }`}
                          >
                            {isSintetico ? 'Sint.' : 'Anal.'}
                          </span>
                        </td>
                      </tr>
                    );
                  })}
                  {displayDisponiveis.length === 0 && (
                    <tr>
                      <td colSpan={5} className="px-2 py-8 text-center text-muted-foreground">
                        Nenhum centro de custo disponível
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>

          {/* ─── Botões (btnVai/Volta) ─── */}
          <div className="flex flex-col justify-center gap-2">
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVaiTodos}
              disabled={isSaving || displayDisponiveis.length === 0}
              title="Associar todos (btnVaiTodos)"
            >
              <ChevronsRight className="w-4 h-4" />
            </Button>
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVaiUm}
              disabled={isSaving || selectedDisponiveis.size === 0}
              title="Associar selecionado (btnVaiUm)"
            >
              <ChevronRight className="w-4 h-4" />
            </Button>
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVoltaUm}
              disabled={isSaving || selectedAssociados.size === 0}
              title="Desassociar selecionado (btnVoltaUm)"
            >
              <ChevronLeft className="w-4 h-4" />
            </Button>
            <Button
              type="button"
              variant="outline"
              size="icon"
              onClick={handleVoltaTodos}
              disabled={isSaving || displayAssociados.length === 0}
              title="Desassociar todos (btnVoltaTodos)"
            >
              <ChevronsLeft className="w-4 h-4" />
            </Button>
          </div>

          {/* ─── Grid Direito: Associados (CdsContasxCC) ─── */}
          <div className="flex-1">
            <div className="flex items-center justify-between mb-2">
              <h3 className="text-sm font-semibold text-muted-foreground">
                Centros de Custo relacionados à Conta Contábil ({displayAssociados.length})
              </h3>
            </div>
            <div className="border rounded-lg h-80 overflow-y-auto">
              <table className="w-full text-sm">
                <thead className="sticky top-0 bg-muted/50 border-b">
                  <tr>
                    <th className="px-2 py-1.5 text-left w-8"></th>
                    <th className="px-2 py-1.5 text-left">Cód.</th>
                    <th className="px-2 py-1.5 text-left">Nome</th>
                    <th className="px-2 py-1.5 text-left">Ext.</th>
                    <th className="px-2 py-1.5 text-left">Tipo</th>
                  </tr>
                </thead>
                <tbody>
                  {displayAssociados.map((cc) => {
                    const isSelected = selectedAssociados.has(cc.codCentroCusto);
                    return (
                      <tr
                        key={`assoc-${cc.codCentroCusto}`}
                        onClick={() => toggleAssociado(cc.codCentroCusto)}
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
                        <td className="px-2 py-1.5 font-mono text-xs">{cc.codCentroCusto}</td>
                        <td className="px-2 py-1.5">{cc.nome}</td>
                        <td className="px-2 py-1.5 font-mono text-xs text-muted-foreground">
                          {cc.codExterno ?? '-'}
                        </td>
                        <td className="px-2 py-1.5">
                          <span className="text-xs px-1.5 py-0.5 rounded bg-green-100 text-green-700">
                            Anal.
                          </span>
                        </td>
                      </tr>
                    );
                  })}
                  {displayAssociados.length === 0 && (
                    <tr>
                      <td colSpan={5} className="px-2 py-8 text-center text-muted-foreground">
                        Nenhum centro de custo associado
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      )}

      {/* Legenda */}
      <div className="mt-4 flex items-center gap-4 text-xs text-muted-foreground">
        <span className="flex items-center gap-1">
          <span className="inline-block w-3 h-3 rounded bg-green-100" /> Analítico (pode ser associado)
        </span>
        <span className="flex items-center gap-1">
          <span className="inline-block w-3 h-3 rounded bg-orange-100" /> Sintético (não pode ser associado)
        </span>
      </div>

      {/* ─── Indicador de alterações pendentes ─── */}
      {hasChanges && (
        <div className="mt-4 text-xs text-amber-600 flex items-center gap-1">
          <AlertTriangle className="w-3.5 h-3.5" />
          Alterações não salvas: {localAdded.size} associação(ões) nova(s), {localRemoved.size} desassociação(ões)
        </div>
      )}

      {/* ─── Diálogo de confirmação: Desassociar todos ─── */}
      <AlertDialog open={confirmVoltaTodos} onOpenChange={setConfirmVoltaTodos}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Confirmar desassociação</AlertDialogTitle>
            <AlertDialogDescription>
              Deseja desassociar todos os {displayAssociados.length} centros de custo?
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancelar</AlertDialogCancel>
            <AlertDialogAction
              onClick={handleConfirmVoltaTodos}
            >
              Desassociar todos
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </Card>
  );
});
