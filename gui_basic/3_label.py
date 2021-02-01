from tkinter import *

root = Tk()
root.title("GUI Editer")
root.geometry("640x480") # 가로 * 세로

# label 은 글자나 이미지를 보여줌

label1 = Label(root, text="안녕하세요")
label1.pack()

photo = PhotoImage(file="gui_basic/img.png")
label2 = Label(root, image=photo)
label2.pack()


def change():
    label1.config(text="또 만나요")

    global photo2 # global 전역변수로 지정. 함수가 끝나도 없어지지 않음 
    photo2 = PhotoImage(file="gui_basic/img2.png")
    label2.config(image=photo2)

btn = Button(root, text="클릭", command=change)
btn.pack()


root.mainloop()