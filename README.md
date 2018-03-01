## Cute or Not - Full Stack CRUD App using Ruby on Rails

This app is created for users who would like strangers to vote if their dogs are cute or not. 

### +technology
* Ruby on Rails
* Postgresql
* Bcrpyt
* [Acts as Votable](https://github.com/ryanto/acts_as_votable)
* Bootstrap
* HTML
* CSS/SASS

### +methodology 
I started by brainstorming on a [trello](https://trello.com/b/1zqOcRps/cute-or-not-dogs) board along with wireframing and creating a ER diagram for the models.  

### +installation/startup instructions
1. Download the repository from Github to a local directory
2. Open up the project directory in terminal and run `bundle install` to install any gems needed
3. Start Postgres local server
4. In terminal, `rake db:migrate` to migrate the app's existing tables on Postgresql
5. In terminal, run `rails server` to start a local server so you can view the application locally
6. In the address bar of your browser, go to `localhost:3000`
7. Create users and dogs to see full functionality. 

### +user stories
As a user, I would like to find out if my dog is cute or not. 

As a user, I would like to see voting stats on the dogs that I upload. 

As a user, I would like to login and look at which dogs I've liked.

### +planned features
The icebox on my trello board has some ideas of mine that include but are not limited to: 

* I added a page for the top voted dogs but wasnt able to update hte page without caching the act as votable model.  
* Remove dogs from homepage randomize if user has already voted on them. 
* Pretty error pages 
* Add breed as a column in dogs model and add filtering voting based on breed. 

### +sources
* [Acts as votable help](https://masteruby.github.io/weekly-rails/2014/08/05/how-to-add-voting-to-rails-app.html#.WpRXlRPwbOQ)
* [favicon generator](https://www.favicon-generator.org/)
* [Full page background documentation](https://css-tricks.com/perfect-full-page-background-image/)
* Fonts: [1](https://fonts.google.com/specimen/Nanum+Myeongjo) [2](https://fonts.google.com/specimen/Pacifico)