![](https://img.shields.io/badge/Microverse-blueviolet)

# Travel Easy API

> API rails to fetch trips app.

Created with the purpose of store data of travel packages and users.
The user can create an account. This account may be updated or deleted.
Only the users with admin credentials can create, update and delete "Trips."
A user can add trips to their "Favorites"

## Built With

- Ruby 2.7.0
- Rails 6.1.4.1
- Git
- Rspec

## Getting Started

To get a local copy up and running follow these simple example steps.

<br>

### Prerequisites

- Basic knowledge of the terminal of your computer
- Basic knowledge of git
- Ruby 2.6.0 or later version
- Rails pre-installed
- Postman (or any other API testing app)

**If you don't have plenty of knowledge of one of these, here are some helpful links that can explain to you how to get and/or use them.**

**Terminal**
[- Basic guide](https://www.techrepublic.com/article/16-terminal-commands-every-user-should-know/)
<br>

**Git**
[- Basic guide](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)
<br>

**Ruby**
[- Installation](https://www.ruby-lang.org/en/documentation/installation)
[- Quickstart](https://www.ruby-lang.org/en/documentation/quickstart/)
<br>

**Rails**
[- A playlist of videos that shows you how to install and use it](https://www.youtube.com/watch?v=iF8caVyDi5g&list=PLCC34OHNcOtrk3BDsfZwf4GattdLoKCOF)
<br>
<br>

### Setup

<br/>

> 1. Clone this repo into your computer

- Go to your terminal and type:

      $ git clone https://github.com/AlejandroNo4/capstone-api.git

- Now, change the folder direction, type:

      $ cd capstone-api

> 2. Install Gems, run migration and the server on the terminal

- You will need to have some gems that are already in the Gemfile. You just need to type and run:

      $ bundle install

- Now to migrate:

      $ rails db:migrate

- and finally, to run the server, type and enter:

      $ rails server

- Open your API testing app and go to the URL http://localhost:3000 with one of the endpoints described in the next section.

<br/>

## Endpoints

**TIP** 🙌🏽  You can use this npm library called [Object-to-formdata](https://www.npmjs.com/package/object-to-formdata) on some of your front-end requests. The usage is intuitive and simple. 💥

<h3 align="center">Create a user 👤<h3>

<br/>

        POST /api/v1/users

      {
        user: {
          username: "",
          email: "",
          password: "",
          password_confirmation: "",
          image: [file]
        }
      }

<br/>

<h3 align="center">Update a user (user must be logged in) 👤<h3>

        PATCH  /api/v1/users/{user_id}

      {
        user: {
          username: "",
          email: "",
          password: "",
          password_confirmation: "",
          image: [file]
        }
      }

<br/>

<h3 align="center">Delete a user (user must be logged in) 👤<h3>

        DELETE  /api/v1/users/{user_id}

<br/>

<h3 align="center">Get a user info 👤<h3>

        GET  /api/v1/users/{user_id}

<br>
<br>

<h3 align="center">Request ALL trips ✈️✈️<h3>

<br>

        GET  /api/v1/trips

<br>

<h3 align="center">Request ONE trip ✈️✈️<h3>

<br>

        GET  /api/v1/trips{trip_id}

<br>

<h3 align="center">Create a trip ✈️✈️ (only by admin logged in, details below)<h3>

<br>

        POST  /api/v1/trips

      {
        trip: {
          destiny: "",
          price: "",
          description: "",
          days: "",
          hotel: "",
          trip_type: "",
          images: [multiple files]
        }
      }

<br>

<h3 align="center">Update a trip ✈️✈️ (only by admin logged in, details below)<h3>

<br>

          PATCH  /api/v1/trips

      {
        trip: {
          destiny: "",
          price: "",
          description: "",
          days: "",
          hotel: "",
          trip_type: "",
          images: [multiple files]
        }
      }

<br>

<h3 align="center">Delete a trip ✈️✈️ (only by admin logged in, details below)<h3>

<br>

          DELETE  /api/v1/trips/{trip_id}

<br>
<br>

<h3 align="center">ADD a trip to the favorites 👤 💕 🚗 (user must be logged in)<h3>

<br>

          POST  /api/v1/favorites

          {
            trip_id: ""
          }

<br>

<h3 align="center">REMOVE a trip from favorites 👤 💔 🚗 (user must be logged in)<h3>

<br>

          DELETE  /api/v1/remove_favorite

          {
            trip_id: ""
          }

<br>
<br>



### 🚧 Important note to use the Trip CRUD 🚧

As mentioned before, a user must be an admin to create, update and delete a trip. The API is not designed to add an admin with routes, so the only way is through the console.
The user data table has a specific column called **admin** and is set by default to **false**.

Then, to add an admin user from the rails console, would be something like:

        User.create!(username: "Admin example", email: "avalid@email.com", password: "blah", password_confirmation: "blah", admin: true)

Then you can log in with this user and manage the trips.

<br>
<br>

### Run tests

To run rests, type in the terminal:

          $ bundle exec rspec

## Author

👤 **Alejandro Guadalupe Contreras Rodriguez**

- GitHub: [@AlejandroNo4](https://github.com/AlejandroNo4)
- Twitter: [@Alejand80002666](https://twitter.com/alejand80002666)
- LinkedIn: [Alejandro Contreras Rodriguez](https://www.linkedin.com/in/alejandro-contreras-rodriguez-b524821b5/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AlejandroNo4/capstone-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- To understand how to create the API, I followed these videos from [edutechional](https://www.youtube.com/watch?v=z18zLCAg7UU)

## 📝 License

This project is [MIT](./MIT.md) licensed.
