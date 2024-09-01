# Secondhand Car Dealership Relational Database
Portfolio project on implementing a relational database for secondhand car dealer

## Project Objective

The project is done to build a relational database for a secondhand car dealership website. 
The main objective of this project is that seller can offer their product (cars) on the web and buyers can look for the products according to their preferences.

## Designing The Database

### Mission Statement
The relational database for secondhand car dealerships is used for sellers to post their products and for buyers to query for a product that matches their preferences. 

### Creating Table Structures
The table structure for the project consists of the following,

![image](https://github.com/user-attachments/assets/71781920-647b-4457-af9b-f160c2990a82)

### Determine Table Relationship
Table relationships are linked by each table's primary key and foreign key. 
Keys are selected from a unique ID on each table with the table name concatenated with "ID" e.g. "seller_id" is the primary key to the seller table and linked to the product table as it foreign key (featured as a dedicated column).

### Determine Business Rules
The business rules for the project consist of the following,

![image](https://github.com/user-attachments/assets/659897b9-31bd-4eee-ae97-7a281977bf40)


### Implementing a Relational Database

The entity relationship diagram (ERD) for the project is shown in below picture,

![ERD](https://github.com/user-attachments/assets/c4a31092-13bd-4600-abbc-4dd858be517e)


## Populating The Database

Preliminary data was provided by Pacmann team in the following link,
https://drive.google.com/drive/folders/1DMQnlB8RfaOA2QYQ6WkRKqdfw-pSFa-L

For creating the dummy data, python language was used along with pandas, random, and faker packages.

Here is the code to populate dummy data for each table,

* Seller data
```
from faker import Faker
import random
import pandas as pd

#Initialize faker function with Indonesia localization
fake=Faker('id_ID')

#Set input list for city_id according to data provided
kode_kota=[3171,3172,3173,3174,3175,3573,3578,3471,3273,1371,1375,6471,6472,7371,5171]

#Create an empty dataframe
seller_df=pd.DataFrame(columns=['seller_name','contact','domicile'])

#Create 50 rows of dummy data
for i in range(50):
    nama=fake.name()
    nomor=fake.phone_number()  
    domisili= random.choice(kode_kota)   
    list=[[nama,nomor,domisili]]
    seller_df=seller_df.append(pd.DataFrame(list,columns=['seller_name','contact','domicile']),ignore_index=True)

#Export the dummy data to csv
seller_df=seller_df.to_csv("path\\seller_data.csv")

```

* Buyer data
```
from faker import Faker
import random
import pandas as pd

#Initialize faker function with Indonesia localization
fake=Faker('id_ID')

#Set input list for city_id according to data provided
kode_kota=[3171,3172,3173,3174,3175,3573,3578,3471,3273,1371,1375,6471,6472,7371,5171]

#Create an empty dataframe
buyer_df=pd.DataFrame(columns=['buyer_name','contact','domicile'])

#Create 50 rows of dummy data
for i in range(50):
    nama=fake.name()
    nomor=fake.phone_number()  
    domisili= random.choice(kode_kota)   
    list=[[nama,nomor,domisili]]
    buyer_df=buyer_df.append(pd.DataFrame(list,columns=['buyer_name','contact','domicile']),ignore_index=True)

#Export the dummy data to csv
buyer_df=buyer_df.to_csv("path\\buyer_data.csv",index=False)

```

* Product data
```
from faker import Faker
import random
import pandas as pd

#Import the provided product data
bid_df=bid_df.to_csv("path\\car_product.csv")

#Create empty list for dummy columns
trans_type=[]
colour=[]
milleage=[]
seller_id=[]
post_date=[]

#Create fill the empty column for each rows with dummy data
for index,row in product_df.iterrows():
    trans=random.choice(['manual','automatic'])
    color=random.choice(['black','white','gray','blue','red'])
    km=random.randrange(100000,200000,1000)
    sid=random.randrange(1,50,1)
    date=fake.date_this_year(before_today=True)
    trans_type.append(trans)
    colour.append(color)
    milleage.append(km)
    seller_id.append(sid)
    post_date.append(date)

#Assign the filled list of dummy data to the respective columns
product_df['trans_type']=trans_type
product_df['colour']=colour
product_df['milleage']=milleage
product_df['seller_id']=seller_id
product_df['post_date']=post_date

#export the dummy data
product_df=product_df.to_csv("path\\car_product_add.csv",index=False)
```

* Bid data

```
from faker import Faker
import random
import pandas as pd

#Initialize faker function with Indonesia localization
fake=Faker('id_ID')

#Create an empty dataframe
bid_df=pd.DataFrame(columns=['bit_date','product_id','buyer_id','bit_price'])

#Create 100 rows of dummy data
for i in range(100):
    date=fake.date_this_year()
    product_id=random.randrange(1,51,1)
    buyer_name=random.randrange(1,51,1)
    bit_price=random.randrange(100000000,300000000,5000000)
    list=[[date,product_id,buyer_name,bit_price]]
    bid_df=bid_df.append(pd.DataFrame(list,columns=['bit_date','product_id','buyer_id','bit_price']),ignore_index=True)

#Export the dummy data to csv
bid_df=bid_df.to_csv("path\\bid_data.csv")

```

## Retrieve Data

For this project, there are several query challenges that need to be solved.

* Query to look up for cars with production years newer than 2015.
  ```
  Select * From product where year>2015
  ```
  ![image](https://github.com/user-attachments/assets/ad3a2871-6741-4324-9d0f-fac30d1b6bde)

* Inserting a new bid
  ```
  Insert into bid (bid_date,product_id,buyer_id,bid_price) VALUES ('2024-08-31',1,1,200000000)
  ```
  Before:
  
  ![image](https://github.com/user-attachments/assets/3d236280-3a26-4c4b-8c32-8f63d6e806d5)

  After:
  
  ![image](https://github.com/user-attachments/assets/006a98e1-d722-4fb7-acc8-d0137998e000)

* Query to look up for all cars sold by an account ordered by the latest
  ```
  Select a.product_id, a.brand, a.model, a.year, a.price, a.post_date, a.seller_id, b.seller_id,b.seller_name
  FROM product a
  left join seller b On a.seller_id=b.seller_id
  WHERE b.seller_id=35 
  Order by a.post_date DESC
  ```
  ![image](https://github.com/user-attachments/assets/cbf45e22-ccd5-4288-964f-49ebe9212437)
  
* Query to look up the cheapest car with a certain model keyword.
  ```
  SELECT * FROM product
  WHERE model LIKE '% Yaris%'
  Order by price ASC
  ```
  ![image](https://github.com/user-attachments/assets/b1ab1e91-1b02-420b-9a73-14f39e76cc42)

* Query to look up cars that are located nearest a certain location

  Function to calculate Euclidian distance,
  ```
  CREATE FUNCTION euclidian_distance(
	lon1 numeric (10,6), lat1 numeric (10,6),
	lon2 numeric (10,6), lat2 numeric (10,6))

  Return float
  LANGUAGE plpgsql
  
  AS
  $$
  DECLARE
  	distance float;
  
  BEGIN
  	distance=SQRT(POWER(lat2 - lat1, 2) + POWER(lon2 - lon1, 2));
  	RETURN distance;
  END
  $$;
  ```

  The query,
   ```
  WITH dist_table AS (
  SELECT
  	d.*, avg(a.latitude) over() as from_lat, avg(a.longitude) over() as from_loc,
      euclidian_distance(a.longitude, a.latitude, b.longitude,b.latitude) as distance
  FROM
  	(Select * from city where city_id=3171) a --Ganti id Kota
  JOIN
      city b ON a.city_id<>b.city_id OR a.city_id=b.city_id
  JOIN
  	seller c ON b.city_id=c.domicile
  JOIN
  	product d ON c.seller_id=d.seller_id)
  	
  Select product_id, brand, model, year, price, distance
  FROM dist_table
  WHERE distance=(SELECT MIN(distance) from dist_table)
  ```
  ![image](https://github.com/user-attachments/assets/0bff7885-9f19-4e3f-ac8d-dcb5065e3ec2)
    
* Rank cars based on the number of bid
  ```
  Select b.model, count(a.product_id) as count_product, count(a.bid_id) as count_bid
  From bid a
  Join product b
  On a.product_id=b.product_id
  Group by b.model
  Order by count_bid DESC
  ```
  ![image](https://github.com/user-attachments/assets/0180d846-882a-4b1a-a474-598cf83eeb6a)

* Compare car price with the average car in the respective city
  ```
  Select c.nama_kota,a.brand,a.model,a.year,a.price,
  AVG(a.price) OVER(PARTITION BY C.city_id) as avg_car_city
  FROM product a
  JOIN seller b ON a.seller_id=b.seller_id
  JOIN city c ON b.domicile=c.city_id
  ```
  ![image](https://github.com/user-attachments/assets/9c9cc034-392f-4a98-95d9-f8b428047402)

* Find the comparison of users' bid date and the next bid along with its price
  ```
  SELECT b.model,a.buyer_id,a.bid_date,a.bid_price,
  a.bid_date as first_bid_date,
  LEAD(a.bid_date, 1) OVER (PARTITION BY b.model ORDER BY a.bid_date ASC) as next_bid_date,
  a.bid_price as first_bid_price,
  LEAD(a.bid_price, 1) OVER (PARTITION BY b.model ORDER BY a.bid_date ASC) as next_bid_price
  FROM bid a
  JOIN product b ON a.product_id=b.product_id
  WHERE b.model='Honda CR-V' --Isi model mobil sesuai dengan kebutuhan
  ORDER BY a.buyer_id ASC 
  ```
  ![image](https://github.com/user-attachments/assets/ff5b025d-0c65-4015-8278-47116e7e9730)

* Compare the percentage difference of average car price based on its model and the average bid price offered by the buyer
  ```
  SELECT Distinct b.model, 
  AVG(b.price) OVER(PARTITION BY b.model) as avg_price,
  AVG(a.bid_price) OVER(PARTITION BY b.model) as avg_bid_6month,
  (AVG(b.price) OVER(PARTITION BY b.model))-(AVG(a.bid_price) OVER(PARTITION BY b.model)) as Difference,
  ((AVG(b.price) OVER(PARTITION BY b.model))-(AVG(a.bid_price) OVER(PARTITION BY b.model)))/
  (AVG(b.price) OVER(PARTITION BY b.model))*100 as difference_percent
  FROM bid a
  JOIN product b ON a.product_id=b.product_id
  ```
  ![image](https://github.com/user-attachments/assets/374e3630-ef0a-4615-a8d5-a6f53fd4625b)

## References
* [Designing a Relational Database and Creating an Entity Relationship Diagram](https://towardsdatascience.com/designing-a-relational-database-and-creating-an-entity-relationship-diagram-89c1c19320b2)
* [Postgresqltutorial](https://www.postgresqltutorial.com/)
* [Sample Car Rental System Database ERD](https://github.com/hurshd0/aviano-db)
* [Hospital-Management-System](https://github.com/anwesh90/Hospital-Management-System)
* [Pacmann Course: PostgreSQL & Relational Database](https://pacmann.io/course/)
