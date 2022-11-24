# Jungle

An e-commerce application built with Rails 6.1 to simulate being introduced to a new position and stack.  
This project challenged me to learn new technologies (Ruby on Rails) quickly and begin working on an existing codebase.  
It helped me hone my research and adaptation skills, as well as my ability to study the existing code and build on top of it.

## Key Takeaways
1. It is possible (and often expected) for devs to contribute to a project before mastering the underlying technologies.
2. To do so, one needs to be able to research, learn from the existing code, and ask questions when needed.
3. In the real world, tasks are given as general descriptions of the issues instead of step-by-step instructions, and it is up to the devs to figure out HOW to accomplish them.

## Assignments

* Fix money formatting across different views
* Implement empty cart message
* Implement sold out badge and disable "Add to cart" button on items with no stock
* Implement order summary after an order is placed
* Implement authentication for Admin pages
* Build admin dashboard with product and category counts
* Build admin category page to view or create product categories
* Implement user registration and login features
* Perform model tests with RSpec and integration tests with Cypress 

## Final Product
!["gif of home page and cart"](https://github.com/keikaloustian/jungle-rails/blob/master/docs/homepage-product.gif?raw=true)
<br><br>
!["gif of authentication"](https://github.com/keikaloustian/jungle-rails/blob/master/docs/auth.gif?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
