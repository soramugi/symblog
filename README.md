#symfonyチュートリアルブログの作成
symblog
<http://symblog.ganchiku.com>

## セットアップ

###ビルトインサーバーの使用の場合
php5.4

    git clone git@github.com:soramugi/symblog.git
    cd symblog
    cp app/config/parameters.yml.dist app/config/parameters.yml
    curl -s http://getcomposer.org/installer | php
    php composer.phar install
    php app/console doctrine:database:create
    php app/console doctrine:schema:create
    php app/console doctrine:fixtures:load --append
    php app/console doctrine:migrations:migrate
    php app/console server:run

http://localhost:8000

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
