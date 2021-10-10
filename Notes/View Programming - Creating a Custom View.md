[TOC]



## Before Custome View

### NSView

**Basic**

Most of the functionality of NSView class is automatically invoked by AppKit:

- frame

- bounds

- window

- drawRect

  Must implement but rarely invoked explicitly

More: [Displaying Contextual Menus](https://developer.apple.com/documentation/appkit/nsmenu?language=objc#1654572) & [Managing Tooltips](https://developer.apple.com/documentation/appkit/nswindow?language=objc#1662378)

**Subclass**

If you want to create an object that draws itself in a special way, or responds to mouse clicks in a special way, you would subclass NSView. More: [Cocoa Drawing Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CocoaDrawingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40003290) & [Cocoa Event Handling Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/EventOverview/Introduction/Introduction.html#//apple_ref/doc/uid/10000060i)

- mouseDown
- mouseDragged
- mouseUp
- mouseMoved
- mouseEnterd
- mouseExited
- rightMouseDragged
- rightMouseUp
- otherMouseDown
- otherMouseDragged
- otherMouseUp
- scrollWheel
- keyDown
- keyUp
- flagsChanged
- tabletPoint
- tabletProximity

### drawRect

**NSBezierPath**

```objective-c
+ fileRect:	//Fills the specified rectangular path with the current fill color
```



## Creating a Custom View

NSView provides general mechanism for display and handle.

Take `DraggableItemView` for example.

- Allocating and deallocating the view
- Drawing the view content
- Marking portions of the view for updating in response to value changes
- Responding to user-initiated mouse events
- Updating the cursor when the mouse is over the draggable item
- Responding to user-initiated key press events
- Implementing `NSResponder` action methods
- Providing key-value-coding compliant accessors for its settable properties

### Allocating the View

- Designated initializer: `initWithFrame`

  You can also specify another designated initializer but must implement `initWithFrame` using that.

- Initializing view instance in Interface Builder

  - Create

    Interface Builder calls `initWithFrame` when it saves a nib file to achive a view instance. When a nib file is loaded, each view instances receives `awakeFromNib` message, in which you can implement something special.

  - Use for custom view (when you have not created a palette)

    - *Custom View* proxy item: when nib file is loaded, `initWithFrame` will be called.
    - Super class: use `awakeFromNib` to configure itself accordingly

### Drawing View Content

Deferred drawing mechanism

-  `drawRect:`

  At the end of the event loop or in response to an explicit display request, call to cause the view to be redrawn.

- `display...` & `setNeedsDisplay` &`setNeedsDisplayInRect:`

- Customize printed output: [Printing Programming Guide for Mac](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Printing/osxp_aboutprinting/osxp_aboutprt.html#//apple_ref/doc/uid/10000083i)

> drawRect:
>
> - `[super drawRect:]` 
>
>   No need to call if it inherits from `NSView` directly
>
> - Draw background color if needed
>
>   - Set: `[(NSColor *) set]`
>   - Fill: `NSRectFill((NSRect))`





#### Implementing the `drawRect:`

...

[Optimizing View Drawing](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CocoaViewsGuide/Optimizing/Optimizing.html#//apple_ref/doc/uid/TP40002978-CH11-SW1)

#### Marking a View as Needing Display

Tell the view that its image is invalid:

- Each pass through the event loop, all views need to redisplay

- `setNeedsDisplay` invalidate the view's entire bounds rectangle

  `setNeedsDisplayInRect` invalidate a portion of the view

Autodisplay mechanism

- Actually this process is automatically controlled by window, but you can turn it off using `NSWindow setAutodisplay:`.

- `display` & `displayRect` force the receiver to redisplay immediately

  `displayIfNeeded` &`displayIfNeededInRect` 

  `displayRectIgnoringOpacity` & `displayIfNeededIgnoringOpacity` &`displayIfNeededInRectIngoringOpacity`

**Example**

`setNeedsDisplayInRect` if the location or item color are changed, `setNeedsDisplay` if background color is set.

[Key-Value Observing Programming](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html#//apple_ref/doc/uid/10000177i)

#### View Opacity

`display...` method find an opaque background behind the view and begin drawing form there forward.

- If a view instance can guarantee that it will fill all the pixels within its bounds using opaque color, it should override the `isOpaque` and return YES.
- `isOpaque` will be called several times and should be simple

### Responding to User Events and Actions

An NSView subclass overrides the appropriate event handling methods declared by the `NSResponder`. [Cocoa Event Handling Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/EventOverview/Introduction/Introduction.html#//apple_ref/doc/uid/10000060i) for event handling and responder chain.

Responder chain: a view's next responder is its superview.

Mouse events start at the view that the click occurs in. Keyboard events and action start at the first responder.

#### Becoming First Responder

- Views can override `acceptFirstResponder` to return YES to advertise that they can become the first responder. Views receive `becomeFirstResponder` and `resignFirstResponder` message. It returns YES by default, but it can decline sometimes.

- View that become first responder should draw a ==focus ring== to inform the user.
- Key-view loop allows the user to switch between views in a window by pressing the Tab or Shift-Tab keys. Order is set by `nextKeyView` outlet in Interface Builder.

#### Handling Mouse Click and Dragging Events

- Mouse events

  - Mouse down

    View does not receive mouse-down event when it isn't in the frontmost view, key window. Overriding `acceptsFirstMouse` to return YES to make it key window.

    When the user press the mouse button, non-key-window become key window and discard the event. It can be remain by overrideing `accetpsFirstMouse`.

    Window determines which view to send the mouse-down event using `hitTest` of NSView, and then send the event.

    Specify `rightMouseDown:` and `otherMouseDown:` methods respectively.

  - Mouse dragging

    While the mouse button is held down and the mouse moves, the view receives `mouseDragged:` messages.

  - Mouse up

    When the mouse button is released, the view receives a `mouseUp:` message.

  - Mouse movement

#### Tracking Mouse Movements

- Mouse-moved events are initiated by the `NSWindow` instance. 
- `setAcceptsMouseMovedEvents:` &`mouseMoved:`
- For tracking rectangles
  - `addTrackingRect:owner:userData:assumeInside:` & `mouseEnterd:` & `mouseExited:` &`removeTrackingRect:`
  - `resetCursorRects`
  - `addCursorRect:cursor:` &`resetCursorRects` &`removeCursorRect:cursor:` &`discardCursorRects` &`invalidateCursorRectsForView:`

#### Handling Key Events in a View

- `keyDown:`
  - Pass to super: `if(!handled) [super keyDown:event];`
  - Use action to respond: `moveUp` &`moveDown` &`moveLeft` &`moveRight`
- `performKeyEquivalent:`

#### Handling Action Methods via the Responder Chain

Using action through the responder chain: `changeColor`

### Property Accessor Methods

Setter should determine to see if there's a change and so mark the view as needing to redisplay the appropriate portion.

### Deallocating the View

Color should be released.

Invoke `[super dealloc]`

> No need to declare and implement because can not be used explicitly