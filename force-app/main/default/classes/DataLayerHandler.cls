/**
 * @description       : Data Layer class to be used by Trigger Handlers
 * @author            : Matheus Goncalves
 * @last modified on  : 11-01-2021
 * @last modified by  : contact@matheus.dev
**/
public class DataLayerHandler {
    public interface IDataLayer {
        List<Document__c> getDocumentList();
    }
}