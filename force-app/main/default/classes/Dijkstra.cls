/**
 * @description       : Class responsible to used the Dijkstra algorithm to get the better path between two island
**/
public with sharing class Dijkstra {
    
    Island start  = new Island('START');
    Island finish = new Island('FINISH');

    /**
    * @description Matrix to be checked the better path
    * @param matrix matrix to be checked
    * @return Map<Island, Integer>  return all island path with the length until there
    **/
    public Map<Island,integer> findLongestPath(List<List<integer>> matrix){

        this.matrixToGraph(matrix);
        return this.findLongestPath(start, finish);
    }
    
    /**
    * @description Convert Matrix to Graph consideting the move allowed
    * @param matrix matrix to be converted
    **/
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
    
    /**
    * @description return the ammount from last island in path
    * @param islaPath island path
    * @return integer return the bananas ammount
    **/
    public static integer getPathAmmount(map<Island,integer> islaPath){

        List<island> islandPathAux = new List<island>(islaPath.keySet());

        // get last isla
        Island isla = islandPathAux.get(islandPathAux.size()-1);
        
        // return path length until last island
        return islaPath.get(isla);
    }

    /**
    * @description return all island path as string
    * @param islaPath island path 
    * @return string Return passa like START -> (1,0) -> (2,1) -> (2,2) = 12
    **/
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

    /**
    * @description reverse list frmo back
    * @param islaPath island path to reordened
    * @return Map<island, integer> return the same list ordened
    **/
    private Map<island,integer> reverseList(Map<island,integer> islaPath){

        List<island> islandPathAux = new List<island>(islaPath.keySet());
        Map<island,integer> retorno = new Map<island,integer>();
        
        for(integer index = islandPathAux.size()-1; index >= 0; index --){

            Island isla = islandPathAux.get(index);

            retorno.put(isla, islaPath.get(isla));
        }

        return retorno;
    }

    
    /**
    * @description Format the islandName from matrix
    * @param line line number
    * @param col column number
    * @return string return the island name
    **/
    private string getIslandName(integer line, integer col){
        return '('+line + ',' + col + ')';
    }

    /**
    * @description Calculate the longest path between From and To
    * @param islandFrom island From
    * @param islandTo  island to
    * @return Map<Island, Integer>  return all island path with the length until there
    **/
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

                if ((neighborWeight.Value) <= (probableWeight))
                {
                    control.UpdateWeight(neighborhoodInfo.island, new Weight(visitingIsland, probableWeight));
                }
            }
        }

        return control.HasComputedPathToOrigin(islandTo) ? reverseList(control.ComputedPathToOrigin(islandTo)) : null;
    }
}
