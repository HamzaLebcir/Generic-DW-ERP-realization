from configparser import ConfigParser
config = ConfigParser()

class dim_paiement_fournisseur :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Paiement = config.get('Dim_Paiement_Fournisseur','ID_Paiement')
        self.Reference_Paiement = config.get('Dim_Paiement_Fournisseur','Reference_Paiement')
        self.montant_Paiement = config.get('Dim_Paiement_Fournisseur','montant_Paiement')
        self.Type_Paiement = config.get('Dim_Paiement_Fournisseur','Type_Paiement')
        self.Date_Paiement = config.get('Dim_Paiement_Fournisseur','Date_Paiement')
        self.ID_Facture_fournisseur = config.get('Dim_Paiement_Fournisseur','ID_Facture_fournisseur')
        self.Table =  config.get('Dim_Paiement_Fournisseur','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Paiement == ""):
            return "\n"
        else:
            return (
                "insert into Dim_Paiement_Fournisseur ([ID_Paiement],[Reference_Paiement],[montant_Paiement],[Type_Paiement],[Date_Paiement],[ID_Facture_fournisseur]) \n"
                +"select [ID_Paiement],[Reference_Paiement],[montant_Paiement],[Type_Paiement],[Date_Paiement],[ID_Facture_fournisseur] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Paiement + " as ID_Paiement, "
                +self.Reference_Paiement +" as Reference_Paiement, "
                +self.montant_Paiement + " as montant_Paiement,"
                +self.Type_Paiement + " as Type_Paiement,"
                +self.Date_Paiement + " as Date_Paiement, "
                +self.ID_Facture_fournisseur + " as ID_Facture_fournisseur "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )