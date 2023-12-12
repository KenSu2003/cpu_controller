module cpu_control_circuit_tb();
	
		reg clk;
		reg rst;
		wire [3:0] state;
		wire RegDst;
		
		reg [6:0] Op;
		wire PCWriteCond;
		wire PCWrite;
		wire IorD;
		wire MemRead;
		wire MemWrite;
		wire MemtoReg;
		wire IRwrite;
		wire PCSource;
		wire [1:0] ALUOp;
		wire [1:0] ALUSrcB;
		wire ALUSrcA;
		wire RegWrite;
		
		cpu_control_circuit dut(.clk(clk), .rst(rst), .state(state), .RegDst(RegDst), .Op(Op), .PCWriteCond(PCWriteCond), .PCWrite(PCWrite), .IorD(IorD), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .IRwrite(IRwrite), .PCSource(PCSource), .ALUOp(ALUOp), .ALUSrcB(ALUSrcB), .ALUSrcA(ALUSrcA), .RegWrite(RegWrite));
		
		initial begin
			clk = 0;
			forever #10 clk=~clk;
		end
	
	
	
		// Test sequence
		initial begin
		
				/* -------------- Reset -------------- */
				// Initialize Inputs
				rst = 1;
				Op = 0;
				
				// Wait for reset
				#100;
				rst = 0; // Release reset
				/* ----------------------------------- */
				
				
				/* ------------ R-type Instruction ------------ */
				$display("R-type Instruction");
				Op = 7'b0110011;
			  
				// Initial State 
				$display("Initial State: %d", state);
				
				// 1st State
				#20
				$display("State = %d", state);
				
				// 2nd State
				#20
				$display("State = %d", state);
				
				// 3rd State
				#20				
				$display("State = %d", state);
				$display(" ");
				$display("State: %b", state);
				$display("State: %b", state);
				$display("RegDst: %b", RegDst);
				$display("PCWriteCond: %b", PCWriteCond);
				$display("PCWrite: %b", PCWrite);
				$display("IorD: %b", IorD);
				$display("MemRead: %b", MemRead);
				$display("MemWrite: %b", MemWrite);
				$display("MemtoReg: %b", MemtoReg);
				$display("IRwrite: %b", IRwrite);
				$display("PCSource: %b", PCSource);
				$display("ALUOp: %b", ALUOp);
				$display("ALUSrcB: %b", ALUSrcB);
				$display("ALUSrcA: %b", ALUSrcA);
				$display("RegWrite: %b", RegWrite);
				$display(" ");
				// 4th State
				#20				
				$display("State = %d", state);
				$display(" ");
			
				

				/* -------------- Reset -------------- */
				// Initialize Inputs
				rst = 1;
				Op = 0;
				
				// Wait for reset
				#100;
				rst = 0; // Release reset
				/* ----------------------------------- */
				
				/* ------------ Memory Reference (LW) ------------ */
				$display("Load Instruction");
				Op = 7'b0000011;
			  
				// Initial State 
				$display("Initial State: %d", state);
				
				
				// 1st State
				#20
				$display("State = %d", state);
				
				// 2nd State
				#20
				$display("State = %d", state);
				
				// 3rd State
				#20				
				$display("State = %d", state);
				$display(" ");
				$display("State: %b", state);
				$display("RegDst: %b", RegDst);
				$display("PCWriteCond: %b", PCWriteCond);
				$display("PCWrite: %b", PCWrite);
				$display("IorD: %b", IorD);
				$display("MemRead: %b", MemRead);
				$display("MemWrite: %b", MemWrite);
				$display("MemtoReg: %b", MemtoReg);
				$display("IRwrite: %b", IRwrite);
				$display("PCSource: %b", PCSource);
				$display("ALUOp: %b", ALUOp);
				$display("ALUSrcB: %b", ALUSrcB);
				$display("ALUSrcA: %b", ALUSrcA);
				$display("RegWrite: %b", RegWrite);
				$display(" ");
				// 4th State
				#20				
				$display("State = %d", state);
				$display(" ");
				

				
				/* -------------- Reset -------------- */
				// Initialize Inputs
				rst = 1;
				Op = 0;
				
				// Wait for reset
				#100;
				rst = 0; // Release reset
				/* ----------------------------------- */
		
				
				/* ------------ Memory Reference (SW) ------------ */
				$display("Store Instruction");
				Op = 7'b0100011;
			  
				// Initial State 
				$display("Initial State: %d", state);
				
				
				// 1st State
				#20
				$display("State = %d", state);
				
				// 2nd State
				#20
				$display("State = %d", state);
				$display(" ");
				$display("State: %b", state);
				$display("RegDst: %b", RegDst);
				$display("PCWriteCond: %b", PCWriteCond);
				$display("PCWrite: %b", PCWrite);
				$display("IorD: %b", IorD);
				$display("MemRead: %b", MemRead);
				$display("MemWrite: %b", MemWrite);
				$display("MemtoReg: %b", MemtoReg);
				$display("IRwrite: %b", IRwrite);
				$display("PCSource: %b", PCSource);
				$display("ALUOp: %b", ALUOp);
				$display("ALUSrcB: %b", ALUSrcB);
				$display("ALUSrcA: %b", ALUSrcA);
				$display("RegWrite: %b", RegWrite);
				$display(" ");
				// 3rd State
				#20				
				$display("State = %d", state);
				$display(" ");
				
				
				/* -------------- Reset -------------- */
				// Initialize Inputs
				rst = 1;
				Op = 0;
				
				// Wait for reset
				#100;
				rst = 0; // Release reset
				/* ----------------------------------- */
		
				
				/* ------------ Branch ------------ */
				$display("Branch Instruction");
				Op = 7'b1100011;
			  
				// Initial State 
				$display("Initial State: %d", state);
				
				// 1st State
				#20
				$display("State = %d", state);
				
				
				// 3rd State
				#20
				$display("State = %d", state); 
				$display(" ");
				$display("State: %b", state);
				$display("RegDst: %b", RegDst);
				$display("PCWriteCond: %b", PCWriteCond);
				$display("PCWrite: %b", PCWrite);
				$display("IorD: %b", IorD);
				$display("MemRead: %b", MemRead);
				$display("MemWrite: %b", MemWrite);
				$display("MemtoReg: %b", MemtoReg);
				$display("IRwrite: %b", IRwrite);
				$display("PCSource: %b", PCSource);
				$display("ALUOp: %b", ALUOp);
				$display("ALUSrcB: %b", ALUSrcB);
				$display("ALUSrcA: %b", ALUSrcA);
				$display("RegWrite: %b", RegWrite);
				$display(" ");
				// 4th State
				#20
				$display("State = %d", state);
				
				 
			  $finish;
       
    end
	
	
endmodule
		