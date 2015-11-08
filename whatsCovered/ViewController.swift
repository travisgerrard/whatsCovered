//
//  ViewController.swift
//  whatsCovered
//
//  Created by Travis Gerrard on 9/11/15.
//  Copyright © 2015 Travis Gerrard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var MRSABlockView = UIView()
    var MSSABlockView = UIView()
    var strepBlockView = UIView()
    var enteroBlockView = UIView()
    var GNRBlockView = UIView()
    var pseudomonasBlockView = UIView()
    var atypicalsBlockView = UIView()
    var anaerobesBlockView = UIView()
    
    var searchTextField = UITextField()
    var abxScrollView = UIScrollView()
    
    var abxs = [Abx]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.abxs = [
        Abx(name:"Trim/Sulfa (Bactrim)", additionalInfo:"1st line SSTI & UTI, PCP prophy", poIV:"15-20mg/kg/day IV or 800/160 PO", coverageFull:["MSSA", "MRSA", "GNR"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Vancomycin", additionalInfo:"1st line for suspected MRSA. Not bacteriacidal. Switch to Naf if MSSA +ve. Trough 15-20 complx, 10-15. Chck after 4th dose", poIV:"15mg/kg IV Q12", coverageFull:["MSSA", "MRSA"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Amoxicillin", additionalInfo:"1st line: PCN susceptible S. Pneumoniae PNA. Group A Strep Pharyngitis", poIV:"250-500mg PO Q8hrs", coverageFull:["Strep", "Entero"], coveragePartial:["Anaerobes"], clearance:"Renal"),
        Abx(name:"Ampicillin", additionalInfo:"1st line: Listeria, susceptible Enterococus", poIV:"1-2g IV q4-6hrs", coverageFull:["Strep", "Entero"], coveragePartial:["Anaerobes"], clearance:"Renal"),
        Abx(name:"Ampicillin/Sulbactam", additionalInfo:"1st line: Uncomplicated community acquired abd infections. Same spectrum as PO amox/clav (augmentin)", poIV:"1.5-3g IV Q6h", coverageFull:["Strep", "Entero", "Anaerobes"], coveragePartial:["MSSA", "GNR"], clearance:"Renal"),
        Abx(name:"Azithro", additionalInfo:"1st line: CAP, Chlamydia", poIV:"500mg load -> 250mg Q24h x 4 days PO/IV", coverageFull:["Strep", "Atypical"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Aztreonam", additionalInfo:"Great GNR coverage. Consider if true PCN allergy", poIV:"1-2g IV load; 1-2g IV Q6-8h", coverageFull:["GNR"], coveragePartial:["pAeurg"], clearance:"Renal"),
        Abx(name:"Cefazolin (Ancef)", additionalInfo:"No ESBL coverage", poIV:"1-2g IV Q6-8h", coverageFull:["MSSA", "Strep"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Cefepime", additionalInfo:"1st line: suspected or confirmed p. aerug infxn. neutropenic fever", poIV:"1-2g IV Q8-12h", coverageFull:["MSSA", "Strep", "GNR", "pAeurg"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Ceftazidime", additionalInfo:"1st line: Neutropenic fever, suspected p. aerug infxn. Weak strep pneumo, viridians", poIV:"2g IV Q8h", coverageFull:["GNR", "pAeurg"], coveragePartial:["Strep"], clearance:"Renal"),
        Abx(name:"Ceftriaxone", additionalInfo:"1st line: Meningitis (2g), empiric CAP (1g)", poIV:"1-2g IV q12-24h", coverageFull:["Strep", "GNR"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Cefotaxime", additionalInfo:"1st line: Spontaneous Bacterial Peritonitis", poIV:"2g IV q8h", coverageFull:["GNR"], coveragePartial:["Strep"], clearance:"Renal"),
        Abx(name:"Cephalexin (Keflex)", additionalInfo:"Indication: streptococcal SSTI", poIV:"500mg PO Q6h", coverageFull:["MSSA", "Strep"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Ciprofloxacin", additionalInfo:"1st line: UTI (after Trim/Sulfa), do NOT use for CAP. Watch QTc", poIV:"200-400mg IV q12", coverageFull:["GNR", "pAeurg", "Atypical"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Clindamycin", additionalInfo:"Indic: Osteo, retropharyng abscess, anaerobic pulm infection, Babesiosis. #1 cause of C. Diff", poIV:"600-900mg IV Q8h", coverageFull:["MRSA", "Strep", "Anaerobes"], coveragePartial:["MSSA"], clearance:"Renal"),
        Abx(name:"Colistin", additionalInfo:"Inidc: Severe drug-resistent GNR. Severe tox: nephro, neuro", poIV:"2.5-5mg/kg/day", coverageFull:["Strep", "Atypical"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Daptomycin (Cubicin)", additionalInfo:"1st line: VRE bacteremia. Inactivated by lung surfactant. VRE -> 6mg", poIV:"4-6mg/kh/day IV", coverageFull:["MRSA", "MSSA", "Strep", "Entero"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Doxycycline", additionalInfo:"1st line: Rickettsia, Atypical PNA. Not in pregnancy, Age < 8", poIV:"100mg PO/IV Q12h", coverageFull:["MRSA", "Strep", "Atypical", "Anaerobes"], coveragePartial:["MSSA"], clearance:"Liver"),
        Abx(name:"Ertapenem", additionalInfo:"Indic: Uncomplicated diabetic foot infection", poIV:"1g IV/IM Qday", coverageFull:["Strep", "GNR", "Anaerobes"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Gentamicin", additionalInfo:"GNR Holes: Neisseria, Stenotrphomonas. Tox: Nephro, oto", poIV:"dosing vaires. Discuss w pharm", coverageFull:["GNR", "pAeurg"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Imipenem/Cilastatin", additionalInfo:"1st line: Necrotizing pancreatitis. Holes: Stenotroph, Legionella", poIV:"500mg IV Q6", coverageFull:["Strep", "Entero", "GNR", "pAeurg", "Anaerobes"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Levofloxacin", additionalInfo:"1st line: pyelo, CAP(consider moxi first). Watch QTc", poIV:"250-750mg IV/PO q24h", coverageFull:["Strep", "GNR", "pAeurg", "Atypical"], coveragePartial:["MSSA"], clearance:"Renal"),
        Abx(name:"Linezolid", additionalInfo:"Indic: MRSA, VRE. Watch for thrombocytopenia, seratonin syndrome", poIV:"600mg IV/PO Q12h", coverageFull:["MRSA", "MSSA"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Meropenem", additionalInfo:"Use only if resistant to imipenem. Low seizure threshhold. Add metronidazole", poIV:" 1-2g IV Q8h", coverageFull:["Strep", "GNR", "pAeurg", "Anaerobes"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Metronidazole", additionalInfo:"Indic: C. Diff, Trichomonas, Giardia, Entamoeba histolytica, below diaphragm (B. Fragilis)", poIV:"500mg PO/IV Q6-8h", coverageFull:["Strep", "Anaerobes"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Moxifloxacin", additionalInfo:"1st line: Preferred FQ fr CAP, not UTI, decent anaerobe. Watch QTc", poIV:"400mg PO/IV Qday", coverageFull:["Strep", "GNR", "pAeurg", "Atypical", "Anaerobes"], coveragePartial:["MSSA"], clearance:"Renal"),
        Abx(name:"Nafcillin", additionalInfo:"Indic: Severe MSSA infection (endocarditis)", poIV:"1-2g IV q4-6h", coverageFull:["MSSA", "Strep"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Nitrofurantoin", additionalInfo:"Indic: VRE cystits. Not for pyloeo, complicated UTI", poIV:"100mg PO Q12h", coverageFull:["GNR"], coveragePartial:[], clearance:"Renal"),
        Abx(name:"Penicillin G", additionalInfo:"1st Line: Neurosyphillis", poIV:"2-4 million Unites Q4-6h", coverageFull:["Strep"], coveragePartial:["Anaerobes"], clearance:"Renal"),
        Abx(name:"Pip/Taz", additionalInfo:"Empiric: Psedomona, HCAP, hosp abd infec. Inappropriate: Sepsis UKO w/ < 2 days in hospital, CAP, CA-UTI", poIV:"3.375-4.5g IV Q6h", coverageFull:["Strep", "Entero", "GNR", "pAeurg", "Anaerobes"], coveragePartial:[], clearance:"Renal")]
        
        // MRSA
        // MSSA
        // Strep
        // Entero
        // GNR
        // pAeurg
        // Atypical
        // Anaerobes

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        loadBacteriaBar()

        addSearchBox()
        
        loadAbxWithArray(self.abxs)
    }
    
    // Going to have to create a scrollview that contains the searchbox, and then abxscrollview will be subscrollview so it doesn't clear out...
    
    func loadAbxWithArray(abxArray: [Abx]) {
        
        let yIndent = CGFloat(100 + 33 + 10 + 40)
        let xIndent = CGFloat(25)
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        let scrollWidth = width - (xIndent * 2)
        let scrolHeight = height - yIndent - 10
        abxScrollView = UIScrollView(frame: CGRectMake(xIndent, yIndent + 5, scrollWidth, scrolHeight))
        abxScrollView.bounces = true
        view.addSubview(abxScrollView)
        abxScrollView.contentSize = CGSizeMake(scrollWidth, 50 * CGFloat(abxArray.count + 10))
        abxScrollView.showsVerticalScrollIndicator = false
        
        
        let buttonWidth = abxScrollView.frame.size.width
        let buttonHeight = CGFloat(50)
        

        for var i = 0; i < abxArray.count; i++ {
            loadAbx(abxArray[i], width: buttonWidth, viewHeight: buttonHeight, buttonNumber: CGFloat(i))
        }
        
    }
    
    func addSearchBox() {
        searchTextField = UITextField(frame: CGRect(x: 25, y: 143, width: self.view.frame.size.width - 50, height: 40));
        //myTextField.borderStyle = UITextBorderStyle.Line
        searchTextField.clearButtonMode = UITextFieldViewMode.Always
        searchTextField.autocorrectionType = UITextAutocorrectionType.No
        searchTextField.placeholder = "Search"
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.view.addSubview(searchTextField)
    }

    func textFieldShouldClear(textField: UITextField) -> Bool {
        delay(0.1) {
            self.view.endEditing(true)
        }
        return true
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func textFieldDidChange(textField: UITextField) {
        let searchBarString = textField.text!.lowercaseString

        if searchBarString == "" {
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        } else {
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSearchedAbxCoverage(searchBarString.lowercaseString))
        }
    }
    
    // Good Function that look through abx array sees if it finds any matches for text...
    func returnSearchedAbxCoverage(searchString: String) -> [Abx]{
        
        var abxArrayToReturn = [Abx]()
        
        for abx in self.abxs {
            if abx.additionalInfo.lowercaseString.rangeOfString(searchString) != nil {
                abxArrayToReturn.append(abx)
            } else if abx.name.lowercaseString.rangeOfString(searchString) != nil {
                abxArrayToReturn.append(abx)
            }
        }
        
        return abxArrayToReturn
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func loadAbx(abx: Abx, width: CGFloat, viewHeight: CGFloat, buttonNumber: CGFloat) {
        
        let yIndent = (viewHeight * buttonNumber) + (5 * buttonNumber)
        
        let abxView = UIView(frame: CGRectMake(0, yIndent, width, viewHeight))
        addButtonToScrollView(abxView)
        
       
        addLableToButton(abxView, textForLabel: abx.name)
        addSubLabelToButton(abxView, textForLabel: abx.additionalInfo)
        addpoIVLabelToButton(abxView, textForLabel: abx.poIV)
        
        var i = 0
        
        
        for i = 0; i < abx.coverageFull.count; i++ {
            switch abx.coverageFull[i] {
                case "MRSA":
                    abxView.addSubview(modifyViewForLine(MRSABlockView.frame, coverage: true))
                case "MSSA":
                    abxView.addSubview(modifyViewForLine(MSSABlockView.frame, coverage: true))
                case "Strep":
                    abxView.addSubview(modifyViewForLine(strepBlockView.frame, coverage: true))
                case "Entero":
                    abxView.addSubview(modifyViewForLine(enteroBlockView.frame, coverage: true))
                case "GNR":
                    abxView.addSubview(modifyViewForLine(GNRBlockView.frame, coverage: true))
                case "pAeurg":
                    abxView.addSubview(modifyViewForLine(pseudomonasBlockView.frame, coverage: true))
                case "Atypical":
                    abxView.addSubview(modifyViewForLine(atypicalsBlockView.frame, coverage: true))
                case "Anaerobes":
                    abxView.addSubview(modifyViewForLine(anaerobesBlockView.frame, coverage: true))
                default:
                    print("the default")
            }
            
        }
        
        for i = 0; i < abx.coveragePartial.count; i++ {
            switch abx.coveragePartial[i] {
            case "MRSA":
                abxView.addSubview(modifyViewForLine(MRSABlockView.frame, coverage: false))
            case "MSSA":
                abxView.addSubview(modifyViewForLine(MSSABlockView.frame, coverage: false))
            case "Strep":
                abxView.addSubview(modifyViewForLine(strepBlockView.frame, coverage: false))
            case "Entero":
                abxView.addSubview(modifyViewForLine(enteroBlockView.frame, coverage: false))
            case "GNR":
                abxView.addSubview(modifyViewForLine(GNRBlockView.frame, coverage: false))
            case "pAeurg":
                abxView.addSubview(modifyViewForLine(pseudomonasBlockView.frame, coverage: false))
            case "Atypical":
                abxView.addSubview(modifyViewForLine(atypicalsBlockView.frame, coverage: false))
            case "Anaerobes":
                abxView.addSubview(modifyViewForLine(anaerobesBlockView.frame, coverage: false))
            default:
                print("the default")
            }
            
        }
        
    }
    
    
    func loadBacteriaBar() {
        let width = self.view.frame.size.width
        let height = CGFloat(33)
        
        let xIndent = CGFloat(25)
        let yIndent = CGFloat(100)
        
        let lineWidth = width - (xIndent * 2)
        let blockWidth = lineWidth/8
        
        let yLabelIndent = height + 5
        let labelWidth = yIndent - 15
        
        let rotationAmount = CGFloat(-M_PI_2 + 0.1)
        
                        //  0     1        2        3         4           5            6            7          8
        let frameInfo = [width, height, xIndent, yIndent, lineWidth, blockWidth, yLabelIndent, labelWidth, rotationAmount]
        
        
        var i = CGFloat(0)
        var blockStart = xIndent + (blockWidth * i)
        var labelStart = blockStart - (frameInfo[5]/2)

        // MRSA Block
        MRSABlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        MSSABlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        strepBlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        enteroBlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        GNRBlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        pseudomonasBlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        atypicalsBlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
        i++
        blockStart = xIndent + (blockWidth * i)
        labelStart = blockStart - (blockWidth/2)
        anaerobesBlock(frameInfo, i: i, blockStart: blockStart, labelStart: labelStart)
    }
    
    func MRSABlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        MRSABlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        MRSABlockView.backgroundColor = UIColor.clearColor()
        MRSABlockView.layer.borderWidth = 1
        MRSABlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        MRSABlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("MRSATapped"))
        MRSABlockView.addGestureRecognizer(tapGestureRecognizer)
    
        view.addSubview(MRSABlockView)
        
        let MRSAlabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        MRSAlabel.text = "MRSA"
        view.addSubview(MRSAlabel)
        MRSAlabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func MRSATapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]

        if MRSABlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == MRSABlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("MRSA"))
        } else {
            MRSABlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    func MSSABlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        MSSABlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        MSSABlockView.backgroundColor = UIColor.clearColor()
        MSSABlockView.layer.borderWidth = 1
        MSSABlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        MSSABlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("MSSATapped"))
        MSSABlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(MSSABlockView)
        
        let MSSAlabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        MSSAlabel.text = "MSSA"
        view.addSubview(MSSAlabel)
        MSSAlabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func MSSATapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if MSSABlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == MSSABlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            searchTextField.text = ""
            self.view.endEditing(true)
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("MSSA"))
            
        } else {
            MSSABlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    func strepBlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        strepBlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        strepBlockView.backgroundColor = UIColor.clearColor()
        strepBlockView.layer.borderWidth = 1
        strepBlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        strepBlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("strepTapped"))
        strepBlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(strepBlockView)
        
        let streplabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        streplabel.text = "Strep"
        view.addSubview(streplabel)
        streplabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func strepTapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if strepBlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == strepBlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("Strep"))
        } else {
            strepBlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    func enteroBlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        enteroBlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        enteroBlockView.backgroundColor = UIColor.clearColor()
        enteroBlockView.layer.borderWidth = 1
        enteroBlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        enteroBlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("enteroTapped"))
        enteroBlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(enteroBlockView)
        
        let enterolabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        enterolabel.text = "Entero"
        view.addSubview(enterolabel)
        enterolabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func enteroTapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if enteroBlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == enteroBlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("Entero"))
        } else {
            enteroBlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    func GNRBlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        GNRBlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        GNRBlockView.backgroundColor = UIColor.clearColor()
        GNRBlockView.layer.borderWidth = 1
        GNRBlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        GNRBlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("GNRTapped"))
        GNRBlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(GNRBlockView)
        
        let GNRlabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        GNRlabel.text = "GNR"
        view.addSubview(GNRlabel)
        GNRlabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func GNRTapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if GNRBlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == GNRBlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("GNR"))
        } else {
            GNRBlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    
    func pseudomonasBlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        pseudomonasBlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        pseudomonasBlockView.backgroundColor = UIColor.clearColor()
        pseudomonasBlockView.layer.borderWidth = 1
        pseudomonasBlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        pseudomonasBlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("pseudomonasTapped"))
        pseudomonasBlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(pseudomonasBlockView)
        
        let pseudomonaslabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        pseudomonaslabel.text = "P. aeurg"
        view.addSubview(pseudomonaslabel)
        pseudomonaslabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func pseudomonasTapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if pseudomonasBlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == pseudomonasBlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("pAeurg"))
        } else {
            pseudomonasBlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }

    
    func atypicalsBlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        atypicalsBlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        atypicalsBlockView.backgroundColor = UIColor.clearColor()
        atypicalsBlockView.layer.borderWidth = 1
        atypicalsBlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        atypicalsBlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("atypicalsTapped"))
        atypicalsBlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(atypicalsBlockView)
        
        let atypicalslabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        atypicalslabel.text = "Atypicals"
        view.addSubview(atypicalslabel)
        atypicalslabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func atypicalsTapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if atypicalsBlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == atypicalsBlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("Atypical"))
        } else {
            atypicalsBlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    func anaerobesBlock(frameInfo: [CGFloat], i: CGFloat, blockStart: CGFloat, labelStart: CGFloat) {
        anaerobesBlockView = UIView(frame: CGRectMake(blockStart, frameInfo[3], frameInfo[5], frameInfo[1]))
        anaerobesBlockView.backgroundColor = UIColor.clearColor()
        anaerobesBlockView.layer.borderWidth = 1
        anaerobesBlockView.layer.borderColor = UIColor.blackColor().CGColor
        
        anaerobesBlockView.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("anaerobesTapped"))
        anaerobesBlockView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(anaerobesBlockView)
        
        let anaerobeslabel = UILabel(frame: CGRectMake(labelStart, frameInfo[6], frameInfo[7], frameInfo[1]))
        anaerobeslabel.text = "Anaerobes"
        view.addSubview(anaerobeslabel)
        anaerobeslabel.transform = CGAffineTransformMakeRotation(frameInfo[8])
    }
    
    func anaerobesTapped()
    {
        let blockViewArray = [MRSABlockView, MSSABlockView, strepBlockView, enteroBlockView, GNRBlockView, pseudomonasBlockView, atypicalsBlockView, anaerobesBlockView]
        
        if anaerobesBlockView.backgroundColor != UIColor.blackColor() {
            
            // Make it the only block that has black background
            for view in blockViewArray {
                if view == anaerobesBlockView {
                    view.backgroundColor = UIColor.blackColor()
                } else {
                    view.backgroundColor = UIColor.clearColor()
                }
            }
            
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(returnSpecificAbxCoverage("Anaerobes"))
        } else {
            anaerobesBlockView.backgroundColor = UIColor.clearColor()
            abxScrollView.subviews.forEach { $0.removeFromSuperview() } // Clears the scroll view
            loadAbxWithArray(self.abxs)
        }
        
    }
    
    // Good Function that look through abx array and sorts if abx coveres abx that was pressed
    func returnSpecificAbxCoverage(abxCoverage: String) -> [Abx]{
       
        var abxArrayToReturn = [Abx]()
        
        for abx in self.abxs {
            let coverage = abx.coverageFull
            if coverage.contains(abxCoverage) {
                abxArrayToReturn.append(abx)
            }
        }
        
        for abx in self.abxs {
            let coverage = abx.coveragePartial
            if coverage.contains(abxCoverage) {
                abxArrayToReturn.append(abx)
            }
        }
        
        return abxArrayToReturn
    }


    
    func modifyViewForLine(incomingFrame: CGRect, coverage: Bool) -> UIView {
        let viewToReturn = UIView(frame: incomingFrame)
        viewToReturn.frame.origin.x = incomingFrame.origin.x - 25
        viewToReturn.frame.origin.y = 0
        viewToReturn.frame.size.height = 50
        if (coverage) {
            viewToReturn.alpha = 0.2
            viewToReturn.backgroundColor = UIColor.blackColor()
        } else {
            viewToReturn.alpha = 0.1
            viewToReturn.backgroundColor = UIColor.darkGrayColor()
        }
        return viewToReturn
    }
    
    func addButtonToScrollView(viewToAdd: UIView) {
        abxScrollView.addSubview(viewToAdd)
        viewToAdd.layer.borderWidth = 1
        viewToAdd.layer.borderColor = UIColor.blackColor().CGColor
        viewToAdd.userInteractionEnabled = true
    }
    
    // The ttitle
    func addLableToButton(viewToAddLabel: UIView, textForLabel: String) {
        var labelFrame = viewToAddLabel.bounds
        labelFrame.origin.x = labelFrame.origin.x + 5
        labelFrame.size.height = labelFrame.size.height/1.7
        let label = UILabel(frame: labelFrame)
        label.text = textForLabel
        viewToAddLabel.addSubview(label)
    }
    
    // The subtitle
    func addSubLabelToButton(viewToAddLabel: UIView, textForLabel: String) {
        var labelFrame = viewToAddLabel.bounds
        labelFrame.origin.x = labelFrame.origin.x + 1
        labelFrame.origin.y = labelFrame.size.height/2
        labelFrame.size.height = labelFrame.size.height - (labelFrame.size.height/2)
        let label = UILabel(frame: labelFrame)
        label.font = UIFont(name: label.font.fontName, size: 10)
        label.text = textForLabel
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        
        viewToAddLabel.addSubview(label)
    }
    
    // Dosage in top right
    func addpoIVLabelToButton(viewToAddLabel: UIView, textForLabel: String) {
        var labelFrame = viewToAddLabel.bounds
        //labelFrame.origin.x = labelFrame.size.width - 35
        labelFrame.size.width = labelFrame.size.width - 5
        labelFrame.origin.y = 2
        labelFrame.size.height = labelFrame.size.height/3
        let label = UILabel(frame: labelFrame)
        label.font = UIFont(name: label.font.fontName, size: 10)
        label.text = textForLabel
        label.textAlignment = .Right
        
        viewToAddLabel.addSubview(label)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
