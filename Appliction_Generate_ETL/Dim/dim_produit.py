from configparser import ConfigParser
config = ConfigParser()

class dim_produit :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Produit = config.get('Dim_Produit','ID_Produit')
        self.ID_sous_categorie = config.get('Dim_Produit','ID_sous_categorie')
        self.Reference = config.get('Dim_Produit','Reference')
        self.Nom = config.get('Dim_Produit','Nom')
        self.Type = config.get('Dim_Produit','Type')
        self.Cout_produit = config.get('Dim_Produit','Cout_produit')
        self.Couleur = config.get('Dim_Produit','Couleur')
        self.Produit_achete = config.get('Dim_Produit','Produit_achete')
        self.Produit_vendu = config.get('Dim_Produit','Produit_vendu')
        self.Produit_depenser = config.get('Dim_Produit','Produit_depenser')
        self.Table = config.get('Dim_Produit','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Produit == ""):
            return "\n"
        else:
            return (
                "insert into Dim_Produit ([ID_Produit],[ID_sous_categorie],[Reference],[Nom],[Type],[Cout_produit],[Couleur],[Produit_achete],[Produit_vendu],[Produit_depenser]) \n"
                +"select [ID_Produit],[ID_sous_categorie],[Reference],[Nom],[Type],[Cout_produit],[Couleur],[Produit_achete],[Produit_vendu],[Produit_depenser] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Produit + " as ID_Produit, "
                +self.ID_sous_categorie +" as ID_sous_categorie, "
                +self.Reference + " as Reference, "
                +self.Nom + " as Nom, "
                +self.Type + " as Type, "
                +self.Cout_produit + " as Cout_produit, "
                +self.Couleur + " as Couleur, "
                +self.Produit_achete + " as Produit_achete, "
                +self.Produit_vendu + " as Produit_vendu, "
                +self.Produit_depenser + " as Produit_depenser "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )
