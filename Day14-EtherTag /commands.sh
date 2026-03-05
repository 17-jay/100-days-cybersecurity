# connect to the vpn
openvpn /file/path/machine.ovpn


# create virtual environment
python3 -m venv venv

# activate the virtual environment
source venv/bin/activate

# install cpppo
pip install cpppo

# Connect and Read the FLAG Tag
python -m cpppo.server.enip.client --print -a <TARGET_IP>:<PORT> 'FLAG[0]'

#Full tag tray
python -m cpppo.server.enip.client --print -a <TARGET_IP>:<PORT> 'FLAG[0-50]'