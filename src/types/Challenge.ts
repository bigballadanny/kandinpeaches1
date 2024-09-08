export type Challenge = {
  id: string;
  title: string;
  description: string;
  prompt: string;
  deadline: Date;
  reward: string;
  participants: string[];
  completed: string[];
};
