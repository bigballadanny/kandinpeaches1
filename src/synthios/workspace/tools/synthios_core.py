import json
import os

class SynthiosCore:
    def __init__(self):
        self.workspace_path = os.path.join(os.path.dirname(__file__), '..')
        self.load_config()

    def load_config(self):
        config_path = os.path.join(self.workspace_path, 'config.json')
        with open(config_path, 'r') as f:
            self.config = json.load(f)

    def save_config(self):
        config_path = os.path.join(self.workspace_path, 'config.json')
        with open(config_path, 'w') as f:
            json.dump(self.config, f, indent=2)

    def get_project_structure(self):
        structure = {}
        for root, dirs, files in os.walk(self.workspace_path):
            structure[root] = {
                'dirs': dirs,
                'files': files
            }
        return structure

    def add_idea(self, idea):
        ideas_path = os.path.join(self.workspace_path, 'ideas', 'ideas.md')
        with open(ideas_path, 'a') as f:
            f.write(f"\n## {idea['title']}\n{idea['description']}\n")

    def get_latest_log(self):
        log_path = os.path.join(self.workspace_path, '..', 'captains_log.md')
        with open(log_path, 'r') as f:
            return f.read().split('##')[-1].strip()

# Add more methods as needed

synthios = SynthiosCore()

def add_active_note(self, note):
    notes_path = os.path.join(self.workspace_path, 'active_notes.md')
    with open(notes_path, 'a') as f:
        f.write(f"\n## {note['title']}\n{note['content']}\n")

def get_active_notes(self, limit=5):
    notes_path = os.path.join(self.workspace_path, 'active_notes.md')
    with open(notes_path, 'r') as f:
        notes = f.read().split('##')[1:]  # Skip the header
        return notes[-limit:]  # Return the last 'limit' notes

# Add this method to the SynthiosCore class

class AIProtector:
    @staticmethod
    def validate_ai_suggestion(suggestion, context):
        # Implement logic to validate AI suggestions
        # This is a placeholder implementation
        if "harmful" in suggestion.lower() or "irrelevant" in suggestion.lower():
            return False
        return True

    @staticmethod
    def explain_decision(decision, suggestion, context):
        # Provide an explanation for the decision
        if decision:
            return f"Suggestion accepted: {suggestion[:50]}... aligns with project goals and context."
        else:
            return f"Suggestion rejected: {suggestion[:50]}... does not meet project standards or context."

# Add this to the SynthiosCore class
def process_ai_suggestion(self, suggestion, context):
    decision = AIProtector.validate_ai_suggestion(suggestion, context)
    explanation = AIProtector.explain_decision(decision, suggestion, context)
    return decision, explanation

