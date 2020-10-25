WOOFR - Twitter for dogs. 

Try out WOOFR here: https://woofr-project2-sei39.herokuapp.com/

![WOOFR APP IMAGE](/WOOFR_app.png)

This is an application created for your furry friends - because they deserve their own social media. 

Made with Ruby, HTML and CSS, as well as using PostgreSQL and Sinatra. 

There is functionality to sign up, log in, post new "woofs" which include an image, text and "feeling" in the form of an emoji chosen from a drop down menu, see other dog's woofs, update your profile, add an icon, location and bio, comment on other dogs' woofs, and more. 

- User accounts (creation, read, update and delete)
- "Woofs" (creation, read, update and delete)
- Comments (creation, read, update and delete)

- Upload functionality for images was added with the help of Cloudinary. 

Configuration:
Gems needed:

gem 'sinatra'
gem 'pg'
gem 'bcrypt'
gem 'cloudinary'

Database creation:
As per above the database used for this is PostgreSQL ("pg"). A pg database must be active on the server machine.

Brief: 
# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Project #2: Building Your First Full-stack Application

### Timetable

60 second pitch - 11:00am  
presentation - Monday 10:30am

### Overview

This second project is your first foray into **building a database backed web application.** You'll be **building a Sinatra app,** which means you'll learn about what it takes to build a functional application from the ground up yourself.

**This is exciting!** It's a lot, but we'll give you the tools to be able build what you need, and you get to decide what you do with it. We want to highlight the server side for this project but you get to be creative in choosing what sort of application you want to build! 

**You will be working individually for this project**, and you'll be designing the app yourself. We hope you'll exercise creativity on this project, sketch some wireframes before you start, and write user stories to define what your users will want to do with the app. Make sure you have time to run these ideas by your instructors to get their feedback before you dive too deep into code! Remember to keep things small and focus on mastering the fundamentals – scope creep/feature creep is the biggest pitfall for any project!

---

### Technical Requirements

Your app must:

* **Have _ideally_ 2 resources(tables)** (more tables if they make sense or less tables) – one representing someone using your application, and one that represents the main functional idea for your app
* **Include sign up/log in functionality(if they make sense)**, with encrypted passwords & an authorization flow
* **Have complete RESTful routes** for at least one of your resource with GET, POST, PATCH, and DELETE for read, create, update and delete
* **Include wireframes** that you designed during the planning process
* Have **semantically clean HTML and CSS**
* **Be deployed online** and accessible to the public

---

### Necessary Deliverables

* A **working full-stack application, built by you**, hosted somewhere on the internet
* A **link to your hosted working app** in the URL section of your GitHub repo
* A **git repository hosted on GitHub**, with a link to your hosted project,  and frequent commits dating back to the **very beginning** of the project. Commit early, commit often.
* **A ``readme.md`` file** with explanations of the technologies used, the approach taken, installation instructions, unsolved problems, etc.
* **Wireframes of your app**, hosted somewhere & linked in your readme (photos of your sketches on paper or whiteboard are fined)
* A link in your ``readme.md`` to the publically-accessible planning diagrams

---

### Bonus

* Interact with a external API 

### Suggested Ways to Get Started

* **Begin with the end in mind.** Know where you want to go by planning with wireframes & user stories, so you don't waste time building things you don't need
* **Don’t hesitate to write throwaway code to solve short term problems**
* **Read the docs for whatever technologies you use.** Most of the time, there is a tutorial that you can follow, but not always, and learning to read documentation is crucial to your success as a developer
* **Commit early, commit often.** Don’t be afraid to break something because you can always go back in time to a previous version.
* **User stories define what a specific type of user wants to accomplish with your application**. It's tempting to just make them _to-do lists_ for what needs to get done, but if you keep them small & focused on what a user cares about from their perspective, it'll help you know what to build
* **Write pseudocode before you write actual code.** Thinking through the logic of something helps.

---

### Potential Project Ideas

##### Cheerups
The world is a depressing place.

Your task is to create an app that will allow people to create and share "cheerups" - happy little quips to brighten other people's' days. Cheerups will be small - limited to 139 characters. Members will be able to promote Cheerups that they like and maybe even boost the reputation of the Cheerupper.

##### Bookmarket
You will create an application where users can bookmark links they want to keep.

But what if users could trade bookmarks for other bookmarks? Or sell bookmarks for points? Or send bookmarks to your friends. Or something even crazier.

##### Dating online

Online dating is a multibillion dollar industry. Produce a new online dating platform, allowing lonely single tech-workers to hook up and find true love.

The users of your new platform should be able to search for other people based on age, sex, etc, view other people's profiles (but these views will be tracked and shown to the profile owner) and send private, secure messages.

---

### Useful Resources

* **[Heroku](http://www.heroku.com)** _(for hosting your back-end)_
* **[Presenting Information Architecture](http://webstyleguide.com/wsg3/3-information-architecture/4-presenting-information.html)** _(for more insight into wireframing)_
* [Postgresql SQL commands](https://www.postgresql.org/docs/9.1/static/sql-commands.html)
* **[Trello](https://trello.com)** for tracking your todo list/user stories
* **https://sqlbolt.com/**
