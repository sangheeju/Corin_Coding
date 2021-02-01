import re
import requests
from bs4 import BeautifulSoup

def create_soup(url):
    # headers = {"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36"}
    res = requests.get(url)
    res.raise_for_status()
    soup = BeautifulSoup(res.text, "lxml")
    return soup

def print_news(index, title , link):
    print("{}. {}".format(index+1, title))
    print("  (링크 : {})".format(link))

# [오늘의 날씨]
def scrape_weather():
    print("[오늘의 날씨]")
    url = "https://search.naver.com/search.naver?where=nexearch&sm=top_sug.asiw&fbm=0&acr=1&acq=tndnjs+&qdt=0&ie=utf8&query=%EC%88%98%EC%9B%90+%EB%82%A0%EC%94%A8"
    soup = create_soup(url)
    # 흐림, 어제보다 00 높아요
    cast = soup.find("p", attrs={"class":"cast_txt"}).get_text()
    # 현재 00 (최저 00 / 최고 00)
    curr_temp = soup.find("p", attrs={"class": "info_temperature"}).get_text().replace("도씨","") #현재 온도
    min_temp = soup.find("span", attrs={"class":"min"}).get_text() #최저 온도
    max_temp = soup.find("span", attrs={"class":"max"}).get_text() #최고 온도
    # 오전 강수확률 00% / 오후 강수 확률 00%
    morning_rain_rate = soup.find("span", attrs={"class":"point_time morning"}).get_text().strip() #오전 강수 확률
    afternoon_rain_rate = soup.find("span", attrs={"class":"point_time afternoon"}).get_text().strip() #오후 강수 확률

    dust  = soup.find("dl", attrs={"class": "indicator"}) # 모든 조건에 해당하는 정보! 
    # test  = soup.find("dl", attrs={"class": ["indicator", "dust"]}) 클래스가 두개일 경우에는 리스트로!
    # test  = soup.find("dl", attrs={"class": "indicator", "id":"dust"}) 클래스랑 아이디 처럼 다른 속성도 같이 비교할때는 dictionary형식
    # test  = soup.find("dl", attrs={"class": "indicator"}, text=["미세먼지", "초미세먼지"]) 요청 클래스 값이면서 text값이 1이거나 2인 element를 찾아줌.
    # 미세먼지 00 좋음
    pm10 = dust.find_all("dd")[0].get_text() # 미세먼지
    # 초미세먼지 00 보통
    pm25 = dust.find_all("dd")[1].get_text() # 초미세먼지


    #출력
    print(cast)
    print("현재 {} (최저 {} / 최고 {})".format(curr_temp, min_temp, max_temp))
    print("오전 {} / 오후 {}".format(morning_rain_rate, afternoon_rain_rate))
    print()
    print("미세먼지 {}".format(pm10))
    print("초미세먼지 {}".format(pm25))
    print()

# [헤드라인 뉴스]
def scrape_headline_news():
    print("[헤드라인 뉴스]")
    url = "https://news.daum.net"
    soup = create_soup(url)
    # news_list = soup.find("ul", attrs={"class":"hdline_article_list"}).find_all("li", limit=3)
    # for index, news in enumerate(news_list):
    #     # title = news.div.a.get_text()
    #     title = news.find("a").get_text().strip()
    #     link = url + news.find("a")["href"]
    #     print("{}. {}".format(index+1, title))
    #     print("  링크 : {}".format(link))
    # print()
    news_list = soup.find("ol", attrs={"class":"list_popcmt"}).find_all("li", limit=3)
    for index, news in enumerate(news_list):
        title = news.find("a").get_text().replace(str(index+1)+" 위","").strip()
        link = news.find("a")["href"]
        print_news(index, title, link)
    print()

# [IT 뉴스]
def scrape_it_news():
    print("[IT 뉴스]")
    url = "https://news.daum.net/digital#1"
    soup = create_soup(url)
    news_list = soup.find("ul", attrs={"class":"list_mainnews"}).find_all("li",limit=3) # 3개까지
    for index, news in enumerate(news_list):
        # a_idx = 0
        # img = news.find("img")
        # if img: 
        #     a_idx = 1 # img 태그가 있으면 1번째 a 태그의 정보를 사용
        # a_tag = news.find_all("a")[a_idx]
        # title = a_tag.get_text().strip
        title = news.find("strong").get_text().strip()
        # link = a_tag["href"]
        link = news.find("a")["href"]
        print_news(index, title, link)
    print()

def scrape_english():
    print("[오늘의 영어 회화]")
    url = "https://www.hackers.co.kr/?c=s_eng/eng_contents/I_others_english&keywd=haceng_submain_lnb_eng_I_others_english&logger_kw=haceng_submain_lnb_eng_I_others_english"
    soup = create_soup(url)
    sentences = soup.find_all("div", attrs={"id":re.compile("^conv_kor_t")}) # ""로 시작^하는 값을 가지는 id
    print("(영어지문)")
    for sentence in sentences[len(sentences)//2:]: # 8문장이 있다고 가정할 때, index 기준 4~7까지 잘라서 가져옴
        print(sentence.get_text().strip())
    print()
    print("(한글지문)")
    for sentence in sentences[:len(sentences)//2]: # 8문장이 있다고 가정할 때, index 기준 0~3까지 잘라서 가져옴
        print(sentence.get_text().strip())
    print()


if __name__ == "__main__":
    scrape_weather() # 오늘의 날씨 정보 가져오기
    scrape_headline_news() # 헤드라인 뉴스 가져오기
    scrape_it_news() # IT 뉴스 정보 가져오기
    scrape_english() # 오늘의 영어 회화 가져오기