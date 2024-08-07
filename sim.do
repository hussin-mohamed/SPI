vlib work
vlog *.v
vsim -voptargs=+acc work.SPI_tb
add wave *
add wave -position insertpoint  \
sim:/SPI_tb/spi_dut/spi/tx_valid \
sim:/SPI_tb/spi_dut/spi/tx_data \
sim:/SPI_tb/spi_dut/spi/rx_data \
sim:/SPI_tb/spi_dut/spi/rx_valid \
sim:/SPI_tb/spi_dut/spi/ns \
sim:/SPI_tb/spi_dut/spi/cs \
sim:/SPI_tb/spi_dut/spi/ADD_OR_DATA \
sim:/SPI_tb/spi_dut/spi/counter \
sim:/SPI_tb/spi_dut/spi/updwn
add wave -position insertpoint  \
sim:/SPI_tb/spi_dut/ramm/mem
add wave -position insertpoint  \
sim:/SPI_tb/spi_dut/ramm/write_address \
sim:/SPI_tb/spi_dut/ramm/read_address
run -all
#quit -sim