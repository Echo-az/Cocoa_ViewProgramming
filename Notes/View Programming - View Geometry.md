## View Geometry

**Goal**

- How a view's location and size is specified
- How the size of a view interacts with its content

### The View Coordinate System

Quartx is resolution independent across output devices. But the scaling factors are managed automatically.

Origin(0.0, 0.0) is located in the lower left.

Each view defines and maintains its own coordinate system. Mouse events use the enclosing window's coordinate system, which is easily converted to the view's.

### Understanding a View's Frame and Bounds

A view tracks its size and location using two rectangles: frame and bounds. Frame use the superview's coordinate system. Bounds use the interior coordinate system.

The frame of a view is specified when a view instance is created using the `initWithFrame:`. Method `frame` returns the receiver's frame rectangle. The bounds is set to originate at (0.0, 0.0) and size is set to the same size as the view's frame. Method `bounds` returns it.

Size mismatch: stretched to fill

Frame outside: clipped

### Transforming the Coordinate System

A view's coordinate system: 

- Originate at (0.0, 0.0) in the lower-left corner of its bound rect
- Unit square size is the same as its superview
- Axes are parallel to its frame rect

Translate or scale the coordinate system by alterring the bounds rect:

- `initWithFrame` or nib file alter that directly
- `setBounds:` `setBoundsOrigin:`&`setBoundsSize:`
- `translateOriginToPoint:` & `scaleUnitSquareToSize:`

Set a view's coordinate system as flipped by overridng `isFlipped` method

Rotate the coordinate system by `setBoundsRotation:`