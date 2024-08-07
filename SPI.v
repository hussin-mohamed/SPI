module Spi_slave (MOSI,MISO,SS_n,clk,rst_n,rx_data,rx_valid,tx_data,tx_valid);
    parameter IDLE = 'b000 , CHK_CMD = 'b001 , WRITE = 'b010 , READ_ADD = 'b011 , READ_DATA = 'b100;

    input MOSI,SS_n,clk,rst_n,tx_valid;
    input [7:0] tx_data;
    output reg [9:0] rx_data;
    output reg MISO,rx_valid;

   (* fsm_encoding = "gray" *)

    reg [2:0] ns,cs;
    reg ADD_OR_DATA ;
    reg [4:0] counter;
    reg updwn;

    always @(posedge clk) begin
        if(~rst_n)begin
        cs <= IDLE; 
        
        end
        else 
        cs <= ns;
    end

    always @(cs,MOSI,SS_n) begin
        case (cs)
            IDLE:begin
                if (SS_n) ns = IDLE;
                else ns = CHK_CMD;
            end

            CHK_CMD: begin
                if (SS_n) ns = IDLE;
                else begin
                    if (MOSI) begin
                        if (ADD_OR_DATA) ns = READ_DATA;
                        else  ns = READ_ADD;
                    end
                    else  ns = WRITE; 
                end
            end

            WRITE:begin
                if (SS_n) ns = IDLE;
                else ns = WRITE;
            end 

            READ_ADD: begin
                if (SS_n) ns = IDLE;
                else ns = READ_ADD;
            end
            
            READ_DATA: begin
                if (SS_n) ns = IDLE;
                else ns = READ_DATA;
            end
            default: ns = IDLE;
        endcase
    end

    always @(posedge clk ) begin
        if(~rst_n)begin
           rx_valid <= 0; 
           rx_data <=0;
           ADD_OR_DATA <= 0;
           MISO <= 0;
           counter <= 0;
           updwn <=0;
        end
        
        else begin
            if (~updwn) begin
            counter  <= counter + 1;    
            end
            else
            counter  <=counter-1;
        case (cs)


        WRITE:begin

            updwn <=0;
            MISO <= 0;

            if (counter == 9) begin
               counter <= 0;
               rx_valid <= 1;  
            end

            else  rx_valid <= 0;

            rx_data <= {rx_data[8:0],MOSI};
        end 


        READ_ADD: begin

            updwn <=0;
            MISO <= 0;

            if (counter == 9) begin
               counter <= 0;
               rx_valid <= 1;
            ADD_OR_DATA <= 1;  
            end

            else  rx_valid <= 0;

            rx_data <= {rx_data[8:0],MOSI};
        end 


        READ_DATA: begin

        if (counter<=9 && (~updwn)) begin 
            rx_valid <= 0;
            rx_data <= {rx_data[8:0],MOSI};
        end

        if (counter == 9) begin
                counter<=8;
               rx_valid <= 1;
               updwn <=1;  
            end  

            if (rx_valid && tx_valid) MISO <= tx_data[counter];

        end
            default:begin
           rx_valid <= 0; 
           rx_data <=0;
           MISO <= 0;
           counter <= 0;
           updwn <=0;
           end
        endcase 
        end
    end
endmodule