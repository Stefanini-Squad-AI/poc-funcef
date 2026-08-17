inherited frmPedeOpcoesContrib: TfrmPedeOpcoesContrib
  Left = 50
  Top = 63
  Caption = 'Especificar características das opções de contribuição'
  ClientHeight = 472
  ClientWidth = 673
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 673
    Height = 433
    object grpRegraValida: TGroupBox
      Left = 7
      Top = 198
      Width = 322
      Height = 121
      TabOrder = 2
      object lblOp1: TLabel
        Left = 7
        Top = 8
        Width = 183
        Height = 13
        Caption = 'Regra de Validação da Opção 1'
      end
      object lblOp2: TLabel
        Left = 7
        Top = 44
        Width = 183
        Height = 13
        Caption = 'Regra de Validação da Opção 2'
      end
      object lblOp3: TLabel
        Left = 7
        Top = 81
        Width = 183
        Height = 13
        Caption = 'Regra de Validação da Opção 3'
      end
      object dblkpcmbRegraValidaOp1: TwwDBLookupCombo
        Left = 7
        Top = 21
        Width = 306
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRegraValidaOp1CloseUp
        OnExit = dblkpcmbRegraValidaOp1Exit
      end
      object dblkpcmbRegraValidaOp2: TwwDBLookupCombo
        Left = 7
        Top = 57
        Width = 306
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRegraValidaOp2CloseUp
        OnExit = dblkpcmbRegraValidaOp2Exit
      end
      object dblkpcmbRegraValidaOp3: TwwDBLookupCombo
        Left = 7
        Top = 94
        Width = 306
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRegraValidaOp3CloseUp
        OnExit = dblkpcmbRegraValidaOp3Exit
      end
    end
    object grpOpContrib: TGroupBox
      Left = 6
      Top = 90
      Width = 663
      Height = 108
      TabOrder = 1
      object pnlNOpcoes: TPanel
        Left = 9
        Top = 10
        Width = 448
        Height = 45
        TabOrder = 0
        object lblnumopcoes: TLabel
          Left = 7
          Top = 3
          Width = 109
          Height = 13
          Caption = 'Número de Opções'
        end
        object Label1: TLabel
          Left = 165
          Top = 3
          Width = 84
          Height = 13
          Caption = 'Tempo Mínimo'
        end
        object Label3: TLabel
          Left = 269
          Top = 27
          Width = 36
          Height = 13
          Caption = 'meses'
        end
        object spedNumOpcoes: TSpinEdit
          Left = 7
          Top = 17
          Width = 112
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 3
          MinValue = 0
          ParentFont = False
          TabOrder = 0
          Value = 1
          OnChange = spedNumOpcoesChange
        end
        object spedTempoOpcao: TSpinEdit
          Left = 165
          Top = 17
          Width = 100
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 1
        end
      end
      object pnlMesAno: TPanel
        Left = 9
        Top = 58
        Width = 448
        Height = 45
        TabOrder = 1
        object Label2: TLabel
          Left = 5
          Top = 4
          Width = 305
          Height = 13
          Caption = 'Mês e Ano de Referência do Início do Tempo Mínimo'
        end
        object cmbMesRefOpcao: TComboBox
          Left = 5
          Top = 18
          Width = 82
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro')
        end
        object spedAnoRefOpcao: TSpinEdit
          Left = 102
          Top = 17
          Width = 55
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 1998
        end
      end
    end
    object pnlTitulo: TPanel
      Left = 5
      Top = 5
      Width = 663
      Height = 84
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblContribuicao: TLabel
        Left = 7
        Top = 42
        Width = 72
        Height = 13
        Caption = 'Contribuição'
      end
      object lblPlano: TLabel
        Left = 7
        Top = 5
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object edPlano: TEdit
        Left = 7
        Top = 17
        Width = 384
        Height = 21
        TabOrder = 0
      end
      object edContribuicao: TEdit
        Left = 7
        Top = 54
        Width = 384
        Height = 21
        TabOrder = 1
      end
    end
    object grpRegraCalculo: TGroupBox
      Left = 335
      Top = 198
      Width = 330
      Height = 121
      TabOrder = 3
      object Label4: TLabel
        Left = 7
        Top = 8
        Width = 169
        Height = 13
        Caption = 'Regra de Cálculo da Opção 1'
      end
      object Label5: TLabel
        Left = 7
        Top = 44
        Width = 169
        Height = 13
        Caption = 'Regra de Cálculo da Opção 2'
      end
      object Label6: TLabel
        Left = 7
        Top = 79
        Width = 169
        Height = 13
        Caption = 'Regra de Cálculo da Opção 3'
      end
      object dblkpcmbRegraCalcOp1: TwwDBLookupCombo
        Left = 7
        Top = 21
        Width = 280
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRegraCalcOp1CloseUp
        OnExit = dblkpcmbRegraCalcOp1Exit
      end
      object dblkpcmbRegraCalcOp2: TwwDBLookupCombo
        Left = 7
        Top = 57
        Width = 280
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRegraCalcOp2CloseUp
        OnExit = dblkpcmbRegraCalcOp2Exit
      end
      object dblkpcmbRegraCalcOp3: TwwDBLookupCombo
        Left = 7
        Top = 92
        Width = 280
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRegraCalcOp3CloseUp
        OnExit = dblkpcmbRegraCalcOp3Exit
      end
    end
    object pnlDescricaoOpcao: TPanel
      Left = 6
      Top = 325
      Width = 662
      Height = 98
      TabOrder = 4
      object Label7: TLabel
        Left = 6
        Top = 11
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 1'
      end
      object Label8: TLabel
        Left = 6
        Top = 41
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 2'
      end
      object Label9: TLabel
        Left = 6
        Top = 70
        Width = 128
        Height = 13
        Caption = 'Descrição da Opção 3'
      end
      object sbCop1: TSpeedButton
        Left = 418
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Copiar opções entre contribuições'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCop1Click
      end
      object sbCop2: TSpeedButton
        Left = 418
        Top = 35
        Width = 25
        Height = 25
        Hint = 'Copiar opções entre contribuições'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCop2Click
      end
      object sbCop3: TSpeedButton
        Left = 418
        Top = 67
        Width = 25
        Height = 25
        Hint = 'Copiar opções entre contribuições'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCop3Click
      end
      object edNomeValorBase1: TEdit
        Left = 138
        Top = 7
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edNomeValorBase2: TEdit
        Left = 138
        Top = 37
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edNomeValorBase3: TEdit
        Left = 138
        Top = 66
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ckFlgObrigaOp1: TCheckBox
        Left = 466
        Top = 9
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 3
      end
      object ckFlgObrigaOp2: TCheckBox
        Left = 466
        Top = 38
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 4
      end
      object ckFlgObrigaOp3: TCheckBox
        Left = 466
        Top = 69
        Width = 87
        Height = 17
        Caption = 'Obrigatória'
        TabOrder = 5
      end
      object ckAlteraOp1: TCheckBox
        Left = 559
        Top = 9
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 6
      end
      object ckAlteraOp2: TCheckBox
        Left = 559
        Top = 38
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 7
      end
      object ckAlteraOp3: TCheckBox
        Left = 559
        Top = 69
        Width = 96
        Height = 17
        Caption = 'Pode Alterar '
        TabOrder = 8
      end
    end
    object plnAssocContribOpcao: TPanel
      Left = 549
      Top = -289
      Width = 513
      Height = 399
      TabOrder = 5
      Visible = False
      OnExit = plnAssocContribOpcaoExit
      object Label11: TLabel
        Left = 16
        Top = 114
        Width = 284
        Height = 23
        AutoSize = False
        Caption = 'Informar Opção para Cópia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 14
        Top = 27
        Width = 491
        Height = 84
        TabOrder = 0
        object lblOpcao: TLabel
          Left = 11
          Top = 58
          Width = 62
          Height = 20
          Caption = 'lblOpcao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblContrib: TLabel
          Left = 11
          Top = 20
          Width = 66
          Height = 20
          Caption = 'lblContrib'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 11
          Top = 8
          Width = 72
          Height = 13
          Caption = 'Contribuição'
        end
        object Label14: TLabel
          Left = 11
          Top = 46
          Width = 38
          Height = 13
          Caption = 'Opção'
        end
      end
      object Panel2: TPanel
        Left = 8
        Top = 137
        Width = 497
        Height = 216
        TabOrder = 1
        object Label12: TLabel
          Left = 13
          Top = 13
          Width = 72
          Height = 13
          Caption = 'Contribuição'
        end
        object sbOpcao: TSpeedButton
          Left = 466
          Top = 26
          Width = 25
          Height = 25
          Hint = 'Selecionar opções'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
            0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
            00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
            00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
            F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
            F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
            FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
            0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
            00337777FFFF77FF7733EEEE0000000003337777777777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbOpcaoClick
        end
        object Label13: TLabel
          Left = 10
          Top = 54
          Width = 183
          Height = 13
          Caption = ' Opção selecionada para Cópia '
        end
        object dblkpcmbContribuicao: TwwDBLookupCombo
          Left = 13
          Top = 27
          Width = 443
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Contribuição')
          LookupTable = qryContribuicao
          LookupField = 'IDCONTRIBUICAO'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object rgOpcoes: TRadioGroup
          Left = 14
          Top = 109
          Width = 442
          Height = 89
          Caption = ' Opções a selecionar '
          Items.Strings = (
            'DescOpcao1'
            'DescOpcao2'
            'DescOpcap3')
          TabOrder = 1
          OnClick = rgOpcoesClick
        end
        object edOpcaoSelecionada: TEdit
          Left = 13
          Top = 66
          Width = 442
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object btnCancelAssoc: TBitBtn
        Left = 343
        Top = 358
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        TabOrder = 2
        OnClick = btnCancelAssocClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object btnOkAssoc: TBitBtn
        Left = 261
        Top = 358
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        TabOrder = 3
        OnClick = btnOkAssocClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object btnSairAssoc: TBitBtn
        Left = 426
        Top = 358
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Sair'
        TabOrder = 4
        OnClick = btnSairAssocClick
        Glyph.Data = {
          F6010000424DF601000000000000760000002800000030000000100000000100
          0400000000008001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
          8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
          FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
          8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
          6087777770F8F0E6608777777066666668777777007770E660877777007770E6
          608777777066666668777777007770E660877777007770E66087777770666666
          68777788060770E760877788060770E76087777770666666687770000E6070E0
          608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
          608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
          687770000E6070E6608770000E6070E6608777777066666668777777060770E6
          60877777060770E66087777770666666687777770077770E608777770077770E
          60877777706666666877777770777770E087777770777770E087777770666666
          687777777000000000777777700000000077777770EEEEEEE877}
        NumGlyphs = 3
        Spacing = 2
      end
      object Panel3: TPanel
        Left = -9
        Top = 1
        Width = 521
        Height = 21
        Alignment = taLeftJustify
        Caption = '  Associação de Opcões entre Contribuições'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 673
    inherited tb97Fundo: TToolbar97
      Left = 411
      DockPos = 411
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 243
      DockPos = 243
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 35
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from regra order by nomeregra')
    ValidateWithMask = True
    Left = 304
    Top = 61
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 263
    Top = 73
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  C.IDCONTRIBUICAO,     C .NOME,  CP.NOMEVALORBASE1, '
      '      CP.NOMEVALORBASE2, CP.NOMEVALORBASE3,'
      '      CP.FLGACEITAOPCAO, CP.NUMOPCOES '
      'FROM   CONTRIBUICAO C, CONTPREV CP'
      'WHERE CP.IDPLANOPREV    =  :IDPLANOPREV'
      'AND       CP.NUMOPCOES  >= 1 '
      'AND       CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 346
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
