"""
Quiz) 부동산 매물(송파 헬리오시티) 정보를 스크래핑 하는 프로그램을 만드시오
[조회조건]
1. http://daum.net 접속
2. '송파 헬리오시티' 검색
3. 다음 부동산 부분에 나오는 결과 정보

[출력 결과]
========== 매물 1 ==========
거래 : 매매
면적 : 84/59 (공급/전용)
가격 : 165,000 (만원)
동 : 214동
층 : 고/23
========== 매물 2 ==========
...

[주의 사항]
- 실습하는 시점에 위 매물이 없다면 다른 곳으로 대체 가능

"""

from selenium import webdriver
import time
from bs4 import BeautifulSoup

options = webdriver.ChromeOptions() 
options.headless = True 
options.add_argument("window-size=1920x1080")

browser = webdriver.Chrome(options=options)
browser.maximize_window()

url = "https://www.daum.net/"
browser.get(url)

browser.find_element_by_class_name("tf_keyword").send_keys("송파 헬리오시티")
browser.find_element_by_xpath("//*[@id='daumSearch']/fieldset/div/div/button[2]").click()

time.sleep(1)

browser.execute_script("window.scrollTo(0,1080)")

soup = BeautifulSoup(browser.page_source, "lxml")

data_rows = soup.find("table", attrs={"class":"tbl"}).find("tbody").find_all("tr")

for idx, row in enumerate(data_rows):
    
    column = row.find_all("td")
    print("========== 매물 {} ==========".format(idx+1))
    print("거래 : ", column[0].get_text().strip())
    print("면적 : ", column[1].get_text().strip(),"(공급/전용)")
    print("가격 : ", column[2].get_text().strip(),"(만원)")
    print("동 : ", column[3].get_text().strip())
    print("층 : ", column[4].get_text().strip())

browser.quit()