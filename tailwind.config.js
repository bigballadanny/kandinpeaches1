/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'miami-pink': '#ff6b6b',
        'miami-blue': '#4ecdc4',
        'miami-purple': '#6c5ce7',
        'miami-orange': '#ffa502',
        'dark-bg': '#1e1e2e',
        'light-bg': '#2d2d44',
      },
      fontFamily: {
        'retro': ['VT323', 'monospace'],
        'modern': ['Roboto', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
