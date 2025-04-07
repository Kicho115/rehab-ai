import Foundation

class ConfigViewModel {
    private var config: Config {
        didSet {
            // Guardar datos en UserDefaults cada vez que cambien
            UserDefaults.standard.set(config.Theme, forKey: "appTheme")
            UserDefaults.standard.set(config.Notifications, forKey: "notificationsEnabled")
        }
    }

    // Variables para vincular con la vista
    var SelectedTheme: Int {
        switch config.Theme {
        case "Darh": return 0
        case "Light": return 1
        case "Automatic": return 2
        default: return 0
        }
    }

    var NotificationsEnabled: Bool {
        return config.Notifications
    }

    init() {
        // Cargar datos de UserDefaults
        let theme = UserDefaults.standard.string(forKey: "appTheme") ?? "Light"
        let notifications = UserDefaults.standard.bool(forKey: "notificationsEnabled")
        self.config = Config(Theme: theme, Notifications: notifications)
    }

    func UpdateTheme(index: Int) {
        switch index {
        case 0: config.Theme = "Dark"
        case 1: config.Theme = "Light"
        case 2: config.Theme = "Automatic"
        default: break
        }
    }

    func UpdateNotifications(estado: Bool) {
        config.Notifications = estado
    }
}
