import UIKit

class ConfigViewController: UIViewController {
    var viewModel: ConfigViewModel!

    @IBOutlet weak var ThemeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var NotificationsSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigView()
    }

    private func ConfigView() {
        // Vincular los controles de la interfaz con el ViewModel
        ThemeSegmentedControl.selectedSegmentIndex = viewModel.SelectedTheme
        NotificationsSwitch.isOn = viewModel.NotificationsEnabled
    }

    @IBAction func ToggleTheme(_ sender: UISegmentedControl) {
        viewModel.UpdateTheme(index: sender.selectedSegmentIndex)
    }

    @IBAction func NotificationsEnabled(_ sender: UISwitch) {
        viewModel.UpdateNotifications(estado: sender.isOn)
    }
}
