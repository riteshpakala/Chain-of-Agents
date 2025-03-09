//
//  WorkerResponseView.swift
//  ChainOfAgents
//
//  Created by Ritesh Pakala on 3/9/25.
//

import SwiftUI

struct WorkerResponseView: View {
    let message: WorkerMessage
    let totalChunks: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Label(
                    "Worker \(message.id) of \(totalChunks)",
                    systemImage: "person.fill"
                )
                .font(.headline)
                .foregroundColor(.blue)
                
                Spacer()
                
                if let progress = message.progress {
                    Text("\(progress.current)/\(progress.total)")
                        .foregroundColor(.secondary)
                }
            }
            
            // Progress Bar
            if let progress = message.progress {
                ProgressView(
                    value: Double(progress.current),
                    total: Double(progress.total)
                )
                .tint(.blue)
            }
            
            // Content
            Text(message.message)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.windowBackgroundColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(Color.blue.opacity(0.2))
                        )
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.05))
        )
    }
}
