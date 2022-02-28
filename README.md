## Docker with React

#### DEVELOPMENT WORKFLOW

This is used for when developing the react application; i.e. development mode. This config will enable hot reloading for both the react app and the react tests, esentially automating the `npm run start` and `npm run test` commands when the `docker-compose up` command is run

- Create the react project as usual with `create-react-app`
- Create the `Dockerfile.dev` for use during development

###### Manually building & starting the development server:

- Build the docker image using command: `docker build -f Dockerfile.dev .`
- Start the development server using the command:
  `docker run -p <EXTERNAL PORT>:<INTERNAL PORT> -v /app/node_modules -v $(pwd):/app <IMAGE ID>`
- Visit the react app on the browser at `localhost:3000`

###### Using docker compose to build & start the development server:

- Create the `docker-compose.yml` file and point it to use the Dockerfile.dev file
- Run `docker-compose up`

#### PRODUCTION DEPLOY

This is used to run the react app that was built following the `npm run build command`

- Create the react project as usual with `create-react-app`
- Create a `Dockerfile` with configuring for the react app builder phase and nginx startup
- Build the image using: `docker build .` and grab the container id
- Manually start the container using: `docker run -p 8080:80 <CONTAINER ID>`. 8080 is the <External PORT> and 80 is the default nginx <INTERNAL PORT>
- The app can be accessed at `http://localhost:8080`
