# PSM CLI on Docker

PSM CLI を Docker コンテナで動かす。


## Setup

次のコマンドで Docker イメージをビルドする。

```sh
$ docker build -t psm-cli . \
  --build-arg username='【ユーザ名】' \
  --build-arg password='【パスワード】' \
  --build-arg identity_domain='【アイデンティティ・ドメイン】' \
  --build-arg region='【リージョン】' \
  --build-arg data_center='psm.【リージョン】.oraclecloud.com' \
  --build-arg output_format='json'
```

- 「アイデンティティ・ドメイン」は `idcs-` から始まる文字列
- 「リージョン」は日本リージョンの場合は `aucom`、米国リージョンの場合は `us` など


## How To Use

Docker イメージをビルドすると、次のようにコマンドが使用できる。

```sh
# 「$ psm --version」相当になる
$ docker run -it --rm psm-cli:latest --version
```

以下のような Bash Function を定義しておけば通常の `psm` コマンドと同じように実行できる。

```sh
psm() { docker run -it --rm psm-cli:latest "$@" ; }
```


## Debug

ash 上で実行するには次のように実行する。

```sh
$ docker run -it --rm --entrypoint='/bin/sh' psm-cli:latest
```


## Author

[Neo](http://neo.s21.xrea.com/)


## Links

- [Neo's World](http://neo.s21.xrea.com/)
- [Corredor](https://neos21.hatenablog.com/)
- [Murga](https://neos21.hatenablog.jp/)
- [El Mylar](https://neos21.hateblo.jp/)
- [Neo's GitHub Pages](https://neos21.github.io/)
- [GitHub - Neos21](https://github.com/Neos21/)
