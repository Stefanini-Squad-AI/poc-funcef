import { Shell } from './shell';

export default function AuthenticatedLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <Shell>{children}</Shell>;
}
