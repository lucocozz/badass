args = $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

p1:
	$(MAKE) -C P1 $(args)

p2:
	$(MAKE) -C P2 $(args)

p3:
	$(MAKE) -C P3 $(args)


.PHONY: p1 p2 p3