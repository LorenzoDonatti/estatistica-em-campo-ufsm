# Estatística em campo • UFSM
# Extraia o ZIP, abra a pasta no RStudio como diretório de trabalho e abra este
# script. Execute um bloco por vez (seleção + Ctrl+Enter / Cmd+Enter).
# Anote suas previsões e conclusões em comentários nesta cópia.
# Apenas R base. Os gráficos aparecem no painel Plots do RStudio.

# A — Conhecer o arquivo
arquivo <- if (file.exists("data/penguins.csv")) "data/penguins.csv" else "../data/penguins.csv"
dados <- read.csv(arquivo, na.strings = c("NA", ""))
head(dados)
str(dados)
table(dados$species)
# Reproduza o atlas para Dream em 2007. Experimente a ilha que sua dupla escolheu.
table(subset(dados, island == "Dream" & year == 2007)$species)
colSums(is.na(dados))
adelie <- subset(dados, species == "Adelie")
# Qual é a unidade de observação? Escolha uma variável categórica e uma quantitativa.

# B — Descrever e decidir quem entra
boxplot(body_mass_g ~ species, dados, ylab = "Massa corporal (g)", xlab = "Espécie")
massa <- na.omit(adelie$body_mass_g)
sexo <- adelie$sex[adelie$sex %in% c("female", "male")]
hist(massa, xlab = "Massa (g)", main = "Adélie", col = "cadetblue")
summary(massa)
sd(massa)
c(total = nrow(adelie), com_massa = length(massa), com_sexo = length(sexo))
# Encontre um animal com massa conhecida e sexo ausente. Em qual análise ele entra?
subset(adelie, !is.na(body_mass_g) & is.na(sex))

# C — Massa média. Escreva H0 e H1 antes de executar.
ep <- sd(massa) / sqrt(length(massa))
c(media = mean(massa), erro_padrao = ep)
t.test(massa, mu = 3700, alternative = "two.sided", conf.level = 0.95)
# Conclusão com unidade, IC e decisão a 5%:

# D — Proporção. Antecipe o denominador e a direção da diferença.
femeas <- sum(sexo == "female")
binom.test(femeas, length(sexo), p = 0.5, alternative = "two.sided", conf.level = 0.95)
# Que hipótese de amostragem seria problemática se a coleta fosse feita em pares?

# E — Relação entre duas medidas. Antecipe o sinal antes de calcular r.
pares <- subset(adelie, !is.na(body_mass_g) & !is.na(flipper_length_mm))
x <- pares$flipper_length_mm
y <- pares$body_mass_g
plot(x, y, xlab = "Nadadeira (mm)", ylab = "Massa (g)", pch = 16, col = "cadetblue")
cor(x, y)
# Compare retas pelo centro da nuvem. Experimente outra inclinação em g/mm.
for (inclinacao in c(0, 20, 33, 55)) {
  previsto <- mean(y) + inclinacao * (x - mean(x))
  print(c(inclinacao = inclinacao, soma_quadrados_g2 = sum((y - previsto)^2)))
}
modelo <- lm(body_mass_g ~ flipper_length_mm, data = pares)
abline(modelo)
summary(modelo)
confint(modelo)
c(observado = y[1], ajustado = fitted(modelo)[1], residuo = residuals(modelo)[1])
plot(fitted(modelo), residuals(modelo), xlab = "Massa ajustada (g)", ylab = "Resíduo (g)")
abline(h = 0, lty = 2)
qqnorm(residuals(modelo))
qqline(residuals(modelo))
# Escreva a unidade da inclinação e o que muda na estimativa para mais 10 mm.

# F — Caso das requisições do slide. Registre as respostas da dupla.
# Unidade de observação:
# Denominador da taxa de sucesso:
# Teste, referência e IC para latência média:
# Gráfico, unidade da inclinação e possível fonte de dependência:
