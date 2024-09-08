#!/bin/bash

# Update next.config.js
cat > next.config.js << EOF
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  webpack: (config, { isServer }) => {
    if (!isServer) {
      config.resolve.fallback = {
        ...config.resolve.fallback,
        fs: false,
      };
    }
    return config;
  },
}

module.exports = nextConfig
EOF

# Update package.json dev script
sed -i 's/"dev": "next dev"/"dev": "next dev -H 0.0.0.0"/g' package.json

# Update PROJECT_LOG.md
./update_project.sh << EOF
Updated Next.js configuration to listen on all interfaces. Modified dev script to use -H 0.0.0.0.
EOF

echo "Next.js configuration updated. Please restart the development server with 'npm run dev'."
