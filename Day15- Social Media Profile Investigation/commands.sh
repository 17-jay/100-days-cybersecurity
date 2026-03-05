# So these are the URLs that brought the same results when troubleshooting to find out any loose emails 

curl -s http://154.57.164.66:31969/
curl -s http://154.57.164.66:31969/profile/TechReviewer2024
curl -s http://154.57.164.66:31969/user/TechReviewer2024
curl -s http://154.57.164.66:31969/api/users/TechReviewer2024
curl -s http://154.57.164.66:31969/robots.txt
curl -s http://154.57.164.66:31969/sitemap.xml

# The anticipation was that the JS bundle is where i'd find the email of the culprit

/assets/index-fPbXfhd6.js #this is the js file

curl -s http://<host>:<port>/assets/index-fPbXfhd6.js -o bundle.js #this downloads the JS bundle

grep -oE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' bundle.js # this was the golden ticket(regex) that gave out the email
