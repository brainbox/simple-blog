This will produce a simple blog that allows only authenticated users to create new posts,
edit and delete previous ones. It is based on a number of web tutorials noted below. 

The intention is that this will kick-start others who are learning about pulling ruby and rails
together into a whole with git and heroku. 

In order for the captcha to work you need to have the RMagick gem installed

The blog is based on the details found at these sites:
http://guides.rubyonrails.org/getting_started.html
http://ruby.about.com/od/rubyonrails/ss/railsblog3.htm

And it uses these plugins
https://github.com/satish/restful-authentication - this works with Rails 3
http://wiki.github.com/mislav/will_paginate/installation

need RMagick installed first for image use
http://expressica.com/simple_captcha/

Install:

Due to a problem with Rake 0.9.0, this app uses rake 0.8.7. After you download it run: 
gem unininstall rake -v 0.9.0
before you run 'bundle install' so that you include the correct version of rake. See more details at:
http://stackoverflow.com/questions/5287121/undefined-method-task-using-rake-0-9-0-beta-4 

Change the three lines in the app/views/layouts/_header.html.erb file that have 'my_name' to ones that use your name instead so that we don't have all blogs with the same title.

In order for this to work, you need to 
rename config/initializers/site_keys_copy.rb to site_keys.rb and change site key string

Optional heroku deployment
Sign up at http://heroku.com and then install heroku gem as needed - this takes a bit of time to show it's working, so be patient.

NOTE: when uploading your ssh key use your heroku password
Use 'heroku create' to create your app on the server and get its default name
add this remote repository to your app with 
git remote add heroku git@heroku.com:your-app-name.git

you can now push the app to heroku with 
git push heroku master

check that it runs at heroku with details - possibly missing gems
.gems file might need updating if you added any

use heroku rake db:create to set up db and
heroku rake db:migrate to create your tables

with tables in place you can now log into heroku console and create an admin user for your app

heroku console

u = User.new
u.login = 'admin'
u.name = 'your name'
u.email = 'your email'
u.password = 'password' (must be at least 6 characters long or will not save)
u.password_confirmation = 'password'
u.save
should reply true, if false then use
u.save! and it will report error message back to you

go back to web app and try login and should work so add a post and see how it looks

Post Installation:

You need to set up authentication and captcha for the comments, and you may want to consider
adding 
editor tools and paperclip so that you can upload images to your blog.

http://blog.thatsuseful.com/2008/06/21/fckeditor-plugin-0-5-1-released/
http://github.com/thoughtbot/paperclip


