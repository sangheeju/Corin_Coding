import requests
# res = requests.get("http://google.com")
res = requests.get("https://news.daum.net")
# res = requests.get("http://nadocoding.tistory.com")
# res = requests.get("http://corincoding.tistory.com")
res.raise_for_status()

# print("응답코드 : ", res.status_code) # 200 이면 정상

# if res.status_code == requests.codes.ok:
#     print("정상입니다")
# else:
#     print("문제가 생겼습니다. [에러코드", res.status_code, "]")

#올바로 코드를 가져왔으면 문제 없고 아니면 에러
# res.raise_for_status()
# print("웹 스크래핑을 진행합니다.")

print(len(res.text))
# print(res.text)

# w = 쓰기모드
# with open("mygoogle.html", "w", encoding="utf8") as f:
#     f.write(res.text)