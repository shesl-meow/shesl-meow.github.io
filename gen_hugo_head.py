import re
import os
import sys
import datetime

name_2_date_index = {}

def gen_name_2_date():
    output = open("name_2_date", "a")
    curr_path = os.path.abspath("./")
    for dirpath, dnames, fnames in os.walk(curr_path):
        for fname in fnames:
            filename = dirpath + "/" + fname
            filedate = os.popen(f"git log --follow --format=%ad --date iso-strict \"{filename}\" | tail -1").read().strip()
            index = "/".join(filename.split('/')[-2:])
            output.write(f"{index}\n{filedate}\n")
    output.close()


def load_name_2_date():
    global name_2_date_index
    input = open("name_2_date", "r")
    name = None
    for line in input:
        if not name:
            name = line.strip().split("/")
            if len(name) != 2:
                name = None
            continue
        if len(line.strip()) == 0:
            name = None
            continue
        if not name[1] in name_2_date_index:
            name_2_date_index[name[1]] = {}
        if not name[0] in name_2_date_index[name[1]]:
            name_2_date_index[name[1]][name[0]] = line.strip()
        else:
            old = datetime.datetime.fromisoformat(name_2_date_index[name[1]][name[0]])
            new = datetime.datetime.fromisoformat(line.strip())
            if new < old:
                name_2_date_index[name[1]][name[0]] = line.strip()
        name = None
    input.close()


def parse_file(filename):
    global name_2_date_index
    if filename.endswith("_index.md") or filename.endswith("README.md"):
        print(f"skip file: {filename}") 
        return
    filename = os.path.abspath(filename)
    rf = open(filename, "r")
    input = rf.read()
    rf.close()
    if input.startswith("---"):
        print(f"skip file: {filename}")
        return

    print(f"start parse: {filename}")
    filepath = filename.split("/")
    title = filepath[-1]
    body = input
    tags = []
    categories = []
    filedate = datetime.datetime.now().astimezone().replace(microsecond=0).isoformat()

    if 'content' in filepath:
        ct_ind = filepath.index('content')
        tags = filepath[(ct_ind + 4):-1]
        categories = filepath[ct_ind + 2: ct_ind + 4]
        tags = [tag for tag in tags if not re.match(r"^[0-9]*$", tag)]
        tags = [tag.split('.')[1] if re.match(r"[0-9]*\..*", tag) else tag for tag in tags]
        categories = [category for category in categories if '.' not in category]

    z = re.match(r"([^#]*\n)?# (.*)\n((.|\n)*)", input)
    if z is not None:
        title = z[2]
        body = (z[1] or "") + z[3]

    if filepath[-1] in name_2_date_index:
        index = name_2_date_index[filepath[-1]]
        if filepath[-2] in index:
            filedate = index[filepath[-2]]
        else:
            filedate = list(index.values())[0]
    
    output = f"""\
---
title: "{title}"
date: {filedate}
tags: [""]
categories: ["{'", "'.join(categories)}"]
---

{body}
"""
    wf = open(filename, "w")
    wf.write(output)
    wf.close()
    print(f"parsed file: {filename}")


def iterate_parse_file(dirpath):
    for dirpath, dnames, fnames in os.walk(dirpath):
        for fname in fnames:
            if fname.endswith(".md"):
                filename = dirpath + "/" + fname
                parse_file(filename)


if __name__ == "__main__":
    if sys.argv[1] == "gen_index":
        gen_name_2_date()
    else:
        load_name_2_date()
        iterate_parse_file(sys.argv[1])
