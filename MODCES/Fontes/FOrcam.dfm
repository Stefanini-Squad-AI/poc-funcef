inherited frmOrcam: TfrmOrcam
  Left = 108
  Top = 152
  Caption = 'Orçamento do Custo de Pessoal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl [0]
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            inherited cbxCandidatos: TCheckBox
              Enabled = False
            end
          end
          inherited gbxSituacao: TGroupBox
            inherited cbxDemitidos: TCheckBox
              Enabled = False
            end
          end
          inherited rgSequencia: TGroupBox [2]
          end
          inherited gbxTempAdm: TGroupBox [3]
          end
          inherited gbxTempLot: TGroupBox [4]
          end
          inherited gbxSalario: TGroupBox [5]
          end
          inherited gbxTipoSal: TGroupBox [6]
          end
          inherited gbxTempCar: TGroupBox [7]
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxLotacao: TGroupBox [2]
          end
          inherited rgSelSindi: TRadioGroup [3]
          end
          inherited gbxEstab: TGroupBox [4]
          end
          inherited gbxCargo: TGroupBox [5]
          end
          inherited rgSelRamo: TRadioGroup [6]
          end
          inherited gbxSindi: TGroupBox [7]
          end
        end
      end
      inherited pnResult: TPanel [1]
        object gbxResult: TGroupBox
          Left = 1
          Top = 1
          Width = 602
          Height = 314
          Hint = 'Valores Limites e Respectivos % de Aumento'
          Align = alClient
          Caption = 'Resultado'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = False
          object Label9: TLabel
            Left = 25
            Top = 61
            Width = 35
            Height = 13
            Caption = 'Mês 3'
          end
          object Label10: TLabel
            Left = 25
            Top = 79
            Width = 35
            Height = 13
            Caption = 'Mês 4'
          end
          object Label11: TLabel
            Left = 25
            Top = 97
            Width = 35
            Height = 13
            Caption = 'Mês 5'
          end
          object Label12: TLabel
            Left = 25
            Top = 115
            Width = 35
            Height = 13
            Caption = 'Mês 6'
          end
          object Label13: TLabel
            Left = 25
            Top = 133
            Width = 35
            Height = 13
            Caption = 'Mês 7'
          end
          object Label14: TLabel
            Left = 25
            Top = 151
            Width = 35
            Height = 13
            Caption = 'Mês 8'
          end
          object Label16: TLabel
            Left = 102
            Top = 9
            Width = 48
            Height = 13
            Caption = 'Pessoas'
          end
          object Label17: TLabel
            Left = 291
            Top = 9
            Width = 62
            Height = 13
            Caption = 'Benefícios'
          end
          object Label18: TLabel
            Left = 405
            Top = 9
            Width = 54
            Height = 13
            Caption = 'Encargos'
          end
          object Label19: TLabel
            Left = 520
            Top = 9
            Width = 30
            Height = 13
            Caption = 'Total'
          end
          object Label20: TLabel
            Left = 25
            Top = 245
            Width = 36
            Height = 13
            Caption = 'Totais'
          end
          object Label15: TLabel
            Left = 195
            Top = 9
            Width = 46
            Height = 13
            Caption = 'Salários'
          end
          object Label21: TLabel
            Left = 25
            Top = 169
            Width = 35
            Height = 13
            Caption = 'Mês 9'
          end
          object Label22: TLabel
            Left = 25
            Top = 187
            Width = 42
            Height = 13
            Caption = 'Mês 10'
          end
          object Label23: TLabel
            Left = 25
            Top = 205
            Width = 42
            Height = 13
            Caption = 'Mês 11'
          end
          object Label24: TLabel
            Left = 25
            Top = 223
            Width = 42
            Height = 13
            Caption = 'Mês 12'
          end
          object lblAcum: TLabel
            Left = 25
            Top = 271
            Width = 63
            Height = 13
            Caption = 'Acumulado'
          end
          object Label25: TLabel
            Left = 25
            Top = 28
            Width = 35
            Height = 13
            Caption = 'Mês 1'
          end
          object Label26: TLabel
            Left = 25
            Top = 45
            Width = 35
            Height = 13
            Caption = 'Mês 2'
          end
          object ednPes1: TEditNum
            Tag = 1
            Left = 93
            Top = 24
            Width = 64
            Height = 21
            TabOrder = 0
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal1: TEditNum
            Tag = 13
            Left = 174
            Top = 24
            Width = 88
            Height = 21
            TabOrder = 1
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal2: TEditNum
            Tag = 14
            Left = 174
            Top = 42
            Width = 88
            Height = 21
            TabOrder = 3
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes2: TEditNum
            Tag = 2
            Left = 93
            Top = 42
            Width = 64
            Height = 21
            TabOrder = 2
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal3: TEditNum
            Tag = 15
            Left = 174
            Top = 60
            Width = 88
            Height = 21
            TabOrder = 5
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes3: TEditNum
            Tag = 3
            Left = 93
            Top = 60
            Width = 64
            Height = 21
            TabOrder = 4
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal4: TEditNum
            Tag = 16
            Left = 174
            Top = 78
            Width = 88
            Height = 21
            TabOrder = 7
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes4: TEditNum
            Tag = 4
            Left = 93
            Top = 78
            Width = 64
            Height = 21
            TabOrder = 6
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal5: TEditNum
            Tag = 17
            Left = 174
            Top = 96
            Width = 88
            Height = 21
            TabOrder = 9
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes5: TEditNum
            Tag = 5
            Left = 93
            Top = 96
            Width = 64
            Height = 21
            TabOrder = 8
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal6: TEditNum
            Tag = 18
            Left = 174
            Top = 114
            Width = 88
            Height = 21
            TabOrder = 11
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes6: TEditNum
            Tag = 6
            Left = 93
            Top = 114
            Width = 64
            Height = 21
            TabOrder = 10
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal7: TEditNum
            Tag = 19
            Left = 174
            Top = 132
            Width = 88
            Height = 21
            TabOrder = 13
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes7: TEditNum
            Tag = 7
            Left = 93
            Top = 132
            Width = 64
            Height = 21
            TabOrder = 12
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal8: TEditNum
            Tag = 20
            Left = 174
            Top = 150
            Width = 88
            Height = 21
            TabOrder = 15
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes8: TEditNum
            Tag = 8
            Left = 93
            Top = 150
            Width = 64
            Height = 21
            TabOrder = 14
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen1: TEditNum
            Tag = 25
            Left = 276
            Top = 24
            Width = 88
            Height = 21
            TabOrder = 16
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen2: TEditNum
            Tag = 26
            Left = 276
            Top = 42
            Width = 88
            Height = 21
            TabOrder = 17
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen3: TEditNum
            Tag = 27
            Left = 276
            Top = 60
            Width = 88
            Height = 21
            TabOrder = 18
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen4: TEditNum
            Tag = 28
            Left = 276
            Top = 78
            Width = 88
            Height = 21
            TabOrder = 19
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen5: TEditNum
            Tag = 29
            Left = 276
            Top = 96
            Width = 88
            Height = 21
            TabOrder = 20
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen6: TEditNum
            Tag = 30
            Left = 276
            Top = 114
            Width = 88
            Height = 21
            TabOrder = 21
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen7: TEditNum
            Tag = 31
            Left = 276
            Top = 132
            Width = 88
            Height = 21
            TabOrder = 22
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen8: TEditNum
            Tag = 32
            Left = 276
            Top = 150
            Width = 88
            Height = 21
            TabOrder = 23
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc1: TEditNum
            Tag = 37
            Left = 387
            Top = 24
            Width = 88
            Height = 21
            TabOrder = 24
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc2: TEditNum
            Tag = 38
            Left = 387
            Top = 42
            Width = 88
            Height = 21
            TabOrder = 25
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc3: TEditNum
            Tag = 39
            Left = 387
            Top = 60
            Width = 88
            Height = 21
            TabOrder = 26
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc4: TEditNum
            Tag = 40
            Left = 387
            Top = 78
            Width = 88
            Height = 21
            TabOrder = 27
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc5: TEditNum
            Tag = 41
            Left = 387
            Top = 96
            Width = 88
            Height = 21
            TabOrder = 28
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc6: TEditNum
            Tag = 42
            Left = 387
            Top = 114
            Width = 88
            Height = 21
            TabOrder = 29
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc7: TEditNum
            Tag = 43
            Left = 387
            Top = 132
            Width = 88
            Height = 21
            TabOrder = 30
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc8: TEditNum
            Tag = 44
            Left = 387
            Top = 150
            Width = 88
            Height = 21
            TabOrder = 31
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes1: TEditNum
            Tag = 49
            Left = 492
            Top = 24
            Width = 88
            Height = 21
            TabOrder = 32
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes2: TEditNum
            Tag = 50
            Left = 492
            Top = 42
            Width = 88
            Height = 21
            TabOrder = 33
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes3: TEditNum
            Tag = 51
            Left = 492
            Top = 60
            Width = 88
            Height = 21
            TabOrder = 34
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes4: TEditNum
            Tag = 52
            Left = 492
            Top = 78
            Width = 88
            Height = 21
            TabOrder = 35
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes5: TEditNum
            Tag = 53
            Left = 492
            Top = 96
            Width = 88
            Height = 21
            TabOrder = 36
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes6: TEditNum
            Tag = 54
            Left = 492
            Top = 114
            Width = 88
            Height = 21
            TabOrder = 37
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes7: TEditNum
            Tag = 55
            Left = 492
            Top = 132
            Width = 88
            Height = 21
            TabOrder = 38
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes8: TEditNum
            Tag = 56
            Left = 492
            Top = 150
            Width = 88
            Height = 21
            TabOrder = 39
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednValTot: TEditNum
            Left = 174
            Top = 244
            Width = 88
            Height = 21
            TabOrder = 40
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBenTot: TEditNum
            Left = 276
            Top = 244
            Width = 88
            Height = 21
            TabOrder = 41
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEncTot: TEditNum
            Left = 387
            Top = 244
            Width = 88
            Height = 21
            TabOrder = 42
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednResTot: TEditNum
            Left = 492
            Top = 244
            Width = 88
            Height = 21
            TabOrder = 43
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes9: TEditNum
            Tag = 9
            Left = 93
            Top = 168
            Width = 64
            Height = 21
            TabOrder = 44
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes10: TEditNum
            Tag = 10
            Left = 93
            Top = 186
            Width = 64
            Height = 21
            TabOrder = 45
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes11: TEditNum
            Tag = 11
            Left = 93
            Top = 204
            Width = 64
            Height = 21
            TabOrder = 46
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPes12: TEditNum
            Tag = 12
            Left = 93
            Top = 222
            Width = 64
            Height = 21
            TabOrder = 47
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal9: TEditNum
            Tag = 21
            Left = 174
            Top = 168
            Width = 88
            Height = 21
            TabOrder = 48
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal10: TEditNum
            Tag = 22
            Left = 174
            Top = 186
            Width = 88
            Height = 21
            TabOrder = 49
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal11: TEditNum
            Tag = 23
            Left = 174
            Top = 204
            Width = 88
            Height = 21
            TabOrder = 50
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednVal12: TEditNum
            Tag = 24
            Left = 174
            Top = 222
            Width = 88
            Height = 21
            TabOrder = 51
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen9: TEditNum
            Tag = 33
            Left = 276
            Top = 168
            Width = 88
            Height = 21
            TabOrder = 52
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen10: TEditNum
            Tag = 34
            Left = 276
            Top = 186
            Width = 88
            Height = 21
            TabOrder = 53
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen11: TEditNum
            Tag = 35
            Left = 276
            Top = 204
            Width = 88
            Height = 21
            TabOrder = 54
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBen12: TEditNum
            Tag = 36
            Left = 276
            Top = 222
            Width = 88
            Height = 21
            TabOrder = 55
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc9: TEditNum
            Tag = 45
            Left = 387
            Top = 168
            Width = 88
            Height = 21
            TabOrder = 56
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc10: TEditNum
            Tag = 46
            Left = 387
            Top = 186
            Width = 88
            Height = 21
            TabOrder = 57
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc11: TEditNum
            Tag = 47
            Left = 387
            Top = 204
            Width = 88
            Height = 21
            TabOrder = 58
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEnc12: TEditNum
            Tag = 48
            Left = 387
            Top = 222
            Width = 88
            Height = 21
            TabOrder = 59
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes9: TEditNum
            Tag = 57
            Left = 492
            Top = 168
            Width = 88
            Height = 21
            TabOrder = 60
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes10: TEditNum
            Tag = 58
            Left = 492
            Top = 186
            Width = 88
            Height = 21
            TabOrder = 61
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes11: TEditNum
            Tag = 59
            Left = 492
            Top = 204
            Width = 88
            Height = 21
            TabOrder = 62
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednRes12: TEditNum
            Tag = 60
            Left = 492
            Top = 222
            Width = 88
            Height = 21
            TabOrder = 63
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPesTot: TEditNum
            Left = 93
            Top = 244
            Width = 64
            Height = 21
            TabOrder = 64
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednPesAcu: TEditNum
            Left = 93
            Top = 270
            Width = 64
            Height = 21
            TabOrder = 65
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednValAcu: TEditNum
            Left = 174
            Top = 270
            Width = 88
            Height = 21
            TabOrder = 66
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
            Alignment = taRightJustify
          end
          object ednBenAcu: TEditNum
            Left = 276
            Top = 270
            Width = 88
            Height = 21
            TabOrder = 67
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednEncAcu: TEditNum
            Left = 387
            Top = 270
            Width = 88
            Height = 21
            TabOrder = 68
            IntDigits = 12
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
          object ednResAcu: TEditNum
            Left = 492
            Top = 270
            Width = 88
            Height = 21
            TabOrder = 69
            IntDigits = 8
            Signal = False
            DecDigits = 2
            Numeric = True
            Alignment = taRightJustify
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
    object bbtnGrafico: TBitBtn
      Left = 3
      Top = 2
      Width = 75
      Height = 33
      Hint = 'Mostrar os valores em gráfico'
      Caption = '&Gráfico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = bbtnGraficoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnOrcamento: TBitBtn
      Left = 83
      Top = 4
      Width = 85
      Height = 33
      Hint = 'Gerar Integração para o Módulo de Orçamento'
      Caption = '&Orçamento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = bbtnOrcamentoClick
      Glyph.Data = {
        F6010000424DF60100000000000076000000280000001E000000180000000100
        0400000000008001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        0000000000007000000008888888888888888888888807000000070000078800
        000078800000780700000770BBB3770EEEE06770DDD0577070000770BBB3070E
        EEE06070DDD0507707000770BBB3000EEEE06000DDD0500000000770BBB3000E
        EEE06000DDD0500000000770BBB3000EEEE06000DDD0500000000770BBB3000E
        EEE06000DDD0500000000770BBB3000EEEE06000DDD0500000000770BBB3000E
        EEE06000DDD05000000007700003000EEEE06000DDD05000000007770BB0000E
        EEE06000DDD05000000007777000000EEEE06000DDD05000000007777000000E
        EEE06000DDD05000000007777000000EEEE06000DDD05000000007777000000E
        EEE0600000005000000000877000000EEEE0600000000000000000087000000E
        EEE0600000000000000000008000000000006000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      NumGlyphs = 2
    end
  end
  inherited tblPessoal: TwwQuery
    Left = 69
    Top = 137
  end
  inherited tblEstab: TwwQuery
    Left = 201
    Top = 183
  end
  object ds2: TwwDataSource
    DataSet = tblHstben
    Left = 470
    Top = 72
  end
  object tblHstben: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS,'
      '       RI.NUMOCORRENCIAS, RI.FLGPERMANENTE, RI.IDREGRACALCULO,'
      '       RI.VALORRUBRICA, RI.IDRUBRICA'
      'FROM   RUBRICAINDIV RI, PROVDESC PD'
      'WHERE  RI.IDPESSOA = :IdPessoa'
      'AND    PD.FLGCONSTAFOLHA = 0'
      'AND    PD.IDBENEFSALAR IS NOT NULL'
      'AND    RI.IDRUBRICA = PD.IDPROVENTO'
      'UNION'
      'SELECT PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,'
      
        '       0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACA' +
        'LCULO,'
      '       H.VALORPROVENTO AS VALORRUBRICA, H.IDRUBRICA'
      'FROM   HISTRUBSAL H, PROVDESC PD'
      'WHERE  H.IDPESSOA = :IdPessoa'
      
        'AND    H.MES = (select max(h.mes) from histrubsal h, provdesc pd' +
        ', paramrh p'
      '                where h.idmotivo = p.idmotivo'
      '                and   h.idrubrica = pd.idprovento'
      '                and   pd.idbenefsalar is not null)'
      'AND    PD.FLGCONSTAFOLHA = 1'
      'AND    PD.IDBENEFSALAR IS NOT NULL'
      'AND    H.IDRUBRICA = PD.IDPROVENTO'
      'ORDER BY 2 DESC'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 521
    Top = 50
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object tblHstbenDESCRICAO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'PROVDESC.DESCRICAO'
      Size = 130
    end
    object tblHstbenANOMESINICIO: TStringField
      DisplayLabel = 'A Partir de'
      DisplayWidth = 7
      FieldName = 'ANOMESINICIO'
      Origin = 'RUBRICAINDIV.ANOMESINICIO'
      Size = 7
    end
    object tblHstbenPARCELAS: TFloatField
      DisplayLabel = 'Parcelas'
      DisplayWidth = 10
      FieldName = 'PARCELAS'
      Origin = 'RUBRICAINDIV.PARCELAS'
    end
    object tblHstbenNUMOCORRENCIAS: TFloatField
      DisplayLabel = 'Ocorridas'
      DisplayWidth = 10
      FieldName = 'NUMOCORRENCIAS'
      Origin = 'RUBRICAINDIV.NUMOCORRENCIAS'
    end
    object tblHstbenVALORC: TFloatField
      DisplayLabel = 'Valor Mensal'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'VALORC'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object tblHstbenFLGPERMANENTE: TFloatField
      DisplayLabel = 'Permanente?'
      DisplayWidth = 10
      FieldName = 'FLGPERMANENTE'
      Origin = 'RUBRICAINDIV.FLGPERMANENTE'
    end
    object tblHstbenIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'RUBRICAINDIV.IDREGRACALCULO'
    end
    object tblHstbenVALORRUBRICA: TFloatField
      FieldName = 'VALORRUBRICA'
      Origin = 'RUBRICAINDIV.VALORRUBRICA'
    end
    object tblHstbenIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
  end
end
