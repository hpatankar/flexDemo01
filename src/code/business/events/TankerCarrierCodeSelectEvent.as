package code.business.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class TankerCarrierCodeSelectEvent extends CairngormEvent
	{
		//
		public static const EVENT_ID:String = "tankerCarrierCodeSelect";
		//
		private var pSelectedTankerCarrierCode:String;
		//
		public function TankerCarrierCodeSelectEvent(aSelectedTankerCarrierCode:String)
		{
			super(TankerCarrierCodeSelectEvent.EVENT_ID);
			pSelectedTankerCarrierCode = aSelectedTankerCarrierCode;
		}
		//
		public function get selectedTankerCarrierCode():String
		{
			return pSelectedTankerCarrierCode;
		}
	}
}