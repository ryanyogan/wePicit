//
//  FBLoginViewController.m
//  FBParse
//

#import "FBLoginViewController.h"

@interface FBLoginViewController () <CommsDelegate>
@property (nonatomic, strong) IBOutlet UIButton *btnLogin;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityLogin;
@end

@implementation FBLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void) viewDidLoad
{
	[super viewDidLoad];
}

// Outlet for FBLogin button
- (IBAction) loginPressed:(id)sender
{
    // Disable the login button to prevent multiple touches
    [_btnLogin setEnabled:NO];
    // Show an activity indicator
    [_activityLogin startAnimating];
    // Do the login
    [Comms login:self];
}

- (void) commsDidLogin:(BOOL)loggedIn {
	// Re-enable the Login button
	[_btnLogin setEnabled:YES];
    
	// Stop the activity indicator
	[_activityLogin stopAnimating];
    
	// Did we login successfully ?
	if (loggedIn) {
		// Seque to the Image Wall
		[self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
	} else {
		// Show error alert
		[[[UIAlertView alloc] initWithTitle:@"Login Failed"
                                    message:@"Facebook Login failed. Please try again"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil] show];
	}
}

@end
