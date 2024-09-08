#!/bin/bash

# Update globals.css
cat > src/app/globals.css << EOF
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&family=Playfair+Display:wght@400;700&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --foreground-rgb: 54, 69, 79;
  --background-start-rgb: 245, 230, 211;
  --background-end-rgb: 255, 255, 255;
}

.dark {
  --foreground-rgb: 245, 230, 211;
  --background-start-rgb: 25, 25, 112;
  --background-end-rgb: 74, 14, 78;
}

body {
  color: rgb(var(--foreground-rgb));
  background: linear-gradient(
    to bottom,
    transparent,
    rgb(var(--background-end-rgb))
  )
  rgb(var(--background-start-rgb));
}

.luxury-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 10px;
  border: 1px solid rgba(212, 175, 55, 0.2);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
}

.gradient-text {
  background: linear-gradient(45deg, #D4AF37, #4A0E4E);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  text-fill-color: transparent;
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated globals.css:
- Added custom color scheme
- Implemented gradient text and luxury card styles
EOF

echo "globals.css updated with custom styles. Please run 'npm run dev' to see the changes."
