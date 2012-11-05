package utils
{
		import flash.data.SQLConnection;
		import flash.data.SQLMode;
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
		
		// sqlc is a variable we need to define the connection to our database
		private var sqlc:SQLConnection = new SQLConnection();
		// sqlc is an SQLStatment which we need to execute our sql commands
		private var sqls:SQLStatement;
		private var sqlsa:SQLStatement;
		private var sqlscore:SQLStatement;
		// ArrayCollection used as a data provider for the datagrid. It has to be bindable so that data in datagrid changes automatically when we change the ArrayCollection
		[Bindable]
		private var dp:ArrayCollection = new ArrayCollection();
		[Bindable]
		private var dpa:ArrayCollection = new ArrayCollection();
		[Bindable]
		private var dpscore:ArrayCollection = new ArrayCollection();
	
		public function SQLbuckscore()
		{
			//sqlc = new SQLConnection();
			//var db:File = File.applicationStorageDirectory.resolvePath("buckscore.db");

			// we need to set some event listeners so we know if we get an sql error, when the database is fully opened and to know when we recive a resault from an sql statment. The last one is uset to read data out of database.
			//sqlc.addEventListener(SQLEvent.OPEN, db_opened);
			//sqlc.addEventListener(SQLErrorEvent.ERROR, error);
			//sqls.addEventListener(SQLErrorEvent.ERROR, error);

			// after we set the file for our database we need to open it with our SQLConnection.
			//sqlc.openAsync(db);
			//sqlc.open(db,SQLMode.CREATE);
			
			
		}
		
		public function create():void {
			var db:File = File.applicationStorageDirectory.resolvePath("buckscore.db");
			
			sqlc.open(db,SQLMode.CREATE);
			
			sqls= new SQLStatement();
			sqls.sqlConnection = sqlc;
			sqls.text = "CREATE TABLE IF NOT EXISTS  photobuckscore (id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,deername TEXT, albumname TEXT,tagnumber TEXT,ranchname TEXT,posturename TEXT,image BLOB,score TEXT);";
			sqls.execute();
			
			sqlsa=new SQLStatement();
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "CREATE TABLE IF NOT EXISTS  albumbuckscore (id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,albumname TEXT, description TEXT);";

			sqlsa.execute();
			
			sqlscore=new SQLStatement();
			sqlscore.sqlConnection=sqlc;
			sqlscore.text = "CREATE TABLE IF NOT EXISTS buckscorefinish (id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,deername TEXT, location TEXT,date TEXT,comments TEXT,ftrfeatures  TEXT	,insidespread  TEXT, mainbeamleft  TEXT, mainbeamrigth  TEXT, Typicalpointleft1  TEXT, Typicalpointrigth1  TEXT, Typicalpointleft2  TEXT, Typicalpointrigth2  TEXT, Typicalpointleft3  TEXT, Typicalpointrigth3  TEXT, Typicalpointleft4  TEXT, Typicalpointrigth4  TEXT, Typicalpointleft5  TEXT, Typicalpointrigth5  TEXT	, Typicalpointleft6  TEXT, Typicalpointrigth6  TEXT	, Typicalpointleft7  TEXT, Typicalpointrigth7  TEXT	, Typicalpointleft8  TEXT, Typicalpointrigth8  TEXT	, Typicalpointleft9  TEXT, Typicalpointrigth9  TEXT, Typicalpointleft10  TEXT, Typicalpointrigth10  TEXT, Circumferenceleft1  TEXT, Circumferencerigth1  TEXT, Circumferenceleft2  TEXT, Circumferencerigth2  TEXT, Circumferenceleft3  TEXT, Circumferencerigth3  TEXT	, Circumferenceleft4  TEXT, Circumferencerigth4  TEXT	, Abnormalpointleft1  TEXT, Abnormalpointrigth1  TEXT, Abnormalpointleft2  TEXT	, Abnormalpointrigth2  TEXT	, Abnormalpointleft3  TEXT, Abnormalpointrigth3  TEXT, Abnormalpointleft4  TEXT	, Abnormalpointrigth4  TEXT	, Abnormalpointleft5  TEXT	, Abnormalpointrigth5  TEXT	, Abnormalpointleft6  TEXT	, Abnormalpointrigth6  TEXT, Abnormalpointleft7  TEXT, Abnormalpointrigth7  TEXT, Abnormalpointleft8  TEXT, Abnormalpointrigth8  TEXT, Abnormalpointleft9  TEXT	, Abnormalpointrigth9  TEXT, Abnormalpointleft10  TEXT, Abnormalpointrigth10  TEXT, Abnormalpointleft11  TEXT, Abnormalpointrigth11  TEXT, Abnormalpointleft12  TEXT, Abnormalpointrigth12  TEXT, Abnormalpointleft13  TEXT, Abnormalpointrigth13  TEXT	, Abnormalpointleft14  TEXT	, Abnormalpointrigth14  TEXT, Abnormalpointleft15  TEXT	, Abnormalpointrigth15  TEXT, Abnormalpointleft16  TEXT	, Abnormalpointrigth16  TEXT, Abnormalpointleft17  TEXT	, Abnormalpointrigth17  TEXT, Abnormalpointleft18  TEXT, Abnormalpointrigth18  TEXT	, Abnormalpointleft19  TEXT	, Abnormalpointrigth19  TEXT, Abnormalpointleft20  TEXT	, Abnormalpointrigth20  TEXT,leftpoints TEXT,rigthpoints TEXT,socorefinal TEXT);";		
			
			sqlscore.execute();	
			
			
		}
		
		public function isExist():Boolean {
			var db:File = File.applicationStorageDirectory.resolvePath("buckscore.db");
			return db.exists;
		}
		
		public function opendb():void {

			var db:File = File.applicationStorageDirectory.resolvePath("buckscore.db");
			
			sqlc.open(db,SQLMode.UPDATE);
			

		}
		
		public function closedb():void {
			sqlc.close();
		}
		
		// function we call at the begining when application has finished loading and bulding itself
		
		
		public function db_opened(e:SQLEvent):void
		{
			sqls= new SQLStatement();
			// when the database is opened we need to link the SQLStatment to our SQLConnection, so that sql statments for the right database.
			// if you don't set this connection you will get an error when you execute sql statment.
			sqls.sqlConnection = sqlc;
			// in property text of our SQLStatment we write our sql command. We can also combine sql statments in our text property so that more than one statment can be executed at a time.
			// in this sql statment we create table in our database with name "test_table" with three columns (id, first_name and last_name). Id is an integer that is auto incremented when each item is added. First_name and last_name are columns in which we can store text
			// If you want to know more about sql statments search the web.
			sqls.text = "CREATE TABLE IF NOT EXISTS  photobuckscore (id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT, deername TEXT, albumname TEXT,tagnumber TEXT,ranchname TEXT,posturename TEXT,image BLOB,score TEXT);";
			// after we have connected sql statment to our sql connection and writen our sql commands we also need to execute our sql statment.
			// nothing will change in database until we execute sql statment.
			
			sqls.execute();
			
			
			// after we load the database and create the table if it doesn't already exists, we call refresh method which i have created to populate our datagrid
			//refresh();
			sqlsa=new SQLStatement();
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "CREATE TABLE IF NOT EXISTS  albumbuckscore (id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,albumname TEXT, description TEXT);";
			// after we have connected sql statment to our sql connection and writen our sql commands we also need to execute our sql statment.
			// nothing will change in database until we execute sql statment.
			
			sqlsa.execute();
			
			sqlscore=new SQLStatement();
			sqlscore.sqlConnection=sqlc;
			sqlscore.text = "CREATE TABLE IF NOT EXISTS buckscorefinish (id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,deername TEXT, location TEXT,date TEXT,comments TEXT,ftrfeatures  TEXT	,insidespread  TEXT, mainbeamleft  TEXT, mainbeamrigth  TEXT, Typicalpointleft1  TEXT, Typicalpointrigth1  TEXT, Typicalpointleft2  TEXT, Typicalpointrigth2  TEXT, Typicalpointleft3  TEXT, Typicalpointrigth3  TEXT, Typicalpointleft4  TEXT, Typicalpointrigth4  TEXT, Typicalpointleft5  TEXT, Typicalpointrigth5  TEXT	, Typicalpointleft6  TEXT, Typicalpointrigth6  TEXT	, Typicalpointleft7  TEXT, Typicalpointrigth7  TEXT	, Typicalpointleft8  TEXT, Typicalpointrigth8  TEXT	, Typicalpointleft9  TEXT, Typicalpointrigth9  TEXT, Typicalpointleft10  TEXT, Typicalpointrigth10  TEXT, Circumferenceleft1  TEXT, Circumferencerigth1  TEXT, Circumferenceleft2  TEXT, Circumferencerigth2  TEXT, Circumferenceleft3  TEXT, Circumferencerigth3  TEXT	, Circumferenceleft4  TEXT, Circumferencerigth4  TEXT	, Abnormalpointleft1  TEXT, Abnormalpointrigth1  TEXT, Abnormalpointleft2  TEXT	, Abnormalpointrigth2  TEXT	, Abnormalpointleft3  TEXT, Abnormalpointrigth3  TEXT, Abnormalpointleft4  TEXT	, Abnormalpointrigth4  TEXT	, Abnormalpointleft5  TEXT	, Abnormalpointrigth5  TEXT	, Abnormalpointleft6  TEXT	, Abnormalpointrigth6  TEXT, Abnormalpointleft7  TEXT, Abnormalpointrigth7  TEXT, Abnormalpointleft8  TEXT, Abnormalpointrigth8  TEXT, Abnormalpointleft9  TEXT	, Abnormalpointrigth9  TEXT, Abnormalpointleft10  TEXT, Abnormalpointrigth10  TEXT, Abnormalpointleft11  TEXT, Abnormalpointrigth11  TEXT, Abnormalpointleft12  TEXT, Abnormalpointrigth12  TEXT, Abnormalpointleft13  TEXT, Abnormalpointrigth13  TEXT	, Abnormalpointleft14  TEXT	, Abnormalpointrigth14  TEXT, Abnormalpointleft15  TEXT	, Abnormalpointrigth15  TEXT, Abnormalpointleft16  TEXT	, Abnormalpointrigth16  TEXT, Abnormalpointleft17  TEXT	, Abnormalpointrigth17  TEXT, Abnormalpointleft18  TEXT, Abnormalpointrigth18  TEXT	, Abnormalpointleft19  TEXT	, Abnormalpointrigth19  TEXT, Abnormalpointleft20  TEXT	, Abnormalpointrigth20  TEXT,leftpoints TEXT,rigthpoints TEXT,socorefinal TEXT);";		
			
			sqlscore.execute();			
			// after we load the database and create the table if it doesn't already exists, we call refresh method which i have created to populate our datagrid
			//refresha();
		}
		// function to add item to our database
		public function addItemphoto(deername:String,albumname:String,tagnumber:String,ranchname:String,posturename:String,encodebytes:String,score:String):String
		{
			// in this sql statment we add item at the end of our table with values first_name.text in column first_name and last_name.text for column last_name
			sqls=new SQLStatement();
			sqls.sqlConnection=sqlc;
			sqls.text = "INSERT INTO photobuckscore (deername, albumname,tagnumber,ranchname,posturename,image,score) VALUES('"+deername+"','"+albumname+"','"+tagnumber+"','"+ranchname+"','"+posturename+"','"+encodebytes+"','"+score+"');";
			try{
				sqls.execute();
				return "1";
				
			}
			catch (error:SQLError)
			{
				
				Alert.show("Name Duplicate");
				
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				return "0";
				
			}
			
			return "1";
		}
		
		public function addItemalbum(albumname:String,description:String):String
		{
			// in this sql statment we add item at the end of our table with values first_name.text in column first_name and last_name.text for column last_name
			sqlsa=new SQLStatement();
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "INSERT INTO albumbuckscore (albumname,description) VALUES('"+albumname+"','"+description+"');";
			try{
				sqlsa.execute();
				return "1";
			}
			catch (error:SQLError)
			{
				
				Alert.show("Name Duplicate");
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				return "0";
				
			}
			trace("inserto correctamente");
			return "1";
			
		}
		
		
		
		public function addItemscore(deername:String,location:String,date:String,comments:String,ftrfeatures:String ,insidespread:String,mainbeamleft:String  ,mainbeamrigth:String,Typicalpointleft1:String ,Typicalpointrigth1:String  ,Typicalpointleft2:String  ,Typicalpointrigth2:String	,Typicalpointleft3:String ,Typicalpointrigth3:String ,Typicalpointleft4:String  ,Typicalpointrigth4:String,Typicalpointleft5:String ,Typicalpointrigth5:String  ,Typicalpointleft6:String   ,Typicalpointrigth6:String,Typicalpointleft7:String ,Typicalpointrigth7:String ,Typicalpointleft8:String  ,Typicalpointrigth8:String,Typicalpointleft9:String ,Typicalpointrigth9:String  ,Typicalpointleft10:String
									,Typicalpointrigth10:String,Circumferenceleft1:String ,Circumferencerigth1:String ,Circumferenceleft2:String ,Circumferencerigth2:String	,Circumferenceleft3:String ,Circumferencerigth3:String ,Circumferenceleft4:String ,Circumferencerigth4:String	,Abnormalpointleft1:String ,Abnormalpointrigth1:String ,Abnormalpointleft2:String  ,Abnormalpointrigth2:String,Abnormalpointleft3:String ,Abnormalpointrigth3:String,Abnormalpointleft4:String  ,Abnormalpointrigth4:String,Abnormalpointleft5:String,Abnormalpointrigth5:String ,Abnormalpointleft6:String ,Abnormalpointrigth6:String,Abnormalpointleft7:String ,Abnormalpointrigth7:String,Abnormalpointleft8:String
									,Abnormalpointrigth8:String,Abnormalpointleft9:String,Abnormalpointrigth9:String ,Abnormalpointleft10:String ,Abnormalpointrigth10:String,Abnormalpointleft11:String,Abnormalpointrigth11:String ,Abnormalpointleft12:String ,Abnormalpointrigth12:String,Abnormalpointleft13:String ,Abnormalpointrigth13:String ,Abnormalpointleft14:String ,Abnormalpointrigth14:String,Abnormalpointleft15:String,Abnormalpointrigth15:String,Abnormalpointleft16:String ,Abnormalpointrigth16:String,Abnormalpointleft17:String,Abnormalpointrigth17:String ,Abnormalpointleft18:String,Abnormalpointrigth18:String,Abnormalpointleft19:String,Abnormalpointrigth19:String,Abnormalpointleft20:String
									,Abnormalpointrigth20:String,leftpoint:String,rigth:String,scorefinal:String):String
		{
			// in this sql statment we add item at the end of our table with values first_name.text in column first_name and last_name.text for column last_name
			sqlscore=new SQLStatement();
			sqlscore.sqlConnection=sqlc;
			sqlscore.text = "INSERT INTO  buckscorefinish (deername,location,date,comments,ftrfeatures,insidespread,mainbeamleft,mainbeamrigth,Typicalpointleft1,Typicalpointrigth1,Typicalpointleft2 ,Typicalpointrigth2 , Typicalpointleft3 , Typicalpointrigth3 , Typicalpointleft4 , Typicalpointrigth4  , Typicalpointleft5 	, Typicalpointrigth5  , Typicalpointleft6  , Typicalpointrigth6  , Typicalpointleft7, Typicalpointrigth7 , Typicalpointleft8  , Typicalpointrigth8, Typicalpointleft9 , Typicalpointrigth9 , Typicalpointleft10 , Typicalpointrigth10  , Circumferenceleft1 , Circumferencerigth1 , Circumferenceleft2 	, Circumferencerigth2  , Circumferenceleft3  , Circumferencerigth3	, Circumferenceleft4 , Circumferencerigth4 , Abnormalpointleft1  , Abnormalpointrigth1  , Abnormalpointleft2 , Abnormalpointrigth2 , Abnormalpointleft3 , Abnormalpointrigth3 , Abnormalpointleft4 , Abnormalpointrigth4 , Abnormalpointleft5  , Abnormalpointrigth5  , Abnormalpointleft6  , Abnormalpointrigth6  , Abnormalpointleft7  , Abnormalpointrigth7 , Abnormalpointleft8 , Abnormalpointrigth8 , Abnormalpointleft9  , Abnormalpointrigth9  , Abnormalpointleft10  , Abnormalpointrigth10  , Abnormalpointleft11  , Abnormalpointrigth11 , Abnormalpointleft12  		, Abnormalpointrigth12  , Abnormalpointleft13  , Abnormalpointrigth13 , Abnormalpointleft14 , Abnormalpointrigth14 , Abnormalpointleft15 , Abnormalpointrigth15 , Abnormalpointleft16 , Abnormalpointrigth16 , Abnormalpointleft17 , Abnormalpointrigth17 , Abnormalpointleft18 , Abnormalpointrigth18 , Abnormalpointleft19 , Abnormalpointrigth19, Abnormalpointleft20, Abnormalpointrigth20 ,leftpoints ,rigthpoints ,socorefinal ) VALUES('"+deername+"','"+location+"','"+date+"','"+comments+"','"+ftrfeatures+"' ,'"+insidespread+"','"+mainbeamleft+"'  ,'"+mainbeamrigth+"','"+Typicalpointleft1+"' ,'"+Typicalpointrigth1+"'  ,'"+Typicalpointleft2+"'  ,'"+Typicalpointrigth2+"'	,'"+Typicalpointleft3+"' ,'"+Typicalpointrigth3+"' ,'"+Typicalpointleft4+"'  ,'"+Typicalpointrigth4+"','"+Typicalpointleft5+"' ,'"+Typicalpointrigth5+"'  ,'"+Typicalpointleft6+"'   ,'"+Typicalpointrigth6+"','"+Typicalpointleft7+"' ,'"+Typicalpointrigth7+"' ,'"+Typicalpointleft8+"'  ,'"+Typicalpointrigth8+"','"+Typicalpointleft9+"' ,'"+Typicalpointrigth9+"'  ,'"+Typicalpointleft10+"','"+Typicalpointrigth10+"','"+Circumferenceleft1+"' ,'"+Circumferencerigth1+"' ,'"+Circumferenceleft2+"' ,'"+Circumferencerigth2+"'	,'"+Circumferenceleft3+"' ,'"+Circumferencerigth3+"' ,'"+Circumferenceleft4+"' ,'"+Circumferencerigth4+"'	,'"+Abnormalpointleft1+"' ,'"+Abnormalpointrigth1+"' ,'"+Abnormalpointleft2+"'  ,'"+Abnormalpointrigth2+"','"+Abnormalpointleft3+"' ,'"+Abnormalpointrigth3+"','"+Abnormalpointleft4+"'  ,'"+Abnormalpointrigth4+"','"+Abnormalpointleft5+"','"+Abnormalpointrigth5+"' ,'"+Abnormalpointleft6+"' ,'"+Abnormalpointrigth6+"','"+Abnormalpointleft7+"' ,'"+Abnormalpointrigth7+"','"+Abnormalpointleft8+"','"+Abnormalpointrigth8+"','"+Abnormalpointleft9+"','"+Abnormalpointrigth9+"' ,'"+Abnormalpointleft10+"' ,'"+Abnormalpointrigth10+"','"+Abnormalpointleft11+"','"+Abnormalpointrigth11+"' ,'"+Abnormalpointleft12+"' ,'"+Abnormalpointrigth12+"','"+Abnormalpointleft13+"' ,'"+Abnormalpointrigth13+"' ,'"+Abnormalpointleft14+"' ,'"+Abnormalpointrigth14+"','"+Abnormalpointleft15+"','"+Abnormalpointrigth15+"','"+Abnormalpointleft16+"' ,'"+Abnormalpointrigth16+"','"+Abnormalpointleft17+"','"+Abnormalpointrigth17+"' ,'"+Abnormalpointleft18+"','"+Abnormalpointrigth18+"','"+Abnormalpointleft19+"','"+Abnormalpointrigth19+"','"+Abnormalpointleft20+"','"+Abnormalpointrigth20+"','"+leftpoint+"','"+rigth+"','"+scorefinal+"');";
			
			try{
				sqlscore.execute();
				return "1";
			}
			catch (error:SQLError)
			{
				
				Alert.show("Name Duplicate");
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				return "0";
				
			}
			trace("inserto correctamente");
			return "1";
			
		}
		
		
	
		// method that gets called if we recive some resaults from our sql commands.
		//this method would also get called for sql statments to insert item and to create table but in this case sqls.getResault().data would be null
		public function resault():ArrayCollection
		{
			
			sqls=new SQLStatement();
			sqls.sqlConnection=sqlc;
			sqls.text = "SELECT * FROM photobuckscore"
			try{sqls.execute();
			// with sqls.getResault().data we get the array of objects for each row out of our database
			var data:Array = sqls.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dp = new ArrayCollection(data);
			return dp;
			}catch (error:SQLError)
			{
			
			
			trace("SELECT error:", error);
			trace("error.message:", error.message);
			trace("error.details:", error.details);
			
			
			}
			return dp;
		}
		public function resaultname(name:String):ArrayCollection
		{
			
			sqls=new SQLStatement();
			sqls.sqlConnection=sqlc;
			sqls.text = "SELECT * FROM photobuckscore where='"+name+"'"; 
			try{sqls.execute();
			// with sqls.getResault().data we get the array of objects for each row out of our database
			var data:Array = sqls.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dp = new ArrayCollection(data);
			//return dp;
			}catch (error:SQLError)
			{
				
				
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				return dp;
				
			}
			
			
			return dp;
		}
		
		
		public function resaulta():ArrayCollection
		{
			
			// with sqls.getResault().data we get the array of objects for each row out of our database
			sqlsa=new SQLStatement();
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "SELECT * FROM albumbuckscore";
			try{
				sqlsa.execute();
			
			var data:Array = sqlsa.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dpa = new ArrayCollection(data);
			
			return dpa;
			}catch (error:SQLError)
			{
				
				
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				
				
			}
			return dpa;
		}
		
		public function resaultaname(name:String):int
		{
			
			// with sqls.getResault().data we get the array of objects for each row out of our database
			sqlsa=new SQLStatement();
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "SELECT * FROM albumbuckscore where='"+name+"'";
			try{ sqlsa.execute();
			var data:Array = sqlsa.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dpa = new ArrayCollection(data);
			
			
			}
			catch (error:SQLError)
			{
				
				
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				return 0;
				
			}
			return dpa.length;
		}
		
		public function resaultscore(name:String):ArrayCollection
		{
			
			// with sqls.getResault().data we get the array of objects for each row out of our database
			sqlscore=new SQLStatement();
			sqlscore.sqlConnection=sqlc;
			sqlscore.text = "SELECT * FROM buckscorefinish where deername='"+name+"'";
			try{sqlscore.execute();
			var data:Array = sqlscore.getResult().data;
			// we pass the array of objects to our data provider to fill the datagrid
			dpscore = new ArrayCollection(data);
			
			return dpscore;
			}
			catch (error:SQLError)
			{
				
				
				trace("SELECT error:", error);
				trace("error.message:", error.message);
				trace("error.details:", error.details);
				
				
			}
			
			return dpa;
		}
		
		// method to remove row from database.
		public function remove(id:String):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			
			sqls=new SQLStatement();
			sqls.sqlConnection=sqlc;
			sqls.text = "DELETE FROM photobuckscore WHERE deername='"+id+"';";
			sqls.execute();
			
		}
		
		public function removea(id:String):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			sqlsa=new SQLStatement();
			sqlsa.sqlConnection=sqlc;
			sqlsa.text = "DELETE FROM albumbuckscore WHERE albumname='"+id+"';";
			sqlsa.execute();
			
		}
		public function removescore(id:String):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			sqlscore=new SQLStatement();
			sqlscore.sqlConnection=sqlc;
			sqlscore.text = "DELETE FROM buckscorefinish WHERE deername='"+id+"';";
			sqlscore.execute();
			
		}
		
		public function updatephoto(id:int,name:String,albumname:String,tagnumber:String,ranchname:String,posturename:String,encodebytes:String,score:String):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			
			sqls=new SQLStatement();
			sqls.sqlConnection=sqlc;
			sqls.text = "UPDATE photobuckscore SET deername='"+name+"',albumname='"+albumname+"',tagnumber='"+tagnumber+"',ranchname='"+ranchname+"',posturename='"+posturename+"',image='"+encodebytes+"',score='"+score+"'  WHERE id="+id+";";
			
			sqls.execute();
			
		}
		public function updatephotoscore(name:String,score:String):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			
			sqls=new SQLStatement();
			sqls.sqlConnection=sqlc;
			sqls.text = "UPDATE photobuckscore SET score='"+score+"'  WHERE deername='"+name+"';";
			
			sqls.execute();
			
		}
		
		public function updatebuckscorefinish(id:int,name:String):void
		{
			// sql statment to delete from our test_table the row that has the same number in number column as our selected row from datagrid
			
			sqlscore=new SQLStatement();
			sqlscore.sqlConnection=sqlc;
			sqlscore.text = "UPDATE buckscorefinish SET deername='"+name+"'  WHERE id="+id+";";
			
			sqlscore.execute();
			
		}
		
		
		
		// method which gets called when we recive an error  from sql connection or sql statment and displays the error in the alert
		public function error(e:SQLErrorEvent):void
		{
			Alert.show(e.toString());
		}
		
	}
}