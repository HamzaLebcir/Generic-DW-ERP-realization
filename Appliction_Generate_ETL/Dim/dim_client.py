from configparser import ConfigParser
config=ConfigParser()

class dim_client:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Client = config.get('Dim_Client','ID_Client')
        self.Nom=config.get('Dim_Client','Nom')
        self.types_societes=config.get('Dim_Client','types_societes')
        self.Adresse=config.get('Dim_Client','Adresse')
        self.Email=config.get('Dim_Client','Email')
        self.Tel=config.get('Dim_Client','Tel')
        self.Ville=config.get('Dim_Client','Ville')
        self.Code_Postale=config.get('Dim_Client','Code_Postale')
        self.Pays=config.get('Dim_Client','Pays')
        self.Table=config.get('Dim_Client','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.ID_Client==""):
            return("\n")
        else:    
            return(
                "INSERT INTO Dim_Client(ID_Client,Nom,types_societes,Adresse,Email,Tel,Ville,Code_Postale,Pays) \n"
                +"SELECT ID_Client,Nom,types_societes,Adresse,Email,Tel,Ville,Code_Postale,Pays \n"
                +"FROM OPENQUERY ("+ self.server +",\n'select "
                +self.ID_Client + " AS ID_Client, "
                +self.Nom + " AS Nom, "
                +self.types_societes + " AS types_societes, " 
                +self.Adresse + " AS Adresse, "
                +self.Email + " AS Email, "
                +self.Tel + " AS Tel, " 
                +self.Ville + " AS Ville, "
                +self.Code_Postale + " AS Code_Postale," 
                +self.Pays + " AS Pays "
                +"\n"
                +"FROM "+ self.Table + " '); \n"
            )