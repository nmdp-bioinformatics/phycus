## SHINY APP

This app runs on a sqlite database which is contained in `shiny-app/db/hfc.db`.
The implementation of this database is found as `shiny-app/db/hfc.sqlite` and includes the
create table statements as well as a few test haplotype insertions.

To create the database:

```cd shiny-app/db
	rm hfc.db
	sqlite3 hfc.db
	.read hfc.sqlite
```

To launch shiny app on port `http://localhost:8088` run 
`R -e "shiny::runApp('shiny-app/app')"`

This is not connected in anyway to the mySQL implementation found in the home dir of
this github. It does not require the java app or the docker mySQL/phpMyadmin instance.

[Auth0](auth0.com) is currentyl used for authentication and can be removed by simply replacing the
`auth0_server` and `auth0_ui` statements in `server.R` and `ui.R` with `server` and `ui` respectively.

The input data tab can upload a .csv file with a "haplotype,frequency" header to 
the sqlite database. An example file can be found in `shiny-app/data/MUSLEM.csv`.




