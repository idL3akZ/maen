#!/bin/bash
clear
echo ".:: Tambah Domain Layer v.1.1 ::."
echo "1. Ini khusus yg manage VPS nya pakai EasyEngine, diluar itu silahkan dioprek"
echo "2. isi domain tanpa http://"
echo "3. kalo domain layernya banyak pisahkan koma dan spasi (hi.tk, ho.tk, he.tk)"
echo "========= UDAH itu saja ============"
echo -n "Domain master [domain WP yg mau dilayer]? "
read target
echo -n "Domain yang mau dipointing [isi 1 atau lebih]? "
read domain
IFS=', ' read -r -a array <<< "$domain"
for layer in "${array[@]}"
do
    echo -e "server {\n\n\tserver_name $layer\twww.$layer;\n\n\taccess_log /var/log/nginx/$layer.access.log rt_cache;\n\terror_log /var/log/nginx/$layer.error.log;\n\n\troot /var/www/$target/htdocs;\n\n\n\tindex index.php index.html index.htm;\n\n\tinclude common/php.conf;\n\tinclude common/wpcommon.conf;\n\tinclude common/locations.conf;\n\tinclude /var/www/$target/conf/nginx/*.conf;\n}" > /etc/nginx/sites-enabled/$layer
	echo -e "server {\n\n\tserver_name $layer\twww.$layer;\n\n\taccess_log /var/log/nginx/$layer.access.log rt_cache;\n\terror_log /var/log/nginx/$layer.error.log;\n\n\troot /var/www/$target/htdocs;\n\n\n\tindex index.php index.html index.htm;\n\n\tinclude common/php.conf;\n\tinclude common/wpcommon.conf;\n\tinclude common/locations.conf;\n\tinclude /var/www/$target/conf/nginx/*.conf;\n}" > /etc/nginx/sites-available/$layer
done
sudo service nginx restart
echo "WARNING!! Opsi ini hanya dilakukan sekali saja."
echo -n "Inject script layer ke /var/www/$target/wp-config.php [y or n] ? "
read inject
case $inject in
	[yY] )
		sed -i "35i /*Handle multi domain*/ define('WP_SITEURL', 'http://' . \$_SERVER['HTTP_HOST']); define('WP_HOME', 'http://' . \$_SERVER['HTTP_HOST']);" /var/www/$target/wp-config.php
		injectLog="Script telah terinject di /var/www/$target/wp-config.php line 35"
		;;
	[nN] )
		injectLog="Dilewati"
		;;
	*) injectLog="Dilewati"
		;;
esac
echo "=========== INFO ============"
echo "Layer : vhost domain"
echo -e "\tlokasi vhost /etc/nginx/sites-enabled/"
echo -e "\tlokasi vhost /etc/nginx/sites-available/"
echo "Inject script : $injectLog"