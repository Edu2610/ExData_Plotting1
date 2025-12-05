# --- plot4.R ---

# 1. Cargar datos y preparar variables
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

# 2. Graficar
png("plot4.png", width=480, height=480)

# Dividir la pantalla en 2 filas y 2 columnas
par(mfrow = c(2, 2))

# -- Gráfico 1: Arriba-Izquierda (Global Active Power) --
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# -- Gráfico 2: Arriba-Derecha (Voltage) --
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# -- Gráfico 3: Abajo-Izquierda (Sub metering) --
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# Nota: bty="n" quita el borde de la caja de la leyenda, común en este plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n") 

# -- Gráfico 4: Abajo-Derecha (Global Reactive Power) --
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
print("plot4.png creado.")