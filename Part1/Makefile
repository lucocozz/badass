build:
	docker system prune -af
	docker build -f "Host.Dockerfile" -t host .
	docker build -f "Router.Dockerfile" -t router .

.PHONY: build
