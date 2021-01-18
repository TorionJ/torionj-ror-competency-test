# Competency Test

## Setup

Clone down this project into your local machine and run:
`bundle install`
`rails s`

Check the db.seeds file for user credentials.

To run the test:

`rails test:models`

`rails test:controllers`


## User Personas
The project will have multiple roles that interact with each other.
- [x] Guest (No Login)
- [x] Vanilla Users (Logged in - No special role)
- [x] Editor Users
- [x] Admin Users *(Extra Credit)*

## User Functionality
##### Guests (No Login)
- [x] Can see homepage with first 3 articles from each category.
- [x] Can see article index page.
- [x] Are sent to login/signup page if they want to see article show page.
  - [x] Signup form can be included on the login page or just linked to from the login page.
- [x] Can signup
- [x] Can Login

##### Vanilla Users
- [x] Can see everything a guest can
- [x] Can see article show pages. 
- [x] Can logout

##### Editor Users
- [x] Can do everything a vanilla User can.
- [x] Can create articles
- [x] Can delete articles that they created
- [x] Can edit articles that they created
- [x] Can NOT delete or edit articles created by others

##### Admin User *(Extra Credit)*
- [x] Can create users and set roles.
- [x] Can edit users and change roles.
- [x] Can't edit/destroy/create articles.

## Article Table
- [x] Table will contain **title**, **content**, **category**, **user_id**.

## Roles
- [x] Use one of these gems: Petergate *(Preferred)*, Pundit, Cancancan, Rolify.
###### Role Names
- [x] user
- [x] editor
- [x] admin *(Extra Credit)*

## Database
- [x] Use sqlite

## Testing
- [x] Use minitest as the test suite. 

## Authentication
- [x] Devise can be used for authentication.

## Templating
- [x] slim *(Prefered)*, haml, erb





