# [Taskwell API](https://taskwell-api.herokuapp.com/) 

- [Description](#description)
- [Installation](#installation)
- [Contact](#contact)

## Description
[Taskwell API](https://taskwell-api.herokuapp.com/) is a REST API built in Ruby on Rails, this API serves a React front end client. You can find the front end client repository [here](https://github.com/rociac/taskwell)

Ruby Version : ```3.0.0```
Rails Version: ```6.1.3.1```

## Installation

1. Clone the project to your local directory
```
git clone https://github.com/rociac/taskwell.git
```
2. Install all project gems
```
bundle install
```
3. Set up the database
```
rails db:setup
```
4. Start the development server
```
rails server
```

## Endpoints

###GET
  https://taskwell-api.herokuapp.com/current_user               -> Authenticated user details
  https://taskwell-api.herokuapp.com/api/projects/user_projects -> Current user created projects
  https://taskwell-api.herokuapp.com/api/user_favorites         -> Current user favorite projects
  
###POST
  https://taskwell-api.herokuapp.com/login                  -> Authenticates user and creates new session
  https://taskwell-api.herokuapp.com/signup                 -> Creates new user
  https://taskwell-api.herokuapp.com/api/projects           -> Creates new project
  https://taskwell-api.herokuapp.com/api/favorite_projects  -> Adds project to favorites

###DELETE
  https://taskwell-api.herokuapp.com/logout -> Destroys current user session
  
  

## Contact

You can contact me at:

- [Email](mailto:acosta.rodolfo.rca@gmail.com)



