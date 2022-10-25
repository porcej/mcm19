# Install Dependencies
sudo apt-get install git libgd-dev libgeoip-dev libxslt-dev libssl-dev libpcre3 libpcre3-dev

mkdir ~/build
cd ~/build

nginx -v

wget https://nginx.org/download/nginx-1.23.2.tar.gz

sudo mkdir /etc/nginx/modules
sudo cp ~/build/nginx-1.14.2/objs/ngx_http_unsecure_cookie_filter_module.so /usr/share/nginx/modules/

