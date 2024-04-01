module debounce_explicit(
    input clk_100MHz,
    input reset,
    input btn,              // button input
    output reg db_tick      // for buttons
    );
    
    // state declarations
    parameter [1:0] zero  = 2'b00,
                    wait0 = 2'b01,
                    wait1 = 2'b10;
    
    // Artix-7 has a 100MHz clk with a period of 10ns    
    // number of counter bits (2^N * 10ns = ~40ms)
    parameter N = 22;
    
    // signal declaration
    reg [1:0] state_reg, next_state;
    reg [N-1:0] q_reg;
    wire [N-1:0] q_next;
    wire q_zero;
    reg q_load, q_dec;
    
    // body
    // FSMD state and data registers
    always @(posedge clk_100MHz or posedge reset) 
        if(reset) begin
            state_reg <= zero;
            q_reg <= 0;
        end
        else begin
            state_reg <= next_state;
            q_reg <= q_next;
        end
        
    // FSMD data path (counter) next state logic
    assign q_next = (q_load) ? {N{1'b1}} :      // load all 1s
                    (q_dec) ? q_reg - 1  :      // decrement
                     q_reg;                     // no change in q
    
    // status signal
    assign q_zero = (q_next == 0);
    
    // FSMD control path next state logic
    always @* begin
        next_state = state_reg;
        q_load = 1'b0;
        q_dec = 1'b0;
        db_tick = 1'b0;
        
        case(state_reg)
            zero    : begin
                        if(btn) begin
                            next_state = wait1;
                            q_load = 1'b1;
                            db_tick = 1'b1; // Immediate data transfer on button press
                        end
            end
            
            wait1   : begin
                        if(btn) begin
                            q_dec = 1'b1;
                            if(q_zero)
                                next_state = zero;
                        end
                        else
                            next_state = zero;
            end
            
            default : next_state = zero;
        endcase
    end
        
endmodule