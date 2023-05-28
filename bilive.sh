# 颜色选择
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
font="\033[0m"


stream_start(){
# 定义推流地址和推流码
echo -e "${yellow} 开始设置推流，使用默认选项直接回车 ${font}"
read -p "※ 输入你的服务器地址和串流密钥(rtmp协议): " rtmp

# 判断用户输入的地址是否合法
if [[ $rtmp =~ "rtmp://" ]];then
        echo -e "${green} 推流地址输入正确,程序将进行下一步操作. ${font}"
        sleep 2
        else
        echo -e "${red} 你输入的地址不合法,请重新运行程序并输入! ${font}"
        exit 1
fi

# 定义视频存放目录
read -p "输入你的视频存放目录(要绝对路径,默认/video): " folder
if [ ! $folder ];then
        folder="/video"
fi

# 定义视频和音频码率
read -p "请输入视频推流码率(默认4000k): " bv
read -p "请输入音频推流码率(默认192k): " ba
if [ ! $bv ];then
        bv="4000k"
fi
if [ ! $ba ];then
        ba="192k"
fi

# 判断是否需要添加水印
read -p "是否需要为视频添加水印?水印位置默认在右上方,需要较好CPU支持. 默认不加,添加请输入y:" watermark
if [ $watermark = "y" ];then
        read -p "输入你的水印图片存放绝对路径,例如/opt/image/watermark.jpg (格式支持jpg/png/bmp):" image
        echo -e "${yellow} 添加水印完成,程序将开始推流. ${font}"
        # 循环
        while true
        do
                cd $folder
                video=$(find ./ -type f | shuf -n 1)
                ffmpeg -re -i "$video" -i "$image" -filter_complex overlay=W-w-5:5 -preset ultrafast  -g 25 -b:v ${bv} -c:a aac -b:a ${ba} -strict -2 -f flv ${rtmp}
        done
else
    echo -e "${yellow} 你选择不添加水印,程序将开始推流. ${font}"
    # 循环
        while true
        do
                cd $folder
                video=$(find ./ -type f | shuf -n 1)
                ffmpeg -re -i "$video" -preset ultrafast -vcodec libx264 -g 25 -b:v ${bv} -c:a aac -b:a ${ba} -strict -2 -f flv ${rtmp}
        done
fi
        }

# 停止推流
stream_stop(){
        screen -S bilive -X quit
        }

# 开始菜单设置
echo -e "${yellow} FFmpeg无人值守循环推流 ${font}"
echo -e "${red} 请确定此脚本目前是在screen窗口内运行的! ${font}"
echo -e "${red} 若未在screen窗口内请运行  screen -S bilive ${font}"
echo -e "${green} 1.开始无人值守循环推流 ${font}"
echo -e "${green} 2.停止推流 ${font}"
start_menu(){
    read -p "请输入数字(1-2),选择你要进行的操作:" num
    case "$num" in
        1)
        stream_start
        ;;
        2)
        stream_stop
        ;;
        *)
        echo -e "${red} 请输入正确的数字 (1-2) ${font}"
        ;;
    esac
        }

# 运行开始菜单
start_menu
