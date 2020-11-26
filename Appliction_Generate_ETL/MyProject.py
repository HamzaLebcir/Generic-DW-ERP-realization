import os
import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox
from tkinter import font
from generat_SQL import generat_sql

def functionSwitch(x):
    return {
        'Odoo': 'ConfigOdoo.conf',
        'Dolibarr': 'ConfigDolibarr.conf'
    }.get(x, "Choisir ERP")
        
def open_fichier_config():
    if functionSwitch(getSelectERP())=="Choisir ERP" :
        messagebox.showinfo('Information ', "S'il vous plaît choisir ERP...")
    else:
        os.startfile(functionSwitch(getSelectERP()))

def save_file():
    if functionSwitch(getSelectERP())=="Choisir ERP" :
        messagebox.showinfo('Information ', "S'il vous plaît choisir ERP...")
    else:
        fh = filedialog.asksaveasfile(mode='w', defaultextension=".SQL")
        if fh is None:
            return
        generat_sql(fh,functionSwitch(getSelectERP()))
        fh.close()
        messagebox.showinfo('Information ', 'Generate code SQL successfully')

# creating main tkinter window/toplevel 
def center_window(w=300, h=200):
    # get screen width and height
    ws = window.winfo_screenwidth()
    hs = window.winfo_screenheight()
    # calculate position x, y
    x = (ws/2) - (w/2)    
    y = (hs/2) - (h/2)
    window.geometry('%dx%d+%d+%d' % (w, h, x, y))

window=tk.Tk()
window.title("ETL")
center_window(500, 500) 
window.resizable(0,0)
window.configure(bg='#ffffff')

customFont = font.Font(family="Helvetica", size=10,weight='bold')

# this wil create a label widget 
frame = tk.LabelFrame(window,text="Select ERP",font=customFont,bg='#ffffff',fg='#6e6d6d')
frame.pack(expand = 'yes', fill = 'both',padx=50,pady=0) 

frame1 = tk.LabelFrame(window,text="Première Etape",font=customFont,bg='#ffffff',fg='#6e6d6d')
frame1.pack(expand = 'yes', fill = 'both',padx=50,pady=50) 

frame2 = tk.LabelFrame(window,text="Deuxième Etape",font=customFont,bg='#ffffff',fg='#6e6d6d')
frame2.pack(expand = 'yes', fill = 'both',padx=50,pady=(0,50))

# Option menu variable
optionVar = tk.StringVar()
optionVar.set("Choisir ERP")

# Create a option menu
option = tk.OptionMenu(frame, optionVar,"Odoo", "Dolibarr")
option.pack(anchor=tk.CENTER)

# return Values selected
def getSelectERP():
    return optionVar.get()

# btnShow = tk.Button(frame, text="Show", command=show)
# btnShow.pack(anchor=tk.CENTER)

label1=tk.Label(frame1, text="Générer le fichier de configuration" , font=("Courrier",15),bg='#ffffff')
label1.pack( anchor=tk.CENTER,padx=10,pady=(30,30))

button1=tk.Button(frame1,text="Fichier de configuration",width=32,command=open_fichier_config,bg='#ececec',font="Arial 10 italic bold")
def on_enterB1(e):
    button1['background'] = '#ffaa71'

def on_leaveB1(e):
    button1['background'] = '#ececec'
button1.bind("<Enter>", on_enterB1)
button1.bind("<Leave>", on_leaveB1)
button1.pack(anchor=tk.CENTER,padx=0,pady=0)


label2=tk.Label(frame2, text="Générer le fichier SQL" , font=("Courrier",15),bg='#ffffff')
label2.pack( anchor=tk.CENTER,padx=10,pady=(30,30))

button2=tk.Button(frame2,text="Fichier SQL",width=22,command=save_file,bg='#ececec',font="Arial 10 italic bold")
def on_enterB2(e):
    button2['background'] = '#ffaa71'
def on_leaveB2(e):
    button2['background'] = '#ececec'
button2.bind("<Enter>", on_enterB2)
button2.bind("<Leave>", on_leaveB2)
button2.pack(anchor=tk.CENTER,padx=0,pady=0)

# infinite loop which can be terminated by keyboard 
# or mouse interrupt 
window.mainloop() 
