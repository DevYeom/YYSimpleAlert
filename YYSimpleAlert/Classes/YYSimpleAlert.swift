//
//  YYSimpleAlert.swift
//  YYSimpleAlert
//
//  Created by flip.flop on 02/09/2020.
//  Copyright (c) 2020 flip.flop. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
open class YYSimpleAlert: UIView {
    private var contentView: UIView!
    private var titleLabel: UILabel!
    private var lineView: UIView!
    private var confirmButton: UIButton!

    private var titleText: String?
    private var confirmText: String?
    private var completion: (() -> Void)?

    public convenience init(title: String, confirm: String, completion: (() -> Void)?) {
        self.init(frame: CGRect.zero)

        self.titleText = title
        self.confirmText = confirm
        self.completion = completion
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        contentView = UIView()
        titleLabel = UILabel()
        lineView = UIView()
        confirmButton = UIButton(type: .custom)

        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setAttribute() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)

        contentView.layer.cornerRadius = 14.0
        contentView.backgroundColor = .white

        lineView.backgroundColor = .lightGray

        titleLabel.text = titleText ?? "Title"

        confirmButton.setTitle(confirmText ?? "confirm", for: .normal)
        confirmButton.setTitleColor(.blue, for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
    }

    open func show(in superview: UIView) {
        setAttribute()

        superview.addSubview(self)
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true

        self.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 270.0).isActive = true

        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50.0).isActive = true

        contentView.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        contentView.addSubview(confirmButton)
        confirmButton.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    }

    @objc
    private func confirmAction() {
        self.removeFromSuperview()
        completion?()
    }
}
