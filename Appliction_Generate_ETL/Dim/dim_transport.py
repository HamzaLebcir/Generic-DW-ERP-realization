from configparser import ConfigParser
config = ConfigParser()

class dim_transport :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Transport = config.get('Dim_Transport','ID_Transport')
        self.type_vehicule = config.get('Dim_Transport','type_vehicule')
        self.cout_transport = config.get('Dim_Transport','cout_transport')
        self.matricule = config.get('Dim_Transport','matricule')
        self.Table = config.get('Dim_Transport','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.ID_Transport == ""):
            return "\n"
        else:
            return (
                "insert into Dim_Transport ([ID_Transport],[type_vehicule],[cout_transport],[matricule]) \n"
                +"select [ID_Transport],[type_vehicule],[cout_transport],[matricule] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Transport + " as ID_Transport, "
                +self.type_vehicule +" as type_vehicule, "
                +self.cout_transport + " as cout_transport, "
                +self.matricule + " as matricule "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )    
        