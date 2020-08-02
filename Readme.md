This simple banner written in SwiftUI which drops down for a few seconds showing a message before retracting.



<video src="https://raw.githubusercontent.com/eleanorsp/SimpleBannerDemo/master/mdImages/sim.mov" alt="Banner Example" style="zoom:10%;" ></video>



Not too exciting I'm afraid. But it allows you to add different BannerModels (with lots of SwiftUI banner customisation) added to each of your views or use a System notification BannerModel for your whole App.

Once added, the Banner functionality is accessed via a simple @EnvironmentObject statement.

The Demo project shows two BannerModel classes: `BasicBannerModel` and `AppBannerModel`. 

`BasicBannerModel`is the generic model you can subclass your own model off. 

`AppBannerModel`is a simple way of bringing *Info*, *Warning* and *Error* banner notifications to your App. Or you can role your own if you conform to the `GenericBannerProtocol`

The project is using XCode 12 Beta 3 and iOS 14 Beta. But it should work in earlier iOS 13 SwiftUI projects. It's just this project is using the new `@main struct SimpleBannerDemoApp: App` App code.

