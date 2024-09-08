export default function AchievementBadge({ title, description, icon }: { title: string; description: string; icon: string }) {
  return (
    <div className="bg-white dark:bg-midnight-blue p-4 rounded-lg shadow-md flex items-center space-x-4">
      <div className="text-4xl">{icon}</div>
      <div>
        <h3 className="text-lg font-serif font-bold text-luxury-gold">{title}</h3>
        <p className="text-sm">{description}</p>
      </div>
    </div>
  )
}
