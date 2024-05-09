# The Mongoose Den

[The mongoose den](https://the-mongoose-den.com)

Why that name ? It's an easy answer, because mongooses are the cutest and most powerfull animals on earth. More seriously, it's because mongooses are social animals. They live in a community and practice mentoring. They raise their young in groups and an older individual will take a young person under his wing even if he is not the direct parent.

## Purpose
This is the final project of the rails course of The Odin Project [curriculum](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project). The purpose of this application is to be a social network clone, as twitter or reddit.

## Design (CSS framework)

[Bulma](https://bulma.io/) is used. That framework is made for mobile first purpose.

## Features

### Login with external providers

I used the [devise](https://github.com/heartcombo/devise) gem with omniauth support for login with external providers. For now there are two providers handled by the app: Github, Google

### Post creation

When you create a post, that post is visible by all people following you. You can also go to the general timeline to see all posts ordered by the most recent first.

### Comment posts

You can comment all posts. A comment count appears in the timeline post box. If you click on that comment icon you will be redirected to the post page on the comment anchor. I made the comment model polymorphic, in the future it will be great to comment other commentable models (like images or other comments).

### Like posts

There is a like button on every post, the shape of the icon changes if you ever added a like on that post. The like button is present on the show and on the index view.

### Follow users

There is a follow user button on every user profile (other than yours). When you follow someone, you will see every post that they made on your timeline.

### Notify users

Every time you like, comment or follow, a notification will be sent to the user's related post, profile, etc. You can view all notifications in a dedicated view. There are also a count layer on the notification icon (the bell). I used [Fontawesome](https://fontawesome.com) layers to do that.

### Users avatars

For now I use [Gravatar](https://gravatar.com/) to provide avatar for the users. In the future, users will be able to upload their own images.

## Getting started

- Clone this repo
- install ruby (3.1.2)
- install all gems: `bundle install`
- migrate the database : `rails db:migrate`
- seed the database, (seed.rb to check what it's done): `rails db:seed:plant`
- launch server : `rails s`

### Config

I use [figaro](https://github.com/laserlemon/figaro) to handle env variable in the app. You just have to create a file  in `config/application.yml`.

The folling keys are used: 

#### Github omniauth config:

```yaml
GITHUB_KEY: "..."
GITHUB_SECRET: "..."
```

#### Google oauth2 omniauth config:


```yaml
GOOGLE_KEY: "..."
GOOGLE_SECRET: "..."
```

#### Mailgun: 

```yaml
MAILGUN_API: "..."
```

## Hosting

My app is hosted on [clever-cloud](https://www.clever-cloud.com/)

## Mailing

I use [mailgun](https://www.mailgun.com/) to deliver mails

## TODO

- use slug for users URL, and post URLS

Made for [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project)