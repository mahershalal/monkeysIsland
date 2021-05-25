/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-25-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   05-24-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class Island {
        
    private List<Bridge> bridges = new List<Bridge>();

    public string name { get; set; }
    
    public Island(string name)
    {
        this.name = name;
    }

    public List<NeighborhoodInfo> neighbors { get{
        List<NeighborhoodInfo> neighborsAux = new List<NeighborhoodInfo>();

        for(Bridge bridge : this.bridges){

            neighborsAux.add(new NeighborhoodInfo(bridge.islandFrom == this ? bridge.islandTo : bridge.islandFrom, bridge.bananasAmmount));
        }
        return neighborsAux;
    } }


    public void connectTo(Island islandTo, integer bananasAmmount)
    {
        this.bridges.Add(new Bridge(bananasAmmount, this, islandTo));
    }

    public class ArgumentException extends Exception {}

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
