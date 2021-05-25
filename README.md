# Monkeys Island

The matrix is converted to graph.
<br/>

![image](https://user-images.githubusercontent.com/7583617/119549424-92635380-bd6d-11eb-947d-80449fc23328.png)

So, with created graph all vertices(islands with connection) is check to get the logest path(bananas ammount)

![image](https://user-images.githubusercontent.com/7583617/119549019-31d41680-bd6d-11eb-9252-2d2994c7bc82.png)

Get the first node (start) and check the all the Neighborhood, if the node wasn’t visited it is schedule to be checked and every time check the path between the actual path and origin is greater than the value stored.

# Class Structure

![image](https://user-images.githubusercontent.com/7583617/119549071-3f899c00-bd6d-11eb-98ab-941a5be2505b.png)

- VisingData: VisitingData is a dijkstra helper, used to control the queue

- Weight: Used to register island weight and value until island

- Dijkstra: Responsible to used the Dijkstra algorithm to get the better path between two island

- Bridge: Bridge that connect an island to another

- NeighborhoodInfo: Information from neighborhood island, all island connecteds with another


# helper links <br/>
- Dijkstra explained 
  - https://www.codingame.com/playgrounds/1608/shortest-paths-with-dijkstras-algorithm/dijkstras-algorithm
- Graph online helps with logical and validate
  - https://graphonline.ru/en/#
