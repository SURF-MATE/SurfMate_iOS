//
//  MakeRoomViewController.swift
//  SurfingMate
//
//  Created by 양채연 on 2022/05/21.
//

import Foundation

// 방제목, 내용, 목적지->picker, 날짜->picker, 시간, 총인원 -> customTextField
// 제주, 양양, 속초, 고성

import UIKit
import Foundation
import Then
import SnapKit

class MakeRoomViewController: UIViewController{
    
    
    var destList=["양양","속초","제주","고성"]
    
    let picker = UIPickerView()

    
    let roomLabel = UILabel().then {
        $0.text = "방제목: "
        $0.font = .systemFont(ofSize: 23)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let descLabel = UILabel().then {
        $0.text = "내용: "
        $0.font = .systemFont(ofSize: 23)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let peopleLabel = UILabel().then {
        $0.text = "제한인원: "
        $0.font = .systemFont(ofSize: 23)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let destLabel = UILabel().then {
        $0.text = "목적지: "
        $0.font = .systemFont(ofSize: 23)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let selectDateLabel = UILabel().then {
        $0.text = "날짜선택: "
        $0.font = .systemFont(ofSize: 23)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let dateLabel = UILabel().then {
        $0.text = "최종날짜: "
        $0.font = .systemFont(ofSize: 23)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    let roomTitle = UITextField().then{
        $0.placeholder="방제목을 입력해주세요."
        $0.font = .systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let roomDesc = UITextField().then{
        $0.placeholder="내용을 입력해주세요."
        $0.font = .systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let people = UITextField().then {
        $0.placeholder="제한인원을 입력해주세요."
        $0.font = .systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    

    let dest = UITextField().then{
        $0.placeholder = "목적지를 입력해주세요."
        $0.font = .systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let date = UITextField().then{
        $0.placeholder = "날짜를 선택해주세요."
        $0.font = .systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    

    
    let uploadBt = UIButton(type: .custom).then {
            $0.setTitle("업로드하기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
            $0.isEnabled = false
        }
    
    lazy var datePicker: UIDatePicker = {
        // datePicker 세팅
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 200))
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        // 값이 변경될 때 이벤트 등록
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        return datePicker
    }()
    
    override func didReceiveMemoryWarning() {
        // 재생성 될 수 있는 리소스 처분
        super.didReceiveMemoryWarning()
    }

    
    
    @objc func onDidChangeDate(sender: UIDatePicker){
        // 포맷 생성
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        // 포맷으로부터 데이터 가져오기
        let selectedDate: String = dateFormatter.string(from: sender.date)
        self.date.text = selectedDate
        
    }


    
    func uiLayout(){
        view.addSubview(roomLabel)
        roomLabel.snp.makeConstraints {
            $0.top.equalTo(100)
            $0.left.equalToSuperview().offset(130)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(roomTitle)
        roomTitle.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.top.equalTo(100)
            $0.left.equalToSuperview().offset(250)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            $0.top.equalTo(190)
            $0.left.equalToSuperview().offset(130)
        }
        view.addSubview(roomDesc)
        roomDesc.snp.makeConstraints {
            $0.top.equalTo(190)
            $0.left.equalToSuperview().offset(250)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(peopleLabel)
        peopleLabel.snp.makeConstraints {
            $0.top.equalTo(280)
            $0.left.equalToSuperview().offset(130)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(people)
        people.snp.makeConstraints {
            $0.top.equalTo(280)
            $0.left.equalToSuperview().offset(250)
        }
        view.addSubview(destLabel)
        destLabel.snp.makeConstraints {
            $0.top.equalTo(370)
            $0.left.equalToSuperview().offset(130)
        }
        view.addSubview(dest)
        dest.snp.makeConstraints {
            $0.top.equalTo(370)
            $0.left.equalToSuperview().offset(250)
        }
        
        view.addSubview(selectDateLabel)
        selectDateLabel.snp.makeConstraints {
            $0.top.equalTo(460)
            $0.left.equalToSuperview().offset(130)
        }
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(550)
            $0.left.equalToSuperview().offset(130)
        }
        view.addSubview(date)
        date.snp.makeConstraints {
            $0.top.equalTo(550)
            $0.left.equalToSuperview().offset(250)
        }

        view.addSubview(uploadBt)
        uploadBt.snp.makeConstraints{
            $0.width.equalTo(300)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(date.snp.bottom).offset(120)
        }
    
//        // UIDatePicker
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(25)
            $0.top.equalTo(465)
            $0.left.equalToSuperview().offset(250)
        }
        
        

        
    }
     

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        uiLayout()
        
        picker.delegate = self
        picker.dataSource = self
        
        
    }
}

extension MakeRoomViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // delegate, datasource 연결 및 picker를 textfied의 inputview로 설정한다
    func configPickerView(in pickerView: UIPickerView) {
        picker.delegate = self
        picker.dataSource = self
        dest.inputView = picker
        
        configToolbar()
    }
    
    func configToolbar() {
        // toolbar를 만들어준다.
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.white
        toolBar.sizeToFit()
        // 만들어줄 버튼
        // flexibleSpace는 취소~완료 간의 거리를 만들어준다.
        let doneBT = UIBarButtonItem(title: "완료", style: .plain, target: self, action:  #selector(self.donePicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBT = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.cancelPicker))
        // 만든 아이템들을 세팅해주고
        toolBar.setItems([cancelBT,flexibleSpace,doneBT], animated: false)
        toolBar.isUserInteractionEnabled = true
        // 악세사리로 추가한다.
        dest.inputAccessoryView = toolBar
    }
    // "완료" 클릭 시 데이터를 textfield에 입력 후 입력창 내리기
    @objc func donePicker() { let row = self.picker.selectedRow(inComponent: 0)
        self.picker.selectRow(row, inComponent: 0, animated: false)
        self.dest.text = self.destList[row]
        self.dest.resignFirstResponder() }
    // "취소" 클릭 시 textfield의 텍스트 값을 nil로 처리 후 입력창 내리기
    @objc func cancelPicker() {
        self.dest.text = nil
        self.dest.resignFirstResponder() }
    // pickerview는 하나만
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerview의 선택지는 데이터의 개수만큼
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return destList.count
    }
    // pickerview 내 선택지의 값들을 원하는 데이터로 채워준다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return destList[row]
    }
    // textfield의 텍스트에 pickerview에서 선택한 값을 넣어준다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dest.text = self.destList[row]
    }
}


