# Week 02 - EKS Spring Boot App Deploy Lab

## 목표

EKS 기반 VPC, 서브넷 구성 후, ALB와 함께 Spring Boot 앱을 배포하고 GitHub Actions로 CI 자동화 구성하기.

## 상세 내용

### 1. Terraform IaC 구성

- VPC, Public/Private Subnet, NAT Gateway, IGW 구성
- `terraform-aws-modules/vpc/aws` 공식 모듈 활용
- EKS 클러스터 및 워커 노드 (Managed Node Group) 생성
- `terraform-aws-modules/eks/aws` 활용
- ALB Controller 설치 (Helm 사용)
- `kubernetes_manifest` or `kubectl apply`로 서비스 배포

### 2. Spring Boot App 배포

- Java 17 기반 간단한 Spring Boot 앱 (`/hello` 응답 정도)
- Dockerfile 작성
- ECR 푸시 후, Pod가 Private Subnet에서 실행되도록 구성
- ALB가 해당 앱으로 라우팅 되도록 `Ingress` 설정

### 3. CI 자동화 (GitHub Actions)

- push 시 Docker build → ECR push → Helm upgrade or kubectl apply 수행
