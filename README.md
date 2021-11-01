# ibis-build-action

A GitHub Action to automatically run ibis builds on merge to `main`.

![Ibis GitHub Action](https://user-images.githubusercontent.com/21223421/139258477-107b1da3-6c02-4a81-a827-d58380a43252.png)

---

### Ibis

[Ibis](https://github.com/themsaid/ibis) is a PHP tool that lets you write eBooks in Markdown.

---

### Usage

In order to automatically build your Ibis PDF files, create a directory called `.github/workflows/` and add a fill called `ibis.yml` with the following content:

```yaml
name: Ibis eBook Generation
on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@main
      with:
        fetch-depth: '0'
    - name: Build Ibis Export Files
      uses: bobbyiliev/ibis-build-action@main
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        IBIS_PATH: './'
        IBIS_BRANCH: 'main'
        EMAIL: 'bobby@bobbyiliev.com'
        COMMIT_MESSAGE: 'Updated Ibis Exorted Files'
```

## Environment Variables

* `GITHUB_TOKEN`: Required for permission to tag the repo. You can leave it as it is.
* `IBIS_PATH`: The path to the Ibis init folder. By default it is `./` but if you have a custom location, make sure to udpate it
* `IBIS_BRANCH`: The Branch that the Ibis exported files will be commited and pushed to. Default is `main`.
* `EMAIL`: The email address that the commit will be associated with.
* `COMMIT_MESSAGE`: The commit message.

## Workflow

* Add this action to your repository
* Commit some changes
* Either push to `main` or open a PR
* On push (or merge), the action will:
    * Clone the repository
    * Run the `ibis build` commands including the sample builds
    * Stage and commit the new exported eBook files to the specified branch
    * Pushes tag to GitHub

## Ebook Projects using ibis-build-action

* [Introduction to Docker](https://github.com/bobbyiliev/introduction-to-docker-ebook)
* [Introduction to Git and GitHub](https://github.com/bobbyiliev/introduction-to-git-and-github-ebook)
* [Introduction to Bash Scripting](https://github.com/bobbyiliev/introduction-to-bash-scripting)
* [Introduction to SQL](https://github.com/bobbyiliev/introduction-to-sql)
* [Laravel tips and tricks](https://github.com/bobbyiliev/laravel-tips-and-tricks-ebook)
