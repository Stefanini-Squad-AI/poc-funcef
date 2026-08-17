inherited FrmListaDocs: TFrmListaDocs
  Left = 66
  Top = 65
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Elegivel'
  ClientHeight = 311
  ClientWidth = 515
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 515
    Height = 272
    object lstDocumentos: TListView
      Left = 5
      Top = 5
      Width = 316
      Height = 262
      Align = alLeft
      Columns = <
        item
          Caption = 'Documento'
          Width = 170
        end
        item
          Caption = 'Número'
          Width = 140
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = lstDocumentosChange
    end
    object pnlItemsDoc: TPanel
      Left = 321
      Top = 5
      Width = 172
      Height = 262
      Align = alLeft
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object pnlNomeDoc: TPanel
        Left = 0
        Top = 0
        Width = 172
        Height = 21
        Align = alTop
        TabOrder = 0
        object DBText1: TDBText
          Left = 10
          Top = 3
          Width = 150
          Height = 17
          DataField = 'NOMEDOCUMENTO'
          DataSource = dsDocumento
        end
      end
      object pnlOrgao: TPanel
        Left = 0
        Top = 49
        Width = 172
        Height = 46
        Align = alTop
        TabOrder = 1
        Visible = False
        object lblPdOrgao: TLabel
          Left = 10
          Top = 3
          Width = 81
          Height = 13
          Caption = 'Orgão emissor'
        end
        object wwDBEdit1: TwwDBEdit
          Left = 10
          Top = 18
          Width = 148
          Height = 21
          DataField = 'ORGAO'
          DataSource = dsDocumento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object pnlEmissao: TPanel
        Left = 0
        Top = 141
        Width = 172
        Height = 46
        Align = alTop
        TabOrder = 2
        Visible = False
        object lblPdEmiss: TLabel
          Left = 10
          Top = 3
          Width = 96
          Height = 13
          Caption = 'Data da Emissão'
        end
        object CMDateTimePicker2: TCMDateTimePicker
          Left = 11
          Top = 18
          Width = 150
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMISSAO'
          DataSource = dsDocumento
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 0
        end
      end
      object pnlUF: TPanel
        Left = 0
        Top = 95
        Width = 172
        Height = 46
        Align = alTop
        TabOrder = 3
        Visible = False
        object lblPdUF: TLabel
          Left = 10
          Top = 3
          Width = 130
          Height = 13
          Caption = 'Unidade da Federação'
        end
        object dbcmbEstadoDoc: TCMDBLookupCombo
          Left = 10
          Top = 18
          Width = 49
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODESTADO'#9'4'#9'UF'
            'NOMEESTADO'#9'15'#9'Estado'
            'NOMEPAIS'#9'20'#9'Pais')
          DataField = 'IDESTADO'
          DataSource = dsDocumento
          LookupField = 'IDESTADO'
          Options = [loTitles]
          Style = csDropDownList
          ButtonStyle = cbsCustom
          ButtonEffects.Transparent = True
          ButtonEffects.Flat = True
          ButtonWidth = 1
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object pnlNumDoc: TPanel
        Left = 0
        Top = 21
        Width = 172
        Height = 28
        Align = alTop
        TabOrder = 4
        object edDocNumDocumento: TwwDBEdit
          Left = 10
          Top = 3
          Width = 148
          Height = 21
          DataField = 'NUMDOCUMENTO'
          DataSource = dsDocumento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object PnlValidade: TPanel
        Left = 0
        Top = 187
        Width = 172
        Height = 46
        Align = alTop
        TabOrder = 5
        Visible = False
        object LblDtValidade: TLabel
          Left = 10
          Top = 3
          Width = 99
          Height = 13
          Caption = 'Data de Validade'
        end
        object CMDateTimePicker1: TCMDateTimePicker
          Left = 11
          Top = 18
          Width = 150
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAVALIDADE'
          DataSource = dsDocumento
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 272
    Width = 515
    inherited tb97Fundo: TToolbar97
      Left = 345
      DockPos = 542
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 178
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 3
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  object qryDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TD.IDDOCUMENTO, TD.NOMEDOCUMENTO, TD.MASCARA, TD.OBRIGAUF' +
        ','
      
        '       TD.OBRIGAORGAO, TD.OBRIGAEMISSAO, DP.IDPESSOA, DP.IDIMAGE' +
        'M,'
      '       DP.IDPAIS, DP.IDESTADO, DP.NUMDOCUMENTO, DP.ORGAO,'
      '       DP.DATAEMISSAO, TD.FLGOBRIGAVALIDADE, DP.DATAVALIDADE'
      'FROM DOCPESSOA DP,'
      '     TIPODOCPESSOA TD'
      'WHERE (DP.IDPESSOA=:IdPessoa)'
      '  AND (TD.IDDOCUMENTO=DP.IDDOCUMENTO)'
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'DATAEMISSAO'#9'#[#]/#[#]/##[##]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 129
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object Pessoa: TPessoa
    MudaCaption = True
    TipoPessoa = tpFisica
    SubTipo = stElegivel
    FormCaption = 'Lista Documentos'
    MostraFoto = True
    UsaPessoaFisica = True
    SaveModuloRespon = False
    ObrigaDocumento = True
    Left = 363
    Top = 3
  end
  object dsDocumento: TwwDataSource
    DataSet = qryDocumento
    Left = 129
    Top = 55
  end
end
