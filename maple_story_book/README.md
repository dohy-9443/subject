# 🍁 maple_story_book

> 메이플 스토리 북 앱



## 🧑‍🤝‍🧑 Team
|<img src="https://avatars.githubusercontent.com/u/79897962?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/83467914?v=4" width="150" height="150"/>|
|:-:|:-:|
|[@dohy-9443](https://github.com/dohy-9443)|[@sht3756](https://github.com/sht3756)|
|App 개발|App 개발|

## 📚 Stack
<svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Flutter</title><path d="M14.314 0L2.3 12 6 15.7 21.684.013h-7.357zm.014 11.072L7.857 17.53l6.47 6.47H21.7l-6.46-6.468 6.46-6.46h-7.37z"/></svg>

## ⚙️ version
```
- dart version    : 3.5.3
- flutter version : 3.24.3
```

## 🗒️ API
- NEXON OPEN API 사용 (https://openapi.nexon.com/ko/)

## 📆 작업 진행 사항
- 09.17 ~ 현재 진행중

## 🔖 USE PACKAGES
```
  - http
    - dio: 5.7.0
  - router
    - go_router: 14.2.7
  - data
    - json_annotation: 4.9.0
    - freezed_annotation: 2.4.4
    - json_serializable: 6.8.0
    - build_runner: 2.4.12
    - freezed: 2.5.7
    - flutter_dotenv: ^5.1.0
  - state management
    - bloc: 8.1.4
    - flutter_bloc: 8.1.6
    - equatable: ^2.0.5
  - storage
    - shared_preferences: ^2.3.2
  - permission
    - permission_handler: 11.3.1
  - format
    - intl: 0.19.0
  - injector
    - get_it: 7.7.0
    - injectable: ^2.4.4
  - log
    - logger: 2.4.0
  - ui
    - image_picker: 1.1.2
    - google_fonts: 6.2.1
    - cached_network_image: 3.4.1
    - flutter_svg: 2.0.10+1
    - fluttertoast: 8.2.8
    - flutter_screenutil: 5.9.3
    - flutter_inappwebview: 6.0.0
    - flutter_staggered_grid_view: 0.7.0
    - flutter_native_splash: 2.4.1
    - flutter_launcher_icons: 0.13.1
    - flutter_gen: 5.7.0
    - auto_size_text: 3.0.0
    - animated_text_kit: 4.2.2
    - card_swiper: 3.0.1
    - custom_radio_grouped_button: 2.2.1
```
## 🗂️ 폴더 구조
```
lib
  ┣ app
  ┃ ┣ data
  ┃ ┃ ┣ repository
  ┃ ┃ ┗ source
  ┃ ┃   ┗ model
  ┃ ┣ di
  ┃ ┣ domain
  ┃ ┃ ┣ entity
  ┃ ┃ ┣ repository
  ┃ ┃ ┃ ┣ maple_story
  ┃ ┃ ┃ ┗ maple_story_m
  ┃ ┃ ┗ use_case
  ┃ ┃   ┣ character
  ┃ ┃   ┣ guild
  ┃ ┃   ┣ local_storage
  ┃ ┃   ┣ notice
  ┃ ┃   ┣ potential
  ┃ ┃   ┣ ranking
  ┃ ┃   ┣ star_force
  ┃ ┃   ┗ union
  ┃ ┗ presentation
  ┃   ┣ all
  ┃   ┃ ┣ components
  ┃   ┃ ┣ guild
  ┃   ┃ ┃ ┣ bloc
  ┃   ┃ ┃ ┗ extension
  ┃   ┃ ┣ notice
  ┃   ┃ ┃ ┣ bloc
  ┃   ┃ ┃ ┗ extension
  ┃   ┃ ┣ potential
  ┃   ┃ ┃ ┣ bloc
  ┃   ┃ ┃ ┗ extension
  ┃   ┃ ┗ star_force
  ┃   ┃   ┗ bloc
  ┃   ┣ global
  ┃   ┣ home
  ┃   ┃ ┣ bloc
  ┃   ┃ ┃ ┗ extension
  ┃   ┃ ┣ components
  ┃   ┃ ┗ view
  ┃   ┣ ranking
  ┃   ┃ ┣ bloc
  ┃   ┃ ┃ ┗ extension
  ┃   ┃ ┣ common
  ┃   ┃ ┃ ┗ util
  ┃   ┃ ┣ components
  ┃   ┃ ┗ widgets
  ┃   ┣ router
  ┃   ┃ ┗ component
  ┃   ┣ search
  ┃   ┃ ┗ components
  ┃   ┗ search_favorite_list
  ┃     ┗ components
  ┣ core
  ┃ ┣ enum
  ┃ ┣ extension
  ┃ ┣ network
  ┃ ┃ ┗ rest
  ┃ ┗ util
  ┃   ┗ bloc
  ┣ tool
  ┃ ┣ component
  ┃ ┣ network
  ┃ ┃ ┣ api
  ┃ ┃ ┗ rest
  ┃ ┣ theme
  ┃ ┗ widget
  ┗ main.dart
```

## 현재 작업중인 화면 

| logo icon           | splash screen           | onboarding screen           | search screen           | home screen           |
|-------------------|-------------------|-------------------|-------------------|-------------------|
| <img src="https://github.com/user-attachments/assets/9ee60fff-08cd-4f6a-a9eb-60265a68a108" width="150" height="150"/> | <img src="https://github.com/user-attachments/assets/6a83188a-7f7e-40b7-b63b-db30e598bf57" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/a6676cf0-051c-4897-8e7a-85c0e08f6043" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/bf9fa279-0af2-4c4f-95ae-3dc3a0298187" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/ee90cb3b-b200-4e2c-9701-d26936ebb8b2" width="200" height="400"/> |  

| ranking screen           | all screen         | empty modal          | error full screen          | alert           | 
|-------------------|-------------------|-------------------|-------------------|-------------------|
<img src="https://github.com/user-attachments/assets/b75ef2b8-45e2-4507-94a4-0cd6a9d03900" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/b00a136d-30f9-4464-bd9f-68997cd90433" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/a663dd35-181a-440f-afaf-cbf7a63d7a0b" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/6e86bd00-c907-4272-ad41-8e35c9bd4912" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/66e739e5-2130-40a7-9c87-8eb6927cd86c" width="200" height="400"/> | 

| server error modal          | world bottom sheet          |
|-------------------|-------------------|
<img src="https://github.com/user-attachments/assets/58e0fb55-42f1-4a77-835b-203f4ea7e7ea" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/3e998aad-8be1-4e9f-a182-4fff532e8299" width="200" height="400"/> |

