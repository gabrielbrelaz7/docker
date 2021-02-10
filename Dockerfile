FROM node:alpine 


# Enviroments variables declarations 
ENV EXAMPLE = "Command X"

# The command RUN allow to run any script type bash or shell
RUN echo "This is text example with variable $EXAMPLE"

# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8080

# CMD is requirement, is the last command to be run when one container is created or restarted
CMD ["echo", "Hello", "World"]