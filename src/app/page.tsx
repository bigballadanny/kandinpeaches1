import Link from 'next/link'
import ChallengeCard from '../components/ChallengeCard'
import TelegramBroadcast from '../components/TelegramBroadcast'
import LevelProgress from '../components/LevelProgress'
import AchievementsList from '../components/AchievementsList'
import { Challenge } from '../types/Challenge'
import { UserProfile } from '../types/UserProfile'

export default function Home() {
  // Mock user data
  const user: UserProfile = {
    id: '1',
    username: 'MiamiCreator',
    level: 7,
    experience: 3500,
    creatorPoints: 1200,
    achievements: ['first_post', 'challenge_complete', 'follower_milestone'],
  };

  // Mock achievements data
  const achievements = [
    { id: 'first_post', title: 'First Post', description: 'Published your first content', icon: '🎉' },
    { id: 'challenge_complete', title: 'Challenge Accepted', description: 'Completed your first challenge', icon: '🏆' },
    { id: 'follower_milestone', title: 'Rising Star', description: 'Reached 1000 followers', icon: '⭐' },
  ];

  // ... (keep existing challenge and handler logic)

  return (
    <div className="space-y-8">
      <h1 className="text-4xl font-retro text-miami-pink">Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <LevelProgress level={user.level} experience={user.experience} nextLevelExperience={5000} />
        <div className="bg-light-bg p-4 rounded-lg shadow-lg">
          <h3 className="text-xl font-retro text-miami-orange mb-2">Creator Points</h3>
          <p className="text-4xl font-retro text-miami-blue">{user.creatorPoints}</p>
        </div>
      </div>

      <AchievementsList achievements={achievements} />
      
      <TelegramBroadcast 
        channelUrl="https://t.me/your_channel" 
        nextSessionTime={new Date("2023-06-15T18:00:00")} 
      />

      {/* ... (keep existing Challenges section) */}
    </div>
  )
}
