#!/bin/sh
cd $PACKAGE_NAME/
test -e requirements && printf "\n" && echo "Building requirements\n-------------------------\n" && mkdir requirements
test -e acptemplates && printf "\n" && echo "Building acptemplates.tar\n-------------------------\n" && cd acptemplates && tar cvf ../acptemplates.tar * && cd ..
test -e files && printf "\nBuilding files.tar\n-------------------------\n" && cd files && tar cvf ../files.tar --exclude .DS_Store * && cd ..
test -e templates && printf "\nBuilding templates.tar\n-------------------------\n" && cd templates && tar cvf ../templates.tar * && cd ..

printf "\n" && echo "BuildingnBuilding $PACKAGE_NAME archive"
for i in `seq 1 ${#PACKAGE_NAME}`;
do
	printf "-"
done
printf "\n"
tar --exclude=acptemplates --exclude=files --exclude=templates --exclude=nbproject --exclude=README* --exclude=.gitignore --exclude=*.tar.gz --exclude=LICENSE* --exclude=c --exclude=z --exclude=v -czvf ../$PACKAGE_NAME.tar.gz *

test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar

exit 0
