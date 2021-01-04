"""
Quiz) 하늘에서 떨어지는 똥 피하기 게임을 만드시오

[게임 조건]
1. 캐릭터는 화면 가장 아래에 위치, 좌우로만 이동 가능
2. 똥은 화면 가장 위에서 떨어짐. x 좌표는 매번 랜덤으로 설정
3. 캐릭터가 똥을 피하면 다음 똥이 다시 떨어짐
4. 캐릭터가 똥과 충돌하면 게임 종료
5. FPS는 30으로 고정

[게임 이미지]
1. 배경 : 640 * 480 (세로 * 가로) - background.png
2. 캐릭터 : 70 * 70 - character.png
3. 똥 : 70 * 70 - enemy.png

"""

import pygame
#####################################################
# 기본 초기화 (반드시 해야 하는 것들)
pygame.init() 

# 화면 크기 설정
screen_width = 480 # 가로 크기
screen_height = 640 # 세로 크기
screen = pygame.display.set_mode((screen_width, screen_height))

# 화면 타이틀 설정
pygame.display.set_caption("하늘에서 떨어지는 똥 피하기 게임") # 게임 이름

# FPS
clock = pygame.time.Clock()
#####################################################

# 1. 사용자 게임 초기화 (배경화면, 게임 이미지, 좌표, 속도,  폰트 등)
# 1-1. 배경화면 불러오기
background = pygame.image.load("D:/PythonGameSpace/pygame_basic/background.jpg")
# 1-2. 캐릭터 불러오기
character = pygame.image.load("D:/PythonGameSpace/pygame_basic/dog.png")
character_size = character.get_rect().size
character_width = character_size[0]
character_height = character_size[1]
character_x_pos = (screen_width / 2 ) - (character_width / 2)
character_y_pos = screen_height - character_height

# 1-3. 캐릭터가 이동할 좌표
to_x = 0
to_y = 0

# 1-4. 캐릭터 이동 속도
character_speed = 0.6

# 1-5. 적
enemy = pygame.image.load("D:/PythonGameSpace/pygame_basic/ddong.png")
enemy_size = enemy.get_rect().size
enemy_width = enemy_size[0]
enemy_height = enemy_size[1]
enemy_x_pos = (screen_width / 2) - (enemy_width / 2)
enemy_y_pos = 0

# 1-6. 적이 이동할 좌표
# e_to_x = 0
e_to_y = 0

# 1-7. 적 이동 속도
enemy_speed = 0.5

# 1-8. 폰트 정의
game_font = pygame.font.Font(None, 40)

# 1-9. 총 시간
total_time = 60

# 1-10. 시작 시간 정보
start_tick = pygame.time.get_ticks()


running = True 
while running:
    dt = clock.tick(30) 

    # 2. 이벤트 처리 (키보드, 마우스 등)
    for event in pygame.event.get():
        if event.type == pygame.QUIT:  
            running = False 
        
        # 2-1. 키 확인 및 캐릭터 이동
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                to_x -= character_speed
            elif event.key == pygame.K_RIGHT:
                to_x += character_speed
        
        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                to_x = 0
    
    # 3. 게임 케릭터 위치 정의
    character_x_pos += to_x *dt
    character_y_pos += to_y * dt

    # 3-1. 가로 경계값 처리
    if character_x_pos < 0 :
        character_x_pos = 0
    elif character_x_pos > screen_width - character_width:
        character_x_pos = screen_width - character_width

    # 3-2. 세로 경계값 처리
    if character_y_pos < 0:
        character_y_pos = 0
    elif character_y_pos > screen_height - character_height:
        character_y_pos = screen_height - character_height

    # 4. 충돌 처리
    character_rect = character.get_rect()
    character_rect.left = character_x_pos
    character_rect.top = character_y_pos

    enemy_rect = enemy.get_rect()
    enemy_rect.left = enemy_x_pos
    enemy_rect.top = enemy_y_pos

    # 4-1. 충돌 체크
    if character_rect.colliderect(enemy_rect):
        print("똥이 묻었어요!!!!!")
        running = False

    # 5. 화면에 그리기

    screen.blit(background,(0,0))
    screen.blit(character, (character_x_pos, character_y_pos))
    screen.blit(enemy, (enemy_x_pos,enemy_y_pos))

    # 5-1. 타이머 설정
    elapsed_time = (pygame.time.get_ticks() - start_tick) / 1000
    timer = game_font.render(str(int(total_time - elapsed_time)), True, (0, 0, 0))
    screen.blit(timer, (10, 10))
    if total_time - elapsed_time <= 0:
        print("Time Out")
        running = False
    
    pygame.display.update() 

# 잠시 대기
pygame.time.delay(2000)

pygame.quit()