from configparser import ConfigParser
config = ConfigParser()

class dim_type_expedition :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Type_ID = config.get('DIM_TYPE_EXPEDITION','Type_ID')
        self.Nom = config.get('DIM_TYPE_EXPEDITION','Nom')
        self.Table = config.get('DIM_TYPE_EXPEDITION','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.Type_ID == ""):
            return "\n"
        else:
            return (
                "insert into DIM_TYPE_EXPEDITION ([Type_ID],[Nom]) \n"
                +"select [Type_ID],[Nom] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.Type_ID + " as Type_ID, "
                +self.Nom +" as Nom "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )