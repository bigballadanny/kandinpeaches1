'use client';

import React from 'react';
import { ThemeToggle } from './ThemeToggle';

export function Dashboard() {
  const stats = {
    totalUsers: 1234,
    activeUsers: 789,
    contentCreated: 456,
    averageEngagement: '78%'
  };

  return (
    <div className="p-6 max-w-6xl mx-auto">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold">Dashboard</h1>
        <ThemeToggle />
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {Object.entries(stats).map(([key, value]) => (
          <div key={key} className="bg-white dark:bg-gray-800 p-4 rounded-lg shadow">
            <h2 className="text-lg font-semibold mb-2">{key.replace(/([A-Z])/g, ' ').trim()}</h2>
            <p className="text-3xl font-bold">{value}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
