package code.model
{
	import code.valueObjects.SessionLoginDetails;
	import code.valueObjects.Tanker;
	
	import com.adobe.cairngorm.model.IModelLocator;
	
	import mx.collections.ArrayCollection;
	[Bindable]
	public class TankerTestModelLocator implements IModelLocator
	{
		//
		private static var pInstance:TankerTestModelLocator;
		//
		private var pIsOnline:Boolean = false;
		private var pSessionLoginDetails:SessionLoginDetails;
		private var pViewState:uint;
		private var pTankerLoadedDetailsList:ArrayCollection;
		private var pTankerDisplayDetailsList:ArrayCollection;
		private var pTankerCarrierCodeList:ArrayCollection;
		private var pSelectedTanker:Tanker;
		//
		public function TankerTestModelLocator(enforcer:SingletonEnforcer)
		{
			
		}
		//
		public static function instance():TankerTestModelLocator
		{
			if(null == pInstance)
			{
				pInstance = new TankerTestModelLocator(new SingletonEnforcer());
			}
			return pInstance;
		}
		//
		public function get isOnline():Boolean
		{
			return pIsOnline;
		}
		//
		public function set userSessionDetails(aValue:SessionLoginDetails):void
		{
			pSessionLoginDetails = aValue;
		}
		//
		public function get userSessionDetails():SessionLoginDetails
		{
			return pSessionLoginDetails;
		}
		//
		public function set viewState(aValue:uint):void
		{
			pViewState = aValue;
		}
		//
		public function get viewState():uint
		{
			return pViewState;
		}
		//
		public function set tankerLoadedDetailsList(aValue:ArrayCollection):void
		{
			pTankerLoadedDetailsList = aValue;
		}
		//
		public function get tankerLoadedDetailsList():ArrayCollection
		{
			return pTankerLoadedDetailsList;
		}
		//
		public function set tankerDisplayDetailsList(aValue:ArrayCollection):void
		{
			pTankerDisplayDetailsList = aValue;
		}
		//
		public function get tankerDisplayDetailsList():ArrayCollection
		{
			return pTankerDisplayDetailsList;
		}
		//
		public function set tankerCarrierCodeList(aValue:ArrayCollection):void
		{
			pTankerCarrierCodeList = aValue;
		}
		//
		public function get tankerCarrierCodeList():ArrayCollection
		{
			return pTankerCarrierCodeList;
		}
		//
		public function set selectedTanker(aValue:Tanker):void
		{
			pSelectedTanker = aValue;
		}
		//
		public function get selectedTanker():Tanker
		{
			return pSelectedTanker;
		}
	}
}
//
internal class SingletonEnforcer{}
//
//
//
//
//
//