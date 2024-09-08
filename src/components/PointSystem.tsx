'use client'

import React from 'react'

interface PointSystemProps {
  points: number;
}

const PointSystem: React.FC<PointSystemProps> = ({ points }) => {
  return React.createElement('div', { className: "bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md" },
    React.createElement('h2', { className: "text-2xl font-serif font-bold text-luxury-gold mb-4" }, "Creator Points"),
    React.createElement('p', { className: "text-3xl font-bold text-charcoal dark:text-soft-cream" }, points.toLocaleString())
  )
}

export default PointSystem
