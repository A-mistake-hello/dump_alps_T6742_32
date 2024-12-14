#!/system/bin/sh
if [ ! "$(id | grep root)" ];then
  echo 'install_data_app：非root用户！';
  exit;
fi

if [ -f "/data/system/install_data_app" ];then
  echo 'install_data_app：已经初始化过了！';
  exit;
fi
app_list=$(ls /system/data-app/ | grep .apk);
for app in $app_list
do
  echo "install_data_app：正在安装：$app";
  pm install /system/data-app/$app;
done
echo 'install_data_app：已全部安装完成！';
echo '' > /data/system/install_data_app;