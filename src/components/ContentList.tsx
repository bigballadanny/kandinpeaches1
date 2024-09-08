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
