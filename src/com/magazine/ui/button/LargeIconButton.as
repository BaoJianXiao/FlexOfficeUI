package com.magazine.ui.button
{
	import com.magazine.action._interface.IAction;
	
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import mx.controls.Image;
	
	import spark.components.Group;
	import spark.components.Label;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class LargeIconButton extends Group
	{
		private var label:Label;
		private var _action:IAction;
		public function LargeIconButton(icon:Class=null, text:String = "", width:int = 50)
		{
			super();
			this.width = 80;
			this.height = 142;
			ico = new Image();
			ico.source = icon;
			ico.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			ico.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			ico.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			ico.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			ico.alpha = 0.4;
			ico.x = 15;
			ico.y = 25;
			addElement(ico);
			var label:Label = new Label();
			label.percentWidth = 100;
			label.text = text;
			label.setStyle("textAlign","center");
			addElement(label);
			label.y = 95;
		}
		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		
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

		private var ico:Image;
		
		public function get noBackColor():Boolean
		{
			return _noBackColor;
		}
		
		public function set noBackColor(value:Boolean):void
		{
			_noBackColor = value;
		}
		
		protected function mouseUpHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.4;
		}
		
		protected function mouseDownHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.1;
		}
		
		protected function mouseOutHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.4;
			if(noColorChange){
				return;
			}
			if(!noBackColor){
				this.graphics.clear();
			}
			var rOffset:Number = transform.colorTransform.blueOffset  - 36;
			var gOffset:Number = transform.colorTransform.blueOffset  - 163;
			var bOffset:Number = transform.colorTransform.blueOffset  - 242;
			(event.target as Image).transform.colorTransform = new ColorTransform(1, 1, 1, 0.4, rOffset, gOffset, bOffset, 0);
		}
		
		protected function mouseOverHandler(event:MouseEvent):void
		{
			(event.target as Image). alpha = 0.1;
			if(noColorChange){
				return;
			}
			if(!noBackColor){
				this.graphics.clear();
				this.graphics.beginFill(0xd5e1f2);
				this.graphics.drawRect(5,5,width - 10,height -10);
				this.graphics.endFill();
			}
			var rOffset:Number = transform.colorTransform.blueOffset  + 36;
			var gOffset:Number = transform.colorTransform.blueOffset  + 163;
			var bOffset:Number = transform.colorTransform.blueOffset  + 242;
			(event.target as Image).transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, gOffset, bOffset, 0);
		}

		public function get action():IAction
		{
			return _action;
		}

		public function set action(value:IAction):void
		{
			_action = value;
			addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		protected function clickHandler(event:MouseEvent):void
		{
			action.execute();
		}
		
	}
}