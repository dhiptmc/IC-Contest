`timescale 1ns/10ps

module	CONV(
		input	clk,
		input	reset,
		output	reg busy,	
		input	ready,	

		output	reg	[11:0] iaddr,
		input	signed [19:0] idata,	

		output	reg cwr,
		output	reg	[11:0] caddr_wr,
		output	reg	[19:0] cdata_wr,

		output	reg crd,
		output 	reg	[11:0] caddr_rd,
		input	[19:0] cdata_rd,

		output	reg [2:0] csel
		);

reg [3:0] cur_state, nxt_state;
localparam [3:0]	IDLE 	   = 4'd0,
					READ_CONV  = 4'd1,
					WRITE_L0_1 = 4'd2,
					WRITE_L0_2 = 4'd3,
					INTER1	   = 4'd4,
					READ_L0    = 4'd5,
					WRITE_L1   = 4'd6,
					INTER2	   = 4'd7,
					INTER3     = 4'd8,
					INTER4	   = 4'd9,
					READ_L1_1  = 4'd10,
					READ_L1_2  = 4'd11,
					FLATTEN1   = 4'd12,
					FLATTEN2   = 4'd13,
					FINI	   = 4'd14;

localparam [3:0]	UPPERLEFT  = 4'd0,
					UP		   = 4'd1,
					UPPERRIGHT = 4'd2,
					LEFT 	   = 4'd3,
					CURRENT	   = 4'd4,
					RIGHT	   = 4'd5,
					LOWERLEFT  = 4'd6,
					DOWN	   = 4'd7,
					LOWERRIGHT = 4'd8;

localparam [1:0] 	UL 		   = 2'd0,
					UR 		   = 2'd1,
					LL 		   = 2'd2,
					LR 		   = 2'd3;

reg [11:0] cur_addr;
reg signed [19:0] dataUL, dataU, dataUR, dataL, dataC, dataR, dataLL, dataD, dataLR;
reg [3:0] position;


wire signed [40:0] convresult1, convresult2;
assign convresult1 = dataUL * $signed(20'h0A89E) + dataU * $signed(20'h092D5) + dataUR * $signed(20'h06D43)
				   + dataL  * $signed(20'h01004) + dataC * $signed(20'hF8F71) + dataR  * $signed(20'hF6E54)
				   + dataLL * $signed(20'hFA6D7) + dataD * $signed(20'hFC834) + dataLR * $signed(20'hFAC19);
assign convresult2 = dataUL * $signed(20'hFDB55) + dataU * $signed(20'h02992) + dataUR * $signed(20'hFC994)
				   + dataL  * $signed(20'h050FD) + dataC * $signed(20'h02F20) + dataR  * $signed(20'h0202D)
				   + dataLL * $signed(20'h03BD7) + dataD * $signed(20'hFD369) + dataLR * $signed(20'h05E68);

wire signed [40:0] biasresult1, biasresult2;
assign biasresult1 = convresult1 + $signed({20'h01310,16'd0});
assign biasresult2 = convresult2 + $signed({20'hF7295,16'd0});

wire signed [19:0] roundresult1, roundresult2;
assign roundresult1 = biasresult1[35:16] + biasresult1[15];
assign roundresult2 = biasresult2[35:16] + biasresult2[15];

reg signed [19:0] data4UL,data4UR,data4LL,data4LR;
wire signed [19:0] bs1, bs2;
assign bs1 = ( data4UL >= data4UR ) ? data4UL : data4UR;
assign bs2 = ( data4LL >= data4LR ) ? data4LL : data4LR;
wire signed [19:0] max;
assign max = ( bs1 >= bs2 ) ? bs1 : bs2;

reg flag1, flag2, flag3, flag4;
reg [4:0] chgsig;
reg [11:0] addr4;

reg [19:0] temp1, temp2;

reg final;

always @(posedge clk or posedge reset)
begin
	if(reset)
		cur_state <= IDLE;
	else
		cur_state <= nxt_state;	
end

always @(*)
begin
	case(cur_state)
	IDLE:
		nxt_state = (ready) ? READ_CONV  : IDLE;

	READ_CONV:
		nxt_state = (flag1) ? WRITE_L0_1 : READ_CONV;

	WRITE_L0_1:
		nxt_state = WRITE_L0_2;

	WRITE_L0_2:
		nxt_state = (crd) ? INTER1 : READ_CONV;

	INTER1:
		nxt_state = READ_L0;

	READ_L0:
		nxt_state = (flag1) ? WRITE_L1 : READ_L0;

	WRITE_L1:
		nxt_state = (flag4) ? INTER4 : (flag3) ? INTER3 : (flag2) ? INTER3 : INTER2;

	INTER2, INTER3:
		nxt_state = READ_L0;

	INTER4:
		nxt_state = READ_L1_1;

	READ_L1_1:
		nxt_state = READ_L1_2;

	READ_L1_2:
		nxt_state = FLATTEN1;
	
	FLATTEN1:
		nxt_state = FLATTEN2;

	FLATTEN2:
		nxt_state = (final) ? FINI : INTER4;

	FINI:
		nxt_state = IDLE;

	default:
		nxt_state = IDLE;
	endcase
end

always @(posedge clk or posedge reset)
begin
	if(reset)
	begin
		busy 	  <= 1'b0;
		iaddr     <= 12'd0;
		cwr       <= 1'b0;
		caddr_wr  <= 12'd0;
		cdata_wr  <= 20'd0;
		crd		  <= 1'b0;
		caddr_rd  <= 12'd0;
		csel      <= 3'b000;

		cur_addr  <= 12'd0;

		dataUL    <= 20'd0;
		dataU	  <= 20'd0;
		dataUR    <= 20'd0;
		dataL	  <= 20'd0;
		dataC	  <= 20'd0;
		dataR     <= 20'd0;
		dataLL    <= 20'd0;
		dataD     <= 20'd0;
		dataLR    <= 20'd0;

		position  <= UPPERLEFT;

		data4UL	  <= 20'd0;
		data4UR	  <= 20'd0;
		data4LL	  <= 20'd0;
		data4LR	  <= 20'd0;

		chgsig	  <= 5'd0;
		addr4	  <= 12'd0;

		flag1     <= 1'b0;
		flag2     <= 1'b0;
		flag3     <= 1'b0;
		flag4     <= 1'b0;		

		temp1     <= 20'd0;
		temp2     <= 20'd0;

		final	  <= 1'b0;
	end
	else
	begin
		case(cur_state)
		READ_CONV:
		begin
			busy <= 1'b1;
			cwr  <= 1'b0;

			case(position)
			UPPERLEFT:
			begin
				position <= UP;

				if(cur_addr < 12'd64)
				begin
					dataUL   <= 20'd0;
				end
				else if(!cur_addr[5:0])
				begin
					dataUL   <= 20'd0;
					iaddr	 <= cur_addr - 12'd64;
				end
				else
				begin
					dataUL	 <= idata;
					iaddr	 <= cur_addr - 12'd64;
				end
			end

			UP:
			begin
				position <= UPPERRIGHT;

				if(cur_addr < 12'd64)
				begin
					dataU    <= 20'd0;
				end
				else
				begin
					dataU	 <= idata;
					iaddr	 <= cur_addr - 12'd63;
				end	
			end

			UPPERRIGHT:
			begin
				position <= LEFT;

				if(cur_addr < 12'd64)
				begin
					dataUR   <= 20'd0;
				end
				else if(&cur_addr[5:0])
				begin
					dataUR   <= 20'd0;
					iaddr	 <= cur_addr - 12'd1;
				end
				else
				begin
					dataUR	 <= idata;
					iaddr	 <= cur_addr - 12'd1;
				end		
			end

			LEFT:
			begin
				position <= CURRENT;

				if(!cur_addr[5:0])
				begin
					dataL    <= 20'd0;
				end
				else
				begin
					dataL    <= idata;
				end
				
				iaddr <= cur_addr;
			end

			CURRENT:
			begin
				position <= RIGHT;

				dataC    <= idata;
				iaddr	 <= cur_addr + 12'd1;
			end

			RIGHT:
			begin
				position <= LOWERLEFT;

				if(&cur_addr[5:0])
				begin
					dataR    <= 20'd0;
				end
				else
				begin
					dataR    <= idata;
				end

				iaddr <= cur_addr + 12'd63;			
			end

			LOWERLEFT:
			begin
				position <= DOWN;

        		if( ( cur_addr > 12'd4031 ) && ( cur_addr <= 12'd4095 ) )
				begin
					dataLL   <= 20'd0;
				end
				else if(!cur_addr[5:0])
				begin
					dataLL   <= 20'd0;
					iaddr	 <= cur_addr + 12'd64;
				end
				else
				begin
					dataLL   <= idata;
					iaddr	 <= cur_addr + 12'd64;
				end
			end

			DOWN:
			begin
				flag1 <= 1'b1; //one cycle in advance

				position <= LOWERRIGHT;

        		if( ( cur_addr > 12'd4031 ) && ( cur_addr <= 12'd4095 ) )
				begin
					dataD    <= 20'd0;
				end
				else
				begin
					dataD    <= idata;
					iaddr	 <= cur_addr + 12'd65;				
				end
			end

			LOWERRIGHT:
			begin
				flag1 <= 1'b0;

				position <= UPPERLEFT;

        		if( ( ( cur_addr > 12'd4031 ) && ( cur_addr <= 12'd4095 ) ) || (&cur_addr[5:0]) )
				begin
					dataLR   <= 20'd0;
				end
				else
				begin
					dataLR   <= idata;
				end

				iaddr <= (cur_addr > 12'd63) ? (cur_addr + 12'd1 - 12'd65) : cur_addr;
			end

			default:
			begin
				position <= UPPERLEFT;

				dataUL   <= 20'd0;
				dataU	 <= 20'd0;
				dataUR   <= 20'd0;
				dataL	 <= 20'd0;
				dataC	 <= 20'd0;
				dataR    <= 20'd0;
				dataLL   <= 20'd0;
				dataD    <= 20'd0;
				dataLR   <= 20'd0;

				iaddr	 <= 12'd0;

				flag1    <= 1'b0;
			end
			endcase
		end

		WRITE_L0_1:
		begin
			if(&cur_addr[11:0])
			begin
				crd <= 1'b1;
			end

			cwr		 <= 1'b1;
			csel	 <= 3'b001;
			caddr_wr <= cur_addr;
			if(roundresult1[19])
				cdata_wr <= 20'd0;
			else
				cdata_wr <= roundresult1;
		end

		WRITE_L0_2:
		begin
			cwr  <= 1'b1;
			csel <= 3'b010;
			if(roundresult2[19])
				cdata_wr <= 20'd0;
			else
				cdata_wr <= roundresult2;

			if(!(&cur_addr[11:0]))
			begin
				cur_addr <= cur_addr + 12'd1;
			end
			else
			begin
				cur_addr <= 12'd0;
				caddr_rd <= 13'd0;
			end
		end

		INTER1:
		begin
			cwr  <= 1'b0;
			crd	 <= 1'b1;
			csel <= 3'b001;
		end

		READ_L0:
		begin
			cwr  <= 1'b0;
			crd	 <= 1'b1;

			if(cur_addr == 12'd4030)
			begin
				flag2 <= 1'b1;
				if(flag3)
				begin
					flag4 <= 1'b1;
				end
			end

			case(position)
			UL:
			begin
				position <= UR;

				data4UL  <= cdata_rd;
				caddr_rd <= cur_addr + 12'd1;
			end

			UR:
			begin
				position <= LL;

				data4UR  <= cdata_rd;
				caddr_rd <= cur_addr + 12'd64;		
			end
			
			LL:
			begin
				flag1 <= 1'b1;

				position <= LR;

				data4LL  <= cdata_rd;
				caddr_rd <= cur_addr + 12'd65;
			end
			
			LR:
			begin
				flag1 <= 1'b0;
				csel  <= (flag3) ? 3'b100 : 3'b011;

				position <= UL;

				data4LR  <= cdata_rd;
			end

			default:
			begin
				position <= UL;

				data4UL	 <= 20'd0;
				data4UR	 <= 20'd0;
				data4LL	 <= 20'd0;
				data4LR	 <= 20'd0;

				cwr		 <= 1'b0;
				crd		 <= 1'b1;
				csel	 <= 3'b001;
			end
			endcase
		end

		WRITE_L1:
		begin
			flag2 <= 1'b0;

			crd <= 1'b1;
			cwr <= 1'b1;
			caddr_wr <= addr4;
			cdata_wr <= max;


			if(!flag2)
			begin
				if(chgsig != 5'd31)
				begin
					chgsig <= chgsig + 5'd1;
					cur_addr <= cur_addr + 12'd2;
					caddr_rd <= cur_addr + 12'd2;
				end
				else
				begin
					chgsig <= 5'd0;
					cur_addr <= cur_addr + 12'd66;
					caddr_rd <= cur_addr + 12'd66;
				end
				addr4 <= addr4 + 12'd1;
			end
			else
			begin
				chgsig   <= 5'd0;
				cur_addr <= 12'd0;
				caddr_rd <= 12'd0;
				addr4 	 <= 12'd0;
			end
		end

		INTER2:
		begin
			crd  <= 1'b1;
			cwr  <= 1'b0;
			csel <= 3'b001;
		end

		INTER3:
		begin
			crd   <= 1'b1;
			cwr   <= 1'b0;
			csel  <= 3'b010;
			flag3 <= 1'b1;
		end

		INTER4:
		begin
			flag3 <= 1'b0;
			flag4 <= 1'b0;
			crd   <= 1'b1;
			cwr   <= 1'b0;
			csel  <= 3'b011;
		end

		READ_L1_1:
		begin
			crd   <= 1'b1;
			cwr   <= 1'b0;
			csel  <= 3'b100;
			temp1 <= cdata_rd;
		end

		READ_L1_2:
		begin
			crd   <= 1'b1;
			cwr   <= 1'b0;
			csel  <= 3'b101;
			temp2 <= cdata_rd;
		end

		FLATTEN1:
		begin
			crd   <= 1'b0;
			cwr   <= 1'b1;
			csel  <= 3'b101;
			caddr_wr <= addr4;
			cdata_wr <= temp1;

			addr4 <= addr4 + 12'd1;

			if(&caddr_rd[9:0])
			begin
				final <= 1'b1;
			end
			else
			begin
				caddr_rd <= caddr_rd + 12'd1;
			end
		end

		FLATTEN2:
		begin
			crd   <= 1'b0;
			cwr   <= 1'b1;
			csel  <= 3'b101;
			caddr_wr <= addr4;
			cdata_wr <= temp2;

			addr4 <= addr4 + 12'd1;
		end

		FINI:
		begin
			busy <= 1'b0;
		end

		default:
		begin
			busy 	  <= 1'b0;
			iaddr     <= 12'd0;
			cwr       <= 1'b0;
			caddr_wr  <= 12'd0;
			cdata_wr  <= 20'd0;
			crd		  <= 1'b0;
			caddr_rd  <= 12'd0;
			csel      <= 3'b000;

			cur_addr  <= 12'd0;

			dataUL    <= 20'd0;
			dataU	  <= 20'd0;
			dataUR    <= 20'd0;
			dataL	  <= 20'd0;
			dataC	  <= 20'd0;
			dataR     <= 20'd0;
			dataLL    <= 20'd0;
			dataD     <= 20'd0;
			dataLR    <= 20'd0;

			position  <= UPPERLEFT;

			data4UL	  <= 20'd0;
			data4UR	  <= 20'd0;
			data4LL	  <= 20'd0;
			data4LR	  <= 20'd0;

			chgsig	  <= 5'd0;
			addr4	  <= 12'd0;

			flag1     <= 1'b0;
			flag2     <= 1'b0;
			flag3     <= 1'b0;
			flag4     <= 1'b0;		

			temp1     <= 20'd0;
			temp2     <= 20'd0;

			final	  <= 1'b0;
		end
		endcase
	end
end

endmodule