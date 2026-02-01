#!
hyprctl hyprpaper unload all
state=$(grep state ~/.config/hypr/wallstate.txt)
state=${state:6}


if (($state == 1)); then
	hyprctl hyprpaper preload /home/vearnx/.config/hypr/wallpaper.png
	hyprctl hyprpaper wallpaper ,/home/vearnx/.config/hypr/wallpaper.png
	printf "state=2" > ~/.config/hypr/wallstate.txt
elif (($state == 2)); then
	hyprctl hyprpaper preload ~/.config/hypr/wallpaperone.png
	hyprctl hyprpaper wallpaper ,~/.config/hypr/wallpaperone.png
	printf "state=3" > ~/.config/hypr/wallstate.txt
elif (($state == 3)); then
	hyprctl hyprpaper preload /home/vearnx/.config/hypr/wallpaperthree.png
	hyprctl hyprpaper wallpaper ,/home/vearnx/.config/hypr/wallpaperthree.png
	printf "state=4" > ~/.config/hypr/wallstate.txt
else 
	hyprctl hyprpaper preload /home/vearnx/.config/hypr/wallpapertwo.png
	hyprctl hyprpaper wallpaper ,/home/vearnx/.config/hypr/wallpapertwo.png
	printf "state=1" > ~/.config/hypr/wallstate.txt
fi

