import { exec } from 'node:child_process';

export default async function Reboot() {
	exec("systemctl reboot")
}
