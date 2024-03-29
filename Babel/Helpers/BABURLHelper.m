//
//  BABURLHelper.m
//  Babel
//
//  Created by Renzo Crisostomo on 27/07/14.
//  Copyright (c) 2014 Renzo Crisóstomo. All rights reserved.
//

#import "BABURLHelper.h"
#import "BABLanguage.h"
#import "BABRepository.h"
#import "BABFile.h"

@interface BABURLHelper ()

@end

@implementation BABURLHelper

NSString * const BABGitHubAPIBaseURL = @"https://api.github.com/";
NSString * const BABGitHubClientID = @"";
NSString * const BABGitHubClientSecret = @"";

#pragma mark - Public Methods

+ (NSURL *)URLForAuthorization
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/login/oauth/authorize?client_id=%@",
                                 BABGitHubClientID]];
}

+ (NSURL *)URLForAccessTokenWithCode:(NSString *)code
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/login/oauth/access_token?client_id=%@&client_secret=%@&code=%@",
                                 BABGitHubClientID,
                                 BABGitHubClientSecret,
                                 code]];
}

+ (NSString *)URLStringForBlobWithRepository:(BABRepository *)repository
                                        file:(BABFile *)file
{
    return [NSString stringWithFormat:@"repos/%@/git/blobs/%@",
            repository.name,
            file.sha];
}

+ (NSString *)URLStringForTokenValidityWithToken:(NSString *)token
{
    return [NSString stringWithFormat:@"applications/%@/tokens/%@",
            BABGitHubClientID,
            token];
}

@end