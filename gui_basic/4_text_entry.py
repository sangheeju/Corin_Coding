from tkinter import *

root = Tk()
root.title("GUI Editer")
root.geometry("640x480") # 가로 * 세로

txt = Text(root, width=30, height=5) # 텍스트 위젯 생성
txt.pack()
txt.insert(END, "글자를 입력하세요")

e = Entry(root, width=30)
e.pack()
# 값이 비어 있을때에는 0(처음 위치에 기본값 입력) 대신 END를 써도 동일
e.insert(0, "한 줄만 입력해요") 

def btncmd():
    # 내용 출력
    # 라인 1부터 column기준으로 0번째 위치부터 가져오라.
    print(txt.get("1.0", END)) # 1: 첫번째 라인, 0: 0번째 column 위치
    print(e.get())

    # 내용 삭제
    txt.delete("1.0", END)
    e.delete(0, END)

btn = Button(root, text="클릭", command=btncmd)
btn.pack()

root.mainloop()