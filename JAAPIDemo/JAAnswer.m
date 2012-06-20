/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  JAAnswer.m
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

#import "JAAnswer.h"
#import "JAUser.h"

@implementation JAAnswer

@synthesize answerId;
@synthesize accepted;
@synthesize answerCommentsPath;
@synthesize questionId;
@synthesize owner;
@synthesize creationDate;
@synthesize lastEditDate;
@synthesize lastActivityDate;
@synthesize upVoteCount;
@synthesize downVoteCount;
@synthesize score;
@synthesize communityOwned;
@synthesize title;

- (id)initWithResponseDictionary:(NSDictionary *)responseDictionary
{
    self = [super init];
    if (self)
    {
        self.answerId           = [responseDictionary objectForKey:@"answer_id"];
        self.accepted           = [(NSNumber *)[responseDictionary objectForKey:@"accepted"] boolValue];
        self.answerCommentsPath = [responseDictionary objectForKey:@"answer_comments_url"];
        self.questionId         = [responseDictionary objectForKey:@"question_id"];
        self.owner              = [[JAUser alloc] initWithResponseDictionary:[responseDictionary objectForKey:@"owner"]];
        self.creationDate       = [NSDate dateWithTimeIntervalSince1970:[[responseDictionary objectForKey:@"creation_date"] doubleValue]];
        self.lastEditDate       = [NSDate dateWithTimeIntervalSince1970:[[responseDictionary objectForKey:@"last_edit_date"] doubleValue]];
        self.lastActivityDate   = [NSDate dateWithTimeIntervalSince1970:[[responseDictionary objectForKey:@"last_activity_date"] doubleValue]];
        self.upVoteCount        = [responseDictionary objectForKey:@"up_vote_count"];
        self.downVoteCount      = [responseDictionary objectForKey:@"down_vote_count"];
        self.score              = [responseDictionary objectForKey:@"score"];
        self.communityOwned     = [(NSNumber *)[responseDictionary objectForKey:@"community_owned"] boolValue];
        self.title              = [responseDictionary objectForKey:@"title"];        
    }
    return self;
}

@end
