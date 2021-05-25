/**
 * @description       : VisitingData is a dijkstra helper
**/
public class VisitingData
{
    // List with visited island
    List<island> visiteds = new List<island>();

    // map stored the path and logest value
    Map<island, Weight> weights = new Map<island, Weight>();

    // islands pending to be checked
    List<island> scheduled = new List<island>();

    
    /**
    * @description Responsible to mark island as visited
    * @param island island to be checked
    **/
    public void registerVisitTo(island island)
    {
        if (!this.visiteds.Contains(island)){
            this.visiteds.Add((island));
        }
    }

    /**
    * @description check the island was visited
    * @param island island to be checked
    * @return boolean true if island was visited and false if not
    **/
    public boolean wasVisited(island island)
    {
        return this.visiteds.Contains(island);
    }


    /**
    * @description update the weight(bananas ammount) until the island
    * @param island Island to be update
    * @param newWeight new weigth until island
    **/
    public void updateWeight(island island, Weight newWeight)
    {
        this.weights.put(island, newWeight);
    }
    
    /**
    * @description get the actual weight or return the min value to this item
    * @param island island to be check 
    * @return Weight return the weight until the island
    **/
    public Weight queryWeight(island island)
    {
        Weight result;

        if (!weights.ContainsKey(island))
        {
            result = new Weight(null, (integer)-9999);
            this.weights.put(island, result);
        }
        else
        {
            result = this.weights.get(island);
        }
        return result;
    }
    
    /**
    * @description Add island to be checked all vertices
    * @param island island to ve checked
    **/
    public void scheduleVisitTo(island island)
    {
        this.scheduled.Add(island);
    }
    
    /**
    * @description Check if have island to ve checked
    * @return boolean return true if has island to be checked
    **/
    public boolean hasScheduledVisits {
        get{
            return this.scheduled.size() > 0; 
        }
    } 

    /**
    * @description get next item to be check and remove from the queue
    * @return island next island in the queue
    **/
    public island getIslandToVisit()
    {
        island result = this.scheduled.get(0);
        this.scheduled.Remove(0);
        return result;
    }

    
    /**
    * @description 
    * @param island check if have a path from island until to island
    * @return boolean return true if have a calculated path
    **/
    public boolean hasComputedPathToOrigin(island island)
    {
        return QueryWeight(island).islandFrom != null;
    }


    /**
    * @description get the path until the destin island
    * @param island island destin
    * @return Map<island, integer> return the path until the island
    **/
    public Map<island,integer> computedPathToOrigin(island island)
    {
        Map<island,integer> retorno = new Map<island,integer>();
        island n = island;

        while (n != null)
        { 
            Weight peso = QueryWeight(n);
            n = peso.islandFrom;
            retorno.put(n, peso.value); 
        }

        return retorno;
    }
}
