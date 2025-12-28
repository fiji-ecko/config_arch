cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
cpu_freq=$(lscpu | grep "CPU MHz" | awk '{printf "%.2f", $3/1000}')
cpu_temp=$(sensors | grep "Package id" | awk '{print $4}' | tr -d '+°C')

echo "{\"text\": \"$cpu_usage%\", \"tooltip\": \"Frequency: ${cpu_freq}GHz\\nTemperature: ${cpu_temp}°C\"}"
