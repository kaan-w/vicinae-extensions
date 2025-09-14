import { exec } from 'node:child_process';

export default async function Hibernate() {
	exec("systemctl hibernate")
}
