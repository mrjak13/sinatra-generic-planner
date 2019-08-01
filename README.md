# Sinatra Generic Planner

Welcome to your Generic Planner!

You can keep track of your daily meetings, or oraganize departments by unique groups.  This app is for both personal use and can easily be expanded company wide.

Admin is set up for CRUD functions.

## Getting Started

Fork and clone the application to your machine, add provided data to database, startup the server, and you are good to go. See deployment for notes on Google Omniauth.


### Installing

Fork and clone the application to your machine.

```
$ git clone git@github.com:mrjak13/sinatra-generic-planner.git
```

Change directory into the application.

```
$ cd username/folder/sinatra-generic-planner
```

Install Gems.

```
$ bundle install
```

Set up the database and migrations.

```
$ rake db:migrate
```

Add data to database
***Must do this for full functionality of application***

```
rake db:seed
```

Start Sinatra server

```
shotgun
```

Open your browser and go to provided url.  Usually: http://localhost:9393

Log in and get planning!
***use login: admin@admin.com password: admin for full functionality***


## Built With

* [Sinatra](http://sinatrarb.com/) - The web framework used
* [Bootstrap](https://getbootstrap.com/) - CSS Library

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details