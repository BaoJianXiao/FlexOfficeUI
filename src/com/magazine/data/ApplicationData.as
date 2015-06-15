package com.magazine.data
{
	import com.magazine.action._interface.IPage;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class ApplicationData
	{
		public function ApplicationData()
		{
		}
		
		private var _tempFolder:String;
		private var _saveFilePath:String;
		
		private var _pages:Vector.<IPage>;
		private var _fileData:XML;

		public function get tempFolder():String
		{
			return _tempFolder;
		}

		public function set tempFolder(value:String):void
		{
			_tempFolder = value;
		}

		public function get saveFilePath():String
		{
			return _saveFilePath;
		}

		public function set saveFilePath(value:String):void
		{
			_saveFilePath = value;
		}

		public function get pages():Vector.<IPage>
		{
			return _pages;
		}

		public function set pages(value:Vector.<IPage>):void
		{
			_pages = value;
		}

		public function get fileData():XML
		{
			return _fileData;
		}

		public function set fileData(value:XML):void
		{
			_fileData = value;
		}


	}
}