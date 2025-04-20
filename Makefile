.PHONY: install dev

install:
	@bash ./setup-repository.sh

dev:
	@pnpm --filter frontend dev
