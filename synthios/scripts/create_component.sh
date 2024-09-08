#!/bin/bash
# Sample script to create a new React component
# Usage: ./create_component.sh ComponentName

if [ -z "" ]; then
    echo "Please provide a component name"
    exit 1
fi

COMPONENT_NAME=
COMPONENT_DIR="src/components/"

mkdir -p 

cat > /.tsx << EOC
import React from 'react';

interface Props {
  // Define props here
}

export const : React.FC<Props> = (props) => {
  return (
    <div>
      {} Component
    </div>
  );
};
EOC

echo " component created in "
