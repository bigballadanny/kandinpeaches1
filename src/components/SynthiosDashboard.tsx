import React from 'react';
import { useAuth } from '@/lib/hooks/useAuth';

const SynthiosDashboard: React.FC = () => {
  const { user } = useAuth();

  return (
    <div className="synthios-dashboard">
      <h1>Synthios Dashboard</h1>
      {user ? (
        <p>Welcome, {user.displayName || user.email}!</p>
      ) : (
        <p>Please sign in to use the dashboard.</p>
      )}
      {/* Add other dashboard components here */}
    </div>
  );
};

export default SynthiosDashboard;
