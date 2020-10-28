#!/bin/sh
echo "========================================================================================"
echo "                                      Hexo Debug Menu"
echo " "
echo "                                       by @lei2rock"
echo "========================================================================================"
HexoPath=$(cd "$(dirname "$0")"; pwd)
cd ${HexoPath}
echo " "
printf "\033[32mBlog 根目录："${HexoPath}"\033[0m"
echo " "
echo " "
echo "[1] 本地预览"
echo "[2] 切换到 blog"
echo " "
printf "请选择需要的功能，默认选择[1]"
echo " "
echo " "
printf "选择："
read answer
if [ "$answer" == "1" ] || [ "$answer" == "" ]; then
	echo " "
	printf "\033[32mINFO \033[0m 启动本地预览...\n"
	echo " "
	sed -i "" 's#css: https://website-1256060851.cos.ap-hongkong.myqcloud.com/assets/css-homepage#css: css#g' _config.next.yml
	sed -i "" 's#js: https://website-1256060851.cos.ap-hongkong.myqcloud.com/assets/js#js: js#g' _config.next.yml
	sed -i "" 's#images: https://website-1256060851.cos.ap-hongkong.myqcloud.com/assets/images#images: images#g' _config.next.yml
	hexo s
	hexo clean
	sed -i "" 's#css: css#css: https://website-1256060851.cos.ap-hongkong.myqcloud.com/assets/css-homepage#g' _config.next.yml
	sed -i "" 's#js: js#js: https://website-1256060851.cos.ap-hongkong.myqcloud.com/assets/js#g' _config.next.yml
	sed -i "" 's#images: images#images: https://website-1256060851.cos.ap-hongkong.myqcloud.com/assets/images#g' _config.next.yml
	echo " "
	exec ${HexoPath}/hexo.sh
else
	if [ "$answer" == "2" ]; then
		echo " "
		printf "\033[32mINFO \033[0m 准备切换到 blog ...\n"
		sleep 1s
		echo " "
		exec ${HexoPath}/../blog/hexo.sh
	else
		echo " "
		printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
		sleep 1s
		echo " "
		exec ${HexoPath}/hexo.sh
	fi
fi
