NAME = inception

DC = docker compose

DC_SRC = ./src/docker-compose.yml
VOLDIR = ./src/data

all : ${NAME}

${NAME} :
	$(DC) -f $(DC_SRC) up -d

up : all

down :
	$(DC) -f $(DC_SRC) down

build :
	$(DC) -f $(DC_SRC) build -t ${NAME}

build-re :
	$(DC) -f $(DC_SRC) build --no-cache

clean :
	$(DC) -f $(DC_SRC) down --rmi all
	# $(DC) -f $(DC_SRC) rm

clean-vol :
	rm -rf $(VOLDIR)

fclean : clean clean-vol

re : fclean all
