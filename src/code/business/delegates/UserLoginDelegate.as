package code.business.delegates
{
	import code.business.events.UserLoginClickedEvent;
	import code.model.TankerTestModelLocator;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flash.net.URLRequestMethod;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	//
	public class UserLoginDelegate
	{
		//
		private var pLocator:ServiceLocator = ServiceLocator.getInstance();
		private var pService:HTTPService;
		private var pResponder:IResponder;
		//
		public function UserLoginDelegate(aResponder:IResponder)
		{
			pResponder = aResponder;
		}
		//
		public function loginUser(aEvent:UserLoginClickedEvent):void
		{
			var token:AsyncToken;
			if(TankerTestModelLocator.instance().isOnline)
			{
				pService = pLocator.getHTTPService("userLoginOnline");
				pService.method = URLRequestMethod.POST;
				var requestObject:Object = new Object();
				requestObject.usr = aEvent.userName;
				requestObject.pwd = aEvent.password;
				requestObject.oput = "XML";
				requestObject.lang = "ENG";
				token = pService.send(requestObject);
				token.addResponder(pResponder);
			}
			else
			{
				/*
				// use code below to login just by clicking login button
				pService = pLocator.getHTTPService("userLoginOffline");
				token = pService.send()
				token.addResponder(pResponder);
				*/
				
				if((aEvent.userName == "9999") && (aEvent.password == "12345"))
				{
					pService = pLocator.getHTTPService("userLoginOffline");
					token = pService.send()
					token.addResponder(pResponder);
				}
				else
				{
					Alert.show("incorrect username or password" ,"Error");
				}
				
			}
		}
	}
}