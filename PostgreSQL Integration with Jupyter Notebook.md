# PostgreSQL Integration with Jupyter Notebook

1. Login to CentOS7 using **<user-name>**
  
2. Activate conda environment 
```bash
conda activate training
```

3. Install library ipython-sql
```bash
conda install ipython-sql
```

4. Install PostgreSQL connector library 
```bash
conda install psycopg2
```

5. Start Jupyter notebook
```bash
jupyter notebook --no-browser --ip="0.0.0.0" --port=8890
```

6. Create new notebook and add below code
```bash
%load_ext sql
%sql postgresql://<user>:<pwd>@<ip-addr>/<dbname>
```

7. Run the query with **%%sql** tag
```bash
%%sql
SELECT * FROM hotel_reservation LIMIT 10
```
