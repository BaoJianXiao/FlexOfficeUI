package com.magazine.ui.container
{
	import com.magazine.ui.button.IconButton;
	import com.magazine.ui.footer.event.CatalogiesClickEvent;
	
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	import mx.controls.TextInput;
	
	import spark.components.Label;
	import spark.components.VGroup;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	[Event(name="catalogiesClickToggleEvent", type="com.magazine.ui.footer.event.CatalogiesClickEvent")]
	public class Catalogies extends VGroup
	{
		[Embed (source="assets/icon/close-16.png")]
		[Bindable]
		public var closeIcon:Class;
		
		private var matrix:Matrix = new Matrix();
		private var _positionMax:Number;
		
		public function get positionMax():Number
		{
			return _positionMax;
		}
		
		public function set positionMax(value:Number):void
		{
			_positionMax = value;
		}
		
		private var _positionMin:Number;
		
		public function get positionMin():Number
		{
			return _positionMin;
		}
		
		public function set positionMin(value:Number):void
		{
			_positionMin = value;
		}
		public function Catalogies()
		{
			super();
			this.gap = 10;
			this.paddingLeft = 20;
			this.paddingRight = 20;
			this.paddingTop = 20;
			
			var closeBtn:IconButton = new IconButton(closeIcon,16,16);
			closeBtn.backColorFix = true;
			addElement(closeBtn);
			closeBtn.includeInLayout = false;
			closeBtn.y = 15;
			closeBtn.x = 270;
			closeBtn.addEventListener(MouseEvent.CLICK, closeClickHandler);
			
			var title:Label = new Label();
			title.text = "目录";
			title.setStyle("fontWeight","bold");
			title.setStyle("fontSize",26);
			title.percentWidth = 100;
			//title.setStyle("paddingTop",15);
			//title.setStyle("paddingLeft",10);
			//title.setStyle("textAlign","center");
			addElement(title);
			
			var searchInput:TextInput = new TextInput();
			searchInput.percentWidth = 100;
			searchInput.height = 30;
			searchInput.left = 10;
			//searchInput.setStyle("fontFamily","SourceSansPro");
			searchInput.setStyle("fontSize",20);
			addElement(searchInput);
		}
		
		protected function closeClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new CatalogiesClickEvent());
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			matrix.createGradientBox(width-2,height,Math.PI/2);
			graphics.clear();
			graphics.beginGradientFill(GradientType.LINEAR, [0xFFFFFF,0xf0f0f0],[1,1],[0,255],matrix);
			graphics.drawRect(0,0,width-2, height);
			graphics.endFill();
			graphics.lineStyle(1,0xe2e2e2);
			graphics.moveTo(width-2,0);
			graphics.lineTo(width-2, height);
			//graphics.moveTo(10,50);
			//graphics.lineTo(width-20,50);
		}
	}
}