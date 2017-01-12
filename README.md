## Custom Collection View Layout Demonstration - Periodic Table 

This is an demonstration of using custom collection view layout (not a flow layout) in Swift.

In a custom collection view layout, you simply have to specify:

- The collection view's `contentSize`;
- The center and size of the individual element cells in the collection view; and
- Identify what elements are visible for any given `CGRect`.

See `PeriodicTableLayout.swift` for an example. Note, you can set `fitTableToCollectionView` if you want it to fit the periodic table within the collection view. Set it to `false` if you want to have fixed sized cells and allow you to scroll around.

![screen snapshot](https://i.stack.imgur.com/SnAWZ.png)

This is not intended as an end-user library, but just a "simple" example of how one might create non-flow collection view layouts. This is for illustrative purposes only. Also, please note that the `Elements.json` was created by cutting and pasting from a Wikipedia page on the elements, and some of the fields (like atomic weight) include footnote numbers that are not part of the numeric value. So, you might want to clean up this JSON if you were to actually use this. Likewise, I just left some of the elements of `Element` as `String` when they really should be numeric, but my intent was not to produce a final app, but rather just to illustrate the idea behind custom collection views.

See http://stackoverflow.com/a/18529719/1271826.

Developed in Swift on Xcode 8.2.1 for iOS 10 using Swift 3. But, the basic ideas are equally applicable for different versions of Swift and/or Objective-C. 

## License

Copyright &copy; 2017 Robert Ryan. All rights reserved.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

--

9 January 2017
