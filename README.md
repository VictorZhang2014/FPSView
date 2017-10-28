# FPSView
FPSView is a simple tool that detects FPS(Frame Per Second) for iOS only.

## Effect Pictures
![FPSView 1](https://github.com/VictorZhang2014/FPSView/blob/master/images/FPSView_1.jpg "FPSView 1")
![FPSView 2](https://github.com/VictorZhang2014/FPSView/blob/master/images/FPSView_2.jpg "FPSView 2")
![FPSView 3](https://github.com/VictorZhang2014/FPSView/blob/master/images/FPSView_3.jpg "FPSView 3")
![FPSView 4](https://github.com/VictorZhang2014/FPSView/blob/master/images/FPSView_4.jpg "FPSView 4")

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
- FPS value greater than 55.0, which means UI smoothly;
- FPS value greater than or equal to 50.0, and less than or equal to 55.0, which means UI stuck subtlely;
- The rest of value means UI stuck severely.


