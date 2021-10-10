[TOC]





## Working with the View Hierarchy

### What is a View Hierarchy

View hierachy defines the layout of views relative to other views.

Window maintains the top-level view, *content view*. Construted with *subviews* & *superview*.

### Benefits of a View Hierarchy

- Simply subclass `NSView`
- Unified coordinate system
- Clear responsibility for event handling
- Manage redrawing
- Dynamic

### Locating Views in the View Hierarchy

- `superview`&`subviews`&`window`
- `isDescendantOf:`&`ancestoreSharedWithView:`&`opaqueAncestor`

### Adding and Removing Views from a Hierarchy

- `addSubView:`

- `replaceSubview:with:`

- `addSubview:positioned:relativeTo:`, order determines the overlap

- `removeFromSuperview`&`removeFromSuperviewWithoutNeedingDisplay`

  The former invokes the `viewWillMobeToSuperView:` and `viewWillMoveToWindow:`. 

### Repositioning and Resizing Views

#### Moving and resizing views programmatically

Move by frame-setting methods: `setFrame:`, `setFrameOrigin:`, `setFrameSize:`

#### Autoresizing of Subviews

- On by default, `setAutoresizesSubviews:` to off

- Interface builder allows to set a view's autoresizing mask with ==Size inspector==.

- Autoresizing Mask:

  ![image-20210829231616443](/Users/yalinli/Library/Application Support/typora-user-images/image-20210829231616443.png)

- `resizeSubviewsWithOldSize:` invoked every time and send `resizeWithOldSuperviewSize:`message to each subview.

#### Notifications

- `NSViewFrameDidChangeNotification`& `NSViewBoundsDidChangeNotification`
- Use `setPostsFrameChangedNotification:` & `setPostBoundsChangeNotification:` to NO for performance improvement

### Hiding Views

`setHidden:`

- Remains in view hierachy and participates in autoresizing
- Also disable associated cursor/tooltip/tracking rectangle
- `nextValidKeyView` become the new first responder
- Query by `isHidden` or `isHiddenOrHasHiddenAncestor` 

### Converting Coordinates in the View Hierarchy

Coordinates convert among several views.

`convertPoint/Rect/Size:fromView:`

- Window: `nil` 
- Screen: `convertBaseToScreen:`&`convertScreenToBase:`

### Transforming View Coordinates To and From Base Space

`convertPoint/Rect/SizeFrom/ToBase:`  to a window backing store to achieve correct pixel alignment

Conventionally, it's the same as window

For Core Animations layers, it's different

🧐 ==View space & base space==

### View Tags

Define and search with integer tags

- Define by subclasses method `setTag`
- Search depth-first by `viewWithTag`











