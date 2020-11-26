from configparser import ConfigParser
config=ConfigParser()

class dim_fournisseur:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_FOURNISSEUR=config.get('DIM_FOURNISSEUR','ID_FOURNISSEUR')
        self.Nom=config.get('DIM_FOURNISSEUR','Nom')
        self.types_societes=config.get('DIM_FOURNISSEUR','types_societes')
        self.Adresse=config.get('DIM_FOURNISSEUR','Adresse')
        self.Email=config.get('DIM_FOURNISSEUR','Email')
        self.Tel=config.get('DIM_FOURNISSEUR','Tel')
        self.Ville=config.get('DIM_FOURNISSEUR','Ville')
        self.Code_Postale=config.get('DIM_FOURNISSEUR','Code_Postale')
        self.Pays=config.get('DIM_FOURNISSEUR','Pays')
        self.Table=config.get('DIM_FOURNISSEUR','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self): 
        if(self.ID_FOURNISSEUR==""):
            return("\n")
        else:    
            return(
                "INSERT INTO DIM_FOURNISSEUR(ID_FOURNISSEUR,Nom,types_societes,Adresse,Email,Tel,Ville,Code_postale,Pays) \n" 
                +"SELECT ID_FOURNISSEUR,Nom,types_societes,Adresse,Email,Tel,Ville,Code_postale,Pays \n"
                +"FROM OPENQUERY ("+self.server+",\n'select "
                +self.ID_FOURNISSEUR+ " AS ID_FOURNISSEUR, "
                +self.Nom+ " AS Nom,"
                +self.types_societes+ " AS types_societes, "
                +self.Adresse+ " AS Adresse, "
                +self.Email+ " AS Email, "
                +self.Tel+ " AS Tel, "
                +self.Ville+ " AS Ville, "
                +self.Code_Postale+ " AS Code_Postale, "
                +self.Pays+ " AS Pays"
                +"\n"
                +"FROM " +self.Table+ "'); \n" 
            )