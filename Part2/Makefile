build: prune
	docker build -f "Host.Dockerfile" -t host .
	docker build -f "Router.Dockerfile" -t router .

prune:
	docker system prune -af

.PHONY: build prune
