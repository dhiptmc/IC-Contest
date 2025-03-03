module Bicubic (
input       CLK,
input       RST,
input [6:0] V0,
input [6:0] H0,
input [4:0] SW,
input [4:0] SH,
input [5:0] TW,
input [5:0] TH,
output reg  DONE);

//ROM signals
wire [7:0]  ROM_data_o;
reg         ROM_CEN;
reg  [13:0] ROM_addr;
//SRAM signals
wire [7:0]  SRAM_data_o;
reg         SRAM_CEN;
reg         SRAM_WEN;
wire [13:0] SRAM_addr;
reg  [ 7:0] SRAM_data_i;

reg [ 2:0] counter;
reg [ 2:0] counter_v;

reg [31:0] position_x, position_y; //increase precision to 32bits
reg [ 6:0] h_index, v_index;

//ax^3+bx^2+cx+d
reg [31:0] x;
reg [ 7:0] value_minus_1;
reg [ 7:0] value_0;
reg [ 7:0] value_1;
reg [ 7:0] value_2;
reg [ 7:0] inter_pol_data_y  [3:0];
reg [ 7:0] inter_pol_data_16 [3:0][3:0];
reg signed [32:0] a,b,c,d;
wire [63:0] xsquare;
wire [31:0] xsquare_round;
wire [63:0] xcubic;
wire [31:0] xcubic_round;

wire signed [63:0] aresult, bresult, cresult;
wire signed [31:0] aresult_round, bresult_round, cresult_round;

wire signed [31:0] px;

//FSM
localparam [2:0]    IDLE      = 3'd0,
                    POSITION  = 3'd1,
                    LOAD      = 3'd2,
                    PASSPRE   = 3'd3,
                    PASSPOST  = 3'd4,
                    BICUPRE   = 3'd5,
                    BICUPOST  = 3'd6,
                    FINI      = 3'd7;

reg [2:0] cur_state, nxt_state;
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        cur_state <= IDLE;
    else
        cur_state <= nxt_state;
end

always @ (*)
begin
    case(cur_state)
    IDLE:
        nxt_state = POSITION;

    POSITION:
        nxt_state = LOAD;

    LOAD:
    begin
        if( ((h_index == 7'd0)||(h_index == (TW - 1))) && ((v_index == 7'd0)||(v_index == (TH - 1))) )
            nxt_state = (counter == 3'd1) ? PASSPRE : LOAD;
        else if( (h_index == 7'd0) || (h_index == (TW - 1)) || (v_index == 7'd0) || (v_index == (TH - 1)) )
            nxt_state = (counter == 3'd4) ? PASSPRE : LOAD;
        else
            nxt_state = (counter == 3'd4) ? BICUPRE : LOAD;
    end

    PASSPRE:
        nxt_state = PASSPOST;

    PASSPOST:
        nxt_state = ( (h_index == (TW - 1)) && (v_index == (TH - 1)) ) ? FINI : POSITION;

    BICUPRE:
        nxt_state = BICUPOST;

    BICUPOST:
        nxt_state = (counter_v == 3'd3) ? PASSPRE : POSITION; 

    FINI:
        nxt_state = IDLE;
    endcase
end

//linear interpolation
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        position_x <= 32'd0;
        position_y <= 32'd0;
    end
    else if(cur_state == POSITION)
    begin
        position_x <= ( ((SW - 1) << 23) ) / (TW - 1) * h_index;
        position_y <= ( ((SH - 1) << 23) ) / (TH - 1) * v_index;
    end
end

always @ (*)
begin
    if( (h_index == 0) || (h_index == TW - 1) )
        x = position_y;
    else if( (v_index == 0) || (v_index == TH - 1) )
        x = position_x;
    else
    begin
        if( (cur_state == PASSPRE) || (cur_state == PASSPOST) )
            x = position_y;
        else
            x = position_x;
    end
end

always @ (*)
begin
    value_minus_1 = inter_pol_data_16[counter_v][0];
    value_0       = inter_pol_data_16[counter_v][1];
    value_1       = inter_pol_data_16[counter_v][2];
    value_2       = inter_pol_data_16[counter_v][3];

    if(cur_state == PASSPRE)
    begin
        value_minus_1 = inter_pol_data_y[0];
        value_0       = inter_pol_data_y[1];
        value_1       = inter_pol_data_y[2];
        value_2       = inter_pol_data_y[3];
    end
end

always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        a <= 33'd0;
        b <= 33'd0;
        c <= 33'd0;
        d <= 33'd0;
    end
    else if ( (cur_state == PASSPRE) || (cur_state == BICUPRE) )
    begin
        a <= ( $signed(33'h1_ffc0_0000) * $signed({1'b0, value_minus_1}) ) //coefficient left shift 23bits and right shift 1 bit to divide 2
           + ( $signed(33'h0_00c0_0000) * $signed({1'b0, value_0      }) ) 
           + ( $signed(33'h1_ff40_0000) * $signed({1'b0, value_1      }) ) 
           + ( $signed(33'h0_0040_0000) * $signed({1'b0, value_2      }) );

        b <= ( $signed({2'd0 , value_minus_1 , 23'd0}))
           + ( $signed(33'h1_fec0_0000) * $signed({1'b0, value_0      }))
           + ( $signed(33'h0_0100_0000) * $signed({1'b0, value_1      }))
           + ( $signed(33'h1_ffc0_0000) * $signed({1'b0, value_2      }));

        c <= ( $signed(33'h1_ffc0_0000) * $signed({1'b0, value_minus_1}) )
           + ( $signed(33'h0_0040_0000) * $signed({1'b0, value_1      }) );
        
        d <= (value_0 << 23);
    end
end

assign xsquare       = x[22:0] * x[22:0]; //use the decimal part in this function!
assign xsquare_round = (xsquare[22]) ? xsquare[54:23] + 32'd1 : xsquare[54:23];
assign xcubic        = xsquare_round * x[22:0];
assign xcubic_round  = (xcubic[22] ) ? xcubic[54:23]  + 32'd1 : xcubic[54:23];

assign aresult       = a * $signed({1'b0, xcubic_round});
assign bresult       = b * $signed({1'b0, xsquare_round});
assign cresult       = c * $signed({1'b0, x[22:0]});
assign aresult_round = (aresult[22]) ? aresult[54:23] + 32'd1 : aresult[54:23]; //use the front part of the number
assign bresult_round = (bresult[22]) ? bresult[54:23] + 32'd1 : bresult[54:23];
assign cresult_round = (cresult[22]) ? cresult[54:23] + 32'd1 : cresult[54:23];

assign px            = aresult_round + bresult_round + cresult_round + d;

//counter
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        counter <= 3'd0;      
    end
    else
    begin
        case(cur_state)
        LOAD:
            counter <= (counter == 3'd4) ? 3'd0 : (counter + 3'd1);
        PASSPOST:
            counter <= 3'd0;
        default:
            counter <= 3'd0;
        endcase
    end
end

//counter_v
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        counter_v <= 3'd0;
    end
    else
    begin
        case(cur_state)
        PASSPOST:
            counter_v <= 3'd0;
        BICUPOST:
            counter_v <= counter_v + 3'd1;
        default:
            counter_v <= counter_v;
        endcase
    end
end

//h_index
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        h_index <= 7'd0;
    else if(cur_state == PASSPOST)
        h_index <= (h_index == TW - 1) ? 7'd0 : h_index + 7'd1; 
    else if(cur_state == FINI)
        h_index <= 7'd0;
end

//v_index
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        v_index <= 7'd0;
    else if(cur_state == PASSPOST)
        v_index <= (h_index == TW - 1) ? (v_index + 7'd1) : v_index;
    else if(cur_state == FINI)
        v_index <= 7'd0;
end

//control signals for ROM & SRAM
always @ (*)
begin
    case(cur_state)
    IDLE, POSITION, PASSPRE, BICUPRE, BICUPOST:
    begin
        ROM_CEN   = 1'b1;

        SRAM_CEN  = 1'b1;
        SRAM_WEN  = 1'b1;

        DONE      = 1'b0;
    end

    LOAD:
    begin
        ROM_CEN   = 1'b0;

        SRAM_CEN  = 1'b1;
        SRAM_WEN  = 1'b1;

        DONE      = 1'b0;
    end

    PASSPOST: //WRITE
    begin
        ROM_CEN   = 1'b1;

        SRAM_CEN  = 1'b0;
        SRAM_WEN  = 1'b0;

        DONE      = 1'b0;
    end   

    FINI:
    begin
        ROM_CEN   = 1'b1;

        SRAM_CEN  = 1'b1;
        SRAM_WEN  = 1'b1;

        DONE      = 1'b1;
    end
    endcase 
end

//load address
always @ (*)
begin
    if( (h_index == 7'd0) && (v_index == 7'd0) ) //UL
        ROM_addr = V0 * 100 + H0;
    else if( (h_index == (TW - 1)) && (v_index == 7'd0) ) //UR
        ROM_addr = V0 * 100 + H0 + (SW - 1);
    else if( (h_index == 7'd0) && (v_index == (TH - 1)) ) //LL
        ROM_addr = (V0 + (SH - 1)) * 100 + H0;
    else if( (h_index == (TW - 1)) && (v_index == (TH - 1)) ) //LR
        ROM_addr = (V0 + (SH - 1)) * 100 + H0 + (SW - 1);
    else if(h_index == 7'd0)
        ROM_addr = (V0 + position_y[31:23] + counter - 1) * 100 + H0;
    else if(h_index == (TW - 1))
        ROM_addr = (V0 + position_y[31:23] + counter - 1) * 100 + H0 + (SW - 1);
    else if(v_index == 7'd0)
        ROM_addr = V0 * 100 + H0 + position_x[31:23] + counter - 1;
    else if(v_index == (TH - 1))
        ROM_addr = (V0 + (SH - 1)) * 100 + H0 + position_x[31:23] + counter - 1;
    else
        ROM_addr = (V0 + position_y[31:23] + counter_v - 1) * 100 + H0 + position_x[31:23] + counter - 1;
end


always @ (posedge CLK)
begin
    if(cur_state == BICUPOST)
        inter_pol_data_y[counter_v] <= SRAM_data_i;
    else if( (cur_state == LOAD) && (counter > 0) )
    begin
        if( (h_index != 7'd0) && (h_index != (TW - 1)) && (v_index != 7'd0) && (v_index != (TH - 1)) ) 
            inter_pol_data_16[counter_v][counter - 1] <= ROM_data_o;
        else
            inter_pol_data_y[counter - 1] <= ROM_data_o;
    end
end

//data output
always @ (*)
begin
    if( ((h_index == 7'd0)||(h_index == (TW - 1))) && ((v_index == 7'd0)||(v_index == (TH - 1))) )
        SRAM_data_i = inter_pol_data_y[0];
    else
    begin
        if(px[31])
            SRAM_data_i = 8'd0;
        else
            SRAM_data_i = (px[22]) ? px[30:23] + 8'd1 : px[30:23];
    end
end

assign SRAM_addr = v_index * TW + h_index;

ImgROM     u_ImgROM     (.Q( ROM_data_o), .CLK(CLK), .CEN( ROM_CEN), .A(ROM_addr));
ResultSRAM u_ResultSRAM (.Q(SRAM_data_o), .CLK(CLK), .CEN(SRAM_CEN), .WEN(SRAM_WEN), .A(SRAM_addr), .D(SRAM_data_i));

endmodule