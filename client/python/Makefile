build:clean generate
	cd api && \
		python setup.py install

install:
	cd api && \
		python setup.py install

generate: ## remove build artifacts
	
	swagger-codegen generate --lang python --input-spec ../../curation-swagger-spec.yaml --output api
	cp setup.py api
	mkdir api/bin
	cp hfcus-* api/bin
	chmod a+x api/bin/*
	mv -i api/swagger_client api/pyhfcus

clean:
	rm -rf api


