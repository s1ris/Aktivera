#include <UIKit/UIKit.h>
#include <CoreGraphics/CoreGraphics.h>
#include <QuartzCore/QuartzCore.h>
#import "myVieww.h"

@interface aktivera < UITableViewDelegate, UITableViewDataSource >
	UIViewController *newView;
	UITableView *myTable;
	UISwitch *mySwitch;
	UISwitch *mySwitch2;
	myVieww *blah;
@end



@interface minecraftpeViewController : UIViewController < UITableViewDelegate, UITableViewDataSource >
-(void) loadStuff;
-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath;
-(NSInteger) numberOfSectionsInTableView:(UITableView *) tableView;
-(NSString *) tableView:(UITableView *) tableView titleForHeaderInSection:(NSInteger) section;
-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIView *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
@end

%hook minecraftpeViewController

-(void) viewDidLoad {
    %orig;
    newView = self;
    [self loadStuff];
}
-(void)dealloc {
    %orig;
    [myTable release];
    [newView release];
    [mySwitch release];
    [mySwitch2 release];
}
%new 
-(void) loadStuff {
	blah = [[myVieww alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
	blah.backgroundColor = [UIColor blackColor];
	blah.layer.cornerRadius = 5;
	[blah setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
	[newView.view addSubview:blah];
	myTable =[[[UITableView alloc] initWithFrame: CGRectMake (15, 15, blah.frame.size.width - 30, blah.frame.size.height - 30) style:UITableViewStyleGrouped] retain]; 
	[myTable setDataSource:self];
	[myTable setDelegate:self];
	myTable.layer.cornerRadius = 5;
	[myTable setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[blah addSubview:myTable];
	mySwitch = [[UISwitch alloc] init];
	mySwitch2 = [[UISwitch alloc] init];
	[mySwitch addTarget:self action:@selector(mySwitchA) forControlEvents:UIControlEventValueChanged];
	[mySwitch2 addTarget:self action:@selector(mySwitchB) forControlEvents:UIControlEventValueChanged];
	BOOL test= [[NSUserDefaults standardUserDefaults] boolForKey:@"switch"];
	[mySwitch setOn:test animated:YES];
	BOOL test1= [[NSUserDefaults standardUserDefaults] boolForKey:@"switch2"];
	[mySwitch2 setOn:test1 animated:YES];
	[blah release];
	[myTable release];
}
%new
-(NSInteger) numberOfSectionsInTableView:(UITableView *) tableView{
  return 1;
}
%new
-(NSString *) tableView:(UITableView *) tableView titleForHeaderInSection:(NSInteger) section{
  NSString *sectionHeader = nil;
  if (section == 0)  {
      sectionHeader =
	@"Aktivera";
    }
  return sectionHeader;
}
%new
- (UIView *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"Created by: @s1ris";
}
%new
-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
	return 3;
}
%new
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
UITableViewCell *cell=nil;
if(indexPath.row== 0){
     static NSString *CellIdentifier = @"CellType1";
     [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if(cell==nil){
     cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellType1"] autorelease];
     cell.accessoryView = mySwitch;
      }
      [cell.textLabel setText:@"InstaHouse"];
      cell.detailTextLabel.text = @"By: @s1ris";
      [mySwitch release];
}
if(indexPath.row== 1){
     static NSString *CellIdentifier = @"CellType2";
     [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if(cell==nil){
     cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellType2"] autorelease];
     cell.accessoryView = mySwitch2;
      }
      [cell.textLabel setText:@"Night Vision"];
      cell.detailTextLabel.text = @"By: @WorldOfGamingTV";
      [mySwitch2 release];
}
if(indexPath.row== 2){
     static NSString *CellIdentifier = @"CellType3";
     [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if(cell==nil){
     cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"CellType3"] autorelease];
      }
      [cell.textLabel setText:@"Dismiss"];
}
return cell;
}
%new
-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
	 if(indexPath.row== 0){}
	 if(indexPath.row== 1){}
	 if(indexPath.row== 2){
	 CGRect tempFrame=blah.frame;
	 tempFrame.size.width = 40;
	 tempFrame.size.height = 40;
	 tempFrame.origin.x = 10;
	 tempFrame.origin.y = 10;
	 [UIView beginAnimations:@"" context:nil];
	 [UIView setAnimationDuration:0.3];
	 blah.frame=tempFrame;
	 [UIView commitAnimations];
     }
     [myTable deselectRowAtIndexPath:indexPath animated:YES];
}
%new
-(void) mySwitchA {
    [[NSUserDefaults standardUserDefaults] setBool:mySwitch.on forKey:@"switch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if([mySwitch isOn]) {
    }
    else {
    }
}
%new
-(void) mySwitchB {
    [[NSUserDefaults standardUserDefaults] setBool:mySwitch2.on forKey:@"switch2"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if([mySwitch2 isOn]) {
    }
    else {
    }
}
%end
