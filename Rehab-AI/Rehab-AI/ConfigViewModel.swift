import Foundation

class ConfigViewModel {
    private var config: Config {
        didSet {
            // Guardar datos en UserDefaults cada vez que cambien
            UserDefaults.standard.set(Config.Theme, forKey: "appTheme")
            UserDefaults.standard.set(Config.Notifications, forKey: "notificationsEnabled")
        }
    }

    // Variables para vincular con la vista
    var SelectedTheme: Int {
        switch Config.Theme {
        case "Darh": return 0
        case "Light": return 1
        case "Automatic": return 2
        default: return 0
        }
    }

    var NotificationsEnabled: Bool {
        return Config.Notifications
    }

    init() {
        // Cargar datos de UserDefaults
        let theme = UserDefaults.standard.string(forKey: "appTheme") ?? "Light"
        let notifications = UserDefaults.standard.bool(forKey: "notificationsEnabled")
        self.configuracion = Config(Theme: theme, Notifications: notifications)
    }

    func UpdateTheme(index: Int) {
        switch index {
        case 0: Config.Theme = "Dark"
        case 1: Config.Theme = "Light"
        case 2: Config.Theme = "Automatic"
        default: break
        }
    }

    func UpdateNotifications(estado: Bool) {
        Config.Notifications = status
    }
}