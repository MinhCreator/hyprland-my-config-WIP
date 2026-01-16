import subprocess
import re

wallDir = "/path/to/your/wallpapers/" # Replace with the actual value of wallDir

try:
    # 1. First, get the raw output from 'swww query'
    swww_output = subprocess.run(
        ["swww", "query"],
        capture_output=True,
        text=True,
        check=True # Add check=True to raise an error if swww fails
    ).stdout

    # 2. Then, use Python's 're' module to perform the grep-like search
    # This pattern searches for a line containing the path starting with wallDir,
    # followed by non-whitespace characters, and ending with one of the extensions.
    # The 're.DOTALL' flag is for searching across multiple lines (although not strictly needed here).
    # The 're.MULTILINE' flag lets '^' and '$' match the start/end of lines.
    # The 're.IGNORECASE' flag is to match case-insensitively on the file extension.
    pattern = re.compile(rf"{re.escape(wallDir)}\S+\.(jpg|png|jpeg|webp)$", re.IGNORECASE | re.MULTILINE)

    match = pattern.search(swww_output)
    
    if match:
        current_wallpaper = match.group(0)
        print(f"Current wallpaper file: {current_wallpaper}")
    else:
        print("Could not find a matching wallpaper path in swww query output.")

except subprocess.CalledProcessError as e:
    print(f"Error executing 'swww query': {e}")
    print(f"Stderr: {e.stderr}")
except FileNotFoundError:
    print("'swww' command not found. Ensure it's installed and in your PATH.")