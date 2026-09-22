'use client';

import { Controller, UseFormReturn, useWatch } from 'react-hook-form';
import { Card, Input, NativeSelect, Label } from '@funcef-componentes/react';
import type { TContaContabilSchema } from '../validators';
import { useSubGrupos, useMoedas, useParamContab } from '../hooks';
import { ContaLookup } from './conta-lookup';

type FormValues = TContaContabilSchema;

/**
 * Tab 2: Sub-Grupos & Moedas (TabSheet3 no DFM)
 * Componentes Delphi:
 *   GroupBox1 "Sub-Grupos" → dblkSubGrupo1-4 (TwwDBLookupCombo)
 *     LookupTable = CdsSubGrupo, LookupField = 'CODSUBGRP', display = 'DESCSUBGRP'
 *   GroupBox5 "Tipo de Conversão Padrão" → dbcmbTipGer/TipOfi/TipGer2/TipGer3 (TwwDBComboBox)
 *     Items: 'Não Converte'→N, 'Histórico Médio'→H, 'Diário'→D,
 *            'Moeda Corrente do Último Dia'→C, 'Manual'→M
 *     Regra (líneas 740-762): combo desabilitado quando CtrlContab.MoedaXxx = 0
 *     Label atualizada com sigla da moeda: 'Moeda Oficial (R$)'
 *   gbMoedaHist "Moeda Histórica" → dblkMoeda (TwwDBLookupCombo) + cmContraPartida (DataField='PLACONTRAPARTIDA')
 *     LookupTable = CdsMoeda, LookupField = 'MOECODIGO', display = 'MOEDESC'
 *   gbTxJuros "Taxa de Juros para Correção" → dbrePercTxJuros (DataField='PLATXJUROS') + cmContraPartidaJuros (DataField='PLACONTRAPTXJUROS')
 */
export function TabSubGruposMoeda({ form }: { form: UseFormReturn<FormValues> }) {
  const { register, control } = form;
  const { subGrupos, isLoading: isLoadingSubGrupos } = useSubGrupos();
  const { moedas, isLoading: isLoadingMoedas } = useMoedas();

  // Parâmetros contábeis para habilitar/deshabilitar combos de conversão
  // Migração de FCadContasContabMT.pas líneas 740-762:
  //   If CtrlContab.MoedaOficial = 0 Then dbcmbTipOfi.enabled := false
  // CtrlContab lee de PARAMCONTAB (PACMOEDAOFICIAL, PACMOEDAGERENCIAL, etc.)
  const ID_EMPRESA = Number(process.env.NEXT_PUBLIC_ID_EMPRESA ?? '1');
  const { paramContab } = useParamContab(ID_EMPRESA);

  // Helper: busca sigla da moeda pelo ID
  const getSiglaMoeda = (moedaId: number): string | undefined => {
    if (!moedaId || moedaId === 0) return undefined;
    return moedas?.find((m) => m.id === moedaId)?.sigla ?? undefined;
  };

  // Configuração dos combos de conversão com regra de enable/disable
  const conversaoCombos = [
    {
      labelBase: 'Moeda Oficial',
      name: 'conversaoOficial' as const,
      moedaId: paramContab?.moedaOficial ?? 0,
    },
    {
      labelBase: 'Moeda Gerencial 1',
      name: 'conversaoGerencial' as const,
      moedaId: paramContab?.moedaGerencial ?? 0,
    },
    {
      labelBase: 'Moeda Gerencial 2',
      name: 'conversaoGerencial2' as const,
      moedaId: paramContab?.moedaGeren1 ?? 0,
    },
    {
      labelBase: 'Moeda Gerencial 3',
      name: 'conversaoGerencial3' as const,
      moedaId: paramContab?.moedaGeren2 ?? 0,
    },
  ];

  // Plano de contas selecionado no formulário (necessário para o lookup de contra partida)
  const plano = useWatch({ control, name: 'plano' });

  return (
    <div className="space-y-6">
      {/* Sub-Grupos (GroupBox1) — dblkSubGrupo1-4 (TwwDBLookupCombo) */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Sub-Grupos</h2>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {(['subGrupo1', 'subGrupo2', 'subGrupo3', 'subGrupo4'] as const).map((fieldName, idx) => (
            <div key={fieldName}>
              <Label className="text-sm font-medium">Sub-Grupo {idx + 1}</Label>
              <Controller
                name={fieldName}
                control={control}
                render={({ field }) => (
                  <NativeSelect
                    value={field.value ?? ''}
                    onChange={(e) => field.onChange(e.target.value ? Number(e.target.value) : null)}
                    disabled={isLoadingSubGrupos}
                  >
                    <option value="">—</option>
                    {subGrupos?.map((sg) => (
                      <option key={sg.id} value={sg.id}>
                        {sg.id} — {sg.descricao}
                      </option>
                    ))}
                  </NativeSelect>
                )}
              />
            </div>
          ))}
        </div>
      </Card>

      {/* Tipo de Conversão Padrão (GroupBox5) — dbcmbTipGer/TipOfi/TipGer2/TipGer3 (TwwDBComboBox) */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Tipo de Conversão Padrão</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          {conversaoCombos.map(({ labelBase, name, moedaId }) => {
            const enabled = moedaId !== 0;
            const sigla = getSiglaMoeda(moedaId);
            const label = sigla ? `${labelBase} (${sigla})` : labelBase;
            return (
              <div key={name} className={!enabled ? 'opacity-50' : ''}>
                <Label className="text-sm font-medium">{label}</Label>
                <Controller
                  name={name}
                  control={control}
                  render={({ field }) => (
                    <NativeSelect
                      value={field.value ?? 'N'}
                      onChange={(e) => field.onChange(e.target.value || 'N')}
                      disabled={!enabled}
                    >
                      <option value="N">Não Converte</option>
                      <option value="H">Histórico Médio</option>
                      <option value="D">Diário</option>
                      <option value="C">Moeda Corrente do Último Dia</option>
                      <option value="M">Manual</option>
                    </NativeSelect>
                  )}
                />
              </div>
            );
          })}
        </div>
      </Card>

      {/* Moeda Histórica (gbMoedaHist) — dblkMoeda (TwwDBLookupCombo) + cmContraPartida (DataField='PLACONTRAPARTIDA') */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Moeda Histórica</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <Label className="text-sm font-medium">Moeda</Label>
            <Controller
              name="moedaId"
              control={control}
              render={({ field }) => (
                <NativeSelect
                  value={field.value ?? ''}
                  onChange={(e) => field.onChange(e.target.value ? Number(e.target.value) : null)}
                  disabled={isLoadingMoedas}
                >
                  <option value="">—</option>
                  {moedas?.map((m) => (
                    <option key={m.id} value={m.id}>
                      {m.descricao}{m.sigla ? ` (${m.sigla})` : ''}
                    </option>
                  ))}
                </NativeSelect>
              )}
            />
          </div>
          <ContaLookup
            form={form}
            name="contrapartida"
            label="Contra Partida"
            plano={plano}
          />
        </div>
      </Card>

      {/* Taxa de Juros para Correção (gbTxJuros) — dbrePercTxJuros (DataField='PLATXJUROS') + cmContraPartidaJuros (DataField='PLACONTRAPTXJUROS') */}
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Taxa de Juros para Correção</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <Label className="text-sm font-medium">Percentual (a.m.)</Label>
            <Input type="number" step="0.01" {...register('taxaJuros', { setValueAs: (v) => (v === '' ? null : Number(v)) })} placeholder="0,00" />
          </div>
          <ContaLookup
            form={form}
            name="contrapartidaJuros"
            label="Contra Partida"
            plano={plano}
          />
        </div>
      </Card>
    </div>
  );
}
