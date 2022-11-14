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
              checkValidationForRegistering(typedName) else {
            run()
            return
        }

        let student = Student(name: typedName, grade: nil)
        school.append(student)
        print(typedName + ExplanatoryText.didAddStudentName)
        run()
    }

    func checkValidationForRegistering(_ name: String) -> Bool {
        for student in school {
            if student.name == name {
                print(name + ExplanatoryText.duplicatedName)
                return false
            }
        }

        let numberAndLetterValidation = checkNumberValidation(name) && checkLetter(name)

        return numberAndLetterValidation
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

    func checkLetter(_ name: String) -> Bool {
        for word in name {
            if !word.isLetter {
                print(ExplanatoryText.commonWrongAnswer)
                return false
            }
        }

        return true
    }

    func removeStudentInfo() {
        print(ExplanatoryText.inputStudentNameForRemoving)

        guard let typedName = readLine(),
              checkValidationForRemoving(typedName) else {
            run()
            return
        }

        for (index, student) in school.enumerated() {
            if student.name == typedName {
                school.remove(at: index)
            }
        }

        print(typedName + ExplanatoryText.removeStudent)
        run()
    }

    func checkValidationForRemoving(_ name: String) -> Bool {
        for student in school {
            if student.name == name {
                return true
            }
        }

        print(name + ExplanatoryText.notFindStudentName)
        return false
    }
}
