## Apartment Management System

Apartment Management System that uses Streamlit as for the UI and PostgeSQL as the backend for managing the database

### Usage:

- Clone the entire repository

- Install postgreSQL and run the apartment_tables.sql followed by the insert_values.sql files.
Procedure if on Windows: navigate to the bin folder, open the command prompt : `psql -U postgres -f {path to file}`

- Install the streamlit library : `pip install streamlit`

- Install the node packages inside `frontend` directory : `npm i`

- TBuild the node modules : `npm run build`

- Run the streamlit app in the main directory : `streamlit run main.py`

### Result:

The following contains a video of the output:
![result](file.mp4)\

*Home Page*
![Alt Text](images/1.png?raw=true )

*Querying*
![Alt text](images/2.png?raw=true )

*Sign up*
![Alt text](images/3.png?raw=true )

*Log in*
![Alt text](images/4.png?raw=true )

*Insertion*
![Alt text](images/5.png?raw=true )

*Deletion*
![Alt text](images/6.png?raw=true )

*End*
![Alt text](images/7.png?raw=true )
