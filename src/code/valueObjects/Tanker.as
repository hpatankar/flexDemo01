package code.valueObjects
{
	import code.constants.ApplicationConstants;
	
	public class Tanker
	{
		// member variables
		private var pTankerCode:String;
		private var pTankerCarrierCode:String;
		private var pTankerCarrierName:String;
		private var pISTankerLocked:Boolean;
		private var pISTankerActive:Boolean;
		private var pTankerLatitude:Number;
		private var pTankerLongitude:Number;
		//
		public function Tanker(aTankerCreationObject:Object)
		{
			pTankerCode = String(aTankerCreationObject.TANKER_CODE);
			pTankerCarrierCode = String(aTankerCreationObject.TANKER_CARR_CODE);
			pTankerCarrierName = String(aTankerCreationObject.TANKER_CARR_NAME);
			pISTankerLocked = (String(aTankerCreationObject.TANKER_LOCK)=="Y") ? true : false;
			pISTankerActive = (String(aTankerCreationObject.TANKER_ACTIVE)=="Y") ? true : false;
			pTankerLatitude =  parseFloat(String(aTankerCreationObject.TANKER_LATITUDE));
			pTankerLongitude =  parseFloat(String(aTankerCreationObject.TANKER_LONGITUDE));
		}
		//
		public function get tankerCode():String
		{
			return pTankerCode;
		}
		//
		public function get tankerCarrierCode():String
		{
			return pTankerCarrierCode;
		}
		//
		//
		public function get tankerCarrierName():String
		{
			return pTankerCarrierName;
		}
		//
		public function get isTankerLocked():Boolean
		{
			return pISTankerLocked;
		}
		//
		public function get isTankerActive():Boolean
		{
			return pISTankerActive;
		}
		//
		
		public function get tankerLatitude():Number
		{
			if(!pTankerLatitude)
			{
				pTankerLatitude = ApplicationConstants.SYDNEY_LATITUDE;
			}
			return pTankerLatitude;
		}
		//
		public function get tankerLongitude():Number
		{
			if(!pTankerLongitude)
			{
				pTankerLongitude = ApplicationConstants.SYDNEY_LONGITUDE;
			}
			return pTankerLongitude;
		}
	}
}