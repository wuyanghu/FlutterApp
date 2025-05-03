// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(d, h, m) => "${d}天${h}小时${m}分钟";

  static String m1(num) => "&副本(${num})";

  static String m2(name) => "是否删除文件夹：${name}？";

  static String m3(time) => "创建于 ${time}";

  static String m4(time) => "新建于 ${time}";

  static String m5(time) => "最后更新于 ${time}";

  static String m6(time) => "最近更新于 ${time}";

  static String m7(time) => "最近浏览于 ${time}";

  static String m8(time) => "最近上传${time}";

  static String m9(version) => "设置后将产生一个新版本,确定将\"${version}\"设置为最新版本吗?";

  static String m10(name, time) => "由 ${name} 分享于${time}";

  static String m11(day, size, name) => "剩余${day} ${size} 所有者 ${name}";

  static String m12(successCount, failCount) =>
      "${successCount}条上传成功，${failCount}条上传失败";

  static String m13(version) => "第${version}版";

  static String m14(h, m) => "${h}小时${m}分钟";

  static String m15(time) => "上传于 ${time}";

  static String m16(m) => "${m}分钟";

  static String m17(time) => "今天 ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "I_have_a_bottom_line": MessageLookupByLibrary.simpleMessage("我是有底线的"),
        "common_add": MessageLookupByLibrary.simpleMessage("添加"),
        "common_all": MessageLookupByLibrary.simpleMessage("全部"),
        "common_cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "common_click_retry": MessageLookupByLibrary.simpleMessage("点击重试"),
        "common_confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "common_deleted": MessageLookupByLibrary.simpleMessage("删除"),
        "common_file": MessageLookupByLibrary.simpleMessage("文件"),
        "common_img": MessageLookupByLibrary.simpleMessage("图片"),
        "common_invited": MessageLookupByLibrary.simpleMessage("邀请"),
        "common_list_network_error":
            MessageLookupByLibrary.simpleMessage("网络连接发生问题，请检查您的网络设置"),
        "common_loading": MessageLookupByLibrary.simpleMessage("加载中..."),
        "common_ok": MessageLookupByLibrary.simpleMessage("确定"),
        "common_reset": MessageLookupByLibrary.simpleMessage("重置"),
        "common_search": MessageLookupByLibrary.simpleMessage("搜索"),
        "common_setting_fail": MessageLookupByLibrary.simpleMessage("设置失败"),
        "common_share": MessageLookupByLibrary.simpleMessage("共享"),
        "common_video": MessageLookupByLibrary.simpleMessage("视频"),
        "day_hour_minute": m0,
        "doc_add_fail": MessageLookupByLibrary.simpleMessage("添加失败"),
        "doc_add_here": MessageLookupByLibrary.simpleMessage("添加至此处"),
        "doc_add_success": MessageLookupByLibrary.simpleMessage("添加成功"),
        "doc_add_to": MessageLookupByLibrary.simpleMessage("添加至"),
        "doc_add_to_share_content":
            MessageLookupByLibrary.simpleMessage("添加后将共享给目标文件夹成员"),
        "doc_add_to_share_title":
            MessageLookupByLibrary.simpleMessage("确认将该文件添加至共享空间？"),
        "doc_all_cancel": MessageLookupByLibrary.simpleMessage("全部取消"),
        "doc_belong_to_me": MessageLookupByLibrary.simpleMessage("归我所有"),
        "doc_cancel_all_upload":
            MessageLookupByLibrary.simpleMessage("是否确定取消全部正在上传的项目？"),
        "doc_cancel_favorites_fail":
            MessageLookupByLibrary.simpleMessage("取消收藏失败"),
        "doc_cancel_favorites_success":
            MessageLookupByLibrary.simpleMessage("已取消收藏"),
        "doc_clone_suffix": m1,
        "doc_cooperate": MessageLookupByLibrary.simpleMessage("协作者"),
        "doc_create": MessageLookupByLibrary.simpleMessage("创建"),
        "doc_create_copy": MessageLookupByLibrary.simpleMessage("创建副本"),
        "doc_create_document": MessageLookupByLibrary.simpleMessage("创建文档"),
        "doc_create_fail": MessageLookupByLibrary.simpleMessage("创建失败"),
        "doc_create_file": MessageLookupByLibrary.simpleMessage("创建文件"),
        "doc_create_folder": MessageLookupByLibrary.simpleMessage("创建文件夹"),
        "doc_create_success": MessageLookupByLibrary.simpleMessage("创建成功"),
        "doc_del_all_search_cache":
            MessageLookupByLibrary.simpleMessage("确定要删除全部搜索历史？"),
        "doc_del_class": MessageLookupByLibrary.simpleMessage("删除源文件"),
        "doc_del_fild_from_space_title":
            MessageLookupByLibrary.simpleMessage("是否从当前文件夹中删除？"),
        "doc_del_file_content": MessageLookupByLibrary.simpleMessage(
            "你是该文件的所有者，删除后该文件将进入回收站，30天后将自动彻底删除"),
        "doc_del_file_freom_space_content":
            MessageLookupByLibrary.simpleMessage("确认删除后，将无法从文件夹中访问该项目"),
        "doc_del_file_share_owner_title":
            MessageLookupByLibrary.simpleMessage("是否从与我共享列表中移除？"),
        "doc_del_file_title": MessageLookupByLibrary.simpleMessage("是否删除文件"),
        "doc_del_nearest_content":
            MessageLookupByLibrary.simpleMessage("确认删除后，该内容在最近列表中将不可见"),
        "doc_del_nearest_title":
            MessageLookupByLibrary.simpleMessage("是否从最近列表中删除？"),
        "doc_del_remove_completely":
            MessageLookupByLibrary.simpleMessage("彻底删除"),
        "doc_del_share_owner_content":
            MessageLookupByLibrary.simpleMessage("确认移除后，将无法从与我共享列表访问该项目"),
        "doc_del_space_folder_content": MessageLookupByLibrary.simpleMessage(
            "确认删除后，该文件夹将进入回收站，30天后将自动彻底删除"),
        "doc_del_space_folder_title": m2,
        "doc_delete_fail": MessageLookupByLibrary.simpleMessage("删除失败"),
        "doc_delete_success": MessageLookupByLibrary.simpleMessage("删除成功"),
        "doc_empty_file": MessageLookupByLibrary.simpleMessage("暂无文件"),
        "doc_empty_to_create":
            MessageLookupByLibrary.simpleMessage("还没有创建文档?不妨试试"),
        "doc_error_max_64": MessageLookupByLibrary.simpleMessage("最多可输入64个字符"),
        "doc_favorite_empty": MessageLookupByLibrary.simpleMessage(
            "暂无内容，你可以把文件或文件夹收藏到此处，方便以后更快的找到。"),
        "doc_favorite_have": MessageLookupByLibrary.simpleMessage("已收藏的文件"),
        "doc_favorites": MessageLookupByLibrary.simpleMessage("添加至收藏"),
        "doc_favorites_fail": MessageLookupByLibrary.simpleMessage("收藏失败"),
        "doc_favorites_success": MessageLookupByLibrary.simpleMessage("已添加至收藏"),
        "doc_folder": MessageLookupByLibrary.simpleMessage("文件夹"),
        "doc_input_file_name": MessageLookupByLibrary.simpleMessage("请输入文件名称"),
        "doc_input_new_name": MessageLookupByLibrary.simpleMessage("请输入新名称"),
        "doc_link_manager": MessageLookupByLibrary.simpleMessage("外链管理"),
        "doc_mine_space": MessageLookupByLibrary.simpleMessage("我的空间"),
        "doc_move_fail": MessageLookupByLibrary.simpleMessage("移动失败"),
        "doc_move_here": MessageLookupByLibrary.simpleMessage("移动到此处"),
        "doc_move_success": MessageLookupByLibrary.simpleMessage("移动成功"),
        "doc_move_to": MessageLookupByLibrary.simpleMessage("移动至"),
        "doc_move_to_share_content":
            MessageLookupByLibrary.simpleMessage("移动后将共享给目标文件夹的成员"),
        "doc_move_to_share_title":
            MessageLookupByLibrary.simpleMessage("确定移动该项目至共享空间?"),
        "doc_my_folder": MessageLookupByLibrary.simpleMessage("我的文件夹"),
        "doc_near_change": MessageLookupByLibrary.simpleMessage("最近修改"),
        "doc_near_look": MessageLookupByLibrary.simpleMessage("最近浏览"),
        "doc_near_search": MessageLookupByLibrary.simpleMessage("最近搜索"),
        "doc_nearest": MessageLookupByLibrary.simpleMessage("最近"),
        "doc_new_build": MessageLookupByLibrary.simpleMessage("新建"),
        "doc_perm_add_to_folder_error":
            MessageLookupByLibrary.simpleMessage("你没有权限添加至此文件夹"),
        "doc_perm_edit": MessageLookupByLibrary.simpleMessage("可编辑"),
        "doc_perm_error": MessageLookupByLibrary.simpleMessage("权限已修改，请重试"),
        "doc_perm_invited_fail": MessageLookupByLibrary.simpleMessage("邀请失败"),
        "doc_perm_invited_success":
            MessageLookupByLibrary.simpleMessage("邀请成功"),
        "doc_perm_modify_fail":
            MessageLookupByLibrary.simpleMessage("用户权限设置失败"),
        "doc_perm_modify_success":
            MessageLookupByLibrary.simpleMessage("用户权限设置成功"),
        "doc_perm_move_to_folder_error":
            MessageLookupByLibrary.simpleMessage("你没有权限移动至此文件夹"),
        "doc_perm_owner_fail": MessageLookupByLibrary.simpleMessage("所有者转移失败"),
        "doc_perm_owner_success":
            MessageLookupByLibrary.simpleMessage("所有者转移成功"),
        "doc_perm_read": MessageLookupByLibrary.simpleMessage("可阅读"),
        "doc_perm_remove_fail": MessageLookupByLibrary.simpleMessage("用户移除失败"),
        "doc_perm_remove_success":
            MessageLookupByLibrary.simpleMessage("用户移除成功"),
        "doc_perm_setting": MessageLookupByLibrary.simpleMessage("权限设置"),
        "doc_perm_to_become_owner":
            MessageLookupByLibrary.simpleMessage("设为所有者"),
        "doc_pop_cooperate_give_up_tip":
            MessageLookupByLibrary.simpleMessage("确定放弃邀请协作者?"),
        "doc_pop_invited_cooperate":
            MessageLookupByLibrary.simpleMessage("邀请协作者"),
        "doc_pop_look_all_cooperate":
            MessageLookupByLibrary.simpleMessage("查看所有协作者 >"),
        "doc_ppt": MessageLookupByLibrary.simpleMessage("PPT"),
        "doc_preview": MessageLookupByLibrary.simpleMessage("预览"),
        "doc_recover_fail": MessageLookupByLibrary.simpleMessage("恢复失败"),
        "doc_recover_success": MessageLookupByLibrary.simpleMessage("恢复成功"),
        "doc_rename": MessageLookupByLibrary.simpleMessage("重命名"),
        "doc_rename_fail": MessageLookupByLibrary.simpleMessage("重命名失败"),
        "doc_rename_success": MessageLookupByLibrary.simpleMessage("重命名成功"),
        "doc_restore": MessageLookupByLibrary.simpleMessage("还原"),
        "doc_screen_build": m3,
        "doc_screen_create": m4,
        "doc_screen_create_time": MessageLookupByLibrary.simpleMessage("创建时间"),
        "doc_screen_last_modify": m5,
        "doc_screen_lately_modify": m6,
        "doc_screen_lately_preview": m7,
        "doc_screen_name": MessageLookupByLibrary.simpleMessage("名称"),
        "doc_screen_operation_type":
            MessageLookupByLibrary.simpleMessage("最近操作"),
        "doc_screen_owner": MessageLookupByLibrary.simpleMessage("所有者"),
        "doc_screen_resource": MessageLookupByLibrary.simpleMessage("类型筛选"),
        "doc_screen_share_time": MessageLookupByLibrary.simpleMessage("分享时间"),
        "doc_screen_update_time": MessageLookupByLibrary.simpleMessage("修改时间"),
        "doc_screen_upload": m8,
        "doc_set_version_content": m9,
        "doc_share_by_someone": m10,
        "doc_share_folder": MessageLookupByLibrary.simpleMessage("共享文件夹"),
        "doc_share_space": MessageLookupByLibrary.simpleMessage("共享空间"),
        "doc_share_to_me": MessageLookupByLibrary.simpleMessage("与我共享"),
        "doc_title": MessageLookupByLibrary.simpleMessage("云文档"),
        "doc_trash": MessageLookupByLibrary.simpleMessage("回收站"),
        "doc_trash_empty": MessageLookupByLibrary.simpleMessage("回收站暂无文件"),
        "doc_trash_pop_content":
            MessageLookupByLibrary.simpleMessage("删除后文档将不可恢复,确认要删除吗？"),
        "doc_trash_sub_title": m11,
        "doc_upload": MessageLookupByLibrary.simpleMessage("上传"),
        "doc_upload_and_error": m12,
        "doc_upload_cancel_tip": MessageLookupByLibrary.simpleMessage("取消上传？"),
        "doc_upload_delete_tip": MessageLookupByLibrary.simpleMessage("确认删除？"),
        "doc_upload_finish_tip":
            MessageLookupByLibrary.simpleMessage("所有上传已完成"),
        "doc_upload_list": MessageLookupByLibrary.simpleMessage("上传列表"),
        "doc_upload_momery_error": MessageLookupByLibrary.simpleMessage("容量不足"),
        "doc_upload_network_error":
            MessageLookupByLibrary.simpleMessage("网络错误"),
        "doc_upload_other_error": MessageLookupByLibrary.simpleMessage("未知错误"),
        "doc_upload_reload_tip": MessageLookupByLibrary.simpleMessage("重新上传？"),
        "doc_upload_wait_upload": MessageLookupByLibrary.simpleMessage("等待上传"),
        "doc_uploading": MessageLookupByLibrary.simpleMessage("正在上传文件"),
        "doc_version": MessageLookupByLibrary.simpleMessage("历史版本"),
        "doc_version_max_msg":
            MessageLookupByLibrary.simpleMessage("保留最近100个版本"),
        "doc_version_new": MessageLookupByLibrary.simpleMessage("最新版"),
        "doc_version_success": MessageLookupByLibrary.simpleMessage("已设为最新版"),
        "doc_version_title": m13,
        "doc_word": MessageLookupByLibrary.simpleMessage("文档"),
        "doc_xlsx": MessageLookupByLibrary.simpleMessage("表格"),
        "hour_minute": m14,
        "last_upload": m15,
        "lately_upload": MessageLookupByLibrary.simpleMessage("最近上传"),
        "me_fav": MessageLookupByLibrary.simpleMessage("收藏"),
        "minute": m16,
        "today_time": m17,
        "work_other": MessageLookupByLibrary.simpleMessage("其它")
      };
}
