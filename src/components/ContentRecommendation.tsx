''use client';;
import React, { useState, useEffect } from 'react';

interface Content {
  id: number;
  title: string;
  description: string;
}

const ContentRecommendation: React.FC = () => {
  const [recommendations, setRecommendations] = useState<Content[]>([]);

  useEffect(() => {
    // Simulating an API call to get recommendations
    const fetchRecommendations = async () => {
      // In a real scenario, this would be an API call
      const mockRecommendations: Content[] = [
        { id: 1, title: "Top 10 Miami Hotspots", description: "Explore the vibrant nightlife of Miami" },
        { id: 2, title: "Retro Synthwave Music Mix", description: "Journey back to the 80s with this awesome playlist" },
        { id: 3, title: "AI and the Future of Content", description: "How AI is reshaping the content creation landscape" },
      ];
      setRecommendations(mockRecommendations);
    };

    fetchRecommendations();
  }, []);

  return (
    <div className="bg-gradient-to-r from-purple-400 via-pink-500 to-red-500 p-6 rounded-lg shadow-lg">
      <h2 className="text-2xl font-bold text-white mb-4">Recommended for You</h2>
      <div className="space-y-4">
        {recommendations.map((content) => (
          <div key={content.id} className="bg-white bg-opacity-20 p-4 rounded-md backdrop-filter backdrop-blur-lg">
            <h3 className="text-xl font-semibold text-white">{content.title}</h3>
            <p className="text-gray-100">{content.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ContentRecommendation;
