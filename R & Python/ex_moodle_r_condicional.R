#-----------------------------------------------------------------------
# Players birthdate data

url <- "http://leg.ufpr.br/~walmes/data/jog_europaleague_2014-05-04.txt"
tb_play <- read.table(url,
                      header = TRUE,
                      sep = "\t",
                      comment = "#",
                      quote = "")

# Date of birth
tb_play$DateOfBirth <- as.Date(tb_play$DateOfBirth)
tb_play <- tb_play[!is.na(tb_play$DateOfBirth),
                   c("FirstName", "DateOfBirth")]
str(tb_play)

# Julian calendar day, from 1 up to 365 or 366
tb_play$dia_ano <-
  as.integer(strftime(tb_play$DateOfBirth,
                      format = "%j"))
head(tb_play)

# Sign df
sig <-
  data.frame(dt_ini = c("20/mar", "21/abr", "21/mai", "21/jun",
                        "22/jul", "23/ago", "23/set", "23/out",
                        "22/nov", "22/dez", "21/jan", "19/fev"),
             dt_fim = c("20/abr", "20/mai", "20/jun", "21/jul",
                        "22/ago", "22/set", "22/out", "21/nov",
                        "21/dez", "21/jan", "18/fev", "19/mar"),
             signo = c("Áries", "Touro", "Gêmeos", "Câncer", "Leão",
                       "Virgem", "Libra", "Escorpião", "Sagitário",
                       "Capricórnio", "Aquário", "Peixes"),
             j_ini = c(79L, 111L, 141L, 172L, 203L, 235L, 266L, 296L,
                       326L, 356L, 21L, 50L),
             j_fim = c(110L, 140L, 171L, 202L, 234L, 265L, 295L, 325L,
                       355L, 21L, 49L, 78L))



# Check table
tb_play

# Check sign df
sig

# Check head or tail of a df
head(tb_play)
tail(sig)

# First row, third line
tb_play[1,3]

# Array values print
for (position in sig$signo) {
  print(position)
}

# Exclude column (if necessary)
tb_play$signo <- NULL

# Access a position in df column
sig$signo[12]

# number of columns
length(tb_play)

# Number of rows
nrow(tb_play)

# Access a value from df (third column, first row)
tb_play$dia_ano[1] # column name
tb_play[1, 3] # column position

# Values comparison
tb_play$dia_ano[1]
sig$j_ini[1]
sig$j_fim[1]

# Test comparisons
tb_play$dia_ano[1] >= sig$j_ini[1]
tb_play$dia_ano[1] <= sig$j_fim[1]
tb_play$dia_ano[1] >= sig$j_ini[1] & tb_play$dia_ano[1] <= sig$j_fim[1]


# 'signo' column of zeros
tb_play$signo <- 0

# Fulfill all rows with the respective sign
for (tb_play_row in 1:nrow(tb_play)) {
  for(sig_row in 1:nrow(sig)) {
    if(tb_play$dia_ano[tb_play_row] >= sig$j_ini[sig_row] & tb_play$dia_ano[tb_play_row] <= sig$j_fim[sig_row]){
      tb_play$signo[tb_play_row] <- sig$signo[sig_row]
    }
  }
  if (tb_play$signo[tb_play_row] == 0){
    tb_play$signo[tb_play_row] <- "Capricórnio"
  }
}

unique(tb_play$signo)

# Escolha uma ou mais:
#   
# a.O jogador da linha 715, Yohan, é de Peixes.
tb_play[715,1:4] # VERDADEIRO 

# b.O jogador da linha 603, Willem, é de Virgem.
tb_play[603,1:4] # FALSO

# c.O jogador da linha 1540, Kent-Are, é de Virgem.
tb_play[1540,1:4] # FALSO

# d.O jogador da linha 1542, Lars Gunnar, é de Câncer.
tb_play[1542,1:4] # VERDADEIRO

# e.O jogador da linha 1154, Lasse, é de Capricórnio.
tb_play[1154,1:4] # VERDADEIRO

# f.O jogador da linha 643, Francis, é de Virgem.
tb_play[643,1:4] # FALSO

# g.O jogador da linha 534, Sung-Yueng, é de Aquário.
tb_play[534,1:4] # VERDADEIRO

# h.O jogador da linha 92, Steven, é de Virgem.
tb_play[92,1:4] # FALSO


# The following code reads data of two-story houses for sale in Curitiba (Brazil) 
# in 26 january 2018. These data were obtained by web scraping advertising 
# websites.
# 
# -----------------------------------------------------------------------
# Real state data table containing description and values:

url <- "http://leg.ufpr.br/~walmes/data/coberturas-venda-cwb-26Jan2018.txt"
tb_imo <- read.table(url,
                     header = TRUE,
                     sep = "\t",
                     skip = 5,
                     comment.char = "",
                     quote = "\"",
                     encoding = "UTF-8")
str(tb_imo)

# Vector of each real state description
x <- trimws(tb_imo[, c("descr")])
x <- x[nchar(x) >= 80]
length(x)
x[1]         # First element of x description
nchar(x[1])  # Number of characters

# str(x)
summary(nchar(x))

# #-----------------------------------------------------------------------
# Considere o vetor x, de tamanho 724 cujos valores são do tipo character. Cada 
# elemento de x é a descrição de um imóvel. O texto da descrição do imível é 
# longo, geralmente com mais 800 caracteres. No entanto, para uma aplicação, 
# esse texto precisa ser quebrado em fragmentos que não ultrapassem 50 
# caracteres.
# 
# A função strsplit() permite quebrar textos. No código abaixo, o texto é 
# quebrado nos espaços. A função paste() pode ser usada para concatenar textos.
 
# Split a text on its spaces
s <- strsplit(x[43], split = " +")[[1]]

# Concat with spaces
paste(s[1], s[2], s[3], sep = " ")
## [1] "Cobertura deliciosa! Nova,"

# Para o primeiro elemento de x, ou seja, x[1], o resultado desejado é o 
# seguinte. Ou seja, cada fragmento tem no máximo 50 caracteres.

# ## [1] "Cobertura deliciosa! Nova, ampla, com duas"        
# ## [2] "churrasqueiras e uma deliciosa área externa com"   
# ## [3] "hidromassagem. Bom gosto em todos os ambientes e o"
# ## [4] "melhor, ficam todos os móveis! Tudo completo... É" 
# ## [5] "a sua oportunidade!! Venha logo conhecer!!"
# Para esse exemplo, o vetor resultante do processo teve 5 elementos.
# Escreva um código usando a estrutura FOR de modo a percorrer as palavras da 
# descrição, conforme estão no vetor s acima, para formar sentenças que não 
# ultrapassem 50 caracteres.
# 
# Use nchar() para contar o número de caracteres.
# Use strsplit() para quebrar o vetor.
# Use paste() para concatenar textos.
# Use a estrutura FOR para coordenar o processo para a descrição de cada imóvel.
# Com o seu código escrito e validado para o x[1], determine o que se pede a 
# seguir.

# Check real state table
tb_imo

# Function documentation
help("strsplit")

# Number of characters of a description
nchar(x[1])

# Split test
strsplit(x[1], split=' ')
text <- list()
text[[1]] <- ''
instance <- 0
s_1[43]

nchar(word) + nchar(text[instance])

for (word in s_1[43]){
  print(word)
}

# Split a position of the vector
s <- strsplit(x[1], split = " +")[[1]]

# Shows the description split
s

# Delete content of 'text' variable
text=NULL

# Empty string for loop using
text = ''

# Starting condition for looping
instance <- 1

# Bread text into instances of max 50 characters
for (word in s) {
  if (nchar(word) + nchar(text[instance]) < 50) {
    text[instance] <- paste(text[instance], word)
  }
  else {
    text[instance] <- trimws(text[instance], 'l')
    instance <- instance + 1
    text[instance] <- word
  }
}

# Number of used instances for the split text
instance

# Number of characters of each instance
for (element in text) {
  print(nchar(element))
}
text



# Qual o tamanho do vetor resultante para o texto do elemento em x na posição 43? Resposta: 12
# Qual o tamanho do vetor resultante para o texto do elemento em x na posição 325? Resposta: 21
# Qual o tamanho do vetor resultante para o texto do elemento em x na posição 706? Resposta: 14
# Qual o tamanho do vetor resultante para o texto do elemento em x na posição 708? Resposta: 19
#-----------------------------------
