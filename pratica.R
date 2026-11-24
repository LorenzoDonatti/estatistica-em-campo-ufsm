# Estatística em campo • UFSM
# Extraia o ZIP, abra a pasta no RStudio como diretório de trabalho e abra este
# script. Execute um bloco por vez (seleção + Ctrl+Enter / Cmd+Enter).
# Anote suas previsões e conclusões em comentários nesta cópia.
# Apenas R base. Os gráficos aparecem no painel Plots do RStudio.

# A — Conhecer o arquivo
# Lâmina 4
arquivo <- "data/penguins.csv"
if (!file.exists(arquivo)) arquivo <- "../data/penguins.csv"
dados <- read.csv(arquivo, na.strings = c("NA", ""))
head(dados)
str(dados)
table(dados$species)
dream <- subset(dados, island == "Dream" & year == 2007)
table(dream$species)
colSums(is.na(dados))
adelie <- subset(dados, species == "Adelie")

# B — Descrever e decidir quem entra
# Lâmina 5
boxplot(body_mass_g ~ species, data = dados, ylab = "Massa (g)")

# Lâmina 6
massa <- na.omit(adelie$body_mass_g)
hist(massa, xlab = "Massa (g)", main = "Adélie")
median(massa)
summary(massa)

# Lâmina 7
sexo <- na.omit(adelie$sex)
length(massa)
length(sexo)
subset(adelie, !is.na(body_mass_g) & is.na(sex))

# Lâmina 8
mean(massa)
sd(massa)

# C — Inferência para a média
# Lâmina 9
ep <- sd(massa) / sqrt(length(massa))
ep

# Lâmina 11
teste_media <- t.test(massa, mu = 3700)
teste_media

# Lâmina 12
teste_media$conf.int
teste_media$p.value

# D — Proporção
# Lâmina 13
femeas <- sum(sexo == "female")
femeas / length(sexo)

# Lâmina 14
teste_prop <- binom.test(femeas, length(sexo), p = 0.5)
teste_prop

# E — Correlação e regressão
# Lâmina 15
pares <- subset(adelie, !is.na(body_mass_g) &
                          !is.na(flipper_length_mm))
x <- pares$flipper_length_mm
y <- pares$body_mass_g
plot(x, y, xlab = "Nadadeira (mm)", ylab = "Massa (g)",
     pch = 16, col = "cadetblue")
cor(x, y)

# Lâmina 16
modelo <- lm(body_mass_g ~ flipper_length_mm, data = pares)
abline(modelo)
# Compare inclinações (g/mm).
for (inclinacao in c(0, 20, 33, 55)) {
  previsto <- mean(y) + inclinacao * (x - mean(x))
  sq <- sum((y - previsto)^2)
  print(c(inclinacao = inclinacao, soma_quadrados_g2 = sq))
}

# Lâmina 17
fitted(modelo)[1]
residuals(modelo)[1]

# Lâmina 18
summary(modelo)
confint(modelo)

# Lâmina 19
plot(fitted(modelo), residuals(modelo))
abline(h = 0, lty = 2)
qqnorm(residuals(modelo))
qqline(residuals(modelo))

# F — Caso das requisições do slide. Registre as respostas da dupla.
# Unidade de observação:
# Denominador da taxa de sucesso:
# Teste, referência e IC para latência média:
# Gráfico, unidade da inclinação e possível fonte de dependência:
