'use client';

import { Controller, useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import {
  Button,
  Field,
  FieldError,
  FieldLabel,
  Input,
} from '@funcef-componentes/react';
import { createTaskSchema, type TCreateTaskSchema } from '../validators';
import { useCreateTask } from '../hooks/use-tasks-mutation';

/**
 * Formulário de criação no padrão de field do template:
 * Controller → Field `data-invalid` → FieldLabel → controle com `{...field}`
 * + `aria-invalid` → FieldError condicional.
 */
export function CreateTaskForm() {
  const { mutateAsync, isPending } = useCreateTask();

  const form = useForm<TCreateTaskSchema>({
    resolver: zodResolver(createTaskSchema),
    defaultValues: { title: '' },
  });

  const onSubmit = form.handleSubmit(async ({ title }) => {
    try {
      await mutateAsync({ title });
      form.reset();
    } catch {
      // Erro comunicado pelo toast global (meta.globalErrorToast do hook).
    }
  });

  return (
    <form onSubmit={onSubmit} className="flex items-end gap-3" noValidate>
      <Controller
        name="title"
        control={form.control}
        render={({ field, fieldState }) => (
          <Field data-invalid={fieldState.invalid} className="flex-1">
            <FieldLabel htmlFor="input-task-title">Nova tarefa</FieldLabel>
            <Input
              {...field}
              id="input-task-title"
              aria-invalid={fieldState.invalid}
              placeholder="Descreva a tarefa"
              disabled={isPending}
            />
            {fieldState.invalid && <FieldError errors={[fieldState.error]} />}
          </Field>
        )}
      />
      <Button type="submit" isLoading={isPending}>
        Adicionar
      </Button>
    </form>
  );
}
