// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';

/**
 * Shows a bootstrap modal dialog.
 * Set the body of the dialog by adding content to the modal tag: <modal>content here</modal>.
 */
@Component(
    selector: 'n2s-modal',
    templateUrl: 'modal.html')
class N2sModal {

  @Input() String header;
  @Input() String cancelLabel = 'Cancel';
  @Input() String positiveLabel = 'OK';

  /**
   * Fires an event when the modal is closed. The argument indicated how it was closed.
   * @type {EventEmitter<ModalResult>}
   */
  @Output() EventEmitter<N2sModalAction> close = new EventEmitter<N2sModalAction> ();

  bool showModal = false;

  N2sModal() {
    print('showModal = $showModal');
  }

  /**
   * Shows the modal. There is no method for hiding. This is done using actions of the modal itself.
   */
  show() {
    showModal = true;
  }

  positiveAction() {
    showModal = false;
    close.emit(N2sModalAction.POSITIVE);
    return false;
  }

  cancelAction() {
    showModal = false;
    close.emit(N2sModalAction.CANCEL);
    return false;
  }
}

/**
 * The possible reasons a modal has been closed.
 */
enum N2sModalAction { POSITIVE, CANCEL }