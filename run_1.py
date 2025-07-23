#!/usr/bin/env python3
import subprocess
import sys
import time
from datetime import datetime
import os

# Ensure comments are in English as per preference

def main():
    # Check for index argument
    if len(sys.argv) < 2:
        print("Usage: run_1.py INDEX")
        sys.exit(1)
    index = sys.argv[1]

    # Path to target script (script.py) in the same directory
    script_path = os.path.join(os.path.dirname(__file__), "script.py")

    # Use the current Python interpreter
    python_exec = sys.executable

    while True:
        # Print timestamped start message
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(f"[{now}] Starting script.py (index={index})...")

        # Execute the target script
        proc = subprocess.run([python_exec, script_path, index])
        retcode = proc.returncode

        # Wait 10 seconds without break
        time.sleep(10)

        # Print timestamped restart message
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(f"[{now}] script.py exited (code={retcode}). Restarting...")

if __name__ == "__main__":
    main()
