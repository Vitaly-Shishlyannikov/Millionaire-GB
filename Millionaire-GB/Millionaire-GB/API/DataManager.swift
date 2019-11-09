//
//  Data.swift
//  Millionaire-GB
//
//  Created by Vitaly_Shishlyannikov on 23.10.2019.
//  Copyright © 2019 Vitaly_Shishlayannikov. All rights reserved.
//

import Foundation

final class DataManager {
    
    static var questions: [Question] = [
        
        Question(question: "Как называлась деревня, в которой жили дядя Фёдор, Матроскин и Шарик?",
                             answer1: "Простоквашино",
                             answer2: "Молочное",
                             answer3: "Йогуртово",
                             answer4: "Простофилино",
                             correctAnswer: "Простоквашино",
                             helpOfFriend: "Ну точно не Молочное и не Йогуртово",
                             helpOfAudience: "99% за Простоквашино"),
    
        Question(question: "Как называется пулярное блюдо?",
                             answer1: "Макароны по-флотски",
                             answer2: "Вермишель по-солдатски",
                             answer3: "Лапша по-пилотски",
                             answer4: "Спагетти по-снайперски",
                             correctAnswer: "Макароны по-флотски",
                             helpOfFriend: "Я служил на корабле! Это макароны по-флотски!",
                             helpOfAudience: "75% за макароны по-флотски"),
    
        Question(question: "Какой из перечисленных волхвов не приходил поклониться новорожденному Иисусу Христу?",
                             answer1: "Симон",
                             answer2: "Валтасар",
                             answer3: "Каспар",
                             answer4: "Мельхиор",
                             correctAnswer: "Симон",
                             helpOfFriend: "Что-то не припомню волхва по имени Симон",
                             helpOfAudience: "51% за Симона"),
    
        Question(question: "Какой химический элемент назван в честь злого подземного гнома?",
                             answer1: "Кобальт",
                             answer2: "Берилий",
                             answer3: "Теллур",
                             answer4: "Гафний",
                             correctAnswer: "Кобальт",
                             helpOfFriend: "Думаю, Теллур! или Кобальт...",
                             helpOfAudience: "По 26% за Кобальта и Гафния, по 24% за остальных"),
    
        Question(question: "Месторасположение какой из этих станций в Антарктиде совпадает с полюсом холода?",
                             answer1: "Восток",
                             answer2: "Пионерская",
                             answer3: "Молодёжная",
                             answer4: "Мирный",
                             correctAnswer: "Восток",
                             helpOfFriend: "Ооо... не по адресу ты позвонил. Как жена? как дети?",
                             helpOfAudience: "Все варианты набрали по 25%")
    ]
    
    static func getAllQuestions() -> [Question] {
        return questions
    }
}


