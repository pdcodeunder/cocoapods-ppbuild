# cocoapods-ppbuild

利用cocoapods，生成预编译静态库，提高编译速度的插件

## 背景
	
随着项目的不断迭代，项目代码及依赖三方库和内部库越来越多，导致项目编译时间越来越长，浪费大量开发时间。
cocoapods-ppbuild插件将三方库打包为静态库，从而提高项目编译时间

## 插入
````shell
$ gem install cocoapods-ppbuild
````

## 使用
修改 podfile 文件，加入以下代码
#### 1. 使用静态库编译：
````ruby
plugin 'cocoapods-ppbuild'
use_frameworks! :linkage => :static
use_static_binary!
````
使用动态库编译(动态库会拖累app使用时间，推荐使用静态库)：
````ruby
plugin 'cocoapods-ppbuild'
use_frameworks!
use_dynamic_binary!
````
#### 2. 如果某个库不想使用预编译加参数 :ppbuild => false
````ruby
pod 'AFNetworking', :ppbuild => false
````
注意：
如果对某个库使用 `:ppbuild => false` 则它的依赖库也不会预编译。
如果只想让当前库不参加预编译，依赖库参加预编译，可以将依赖库写在Podfile文件中
举个🌰：
YTKNetwork、AFNetworking 都不参加预编译
````ruby
pod 'YTKNetwork', :ppbuild => false 
````
YTKNetwork不参加预编译，AFNetworking参与预编译
````ruby
pod 'YTKNetwork', :ppbuild => false 
pod 'AFNetworking'
````

#### 3. 可以设置编译参数，默认不设置 例如：
````ruby
set_custom_xcodebuild_options_for_prebuilt_frameworks :simulator => "ARCHS=$(ARCHS_STANDARD)"
````
#### 4. 设置编译完成后移除源码，默认保存
````ruby
remove_source_code_for_prebuilt_frameworks!
````

## 注意

#### 1. 目前是直接将静态库引入至Pods中，导致项目会将二进制文件提交到工程git仓库中。
解决方案：
	将 Pods 文件夹添加至gitignore中，忽略Pods中所有文件
	pod文件项目成员可以单独编译，或者共享一份单独存放二进制的git库，使用脚本编译上传
#### 2. 如果使用单独git仓库存放二进制文件，调试时没有索引源码文件，定位不到源码
解决方案：参考美团zsource插件

## 参考

https://github.com/leavez/cocoapods-binary

## License

MIT

如果喜欢，给个 星星⭐️ 鼓励一下
