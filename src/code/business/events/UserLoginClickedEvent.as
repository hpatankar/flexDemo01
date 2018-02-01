package code.business.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class UserLoginClickedEvent extends CairngormEvent
	{
		//
		public static const EVENT_ID:String = "userLoginClicked";
		//
		private var pUserName:String;
		private var pPassword:String
		//
		public function UserLoginClickedEvent(aUserName:String,aPassword:String)
		{
			super(UserLoginClickedEvent.EVENT_ID);
			pUserName = aUserName;
			pPassword = aPassword;
		}
		//
		public function get userName():String
		{
			return pUserName;
		}
		//
		//
		public function get password():String
		{
			return pPassword;
		}
	}
}