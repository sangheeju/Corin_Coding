# lst = [1, 2, 3, 4, 5]
# print(lst)
# lst.reverse() # reverse()를 하면 실제로 순서를 뒤바꿈!! 
# print(lst)

# lst2 = [1, 2, 3, 4, 5]
# print("리스트 2 뒤집기 전 : ",lst2)

# lst3 = reversed(lst2) # reversed()를 하면 바뀐 새로운 값을 던져 주는것, 그래서 실제 값에는 영향을 미치지 않음
# print("리스트 2 뒤집은 후 : ",lst2)
# print("리스트3 : ",list(lst3))


kor = ["사과", "바나나", "오렌지"]
eng = ["apple", "banana", "orange"]

print(list(zip(kor, eng)))

mixed =[('사과', 'apple'), ('바나나', 'banana'), ('오렌지', 'orange')]
print(list(zip(*mixed))) # unzip = 값 앞에 * 붙이기! 

kor2, eng2 = zip(*mixed)
print(kor2)
print(eng2)