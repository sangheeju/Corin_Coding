# 키보드 모듈
# 키 입력을 하면 값을 낚아챔 -> 특정키에 따른 키 값을 받아서 처리 할 수 있는것. hooking??

import time
import keyboard
from PIL import ImageGrab

def screenshot():
    # 2020년 6월 1일 10시 20분 30초 -> _20200601_102030
    curr_time = time.strftime("_%Y%m%d_%H%M%S")
    img = ImageGrab.grab(bbox=(925, 65, 1440, 951))
    img.save("image{}.png".format(curr_time)) # image__20200601_102030.png
    

# keyboard.add_hotkey("F9", screenshot) # 사용자가 'F9' 키를 누르면 스크린 샷 저장
keyboard.add_hotkey("ctrl+a", screenshot) # 사용자가 'a' 키를 누르면 스크린 샷 저장
# keyboard.add_hotkey("ctrl+shift+s", screenshot) # 사용자가 'ctrl+shift+s' 키를 누르면 스크린 샷 저장

keyboard.wait("esc") # 사용자가 esc를 누를 때까지 프로그램 수행

# 925, 65 px ~ 1440, 951 # 캡쳐하려는 위치 정보 (left_x, top_y, right_x, bottom_y)