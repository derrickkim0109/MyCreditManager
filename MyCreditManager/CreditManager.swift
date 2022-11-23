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
            removeGrade()
        case .average:
            setupGradeAverage()
        case .terminateProgram:
            ExplanatoryText.terminateProgram()
        }
    }

    private func findSameName(_ name: String) -> Bool {
        for student in school {
            if student.name == name {
                return true
            } else {
                print(name + ExplanatoryText.notFindStudentName)
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

        let student = Student(name: typedName, grade: [:])
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
              findSameName(typedName) else {
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
}

// MARK: Add & Update Student Grade

private extension CreditManager {
    func addAndUpdateGrade() {
        print(ExplanatoryText.willUpdateGrade)
        guard let typedNameAndGradeInfo = readLine()?.components(separatedBy: " "),
              typedNameAndGradeInfo.count == 3 else {
            print(ExplanatoryText.commonWrongAnswer)
            run()
            return
        }

        if school.count == 0 {
            print(ExplanatoryText.notStudent)
            run()
        }

        for (index, _) in school.enumerated() {
            guard findSameName(typedNameAndGradeInfo[0]) else {
                print(ExplanatoryText.notStudent)
                run()
                return
            }

            school[index].grade.updateValue(Grade(rawValue: typedNameAndGradeInfo[2]) ?? .f, forKey: typedNameAndGradeInfo[1])

            print(school[index].grade)

            ExplanatoryText.updateGrade(typedNameAndGradeInfo[1], typedNameAndGradeInfo[2], typedNameAndGradeInfo[0])

            run()
        }
    }
}

// MARK: Remove Student Grade
private extension CreditManager {
    func removeGrade() {
        print(ExplanatoryText.willRemoveGrade)

        guard let typedNameAndGradeInfo = readLine()?.components(separatedBy: " "),
              typedNameAndGradeInfo.count == 2 else {
            print(ExplanatoryText.commonWrongAnswer)
            run()
            return
        }

        for (index, _) in school.enumerated() {
            guard findSameName(typedNameAndGradeInfo[0]) else  {
                run()
                return
            }

            if school[index].grade[typedNameAndGradeInfo[1]] != nil {
                ExplanatoryText.removeGrade(typedNameAndGradeInfo[0], typedNameAndGradeInfo[1])

                school[index].grade.removeValue(forKey: typedNameAndGradeInfo[1])
                run()
            } else {
                print(typedNameAndGradeInfo[1] + ExplanatoryText.notFindGrade)
                run()
            }
        }
    }
}

// MARK: Grade Average

private extension CreditManager {
    func setupGradeAverage() {
        print(ExplanatoryText.findStudentGradeAverage)

        for student in school {
            guard let typedName = readLine(),
                  findSameName(typedName) else {
                run()
                return
            }

            let grades = student.grade
            setupGrades(grades)
        }

        run()
    }

    func setupGrades(_ grades: [String: Grade]) {
        var totalValue = 0.0
        for (gradeName, grade) in grades {
            print(gradeName, ":", grade.rawValue)
            totalValue += grade.value
        }

        setupTotalAverage(totalValue, gradeCount: grades.count)
    }

    func setupTotalAverage(_ totalGrade: Double, gradeCount: Int) {
        print(ExplanatoryText.gradeAverage, totalGrade / Double(gradeCount))
    }
}
