### WOOFR - Twitter for dogs. 

![WOOFR APP IMAGE](/WOOFR_app.png)

### CLICK HERE to try out WOOFR: https://woofr-project2-sei39.herokuapp.com/

Log In details if user doesn't want to sign up: 
- Username: Test 
- Email: test@test.com
- Password: test

## Development / Functionality 

This is an application created for your furry friends - because they deserve their own social media. 

A database backed web application. 

- Full stack application 
- CRUD functionality 
- Sign up and log in functionality, post new "woofs" which include an image, text and "feeling" in the form of an emoji chosen from a drop down menu
- User accounts (creation, read, update and delete)
- User profile page where it shows user icon, about me, details as well as password can be changed and updated
- "Woofs" aka posts (creation, read, update and delete)
- Comments (creation, read, update and delete)
- See other dog's woofs and other dogs profiles if click on their icon
- Update your profile, add an icon, location and bio, comment on other dogs' woofs, and more. 
- Upload functionality for images was added with the help of Cloudinary. 
- RESTful routes 
- Deployed online and accessable publically 

### Technologies Used 

- Ruby
- HTML
- CSS
- SQL 
- PostgreSQL
- Sinatra
- Cloudinary
- BCrypt

### Configuration:

Gems needed:
- gem 'sinatra'
- gem 'pg'
- gem 'bcrypt'
- gem 'cloudinary'

Database creation:
As per above the database used for this is PostgreSQL ("pg"). A pg database must be active on the server machine.

### Planning 

- Had an idea to make twitter social media app for dogs inspired by my own puppy 
- Wanted to implement features of facebook, twitter, instagram etc. 
- Wireframe was made up as part of planning process 

![woofr wireframe](/wireframe.png)

### Problems 

#### Fixed Problems 
- Use of cloudinary, new tech which I implemented the day before presentation, in retrospect wiser to learn and implement new tech at the start of the project, but got it working in the end 
- Deploying to heroku had a few glitches 

#### Persisting Problems 
- Could do further refactoring if time had permitted 

### Lessons 
- Plan out time use wisely, ideally work with new tech first and things I am comfortable with later i.e. CSS implement in the end as this is one of my strengths, rather than CSS first and Cloudinary implementation on the last day. 

### Stretch goals 
- Add like button 