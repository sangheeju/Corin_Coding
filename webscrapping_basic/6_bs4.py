
import requests
from bs4 import BeautifulSoup

url = "https://comic.naver.com/webtoon/weekday.nhn"
res = requests.get(url)
res.raise_for_status()

# html문서를 lxml 파서?를 통해서 BeautifulSoup 객체로 만듬. soup이 모든 정보를 가지고있음.
soup = BeautifulSoup(res.text, "lxml")
#print(soup.title)
#print(soup.title.get_text())
#print(soup.a) # soup객체에서 처음 발견되는 a element 출력
# print(soup.a.attrs) # a element의 속성 정보를 출력 dictionary형태로 가져옴
# print(soup.a["href"]) # a element의 herf 속성 '값' 정보를 출력

#find("태그명", 조건)함수
# 숩 객체내에 있는 모든 내용 중 a태그에 해당하는데 class 속성(attrs)이 Nbtn_upload인것만 찾기
#print(soup.find("a", attrs={"class":"Nbtn_upload"})) # class="Nbtn_upload"인 a element를 찾아줘

# a인지 div인지 명시해주면 더 정확
# print(soup.find(attrs={"class":"Nbtn_upload"}))  #  class="Nbtn_upload"인 어떤 element를 찾아줘

#print(soup.find("li", attrs={"class":"rank01"}))
# rank1 = soup.find("li", attrs={"class":"rank01"})
# print(rank1.a)

#print(rank1.a.get_text())
#print(rank1.next_sibling)
#print(rank1.next_sibling.next_sibling) # 줄바꿈(개행)이 있는경우 두번~

# rank2 = rank1.next_sibling.next_sibling
# rank3 = rank2.next_sibling.next_sibling
# print(rank3.a.get_text())
# rank2 = rank3.previous_sibling.previous_sibling
# print(rank2.a.get_text())

# print(rank1.parent) #부모 element에 접근

# find_next_sibling()다음 sibling을 찾는데 ()조건안에 있는 것을 찾음
# rank2 = rank1.find_next_sibling("li")
# print(rank2.a.get_text())
# rank3 = rank2.find_next_sibling("li")
# print(rank3.a.get_text())
# rank2 = rank3.find_previous_sibling("li")
# print(rank2.a.get_text())

# print(rank1.find_next_siblings("li"))


webtoon = soup.find("a", text="독립일기-54화 변기 막혔다")
print(webtoon)