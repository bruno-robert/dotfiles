local res=$(defaults read -g com.apple.keyboard.fnState)
if [ $res = 1 ]; then
  echo "Disabling function keys";
	defaults write -g com.apple.keyboard.fnState -boolean false
else
  echo "Enabling function keys";
	defaults write -g com.apple.keyboard.fnState -boolean true
fi
