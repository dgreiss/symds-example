### Steps to reproduce
From master node:
```
bin/symadmin --engine master create-sym-tables
```
```
bin/dbimport --engine master sample/create-trigger.sql
```

From client node:

Load schema:
```
bin/dbimport --engine client --format XML --alter-case ./samples/create_sample.xml
```
Load sample data:
```
bin/dbimport --engine master sample/insert_sample.sql
```
