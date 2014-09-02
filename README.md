Nginx, Unicorn & Sinatra
========================
These are the stages:

1. bundle install

2. mkdir -p tmp/pids

3. mkdir -p tmp/sockets/

4. cp config/sinatra.yotpo.com.conf /Users/netanel/tools/nginx-srv/conf/sites-enabled/sinatra.yotpo.com.conf

5. restart nginx

6. unicorn -c config/unicorn.rb -p 4567 -D
