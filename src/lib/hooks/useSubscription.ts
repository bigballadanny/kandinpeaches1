import { useState, useEffect } from 'react';
import { getUserData, updateUserData } from '../firebase/firebaseUtils';

interface UserData {
  id: string;
  subscriptionStatus?: 'active' | 'inactive' | 'pending';
  subscriptionTier?: 'basic' | 'premium' | 'vip' | null;
}

export function useSubscription(userId: string) {
  const [subscriptionStatus, setSubscriptionStatus] = useState<'active' | 'inactive' | 'pending'>('inactive');
  const [subscriptionTier, setSubscriptionTier] = useState<'basic' | 'premium' | 'vip' | null>(null);

  useEffect(() => {
    const fetchSubscriptionData = async () => {
      const userData = await getUserData(userId) as UserData | null;
      if (userData) {
        setSubscriptionStatus(userData.subscriptionStatus || 'inactive');
        setSubscriptionTier(userData.subscriptionTier || null);
      }
    };

    fetchSubscriptionData();
  }, [userId]);

  const subscribe = async (tier: 'basic' | 'premium' | 'vip') => {
    // In a real application, you would integrate with a payment provider here
    // For now, we'll just update the user's subscription status
    await updateUserData(userId, {
      subscriptionStatus: 'active',
      subscriptionTier: tier,
      subscriptionStartDate: new Date().toISOString(),
    });
    setSubscriptionStatus('active');
    setSubscriptionTier(tier);
  };

  const cancelSubscription = async () => {
    await updateUserData(userId, {
      subscriptionStatus: 'inactive',
      subscriptionTier: null,
      subscriptionEndDate: new Date().toISOString(),
    });
    setSubscriptionStatus('inactive');
    setSubscriptionTier(null);
  };

  return { subscriptionStatus, subscriptionTier, subscribe, cancelSubscription };
}