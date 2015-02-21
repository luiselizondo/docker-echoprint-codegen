# Docker image for echoprint-codegen
Run https://github.com/echonest/echoprint-codegen inside Docker

To build:

		$ docker build -t luis/echoprint-codegen .

To run:

		$ docker run -v $(pwd)/audio:/audio luis/echoprint-codegen 

echoprint-codegen is released under the MIT License. The source included here has been cloned from https://github.com/echonest/echoprint-codegen
