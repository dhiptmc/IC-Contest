module geofence ( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output reg valid;
output reg is_inside;

reg [2:0] cur_state, nxt_state;
localparam [2:0] READ      = 3'd0,
                 SORT      = 3'd1,
                 HYPO      = 3'd2, //hypotenuse
                 Triangle1 = 3'd3,
                 Triangle2 = 3'd4,
                 SUM       = 3'd5,
                 OUTPUT    = 3'd6;

reg [2:0]  counter, counter2, counter3;
reg [9:0]  X_reg [5:0];
reg [9:0]  Y_reg [5:0];
reg [10:0] R_reg [5:0];

wire signed [21:0] test;
assign test = ( ( X_reg[counter2 - 1] - X_reg[0] ) * (Y_reg[counter2] - Y_reg[0]) ) - ( ( X_reg[counter2] - X_reg[0] ) * (Y_reg[counter2 - 1] - Y_reg[0]) );  //Ax*By - Bx*Ay

wire signed [21:0] area;
assign area = ((X_reg[0] * Y_reg[1] - X_reg[1] * Y_reg[0]) + (X_reg[1] * Y_reg[2] - X_reg[2] * Y_reg[1]) + (X_reg[2] * Y_reg[3] - X_reg[3] * Y_reg[2])
            +  (X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) + (X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) + (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5])) >> 1;

// wire signed [41:0] area_square;
// assign area_square = ( ( (X_reg[0] * Y_reg[1] - X_reg[1] * Y_reg[0]) * (X_reg[0] * Y_reg[1] - X_reg[1] * Y_reg[0]) ) >> 2 )
//                    + ( ( (X_reg[1] * Y_reg[2] - X_reg[2] * Y_reg[1]) * (X_reg[1] * Y_reg[2] - X_reg[2] * Y_reg[1]) ) >> 2 )
//                    + ( ( (X_reg[2] * Y_reg[3] - X_reg[3] * Y_reg[2]) * (X_reg[2] * Y_reg[3] - X_reg[3] * Y_reg[2]) ) >> 2 )
//                    + ( ( (X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) * (X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) ) >> 2 )
//                    + ( ( (X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) * (X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) ) >> 2 )
//                    + ( ( (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]) * (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]) ) >> 2 )
//                    + (((X_reg[0] * Y_reg[1] - X_reg[1] * Y_reg[0]) * 
//                        ((X_reg[1] * Y_reg[2] - X_reg[2] * Y_reg[1]) + (X_reg[2] * Y_reg[3] - X_reg[3] * Y_reg[2]) + (X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) + (X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) + (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]))) >> 1 )
//                    + (((X_reg[1] * Y_reg[2] - X_reg[2] * Y_reg[1]) * 
//                        ((X_reg[2] * Y_reg[3] - X_reg[3] * Y_reg[2]) + (X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) + (X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) + (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]))) >> 1 )
//                    + (((X_reg[2] * Y_reg[3] - X_reg[3] * Y_reg[2]) * 
//                        ((X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) + (X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) + (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]))) >> 1 )                   
//                    + (((X_reg[3] * Y_reg[4] - X_reg[4] * Y_reg[3]) * 
//                        ((X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) + (X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]))) >> 1 )
//                    + (((X_reg[4] * Y_reg[5] - X_reg[5] * Y_reg[4]) * 
//                        ((X_reg[5] * Y_reg[0] - X_reg[0] * Y_reg[5]))) >> 1 );

wire [21:0] a_reg;
assign a_reg = (counter3 != 3'd5) ? ( X_reg[counter3 + 1] - X_reg[counter3] ) * ( X_reg[counter3 + 1] - X_reg[counter3] ) + ( Y_reg[counter3 + 1] - Y_reg[counter3] ) * ( Y_reg[counter3 + 1] - Y_reg[counter3] )
                                 : ( X_reg[0] - X_reg[5] ) * ( X_reg[0] - X_reg[5] ) + ( Y_reg[0] - Y_reg[5] ) * ( Y_reg[0] - Y_reg[5] );
reg  [10:0] low, high;
wire [10:0] mid;
assign mid = (low + high) >> 1;
wire [20:0] mid_square;
assign mid_square = mid * mid;

reg flag;

reg  [10:0] a;
wire [10:0] b,c;
wire [11:0] s;

assign b = R_reg[counter3];
assign c = (counter3 != 3'd5) ? R_reg[counter3 + 1] : R_reg[0];
assign s = (a + b + c) >> 1;

wire [11:0] first, second, third;
assign first  = (s < a) ? a - s : s - a;
assign second = (s < b) ? b - s : s - b;
assign third  = (s < c) ? c - s : s - c;

reg [9:0] first_part, second_part;

reg [21:0] triarea_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
        cur_state <= READ;
    else
    begin
        cur_state <= nxt_state;
    end
end

always @(*)
begin
    case(cur_state)
    READ:
        nxt_state = (counter == 3'd6) ? SORT : READ;

    SORT:
        nxt_state = (counter == 3'd6) ? HYPO : SORT;

    HYPO:
        nxt_state = (flag) ? Triangle1 : HYPO;

    Triangle1:
        nxt_state = (flag) ? Triangle2 : Triangle1;

    Triangle2:
        nxt_state = (flag) ? SUM : Triangle2;

    SUM:
        nxt_state = (counter3 == 3'd5) ? OUTPUT : HYPO;

    OUTPUT:
        nxt_state = READ;    

    default:
        nxt_state = READ;
    endcase
end

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        valid       <= 1'b0;
        is_inside   <= 1'b0;
        counter     <= 3'd0;
        counter2    <= 3'd2;
        counter3    <= 3'd0;

        a           <= 11'd0;
        low         <= 11'd0;
        high        <= 11'd1023;
        flag        <= 1'b0;

        first_part  <= 21'd0;
        second_part <= 21'd0;
        triarea_reg <= 22'd0;
    end
    else
    begin
        case(cur_state)
        READ:
        begin
            X_reg[counter] <= X;
            Y_reg[counter] <= Y;
            R_reg[counter] <= R;

            counter  <= (counter != 3'd6) ? (counter + 3'd1) : 3'd2;
            counter2 <= 3'd2;     
        end

        SORT:
        begin
            if ( ( test < 0 ) && (counter2 != 3'd6) )
            begin
                X_reg[counter2 - 1] <= X_reg[counter2];
                Y_reg[counter2 - 1] <= Y_reg[counter2];
                R_reg[counter2 - 1] <= R_reg[counter2];
                X_reg[counter2]     <= X_reg[counter2 - 1];
                Y_reg[counter2]     <= Y_reg[counter2 - 1];
                R_reg[counter2]     <= R_reg[counter2 - 1];
                counter2            <= counter2 - 3'd1;
            end
            else
            begin
                counter  <= (counter == 3'd6) ? 3'd0 : (counter + 3'd1);
                counter2 <= (counter == 3'd6) ? 3'd2 : (counter + 3'd1);
            end
        end

        HYPO:
        begin
            counter  <= 3'd0;
            counter2 <= 3'd2;
            if(!flag)
            begin
                if(low <= high)
                begin
                    if(mid_square == a_reg)
                    begin
                        a <= mid;
                        flag <= 1'b1;
                    end
                    else if(mid_square < a_reg)
                        low  <= mid + 11'd1;
                    else
                        high <= mid - 11'd1; 
                end
                else
                begin
                    a <= mid;
                    flag <= 1'b1;
                end
            end
            else
            begin
                flag <= 1'b0;
                low  <= 11'd0;
                high <= 11'd1023;
            end
        end

        Triangle1:
        begin
            if(!flag)
            begin
                if(low <= high)
                begin
                    if(mid_square == (s * first))
                    begin
                        first_part <= mid;
                        flag <= 1'b1;
                    end
                    else if(mid_square < (s * first))
                        low  <= mid + 11'd1;
                    else
                        high <= mid - 11'd1; 
                end
                else
                begin
                    first_part <= mid;
                    flag <= 1'b1;
                end
            end
            else
            begin
                flag <= 1'b0;
                low  <= 11'd0;
                high <= 11'd1023;
            end
        end

        Triangle2:
        begin
            if(!flag)
            begin
                if(low <= high)
                begin
                    if(mid_square == (second * third))
                    begin
                        second_part <= mid;
                        flag <= 1'b1;
                    end
                    else if(mid_square < (second * third))
                        low  <= mid + 11'd1;
                    else
                        high <= mid - 11'd1; 
                end
                else
                begin
                    second_part <= mid;
                    flag <= 1'b1;
                end
            end
            else
            begin
                flag <= 1'b0;
                low  <= 11'd0;
                high <= 11'd1023;
            end
        end

        SUM:
        begin
            a <= 11'd0;

            if(counter3 < 3'd5)
            begin
                counter3 <= counter3 + 3'd1;
                triarea_reg <= triarea_reg + first_part * second_part;
            end
            else
            begin
                counter3 <= 3'd0;
                triarea_reg <= 22'd0;
                valid   <= 1'b1;
                if(area >= triarea_reg + first_part * second_part)
                    is_inside <= 1'b1;
                else
                    is_inside <= 1'b0;
            end
        end

        OUTPUT:
        begin
            valid     <= 1'b0;
            is_inside <= 1'b0;

            counter   <= 3'd0;
            counter2  <= 3'd2;
            counter3  <= 3'd0;
        end

        default:
        begin
            valid     <= 1'b0;
            is_inside <= 1'b0;
        end
        endcase
    end
end

endmodule