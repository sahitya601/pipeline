<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trivy Vulnerability Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .severity-high {
            background-color: #ffcccb;
        }
        .severity-critical {
            background-color: #f28c8c;
            font-weight: bold;
        }
        .severity-medium {
            background-color: #ffecb3;
        }
        .severity-low {
            background-color: #c8e6c9;
        }
    </style>
</head>
<body>
    <h1>Trivy Vulnerability Report</h1>
    <p>Generated on: {{ .GeneratedAt }}</p>
    <p>Image Scanned: <strong>{{ .ArtifactName }}</strong></p>

    <table>
        <thead>
            <tr>
                <th>Package</th>
                <th>Vulnerability ID</th>
                <th>Severity</th>
                <th>Installed Version</th>
                <th>Fixed Version</th>
                <th>Links</th>
            </tr>
        </thead>
        <tbody>
            {{ range .Results }}
                {{ range .Vulnerabilities }}
                <tr class="severity-{{ .Severity | lower }}">
                    <td>{{ .PkgName }}</td>
                    <td>{{ .VulnerabilityID }}</td>
                    <td>{{ .Severity }}</td>
                    <td>{{ .InstalledVersion }}</td>
                    <td>{{ .FixedVersion }}</td>
                    <td>
                        {{ range .References }}
                            <a href="{{ . }}" target="_blank">{{ . }}</a><br>
                        {{ end }}
                    </td>
                </tr>
                {{ end }}
            {{ end }}
        </tbody>
    </table>
</body>
</html>
