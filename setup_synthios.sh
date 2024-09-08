#!/bin/bash

# Create Synthios directory
mkdir -p synthios

# Create a README for Synthios
cat > synthios/README.md << EOF
# Synthios

Synthios is a methodology and toolset for efficient development workflows.

## Structure

- `scripts/`: Contains utility scripts for Synthios workflows
- `templates/`: Contains template files for various project types
- `docs/`: Documentation for Synthios methodology and tools

## Usage

(To be filled with usage instructions)

EOF

# Create directories for Synthios components
mkdir -p synthios/scripts
mkdir -p synthios/templates
mkdir -p synthios/docs

# Create a sample script
cat > synthios/scripts/create_component.sh << EOF
#!/bin/bash
# Sample script to create a new React component
# Usage: ./create_component.sh ComponentName

if [ -z "$1" ]; then
    echo "Please provide a component name"
    exit 1
fi

COMPONENT_NAME=$1
COMPONENT_DIR="src/components/$COMPONENT_NAME"

mkdir -p $COMPONENT_DIR

cat > $COMPONENT_DIR/$COMPONENT_NAME.tsx << EOC
import React from 'react';

interface ${COMPONENT_NAME}Props {
  // Define props here
}

export const $COMPONENT_NAME: React.FC<${COMPONENT_NAME}Props> = (props) => {
  return (
    <div>
      {$COMPONENT_NAME} Component
    </div>
  );
};
EOC

echo "$COMPONENT_NAME component created in $COMPONENT_DIR"
EOF

chmod +x synthios/scripts/create_component.sh

# Update PROJECT_LOG.md
./update_project.sh << EOF
Set up initial structure for Synthios:
- Created Synthios directory with README
- Added sample script for creating React components
- Prepared directories for future Synthios development
EOF

echo "Synthios setup completed. You can now start developing Synthios separately within the 'synthios' directory."
