package code.business.commands
{
	import code.business.delegates.UserLoginDelegate;
	import code.business.events.UserLoginClickedEvent;
	import code.constants.ApplicationConstants;
	import code.model.TankerTestModelLocator;
	import code.valueObjects.SessionLoginDetails;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class UserLoginClickedCommand implements ICommand
	{
		public function UserLoginClickedCommand()
		{
			
		}
		//
		public function execute(event:CairngormEvent):void
		{
			var responder:Responder = new Responder(onLoginSuccess,onLoginError);
			var userLoginDelegate:UserLoginDelegate = new UserLoginDelegate(responder);
			userLoginDelegate.loginUser(event as UserLoginClickedEvent);
		}
		//
		private function onLoginSuccess(event:ResultEvent):void
		{
			var sessionLoginDetails:SessionLoginDetails = new SessionLoginDetails(event.result as XML);
			if(sessionLoginDetails.messageCode == "0")
			{
				var model:TankerTestModelLocator = TankerTestModelLocator.instance();
				model.userSessionDetails = sessionLoginDetails;
				model.viewState = ApplicationConstants.LOADING_SCREEN;
			}
			else
			{
				Alert.show("incorrect username or password" ,"Error");
			}
		}
		//
		private function onLoginError(event:FaultEvent):void
		{
			Alert.show(event.fault.faultDetail, "Error");
		}
	}
}