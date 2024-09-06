from datetime import datetime, timedelta

class WorkTracker:
    def __init__(self, file_path='work_log.txt'):
        self.file_path = file_path

    def log_work(self, task, duration):
        with open(self.file_path, 'a') as f:
            f.write(f"{datetime.now().isoformat()}: {task} - {duration}\n")

    def get_daily_summary(self, date=None):
        if date is None:
            date = datetime.now().date()
        
        total_duration = timedelta()
        tasks = []

        with open(self.file_path, 'r') as f:
            for line in f:
                log_date = datetime.fromisoformat(line.split(':')[0]).date()
                if log_date == date:
                    task = line.split(':')[1].strip()
                    duration_str = task.split('-')[1].strip()
                    duration = timedelta(minutes=int(duration_str.split()[0]))
                    total_duration += duration
                    tasks.append(task)

        return {
            'date': date.isoformat(),
            'total_hours': total_duration.total_seconds() / 3600,
            'tasks': tasks
        }

work_tracker = WorkTracker()

# Example usage:
# work_tracker.log_work("Implemented work tracker", 60)
# print(work_tracker.get_daily_summary())
