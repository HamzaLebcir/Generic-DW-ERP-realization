from configparser import ConfigParser
config = ConfigParser()

class dim_detail_facture_achat:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_facture =config.get('DIM_DETAIL_FACTURE_ACHAT','Id_facture') 
        self.Reference =config.get('DIM_DETAIL_FACTURE_ACHAT','Reference')
        self.Date_creation =config.get('DIM_DETAIL_FACTURE_ACHAT','Date_creation')
        self.Reference_commande =config.get('DIM_DETAIL_FACTURE_ACHAT','Reference_commande')
        self.Etat = config.get('DIM_DETAIL_FACTURE_ACHAT','Etat')
        self.Table =config.get('DIM_DETAIL_FACTURE_ACHAT','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        script = """INSERT INTO DIM_DETAIL_FACTURE_ACHAT (Id_facture,Reference,Date_creation,Reference_commande,Etat)
                    SELECT Id_facture,Reference,Date_creation,Reference_commande,Etat
                    FROM OPENQUERY ( {} ,
                    'select {} AS Id_facture,
                            {} AS Reference,
                            {} AS Date_creation,
                            {} AS Reference_commande,
                            {} AS Etat
                    from {}'); \n"""
        if(self.Id_facture==""):
            return("\n")
        else:    
            return(script.format(self.server,self.Id_facture,self.Reference,self.Date_creation,self.Reference_commande,self.Etat,self.Table))