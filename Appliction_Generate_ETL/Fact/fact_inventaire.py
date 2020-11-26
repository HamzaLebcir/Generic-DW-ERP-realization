from configparser import ConfigParser
config = ConfigParser()


class fact_inventaire:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Inventaire = config.get('FACT_INVENTAIRE', 'ID_Inventaire')
        self.Key_produit = config.get('FACT_INVENTAIRE', 'Key_produit')
        self.ID_Entrepot = config.get('FACT_INVENTAIRE', 'ID_Entrepot')
        self.Quantite = config.get('FACT_INVENTAIRE', 'Quantite')
        self.Date_inventaire = config.get('FACT_INVENTAIRE', 'Date_inventaire')
        self.Table = config.get('FACT_INVENTAIRE', 'Table')
        self.server = config.get('Linked_server', 'server')

    def ETL(self):

        if (self.ID_Inventaire == ""):
            return "\n"
        else:
            return ("insert into FACT_INVENTAIRE (ID_Inventaire,Key_Produit,ID_Entrepot,Quantite,Date_inventaire) \n"
                    + "select ID_Inventaire,Key_Produit,ID_Entrepot,Quantite,Date_inventaire \n"
                    + "from openquery("+self.server+",\n'SELECT "
                    + self.ID_Inventaire + " as ID_Inventaire, "
                    + self.Key_produit + " as Key_Produit, "
                    + self.ID_Entrepot + " as ID_Entrepot, "
                    + self.Quantite + " as Quantite, "
                    + self.Date_inventaire + " as Date_inventaire "
                    + "\n"
                    + "FROM " + self.Table + "'); \n")
