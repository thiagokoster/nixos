{config, pkgs, ...}:
{
  programs.wofi = {
  	enable = true;
	settings = {
	  width=500;
	  height=200;
	  prompt="Search...";
	};
  };

  home.file.".config/wofi/style.css" = {
	text = ''
	 window {
            margin: 5px;
            border: 2px solid #5e81ac;
            background-color: #2e3440;
            border-radius: 10px;
        }

        #input {
            margin: 5px;
            border: none;
            background-color: #3b4252;
            color: #eceff4;
            font-size: 16px;
        }

        #entry {
            border-radius: 5px;
            background-color: #3b4252;
            color: #eceff4;
        }

        #entry:selected {
            background-color: #88c0d0;
            color: #2e3440;
        }
	'';
	};
}
