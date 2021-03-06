#Carregando a base de dados mtcars
data(mtcars) 

#Analisando os dados dispon�veis na base
mtcars

## 1. Usando mtcars, trazer a m�dia de miles per galon da marca Mercedez. 
## Atribuir isso a uma vari�vel x.
x <- mean(mtcars[8:14,c(1)])

x
# o comando c seleciona apenas a primeira coluna (miles per galon)
# para selecionar os carros da mercedes usamos indicamos que as linhas de [8:14] sejam retornadas
# o comando mean faz a m�dia dos valores
# por fim imprimo a variavel

## 2. Testar se h� correla��o entre o peso do carro e o consumo de gasolina. 
## Existe? Por qu�?

cor(mtcars[c("wt","mpg")])

plot(mtcars$wt,mtcars$mpg,xlab = "Peso (ton)", ylab = "Consumo (mpg)")

# De acordo com o coeficiente de correla��o de Pearson existe uma correla��o 
# negativa entre eles. Ou seja conforme o gr�fico "plotado" quanto menor o peso 
# em toneladas mais milhas por gal�o o carro anda. Como podemos ver abaixo
# todos os carros que possuem menos de 2 toneladas conseguem andar mais de 25
# milhas por gal�o e isso vai se mantendo de maneira descendente at� os carros 
# com 5 toneladas que "andam" em m�dia 10 milhas com um gal�o. 

lines(lowess(mtcars$wt,mtcars$mpg), col = "red")


#3. Usando quakes, qual � a maior magnitude de um terremoto? e qual a magnitude
#m�dia? e o desvio entre as magnitudes?

#Carregando a base de dados quakes
data(quakes) 

#Visualizando as primeiras linhas do conjunto de dados
head(quakes)

# Aqui eu visualizo os valores max, min e m�dios para cada coluna
summary(quakes)

# Aqui eu tenho a maior magnitude de um terremoto
max(quakes$mag)

# Aqui eu tenho a magnitude m�dia
mean(quakes$mag)

# Aqui eu tenho o desvio padr�o
sd(quakes$mag)

#4. Usando cars, qual � a dist�ncia de frenagem se o carro estiver a 90 milhas
#por hora.

#Carregando a base de dados cars
data("cars")

# Aqui eu atribuo no objeto carsfit o resultado do meu coeficiente
# esse valor � obtido atrav�s de um modelo de de regress�o linear o LM
# Eu informo as variaveis para qual quer se encontrar o coeficiente
# e a base dos dados.
carsfit <- lm(dist ~ speed, data = cars)

carsfit

# Aqui eu chamo a fun��o predict que vai fazer uma predi��o do 
# valor de frenagem baseado na velocidade informada.
p <- predict(carsfit, newdata = data.frame(speed = 90))

# Aqui eu exibo o valor da predi��o.
p

