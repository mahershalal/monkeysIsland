/**
 * @description       : Unit test to check the dijkstra use cases 
**/
@istest
public with sharing class MonkeyIslandTest {
    
    @isTest
    public static void UseCase3x3(){

        // create matrix
        List<List<integer>> matrix = new List<List<integer>>();
        matrix.add(new list<integer> { 1 , 3 , 3 } );
        matrix.add(new list<integer> { 2 , 1 , 4 } );
        matrix.add(new list<integer> { 0 , 6 , 4 } );
        
        // find the longest path using Dijkstra alghoritm
        Map<Island, integer> islaPath = new Dijkstra().findLongestPath(matrix);
        
        // get all Path like string
        system.debug(Dijkstra.getPathString(islaPath));
        
        // get the path length
        integer length = Dijkstra.getPathAmmount(islaPath);
        
        system.debug(length);
        
        // check result
        system.assert(length == 12);
    }

    @isTest
    public static void UseCase4x4(){

        // create matrix
        List<List<integer>> matrix = new List<List<integer>>();
        matrix.add(new list<integer> { 1, 3, 1, 5 } );
        matrix.add(new list<integer> { 2, 2, 4, 1 } );
        matrix.add(new list<integer> { 5, 0, 2, 3 } );
        matrix.add(new list<integer> { 0, 6, 1, 2 } );
        
        // find the longest path using Dijkstra alghoritm
        Map<Island, integer> islaPath = new Dijkstra().findLongestPath(matrix);
        
        // get all Path like string
        system.debug(Dijkstra.getPathString(islaPath));
        
        // get the path length
        integer length = Dijkstra.getPathAmmount(islaPath);
        
        system.debug(length);
        
        // check result
        system.assert(length == 16);
    }
    
    @isTest
    public static void UseCase5x5(){

        // create matrix
        List<List<integer>> matrix = new List<List<integer>>();
        matrix.add(new list<integer> { 10, 33, 13, 15 } );
        matrix.add(new list<integer> { 22, 21, 04, 01 } );
        matrix.add(new list<integer> { 05, 00, 02, 03 } );
        matrix.add(new list<integer> { 00, 06, 14, 02 } );
        
        // find the longest path using Dijkstra alghoritm
        Map<Island, integer> islaPath = new Dijkstra().findLongestPath(matrix);
        
        // get all Path like string
        system.debug(Dijkstra.getPathString(islaPath));
        
        // get the path length
        integer length = Dijkstra.getPathAmmount(islaPath);
        
        system.debug(length);
        
        // check result
        system.assert(length == 83);
    }

    
    @isTest
    public static void UseCaseErrorNegativeValue(){

        Boolean error = false;

        try{
            // create matrix
            List<List<integer>> matrix = new List<List<integer>>();
            matrix.add(new list<integer> { -10, -133, 13, 15 } );
            matrix.add(new list<integer> { 22, 21, 04, 01 } );
            matrix.add(new list<integer> { 05, 00, 02, 03 } );
            matrix.add(new list<integer> { 00, 06, 14, 02 } );
            
            // find the longest path using Dijkstra alghoritm
            Map<Island, integer> islaPath = new Dijkstra().findLongestPath(matrix);
        }catch(Island.ArgumentException ae){
            error = true;
        }

        System.assert(error);
    }
}
