NAME = inception

DC = docker-compose

DC_SRC = ./srcs/docker-compose.yml
VOLDIR = /home/jaemjeon/data

all : ${NAME}

${NAME} :
	$(DC) -f $(DC_SRC) up -d

up : all

down :
	$(DC) -f $(DC_SRC) down

stop :
	$(DC) -f $(DC_SRC) stop

clean :
	$(DC) -f $(DC_SRC) down -v --rmi all
	$(DC) -f $(DC_SRC) rm

build :
	$(DC) -f $(DC_SRC) build

build-nocache :
	$(DC) -f $(DC_SRC) build --no-cache

restart :
	$(DC) -f $(DC_SRC) restart

clean-vol :
	rm -rf $(VOLDIR)

fclean : clean clean-vol

re : fclean all

.PHONY: all up down clean build build-nocache restart clean-vol fclean re
