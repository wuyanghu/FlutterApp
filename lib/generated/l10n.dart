// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S(); 

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `共享`
  String get common_share {
    return Intl.message('共享', name: 'common_share', desc: '', args: []);
  }

  /// `邀请`
  String get common_invited {
    return Intl.message('邀请', name: 'common_invited', desc: '', args: []);
  }

  /// `全部`
  String get common_all {
    return Intl.message('全部', name: 'common_all', desc: '', args: []);
  }

  /// `图片`
  String get common_img {
    return Intl.message('图片', name: 'common_img', desc: '', args: []);
  }

  /// `文件`
  String get common_file {
    return Intl.message('文件', name: 'common_file', desc: '', args: []);
  }

  /// `取消`
  String get common_cancel {
    return Intl.message('取消', name: 'common_cancel', desc: '', args: []);
  }

  /// `确定`
  String get common_ok {
    return Intl.message('确定', name: 'common_ok', desc: '', args: []);
  }

  /// `重置`
  String get common_reset {
    return Intl.message('重置', name: 'common_reset', desc: '', args: []);
  }

  /// `视频`
  String get common_video {
    return Intl.message('视频', name: 'common_video', desc: '', args: []);
  }

  /// `删除`
  String get common_deleted {
    return Intl.message('删除', name: 'common_deleted', desc: '', args: []);
  }

  /// `搜索`
  String get common_search {
    return Intl.message('搜索', name: 'common_search', desc: '', args: []);
  }

  /// `设置失败`
  String get common_setting_fail {
    return Intl.message(
      '设置失败',
      name: 'common_setting_fail',
      desc: '',
      args: [],
    );
  }

  /// `添加`
  String get common_add {
    return Intl.message('添加', name: 'common_add', desc: '', args: []);
  }

  /// `确认`
  String get common_confirm {
    return Intl.message('确认', name: 'common_confirm', desc: '', args: []);
  }

  /// `点击重试`
  String get common_click_retry {
    return Intl.message('点击重试', name: 'common_click_retry', desc: '', args: []);
  }

  /// `网络连接发生问题，请检查您的网络设置`
  String get common_list_network_error {
    return Intl.message(
      '网络连接发生问题，请检查您的网络设置',
      name: 'common_list_network_error',
      desc: '',
      args: [],
    );
  }

  /// `加载中...`
  String get common_loading {
    return Intl.message('加载中...', name: 'common_loading', desc: '', args: []);
  }

  /// `其它`
  String get work_other {
    return Intl.message('其它', name: 'work_other', desc: '', args: []);
  }

  /// `收藏`
  String get me_fav {
    return Intl.message('收藏', name: 'me_fav', desc: '', args: []);
  }

  /// `回收站暂无文件`
  String get doc_trash_empty {
    return Intl.message('回收站暂无文件', name: 'doc_trash_empty', desc: '', args: []);
  }

  /// `权限已修改，请重试`
  String get doc_perm_error {
    return Intl.message(
      '权限已修改，请重试',
      name: 'doc_perm_error',
      desc: '',
      args: [],
    );
  }

  /// `分享时间`
  String get doc_screen_share_time {
    return Intl.message(
      '分享时间',
      name: 'doc_screen_share_time',
      desc: '',
      args: [],
    );
  }

  /// `权限设置`
  String get doc_perm_setting {
    return Intl.message('权限设置', name: 'doc_perm_setting', desc: '', args: []);
  }

  /// `确定放弃邀请协作者?`
  String get doc_pop_cooperate_give_up_tip {
    return Intl.message(
      '确定放弃邀请协作者?',
      name: 'doc_pop_cooperate_give_up_tip',
      desc: '',
      args: [],
    );
  }

  /// `云文档`
  String get doc_title {
    return Intl.message('云文档', name: 'doc_title', desc: '', args: []);
  }

  /// `外链管理`
  String get doc_link_manager {
    return Intl.message('外链管理', name: 'doc_link_manager', desc: '', args: []);
  }

  /// `查看所有协作者 >`
  String get doc_pop_look_all_cooperate {
    return Intl.message(
      '查看所有协作者 >',
      name: 'doc_pop_look_all_cooperate',
      desc: '',
      args: [],
    );
  }

  /// `是否从与我共享列表中移除？`
  String get doc_del_file_share_owner_title {
    return Intl.message(
      '是否从与我共享列表中移除？',
      name: 'doc_del_file_share_owner_title',
      desc: '',
      args: [],
    );
  }

  /// `确认移除后，将无法从与我共享列表访问该项目`
  String get doc_del_share_owner_content {
    return Intl.message(
      '确认移除后，将无法从与我共享列表访问该项目',
      name: 'doc_del_share_owner_content',
      desc: '',
      args: [],
    );
  }

  /// `共享文件夹`
  String get doc_share_folder {
    return Intl.message('共享文件夹', name: 'doc_share_folder', desc: '', args: []);
  }

  /// `与我共享`
  String get doc_share_to_me {
    return Intl.message('与我共享', name: 'doc_share_to_me', desc: '', args: []);
  }

  /// `所有者`
  String get doc_screen_owner {
    return Intl.message('所有者', name: 'doc_screen_owner', desc: '', args: []);
  }

  /// `设为所有者`
  String get doc_perm_to_become_owner {
    return Intl.message(
      '设为所有者',
      name: 'doc_perm_to_become_owner',
      desc: '',
      args: [],
    );
  }

  /// `用户移除成功`
  String get doc_perm_remove_success {
    return Intl.message(
      '用户移除成功',
      name: 'doc_perm_remove_success',
      desc: '',
      args: [],
    );
  }

  /// `用户移除失败`
  String get doc_perm_remove_fail {
    return Intl.message(
      '用户移除失败',
      name: 'doc_perm_remove_fail',
      desc: '',
      args: [],
    );
  }

  /// `所有者转移成功`
  String get doc_perm_owner_success {
    return Intl.message(
      '所有者转移成功',
      name: 'doc_perm_owner_success',
      desc: '',
      args: [],
    );
  }

  /// `所有者转移失败`
  String get doc_perm_owner_fail {
    return Intl.message(
      '所有者转移失败',
      name: 'doc_perm_owner_fail',
      desc: '',
      args: [],
    );
  }

  /// `用户权限设置成功`
  String get doc_perm_modify_success {
    return Intl.message(
      '用户权限设置成功',
      name: 'doc_perm_modify_success',
      desc: '',
      args: [],
    );
  }

  /// `用户权限设置失败`
  String get doc_perm_modify_fail {
    return Intl.message(
      '用户权限设置失败',
      name: 'doc_perm_modify_fail',
      desc: '',
      args: [],
    );
  }

  /// `邀请成功`
  String get doc_perm_invited_success {
    return Intl.message(
      '邀请成功',
      name: 'doc_perm_invited_success',
      desc: '',
      args: [],
    );
  }

  /// `邀请失败`
  String get doc_perm_invited_fail {
    return Intl.message(
      '邀请失败',
      name: 'doc_perm_invited_fail',
      desc: '',
      args: [],
    );
  }

  /// `可阅读`
  String get doc_perm_read {
    return Intl.message('可阅读', name: 'doc_perm_read', desc: '', args: []);
  }

  /// `可编辑`
  String get doc_perm_edit {
    return Intl.message('可编辑', name: 'doc_perm_edit', desc: '', args: []);
  }

  /// `邀请协作者`
  String get doc_pop_invited_cooperate {
    return Intl.message(
      '邀请协作者',
      name: 'doc_pop_invited_cooperate',
      desc: '',
      args: [],
    );
  }

  /// `协作者`
  String get doc_cooperate {
    return Intl.message('协作者', name: 'doc_cooperate', desc: '', args: []);
  }

  /// `最近`
  String get doc_nearest {
    return Intl.message('最近', name: 'doc_nearest', desc: '', args: []);
  }

  /// `我的空间`
  String get doc_mine_space {
    return Intl.message('我的空间', name: 'doc_mine_space', desc: '', args: []);
  }

  /// `共享空间`
  String get doc_share_space {
    return Intl.message('共享空间', name: 'doc_share_space', desc: '', args: []);
  }

  /// `回收站`
  String get doc_trash {
    return Intl.message('回收站', name: 'doc_trash', desc: '', args: []);
  }

  /// `新建`
  String get doc_new_build {
    return Intl.message('新建', name: 'doc_new_build', desc: '', args: []);
  }

  /// `文档`
  String get doc_word {
    return Intl.message('文档', name: 'doc_word', desc: '', args: []);
  }

  /// `表格`
  String get doc_xlsx {
    return Intl.message('表格', name: 'doc_xlsx', desc: '', args: []);
  }

  /// `文件夹`
  String get doc_folder {
    return Intl.message('文件夹', name: 'doc_folder', desc: '', args: []);
  }

  /// `上传`
  String get doc_upload {
    return Intl.message('上传', name: 'doc_upload', desc: '', args: []);
  }

  /// `创建`
  String get doc_create {
    return Intl.message('创建', name: 'doc_create', desc: '', args: []);
  }

  /// `创建文件`
  String get doc_create_file {
    return Intl.message('创建文件', name: 'doc_create_file', desc: '', args: []);
  }

  /// `创建文件夹`
  String get doc_create_folder {
    return Intl.message('创建文件夹', name: 'doc_create_folder', desc: '', args: []);
  }

  /// `请输入文件名称`
  String get doc_input_file_name {
    return Intl.message(
      '请输入文件名称',
      name: 'doc_input_file_name',
      desc: '',
      args: [],
    );
  }

  /// `最近操作`
  String get doc_screen_operation_type {
    return Intl.message(
      '最近操作',
      name: 'doc_screen_operation_type',
      desc: '',
      args: [],
    );
  }

  /// `类型筛选`
  String get doc_screen_resource {
    return Intl.message(
      '类型筛选',
      name: 'doc_screen_resource',
      desc: '',
      args: [],
    );
  }

  /// `PPT`
  String get doc_ppt {
    return Intl.message('PPT', name: 'doc_ppt', desc: '', args: []);
  }

  /// `最近修改`
  String get doc_near_change {
    return Intl.message('最近修改', name: 'doc_near_change', desc: '', args: []);
  }

  /// `最近浏览`
  String get doc_near_look {
    return Intl.message('最近浏览', name: 'doc_near_look', desc: '', args: []);
  }

  /// `我的文件夹`
  String get doc_my_folder {
    return Intl.message('我的文件夹', name: 'doc_my_folder', desc: '', args: []);
  }

  /// `添加至收藏`
  String get doc_favorites {
    return Intl.message('添加至收藏', name: 'doc_favorites', desc: '', args: []);
  }

  /// `已取消收藏`
  String get doc_cancel_favorites_success {
    return Intl.message(
      '已取消收藏',
      name: 'doc_cancel_favorites_success',
      desc: '',
      args: [],
    );
  }

  /// `移动至`
  String get doc_move_to {
    return Intl.message('移动至', name: 'doc_move_to', desc: '', args: []);
  }

  /// `移动到此处`
  String get doc_move_here {
    return Intl.message('移动到此处', name: 'doc_move_here', desc: '', args: []);
  }

  /// `重命名`
  String get doc_rename {
    return Intl.message('重命名', name: 'doc_rename', desc: '', args: []);
  }

  /// `历史版本`
  String get doc_version {
    return Intl.message('历史版本', name: 'doc_version', desc: '', args: []);
  }

  /// `归我所有`
  String get doc_belong_to_me {
    return Intl.message('归我所有', name: 'doc_belong_to_me', desc: '', args: []);
  }

  /// `最近搜索`
  String get doc_near_search {
    return Intl.message('最近搜索', name: 'doc_near_search', desc: '', args: []);
  }

  /// `修改时间`
  String get doc_screen_update_time {
    return Intl.message(
      '修改时间',
      name: 'doc_screen_update_time',
      desc: '',
      args: [],
    );
  }

  /// `创建时间`
  String get doc_screen_create_time {
    return Intl.message(
      '创建时间',
      name: 'doc_screen_create_time',
      desc: '',
      args: [],
    );
  }

  /// `名称`
  String get doc_screen_name {
    return Intl.message('名称', name: 'doc_screen_name', desc: '', args: []);
  }

  /// `还原`
  String get doc_restore {
    return Intl.message('还原', name: 'doc_restore', desc: '', args: []);
  }

  /// `彻底删除`
  String get doc_del_remove_completely {
    return Intl.message(
      '彻底删除',
      name: 'doc_del_remove_completely',
      desc: '',
      args: [],
    );
  }

  /// `请输入新名称`
  String get doc_input_new_name {
    return Intl.message(
      '请输入新名称',
      name: 'doc_input_new_name',
      desc: '',
      args: [],
    );
  }

  /// `已收藏的文件`
  String get doc_favorite_have {
    return Intl.message(
      '已收藏的文件',
      name: 'doc_favorite_have',
      desc: '',
      args: [],
    );
  }

  /// `保留最近100个版本`
  String get doc_version_max_msg {
    return Intl.message(
      '保留最近100个版本',
      name: 'doc_version_max_msg',
      desc: '',
      args: [],
    );
  }

  /// `预览`
  String get doc_preview {
    return Intl.message('预览', name: 'doc_preview', desc: '', args: []);
  }

  /// `创建成功`
  String get doc_create_success {
    return Intl.message('创建成功', name: 'doc_create_success', desc: '', args: []);
  }

  /// `创建失败`
  String get doc_create_fail {
    return Intl.message('创建失败', name: 'doc_create_fail', desc: '', args: []);
  }

  /// `最多可输入64个字符`
  String get doc_error_max_64 {
    return Intl.message(
      '最多可输入64个字符',
      name: 'doc_error_max_64',
      desc: '',
      args: [],
    );
  }

  /// `网络错误`
  String get doc_upload_network_error {
    return Intl.message(
      '网络错误',
      name: 'doc_upload_network_error',
      desc: '',
      args: [],
    );
  }

  /// `删除成功`
  String get doc_delete_success {
    return Intl.message('删除成功', name: 'doc_delete_success', desc: '', args: []);
  }

  /// `删除失败`
  String get doc_delete_fail {
    return Intl.message('删除失败', name: 'doc_delete_fail', desc: '', args: []);
  }

  /// `恢复成功`
  String get doc_recover_success {
    return Intl.message(
      '恢复成功',
      name: 'doc_recover_success',
      desc: '',
      args: [],
    );
  }

  /// `恢复失败`
  String get doc_recover_fail {
    return Intl.message('恢复失败', name: 'doc_recover_fail', desc: '', args: []);
  }

  /// `取消收藏失败`
  String get doc_cancel_favorites_fail {
    return Intl.message(
      '取消收藏失败',
      name: 'doc_cancel_favorites_fail',
      desc: '',
      args: [],
    );
  }

  /// `重命名成功`
  String get doc_rename_success {
    return Intl.message(
      '重命名成功',
      name: 'doc_rename_success',
      desc: '',
      args: [],
    );
  }

  /// `重命名失败`
  String get doc_rename_fail {
    return Intl.message('重命名失败', name: 'doc_rename_fail', desc: '', args: []);
  }

  /// `最新版`
  String get doc_version_new {
    return Intl.message('最新版', name: 'doc_version_new', desc: '', args: []);
  }

  /// `删除后文档将不可恢复,确认要删除吗？`
  String get doc_trash_pop_content {
    return Intl.message(
      '删除后文档将不可恢复,确认要删除吗？',
      name: 'doc_trash_pop_content',
      desc: '',
      args: [],
    );
  }

  /// `设置后将产生一个新版本,确定将"{version}"设置为最新版本吗?`
  String doc_set_version_content(Object version) {
    return Intl.message(
      '设置后将产生一个新版本,确定将"$version"设置为最新版本吗?',
      name: 'doc_set_version_content',
      desc: '',
      args: [version],
    );
  }

  /// `已设为最新版`
  String get doc_version_success {
    return Intl.message(
      '已设为最新版',
      name: 'doc_version_success',
      desc: '',
      args: [],
    );
  }

  /// `添加至`
  String get doc_add_to {
    return Intl.message('添加至', name: 'doc_add_to', desc: '', args: []);
  }

  /// `添加至此处`
  String get doc_add_here {
    return Intl.message('添加至此处', name: 'doc_add_here', desc: '', args: []);
  }

  /// `移动成功`
  String get doc_move_success {
    return Intl.message('移动成功', name: 'doc_move_success', desc: '', args: []);
  }

  /// `移动失败`
  String get doc_move_fail {
    return Intl.message('移动失败', name: 'doc_move_fail', desc: '', args: []);
  }

  /// `添加成功`
  String get doc_add_success {
    return Intl.message('添加成功', name: 'doc_add_success', desc: '', args: []);
  }

  /// `添加失败`
  String get doc_add_fail {
    return Intl.message('添加失败', name: 'doc_add_fail', desc: '', args: []);
  }

  /// `创建副本`
  String get doc_create_copy {
    return Intl.message('创建副本', name: 'doc_create_copy', desc: '', args: []);
  }

  /// `删除源文件`
  String get doc_del_class {
    return Intl.message('删除源文件', name: 'doc_del_class', desc: '', args: []);
  }

  /// `是否从最近列表中删除？`
  String get doc_del_nearest_title {
    return Intl.message(
      '是否从最近列表中删除？',
      name: 'doc_del_nearest_title',
      desc: '',
      args: [],
    );
  }

  /// `确认删除后，该内容在最近列表中将不可见`
  String get doc_del_nearest_content {
    return Intl.message(
      '确认删除后，该内容在最近列表中将不可见',
      name: 'doc_del_nearest_content',
      desc: '',
      args: [],
    );
  }

  /// `是否从当前文件夹中删除？`
  String get doc_del_fild_from_space_title {
    return Intl.message(
      '是否从当前文件夹中删除？',
      name: 'doc_del_fild_from_space_title',
      desc: '',
      args: [],
    );
  }

  /// `确认删除后，将无法从文件夹中访问该项目`
  String get doc_del_file_freom_space_content {
    return Intl.message(
      '确认删除后，将无法从文件夹中访问该项目',
      name: 'doc_del_file_freom_space_content',
      desc: '',
      args: [],
    );
  }

  /// `第{version}版`
  String doc_version_title(Object version) {
    return Intl.message(
      '第$version版',
      name: 'doc_version_title',
      desc: '',
      args: [version],
    );
  }

  /// `是否删除文件夹：{name}？`
  String doc_del_space_folder_title(Object name) {
    return Intl.message(
      '是否删除文件夹：$name？',
      name: 'doc_del_space_folder_title',
      desc: '',
      args: [name],
    );
  }

  /// `确认删除后，该文件夹将进入回收站，30天后将自动彻底删除`
  String get doc_del_space_folder_content {
    return Intl.message(
      '确认删除后，该文件夹将进入回收站，30天后将自动彻底删除',
      name: 'doc_del_space_folder_content',
      desc: '',
      args: [],
    );
  }

  /// `是否删除文件`
  String get doc_del_file_title {
    return Intl.message(
      '是否删除文件',
      name: 'doc_del_file_title',
      desc: '',
      args: [],
    );
  }

  /// `你是该文件的所有者，删除后该文件将进入回收站，30天后将自动彻底删除`
  String get doc_del_file_content {
    return Intl.message(
      '你是该文件的所有者，删除后该文件将进入回收站，30天后将自动彻底删除',
      name: 'doc_del_file_content',
      desc: '',
      args: [],
    );
  }

  /// `创建文档`
  String get doc_create_document {
    return Intl.message(
      '创建文档',
      name: 'doc_create_document',
      desc: '',
      args: [],
    );
  }

  /// `还没有创建文档?不妨试试`
  String get doc_empty_to_create {
    return Intl.message(
      '还没有创建文档?不妨试试',
      name: 'doc_empty_to_create',
      desc: '',
      args: [],
    );
  }

  /// `暂无文件`
  String get doc_empty_file {
    return Intl.message('暂无文件', name: 'doc_empty_file', desc: '', args: []);
  }

  /// `上传列表`
  String get doc_upload_list {
    return Intl.message('上传列表', name: 'doc_upload_list', desc: '', args: []);
  }

  /// `全部取消`
  String get doc_all_cancel {
    return Intl.message('全部取消', name: 'doc_all_cancel', desc: '', args: []);
  }

  /// `等待上传`
  String get doc_upload_wait_upload {
    return Intl.message(
      '等待上传',
      name: 'doc_upload_wait_upload',
      desc: '',
      args: [],
    );
  }

  /// `容量不足`
  String get doc_upload_momery_error {
    return Intl.message(
      '容量不足',
      name: 'doc_upload_momery_error',
      desc: '',
      args: [],
    );
  }

  /// `未知错误`
  String get doc_upload_other_error {
    return Intl.message(
      '未知错误',
      name: 'doc_upload_other_error',
      desc: '',
      args: [],
    );
  }

  /// `正在上传文件`
  String get doc_uploading {
    return Intl.message('正在上传文件', name: 'doc_uploading', desc: '', args: []);
  }

  /// `{successCount}条上传成功，{failCount}条上传失败`
  String doc_upload_and_error(Object successCount, Object failCount) {
    return Intl.message(
      '$successCount条上传成功，$failCount条上传失败',
      name: 'doc_upload_and_error',
      desc: '',
      args: [successCount, failCount],
    );
  }

  /// `是否确定取消全部正在上传的项目？`
  String get doc_cancel_all_upload {
    return Intl.message(
      '是否确定取消全部正在上传的项目？',
      name: 'doc_cancel_all_upload',
      desc: '',
      args: [],
    );
  }

  /// `所有上传已完成`
  String get doc_upload_finish_tip {
    return Intl.message(
      '所有上传已完成',
      name: 'doc_upload_finish_tip',
      desc: '',
      args: [],
    );
  }

  /// `暂无内容，你可以把文件或文件夹收藏到此处，方便以后更快的找到。`
  String get doc_favorite_empty {
    return Intl.message(
      '暂无内容，你可以把文件或文件夹收藏到此处，方便以后更快的找到。',
      name: 'doc_favorite_empty',
      desc: '',
      args: [],
    );
  }

  /// `确定要删除全部搜索历史？`
  String get doc_del_all_search_cache {
    return Intl.message(
      '确定要删除全部搜索历史？',
      name: 'doc_del_all_search_cache',
      desc: '',
      args: [],
    );
  }

  /// `已添加至收藏`
  String get doc_favorites_success {
    return Intl.message(
      '已添加至收藏',
      name: 'doc_favorites_success',
      desc: '',
      args: [],
    );
  }

  /// `收藏失败`
  String get doc_favorites_fail {
    return Intl.message('收藏失败', name: 'doc_favorites_fail', desc: '', args: []);
  }

  /// `确认删除？`
  String get doc_upload_delete_tip {
    return Intl.message(
      '确认删除？',
      name: 'doc_upload_delete_tip',
      desc: '',
      args: [],
    );
  }

  /// `取消上传？`
  String get doc_upload_cancel_tip {
    return Intl.message(
      '取消上传？',
      name: 'doc_upload_cancel_tip',
      desc: '',
      args: [],
    );
  }

  /// `重新上传？`
  String get doc_upload_reload_tip {
    return Intl.message(
      '重新上传？',
      name: 'doc_upload_reload_tip',
      desc: '',
      args: [],
    );
  }

  /// `最近上传{time}`
  String doc_screen_upload(Object time) {
    return Intl.message(
      '最近上传$time',
      name: 'doc_screen_upload',
      desc: '',
      args: [time],
    );
  }

  /// `新建于 {time}`
  String doc_screen_create(Object time) {
    return Intl.message(
      '新建于 $time',
      name: 'doc_screen_create',
      desc: '',
      args: [time],
    );
  }

  /// `最近浏览于 {time}`
  String doc_screen_lately_preview(Object time) {
    return Intl.message(
      '最近浏览于 $time',
      name: 'doc_screen_lately_preview',
      desc: '',
      args: [time],
    );
  }

  /// `最近更新于 {time}`
  String doc_screen_lately_modify(Object time) {
    return Intl.message(
      '最近更新于 $time',
      name: 'doc_screen_lately_modify',
      desc: '',
      args: [time],
    );
  }

  /// `最后更新于 {time}`
  String doc_screen_last_modify(Object time) {
    return Intl.message(
      '最后更新于 $time',
      name: 'doc_screen_last_modify',
      desc: '',
      args: [time],
    );
  }

  /// `创建于 {time}`
  String doc_screen_build(Object time) {
    return Intl.message(
      '创建于 $time',
      name: 'doc_screen_build',
      desc: '',
      args: [time],
    );
  }

  /// `剩余{day} {size} 所有者 {name}`
  String doc_trash_sub_title(Object day, Object size, Object name) {
    return Intl.message(
      '剩余$day $size 所有者 $name',
      name: 'doc_trash_sub_title',
      desc: '',
      args: [day, size, name],
    );
  }

  /// `由 {name} 分享于{time}`
  String doc_share_by_someone(Object name, Object time) {
    return Intl.message(
      '由 $name 分享于$time',
      name: 'doc_share_by_someone',
      desc: '',
      args: [name, time],
    );
  }

  /// `&副本({num})`
  String doc_clone_suffix(Object num) {
    return Intl.message(
      '&副本($num)',
      name: 'doc_clone_suffix',
      desc: '',
      args: [num],
    );
  }

  /// `确定移动该项目至共享空间?`
  String get doc_move_to_share_title {
    return Intl.message(
      '确定移动该项目至共享空间?',
      name: 'doc_move_to_share_title',
      desc: '',
      args: [],
    );
  }

  /// `移动后将共享给目标文件夹的成员`
  String get doc_move_to_share_content {
    return Intl.message(
      '移动后将共享给目标文件夹的成员',
      name: 'doc_move_to_share_content',
      desc: '',
      args: [],
    );
  }

  /// `确认将该文件添加至共享空间？`
  String get doc_add_to_share_title {
    return Intl.message(
      '确认将该文件添加至共享空间？',
      name: 'doc_add_to_share_title',
      desc: '',
      args: [],
    );
  }

  /// `添加后将共享给目标文件夹成员`
  String get doc_add_to_share_content {
    return Intl.message(
      '添加后将共享给目标文件夹成员',
      name: 'doc_add_to_share_content',
      desc: '',
      args: [],
    );
  }

  /// `你没有权限移动至此文件夹`
  String get doc_perm_move_to_folder_error {
    return Intl.message(
      '你没有权限移动至此文件夹',
      name: 'doc_perm_move_to_folder_error',
      desc: '',
      args: [],
    );
  }

  /// `你没有权限添加至此文件夹`
  String get doc_perm_add_to_folder_error {
    return Intl.message(
      '你没有权限添加至此文件夹',
      name: 'doc_perm_add_to_folder_error',
      desc: '',
      args: [],
    );
  }

  /// `上传于 {time}`
  String last_upload(Object time) {
    return Intl.message(
      '上传于 $time',
      name: 'last_upload',
      desc: '',
      args: [time],
    );
  }

  /// `今天 {time}`
  String today_time(Object time) {
    return Intl.message('今天 $time', name: 'today_time', desc: '', args: [time]);
  }

  /// `{d}天{h}小时{m}分钟`
  String day_hour_minute(Object d, Object h, Object m) {
    return Intl.message(
      '$d天$h小时$m分钟',
      name: 'day_hour_minute',
      desc: '',
      args: [d, h, m],
    );
  }

  /// `{h}小时{m}分钟`
  String hour_minute(Object h, Object m) {
    return Intl.message(
      '$h小时$m分钟',
      name: 'hour_minute',
      desc: '',
      args: [h, m],
    );
  }

  /// `{m}分钟`
  String minute(Object m) {
    return Intl.message('$m分钟', name: 'minute', desc: '', args: [m]);
  }

  /// `最近上传`
  String get lately_upload {
    return Intl.message('最近上传', name: 'lately_upload', desc: '', args: []);
  }

  /// `我是有底线的`
  String get I_have_a_bottom_line {
    return Intl.message(
      '我是有底线的',
      name: 'I_have_a_bottom_line',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
