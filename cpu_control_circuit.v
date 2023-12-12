module cpu_control_circuit(
		input clk,
		input rst,
		output reg [3:0] state, 
		output reg RegDst,
		/* Inputs */
		input [6:0] Op,
		/* Outputs */
		output reg PCWriteCond,
		output reg PCWrite,
		output reg IorD,
		output reg MemRead,
		output reg MemWrite,
		output reg MemtoReg,
		output reg IRwrite,
		output reg PCSource,
		output reg [1:0] ALUOp,
		output reg [1:0] ALUSrcB,
		output reg ALUSrcA,
		output reg RegWrite
	);
	
	
	// might need reset
	always @(posedge clk) begin
	
		if(rst) begin
		
			state <= 0; 
			RegDst <= 0;
			
			PCWriteCond <= 0;
			PCWrite <= 0;
			IorD <= 0;
			MemRead <= 0;
			MemWrite <= 0;
			MemtoReg <= 0;
			IRwrite <= 0;
			PCSource <= 0;
			ALUOp <= 0;
			ALUSrcB <= 0;
			ALUSrcA <= 0;
			RegWrite <= 0;
			
		end else begin

		
			/* **************************** Instruction Fetch (State 0) **************************** */
			case(state)
			
			0: begin 
				
				// Read & Write
				MemRead <= 1'b1; 			// Read Instruction
				IRwrite <= 1'b1;			// Write in to intruction register
				
				// Address Source
				IorD = 1'b0;				// Set PC as address source
				
				// PC+4
				ALUSrcA <= 1'b0;			// Select PC as first ALU input
				ALUSrcB <= 2'b01;			// Select immediate value 4 as the second ALU input
				ALUOp	<= 2'b00;			// Set oepration to addition 
				PCWrite <= 1'b1;			// Enable writing PC+4 back to PC
				PCSource <= 1'b0;			// Set ALU output to PC; 
				
				/* ************ */
				/* Computations */
				/* ************ */
				
				state <= 1;				// Go to ID
			end
			
			
			/* **************************** Instruction Decode (State 1) **************************** */
			1: begin 
			
				ALUSrcA <= 1'b0;					
				ALUSrcB <= 2'b10;
				ALUOp <= 2'b00;					// Set for addition operation
				
				// ALUOut <= ALUSrcA + ALUSrcB;	// Compute branch target address; ALUOut <= PC + immediate
				
				/* ************ */
				/* Computations */
				/* ************ */
			
				/* Determine which state from OP */
				case(Op)
					7'b0110011: state <= 6;				// R-type
					7'b0000011: state <= 3;				// Memory reference (LW)
					7'b0100011: state <= 5;				// Memory reference (SW)
					7'b1100011: state <= 8;				// Branch
				endcase
			
			end
			
			
			
			/* **************************** Memory Reference (State 2) **************************** */
			
			2: begin
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b10;
				ALUOp = 2'b00;
			end	
			
			/* ------------------------ LW ------------------------ */	
			// Memory access LW (State 3)
			3: begin		
				
				MemRead <= 1'b1;
				IorD <= 1'b1;
				
				state <= 4;
			
			end
			
			// Memory read completion step (State 4)
			4: begin
			
				RegWrite <= 1'b1;
				MemtoReg = 1'b1;
				RegDst <= 1'b0;
				
				state <= 0;		// Go back to IF
			
			end
			
			/* ------------------------ SW ------------------------ */	
			// Memory access (State 5)
			5: begin
				
				MemWrite <= 1'b1;
				IorD <= 1'b1;
			
				state <= 0;		// Go back to IF
				
			end
							
							
			/* **************************** R-type (State 6) **************************** */
			// Execution (State 6)
			6: begin
				
				ALUSrcA <= 1'b1;
				ALUSrcB <= 2'b00;
				ALUOp <= 2'b10;
			
				state <= 7;
				
			end
			
			// R-type completition (State 7)
			7: begin	
				
				RegDst <= 1'b1;
				RegWrite <= 1'b1;
				MemtoReg <= 1'b0;
				
				state <= 0;		// Go back to IF
	
			end
			
			
			/* **************************** Branch (State 8) **************************** */
			8: begin
				ALUSrcA = 1'b1;
				ALUSrcB = 2'b00;
				ALUOp = 2'b01;
				PCWriteCond = 1'b1;
				PCSource = 2'b01;
				
				
				state <= 0;		// Go back to IF
			end
			
			endcase
			
			
		end	// end for reset
	
	end	// end for always @ (posedge clk)
	
endmodule