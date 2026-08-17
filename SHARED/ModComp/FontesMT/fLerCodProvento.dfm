inherited frmLerCodProvento: TfrmLerCodProvento
  Left = 178
  Top = 226
  BorderStyle = bsToolWindow
  Caption = 'Associar Rubrica à Empresa'
  ClientHeight = 188
  ClientWidth = 449
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 149
    BorderWidth = 2
    object lblEmpresa: TLabel
      Left = 12
      Top = 13
      Width = 424
      Height = 13
      AutoSize = False
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProvento: TLabel
      Left = 12
      Top = 38
      Width = 424
      Height = 33
      AutoSize = False
      Caption = 'Rubrica'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 315
      Top = 82
      Width = 106
      Height = 13
      Caption = 'Código da Rubrica'
    end
    object Label1: TLabel
      Left = 12
      Top = 82
      Width = 124
      Height = 13
      Caption = 'Descrição da Rubrica'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 76
      Width = 433
      Height = 3
    end
    object edCodProvDesc: TEdit
      Left = 315
      Top = 97
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edDescrProvDesc: TEdit
      Left = 12
      Top = 97
      Width = 296
      Height = 21
      TabOrder = 0
    end
    object chkbxVisivel: TCheckBox
      Left = 12
      Top = 122
      Width = 77
      Height = 17
      Caption = 'Visível?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = chkbxVisivelClick
    end
  end
  inherited Dock971: TDock97
    Top = 149
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 280
      DockPos = 374
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Caption = 'A&bortar'
        ModalResult = 3
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 113
      DockPos = 121
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 251
    Top = 9
  end
end
