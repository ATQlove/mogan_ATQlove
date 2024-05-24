;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : docx.scm
;; DESCRIPTION : DOCX data format
;; COPYRIGHT   : (C) 2024  ATQlove
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (data docx))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DOCX source files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-format docx
  (:name "DOCX")
  (:suffix "docx"))

(define (texmacs->docx x . opts)
  (texmacs->verbatim x (acons "texmacs->verbatim:encoding" "SourceCode" '())))

(define (docx->texmacs x . opts)
  (code->texmacs x))

(define (docx-snippet->texmacs x . opts)
  (code-snippet->texmacs x))

(converter texmacs-tree docx-document
  (:function texmacs->docx))

(converter docx-document texmacs-tree
  (:function docx->texmacs))
  
(converter texmacs-tree docx-snippet
  (:function texmacs->docx))

(converter docx-snippet texmacs-tree
  (:function docx-snippet->texmacs))
