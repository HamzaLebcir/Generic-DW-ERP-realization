from configparser import ConfigParser
config = ConfigParser()

class fact_facture_client :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Facture = config.get('FACT_Facture_Client','ID_Facture')
        self.Key_Client = config.get('FACT_Facture_Client','Key_Client')
        self.Ref_Facture = config.get('FACT_Facture_Client','Ref_Facture')
        self.Taxes = config.get('FACT_Facture_Client','Taxes')
        self.Montant_HT = config.get('FACT_Facture_Client','Montant_HT')
        self.Montant_Total = config.get('FACT_Facture_Client','Montant_Total')
        self.Condition_Date_Paiement = config.get('FACT_Facture_Client','Condition_Date_Paiement')
        self.Table = config.get('FACT_Facture_Client','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Facture == ""):
            return "\n"
        else:
            return (
                "insert into FACT_Facture_Client ([ID_Facture],[Key_Client],[Ref_Facture],[Taxes],[Montant_HT],[Montant_Total],[Condition_Date_Paiement]) \n"
                +"select [ID_Facture],[Key_Client],[Ref_Facture],[Taxes],[Montant_HT],[Montant_Total],[Condition_Date_Paiement] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Facture + " as ID_Facture, "
                +self.Key_Client +" as Key_Client, "
                +self.Ref_Facture + " as Ref_Facture, "
                +self.Taxes + " as Taxes, "
                +self.Montant_HT + " as Montant_HT, "
                +self.Montant_Total + " as Montant_Total, "
                +self.Condition_Date_Paiement + " as Condition_Date_Paiement "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )