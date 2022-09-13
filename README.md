# Project: Gratify

_A go-to hub for keeping track of notes, quotes, and anything that is text-based. Built with Ruby gems such as Devise + Omniauth + (Active Storage + Cloudinary) + Simple Form + Pagy._

<div align="center">
  <img src="public/assets/project_logo.png" />
</div>

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.gratify-me&color=000000&lcolor=000000&style=for-the-badge&logo=Github)

<a href="https://wakatime.com/@JuzerShakir/projects/bymgryqiii?start=2021-11-09" target="_blank"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/d1c88212-ffbd-4d07-bb6b-ac2c156be01e.svg" alt="wakatime"></a>

## ❗ Objectives

This web-app must accomplish the following:

- [x] Login users with social services (providers) such as Google, GitHub & Twitter with the help of Devise and Omniauth.
- [x] Make sure there's only one login created for each email regardless of which provider he/she uses.
- [x] If a user signs in with the same email but with a different provider, automatically sign in with the provider they logged in initially.
- [x] After user signs in, they can add more info about them via the Profile page.
- [x] Ability to add profile photos via Active Storage & Cloudinary and display photos on the page with a focus on the face.
- [x] Users can then add notes, quotes, etc to their feed. Show error when they try to add an empty post.
- [x] Show users' posts on their homepage sorted from the latest.
- [x] Provide users the ability to search words or expressions of the post they created through the Search Form gem.
- [x] Show appropriate flash messages wherever necessary.
- [x] Show sign-up count to logged-out users.
- [x] Build a responsive site using bootstrap.
- [x] When a user manually enters a URL that doesn't exist, redirect them to the homepage with a flash message informing them that the URL doesn't exist.

---

## 💎 Required Gems

**This project was built on Ruby version _2.7.2_.**

Following important gems were installed in these versions:

| **Gem Names** |      **Gem**       | **Version** |                     **Use**                      |
| :-----------: | :----------------: | :---------: | :----------------------------------------------: |
|     Rails     |     _'rails'_      | **6.1.4.1** |    _Use for executing and rendering web-app_     |
|  Postgresql   |       _'pg'_       |  **1.2.3**  | _Use postgres as the database for Active Record_ |
|   Bootstrap   | _'bootstrap-sass'_ |  **3.4.1**  |                _For SCSS Styling_                |
|    Devise     |     _'devise'_     |  **4.8.0**  |        _Flexible authentication solution_        |
|   Omniauth    |    _'omniauth'_    |  **2.0.4**  |         _Authenticate via Social logins_         |
|  Cloudinary   |   _'cloudinary'_   | **1.21.0**  |    _A cloud service for storing user images_     |
|  Simple Form  |  _'simple_form'_   |  **5.1.0**  |  _Search query through attributes in database_   |
|     Pagy      |      _'pagy'_      |  **5.3.1**  |                 _For Pagination_                 |

---

## ⚙️ Setting up a PostgreSQL user

If you don't have a user set on postgres, here's how to set new user:

```bash
sudo -u postgres createuser -s [username]
```

To set a password for this user, log in to the PostgreSQL command line client:

```bash
sudo -u postgres psql
```

Enter the following command to set the password:

```bash
\password your_password
```

Enter and confirm the password. Then exit the PostgreSQL client:

```bash
\q
```

---

## 📋 Execution

Run the following commands to execute locally:

The following will install required version of ruby (make sure [rvm is installed](https://rvm.io/rvm/install).)

```bash
rvm use 2.7.2
```

```bash
git clone git@github.com:JuzerShakir/gratify-me.git
```

```bash
cd gratify-me
```

```bash
bundle install
```

#### 💡 Imp Note:

To successfully create development and test database, you will need to update `config.database.yml` file with correct postgresql username and password.
To edit the it without exposing your credentials, give the following command:

```bash
EDITOR="code --wait" rails credentials:edit
```

_`code` for Visual Studio Code_
_`subl` for sublime_

This will open `crendetial.yml` file and enter credential as follows in it:

```
database:
  username: your_username
  passwordt: your_password
```

Hit `ctrl + s` to save and then close the `credential.yml` file from the editor. This will save the credentials. To check if it did save, run the following inside rails console:

```
Rails.application.credentials.dig(:database, :username)
```

```bash
rails db:create
```

To use Social Login services you will need to create apps for each provider you want to use to generate tokens and secret on their respective developer site.

After creating tokens and secrets for each provider, use `credential.yml` file to store the credentials :

```
provider:
  id: abcdefg
  secret: xxxxx
```

Replace `provider` with provider name such as google, twitter etc and enter your id and secret for respective providers.

The code in the `config/initializers/devise.rb` helps load these credentials for each provider.

To use cloudinary, make a cloudinary account. After creating, visit Dashboard page and just right to the 'Account Details' you will see `Download YML`, click on it and save the file in your `config/` folder as `cloudinary.yml` file. Keep it as it is. **DO NOT EDIT IT!**

After setting up all this, you're ready to use this webapp.

```bash
rails s
```

---

To see this web-app up and running, I have deployed it on [Heroku](https://gratify-me.herokuapp.com/).

---
