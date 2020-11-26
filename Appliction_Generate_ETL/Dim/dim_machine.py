from configparser import ConfigParser
config = ConfigParser()


class dim_machine :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.ID_Machine = config.get('Dim_Machine', 'ID_Machine')
        self.Nom = config.get('Dim_Machine', 'Nom')
        self.Ref = config.get('Dim_Machine', 'Ref')
        self.Type = config.get('Dim_Machine', 'Type')
        self.Table =config.get('Dim_Machine', 'Table') 
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if(self.ID_Machine == ""):
            return("\n")
        else:
            return (
                "insert into Dim_Machine ([ID_Machine],[Nom],[Ref],[Type]) \n"
                +"select ID_Machine, Nom, Ref, Type \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.ID_Machine + " as ID_Machine, "
                +self.Nom +" as Nom, "
                +self.Ref + " as Ref,"
                +self.Type + " as Type "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )