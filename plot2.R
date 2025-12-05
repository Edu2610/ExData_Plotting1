# --- plot2.R ---

# 1. Cargar datos
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# 2. Filtrar fechas
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

# 3. Convertir Fecha y Hora
# Creamos una variable 'datetime' combinando Date y Time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)

# 4. Graficar
png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, 
     type="l",                # 'l' significa lines (líneas)
     xlab="",                 # Sin etiqueta en eje X
     ylab="Global Active Power (kilowatts)")

dev.off()
print("plot2.png creado.")