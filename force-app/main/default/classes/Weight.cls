/**
 * @description       : weight from island and value until island
**/
public class Weight
{
    public Island islandFrom { get; set;}
    public integer value { get; set;}

    public Weight(Island islandFrom, integer value)
    {
        this.islandFrom = islandFrom;
        this.value = value;
    }
}