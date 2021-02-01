from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC



browser = webdriver.Chrome()
browser.maximize_window() # 창 최대화

url = "https://flight.naver.com/flights/"
browser.get(url) # url 로 이동

# 가는날 선택 클릭
browser.find_element_by_link_text("가는날 선택").click()

# 이번달 27일, 28일 선택
# browser.find_elements_by_link_text("27")[0].click()  # [0] -> 이번달
# browser.find_elements_by_link_text("28")[0].click()  # [0] -> 이번달

# 다음달 27일, 28일 선택
# browser.find_elements_by_link_text("27")[1].click()  # [1] -> 다음달
# browser.find_elements_by_link_text("28")[1].click()  # [1] -> 다음달

# 이번달 27일, 다음달 28일 선택
browser.find_elements_by_link_text("27")[0].click()  # [0] -> 이번달
browser.find_elements_by_link_text("28")[1].click()  # [1] -> 다음달

# 제주도 선택
browser.find_element_by_xpath("//*[@id='recommendationList']/ul/li[1]").click()

# 항공권 검색 클릭
browser.find_element_by_link_text("항공권 검색").click()

# 웹드라이버 웨이트를 통해 (최대) 10초 대기, 10초 안에 뭔가 나오면 진행하는데 EC조건인 XPATH값에 해당하는 element가 나올때까지 대기
# 브라우저를 최대 10초까지 대기하는데 xpath(ID, CLASS_NAME, LINK_TEXT 등)기준으로, 저 값에 해당하는 element가 나올때 까지
# 10초 초과하면 에러가 나고 끝남
try :
    elem = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.XPATH, "//*[@id='content']/div[2]/div/div[4]/ul/li[1]")))
    # 성공했을 때 동작 수행
    print(elem.text) # 첫번째 결과 출력
finally:
    browser.quit()

# 첫번째 결과 출력
# elem = browser.find_element_by_xpath("//*[@id='content']/div[2]/div/div[4]/ul/li[1]")
# print(elem.text)