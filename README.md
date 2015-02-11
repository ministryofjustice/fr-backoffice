# Fee Remission

This is the source code for the fee remission back office application

## Local setup
Ensure postgres is installed and running

```
git clone https://github.com/ministryofjustice/fr-backoffice.git
cd fr-backoffice
bundle install
rake db:create
rake db:migrate
rails s
```



Heroku:

https://fr-backend-proto.herokuapp.com/claims/new