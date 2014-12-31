//
//  ViewController.m
//  SimpleScrollView
//
//  Created by NguyenHaGiang on 12/28/14.
//  Copyright (c) 2014 NGUYENHAGIANG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()<UIPageViewControllerDelegate>
{
    __weak IBOutlet UIScrollView *_scrollViewMain;
    
    IBOutlet UIView *_tableView1;
    IBOutlet UIView*_tableView2;
    IBOutlet UIView *_tableView3;
    int page;
    
    CGPoint panStart;
    CGPoint startPoint;
    UIView *_headerView;
    CGFloat _headerViewInitialY;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)initUI {

    CGRect frame = _tableView1.frame;
    frame.origin.y = 0;
    _tableView1.frame = frame;
    _tableView1.backgroundColor  = [UIColor redColor];
    [_scrollViewMain addSubview:_tableView1];
    
    frame = _tableView2.frame;
    frame.origin.y = _tableView1.frame.size.height;
    _tableView2.frame = frame;
    _tableView2.backgroundColor  = [UIColor yellowColor];
    [_scrollViewMain addSubview:_tableView2];
    
    frame = _tableView3.frame;
    frame.origin.y = _tableView1.frame.size.height + _tableView2.frame.size.height;
    _tableView3.frame = frame;
    _tableView3.backgroundColor  = [UIColor blueColor];
    [_scrollViewMain addSubview:_tableView3];
    page =0;
    [_scrollViewMain setContentSize:CGSizeMake(320, _tableView1.bounds.size.height +_tableView2.bounds.size.height +_tableView3.bounds.size.height)];
    _scrollViewMain.delegate = self;
    
    _scrollViewMain.pagingEnabled = YES;
    UIPanGestureRecognizer * peter = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    peter.delegate = self;
    
    [_scrollViewMain addGestureRecognizer:peter];
}

- (void)createHeaderView:(UIView*)headerView {
    _headerViewInitialY = _headerView.frame.origin.y;
    [_scrollViewMain addSubview:_headerView];
    _scrollViewMain.delegate = self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
-(void)handlePan:(UIPanGestureRecognizer*)recognizer{
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            
            break;
        }
        case UIGestureRecognizerStateChanged:{
            
            //            [self checkPage];
            // _scrollViewMain.scrollEnabled = NO;
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:{
            //[self movetoPage];
        }
            
        case UIGestureRecognizerStateCancelled:
            [self movetoPage];
            //            [self showDocumentPage:currentPage];
            
            break;
            
            
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"log content offset: %f",_scrollViewMain.contentOffset.y);
    
//    CGRect headerFrame = _headerView.frame;
//    
//    headerFrame.origin.y = MAX(_headerViewInitialY, scrollView.contentOffset.y);
//    _headerView.frame = headerFrame;
//    _headerView.backgroundColor = [U]
    //NSLog(@"log content inset top: %f",_scrollViewMain.contentInset.top);
    //[self checkPage];
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
//
//    if (page ==0) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 0) animated:YES];
//        return;
//    }
//
//    if (page ==1) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 568) animated:YES];
//        return;
//    }
//
//    if (page ==2) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 1136) animated:YES];
//        return;
//    }
//}

//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    if (page ==0) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 0) animated:YES];
//        return;
//    }
//
//    if (page ==1) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 568) animated:YES];
//        return;
//    }
//
//    if (page ==2) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 1136) animated:YES];
//        return;
//    }
//
//}

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    NSLog(@"did end scroll animation");
//
//
//
//}
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//
//      NSLog(@"Begin");
//    [self checkPage];
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//
//    NSLog(@"End");
//    [self movetoPage];
//}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
//    NSLog(@"log velocity: %f  %f, log target contentoffset %f  %f",velocity.x, velocity.y, targetContentOffset->x, targetContentOffset->y);
//}

- (void) checkPage{
    if (_scrollViewMain.contentOffset.y < 200) {
        //[_scrollViewMain setContentOffset:CGPointMake(0, 568) animated:YES];
        page = 0;
        return;
    } else if (_scrollViewMain.contentOffset.y < 400) {
        page = 1;
        return;
    } else if (_scrollViewMain.contentOffset.y < 1400) {
        page = 2;
        return;
    }
}
//
//- (void) movetoPage{
//        _scrollViewMain.alwaysBounceVertical = NO;
//    if (page ==0) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 0) animated:YES];
//
//        return;
//    }
//
//    if (page ==1) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, _view1.frame.size.height) animated:YES];
//        _scrollViewMain.alwaysBounceVertical = NO;
//        return;
//    }
//
//    if (page ==2) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 960) animated:YES];
//        _scrollViewMain.alwaysBounceVertical = NO;
//        return;
//    }
//}
- (void) movetoPage{
    //_scrollViewMain.alwaysBounceVertical = NO;
    
    _scrollViewMain.alwaysBounceVertical = NO;
    if ((740 < _scrollViewMain.contentOffset.y && _scrollViewMain.contentOffset.y <790 ) || (670 < _scrollViewMain.contentOffset.y && _scrollViewMain.contentOffset.y <740 )) {
        
        CGPoint offset = CGPointMake(0, _tableView1.frame.size.height+_tableView2.frame.size.height) ;
        
        [_scrollViewMain setContentOffset:offset animated:YES];
        
       // _scrollViewMain.alwaysBounceVertical = NO;
        
        return;
    } else if ((200< _scrollViewMain.contentOffset.y &&  _scrollViewMain.contentOffset.y<300 ) ||(300< _scrollViewMain.contentOffset.y &&  _scrollViewMain.contentOffset.y<400 ) ){
        [_scrollViewMain setContentOffset:CGPointMake(0,  _tableView1.frame.size.height) animated:YES];
        
        //_scrollViewMain.alwaysBounceVertical = NO;
        
        //page ++;
        return;
    } else if (_scrollViewMain.contentOffset.y < 150) {
        [_scrollViewMain setContentOffset:CGPointMake(0, 0) animated:YES];
        //_scrollViewMain.alwaysBounceVertical = NO;
        return;
    }
    
    else {
        NSLog(@"Scroll End");
    }
    
    //    if (page ==2) {
    //        [_scrollViewMain setContentOffset:CGPointMake(0, 960) animated:YES];
    //        _scrollViewMain.alwaysBounceVertical = NO;
    //        return;
    //    }
}


//- (void) movetoPage{
//    _scrollViewMain.alwaysBounceVertical = NO;
//
//
//    if ((740 < _scrollViewMain.contentOffset.y && _scrollViewMain.contentOffset.y <790 ) || (670 < _scrollViewMain.contentOffset.y && _scrollViewMain.contentOffset.y <740 )) {
//
//        CGPoint offset = CGPointMake(0, _view1.frame.size.height+_view2.frame.size.height) ;
//
//        [_scrollViewMain setContentOffset:offset animated:YES];
//
//        _scrollViewMain.alwaysBounceVertical = NO;
//
//        return;
//    } else if ((200< _scrollViewMain.contentOffset.y &&  _scrollViewMain.contentOffset.y<280 ) ||(290< _scrollViewMain.contentOffset.y &&  _scrollViewMain.contentOffset.y<370 ) || (570< _scrollViewMain.contentOffset.y &&  _scrollViewMain.contentOffset.y<670 ) ){
//          [_scrollViewMain setContentOffset:CGPointMake(0,  _view1.frame.size.height) animated:YES];
//
//        _scrollViewMain.alwaysBounceVertical = NO;
//
//          //page ++;
//          return;
//    } else if (_scrollViewMain.contentOffset.y < 180 ||  (180< _scrollViewMain.contentOffset.y && _scrollViewMain.contentOffset.y<300 )) {
//        [_scrollViewMain setContentOffset:CGPointMake(0, 0) animated:YES];
//        _scrollViewMain.alwaysBounceVertical = NO;
//        return;
//    }
//
//      else {
//        NSLog(@"Scroll End");
//    }
//
////    if (page ==2) {
////        [_scrollViewMain setContentOffset:CGPointMake(0, 960) animated:YES];
////        _scrollViewMain.alwaysBounceVertical = NO;
////        return;
////    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//#pragma mark - UITableView DataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 5;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        cell.backgroundColor = [UIColor clearColor];
//    }
//    cell.textLabel.text = @"Hi";
//    
//    return cell;
//}



@end
