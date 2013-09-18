#symfonyチュートリアルブログの作成
symblog
<http://symblog.ganchiku.com>

## セットアップ

###ビルトインサーバーの使用の場合

    git clone git@github.com:soramugi/symblog.git
    cd symblog
    curl -s http://getcomposer.org/installer | php
    php composer.phar install
    php -S localhost:8000 -t web/

http://localhost:8000/config.php

###vagrant使用の場合

あらかじめvagrantインストールしておく

    git clone git@github.com:soramugi/php-dev.git
    cd php-dev
    git submodule init
    git submodule update
    vagrant up
    git clone git@github.com:soramugi/symblog.git
    cd symblog
    curl -s http://getcomposer.org/installer | php
    php composer.phar install
    cd ..
    rm -rf web
    ln -s symblog/web web

`symblog/web/config.php` `symblog/web/app_dev.php`のlocalhostアクセス以外はexitしている部分はコメントアウトしておく

http://localhost:8082/config.php
