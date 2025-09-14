import { exec } from 'node:child_process';

export default async function Poweroff() {
	exec("systemctl poweroff")
}
