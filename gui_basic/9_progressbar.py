import tkinter.ttk as ttk
from tkinter import *
import time

root = Tk()
root.title("GUI Editer")
root.geometry("640x480") # 가로 * 세로

# maximum=100 %  indeterminate 결정되지 않아 언제 끝날지 모르는 작업
# progressbar = ttk.Progressbar(root, maximum=100, mode="indeterminate")
# progressbar = ttk.Progressbar(root, maximum=100, mode="determinate")
# progressbar.start(10) # 10 ms마다 움직임
# progressbar.pack()

# def btncmd():
#     progressbar.stop() # 작동 중지 (중지되고 사라짐)



# btn = Button(root, text="중지", command=btncmd)
# btn.pack()


p_var2 = DoubleVar()
progressbar2 = ttk.Progressbar(root, maximum=100, length=150, variable=p_var2)
progressbar2.pack()

def btncmd2():
    for i in range(1, 101): # 1~ 100
        time.sleep(0.01) # 0.01초 대기

        p_var2.set(i) # progress bar 의 값 설정
        progressbar2.update() # ui 업데이트
        print(p_var2.get())

btn = Button(root, text="시작", command=btncmd2)
btn.pack()


root.mainloop()