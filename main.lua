<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Script - Roblox GUI</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #000000;
            color: #ffffff;
            overflow: hidden;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-container {
            width: 90%;
            max-width: 1200px;
            height: 90vh;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.8);
            display: flex;
            flex-direction: column;
            animation: fadeInScale 0.8s ease-out;
        }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .header {
            padding: 20px 30px;
            background: linear-gradient(90deg, #1a1a1a 0%, #2a2a2a 100%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .logo-text {
            font-size: 24px;
            font-weight: bold;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .content {
            flex: 1;
            display: flex;
            padding: 20px;
            gap: 20px;
            overflow: hidden;
        }

        .sidebar {
            width: 250px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px 15px;
            animation: slideInLeft 0.8s ease-out;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .nav-item {
            padding: 12px 15px;
            margin-bottom: 10px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        
        .nav-item.active {
            background: linear-gradient(45deg, #4169e1, #1e90ff);
        }

        .features-grid {
            flex: 1;
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
            overflow-y: auto;
            padding: 15px;
            animation: fadeIn 1s ease-out;
        }

        .section-content {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
            width: 100%;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 18px;
            transition: all 0.3s ease;
            animation: slideUp 0.8s ease-out;
            margin: 5px;
            min-height: 280px;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        
        .feature-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }

        .feature-icon {
            width: 32px;
            height: 32px;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .feature-title {
            font-size: 16px;
            font-weight: 600;
        }

        .toggle-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 10px 0;
        }

        .toggle-label {
            font-size: 12px;
            color: #cccccc;
        }

        .toggle-switch {
            position: relative;
            width: 44px;
            height: 24px;
            background: rgba(128, 128, 128, 0.3);
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3);
        }

        .toggle-slider {
            position: absolute;
            top: 2px;
            left: 2px;
            width: 20px;
            height: 20px;
            background: white;
            border-radius: 50%;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .toggle-switch.active .toggle-slider {
            transform: translateX(20px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        .toggle-switch.active {
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2), 0 0 8px rgba(65, 105, 225, 0.3);
        }

        .slider-container {
            margin: 10px 0;
        }

        .slider-label {
            font-size: 12px;
            color: #cccccc;
            margin-bottom: 6px;
            display: flex;
            justify-content: space-between;
        }

        .slider {
            width: 100%;
            height: 8px;
            background: transparent;
            border-radius: 4px;
            outline: none;
            -webkit-appearance: none;
            appearance: none;
            border: none;
            box-shadow: none;
            position: absolute;
            top: 0;
            left: 0;
            margin: 0;
            padding: 0;
            cursor: pointer;
        }

        /* Verstecke Standard-Slider in allen Browsern */
        input[type="range"] {
            -webkit-appearance: none;
            appearance: none;
            background: transparent;
            cursor: pointer;
        }

        input[type="range"]::-webkit-slider-track {
            -webkit-appearance: none;
            appearance: none;
            background: transparent;
        }

        input[type="range"]::-moz-range-track {
            background: transparent;
        }

        .slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 18px;
            height: 18px;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 2;
        }

        .slider::-moz-range-thumb {
            width: 18px;
            height: 18px;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            border: none;
            -moz-appearance: none;
            appearance: none;
        }

        /* Zusätzliche Browser-Kompatibilität */
        input[type="range"]::-ms-track {
            width: 100%;
            height: 8px;
            background: transparent;
            border-color: transparent;
            color: transparent;
        }

        input[type="range"]::-ms-fill-lower {
            background: transparent;
            border: none;
        }

        input[type="range"]::-ms-fill-upper {
            background: transparent;
            border: none;
        }

        input[type="range"]::-ms-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 18px;
            height: 18px;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border-radius: 50%;
            border: none;
            cursor: pointer;
        }

        .slider-fill {
            position: absolute;
            height: 100%;
            background: linear-gradient(90deg, #4169e1, #1e90ff);
            border-radius: 4px;
            pointer-events: none;
            transition: none;
            box-shadow: none;
            top: 0;
            left: 0;
            z-index: 1;
            transform: translateZ(0);
            -webkit-transform: translateZ(0);
            backface-visibility: hidden;
            -webkit-backface-visibility: hidden;
            will-change: width;
        }

        .slider-wrapper {
            position: relative;
            width: 100%;
            height: 8px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 4px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
            transform: translateZ(0);
            -webkit-transform: translateZ(0);
            backface-visibility: hidden;
            -webkit-backface-visibility: hidden;
        }

        
        .button {
            width: 100%;
            padding: 8px;
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: 600;
            font-size: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 8px;
        }

        
        .button:active {
            transform: translateY(0);
        }

        .status-indicator {
            width: 8px;
            height: 8px;
            background: #1e90ff;
            border-radius: 50%;
            animation: blink 2s infinite;
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.3; }
        }

        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(45deg, #4169e1, #1e90ff);
            border-radius: 4px;
        }

        .status-bar {
            height: 60px;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .account-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar-container {
            position: relative;
            width: 40px;
            height: 40px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.2);
            object-fit: cover;
        }

        .account-details {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .username {
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
        }

        .account-status {
            color: #4ecdc4;
            font-size: 12px;
            font-weight: 500;
        }

        .server-info {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .server-status {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .status-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }

        .status-dot.online {
            background: #4ecdc4;
            animation: pulse 2s infinite;
        }

        .status-dot.offline {
            background: #dc3545;
        }

        .server-name {
            color: #ffffff;
            font-size: 13px;
            font-weight: 500;
        }

        .account-status-sidebar {
            margin-top: auto;
            padding: 8px;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.08);
            display: flex;
            align-items: center;
            gap: 8px;
            width: calc(100% - 40px);
            margin-left: 20px;
            margin-right: 20px;
        }

        .sidebar {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .account-header-sidebar {
            padding: 15px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .account-stats-sidebar {
            padding: 12px 15px;
            display: flex;
            justify-content: space-around;
            background: rgba(0, 0, 0, 0.2);
        }

        .stat-item-sidebar {
            text-align: center;
            flex: 1;
        }

        .stat-value-sidebar {
            display: block;
            color: #4169e1;
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 2px;
        }

        .stat-label-sidebar {
            display: block;
            color: rgba(255, 255, 255, 0.6);
            font-size: 10px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .avatar-sidebar {
            width: 30px;
            height: 30px;
            flex-shrink: 0;
        }

        .avatar-sidebar img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 1px solid rgba(255, 255, 255, 0.15);
            object-fit: cover;
        }

        .account-info-sidebar {
            flex: 1;
            min-width: 0;
        }

        .username-sidebar {
            color: #ffffff;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 1px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .status-text-sidebar {
            color: rgba(255, 255, 255, 0.6);
            font-size: 10px;
            font-weight: 400;
            display: flex;
            align-items: center;
            gap: 4px;
            justify-content: center;
        }

        .status-dot-sidebar {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            flex-shrink: 0;
        }

        .status-dot-sidebar.online {
            background: #4ecdc4;
            animation: pulse 2s infinite;
        }

        .status-dot-sidebar.offline {
            background: #dc3545;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="header">
            <div class="logo">
                <div class="logo-icon">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="white" stroke-width="2"/>
                        <path d="M2 17L12 22L22 17" stroke="white" stroke-width="2"/>
                        <path d="M2 12L12 17L22 12" stroke="white" stroke-width="2"/>
                    </svg>
                </div>
                <div class="logo-text">Global Script</div>
            </div>
            <div class="status-indicator"></div>
        </div>

        <div class="content">
            <div class="sidebar">
                <div class="nav-item active" data-section="dashboard">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M3 12L5 10M5 10L12 3L19 10M5 10V20C5 20.5523 5.44772 21 6 21H9M19 10L21 12M19 10V20C19 20.5523 18.5523 21 18 21H15M9 21C9.55228 21 10 20.5523 10 20V16C10 15.4477 10.4477 15 11 15H13C13.5523 15 14 15.4477 14 16V20C14 20.5523 14.4477 21 15 21M9 21H15" stroke="currentColor" stroke-width="2"/>
                    </svg>
                    <span>Dashboard</span>
                </div>
                <div class="nav-item" data-section="player">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z" stroke="currentColor" stroke-width="2"/>
                    </svg>
                    <span>Player</span>
                </div>
                <div class="nav-item" data-section="target">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
                        <circle cx="12" cy="12" r="6" stroke="currentColor" stroke-width="2"/>
                        <circle cx="12" cy="12" r="2" fill="currentColor"/>
                    </svg>
                    <span>Target</span>
                </div>
                <div class="nav-item" data-section="combat">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M12 2L2 7V12C2 16.5 4.23 20.68 7.62 23.15L12 24L16.38 23.15C19.77 20.68 22 16.5 22 12V7L12 2Z" stroke="currentColor" stroke-width="2"/>
                    </svg>
                    <span>Combat</span>
                </div>
                <div class="nav-item" data-section="visuals">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M13 2L3 14H12L11 22L21 10H12L13 2Z" stroke="currentColor" stroke-width="2"/>
                    </svg>
                    <span>Visuals</span>
                </div>
                <div class="nav-item" data-section="following">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                        <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2ZM21 16V14C18.76 14 16.84 13.04 15.6 11.5L14.32 9.84C14.1 9.56 13.82 9.33 13.5 9.18C13.13 9 12.74 8.91 12.33 8.91H11.67C11.26 8.91 10.87 9 10.5 9.18C10.18 9.33 9.9 9.56 9.68 9.84L8.4 11.5C7.16 13.04 5.24 14 3 14V16C5.76 16 8.3 14.7 10 12.7V16L6.5 20.5L8 22L12 18L16 22L17.5 20.5L14 16V12.7C15.7 14.7 18.24 16 21 16Z" stroke="currentColor" stroke-width="2"/>
                    </svg>
                    <span>Following</span>
                </div>
                
                <div style="flex-grow: 1;"></div>
                
                <!-- Account Status -->
                <div class="account-status-sidebar">
                    <div class="avatar-sidebar">
                        <img src="https://tr.rbxcdn.com/0b3c0b6-2c1f-4c3a-9a0c-4c2d3d5e0c0/Default/AvatarHeadshot.png" alt="Avatar">
                    </div>
                    <div class="account-info-sidebar" style="margin-left: auto; text-align: center;">
                        <div class="username-sidebar">RobloxUser</div>
                        <div class="status-text-sidebar">
                            <span class="status-dot-sidebar online"></span>
                            Connected
                        </div>
                    </div>
                </div>
            </div>

            <div class="features-grid">
                <!-- Dashboard Section -->
                <div class="section-content" id="dashboard-section" style="display: grid;">
                    <!-- Fly Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M21 16V8C21 7.45 20.55 7 20 7H16L14 5H8C7.45 5 7 5.45 7 6V16C7 16.55 7.45 17 8 17H20C20.55 17 21 16.55 21 16Z" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Fly</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Fly</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Speed</span>
                                <span>50</span>
                            </div>
                            <input type="range" class="slider" min="1" max="100" value="50">
                        </div>
                    </div>

                    <!-- Speed Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M20.38 8.57L13.21 15.74C12.63 16.32 11.76 16.32 11.18 15.74L8.57 13.13C7.99 12.55 7.99 11.68 8.57 11.1L15.74 3.93C16.32 3.35 17.19 3.35 17.77 3.93L20.38 6.54C20.96 7.12 20.96 7.99 20.38 8.57Z" stroke="white" stroke-width="2"/>
                                    <path d="M3 21L9 15" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Speed</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Speed</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Multiplier</span>
                                <span>2.0x</span>
                            </div>
                            <input type="range" class="slider" min="1" max="10" value="2" step="0.1">
                        </div>
                    </div>

                    <!-- Jump Power Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M7 14L12 9L17 14M12 9V20" stroke="white" stroke-width="2"/>
                                    <path d="M4 6L7 9L10 6" stroke="white" stroke-width="2"/>
                                    <path d="M14 6L17 9L20 6" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Jump Power</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Jump Power</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Power</span>
                                <span>100</span>
                            </div>
                            <input type="range" class="slider" min="50" max="500" value="100">
                        </div>
                    </div>

                    <!-- Noclip Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M3 3L21 21M12 12V21M8 8L8 16M16 4V12" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Noclip</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Noclip</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Speed</span>
                                <span>30</span>
                            </div>
                            <input type="range" class="slider" min="10" max="100" value="30">
                        </div>
                    </div>
                </div>

                <!-- Player Section -->
                <div class="section-content" id="player-section" style="display: none;">
                    <!-- Teleport to Player Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 2L8 6H11V11H13V6H16L12 2Z" stroke="white" stroke-width="2"/>
                                    <path d="M12 22L16 18H13V13H11V18H8L12 22Z" stroke="white" stroke-width="2"/>
                                    <circle cx="12" cy="12" r="3" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Teleport to Player</div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Target Player</span>
                            </div>
                            <select style="width: 100%; padding: 10px; background: rgba(0, 0, 0, 0.7); border: 1px solid rgba(255, 255, 255, 0.3); border-radius: 6px; color: #ffffff; font-size: 14px; font-weight: 500; cursor: pointer;">
                                <option>Player 1</option>
                                <option>Player 2</option>
                                <option>Player 3</option>
                            </select>
                        </div>
                        <button class="button">Teleport</button>
                    </div>

                    <!-- Teleport Player to Me Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M8 6L12 2L16 6M12 2V9" stroke="white" stroke-width="2"/>
                                    <path d="M8 18L12 22L16 18M12 22V15" stroke="white" stroke-width="2"/>
                                    <circle cx="12" cy="12" r="2" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Teleport Player to Me</div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Target Player</span>
                            </div>
                            <select style="width: 100%; padding: 10px; background: rgba(0, 0, 0, 0.7); border: 1px solid rgba(255, 255, 255, 0.3); border-radius: 6px; color: #ffffff; font-size: 14px; font-weight: 500; cursor: pointer;">
                                <option>Player 1</option>
                                <option>Player 2</option>
                                <option>Player 3</option>
                            </select>
                        </div>
                        <button class="button">Teleport to Me</button>
                    </div>

                    <!-- Following Player Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2ZM21 16V14C18.76 14 16.84 13.04 15.6 11.5L14.32 9.84C14.1 9.56 13.82 9.33 13.5 9.18C13.13 9 12.74 8.91 12.33 8.91H11.67C11.26 8.91 10.87 9 10.5 9.18C10.18 9.33 9.9 9.56 9.68 9.84L8.4 11.5C7.16 13.04 5.24 14 3 14V16C5.76 16 8.3 14.7 10 12.7V16L6.5 20.5L8 22L12 18L16 22L17.5 20.5L14 16V12.7C15.7 14.7 18.24 16 21 16Z" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Following Player</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Following</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Target Player</span>
                            </div>
                            <select style="width: 100%; padding: 10px; background: rgba(0, 0, 0, 0.7); border: 1px solid rgba(255, 255, 255, 0.3); border-radius: 6px; color: #ffffff; font-size: 14px; font-weight: 500; cursor: pointer;">
                                <option>Player 1</option>
                                <option>Player 2</option>
                                <option>Player 3</option>
                            </select>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Distance</span>
                                <span>5</span>
                            </div>
                            <input type="range" class="slider" min="1" max="20" value="5">
                        </div>
                    </div>
                </div>

                <!-- Target Section -->
                <div class="section-content" id="target-section" style="display: none;">
                    <!-- Target Selection -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/>
                                    <circle cx="12" cy="12" r="6" stroke="white" stroke-width="2"/>
                                    <circle cx="12" cy="12" r="2" fill="white"/>
                                </svg>
                            </div>
                            <div class="feature-title">Target Selection</div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Player List</span>
                            </div>
                            <div style="max-height: 200px; overflow-y: auto; background: rgba(0, 0, 0, 0.6); border: 1px solid rgba(255, 255, 255, 0.2); border-radius: 8px; padding: 12px;">
                                <div class="player-item" data-player="Player 1" style="padding: 12px; margin: 6px 0; background: rgba(30, 30, 30, 0.8); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 8px; cursor: pointer; display: flex; justify-content: space-between; align-items: center; transition: all 0.3s ease;">
                                    <span style="color: #ffffff; font-size: 14px; font-weight: 500;">Player 1</span>
                                    <div class="target-check" style="width: 24px; height: 24px; display: none;">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                            <path d="M9 12L11 14L15 10" stroke="#32cd32" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                                            <circle cx="12" cy="12" r="10" stroke="#32cd32" stroke-width="2.5"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="player-item" data-player="Player 2" style="padding: 12px; margin: 6px 0; background: rgba(30, 30, 30, 0.8); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 8px; cursor: pointer; display: flex; justify-content: space-between; align-items: center; transition: all 0.3s ease;">
                                    <span style="color: #ffffff; font-size: 14px; font-weight: 500;">Player 2</span>
                                    <div class="target-check" style="width: 24px; height: 24px; display: none;">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                            <path d="M9 12L11 14L15 10" stroke="#32cd32" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                                            <circle cx="12" cy="12" r="10" stroke="#32cd32" stroke-width="2.5"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="player-item" data-player="Player 3" style="padding: 12px; margin: 6px 0; background: rgba(30, 30, 30, 0.8); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 8px; cursor: pointer; display: flex; justify-content: space-between; align-items: center; transition: all 0.3s ease;">
                                    <span style="color: #ffffff; font-size: 14px; font-weight: 500;">Player 3</span>
                                    <div class="target-check" style="width: 24px; height: 24px; display: none;">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                            <path d="M9 12L11 14L15 10" stroke="#32cd32" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                                            <circle cx="12" cy="12" r="10" stroke="#32cd32" stroke-width="2.5"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Target</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Anti-Target Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 2L2 7V12C2 16.5 4.23 20.68 7.62 23.15L12 24L16.38 23.15C19.77 20.68 22 16.5 22 12V7L12 2Z" stroke="white" stroke-width="2"/>
                                    <path d="M9 12L15 12M12 9L12 15" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Anti-Target</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Anti-Target</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Current Target Display -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 2L2 7V12C2 16.5 4.23 20.68 7.62 23.15L12 24L16.38 23.15C19.77 20.68 22 16.5 22 12V7L12 2Z" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Current Targets</div>
                        </div>
                        <div style="background: rgba(255,255,255,0.05); border-radius: 5px; padding: 15px;">
                            <div style="margin-bottom: 10px;">
                                <strong style="color: #4169e1;">Target:</strong> <span id="current-target">None</span>
                            </div>
                            <div>
                                <strong style="color: #dc143c;">Anti-Target:</strong> <span id="current-anti-target">None</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Combat Section -->
                <div class="section-content" id="combat-section" style="display: none;">
                    <!-- Fling Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 2L13.09 8.26L19 9.27L14.14 14.14L15.18 21.02L12 17.77L8.82 21.02L9.86 14.14L5 9.27L10.91 8.26L12 2Z" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Fling</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Fling</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Power</span>
                                <span>75</span>
                            </div>
                            <input type="range" class="slider" min="10" max="100" value="75">
                        </div>
                    </div>

                    <!-- Aimbot Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/>
                                    <circle cx="12" cy="12" r="6" stroke="white" stroke-width="2"/>
                                    <circle cx="12" cy="12" r="2" fill="white"/>
                                    <path d="M12 2V6M12 18V22M2 12H6M18 12H22" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Aimbot</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Aimbot</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Auto Fire</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Smoothness</span>
                                <span>50</span>
                            </div>
                            <input type="range" class="slider" min="1" max="100" value="50">
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>FOV</span>
                                <span>90</span>
                            </div>
                            <input type="range" class="slider" min="30" max="180" value="90">
                        </div>
                    </div>
                </div>

                <!-- Following Section -->
                <div class="section-content" id="following-section" style="display: none;">
                    <!-- Following Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2ZM21 16V14C18.76 14 16.84 13.04 15.6 11.5L14.32 9.84C14.1 9.56 13.82 9.33 13.5 9.18C13.13 9 12.74 8.91 12.33 8.91H11.67C11.26 8.91 10.87 9 10.5 9.18C10.18 9.33 9.9 9.56 9.68 9.84L8.4 11.5C7.16 13.04 5.24 14 3 14V16C5.76 16 8.3 14.7 10 12.7V16L6.5 20.5L8 22L12 18L16 22L17.5 20.5L14 16V12.7C15.7 14.7 18.24 16 21 16Z" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">Following Player</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable Following</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Target Player</span>
                            </div>
                            <select style="width: 100%; padding: 10px; background: rgba(0, 0, 0, 0.7); border: 1px solid rgba(255, 255, 255, 0.3); border-radius: 6px; color: #ffffff; font-size: 14px; font-weight: 500; cursor: pointer;">
                                <option>Player 1</option>
                                <option>Player 2</option>
                                <option>Player 3</option>
                            </select>
                        </div>
                        <div class="slider-container">
                            <div class="slider-label">
                                <span>Distance</span>
                                <span>5</span>
                            </div>
                            <input type="range" class="slider" min="0" max="10" value="5">
                        </div>
                    </div>
                </div>

                <!-- Visuals Section -->
                <div class="section-content" id="visuals-section" style="display: none;">
                    <!-- ESP Feature -->
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 4.5C7 4.5 2.73 7.61 1 12C2.73 16.39 7 19.5 12 19.5C17 19.5 21.27 16.39 23 12C21.27 7.61 17 4.5 12 4.5ZM12 17C9.24 17 7 14.76 7 12C7 9.24 9.24 7 12 7C14.76 7 17 9.24 17 12C17 14.76 14.76 17 12 17ZM12 9C10.34 9 9 10.34 9 12C9 13.66 10.34 15 12 15C13.66 15 15 13.66 15 12C15 10.34 13.66 9 12 9Z" stroke="white" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="feature-title">ESP</div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Enable ESP</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Show Names</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                        <div class="toggle-container">
                            <span class="toggle-label">Show Distance</span>
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </div>

    <script>
        // Section navigation
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', function() {
                const section = this.getAttribute('data-section');
                
                // Remove active class from all nav items
                document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
                this.classList.add('active');
                
                // Hide all sections
                document.querySelectorAll('.section-content').forEach(sec => sec.style.display = 'none');
                
                // Show selected section with grid layout
                const targetSection = document.getElementById(section + '-section');
                if (targetSection) {
                    targetSection.style.display = 'grid';
                }
            });
        });

        // Target selection functionality
        let currentTarget = null;
        let currentAntiTarget = null;

        // Add click handlers for player items
        document.querySelectorAll('.player-item').forEach(item => {
            item.addEventListener('click', function() {
                const playerName = this.getAttribute('data-player');
                currentTarget = playerName;
                document.getElementById('current-target').textContent = playerName;
                
                // Hide all check marks
                document.querySelectorAll('.target-check').forEach(check => {
                    check.style.display = 'none';
                });
                
                // Show check mark for selected player
                this.querySelector('.target-check').style.display = 'block';
                
                // Highlight selected player with better colors
                document.querySelectorAll('.player-item').forEach(player => {
                    player.style.background = 'rgba(30, 30, 30, 0.8)';
                    player.style.borderColor = 'rgba(255, 255, 255, 0.1)';
                });
                this.style.background = 'rgba(50,205,50, 0.3)';
                this.style.borderColor = 'rgba(50, 205, 50, 0.5)';
                
                // Add hover effect
                this.style.transform = 'scale(1.02)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 150);
            });
            
            // Add hover effects
            item.addEventListener('mouseenter', function() {
                if (!this.querySelector('.target-check').style.display || this.querySelector('.target-check').style.display === 'none') {
                    this.style.background = 'rgba(65, 105, 225, 0.3)';
                    this.style.borderColor = 'rgba(65, 105, 225, 0.4)';
                }
            });
            
            item.addEventListener('mouseleave', function() {
                if (!this.querySelector('.target-check').style.display || this.querySelector('.target-check').style.display === 'none') {
                    this.style.background = 'rgba(30, 30, 30, 0.8)';
                    this.style.borderColor = 'rgba(255, 255, 255, 0.1)';
                }
            });
        });

        // Add click handlers for anti-target toggle
        document.querySelectorAll('.feature-card').forEach(card => {
            if (card.querySelector('.feature-title')?.textContent === 'Anti-Target') {
                const toggle = card.querySelector('.toggle-switch');
                
                toggle.addEventListener('click', function() {
                    if (this.classList.contains('active')) {
                        currentAntiTarget = 'Active';
                        document.getElementById('current-anti-target').textContent = 'Active';
                    } else {
                        currentAntiTarget = null;
                        document.getElementById('current-anti-target').textContent = 'None';
                    }
                });
            }
        });

        // Add smooth animations for slider value updates
        document.querySelectorAll('.slider').forEach(slider => {
            // Create wrapper for slider with fill line
            const wrapper = document.createElement('div');
            wrapper.className = 'slider-wrapper';
            
            // Create fill line element
            const fillLine = document.createElement('div');
            fillLine.className = 'slider-fill';
            
            // Insert wrapper before slider and move slider inside
            slider.parentNode.insertBefore(wrapper, slider);
            wrapper.appendChild(fillLine);
            wrapper.appendChild(slider);
            
            // Update fill line based on value
            function updateFillLine() {
                const min = parseFloat(slider.min) || 0;
                const max = parseFloat(slider.max) || 100;
                const value = parseFloat(slider.value) || 0;
                const percentage = ((value - min) / (max - min)) * 100;
                fillLine.style.width = percentage + '%';
            }
            
            // Initialize fill line
            updateFillLine();
            
            // Update on input with requestAnimationFrame for smooth rendering
            slider.addEventListener('input', function() {
                requestAnimationFrame(() => {
                    updateFillLine();
                });
                
                const valueDisplay = this.parentElement.parentElement.querySelector('.slider-label span:last-child');
                let value = this.value;
                
                // Format value based on slider type
                if (this.step === '0.1') {
                    value = parseFloat(value).toFixed(1) + 'x';
                } else if (this.max === '100' && this.min === '1') {
                    value = value;
                } else if (this.max === '500') {
                    value = value;
                } else if (this.max === '180') {
                    value = value + '°';
                } else {
                    value = value;
                }
                
                valueDisplay.textContent = value;
            });

            // Also update on change for final position
            slider.addEventListener('change', function() {
                requestAnimationFrame(() => {
                    updateFillLine();
                });
            });
        });

        // Add click animation to feature cards
        document.querySelectorAll('.feature-card').forEach(card => {
            card.addEventListener('click', function(e) {
                if (!e.target.closest('.toggle-switch') && !e.target.closest('.slider') && !e.target.closest('.button') && !e.target.closest('select')) {
                    this.style.transform = 'scale(0.98)';
                    setTimeout(() => {
                        this.style.transform = '';
                    }, 100);
                }
            });
        });

        // Add button click animations
        document.querySelectorAll('.button').forEach(button => {
            button.addEventListener('click', function() {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
            });
        });

        // Roblox Script Execution System
        class RobloxScriptExecutor {
            constructor() {
                this.enabledFeatures = {};
                this.featureValues = {};
                this.init();
            }

            init() {
                // Initialize feature states
                this.setupFeatureListeners();
                this.setupSliderListeners();
                this.setupButtonListeners();
            }

            setupFeatureListeners() {
                // Dashboard features
                this.setupFeatureToggle('Fly', 'fly');
                this.setupFeatureToggle('Speed', 'speed');
                this.setupFeatureToggle('Jump Power', 'jumpPower');
                this.setupFeatureToggle('Noclip', 'noclip');

                // Target features
                this.setupFeatureToggle('Anti-Target', 'antiTarget');

                // Combat features
                this.setupFeatureToggle('Fling', 'fling');
                this.setupFeatureToggle('Aimbot', 'aimbot');

                // Visuals features
                this.setupFeatureToggle('ESP', 'esp');

                // Following features
                this.setupFeatureToggle('Following Player', 'following');
            }

            setupFeatureToggle(featureName, scriptKey) {
                document.querySelectorAll('.feature-card').forEach(card => {
                    const title = card.querySelector('.feature-title');
                    if (title && title.textContent === featureName) {
                        const toggle = card.querySelector('.toggle-switch');
                        if (toggle) {
                            toggle.addEventListener('click', () => {
                                const isActive = toggle.classList.contains('active');
                                this.toggleFeature(scriptKey, !isActive);
                                toggle.classList.toggle('active');
                            });
                        }
                    }
                });
            }

            setupSliderListeners() {
                document.querySelectorAll('.slider').forEach(slider => {
                    slider.addEventListener('input', () => {
                        const card = slider.closest('.feature-card');
                        const title = card.querySelector('.feature-title');
                        const value = slider.value;
                        
                        if (title) {
                            this.updateFeatureValue(title.textContent, value);
                        }
                    });
                });
            }

            setupButtonListeners() {
                document.querySelectorAll('.button').forEach(button => {
                    button.addEventListener('click', () => {
                        const card = button.closest('.feature-card');
                        const title = card.querySelector('.feature-title');
                        const buttonText = button.textContent;
                        
                        if (title) {
                            this.executeButtonAction(title.textContent, buttonText);
                        }
                    });
                });
            }

            toggleFeature(featureKey, enabled) {
                this.enabledFeatures[featureKey] = enabled;
                
                switch(featureKey) {
                    case 'fly':
                        this.executeFlyScript(enabled);
                        break;
                    case 'speed':
                        this.executeSpeedScript(enabled);
                        break;
                    case 'jumpPower':
                        this.executeJumpPowerScript(enabled);
                        break;
                    case 'noclip':
                        this.executeNoclipScript(enabled);
                        break;
                    case 'antiTarget':
                        this.executeAntiTargetScript(enabled);
                        break;
                    case 'fling':
                        this.executeFlingScript(enabled);
                        break;
                    case 'aimbot':
                        this.executeAimbotScript(enabled);
                        break;
                    case 'esp':
                        this.executeESPScript(enabled);
                        break;
                    case 'following':
                        this.executeFollowingScript(enabled);
                        break;
                }
            }

            updateFeatureValue(featureName, value) {
                this.featureValues[featureName] = value;
                
                switch(featureName) {
                    case 'Fly':
                        this.updateFlySpeed(value);
                        break;
                    case 'Speed':
                        this.updateSpeedMultiplier(value);
                        break;
                    case 'Jump Power':
                        this.updateJumpPower(value);
                        break;
                    case 'Noclip':
                        this.updateNoclipSpeed(value);
                        break;
                    case 'Fling':
                        this.updateFlingPower(value);
                        break;
                    case 'Aimbot':
                        this.updateAimbotSettings(value);
                        break;
                    case 'Following Player':
                        this.updateFollowingDistance(value);
                        break;
                }
            }

            executeButtonAction(featureName, action) {
                switch(featureName) {
                    case 'Teleport to Player':
                        this.teleportToPlayer();
                        break;
                    case 'Teleport Player to Me':
                        this.teleportPlayerToMe();
                        break;
                    case 'Teleport':
                        this.teleportToPlayer();
                        break;
                    case 'Teleport to Me':
                        this.teleportPlayerToMe();
                        break;
                }
            }

            // Lua Script Execution Methods
            executeScript(script) {
                // In a real implementation, this would execute the script in Roblox
                console.log('Executing Lua Script:', script);
                
                // For demonstration, we'll just log the script
                // In reality, this would use Roblox's scripting API
                try {
                    // This would be replaced with actual Roblox script execution
                    if (window.RobloxExecutor) {
                        window.RobloxExecutor.execute(script);
                    } else {
                        console.warn('Roblox executor not available');
                    }
                } catch (error) {
                    console.error('Script execution failed:', error);
                }
            }

            executeFlyScript(enabled) {
                const script = enabled ? `
-- Fly Script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local flySpeed = 50
local flying = false
local flyPart

local function createFlyPart()
    if flyPart then flyPart:Destroy() end
    flyPart = Instance.new("Part")
    flyPart.Name = "FlyPart"
    flyPart.Anchored = true
    flyPart.CanCollide = false
    flyPart.Transparency = 1
    flyPart.Size = Vector3.new(2, 1, 1)
    flyPart.Parent = workspace
end

local function startFly()
    flying = true
    createFlyPart()
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not flying then
            connection:Disconnect()
            return
        end
        
        local moveVector = Vector3.new(0, 0, 0)
        
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            moveVector = moveVector + rootPart.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
            moveVector = moveVector - rootPart.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
            moveVector = moveVector - rootPart.CFrame.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
            moveVector = moveVector + rootPart.CFrame.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
            moveVector = moveVector + Vector3.new(0, 1, 0)
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
            moveVector = moveVector - Vector3.new(0, 1, 0)
        end
        
        if moveVector.Magnitude > 0 then
            moveVector = moveVector.Unit * flySpeed
            rootPart.CFrame = rootPart.CFrame + moveVector * game:GetService("RunService").Heartbeat:Wait()
        end
        
        flyPart.Position = rootPart.Position
    end)
end

local function stopFly()
    flying = false
    if flyPart then
        flyPart:Destroy()
        flyPart = nil
    end
end

startFly()
                ` : `
-- Stop Flying
local rootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
    local flyPart = workspace:FindFirstChild("FlyPart")
    if flyPart then
        flyPart:Destroy()
    end
end
                `;
                
                this.executeScript(script);
            }

            executeSpeedScript(enabled) {
                const script = enabled ? `
-- Speed Script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.WalkSpeed = 32 -- 2x normal speed
                ` : `
-- Reset Speed
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.WalkSpeed = 16 -- Normal speed
                `;
                
                this.executeScript(script);
            }

            executeJumpPowerScript(enabled) {
                const script = enabled ? `
-- Jump Power Script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = 100
                ` : `
-- Reset Jump Power
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = 50
                `;
                
                this.executeScript(script);
            }

            executeNoclipScript(enabled) {
                const script = enabled ? `
-- Noclip Script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local connection
connection = game:GetService("RunService").Stepped:Connect(function()
    if character and character:FindFirstChild("HumanoidRootPart") then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
end)
                ` : `
-- Disable Noclip
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

for _, part in pairs(character:GetDescendants()) do
    if part:IsA("BasePart") and not part.CanCollide then
        part.CanCollide = true
    end
end
                `;
                
                this.executeScript(script);
            }

            executeESPScript(enabled) {
                const script = enabled ? `
-- ESP Script
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local workspace = game:GetService("Workspace")

local function createESP(player)
    local character = player.Character
    if not character then return end
    
    -- Remove existing ESP
    for _, part in pairs(character:GetDescendants()) do
        if part.Name == "ESPBox" then
            part:Destroy()
        end
    end
    
    -- Create ESP box
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local espBox = Instance.new("BoxHandleAdornment")
        espBox.Name = "ESPBox"
        espBox.Adornee = humanoidRootPart
        espBox.Size = Vector3.new(4, 6, 2)
        espBox.Color3 = player.TeamColor.Color
        espBox.Transparency = 0.7
        espBox.AlwaysOnTop = true
        espBox.ZIndex = 10
        espBox.Parent = humanoidRootPart
        
        -- Create name tag
        local nameTag = Instance.new("BillboardGui")
        nameTag.Name = "ESPName"
        nameTag.Adornee = humanoidRootPart
        nameTag.Size = UDim2.new(0, 100, 0, 50)
        nameTag.StudsOffset = Vector3.new(0, 3, 0)
        nameTag.Parent = humanoidRootPart
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.new(1, 1, 1)
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextScaled = true
        nameLabel.Parent = nameTag
    end
end

-- Create ESP for all players
for _, player in pairs(players:GetPlayers()) do
    if player ~= localPlayer then
        createESP(player)
    end
end

-- Create ESP for new players
players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

-- Update ESP when characters respawn
players.PlayerRemoving:Connect(function(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part.Name == "ESPBox" or part.Name == "ESPName" then
                part:Destroy()
            end
        end
    end
end)
                ` : `
-- Remove ESP
local players = game:GetService("Players")

for _, player in pairs(players:GetPlayers()) do
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part.Name == "ESPBox" or part.Name == "ESPName" then
                part:Destroy()
            end
        end
    end
end
                `;
                
                this.executeScript(script);
            }

            updateFlySpeed(value) {
                const script = `
-- Update Fly Speed
local flySpeed = ${value}
-- Update the fly speed variable in the fly script
                `;
                this.executeScript(script);
            }

            updateSpeedMultiplier(value) {
                const script = `
-- Update Speed Multiplier
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.WalkSpeed = ${value * 16}
                `;
                this.executeScript(script);
            }

            updateJumpPower(value) {
                const script = `
-- Update Jump Power
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = ${value}
                `;
                this.executeScript(script);
            }

            teleportToPlayer() {
                const script = `
-- Teleport to Player
local player = game.Players.LocalPlayer
local character = player.Character
if not character then return end

local targetPlayer = game.Players:FindFirstChild("Player1") -- Replace with actual target
if targetPlayer and targetPlayer.Character then
    character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
end
                `;
                this.executeScript(script);
            }

            teleportPlayerToMe() {
                const script = `
-- Teleport Player to Me
local player = game.Players.LocalPlayer
local character = player.Character
if not character then return end

local targetPlayer = game.Players:FindFirstChild("Player1") -- Replace with actual target
if targetPlayer and targetPlayer.Character then
    targetPlayer.Character:MoveTo(character.HumanoidRootPart.Position)
end
                `;
                this.executeScript(script);
            }
        }

        // Roblox Lua Script Executor
        console.log('Roblox GUI loaded successfully!');
        
        // Lua Scripts for Roblox
        const luaScripts = {
            fly: `
-- Fly Script for Roblox
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local flySpeed = 50
local flying = false
local flyPart

local function createFlyPart()
    if flyPart then flyPart:Destroy() end
    flyPart = Instance.new("Part")
    flyPart.Name = "FlyPart"
    flyPart.Anchored = true
    flyPart.CanCollide = false
    flyPart.Transparency = 1
    flyPart.Size = Vector3.new(2, 1, 1)
    flyPart.Parent = workspace
end

local function startFly()
    flying = true
    createFlyPart()
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not flying then
            connection:Disconnect()
            return
        end
        
        local moveVector = Vector3.new(0, 0, 0)
        
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            moveVector = moveVector + rootPart.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
            moveVector = moveVector - rootPart.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
            moveVector = moveVector - rootPart.CFrame.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
            moveVector = moveVector + rootPart.CFrame.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
            moveVector = moveVector + Vector3.new(0, 1, 0)
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
            moveVector = moveVector - Vector3.new(0, 1, 0)
        end
        
        if moveVector.Magnitude > 0 then
            moveVector = moveVector.Unit * flySpeed
            rootPart.CFrame = rootPart.CFrame + moveVector * game:GetService("RunService").Heartbeat:Wait()
        end
        
        flyPart.Position = rootPart.Position
    end)
end

startFly()
            `,
            speed: `
-- Speed Script for Roblox
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
humanoid.WalkSpeed = 32 -- 2x normal speed
            `,
            jumpPower: `
-- Jump Power Script for Roblox
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
humanoid.JumpPower = 100
            `,
            noclip: `
-- Noclip Script for Roblox
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local connection
connection = game:GetService("RunService").Stepped:Connect(function()
    if character and character:FindFirstChild("HumanoidRootPart") then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)
            `,
            esp: `
-- ESP Script for Roblox
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local function createESP(player)
    local character = player.Character
    if not character then return end
    
    -- Remove existing ESP
    for _, part in pairs(character:GetDescendants()) do
        if part.Name == "ESPBox" then
            part:Destroy()
        end
    end
    
    -- Create ESP box
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local espBox = Instance.new("BoxHandleAdornment")
        espBox.Name = "ESPBox"
        espBox.Adornee = humanoidRootPart
        espBox.Size = Vector3.new(4, 6, 2)
        espBox.Color3 = player.TeamColor.Color
        espBox.Transparency = 0.7
        espBox.AlwaysOnTop = true
        espBox.ZIndex = 10
        espBox.Parent = humanoidRootPart
        
        -- Create name tag
        local nameTag = Instance.new("BillboardGui")
        nameTag.Name = "ESPName"
        nameTag.Adornee = humanoidRootPart
        nameTag.Size = UDim2.new(0, 100, 0, 50)
        nameTag.StudsOffset = Vector3.new(0, 3, 0)
        nameTag.Parent = humanoidRootPart
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.new(1, 1, 1)
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextScaled = true
        nameLabel.Parent = nameTag
    end
end

-- Create ESP for all players
for _, player in pairs(players:GetPlayers()) do
    if player ~= localPlayer then
        createESP(player)
    end
end
            `
        };

        // Execute Lua script function
        function executeLuaScript(scriptName, enabled) {
            const script = luaScripts[scriptName];
            if (script) {
                console.log(`Executing ${scriptName} script:`, enabled);
                console.log('Lua Script:', script);
                
                // In a real Roblox environment, this would execute the script
                // For now, we just log it to console
                if (window.RobloxExecutor) {
                    window.RobloxExecutor.execute(script);
                } else {
                    console.log('Script ready for Roblox execution');
                }
            }
        }

        // Setup toggle functionality with Lua scripts
        document.querySelectorAll('.feature-card').forEach(card => {
            const title = card.querySelector('.feature-title');
            const toggle = card.querySelector('.toggle-switch');
            
            if (title && toggle) {
                toggle.addEventListener('click', function() {
                    this.classList.toggle('active');
                    const isActive = this.classList.contains('active');
                    console.log(`${title.textContent} ${isActive ? 'enabled' : 'disabled'}`);
                    
                    // Execute corresponding Lua script
                    switch(title.textContent) {
                        case 'Fly':
                            executeLuaScript('fly', isActive);
                            break;
                        case 'Speed':
                            executeLuaScript('speed', isActive);
                            break;
                        case 'Jump Power':
                            executeLuaScript('jumpPower', isActive);
                            break;
                        case 'Noclip':
                            executeLuaScript('noclip', isActive);
                            break;
                        case 'ESP':
                            executeLuaScript('esp', isActive);
                            break;
                    }
                });
            }
        });
    </script>
</body>
</html>
