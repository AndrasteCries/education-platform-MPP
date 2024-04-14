# EducationPlatform

## Descriprion 

It is an application in which you can see your classes you have, see your grades and schedule if you are a student, or if you are a teacher, manage your courses and groups.

# Table of Contents
1. [API documentation](#API)
2. [Diagrams](#diagrams)
3. [Scripts](#scripts)
4. [Installation](#installation)

## API

## Diagrams

### Database ER-diagram
![DB ER-diagram](https://github.com/AndrasteCries/education-platform-MPP/blob/main/docs/ER_diagramm_v2.png)

## Scripts

1. Default scripts:
```sh
    #Database migrate
    rake db:migrate

    #Seed data
    rake db:seed
```
2. Custom sctipts:
    - Parse links from  and save data to CSV and database
    ```sh
        rake parse:links
    ```

## Installation
1. Clone the repository from GitHub:
```sh
    git clone https://github.com/AndrasteCries/education-platform-MPP.git
```
2. Navigate to the project directory:
```sh
    cd EducationPlatform
```
3. Install dependencies using Bundler:
```sh
    bundle install
```
4. Configure the database:
```sh
    rake db:migrate
```
5. Start the application:
```sh
    rails server
```
6. Access the application in your web browser at:
```sh
    http://localhost:3000
```