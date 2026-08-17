inherited frmLerRegrasPlano: TfrmLerRegrasPlano
  Left = 117
  Top = 13
  Caption = 'Parâmetros para Associação do Plano à Patrocinadora'
  ClientHeight = 422
  ClientWidth = 688
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 688
    Height = 383
    object GroupBox2: TGroupBox
      Left = 8
      Top = 6
      Width = 659
      Height = 59
      TabOrder = 0
      object lblPatrocinadora: TLabel
        Left = 11
        Top = 15
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblPlano: TLabel
        Left = 11
        Top = 35
        Width = 45
        Height = 13
        Caption = 'Rubrica'
      end
    end
    object pgctrlInformacoes: TPageControl
      Left = 9
      Top = 68
      Width = 664
      Height = 308
      ActivePage = tbsRegras
      TabOrder = 1
      object tbsinformacoes: TTabSheet
        Caption = 'Informações'
        object GroupBox1: TGroupBox
          Left = 2
          Top = 16
          Width = 295
          Height = 73
          Caption = ' Adesão da Patrocinadora ao Plano '
          TabOrder = 0
          object Label6: TLabel
            Left = 8
            Top = 18
            Width = 74
            Height = 13
            Caption = 'Data Adesão'
          end
          object Label7: TLabel
            Left = 161
            Top = 18
            Width = 100
            Height = 13
            Caption = 'Número Inscrição'
          end
          object dbedNumContrato: TwwDBEdit
            Left = 161
            Top = 31
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnChange = dbedNumContratoChange
          end
          object dbdtDataInsc: TCMDateTimePicker
            Left = 8
            Top = 31
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 0
            OnChange = dbdtDataInscChange
          end
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 91
          Width = 295
          Height = 49
          TabOrder = 1
          object Label21: TLabel
            Left = 6
            Top = 9
            Width = 61
            Height = 13
            Caption = 'Calendário'
          end
          object dblkpcmbCalend: TwwDBLookupCombo
            Left = 6
            Top = 23
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Calendário')
            DataField = 'IDCALENDARIO'
            LookupTable = qryCalendario
            LookupField = 'IDCALENDARIO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbCalendChange
          end
        end
        object GroupBox6: TGroupBox
          Left = 306
          Top = 16
          Width = 349
          Height = 73
          Caption = 'Gerais'
          TabOrder = 2
          object ckUsarRubricas: TCheckBox
            Left = 8
            Top = 21
            Width = 319
            Height = 17
            Caption = 'Usar Rubricas Individuais no Salário de Manutenção '
            TabOrder = 0
          end
          object ckRecalcMP: TCheckBox
            Left = 8
            Top = 49
            Width = 315
            Height = 17
            Caption = 'Recalcular Mensalmente Salário do Mantido Parcial '
            TabOrder = 1
          end
        end
        object grpInterface: TGroupBox
          Left = 306
          Top = 91
          Width = 349
          Height = 78
          Caption = 'Interface'
          TabOrder = 3
          object rgrpReceContrib: TRadioGroup
            Left = 5
            Top = 15
            Width = 338
            Height = 52
            Caption = 'Recebe contribuições da patrocinadora no Interface'
            ItemIndex = 0
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 0
          end
        end
        object chkGravaTodasRubManut: TCheckBox
          Left = 4
          Top = 178
          Width = 438
          Height = 17
          Caption = 
            'Rubricas do salário de manutenção devem ser gravadas separadamen' +
            'te'
          TabOrder = 4
          OnClick = chkGravaTodasRubManutClick
        end
      end
      object tbsRegras: TTabSheet
        Caption = 'Regras'
        object GroupBox3: TGroupBox
          Left = 2
          Top = 7
          Width = 317
          Height = 126
          Caption = ' Outras Regras '
          TabOrder = 0
          object Label11: TLabel
            Left = 6
            Top = 15
            Width = 200
            Height = 13
            Caption = 'Regra de Cálculo de Salário Virtual'
          end
          object Label9: TLabel
            Left = 6
            Top = 54
            Width = 209
            Height = 13
            Caption = 'Regra de Cálculo do Enquadramento'
          end
          object dblkpcmbRegraCalcSalAuxDoenca: TwwDBLookupCombo
            Left = 6
            Top = 29
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraCalcSalAuxDoencaChange
          end
          object dblkpcmbRegraEnquadramento: TwwDBLookupCombo
            Left = 6
            Top = 68
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraEnquadramentoChange
          end
        end
        object gpRegraAfast: TGroupBox
          Left = 2
          Top = 145
          Width = 317
          Height = 134
          Caption = ' Regras para Afastamento '
          TabOrder = 1
          object Label4: TLabel
            Left = 6
            Top = 21
            Width = 276
            Height = 13
            Caption = 'Regra de Validação para Tempo de Afastamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 6
            Top = 57
            Width = 277
            Height = 13
            Caption = 'Regra de Validação para Tempo de Contribuição'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 6
            Top = 96
            Width = 301
            Height = 13
            Caption = 'Regra de Elegibilidade para Afastamento sem Manut.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkpcmbRegraValidaAfast: TwwDBLookupCombo
            Left = 6
            Top = 35
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraValidaAfastChange
          end
          object dblkpcmbRegraTempoContrib: TwwDBLookupCombo
            Left = 6
            Top = 70
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraTempoContribChange
          end
          object dblkpcmbRegraElegAfast: TwwDBLookupCombo
            Left = 6
            Top = 109
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraElegAfastChange
          end
        end
        object GroupBox4: TGroupBox
          Left = 335
          Top = 7
          Width = 317
          Height = 63
          Caption = ' Regra para Manutenção com Saldo de Contas '
          TabOrder = 2
          object Label14: TLabel
            Left = 9
            Top = 20
            Width = 119
            Height = 13
            Caption = 'Regra de Concessão'
          end
          object dblkpcmbRegraManutSaldo: TwwDBLookupCombo
            Left = 9
            Top = 33
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraManutSaldoChange
          end
        end
        object gpConcessao: TGroupBox
          Left = 335
          Top = 71
          Width = 317
          Height = 102
          Caption = ' Regra para Manutenção Integral '
          TabOrder = 3
          object lbl4: TLabel
            Left = 9
            Top = 17
            Width = 211
            Height = 13
            Caption = 'Regra de Concessão de Manutenção'
          end
          object Label2: TLabel
            Left = 9
            Top = 55
            Width = 252
            Height = 13
            Caption = 'Regra de Cálculo de Salário de Manutenção'
          end
          object dblkpcmbRegraManutencao: TwwDBLookupCombo
            Left = 9
            Top = 32
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'#9'F'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraManutencaoChange
          end
          object dblkpcmbRegraCalcSalManut: TwwDBLookupCombo
            Left = 9
            Top = 71
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraCalcSalManutChange
          end
        end
        object gpCalculo: TGroupBox
          Left = 335
          Top = 177
          Width = 317
          Height = 102
          Caption = ' Regra para Manutenção Parcial '
          TabOrder = 4
          object Label3: TLabel
            Left = 9
            Top = 61
            Width = 252
            Height = 13
            Caption = 'Regra de Cálculo de Salário de Manutenção'
          end
          object Label1: TLabel
            Left = 9
            Top = 22
            Width = 229
            Height = 13
            Caption = 'Regra de Concessão de Mantido Parcial'
          end
          object dblkpcmbRegraManutencaoParcial: TwwDBLookupCombo
            Left = 9
            Top = 37
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraManutencaoParcialChange
          end
          object dblkpcmbRegraCalcSalManutParc: TwwDBLookupCombo
            Left = 9
            Top = 74
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra'
              'IDREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbRegraCalcSalManutParcChange
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 688
    inherited tb97Fundo: TToolbar97
      Left = 506
      DockPos = 506
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 338
      DockPos = 338
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 147
  end
  object qryRegra: TwwQuery
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 205
    Top = 9
  end
  object qryDis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPDISTCOMISSAO')
    ValidateWithMask = True
    Left = 266
    Top = 19
  end
  object qryEst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPESTCOMISSAO'
      '')
    ValidateWithMask = True
    Left = 328
    Top = 17
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 419
    Top = 3
  end
  object qryCalendario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDCALENDARIO,NOME'
      'FROM     CALENDPREV'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 508
    Top = 6
    object qryCalendarioNOME: TStringField
      DisplayLabel = 'Calendário'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryCalendarioIDCALENDARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCALENDARIO'
      Visible = False
    end
  end
end
