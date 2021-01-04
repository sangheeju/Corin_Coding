import pygame

pygame.init() # 초기화(반드시 필요)

# 화면 크기 설정
screen_width = 480 # 가로 크기
screen_height = 640 # 세로 크기
screen = pygame.display.set_mode((screen_width, screen_height))

# 화면 타이틀 설정
pygame.display.set_caption("Nyanya Game") # 게임 이름

# 배경 이미지 불러오기
background = pygame.image.load("D:/PythonGameSpace/pygame_basic/background.png")

# 이벤트 루프가 실행되고 있어야 꺼지지 않음!
# 이벤트 루프
running = True # 게임이 진행중인가?
while running:
    for event in pygame.event.get(): # 어떤 이벤트가 발생 하였는가?
        if event.type == pygame.QUIT: # 창이 닫히는 이벤트가 발생 하였는가? 
            running = False # 게임이 진행중이 아님
    # 배경 이미지를 색으로 넣어주기
    # screen.fill((0, 0, 255))
    
    # background image를 blit으로 그려줌
    screen.blit(background,(0,0))  # 배경 그리기

    # 매 프레임마다 화면을 새로 그려주는 동작을 해야함! while에서 계속 돌면서 계속 그려줌.
    pygame.display.update() # 게임 화면을 다시 그리기!


# pygame 종료

pygame.quit()