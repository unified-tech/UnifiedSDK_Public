Pod::Spec.new do |s|
s.name              = 'UnifiedSDK'
s.version           = '1.0.2'
s.summary           = 'UnifiedSDK indoor positioning for iOS.'
s.homepage          = 'http://unifiedapp.com'

s.author            = { 'Name' => 'info@unifiedapp.com' }
s.license           = { :type => 'CUSTOM', :text => <<-LICENSE
****************************************************************************************************************************
UnifiedSDK for iOS is offered under Unified's END USER LICENSE AGREEMENT. You can obtain the license from the below link:
http://unifiedapp.com/unified-sdk-eula/
****************************************************************************************************************************
LICENSE
}

s.platform          = :ios
s.source            = { :http => 'https://github.com/unified-tech/UnifiedSDK_Public/releases/download/v1.0.2/UnifiedSDK.zip' }

s.ios.deployment_target = '10.0'
s.ios.vendored_frameworks = 'UnifiedSDK.framework'

end
