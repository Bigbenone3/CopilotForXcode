import Client
import Foundation
import Logger
import SharedUIComponents
import SwiftUI

struct MCPIntroView: View {
    @Binding private var isMCPFFEnabled: Bool

    public init(isMCPFFEnabled: Binding<Bool>) {
        _isMCPFFEnabled = isMCPFFEnabled
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !isMCPFFEnabled {
                GroupBox {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "info.circle.fill")
                            .font(.body)
                            .foregroundColor(.gray)
                        Text(
                            "MCP servers are disabled by your organization’s policy. To enable them, please contact your administrator. [Get More Info about Copilot policies](https://docs.github.com/en/copilot/how-tos/administer-copilot/manage-for-organization/manage-policies)"
                        )
                    }
                }
                .groupBoxStyle(
                    CardGroupBoxStyle(
                        backgroundColor: Color(nsColor: .textBackgroundColor)
                    )
                )
            }
        }
    }
}

#Preview {
    MCPIntroView(isMCPFFEnabled: .constant(true))
        .frame(width: 800)
}

#Preview {
    MCPIntroView(isMCPFFEnabled: .constant(false))
        .frame(width: 800)
}
