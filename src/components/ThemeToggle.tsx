'use client';

import { useState, useEffect } from 'react';
import { Button } from './ui/button';

export function ThemeToggle() {
  const [darkMode, setDarkMode] = useState(false);

  useEffect(() => {
    const isDarkMode = localStorage.getItem('darkMode') === 'true';
    setDarkMode(isDarkMode);
    document.documentElement.classList.toggle('dark', isDarkMode);
  }, []);

  const toggleDarkMode = () => {
    const newDarkMode = !darkMode;
    setDarkMode(newDarkMode);
    localStorage.setItem('darkMode', newDarkMode.toString());
    document.documentElement.classList.toggle('dark', newDarkMode);
  };

  return (
    <Button onClick={toggleDarkMode} variant="outline" size="sm">
      {darkMode ? '🌞 Light' : '🌙 Dark'}
    </Button>
  );
}
