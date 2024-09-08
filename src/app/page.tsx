import dynamic from 'next/dynamic'

const LevelProgress = dynamic(() => import('../components/LevelProgress'), { ssr: false })

export default function Home() {
  const user = {
    level: 7,
    experience: 3500,
  }

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-serif font-bold text-luxury-gold">Creator Dashboard</h1>
      <LevelProgress level={user.level} experience={user.experience} nextLevelExperience={5000} />
    </div>
  )
}
