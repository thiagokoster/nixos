# Notification Daemon
{pkgs, config, ...}:
{
	home.packages = with pkgs; [
		libnotify
	];
	services = {
		mako = {
			enable = true;
			defaultTimeout = 10000;
			backgroundColor = "#434C5E";
			borderColor = "#4C566A";
		};
	};
}
