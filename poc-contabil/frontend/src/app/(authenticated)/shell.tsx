'use client';

import { AppShell } from '@funcef-componentes/auth/shell';
import type { System, User } from '@funcef-componentes/auth';
import { envClient } from '@/shared/config/env-client';
import { menuConfig } from '@/core/config/menu.config';

const MOCK_SYSTEMS: System[] = [
  { name: 'Portal do Participante', url: 'https://www.funcef.com.br' },
  { name: 'SISFUNCEF', url: 'https://www.funcef.com.br/apl/sisfuncef' },
  { name: 'Nexus', url: 'https://www.funcef.com.br/apl/nexus' },
];

const MOCK_USER: User = {
  id: 'poc-user',
  name: 'Usuário POC',
  email: 'poc@funcef.com.br',
  image: '',
};

export function Shell({ children }: { children: React.ReactNode }) {
  return (
    <AppShell
      menu={menuConfig}
      app={{
        name: 'POC Contabilidad',
        version: envClient.NEXT_PUBLIC_APP_VERSION,
      }}
      systems={MOCK_SYSTEMS}
      user={MOCK_USER}
      guards={false}
    >
      <div className="flex h-[calc(100svh-4rem)] flex-col gap-5 px-5 pt-3.5 overflow-hidden">{children}</div>
    </AppShell>
  );
}
