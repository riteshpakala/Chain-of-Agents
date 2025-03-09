//
//  ContentView.swift
//  ChainOfAgents
//
//  Created by Rudrank Riyam on 1/28/25.
//

import PDFKit
import SwiftUI
import UniformTypeIdentifiers
import MarqueKit

struct ContentView: View {
    @StateObject private var viewModel = ChainOfAgentsViewModel()
    @State private var showingFilePicker = false
    
    var body: some View {
        NavigationSplitView {
            ScrollView {
                VStack(spacing: 16) {
                    Section {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Toggle("Chat Mode", isOn: $viewModel.useChatMode)
                                    .toggleStyle(.switch)
                                    .padding(.vertical, 8)
                                    .tint(.blue)
                                
                                Spacer()
                            }
                        }
                    } header: {
                        Text("Processing Mode")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    // Document Section
                    Section {
                        Button(action: { showingFilePicker = true }) {
                            VStack(spacing: 12) {
                                Image(systemName: viewModel.selectedPDFURL != nil ? "doc.fill" : "doc.badge.plus")
                                    .font(.system(size: 32))
                                    .foregroundStyle(.blue)
                                
                                Group {
                                    if let url = viewModel.selectedPDFURL {
                                        VStack(spacing: 4) {
                                            Text(url.lastPathComponent)
                                                .lineLimit(1)
                                                .font(.headline)
                                            Text("\(viewModel.pageCount) pages")
                                                .font(.subheadline)
                                                .foregroundStyle(.secondary)
                                        }
                                    } else {
                                        Text("Select PDF Document")
                                            .font(.headline)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.quaternarySystemFill))
                            )
                        }
                        .buttonStyle(.plain)
                    } header: {
                        Text("Document")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 16)
                    }
                    
                    if viewModel.useOnDeviceProcessing {
                        VStack(spacing: 8) {
                            if viewModel.llmManager.isDownloading {
                                ProgressView("Downloading Model", value: viewModel.llmManager.downloadProgress, total: 1.0)
                                    .progressViewStyle(.linear)
                                    .tint(.blue)
                            }
                            
                            Text(viewModel.llmManager.modelInfo)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .animation(.default, value: viewModel.llmManager.isDownloading)
                    }
                    
                    // Processing Mode Section
                    //          Section {
                    //            VStack(spacing: 12) {
                    //            Toggle("Use On-Device Processing", isOn: $viewModel.useOnDeviceProcessing)
                    //                .toggleStyle(.switch)
                    //                .padding(.vertical, 8)
                    //                .tint(.blue)
                    //
                    //
                    //              if viewModel.useOnDeviceProcessing {
                    //                VStack(spacing: 8) {
                    //                  if viewModel.llmManager.isDownloading {
                    //                    ProgressView("Downloading Model", value: viewModel.llmManager.downloadProgress, total: 1.0)
                    //                      .progressViewStyle(.linear)
                    //                      .tint(.blue)
                    //                  }
                    //                  Text(viewModel.llmManager.modelInfo)
                    //                    .font(.caption)
                    //                    .foregroundStyle(.secondary)
                    //                }
                    //                .animation(.default, value: viewModel.llmManager.isDownloading)
                    //              }
                    //            }
                    //          } header: {
                    //            Text("Processing Mode")
                    //              .font(.title3)
                    //              .bold()
                    //              .frame(maxWidth: .infinity, alignment: .leading)
                    //          }
                    
                    // Query Section
                    Section {
                        TextField("Enter your question...", text: $viewModel.query, axis: .vertical)
                            .textFieldStyle(.plain)
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.quaternarySystemFill))
                            )
                    } header: {
                        Text("Document Query")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    // Process Button
                    Button(action: viewModel.processText) {
                        if viewModel.isLoading {
                            ProgressView()
                                .controlSize(.small)
                        } else {
                            Text("Analyze Document")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(viewModel.isLoading || viewModel.selectedPDFURL == nil || viewModel.query.isEmpty)
                    
                    if let error = viewModel.error {
                        Text(error)
                            .font(.callout)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                }
                .padding(20)
            }
            .frame(minWidth: 320)
            .navigationTitle("Input")
            .fileImporter(
                isPresented: $showingFilePicker,
                allowedContentTypes: [UTType.pdf, UTType(filenameExtension: "neatia")!],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    guard let url = urls.first else { return }
                    
                    viewModel.selectPDF(url: url)
                case .failure(let error):
                    viewModel.error = error.localizedDescription
                }
            }
        } detail: {
            if viewModel.useChatMode {
                LLMEvalView()
                    .environment(DeviceStat())
            } else {
                LLMChainView()
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
