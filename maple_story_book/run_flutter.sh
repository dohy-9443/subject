#!/bin/bash

# 쉘 스크립트 실행 권한 부여 명령어
# 해당 프로젝트 root 위치에서 명령어 사용
# chmod +x run_flutter.sh

# 실행 명령어
# ./run_flutter.sh

# FVM 으로 Flutter 패키지 설치
#fvm flutter pub get

# Flutter 패키지 설치
#flutter pub get

# FVM 으로 Flutter 패키지 업데이트
#fvm flutter pub update

# Flutter 패키지 업데이트
#flutter pub update

# FVM 으로 Build Runner 파일 생성
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Build Runner 파일 생성
#flutter pub run build_runner build --delete-conflicting-outputs

# FVM 으로 Build Runner 파일 지속적으로 실행
#fvm flutter pub run build_runner watch --delete-conflicting-outputs

# Build Runner 파일 지속적으로 실행
#flutter pub run build_runner watch --delete-conflicting-outputs

# FVM 으로 앱 실행
#fvm flutter run

# 앱 실행
#flutter run

# FVM 으로 앱 빌드 (Android)
#fvm flutter build apk

# 앱 빌드 (Android)
#flutter build apk

# FVM 으로 앱 빌드 (iOS)
#fvm flutter build ios

# 앱 빌드 (iOS)
#flutter build ios

# FVM 으로 웹 빌드 (web)
#fvm flutter build web

# 웹 빌드 (web)
#flutter build web

# FVM 으로 macOS 빌드 (macOS)
#fvm flutter build macos

# macOS 빌드 (macOS)
#flutter build macos

# FVM 으로 Windows 데스크탑 앱 빌드 (Windows)
#fvm flutter build windows

# Windows 데스크탑 앱 빌드 (Windows)
#flutter build windows

# FVM 으로 Linux 데스크탑 앱 빌드 (Linux)
#fvm flutter build linux

# Linux 데스크탑 앱 빌드 (Linux)
#flutter build linux