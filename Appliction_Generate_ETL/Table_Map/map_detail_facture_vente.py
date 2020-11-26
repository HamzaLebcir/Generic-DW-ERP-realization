from configparser import ConfigParser
config = ConfigParser()


class map_detail_facture_vente:
    def __init__(self, file_config):
        config.read(file_config, encoding='utf-8-sig')
        self.script = "insert into dbo.Table_Map_Detail_Facture_Vente (Etat_reel,Etat_erp) Values \n"

    def mapping(self):
        section_name = 'Table_Map_Detail_Facture_Vente'
        if (config.options(section_name) == []):
            self.script=" \n";
        else:
            for key, value in config.items(section_name):
                if(value == ""):
                    self.script=" \n";
                    break
                self.script = self.script+"("+key+","+value+"),\n"

        return self.script[:-2]+"\n"


