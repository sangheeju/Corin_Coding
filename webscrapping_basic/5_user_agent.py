import requests
res = requests.get("https://github.com/seong6732/Korogom.git")
res.raise_for_status()

# with open("nadocoding.html", "w", encoding="utf8") as f:
#     f.write(res.text)