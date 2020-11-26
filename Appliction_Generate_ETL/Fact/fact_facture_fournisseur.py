from configparser import ConfigParser
config = ConfigParser()

class fact_facture_fournisseur :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Facture = config.get('FACT_Facture_FOURNISSEUR','ID_Facture')
        self.Key_fournisseur = config.get('FACT_Facture_FOURNISSEUR','Key_fournisseur')
        self.Ref_Facture = config.get('FACT_Facture_FOURNISSEUR','Ref_Facture')
        self.Taxes = config.get('FACT_Facture_FOURNISSEUR','Taxes')
        self.Montant_HT = config.get('FACT_Facture_FOURNISSEUR','Montant_HT')
        self.Montant_Total = config.get('FACT_Facture_FOURNISSEUR','Montant_Total')
        self.Condition_Date_Paiement = config.get('FACT_Facture_FOURNISSEUR','Condition_Date_Paiement')
        self.Table = config.get('FACT_Facture_FOURNISSEUR','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Facture == ""):
            return "\n"
        else:
            return (
                "insert into FACT_Facture_FOURNISSEUR ([ID_Facture],[Key_fournisseur],[Ref_Facture],[Taxes],[Montant_HT],[Montant_Total],[Condition_Date_Paiement]) \n"
                +"select [ID_Facture],[Key_fournisseur],[Ref_Facture],[Taxes],[Montant_HT],[Montant_Total],[Condition_Date_Paiement] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Facture + " as ID_Facture, "
                +self.Key_fournisseur +" as Key_fournisseur, "
                +self.Ref_Facture + " as Ref_Facture, "
                +self.Taxes + " as Taxes, "
                +self.Montant_HT + " as Montant_HT, "
                +self.Montant_Total + " as Montant_Total, "
                +self.Condition_Date_Paiement + " as Condition_Date_Paiement "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )