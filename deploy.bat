echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rem Clear Public folder
cd public
git checkout master
git pull
git rm -r .
cd ..

rem Build the project. if using a theme, replace with `hugo -t <YOURTHEME>`
hugo -b https://ai-bridge.ch

rem Copy CNAME file - it is for custom domain on github
copy "c-name" "public/CNAME"

rem Go To Public folder
cd public
rem Add changes to git.
git add .

rem Commit changes.
git commit -m "Update site"

rem Push source and build repos.
git push origin master

rem Come Back up to the Project Root
cd ..