# from selenium import webdriver

# browser = webdriver.Chrome() # 같은 경로일떄 = "./chromedriver.exe"

# browser.get("http://naver.com") # 크롬 웹드라이버 객체를 생성하고 이 url로 이동하는 작업.

"""
Windows PowerShell
PS D:\PythonGameSpace> python
Python 3.9.1 (tags/v3.9.1:1e5d33e, Dec  7 2020, 17:08:21) [MSC v.1927 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> from selenium import webdriver
>>> browser = webdriver.Chrome()

DevTools listening on ws://127.0.0.1:59062/devtools/browser/610e8b89-7321-44e3-8e9e-e58bb16e0153
>>> [8768:14208:0109/002947.632:ERROR:device_event_log_impl.cc(211)] [00:29:47.632] Bluetooth: bluetooth_adapter_winrt.cc:1073 Getting Default Adapter failed.t Adapter failed.
browser.get("http://naver.com")
>>> elem = browser.find_element_by_class_name("link_login")
>>> elem
<selenium.webdriver.remote.webelement.WebElement (session="00b55e68706743182385f9a67732d1df", element="8dae6c31-ae1d-480c-ab07-cfa5d4b8ecb4")>
>>> elem.click()
>>> browser.back()
>>> browser.forward()
>>> browser.refresh()
>>> browser.back()    
>>> elem = browser.find_element_by_id("query")
>>> elem
<selenium.webdriver.remote.webelement.WebElement (session="00b55e68706743182385f9a67732d1df", element="1cb1d093-51f4-40f8-8578-4a31b9c9744e")>
>>> from selenium.webdriver.common.keys import Keys
>>> elem.send_keys("나도코딩") 
>>> elem.send_keys(Keys.ENTER) 
>>> elem = browser.find_element_by_tag_name("a")
>>> elem
<selenium.webdriver.remote.webelement.WebElement (session="00b55e68706743182385f9a67732d1df", element="3e456e46-45ab-4cd4-8ca2-40afe268c8db")>
>>> elem = browser.find_elements_by_tag_name("a") 
>>> elem
[<selenium.webdriver.remote.webelement.WebElement (session="00b55e68706743182385f9a67732d1df", element="3e456e46-45ab-4cd4-8ca2-40afe268c8db")>, 
....................................................................................................
 <selenium.webdriver.remote.webelement.WebElement (session="00b55e68706743182385f9a67732d1df", element="e3726f2f-c458-46ee-a159-e863fff0b1ae")>]
>>> for e in elem:
...     elem.get_attribute("href")
...                            f")
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
AttributeError: 'list' object has no attribute 'get_attribute'
>>> for e in elem:
...     e.get_attribute("href"))))
... 
'https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=1&acr=2&acq=%EB%82%98%EB%8F%84%EC%BD%94%EB%94%A9&qdt=0&ie=utf8&query=%EB%82%98%EB%8F%84%EC%BD%94%EB%94%A9#lnb'
................................................................................................................
'https://www.navercorp.com/'
>>> browser.get("http://daum.net")
>>> elem = browser.find_element_by_name("q")
>>> elem
<selenium.webdriver.remote.webelement.WebElement (session="00b55e68706743182385f9a67732d1df", element="ec61a5e6-db48-4457-af1d-9de8513b307a")>
>>> elem.send_keys("나도코딩")
>>> elem.send_keys(Keys.ENTER)
>>> browser.back()
>>> elem = browser.find_element_by_name("q")
>>> elem.send_keys("나도코딩")
>>> elem = browser.find_element_by_xpath("//*[@id='daumSearch']/fieldset/div/div/button[2]")  
>>> elem.click()
>>> browser.quit()
>>> exit()
PS D:\PythonGameSpace> 
"""

import time
from selenium import webdriver

browser = webdriver.Chrome() # 같은 경로일떄 = "./chromedriver.exe"

# 1. 네이버 이동
browser.get("http://naver.com") # 크롬 웹드라이버 객체를 생성하고 이 url로 이동하는 작업.

# 2. 로그인 버튼 클릭
elem = browser.find_element_by_class_name("link_login")
elem.click()

# 3. id, pw 입력
browser.find_element_by_id("id").send_keys("naver_id")
browser.find_element_by_id("pw").send_keys("password")

# 4. 로그인 버튼 클릭
browser.find_element_by_id("log.login").click()

time.sleep(3)

# 5. id를 새로 입력
#browser.find_element_by_id("id").send_keys("my_id")
browser.find_element_by_id("id").clear()
browser.find_element_by_id("id").send_keys("my_id")

# 6. html정보 출력
print(browser.page_source)

# 7. 브라우저 종료
# browser.close() # 현재 탭만 종료
browser.quit() # 전체 브라우저 종료