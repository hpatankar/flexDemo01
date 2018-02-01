package code.business.commands
{
	import code.business.events.TankerSelectEvent;
	import code.model.TankerTestModelLocator;
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class TankerSelectCommand implements Command
	{
		public function TankerSelectCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var modelLocator:TankerTestModelLocator = TankerTestModelLocator.instance() 
			modelLocator.selectedTanker = TankerSelectEvent(event).selectedTanker;
		}
		
	}
}