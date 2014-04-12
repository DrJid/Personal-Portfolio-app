//
//  MapViewController.m
//  RPSlidingMenuDemo
//
//  Created by Maijid Moujaled on 4/12/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "JPSThumbnailAnnotation.h"


@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    
    /*
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate =
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
    */
    
    
    /*
    MKMapPoint points[3];

    //Get a bunch of coordinates!!!
    //Create two coordinates.
    CLLocationCoordinate2D startLocation;
    startLocation.latitude = 39.281516;
    startLocation.longitude= 76.580806;
    points[0] = MKMapPointForCoordinate(startLocation);
    
    CLLocationCoordinate2D endLocation;
    endLocation.latitude = 41.281516;
    endLocation.longitude= 92.580806;
    points[1] = MKMapPointForCoordinate(endLocation);
    
    //------
    CLLocationCoordinate2D otherLocation;
    otherLocation.latitude = 60.281516;
    otherLocation.longitude= 76.580806;
    points[2] = MKMapPointForCoordinate(otherLocation);
    
    
    //Create annoations for all those coordinateSS!!!
    
    MKPointAnnotation *sourceAnnotation = [MKPointAnnotation new];
    sourceAnnotation.coordinate = startLocation;
    sourceAnnotation.title = @"Lea";
    sourceAnnotation.subtitle = @"Loving the life!";
    
    MKPointAnnotation *destinationAnnotation = [MKPointAnnotation new];
    destinationAnnotation.coordinate = endLocation;
    destinationAnnotation.title = @"Daniel";
    destinationAnnotation.subtitle = @"Notes on storytelling.";
    
    
    MKPointAnnotation *otherAnnotation = [MKPointAnnotation new];
    otherAnnotation.coordinate = otherLocation;
    otherAnnotation.title = @"Maijid";
    otherAnnotation.subtitle = @"I dunno.. whatever.";
    
    CLLocationCoordinate2D coords[3] = {startLocation, endLocation, otherLocation};
    MKGeodesicPolyline *polyline = [MKGeodesicPolyline polylineWithCoordinates:coords count:3];
    
    [self.mapView addAnnotations:@[sourceAnnotation, destinationAnnotation, otherAnnotation]];
    [self.mapView addOverlay:polyline level:MKOverlayLevelAboveRoads];
    
//    NSUInteger boundingRegion = 3;
    MKCoordinateRegion boundingRegion = CoordinateRegionBoundingMapPoints(points, 3);
    
    boundingRegion.span.latitudeDelta *= 1.1f;
    boundingRegion.span.longitudeDelta *= 1.1f;
    [self.mapView setRegion:boundingRegion animated:YES];
    */
    
    // Annotations
    [self.mapView addAnnotations:[self annotations]];

}

- (MKOverlayRenderer*)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc]
                                        initWithPolyline:(MKPolyline*)overlay];
        
        /*
         if (overlay == _route.flyPartPolyline) {
         renderer.strokeColor = [UIColor redColor];
         } else {
         renderer.strokeColor = [UIColor blueColor];
         }
         */
        renderer.strokeColor = [UIColor colorWithRed:1.000 green:0.522 blue:0.525 alpha:1.000];
        return renderer;
    }
    return nil;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)annotations {
    
    // PRESEC
    JPSThumbnail *presec = [[JPSThumbnail alloc] init];
    presec.image = [UIImage imageNamed:@"presec"];
    presec.title = @"Presby Boys High School";
    presec.subtitle = @"Male boarding school in GH";
    presec.coordinate = CLLocationCoordinate2DMake(5.555f, -0.1963f);

    presec.disclosureBlock = ^{ NSLog(@"selected presec"); };
    
    // AIT
    JPSThumbnail *AIT = [[JPSThumbnail alloc] init];
    AIT.image = [UIImage imageNamed:@"ait"];
    AIT.title = @"Aquincum Institute of Technology";
    AIT.subtitle = @"Study abroad in Hungary";
    AIT.coordinate = CLLocationCoordinate2DMake(47.49f, 19.03f);
    AIT.disclosureBlock = ^{ NSLog(@"selected ait"); };
    

    // North Muskegon
    JPSThumbnail *nm = [[JPSThumbnail alloc] init];
    nm.image = [UIImage imageNamed:@"nm"];
    nm.title = @"North Muskegon High School";
    nm.subtitle = @"HS Exchange Program";
    nm.coordinate = CLLocationCoordinate2DMake(42.33f, -83.04);
    nm.disclosureBlock = ^{ NSLog(@"selected nm"); };
    
    // Grinnell College!! !
    
    JPSThumbnail *grinnell = [[JPSThumbnail alloc] init];
grinnell.image = [UIImage imageNamed:@"laurel"];
    grinnell.title = @"Grinnell College!";
    grinnell.subtitle = @"CS undergrad";
    grinnell.coordinate = CLLocationCoordinate2DMake(41.661, -91.530);
    grinnell.disclosureBlock = ^{ NSLog(@"selected grinnell"); };
    

    
    // Set up points for bounding zone
    MKMapPoint points[4];
    points[0] = MKMapPointForCoordinate(presec.coordinate);
    points[1] = MKMapPointForCoordinate(AIT.coordinate);
    points[2] = MKMapPointForCoordinate(nm.coordinate);
    points[3] = MKMapPointForCoordinate(grinnell.coordinate);
    MKCoordinateRegion boundingRegion = CoordinateRegionBoundingMapPoints(points, 4);
    
    boundingRegion.span.latitudeDelta *= 1.1f;
    boundingRegion.span.longitudeDelta *= 1.1f;
    [self.mapView setRegion:boundingRegion animated:YES];
    

    CLLocationCoordinate2D coords[4] = {presec.coordinate, AIT.coordinate, nm.coordinate, grinnell.coordinate};
    MKGeodesicPolyline *polyline = [MKGeodesicPolyline polylineWithCoordinates:coords count:4];
    [self.mapView addOverlay:polyline level:MKOverlayLevelAboveRoads];


    
    return @[[JPSThumbnailAnnotation annotationWithThumbnail:presec],
             [JPSThumbnailAnnotation annotationWithThumbnail:AIT],
             [JPSThumbnailAnnotation annotationWithThumbnail:nm],
             [JPSThumbnailAnnotation annotationWithThumbnail:grinnell]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}





- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}


MKCoordinateRegion CoordinateRegionBoundingMapPoints(MKMapPoint *points, NSUInteger count) {
    if (count == 0) {
        return MKCoordinateRegionForMapRect(MKMapRectWorld);
    }
    
    MKMapRect boundingMapRect;
    boundingMapRect.origin = points[0];
    boundingMapRect.size = MKMapSizeMake(0.0, 0.0);
    
    for (NSUInteger i = 1; i < count; i++) {
        MKMapPoint point = points[i];
        if (!MKMapRectContainsPoint(boundingMapRect, point)) {
            boundingMapRect = MKMapRectUnion(boundingMapRect, (MKMapRect){.origin=point,.size={0.0,0.0}});
        }
    }
    
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(boundingMapRect);
    region.span.latitudeDelta = MAX(region.span.latitudeDelta, 0.001);
    region.span.longitudeDelta = MAX(region.span.longitudeDelta, 0.001);
    
    return region;
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didSelectAnnotationViewInMap:mapView];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didDeselectAnnotationViewInMap:mapView];
    }
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if ([annotation conformsToProtocol:@protocol(JPSThumbnailAnnotationProtocol)]) {
        return [((NSObject<JPSThumbnailAnnotationProtocol> *)annotation) annotationViewInMap:mapView];
    }
    
    NSLog(@"Annotation class: %@", [annotation class]);
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        static NSString *identifier = @"StoryRoute";
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mapView
                                                                      dequeueReusableAnnotationViewWithIdentifier:identifier];
        // if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        annotationView.pinColor = MKPinAnnotationColorGreen;
        
        NSLog(@"subtitle: %@", annotation.subtitle);
        
        NSLog(@"an t: %@", annotation.title);
        
        
        
        UIImage *image = nil;
        if ([annotation.title isEqualToString:@"Lea"]) {
            image = [UIImage imageNamed:@"grinnell_college_1"];
        } else {
            image = [UIImage imageNamed:@"trigang.jpg"];
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        //        PFImageView *imageView = [[PFImageView alloc] init];
        //        imageView.file = imageFile;
        //        [imageView loadInBackground];
        //        imageView.contentMode = UIViewContentModeScaleAspectFit;
        //        imageView.frame = CGRectMake(0, 0, 35, 35);
        annotationView.leftCalloutAccessoryView = imageView;
        //
        
        // UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //[rightButton addTarget:self action:@selector(showLocationDetails:)forControlEvents:UIControlEventTouchUpInside];
        //            annotationView.rightCalloutAccessoryView = rightButton;
        /*
         } else {
         annotationView.annotation = annotation;
         }
         */
        UIButton *button = (UIButton *)annotationView.rightCalloutAccessoryView;
        //button.tag = [locations indexOfObject:(Location *)annotation];
        return annotationView;
    }
    return nil;
}



@end
