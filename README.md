Nginx, Unicorn & Sinatra
========================
This is an example of how to deploy a simple Sinatra application using Unicorn 
and Nginx. Dynamic content is served via Unicorn while static content is served
via Nginx.

__Remember to edit all files paths in nginx.conf and unicorn.rb!__

`apt-get install nginx` / `yum install nginx` / `emerge -av nginx`

`bundle install`

`mkdir -p tmp/pids/`

`mkdir -p tmp/sockets/`

`cp config/nginx.conf /etc/nginx/nginx.conf`

`service nginx start` / `/etc/init.d/nginx start`

`unicorn -c config/unicorn.rb`
