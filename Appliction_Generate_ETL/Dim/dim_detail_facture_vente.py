from configparser import ConfigParser
config = ConfigParser()

class Dim_Detail_Facture_Vente:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_facture = config.get('Dim_Detail_Facture_Vente','Id_facture') 
        self.Ref = config.get('Dim_Detail_Facture_Vente','Ref')
        self.Date_cree = config.get('Dim_Detail_Facture_Vente','Date_cree')
        self.Ref_command = config.get('Dim_Detail_Facture_Vente','Ref_command')
        self.Etat = config.get('Dim_Detail_Facture_Vente','Etat')
        self.Table = config.get('Dim_Detail_Facture_Vente','Table')
        self.server = config.get('Linked_server','server')

    def ETL(self):
        if(self.Id_facture==""):
            return("\n")
        else:    
            return(
                "INSERT INTO Dim_Detail_Facture_Vente (Id_facture,Ref,Date_cree,Ref_command,Etat) \n" 
                +"SELECT Id_facture, Ref, Date_cree, Ref_command , Etat \n"
                +"FROM OPENQUERY ("+self.server+",\n 'select "
                +self.Id_facture+ " AS ID_facture, "
                +self.Ref+ " AS Ref, "
                +self.Date_cree+ " AS Date_cree, "
                +self.Ref_command+ " AS Ref_command, "
                +self.Etat+ " AS Etat \n"
                +"FROM "+self.Table+ "'); \n"    
            )          