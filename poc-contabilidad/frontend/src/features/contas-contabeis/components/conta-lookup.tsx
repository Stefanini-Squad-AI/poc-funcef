'use client';

import { useState, useMemo, useEffect } from 'react';
import { UseFormReturn, useWatch } from 'react-hook-form';
import {
  Input,
  Button,
  Label,
  Dialog,
  DialogTrigger,
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
} from '@funcef-componentes/react';
import { FolderTree, Loader2, AlertCircle, CheckCircle2 } from 'lucide-react';
import type { TContaContabilSchema } from '../validators';
import type { ContaContabil } from '../types';
import { useContasTree } from '../hooks';
import { contasContabeisApi } from '../api/client';

type FormValues = TContaContabilSchema;

/**
 * ContaLookup — Migração do TCMProcuraMaskContabil (Delphi).
 *
 * Componente legacy: TCMProcuraMaskContabil
 *   - AceitaTipoConta = SoAnalitica  → filtra apenas contas analíticas (tipo = 'A')
 *   - Status = scSoAtiva              → filtra apenas contas ativas (inativa = false)
 *   - MostraDescricao = True          → exibe descrição da conta abaixo do input
 *   - MostraMensagens = True          → exibe mensagens de validação
 *   - PermiteChaveEmBranco = True     → permite valor vazio
 *
 * Funcionalidades migradas:
 * 1. Input para código da conta contábil
 * 2. Botão de procura (FolderTree) que abre dialog com lista pesquisável (Command)
 * 3. Validação automática: conta existe, é analítica, está ativa
 * 4. Exibe descrição da conta quando válida (MostraDescricao)
 * 5. Exibe mensagem de erro quando inválida (MostraMensagens)
 *
 * @param form   - Instância do react-hook-form
 * @param name   - Nome do campo no formulário
 * @param label  - Rótulo do campo
 * @param plano  - Plano de contas para a busca (watch do campo 'plano' do formulário)
 */
export function ContaLookup({
  form,
  name,
  label,
  plano,
}: {
  form: UseFormReturn<FormValues>;
  name: keyof FormValues;
  label: string;
  plano?: number;
}) {
  const { register, setValue, formState: { errors } } = form;
  const [open, setOpen] = useState(false);
  const [descricao, setDescricao] = useState<string | null>(null);
  const [validating, setValidating] = useState(false);
  const [validationError, setValidationError] = useState<string | null>(null);

  const currentValue = useWatch({ control: form.control, name: name as never });

  // Carrega a árvore de contas do plano — apenas contas ativas (incluirInativas = false)
  const { contas, isLoading } = useContasTree(false, plano);

  // Filtra apenas contas analíticas (tipo = 'A') e ativas (inativa = false)
  // AceitaTipoConta = SoAnalitica + Status = scSoAtiva
  const contasAnaliticasAtivas = useMemo(() => {
    if (!contas) return [];
    return contas.filter((c: ContaContabil) => c.tipo === 'A' && !c.inativa);
  }, [contas]);

  // Valida o valor atual quando muda (busca na API e verifica tipo/status)
  useEffect(() => {
    const codigo = (currentValue as string)?.trim();

    // PermiteChaveEmBranco = True → não valida se vazio
    if (!codigo) {
      setDescricao(null);
      setValidationError(null);
      setValidating(false);
      return;
    }

    if (!plano) {
      setValidationError('Selecione um plano primeiro');
      setDescricao(null);
      setValidating(false);
      return;
    }

    let cancelled = false;
    setValidating(true);
    setValidationError(null);

    contasContabeisApi
      .getById(plano, codigo)
      .then((response) => {
        if (cancelled) return;
        const conta = response.data;
        if (!conta) {
          setValidationError('Conta não encontrada');
          setDescricao(null);
        } else if (conta.tipo !== 'A') {
          // AceitaTipoConta = SoAnalitica
          setValidationError('Conta deve ser analítica');
          setDescricao(null);
        } else if (conta.inativa) {
          // Status = scSoAtiva
          setValidationError('Conta está inativa');
          setDescricao(null);
        } else {
          // MostraDescricao = True
          setDescricao(conta.descricao);
          setValidationError(null);
        }
      })
      .catch(() => {
        if (cancelled) return;
        setValidationError('Conta não encontrada');
        setDescricao(null);
      })
      .finally(() => {
        if (!cancelled) setValidating(false);
      });

    return () => { cancelled = true; };
  }, [currentValue, plano]);

  const handleSelect = (conta: ContaContabil) => {
    setValue(name as never, conta.codigo as never, { shouldValidate: true, shouldDirty: true });
    setDescricao(conta.descricao);
    setValidationError(null);
    setOpen(false);
  };

  const fieldError = errors[name as never];

  return (
    <div>
      <Label className="text-sm font-medium">{label}</Label>
      <div className="flex gap-2 mt-1">
        <Input
          {...register(name as never)}
          placeholder="Código da conta"
          className={validationError || fieldError ? 'border-destructive' : ''}
        />
        <Dialog open={open} onOpenChange={setOpen}>
          <DialogTrigger
            type="button"
            className="inline-flex items-center justify-center rounded-md border border-input bg-background px-3 shrink-0 hover:bg-accent hover:text-accent-foreground disabled:opacity-50 disabled:pointer-events-none"
            disabled={!plano || isLoading}
            title={plano ? 'Procurar conta contábil' : 'Selecione um plano primeiro'}
          >
            {isLoading ? (
              <Loader2 className="w-4 h-4 animate-spin" />
            ) : (
              <FolderTree className="w-4 h-4" />
            )}
          </DialogTrigger>
          <DialogContent className="max-w-2xl">
            <DialogHeader>
              <DialogTitle>Procurar Conta Contábil</DialogTitle>
              <DialogDescription>
                Selecione uma conta analítica ativa
                {plano ? ` do plano ${plano}` : ''}.
              </DialogDescription>
            </DialogHeader>
            <Command className="rounded-lg border shadow-sm">
              <CommandInput placeholder="Buscar por código ou descrição..." />
              <CommandList>
                <CommandEmpty>
                  Nenhuma conta analítica ativa encontrada.
                </CommandEmpty>
                <CommandGroup>
                  {contasAnaliticasAtivas.map((conta: ContaContabil) => (
                    <CommandItem
                      key={`${conta.plano}-${conta.codigo}`}
                      value={`${conta.codigo} ${conta.descricao}`}
                      onSelect={() => handleSelect(conta)}
                    >
                      <div className="flex flex-col w-full">
                        <span className="font-mono text-sm font-medium">
                          {conta.codigo}
                        </span>
                        <span className="text-xs text-muted-foreground">
                          {conta.descricao}
                        </span>
                      </div>
                    </CommandItem>
                  ))}
                </CommandGroup>
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
      </div>
      {/* Feedback: descrição (MostraDescricao) ou erro (MostraMensagens) */}
      {validating && (
        <p className="text-xs text-muted-foreground mt-1 flex items-center gap-1">
          <Loader2 className="w-3 h-3 animate-spin" /> Validando...
        </p>
      )}
      {!validating && descricao && !validationError && (
        <p className="text-xs text-green-600 dark:text-green-400 mt-1 flex items-center gap-1">
          <CheckCircle2 className="w-3 h-3 shrink-0" /> {descricao}
        </p>
      )}
      {!validating && validationError && (
        <p className="text-xs text-destructive mt-1 flex items-center gap-1">
          <AlertCircle className="w-3 h-3 shrink-0" /> {validationError}
        </p>
      )}
    </div>
  );
}
