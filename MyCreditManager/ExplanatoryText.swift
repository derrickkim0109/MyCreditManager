//
//  ExplanatoryText.swift
//  MyCreditManager
//
//  Created by Derrick kim on 2022/11/13.
//

enum ExplanatoryText {
    static let inputQuestionList = """
    원하는 기능을 입력해주세요.
    1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
    """

    static let wrongQuestionAnswer = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    static let commonWrongAnswer = "입력이 잘못되었습니다. 다시 확인해주세요."

    static let inputStudentName = "추가할 학생의 이름을 입력해 주세요."
    static let didAddStudentName = "학생을 추가하였습니다."
    static let duplicatedName = "은/는 이미 존재하는 학생입니다. 추가하지 않습니다."

    static let inputStudentNameForRemoving = "삭제할 학생의 이름을 입력해주세요."
    static let removeStudent = " 학생을 삭제하였습니다."
    static let notFindStudentName = " 학생을 찾지 못했습니다."

    static let willUpdateGrade = """
성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄워쓰기로 구분하여 차례대로 작성해주세요.
입력예) Derrick Swift A+
만약에 학생의 성적 중에 해당 과목이 존재하면 기존 점수가 갱신됩니다.
"""

    static let notStudent = "없는 학생입니다. 학생 추가를 통해 추가해주세요."
}

extension ExplanatoryText {
    static func updateGrade(_ gradeName: String, _ grade: String ,_ studentName: String) {
        print("\(studentName) 학생의 \(gradeName) 과목이 \(grade)로 추가(변경)되었습니다.")
    }
}
