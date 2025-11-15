{config, ...}:
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
  margin: 0px;
  border: 2px solid #${config.colorScheme.palette.base01};
  background-color: #${config.colorScheme.palette.base02};
}

#input {
  margin: 5px;
  border: none;
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base05};
}

#input:focus {
  box-shadow: none;
  border: 1px solid #${config.colorScheme.palette.base08};
}

#outer-box {
  margin: 5px;
  border: none;
  background-color: #${config.colorScheme.palette.base02};
}

#inner-box {
  margin: 5px;
  border: none;
  background-color: #${config.colorScheme.palette.base02};
}

#scroll{
  margin: 0px;
  border: none;
  background-color: #${config.colorScheme.palette.base02};
}


#entry {
  background-color: #${config.colorScheme.palette.base03};
  color: #${config.colorScheme.palette.base05};
  margin: 0px;
}

#entry:selected {
  background-color: #${config.colorScheme.palette.base04};
  color: #${config.colorScheme.palette.base05};
}

#text {
	margin: 0px;
	padding: 2px 2px 2px 10px;
}
'';
};
}

