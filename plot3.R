# --- plot3.R ---

# 1. Cargar datos y preparar variables
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

# 2. Graficar
png("plot3.png", width=480, height=480)

# Primera linea (negra por defecto) - Inicializa el gráfico
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

# Segunda linea (roja) - Se agrega con lines()
lines(datetime, subMetering2, type="l", col="red")

# Tercera linea (azul)
lines(datetime, subMetering3, type="l", col="blue")

# Leyenda en la esquina superior derecha
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5,          # Tipo y grosor de linea en la leyenda
       col=c("black", "red", "blue"))

dev.off()
print("plot3.png creado.")