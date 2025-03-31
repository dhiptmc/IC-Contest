module DT(
	input 					clk, 
	input					reset,
	output	reg				done,
	output	reg				sti_rd,
	output	reg 	[9:0]	sti_addr,
	input			[15:0]	sti_di,
	output	reg				res_wr,
	output	reg				res_rd,
	output	reg 	[13:0]	res_addr,
	output	reg 	[7:0]	res_do,
	input			[7:0]	res_di
);

reg [2:0] cur_state, nxt_state;
localparam [2:0]	IDLE	 = 3'd0,
					SELF1	 = 3'd1,
					READ1 	 = 3'd2,
					FORWARD  = 3'd3,
					SELF2	 = 3'd4,
					READ2 	 = 3'd5,
					BACKWARD = 3'd6,
					FINI 	 = 3'd7;

reg [13:0] index;

wire   criteria;
assign criteria = ( (index <= 14'd127) || (index >= 14'd16256) || (index[6:0] == 7'b000_0000) || ((index[6:0]== 7'b111_1111)) );

reg [2:0] counter;

reg [7:0] a,b,c,d,e,e_reg;

wire [7:0] compare1, compare2, forwardresult, backwardresult;
assign compare1 = (a <= b) ? a : b;
assign compare2 = (c <= d) ? c : d;
assign forwardresult = (compare1 <= compare2) ? (compare1 + 1) : (compare2 + 1);
assign backwardresult= (e <= forwardresult) ? e : forwardresult;

always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		cur_state <= IDLE;
	end
	else
	begin
		cur_state <= nxt_state;
	end
end

always@(*)
begin
	case(cur_state)
	IDLE:
		nxt_state = (reset) ? SELF1 : IDLE;

	SELF1:
		nxt_state = (criteria) ? FORWARD : READ1;
	READ1:
		nxt_state = ( (criteria) || (!sti_di[15- index[3:0]]) ) ? FORWARD : ( (counter != 2'd3) ? READ1 : FORWARD );
	FORWARD:
		nxt_state = (index == 14'd16256) ? BACKWARD : SELF1;

	SELF2:
		nxt_state = (criteria) ? BACKWARD : READ2;
	READ2:
		nxt_state = ( (criteria) || ((e == 8'd0)) ) ? BACKWARD : ( (counter != 2'd3) ? READ2 : BACKWARD );
	BACKWARD:
		nxt_state = (index == 14'd127) ? FINI : SELF2;

	FINI:
		nxt_state = IDLE;

	default:
		nxt_state = IDLE;
	endcase
end

always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		done 	 <= 1'b0;
		sti_rd 	 <= 1'b0;
		sti_addr <= 10'd0;
		res_wr 	 <= 1'b0;
		res_rd 	 <= 1'b0;
		res_addr <= 14'd0;
		res_do 	 <= 8'd0;

		counter  <= 2'd0;

		index 	 <= 14'd0;

		a <= 8'd0;
		b <= 8'd0;
		c <= 8'd0;
		d <= 8'd0;	
		e <= 8'd0;
		e_reg <= 8'd0;	
	end
	else
	begin
		case(cur_state)
		SELF1:
		begin
			res_wr   <= 1'b0;	

			sti_rd   <= 1'b1;
			sti_addr <= index >> 4;

			res_rd   <= 1'b1;
			
			if(criteria)
				res_addr <= index;
			else
				res_addr <= index - 14'd129;
		end

		READ1:
		begin
			sti_rd <= 0;
			
			if( (criteria) || (!sti_di[15- index[3:0]]) ) //sti_di[15- index[3:0]] make sure that specific index is 1, the data sorts as a reverse of the pdf shown.
			begin
				counter  <= 2'd0;
				res_rd   <= 1'b0;
				res_addr <= index;
			end
			else
			begin
				counter <= counter + 2'd1;
				res_rd  <= 1'b1;

				case(counter)
				2'd0:
				begin
					res_rd   <= 1'b1;
					a 		 <= res_di;
					res_addr <= (index - 128);
				end			
				2'd1:
				begin
					res_rd 	 <= 1'b1;
					b 		 <= res_di;
					res_addr <= (index - 127);
				end				
				2'd2:
				begin
					res_rd   <= 1'b1;
					c 		 <= res_di;
					res_addr <= (index - 1);
				end
				2'd3:
				begin
					counter  <= 2'd0;
					res_rd   <= 1'b0;
					d 		 <= res_di;
					res_addr <= index;
				end
				default:
				begin
					a 		 <= 8'd0;
					b 		 <= 8'd0;
					c 		 <= 8'd0;
					d 		 <= 8'd0;
					counter  <= 2'd0;
					res_rd   <= 1'b0;
					res_wr   <= 1'b0;
					res_addr <= 14'd0;
				end
				endcase
			end
		end

		FORWARD:
		begin
			if(index < 14'd16256)
			begin
				index  <= index + 14'd1;
				res_rd <= 1'b0;
				res_wr <= 1'b1;
			end
			else
			begin
				res_wr   <= 1'b0;
				res_rd   <= 1'b1;
				res_addr <= 14'd16255;
			end

			if( (criteria) || (!sti_di[15- index[3:0]]) )
			begin
				res_do <= 8'd0;
				sti_rd <= 1'b0;
			end
			else
				res_do <= forwardresult;
		end

		SELF2:
		begin
			res_wr <= 1'b0;
			res_rd <= 1'b1;

			e      <= e_reg;

			if(criteria)
				res_addr <= index - 14'd1;
			else
				res_addr <= index + 14'd129;
		end

		READ2:
		begin
			res_rd <= 1'b1;

			if(!( (criteria) || (e == 8'd0) ))
			begin
				counter <= counter + 2'd1;

				case(counter)
				2'd0:
				begin
					a <= res_di;
					res_addr <= (index + 128);
				end			
				2'd1:
				begin
					b <= res_di;
					res_addr <= (index + 127);
				end				
				2'd2:
				begin
					c <= res_di;
					res_addr <= (index + 1);
				end
				2'd3:
				begin
					d <= res_di;
					res_addr <= (index - 1);
				end
				default:
				begin
					a 		 <= 8'd0;
					b 		 <= 8'd0;
					c 		 <= 8'd0;
					d 		 <= 8'd0;
					e 		 <= 8'd0;
					counter  <= 2'd0;
					res_addr <= 14'd0;
				end
				endcase
			end
			else
			begin
				res_addr <= (index - 1);
			end
		end

		BACKWARD:
		begin
			e_reg 	 <= res_di;

			counter  <= 2'd0;
			res_rd   <= 1'b0;
			res_wr   <= 1'b1;
			res_addr <= index;

			if(index > 14'd127)
				index <= index - 14'd1;

			if( (criteria) || (e_reg == 8'd0) )
				res_do <= 8'd0;
			else
				res_do <= backwardresult;
		end

		FINI:
		begin
			done <= 1'd1;
		end

		default:
		begin
			done 	 <= 1'b0;
			sti_rd 	 <= 1'b0;
			sti_addr <= 10'd0;
			res_wr 	 <= 1'b0;
			res_rd 	 <= 1'b0;
			res_addr <= 14'd0;
			res_do 	 <= 8'd0;

			counter  <= 2'd0;

			index 	 <= 14'd0;

			a <= 8'd0;
			b <= 8'd0;
			c <= 8'd0;
			d <= 8'd0;	
			e <= 8'd0;
			e_reg <= 8'd0;	
		end
		endcase
	end
end


endmodule