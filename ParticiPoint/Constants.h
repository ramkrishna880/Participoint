//
//  Constants.h
//  ParticiPoint
//
//  Created by PTG on 19/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#pragma mark Enmuns

typedef enum : NSUInteger {
    KpickerTypeSchool = 0,
    KpickerTypeOthers,
} KpickerType;


//typedef enum : NSUInteger {
//    KpickerTypeCampus = 0,
//    KpickerTypeSport,
//    KpickerTypeMusic,
//    KpickerTypeTheatre,
//    KpickerTypePosition,
//    KpickerTypeHearUs,
//    KpickerTypeSchool,
//} KpickerType;



static NSString *const PICKERVC_SEGUEID = @"SelectionVCId";


#pragma mark TableCells
static NSString *const GROUPS_CELLID = @"GroupTablecellIdentifier";


#pragma mark -- Others

// convenience hex color conversion macro
#define UIColorFromHEX(hexVal, alphaVal) \
[UIColor colorWithRed:((float)((hexVal & 0xFF0000) >> 16))/255.0 \
green:((float)((hexVal & 0x00FF00) >>  8))/255.0 \
blue:((float)((hexVal & 0x0000FF) >>  0))/255.0 \
alpha:alphaVal]



#endif /* Constants_h */
