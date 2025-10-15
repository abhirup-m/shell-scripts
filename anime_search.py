#!/bin/python
import sys
import requests as rq
from bs4 import BeautifulSoup as bs


def search(name, cat):
    page = rq.get("https://myanimelist.net/anime.php?q={}&cat={}".format(name, cat))
    soup = bs(page.content, features="lxml")
    for title in soup.findAll("strong")[0:10]:
        link = title.findPrevious("a")["href"]
        typ = title.findNext("td", {"class": "borderClass ac bgColor0"})
        epi = typ.findNext("td", {"class": "borderClass ac bgColor0"})
        score = epi.findNext("td", {"class": "borderClass ac bgColor0"})
        print(title.text.strip(), end="\t")
        print("Episodes:", epi.text.strip(), end="\t")
        print("Score:", score.text.strip(), end="\t")
        print("Type:", typ.text.strip())
        print("Link:", link.strip())
        print()
    page = rq.get("https://myanimelist.net/manga.php?q={}&cat={}".format(name, cat))
    soup = bs(page.content, features="lxml")
    for title in soup.findAll("strong")[0:10]:
        link = title.findPrevious("a")["href"]
        typ = title.findNext("td", {"class": "borderClass ac bgColor0"})
        epi = typ.findNext("td", {"class": "borderClass ac bgColor0"})
        score = epi.findNext("td", {"class": "borderClass ac bgColor0"})
        print(title.text.strip(), end="\t")
        print("Episodes:", epi.text.strip(), end="\t")
        print("Score:", score.text.strip(), end="\t")
        print("Type:", typ.text.strip())
        print("Link:", link.strip())
        print()


n = len(sys.argv)
cat = ""
if n == 1:
    print(
        "USAGE: python <search keyword> [category]\nCategory = anime(an)/manga(ma)/all(al)"
    )
    quit()
elif n == 2:
    name = sys.argv[1]
elif n == 3:
    name = sys.argv[1]
    cat = sys.argv[2]
    if cat == "anime" or cat == "an":
        cat = "anime"
    elif cat == "manga" or cat == "ma":
        cat = "manga"
    elif cat == "all" or cat == "al":
        cat = "all"
    else:
        print("Invalid category")
        quit()
else:
    quit()

search(name, cat)
