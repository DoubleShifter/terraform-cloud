#!/bin/bash
sudo yum -y update
sudo yum -y install nginx
sudo amazon-linux-extras install nginx1

cd /usr/share/nginx/html
rm index.html

myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > index.html
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>

    <body bgcolor="pink">
        <h2><font color='gold'>Build by Terraform</h2><br><p>
        <font color='green'>Server Private IP: <font color ='aqua'>$myip<br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='magenta'>
        <b>Пися Попа 
        <img src="https://cdn.betterttv.net/emote/5f53e4526084af6c17199c5b/3x" alt="MyonPls">
        <b><br><br>

        <font color='red'><b>Version 1.1 </b>
    </body>
</html>
EOF

sudo service nginx start