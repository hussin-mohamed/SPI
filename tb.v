module SPI_tb ();
    reg MOSI,SS_n,clk,rst_n;
    wire MISO;
    SPI_wrapper spi_dut(MOSI,MISO,SS_n,clk,rst_n);
    initial begin
        clk=0;
        forever begin
            #10;
            clk=~clk;
        end
    end
    initial begin
        rst_n=0;
        repeat(2)
        @(negedge clk);
        rst_n=1;
        SS_n=1;
        repeat(2)
        @(negedge clk);
        SS_n=0;
        MOSI=0;
        repeat(2)
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        SS_n=1;
    repeat(2)
        @(negedge clk);
        SS_n=0;
        MOSI=0;
        repeat(2)
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        SS_n=1;
    repeat(2)
        @(negedge clk);
        SS_n=0;
        MOSI=1;
        repeat(2)
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        SS_n=1;
    repeat(2)
        @(negedge clk);
        SS_n=0;
        MOSI=1;
        repeat(2)
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=0;
        @(negedge clk);
        MOSI=1;
        @(negedge clk);
        MOSI=1;
        repeat(9)
        @(negedge clk);
        SS_n=1;
         repeat(2)
        @(negedge clk);
    $stop;
    end
endmodule