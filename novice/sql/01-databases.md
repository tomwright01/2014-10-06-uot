---
layout: lesson
root: ../..
---

## Database structures

<div class="objectives">
<h4 id="objectives">Objectives</h4>
<ul>
<li>Explain the difference between a table, a record, and a field.</li>
<li>Explain the difference between a database and a database manager.</li>
</ul>
</div>


### The Database manager
<div>
<p>A database application consists of the <em>data</em>; the <em>database manager</em> and (one or more) <em>clients</em>.</p>
<p>All interactions with the data are moderated through the database manager.</p>
<img href='img/sql-client server.svg' alt='Database client server model'/>
<blockquote>
<p>Every database manager—Oracle, IBM DB2, PostgreSQL, MySQL, Microsoft Access, and SQLite—stores data in a different way, so a database created with one cannot be used directly by another. However, every database manager can import and export data in a variety of formats, so it <em>is</em> possible to move information from one to another.</p>
</blockquote>
<blockquote>
<p>SQLite combines the database manager with the client</p>
</blockquote>
</div>

### Database structures
<div>
<p>A <a href="../../gloss.html#relational-database">relational database</a> is a way to store and manipulate information that is arranged as <a href="../../gloss.html#table-database">tables</a>. Each table has columns (also known as <a href="../../gloss.html#field-database">fields</a>) which describe the data, and rows (also known as <a href="../../gloss.html#record-database">records</a>) which contain the data. The structure of the tables and fields is called the <em>schema</em>.</p>
<img href='img/sql-table field.svg' alt='Database structure'/>
</div>

### Communicating with the database
<div>
<p>All interactions with the database are moderated by the database manager.</p>
<p>Database managers understand a well defined language called <em>Structured Query Language (SQL)</em></p>
<p><em>SQL</em> includes <em>Data Definition Language (DDL)</em> and <em>Data Manipulation Language (DML)</em> statements.
<blockquote>
<li><em>DDL</em> statements manipulate the <em>schema</em> (create, alter tables and fields).</li>
<li><em>DML</em> statements manipulate the <em>data</em> (select, insert, update, delete data in tables).</li>
</blockquote>
<p><a href="../../gloss.html#sql">SQL</a> provides hundreds of different ways to analyze and recombine data; we will only look at a handful, but that handful accounts for most of what scientists do.</p>
</div>

<div>
<h4 id="challenges">Challenges</h4>
<ol style="list-style-type: decimal">
<li>What are the componants that make up a database?</li>
<li>In what ways is a database similar to a spreadsheet, in what ways do they differ?</li>
</ol>
</div>

<div class="keypoints">
<h4 id="key-points">Key Points</h4>
<ul>
<li>A relational database stores information in tables, each of which has a fixed set of columns and a variable number of records.</li>
<li>A database manager is a program that manipulates information stored in a database.</li>
<li>We write queries in a specialized language called SQL to extract information from databases.</li>
</ul>
</div>
