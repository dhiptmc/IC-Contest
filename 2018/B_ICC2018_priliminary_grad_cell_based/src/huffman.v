module huffman(clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6);

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output reg [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output reg [7:0] M1, M2, M3, M4, M5, M6;

reg [2:0] cur_state, nxt_state;
localparam [2:0]    IDLE        = 3'd0,
                    FETCH       = 3'd1,
                    COUNT_SORT  = 3'd2,
                    COMBINATION = 3'd3,
                    SPLIT       = 3'd4,
                    MOD         = 3'd5,
                    FINI        = 3'd6; 

reg [7:0] counter1;
reg [2:0] counter2;
reg [2:0] counter3;


reg [7:0] array [6:1];
reg [2:0] array_index [6:1];
reg [2:0] result_index [6:2] [6:1];
reg multi [6:1];

integer i, j, k;
reg flag1, flag2;
reg fin;
reg [7:0] out;
reg [7:0] mask;
reg jackpot;
reg [3:0] jackpot_index;

always @ (posedge clk or posedge reset)
begin
    if(reset)
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
        nxt_state = FETCH;

    FETCH:
        nxt_state = (counter1 == 8'd99) ? COUNT_SORT : FETCH;

    COUNT_SORT:
        nxt_state = (flag1) ? COMBINATION : COUNT_SORT;

    COMBINATION:
        nxt_state = (fin) ? MOD : COMBINATION;

    SPLIT:
        nxt_state = (counter2 == 3'd7) ? FINI : MOD;

    MOD:
        nxt_state = SPLIT;

    FINI:
        nxt_state = IDLE;

    default:
        nxt_state = IDLE;
    endcase
end

always @ (posedge clk or posedge reset)
begin
    if(reset)
    begin
        CNT_valid  <= 1'b0;
        CNT1       <= 8'd0;
        CNT2       <= 8'd0;
        CNT3       <= 8'd0;
        CNT4       <= 8'd0;
        CNT5       <= 8'd0;
        CNT6       <= 8'd0;
        code_valid <= 1'b0;
        HC1        <= 8'd0;
        HC2        <= 8'd0;
        HC3        <= 8'd0;
        HC4        <= 8'd0;
        HC5        <= 8'd0;
        HC6        <= 8'd0;
        M1         <= 8'd0;
        M2         <= 8'd0;
        M3         <= 8'd0;
        M4         <= 8'd0;
        M5         <= 8'd0;
        M6         <= 8'd0;

        counter1   <= 8'd0;
        counter2   <= 3'd1;
        counter3   <= 3'd5;

        i          <= 2;
        j          <= 1;
        k          <= 1;
        flag1      <= 1'b0;
        flag2      <= 1'b0;

        fin        <= 1'b0;

        out        <= 8'd0;
        mask       <= 8'd0;
        jackpot    <= 1'b0;
        jackpot_index <= 4'd15;

        multi[1]   <= 3'd0;
        multi[2]   <= 3'd0;
        multi[3]   <= 3'd0;
        multi[4]   <= 3'd0;
        multi[5]   <= 3'd0;
        multi[6]   <= 3'd0;

        array_index[1] <= 3'd0;
        array_index[2] <= 3'd0;
        array_index[3] <= 3'd0;
        array_index[4] <= 3'd0;
        array_index[5] <= 3'd0;
        array_index[6] <= 3'd0;

        result_index[2][1] <= 3'd0;
        result_index[2][2] <= 3'd0;
        result_index[2][3] <= 3'd0;
        result_index[2][4] <= 3'd0;
        result_index[2][5] <= 3'd0;
        result_index[2][6] <= 3'd0;
        result_index[3][1] <= 3'd0;
        result_index[3][2] <= 3'd0;
        result_index[3][3] <= 3'd0;
        result_index[3][4] <= 3'd0;
        result_index[3][5] <= 3'd0;
        result_index[3][6] <= 3'd0;
        result_index[4][1] <= 3'd0;
        result_index[4][2] <= 3'd0;
        result_index[4][3] <= 3'd0;
        result_index[4][4] <= 3'd0;
        result_index[4][5] <= 3'd0;
        result_index[4][6] <= 3'd0;
        result_index[5][1] <= 3'd0;
        result_index[5][2] <= 3'd0;
        result_index[5][3] <= 3'd0;
        result_index[5][4] <= 3'd0;
        result_index[5][5] <= 3'd0;
        result_index[5][6] <= 3'd0;
        result_index[6][1] <= 3'd0;
        result_index[6][2] <= 3'd0;
        result_index[6][3] <= 3'd0;
        result_index[6][4] <= 3'd0;
        result_index[6][5] <= 3'd0;
        result_index[6][6] <= 3'd0;
    end
    else
    begin
        case (cur_state)
        FETCH:
        begin
            if(counter1 == 8'd99)
                CNT_valid <= 1'b1;

            if(gray_valid)
            begin
                counter1 <= counter1 + 8'd1;
                case(gray_data)
                8'h01:
                begin
                    CNT1 <= CNT1 + 8'd1;
                    array[1] <= CNT1 + 8'd1;
                    array_index[1] <= 3'd1;
                end
                8'h02:
                begin
                    CNT2 <= CNT2 + 8'd1;
                    array[2] <= CNT2 + 8'd1;
                    array_index[2] <= 3'd2;
                end
                8'h03:
                begin
                    CNT3 <= CNT3 + 8'd1;
                    array[3] <= CNT3 + 8'd1;
                    array_index[3] <= 3'd3;
                end
                8'h04:
                begin
                    CNT4 <= CNT4 + 8'd1;
                    array[4] <= CNT4 + 8'd1;
                    array_index[4] <= 3'd4;
                end
                8'h05:
                begin
                    CNT5 <= CNT5 + 8'd1;
                    array[5] <= CNT5 + 8'd1;
                    array_index[5] <= 3'd5;
                end
                8'h06:
                begin
                    CNT6 <= CNT6 + 8'd1;
                    array[6] <= CNT6 + 8'd1;
                    array_index[6] <= 3'd6;
                end
                default:
                begin
                    CNT1 <= CNT1;
                    CNT2 <= CNT2;
                    CNT3 <= CNT3;
                    CNT4 <= CNT4;
                    CNT5 <= CNT5;
                    CNT6 <= CNT6;
                end
                endcase
            end
        end

        COUNT_SORT:
        begin
            CNT_valid <= 1'b0;
            counter1  <= 8'd2;

            if(i < 7)
            begin
                if( (array[i] > array[i-1]) && (i > 1) )
                begin
                    array[i]   <= array[i-1];
                    array[i-1] <= array[i];
                    array_index[i] <= array_index[i-1];
                    array_index[i-1] <= array_index[i];
                    i <= i - 1;
                end
                else
                begin
                    i <= i + 1;
                    
                    if(i == 6)
                    begin
                        flag1 <= 1'b1;
                    end
                end
            end
            else
            begin
                i     <= 6;           
                flag1 <= 1'b0;
                result_index[6][1] <= array_index[6];
            end
        end

        COMBINATION:
        begin
            if(i == 1)
            begin
                fin <= 1'b1;
            end

            else if( (array[i] + array[i-1]) > array[j] )
            begin
                if(k < i - 1)
                begin
                    if((multi[i]) && (multi[i-1]))
                    begin
                        jackpot <= 1'b1;
                        jackpot_index <= i;
                    end

                    if(j == k)
                    begin
                        if(counter2 <= counter1 + 1)
                        begin
                            if(!flag1)
                            begin
                                result_index[i - 1][counter2] <= array_index[i - counter2 + 1];
                            end
                            else if(multi[j])
                            begin
                                if(counter2 >= counter1)
                                begin
                                    counter3 <= counter3 - 3'd1;
                                    result_index[i - 1][counter2] <= array_index[counter3 - 1];
                                end
                                else
                                begin
                                    result_index[i - 1][counter2] <= result_index[i][counter2];
                                end
                            end
                            else
                            begin
                                if(counter2 > 1)
                                begin
                                    result_index[i - 1][counter2] <= result_index[i][counter2 - 1];
                                end
                                else
                                begin
                                    counter3 <= counter3 - 3'd1;
                                    result_index[i - 1][counter2] <= array_index[counter3 - 1];
                                end
                            end

                            counter2 <= counter2 + 3'd1;
                        end
                        else
                        begin
                            array[j] <= array[i] + array[i-1];
                            multi[j] <= 1'b1;
                            array[j + 2] <= array[j + 1];
                            k <= k + 2;

                            array[k+1] <= array[k];
                            
                            flag1 <= 1'b1;
                            counter1 <= counter1 + 3'd1;
                            counter2 <= 3'd1;
                        end
                    end
                    else
                    begin
                        k <= k + 1;
                    end
                end
                else
                begin
                    i <= i - 1;
                    j <= 1;
                    k <= 1;
                end
            end

            else if( (array[i] + array[i-1]) == array[j] )
            begin     
                if(k < i - 1)
                begin
                    if(j == k)
                    begin
                        if(counter2 <= counter1 + 1)
                        begin
                            if(!flag1)
                            begin
                                result_index[i - 1][counter2] <= array_index[i - counter2 + 1];
                            end
                            else if(multi[j])
                            begin
                                if(counter2 > 1)
                                begin
                                    result_index[i - 1][counter2] <= result_index[i][counter2 - 1];
                                end
                                else
                                begin
                                    result_index[i - 1][counter2] <= array_index[counter3 - 1];
                                end
                            end
                            else
                            begin
                                if(counter2 > counter1)
                                begin
                                    result_index[i - 1][counter2] <= array_index[counter3 - 1];
                                end
                                else
                                begin
                                    result_index[i - 1][counter2] <= result_index[i][counter2];
                                end
                            end

                            counter2 <= counter2 + 3'd1;
                        end
                        else
                        begin
                            array[i - 1] <= array[i] + array[i-1];
                            multi[i - 1] <= 1'b1;
                            k <= k + 2;

                            array[k+1] <= array[k];
                            
                            flag1 <= 1'b1;
                            counter1 <= counter1 + 3'd1;
                            counter2 <= 3'd1;
                            counter3 <= counter3 - 3'd1;
                        end
                    end
                    else
                    begin
                        k <= k + 1;
                    end
                end
                else
                begin
                    i <= i - 1;
                    j <= 1;
                    k <= 1;
                end  
            end

            else
            begin
                if(j == i - 2)
                begin
                    if(counter2 <= counter1)
                    begin
                        if(!flag1)
                        begin
                            result_index[i - 1][counter2] <= array_index[i - counter2 + 1];
                        end
                        else if(counter2 == counter1)
                        begin
                            result_index[i - 1][counter2] <= array_index[counter3];
                        end
                        else
                        begin
                            result_index[i - 1][counter2] <= result_index[i][counter2];
                        end

                        counter2 <= counter2 + 3'd1;
                    end
                    else
                    begin
                        array[i - 1] <= array[i] + array[i-1];
                        multi[i - 1] <= 1'b1;
                        flag1 <= 1'b1;
                        i <= i - 1;
                        j <= 1;
                        k <= 1;
                        counter1 <= counter1 + 3'd1;
                        counter2 <= 3'd1;
                        counter3 <= counter3 - 3'd1;
                    end
                end
                else
                begin
                    j <= j + 1;
                    k <= k + 1;
                end
            end
        end

        SPLIT:
        begin
            case(array_index[counter2 - 1])
            3'd1:
            begin
                HC1 <= out;
                M1  <= mask;
            end

            3'd2:
            begin
                HC2 <= out;
                M2  <= mask;
            end

            3'd3:
            begin
                HC3 <= out;
                M3  <= mask;
            end

            3'd4:
            begin
                HC4 <= out;
                M4  <= mask;
            end

            3'd5:
            begin
                HC5 <= out;
                M5  <= mask;
            end

            3'd6:
            begin
                HC6 <= out;
                M6  <= mask;
            end          
            endcase
        end

        MOD:
        begin
            counter2 <= counter2 + 3'd1;
            if(flag1)
            begin
                if( (result_index[counter2+1][7-counter2] == 3'd0) || (array_index[counter2] == result_index[counter2+1][7-counter2]) )
                begin
                    out <= 8'b0000_0000;
                end
                else
                begin
                    out <= 8'b0000_0001;
                end
                mask <= 8'b0000_0001;
                flag1 <= 1'b0;
            end
            else
            begin
                if(counter2 >= jackpot_index)
                begin
                    if(!flag2)
                    begin
                        mask  <= {mask[5:0],2'b11};
                        flag2 <= 1'b1;
                        
                        out <= {out[5:1],~out[0],1'b0,1'b0};
                    end
                    else if(counter2[0])
                    begin
                        out <= {out[6:1],1'b1,1'b0}; 
                    end
                    else
                    begin
                        out <= {out[7:1], 1'b1};
                    end
                end
                else if(counter2 < 6)
                begin
                    mask[counter2 - 1] <= 1'b1;

                    if( (result_index[counter2+1][7-counter2] == 3'd0) || (array_index[counter2] == result_index[counter2+1][7-counter2]) )
                    begin
                        out <= {out[6:1],~out[0],1'b0};
                    end
                    else
                    begin
                        out <= {out[6:1],~out[0],1'b1};
                    end
                end
                else
                begin
                    out <= {out[7:1], ~out[0]};
                end
            end
        end

        FINI:
        begin      
            code_valid <= 1'b1;
        end

        default:
        begin
            CNT_valid  <= 1'b0;
            CNT1       <= 8'd0;
            CNT2       <= 8'd0;
            CNT3       <= 8'd0;
            CNT4       <= 8'd0;
            CNT5       <= 8'd0;
            CNT6       <= 8'd0;
            code_valid <= 1'b0;
            HC1        <= 8'd0;
            HC2        <= 8'd0;
            HC3        <= 8'd0;
            HC4        <= 8'd0;
            HC5        <= 8'd0;
            HC6        <= 8'd0;
            M1         <= 8'd0;
            M2         <= 8'd0;
            M3         <= 8'd0;
            M4         <= 8'd0;
            M5         <= 8'd0;
            M6         <= 8'd0;

            counter1   <= 8'd0;
            counter2   <= 3'd1;
            counter3   <= 3'd5;

            i          <= 2;
            j          <= 1;
            k          <= 1;
            flag1      <= 1'b0;
            flag2      <= 1'b0;

            fin        <= 1'b0;

            out        <= 8'd0;
            mask       <= 8'd0;
            jackpot    <= 1'b0;
            jackpot_index <= 4'd15;

            multi[1]   <= 3'd0;
            multi[2]   <= 3'd0;
            multi[3]   <= 3'd0;
            multi[4]   <= 3'd0;
            multi[5]   <= 3'd0;
            multi[6]   <= 3'd0;

            array_index[1] <= 3'd0;
            array_index[2] <= 3'd0;
            array_index[3] <= 3'd0;
            array_index[4] <= 3'd0;
            array_index[5] <= 3'd0;
            array_index[6] <= 3'd0;

            result_index[2][1] <= 3'd0;
            result_index[2][2] <= 3'd0;
            result_index[2][3] <= 3'd0;
            result_index[2][4] <= 3'd0;
            result_index[2][5] <= 3'd0;
            result_index[2][6] <= 3'd0;
            result_index[3][1] <= 3'd0;
            result_index[3][2] <= 3'd0;
            result_index[3][3] <= 3'd0;
            result_index[3][4] <= 3'd0;
            result_index[3][5] <= 3'd0;
            result_index[3][6] <= 3'd0;
            result_index[4][1] <= 3'd0;
            result_index[4][2] <= 3'd0;
            result_index[4][3] <= 3'd0;
            result_index[4][4] <= 3'd0;
            result_index[4][5] <= 3'd0;
            result_index[4][6] <= 3'd0;
            result_index[5][1] <= 3'd0;
            result_index[5][2] <= 3'd0;
            result_index[5][3] <= 3'd0;
            result_index[5][4] <= 3'd0;
            result_index[5][5] <= 3'd0;
            result_index[5][6] <= 3'd0;
            result_index[6][1] <= 3'd0;
            result_index[6][2] <= 3'd0;
            result_index[6][3] <= 3'd0;
            result_index[6][4] <= 3'd0;
            result_index[6][5] <= 3'd0;
            result_index[6][6] <= 3'd0;
        end
        endcase
    end
end

endmodule