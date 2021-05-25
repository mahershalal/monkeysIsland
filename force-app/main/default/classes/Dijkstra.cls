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
public with sharing class Dijkstra {
    
    Island start  = new Island('START');
    Island finish = new Island('FINISH');

    public Map<Island,integer> findLongestPath(List<List<integer>> matrix){

        this.matrixToGraph(matrix);
        return this.findLongestPath(start, finish);
    }

    public void matrixToGraph(List<List<integer>> matrix){

        Map<string,island> islandsMap = new Map<string, Island>();

        for(integer line =0; line < matrix.size(); line++){
            for(integer col=0; col < matrix.get(line).size(); col++){
                
                string islaName = getIslandName(line, col);
                Island isla = new Island(islaName);
                islandsMap.put(islaName, isla);
            }
        }   

        // create bridges
        for(integer line =0; line < matrix.size(); line++){
            for(integer col=0; col < matrix.get(line).size(); col++){

                // get Names
                string islaName = getIslandName(line, col);
                string diagonalUpward = getIslandName(line -1, col+1);
                string front = getIslandName(line, col+1);
                string diagonalDownward = getIslandName(line+1, col+1);
                
                // get next islands
                Island isla = islandsMap.get(islaName);
                Island islaDiagonalUpward = islandsMap.get(diagonalUpward);
                Island islaFront = islandsMap.get(front);
                Island islaDiagonalDownward = islandsMap.get(diagonalDownward);

                // create connect to all fisrt isla
                if( col == 0 ){
                    integer bananasAmmount = matrix.get(line).get(col);
                    start.connectTo(isla, bananasAmmount);
                }

                // create connect to all last isla
                if( col == matrix.get(line).size()-1 ){
                    isla.connectTo(finish, 0);
                }

                //check positions and create connect
                if(islaDiagonalUpward != null){
                    integer bananasAmmount = matrix.get(line-1).get(col+1);
                    isla.connectTo(islaDiagonalUpward, bananasAmmount);
                }
                if(islaFront != null){
                    integer bananasAmmount = matrix.get(line).get(col+1);
                    isla.connectTo(islaFront, bananasAmmount);
                }
                if(islaDiagonalDownward != null){
                    integer bananasAmmount = matrix.get(line+1).get(col+1);
                    isla.connectTo(islaDiagonalDownward, bananasAmmount);
                }
            }

        }
    }

    public static integer getPathAmmount(map<Island,integer> islaPath){

        List<island> islandPathAux = new List<island>(islaPath.keySet());

        // get last isla
        Island isla = islandPathAux.get(islandPathAux.size()-1);
        
        // return path length until last island
        return islaPath.get(isla);
    }

    public static string getPathString(map<Island,integer> islaPath){
        string path = '';
        List<island> islandPathAux = new List<island>(islaPath.keySet());

        for(integer index = 0; index < islandPathAux.size(); index ++){

            Island isla = islandPathAux.get(index);
            
            if(isla == null) continue;

            path+= isla.name;

            if(index == islandPathAux.size()-1){
                path += ' = ' + islaPath.get(isla) ;
            }else{
                path += ' -> ';
            }
        }

        return path;
    }

    private Map<island,integer> reverseList(Map<island,integer> islaPath){

        List<island> islandPathAux = new List<island>(islaPath.keySet());
        Map<island,integer> retorno = new Map<island,integer>();
        
        for(integer index = islandPathAux.size()-1; index >= 0; index --){

            Island isla = islandPathAux.get(index);

            retorno.put(isla, islaPath.get(isla));
        }

        return retorno;
    }

    private string getIslandName(integer line, integer col){
        return '('+line + ',' + col + ')';
    }

    public Map<Island, Integer> findLongestPath(Island islandFrom, Island islandTo)
    {
        VisitingData control = new VisitingData();

        control.UpdateWeight(islandFrom, new Weight(null, 0));
        control.ScheduleVisitTo(islandFrom);
        
        while (control.HasScheduledVisits)
        {
            Island visitingIsland = control.getIslandToVisit();
            Weight visitingIslandWeight = control.QueryWeight(visitingIsland);
            control.RegisterVisitTo(visitingIsland);
            
            for (Island.NeighborhoodInfo neighborhoodInfo : visitingIsland.Neighbors)
            {
                if (!control.WasVisited(neighborhoodInfo.island))
                {
                    control.ScheduleVisitTo(neighborhoodInfo.island);
                }

                Weight neighborWeight = control.QueryWeight(neighborhoodInfo.island);
                
                Integer probableWeight = (visitingIslandWeight.Value + neighborhoodInfo.bananasToIsland);

                if ((neighborWeight.Value) < (probableWeight))
                {
                    control.UpdateWeight(neighborhoodInfo.island, new Weight(visitingIsland, probableWeight));
                }
            }
        }

        return control.HasComputedPathToOrigin(islandTo) ? reverseList(control.ComputedPathToOrigin(islandTo)) : null;
    }
}
