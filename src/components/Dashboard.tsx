'use client';

import React from 'react';
import { Card } from './ui/card';
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
        <Card className="p-4">
          <h2 className="text-lg font-semibold mb-2">Total Users</h2>
          <p className="text-3xl font-bold">{stats.totalUsers}</p>
        </Card>
        <Card className="p-4">
          <h2 className="text-lg font-semibold mb-2">Active Users</h2>
          <p className="text-3xl font-bold">{stats.activeUsers}</p>
        </Card>
        <Card className="p-4">
          <h2 className="text-lg font-semibold mb-2">Content Created</h2>
          <p className="text-3xl font-bold">{stats.contentCreated}</p>
        </Card>
        <Card className="p-4">
          <h2 className="text-lg font-semibold mb-2">Avg. Engagement</h2>
          <p className="text-3xl font-bold">{stats.averageEngagement}</p>
        </Card>
      </div>
    </div>
  );
}
