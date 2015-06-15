package com.magazine.ui.menu.sub
{
	import com.magazine.data.ApplicationData;
	import com.magazine.ui.button.LargeIconButton;
	
	import spark.components.HGroup;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class EditGroup extends HGroup
	{
		[Embed (source="assets/icon/document-50.png")]
		[Bindable]
		public var newIcon:Class;
		
		[Embed (source="assets/icon/opened_folder-50.png")]
		[Bindable]
		public var openIcon:Class;
		
		private var _applicationData:ApplicationData;
		public function set applicationData(value:ApplicationData):void
		{
			_applicationData = value;
		}
		
		public function get applicationData():ApplicationData
		{
			return _applicationData;
		}
		
		public function EditGroup()
		{
			super();
			height = 140;
			percentWidth = 100;
			var newBtn:LargeIconButton = new LargeIconButton(newIcon,"搜索");
			addElement(newBtn);
			var openBtn:LargeIconButton = new LargeIconButton(openIcon,"替换");
			addElement(openBtn);
		}
	}
}