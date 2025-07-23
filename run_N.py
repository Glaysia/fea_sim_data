import subprocess
import os
import sys

def main():
    N = 4
    PYTHON_EXEC = sys.executable
    script = os.path.join(os.path.dirname(__file__), "run_1.py")
    FOREVER = [PYTHON_EXEC, str(script)]
    print(FOREVER)
    logs_dir = "./logs"
    os.makedirs(logs_dir, exist_ok=True)

    processes = []
    for i in range(N):
        out_path = os.path.join(logs_dir, f"{i}.out.log")
        err_path = os.path.join(logs_dir, f"{i}.err.log")
        out_file = open(out_path, "w", encoding="utf-8")
        err_file = open(err_path, "w", encoding="utf-8")
        # Launch each instance and redirect stdout/stderr
        proc = subprocess.Popen(
            [*FOREVER, str(i)], 
            stdout=out_file,
            stderr=err_file,
            env={**os.environ, **{"PYTHONIOENCODING": "utf-8"}}
            )


        print(f"Launched instance {i} (PID={proc.pid})")
        processes.append(proc)

    # If you want to wait for all processes to finish, uncomment below:
    # for proc in processes:
    #     proc.wait()

    print(f"All {N} instances of run_1.py have been launched.")

if __name__ == "__main__":
    main()