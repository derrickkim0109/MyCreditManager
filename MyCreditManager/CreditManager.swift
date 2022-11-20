//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by Derrick kim on 2022/11/13.
//

final class CreditManager {
    private var school: [Student] = []

    func run() {
        print(ExplanatoryText.inputQuestionList)

        guard let number = readLine(),
              let selectedQuestion = QuestionList(rawValue: number) else {
            print(ExplanatoryText.wrongQuestionAnswer)
            run()
            return
        }

        switch selectedQuestion {
        case .addStudent:
            addStudent()
        case .removeStudentInfo:
            removeStudentInfo()
        case .addAndUpdateGrade:
            addAndUpdateGrade()
        case .removeGrade:
            break
        case .average:
            break
        case .terminateProgram:
            break
        }
    }

    private func findSameName(_ name: String) -> Bool {
        for student in school {
            if student.name == name {
                return true
            }
        }

        return false
    }
}

// MARK: Add Student

private extension CreditManager {
    func addStudent() {
        print(ExplanatoryText.inputStudentName)

        guard let typedName = readLine(),
              checkValidationForAdding(typedName) else {
            run()
            return
        }

        let student = Student(name: typedName, grade: nil)
        school.append(student)
        print(typedName + ExplanatoryText.didAddStudentName)
        run()
    }

    func checkValidationForAdding(_ name: String) -> Bool {
        if findSameName(name) {
            print(name + ExplanatoryText.duplicatedName)
            return false
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
}

// MARK: Remove Student

private extension CreditManager {
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
        if findSameName(name) {
            return true
        }

        print(name + ExplanatoryText.notFindStudentName)
        return false
    }
}

// MARK: Add & Update Student Grade

private extension CreditManager {
    func addAndUpdateGrade() {
        print(ExplanatoryText.willUpdateGrade)
        guard let typedNameAndGradeInfo = readLine()?.components(separatedBy: " ") else {
            print(ExplanatoryText.commonWrongAnswer)
            run()
            return
        }

        if school.count == 0 {
            print(ExplanatoryText.notStudent)
            run()
        }

        for (index, student) in school.enumerated() {
            if student.name == typedNameAndGradeInfo[0] {
                if school[index].grade?[typedNameAndGradeInfo[1]] != nil {
                    school[index].grade?[typedNameAndGradeInfo[1]] =
                                            Grade(rawValue: typedNameAndGradeInfo[2]) ?? .f
                } else {
                    school[index].grade = [typedNameAndGradeInfo[1]:
                                            Grade(rawValue: typedNameAndGradeInfo[2]) ?? .f]

                }

                ExplanatoryText.updateGrade(typedNameAndGradeInfo[1], typedNameAndGradeInfo[2], typedNameAndGradeInfo[0])
                
                run()
                return
            } else {
                print(ExplanatoryText.notStudent)
                run()
            }
        }
    }
}

