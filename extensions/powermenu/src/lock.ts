import { exec } from 'node:child_process';

export default async function Lock() {
	switch (process.env.XDG_CURRENT_DESKTOP) {
		case "Hyprland":
			exec("hyprlock");
			break;
		case "sway":
			exec("swaylock");
			break;
		default:
			exec("loginctl lock-session");
	}
}
