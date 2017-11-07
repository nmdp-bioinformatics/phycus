build:clean generate
	cd api && \
		perl Makefile.PL && \
		make install

install:
	cd api && \
		perl Makefile.PL && \
		make install

generate: ## remove build artifacts
	swagger-codegen generate --lang perl --input-spec ../../curation-swagger-spec.yaml --output api
	cp Makefile.PL api

clean:
	rm -rf api


