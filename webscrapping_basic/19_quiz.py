# ========== 매물 1 ==========
# 거래 : 매매
# 면적 : 84/59 (공급/전용)
# 가격 : 165,000 (만원)
# 동 : 214동
# 층 : 고/23
# ========== 매물 2 ==========

import requests
from bs4 import BeautifulSoup

url = "https://search.daum.net/search?w=tot&DA=UME&t__nil_searchbox=suggest&sug=&sugo=15&sq=%EC%86%A1%ED%8C%8C+%ED%97%AC%EB%A6%AC%EC%98%A4%EC%8B%9C%ED%8B%B0&o=2&q=%EC%86%A1%ED%8C%8C+%ED%97%AC%EB%A6%AC%EC%98%A4%EC%8B%9C%ED%8B%B0"
res = requests.get(url)
res.raise_for_status()

soup = BeautifulSoup(res.text, "lxml")

# 파일 저장해서 가져올 수 있으면 request로 바로 사용 가능
# with open("quiz.html", "w", encoding="utf8") as f:
#     f.write(soup.prettify())

# table = soup.find("table", attrs={"class":"tbl"})
data_rows = soup.find("table", attrs={"class":"tbl"}).find("tbody").find_all("tr")  # 테이블 밑에서 tbody를 찾아서 모든 tr을 가져와서 data_rows에 넣음

for idx, row in enumerate(data_rows):
    column = row.find_all("td")
    print("========== 매물 {} ==========".format(idx+1))
    print("거래 : ", column[0].get_text().strip())
    print("면적 : ", column[1].get_text().strip(),"(공급/전용)")
    print("가격 : ", column[2].get_text().strip(),"(만원)")
    print("동 : ", column[3].get_text().strip())
    print("층 : ", column[4].get_text().strip())