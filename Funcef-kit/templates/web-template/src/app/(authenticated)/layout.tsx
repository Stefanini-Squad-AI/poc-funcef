import { redirect } from 'next/navigation';
import type { User } from '@funcef-componentes/auth';
import { getServerSession } from '@/core/auth';
import { env } from '@/shared/config/env';
import { Shell } from './shell';

export default async function Layout({
  children,
}: {
  children: React.ReactNode;
}) {
  const session = await getServerSession();

  // `?stale=1`: marcador de cookie órfão — o proxy NÃO rebate para a home e
  // apaga os cookies de sessão na resposta (anti-loop; ver docs/proxy.md da lib).
  if (!session) redirect('/sign-in?stale=1');

  const user: User = {
    id: session.user.id,
    name: session.user.name,
    email: session.user.email,
    image: `${env.BASE_PATH}/api/auth/profile-photo`,
  };

  return <Shell user={user}>{children}</Shell>;
}
