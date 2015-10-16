# SJParallaxHeardView

'UITableview' 'UIScrollowView'

## 视差滚动 heardview 效果

 ```
    SJParalaxHeardView *headerView = [[SJParalaxHeardView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)     backgroundImage:@"bg.jpg" logoImage:@"logo.jpg" title:@"Rock Never Die" subTitle:@"I Am Soldier"];
    headerView.viewController = self;
    headerView.scrollView = self.tableView;
    [self.view addSubview:headerView];
````

 ![image](https://github.com/hsjcom/SJParallaxHeardView/blob/master/SJParallaxHeardView/Resource/QQ20150514-1@2x.png)
 ![image](https://github.com/hsjcom/SJParallaxHeardView/blob/master/SJParallaxHeardView/Resource/QQ20150514-2@2x.png)
 
