## rbenv.sh

### 説明

Rubyをrbenvを使ってインストールするスクリプト。
CentOS 7で動作確認ずみだけどRHEL系なら大体動くはず。

rbenvは/usr/local/rbenvにインストールされる。
gem installやrbenvの操作にはroot権が必要。

### 使用方法

引数にRubyのバージョンを指定して実行する。

curlからインストールする場合は下記コマンドを実行。

```bash
curl -sSL https://git.io/vDNT8 | bash -s -- (Rubyのバージョン)
```

実行後は一旦シェルからログアウトする。
