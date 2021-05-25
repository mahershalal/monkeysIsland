/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-25-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   05-25-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public class VisitingData
{
    List<island> visiteds = new List<island>();

    Map<island, Weight> weights = new Map<island, Weight>();

    List<island> scheduled = new List<island>();

    public void registerVisitTo(island island)
    {
        if (!this.visiteds.Contains(island)){
            this.visiteds.Add((island));
        }
    }

    public boolean wasVisited(island island)
    {
        return this.visiteds.Contains(island);
    }

    public void updateWeight(island island, Weight newWeight)
    {
        this.weights.put(island, newWeight);
    }
    
    public Weight queryWeight(island island)
    {
        Weight result;

        if (!weights.ContainsKey(island))
        {
            result = new Weight(null, (integer)0);
            this.weights.put(island, result);
        }
        else
        {
            result = this.weights.get(island);
        }
        return result;
    }

    public void scheduleVisitTo(island island)
    {
        this.scheduled.Add(island);
    }
    
    public boolean hasScheduledVisits {
        get{
            return this.scheduled.size() > 0; 
        }
    } 

    public island getIslandToVisit()
    {
        island result = this.scheduled.get(0);
        this.scheduled.Remove(0);
        return result;
    }

    public boolean hasComputedPathToOrigin(island island)
    {
        return QueryWeight(island).islandFrom != null;
    }

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
