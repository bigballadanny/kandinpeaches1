import json
from datetime import datetime

class IdeaManager:
    def __init__(self, file_path='ideas.json'):
        self.file_path = file_path
        self.ideas = self.load_ideas()

    def load_ideas(self):
        try:
            with open(self.file_path, 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            return []

    def save_ideas(self):
        with open(self.file_path, 'w') as f:
            json.dump(self.ideas, f, indent=2)

    def add_idea(self, title, description, feasibility, mvp_time):
        idea = {
            'id': len(self.ideas) + 1,
            'title': title,
            'description': description,
            'feasibility': feasibility,
            'mvp_time': mvp_time,
            'created_at': datetime.now().isoformat(),
            'status': 'New'
        }
        self.ideas.append(idea)
        self.save_ideas()
        return idea['id']

    def get_idea(self, idea_id):
        return next((idea for idea in self.ideas if idea['id'] == idea_id), None)

    def update_idea_status(self, idea_id, new_status):
        idea = self.get_idea(idea_id)
        if idea:
            idea['status'] = new_status
            self.save_ideas()
            return True
        return False

    def get_prioritized_ideas(self):
        return sorted(self.ideas, key=lambda x: (x['feasibility'], x['mvp_time']))

idea_manager = IdeaManager()

# Example usage:
# idea_manager.add_idea("Team Synthios AI", "Develop an AI assistant for team collaboration", "High", "3 months")
