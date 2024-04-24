DOCKER_PRUNE := docker system prune

build: host router

clean:
	$(DOCKER_PRUNE) -f

fclean:
	$(DOCKER_PRUNE) -af

re: fclean build

%: docker/%.Dockerfile
	docker build -f $< -t $@ .

.PHONY: build clean fclean re
