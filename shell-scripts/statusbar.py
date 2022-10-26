
import json
from os import path, popen, mkdir

setttings_key = 'workbench.colorCustomizations'


# color palette: https://coolors.co/001219-e13a74-0425ba-005f73-0a9396-e9d8a6-ee9b00-ca6702-ae2012-ffffff
colors = {
    'Black': '001219',
    'Razzmatazz': 'e13a74',
    'Blue Pantone': '0425ba',
    'Blue Sapphire': '005f73',
    'Viridian Green': '0a9396',
    'Champagne': 'e9d8a6',
    'Gamboge (orange)': 'ee9b00',
    'Alloy Orange': 'ca6702',
    'Rufous': 'ae2012',
    'White': 'ffffff',
}


# considering how to choose font color intelligently
def white_text(key):
    color = colors[key]
    #print(color + ' ' + key)
    n = 2
    by_twos = [color[i:i+n] for i in range(0, len(color), n)]

    sum = 0
    for two in by_twos:
        #print('    ' + two)
        sum += int(two, base=16)
    #print("sum: " + str(sum))


def select_color():
    input = "\n".join(colors.keys())
    process = popen(f'echo "{input}" | fzf')
    selected =  process.read().strip()
    if not selected:
        print('pls pick a color')
        exit()
    return selected


selected = select_color()
vscode_dir = '.vscode'
settings_path = vscode_dir + '/settings.json'

if not path.isdir(vscode_dir):
    mkdir(vscode_dir)

if not path.isfile(settings_path):
    with open(settings_path, 'w') as f:
        f.write('{}')
        f.close()


settings = json.load(open(settings_path))
settings[setttings_key] = {
    "statusBar.background" : f"#{colors[selected]}"
}
with open(settings_path, "w") as f:
    json.dump(settings, f, indent=2)