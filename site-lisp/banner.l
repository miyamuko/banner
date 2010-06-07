; -*- Mode: Lisp; Package: editor -*-

#|
= banner - �傫�ȕ����ŕ�������o�͂���

* Author:  MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/banner/intro.htm>))
* Version: 0.2


== ����

Unix �ɂ��� banner �R�}���h�̈ڐA�ł��B

BDF �t�H���g��������Γ��{�ꂾ�낤�� AA ���낤������ɂł��܂��B


== �C���X�g�[��

((<NetInstaller|URL:http://www.mirai.ne.jp/~gyo/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ�� 3 �ȍ~���A
NetInstaller + (({ni-autoload})) ���g���Ă���l�� 4 �ȍ~�� OK �ł��B

(1) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/banner.zip>))

(2) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(3) ~/.xyzzy �܂��� $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ;; banner
        (require "banner")

(4) �ݒ�𔽉f�����邽�� xyzzy ���ċN�����Ă��������B

    ��siteinit.l �ɋL�q�����ꍇ�ɂ͍ă_���v���K�v�ł��B

(5) BDF �t�H���g���Ȃɂ��C���X�g�[�����܂��B

(6) BDF �t�H���g�ɂ��킹�� ((<*banner-bdf-font-selecter*>)) ��ݒ肵�܂��B

(7) ���剻���������������[�W�����ɂ��� M-x banner-region �܂���
    M-x banner �Ń~�j�o�b�t�@������͂��Ă��������B


== ���t�@�����X

=== �R�}���h

--- (banner str)

    �w�肳�ꂽ�������傫������ ((<*banner-output-buffer-name*>)) ��
    �o�͂��܂��B

--- (banner-region start end)

    �w�肳�ꂽ���[�W�����̕������傫������ ((<*banner-output-buffer-name*>)) ��
    �o�͂��܂��B


=== �֐�

--- (ed::banner-internal str &optional formatter)

    �w�肳�ꂽ�������傫������ ((<*banner-output-buffer-name*>)) ��
    �o�͂��܂��B

    �ȗ��\�ȑ�2�����ɂ͈ȉ��̏o�͊֐����w�肵�܂��B
    �f�t�H���g�� (({ed::banner-output-horizontally})) �ł��B

--- (ed::banner-output-vertically glyphs)

    �c������ banner ���o�͂��܂��B
    (({ed::banner-internal})) �̈����Ɏw�肵�܂��B

--- (ed::banner-output-horizontally glyphs)

    �������� banner ���o�͂��܂��B
    (({ed::banner-internal})) �̈����Ɏw�肵�܂��B


=== �ϐ�

--- *bdf-directory-list*

    BDF �t�H���g��u���Ă����f�B���N�g�����w�肵�܂��B
    �f�t�H���g�� $XYZZY/fonts/bdf �ł��B

        ;; Meadow ����� font directory ��ǉ�
        (pushnew "D:/Tools/Meadow/fonts/bdf" *bdf-directory-list*)

--- *banner-output-buffer-name*

    �o�̓o�b�t�@�̖��O�����Ă��܂��B

--- *banner-font-fg-char*
--- *banner-font-bg-char*

    ���ꂼ��t�H���g���`�����镶���Ɣw�i��ݒ肵�܂��B

        ;; �l�p�Ń��C�A�E�g����
        (setf *banner-font-fg-char* "��")
        (setf *banner-font-bg-char* "��")

    �����Ȃ�܂��B

        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������
        ��������������������������������������������������������������������

--- *banner-bdf-font-selecter*

    ���镶���ɑΉ����� BDF �t�H���g�̃t�@�C������Ԃ�
    �֐���ݒ肵�܂��B

    ((*���̕ϐ��͕K���ݒ肵�Ă��������B*))

        ;; monafont �𗘗p����
        (setf *banner-bdf-font-selecter*
              #'(lambda (c)
                  (cond ((kanji-char-p c)
                         ; �����A�Ђ炪�ȁA�J�^�J�i
                         "monak12.bdf")
                        ((kana-char-p c)
                         ; �����锼�p�J�i
                         "mona6x12r.bdf")
                        (t
                         ; ���̑�
                         "mona6x12a.bdf"))))

        ;; K12 �𗘗p����
        (setf *banner-bdf-font-selecter*
              #'(lambda (c)
                  (cond ((kanji-char-p c)
                         ; �����A�Ђ炪�ȁA�J�^�J�i
                         "k12x10.bdf")
                        (t
                         ; ���̑�
                         "k6x10.bdf"))))

    �t�H���g�����낱��ς������ꍇ�̓L���b�V�����������ق��������ł��B

        ; �L���b�V��������
        (setf ed::*bdf-glyph-cache* nil)


== ���ꂩ���邩������Ȃ�����

* BDF �t�H���g�� encoding �������ƌ���悤�ɂ���B
  * ���� sjis ���ߑł��������C������B
* TrueType �t�H���g���g����悤�ɂ��� (������)�B
  * Win32 API ������΂��Ă������΂ł��邩�Ȃ�...?
* ttf2bdf �ŕϊ����� bdf �t�H���g���g����悤�ɂ���B
  * �ނ������s�����L��������B
* �t�H���g�̐ݒ�����������܂Ƃ��ɂ���B


== �֘A���邩������Ȃ��y�[�W

: BDF�t�@�C���t�H�[�}�b�g
    ((<URL:http://hp.vector.co.jp/authors/VA013241/font/bdf.html>))

: ���i�[�t�H���g
    ((<URL:http://monafont.sourceforge.net/>))

: (X11 �𒆐S�Ƃ���)�t���[�̓��{��r�b�g�}�b�v�t�H���g�ꗗ
    ((<URL:http://kappa.allnet.ne.jp/kanou/fonts/x11bdfs.html>))


== ���C�Z���X

banner �͏C�� BSD ���C�Z���X�Ɋ�Â��ė��p�\�ł��B

  Copyright (C) 2003-2006 MIYAMUKO Katsuyuki. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1 Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer as the first lines
    of this file unmodified.

  2 Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.
|#

(provide "banner")
(in-package "editor")

(export '(*bdf-directory-list*
          *banner-output-buffer-name*
          *banner-font-fg-char*
          *banner-font-bg-char*
          *banner-bdf-font-selecter*
          banner
          banner-vertically
          banner-region
          banner-region-vertically))

;; ----------------------------------------------------------------------
;; variables

(defvar *bdf-directory-list*
  (list (merge-pathnames "fonts/bdf" (si:system-root))))
(defvar *banner-output-buffer-name* "*banner*")
(defvar *banner-font-fg-char* "##")
(defvar *banner-font-bg-char* "  ")
(defvar *banner-bdf-font-selecter* nil)


;; ----------------------------------------------------------------------
;; commands

(defun banner (str &optional fold-width)
  "banner: �w�肳�ꂽ������� banner �� (������)"
  (interactive "sBanner: \np")
  (banner-internal str fold-width))

(defun banner-vertically (str)
  "banner: �w�肳�ꂽ������� banner �� (�c����)"
  (interactive "sBanner: ")
  (banner str 1))

(defun banner-region (start end &optional fold-width)
  "banner: �w�肳�ꂽ���[�W�����̕������ banner �� (������)"
  (interactive "r\np")
  (if (< end start) (rotatef start end))
  (banner-internal (buffer-substring start end) fold-width))

(defun banner-region-vertically (start end)
  "banner: �w�肳�ꂽ���[�W�����̕������ banner �� (�c����)"
  (interactive "r")
  (banner-region start end 1))

;; ----------------------------------------------------------------------
;; functions

(defmacro dolist-with-progress-message ((msg var listform &optional (resultform ''nil)) &body body)
  `(let ((len (length ,listform))
         (current 0))
     (do* ((#1=#:tailvar ,listform (cdr #1#))
           (,var (car #1#) (car #1#)))
         ((null #1#) ,resultform)
       (incf current)
       (message ,msg (floor (* (/ current len) 100)))
       ,@body)))

(defun banner-internal (str fold-width)
  "banner: �w�肳�ꂽ������� banner ��"
  (unless *banner-bdf-font-selecter*
    (error "*banner-bdf-font-selecter* ��ݒ肵�Ă���������"))
  (long-operation
    (with-output-to-temp-buffer (*banner-output-buffer-name*)
      (dolist-with-progress-message
       ("~D %" line (split-string str #\LFD))
       (do-events)
       (banner-output (map 'list 'bdf-get-glyph line) fold-width))))
  (switch-to-buffer *banner-output-buffer-name*))

(defun banner-output (glyphs &optional fold-width)
  "banner: �t�H���g���o�͂���"
  (let ((p 0)
        (glyph-len (length glyphs)))
    (unless fold-width
      (setf fold-width glyph-len))
    (while (< p glyph-len)
      (apply #'mapcar #'(lambda (&rest line)
                          (format t "~{~A~}" line)
                          (terpri))
             (subseq glyphs p (min glyph-len (+ p fold-width))))
      (incf p fold-width))))

(defun banner-dispose ()
  (interactive)
  (setf *bdf-glyph-cache* nil)
  (bdf-kill-all-buffers))

;;

(defvar *bdf-glyph-cache* nil
  "banner: �ǂݍ��񂾃t�H���g���̃L���b�V��")

(defun bdf-get-glyph (c)
  "banner: �L���b�V���ɂ���΂��̃t�H���g����Ԃ�"
  (let ((jis-code (banner-char-jis-code c)))
    (unless *bdf-glyph-cache*
      (setf *bdf-glyph-cache* (make-hash-table)))
    (unless (gethash jis-code *bdf-glyph-cache*)
      (setf (gethash jis-code *bdf-glyph-cache*)
            (bdf-get-glyph-internal
             (bdf-find-file (funcall *banner-bdf-font-selecter* c))
             jis-code)))
    (gethash jis-code *bdf-glyph-cache*)))

(defun bdf-get-glyph-internal (bdfbuffer jis-code)
  "banner: BDF �t�@�C������͂��ăt�H���g�����擾"
  (let ((width nil)
        (result))
    ;; setup buffer
    (set-buffer bdfbuffer)
    (goto-char (point-min))

    ;; scan glyph
    (unless (scan-buffer (format nil "^ENCODING ~D\\>" jis-code) :regexp t)
      ;; use DEFAULT_CHAR if not found.
      (if (scan-buffer "^DEFAULT_CHAR \\([0-9]+\\)\\>" :regexp t)
          (return-from bdf-get-glyph-internal
            (bdf-get-glyph bdfbuffer
                           (code-char (parse-integer (match-string 1)))))
        nil))

    ;; clipping
    (save-restriction
      (narrow-to-region (point)
                        (progn
                          (scan-buffer "^ENDCHAR\\>" :regexp t :tail t)
                          (point)))
      (goto-char (point-min))

      ;; get width
      (scan-buffer (format nil "^DWIDTH +\\([0-9]+\\) +[0-9]+" jis-code)
                   :regexp t :tail t)
      (setf width (parse-integer (match-string 1)))

      ;; get glyph info
      (scan-buffer "^BITMAP\\>" :regexp t)
      (while (and (forward-line 1)
                  (not (looking-at "^ENDCHAR\\>")))
        (push (bdf-expand-glyph width
                                (buffer-substring (progn (goto-bol) (point))
                                                  (progn (goto-eol) (point))))
              result))
      (reverse result))))

(defun bdf-expand-glyph (width hex)
  "banner: BDF Font �̏���W�J����"
  (substitute-string
   (substitute-string
    (substring (format nil "~V,'0B" (* 4 (length hex))
                       (parse-integer hex :radix 16))
               0 width)
    "1" *banner-font-fg-char*)
   "0" *banner-font-bg-char*))

(defvar *bdf-find-file-buffers* nil
  "banner: open ���� BDF font �� buffer")

(defun bdf-find-file (bdfname)
  "banner: �w�肳�ꂽ BDF font �� font path ����T�� buffer �ɓǂݍ��ށB
argument: �t�H���g��
return: �t�H���g��ǂݍ��� buffer"
  (let ((bufname (concat " " bdfname)))
    (if (find-buffer bufname)
        (return-from bdf-find-file (find-buffer bufname)))
    (dolist (dir *bdf-directory-list*)
      (when (file-exist-p (merge-pathnames bdfname dir))
        (let ((buffer (get-buffer-create bufname)))
          (set-buffer buffer)
          (insert-file (merge-pathnames bdfname dir))
          (push buffer *bdf-find-file-buffers*) ;cache
          (return-from bdf-find-file buffer))))
    (error "BDF Font ���Ȃ��ł�" bdfname)))

(defun bdf-kill-all-buffers ()
  "banner: �ǂݍ��� BDF font �����ׂč폜����B"
  (dolist (buffer *bdf-find-file-buffers*)
    (if (member buffer (buffer-list))
        (delete-buffer buffer)))
  (setf *bdf-find-file-buffers* nil))

;; ----------------------------------------------------------------------
;; util

(defun banner-char-jis-code (c)
  "banner: ������ JIS �R�[�h�ɕϊ�����"
  (if (kanji-char-p c)
      (let ((jis (map-internal-to-jis (string c))))
        (logior (ash (char-code (char jis 3)) 8)
                (char-code (char jis 4))))
    (char-code c)))


;;
;; End
;;