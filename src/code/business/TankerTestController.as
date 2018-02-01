package code.business
{
	import code.business.commands.RefreshTankerDataCommand;
	import code.business.commands.TankerCarrierCodeSelectCommand;
	import code.business.commands.TankerSelectCommand;
	import code.business.commands.UserLoginClickedCommand;
	import code.business.events.RefreshTankerDataEvent;
	import code.business.events.TankerCarrierCodeSelectEvent;
	import code.business.events.TankerSelectEvent;
	import code.business.events.UserLoginClickedEvent;
	
	import com.adobe.cairngorm.control.FrontController;

	public class TankerTestController extends FrontController
	{
		public function TankerTestController()
		{
			super();
			this.addCommand(UserLoginClickedEvent.EVENT_ID,UserLoginClickedCommand);
			this.addCommand(RefreshTankerDataEvent.EVENT_ID,RefreshTankerDataCommand);
			this.addCommand(TankerCarrierCodeSelectEvent.EVENT_ID,TankerCarrierCodeSelectCommand);
			this.addCommand(TankerSelectEvent.EVENT_ID,TankerSelectCommand);
		}
		
	}
}