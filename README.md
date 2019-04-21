# README for buying Movie resources application

This project is an individual assignment of advanced web application development course at the university of aberdeen.

The application developed by me is a Ruby on Rails application. This website is mainly for viewing the copyright of movies. In order to maintain the copyright of the film, we sell movie resources for users to watch movies. I specially selected the best box office movie of the year 1980-2018 to be the theme of this time. User add the item in the cart and place order without login. Once order placed, they get an email notification. I also use highcharts to display the world’s yearly top-grossing movie from 1980-2018 and display the Oscar Pictures table from 1927-2014. Users contact us using google map and telephone. Customers sign up and log in for authentication. When users log in the account, they could post microposts feed.  

Demo of the Application
A live version is deployed on Heroku, and can be accessed using the following link:



Default Users
Username		Password
admin	       admin
sakura	     sakura

Defaulr Orders
Name	Address	Email	pay type	
sakura	6a printfield talk	sakura@0319.com	Credit card	Show	Edit	Destroy
Vistors are required to login if they need to see the news tables.

System Requirement
The application is built on Ruby on Rails framework, with bootstrap, bootstrap-will_paginate, JQuery and highcharts. 

Ruby Version and Gems
Ruby ~> 2.5.1, Rails ~> 5.2.2

csv gem for loading the data to the database table. Use sqlite3 for local database and pg gem for connecting to PostgreSQL database in the Heroku production environment.

Bootstrap, bootstrap-will_paginate and JQuery
Bootstrap 4.3.1 and bootstrap-will_paginate 1.0.0 and JQuery 3.2.1 are used in this project, the CSS and JS files are loaded from BootstrapCDN.

Highcharts
Line Chart from HighCharts is used in the visualization of data.

Googlemap javascript
Using google map javascript to display the address

Databases
Sqlite3 is used in local development and testing, and PostgreSQL is used in the production environment.

Local Deployment of the Application
Prepare Files
Run git clone to clone the application from online repository or download the compressed file and extract it to a local folder.

Install Dependencies
Execute bundle install to install all the required gems.

Initialize Databases
Execute rails db:migrate

Populate the tables
To populate tables for data, 1 task need to be executed.

Execute rake rake pictures_list:load_pictures to popluate the news table.

Add to Cart for order system
Using Ajax for guest to place their orders. When they check out, they get notify_order_placed email in rails order_mailer.

Initialize User System
Only logged in users are allowed to manage the databases for data and create, edit, and delete movies and orders. The admin is allowed to edit, and delete users and other general users have no privilege to edit or delete the users. 

Microposts system
Only logged in users, they post their microposts in their account. Users see other users microposts and they cannot edit or delete them. More than 30 microposts, they automatically paginate in pages. 

To create default users, execute rake user:initialize .

Test Locally
Using Rspec and Test:: Unit for Tests. Rspec for testing create user and login. Test:: Unit for tesing orders name, address and email, for testing users name and password. 

When everything is ready, execute rails server, then open localhost:3000 in the browser to access the application. You can specify the port by rails server -p [port_number].

Deploy to Heroku
The application has been tested to be deployed on heroku.

Register a heroku account.

Install heroku cli.

Execute heroku login.

Navigate the directory of the project and execute heroku create.

Execute git push heroku master to deploy the application to your own heroku app space. If you want to push a different branch other than the master, execute git push heroku [your_branch]:master.

More information can be found on heroku official tutorial: https://devcenter.heroku.com/articles/getting-started-with-ruby .

Then use the same commands as local deployment to initialize the application, but add heroku run before to make it run on Heroku.

heroku run Rails db:migrate

heroku run rake pictures_list:load_pictures

heroku run rake user:initialize

After that, the heroku application is ready to use, run heroku run to open the application in the browser.

Features
Visualize Data on the Highcharts and show Trend of Figure
In the chart page, guests can see the world’s yearly top-grossing movie index from 1980-2018 on the wolrd map. Guests will be navigated to the page with a line chart showing how the figure changes from 1980-2018. and 
the table on this page shows the movie of that year.

View Data
Only logged in users can view the raw data stored on the database tables by clicking on the news section.

Googlemap javascript for address

E-commerce system
Guests add the item in their cart and check out without login. The item is kept until guests empty the cart. 

Authentication System
It has three types of users, Admin, general users and guests. 

Micropost feed
Only logged in users can post the microposts. 

Email authentication
When order is placed and password reset, guest and user could get email with rails order_mailer and user_mailer
