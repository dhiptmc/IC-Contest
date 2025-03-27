`define abs(a,b) (a*a+b*b)

module CONVEX(
input CLK,
input RST,
input [4:0] PT_XY,
output reg READ_PT,
output reg [9:0] DROP_XY,
output reg DROP_V);

reg [3:0] cur_state, nxt_state;
localparam [3:0]    IDLE    = 4'd0,
                    INIT    = 4'd1,
                    SORT    = 4'd2,
                    FETCH   = 4'd3,
                    TEST    = 4'd4,
                    CUT     = 4'd5,
                    REBUILD = 4'd6,
                    FINI    = 4'd15;

reg [9:0] X [13:0];
reg [9:0] Y [13:0];
reg [9:0] X_CUT [13:0];
reg [9:0] Y_CUT [13:0];
reg [9:0] X_CONCAVE [13:0];
reg [9:0] Y_CONCAVE [13:0];

reg [3:0] index [13:0];

reg flag1, flag2;
reg [3:0] counter1, counter2, counter3, counter4, counter5, counter6, counter7;
reg [3:0] flag3;
reg flag4;
reg done_cut;

wire signed [21:0] test1;
assign test1 = ( ( X[counter3 - 1] - X[0] ) * (Y[counter3] - Y[0]) ) - ( ( X[counter3] - X[0] ) * (Y[counter3 - 1] - Y[0]) );  //Ax*By - Bx*Ay

reg signed [21:0] test2, test3, test4, test5;

wire test6;
wire [22:0] a,b;
assign a = `abs( (X[counter2 - 1]- X[counter1 - 1]),(Y[counter2 - 1] - Y[counter1 - 1]) );
assign b = `abs( (X[counter1]- X[counter1 - 1]),(Y[counter1] - Y[counter1 - 1]) );
assign test6 = (a>b);

wire signed [21:0] direction;
assign direction = ( ( X[counter2 - 1] - X[counter1 - 2] ) * (Y[counter1 - 1] - Y[counter1 - 2]) ) - ( ( X[counter1 - 1] - X[counter1 - 2] ) * (Y[counter2 - 1] - Y[counter1 - 2]) );
wire direct;
assign direct = direction[21];

reg debug;

always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        cur_state <= IDLE;
    end
    else
    begin
        cur_state <= nxt_state;
    end    
end

always @ (*)
begin
    case(cur_state)
    IDLE:
        nxt_state = INIT;

    INIT:
        nxt_state = ( (counter1 == 4'd3) && (counter2 == 4'd2) ) ? SORT : INIT;

    SORT:
        nxt_state = (counter4 == counter2) ? FETCH : SORT;

    FETCH:
        nxt_state = (counter1 == 4'd3) ? TEST : FETCH;

    TEST:
        nxt_state = (counter1 == counter2 - 1) ? CUT : TEST;

    CUT:
        nxt_state = (done_cut) ? REBUILD : CUT;

    REBUILD:
        nxt_state = (flag1) ? SORT : REBUILD;

    FINI:
        nxt_state = FINI;

    default:
        nxt_state = IDLE;
    endcase
end

always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        READ_PT <= 1'b0;
        DROP_XY <= 10'd0;
        DROP_V  <= 1'b0;

        flag1    <= 1'b0;
        counter1 <= 4'd0;
        counter2 <= 4'd0;
        counter3 <= 4'd2;
        counter4 <= 4'd2;
        counter5 <= 4'd0;
        counter6 <= 4'd0;
        counter7 <= 4'd0;

        flag2 <= 1'b0;

        test2 <= 22'd0;
        test3 <= 22'd0;
        test4 <= 22'd0;
        test5 <= 22'd0;

        flag3 <= 4'd0;
        flag4 <= 1'b0;
        done_cut <= 1'b0;

        debug <= 1'b0;

        index[0]  <= 4'd0;
        index[1]  <= 4'd0;
        index[2]  <= 4'd0;
        index[3]  <= 4'd0;
        index[4]  <= 4'd0;
        index[5]  <= 4'd0;
        index[6]  <= 4'd0;
        index[7]  <= 4'd0;
        index[8]  <= 4'd0;
        index[9]  <= 4'd0;
        index[10] <= 4'd0;
        index[11] <= 4'd0;
        index[12] <= 4'd0;
        index[13] <= 4'd0;

        X_CUT[0]  <= 4'd0;
        X_CUT[1]  <= 4'd0;
        X_CUT[2]  <= 4'd0;
        X_CUT[3]  <= 4'd0;
        X_CUT[4]  <= 4'd0;
        X_CUT[5]  <= 4'd0;
        X_CUT[6]  <= 4'd0;
        X_CUT[7]  <= 4'd0;
        X_CUT[8]  <= 4'd0;
        X_CUT[9]  <= 4'd0;
        X_CUT[10] <= 4'd0;
        X_CUT[11] <= 4'd0;
        X_CUT[12] <= 4'd0;
        X_CUT[13] <= 4'd0;

        Y_CUT[0]  <= 4'd0;
        Y_CUT[1]  <= 4'd0;
        Y_CUT[2]  <= 4'd0;
        Y_CUT[3]  <= 4'd0;
        Y_CUT[4]  <= 4'd0;
        Y_CUT[5]  <= 4'd0;
        Y_CUT[6]  <= 4'd0;
        Y_CUT[7]  <= 4'd0;
        Y_CUT[8]  <= 4'd0;
        Y_CUT[9]  <= 4'd0;
        Y_CUT[10] <= 4'd0;
        Y_CUT[11] <= 4'd0;
        Y_CUT[12] <= 4'd0;
        Y_CUT[13] <= 4'd0;

        X_CONCAVE[0]  <= 4'd0;
        X_CONCAVE[1]  <= 4'd0;
        X_CONCAVE[2]  <= 4'd0;
        X_CONCAVE[3]  <= 4'd0;
        X_CONCAVE[4]  <= 4'd0;
        X_CONCAVE[5]  <= 4'd0;
        X_CONCAVE[6]  <= 4'd0;
        X_CONCAVE[7]  <= 4'd0;
        X_CONCAVE[8]  <= 4'd0;
        X_CONCAVE[9]  <= 4'd0;
        X_CONCAVE[10] <= 4'd0;
        X_CONCAVE[11] <= 4'd0;
        X_CONCAVE[12] <= 4'd0;
        X_CONCAVE[13] <= 4'd0;

        Y_CONCAVE[0]  <= 4'd0;
        Y_CONCAVE[1]  <= 4'd0;
        Y_CONCAVE[2]  <= 4'd0;
        Y_CONCAVE[3]  <= 4'd0;
        Y_CONCAVE[4]  <= 4'd0;
        Y_CONCAVE[5]  <= 4'd0;
        Y_CONCAVE[6]  <= 4'd0;
        Y_CONCAVE[7]  <= 4'd0;
        Y_CONCAVE[8]  <= 4'd0;
        Y_CONCAVE[9]  <= 4'd0;
        Y_CONCAVE[10] <= 4'd0;
        Y_CONCAVE[11] <= 4'd0;
        Y_CONCAVE[12] <= 4'd0;
        Y_CONCAVE[13] <= 4'd0;
    end
    else
    begin
        case(cur_state)
        IDLE:
        begin
            READ_PT <= 1'b1;
        end

        INIT:
        begin
            if(flag1)
                begin
                counter1 <= (counter1 == 4'd3) ? 4'd0 : counter1 + 4'd1;
                counter2 <= (counter1 == 4'd3) ? counter2 + 4'd1 : counter2;
                case(counter1)
                2'd0:
                begin
                    X[counter2][9:5] <= PT_XY;
                    X[counter2][4:0] <= 5'd0;
                end
                2'd1:
                    X[counter2][4:0] <= PT_XY;
                2'd2:
                begin
                    Y[counter2][9:5] <= PT_XY;
                    Y[counter2][4:0] <= 5'd0;
                end
                2'd3:
                    Y[counter2][4:0] <= PT_XY;
                endcase

                if( (counter1 == 4'd1) && (counter2 == 4'd2) )
                begin
                    READ_PT <= 1'b0;
                end
            end
            else
            begin
                flag1 <= 1'b1;
            end
        end

        SORT:
        begin
            flag1 <= 1'b0;
            flag3 <= 4'd0;
            counter7 <= 4'd0;

            index[0] <= 4'd0;
            index[1] <= 4'd0;
            index[2] <= 4'd0;
            index[3] <= 4'd0;
            index[4] <= 4'd0;
            index[5] <= 4'd0;
            index[6] <= 4'd0;
            index[7] <= 4'd0;
            index[8] <= 4'd0;
            index[9] <= 4'd0;
            index[10] <= 4'd0;
            index[11] <= 4'd0;
            index[12] <= 4'd0;
            index[13] <= 4'd0;

            X_CUT[0]  <= 4'd0;
            X_CUT[1]  <= 4'd0;
            X_CUT[2]  <= 4'd0;
            X_CUT[3]  <= 4'd0;
            X_CUT[4]  <= 4'd0;
            X_CUT[5]  <= 4'd0;
            X_CUT[6]  <= 4'd0;
            X_CUT[7]  <= 4'd0;
            X_CUT[8]  <= 4'd0;
            X_CUT[9]  <= 4'd0;
            X_CUT[10] <= 4'd0;
            X_CUT[11] <= 4'd0;
            X_CUT[12] <= 4'd0;
            X_CUT[13] <= 4'd0;

            Y_CUT[0]  <= 4'd0;
            Y_CUT[1]  <= 4'd0;
            Y_CUT[2]  <= 4'd0;
            Y_CUT[3]  <= 4'd0;
            Y_CUT[4]  <= 4'd0;
            Y_CUT[5]  <= 4'd0;
            Y_CUT[6]  <= 4'd0;
            Y_CUT[7]  <= 4'd0;
            Y_CUT[8]  <= 4'd0;
            Y_CUT[9]  <= 4'd0;
            Y_CUT[10] <= 4'd0;
            Y_CUT[11] <= 4'd0;
            Y_CUT[12] <= 4'd0;
            Y_CUT[13] <= 4'd0;

            X_CONCAVE[0]  <= 4'd0;
            X_CONCAVE[1]  <= 4'd0;
            X_CONCAVE[2]  <= 4'd0;
            X_CONCAVE[3]  <= 4'd0;
            X_CONCAVE[4]  <= 4'd0;
            X_CONCAVE[5]  <= 4'd0;
            X_CONCAVE[6]  <= 4'd0;
            X_CONCAVE[7]  <= 4'd0;
            X_CONCAVE[8]  <= 4'd0;
            X_CONCAVE[9]  <= 4'd0;
            X_CONCAVE[10] <= 4'd0;
            X_CONCAVE[11] <= 4'd0;
            X_CONCAVE[12] <= 4'd0;
            X_CONCAVE[13] <= 4'd0;

            Y_CONCAVE[0]  <= 4'd0;
            Y_CONCAVE[1]  <= 4'd0;
            Y_CONCAVE[2]  <= 4'd0;
            Y_CONCAVE[3]  <= 4'd0;
            Y_CONCAVE[4]  <= 4'd0;
            Y_CONCAVE[5]  <= 4'd0;
            Y_CONCAVE[6]  <= 4'd0;
            Y_CONCAVE[7]  <= 4'd0;
            Y_CONCAVE[8]  <= 4'd0;
            Y_CONCAVE[9]  <= 4'd0;
            Y_CONCAVE[10] <= 4'd0;
            Y_CONCAVE[11] <= 4'd0;
            Y_CONCAVE[12] <= 4'd0;
            Y_CONCAVE[13] <= 4'd0;

            if ( ( test1 < 0 ) && (counter3 != counter2) )
            begin
                X[counter3 - 1] <= X[counter3];
                Y[counter3 - 1] <= Y[counter3];
                X[counter3]     <= X[counter3 - 1];
                Y[counter3]     <= Y[counter3 - 1];
                counter3        <= counter3 - 3'd1;
            end
            else
            begin
                counter4 <= (counter4 == counter2) ? 3'd2 : (counter4 + 3'd1);
                counter3 <= (counter4 == counter2) ? 3'd2 : (counter4 + 3'd1);
                if(counter4 == counter2)
                    READ_PT <= 1'b1;
            end
        end

        FETCH:
        begin
            if(flag1)
            begin
                counter1 <= (counter1 == 4'd3) ? 2'd0 : counter1 + 4'd1;
                
                case(counter1)
                4'd0:
                begin
                    X[counter2 - 1][9:5] <= PT_XY;
                    X[counter2 - 1][4:0] <= 5'd0;
                end
                4'd1:
                    X[counter2 - 1][4:0] <= PT_XY;
                4'd2:
                begin
                    Y[counter2 - 1][9:5] <= PT_XY;
                    Y[counter2 - 1][4:0] <= 5'd0;
                end
                4'd3:
                    Y[counter2 - 1][4:0] <= PT_XY;
                endcase
            end
            else
            begin
                READ_PT <= 1'b0;
                counter2 <= counter2 + 4'd1;
                flag1 <= 1'b1;
            end
        end

        TEST:
        begin
            flag1 <= 1'b0;
            if(!flag2)
            begin
                debug <= 1'b0;
                flag2 <= 1'b1;
                counter1 <= counter1 + 4'd1;
                if(counter1 == 0)
                begin
                    test2 <= (Y[1] - Y[0])                   * X[counter2 - 1] - (X[1] - X[0])                   * Y[counter2 - 1] + ((X[1] - X[0])                   * Y[0] - (Y[1] - Y[0])                          * X[0]);
                    test3 <= (Y[1] - Y[0])                   * X[counter2 - 2] - (X[1] - X[0])                   * Y[counter2 - 2] + ((X[1] - X[0])                   * Y[0] - (Y[1] - Y[0])                          * X[0]);
                    test4 <= (Y[0] - Y[counter2 - 2])        * X[counter2 - 1] - (X[0] - X[counter2 - 2])        * Y[counter2 - 1] + ((X[0] - X[counter2 - 2])        * Y[0] - (Y[0] - Y[counter2 - 2])               * X[0]);
                    test5 <= (Y[0] - Y[counter2 - 2])        * X[1]            - (X[0] - X[counter2 - 2])        * Y[1]            + ((X[0] - X[counter2 - 2])        * Y[0] - (Y[0] - Y[counter2 - 2])               * X[0]);          
                end
                else if(counter1 == counter2 - 2)
                begin
                    test2 <= (Y[0] - Y[counter1])            * X[counter2 - 1] - (X[0] - X[counter1])            * Y[counter2 - 1] + ((X[0] - X[counter1])            * Y[counter1] - (Y[0] - Y[counter1])            * X[counter1]);
                    test3 <= (Y[0] - Y[counter1])            * X[counter2 - 3] - (X[0] - X[counter1])            * Y[counter2 - 3] + ((X[0] - X[counter1])            * Y[counter1] - (Y[0] - Y[counter1])            * X[counter1]);
                    test4 <= (Y[counter1] - Y[counter1 - 1]) * X[counter2 - 1] - (X[counter1] - X[counter1 - 1]) * Y[counter2 - 1] + ((X[counter1] - X[counter1 - 1]) * Y[counter1] - (Y[counter1] - Y[counter1 - 1]) * X[counter1]);
                    test5 <= (Y[counter1] - Y[counter1 - 1]) * X[0]            - (X[counter1] - X[counter1 - 1]) * Y[0]            + ((X[counter1] - X[counter1 - 1]) * Y[counter1] - (Y[counter1] - Y[counter1 - 1]) * X[counter1]);
                end
                else
                begin
                    test2 <= (Y[counter1 + 1] - Y[counter1]) * X[counter2 - 1] - (X[counter1 + 1] - X[counter1]) * Y[counter2 - 1] + ((X[counter1 + 1] - X[counter1]) * Y[counter1] - (Y[counter1 + 1] - Y[counter1]) * X[counter1]);
                    test3 <= (Y[counter1 + 1] - Y[counter1]) * X[counter1 - 1] - (X[counter1 + 1] - X[counter1]) * Y[counter1 - 1] + ((X[counter1 + 1] - X[counter1]) * Y[counter1] - (Y[counter1 + 1] - Y[counter1]) * X[counter1]);
                    test4 <= (Y[counter1] - Y[counter1 - 1]) * X[counter2 - 1] - (X[counter1] - X[counter1 - 1]) * Y[counter2 - 1] + ((X[counter1] - X[counter1 - 1]) * Y[counter1] - (Y[counter1] - Y[counter1 - 1]) * X[counter1]);
                    test5 <= (Y[counter1] - Y[counter1 - 1]) * X[counter1 + 1] - (X[counter1] - X[counter1 - 1]) * Y[counter1 + 1] + ((X[counter1] - X[counter1 - 1]) * Y[counter1] - (Y[counter1] - Y[counter1 - 1]) * X[counter1]);             
                end
            end
            else
            begin
                flag2 <= 1'b0;
                if( ( ( (!test2) || (!test3) ) && (test6) ) && (counter1 > 4'd1) )
                begin
                    if( (X_CONCAVE[counter6 - 1] != X[counter1 - 1]) || (Y_CONCAVE[counter6 - 1] != Y[counter1 - 1]) || (counter6 == 4'd0 ) )
                    begin
                        if(direct)
                        begin
                            X_CONCAVE[counter6] <= X[counter1];
                            Y_CONCAVE[counter6] <= Y[counter1];
                            index[counter6]     <= counter1;
                        end
                        else
                        begin
                            X_CONCAVE[counter6] <= X[counter1 - 1];
                            Y_CONCAVE[counter6] <= Y[counter1 - 1];
                            index[counter6]     <= counter1 - 1;
                        end

                        counter6 <= counter6 + 4'd1;
                        counter7 <= counter7 + 4'd1;
                    end
                end
                else if( ( ( (!test2) || (!test3) ) && (!test6) ) && (counter1 > 4'd1) )
                begin
                    if( (X_CONCAVE[counter6 - 1] != X[counter1 - 1]) || (Y_CONCAVE[counter6 - 1] != Y[counter1 - 1]) || (counter6 == 4'd0 ) )
                    begin
                        if(direct)
                        begin
                            X_CONCAVE[counter6] <= X[counter2 - 1];
                            Y_CONCAVE[counter6] <= Y[counter2 - 1];
                            index[counter6]     <= counter2 - 1;
                        end
                        else
                        begin
                            X_CONCAVE[counter6] <= X[counter1 - 1];
                            Y_CONCAVE[counter6] <= Y[counter1 - 1];
                            index[counter6]     <= counter1 - 1;
                            debug <= 1'b1;
                        end

                        counter6 <= counter6 + 4'd1;
                        counter7 <= counter7 + 4'd1;
                    end
                end
                else if( ( ( (test2[21] == test3[21]) && (test4[21] != test5[21]) ) || ( (test2[21] != test3[21]) && (test4[21] == test5[21]) ) ) && ((|test2) && (|test3)) )
                begin
                    X_CUT[counter5] <= X[counter1 - 1];
                    Y_CUT[counter5] <= Y[counter1 - 1];
                    counter5 <= counter5 + 4'd1;
                end
                else if( ( (test2[21] != test3[21]) && (test4[21] != test5[21]) ) && ((|test2) && (|test3)))
                begin
                    if( (X_CONCAVE[counter6 - 1] != X[counter1 - 1]) || (Y_CONCAVE[counter6 - 1] != Y[counter1 - 1]) || (counter6 == 4'd0 ) ) 
                    begin
                        X_CONCAVE[counter6] <= X[counter1 - 1];
                        Y_CONCAVE[counter6] <= Y[counter1 - 1];
                        index[counter6]     <= counter1 - 1;
                        counter6 <= counter6 + 4'd1;
                        counter7 <= counter7 + 4'd1;
                    end
                end
                else
                begin
                    flag3 <= flag3 + 4'd1;
                end
            end
        end

        CUT:
        begin
            if(!done_cut)
            begin
                if(counter6 > 0)
                begin
                    DROP_V <= 1'b1;
                    DROP_XY <= (!flag4) ? X_CONCAVE[counter6 - 1] : Y_CONCAVE[counter6 - 1];
                    flag4 <= !flag4;
                    if(flag4)
                    begin
                        if(counter6 == 4'd1)
                        begin
                            done_cut <= 1'b1;
                        end
                        else
                        begin
                            counter6 <= counter6 - 4'd1;                     
                        end
                    end
                end
                else if( (flag3 == counter2 - 4'd1) || (!test2) || (!test3) || (!test4) || (!test5) )
                begin
                    DROP_V <= 1'b1;
                    DROP_XY <= (!flag4) ? X[counter1] : Y[counter1];
                    flag4 <= !flag4;
                    if(flag4)
                    begin
                        done_cut <= 1'b1;
                    end
                end
                else
                begin
                    done_cut <= 1'b1;
                end
            end
            else
            begin
                DROP_V <= 1'b0;
            end
        end

        REBUILD:
        begin
            done_cut <= 1'b0;
            flag4    <= 1'b0;
            counter1 <= 4'd0;
            counter5 <= 4'd0;
            counter6 <= 4'd0;

            if(!flag1)
            begin
                if(counter7 > 0)
                begin
                    if(index[counter7 - 1] < 13)
                    begin
                        index[counter7 - 1] <= index[counter7 - 1] + 4'd1;
                        X[index[counter7 - 1]] <= X[index[counter7 - 1] + 1];
                        Y[index[counter7 - 1]] <= Y[index[counter7 - 1] + 1];
                    end
                    else
                    begin
                        counter7 <= counter7 - 4'd1;
                        counter2 <= counter2 - 4'd1;

                        if(counter7 == 4'd1)
                        begin
                            flag1 <= 1'b1;
                        end
                    end
                end          
                else if( (flag3 == counter2 - 4'd1) || (!test2) || (!test3) || (!test4) || (!test5) )
                begin
                    X[counter2 - 1] <= 4'dx;
                    Y[counter2 - 1] <= 4'dx;
                    flag1 <= 1'b1;
                    counter2 <= counter2 - 4'd1;    
                end
                else
                begin
                    flag1 <= 1'b1;
                end
            end
        end


        FINI:
        begin
            DROP_V <= 1'b0;
        end

        default:
        begin
            READ_PT <= 1'b0;
            DROP_XY <= 10'd0;
            DROP_V  <= 1'b0;

            flag1    <= 1'b0;
            counter1 <= 4'd0;
            counter2 <= 4'd0;
            counter3 <= 4'd2;
            counter4 <= 4'd2;
            counter5 <= 4'd0;
            counter6 <= 4'd0;
            counter7 <= 4'd0;

            flag2 <= 1'b0;

            test2 <= 22'd0;
            test3 <= 22'd0;
            test4 <= 22'd0;
            test5 <= 22'd0;

            flag3 <= 4'd0;
            flag4 <= 1'b0;
            done_cut <= 1'b0;

            debug <= 1'b0;

            index[0]  <= 4'd0;
            index[1]  <= 4'd0;
            index[2]  <= 4'd0;
            index[3]  <= 4'd0;
            index[4]  <= 4'd0;
            index[5]  <= 4'd0;
            index[6]  <= 4'd0;
            index[7]  <= 4'd0;
            index[8]  <= 4'd0;
            index[9]  <= 4'd0;
            index[10] <= 4'd0;
            index[11] <= 4'd0;
            index[12] <= 4'd0;
            index[13] <= 4'd0;

            X_CUT[0]  <= 4'd0;
            X_CUT[1]  <= 4'd0;
            X_CUT[2]  <= 4'd0;
            X_CUT[3]  <= 4'd0;
            X_CUT[4]  <= 4'd0;
            X_CUT[5]  <= 4'd0;
            X_CUT[6]  <= 4'd0;
            X_CUT[7]  <= 4'd0;
            X_CUT[8]  <= 4'd0;
            X_CUT[9]  <= 4'd0;
            X_CUT[10] <= 4'd0;
            X_CUT[11] <= 4'd0;
            X_CUT[12] <= 4'd0;
            X_CUT[13] <= 4'd0;

            Y_CUT[0]  <= 4'd0;
            Y_CUT[1]  <= 4'd0;
            Y_CUT[2]  <= 4'd0;
            Y_CUT[3]  <= 4'd0;
            Y_CUT[4]  <= 4'd0;
            Y_CUT[5]  <= 4'd0;
            Y_CUT[6]  <= 4'd0;
            Y_CUT[7]  <= 4'd0;
            Y_CUT[8]  <= 4'd0;
            Y_CUT[9]  <= 4'd0;
            Y_CUT[10] <= 4'd0;
            Y_CUT[11] <= 4'd0;
            Y_CUT[12] <= 4'd0;
            Y_CUT[13] <= 4'd0;

            X_CONCAVE[0]  <= 4'd0;
            X_CONCAVE[1]  <= 4'd0;
            X_CONCAVE[2]  <= 4'd0;
            X_CONCAVE[3]  <= 4'd0;
            X_CONCAVE[4]  <= 4'd0;
            X_CONCAVE[5]  <= 4'd0;
            X_CONCAVE[6]  <= 4'd0;
            X_CONCAVE[7]  <= 4'd0;
            X_CONCAVE[8]  <= 4'd0;
            X_CONCAVE[9]  <= 4'd0;
            X_CONCAVE[10] <= 4'd0;
            X_CONCAVE[11] <= 4'd0;
            X_CONCAVE[12] <= 4'd0;
            X_CONCAVE[13] <= 4'd0;

            Y_CONCAVE[0]  <= 4'd0;
            Y_CONCAVE[1]  <= 4'd0;
            Y_CONCAVE[2]  <= 4'd0;
            Y_CONCAVE[3]  <= 4'd0;
            Y_CONCAVE[4]  <= 4'd0;
            Y_CONCAVE[5]  <= 4'd0;
            Y_CONCAVE[6]  <= 4'd0;
            Y_CONCAVE[7]  <= 4'd0;
            Y_CONCAVE[8]  <= 4'd0;
            Y_CONCAVE[9]  <= 4'd0;
            Y_CONCAVE[10] <= 4'd0;
            Y_CONCAVE[11] <= 4'd0;
            Y_CONCAVE[12] <= 4'd0;
            Y_CONCAVE[13] <= 4'd0;
        end
        endcase
    end    
end



endmodule