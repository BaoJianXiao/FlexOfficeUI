package com.magazine.ui.menu
{
	import com.magazine.data.ApplicationData;
	import com.magazine.ui.button.IconButton;
	import com.magazine.ui.button.LargeIconButton;
	import com.magazine.ui.menu._interface.IMenuGroup;
	import com.magazine.ui.menu.event.MenuItemSelectedEvent;
	import com.magazine.ui.menu.event.SubMenuHiddenEvent;
	
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import spark.components.Group;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	[Event(name="hiddenSlideEvent", type="com.magazine.ui.menu.event.SubMenuHiddenEvent")]
	[Event(name="fixSlideEvent", type="com.magazine.ui.menu.event.SubMenuHiddenEvent")]
	public class SubMenu extends Group
	{
		[ Embed (source="assets/icon/hidden.png")]
		[ Bindable ]
		public var hiddenIcon:Class;
		
		[ Embed (source="assets/icon/fix.png")]
		[ Bindable ]
		public var fixIcon:Class;
		
		private var _fixed:Boolean = true;
		public function get fixed():Boolean
		{
			return _fixed;
		}

		public function set fixed(value:Boolean):void
		{
			_fixed = value;
		}

		private var _position:Number;

		private var fixBtn:IconButton;

		private var hiddenBtn:IconButton;

		public function get position():Number
		{
			return _position;
		}

		public function set position(value:Number):void
		{
			_position = value;
		}
		
		private var _applicationData:ApplicationData;
		public function get applicationData():ApplicationData
		{
			return _applicationData;
		}
		
		public function set applicationData(value:ApplicationData):void
		{
			_applicationData = value;
		}

		private var _dataProvider:Array;
		
		public function get dataProvider():Array
		{
			return _dataProvider;
		}
		
		public function set dataProvider(value:Array):void
		{
			_dataProvider = value;
			
			for each(var item:Object in _dataProvider){
				if(item.group){
					if(item.selected != null){
						(item.group as UIComponent).visible = item.selected;
					}else{
						(item.group as UIComponent).visible = false;
					}
					if(item.group is IMenuGroup){
						(item.group as IMenuGroup).applicationData = applicationData;
					}
					addElement(item.group);
				}
			}
		}
		public function SubMenu()
		{
			super();
			hiddenBtn = new IconButton(hiddenIcon,25,20);
			addElement(hiddenBtn);
			hiddenBtn.bottom = 0;
			hiddenBtn.right = 8;
			hiddenBtn.addEventListener(MouseEvent.CLICK, hiddenClickHandler);
			
			fixBtn = new IconButton(fixIcon,25,20);
			addElement(fixBtn);
			fixBtn.visible = false;
			fixBtn.bottom = 0;
			fixBtn.right = 8;
			fixBtn.addEventListener(MouseEvent.CLICK, fixClickHandler);
		}
		
		protected function fixClickHandler(event:MouseEvent):void
		{
			fixed = true;
			fixBtn.visible = false;
			hiddenBtn.visible = true;
			dispatchEvent(new SubMenuHiddenEvent(SubMenuHiddenEvent.FixSlideEvent));
		}
		protected function hiddenClickHandler(event:MouseEvent):void
		{
			fixed = false;
			fixBtn.visible = true;
			hiddenBtn.visible = false;
			dispatchEvent(new SubMenuHiddenEvent(SubMenuHiddenEvent.HiddenSlideEvent));
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			graphics.clear();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(1,0,width-2, height);
			graphics.endFill();
			graphics.lineStyle(1,0xe2e2e2);
			graphics.moveTo(1, height);
			graphics.lineTo(width-2, height);
		}
	}
}