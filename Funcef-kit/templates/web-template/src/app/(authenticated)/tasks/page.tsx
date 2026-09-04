import { CreateTaskForm, TaskList } from '@/features/tasks';

export default function Page() {
  return (
    <div className="flex max-w-2xl flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold">Tarefas</h1>
        <p className="text-muted-foreground text-sm">
          Feature de exemplo do template: 1 query + 1 mutation com toast global,
          servida pelo mock de dev (json-server) quando habilitado.
        </p>
      </div>
      <CreateTaskForm />
      <TaskList />
    </div>
  );
}
