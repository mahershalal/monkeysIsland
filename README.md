# Monkeys Island

The matrix is converted to graph.
{1, 3, 3}, 
{2, 1, 4}, 
{0, 6, 4}

![image](https://user-images.githubusercontent.com/7583617/119548973-24b72780-bd6d-11eb-8caa-c54382e4f63e.png)

So, with created graph all vertices(islands with connection) is check to get the logest path(bananas ammount)

![image](https://user-images.githubusercontent.com/7583617/119549019-31d41680-bd6d-11eb-9252-2d2994c7bc82.png)

Get the first node (start) and check the all the Neighborhood, if the node wasn’t visited it is schedule to be checked and every time check the path between the actual path and origin is greater than the value stored.


![image](https://user-images.githubusercontent.com/7583617/119549071-3f899c00-bd6d-11eb-98ab-941a5be2505b.png)

VisingData: VisitingData is a dijkstra helper, used to control the queue

Weight: Used to register island weight and value until island

Dijkstra: Responsible to used the Dijkstra algorithm to get the better path between two island

Bridge: Bridge that connect an island to another

NeighborhoodInfo: Information from neighborhood island, all island connecteds with another
![image](https://user-images.githubusercontent.com/7583617/119549108-46181380-bd6d-11eb-9635-f74c01f0f962.png)


Algorihtm explained
https://www.codingame.com/playgrounds/1608/shortest-paths-with-dijkstras-algorithm/dijkstras-algorithm
