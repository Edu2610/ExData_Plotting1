# --- plot1.R ---

# 1. Cargar datos
# Nota: Esto puede tardar unos segundos porque el archivo es grande
print("Cargando datos...")
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# 2. Filtrar fechas (1 y 2 de Febrero de 2007)
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

# 3. Convertir la variable a numérica para poder graficarla
globalActivePower <- as.numeric(data$Global_active_power)

# 4. Crear el archivo PNG (abrir dispositivo gráfico)
png("plot1.png", width=480, height=480)

# 5. Dibujar el histograma
hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# 6. Cerrar dispositivo (guardar archivo)
dev.off()

print("¡Listo! Archivo plot1.png creado.")