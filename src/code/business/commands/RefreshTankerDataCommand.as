package code.business.commands
{
	import code.business.delegates.TankerDataDelegate;
	import code.business.events.RefreshTankerDataEvent;
	import code.constants.ApplicationConstants;
	import code.model.TankerTestModelLocator;
	import code.valueObjects.Tanker;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class RefreshTankerDataCommand implements ICommand
	{
		public function RefreshTankerDataCommand()
		{
		}
		//
		public function execute(event:CairngormEvent):void
		{
			var responder:Responder = new Responder(onTankerDataSuccess,onTankerDataFault);
			var tankerDataDelegate:TankerDataDelegate = new TankerDataDelegate(responder);
			tankerDataDelegate.refreshTankerData(event as RefreshTankerDataEvent);
		}
		//
		private function onTankerDataSuccess(aEvent:ResultEvent):void
		{
			var tankerRaw:ArrayCollection = aEvent.result.OMEGA_XML.TANKER_LIST.TANKER;
			var tankerFinal:ArrayCollection = new ArrayCollection();
			var tankerCarrierCodeList:ArrayCollection = new ArrayCollection();
			tankerCarrierCodeList.addItem(ApplicationConstants.ALL_CARRIERS);
			for(var i:uint = 0; i<tankerRaw.length; i++)
			{
				var tankerCreationObject:Object = tankerRaw.getItemAt(i);
				var tanker:Tanker = new Tanker(tankerCreationObject);
				var tankerCarrierCode:String = tanker.tankerCarrierCode
				tankerFinal.addItem(tanker);
				if(!tankerCarrierCodeList.contains(tankerCarrierCode))
				{
					tankerCarrierCodeList.addItem(tankerCarrierCode);
				}
			}
			var modelLocator:TankerTestModelLocator = TankerTestModelLocator.instance();
			modelLocator.tankerLoadedDetailsList = modelLocator.tankerDisplayDetailsList = tankerFinal;
			modelLocator.tankerCarrierCodeList = tankerCarrierCodeList;
			modelLocator.viewState = ApplicationConstants.VIEW_STATE_TANKER_OVERVIEW;
		}
		//
		private function onTankerDataFault(aEvent:FaultEvent):void
		{
			Alert.show(aEvent.fault.faultDetail, "Tanker Data Error");
		}
	}
}