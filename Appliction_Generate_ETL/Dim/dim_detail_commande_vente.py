from configparser import ConfigParser
config = ConfigParser()

class dim_detail_commande_vente:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_DC =config.get('Dim_Detail_Commande_Vente','ID_DC')
        self.Reference =config.get('Dim_Detail_Commande_Vente','Reference')
        self.Etat =config.get('Dim_Detail_Commande_Vente','Etat')
        self.Table=config.get('Dim_Detail_Commande_Vente','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID_DC==""):
            return("\n")
        else:    
            return(
                "insert into Dim_Detail_Commande_Vente(ID_DC,Reference,Etat) \n"
                +"select ID_DC, Reference, Etat \n"
                +"from openquery("+self.server+",\n'select "
                +self.ID_DC+ " AS ID_DC, "
                +self.Reference+ " AS Reference, "
                +self.Etat+ " AS Etat \n"
                +"from " +self.Table+ "'); \n"
            )