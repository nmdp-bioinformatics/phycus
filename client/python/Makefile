generate: ## remove build artifacts
	swagger-codegen generate --lang python --input-spec ../../curation-swagger-spec.yaml --output api -Dmodels -Dapis
	cp setup.py api
	cp requirements.txt api
	mkdir api/bin
	cp hfcus-*.py api/bin
	mv -i api/swagger_client api/pyhfcus