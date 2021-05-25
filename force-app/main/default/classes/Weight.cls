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