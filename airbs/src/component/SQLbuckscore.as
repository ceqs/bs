package component
{
		import flash.data.SQLConnection;
		import flash.data.SQLStatement;
		import flash.errors.SQLError;
		import flash.events.Event;
		import flash.events.SQLErrorEvent;
		import flash.events.SQLEvent;
		import flash.events.TimerEvent;
		import flash.filesystem.File;
		import flash.utils.Timer;
		
		import mx.collections.ArrayCollection;
		import mx.controls.Alert;
		import mx.utils.ObjectUtil;
		
		import org.osmf.events.TimeEvent;
	public class SQLbuckscore
	{
	
		public function SQLbuckscore()
		{
		}
		
		
		
		
		// sqlc is a variable we need to define the connection to our database
		private var sqlc:SQLConnection = new SQLConnection();
		// sqlc is an SQLStatment which we need to execute our sql commands
		private var sqls:SQLStatement = new SQLStatement();
		private var sqlsa:SQLStatement = new SQLStatement();
		// ArrayCollection used as a data provider for the datagrid. It has to be bindable so that data in datagrid changes automatically when we change the ArrayCollection
		[Bindable]
		private var dp:ArrayCollection = new ArrayCollection();
		[Bindable]
		private var dpa:ArrayCollection = new ArrayCollection();
		
		// function we call at the begining when application has finished loading and bulding itself
		public function start():void
		{
			// first we need to set the file class for our database (in this example test.db). If the Database doesn't exists it will be created when we open it.
			var db:File = File.applicationStorageDirectory.resolvePath("buckscore.db");
			// after we set the file for our database we need to open it with our SQLConnection.
			sqlc.openAsync(db);
			// we need to set some event listeners so we know if we get an sql error, when the database is fully opened and to know when we recive a resault from an sql statment. The last one is uset to read data out of database.
			sqlc.addEventListener(SQLEvent.OPEN, db_opened);
			sqlc.addEventListener(SQLErrorEvent.ERROR, error);
			sqls.addEventListener(SQLErrorEvent.ERROR, error);
			sqls.addEventListener(SQLEvent.RESULT, resault);
			
		}
		
		public function db_opened(e:SQLEvent):void
		{
			// when the database is opened we need to link the SQLStatment to our SQLConnection, so that sql statments for the right database.
			// if you don't set this connection you will get an error when you execute sql statment.
			sqls.sqlConnection = sqlc;
			// in property text of our SQLStatment we write our sql command. We can also combine sql statments in our text property so that more than one statment can be executed at a time.
			// in this sql statment we create table in our database with name "test_table" with three columns (id, first_name and last_name). Id is an integer that is auto incremented when each item is added. First_name and last_name are columns in which we can store text
			// If you want to know more about sql statments search the web.
			sqls.text = "CREATE TABLE IF NOT EXISTS  photobuckscore ( id INTEGER PRIMARY KEY AUTOINCREMENT, deername TEXT, albumname TEXT,tagnumber TEXT,ranchname TEXT,posturename TEXT,image BLOB,score TEXT);";
			// after we have connected sql statment to our sql connection and writen our sql commands we also need to execute our sql statment.
			// nothing will change in database until we execute sql statment.
			
			sqls.execute();
			
			
			// after we load the database and create the table if it doesn't already exists, we call refresh method which i have created to populate our datagrid
			refresh();
			
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "CREATE TABLE IF NOT EXISTS  albumbuckscore ( id INTEGER PRIMARY KEY AUTOINCREMENT, albumname TEXT, description TEXT);";
			// after we have connected sql statment to our sql connection and writen our sql commands we also need to execute our sql statment.
			// nothing will change in database until we execute sql statment.
			
			sqlsa.execute();
			
			
			// after we load the database and create the table if it doesn't already exists, we call refresh method which i have created to populate our datagrid
			refresh();
		}
		// function to add item to our database
		public function addItemphoto(deername:String,albumname:String,tagnumber:String,ranchname:String,posturename:String,encodebytes:String,score:String):void
		{
			// in this sql statment we add item at the end of our table with values first_name.text in column first_name and last_name.text for column last_name
			sqls.text = "INSERT INTO photobuckscore (deername, albumname,tagnumber,ranchname,posturename,image) VALUES('"+deername+"','"+albumname+"','"+tagnumber+"','"+ranchname+"','"+posturename+"','"+encodebytes+"','"+score+"');";
			sqls.execute();
			
			refresh();
		}
		
		public function addItemalbum(albumname:String,description:String):void
		{
			// in this sql statment we add item at the end of our table with values first_name.text in column first_name and last_name.text for column last_name
			sqlsa.text = "INSERT INTO albumbuckscore (deername, albumname,tagnumber,ranchname,posturename,image) VALUES('"+albumname+"','"+description+"');";
			sqlsa.execute();
			
			refresha();
		}
		
		
		
		
		
		// function to call when we want to refresh the data in datagrid
		public function refresh(e:TimerEvent = null):void
		{
			// timer object which we need if sql statment is still executing so that we can try again after 10 milliseconds.
			var timer:Timer = new Timer(10,1);
			timer.addEventListener(TimerEvent.TIMER, refresh);
			
			if ( !sqls.executing )// we need to check if our sql statment is still executing our last sql command. If so we use Timer to try again in 10 milliseconds. If we wouldn't check we could get an error because SQLStatment can't execute two statments at the same time.
			{
				// sql statment which returns all the data from our "test_table". To retrive only data from first_name and last_name columns we would use "SELECT first_name,last_name FROM test_table"
				sqls.text = "SELECT * FROM photobuckscore"
				sqls.execute();
			}
			else
			{
				timer.start();
			}
		}
		
		
		public function refresha(e:TimerEvent = null):void
		{
			// timer object which we need if sql statment is still executing so that we can try again after 10 milliseconds.
			var timer:Timer = new Timer(10,1);
			timer.addEventListener(TimerEvent.TIMER, refresha);
			
			if ( !sqlsa.executing )// we need to check if our sql statment is still executing our last sql command. If so we use Timer to try again in 10 milliseconds. If we wouldn't check we could get an error because SQLStatment can't execute two statments at the same time.
			{
				// sql statment which returns all the data from our "test_table". To retrive only data from first_name and last_name columns we would use "SELECT first_name,last_name FROM test_table"
				sqlsa.text = "SELECT * FROM albumbuckscore"
				sqlsa.execute();
			}
			else
			{
				timer.start();
			}
		}
		
		// method that gets called if we recive some resaults from our sql commands.
		//this method would also get called for sql statments to insert item and to create table but in this case sqls.getResault().data would be null
		public function resault(e:SQLEvent):ArrayCollection
		{
			// with sqls.getResault().data we get the array of objects for each row out of our database
			var data:Array = sqls.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dp = new ArrayCollection(data);
			return dp;
		}
		
		public function resaulta(e:SQLEvent):ArrayCollection
		{
			// with sqls.getResault().data we get the array of objects for each row out of our database
			var data:Array = sqlsa.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dpa = new ArrayCollection(data);
			
			return dpa;
		}
		
		// method to remove row from database.
		public function remove(id:int):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			sqls.text = "DELETE FROM photobuckscore WHERE id="+id;
			sqls.execute();
			refresh();
		}
		
		public function removea(id:int):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			sqlsa.text = "DELETE FROM albumbuckscore WHERE id="+id;
			sqlsa.execute();
			refresha();
		}
		// method which gets called when we recive an error  from sql connection or sql statment and displays the error in the alert
		public function error(e:SQLErrorEvent):void
		{
			Alert.show(e.toString());
		}
		
	}
}