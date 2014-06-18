package as3hx.parsers;

import as3hx.As3.Const;
import as3hx.As3.Expr;
import as3hx.Parser.Types;
import as3hx.Tokenizer;
import massive.munit.Assert;


class ObjectParserTest 
{
	
	
	public function new() 
	{
	}
	
	@Test
	public function testSimpleObject():Void
	{
		var tokenizer = new Tokenizer(new haxe.io.StringInput('{key:"value"}'));
		var tk = tokenizer.token();
		Assert.areEqual(tk, TBrOpen);
		
		var types: Types = {
            seen : [],
            defd : [],
            gen : []
        }
		var cfg = new as3hx.Config();
		
		var result = ObjectParser.parse(tokenizer, types, cfg);
		
		var obj = result.getParameters()[0][0];
		Assert.areEqual(obj.name, 'key');
		
		var exp:Expr = obj.e;
		var str:Const = exp.getParameters()[0];
		Assert.areEqual(str.getParameters()[0], 'value');
	}
}