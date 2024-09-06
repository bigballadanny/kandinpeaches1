import os
import json
import zipfile
from datetime import datetime

def generate_synthios_pack():
    pack_data = {
        "version": "1.0.0",
        "last_updated": datetime.now().isoformat(),
        "files": {}
    }

    # Define the directories to include in the pack
    dirs_to_pack = [
        "src/synthios/workspace",
        "src/app/components",
        "src/lib/hooks",
        "src/lib/firebase"
    ]

    # Create a zip file
    with zipfile.ZipFile("synthios_pack.zip", "w") as zipf:
        for dir_path in dirs_to_pack:
            for root, _, files in os.walk(dir_path):
                for file in files:
                    file_path = os.path.join(root, file)
                    arcname = os.path.relpath(file_path, "src")
                    zipf.write(file_path, arcname)
                    
                    # Add file content to pack_data
                    with open(file_path, "r") as f:
                        pack_data["files"][arcname] = f.read()

    # Save pack_data as JSON
    with open("synthios_pack.json", "w") as f:
        json.dump(pack_data, f, indent=2)

    print("Synthios Pack generated successfully!")

if __name__ == "__main__":
    generate_synthios_pack()
