import os
import json
from datetime import datetime, timedelta

def save_chat_log(chat_content):
    log_dir = "src/synthios/workspace/chat_logs"
    os.makedirs(log_dir, exist_ok=True)
    
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"{log_dir}/chat_log_{timestamp}.txt"
    
    with open(filename, "w") as f:
        f.write(chat_content)
    
    print(f"Chat log saved to {filename}")
    
    # Summarize and archive old logs
    summarize_old_logs(log_dir)

def summarize_old_logs(log_dir):
    current_time = datetime.now()
    week_ago = current_time - timedelta(days=7)
    
    for filename in os.listdir(log_dir):
        if filename.startswith("chat_log_"):
            file_time = datetime.strptime(filename[9:24], "%Y%m%d_%H%M%S")
            if file_time < week_ago:
                summarize_and_archive(os.path.join(log_dir, filename))

def summarize_and_archive(file_path):
    with open(file_path, "r") as f:
        content = f.read()
    
    # Here you would implement or call an AI summarization function
    # For now, we'll just use a placeholder
    summary = f"Summary of {os.path.basename(file_path)}: {len(content)} characters of chat log"
    
    archive_dir = "src/synthios/workspace/chat_archives"
    os.makedirs(archive_dir, exist_ok=True)
    
    archive_file = os.path.join(archive_dir, f"summary_{os.path.basename(file_path)}")
    with open(archive_file, "w") as f:
        f.write(summary)
    
    os.remove(file_path)
    print(f"Summarized and archived {file_path}")

if __name__ == "__main__":
    save_chat_log("Sample chat content")
