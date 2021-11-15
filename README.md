# Project: Gratify
*Your go-to hub for keeping track of notes, quotes, and anything that is text-based. Built with Devise + Omniauth + (Active Storage + Cloudinary) + Simple Form + Pagy.*

<div align="center">
  <img src="public/assets/project_logo.png" />
</div>


![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.gratify-me&color=000000&lcolor=000000&style=for-the-badge&logo=Github)


<a href="https://wakatime.com/@JuzerShakir/projects/bymgryqiii?start=2021-11-09" target="_blank"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/d1c88212-ffbd-4d07-bb6b-ac2c156be01e.svg" alt="wakatime"></a>


## ❗ Objectives
This web-app must accomplish the following:
- [x] Login user with social services (providers) such as Google, GitHub & Twitter with the help of Devise and Omniauth.
- [x] Make sure there's only one login created for each email regardless of which provider he/she uses.
- [x] If a user signs in with same email but with different provider, automatically signin with the provider they logged in initially.
- [x] After user signs in, they can add more info about them via Profile page.
- [x] Ability to add profile photo via Active Storage & Cloudinary and display photo on the page with focus on face.
- [x] Users can then add notes, quotes etc to their feed. Show error when they try to add empty post.
- [x] Show users' posts in their homepage sorted from latest.
- [x] Provide users the ability to search words or expression of the post they created through Search Form gem.
- [x] Show appropraite flash messages where-ever necessory.
- [x] Show sign up count to logged out users.
- [x] Build a responsive site using bootstrap.
- [X] When a user manually enters a url that doesnt exist, redirect them to homepage with a flash message informing them that url doesn't exist.

----

## 💎 Required Gems

**This project was built on Ruby version *2.7.2*.**

Following important gems were installed in these versions:

|  **Gem Names**  |         **Gem**         | **Version** |                      **Use**                     |
| :------------:  |     :------------:      | :---------: |                    :---------:                   |
|      Rails      |        _'rails'_        |  **6.1.4.1**  |    *Use for executing and rendering web-app*     |
|   Postgresql    |          _'pg'_         |  **1.2.3**  | *Use postgres as the database for Active Record* |
|    Bootstrap    |  _'bootstrap-sass'_      |  **3.4.1**  |                *For SCSS Styling*                 |
|    Devise       |        _'devise'_       |  **4.8.0** |      *Flexible authentication solution*      |
|    Omniauth     |      _'omniauth'_       |  **2.0.4** |  *Authenticate via Social logins*     |
|    Cloudinary   |      _'cloudinary'_     |  **1.21.0** |  *A cloud service for storing user images*     |
|    Simple Form  |      _'simple_form'_   |  **5.1.0** |  *Search query through attributes in database*     |
|    Pagy         |       _'pagy'_        |  **5.3.1** |  *For Pagination*     |


----

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

-----

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

### 💡 Imp Note:
> The `config/database.yml` has been added to `.gitignore` but a similar file `config/database.yml.clone` exists in its place. You will need to add your own postgresql username and password in the file. And then rename the file by:

```bash
mv config/database.yml.clone config/database.yml
```
```bash
rails db:create
```

> **To use Social Login services, create apps for each provider you want to use to generate tokens and secret on their respective developer site.**

After creating tokens and secrets for each provider, give the folowing command:

```bash
EDITOR="subl --wait" rails credentials:edit
```
*('subl' for sublime)*

This will open `crendetial.yml` file and enter credential as follows in it:

```
provider:
  id: abcdefg
  secret: xxxxx
```
Replace `provider` with provider name such as google, twitter etc and enter your id and secret for respective providers.

After adding, hit `ctrl + s` to save and then close the `credential.yml` file from sublime editor. This will save the credentials. To check if it did save, run the following:

```
Rails.application.credentials.dig(:provider, :id)
```
*Replacing `:provider` with the provider name.*

The code in the `config/initializers/devise.rb` helps load these credentials for each provider.


> To use cloudinary, make a cloudinary account. After creating, visit 'Dashboard' page and just right to the 'Accout Details' you will see `Download YML`, click on it and save the file in your `config/` folder as `cloudinary.yml` file. Keep it as it is.**DO NOT EDIT IT!**

After setting up all this, you're ready to use this webapp.

```bash
rails s
```

ENJOY!

-----

To see this web-app up and running without executing above commands locally,
I have deployed it on [Heroku](https://gratify-me.herokuapp.com/).

-----

