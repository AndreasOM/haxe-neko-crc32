import haxe.Int32;
import haxe.macro.Expr;

class TestCrc32
{
    static function main()
	{
        neko.Lib.print("TestCrc32\n");

		printInt32AsHex( crcA() );
		printInt32AsHex( TestCrc32.macroA() );
    }

	static function crcA():Int32
	{
		var bytes = haxe.io.Bytes.ofString( "ABCD" );
		return neko.zip.CRC32.encode( bytes );
	}

	
	@:macro static function macroA()
	{
		var crc = crcA();
	
		printInt32AsHex( crc );

		var pos = haxe.macro.Context.currentPos();
        var e:Expr = haxe.macro.Context.parse( makeInt32( crc ), pos );

		return e;
	}

	static function printInt32AsHex( int32:Int32 )
	{
		var mask = Int32.make(0x0000, 0x00FF);
		
		var s = "0x";
		for( i in 0...4 )
		{
			var b = Int32.and( int32, mask );
			var nb = Int32.toInt( b );
			s += StringTools.hex( nb );
			int32 = Int32.shr( int32, 8 );		
		}
		neko.Lib.print( s+"\n" );
	
	}
	
	static function makeInt32( int32:Int32 ):String
	{
		var mask = Int32.make(0x0000, 0xFFFF);

		var s = "Int32.make(0x";
		s += StringTools.hex( Int32.toInt( Int32.and( int32, mask ) ) );
		s += ", 0x";
		s += StringTools.hex( Int32.toInt( Int32.and( Int32.shr( int32, 16 ), mask ) ) );
		s += ")";
		return s;
	}
}

