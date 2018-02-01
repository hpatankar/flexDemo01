package code.valueObjects
{
	public class TankerCarrierCode
	{
		//
		private var pTankerCarrierCode:String;
		//
		public function TankerCarrierCode(aTankerCarrierCode:String)
		{
			pTankerCarrierCode = aTankerCarrierCode;
		}
		//
		public function get tankerCarrierCode():String
		{
			return pTankerCarrierCode;
		}

	}
}