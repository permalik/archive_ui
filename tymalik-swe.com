server {

        server_name tymalik-swe.com www.tymalik-swe.com;

        root /var/www/tymalik-swe.com/html; 
        index index.html index.htm index.nginx-debian.html;

        location / {
                try_files $uri $uri/ =404;
            }
    
    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/tymalik-swe.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/tymalik-swe.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.tymalik-swe.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = tymalik-swe.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


        listen 80;
        listen [::]:80;

        server_name tymalik-swe.com www.tymalik-swe.com;
    return 404; # managed by Certbot




}