class LoadPostObject {
  final int IDbaiviet;
  final String ten_bai_viet;
  final DateTime ngay_dang;
  final String noi_dung;
  final int luot_like;
  final String hinh_anh;
  final int trang_thai;

  LoadPostObject(this.IDbaiviet, this.ten_bai_viet, this.ngay_dang,
      this.noi_dung, this.luot_like, this.hinh_anh, this.trang_thai);

  LoadPostObject.fromJson(Map<String, dynamic> r)
      : IDbaiviet = r['IDbaiviet'],
        ten_bai_viet = r['ten_bai_viet'],
        ngay_dang = r['ngay_dang'],
        noi_dung = r['noi_dung'],
        luot_like = r['luot_like'],
        hinh_anh = r['hinh_anh'],
        trang_thai = r['trang_thai'];
}
