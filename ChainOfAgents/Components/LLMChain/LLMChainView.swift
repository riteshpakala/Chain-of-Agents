//
//  LLMChainView.swift
//  ChainOfAgents
//
//  Created by Ritesh Pakala on 3/9/25.
//

import SwiftUI

struct LLMChainView: View {
    @EnvironmentObject
    var viewModel: ChainOfAgentsViewModel
    
    var body: some View {
        // Results View
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                if viewModel.isLoading {
                    VStack(spacing: 16) {
                        ProgressView("Processing Document...")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        // Progress Stats
                        HStack(spacing: 20) {
                            Label(
                                "\(viewModel.workerMessages.count) chunks processed",
                                systemImage: "doc.text.fill")
                            Label(
                                "\(viewModel.pageCount) total pages",
                                systemImage: "book.fill")
                        }
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.windowBackgroundColor))
                            .shadow(radius: 2)
                    )
                    .padding(.top, 40)
                }
                
                // Worker Messages
                if !viewModel.workerMessages.isEmpty {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Analysis Progress")
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            // Progress indicator
                            if viewModel.isLoading {
                                Label("Processing...", systemImage: "arrow.triangle.2.circlepath")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        ForEach(viewModel.workerMessages) { message in
                            WorkerResponseView(
                                message: message,
                                totalChunks: viewModel.totalChunks
                            )
                        }
                    }
                }
                
                // Manager Message
                if !viewModel.managerMessage.isEmpty {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Final Summary")
                                .font(.title2)
                                .bold()
                            
                            if viewModel.isLoading {
                                Spacer()
                                ProgressView()
                                    .scaleEffect(0.8)
                            }
                        }
                        
                        Text(viewModel.managerMessage)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue.opacity(0.1))
                            )
                    }
                }
                
                Text("Total Chunks: \(viewModel.totalChunks)")  // Debug view
                Text("Current Progress: \(viewModel.workerMessages.count)/\(viewModel.totalChunks)")  // Debug view
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(minWidth: 500)
        .navigationTitle("Results")
        .background(Color(.windowBackgroundColor))
    }
}
