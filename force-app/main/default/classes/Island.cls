/**
 * @description       :  mokeys Island / vertice
**/
public with sharing class Island {
        
    // register all connection
    private List<Bridge> bridges = new List<Bridge>();

    // vertice name
    public string name { get; set; }
    
    public Island(string name)
    {
        this.name = name;
    }

    // get all island conected by bridges
    public List<NeighborhoodInfo> neighbors { get{
        List<NeighborhoodInfo> neighborsAux = new List<NeighborhoodInfo>();

        for(Bridge bridge : this.bridges){

            neighborsAux.add(new NeighborhoodInfo(bridge.islandFrom == this ? bridge.islandTo : bridge.islandFrom, bridge.bananasAmmount));
        }
        return neighborsAux;
    } }

    
    /**
    * @description Connect island to other island
    * @param islandTo island to be connected
    * @param bananasAmmount bannas ammount is the weight until next island
    **/
    public void connectTo(Island islandTo, integer bananasAmmount)
    {
        this.bridges.Add(new Bridge(bananasAmmount, this, islandTo));
    }

    /**
     * @description       :  Exception to be throw for invalid argument
    **/
    public class ArgumentException extends Exception {}

    /**
     * @description       :  Information from neighborhood island
    **/
    public class NeighborhoodInfo
    {
        public Island island { get; set; }
        public integer bananasToIsland { get; set;}

        public NeighborhoodInfo(Island island, integer bananasToIsland)
        {
            this.island = island;
            this.bananasToIsland = bananasToIsland;
        }
    }

    /** 
     * @description       :  Bridge that connect a island to another
    **/    
    private class Bridge
    {
        private integer bananasAmmount { get; set; }
        private Island islandFrom { get; set;}
        private Island islandTo { get; set;}

        public Bridge(integer bananasAmmount, Island islandFrom, Island islandTo)
        {
            if (bananasAmmount < 0)
            {
                throw new ArgumentException('Bananas ammount needs to be positive.');
            }
            
            this.bananasAmmount = bananasAmmount;

            this.islandFrom = islandFrom;
            this.islandTo = islandTo;
        }
    }
}
