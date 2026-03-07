### Sharding and Partitioning
- [Reference Video](www.youtube.com/watch?v=wXvljefXyEo&t=4s)
- [Reference Blog](https://planetscale.com/blog/sharding-vs-partitioning-whats-the-difference)

1. Partitioning → splitting data inside the same database instance
2. Sharding → splitting data across multiple database instances/servers
3. In database sharding:
    - We create the new server/instance/table of the database. 
    - We split the schema. For example, we have the user data from all teh continents and database has grown very large. Therefore, we can create the shards of the data continent wise, like europe data will be in shard A, africa in shard B and so on. Therefore, when a user from europe makes a request, he will be redirected to the shard that contains europe continent data.
4. In data partitioning, 
    - We partition the data of same table in different parts and then store it. 
    - For example, we have data of people across all the ages. So, we can partition the data according to ages, like till 15 age data in partition 1, from 16 to 30 in partititon 2 and so on. In this way, we can split the large table data and then according to the age, request will be mapped to the correct partition.
    - We can partition the data both row and column wise according to our requirement.
    - We can store the parts on same shard and can also split the parts on different shards.
5. We do sharding and partitioning to reduce the load on the server and database as there is limit to the amount of data and traffic a particular instance can handle.
6. These techniques improve performance, manageability, and availability of larger databases.

#### `Partitioning divides a table into smaller pieces inside the same database instance, while sharding distributes data across multiple database servers to achieve horizontal scalability.`