//
//  Models.swift
//  ChainOfAgents
//
//  Created by Ritesh Pakala on 3/8/25.
//

import MLXLMCommon
import Foundation

struct LLMModels {
    struct DeepSeek {
        struct Local {
            static public let r1_distill_qwen_nano = ModelConfiguration(
                directory: URL(filePath: "/Users/ritesh/Documents/ml/models/llm/DeepSeek-R1-Distill-Qwen-1.5B-4bit", directoryHint: .isDirectory)!,
                defaultPrompt: "What does Eppur si muove mean?"
            )
        }
        static public let r1_distill_qwen = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/deepseek-r1-distill-qwen-1.5b", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        static public let r1_distill_qwen_nano = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/DeepSeek-R1-Distill-Qwen-1.5B-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        // 512gb with overhead of 2 ⛔️
        static public let r1_32_distill_qwen_8bit = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/DeepSeek-R1-Distill-Qwen-32B-MLX-8Bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        // This loads (17.7GB) even if its a 128gb with overhead of 1
        static public let r1_32_distill_qwen_4bit = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/DeepSeek-R1-Distill-Qwen-32B-4Bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        // 420gb with overhead of 2 ⛔️
        static public let r1_distill_llama = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/DeepSeek-R1-Distill-Llama-70B-3bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
    }
    struct Meta {
        // 64gb with overhead of 2
        static public let llama = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/Meta-Llama-3.1-8B-Instruct-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
    }
    struct Mistral {
        static public let nemo = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/Mistral-Nemo-Instruct-2407-8bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        
        // 192gb with overhead of 2 ⛔️
        static public let small = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/Mistral-Small-24B-Instruct-2501-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        
        static public let large = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/Mistral-Large-Instruct-2407-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
    }
    struct Qwen {
        // 256gb with overhead of 2 ⛔️
        static public let coder_32 = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/Qwen2.5-Coder-32B-Instruct-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
        
        static public let coder_14 = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/Qwen2.5-Coder-14B-Instruct-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
    }
    struct QwQ {
        // 256gb with overhead of 2 ⛔️
        static public let small = ModelConfiguration(
            directory: URL(filePath: "/Volumes/T9/models/llm/QwQ-32B-4bit", directoryHint: .isDirectory)!,
            defaultPrompt: "What does Eppur si muove mean?"
        )
    }
    
    fileprivate static var documentsDirectory: URL {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return documentDirectory
        } else {
            return URL(filePath: "/Users/ritesh/Documents")!
        }
    }
}
