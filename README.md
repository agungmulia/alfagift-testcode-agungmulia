# Spring Boot & Vue 3 User and User Role Project
![image](https://github.com/agungmulia/alfagift-testcode-agungmulia/assets/90015124/0472814f-661f-40d6-b014-ea777a75ffe6)
![image](https://github.com/agungmulia/alfagift-testcode-agungmulia/assets/90015124/bb7d2f77-3d99-463d-94d6-97cbd3f906a9)
The primary objective of this project is to implement CRUD (Create, Read, Update, Delete) operations for the User entity, allowing seamless management of user data. Additionally, the project includes functionality to insert User Roles, which are connected to the User table.

The application leverages the power of Spring Boot to provide a robust and scalable backend framework. It takes advantage of Spring Data JPA to simplify database operations and Spring Security to ensure secure access to the application's resources.

On the frontend, the project utilizes Vue 3, a progressive JavaScript framework, to create an interactive and dynamic user interface. Vue Router is employed for handling navigation between different views, while Vuex is used for state management, ensuring a smooth and efficient user experience.

## Getting Started

To get started with this project, follow the steps below.

### Prerequisites

- Java Development Kit (JDK) version 11 or higher
- Apache Maven or Gradle (depending on the build tool used by the project)
- Node JS
- PostgreSQL

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/your-repository.git
   ```
#### Backend
1. Clone the project
3. Run `mvn clean install`
4. Create database
5. Navigate to `application.properties` in the main\resource and set the file to your database url
   ```
   spring.datasource.url=jdbc:postgresql://(your postgresql db link)
   spring.datasource.username=(your postgresql username)
   spring.datasource.password=(your postgresql password)
   spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
   spring.jpa.hibernate.ddl-auto=update
   ```
6. Run `mvn spring-boot:run` to start the project or use springboot dashboard extension
#### Frontend
1. Navigate to `vue` folder using terminal `cd vue`
2. Run `npm install` to install vue.js project dependencies
3. Start frontend by running `npm run dev`
4. Open the link

#### Other Set Up
1. The website requires the cors service to be connected, copy the vue link and copy it to UserController and UserRoleController headers
![image](https://github.com/agungmulia/alfagift-testcode-agungmulia/assets/90015124/6c7cd228-89a1-4744-9493-df187779a9e1)

