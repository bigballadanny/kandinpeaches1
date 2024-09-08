import './globals.css'
import type { Metadata } from 'next'
import Layout from '../components/Layout'

export const metadata: Metadata = {
  title: 'Content Analytics Platform',
  description: 'Streamlined content management with powerful analytics',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
        <Layout>{children}</Layout>
      </body>
    </html>
  )
}
