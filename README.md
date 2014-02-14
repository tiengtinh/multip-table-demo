multip-table-demo
=================

PhoneGap multiplication table app. Run on web browsers and mobile devices.

# Screenshot
![TodoMVC](screenshot.png)

#Run demo

You can run the project directly by opening the index.html file in the browser.

#Development

Inorder to run project for development, you need:
1. [NodeJs](nodejs.org) installed
2. Grunt installed by running the following command: `npm install grunt-cli -g`
3. Bower installed by running the following command: `npm install bower -g`
4. http-server installed by running the following command: `npm install http-server -g`
5. Navigate to the `www` folder
6. `npm install` and `bower install` to install project's dependancies
7. Run command `grunt watch`. This run the thread that would watch for changes in *.coffee files and build to *.js
8. Also in the `www` folder, run command `http-server` to start server (default port 8080).

Now, visit browser at `localhost:8080/index.dev.html`


