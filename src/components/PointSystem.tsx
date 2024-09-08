'use client'

import React from 'react'

interface PointSystemProps {
  points: number;
}

const PointSystem: React.FC<PointSystemProps> = ({ points }) => {
  return React.createElement('div', { className: "bg-white dark:bg-midnight-blue p-6 rounded-lg shadow-md border-2 border-miami-yellow" },
    React.createElement('h2', { className: "text-2xl font-serif font-bold text-miami-pink mb-4" }, "Creator Points"),
    React.createElement('p', { className: "text-4xl font-bold text-miami-yellow" }, points.toLocaleString()),
    React.createElement('p', { className: "text-sm text-charcoal dark:text-soft-cream mt-2" }, "Keep creating to earn more points!")
  )
}

export default PointSystem
