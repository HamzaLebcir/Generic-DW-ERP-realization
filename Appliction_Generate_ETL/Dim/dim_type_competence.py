from configparser import ConfigParser
config = ConfigParser()

class dim_type_competence :
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.Id_type_competence = config.get('DIM_TYPE_COMPETENCE','Id_type_competence')
        self.Nom_type_competence = config.get('DIM_TYPE_COMPETENCE','Nom_type_competence')
        self.Table = config.get('DIM_TYPE_COMPETENCE','Table')
        self.server = config.get('Linked_server','server')
    def ETL(self):
        if (self.Id_type_competence == ""):
            return "\n"
        else:
            return (
                "insert into DIM_TYPE_COMPETENCE ([Id_type_competence],[Nom_type_competence]) \n"
                +"select [Id_type_competence],[Nom_type_competence] \n"
                +"from openquery("+self.server+",\n'SELECT "
                +self.Id_type_competence + " as Id_type_competence, "
                +self.Nom_type_competence +" as Nom_type_competence "
                +"\n"
                +"FROM "+ self.Table + "'); \n"
            )