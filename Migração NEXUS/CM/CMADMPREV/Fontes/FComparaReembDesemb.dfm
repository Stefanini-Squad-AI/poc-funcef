inherited FrmComparaReembDesemb: TFrmComparaReembDesemb
  Left = 306
  Top = 284
  HelpContext = 4540003
  Caption = 'Resumo de Reembolso e Desembolso INSS'
  ClientHeight = 473
  ClientWidth = 792
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 434
    object PnlItem14: TPanel
      Left = 193
      Top = 403
      Width = 414
      Height = 23
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = '  Dif. Reembolso X Desembolso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object EdVItem14: TRealEdit
        Left = 232
        Top = 1
        Width = 181
        Height = 21
        Align = alRight
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object GrBxReembolso: TGroupBox
      Left = 1
      Top = 40
      Width = 395
      Height = 352
      Caption = ' Reembolso  (Valor / Quantidade) '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object PnlRItem1: TPanel
        Left = 2
        Top = 22
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object EdVRItem1: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem1: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem2: TPanel
        Left = 2
        Top = 252
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  PAB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object EdVRItem2: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem2: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem3: TPanel
        Left = 2
        Top = 45
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Revisão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object EdVRItem3: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem3: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem4: TPanel
        Left = 2
        Top = 68
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  IRSM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object EdVRItem4: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem4: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem5: TPanel
        Left = 2
        Top = 91
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Glosas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object EdVRItem5: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem5: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem6: TPanel
        Left = 2
        Top = 114
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Adic. 25%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object EdVRItem6: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem6: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem7: TPanel
        Left = 2
        Top = 137
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object EdVRItem7: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem7: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem8: TPanel
        Left = 2
        Top = 160
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Salário Familia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object EdVRItem8: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem8: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem9: TPanel
        Left = 2
        Top = 275
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Débito INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object EdVRItem9: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem9: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem10: TPanel
        Left = 2
        Top = 298
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Extra folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object EdVRItem10: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem10: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem11: TPanel
        Left = 2
        Top = 183
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  P. Alimentícia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        object EdVRItem11: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem11: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem12: TPanel
        Left = 2
        Top = 206
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Aposentadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        object EdVRItem12: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem12: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem14: TPanel
        Left = 2
        Top = 321
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Total '
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        object EdVRItem14: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem14: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlRItem13: TPanel
        Left = 2
        Top = 229
        Width = 391
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Pensão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        object EdVRItem13: TRealEdit
          Left = 120
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQRItem13: TRealEdit
          Left = 266
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
    object GrBxDesembolso: TGroupBox
      Left = 405
      Top = 40
      Width = 394
      Height = 352
      Caption = ' Desembolso (Valor / Quantidade) '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object PnlDItem1: TPanel
        Left = 2
        Top = 22
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object EdVDItem1: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem1: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem2: TPanel
        Left = 2
        Top = 45
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object EdVDItem2: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem2: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem3: TPanel
        Left = 2
        Top = 91
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object EdVDItem3: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem3: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem4: TPanel
        Left = 2
        Top = 68
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object EdVDItem4: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem4: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem5: TPanel
        Left = 2
        Top = 114
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object EdVDItem5: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem5: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem6: TPanel
        Left = 2
        Top = 137
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object EdVDItem6: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem6: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem7: TPanel
        Left = 2
        Top = 160
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object EdVDItem7: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem7: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem8: TPanel
        Left = 2
        Top = 183
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object EdVDItem8: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem8: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem9: TPanel
        Left = 2
        Top = 206
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object EdVDItem9: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem9: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem10: TPanel
        Left = 2
        Top = 229
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object EdVDItem10: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem10: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object PnlDItem11: TPanel
        Left = 2
        Top = 321
        Width = 390
        Height = 23
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        object EdVDItem11: TRealEdit
          Left = 10
          Top = 1
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object EdQDItem11: TRealEdit
          Left = 170
          Top = 2
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
    object grpMesAno: TGroupBox
      Left = 1
      Top = 1
      Width = 790
      Height = 42
      Align = alTop
      TabOrder = 0
      object lblMes: TLabel
        Left = 16
        Top = 19
        Width = 207
        Height = 13
        Caption = 'Informe o Mês e o Ano para consuta'
      end
      object LblTEMPO: TLabel
        Left = 640
        Top = 20
        Width = 44
        Height = 13
        Caption = 'TEMPO'
        Visible = False
      end
      object seAno: TSpinEdit
        Left = 381
        Top = 14
        Width = 70
        Height = 22
        MaxValue = 3000
        MinValue = 2000
        TabOrder = 0
        Value = 2005
      end
      object cboxMes: TComboBox
        Left = 229
        Top = 15
        Width = 142
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object BtConsultar: TBitBtn
        Left = 496
        Top = 10
        Width = 105
        Height = 29
        Caption = 'Consultar'
        TabOrder = 2
        OnClick = BtConsultarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 507
    Top = 327
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object QryConsulta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS NOMEBENEFICIARIO,'
      
        '       DECODE(BF.FLGDATAPREVISTA,1,BF.DATAFINALPREVISTA,DATAFINA' +
        'L) AS DATAFINALPRINT,'
      '       PF.FLGISENTOIRRF,'
      '       BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,'
      
        '       BF.FLGFORMAPAGTO,    BF.VALORCALCULADO, BF.DATAULTREAJUST' +
        'E,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2' +
        ', BF.VALORBINSSANT3,'
      '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS,'
      '       BF.VALORSRB,'
      '       BPL.FLGREFERENCIA,'
      '       B.NUMORDEMEVENTO,    B.NOME,            S.DESCRICAO,'
      '       B.FLGRESGATE,        BPART.VALORBASE1,  BPART.VALORBASE2,'
      '       BPART.VALORBASE3,    PT.IDRUBSALAUXDOENCA'
      
        'FROM   PESSOA P, PESSOAFISICA PF, BENEFBFCIARIO BF, BENEFICIO B,' +
        ' BENEFPLANPREV BPL,'
      '       SITBENEFICIO S, BENEFPLANOPART BPART, PATRO PT'
      'WHERE  B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDPESSJUR      = PT.IDPESSOA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1) ) )'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    P.IDPESSOA        = BF.IDPESSOA'
      'AND    PF.IDPESSOA       = BF.IDPESSOA')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 538
    Top = 327
  end
end
