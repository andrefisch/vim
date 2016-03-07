# HOW TO USE: just run it from anywhere and you will have a new .ideavimrc file 
# in your home directory 
rm ~/.ideavimrc

# add the heading above MISC SETTINGS
echo '"""""""""""""""""' >> ~/.ideavimrc
sed -n '/MISC SETTINGS/,/}}}/p' ~/.vimrc >> ~/.ideavimrc
# awk '/MISC SETTINGS/,/}}}/ { print }' ~/.vimrc >> ~/.ideavimrc

# add the heading above MAPPINGS
echo '\n""""""""""""' >> ~/.ideavimrc
sed -n '/MAPPINGS/,/}}}/p' ~/.vimrc >> ~/.ideavimrc
# awk '/MAPPINGS/,/}}}/ { print }' ~/.vimrc >> ~/.ideavimrc

# change all instances of leader to my leader key
sed -i -e 's/<leader>/<Space>/g' ~/.ideavimrc
