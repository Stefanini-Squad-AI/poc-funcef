inherited frmGrafAtend: TfrmGrafAtend
  Left = 225
  Top = 179
  HelpContext = 190032
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Estatística de Atendimentos '
  ClientHeight = 395
  ClientWidth = 683
  ParentFont = True
  Position = poMainFormCenter
  PrintScale = poNone
  OnCloseQuery = FormCloseQuery
  OnKeyPress = nil
  OnMouseMove = nil
  OnPaint = nil
  OnResize = nil
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 30
    Top = 194
    Width = 38
    Height = 13
    Caption = 'Assunto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 683
    Height = 356
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 681
      Height = 354
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Seleção '
        TabVisible = False
        object Label1a: TLabel
          Left = 2
          Top = 43
          Width = 84
          Height = 13
          Caption = 'Patrocinadora '
        end
        object Label2a: TLabel
          Left = 2
          Top = 126
          Width = 59
          Height = 13
          Caption = 'Atendente'
        end
        object Label3: TLabel
          Left = 2
          Top = 167
          Width = 46
          Height = 13
          Caption = 'Assunto'
        end
        object Label6: TLabel
          Left = 2
          Top = 257
          Width = 37
          Height = 13
          Caption = 'Status'
        end
        object Label4: TLabel
          Left = 277
          Top = 211
          Width = 127
          Height = 13
          Caption = 'Forma de Atendimento'
        end
        object Label29: TLabel
          Left = 2
          Top = 83
          Width = 27
          Height = 13
          Caption = 'Filial'
        end
        object Label7: TLabel
          Left = 2
          Top = 2
          Width = 65
          Height = 13
          Caption = 'Data inicial'
        end
        object Label8: TLabel
          Left = 136
          Top = 2
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object Label9: TLabel
          Left = 277
          Top = 258
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label10: TLabel
          Left = 481
          Top = 258
          Width = 129
          Height = 13
          Caption = 'Situação na Fundação'
        end
        object Label11: TLabel
          Left = 481
          Top = 211
          Width = 124
          Height = 13
          Caption = 'Local de Atendimento'
        end
        object Label12: TLabel
          Left = 2
          Top = 211
          Width = 102
          Height = 13
          Caption = 'Grupo do Assunto'
        end
        object Label13: TLabel
          Left = 276
          Top = 312
          Width = 258
          Height = 13
          Caption = 'Qtd. Máx. de Assuntos ou Grupo de Assuntos'
        end
        object Label26: TLabel
          Left = 275
          Top = 3
          Width = 40
          Height = 13
          Caption = 'Cidade'
        end
        object Label1: TLabel
          Left = 488
          Top = 20
          Width = 123
          Height = 13
          Caption = 'Qtd. Máx. de Cidades'
        end
        object fcLabel1: TfcLabel
          Left = 2
          Top = 308
          Width = 255
          Height = 26
          AutoSize = False
          Caption = 
            'Atenção: O número de linhas apresentadas na legenda é limitado a' +
            ' 43.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.HighlightColor = clWhite
          TextOptions.LineSpacing = 0
          TextOptions.ShadeColor = clScrollBar
          TextOptions.Shadow.YOffset = 2
          TextOptions.VAlignment = vaTop
          TextOptions.WordWrap = True
          Transparent = True
        end
        object RgOpcoes: TRadioGroup
          Left = 275
          Top = 54
          Width = 310
          Height = 81
          Caption = 'Opções'
          Color = clBtnFace
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Assunto'
            'Atendente'
            'Status'
            'Forma Atend.'
            'Patrocinadora'
            'Local de Atendimento'
            'Grupo de Assunto'
            'Cidades')
          ParentColor = False
          TabOrder = 11
          TabStop = True
          OnClick = RgOpcoesClick
        end
        object rdgrpmodo: TRadioGroup
          Left = 2
          Top = 442
          Width = 255
          Height = 62
          Caption = 'Modo de  Apresentação'
          Color = clBtnFace
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '%'
            '% do Total'
            'Valor'
            'Outro')
          ParentColor = False
          TabOrder = 8
          TabStop = True
          Visible = False
        end
        object rdgrgraf: TRadioGroup
          Left = 592
          Top = 54
          Width = 74
          Height = 81
          Caption = 'Gráfico'
          Color = clBtnFace
          ItemIndex = 0
          Items.Strings = (
            'Pizza'
            'Barras')
          ParentColor = False
          TabOrder = 12
          TabStop = True
        end
        object cmbPatro: TwwDBLookupCombo
          Left = 2
          Top = 58
          Width = 255
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qrypatro
          LookupField = 'IDPESSOA'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbAtend: TwwDBLookupCombo
          Left = 2
          Top = 141
          Width = 255
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEUSUARIO'#9'20'#9'NOMEUSUARIO')
          LookupTable = qryatend
          LookupField = 'IDUSUARIO'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbAssunto: TwwDBLookupCombo
          Left = 2
          Top = 182
          Width = 255
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryassunto
          LookupField = 'IDASSUNTO'
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbForma: TwwDBLookupCombo
          Left = 277
          Top = 227
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryformaatend
          LookupField = 'IDTIPOATEND'
          TabOrder = 14
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbStatus: TComboBox
          Left = 2
          Top = 272
          Width = 255
          Height = 21
          ItemHeight = 13
          Sorted = True
          TabOrder = 7
          Items.Strings = (
            'Cancelado'
            'Concluído'
            'Pendente')
        end
        object cmbFilial: TwwDBLookupCombo
          Left = 2
          Top = 99
          Width = 255
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryfilial
          LookupField = 'IDPESSOA'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object DataIni: TCMDateTimePicker
          Left = 2
          Top = 16
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
        end
        object DataFin: TCMDateTimePicker
          Left = 136
          Top = 16
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
          TabOrder = 1
        end
        object cmbPlanPrev: TwwDBLookupCombo
          Left = 277
          Top = 273
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Nome'
            'IDPLANOPREV'#9'10'#9'IDPLANOPREV')
          LookupTable = QryPlanPrev
          LookupField = 'IDPLANOPREV'
          TabOrder = 16
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbSitcad: TwwDBLookupCombo
          Left = 481
          Top = 273
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'
            'IDSITPART'#9'10'#9'IDSITPART')
          LookupTable = QrySituCad
          LookupField = 'IDSITPART'
          TabOrder = 17
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbLocal: TCMDBLookupCombo
          Left = 481
          Top = 226
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCLOCALATEND'#9'60'#9'Local de Atendimento')
          LookupTable = qryLocalAtend
          LookupField = 'IDLOCALATEND'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 15
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object cmbGrupoAssunto: TwwDBLookupCombo
          Left = 2
          Top = 227
          Width = 255
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCGRUPOASSUNTO'#9'60'#9'Descrição')
          LookupTable = QryGrupoAssunto
          LookupField = 'IDGRUPOASSUNTO'
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbLocalEnter
        end
        object wwSpinEdit: TwwDBSpinEdit
          Left = 538
          Top = 308
          Width = 50
          Height = 21
          EditorEnabled = False
          Increment = 1
          MaxValue = 43
          MinValue = 1
          Value = 15
          TabOrder = 18
          UnboundDataType = wwDefault
        end
        object dblkCidade: TwwDBLookupCombo
          Left = 274
          Top = 16
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'NOME'#9'F')
          DataField = 'CIDADESOLIC'
          LookupTable = qryCidades
          LookupField = 'IDCIDADES'
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBSpinEditQtdCidades: TwwDBSpinEdit
          Left = 616
          Top = 16
          Width = 50
          Height = 21
          EditorEnabled = False
          Increment = 1
          MaxValue = 15
          MinValue = 1
          Value = 10
          TabOrder = 10
          UnboundDataType = wwDefault
        end
        object rgrpExibir: TRadioGroup
          Left = 276
          Top = 145
          Width = 390
          Height = 58
          Caption = 'Exibir tempo...'
          ItemIndex = 0
          Items.Strings = (
            '...em segundos.'
            '...em horas, minutos e segundos.')
          TabOrder = 13
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 683
    inherited tb97Fundo: TToolbar97
      Left = 511
      DockPos = 534
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 286
      DockPos = 286
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Atualizar'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
          000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
          033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
          B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
          C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
          033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
          3000773373FFFF73377733333700073333333333377777333333333333333333
          3333333333333333333333333333333333333333333333333333}
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Imprimir'
        Visible = False
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 110
    Top = 8
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA , P.NOME  '
      'FROM PESSOA P, PATRO PA'
      'WHERE P.IDPESSOA = PA.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 56
    Top = 121
    object qrypatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
    object qrypatroNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 242
    Top = 65529
  end
  object dsgrafico: TwwDataSource
    DataSet = qryGrafico
    Left = 269
    Top = 121
  end
  object qryatend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT U.IDUSUARIO, U.NOMEUSUARIO'
      
        '     FROM USUARIOSISTEMA  U,  (SELECT DISTINCT CODATENDENTE FROM' +
        '  ATEND) AT'
      'WHERE U.IDUSUARIO = TO_NUMBER(AT.CODATENDENTE)'
      'ORDER BY NOMEUSUARIO ')
    ValidateWithMask = True
    Left = 66
    Top = 193
    object qryatendIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'USUARIOSISTEMA.IDUSUARIO'
    end
    object qryatendNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'USUARIOSISTEMA.NOMEUSUARIO'
    end
  end
  object dsatend: TwwDataSource
    DataSet = qryatend
    Left = 563
    Top = 1
  end
  object qryassunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDASSUNTO, NOME'
      'FROM'
      '  ASSUNTO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 123
    Top = 225
    object qryassuntoIDASSUNTO: TFloatField
      FieldName = 'IDASSUNTO'
      Origin = '"CM.ASSUNTO".IDASSUNTO'
    end
    object qryassuntoNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.ASSUNTO".NOME'
      Size = 60
    end
  end
  object dsassunto: TwwDataSource
    DataSet = qryassunto
    Left = 342
    Top = 1
  end
  object qryformaatend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDTIPOATEND,'
      '         NOME'
      'FROM     TIPOATEND'
      'UNION'
      'SELECT   -1,'
      '         '#39'Auto-Atendimento'#39
      'FROM     DUAL'
      'ORDER BY NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 317
    Top = 129
    object qryformaatendIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = '"CM.TIPOATEND".IDTIPOATEND'
    end
    object qryformaatendNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.TIPOATEND".NOME'
      Size = 60
    end
  end
  object dsformaatend: TwwDataSource
    DataSet = qryformaatend
    Left = 640
    Top = 1
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   P.NOME, P.IDPESSOA '
      'FROM '
      '   PESSOA P, FILIALPESSOA  FP'
      'WHERE '
      '   P.IDPESSOA = IDFILIALPESSOA'
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 127
    Top = 161
    object qryfilialNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryfilialIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
  end
  object QryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPLANOPREV, NOME '
      'FROM '
      '  PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 282
    Top = 336
    object QryPlanPrevNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object QryPlanPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.PLANPREV".IDPLANOPREV'
    end
  end
  object QrySituCad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDSITPART, DESCRICAO'
      'FROM'
      '  SITPART'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 624
    Top = 298
    object QrySituCadDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = '"CM.SITPART".DESCRICAO'
      Size = 50
    end
    object QrySituCadIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Origin = '"CM.SITPART".IDSITPART'
    end
  end
  object qryLocalAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LA.IDLOCALATEND,'
      '       LA.DESCLOCALATEND'
      'FROM   LOCALATEND LA'
      'ORDER BY LA.DESCLOCALATEND')
    ValidateWithMask = True
    Left = 577
    Top = 274
    object qryLocalAtendDESCLOCALATEND: TStringField
      DisplayLabel = 'Local de Atendimento'
      DisplayWidth = 60
      FieldName = 'DESCLOCALATEND'
      Origin = 'LOCALATEND.DESCLOCALATEND'
      Size = 60
    end
    object qryLocalAtendIDLOCALATEND: TFloatField
      DisplayLabel = 'Código'
      FieldName = 'IDLOCALATEND'
      Origin = 'LOCALATEND.IDLOCALATEND'
      Visible = False
    end
  end
  object QryGrupoAssunto: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDGRUPOASSUNTO, DESCGRUPOASSUNTO '
      'FROM '
      '  GRUPOASSUNTO '
      'ORDER BY '
      '  DESCGRUPOASSUNTO')
    ValidateWithMask = True
    Left = 45
    Top = 268
    object QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOASSUNTO'
      Origin = 'GRUPOASSUNTO.DESCGRUPOASSUNTO'
      Size = 60
    end
    object QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOASSUNTO'
      Origin = 'GRUPOASSUNTO.IDGRUPOASSUNTO'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  COUNT(AT.IDATEND) AS CONTATEND, '
      '  ASS.NOME,'
      
        '  '#39'                                                             ' +
        '                                        '#39' as topico '
      'FROM'
      
        '  ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PART' +
        'PREVPLAN PP, SITPART SP'
      'WHERE'
      '  AT.IDTIPOATEND = TP.IDTIPOATEND AND'
      '  AST.IDATEND = AT.IDATEND AND'
      '  PP.IDPESSOA(+) = AT.IDTITULAR AND'
      '  PP.IDPESSJUR(+) = AT.IDPESSJUR AND'
      '  PP.IDSITPART = SP.IDSITPART(+)'
      'GROUP BY  ASS.NOME')
    UpdateObject = UpdqryAux
    ValidateWithMask = True
    Left = 625
    Top = 201
  end
  object UpdqryAux: TUpdateSQL
    Left = 281
    Top = 233
  end
  object QRYaux2: TwwQuery
    ValidateWithMask = True
    Left = 281
    Top = 177
  end
  object qryGrafico: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  COUNT(AT.IDATEND) AS CONTATEND, '
      '  ASS.NOME,'
      
        '  '#39'                                                             ' +
        '                                        '#39' as topico '
      'FROM'
      
        '  ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PART' +
        'PREVPLAN PP, SITPART SP'
      'WHERE'
      '  AT.IDTIPOATEND = TP.IDTIPOATEND AND'
      '  AST.IDATEND = AT.IDATEND AND'
      '  PP.IDPESSOA(+) = AT.IDTITULAR AND'
      '  PP.IDPESSJUR(+) = AT.IDPESSJUR AND'
      '  PP.IDSITPART = SP.IDSITPART(+)'
      'GROUP BY  ASS.NOME')
    UpdateObject = UpdGrafico
    ValidateWithMask = True
    Left = 616
    Top = 81
  end
  object ppReportGrafico: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 489
    Top = 73
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = ppDBPipeline2
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 17727
        mmLeft = 10053
        mmTop = 2117
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppDBPipeline2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 5821
        mmLeft = 35190
        mmTop = 5821
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppDBPipeline2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 11906
        mmWidth = 25400
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 23548
        mmWidth = 289190
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 170127
      mmPrintPosition = 0
      object ppTeeChart1: TppDPTeeChart
        UserName = 'ppTeeChart1'
        mmHeight = 139700
        mmLeft = 9260
        mmTop = 7408
        mmWidth = 278607
        BandType = 4
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Alignment = taLeftJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'TppDPTeeChartControl')
          AxisVisible = False
          BottomAxis.Labels = False
          BottomAxis.LabelsOnAxis = False
          BottomAxis.LabelStyle = talNone
          BottomAxis.RoundFirstLabel = False
          Chart3DPercent = 20
          ClipPoints = False
          Frame.Visible = False
          Legend.ColorWidth = 2
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -9
          Legend.Font.Name = 'Courier New'
          Legend.Font.Style = []
          Legend.Inverted = True
          Legend.TopPos = 1
          View3DWalls = False
          BevelOuter = bvNone
          Color = clWhite
          object Series4: TPieSeries
            Tag = 3
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = ppDBPipeline1
            SeriesColor = clRed
            XLabelsSource = 'NOME'
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'CONTATEND'
          end
          object Series5: TBarSeries
            Tag = 3
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Visible = False
            DataSource = ppDBPipeline1
            SeriesColor = clGreen
            XLabelsSource = 'NOME'
            Dark3D = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'CONTATEND'
          end
        end
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 21960
        mmLeft = 5556
        mmTop = 147902
        mmWidth = 92869
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Estatística por TOPICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 109273
        mmTop = 529
        mmWidth = 42863
        BandType = 4
      end
      object Patrocinadora: TppLabel
        UserName = 'Patrocinadora'
        Caption = 'Patrocinadora: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 6879
        mmTop = 148696
        mmWidth = 23283
        BandType = 4
      end
      object Filial: TppLabel
        UserName = 'Filial'
        Caption = 'Filial: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 6879
        mmTop = 152136
        mmWidth = 13229
        BandType = 4
      end
      object Atendente: TppLabel
        UserName = 'Atendente'
        Caption = 'Atendente: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 6879
        mmTop = 155575
        mmWidth = 19315
        BandType = 4
      end
      object Assunto: TppLabel
        UserName = 'Assunto'
        Caption = 'Assunto: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 6879
        mmTop = 159015
        mmWidth = 16933
        BandType = 4
      end
      object Grupo: TppLabel
        UserName = 'Grupo'
        Caption = 'Grupo de Assunto: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 6879
        mmTop = 162454
        mmWidth = 27781
        BandType = 4
      end
      object Status: TppLabel
        UserName = 'Status'
        Caption = 'Status: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 6879
        mmTop = 165894
        mmWidth = 15081
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 21960
        mmLeft = 98161
        mmTop = 147902
        mmWidth = 92869
        BandType = 4
      end
      object Forma: TppLabel
        UserName = 'Filial1'
        Caption = 'Forma de Atendimento: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 148696
        mmWidth = 33073
        BandType = 4
      end
      object Local: TppLabel
        UserName = 'Local'
        Caption = 'Local de Atendimento: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 152136
        mmWidth = 31750
        BandType = 4
      end
      object Plano: TppLabel
        UserName = 'Plano'
        Caption = 'Plano: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 155575
        mmWidth = 14552
        BandType = 4
      end
      object Situacao: TppLabel
        UserName = 'Situacao'
        Caption = 'Situação na Fundação: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 159015
        mmWidth = 32544
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total de Atendimentos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5556
        mmTop = 139700
        mmWidth = 32279
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FILTROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5556
        mmTop = 143934
        mmWidth = 12171
        BandType = 4
      end
      object cidade: TppLabel
        UserName = 'Situacao1'
        Caption = 'Cidade: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 162454
        mmWidth = 15875
        BandType = 4
      end
      object ppLblTempoMedioTotal: TppLabel
        UserName = 'LblTempoMedioTotal'
        Caption = 'Tempo Médio Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 98161
        mmTop = 144198
        mmWidth = 25929
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Central de Atendimento ao Público'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 529
        mmWidth = 288661
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 529
        mmWidth = 288661
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265378
        mmTop = 794
        mmWidth = 26723
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 3439
        mmTop = 529
        mmWidth = 288132
        BandType = 8
      end
    end
  end
  object wwDataSource1: TwwDataSource
    DataSet = qryAux
    Left = 281
    Top = 281
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsgrafico
    OpenDataSource = False
    UserName = 'DBPipeline1'
    Left = 417
    Top = 145
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTATEND'
      FieldName = 'CONTATEND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  object qryFun: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 77
    Top = 67
    object qryFunNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFunRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFunLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 60
    end
    object qryFunNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.ENDPESS.NUMERO'
      Size = 8
    end
    object qryFunCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'BASEDADOS.ENDPESS.COMPLEMENTO'
    end
    object qryFunBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BASEDADOS.ENDPESS.BAIRRO'
    end
    object qryFunCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryFunCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFunCEP: TStringField
      FieldName = 'CEP'
      Origin = 'BASEDADOS.ENDPESS.CEP'
      Size = 8
    end
    object qryFunIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'BASEDADOS.IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object DSfun: TwwDataSource
    DataSet = qryFun
    Left = 133
    Top = 67
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = DSfun
    UserName = 'DBPipeline2'
    Left = 193
    Top = 73
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline2ppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppDBPipeline2ppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppDBPipeline2ppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object qryCidades: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCIDADES, '
      '  CODESTADO, '
      '  NOME, '
      '  IDESTADO,'
      '  IDPAIS,'
      '  UF'
      'FROM CIDADES'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 376
    Top = 53
    object qryCidadesNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryCidadesIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
      Visible = False
    end
    object qryCidadesCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryCidadesIDESTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.CIDADES.IDESTADO'
      Visible = False
    end
    object qryCidadesIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.CIDADES.IDPAIS'
      Visible = False
    end
    object qryCidadesUF: TStringField
      FieldName = 'UF'
      Origin = 'BASEDADOS.CIDADES.UF'
      FixedChar = True
      Size = 3
    end
  end
  object UpdGrafico: TUpdateSQL
    Left = 569
    Top = 201
  end
end
