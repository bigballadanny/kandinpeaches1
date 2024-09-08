#!/bin/bash

# Update page.tsx
cat > src/app/page.tsx << EOF
import Link from 'next/link'
import dynamic from 'next/dynamic'
import { Challenge } from '../types/Challenge'
import { UserProfile } from '../types/UserProfile'

const ChallengeCard = dynamic(() => import('../components/ChallengeCard'), { ssr: false })
const TelegramBroadcast = dynamic(() => import('../components/TelegramBroadcast'), { ssr: false })
const LevelProgress = dynamic(() => import('../components/LevelProgress'), { ssr: false })
const AchievementsList = dynamic(() => import('../components/AchievementsList'), { ssr: false })

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

      {/* Add ChallengeCard component here if needed */}
    </div>
  )
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated page.tsx:
- Used dynamic imports for client components
- Removed server-side logic from the page component
EOF

echo "page.tsx updated. Please run 'npm run dev' to see the changes."
