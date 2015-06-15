package com.magazine.ui.button
{	
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import mx.controls.Image;
	
	import spark.core.SpriteVisualElement;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class IconButton extends SpriteVisualElement
	{
		private var _noColorChange:Boolean = false;

		public function get noColorChange():Boolean
		{
			return _noColorChange;
		}

		public function set noColorChange(value:Boolean):void
		{
			_noColorChange = value;
		}

		private var _noBackColor:Boolean;

		public function get noBackColor():Boolean
		{
			return _noBackColor;
		}

		public function set noBackColor(value:Boolean):void
		{
			_noBackColor = value;
		}

		private var _backColorFix:Boolean = false;

		public function get backColorFix():Boolean
		{
			return _backColorFix;
		}

		public function set backColorFix(value:Boolean):void
		{
			_backColorFix = value;
		}


		public function IconButton(icon:Class=null, width:int = 25, height:int = 25)
		{
			this.width = width;
			this.height = height;
			var ico:Image = new Image();
			ico.source = icon;
			ico.width = width;
			ico.height = height;
			ico.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			ico.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			ico.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			ico.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			addChild(ico);
		}
		
		protected function mouseUpHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.6;
		}
		
		protected function mouseDownHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.3;
		}
		
		protected function mouseOutHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 1;
			if(noColorChange){
				return;
			}
			if(!noBackColor){
				this.graphics.clear();
			}
			var rOffset:Number = transform.colorTransform.blueOffset  - 36;
			var gOffset:Number = transform.colorTransform.blueOffset  - 163;
			var bOffset:Number = transform.colorTransform.blueOffset  - 242;
			(event.target as Image).transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, gOffset, bOffset, 0);
		}
		
		protected function mouseOverHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.6;
			if(noColorChange){
				return;
			}
			if(!noBackColor){
				this.graphics.clear();
				this.graphics.beginFill(0xd5e1f2);
				if(!backColorFix){
					this.graphics.drawRect(-4,0,width + 8,height);
				}else{
					this.graphics.drawRect(0,0,width,height);
				}
				this.graphics.endFill();
			}
			var rOffset:Number = transform.colorTransform.blueOffset  + 36;
			var gOffset:Number = transform.colorTransform.blueOffset  + 163;
			var bOffset:Number = transform.colorTransform.blueOffset  + 242;
			(event.target as Image).transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, gOffset, bOffset, 0);
		}
	}
}