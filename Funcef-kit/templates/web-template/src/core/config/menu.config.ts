import type { MenuGroup } from '@funcef-componentes/auth';

/** Fonte única do menu da aplicação — formato nativo do AppShell da lib. */
const menuConfig: MenuGroup[] = [
  {
    items: [{ label: 'Página Inicial', url: '/', icon: 'house' }],
  },
  {
    label: 'EXEMPLOS',
    items: [{ label: 'Tarefas', url: '/tasks', icon: 'list-todo' }],
  },
];

export { menuConfig };
