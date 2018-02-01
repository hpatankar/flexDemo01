package code.business.delegates
{
	import code.business.events.RefreshTankerDataEvent;
	import code.model.TankerTestModelLocator;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class TankerDataDelegate
	{
		//
		private var pLocator:ServiceLocator = ServiceLocator.getInstance();
		private var pResponder:IResponder;
		private var pService:HTTPService;
		//
		public function TankerDataDelegate(aResponder:IResponder)
		{
			pResponder = aResponder;
		}
		//
		public function refreshTankerData(aEvent:RefreshTankerDataEvent):void
		{
			var token:AsyncToken;
			if(TankerTestModelLocator.instance().isOnline)
			{
				pService = pLocator.getHTTPService("tankerDataOnline");
				pService.method = URLRequestMethod.POST;
				var requestObject:Object = new Object();
				requestObject.sess_id = aEvent.userSessionID;
				token = pService.send(requestObject);
				token.addResponder(pResponder);
			}
			else
			{
				pService = pLocator.getHTTPService("tankerDataOffline");
				token = pService.send();
				token.addResponder(pResponder);
			}
		}

	}
}