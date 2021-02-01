from selenium import webdriver

options = webdriver.ChromeOptions() 
options.headless = True 
options.add_argument("window-size=1920x1080")
options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36")

browser = webdriver.Chrome(options=options)
browser.maximize_window()

url = "https://www.whatismybrowser.com/detect/what-is-my-user-agent"
browser.get(url)

detected_value = browser.find_element_by_id("detected_value")
print(detected_value.text)
browser.quit()

# Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36
# Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/87.0.4280.88 Safari/537.36

# XPath =  element의 경로
# 특징(id, class, text) ->   //*[@id="search_btn"]

# 정규식 = 규칙을 가진 문자열을 표현하는 식
# .(ca.e) 하나의 문자
# ^(^de)  문자열의 시작
# $(se$)  문자열의 끝
# match()   처음부터 일치하는지
# search()  일치하는게 있는지
# findall() 일치하는 것 모두 리스트로

# ** -->> html문서를 가져오는 방법 
# * Requests = 웹페이지(html) 읽어오기, 빠르다, 동적 웹페이지 X
# -> 주어진 url을 통해 받아온 html에 원하는 정보가 있을때 사용,  res.raise_for_status()  = 문제 없죠?
# * Selenium = 웹페이지 자동화, 느리다, 동적 웹페이지 O
# -> 로그인, 어떤 결과에 대한 필터링 등 어떤 동작을 해야하는 경우 ** 크롬 버전에 맞는 chromedriver.exe가 반드시 있어야함
# -> find_element(s)_by_id / find_element(s)_by_class_name / find_element(s)_by_link_text / find_element(s)_by_xpath ~로 찾기
# -> click()  /  send_keys()  / clear()
# 때로는 기다려 주세요 :(
# try: 
#   elem = WebDriverWait(brower,10).until(EC.presence_of_element_located((By.XPATH,"//*[@id='content']"))) 
#   성공했을때 동작 pass
# finally:
#   browser.quit()
# 스크롤을 내려주세요
# import time
# interval = 2 # 2초에 한번씩 스크롤 내림
# prev_height = browser.execute_script("return document.body.scrollHeight") # 현재 문서 높이를 가져와서 저장
# while True: # 반복수행
# browser.execute_script("window.scrollTo(0, document.body.scrollHeight)") # 스크롤을 가장 아래로 내림
# time.sleep(interval) # 페이지 로딩 대기
# curr_height = browser.execute_script("return document.body.scrollHeight") # 현재 문서 높이를 가져와서 저장
# if curr_height == prev_height:  
#   break
#   prev_height = curr_height

# ** -->> 가져온 데이터를 BeautifulSoup = 원하는 데이터 추출(웹 스크래핑)
# find =조건에 맞는 첫번째 element / find_all = 조건에 맞는 모든 element를 리스트로 / find_next_sibling(s) = 다음 형제 찾기 / find_previous_sibling(s) = 이전 형제 찾기
# soup["href"] 속성 / soup.get_text() 텍스트
# * with open("파일명","wb") as f:  # 이미지 다운로드 
#   f.write(res.content)
# * import csv # 엑셀로 저장
# f = open(filename, "w", encoding="utf-8-sig",newline="") 
# Headless Chrome : 브라우저를 띄우지 않고 동작, 때로는 user-Agent정의 필요, 버전 59부터 가능.

##### 막 쓰면 안돼요!!
# 무분별한 웹 크롤링 / 웹 스크래핑은 대상 서버에 부하 -> 계정 / ip차단
# 데이터 사용 주의 -> 이미지, 텍스트 등 데이터 무단 활용 시 저작권 등 치해 요소, 법적 제재
# robots.txt -> 법적 효력 X, 대상 사이트의 권고