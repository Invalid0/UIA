//
//  QrViewController.swift
//  uia
//
//  Created by EMPULSE on 25/09/23.
//

import UIKit
import AVFoundation

class QrViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var vwSafe: UIView!
    @IBOutlet weak var scannerVw: UIView!
    @IBOutlet weak var torchBtn: UIButton!
    @IBOutlet weak var containerVw: UIView!
    @IBOutlet weak var torchVw: UIView!
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var isTorchOn = false
    let maskLayer = CAShapeLayer()
    var qrCodeScanCallback: ((String) -> Void)?
    override func viewDidAppear(_ animated: Bool) {
        setupQRScanner()
        setupTorch()
    }
    override func viewDidDisappear(_ animated: Bool) {
        stopCamera()
    }
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupMaskLayer()
    }
    
    @IBAction func click_to_light(_ sender: Any) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {
            return
        }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if isTorchOn {
                    device.torchMode = .off
                } else {
                    device.torchMode = .on
                }
                device.unlockForConfiguration()
                isTorchOn = !isTorchOn
            } catch {
                print("Torch could not be used: \(error.localizedDescription)")
            }
        }
        torchBtn.setImage({ isTorchOn ? UIImage(named: "flash_on") :  UIImage(named: "flash_off")
        }(), for: .normal)
    }

    
func setupMaskLayer() {
self.maskLayer.removeFromSuperlayer()
let path = CGMutablePath()
path.addRect(containerVw.bounds)
path.addRect(scannerVw.frame)
maskLayer.path = path
maskLayer.fillColor = UIColor(red: 61.0 / 255.0, green: 56.0 / 255.0, blue: 56.0 / 255.0, alpha: 0.5).cgColor
maskLayer.fillRule = .evenOdd
containerVw.layer.addSublayer(maskLayer)
}
    
    func setupQRScanner() {
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to get the camera device.")
            return
        }
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                print("Failed to add video input.")
                return
            }
            let metadataOutput = AVCaptureMetadataOutput()
            if captureSession.canAddOutput(metadataOutput) {
                captureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
            } else {
                print("Failed to add metadata output.")
                return
            }
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = view.layer.bounds
            previewLayer.videoGravity = .resizeAspectFill
            vwSafe.layer.addSublayer(previewLayer)
            roundRadius(passview: scannerVw, radiusValue: 10, borderWidth: 3)
            roundRadius(passview: scannerVw, radiusValue: 0, borderWidth: 1)
            view.addSubview(containerVw)
            view.addSubview(torchVw)
            setupMaskLayer()
            captureSession.startRunning()
        } catch {
            print("Error initializing capture device: \(error.localizedDescription)")
        }
    }
    
    
    
    func setupTorch() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("Torch is not available")
            return
        }
        do {
            try device.lockForConfiguration()
            device.torchMode = .off
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used: \(error.localizedDescription)")
        }
    }
    
    
    // Handle the QR code detection here
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let qrString = metadataObject.stringValue,
              let transformedMetadataObject = previewLayer.transformedMetadataObject(for: metadataObject) else {
            return
        }
        let getRect = scannerVw.frame
        if transformedMetadataObject.bounds.intersection(getRect) == transformedMetadataObject.bounds {
            captureSession.stopRunning()
            
            // Process the scanned QR code (qrString) as per your requirements
            print("Scanned QR Code: \(qrString)")
            self.view.makeToast(qrString)
            qrCodeScanCallback?(qrString)
            isQrScanned = true
            print("isQrScanned", isQrScanned)
            if let tabBarController = self.tabBarController {
                    tabBarController.selectedIndex = 2
               
                }
        }
            
    }

    func showQRCodeDetectedAlert(_ qrCodeValue: String) {
        let alert = UIAlertController(title: "QR Code Detected", message: qrCodeValue, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func stopCamera() {
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }
    
    @IBAction func cancleBtn(_ sender: UIButton){
        print("in QrViewController")
        if let tabBarController = self.tabBarController {
            stopCamera()
                tabBarController.selectedIndex = 0
            }
    }
}


