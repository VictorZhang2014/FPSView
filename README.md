# FPSView
FPSView is a simple tool that detects FPS(Frame Per Second) for iOS only.

## Effect Pictures
![FPSView 1](https://github.com/VictorZhang2014/FPSView/blob/master/images/FPSView_1.jpg "FPSView")
![FPSView 2](https://github.com/VictorZhang2014/FPSView/tree/master/images/FPSView_2.jpg "FPSView")
![FPSView 3](https://github.com/VictorZhang2014/FPSView/tree/master/images/FPSView_3.jpg "FPSView")
![FPSView 4](https://github.com/VictorZhang2014/FPSView/tree/master/images/FPSView_4.jpg "FPSView")

## Usage
One line code is okay, and put it in the method of `didFinishLaunchingWithOptions`
```
#import "FPSView.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FPSView show];
    return YES;
}
```

## FPS Value Explanation
FPS value greater than 55.0, which means UI smoothly;
FPS value greater than or equal to 50.0, and less than or equal to 55.0, which means UI stuck subtlely;
the rest of value means UI stuck severely.


