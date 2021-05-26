//
//  ViewController.swift
//  FindSeatBluetoothModule
//
//  Created by kevin on 2021/5/26.
//

import UIKit

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    private var centralManager: CBCentralManager!
    private var peripheralUUID: Set<UUID> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello world")
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("unknown")
            break
        case .resetting:
            print("resetting")
            break
        case .unsupported:
            print("unsupported")
            break
        case .unauthorized:
            print("unauthorized")
            break
        case .poweredOff:
            print("poweredOff")
            break
        case .poweredOn:
            print("poweredOn")
            centralManager.scanForPeripherals(withServices: nil)
            break
        @unknown default:
            break
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let ( inserted, _) = peripheralUUID.insert(peripheral.identifier)
        if inserted {
            print("Find a new peripheral!! UUID is: \(peripheral.identifier), name: \(String(describing: peripheral.name))")
        }
//        print(peripheral)
    }
}
