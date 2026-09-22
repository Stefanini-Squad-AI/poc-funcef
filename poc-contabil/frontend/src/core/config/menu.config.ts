import type { MenuGroup } from '@funcef-componentes/auth'

const menuConfig: MenuGroup[] = [
  {
    items: [{ label: 'Página Inicial', url: '/', icon: 'house' }],
  },
  {
    items: [
      {
        label: 'Cadastros',
        icon: 'database',
        subs: [
          { label: 'Plano de Contas', url: '/contas-contabeis', icon: 'list-tree' },
        ],
      },
    ],
  },
]

export { menuConfig }
