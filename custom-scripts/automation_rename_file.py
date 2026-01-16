import os as sys

def rename(currName: str, newName: str):

    return sys.rename(currName, newName) 

def add_path(dirPath : str) -> str:
    newname = 0
    for it1, it2, it3 in sys.walk(dirPath):

        for path in it3: 
             
            if path.endswith(".png"): # modify or add more line when run other file image extension
                 
                 rename(dirPath + path, dirPath + f"wall{newname}.png")

            if path.endswith(".jpg"):
                 rename(dirPath + path, dirPath + f"wall{newname}.jpg")

            if path.endswith(".jpeg"):
                 rename(dirPath + path, dirPath + f"wall{newname}.jpeg")
            
            if path.endswith(".gif"):
                 rename(dirPath + path, dirPath + f"wall{newname}.gif")

            newname += 1

    return sys.listdir(dirPath)
#endswith((".png", ".jpg", ".jpeg"))
path = "please add your path image"

print(add_path(path))