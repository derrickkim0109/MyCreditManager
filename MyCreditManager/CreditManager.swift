//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by Derrick kim on 2022/11/13.
//

final class CreditManager {
    private var school: [Student] = []

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

    func registerStudent() {
        print(ExplanatoryText.inputStudentName)

        guard let typedName = readLine(),
              checkNameValidation(typedName) else {
            run()
            return
        }

        let student = Student(name: typedName, grade: nil)
        school.append(student)
        run()
    }

    func checkNameValidation(_ name: String) -> Bool {
        for student in school {
            if student.name == name {
                print(name + ExplanatoryText.duplicatedName)
                return false
            }
        }

        let numberValidation = checkNumberValidation(name)
        return numberValidation
    }

    func checkNumberValidation(_ name: String) -> Bool {
        for number in 0...9 {
            if name.contains(String(number)) {
                print(ExplanatoryText.commonWrongAnswer)
                return false
            }
        }

        return true
    }
}
