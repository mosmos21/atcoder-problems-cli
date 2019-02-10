AtCoder Problems cli
====

コマンドラインから実行することで、
[AtCoderProblems](https://kenkoooo.com/atcoder/)
に登録されているデータを取得することができるプログラムです

## 導入

- リポジトリをクローンします
```bash
$ git clone https://github.com/mosmos21/atcoder-problems-cli.git
```

- atcoder-problems.shに実行権を与え、パスを通します
```bash
$ cd atcoder-problems-cli
$ chmod +x atcoder-problems.sh
$ echo "export PATH=\"$(pwd):\$PATH\"" >> $HOME/.bashrc
```

## コマンド
- 以下のコマンドで実行できます
- 詳細な説明は `--help` オプションを利用してください
```bash
$ atcoder-problems [OPTIONS] COMMAND
```

#### OPTIONS
--out *string*
- コマンドの実行結果の出力形式を指定します。以下の3つのタイプを指定することができます。
  - text (デフォルト)
  - json
  - csv

#### COMMAND

contest
- コンテスト情報を取得します

problem
- 問題情報を取得します

count
- 集計されたランキングを取得します

user
- ユーザ情報を取得します

submission
- 提出データを取得します