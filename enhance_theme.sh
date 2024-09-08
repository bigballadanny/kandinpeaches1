#!/bin/bash

# Update globals.css with Miami-inspired theme
cat >> src/app/globals.css << EOF

/* Miami-inspired theme */
:root {
  --color-miami-pink: #ff6b6b;
  --color-miami-blue: #4ecdc4;
  --color-miami-yellow: #feca57;
  --color-miami-dark: #2c3e50;
  --color-miami-light: #f7f1e3;
}

body {
  background: linear-gradient(135deg, var(--color-miami-pink), var(--color-miami-blue));
  color: var(--color-miami-dark);
}

.dark body {
  background: linear-gradient(135deg, var(--color-miami-dark), #1a1a2e);
  color: var(--color-miami-light);
}

EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Enhanced theme:
- Added Miami-inspired color variables
- Implemented gradient background
- Updated dark mode colors
EOF

echo "Theme enhanced. Please run 'npm run dev' to see the changes."
