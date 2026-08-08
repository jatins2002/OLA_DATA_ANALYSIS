# OLA_DATA_ANALYSIS
OLA Ride Booking Analytics

An end-to-end Data Analytics project built around OLA ride-booking data. The project covers data preparation with Python/Pandas, analytical querying with PostgreSQL, and dashboard/reporting with Power BI.

Project Overview

The objective is to analyze ride-booking data and answer practical business questions such as:

Which bookings were successful?

What is the average ride distance for each vehicle type?

How many rides were cancelled by customers?

Which customers booked the most rides?

Why are rides cancelled by drivers?

What are the minimum and maximum driver ratings for Prime Sedan?

Which rides were paid through UPI?

What is the average customer rating for each vehicle type?

What is the total value of successfully completed rides?

What are the reasons for incomplete rides?

The SQL analysis in this project contains 10 analytical views covering these questions.

Tech Stack

Tool

Purpose

Python

Data loading and preparation

Pandas

Data inspection and transformation

Jupyter Notebook

Data-analysis workflow

PostgreSQL

Database storage and SQL analysis

SQLAlchemy

Python-to-PostgreSQL connection

Power BI

Dashboard and business reporting

Excel

Source data

Project Files

OLA-Ride-Booking-Analytics/
│
├── Bookings-100000-Rows.xlsx
├── main.ipynb
├── OLA_DATA.sql
├── OLA_Data.pbix
├── README.md
└── PROJECT_DOCUMENTATION.md

Dataset

The dataset contains ride-booking information including:

Date

Time

Booking ID

Booking Status

Customer ID

Vehicle Type

Pickup Location

Drop Location

V_TAT

C_TAT

Cancelled Rides by Customer

Cancelled Rides by Driver

Incomplete Rides

Incomplete Rides Reason

Booking Value

Payment Method

Ride Distance

Driver Ratings

Customer Rating

Vehicle Images

Data Analysis Workflow

1. Load the data

The Excel dataset is loaded into Pandas.

import pandas as pd

df = pd.read_excel("Bookings-100000-Rows.xlsx")

2. Inspect the data

The notebook uses common Pandas inspection methods such as:

df.head()
df.info()
df.describe()
df.columns

The notebook also standardizes column names by converting them to lowercase and replacing spaces with underscores.

df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(" ", "_")

This produces column names such as:

booking_id
booking_status
customer_id
vehicle_type
booking_value
ride_distance
customer_rating

3. Store the data in PostgreSQL

The project uses SQLAlchemy to connect Python with PostgreSQL.

Example:

from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres:<password>@localhost:5432/OLA"
)

df.to_sql(
    "bookings",
    engine,
    if_exists="replace",
    index=False
)

Do not commit your real PostgreSQL password to GitHub. Use an environment variable or a local configuration file that is included in .gitignore.

4. Analyze the data with SQL

The OLA_DATA.sql file contains analytical views including:

Successful bookings

Average ride distance by vehicle type

Total customer-cancelled rides

Top 5 customers by number of rides

Driver cancellations due to personal/car-related issues

Maximum and minimum driver ratings for Prime Sedan

UPI payment rides

Average customer rating by vehicle type

Total successful ride value

Incomplete rides with their reasons

Example SQL

Successful bookings

CREATE VIEW successful_bookings AS
SELECT *
FROM bookings
WHERE booking_status = 'Success';

Average ride distance by vehicle type

CREATE VIEW average_ride_distance AS
SELECT
    vehicle_type,
    ROUND(AVG(ride_distance), 2) AS average_ride_distance
FROM bookings
GROUP BY vehicle_type
ORDER BY vehicle_type;

Top 5 customers by number of rides

CREATE VIEW highest_number_of_rides AS
SELECT
    customer_id,
    COUNT(*) AS highest_number_of_rides
FROM bookings
GROUP BY customer_id
ORDER BY COUNT(*) DESC
LIMIT 5;

Average customer rating by vehicle type

CREATE VIEW average_customer_rating_per_vehicle_type AS
SELECT
    vehicle_type,
    ROUND(AVG(customer_rating)::numeric, 2) AS average_customer_rating
FROM bookings
GROUP BY vehicle_type
ORDER BY vehicle_type;

Power BI

The Power BI report is provided as:

OLA_Data.pbix

The dashboard is intended to convert the SQL analysis into an interactive business-reporting layer.

Recommended dashboard areas:

Booking overview / KPIs

Booking status analysis

Vehicle-type performance

Cancellation analysis

Customer analysis

Revenue / booking-value analysis

Rating analysis

Payment-method analysis

Key Business Questions

This project can be presented as a business case rather than just a collection of charts.

Operations

How many bookings are successful?

How many bookings are cancelled?

What are the major cancellation reasons?

Which vehicle types receive the most bookings?

Customer

Which customers book rides most frequently?

What is the average customer rating?

Which payment methods are commonly used?

Driver

What is the average driver rating?

What are the major driver cancellation reasons?

How do ratings vary by vehicle type?

Revenue

What is the total value of successful bookings?

Which vehicle types contribute most to booking value?

How does booking value vary with ride distance?

How to Run the Project

Step 1 — Clone the repository

git clone <your-repository-url>
cd OLA-Ride-Booking-Analytics

Step 2 — Install Python dependencies

pip install pandas sqlalchemy psycopg2-binary openpyxl jupyter

Step 3 — Start PostgreSQL

Make sure PostgreSQL is running locally.

Create the database:

CREATE DATABASE OLA;

Step 4 — Run the notebook

Open:

main.ipynb

Update the PostgreSQL connection string with your local credentials.

Step 5 — Run SQL analysis

Open:

OLA_DATA.sql

Run the SQL statements after the bookings table has been created.

Step 6 — Open the Power BI report

Open:

OLA_Data.pbix

Refresh the data connection if necessary.

Data Pipeline

Excel Dataset
     |
     v
Python + Pandas
     |
     | Data inspection / preparation
     v
PostgreSQL
     |
     | SQL analytical views
     v
Power BI
     |
     v
Interactive Business Dashboard

Skills Demonstrated

Data loading

Data inspection

Data cleaning/preparation

Pandas

SQL

PostgreSQL

SQL views

Aggregations

GROUP BY

Filtering

Sorting

JOIN/relational analysis concepts

Database connectivity with SQLAlchemy

Power BI dashboard development

Business-question-driven analysis

Future Improvements

Possible extensions:

Add a proper data-cleaning section with missing-value treatment and validation.

Add exploratory data analysis charts in Python.

Add more advanced SQL queries using CTEs and window functions.

Build a star-schema model for Power BI.

Add DAX measures for KPIs.

Add date/time analysis.

Add cancellation-rate and completion-rate metrics.

Add automated ETL instead of manually loading the Excel file.

Add a .env file for database credentials and exclude it with .gitignore.

Author

Jatindra Soni

Data Analyst | Python | SQL | PostgreSQL | Power BI | Pandas
