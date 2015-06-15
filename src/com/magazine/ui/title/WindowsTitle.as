package com.magazine.ui.title
{
	import com.magazine.ui.button.IconButton;
	import com.magazine.ui.event.AppWindowsTitleEvent;
	import com.magazine.ui.menu.Menu;
	import com.magazine.ui.menu.event.MenuItemSelectedEvent;
	
	import flash.display.GradientType;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	import mx.controls.Image;
	
	import spark.components.Group;
	import spark.components.Label;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	[Event(name="titleCloseClick", type="com.magazine.ui.event.AppWindowsTitleEvent")]
	[Event(name="titleMaxClick", type="com.magazine.ui.event.AppWindowsTitleEvent")]
	[Event(name="titleMinClick", type="com.magazine.ui.event.AppWindowsTitleEvent")]
	[Event(name="selectedEvent", type="com.magazine.ui.menu.event.MenuItemSelectedEvent")]
	public class WindowsTitle extends Group
	{
		private var matrix:Matrix = new Matrix();

		private var close:IconButton;
		private var maxBtn:IconButton;
		private var minBtn:IconButton;
		private var _title:Label;

		public function get title():Label
		{
			return _title;
		}

		public function set title(value:Label):void
		{
			_title = value;
		}

		private var _headText:String;

		public function get headText():String
		{
			return _headText;
		}

		public function set headText(value:String):void
		{
			_headText = value;
			if(title){
				title.text = _headText;
			}
		}

		private var _menu:Menu;
		public function get menu():Menu
		{
			return _menu;
		}
		public function set menu(value:Menu):void
		{
			_menu = value;
		}

		[ Embed (source="assets/icon/cancel-25.png")]
		[ Bindable ]
		public var closeIcon:Class;
		[ Embed (source="assets/icon/max_win-25.png")]
		[ Bindable ]
		public var maxIcon:Class;
		[ Embed (source="assets/icon/minus-25.png")]
		[ Bindable ]
		public var minIcon:Class;
		
		[ Embed (source="assets/icon/icon-25.png")]
		[ Bindable ]
		public var logoIcon:Class;
		
		[ Embed (source="assets/icon/opened_folder-25.png")]
		[ Bindable ]
		public var openIcon:Class;

		[ Embed (source="assets/icon/document-25.png")]
		[ Bindable ]
		public var createIcon:Class;
		
		public function WindowsTitle()
		{
			super();
			close = new IconButton(closeIcon);
			addElement(close);
			close.top = 8;
			close.right = 8;
			close.addEventListener(MouseEvent.CLICK, closeClickHandler);
			
			maxBtn = new IconButton(maxIcon);
			addElement(maxBtn);
			maxBtn.top = 8;
			maxBtn.right = 40;
			maxBtn.addEventListener(MouseEvent.CLICK,maxClickHandler);
			
			minBtn = new IconButton(minIcon);
			addElement(minBtn);
			minBtn.top = 8;
			minBtn.right = 73;
			minBtn.addEventListener(MouseEvent.CLICK,minClickHandler);
			
			title = new Label();
			title.height = 40;
			title.top = 12;
			title.horizontalCenter = 0;
			title.setStyle("fontSize",16);
			//title.setStyle("fontWeight","bold");
			title.setStyle("color",0xCCCCCC);
			title.doubleClickEnabled = true;
			title.addEventListener(MouseEvent.DOUBLE_CLICK, maxClickHandler);
			addElement(title);
			
			_menu = new Menu();
			_menu.bottom = 0;
			_menu.addEventListener(MenuItemSelectedEvent.SelectedEvent, menuSelectedHandler);
			addElement(_menu);
			
			var img:Image = new Image();
			img.source = logoIcon;
			img.left = 10;
			img.top = 12;
			addElement(img);
			
			var openBtn:IconButton = new IconButton(openIcon);
			addElement(openBtn);
			openBtn.alpha = 0.2;
			openBtn.noBackColor = true;
			openBtn.top = 12;
			openBtn.left = 50;
			
			var createBtn:IconButton = new IconButton(createIcon);
			addElement(createBtn);
			createBtn.alpha = 0.2;
			createBtn.noBackColor = true;
			createBtn.top = 12;
			createBtn.left = 88;
		}
		
		protected function menuSelectedHandler(event:MenuItemSelectedEvent):void
		{
			dispatchEvent(event.clone());
		}
		
		protected function minClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new AppWindowsTitleEvent(AppWindowsTitleEvent.TitleMinClick));
		}
		
		protected function maxClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new AppWindowsTitleEvent(AppWindowsTitleEvent.TitleMaxClick));
		}
		
		protected function closeClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new AppWindowsTitleEvent(AppWindowsTitleEvent.TitleCloseClick));
		}		
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			matrix.createGradientBox(width,height,Math.PI/2);
			graphics.clear();
			graphics.lineStyle(1,0x2b579a);
			graphics.beginGradientFill(GradientType.LINEAR, [0xFFFFFF,0xFFFFFF],[1,1],[0,255],matrix);
			graphics.drawRect(0,0,width-1, height);
			graphics.endFill();
			graphics.moveTo(0, 0);
			graphics.lineStyle(4,0x2b579a, 0.5);
			graphics.lineTo(width, 0);
			graphics.lineStyle(1,0xe2e2e2);
			graphics.moveTo(0, height);
			graphics.lineTo(width, height);
		}
		
	}
}