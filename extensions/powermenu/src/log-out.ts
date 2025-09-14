import { exec } from 'node:child_process';

export default async function LogOut() {
	switch (process.env.XDG_CURRENT_DESKTOP) {
		case "Hyprland":
			exec("hyprctl dispatch exit");
			break;
		case "niri":
			exec("niri msg action quit");
			break;
		case "sway":
			exec("swaymsg exit");
			break;
		default:
			exec("loginctl terminate-user $USER");
	}
}
