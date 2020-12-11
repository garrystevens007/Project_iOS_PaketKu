//
//  DetailViewController.swift
//  binus_ios_project
//
//  Created by Garry on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    func adjustUI(arg : UITextView){
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    
    @IBOutlet weak var txtDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtDesc.text = "Lalu bagaimana persiapan penyelenggara pemilu dan Mahkamah Konstitusi (MK) untuk menghadapi sengketa hasil Pilkada 2020?Mahkamah Konstitusi (MK) sendiri sudah mempersiapkan sarana dan prasarana serta sumber daya manusia (SDM) untuk menindaklanjuti sengketa Pilkada 2020. Selain itu, MK juga sudah mempersiapkan regulasi dan mengadakan bimbingan teknis hukum acara perselisihan hasil pilkada untuk para penyelenggara dan peserta pilkada.Sudah banyak hal yang dipersiapkan sesuai dengan kebutuhan, yaitu regulasi, bimtek untuk penyelenggara pilkada dan peserta, SDM, sarana dan prasarana persidangan, protokol kesehatan, aplikasi berbasis elektronik, dan lain-lain, kata Juru Bicara MK Fajar Laksono kepada Liputan6.com di Jakarta, Jumat (11/12/2020).Sementara untuk mengatasi membludaknya pengajuan sengketa hasil pilkada, MK juga sudah menyediakan Sistem Informasi Penanganan Perkara Elektronik (SIMPEL) dan dapat di akses di simpel.mkri.id.Kita juga siapkan lokasi dan petugas penerima permohonan yang datang langsung dengan pembatasan jumlah kehadiran serta pemberlakukan protokol kesehatan secara ketat, kata Fajar.Adapun, peserta pilkada dapat mengajukan permohonan sengketa hasil Pilkada pada 16 Desember 2020 hingga 5 Januari 2021 pukul 24.00 WIB untuk provinsi. Sementara untuk kabupaten/kota dapat dilakukan pada 13 Desember 2020 hingga 5 Januari 2021 pukul 24.00 WIB.Namun, tidak semua gugatan pasangan calon yang tak puas dengan hasil Pilkada 2020 bisa diterima MK. Sebab ada syarat selisih perolehan suara yang harus terpenuhi.Berdasar Peraturan MK Nomor 6 Tahun 2020 tentang Beracara Dalam Perselisihan Hasil Pemilihan Gubernur, Bupati dan Wali Kota setidaknya selisih perolehan suara paling banyak sebesar 2 persen dari total suara sah jika provinsi tersebut memiliki jumlah penduduk kurang dari 2 juta jiwa.Namun, jika provinsi tersebut memiliki jumlah penduduk 2 juta-6 juta jiwa, maka selisih perolehan suara harus paling banyak sebesar 1,5 persen dari total suara sah. Kemudian, jika provinsi tersebut memiliki jumlah penduduk 6 juta-12 juta jiwa, maka selisih perolehan suara harus paling banyak sebesar 1 persen dari total suara sah.Sementara provinsi dengan jumlah penduduk lebih dari 12 juta jiwa, maka selisih perolehan suara paling banyak sebesar 0,5 persen dari total suara sah.Kemudian di level pemilihan bupati dan wali kota, paslon yang dapat mengajukan gugatan ke MK jika punya selisih suara sebesar 2 persen dari total suara sah jika kabupaten/kota tersebut memiliki jumlah penduduk kurang dari 250 ribu jiwa.Jika kabupaten/kota dengan jumlah penduduk 250 ribu jiwa-500 ribu jiwa, maka selisih perolehan suara paling banyak sebesar 1,5 persen dari total suara sah.Lalu jika kabupaten/kota dengan jumlah penduduk 500 ribu jiwa-1 juta jiwa, maka selisih perolehan suara paling banyak sebesar 1 persen dari total suara sah.Namun, jika kabupaten/kota dengan jumlah penduduk lebih dari 1 juta jiwa, maka selisih perolehan suara paling banyak sebesar 0,5 persen dari total suara sah.Bila selisih suara di luar rentang perhitungan di atas, maka dipastikan MK tidak akan menerima permohonan tersebut.Bukan hanya MK, Komisi Pemilihan Umum (KPU) pun sudah mempersiapkan diri untuk menghadapi sengketa hasil pilkada. Komisioner KPU I Dewa Raka Sandi mengatakan, pihaknya telah berkoordinasi dengan KPU tingkat provinsi dan kabupaten/kota yang menyelenggarakan pilkada.";
        adjustUI(arg: txtDesc)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
