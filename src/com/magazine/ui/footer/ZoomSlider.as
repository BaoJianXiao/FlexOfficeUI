package com.magazine.ui.footer
{
	import com.magazine.ui.footer.event.SliderValueChangeEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	
	import spark.components.HGroup;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class ZoomSlider extends HGroup
	{
		private var _value:Number = 100;
		[Bindable]
		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			_value = value;
		}

		private var min:Number = 10;
		private var max:Number = 500;
		private var button:SliderButton;
		public function ZoomSlider()
		{
			super();
			button = new SliderButton();
			button.height = height - 20;
			button.width = 5;
			button.x = (width - button.width)/2 - 2;
			button.y = 10;
			addElement(button);
			var _this:ZoomSlider = this;
			button.addEventListener(MouseEvent.MOUSE_DOWN, function(event:MouseEvent):void{
				addEventListener(Event.ENTER_FRAME, moveHandler);
				button.startDrag(false, new Rectangle(18,10,_this.width - 40, _this.height - 40));
			});
			button.addEventListener(MouseEvent.MOUSE_UP, function(event:MouseEvent):void{
				removeEventListener(Event.ENTER_FRAME, moveHandler);
				button.stopDrag();
			});
			button.addEventListener(MouseEvent.RELEASE_OUTSIDE, function(event:MouseEvent):void{
				removeEventListener(Event.ENTER_FRAME, moveHandler);
				button.stopDrag();
			});
			
			
		}
		
		protected function moveHandler(event:Event):void
		{
			if(button.x < (width - button.width)/2){
				value = Math.floor((90/(this.width/2 - linePadding))*(button.x - 18) + 10);
			}else if(button.x == (width - button.width)/2 - 2){
				value = 100;
			}else{
				value = Math.floor((400/(this.width/2 - linePadding))*(button.x - ((width - button.width)/2) + 2) + 90);
			}
			dispatchEvent(new SliderValueChangeEvent(value));
			//label.label = value + " %";
		}
		
		private var linePadding:Number = 20;

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			button.height = height - 20;
			button.y = 10;
			if(value == 100){
				button.x = (width - button.width)/2 - 2;
			}
			
			graphics.clear();
			graphics.lineStyle(1,0xFFFFFF,0.6);
			graphics.moveTo(linePadding, height/2);
			graphics.lineTo(width - linePadding, height/2);
			graphics.moveTo(width/2, height/2 - 4);
			graphics.lineTo(width/2, height/2 +4);
		}
	}
}