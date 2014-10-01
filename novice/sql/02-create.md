---
layout: lesson
root: ../..
---

## Creating a database

<div class="objectives">
<h4 id="objectives">Objectives</h4>
<ul>
<li>Use DDL (data definition language) statements to create a database.</li>
<li>Import data from .csv files.</li>
</ul>
</div>

### The example data

<div>
<p>In the late 1920s and early 1930s, William Dyer, Frank Pabodie, and Valentina Roerich led expeditions to the <a href="http://en.wikipedia.org/wiki/Pole_of_inaccessibility">Pole of Inaccessibility</a> in the South Pacific, and then onward to Antarctica. Two years ago, their expeditions were found in a storage locker at Miskatonic University. We have scanned and OCR'd the data they contain, and we now want to store that information in a way that will make search and analysis easy.</p>
<p>We basically have three options: text files, a spreadsheet, or a database. Text files are easiest to create, and work well with version control, but then we would then have to build search and analysis tools ourselves. Spreadsheets are good for doing simple analysis, they don't handle large or complex data sets very well. We would therefore like to put this data in a database, and these lessons will show how to do that.</p>
</div>

<div id="graphic" style="background-color:#fffacd">
<table border="1">
	<tr>
	<td valign="top">
	<table border="1">
	<tr><td colspan="3"><strong>Person</strong>: people who took readings.</td></tr>
		<tr> <th>
		ident
		</th> <th>
		personal
		</th> <th>
		family
		</th> </tr>
		  <tr> <td>
		dyer
		</td> <td>
		William
		</td> <td>
		Dyer
		</td> </tr>
		  <tr> <td>
		pb
		</td> <td>
		Frank
		</td> <td>
		Pabodie
		</td> </tr>
		  <tr> <td>
		lake
		</td> <td>
		Anderson
		</td> <td>
		Lake
		</td> </tr>
		  <tr> <td>
		roe
		</td> <td>
		Valentina
		</td> <td>
		Roerich
		</td> </tr>
		  <tr> <td>
		danforth
		</td> <td>
		Frank
		</td> <td>
		Danforth
		</td> </tr>
	</table>
	<table border="1">
	<tr><th colspan="3"><strong>Site</strong>: locations where readings were taken.</th></tr>
	  <tr> <th>
	name
	</th> <th>
	lat
	</th> <th>
	long
	</th> </tr>
	  <tr> <td>
	DR-1
	</td> <td>
	-49.85
	</td> <td>
	-128.57
	</td> </tr>
	  <tr> <td>
	DR-3
	</td> <td>
	-47.15
	</td> <td>
	-126.72
	</td> </tr>
	  <tr> <td>
	MSK-4
	</td> <td>
	-48.87
	</td> <td>
	-123.4
	</td> </tr>
	</table>

	<table border="1">
	<tr><th colspan="3"><strong>Visited</strong>: when readings were taken at specific sites.</th></tr>
	  <tr> <th>
	ident
	</th> <th>
	site
	</th> <th>
	dated
	</th> </tr>
	  <tr> <td>
	619
	</td> <td>
	DR-1
	</td> <td>
	1927-02-08
	</td> </tr>
	  <tr> <td>
	622
	</td> <td>
	DR-1
	</td> <td>
	1927-02-10
	</td> </tr>
	  <tr> <td>
	734
	</td> <td>
	DR-3
	</td> <td>
	1939-01-07
	</td> </tr>
	  <tr> <td>
	735
	</td> <td>
	DR-3
	</td> <td>
	1930-01-12
	</td> </tr>
	  <tr> <td>
	751
	</td> <td>
	DR-3
	</td> <td>
	1930-02-26
	</td> </tr>
	  <tr> <td>
	752
	</td> <td>
	DR-3
	</td> <td bgcolor="red">
	 
	</td> </tr>
	  <tr> <td>
	837
	</td> <td>
	MSK-4
	</td> <td>
	1932-01-14
	</td> </tr>
	  <tr> <td>
	844
	</td> <td>
	DR-1
	</td> <td>
	1932-03-22
	</td> </tr>
	</table>
	</td>
	<td valign="top">

	<table border="1">
	<tr><th colspan="4"><strong>Survey</strong>: the actual readings.</th></tr>
	  <tr> <th>
	taken
	</th> <th>
	person
	</th> <th>
	quant
	</th> <th>
	reading
	</th> </tr>
	  <tr> <td>
	619
	</td> <td>
	dyer
	</td> <td>
	rad
	</td> <td>
	9.82
	</td> </tr>
	  <tr> <td>
	619
	</td> <td>
	dyer
	</td> <td>
	sal
	</td> <td>
	0.13
	</td> </tr>
	  <tr> <td>
	622
	</td> <td>
	dyer
	</td> <td>
	rad
	</td> <td>
	7.8
	</td> </tr>
	  <tr> <td>
	622
	</td> <td>
	dyer
	</td> <td>
	sal
	</td> <td>
	0.09
	</td> </tr>
	  <tr> <td>
	734
	</td> <td>
	pb
	</td> <td>
	rad
	</td> <td>
	8.41
	</td> </tr>
	  <tr> <td>
	734
	</td> <td>
	lake
	</td> <td>
	sal
	</td> <td>
	0.05
	</td> </tr>
	  <tr> <td>
	734
	</td> <td>
	pb
	</td> <td>
	temp
	</td> <td>
	-21.5
	</td> </tr>
	  <tr> <td>
	735
	</td> <td>
	pb
	</td> <td>
	rad
	</td> <td>
	7.22
	</td> </tr>
	  <tr> <td>
	735
	</td> <td bgcolor="red">
	 
	</td> <td>
	sal
	</td> <td>
	0.06
	</td> </tr>
	  <tr> <td>
	735
	</td> <td bgcolor="red">
	 
	</td> <td>
	temp
	</td> <td>
	-26.0
	</td> </tr>
	  <tr> <td>
	751
	</td> <td>
	pb
	</td> <td>
	rad
	</td> <td>
	4.35
	</td> </tr>
	  <tr> <td>
	751
	</td> <td>
	pb
	</td> <td>
	temp
	</td> <td>
	-18.5
	</td> </tr>
	  <tr> <td>
	751
	</td> <td>
	lake
	</td> <td>
	sal
	</td> <td>
	0.1
	</td> </tr>
	  <tr> <td>
	752
	</td> <td>
	lake
	</td> <td>
	rad
	</td> <td>
	2.19
	</td> </tr>
	  <tr> <td>
	752
	</td> <td>
	lake
	</td> <td>
	sal
	</td> <td>
	0.09
	</td> </tr>
	  <tr> <td>
	752
	</td> <td>
	lake
	</td> <td>
	temp
	</td> <td>
	-16.0
	</td> </tr>
	  <tr> <td>
	752
	</td> <td>
	roe
	</td> <td>
	sal
	</td> <td>
	41.6
	</td> </tr>
	  <tr> <td>
	837
	</td> <td>
	lake
	</td> <td>
	rad
	</td> <td>
	1.46
	</td> </tr>
	  <tr> <td>
	837
	</td> <td>
	lake
	</td> <td>
	sal
	</td> <td>
	0.21
	</td> </tr>
	  <tr> <td>
	837
	</td> <td>
	roe
	</td> <td>
	sal
	</td> <td>
	22.5
	</td> </tr>
	  <tr> <td>
	844
	</td> <td>
	roe
	</td> <td>
	rad
	</td> <td>
	11.25
	</td> </tr>
	</table>
	</td>
	</tr>
</table>

</div>
<p>Notice that three entries—one in the <code>Visited</code> table, and two in the <code>Survey</code> table—are shown in red because they don't contain any actual data: we'll return to these missing values <a href="#s:null">later</a>.</p>
<p>Currently the data is stored in 4 text files:</p>

<div class="in">
<pre>$ls data/</pre>
</div>

<div class="out">
<pre>Person.csv Site.csv Survey.csv Visited.csv</pre>
</div>

<div class="in">
<pre>$cat data/Person.csv</pre>
</div>

<div class="out">
<pre><table>
<tr><td>dyer,William,Dyer</td></tr>
<tr><td>pb,Frank,Pabodie</td></tr>
<tr><td>lake,Anderson,Lake</td></tr>
<tr><td>roe,Valentina,Roerich</td></tr>
<tr><td>danforth,Frank,Danforth</td></tr>
</table></pre>
</div>

### Step 1 - Create the database

<p>The <code>sqlite3</code> command takes 1 optional parameter, the file to use for the database.</p>

<div class="in">
<pre>$sqlite3 data/Survey.db</pre>
<pre>sqlite>.tables --Note this command returns nothing as we have not created any tables yet</pre>
<pre>sqlite>.exit</pre>
</div>

<div class="in">
<pre>$ls data/</pre>
</div>

<div class="out">
<pre>Person.csv Site.csv Survey.csv <b>Survey.db</b> Visited.csv</pre>
</div>

<p>A new file <em>Survey.db</em> has been created to store our (empty) database.</p>

### Step 2 - Create the tables

<p>We can type SQL commands directly into the sqlite interface.</p>

<div class='in'>
<pre>$sqlite3 data/Survey.db</pre>
<pre>sqlite>CREATE TABLE Person(
	ident    text,
	personal text,
	family	 text
);
sqlite>.tables
</pre>
</div>

<div class="out">
<pre>Person</pre>
</div>

<p>SQL commands can span many lines, the semi-colon <code>;</code> tells the database manager we have finished our statement.</p>

#### Datatypes in sqlite

<p>Unlike most database managers sqlite is very flexible with column datatypes. They are treated as <em>hints</em> for the database manger, they can be overridden. This is a <em>feature</em></p>
<p>Fields (columns) in sqlite can have 5 basic datatypes:
<ul>
<li>TEXT</li>
<li>NUMERIC</li>
<li>INTEGER</li>
<li>REAL</li>
<li>NONE</li>
</ul></p>

<div>
<h4 id="challenges">Challenge</h4>
<ol style="list-style-type: decimal">
<li><p>Compose a <code>CREATE TABLE</code> statement for data in Sites.csv.</p></li>
</ol>
</div>

<p>This method of creating tables is non-repeatable and difficult to audit. A better way is to create a text file with the statements and <a href="../../gloss.html#piipe">pipe</a> this to the sqlite command. We will use this method later.</p>


### Step 3 - Enter the data

<p>Data can be entered directly into a table using the  SQL command <code>INSERT</code>.</p>

<div class="in">
<pre>sqlite>INSERT into Person values('dyer',     'William',   'Dyer');</pre>
</div>

<p>Again this method of data entry is non-repeatable and non-auditable. Better to load the data direct from a text file</p>

<div class="in">
<pre>sqlite>.separator ","</pre>
<pre>sqlite>.import data/Person.csv Person</pre>
<pre>sqlite>SELECT * FROM Person;</pre>
</div>

<div class="out">
<pre><table>
<tr><td>dyer</td><td>William</td><td>Dyer</td></tr>
<tr><td>pb</td><td>Frank</td><td>Pabodie</td></tr>
<tr><td>lake</td><td>Anderson</td><td>Lake</td></tr>
<tr><td>roe</td><td>Valentina</td><td>Roerich</td></tr>
<tr><td>danforth</td><td>Frank</td><td>Danforth</td></tr>
</table></pre>
</div>

### Step 4 - Putting it together, creating the example database

<p>The file <code>code/create_example_db.sql</code> contains the SQL commands to create the examples and populate them from the .csv files.
<div class="in">
<pre>$cat create_example_db.sql</pre>
<pre>$sqlite Survey.db < create_example_db.sql</pre>
</div>

<div class="keypoints">
<h4 id="key-points">Key Points</h4>
<ul>
<li>The sqlite database is a single file.</li>
<li>We write queries in a specialized language called SQL to manipulate databases.</li>
<li>The SQL command <code>CREATE TABLE</code> is used to create tables which contain fields in the database.</li>
<li>The SQL command <code>INSERT</code> is used to enter data into the database.</li>
<li>Commands can be prepared in a text file and passed to the database manager using a <a href="../../gloss.html#piipe">pipe</a>.
</ul>
</div>
