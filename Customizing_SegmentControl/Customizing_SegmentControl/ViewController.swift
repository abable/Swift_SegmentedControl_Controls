//
//  ViewController.swift
//  Customizing_SegmentControl
//
//  Created by Seungjun Lim on 22/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmenteControl: UISegmentedControl!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func insertSegment(_ sender: Any) {
        guard let title = titleField.text, title.count > 0 else{
            return
        }
        
        // image 전달..
//        segmenteControl.insertSegment(with: <#T##UIImage?#>, at: <#T##Int#>, animated: <#T##Bool#>)
        // text 전달.. 현제 세그먼트가 들어오도록 at 값 입력..
        segmenteControl.insertSegment(withTitle: title, at: segmenteControl.numberOfSegments, animated: true)
        titleField.text = nil
    }
    
    @IBAction func removeSegment(_ sender: Any) {
        
        guard let title = titleField.text, title.count > 0 else{
            return
        }
        
        for index in 0..<segmenteControl.numberOfSegments {
            // 이 메소드로 인덱스를 전달하고, 리턴값을 커런트 상수값에 저장하겠습니다.
            if let currentTitle = segmenteControl.titleForSegment(at: index), currentTitle == title {
                segmenteControl.removeSegment(at: index, animated: true)
                break
            }
        }
        // 마지막에 텍스트 필드를 초기화 하는 코드를 추가하겠습니다.
        titleField.text = nil
        
        
        // 첫번째 인덱스는 삭제할 세그먼트의 인덱스 입니다. 타이틀을 기준으로 삭제하는 메소드가 없기떄문에 전체세그먼트를 열거 하면서 타이틀을 비교하는 코드가 필요합니다. 우선 그래서 위에 타이틀 코드 복사..하고 포문을 사용하여 세그먼트의 수만큼 반복 하겠습니다.
//        segmenteControl.removeSegment(at: <#T##Int#>, animated: <#T##Bool#>)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalImage = #imageLiteral(resourceName: "segment_normal")
        let selectedImage = #imageLiteral(resourceName: "segment_selected@2s")
        
        segmenteControl.setBackgroundImage(normalImage, for: .normal, barMetrics: .default)
        segmenteControl.setBackgroundImage(selectedImage, for: .selected, barMetrics: .default)
        
        segmenteControl.setDividerImage(#imageLiteral(resourceName: "segment_normal_normal"), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmenteControl.setDividerImage(#imageLiteral(resourceName: "segment_normal_selected"), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        segmenteControl.setDividerImage(#imageLiteral(resourceName: "segment_selected_normal"), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }


}

