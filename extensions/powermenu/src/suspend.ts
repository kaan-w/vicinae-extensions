import { exec } from 'node:child_process';

export default async function Suspend() {
	exec("systemctl suspend")
}
