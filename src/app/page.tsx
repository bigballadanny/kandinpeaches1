import dynamic from 'next/dynamic'

const LevelProgress = dynamic(() => import('../components/LevelProgress'), { ssr: false })
const PointSystem = dynamic(() => import('../components/PointSystem'), { ssr: false })

export default function Home() {
  const user = {
    level: 7,
    experience: 3500,
    nextLevelExperience: 5000,
    points: 12500,
  }

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-serif font-bold text-luxury-gold">Creator Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <LevelProgress 
          level={user.level} 
          experience={user.experience} 
          nextLevelExperience={user.nextLevelExperience} 
        />
        <PointSystem points={user.points} />
      </div>
    </div>
  )
}
