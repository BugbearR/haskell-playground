#!/bin/sh
set -e

cd /home/$USER
git clone https://github.com/gibiansky/IHaskell
exit 
cd IHaskell
pip3 install -r requirements.txt
stack install --fast
ihaskell install --stack
