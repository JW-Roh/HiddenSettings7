#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "substrate.h"


@interface SBPrototypeController : NSObject
+ (id)sharedInstance;
+ (void)reloadDefaults;
- (void)_updatePreventingLockover;
- (void)_configureForDefaults;
- (void)_changeActiveTestRecipeIfNecessary;
- (void)_tearDownSettingsWindow;
- (struct CGRect)_offscreenFrame;
- (void)_hideSettings;
- (void)_showSettings;
- (id)_testRecipeClassNames;
- (void)settings:(id)fp8 changedValueForKey:(id)fp12;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)setActiveTestRecipe:(id)fp8;
- (void)showOrHide;
- (BOOL)isPrototypingEnabled;
- (id)activeTestRecipe;
- (BOOL)isShowingSettingsUI;
- (id)rootSettings;
@end


@protocol SBControlCenterSectionViewControllerDelegate <NSObject>
- (void)sectionWantsControlCenterDismissal:(id)fp8;
- (void)section:(id)fp8 updateStatusText:(id)fp12 reason:(id)fp16;
- (void)noteSectionEnabledStateDidChange:(id)fp8;
@end

@interface SBControlCenterSectionViewController : UIViewController
+ (Class)viewClass;
- (void)setDelegate:(id)fp8;
- (id)delegate;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)noteSettingsDidUpdate:(id)fp8;
- (struct CGSize)contentSizeForOrientation:(int)fp8;
- (BOOL)enabledForOrientation:(int)fp8;
- (id)view;
/*
 com.apple.controlcenter.settings
 com.apple.controlcenter.brightness 
 com.apple.controlcenter.media-controls
 com.apple.controlcenter.air-stuff 
 com.apple.controlcenter.quick-launch 
 */
- (id)sectionIdentifier;
- (void)loadView;
@end

@class SBControlCenterViewController;

@interface SBControlCenterContentView : UIView {
	//NSMutableArray *_dividerViews;
	//UIViewController *_viewController;
	//SBControlCenterGrabberView *_grabberView;
	//SBCCSettingsSectionController *_settingsSection;
	//SBControlCenterSectionViewController *_brightnessSection;
	//SBControlCenterSectionViewController *_mediaControlsSection;
	//SBControlCenterSectionViewController *_airplaySection;
	//SBCCQuickLaunchSectionController *_quickLaunchSection;
}

- (void)setQuickLaunchSection:(id)fp8;
- (SBControlCenterSectionViewController *)quickLaunchSection;
- (void)setAirplaySection:(id)fp8;
- (SBControlCenterSectionViewController *)airplaySection;
- (void)setMediaControlsSection:(id)fp8;
- (id)mediaControlsSection;
- (void)setBrightnessSection:(id)fp8;
- (id)brightnessSection;
- (void)setSettingsSection:(id)fp8;
- (id)settingsSection;
- (void)setGrabberView:(id)fp8;
- (id)grabberView;
- (void)setViewController:(id)fp8;
- (SBControlCenterViewController *)viewController;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)layoutSubviews;
- (void)_iPhone_layoutSubviewsInBounds:(struct CGRect)fp8 orientation:(int)fp24;
- (void)_iPad_layoutSubviewsInBounds:(struct CGRect)fp8 orientation:(int)fp24;
- (void)updateSectionVisibility:(id)fp8 animated:(BOOL)fp12;
- (void)updateEnabledSections;
- (void)_removeSectionController:(id)fp8;
- (void)_addSectionController:(id)fp8;
- (float)contentHeightForOrientation:(int)fp8;
- (id)_separatorAtIndex:(unsigned int)fp8;
- (id)_allSections;
@end

@interface SBControlCenterContentContainerView : UIView
- (void)setContentHeight:(float)fp8;
- (float)contentHeight;
- (void)setContentView:(id)fp8;
- (SBControlCenterContentView *)contentView;
- (void)setBackdropView:(id)fp8;
- (id)backdropView;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)layoutSubviews;
@end

@interface SBControlCenterContainerView : UIView
- (SBControlCenterContentContainerView *)contentContainerView;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillFinishTransitionOpen:(BOOL)fp8 withDuration:(double)fp12;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)_updateContentFrame;
- (void)_updateDarkeningFrame;
- (void)layoutSubviews;
@end

@interface SBControlCenterViewController : NSObject /* <..., SBControlCenterSectionViewControllerDelegate, ...>*/ {
	//SBControlCenterContainerView *_containerView;
	//SBControlCenterContentView *_contentView;
	//NSMutableArray *_sectionList;
	//SBControlCenterSettings *_settings;
}
- (BOOL)isTransitioning;
- (BOOL)isPresented;
- (void)_updateContentFrame;
- (void)viewDidAppear:(BOOL)fp8;
- (void)viewDidLoad;
- (void)loadView;
- (void)section:(id)fp8 updateStatusText:(id)fp12 reason:(id)fp16;
- (void)noteSectionEnabledStateDidChange:(id)fp8;
- (void)sectionWantsControlCenterDismissal:(id)fp8;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillFinishTransitionOpen:(BOOL)fp8 withDuration:(double)fp12;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (float)contentHeightForOrientation:(int)fp8;
@end

@interface SBControlCenterController : NSObject {
	//SBControlCenterWindow *_window;
	//SBControlCenterRootView *_rootView;
	//SBControlCenterViewController *_viewController;
}
+ (void)notifyControlCenterControl:(id)fp8 didActivate:(BOOL)fp12;
+ (id)sharedInstanceIfExists;
+ (id)sharedInstance;
+ (id)_sharedInstanceCreatingIfNeeded:(BOOL)fp8;
- (void)setFullyRevealed:(BOOL)fp8;
- (BOOL)isFullyRevealed;
- (BOOL)isTransitioning;
- (BOOL)isPresented;
- (id)coveredApplication;
- (void)setInGrabberOnlyMode:(BOOL)fp8;
- (BOOL)inGrabberOnlyMode;
- (BOOL)isUILocked;
- (void)_endPresentation;
- (void)_beginPresentation;
- (id)_window;
- (BOOL)isGrabberVisible;
- (BOOL)isVisible;
- (void)loadView;
@end

@interface SBUIControlCenterButton : UIButton
@end

@interface SBCCButtonLikeSectionView : UIControl {
	//UIView *_darken;
	//SBUIControlCenterButton *_button;
	//SBUIControlCenterLabel *_label;
}
- (void)button:(id)fp8 didChangeState:(int)fp12;
- (void)buttonTapped:(id)fp8;
- (void)setSelected:(BOOL)fp8;
- (void)setHighlighted:(BOOL)fp8;
- (void)setEnabled:(BOOL)fp8;
- (void)layoutSubviews;
- (void)setImage:(id)fp8;
- (void)setText:(id)fp8;
- (void)setNumberOfLines:(int)fp8;
- (void)setFont:(id)fp8;
- (id)font;
- (BOOL)_shouldAnimatePropertyWithKey:(id)fp8;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)fp8;
@end


@interface SBCCHiddenSettingsSectionController : SBControlCenterSectionViewController
- (void)showSettingsTapped:(id)section;
@end

%subclass SBCCHiddenSettingsSectionController : SBControlCenterSectionViewController

%new
- (void)showSettingsTapped:(id)section {
	Class SBPrototypeController = objc_getClass("SBPrototypeController");
	[[SBPrototypeController sharedInstance] showOrHide];
}

- (void)viewDidDisappear:(BOOL)animated {
	%orig;
}
- (void)viewWillAppear:(BOOL)animated {
	%orig;
}
- (void)viewDidLoad {
	%orig;
	
	SBCCButtonLikeSectionView *section = [[%c(SBCCButtonLikeSectionView) alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
	[section setText:@"SpringBoard Settings"];
	[section setEnabled:YES];
	[section setNumberOfLines:1];
	[section addTarget:self action:@selector(showSettingsTapped:) forControlEvents:UIControlEventTouchUpInside];
	section.tag = 0xbeef;
	[self.view addSubview:section];
	[section release];
}

- (CGSize)contentSizeForOrientation:(int)orientation {
	CGSize size = %orig;
	
	return size;
}

- (id)sectionIdentifier {
	return @"me.devbug.controlcenter.hiddensettings7";
}

- (void)dealloc {
	UIView *section = [self.view viewWithTag:0xbeef];
	[section removeFromSuperview];
	
	%orig;
}

- (void)viewWillLayoutSubviews {
	%orig;
	
	UIView *section = [self.view viewWithTag:0xbeef];
	if (section) {
		section.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
}

%end



static SBCCHiddenSettingsSectionController *hiddenSettingsController = nil;


%hook SBControlCenterContentView

- (void)_addSectionController:(SBControlCenterSectionViewController *)sectionViewController {
	if ([sectionViewController.sectionIdentifier isEqualToString:@"com.apple.controlcenter.quick-launch"]) {
		[hiddenSettingsController setDelegate:self.viewController];
		[self _addSectionController:hiddenSettingsController];
	}
	%orig;
}
- (void)_removeSectionController:(SBControlCenterSectionViewController *)sectionViewController {
	if ([sectionViewController.sectionIdentifier isEqualToString:@"com.apple.controlcenter.quick-launch"]) {
		[self _removeSectionController:hiddenSettingsController];
	}
	%orig;
}
- (void)_iPhone_layoutSubviewsInBounds:(CGRect)mainBounds orientation:(int)orientation {
	%orig;
	
	CGRect quickLaunchFrame = self.quickLaunchSection.view.frame;
	hiddenSettingsController.view.frame = CGRectMake(quickLaunchFrame.origin.x, quickLaunchFrame.origin.y - 40, quickLaunchFrame.size.width, 40);
}

- (void)_iPad_layoutSubviewsInBounds:(CGRect)mainBounds orientation:(int)orientation {
	%orig;
	
	CGRect quickLaunchFrame = self.quickLaunchSection.view.frame;
	hiddenSettingsController.view.frame = CGRectMake(quickLaunchFrame.origin.x, quickLaunchFrame.origin.y - 40, quickLaunchFrame.size.width, 40);
}

%end


%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
	%orig;
	
	hiddenSettingsController = [[%c(SBCCHiddenSettingsSectionController) alloc] init];
}

- (void)_menuButtonWasHeld {
	Class SBPrototypeController = objc_getClass("SBPrototypeController");
	[[SBPrototypeController sharedInstance] showOrHide];
}

%end
