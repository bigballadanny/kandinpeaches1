type FeatureFlag = 'TELEGRAM_BOT' | 'SOCIAL_MEDIA_SCHEDULER';

const featureFlags: Record<FeatureFlag, boolean> = {
  TELEGRAM_BOT: false,
  SOCIAL_MEDIA_SCHEDULER: false,
};

export const isFeatureEnabled = (feature: FeatureFlag): boolean => {
  return featureFlags[feature] || false;
};

export const enableFeature = (feature: FeatureFlag): void => {
  featureFlags[feature] = true;
};

export const disableFeature = (feature: FeatureFlag): void => {
  featureFlags[feature] = false;
};
