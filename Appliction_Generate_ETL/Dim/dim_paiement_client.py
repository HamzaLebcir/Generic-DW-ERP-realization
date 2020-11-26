from configparser import ConfigParser
config = ConfigParser()

class dim_paiement_client :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Paiement = config.get('Dim_Paiement_Client','ID_Paiement')
        self.Reference_Paiement = config.get('Dim_Paiement_Client','Reference_Paiement')
        self.montant_Paiement = config.get('Dim_Paiement_Client','montant_Paiement')
        self.Type_Paiement = config.get('Dim_Paiement_Client','Type_Paiement')
        self.Date_Paiement = config.get('Dim_Paiement_Client','Date_Paiement')
        self.ID_Facture_Client = config.get('Dim_Paiement_Client','ID_Facture_Client')
        self.Table =  config.get('Dim_Paiement_Client','Table')
        self.server = config.get('Linked_server','server')
    
    def ETL(self):
        if (self.ID_Paiement == ""):
            return "\n"
        else:
            return (
                "insert into Dim_Paiement_Client ([ID_Paiement],[Reference_Paiement],[montant_Paiement],[Type_Paiement],[Date_Paiement],[ID_Facture_Client]) \n"
                +"select [ID_Paiement],[Reference_Paiement],[montant_Paiement],[Type_Paiement],[Date_Paiement],[ID_Facture_Client] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Paiement + " as ID_Paiement, "
                +self.Reference_Paiement +" as Reference_Paiement, "
                +self.montant_Paiement + " as montant_Paiement,"
                +self.Type_Paiement + " as Type_Paiement,"
                +self.Date_Paiement + " as Date_Paiement, "
                +self.ID_Facture_Client + " as ID_Facture_Client "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )