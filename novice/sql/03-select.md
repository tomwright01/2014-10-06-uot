---
layout: lesson
root: ../..
---

## Selecting Data

<div class="objectives">
<h4 id="objectives">Objectives</h4>
<ul>
<li>Know how to select all values for specific fields from a single table.</li>
</ul>
</div>

<p>Queries are written in a language called <a href="../../gloss.html#sql">SQL</a>, which stands for &quot;Structured Query Language&quot;. SQL provides hundreds of different ways to analyze and recombine data; we will only look at a handful, but that handful accounts for most of what scientists do.</p>


<div>
<p> To start, let's write an SQL query that displays scientists' names. We do this using the SQL command <code>SELECT</code>, giving it the names of the columns we want and the table we want them from. Our query and its output look like this:</p>
</div>


<div class="in">
<pre>$sqlite3 survey.db
select family, personal from Person;</pre>
</div>

<div class="out">
<pre><table>
<tr><td>Dyer</td><td>William</td></tr>
<tr><td>Pabodie</td><td>Frank</td></tr>
<tr><td>Lake</td><td>Anderson</td></tr>
<tr><td>Roerich</td><td>Valentina</td></tr>
<tr><td>Danforth</td><td>Frank</td></tr>
</table></pre>
</div>


<div>
 We have written our commands and column names in lower case, and the table name in Title Case, but we don't have to: as the example below shows, SQL is <a href="../../gloss.html#case-insensitive">case insensitive</a>.</p>
</div>


<div class="in">
<pre>$sqlite survey.db
SeLeCt FaMiLy, PeRsOnAl FrOm PeRsOn;</pre>
</div>

<div class="out">
<pre><table>
<tr><td>Dyer</td><td>William</td></tr>
<tr><td>Pabodie</td><td>Frank</td></tr>
<tr><td>Lake</td><td>Anderson</td></tr>
<tr><td>Roerich</td><td>Valentina</td></tr>
<tr><td>Danforth</td><td>Frank</td></tr>
</table></pre>
</div>


<div>
<p>Whatever casing convention you choose, <b>please be consistent</b>: complex queries are hard enough to read without the extra cognitive load of random capitalization.</p>
</div>


<div>
<p>Going back to our query, it's important to understand that the rows and columns in a database table aren't actually stored in any particular order. They will always be <em>displayed</em> in some order, but we can control that in various ways. For example, we could swap the columns in the output by writing our query as:</p>
</div>


<div class="in">
<pre>$sqlite survey.db
select personal, family from Person;</pre>
</div>

<div class="out">
<pre><table>
<tr><td>William</td><td>Dyer</td></tr>
<tr><td>Frank</td><td>Pabodie</td></tr>
<tr><td>Anderson</td><td>Lake</td></tr>
<tr><td>Valentina</td><td>Roerich</td></tr>
<tr><td>Frank</td><td>Danforth</td></tr>
</table></pre>
</div>


<div>
<p>or even repeat columns:</p>
</div>


<div class="in">
<pre>%%sqlite survey.db
select ident, ident, ident from Person;</pre>
</div>

<div class="out">
<pre><table>
<tr><td>dyer</td><td>dyer</td><td>dyer</td></tr>
<tr><td>pb</td><td>pb</td><td>pb</td></tr>
<tr><td>lake</td><td>lake</td><td>lake</td></tr>
<tr><td>roe</td><td>roe</td><td>roe</td></tr>
<tr><td>danforth</td><td>danforth</td><td>danforth</td></tr>
</table></pre>
</div>


<div>
<p>As a shortcut, we can select all of the columns in a table using <code>*</code>:</p>
</div>


<div class="in">
<pre>$sqlite survey.db
select * from Person;</pre>
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


<div>
<h4 id="challenges">Challenges</h4>
<ol style="list-style-type: decimal">
<li><p>Write a query that selects only site names from the <code>Site</code> table.</p></li>
<li><p>Many people format queries as:</p>
<pre><code>SELECT personal, family FROM person;</code></pre>
<p>or as:</p>
<pre><code>select Personal, Family from PERSON;</code></pre>
<p>What style do you find easiest to read, and why?</p></li>
</ol>
</div>


<div class="keypoints">
<h4 id="key-points">Key Points</h4>
<ul>
<li>The SQL command <code>SELECT</code> is used to extract data from the database.</li>
<li>SQL is case-insensitive.</li>
</ul>
</div>
