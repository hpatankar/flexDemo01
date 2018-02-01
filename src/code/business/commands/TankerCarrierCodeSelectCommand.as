package code.business.commands
{
	import code.business.events.TankerCarrierCodeSelectEvent;
	import code.constants.ApplicationConstants;
	import code.model.TankerTestModelLocator;
	import code.valueObjects.Tanker;
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;

	public class TankerCarrierCodeSelectCommand implements Command
	{
		public function TankerCarrierCodeSelectCommand()
		{
		}
		//
		public function execute(event:CairngormEvent):void
		{
			var modelLocator:TankerTestModelLocator = TankerTestModelLocator.instance();
			var tankerDisplayDetailsList:ArrayCollection = new ArrayCollection();
			var tankerLoadedDetailsList:ArrayCollection = modelLocator.tankerLoadedDetailsList;
			var selectedTankerCarrierCode:String = TankerCarrierCodeSelectEvent(event).selectedTankerCarrierCode;
			// if all carriers are selected set display list to all carriers loaded details
			if(selectedTankerCarrierCode == ApplicationConstants.ALL_CARRIERS)
			{
				modelLocator.tankerDisplayDetailsList = modelLocator.tankerLoadedDetailsList;
			}
			else
			{
				for( var i:uint = 0; i < tankerLoadedDetailsList.length ;i++)
				{
					var tanker:Tanker = tankerLoadedDetailsList.getItemAt(i) as Tanker;
					if(tanker.tankerCarrierCode == selectedTankerCarrierCode)
					{
						tankerDisplayDetailsList.addItem(tanker);
					}
				}
				modelLocator.tankerDisplayDetailsList = tankerDisplayDetailsList;
			}
		}
		
	}
}