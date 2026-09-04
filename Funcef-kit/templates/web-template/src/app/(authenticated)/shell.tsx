'use client';

import { useMemo } from 'react';
import { useQueryClient } from '@tanstack/react-query';
import { AppShell } from '@funcef-componentes/auth/shell';
import type { System, User } from '@funcef-componentes/auth';
import { envClient } from '@/shared/config/env-client';
import { createSessionTeardown } from '@/core/auth/teardown';
import { menuConfig } from '@/core/config/menu.config';

const MOCK_SYSTEMS: System[] = [
  { name: 'Portal do Participante', url: 'https://www.funcef.com.br' },
  { name: 'SISFUNCEF', url: 'https://www.funcef.com.br/apl/sisfuncef' },
  { name: 'Nexus', url: 'https://www.funcef.com.br/apl/nexus' },
];

export function Shell({
  user,
  children,
}: {
  user: User;
  children: React.ReactNode;
}) {
  const queryClient = useQueryClient();
  const teardown = useMemo(
    () => createSessionTeardown({ queryClient }),
    [queryClient]
  );

  return (
    <AppShell
      menu={menuConfig}
      app={{
        name: 'web-template',
        version: envClient.APP_VERSION,
      }}
      systems={MOCK_SYSTEMS}
      user={user}
      logout={teardown}
    >
      <div className="flex flex-1 flex-col gap-5 px-5 pt-3.5">{children}</div>
    </AppShell>
  );
}
