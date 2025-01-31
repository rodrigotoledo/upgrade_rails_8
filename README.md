# Project Instructions

Need To Clean All Your Docker?

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune -a --volumes -f
docker network rm $(docker network ls -q)
rm .db-created
rm .db-seeded
rm Gemfile.lock
```

## With Docker

## Putting In Development Mode

Whereas It Is Necessary To Run With Your User, Run

```bash
id -u
```

And Change The Dockerfile.Development File With The Value You Found

So Build You Just Need To Run The First Time:

```bash
docker compose -f docker-compose.development.yml build
```

And To Climb The Application Rode:

```bash
docker compose -f docker-compose.development.yml up
docker compose -f docker-compose.development.yml down
docker compose -f docker-compose.development.yml run app bash
docker compose -f docker-compose.development.yml run app rails active_storage:install
docker compose -f docker-compose.development.yml run app rails action_text:install
```

## Migrations

To Run Migrations, Tests ... Etc, Run The App With Whatever Is Needed:

```bash
docker compose -f docker-compose.development.yml run app rails db:drop db:create db:migrate
```

## Rails Commands

Example Of Interaction Between Computer And Container:

```bash
docker compose -f docker-compose.development.yml run app rails g scaffold post title
docker compose -f docker-compose.development.yml run app rails g scaffold comment post:references comment:text
docker compose -f docker-compose.development.yml run app rails c
```

## Testing with Docker

For Tests For Example Run `Guard`:

```bash
docker compose -f docker-compose.development.yml run app bundle exec guard
```

## Security with Docker

```bash
docker compose -f docker-compose.development.yml run app bin/rubocop -A
docker compose -f docker-compose.development.yml run app bundle exec brakeman
docker compose -f docker-compose.development.yml run app bundle exec bundle-audit
```

or in one line

```bash
docker compose -f docker-compose.development.yml run app bundle exec rubocop -A ; docker compose -f docker-compose.development.yml run app bundle exec brakeman ; docker compose -f docker-compose.development.yml run app bundle exec bundle-audit
```

For Migrations (Remembering That You May Need To Run Both In Development And Test):

```bash
docker compose -f docker-compose.development.yml run app rails db:migrate
```

## Putting Down

If You Want To Stop The Services:

```bash
docker compose -f docker-compose.development.yml down
```

## Putting In Development Mode Without Docker

Whereas It Is Necessary To Run With Your User, Run

```bash
id -u
```

And To Climb The Application Rode:

```bash
rails active_storage:install
```

Recompose the database:

```bash
rails db:drop db:create db:migrate db:seed
rake db:schema:dump
```

## Testing

For Tests For Example Run `Guard`:

```bash
bundle exec guard
```

## Security

It's a good practice to use annotate, brakeman and rubocop when you are developing. You can setup your own configuration using the example that exists in `.vscode.example` renaming to `.vscode`.

## Tips about tailwind

If you are using tailwind, maybe you should change the `Procfile.dev` to listen the correct address:

```Provfile.dev
web: bin/rails server -b 0.0.0.0
css: bin/rails tailwindcss:watch
```

## Git Flow

This project uses the Git Flow branching model to manage development and releases. Below are the basic commands to get started with Git Flow.

### Git Flow Branches

- **`main`**: The production-ready branch.
- **`staging`**: The staging-ready branch.
- **`develop`**: The branch where features are integrated.
- **`feature/{feature-name}`**: Branches for developing new features.
- **`release/{version}`**: Branches for preparing a new release.
- **`hotfix/{fix-description}`**: Branches for urgent fixes.

1 . Start a New Feature:

```bash
git flow feature start {feature-name}
```

2 . Finish a Feature:

```bash
git flow feature finish {feature-name}
```

Replace {feature-name} with your feature name.

3 . Start a Release:

```bash
git flow release start {version}
```

Replace {version} with the version name.

4 . Finish a Release:

```bash
git flow release finish {version}
```

5 . Start a Hotfix:

```bash
git flow hotfix start {fix-description}
```

6 . Finish a Hotfix:

```bash
git flow hotfix finish {fix-description}
```
