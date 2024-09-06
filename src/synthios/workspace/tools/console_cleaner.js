const originalConsoleLog = console.log;
const originalConsoleError = console.error;
const originalConsoleWarn = console.warn;

const filteredPhrases = [
  'Attention: Next.js now collects',
  'You can learn more, including how to opt-out',
  'Creating an optimized production build',
];

function shouldFilter(message) {
  return filteredPhrases.some(phrase => message.includes(phrase));
}

console.log = function(...args) {
  if (!shouldFilter(args[0])) {
    originalConsoleLog.apply(console, args);
  }
};

console.error = function(...args) {
  if (!shouldFilter(args[0])) {
    originalConsoleError.apply(console, args);
  }
};

console.warn = function(...args) {
  if (!shouldFilter(args[0])) {
    originalConsoleWarn.apply(console, args);
  }
};

