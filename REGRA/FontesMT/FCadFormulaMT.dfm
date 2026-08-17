inherited FrmCadFormulaMT: TFrmCadFormulaMT
  Left = 247
  Top = 86
  Width = 768
  Height = 582
  HelpContext = 450012
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Fórmulas MT'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 457
    object PnlFundoB: TPanel
      Left = 192
      Top = 1
      Width = 559
      Height = 455
      Align = alClient
      TabOrder = 1
      object memDesc: TMemo
        Left = 1
        Top = 125
        Width = 557
        Height = 329
        Align = alClient
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WantReturns = False
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 557
        Height = 124
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 5
          Width = 187
          Height = 13
          Caption = 'Número     Descrição da Fórmula'
        end
        object Label4: TLabel
          Left = 336
          Top = 5
          Width = 101
          Height = 13
          Caption = 'Grupo da Fórmula'
        end
        object Label3: TLabel
          Left = 10
          Top = 44
          Width = 59
          Height = 13
          Caption = 'Expressão'
        end
        object EdDescricao: TwwDBEdit
          Left = 73
          Top = 20
          Width = 256
          Height = 21
          DataField = 'DESCRICAOFORMULA'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DbLkcGrpFormula: TwwDBLookupCombo
          Left = 336
          Top = 20
          Width = 252
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCGRUPOFORMULA'#9'40'#9'DESCGRUPOFORMULA')
          DataField = 'CODGRUPOFORMULA'
          DataSource = ds
          LookupTable = CdsGrpFormula
          LookupField = 'CODGRUPOFORMULA'
          Options = [loRowLines]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object dedMemo: TwwDBEdit
          Left = 10
          Top = 59
          Width = 544
          Height = 54
          AutoSelect = False
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'EXPRESSAOFORMULA'
          DataSource = ds
          ParentCtl3D = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = True
        end
        object DBEdtIDFormula: TwwDBEdit
          Left = 10
          Top = 20
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'IDFORMULA'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object BtBuscaVariavel: TBitBtn
          Left = 560
          Top = 59
          Width = 27
          Height = 27
          TabOrder = 4
          OnClick = BtBuscaVariavelClick
          Glyph.Data = {
            36010000424D3601000000000000760000002800000011000000100000000100
            040000000000C0000000C40E0000C40E00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF999903333
            333330000000FF9FFFF99933333330000000009F00F03399333370000000FF9F
            FFF9933393333000000000F999903333393370000000FFFFFFF0333339333000
            000000FFFFF03333933370000000FFF0000033333333300000000FF0FF999339
            933370000000FFF0F9939939933330000000FFF003339939933330000000FFF0
            3399933999933000000000033993333993997000000033333993993993993000
            0000333333999339999330000000333333333333333330000000}
        end
        object BtFormulario: TBitBtn
          Left = 560
          Top = 89
          Width = 27
          Height = 24
          Hint = 'Mostra construtor de campo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Visible = False
          OnClick = BtFormularioClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
            FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
            FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
            FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
            FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
            FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
            C880733777777777733700000000000000007777777777777777333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 191
      Height = 455
      Align = alLeft
      Caption = 'Panel4'
      TabOrder = 0
      object Panel3: TPanel
        Left = 162
        Top = 1
        Width = 28
        Height = 453
        Align = alRight
        BevelOuter = bvLowered
        Color = clGray
        TabOrder = 0
        object BtPar2: TSpeedButton
          Left = 1
          Top = 227
          Width = 25
          Height = 25
          Hint = 'Fecha Parênteses'
          Caption = ')'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtPar2Click
        end
        object BtPar1: TSpeedButton
          Left = 1
          Top = 202
          Width = 25
          Height = 25
          Hint = 'Abre Parênteses'
          Caption = '('
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtPar1Click
        end
        object BtApagar: TSpeedButton
          Left = 1
          Top = 27
          Width = 25
          Height = 25
          Hint = 'Apaga a expressão toda'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Glyph.Data = {
            56070000424D5607000000000000360400002800000028000000140000000100
            0800000000002003000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            030303030303030303030303030303030303FF030303FF030303030303030303
            0303030303030303030303030303030303030303030303030303FF0303FFFFFF
            0303FF0303030303030303030303030303030303030303030303030303030303
            0303FFFFFFFFFFFFFFFFFFFF03030303030303030303030303030303030303FF
            FFFFFF03030303030303FFFFFFFFFFFFFFFFF801010103030303030303030303
            030303030303F8F8F8F8FFFF030303030303FFFFFFFFFFFFFFF8F9FDFD050103
            03030303030303030303030303F8FF0303F8F8FFFF0303030303FFFFFFFFFFFF
            FFF9FDF9FDFD050103030303030303030303030303F8FF030303F8F8FFFF0303
            0303FFFFFFFFFFFF03FDF9FFF9FDFD0500030303030303030303030303F8FF03
            030303F8F8FFFF030303FFFF03FFFFFF03F9FDFFFDF9FD000600030303030303
            0303030303F803FF030303F8F8F8FFFF0303FF030303FF030303F9FDFFFD0002
            0406000303030303030303030303F803FF03F8F8F8F8F8FFFF03FF0303030303
            030303F9FD00FA02020406000303030303030303030303F803F803F8F8F8F8F8
            FFFF0303030303030303030300FAFBFA020200F8000303030303030303030303
            F803FF03F8F8F8F8F8FF030303030303030303030300FAFBFA0004F8F8000303
            030303030303030303F803FF03F8F8F8F8F803030303030303030303030300FA
            0007FB04F8F8030303030303030303030303F803F80303F8F8F8030303030303
            030303030303030007FFFBFB04F803030303030303030303030303F803FF0303
            F8F8030303030303030303030303030300FFFFFBFB0403030303030303030303
            03030303F803FF0303F803030303030303030303030303030300FFFFFBFB0303
            03030303030303030303030303F803FF03030303030303030303030303030303
            030300FFFFFB03030303030303030303030303030303F8030303}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtApagarClick
        end
        object btApagarUltimo: TSpeedButton
          Left = 1
          Top = 2
          Width = 25
          Height = 25
          Hint = 'Apaga o último caracter'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Glyph.Data = {
            36010000424D360100000000000076000000280000001E0000000C0000000100
            040000000000C000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777887777
            7777777778877777770077777008777777777777778777777700777700087777
            7777777777877777770077700008888888877777778888888800770000000000
            0087777777777777780070000000000000877777777777777800F00000000000
            008F7777777777777800FF0000000000008F77777777777778007FF00007FFFF
            FF77FF77777FFFFFF70077FF0008777777777FF7778777777700777FF0087777
            777777FF7787777777007777FFF777777777777FFF7777777700}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btApagarUltimoClick
        end
        object BtSomar: TSpeedButton
          Left = 1
          Top = 102
          Width = 25
          Height = 25
          Hint = 'Somar'
          Caption = '+'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtSomarClick
        end
        object BtDiminuir: TSpeedButton
          Left = 1
          Top = 127
          Width = 25
          Height = 25
          Hint = 'Diminuir'
          Caption = '-'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtDiminuirClick
        end
        object BtMultiplicar: TSpeedButton
          Left = 1
          Top = 52
          Width = 25
          Height = 25
          Hint = 'Multiplicar'
          Caption = '*'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtMultiplicarClick
        end
        object SpeedButton1: TSpeedButton
          Left = 1
          Top = 77
          Width = 25
          Height = 25
          Hint = 'Dividir'
          Caption = '/'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object BtElevar: TSpeedButton
          Left = 1
          Top = 152
          Width = 25
          Height = 25
          Hint = 'Elevação'
          Caption = '^'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtElevarClick
        end
        object BtRaiz: TSpeedButton
          Left = 1
          Top = 177
          Width = 25
          Height = 25
          Hint = 'Raiz Quadrada'
          Caption = 'sqrt'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtRaizClick
        end
        object BtArroba: TSpeedButton
          Left = 1
          Top = 252
          Width = 25
          Height = 25
          Hint = 'Coringa para Variáveis @'
          Caption = '@'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtArrobaClick
        end
        object BtTralha: TSpeedButton
          Left = 1
          Top = 277
          Width = 25
          Height = 25
          Hint = 'Coringa para Literias #'
          Caption = '#'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = BtTralhaClick
        end
      end
      object fcOutlookBar1: TfcOutlookBar
        Left = 1
        Top = 1
        Width = 161
        Height = 453
        ActivePage = fcShapeBtn5
        Align = alClient
        Animation.Enabled = True
        Animation.Interval = 1
        Animation.Steps = 7
        AutoBold = False
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ButtonSize = 18
        ButtonClassName = 'TfcShapeBtn'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = loVertical
        Options = [cboAutoCreateOutlookList]
        PanelAlignment = paDynamic
        ShowButtons = True
        TabOrder = 1
        OnChange = fcOpcoesChange
        object fcShapeBtn1: TfcShapeBtn
          Left = 0
          Top = 0
          Width = 157
          Height = 18
          Caption = 'Matemáticas'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcOutlookBar1fcShapeBtn6: TfcShapeBtn
          Left = 0
          Top = 18
          Width = 157
          Height = 18
          Caption = 'Texto'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 32
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn3: TfcShapeBtn
          Left = 0
          Top = 36
          Width = 157
          Height = 18
          Caption = 'Financeiras'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 5
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn4: TfcShapeBtn
          Left = 0
          Top = 54
          Width = 157
          Height = 18
          Caption = 'Data'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 2
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcOutlookBar1fcShapeBtn5: TfcShapeBtn
          Left = 0
          Top = 72
          Width = 157
          Height = 18
          Caption = 'Estátisticas'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 15
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcOutlookBar1fcShapeBtn2: TfcShapeBtn
          Left = 0
          Top = 90
          Width = 157
          Height = 18
          Caption = 'Banco de Dados'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 12
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn2: TfcShapeBtn
          Left = 0
          Top = 108
          Width = 157
          Height = 18
          Caption = 'Cadastro Previdenciário'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn5: TfcShapeBtn
          Left = 0
          Top = 126
          Width = 157
          Height = 18
          Caption = 'Beneficios'
          Color = clBtnFace
          DitherColor = clWhite
          Down = True
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 3
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcOutlookBar1fcShapeBtn4: TfcShapeBtn
          Left = 0
          Top = 287
          Width = 157
          Height = 18
          Caption = 'Índices e Impostos'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 14
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcOutlookBar1fcShapeBtn3: TfcShapeBtn
          Left = 0
          Top = 305
          Width = 157
          Height = 18
          Caption = 'Contribuições'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 13
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn6: TfcShapeBtn
          Left = 0
          Top = 323
          Width = 157
          Height = 18
          Caption = 'Rubricas Salariais'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 4
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn7: TfcShapeBtn
          Left = 0
          Top = 341
          Width = 157
          Height = 18
          Caption = 'Tab.Genérica/Longa'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 6
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn8: TfcShapeBtn
          Left = 0
          Top = 359
          Width = 157
          Height = 18
          Caption = 'Evolução Funcional'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 7
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn10: TfcShapeBtn
          Left = 0
          Top = 377
          Width = 157
          Height = 18
          Caption = 'Contagem de Tempos'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 8
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn11: TfcShapeBtn
          Left = 0
          Top = 395
          Width = 157
          Height = 18
          Caption = 'Investimentos e Empréstimos'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 9
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcShapeBtn12: TfcShapeBtn
          Left = 0
          Top = 413
          Width = 157
          Height = 18
          Caption = 'Imobiliário'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 10
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcOutlookBar1fcShapeBtn1: TfcShapeBtn
          Left = 0
          Top = 431
          Width = 157
          Height = 18
          Caption = 'Atuarial'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 11
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList1: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsItemHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphLeft
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ARITM'
                OnClick = fcOutlookList1Items0Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ELEVAÇÃO (^)'
                OnClick = fcOutlookList1Items1Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RAIZ (SQRT)'
                OnClick = fcOutlookList1Items2Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MULTIPLICAÇÃO (X)'
                OnClick = fcOutlookList1Items3Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMA (+)'
                OnClick = fcOutlookList1Items4Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SUBTRAÇÃO (-)'
                OnClick = fcOutlookList1Items5Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIVISÃO (/)'
                OnClick = fcOutlookList1Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ROUND'
                OnClick = fcOutlookList1Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TRUNC'
                OnClick = fcOutlookList1Items8Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookBar1OutlookList12: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ALINHA'
                OnClick = fcOutlookBar1OutlookList12Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CONCAT'
                OnClick = fcOutlookBar1OutlookList12Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EXTRAIR'
                OnClick = fcOutlookBar1OutlookList12Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FORMATAR'
                OnClick = fcOutlookBar1OutlookList12Items3Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList3: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FV'
                OnClick = fcOutlookList3Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NPMT'
                OnClick = fcOutlookList3Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PMT'
                OnClick = fcOutlookList3Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PV'
                OnClick = fcOutlookList3Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RATE'
                OnClick = fcOutlookList3Items4Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList4: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ANO'
                OnClick = fcOutlookList4Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CONVERTEDATA'
                OnClick = fcOutlookList4Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DATAREF'
                OnClick = fcOutlookList4Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIA'
                OnClick = fcOutlookList4Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIASDOMES'
                OnClick = fcOutlookList4Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIASFINAIS'
                OnClick = fcOutlookList4Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIASINICIAIS'
                OnClick = fcOutlookList4Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIAFINAL'
                OnClick = fcOutlookList4Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIAINICIAL'
                OnClick = fcOutlookList4Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIFANOS'
                OnClick = fcOutlookList4Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIFDIAS'
                OnClick = fcOutlookList4Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIFMESES'
                OnClick = fcOutlookList4Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EANO'
                OnClick = fcOutlookList4Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EDIA'
                OnClick = fcOutlookList4Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EMES'
                OnClick = fcOutlookList4Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'HOJE'
                OnClick = fcOutlookList4Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MES'
                OnClick = fcOutlookList4Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PARADATA'
                OnClick = fcOutlookList4Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SEMANA'
                OnClick = fcOutlookList4Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FERIADO'
                OnClick = fcOutlookList4Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ENTREDATAS'
                OnClick = fcOutlookList4Items20Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookBar1OutlookList11: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsItemHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MINIMO'
                OnClick = fcOutlookBar1OutlookList11Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MAXIMO'
                OnClick = fcOutlookBar1OutlookList11Items1Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookBar1OutlookList8: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAX'
                OnClick = fcOutlookBar1OutlookList8Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CAMPOSDESC'
                OnClick = fcOutlookBar1OutlookList8Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EXISTECAMPO'
                OnClick = fcOutlookBar1OutlookList8Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'REGATU'
                OnClick = fcOutlookBar1OutlookList8Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TOTREGS'
                OnClick = fcOutlookBar1OutlookList8Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCADETCALCULO'
                OnClick = fcOutlookList8Items20Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList2: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsItemHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SITPESSOA'
                OnClick = fcOutlookList2Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VERCONCEDIDO'
                OnClick = fcOutlookList2Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SITINTERNA'
                OnClick = fcOutlookList2Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SITBENEFICIO'
                OnClick = fcOutlookList2Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NIVEL'
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAMATRICULA'
                OnClick = fcOutlookList2Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORRESERVA'
                OnClick = fcOutlookList2Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PARAMPESSOA'
                OnClick = fcOutlookList2Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PLANOANTERIOR'
                OnClick = fcOutlookList2Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RMTRANSFERENCIA'
                OnClick = fcOutlookList2Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RESERVAORIGINAL'
                OnClick = fcOutlookList2Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'POSSUIMIGRACAO'
                OnClick = fcOutlookList2Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'OPBENEF'
                OnClick = fcOutlookList2Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'OPCONTRIB'
                OnClick = fcOutlookList2Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'OPPATRO'
                OnClick = fcOutlookList2Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMACOTASRESERVA'
                OnClick = fcOutlookList2Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAPLANO'
                OnClick = fcOutlookList2Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORPECULIO'
                OnClick = fcOutlookList2Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PARAMPESSOADTFIM'
                OnClick = fcOutlookList2Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EXISTERESERVA'
                OnClick = fcOutlookList2Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MOLESTIAGRAVE'
                OnClick = fcOutlookList2Items20Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 144
          Width = 157
          Height = 143
          object fcOutlookList5: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 143
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRBENEFICIO'
                OnClick = fcOutlookList5Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRBENEFICIOTOTAL'
                OnClick = fcOutlookList5Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMABENEFICIOS'
                OnClick = fcOutlookList5Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMAHSTBENEF'
                OnClick = fcOutlookList5Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MEDIAINSS'
                OnClick = fcOutlookList5Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMINSS'
                OnClick = fcOutlookList5Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SBINSS'
                OnClick = fcOutlookList5Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SORTINSS'
                OnClick = fcOutlookList5Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'REAJUSTAINSS'
                OnClick = fcOutlookList5Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FILTRAINSS'
                OnClick = fcOutlookList5Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORSRB'
                OnClick = fcOutlookList5Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORBENEFICIO'
                OnClick = fcOutlookList5Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAOPCAOBENEF'
                OnClick = fcOutlookList5Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'COMPARAVALBENEF'
                OnClick = fcOutlookList5Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORPECULIO'
                OnClick = fcOutlookList5Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORESBENEFICIO'
                OnClick = fcOutlookList5Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORBENEFICIOINICIAL'
                OnClick = fcOutlookList5Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NOVOCALCPENSAOSALDADA'
                OnClick = fcOutlookList5Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPORALIDADE'
                OnClick = fcOutlookList5Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PAGAPECULIOSALDADO'
                OnClick = fcOutlookList5Items19Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookBar1OutlookList10: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'IRRF'
                OnClick = fcOutlookBar1OutlookList10Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'INDICE'
                OnClick = fcOutlookBar1OutlookList10Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CORREÇÃO'
                OnClick = fcOutlookBar1OutlookList10Items2Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookBar1OutlookList9: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CP'
                OnClick = fcOutlookBar1OutlookList9Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMCONTRIB'
                OnClick = fcOutlookBar1OutlookList9Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMOCORRCONTRIB'
                OnClick = fcOutlookBar1OutlookList9Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VEROPCONTRIB'
                OnClick = fcOutlookBar1OutlookList9Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CPASSIST'
                OnClick = fcOutlookBar1OutlookList9Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DATACONTRIB'
                OnClick = fcOutlookBar1OutlookList9Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMACONTRIB'
                OnClick = fcOutlookBar1OutlookList9Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ULTDATACONTRIB'
                OnClick = fcOutlookBar1OutlookList9Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORBENEFICIOSALDADO'
                OnClick = fcOutlookBar1OutlookList9Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAMINFREQCAIXA'
                OnClick = fcOutlookBar1OutlookList9Items9Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList6: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MED'
                OnClick = fcOutlookList6Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NP'
                OnClick = fcOutlookList6Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMSALARIOS'
                OnClick = fcOutlookList6Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PR2'
                OnClick = fcOutlookList6Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PRO'
                OnClick = fcOutlookList6Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SALCONTRIB'
                OnClick = fcOutlookList6Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RUBRINDIV'
                OnClick = fcOutlookList6Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FREQSALARIO'
                OnClick = fcOutlookList6Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMARUBRICA'
                OnClick = fcOutlookList6Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MEDIARUBRICA'
                OnClick = fcOutlookList6Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAPERCENTUAL'
                OnClick = fcOutlookList6Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MEDPERCRUB'
                OnClick = fcOutlookList6Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMOCORRUB'
                OnClick = fcOutlookList6Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRRUBMES'
                OnClick = fcOutlookList6Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRREFRUBMES'
                OnClick = fcOutlookList6Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMACONJUNTORUBRICA'
                OnClick = fcOutlookList6Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RUBREEMBINSS'
                OnClick = fcOutlookList6Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RUBRINDIV13'
                OnClick = fcOutlookList6Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORRUBTMPDESC'
                OnClick = fcOutlookList6Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ABONOMES'
                OnClick = fcOutlookList6Items19Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList7: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TABGENERICA'
                OnClick = fcOutlookList7Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CONSULTA'
                OnClick = fcOutlookList7Items1Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList8: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NIVEL'
                OnClick = fcOutlookList8Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ADICIONALDIA'
                OnClick = fcOutlookList8Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ADICIONALMES'
                OnClick = fcOutlookList8Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAPCS'
                OnClick = fcOutlookList8Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CFPESSOA'
                OnClick = fcOutlookList8Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'GRUPOPESSOA'
                OnClick = fcOutlookList8Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MAIORCF'
                OnClick = fcOutlookList8Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NIVELPESSOA'
                OnClick = fcOutlookList8Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMDIASADICIONAL'
                OnClick = fcOutlookList8Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMDIASPERCADICIONAL'
                OnClick = fcOutlookList8Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PERCENTUALFUNCAO'
                OnClick = fcOutlookList8Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TOTALCFMES'
                OnClick = fcOutlookList8Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORCF'
                OnClick = fcOutlookList8Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VERFUNCAOPCC'
                OnClick = fcOutlookList8Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAFUNCAOADICCOMP'
                OnClick = fcOutlookList8Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'QTDMINUTOS'
                OnClick = fcOutlookList8Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CFPBC'
                OnClick = fcOutlookList8Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FUNDATAFINAL'
                OnClick = fcOutlookList8Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PERCFUNPBC'
                OnClick = fcOutlookList8Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRCF'
                OnClick = fcOutlookList8Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCADETCALCULO'
                OnClick = fcOutlookList8Items20Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRFAIXA'
                OnClick = fcOutlookList8Items21Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CTVA'
                OnClick = fcOutlookList8Items22Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ADICIONALPERC'
                OnClick = fcOutlookList8Items23Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DUPLICADETCALCULOTITULAR '
                OnClick = fcOutlookList8Items24Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FUNCAOCONFIANCA'
                OnClick = fcOutlookList8Items25Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MAIORCFCOD'
                OnClick = fcOutlookList8Items26Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EXCLUIDETCALCULO'
                OnClick = fcOutlookList8Items27Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORBENEFICIOINSS'
                OnClick = fcOutlookList8Items28Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORSRBNP'
                OnClick = fcOutlookList8Items29Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VWFORMRUBJUD'
                OnClick = fcOutlookList8Items30Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList10: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOPATRO'
                OnClick = fcOutlookList10Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOPLANO'
                OnClick = fcOutlookList10Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOAFAST'
                OnClick = fcOutlookList10Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOFUNDACAO'
                OnClick = fcOutlookList10Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMADIASBENEF'
                OnClick = fcOutlookList10Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ULTDATAEVENTO'
                OnClick = fcOutlookList10Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'QTDDIASCFPESSOA'
                OnClick = fcOutlookList10Items6Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList11: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'COTACAORENFIX'
                OnClick = fcOutlookList11Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PARCANTEP'
                OnClick = fcOutlookList11Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TOTALIZAITENSEP'
                OnClick = fcOutlookList11Items2Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object fcOutlookList12: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TOTALIZAINDICADOR'
                OnClick = fcOutlookList12Items0Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 157
          Height = 0
          object ATUARL: TfcOutlookList
            Left = 0
            Top = 0
            Width = 157
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ATUARIAL'
                OnClick = ATUARLItems0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TABBIO'
                OnClick = ATUARLItems1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TABSERV'
                OnClick = ATUARLItems2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TABPENSAO'
                OnClick = ATUARLItems3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'GRAVAMEMATUARIAL'
                OnClick = ATUARLItems4Click
              end>
            ItemSpacing = 4
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
    object Label1: TLabel [0]
      Left = 320
      Top = 4
      Width = 407
      Height = 19
      Align = alTop
      Caption = 'Para otimizar as suas Regras não esqueça de usar os "Coringas";'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel [1]
      Left = 320
      Top = 23
      Width = 352
      Height = 19
      Align = alTop
      Caption = '@ no caso de Variaveis e  # no caso de Palavras Literais.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = '`'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 244
      TabOrder = 1
      object sbtnCopiar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Procura de formulas, campos, variaveis'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 504
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 442
    Top = 127
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 374
    Top = 127
  end
  inherited ImlPadrao: TImageList
    Left = 408
    Top = 127
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 304
    Top = 127
  end
  inherited Cds: TCMClientDataSet
    Left = 340
    Top = 127
    object CdsIDFORMULA: TFloatField
      FieldName = 'IDFORMULA'
    end
    object CdsCODGRUPOFORMULA: TStringField
      FieldName = 'CODGRUPOFORMULA'
      FixedChar = True
      Size = 6
    end
    object CdsEXPRESSAOFORMULA: TStringField
      FieldName = 'EXPRESSAOFORMULA'
      Size = 255
    end
    object CdsDESCRICAOFORMULA: TStringField
      FieldName = 'DESCRICAOFORMULA'
      Size = 60
    end
    object CdsEXPRESSAOREAL: TStringField
      FieldName = 'EXPRESSAOREAL'
      Size = 255
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FORMULA.IDFORMULA'
      'FORMULA.DESCRICAOFORMULA'
      'GRPFORMULA.DESCGRUPOFORMULA'
      'FORMULA.EXPRESSAOREAL')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição da Fórmula'
      'Grupo de Fórmulas'
      'Expressão Real')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FORMULA'
      'GRPFORMULA')
    CamposChave.Strings = (
      'FORMULA.IDFORMULA')
    Filtro.Strings = (
      'FORMULA.CODGRUPOFORMULA = GRPFORMULA.CODGRUPOFORMULA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '40'
      '255')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 272
    Top = 127
  end
  object DsGrpFormula: TwwDataSource
    AutoEdit = False
    Left = 486
    Top = 127
  end
  object CdsGrpFormula: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 516
    Top = 127
    object CdsGrpFormulaCODGRUPOFORMULA: TStringField
      FieldName = 'CODGRUPOFORMULA'
      FixedChar = True
      Size = 6
    end
    object CdsGrpFormulaDESCGRUPOFORMULA: TStringField
      FieldName = 'DESCGRUPOFORMULA'
      Size = 40
    end
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 548
    Top = 127
  end
end
