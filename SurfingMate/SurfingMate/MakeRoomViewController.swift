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
    
    let roomTitle = UITextField().then{
        $0.text = "방제목을 입력해주세요."
        $0.font = .systemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let roomDesc = UITextField().then{
        $0.text = "내용을 입력해주세요."
        $0.font = .systemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    

    
    let dest = UITextField().then{
        $0.text = "내용을 입력해주세요."
        $0.font = .systemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    let doneBT = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.donePicker))
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

    
    func uiLayout(){
        view.addSubview(roomTitle)
        roomTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
        }
    }




    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        uiLayout()
        
        
    }
}

extension MakeRoomViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // delegate, datasource 연결 및 picker를 textfied의 inputview로 설정한다
    func configPickerView(in pickerView: UIPickerView) {
        picker.delegate = self
        picker.dataSource = self
        dest.inputView = picker
    }
    // pickerview는 하나만
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    // pickerview의 선택지는 데이터의 개수만큼
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return destList.count
    }
    // pickerview 내 선택지의 값들을 원하는 데이터로 채워준다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return destList[row] }
    // textfield의 텍스트에 pickerview에서 선택한 값을 넣어준다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dest.text = self.destList[row] }
    
}


import SwiftUI
// canvas 세팅

struct MakeRoomViewControllerRepresentable: UIViewControllerRepresentable{
    typealias UIViewControllerType = MakeRoomViewController
    
    func makeUIViewController(context: Context) -> MakeRoomViewController {
        return MakeRoomViewController()
    }
    func updateUIViewController(_ uiViewController: MakeRoomViewController, context: Context) {
        
    }
}

@available(iOS 13.0.0, *)
struct MakeRoomViewPreview: PreviewProvider {
    static var previews: some View {
        MakeRoomViewControllerRepresentable()
    }
}

