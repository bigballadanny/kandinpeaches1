#!/bin/bash

# Update src/app/page.tsx to use the correct route
sed -i 's|href="/content-creator"|href="/content"|g' src/app/page.tsx

# Update PROJECT_LOG.md
./update_project.sh << EOF
Fixed routing issue:
- Updated main page to use correct "/content" route
EOF

echo "Routes fixed. Please run 'npm run dev' to see the changes."
