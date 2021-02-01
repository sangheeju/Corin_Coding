import requests
from bs4 import BeautifulSoup


for year in range(2015, 2020):
    url = "https://search.daum.net/search?w=tot&q={}%EB%85%84%EC%98%81%ED%99%94%EC%88%9C%EC%9C%84&DA=MOR&rtmaxcoll=MOR".format(year)
    res = requests.get(url)
    res.raise_for_status()

    soup = BeautifulSoup(res.text,"lxml")

    images = soup.find_all("img", attrs={"class":"thumb_img"})

    for idx, image in enumerate(images):

        # print(image["src"])
        image_url = image["src"]
        if image_url.startswith("//"):
            image_url = "https:"+ image_url
        print(image_url)
        image_res = requests.get(image_url)
        image_res.raise_for_status()

        # with open("파일이름{}.확장자".format(증수), "wb글자가 아닌데이터라binery") as f:
        with open("movie_{}_{}.jpg".format(year, idx+1), "wb") as f:
            f.write(image_res.content) # 이미지가 가지고 있는 컨텐츠(=이미지) 정보를 파일로 쓰는것
        if idx >= 4: #상위 5개 이미지까지만 다운로드
            break