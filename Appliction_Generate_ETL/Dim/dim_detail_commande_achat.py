from configparser import ConfigParser
config = ConfigParser()

class dim_detail_commande_achat:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        
        self.ID_DC =config.get('DIM_DETAIL_COMMANDE_ACHAT','ID_DC')
        self.Reference =config.get('DIM_DETAIL_COMMANDE_ACHAT','Reference')
        self.Etat =config.get('DIM_DETAIL_COMMANDE_ACHAT','Etat')
        self.Table=config.get('DIM_DETAIL_COMMANDE_ACHAT','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID_DC==""):
            return("\n")
        else:    
            return(
                "INSERT INTO DIM_DETAIL_COMMANDE_ACHAT (ID_DC,Reference,Etat) \n"
                +"SELECT ID_DC,Reference,Etat \n"
                +"FROM OPENQUERY("+self.server+",\n'select "
                +self.ID_DC+ " AS ID_DC, "
                +self.Reference+ " AS Reference, "
                +self.Etat+ " AS Etat \n"
                +"from " +self.Table+ "') ;\n"
            ) 