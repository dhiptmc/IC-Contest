module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output reg match;
output reg [4:0] match_index;
output reg valid;

reg [7:0] string  [33:0];
reg [7:0] pattern [7:0];
reg [5:0] i;
reg [3:0] j;
reg flag1;
reg [5:0] counter1;
reg [3:0] counter2;

reg [5:0] counter3, counter3_reg, counter4, counter4_reg;
reg [3:0] match_cnt, match_cnt_reg;

reg flag2;

always @ (posedge clk or posedge reset)
begin
    if(reset)
    begin
        match <= 1'b0;
        match_index <= 5'd0;
        valid <= 1'b0;
        flag1 <= 1'b0;
        
        for (i = 0; i <= 33; i = i + 1)
            string[i] <= 8'd0;
        for (j = 0; j <= 7; j = j + 1)
            string[j] <= 8'd0;

        counter1 <= 6'd0;
        counter2 <= 4'd0;

        counter3 <= 6'd1;
        counter3_reg <= 6'd1;
        counter4 <= 6'd0;
        counter4_reg <= 6'd0;
        match_cnt <= 4'd0;
        match_cnt_reg <= 4'd0;

        flag2 <= 1'b0;
    end
    else if(isstring)
    begin
        match <= 1'b0;
        match_index <= 5'd0;
        valid <= 1'b0;
        counter3_reg <= 6'd1;
        counter4_reg <= 6'd0;
        flag2 <= 1'b0;
        match_cnt_reg <= 4'd0;

        if(!flag1)
        begin
            string[1] <= chardata;
            counter1 <= 6'd2;
            flag1 <= 1'b1;
        end
        else
        begin
            string[counter1] <= chardata;
            counter1 <= counter1 + 6'd1;
        end
    end
    else if(ispattern)
    begin
        string[counter1] <= 8'd0;

        flag1 <= 1'b0;
        match <= 1'b0;
        match_index <= 5'd0;
        valid <= 1'b0;
        counter3_reg <= 6'd1;
        counter4_reg <= 6'd0;
        flag2 <= 1'b0;
        match_cnt_reg <= 4'd0;

        pattern[counter2] <= chardata;
        counter2 <= counter2 + 4'd1;
    end
    else
    begin
        if((pattern[0] == 8'h5E) && (pattern[counter2 - 1] == 8'h24)) //^ $ and .
        begin
            if( (counter4 == (counter2 - 2)) && ( (string[counter3] == 8'h20) || (string[counter3] == 8'd0) ) && ( (string[counter3 - match_cnt - 1] == 8'h20) || (string[counter3 - match_cnt - 1] == 8'd0) ) )
            begin
                match <= 1'b1;
                match_index <= (flag2) ? match_index : (counter3 - 1 - match_cnt);
                valid <= 1'b1;

                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end
            else if( (string[counter3] == pattern[counter4 + 1]) || (pattern[counter4 + 1] == 8'h2E) || (pattern[counter4 + 1] == 8'h2A) )
            begin
                if(pattern[counter4 + 1] == 8'h2A)
                begin
                    flag2 <= 1'b1;
                    if(!flag2)
                    begin
                        match_index <= counter3 - 1 - match_cnt;
                        match_cnt_reg <= match_cnt + 6'd1;
                        counter4_reg <= counter4;
                    end
                end
                else
                begin
                    counter3 <= counter3 + 6'd1;
                    match_cnt <= match_cnt + 6'd1;
                end

                counter4 <= counter4 + 6'd1;
            end
            else if(counter3 > (counter1 - counter2 + 1 + 2))
            begin
                valid <= 1'b1;
                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end         
            else
            begin
                match_cnt <= (flag2) ? match_cnt_reg : 4'd0;
                counter3 <= counter3_reg;
                counter3_reg <= counter3_reg + 6'd1;
                counter4 <= (flag2) ? counter4_reg : 6'd0;
            end
        end
        else if(pattern[0] == 8'h5E) //^
        begin
            if( (counter4 == (counter2 - 1)) && ( (string[counter3 - match_cnt - 1] == 8'h20) || (string[counter3 - match_cnt - 1] == 8'd0) ) && ( ( (string[match_index] == 8'h20) || (string[match_index] == 8'd0) ) || (!flag2) ) )
            begin
                match <= 1'b1;
                match_index <= (flag2) ? match_index : (counter3 - 1 - match_cnt);
                valid <= 1'b1;

                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end
            else if( (string[counter3] == pattern[counter4 + 1]) || (pattern[counter4 + 1] == 8'h2E) || (pattern[counter4 + 1] == 8'h2A) )
            begin
                if(pattern[counter4 + 1] == 8'h2A)
                begin
                    flag2 <= 1'b1;
                    if(!flag2)
                    begin
                        match_index <= counter3 - 1 - match_cnt;
                        match_cnt_reg <= match_cnt + 6'd1;
                        counter4_reg <= counter4;
                    end
                end
                else
                begin
                    counter3 <= counter3 + 6'd1;
                    match_cnt <= match_cnt + 6'd1;
                end

                counter4 <= counter4 + 6'd1;
            end
            else if(counter3 > (counter1 - counter2 + 1 + 1))
            begin
                valid <= 1'b1;
                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end 
            else
            begin
                match_cnt <= (flag2) ? match_cnt_reg : 4'd0;
                counter3 <= counter3_reg;
                counter3_reg <= counter3_reg + 6'd1;
                counter4 <= (flag2) ? counter4_reg : 6'd0;
            end
        end
        else if(pattern[counter2 - 1] == 8'h24) //$
        begin
            if( (counter4 == (counter2 - 1)) && ( (string[counter3] == 8'h20) || (string[counter3] == 8'd0) ) )
            begin
                match <= 1'b1;
                match_index <= (flag2) ? match_index : (counter3 - 1 - match_cnt);
                valid <= 1'b1;

                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end
            else if( (string[counter3] == pattern[counter4]) || (pattern[counter4] == 8'h2E) || (pattern[counter4] == 8'h2A) )
            begin
                if(pattern[counter4] == 8'h2A)
                begin
                    flag2 <= 1'b1;
                    if(!flag2)
                    begin
                        match_index <= counter3 - 1 - match_cnt;
                        match_cnt_reg <= match_cnt + 6'd1;
                        counter4_reg <= counter4;
                    end
                end
                else
                begin
                    counter3 <= counter3 + 6'd1;
                    match_cnt <= match_cnt + 6'd1;
                end

                counter4 <= counter4 + 6'd1;
            end
            else if(counter3 > (counter1 - counter2 + 1 + 1))
            begin
                valid <= 1'b1;
                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end         
            else
            begin
                match_cnt <= (flag2) ? match_cnt_reg : 4'd0;
                counter3 <= counter3_reg;
                counter3_reg <= counter3_reg + 6'd1;
                counter4 <= (flag2) ? counter4_reg : 6'd0;
            end
        end
        else
        begin
            if(counter4 >= counter2)
            begin
                match <= 1'b1;
                match_index <= (flag2) ? match_index : (counter3 - 1 - match_cnt);
                valid <= 1'b1;

                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end
            else if( (string[counter3] == pattern[counter4]) || (pattern[counter4] == 8'h2E) || (pattern[counter4] == 8'h2A) )
            begin
                if(pattern[counter4] == 8'h2A)
                begin
                    flag2 <= 1'b1;
                    if(!flag2)
                    begin
                        match_index <= counter3 - 1 - match_cnt;
                        match_cnt_reg <= match_cnt + 6'd1;
                        counter4_reg <= counter4;
                    end
                end
                else
                begin
                    counter3 <= counter3 + 6'd1;
                    match_cnt <= match_cnt + 6'd1;
                end

                counter4 <= counter4 + 6'd1;
            end
            else if(counter3 > (counter1 - counter2 + 1))
            begin
                valid <= 1'b1;
                match_cnt <= 4'd0;
                counter2 <= 4'd0;
                counter3 <= 6'd1;
                counter4 <= 6'd0;
            end         
            else
            begin
                match_cnt <= (flag2) ? match_cnt_reg : 4'd0;
                counter3 <= counter3_reg;
                counter3_reg <= counter3_reg + 6'd1;
                counter4 <= (flag2) ? counter4_reg : 6'd0;
            end
        end
    end
end

endmodule