# Copilot Instructions

このプロジェクトはモノレポ構成で、以下の技術スタックを使用しています。

## 技術スタック
- **フロントエンド**: Next.js (TypeScript, Tailwind CSS, App Router)
- **バックエンド**: FastAPI (Python, Pydantic)
- **インフラ**: AWS (Terraform または AWS CDK)

## フォルダ構成
- `frontend/`: Next.js を使用したフロントエンドアプリケーション
- `backend/`: FastAPI を使用したバックエンドアプリケーション
- `infra/`: AWS のインフラ構成 (Terraform または AWS CDK)
- `docs/`: プロジェクトのドキュメント
- `.github/`: GitHub Actions や Copilot 設定

## 注意点
- フロントエンドでは `@/*` をインポートエイリアスとして使用します。
- バックエンドでは Pydantic を使用してスキーマを定義します。
- インフラは AWS をターゲットに構築されます。

この情報を基に、適切なコード補完や提案を行ってください。
