'use client';

import React, { useState, useEffect } from 'react';
import { useAuth } from '@/lib/hooks/useAuth';
import { getUserData, updateUserData } from '@/lib/firebase/firebaseUtils';
import { TelegramBot } from './TelegramBot';
import Button from './Button';

export default function ContentCreatorApp() {
  const { user } = useAuth();
  const [userData, setUserData] = useState<any>(null);

  useEffect(() => {
    if (user) {
      getUserData(user.uid).then(setUserData);
    }
  }, [user]);

  const handleUpdateUserData = async () => {
    if (user && userData) {
      await updateUserData(user.uid, { ...userData, lastUpdated: new Date() });
      getUserData(user.uid).then(setUserData);
    }
  };

  if (!user) {
    return <div>Please log in to use the Content Creator App.</div>;
  }

  return (
    <div>
      <h1>Content Creator App</h1>
      <TelegramBot userId={user.uid} />
      <Button onClick={handleUpdateUserData}>Update User Data</Button>
      {userData && (
        <pre>{JSON.stringify(userData, null, 2)}</pre>
      )}
    </div>
  );
}
