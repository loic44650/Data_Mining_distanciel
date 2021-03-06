# Projet Data Mining
# Lo�c Mahier && Demetre Phalavandishvili
# Mod�le pour pr�dire PrevionnelAnnuel � l'aide d'une regression lin�aire multiple
# -----------------------------------------------------------------------------------

# on charge le fichier de donn�es
data <- read.csv("C:\\Users\\Lo�c\\Downloads\\Data_Mining\\projet\\Alphaprise_previsionAnnuel.csv", header = TRUE, sep = ",")

# n�c�ssaire pour utiliser splt
require(caTools)

# on divise nos donn�es en 2 ( 75% apprentissage - 25% test)
sample <- sample.split(data, SplitRatio = 0.75)
apprentissage <- subset(data, sample == TRUE)
test <- subset(data, sample == FALSE)

# regression lin�aire multiple
modeleReg <- lm(PrevisionnelAnnuel ~ . , data = apprentissage) # le "." signifie qu'on prend toutes les variables


# ------------------------------------
# Diverses Fonctions

# summary() permet de produire les sorties pour chaque regression pr�sent�es pr�c�demment. Ainsi, cette fonction affiche : les coefficients estim�s, leur �cart-type, et la valeur de la statistique t de Student ainsi que la p-value (probabilit� que le coefficient soit significativement diff�rent de z�ro) associ�es � chaque coefficient. Sont aussi pr�sent�s le R2 et R2 ajust�, ainsi que la statistique F de Fisher (testant la significativit� globales des variables), son degr� de libert�, et la p-value associ�e.
summary(modeleReg)

# Qualit� du mod�le :
# Multiple R-squared:  0.9964,	Adjusted R-squared:  0.9963 
# Plus sa valeur est proche de 1, et plus l'ad�quation entre le mod�le et les donn�es observ�es va �tre forte. Cependant, cette valeur est fortement influenc�e, entre autres, par le nombre de variables explicatives incluses dans la regression. Le R2 ajust� (Adjusted R-Squared) va alors tenir compte de ce nombre et sera donc plus correct.


# coef() permet de n'extraire que les coefficients estim�s.
# coef(modeleReg)

# confint() permet d'afficher l'intervalle de confiance � 95% pour les coefficients estim�s.
# confint(modeleReg)

# fitted() permet d'extraire les valeurs pr�dites.
# fitted(modeleReg)

# resid() permet d'extraire les r�sidus (Valeur pr�dite - Valeur r�elle).
# resid(modeleReg)
# ------------------------------------


# La fonction predict() permet de pr�dire la valeur de y (i.e du prix) pour de nouvelles donn�es (des variables explicatives). Seul les deux premiers arguments sont requis : se.fit permet d'afficher l'�cart-type de la valeur pr�dite, et interval et level permettent afficher ici les valeurs de l'intervalle de confiance fix� � 99%.
# predict(modeleReg, test, se.fit=TRUE, interval = "prediction", level = 0.99)


res = predict(modeleReg, test)
res 

write.csv(res, file ="C:\\Users\\Lo�c\\Downloads\\Data_Mining\\projet\\Alphaprise_previsionAnnuel_predict_test.csv")
