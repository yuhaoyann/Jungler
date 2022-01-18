# Jungle

A mini e-commerce application built with Rails 4.2.

# Additional features

The `Admin` page allows managers of the application to add sales events, manage categories and products.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
1. Remove Gemfile.lock
1. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Change the admin username/password in .env file
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Final Product

- main page
  !["main page"](https://github.com/yuhaoyann/scheduler/blob/master/public/docs/1.main_page.png)<br />
- create interview
  !["create interview"](https://github.com/yuhaoyann/scheduler/blob/master/public/docs/2.create_interview.png)<br />
- show interviews
  !["show interviews"](https://github.com/yuhaoyann/scheduler/blob/master/public/docs/3.show_page.png)<br />
- delete interview
  !["delete interview"](https://github.com/yuhaoyann/scheduler/blob/master/public/docs/4.delete_interviews.png)

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
