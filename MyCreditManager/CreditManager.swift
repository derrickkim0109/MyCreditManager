//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by Derrick kim on 2022/11/13.
//

final class CreditManager {

    func run() {
        print(ExplanatoryText.inputQuestList)

        guard let number = readLine(),
              let selectedQuestion = QuestionList(rawValue: number) else {
            print(ExplanatoryText.wrongQuestionAnswer)
            run()
            return
        }

        switch selectedQuestion {
        case .registerStudent:
            registerStudent()
        case .removeStudentInfo:
            removeStudentInfo()
        case .addAndUpdateGrade:
            break
        case .removeGrade:
            break
        case .average:
            break
        case .terminateProgram:
            break
        }
    }
}
