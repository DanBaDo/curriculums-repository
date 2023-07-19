# curriculums-repository

## Installation
```sh
git clone https://github.com/DanBaDo/curriculums-repository.git
cd curriculums-repository
cp config/local_env.yml_template config/local_env.yml
```
Edit `config/local_env.yml` and provide your values.
```sh
docker-compose build
docker-compose up
docker-compose run web bash
```
## Credits:
* Building Docker RoR development environment: https://nicolasiensen.github.io/2022-02-01-creating-a-new-rails-application-with-docker/
* Providing environment variables in RoR: https://railsapps.github.io/rails-environment-variables.html
* RoR Modules: https://medium.com/@jelaniwoods/ruby-on-rails-module-basics-520796391b82#:~:text=Load%20Modules%20in%20Rails,automatically%20loaded%20into%20your%20app.
* YARN: https://gist.github.com/chetan/1827484