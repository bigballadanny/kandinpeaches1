export default function PointSystem({ points, level }: { points: number; level: number }) {
  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md">
      <h2 className="text-2xl font-serif font-bold text-luxury-gold mb-2">Creator Stats</h2>
      <p className="text-lg">Points: <span className="font-bold text-luxury-gold">{points}</span></p>
      <p className="text-lg">Level: <span className="font-bold text-luxury-gold">{level}</span></p>
    </div>
  )
}
