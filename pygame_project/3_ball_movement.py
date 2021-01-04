import pygame
import os
#####################################################
# 기본 초기화 (반드시 해야 하는 것들)
pygame.init() 

# 화면 크기 설정
screen_width = 640 # 가로 크기
screen_height = 480 # 세로 크기
screen = pygame.display.set_mode((screen_width, screen_height))

# 화면 타이틀 설정
pygame.display.set_caption("Pang Game") # 게임 이름

# FPS
clock = pygame.time.Clock()
#####################################################

# 1. 사용자 게임 초기화 (배경화면, 게임 이미지, 좌표, 속도,  폰트 등)
current_path = os.path.dirname(__file__) #현재 파일의 위치 반환
image_path = os.path.join(current_path, "images") # images 폴더 위치 반환

# 배경 만들기
background = pygame.image.load(os.path.join(image_path, "background.png"))

# 스테이지 만들기
stage = pygame.image.load(os.path.join(image_path, "stage.png"))
stage_size = stage.get_rect().size
stage_height = stage_size[1] # 스테이지의 높이 위에 캐릭터를 두기 위해 사용.

# 캐릭터 만들기
character = pygame.image.load(os.path.join(image_path, "character.png"))
character_size = character.get_rect().size
character_width = character_size[0]
character_height = character_size[1]
character_x_pos = (screen_width / 2) - (character_width / 2)
character_y_pos = screen_height - character_height - stage_height

# 캐릭터 이동 방향
character_to_x = 0

# 캐릭터 이동 속도
character_speed = 5


# 무기 만들기
weapon = pygame.image.load(os.path.join(image_path, "weapon.png"))
weapon_size = weapon.get_rect().size
weapon_width = weapon_size[0]

# 무기는 한번에 여러 발 발사 가능
weapons = []

# 무기 이동 속도
weapon_speed = 10

# 공 만들기 (4개 크기에 대해 따로 처리)
ball_images = [
    pygame.image.load(os.path.join(image_path, "balloon1.png")),
    pygame.image.load(os.path.join(image_path, "balloon2.png")),
    pygame.image.load(os.path.join(image_path, "balloon3.png")),
    pygame.image.load(os.path.join(image_path, "balloon4.png"))]

# 공 크기에 따른 최초 스피드 (위 아래 속도만 )
ball_speed_y = [-18, -15, -12, -9] # index 0, 1, 2, 3에 해당하는 값. 튕기고 올라갈땐 -로 빠지니까~

# 공들 (리스트로 사용할거지만 dictionary로 관리)
balls = []

#최초 발생하는 큰 공 추가
balls.append({
    "pos_x" : 50, # 공의 x 좌표
    "pos_y" : 50, # 공의 y 좌표
    "img_idx" : 0,  # 공의 이미지 인덱스 # 어떤 공 이미지를 쓸지, 공 크기에 따라 달라짐 
    "to_x" : 3, # x축 이동 방향, -3이면 왼쪽으로, 3이면 오른쪽으로
    "to_y" : -6, # y축 이동 방향 #큰공이 생기면 올라갔다가 내려오는 효과를 주기 위해서!
    "init_spd_y" : ball_speed_y[0]}) #y 최초 속도 # 공마다 튕겼을때 값이 다르므로 어떤걸 쓸지 정해주는것


running = True 
while running:
    dt = clock.tick(30) 

    # 2. 이벤트 처리 (키보드, 마우스 등)
    for event in pygame.event.get():
        if event.type == pygame.QUIT:  
            running = False 

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT: # 캐릭터를 왼쪽으로
                character_to_x -= character_speed
            elif event.key == pygame.K_RIGHT: # 캐릭터를 오른쪽으로
                character_to_x += character_speed
            elif event.key == pygame.K_SPACE: # 무기발사
                weapon_x_pos = character_x_pos + (character_width / 2) - (weapon_width / 2)
                weapon_y_pos = character_y_pos
                weapons.append([weapon_x_pos, weapon_y_pos]) # weapons라는 리스트에 x, y 좌표 추가

        if event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                character_to_x = 0


    
    # 3. 게임 케릭터 위치 정의
    character_x_pos += character_to_x

    if character_x_pos < 0 :
        character_x_pos = 0
    elif character_x_pos > screen_width - character_width:
        character_x_pos = screen_width - character_width

    # 무기 위치 조정
    # x,y=100, 200 -> 180, 160, 140, ... x는 그대로, y는 speed만큼 빼줘야함
    # x,y=500, 200 -> 180, 160, 140, ... 값 차이는 스피드만큼! 
    weapons = [ [w[0], w[1] - weapon_speed] for w in weapons] # 무기 위치를 위로
   
    #천장에 닿은 무기 없애기
    weapons = [[w[0], w[1]] for w in weapons if w[1] > 0] #0보다 큰, 천장에 닿지 않은것만 리스트로 저장

    # 공 위치 정의
    # enumerate: 볼 리스트에 있는 것들을 하나씩 가져와서 현재 balls list에서 몇번째 idx인지, 그 val은 무엇인지 출력해줌.
    for ball_idx, ball_val in enumerate(balls):
        ball_pos_x = ball_val["pos_x"] # x좌표
        ball_pos_y = ball_val["pos_y"] # y좌표
        ball_img_idx = ball_val["img_idx"] # ball의 이미지 index정보

        ball_size = ball_images[ball_img_idx].get_rect().size
        ball_width = ball_size[0]
        ball_height = ball_size[1]

        # 가로벽에 닿았을 때 공 이동 위치 변경 (튕겨 나오는 효과)
        if ball_pos_x < 0 or ball_pos_x > screen_width - ball_width:
            ball_val["to_x"] = ball_val["to_x"] * -1

        # 세로 위치
        # 스테이지에 튕겨서 올라가는 처리
        if ball_pos_y >= screen_height - stage_height - ball_height:
            ball_val["to_y"] = ball_val["init_spd_y"]
        else: # 그 외의 모든 경우에는 속도를 증가(시작값이 -라서 증가하면 0을 찍고 +값이 되므로 포물선 효과)
            ball_val["to_y"] += 0.5

        ball_val["pos_x"] += ball_val["to_x"]
        ball_val["pos_y"] += ball_val["to_y"]

    # 4. 충돌 처리
   
    # 5. 화면에 그리기 (위에서 순서대로 그려짐!)
    screen.blit(background, (0,0))

    for weapon_x_pos, weapon_y_pos in weapons: # weapons에는 x, y 값이 묶여서 들어가므로
        screen.blit(weapon, (weapon_x_pos, weapon_y_pos))

    for idx, val in enumerate(balls):
        ball_pos_x = val["pos_x"]
        ball_pos_y = val["pos_y"]
        ball_img_idx = val["img_idx"]
        screen.blit(ball_images[ball_img_idx], (ball_pos_x, ball_pos_y))

    screen.blit(stage, (0, screen_height - stage_height))
    screen.blit(character, (character_x_pos, character_y_pos))

    pygame.display.update() 

pygame.quit()