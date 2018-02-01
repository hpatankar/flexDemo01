package code.valueObjects
{
	public class SessionLoginDetails
	{
		// member variables
		private var pMessageCode:String;
		private var pMessageDescription:String;
		private var pMessageBody:String;
		private var pUserCode:String;
		private var pUserSession:String;
		private var pUserLanguage:String;
		private var pSessionLoginData:XML
		//
		public function SessionLoginDetails(aSessionLoginData:XML)
		{
			pSessionLoginData = aSessionLoginData;
		}
		//
		public function get messageCode():String
		{
			if(null == pMessageCode)
			{
				pMessageCode = pSessionLoginData..MSG_CODE;
			}
			return pMessageCode;
		}
		//
		public function get messageDescription():String
		{
			if(null == pMessageDescription)
			{
				pMessageDescription = pSessionLoginData..MSG_DESC;
			}
			return pMessageDescription;
		}
		//
		public function get messageBody():String
		{
			if(null == pMessageBody)
			{
				pMessageBody = pSessionLoginData..MSG_BODY;
			}
			return pMessageBody;
		}
		//
		public function get userCode():String
		{
			if(null == pUserCode)
			{
				pUserCode = pSessionLoginData..USER_CODE;
			}
			return pUserCode;
		}
		//
		public function get userSession():String
		{
			if(null == pUserSession)
			{
				pUserSession = pSessionLoginData..USER_SESSION;
			}
			return pUserSession;
		}
		//
		public function get userLanguage():String
		{
			if(null == pUserLanguage)
			{
				pUserLanguage = pSessionLoginData..USER_LANG;
			}
			return pUserLanguage;
		}
	}
}
//
//
//
//
//
//