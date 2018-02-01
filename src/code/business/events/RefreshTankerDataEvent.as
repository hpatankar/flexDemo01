package code.business.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class RefreshTankerDataEvent extends CairngormEvent
	{
		//
		public static const EVENT_ID:String = "refreshTankerData";
		//
		private var pUserSessionID:String;
		//
		public function RefreshTankerDataEvent(aUserSessionID:String)
		{
			super(RefreshTankerDataEvent.EVENT_ID);
			pUserSessionID = aUserSessionID;
		}
		//
		public function get userSessionID():String
		{
			return pUserSessionID;
		}
	}
}