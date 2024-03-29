# cocoapods-ppbuild

利用cocoapods，生成预编译静态库，提高编译速度的插件。支持编译使用静态库提高速度，调试直接使用源码，方便调试

## 背景
	
随着项目的不断迭代，项目代码及依赖三方库和内部库越来越多，导致项目编译时间越来越长，浪费大量开发时间。
cocoapods-ppbuild插件将三方库打包为静态库，从而提高项目编译时间

## 安装
````shell
$ gem install cocoapods-ppbuild
````

## 使用
修改 podfile 文件，加入以下代码
#### 添加编译选项：
````ruby
plugin 'cocoapods-ppbuild'
use_frameworks! :linkage => :static
use_static_binary!
````
运行`pod instll`

## 扩展功能

#### 1. 如果某个库不想使用预编译加参数 :ppbuild => false
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

#### 2. 可以设置编译参数，默认不设置 例如：
````ruby
set_custom_xcodebuild_options_for_prebuilt_frameworks :simulator => "ARCHS=$(ARCHS_STANDARD)"
````
#### 3. 设置编译完成后移除源码，默认保存
````ruby
remove_source_code_for_prebuilt_frameworks!
````

## 源码调试

不要设置 `remove_source_code_for_prebuilt_frameworks!` 选项，保留源码
源码将会放入pod工程 `SourceCode` 文件夹下，可以直接进行源码调试功能

## 注意

目前是直接将静态库引入至Pods中，注意将Pods添加到gitignore中，否则将会提交至git仓库中

## 参考

https://github.com/leavez/cocoapods-binary

## License

MIT

如果喜欢，给个 星星⭐️ 鼓励一下
