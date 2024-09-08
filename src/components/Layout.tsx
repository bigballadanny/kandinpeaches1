import dynamic from 'next/dynamic'

const ClientLayout = dynamic(() => import('./ClientLayout'), { ssr: false })

export default function Layout({ children }: { children: React.ReactNode }) {
  return <ClientLayout>{children}</ClientLayout>
}
