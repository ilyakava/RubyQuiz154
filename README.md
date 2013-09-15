MakeChange - RubyQuiz154
===

* Answer to a [RubyQuiz Question](http://web.archive.org/web/20130215052843/http://rubyquiz.com/quiz154.html)
* Finds an easy way to rank coins to use, using a "magic number"
	* For the coin choices of `[10, 7, 1]` or American coin denominations, 2.71828 is a decent "magic number"
		* Having a "bad magic number" will result in ranking errors leading to an inefficient coin choice solution
	* This magic number [varies a little but with the coin base choices](http://imgur.com/a/giPa0#0), [and is within some sort of "magic range"](https://github.com/srunni/w1d3/tree/cointest/cointest_data) dictated by something I don't understand
	* For instance:
	* ![image](http://imgur.com/9rlBHWp.png)
		* For the coinset: `[1,10,x]`, the image above shows the upper and lower bounds for the "magic number" while the value of the third coin is varied
	* [More images](http://imgur.com/a/giPa0#8)