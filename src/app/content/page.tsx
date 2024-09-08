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
