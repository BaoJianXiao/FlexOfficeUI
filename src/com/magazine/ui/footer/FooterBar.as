package com.magazine.ui.footer
{
	import com.magazine.ui.button.IconButton;
	import com.magazine.ui.footer.event.CatalogiesClickEvent;
	import com.magazine.ui.footer.event.SliderValueChangeEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.LinkButton;
	
	import spark.components.HGroup;
	import spark.components.Label;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	[Event(name="catalogiesClickToggleEvent", type="com.magazine.ui.footer.event.CatalogiesClickEvent")]
	[Event(name="valueChangeEvent", type="com.magazine.ui.footer.event.SliderValueChangeEvent")]
	public class FooterBar extends HGroup
	{

		private var pageIngo:LinkButton;

		private var slider:ZoomSlider;
		private var sliderValue:Label;
		[ Embed (source="assets/icon/bookmark-25.png")]
		[ Bindable ]
		public var pagerIcon:Class;
		
		public function FooterBar()
		{
			super();
			var pagerBtn:IconButton = new IconButton(pagerIcon);
			pagerBtn.noColorChange = true;
			pagerBtn.addEventListener(MouseEvent.CLICK, pagerClickHandler);
			addElement(pagerBtn);
			pageIngo = new LinkButton();
			pageIngo.setStyle("color",0xFFFFFF);
			pageIngo.label = "第 1 页，共 1 页";
			pageIngo.addEventListener(MouseEvent.CLICK, pagerClickHandler);
			addElement(pageIngo);
			
			slider = new ZoomSlider();
			slider.includeInLayout = false;
			slider.width = 240;
			slider.y = 0;
			slider.x = width - slider.width - 40;
			slider.height = height;
			slider.addEventListener(SliderValueChangeEvent.ValueChangeEvent, slider_valueChangeEventHandler);
			addElement(slider);
			
			sliderValue = new Label();
			sliderValue.text = slider.value + " %";
			sliderValue.width = 50;
			sliderValue.height = 40
			sliderValue.includeInLayout = false;
			sliderValue.x = width - sliderValue.width - 10;
			sliderValue.y = 0;
			sliderValue.setStyle("color",0xFFFFFF);
			sliderValue.setStyle("verticalAlign","middle");
			sliderValue.setStyle("textAlign","center");
			addElement(sliderValue);
		}
		
		protected function pagerClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new CatalogiesClickEvent());
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			slider.y = 0;
			slider.x = width - slider.width - 60;
			slider.height = height;
			sliderValue.x = width - sliderValue.width - 10;
			sliderValue.y = 0;
			graphics.clear();
			graphics.beginFill(0x2b579a);
			graphics.drawRect(0,0,width, height);
			graphics.endFill();
		}
		
		protected function slider_valueChangeEventHandler(event:SliderValueChangeEvent):void
		{
			sliderValue.text = slider.value + " %";
			var e:SliderValueChangeEvent = new SliderValueChangeEvent(event.value);
			this.dispatchEvent(e);
		}
		
	}
}