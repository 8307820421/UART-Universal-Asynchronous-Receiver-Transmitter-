////`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////
////// Company: 
////// Engineer: 
////// 
////// Create Date: 31.07.2023 10:51:13
////// Design Name: 
////// Module Name: uart19
////// Project Name: 
////// Target Devices: 
////// Tool Versions: 
////// Description: 
////// 
////// Dependencies: 
////// 
////// Revision:
////// Revision 0.01 - File Created
////// Additional Comments:
////// 
//////////////////////////////////////////////////////////////////////////////////////


//module uart_9(
//    input wire clk,btn,
//    output reg outdata
//    );
    
//    reg [7:0] data = 8'b00000000; // to 00111001
//    //reg btn = 1;
//    reg [3:0] bitcount=0;
//    reg [13:0] baudcount=0;
//    reg [9:0] shiftright_reg=0;
//    reg [1:0]state,next_state=0,shift=0,load=0,clear=0;
    

//    always@(posedge clk)
//    begin

//           baudcount<=baudcount+1;
         
//            if(baudcount==10417)
           
//            begin
//                state<=next_state;
              
                
//                if(load)
//                    shiftright_reg <= {1'b1,data,1'b0};
                    
//                if(clear)
//                    bitcount<=0;
                    
//                if(shift)
//                begin
//                    shiftright_reg<=shiftright_reg>>1;
//                    bitcount<=bitcount+1;
//                end

                    
//            end
            
//        end
    
    
//    always@(posedge clk)
//    begin
//        load<=0;
//        shift<=0;
//        clear<=0;
//       outdata<=1;
////         
        
//        case(state)
//            0:
//            begin
//                if(btn)
//                begin
//                    next_state <= 1;
//                    load <= 1;
//                    shift<=0;
//                    clear<=0;
//                end
//                else 
//                begin
//                    next_state <= 0;
//                    outdata <= 1;
                    
//                end
//            end
            
//            1:
//            begin
//                if(bitcount <10) begin
//                  next_state <= 1;
//                    outdata<=shiftright_reg[0];
//                       shift<=1;
//                       end
//                       else begin
//                       clear<=1;
//                       next_state<=0;
//                   if (baudcount==10417) 
//                        data<=data+1;
//                         if(data ==8'b00001001 )
//                             next_state<=2;
//                          end 
//                     end
                     

//            2:begin
//            data<=8'b00000000;
//            clear<=1;
//            if (btn) begin
//            next_state<=2;
//            end
//            else begin
//            next_state<=0;
//            end
//            end
//         endcase
//       end
//endmodule


 //updated uart
module uart_9(
    input wire clk, btn,

    output reg outdata
);

reg [7:0] data = 8'b00000000; // to 00111001
// reg btn = 1;
reg [3:0] bitcount = 0;
reg [13:0] baudcount = 0;
reg [9:0] shiftright_reg = 10'b0000000000; // Changed to 10 bits
reg [1:0] state, next_state = 0, shift = 0, load = 0, clear = 0;

always @(posedge clk) begin
     baudcount<=baudcount+1;
    if (baudcount == 10417) begin
       baudcount <= 0;
        state <= next_state; // Reset baudcount at the end of transmission cycle
        
        if (load)
            shiftright_reg <= {1'b1, data, 1'b0};
       

        if (clear)
            bitcount <= 0;
          

        if (shift) begin
          shiftright_reg <= {shiftright_reg[9], shiftright_reg[9:0]};
            bitcount <= bitcount + 1;
        end
    end
end


always @(posedge clk) begin
    load <= 0;
    shift <= 0;
    clear <= 0;
    outdata <= 1; // This line doesn't seem to change, might need to revise.
    case (state)
        0: begin
          
            if (btn) begin
                next_state <= 1;
                load <= 1;
                shift<=0;
                clear<=0;
            end else begin
                next_state <= 0;
                outdata <= 1;
            end
        end

        1: begin
            if (bitcount < 8) begin
                next_state <= 1;
                outdata <= shiftright_reg[0];
                shift <= 1;
            end else begin
                clear <= 1;
                next_state <= 0;
                if (baudcount == 10417) 
                    data <= data + 1;
                      if (data == 8'b00001000) 
                    next_state<=2;
           
            end
            end
          
     
        2: begin
          
            data <= 8'b00000000;
           clear <= 1;
          //baudcount<=0;
            if ( btn ) begin
            next_state <=2;
            end
            else  begin
                next_state <= 0;
          end
        end
    endcase
end

endmodule
