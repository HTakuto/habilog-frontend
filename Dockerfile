# Nodeの公式イメージを使用
FROM node:20-slim

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係ファイルをコピー
COPY package.json package-lock.json* ./

# 依存関係のインストール
RUN npm ci

# アプリのソースコードをコピー
COPY . .

# 本番ビルド
RUN npm run build

# サーバー起動
CMD ["npm", "run", "start"]
