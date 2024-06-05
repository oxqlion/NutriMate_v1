////
////  AIResponse.swift
////  NutriMate_v1
////
////  Created by zenzen on 04/06/24.
////
//
//import Foundation
//import OpenAI
//import Combine
//
////class AIResponse: ObservableObject {
//    private let openAi = OpenAI(apiToken: "api_key")
//    @Published var responseText: String = ""
//
//    func getReply(prompt: String, completion: @escaping (String) -> Void) {
//        openAi.completions(query: .init(model: .gpt3_5Turbo, prompt: prompt)) { result in
//            switch result {
//            case .success(let response):
//                guard let choice = response.choices.first else {
//                    completion("No response from API")
//                    return
//                }
//                completion(choice.text)
//            case .failure(let error):
//                completion("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//}
//
//class OpenAIViewModel: ObservableObject {
//    @Published var responseText: String = ""
//    private var aiResponse = AIResponse()
//    private var cancellables = Set<AnyCancellable>()
//
//    func fetchOpenAIResponse(prompt: String) {
//        aiResponse.getReply(prompt: prompt) { [weak self] reply in
//            DispatchQueue.main.async {
//                self?.responseText = reply
//            }
//        }
//    }
//}
