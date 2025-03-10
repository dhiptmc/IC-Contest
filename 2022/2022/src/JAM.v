module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );

reg [1:0] cur_state, nxt_state;
localparam [1:0] READ    = 2'd0,
                 REVERSE = 2'd1,
                 OUTPUT  = 2'd2;

reg [2:0] label [7:0];
reg [3:0] counter;

reg [2:0] pivot, pivot_reg;
reg done_flag;
reg [3:0] minlarge;
reg [2:0] minlarge_index;
reg [9:0] cost_reg;

integer i;

//FSM
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        cur_state <= READ;
    else
        cur_state <= nxt_state;
end

always @ (*)
begin
    case(cur_state)
    READ:
        nxt_state = (counter == 4'd8) ? REVERSE : READ;

    REVERSE:
        nxt_state = (done_flag) ? OUTPUT : READ;

    OUTPUT:
        nxt_state = OUTPUT;

    default:
        nxt_state = READ;
    endcase 
end

// label
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        for(i = 0 ; i < 8 ; i = i + 1)
            label[i] <= i;
        pivot_reg <= 3'd0;
    end
    else
    begin
        case(cur_state)
        READ:
        begin
            if(counter == 4'd8)
            begin
                pivot_reg             <= pivot;
                label[pivot]          <= label[minlarge_index];
                label[minlarge_index] <= label[pivot];
            end
        end

        REVERSE:
        begin
            case(pivot_reg)
            3'd5:
            begin
                label[6] <= label[7];
                label[7] <= label[6];                
            end

            3'd4:
            begin
                label[5] <= label[7];
                label[7] <= label[5];
            end

            3'd3:
            begin
                label[4] <= label[7];
                label[5] <= label[6];
                label[6] <= label[5];
                label[7] <= label[4];
            end

            3'd2:
            begin
                label[3] <= label[7];
                label[4] <= label[6];
                label[6] <= label[4];
                label[7] <= label[3];
            end

            3'd1:
            begin
                label[2] <= label[7];
                label[3] <= label[6];
                label[4] <= label[5];
                label[5] <= label[4];
                label[6] <= label[3];
                label[7] <= label[2];
            end

            3'd0:
            begin
                label[1] <= label[7];
                label[2] <= label[6];
                label[3] <= label[5];
                label[5] <= label[3];
                label[6] <= label[2];
                label[7] <= label[1];
            end
            endcase
        end
        endcase
    end
end

//pivot
always @ (*)
begin
    if(label[7] > label[6])
        pivot = 3'd6;
    else if(label[6] > label[5])
        pivot = 3'd5;
    else if(label[5] > label[4])
        pivot = 3'd4;
    else if(label[4] > label[3])
        pivot = 3'd3;
    else if(label[3] > label[2])
        pivot = 3'd2;
    else if(label[2] > label[1])
        pivot = 3'd1;
    else if(label[1] > label[0])
        pivot = 3'd0;
    else
        pivot = 3'd7;
end

//done_flag
always @ (*)
begin
    case(cur_state)
    REVERSE:
        done_flag = (minlarge == 4'd8);

    default:
        done_flag = done_flag;
    endcase
end

//minlarge / minlarge_index
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        minlarge       <= 4'd8;
        minlarge_index <= 3'd0;
    end
    else
    begin
        case(cur_state)
        READ:
        begin
            if( (counter > pivot) && (label[counter] > label[pivot]) && (label[counter] < minlarge) && (counter != 4'd8))
            begin
                minlarge       <= label[counter];
                minlarge_index <= counter;
            end
        end

        default:
        begin
            minlarge       <= 4'd8;
            minlarge_index <= 3'd0;        
        end
        endcase
    end
end

//cost_reg
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        cost_reg <= 10'd0;
    else if(counter > 4'd0)
        cost_reg <= cost_reg + Cost;
    else
        cost_reg <= 10'd0;
end

// counter
always @ (posedge CLK or posedge RST)
begin
    if(RST)
        counter <= 4'd0;
    else
    begin
        case (cur_state)
            READ:
                counter <= (counter == 4'd8) ? 4'd0 : (counter + 4'd1);
        endcase
    end
end

// W / J
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        W <= 3'd0;
        J <= 3'd0;
    end
    else
    begin
        case (cur_state)
            READ:
            begin
                W <= counter + 1;
                J <= label[counter + 1];
            end

            REVERSE:
            begin
                W <= 3'd0;
                J <= label[0];
            end
        endcase
    end
end

// MinCost / MatchCount
always @ (posedge CLK or posedge RST)
begin
    if(RST)
    begin
        MinCost    <= 10'd1023;
        MatchCount <= 4'd1;
    end
    else
    begin
        case(cur_state)
        REVERSE:
        begin
            if (cost_reg < MinCost)
            begin
                MinCost <= cost_reg;
                MatchCount <= 4'd1;
            end
            else if (cost_reg == MinCost)
                MatchCount <= MatchCount + 4'd1;
        end
        endcase
    end
end

//Valid
always @ (*)
begin
    Valid = (cur_state == OUTPUT);
end

endmodule