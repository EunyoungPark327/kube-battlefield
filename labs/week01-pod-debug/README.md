# Week 01 - Pod Debug Lab

## 목표

CrashLoopBackOff, OOMKilled, ImagePullBackOff 등 K8s의 대표적인 pod 장애를 재현하고,
kubectl을 활용해 원인을 분석해봅니다.

## 실습 항목

- 잘못된 command로 인한 CrashLoopBackOff
- readinessProbe/livenessProbe 오류
- 잘못된 이미지 → ImagePullBackOff
