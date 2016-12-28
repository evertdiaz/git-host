#!/bin/bash
echo $1
if [ $1 ]; then
 
	echo "Creating Git Repo in $HOME/public_html/$1"
	git init $HOME/$1

	echo "Copying checkout hook " 
	cp post-receive $HOME/$1/.git/hooks/

	echo "set permissions"
	chmod +x $HOME/$1/.git/hooks/post-receive

	echo "Moving to the directory"
 	cd $1

	echo "Accept pushes into the working copy"
	git config receive.denyCurrentBranch ignore
	
	echo "git config --global core.whitespace cr-at-eol"
	echo "setting autocrlf in true"
	git config --global core.autocrlf true

	echo "Adding files"
	git add .

	echo "commiting files"
	git commit -m"initial commit"

	echo "Done"
	echo ""
	cd
	pwd
else
	echo "You need to add the directory where you want to create the git directory"
fi
