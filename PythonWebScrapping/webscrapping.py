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