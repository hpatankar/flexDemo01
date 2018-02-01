package code.business.events
{
	import code.valueObjects.Tanker;
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class TankerSelectEvent extends CairngormEvent
	{
		//
		public static const EVENT_ID:String = "tankerSelect";
		//
		private var pSelectedTanker:Tanker
		//
		public function TankerSelectEvent(aSelectedTanker:Tanker)
		{
			super(TankerSelectEvent.EVENT_ID);
			pSelectedTanker = aSelectedTanker;
		}
		//
		public function get selectedTanker():Tanker
		{
			return pSelectedTanker;
		}
	}
}