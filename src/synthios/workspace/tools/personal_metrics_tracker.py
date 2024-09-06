import json
from datetime import datetime

class PersonalMetricsTracker:
    def __init__(self, file_path='personal_metrics.json'):
        self.file_path = file_path
        self.metrics = self.load_metrics()

    def load_metrics(self):
        try:
            with open(self.file_path, 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            return {}

    def save_metrics(self):
        with open(self.file_path, 'w') as f:
            json.dump(self.metrics, f, indent=2)

    def add_metric(self, date, metric_type, value):
        if date not in self.metrics:
            self.metrics[date] = {}
        self.metrics[date][metric_type] = value
        self.save_metrics()

    def get_metric(self, date, metric_type):
        return self.metrics.get(date, {}).get(metric_type)

    def analyze_productivity(self, start_date, end_date):
        # Implement productivity analysis logic here
        pass

tracker = PersonalMetricsTracker()

# Example usage:
# tracker.add_metric('2024-03-15', 'work_hours', 8)
# tracker.add_metric('2024-03-15', 'whoop_recovery', 85)
