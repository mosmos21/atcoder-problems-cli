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
$ atcoder-problems [コマンド] [オプション]...
```