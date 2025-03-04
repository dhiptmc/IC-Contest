`define abs(a,b) ((a>=b)? a-b : b-a)

module LASER (
input CLK,
input RST,
input [3:0] X,
input [3:0] Y,
output reg [3:0] C1X,
output reg [3:0] C1Y,
output reg [3:0] C2X,
output reg [3:0] C2Y,
output reg DONE);

reg [5:0] key1, key1max, key1union, key1union_reg;
reg [5:0] key2, key2max, key2union, key2union_reg;
reg [5:0] max, max_reg;

reg [2:0] cur_state, nxt_state;
localparam [2:0] LOAD           = 3'b000,
                 CIR1           = 3'b001,
                 CIR2           = 3'b010,
                 CIR_RECURSION1 = 3'b011,
                 CIR_RECURSION2 = 3'b100,
                 RETURN         = 3'b101,
                 FINI           = 3'b110;

reg [5:0] counter;

reg [3:0] point_x [39:0];
reg [3:0] point_y [39:0];

reg [3:0] C1X_reg;
reg [3:0] C1Y_reg;
reg [3:0] C2X_reg;
reg [3:0] C2Y_reg;

reg flag, flag2;

//FSM
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        cur_state <= LOAD;
    else
        cur_state <= nxt_state;
end

always @ (*)
begin
    case(cur_state)
    LOAD:
        nxt_state = (counter == 6'd39) ? CIR1 : LOAD;

    CIR1:
        nxt_state = ( (counter == 6'd40) && (C1X_reg == 4'd15) && (C1Y_reg == 4'd15) ) ? CIR2 : CIR1;

    CIR2:
        nxt_state = ( (counter == 6'd40) && (C2X_reg == 4'd15) && (C2Y_reg == 4'd15) ) ? CIR_RECURSION1 : CIR2;

    CIR_RECURSION1:
        nxt_state = (DONE) ? FINI : ( (counter == 6'd40) && (C1X_reg == 4'd12) && (C1Y_reg == 4'd12) ) ? CIR_RECURSION2 : CIR_RECURSION1;

    CIR_RECURSION2:
        nxt_state = (DONE) ? FINI : ( (counter == 6'd40) && (C2X_reg == 4'd12) && (C2Y_reg == 4'd12) ) ? CIR_RECURSION1 : CIR_RECURSION2;

    FINI:
        nxt_state = LOAD;

    default:
        nxt_state = LOAD;    
    endcase
end

always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        counter <= 6'd0;
    end
    else
    begin
        case(cur_state)
        LOAD:
            counter <= (counter != 6'd39) ? (counter + 6'd1) : 6'd0;
        CIR1, CIR2, CIR_RECURSION1, CIR_RECURSION2:
            counter <= (counter != 6'd40) ? (counter + 6'd1) : 6'd0;
        default:
            counter <= 6'd0;
        endcase
    end
end

always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        point_x[counter] <= 4'd0;
        point_y[counter] <= 4'd0;
    end
    else
    begin
        case(cur_state)
        LOAD:
        begin
            point_x[counter] <= X;
            point_y[counter] <= Y;
        end
        endcase
    end
end

always @ (posedge CLK or posedge RST) //distance <= (x^2 + y^2) = 16
begin
    if(RST)
    begin
        C1X           <= 4'd0;
        C1Y           <= 4'd0;
        C1X_reg       <= 4'd0;
        C1Y_reg       <= 4'd0;
        key1          <= 6'd0;
        key1union     <= 6'd0;
        key1union_reg <= 6'd0;
        key1max       <= 6'd0;
        C2X           <= 4'd0;
        C2Y           <= 4'd0;
        C2X_reg       <= 4'd0;
        C2Y_reg       <= 4'd0;
        key2          <= 6'd0;
        key2union     <= 6'd0;
        key2union_reg <= 6'd0;
        key2max       <= 6'd0;
        max           <= 6'd0;
        max_reg       <= 6'd0;
        DONE          <= 1'b0;
        flag          <= 1'b0;
        flag2         <= 1'b0;
    end
    else
    begin
        case(cur_state)
        LOAD:
            DONE <= 1'b0;

        CIR1:
        begin
            DONE <= 1'b0;
            if(counter < 6'd40)
            begin
                if ( (`abs(C1X_reg,point_x[counter]) * `abs(C1X_reg,point_x[counter])) + (`abs(C1Y_reg,point_y[counter]) * `abs(C1Y_reg,point_y[counter])) <= 16 )
                    key1 <= key1 + 6'd1;
            end
            else
            begin
                key1 <= 6'd0;

                if(C1X_reg != 4'd15)
                    C1X_reg <= C1X_reg + 4'd1;
                else
                begin
                    C1X_reg <= 4'd0;
                    C1Y_reg <= C1Y_reg + 4'd1;
                end

                if(key1 > key1max)
                begin
                    key1max <= key1;
                    C1X <= C1X_reg;
                    C1Y <= C1Y_reg;
                end
            end
        end

        CIR2:
        begin
            DONE <= 1'b0;
            if(counter < 6'd40)
            begin
                if( (`abs(C2X_reg,point_x[counter])   * `abs(C2X_reg,point_x[counter])) + (`abs(C2Y_reg,point_y[counter]) * `abs(C2Y_reg,point_y[counter])) <= 16 )
                begin
                    key2union <= key2union + 6'd1;
                    if(!( (`abs(C1X,point_x[counter]) * `abs(C1X,point_x[counter]))     + (`abs(C1Y,point_y[counter])     * `abs(C1Y,point_y[counter])) <= 16 ))
                        key2 <= key2 + 6'd1;
                end
            end
            else
            begin
                key2      <= 6'd0;
                key2union <= 6'd0;

                if(C2X_reg != 4'd15)
                    C2X_reg <= C2X_reg + 4'd1;
                else
                begin
                    C2X_reg <= 4'd0;
                    C2Y_reg <= C2Y_reg + 4'd1;
                end

                if(key2 > key2max)
                begin
                    key2max       <= key2;
                    key2union_reg <= key2union;
                    C2X           <= C2X_reg;
                    C2Y           <= C2Y_reg;

                    if((key2 + key1max) > max)
                    begin
                        max     <= key2 + key1max;
                        max_reg <= key2 + key1max;
                    end
                end

                if((C2X_reg == 4'd15) && (C2Y_reg == 4'd15))
                begin
                    key1max <= 6'd0;
                    C1X_reg <= 4'd2;
                    C1Y_reg <= 4'd2;
                    C2X_reg <= 4'd2;
                    C2Y_reg <= 4'd2;
                end
            end
        end

        CIR_RECURSION1:
        begin
            if(counter < 6'd40)
            begin
                if( (`abs(C1X_reg,point_x[counter])   * `abs(C1X_reg,point_x[counter])) + (`abs(C1Y_reg,point_y[counter]) * `abs(C1Y_reg,point_y[counter])) <= 16 )
                begin
                    key1union <= key1union + 6'd1;
                    if(!( (`abs(C2X,point_x[counter]) * `abs(C2X,point_x[counter]))     + (`abs(C2Y,point_y[counter])     * `abs(C2Y,point_y[counter])) <= 16 ))
                        key1 <= key1 + 6'd1;
                end
            end
            else
            begin
                key1      <= 6'd0;
                key1union <= 6'd0;

                if(C1X_reg != 4'd12)
                    C1X_reg <= C1X_reg + 4'd1;
                else
                begin
                    C1X_reg <= 4'd2;
                    C1Y_reg <= C1Y_reg + 4'd1;
                end

                if((key1 + key2union_reg) >= max)
                begin
                    max <= key1 + key2union_reg;
                    key1union_reg <= key1union;
                    C1X           <= C1X_reg;
                    C1Y           <= C1Y_reg;             
                end
                
                if((C1X_reg == 4'd12) && (C1Y_reg == 4'd12))
                begin
                    if(max == max_reg)
                    begin
                        flag <= 1'b1;
                        if(flag)
                            flag2 <= 1'b1;
                            if(flag2)
                                DONE <= 1'b1;
                    end
                    key2union_reg <= 6'd0;
                    max_reg <= max;

                    C1X_reg <= 4'd2;
                    C1Y_reg <= 4'd2;
                    C2X_reg <= 4'd2;
                    C2Y_reg <= 4'd2;
                end
            end
        end

        CIR_RECURSION2:
        begin
            if(counter < 6'd40)
            begin
                if( (`abs(C2X_reg,point_x[counter])   * `abs(C2X_reg,point_x[counter])) + (`abs(C2Y_reg,point_y[counter]) * `abs(C2Y_reg,point_y[counter])) <= 16 )
                begin
                    key2union <= key2union + 6'd1;
                    if(!( (`abs(C1X,point_x[counter]) * `abs(C1X,point_x[counter]))     + (`abs(C1Y,point_y[counter])     * `abs(C1Y,point_y[counter])) <= 16 ))
                        key2 <= key2 + 6'd1;
                end
            end
            else
            begin
                key2      <= 6'd0;
                key2union <= 6'd0;

                if(C2X_reg != 4'd12)
                    C2X_reg <= C2X_reg + 4'd1;
                else
                begin
                    C2X_reg <= 4'd2;
                    C2Y_reg <= C2Y_reg + 4'd1;
                end

                if((key2 + key1union_reg) >= max)
                begin
                    max <= key2 + key1union_reg;
                    key2union_reg <= key2union;
                    C2X           <= C2X_reg;
                    C2Y           <= C2Y_reg;    
                end
                
                if((C2X_reg == 4'd12) && (C2Y_reg == 4'd12))
                begin
                    if(max == max_reg)
                    begin
                        flag <= 1'b1;
                        if(flag)
                            flag2 <= 1'b1;
                            if(flag2)
                                DONE <= 1'b1;
                    end
                    key1union_reg <= 6'd0;
                    max_reg <= max;

                    C1X_reg <= 4'd2;
                    C1Y_reg <= 4'd2;
                    C2X_reg <= 4'd2;
                    C2Y_reg <= 4'd2;
                end
            end
        end

        FINI:
        begin
            C1X           <= 4'd0;
            C1Y           <= 4'd0;
            C1X_reg       <= 4'd0;
            C1Y_reg       <= 4'd0;
            key1          <= 6'd0;
            key1union     <= 6'd0;
            key1union_reg <= 6'd0;
            key1max       <= 6'd0;
            C2X           <= 4'd0;
            C2Y           <= 4'd0;
            C2X_reg       <= 4'd0;
            C2Y_reg       <= 4'd0;
            key2          <= 6'd0;
            key2union     <= 6'd0;
            key2union_reg <= 6'd0;
            key2max       <= 6'd0;
            max           <= 6'd0;
            max_reg       <= 6'd0;
            DONE          <= 1'b0;
            flag          <= 1'b0;
            flag2         <= 1'b0;
        end

        endcase
    end
end

endmodule