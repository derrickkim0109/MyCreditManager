//
//  main.swift
//  MyCreditManager
//
//  Created by Derrick kim on 2022/11/13.
//

import Foundation

func run() {
    print(ExplanatoryText.input)

    guard let number = readLine(),
          let selectedQuestion = QuestionList(rawValue: number) else {
        print(ExplanatoryText.wrongAnswer)
        run()
        return
    }
}

run()
