########################
#PROGETTO
#3, 2, 1, CASA
########################

#Nel mio progetto parlerò della zona in cui abito Valsamoggia (BO) 
#località Crespellano 

#ho chiamato il mio progetto così...
#3, 2, 1, CASA 
#perché ho preso in considerazione:
#il termine RGB, che descrive uno spazio di colore che riproduce i 
#colori visibili all'uomo tramite la mescolanza dei tre colori di base. 
#Lo spazio di colore RGB prende il nome dalle iniziali di questi tre 
#colori: red, green e blue (rosso, verde e blu).
#in R, in particolare, ci sono delle funzioni che userò
#questa è la mia casa 

#questa invece è un'immagine della mia zona vista da più in alto 
#arriveremo ad analizzare fino a 4 km di altezza 

#queste sono immagini satellitari, di due anni differenti, che ho scaricato
#marzo 2011, luglio 2021 
#ho scelto questa differenza temporale per evidenziare le differenze 
#di strade, edifici, vegetazione, ... 

#le immagini sono state prese da Google Earth Pro che usa il satellite di 
#Landsat/Copernicus 

#prima di iniziare ho installato tutti i pacchetti su R con 
#install.packages("___") --> mettendo le "_" perché usciamo da R e quindi  
#occorrono le virgolette
?install.packages()
install.packages("raster")
install.packages("RStoolbox")

#i pacchetti devono essere installati solo la prima volta
#dopo aver installato i pacchetti  
#basta richiamare solo le librerie, questa volta senza
#le virgolette "_" perché sono già dentro. Ma tutte le volte che 
#si riapre R occorre ricaricali perchè sono dati temporanei 
#le librerie che ho utilizzato sono:
library(raster) 
library(RStoolbox) #serve per calcolare gli indici di vegetazione

#ora usiamo la funzione 
#setwd = set working directory = settaggio della cartella di lavoro 
#tutte le volte è da richiamare e scrivo il percorso che R deve fare per
#andare a trovare i dati 
#separo con /
#collegando la cartella, in questo caso lab a R, mettiamo le "_"
#perchè è esterna e proteggiamo il percorso 
?setwd
setwd("C:/Users/grazi/Desktop/progetto/lab")

#la funzione per importare i dati in R si chiama BRICK
??brick #Create a RasterBrick object
#brick funziona con la libreria raster 
#ci vogliono le "_" perchè esco da R
#inserisco il primo dato che è l'immagine satellitare del 2011
brick("casa_2011.jpg")
#il nome casa_2011.jpg è il nome che ho dato all'immagine
#ora assegno la funzione brick a c2011 
c2011 <- brick("casa_2011.jpg")
c2011
#nella console
#class      : RasterBrick 
#dimensions : 728, 1536, 1118208, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : casa_2011.jpg 
#names      : casa_2011.1, casa_2011.2, casa_2011.3 
#min values :           0,           0,           0 
#max values :         255,         255,         255 
#da questi dati so che 
#in classe è RasterBrick
#in dimensione ho 3 bande [nlayers]
#in risoluzione 1, 1 = perchè l'immagine non è georeferenziata 
#(scaricate direttamente dal sito)
#in names ho i nomi delle 3 bande 
#in min e max value ho i valori che vanno da 0 a 255: 
#l'indice di Shannon: 2^8=256 bit = valori che vanno da 0 a 255

#con la funzione plot = plotto l'immagine
plot(c2011)
#ho tutte e tre le bande (layers) 
#la banda è uno strato di pixel, uno accanto all'altro, di una certa lunghezza 
#d'onda. Un'immagine satellitare può essere vista come una serie di strati 
#ognuno registrato da un sensore diverso per una certa lunghezza d'onda. 
#Se lo componiamo insieme avrò gli strati di RGB
#ma le bande possono essere montate in vari modi 

#inserisco ora l'immagine satellitare del 2021
#sempre con la funzione brick che la assegna a un nome c2021
brick("casa_2021.jpg")
c2021 <- brick("casa_2021.jpg")
c2021
#console
#class      : RasterBrick 
#dimensions : 728, 1536, 1118208, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : casa_2021.jpg 
#names      : casa_2021.1, casa_2021.2, casa_2021.3 
#min values :           0,           0,           0 
#max values :         255,         255,         255 
#rispetto all'immagine del 2011 cambiano solo i names 

#plotto anche questo e vedo che ci sono 3 bande
plot(c2021)

#per avere un colore diverso 
#uso la funzione che si chiama colorRampPalette
?colorRampPalette
#Palette è la legenda di colori 
#i colori in R sono in generale salvati come color_in_R
#tra i vari colori metto sempre le "_" e la virgola 
#essendo una serie di dati, in questo caso dei colori, metto la c (array)
#e alla fine metto le () con un numero, per esempio 100 che indica 
#che abbiamo un passaggio graduale tra i vari colori, non netto 
#quindi 100 indica il numero di passaggi
colorRampPalette(c("black", "grey", "light grey")) (100)
#nella console vengono visualizzati tutti i 100 colori utilizzati
#ho scelto la colorRampPalette con colori scuri 
#assegno un nome 
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
#e ora richiamo i due plot con le immagini che voglio visualizzare
#plot del 2011 e 2021
#aggiungo l'argomento col: colore che in questo caso è uguale a cl 
#nome che ho dato alla colorRampPalette
#plottiamo prima il 2011
plot(c2011, col = cl)
#poi il 2021
plot(c2021, col = cl)

#ora, sempre con la stessa colorRampPalette, prendo in considerazione 
#solo la prima banda di c2011 e c2021 
#poi richiamo la funzione con il nome o con gli elementi 
#per il 2011 prendo il nome casa_2011.1 e lo lego con il dollaro $
#mentre il 2021 prendo il primo elemento [[1]] e poi metto il nome con il $
plot(c2011$casa_2011.1, col = cl)
plot(c2021[[1]], col = cl)
plot(c2021$casa_2021.1, col = cl)

#metto i due plot appena fatti uno di fianco all'altro 
#con la funzione par che comprende il multiframe (mf) e aggiungo 
#row per la riga e poi faccio un array = c
#e tra () prima metto i numero di righe che voglio e poi metto il numero delle 
#colonne
par(mfrow = c (1, 2))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)
#se metto l'immagine del 2011 in alto e quella del 2021 in basso 
#avrò 2 righe e 1 colonna
par(mfrow = c (2, 1))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)

#se voglio salvare il pfd di questo oggetto 
#esporto un plot multiframe che viene salvato direttamente nella cartella lab 
#che avevo indicato all'inizio con la funzione della working directory
pdf("multiframe.pdf")
par(mfrow = c (2, 1))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)

#stessa cosa se lo voglio salvare in png
png("multiframe.png")
par(mfrow = c (2, 1))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)

#metto dev.off() così ripulisco lo spazio in cui appaiono le immagini  
dev.off()

#lo schema RGB serve a montare immagini a colori o a singole bande 
#mostra la percezione dei colori 
#un computer, una televisione, o altri dispositivi 
#lavorano con questo schema RGB 
#montati insieme danno origine ad altri colori 

#le nostre immagini satellitari sono già analizzate e abbiamo 3 bande 
#e con RGB utilizziamo:
#R --> rosso = banda 3
#G --> verde = banda 2
#b --> blu = banda 1

#la nostra fonte per le immagini ottiche è il sole.
#Il satellite capisce parte di queste lunghezze d'onda e restituisce i valori 
#di riflettanza
#[riflettanza = quanta luce rispetto a quella in arrivo viene 
#riflessa dall'oggetto]
#quindi abbiamo 3 bande ed aggiungo anche l'infrarosso 
#vicino = NIR [Near Infrared Reflectance]

#per utilizzare la funzione plotRGB()
??plotRGB
#faccio il plotRGB delle due immagini
#metto r, g e b e l'argomento stretch
#stretch: ampia per vedere meglio i contrasti lineari ("lin") o a
#istrogramma ("hist")
#plotto ma non so quali bande sono coinvolte 
#2011
plotRGB(c2011, r = 1, g = 2, b = 3, stretch = "lin")

#devo scoprire quale banda è diventata rossa
#1 NIR --> R sono sicura
#2 red --> G non sono sicura
#3 green --> B non sono sicura

#2021
plotRGB(c2021, r = 1, g = 2, b = 3, stretch = "lin")
#si vede quanta distruzione c'è 

#plottiamo in un multiframe le due immagini plotRGB così vediamo le differenze
par(mfrow = c(2, 1))
plotRGB(c2011, r = 1, g = 2, b = 3, stretch = "lin")
plotRGB(c2021, r = 1, g = 2, b = 3, stretch = "lin")
#vediamo le differenze: aumento delle case, delle strade, i campi agricoli sono 
#in alcune zone spariti, cambi di colture, deboscamento  
#sopratutto nella zona in basso a destra si vede molto la differenza 

################################
#ora calcolo l'indice di vegetazione
#DVI
#sappiamo che le foglie [mesofillo] riflettono l'infrarosso vicino (NIR) 
#e il verde mentre assorbono il rosso e il blu 
#con questo indice DVI = difference vegetation index 
#sullo stesso pixel faccio la differenza tra la riflettanza in NIR e 
#nel rosso 
#sappiamo così il valore di salute delle piante 

#meglio usare gli elementi 
#[[1]] = NIR
#[[2]] = red

#quindi faccio la differenza del dvi tra il primo e il secondo elemento 
#dell'immagine del 2011
dvi2011 = c2011[[1]] - c2011[[2]]
dvi2011
#console
#class      : RasterLayer 
#dimensions : 728, 1536, 1118208  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -69, 53  (min, max)

#plotto 
#con questa colorRampPalette
cldvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2011, col = cldvi)
#abbiamo la salute della vegetazione del 2011
#rosso scuro: la vegetazione è in salute
#giallo: o suolo nudo o deforestazione

#faccio la differenza anche per l'immagine del 2021
#sempre tra i primi due elementi 
dvi2021 = c2021[[1]] - c2021[[2]]
dvi2021
#console
#class      : RasterLayer 
#dimensions : 728, 1536, 1118208  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -51, 43  (min, max)

#metto la colorRampPalette
cldvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
#plotto
plot(dvi2021, col = cldvi)
#vedo che c'è ancora più giallo, con moltissima deforestazione 
#ci sono anche dei punti verdi 
#ho messo il giallo perchè è uno dei colori che colpisce di più la retina
#e il nostro occhio lo percepisce subito 

#potrei usare anche i nomi, ma in questo caso è meglio utilizzare gli elementi

#unisco i due plot uno sopra all'altro 
par(mfrow = c(2, 1))
plot(dvi2011, col = cldvi)
plot(dvi2021, col = cldvi)

#questo multiframe mi ha impressionata. Sapevo della costruzione
#di strade, case anche dietro casa mia ma la differenza netta ha messo in 
#risalto la variazione di vegetazione e il conseguente cambiamento delle 
#abitudini della fauna esempio: spostamenti (api, cinghiali, caprioli...)

#nel 2011 = abbiamo della vegetazione
#nel 2021 = abbiamo meno vegetazione e più deforestazione

#ora faccio la differenza tra i due dvi2011 e dvi2021
#la differenza di DVI = dvi_dif
dvi_dif <- dvi2011 - dvi2021
dvi_dif
#console
#class      : RasterLayer 
#dimensions : 728, 1536, 1118208  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -72, 81  (min, max)

#faccio una colorRampPalette a cui assegno il nome di cldif
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
#plotto l'immagine 
plot(dvi_dif, col = cldif)
#in questa immagine 
#dove ci sono situazioni con più alto mantenimento ho valori rossi  
#il colore blu indica alto cambiamento

#allora 
#DVI =  differenza
#Un altro indice molto simile che si chiama NDVI 
#viene normalizzato sulla somma delle due bande 

#Copernicus il programma sviluppato dall'Esa 
#ha descritto le variabili dividendole in 4 parti:
#vegetazione, energia, acqua e criosfera
#dentro a vegetazione c'è il NDVI 
#NDVI = Normalized Difference Vegetation Index 

#richiamo le immagini per vedere quanti BIT hanno
#nel 2011
c2011
#8 BIT da 0 a 255
#mentre nel 2021
c2021
#8 BIT da 0 a 255

#DVI i BIT sono da 0 a 255
# nel NDVI i valori vanno da -1 a +1
#calcolo NDVI del 2011
#mettendo le parentesi tonde
#la formula è 
#NDVI = (NIR - RED) / (NIR + RED)
#metto gli elementi 
ndvi2011 = (c2011[[1]] - c2011[[2]]) / (c2011[[1]] + c2011[[2]])
ndvi2011
#console
#class      : RasterLayer 
#dimensions : 728, 1536, 1118208  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -1, 1  (min, max)
#i valori ora vanno da -1 a 1

#faccio il plot con la colorRampPalette
clndvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(ndvi2011, col = clndvi)

#faccio per il 2021
ndvi2021 = (c2021[[1]] - c2021[[2]]) / (c2021[[1]] + c2021[[2]])
ndvi2021
#console 
#class      : RasterLayer 
#dimensions : 728, 1536, 1118208  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 1536, 0, 728  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -1, 1  (min, max)

#usiamo sempre la stessa colorRampPalette
clndvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(ndvi2021, col = clndvi)

#faccio un multiframe tra i due 
par(mfrow = c(2, 1))
plot(ndvi2011, col = clndvi)
plot(ndvi2021, col = clndvi)

#ho normalizzato con l'indice NDVI 
#l'immagine del 2021 tende verso lo 0; -1 perché ha più giallo 
#più suolo nudo o per le attività agricole

#spero che questo mio progetto porti a ragionare sull'impatto che le attività
#dell'uomo hanno sulla natura.
#Considerando che il tempo e lo spazio in esame sono ristretti il problema 
#di uno sviluppo incontrollato potrebbe essere davvero serio



########################
#GITHUB

#questo è il mio link all'account GITHUB
#in cui ho inserito i codici per l'esame
#https://github.com/GraziaTeg/R_code_exam_21_22.git
#link per codici fatti a lezione 
#https://github.com/GraziaTeg/telerilevamento_21_22.git
#link per i miei appunti presi a lezione
#https://github.com/GraziaTeg/codici_R_telerilevamento_21_22.git



########################
#OVERLEAF
#link con la presentazione in latex del mio progetto 
#https://it.overleaf.com/3441691529zctvhrqtbkgx
