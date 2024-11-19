//
//  DetailViewController.swift
//  Presentation
//
//  Created by 정명곤 on 11/12/24.
//

import UIKit
import Domain

public final class DetailViewController: UIViewController {
  private var movie: Movie
  
  private var detailLabel: UILabel = {
    let label = UILabel()
    label.frame = .init(origin: .zero, size: .zero)
    label.backgroundColor = .red
    return label
  }()

  init(movie: Movie) {
    self.movie = movie
    super.init(nibName: nil, bundle: nil)
  }

  required public init?(coder: NSCoder) {
    fatalError()
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    setComponents()
    setLayout()
  }


}

extension DetailViewController {
  private func setComponents() {
    view.addSubview(detailLabel)
  }

  private func setLayout() {
    detailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
  }
}
