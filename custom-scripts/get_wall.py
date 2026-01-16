import subprocess

def trim_symble_str(s : str) -> list[str]:

    return [ x for x in s.split()]


def ApplyWallpaper(path):
    try:
        swww_query = subprocess.run(
                ["swww", "query"],
                capture_output=True,
                text=True,
                check=True
        ).stdout

        #out = subprocess.run(f"swww query | grep -oP '{wallDir}\S+\.(jpg|png|jpeg|webp)'", shell=True, capture_output=True, text=True)
        image_Extension: tuple = (".png", ".jpeg", ".jpg", ".svg",".webp", ".PNG", ".JPEG", ".JPG", ".SVG",".WEBP")
        rm_specific_symbol = trim_symble_str(swww_query)[-1]

        if rm_specific_symbol.endswith(image_Extension):
            with open(path, 'w+') as path:
                out_format = f"  BG:  url('{rm_specific_symbol}');".format()

                file_format = ["* { \n", out_format,'}']
                for format_str in file_format:

                    print(format_str, file=path)

            message = "rofi background"
            desc = "Apply rofi wallpaper with python"
            subprocess.run(["dunstify", "-i", rm_specific_symbol ,message, desc], check=True)
        else :
            #message = "change rofi bg not"
            desc = "Error apply rofi wallpaper with python"
            subprocess.run(["dunstify", "-i", "" , message, desc], check=True)

    except subprocess.CalledProcessError as e:
        # print(f"Error executing 'swww query': {e}")
        subprocess.run(["dunstify", "-i", "" , "Wallpaper", f"Error executing 'swww query': {e}"], check=True)
        subprocess.run(["dunstify", "-i", "" , "Wallpaper", f"Stderr: {e.stderr}"], check=True)
    
    except FileNotFoundError:
        # print("'swww' command not found. Ensure it's installed and in your PATH.")
        subprocess.run(["dunstify", "-i", "" , "Wallpaper", "'swww' command not found. Ensure it's installed and in your PATH."], check=True)

    return 0

def ActiveMatugen():
    try:
        
        SwwwQueryPath = subprocess.run(
            ["swww", "query"],
            check=True,
            capture_output=True,
            text=True
        ).stdout.split()[-1]

        # color generated from wallpaper
        print(SwwwQueryPath)
        subprocess.run(
            ["matugen", "image", SwwwQueryPath],
            check=True

        ).stdout

        # send notification color generate
        subprocess.run(
            ["dunstify", "Apply coloring from wallpaper"],
            check=True
        ).stdout
    
    except subprocess.CalledProcessError as e:
        # print(f"Error executing 'swww query': {e}")
        subprocess.run(["dunstify", "-i", "" , "Matugen", f"Error executing 'Matugen': {e}"], check=True)
        subprocess.run(["dunstify", "-i", "" , "Matugen", f"Stderr: {e.stderr}"], check=True)
    
    except FileNotFoundError:
        # print("'swww' command not found. Ensure it's installed and in your PATH.")
        subprocess.run(["dunstify", "-i", "" , "Matugen", "'Matugen' command not found. Ensure it's installed on your machine."], check=True)


# wallDir = "/home/minhcreatorvn/Pictures"
path = "/home/minhcreatorvn/.config/rofi/wall.rasi"

print(ApplyWallpaper(path))
print(ActiveMatugen())