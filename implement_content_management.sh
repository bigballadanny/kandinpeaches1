#!/bin/bash

# Create ContentItem type
cat > src/types/ContentItem.ts << EOF
export type ContentItem = {
  id: string;
  title: string;
  content: string;
  createdAt: Date;
  updatedAt: Date;
};
EOF

# Create ContentList component
cat > src/components/ContentList.tsx << EOF
import React from 'react';
import { ContentItem } from '../types/ContentItem';

type ContentListProps = {
  items: ContentItem[];
  onEdit: (id: string) => void;
  onDelete: (id: string) => void;
};

const ContentList: React.FC<ContentListProps> = ({ items, onEdit, onDelete }) => {
  return (
    <div className="space-y-4">
      {items.map((item) => (
        <div key={item.id} className="p-4 bg-white rounded-lg shadow">
          <h3 className="text-xl font-semibold">{item.title}</h3>
          <p className="text-gray-600 mt-2">{item.content.substring(0, 100)}...</p>
          <div className="mt-4 space-x-2">
            <button onClick={() => onEdit(item.id)} className="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Edit</button>
            <button onClick={() => onDelete(item.id)} className="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</button>
          </div>
        </div>
      ))}
    </div>
  );
};

export default ContentList;
EOF

# Create ContentForm component
cat > src/components/ContentForm.tsx << EOF
import React, { useState } from 'react';

type ContentFormProps = {
  onSubmit: (title: string, content: string) => void;
};

const ContentForm: React.FC<ContentFormProps> = ({ onSubmit }) => {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSubmit(title, content);
    setTitle('');
    setContent('');
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="title" className="block text-sm font-medium text-gray-700">Title</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
          required
        />
      </div>
      <div>
        <label htmlFor="content" className="block text-sm font-medium text-gray-700">Content</label>
        <textarea
          id="content"
          value={content}
          onChange={(e) => setContent(e.target.value)}
          rows={4}
          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
          required
        ></textarea>
      </div>
      <button type="submit" className="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600">Create Content</button>
    </form>
  );
};

export default ContentForm;
EOF

# Update content page
cat > src/app/content/page.tsx << EOF
'use client'

import React, { useState } from 'react';
import ContentList from '../../components/ContentList';
import ContentForm from '../../components/ContentForm';
import { ContentItem } from '../../types/ContentItem';

export default function ContentPage() {
  const [contents, setContents] = useState<ContentItem[]>([]);

  const handleCreateContent = (title: string, content: string) => {
    const newContent: ContentItem = {
      id: Date.now().toString(),
      title,
      content,
      createdAt: new Date(),
      updatedAt: new Date(),
    };
    setContents([...contents, newContent]);
  };

  const handleEditContent = (id: string) => {
    // Implement edit functionality
    console.log('Edit content with id:', id);
  };

  const handleDeleteContent = (id: string) => {
    setContents(contents.filter(item => item.id !== id));
  };

  return (
    <div className="space-y-8">
      <h1 className="text-3xl font-bold">Content Management</h1>
      <ContentForm onSubmit={handleCreateContent} />
      <ContentList items={contents} onEdit={handleEditContent} onDelete={handleDeleteContent} />
    </div>
  );
}
EOF

# Update PROJECT_LOG.md
./update_project.sh << EOF
Implemented basic content management system:
- Created ContentItem type
- Implemented ContentList and ContentForm components
- Updated content page with create, list, and delete functionality
EOF

echo "Basic content management system implemented. Please run 'npm run dev' to see the changes."
