package com.complexless.utils
{
	public class ScoreUtils
	{
		public var ftrfeatures:String='0';
		public var insidespread:String='0';
		public var mainbeamleft:String='0';
		public var mainbeamrigth:String='0';
		public var Typicalpointleft1:String='0';
		public var Typicalpointrigth1:String='0';
		public var Typicalpointleft2:String='0';
		public var Typicalpointrigth2:String='0';
		public var Typicalpointleft3:String='0';
		public var Typicalpointrigth3:String='0';
		public var Typicalpointleft4:String='0';
		public var Typicalpointrigth4:String='0';
		public var Typicalpointleft5:String='0';
		public var Typicalpointrigth5:String='0';
		public var Typicalpointleft6:String='0';
		public var Typicalpointrigth6:String='0';
		public var Typicalpointleft7:String='0';
		public var Typicalpointrigth7:String='0';
		public var Typicalpointleft8:String='0';
		public var Typicalpointrigth8:String='0';
		public var Typicalpointleft9:String='0';
		public var Typicalpointrigth9:String='0';
		public var Typicalpointleft10:String='0';
		public var Typicalpointrigth10:String='0';
		public var Circumferenceleft1:String='0';
		public var Circumferencerigth1:String='0';
		public var Circumferenceleft2:String='0';
		public var Circumferencerigth2:String='0';
		public var Circumferenceleft3:String='0';
		public var Circumferencerigth3:String='0';
		public var Circumferenceleft4:String='0';
		public var Circumferencerigth4:String='0';
		public var Abnormalpointleft1:String='0';
		public var Abnormalpointrigth1:String='0';
		public var Abnormalpointleft2:String='0';
		public var Abnormalpointrigth2:String='0';
		public var Abnormalpointleft3:String='0';
		public var Abnormalpointrigth3:String='0';
		public var Abnormalpointleft4:String='0';
		public var Abnormalpointrigth4:String='0';
		public var Abnormalpointleft5:String='0';
		public var Abnormalpointrigth5:String='0';
		public var Abnormalpointleft6:String='0';
		public var Abnormalpointrigth6:String='0';
		public var Abnormalpointleft7:String='0';
		public var Abnormalpointrigth7:String='0';
		public var Abnormalpointleft8:String='0';
		public var Abnormalpointrigth8:String='0';
		public var Abnormalpointleft9:String='0';
		public var Abnormalpointrigth9:String='0';
		public var Abnormalpointleft10:String='0';
		public var Abnormalpointrigth10:String='0';
		public var Abnormalpointleft11:String='0';
		public var Abnormalpointrigth11:String='0';
		public var Abnormalpointleft12:String='0';
		public var Abnormalpointrigth12:String='0';
		public var Abnormalpointleft13:String='0';
		public var Abnormalpointrigth13:String='0';
		public var Abnormalpointleft14:String='0';
		public var Abnormalpointrigth14:String='0';
		public var Abnormalpointleft15:String='0';
		public var Abnormalpointrigth15:String='0';
		public var Abnormalpointleft16:String='0';
		public var Abnormalpointrigth16:String='0';
		public var Abnormalpointleft17:String='0';
		public var Abnormalpointrigth17:String='0';
		public var Abnormalpointleft18:String='0';
		public var Abnormalpointrigth18:String='0';
		public var Abnormalpointleft19:String='0';
		public var Abnormalpointrigth19:String='0';
		public var Abnormalpointleft20:String='0';
		public var Abnormalpointrigth20:String='0';
		
		
		
		public function ScoreUtils()
		{
			
		}
		public  function calculateleft():Number
		{
			var totalleft:String="";
			var suma:Number= Number(mainbeamleft)+
				Number(Typicalpointleft1)+
			
			Number(Typicalpointleft2)+
			
			Number(Typicalpointleft3)+
			
			Number(Typicalpointleft4)+
			
			Number(Typicalpointleft5)+
			
			Number(Typicalpointleft6)+
			
			Number(Typicalpointleft7)+
			
			Number(Typicalpointleft8)+
			
			Number(Typicalpointleft9)+
			
			Number(Typicalpointleft10)+
			
			Number(Circumferenceleft1)+
			
			Number(Circumferenceleft2)+
			
			Number(Circumferenceleft3)+
			
			Number(Circumferenceleft4);
				
			suma=roundDecimals(suma,4);
			return suma;
		}
		public function Tdiference():Number
		{
			var diference:Number=(Math.abs((Number(mainbeamleft)-Number(mainbeamrigth)))+
				Math.abs((Number(Typicalpointleft1)	-	Number(Typicalpointrigth1)))+
				
				Math.abs((Number(Typicalpointleft2)	-	Number(Typicalpointrigth2)))+
				
				Math.abs((Number(Typicalpointleft3)	-	Number(Typicalpointrigth3)))+
				
				Math.abs((Number(Typicalpointleft4)	-	Number(Typicalpointrigth4)))+
				
				Math.abs((Number(Typicalpointleft5)	-	Number(Typicalpointrigth5)))+
				
				Math.abs((Number(Typicalpointleft6)	-	Number(Typicalpointrigth6)))+
				
				Math.abs((Number(Typicalpointleft7)	-	Number(Typicalpointrigth7)))+
				
				Math.abs((Number(Typicalpointleft8)	-	Number(Typicalpointrigth8)))+
				
				Math.abs((Number(Typicalpointleft9)	-	Number(Typicalpointrigth9)))+
				
				Math.abs((Number(Typicalpointleft10)	-	Number(Typicalpointrigth10)))+
				
				Math.abs((Number(Circumferenceleft1)	-	Number(Circumferencerigth1)))+
				
				Math.abs((Number(Circumferenceleft2)	-	Number(Circumferencerigth2)))+
				
				Math.abs((Number(Circumferenceleft3)	-	Number(Circumferencerigth3)))+
				
				Math.abs((Number(Circumferenceleft4)	-	Number(Circumferencerigth4))));
			
			diference=roundDecimals(diference,4);
			return diference;
			
		}
		public  function calculaterigth():Number
		{
			var totalrigth:String="";
			var suma:Number= Number(mainbeamrigth)+
				Number(Typicalpointrigth1)+
				
				Number(Typicalpointrigth2)+
				
				Number(Typicalpointrigth3)+
				
				Number(Typicalpointrigth4)+
				
				Number(Typicalpointrigth5)+
				
				Number(Typicalpointrigth6)+
				
				Number(Typicalpointrigth7)+
				
				Number(Typicalpointrigth8)+
				
				Number(Typicalpointrigth9)+
				
				Number(Typicalpointrigth10)+
				
				Number(Circumferencerigth1)+
				
				Number(Circumferencerigth2)+
				
				Number(Circumferencerigth3)+
				
				Number(Circumferencerigth4);
			
			suma=roundDecimals(suma,4);
			return suma;
		}
		
		public  function calculateabnormal():Number
		{
			var totalrigth:String="";
			var suma:Number= Number(Abnormalpointrigth1)+
				
				Number(Abnormalpointrigth2)+
				
				Number(Abnormalpointrigth3)+
				
				Number(Abnormalpointrigth4)+
				
				Number(Abnormalpointrigth5)+
				
				Number(Abnormalpointrigth6)+
				
				Number(Abnormalpointrigth7)+
				
				Number(Abnormalpointrigth8)+
				
				Number(Abnormalpointrigth9)+
				
				Number(Abnormalpointrigth10)+
				
				Number(Abnormalpointrigth11)+
				
				Number(Abnormalpointrigth12)+
				
				Number(Abnormalpointrigth13)+
				
				Number(Abnormalpointrigth14)+
				
				Number(Abnormalpointrigth15)+
				
				Number(Abnormalpointrigth16)+
				
				Number(Abnormalpointrigth17)+
				
				Number(Abnormalpointrigth18)+
				
				Number(Abnormalpointrigth19)+
				
				Number(Abnormalpointrigth20)+
				
				Number(Abnormalpointleft1)+
				
				Number(Abnormalpointleft2)+
				
				Number(Abnormalpointleft3)+
				
				Number(Abnormalpointleft4)+
				
				Number(Abnormalpointleft5)+
				
				Number(Abnormalpointleft6)+
				
				Number(Abnormalpointleft7)+
				
				Number(Abnormalpointleft8)+
				
				Number(Abnormalpointleft9)+
				
				Number(Abnormalpointleft10)+
				
				Number(Abnormalpointleft11)+
				
				Number(Abnormalpointleft12)+
				
				Number(Abnormalpointleft13)+
				
				Number(Abnormalpointleft14)+
				
				Number(Abnormalpointleft15)+
				
				Number(Abnormalpointleft16)+
				
				Number(Abnormalpointleft17)+
				
				Number(Abnormalpointleft18)+
				
				Number(Abnormalpointleft19)+
				
				Number(Abnormalpointleft20);
				
			
			suma=roundDecimals(suma,4);
			return suma;
		}
		
		public function roundDecimals(value:Number, decimals:int):Number
		{
			var multiple:String = "1";
			for( var i:int = 0; i<decimals; i++)
			{
				multiple += "0";
			}
			var multi:Number = new Number(multiple)
			return ( Math.round( value * multi ) / multi)
		}
		
		
		
	}
}