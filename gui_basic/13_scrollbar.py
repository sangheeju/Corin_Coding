from tkinter import *

root = Tk()
root.title("GUI Editer")
root.geometry("640x480") # 가로 * 세로

frame = Frame(root)
frame.pack()

scrollbar = Scrollbar(frame)
scrollbar.pack(side="right", fill="y")

# set이 없으면 스크롤을 내려도 다시 올라옴
listbox = Listbox(frame, selectmode="extended", height= 10, yscrollcommand = scrollbar.set) # 리스트박스에 스크롤바를 맵핑
for i in range(1, 32): # 1~ 31일
    listbox.insert(END, str(i)+"일") # 1일, 2일, . . .
listbox.pack(side="left")

# 스크롤바에도 리스트박스를 맵핑해줘야 서로의 값에 대응하여 이동
scrollbar.config(command=listbox.yview) 

root.mainloop()