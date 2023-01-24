all:
	mkdir -p /home/telli/42/data/wordpress
	mkdir -p /home/telli/42/data/database
	-docker compose -f srcs/docker-compose.yml up -d --build

stop:
	-docker compose -f srcs/docker-compose.yml stop

clean: stop
	-docker compose -f srcs/docker-compose.yml down --volumes --remove-orphans

fclean: clean
	-docker system prune -af --volumes 2> /dev/null

re: fclean all

.PHONY: all stop clean fclean re