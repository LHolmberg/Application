
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var equationTxt: UILabel!
    @IBOutlet weak var resultTxt: UILabel!
    @IBOutlet weak var actionPicker: UIPickerView!
    var action: String = "derive"
    var equation: String = ""
    var actions = ["derive", "integrate", "simplify", "factor", "zeroes", "tangent",
                   "area", "cos", "sin", "tan", "arccos", "arcsin", "arctan", "abs", "log"]
    
    @IBAction func Calculate(_ sender: Any) {
        let data = DataHandeler(action: self.action, equation: equation.trimmingCharacters(in: .whitespaces))
        
        data.FetchData() { (returnValue) in
            DispatchQueue.main.async {
                self.resultTxt.text = returnValue.result
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equationTxt.text = action + " "
        self.actionPicker.dataSource = self
        self.actionPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return actions.count
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: actions[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        action = actions[row]
        UpdateText(with: "")
    }
    
    private func UpdateText(with: String) {
        equation += with
        equationTxt.text = action + " " + equation;
    }
    
    @IBAction func BtnAddition(_ sender: Any) {
        UpdateText(with: String("+"))
    }
    @IBAction func BtnSubtraction(_ sender: Any) {
        UpdateText(with: String("-"))
    }
    @IBAction func BtnDivision(_ sender: Any) {
        UpdateText(with: String(":"))
    }
    @IBAction func BtnMultiplication(_ sender: Any) {
        UpdateText(with: String("*"))
    }
    @IBAction func Btn0(_ sender: Any) {
        UpdateText(with: String(0))
    }
    @IBAction func Btn1(_ sender: Any) {
        UpdateText(with: String(1))
    }
    @IBAction func Btn2(_ sender: Any) {
        UpdateText(with: String(2))
    }
    @IBAction func Btn3(_ sender: Any) {
        UpdateText(with: String(3))
    }
    @IBAction func Btn4(_ sender: Any) {
        UpdateText(with: String(4))
    }
    @IBAction func Btn5(_ sender: Any) {
        UpdateText(with: String(5))
    }
    @IBAction func Btn6(_ sender: Any) {
        UpdateText(with: String(6))
    }
    @IBAction func Btn7(_ sender: Any) {
        UpdateText(with: String(7))
    }
    @IBAction func Btn8(_ sender: Any) {
        UpdateText(with: String(8))
    }
    @IBAction func Btn9(_ sender: Any) {
        UpdateText(with: String(9))
    }
    @IBAction func BtnX(_ sender: Any) {
        UpdateText(with: "x")
    }
    @IBAction func BtnClear(_ sender: Any) {
        equation = ""
        UpdateText(with: " ")
    }
    @IBAction func BtnE(_ sender: Any) {
        UpdateText(with: "e")
    }
}

