/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAAPI.m
 *
 *  Copyright (c) 2012 Josh Avant
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a
 *  copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.
 *
 *  If we meet some day, and you think this stuff is worth it, you can buy me a
 *  beer in return.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

#import "JAAPI.h"
#import "AFJSONRequestOperation.h"
#import "JAAnswer.h"
#import "JAUser.h"

@implementation JAAPI

#define FAILURE_BLOCK ^(AFHTTPRequestOperation *operation, NSError *error) {[blockDelegate requestDidFailJAAPI:blockSelf];}

+ (JAAPI *)sharedClient
{
    static JAAPI *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[JAAPI alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) return nil;
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

#pragma mark - Answers

- (void)getNewestAnswersWithDelegate:(id<JAAPIDataConsumer>)delegate
{
    __weak JAAPI *blockSelf = self;
    __weak id<JAAPIDataConsumer> blockDelegate = delegate;
    
    JAAPISuccessBlock success = ^(AFHTTPRequestOperation *operation, id responseObject) {
        if([blockDelegate respondsToSelector:@selector(JAAPI:didReceiveAnswers:)])
        {
            NSArray *responseAnswers = [responseObject objectForKey:@"answers"];
            NSMutableArray *outputArray = [NSMutableArray array];
            
            for(NSDictionary *answerDict in responseAnswers)
            {
                JAAnswer *anAnswer = [[JAAnswer alloc] initWithResponseDictionary:answerDict];
                [outputArray addObject:anAnswer];
            }
            
            [blockDelegate JAAPI:blockSelf didReceiveAnswers:outputArray];
        }
    };
        
    [self getPath:@"answers" parameters:nil success:success failure:FAILURE_BLOCK];
}

#pragma mark - Top Users

- (void)getTopiOSUsersWithDelegate:(id<JAAPIDataConsumer>)delegate
{
    __weak JAAPI *blockSelf = self;
    __weak id<JAAPIDataConsumer> blockDelegate = delegate;
    
    JAAPISuccessBlock success = ^(AFHTTPRequestOperation *operation, id responseObject) {
        if([blockDelegate respondsToSelector:@selector(JAAPI:didReceiveTopiOSUsers:)])
        {
            NSArray *responseUsers = [responseObject objectForKey:@"top_users"];
            NSMutableArray *outputArray = [NSMutableArray array];
            
            for(NSDictionary *topUserDict in responseUsers)
            {
                JAUser *aUser = [[JAUser alloc] initWithResponseDictionary:[topUserDict objectForKey:@"user"]];
                [outputArray addObject:aUser];
            }
            
            [blockDelegate JAAPI:blockSelf didReceiveTopiOSUsers:outputArray];
        }
    };
    
    [self getPath:@"tags/ios/top-answerers/all-time" parameters:nil success:success failure:FAILURE_BLOCK];
}

@end