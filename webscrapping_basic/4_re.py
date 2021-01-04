# 주민등록번호
# 901201-1111111
# abcdef-1111111   X

# 이메일 주소 
# nadocoding@gmail.com  
# nadocoding@gmail@gmain.com  X

#차량번호
# 11가 1234
# 123가 1234

# ip주소
# 192.168.0.1
# 1000.2000.3000.4000  X

import re
# abcd, book, desk
# ca?e => care, cafe, case, cave, , , 
# caae, cabe, cace, cade, , , 

# p = 패턴 어떤 정규식을 컴파일 할 지 정해주는것. 
p = re.compile("ca.e") 
# . (ca.e): 하나의 문자를 의미 > care, cafe, case (O) | caffe (X)  무조건 한글자!
# ^ (^de) : 문자열의 시작 > desk, destination (O) | fade (X)
# $ (se$) : 문자열의 끝 > case, base (O) | face (X)

def print_match(m):
    if m:
        print("m.group() : ", m.group()) # 일치하는 문자열 반환
        print("m.string : ", m.string) # 입력받은 문자열, 함수가 아닌 변수! 
        print("m.start() : ", m.start()) # 일치하는 문자열의 시작 index
        print("m.end() : ", m.end()) # 일치하는 문자열의 끝 index
        print("m.span() : ", m.span()) # 일치하는 문자열의 시작 / 끝 index
    else:
        print("매칭되지 않음")

# m = p.match("careless") # match : 주어진 문자열의 처음부터 일치하는지 확인
# print_match(m)
# print(m.group()) # 매치되지 않으면 에러가 발생

# m = p.search("good care") # search : 주어진 문자열 중에 일치하는게 있는지 확인
# print_match(m)

# lst = p.findall("good care cafe ") # findall : 일치하는 모든 것을 리스트 형태로 반환
# print(lst)

"""
# 1. p = re.compile("원하는 형태")
# 2. m = p.match("비교할 문자열") : 주어진 문자열의 처음부터 일치하는지 확인
# 3. m = p.search("비교할 문자열") : 주어진 문자열 중에 일치하는게 있는지 확인
# 4. lst = p.findall("비교할 문자열") :  일치하는 모든 것을 리스트 형태로 반환

#원하는 형태 : 정규식
# . (ca.e): 하나의 문자를 의미 > care, cafe, case (O) | caffe (X)  무조건 한글자!
# ^ (^de) : 문자열의 시작 > desk, destination (O) | fade (X)
# $ (se$) : 문자열의 끝 > case, base (O) | face (X)

"""