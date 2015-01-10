/****
* 
****/


package aglsl; 

import aglsl.assembler.AGALMiniAssembler; 
import flash.display3D.Context3DProgramType;
import flash.utils.ByteArray;

class AGLSLCompiler {

	public var glsl : String;
	public function new() {  
	}

	public function compile(programType : Context3DProgramType, source : String) : String {
		var agalMiniAssembler : AGALMiniAssembler = new AGALMiniAssembler();
		agalMiniAssembler.assemble(programType, source);
		var data : ByteArray = agalMiniAssembler.agalcode;
		var tokenizer : AGALTokenizer = new AGALTokenizer();
		var description : Description = tokenizer.decribeAGALByteArray(data);
		var parser : AGLSLParser = new AGLSLParser();
		this.glsl = parser.parse(description);
		return this.glsl;
	}

}

