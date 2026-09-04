'use client';

import { Badge, Card, CardContent, Skeleton } from '@funcef-componentes/react';
import { useAllTasks } from '../hooks/use-tasks-query';

/** Lista com primitivos do DS — sem data-table (exemplo mínimo). */
export function TaskList() {
  const { tasks, isTasksLoading, error } = useAllTasks();

  if (isTasksLoading) {
    return (
      <div className="flex flex-col gap-2">
        <Skeleton className="h-12 w-full" />
        <Skeleton className="h-12 w-full" />
      </div>
    );
  }

  if (error) {
    return (
      <p className="text-destructive text-sm">
        Não foi possível carregar as tarefas.
      </p>
    );
  }

  if (!tasks || tasks.length === 0) {
    return <p className="text-muted-foreground text-sm">Nenhuma tarefa.</p>;
  }

  return (
    <ul className="flex flex-col gap-2">
      {tasks.map((task) => (
        <li key={task.id}>
          <Card className="py-3">
            <CardContent className="flex items-center justify-between px-4">
              <span
                className={
                  task.done ? 'text-muted-foreground line-through' : ''
                }
              >
                {task.title}
              </span>
              <Badge variant={task.done ? 'secondary' : 'default'}>
                {task.done ? 'Concluída' : 'Pendente'}
              </Badge>
            </CardContent>
          </Card>
        </li>
      ))}
    </ul>
  );
}
