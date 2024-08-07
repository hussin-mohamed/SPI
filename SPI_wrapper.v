module SPI_wrapper (
    MOSI,MISO,SS_n,clk,rst_n
);
    input MOSI,SS_n,clk,rst_n;
    output MISO;

    wire [9:0]rx_data ;
    wire rx_valid,tx_valid;
    wire [7:0]tx_data;
    
    Spi_slave spi(MOSI,MISO,SS_n,clk,rst_n,rx_data,rx_valid,tx_data,tx_valid);
    ram ramm(rx_data,rx_valid,tx_data,tx_valid,clk,rst_n);
endmodule