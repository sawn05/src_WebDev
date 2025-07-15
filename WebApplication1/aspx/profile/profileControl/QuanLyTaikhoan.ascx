<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyTaikhoan.ascx.cs" Inherits="WebApplication1.aspx.profile.profileControl.QuanLyTaikhoan" %>
<h2>Chỉnh sửa hồ sơ</h2>
<form>
    <div class="form-row">
        <div class="form-group">
            <label>Họ đệm</label>
            <input type="text" value="Phạm Quang" />
        </div>
        <div class="form-group">
            <label>Tên</label>
            <input type="text" value="Sáng" />
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Email</label>
            <input type="email" value="example@gmail.com" />
        </div>
        <div class="form-group">
            <label>Address</label>
            <input type="text" value="96 Định Công, Hoàng Mai, Hà Nội" />
        </div>
    </div>

    <h4>Thay đổi mật khẩu</h4>
    <div class="form-group">
        <input type="password" placeholder="Mật khẩu cũ" />
    </div>
    <div class="form-group">
        <input type="password" placeholder="Mật khẩu mới" />
    </div>
    <div class="form-group">
        <input type="password" placeholder="Xác nhận mật khẩu mới" />
    </div>

    <div class="form-buttons">
        <button type="button" class="cancel-btn">Hủy</button>
        <button type="submit" class="save-btn">Lưu thay đổi</button>
    </div>
</form>
