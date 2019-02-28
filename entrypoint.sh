#!/bin/sh
set -eo pipefail
if [ ! -z "$DBHOST" ];then
   find /var/www/html -name "config_global.php" |xargs sed -i "/dbhost/ s/] =.*/] = '$DBHOST';/g"
   find /var/www/html -name "config.inc.php" |xargs sed -i "s/define('UC_DBHOST', .*/define('UC_DBHOST', '$DBHOST')\;/g"
   find /var/www/html -name "config_ucenter.php" |xargs sed -i "s/define('UC_DBHOST', .*/define('UC_DBHOST', '$DBHOST')\;/g"
fi
if [ ! -z "$DBUSER" ];then
   find /var/www/html -name "config_global.php" |xargs sed -i "/dbuser/ s/] =.*/] = '$DBUSER';/g"
   find /var/www/html -name "config.inc.php" |xargs sed -i "s/define('UC_DBUSER', .*/define('UC_DBUSER', '$DBUSER')\;/g"
   find /var/www/html -name "config_ucenter.php" |xargs sed -i "s/define('UC_DBUSER', .*/define('UC_DBUSER', '$DBUSER')\;/g"
fi
if [ ! -z "$DBPW" ];then
   find /var/www/html -name "config_global.php" |xargs sed -i "/dbpw/ s/] =.*/] = '$DBPW';/g"
   find /var/www/html -name "config.inc.php" |xargs sed -i "s/define('UC_DBPW', .*/define('UC_DBPW', '$DBPW')\;/g"
   find /var/www/html -name "config_ucenter.php" |xargs sed -i  "s/define('UC_DBPW', .*/define('UC_DBPW', '$DBPW')\;/g"
fi
if [ ! -z "$DBPORT" ];then
   find /var/www/html -name "config_global.php" |xargs sed -i "/dbport/ s/] =.*/] = '$DBPORT';/g"
   find /var/www/html -name "config.inc.php" |xargs sed -i "s/define('UC_DBPORT', .*/define('UC_DBPORT', '$DBPORT')\;/g"
   find /var/www/html -name "config_ucenter.php" |xargs sed -i "s/define('UC_DBPORT', .*/define('UC_DBPORT', '$DBPORT')\;/g"
fi
if [ ! -z "$DBNAME" ];then
   find /var/www/html -name "config_global.php" |xargs sed -i "/dbname/ s/] =.*/] = '$DBNAME';/g"
   find /var/www/html -name "config.inc.php" |xargs sed -i "s/define('UC_DBNAME', .*/define('UC_DBNAME', '$DBNAME')\;/g"
   find /var/www/html -name "config_ucenter.php" |xargs sed -i "s/define('UC_DBNAME', .*/define('UC_DBNAME', '$DBNAME')\;/g"
fi
if [ ! -z "$REDIS_SERVER" ];then
   find /var/www/html -name "config_global.php" |sed -i "/\['redis'\]\['server'\]/ s/= '.*';/= '$REDIS_SERVER';/g" 
fi
if [ ! -z "$REDIS_PORT" ];then
   find /var/www/html -name "config_global.php" |sed -i "/\['redis'\]\['port'\]/ s/= '.*';/= '$REDIS_PORT';/g" 
fi
  echo "1" > /tmp/1
exec "$@"
