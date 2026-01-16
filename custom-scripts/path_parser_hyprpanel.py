import json, subprocess 

#def json_parser(key: str, target_find: str) -> str:
    

def trim_symble_str(s : str) -> list[str]:

    return [ x for x in s.split('\n')]



def open_hypr_parser(path: str, wallDir: str): 
    out = subprocess.run(f"swww query | grep -oP '{wallDir}\S+\.(jpg|png|jpeg|webp)'", shell=True, capture_output=True, text=True)
    trim_enter = trim_symble_str(out.stdout)[0]
    
    with open(f"{path}config.json", 'r') as file: 
        
        js_load = json.load(file)
    
    js_load['wallpaper.image'] = f"{trim_enter}"

    with open(f"{path}config.json", 'w') as file:        

        json.dump(js_load, file)

    return "ok"



wallDir = '/home/minhcreatorvn/Pictures' 
path = "/home/minhcreatorvn/.config/hyprpanel/"

print(open_hypr_parser(path, wallDir))