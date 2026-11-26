inherited frmParamPessoaLote: TfrmParamPessoaLote
  Left = 153
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parâmetros por Pessoa em Lote'
  ClientHeight = 375
  ClientWidth = 683
  FormStyle = fsStayOnTop
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 683
    Height = 336
    object ntbPessLote: TNotebook
      Left = 0
      Top = 0
      Width = 681
      Height = 337
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'ImportMatriculaElegivel'
        object pnlFundo2: TPanel
          Left = 0
          Top = 0
          Width = 681
          Height = 337
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 0
          object Label46: TLabel
            Left = 50
            Top = 35
            Width = 58
            Height = 13
            Caption = 'Parâmetro'
          end
          object Label47: TLabel
            Left = 50
            Top = 81
            Width = 55
            Height = 13
            Caption = 'Conteúdo'
          end
          object Label48: TLabel
            Left = 50
            Top = 132
            Width = 65
            Height = 13
            Caption = 'Data Início'
          end
          object Label49: TLabel
            Left = 205
            Top = 134
            Width = 51
            Height = 13
            Caption = 'Data Fim'
          end
          object Label51: TLabel
            Left = 388
            Top = 101
            Width = 44
            Height = 13
            Caption = '<---------'
          end
          object Label50: TLabel
            Left = 440
            Top = 83
            Width = 57
            Height = 13
            Caption = 'Validação'
          end
          object Label59: TLabel
            Left = 439
            Top = 132
            Width = 50
            Height = 13
            Caption = 'Legenda'
          end
          object lblNup: TLabel
            Left = 50
            Top = 222
            Width = 27
            Height = 13
            Caption = 'NUP'
          end
          object lblCartaEnvio: TLabel
            Left = 50
            Top = 177
            Width = 85
            Height = 13
            Caption = 'Carta de Envio'
          end
          object dbedValor: TwwDBEdit
            Left = 50
            Top = 97
            Width = 337
            Height = 21
            DataField = 'VALOR'
            MaxLength = 30
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dtInicio: TCMDateTimePicker
            Left = 50
            Top = 149
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINICIO'
            DataSource = frmCadElegivel.dsOutrasInforms
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
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 2
          end
          object DtFim: TCMDateTimePicker
            Left = 205
            Top = 149
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAFIM'
            DataSource = frmCadElegivel.dsOutrasInforms
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
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 3
          end
          object mmLegenda: TDBMemo
            Left = 438
            Top = 146
            Width = 186
            Height = 67
            DataField = 'LEGENDA'
            Enabled = False
            MaxLength = 200
            TabOrder = 6
          end
          object edtNup: TwwDBEdit
            Left = 50
            Top = 236
            Width = 144
            Height = 21
            DataField = 'NUP'
            MaxLength = 9
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edtCartaEnvio: TwwDBEdit
            Left = 50
            Top = 193
            Width = 145
            Height = 21
            DataField = 'CE'
            MaxLength = 18
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DbParam: TwwDBLookupCombo
            Left = 50
            Top = 51
            Width = 337
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO'#9'F'
              'IDPARAM'#9'10'#9'IDPARAM'#9'F')
            LookupTable = qryImportM
            LookupField = 'IDPARAM'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = DbParamChange
            OnKeyPress = DbParamKeyPress
          end
          object edValida: TDBEdit
            Left = 438
            Top = 98
            Width = 187
            Height = 21
            Color = clInfoBk
            DataField = 'VALIDACAO'
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = 'RelatorioSimplesConferencia'
        object Label1: TLabel
          Left = 201
          Top = 16
          Width = 200
          Height = 13
          Caption = 'Relatório para Simples Conferência'
        end
        object dbgPessoaLote: TwwDBGrid2
          Left = 16
          Top = 48
          Width = 657
          Height = 265
          Selected.Strings = (
            'SELECIONA'#9'4'#9'  '
            'MATRICULA'#9'10'#9'Matrícula'
            'NOME'#9'15'#9'Nome'
            'PARAMETRO'#9'10'#9'Parâmetro'
            'CONTEUDO'#9'10'#9'Conteúdo'
            'DATAINICIO'#9'10'#9'Data Início'
            'DATAFIM'#9'10'#9'Data Fim'
            'CE'#9'6'#9'CE'
            'NUP'#9'6'#9'NUP')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsPessoaLote
          KeyOptions = []
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 2
        Caption = 'RelatorioSimplesConferenciaAlterados'
        object Label2: TLabel
          Left = 81
          Top = 16
          Width = 452
          Height = 13
          Caption = 
            'Pessoas com Parâmetro selecionado cadastrado para confirmação de' +
            ' alteração'
        end
        object Label3: TLabel
          Left = 169
          Top = 32
          Width = 267
          Height = 13
          Caption = 'Após a confirmação, os dados abaixo serão substituidos!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbgAlteracao: TwwDBGrid2
          Left = 16
          Top = 56
          Width = 649
          Height = 257
          Selected.Strings = (
            'SELECIONA'#9'4'#9'  '
            'MATRICULA'#9'10'#9'Matrícula'
            'NOME'#9'15'#9'Nome'
            'PARAMETRO'#9'10'#9'Parâmetro'
            'CONTEUDO'#9'10'#9'Conteúdo'
            'DATAINICIO'#9'10'#9'Data Início'
            'DATAFIM'#9'10'#9'Data Fim'
            'CE'#9'6'#9'CE'
            'NUP'#9'6'#9'NUP')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlteracao
          KeyOptions = []
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 683
    inherited tb97Fundo: TToolbar97
      Left = 441
      DockPos = 441
      inherited sep1: TToolbarSep97
        Left = 164
      end
      inherited sep3: TToolbarSep97
        Left = 161
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 81
        Width = 80
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 184
      DockPos = 184
      inherited ToolbarSep971: TToolbarSep97
        Left = 169
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        Width = 88
        Caption = '&Confirmar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 172
        OnClick = bbtnCancelarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
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
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 579
    Top = 3
    TargetsData = (
      1
      3
      (
        ''
        'DisplayLabel'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object updPessoaLote: TUpdateSQL
    Left = 104
    Top = 272
  end
  object dsPessoaLote: TDataSource
    DataSet = qryPessoaLote
    Left = 80
    Top = 264
  end
  object qryPessoaLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM '
      '(SELECT'
      '0 SELECIONA,'
      #39' XXXXXXXXXXXXXXX'#39'  AS MATRICULA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'NOME,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS LEGENDA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'PARAMETRO,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS CONTEUDO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAINICIO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAFIM,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS CE,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NUP'
      'FROM DUAL'
      ')'
      'WHERE 1 = 2'
      '')
    UpdateObject = updPessoaLote
    ControlType.Strings = (
      'SELECIONA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 64
    Top = 264
    object qryPessoaLoteSELECIONA: TFloatField
      DisplayLabel = '  '
      DisplayWidth = 4
      FieldName = 'SELECIONA'
    end
    object qryPessoaLoteMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 16
    end
    object qryPessoaLoteNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'NOME'
      FixedChar = True
      Size = 58
    end
    object qryPessoaLotePARAMETRO: TStringField
      DisplayLabel = 'Parâmetro'
      DisplayWidth = 10
      FieldName = 'PARAMETRO'
      FixedChar = True
      Size = 58
    end
    object qryPessoaLoteCONTEUDO: TStringField
      DisplayLabel = 'Conteúdo'
      DisplayWidth = 10
      FieldName = 'CONTEUDO'
      FixedChar = True
      Size = 43
    end
    object qryPessoaLoteDATAINICIO: TStringField
      DisplayLabel = 'Data Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      FixedChar = True
      Size = 15
    end
    object qryPessoaLoteDATAFIM: TStringField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DATAFIM'
      FixedChar = True
      Size = 15
    end
    object qryPessoaLoteCE: TStringField
      DisplayWidth = 6
      FieldName = 'CE'
      FixedChar = True
      Size = 43
    end
    object qryPessoaLoteNUP: TStringField
      DisplayWidth = 6
      FieldName = 'NUP'
      FixedChar = True
      Size = 43
    end
    object qryPessoaLoteLEGENDA: TStringField
      DisplayWidth = 91
      FieldName = 'LEGENDA'
      Visible = False
      FixedChar = True
      Size = 91
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 627
    Top = 8
  end
  object qryImportM: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select idparam, tipo, descricao, validacao,legenda from'
      ' paramflagpessoa order by descricao')
    ValidateWithMask = True
    Left = 643
    Top = 56
  end
  object qryAux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 595
    Top = 48
  end
  object qryAlteracao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM '
      '(SELECT'
      '0 SELECIONA,'
      #39'XXXXXXXXXX'#39' AS IDPESSOA,'
      #39' XXXXXXXXXXXXXXX'#39'  AS MATRICULA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'NOME,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS LEGENDA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'PARAMETRO,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS CONTEUDO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAINICIO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAFIM,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS CE,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NUP'
      'FROM DUAL'
      ')'
      'WHERE 1 = 2')
    UpdateObject = updAlteracao
    ControlType.Strings = (
      'SELECIONA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 416
    Top = 8
    object qryAlteracaoSELECIONA: TFloatField
      DisplayLabel = '  '
      DisplayWidth = 4
      FieldName = 'SELECIONA'
    end
    object qryAlteracaoMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 16
    end
    object qryAlteracaoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'NOME'
      FixedChar = True
      Size = 58
    end
    object qryAlteracaoPARAMETRO: TStringField
      DisplayLabel = 'Parâmetro'
      DisplayWidth = 10
      FieldName = 'PARAMETRO'
      FixedChar = True
      Size = 58
    end
    object qryAlteracaoCONTEUDO: TStringField
      DisplayLabel = 'Conteúdo'
      DisplayWidth = 10
      FieldName = 'CONTEUDO'
      FixedChar = True
      Size = 43
    end
    object qryAlteracaoDATAINICIO: TStringField
      DisplayLabel = 'Data Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      FixedChar = True
      Size = 15
    end
    object qryAlteracaoDATAFIM: TStringField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DATAFIM'
      FixedChar = True
      Size = 15
    end
    object qryAlteracaoCE: TStringField
      DisplayWidth = 6
      FieldName = 'CE'
      FixedChar = True
      Size = 43
    end
    object qryAlteracaoNUP: TStringField
      DisplayWidth = 6
      FieldName = 'NUP'
      FixedChar = True
      Size = 43
    end
    object qryAlteracaoLEGENDA: TStringField
      DisplayWidth = 91
      FieldName = 'LEGENDA'
      Visible = False
      FixedChar = True
      Size = 91
    end
    object qryAlteracaoIDPESSOA: TStringField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object updAlteracao: TUpdateSQL
    Left = 424
    Top = 16
  end
  object dsAlteracao: TDataSource
    DataSet = qryAlteracao
    Left = 432
    Top = 24
  end
  object dsParamPessoaLote: TwwDataSource
    DataSet = qryRelatorio
    Left = 365
    Top = 264
  end
  object ppParamPessoaLote: TppBDEPipeline
    DataSource = dsParamPessoaLote
    SkipWhenNoRecords = False
    UserName = 'ParamPessoaLote'
    Left = 421
    Top = 268
    object ppParamPessoaLoteppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppParamPessoaLoteppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 16
      DisplayWidth = 16
      Position = 1
    end
    object ppParamPessoaLoteppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 58
      DisplayWidth = 58
      Position = 2
    end
    object ppParamPessoaLoteppField4: TppField
      FieldAlias = 'LEGENDA'
      FieldName = 'LEGENDA'
      FieldLength = 91
      DisplayWidth = 91
      Position = 3
    end
    object ppParamPessoaLoteppField5: TppField
      FieldAlias = 'PARAMETRO'
      FieldName = 'PARAMETRO'
      FieldLength = 58
      DisplayWidth = 58
      Position = 4
    end
    object ppParamPessoaLoteppField6: TppField
      FieldAlias = 'CONTEUDO'
      FieldName = 'CONTEUDO'
      FieldLength = 43
      DisplayWidth = 43
      Position = 5
    end
    object ppParamPessoaLoteppField7: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppParamPessoaLoteppField8: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppParamPessoaLoteppField9: TppField
      FieldAlias = 'CE'
      FieldName = 'CE'
      FieldLength = 43
      DisplayWidth = 43
      Position = 8
    end
    object ppParamPessoaLoteppField10: TppField
      FieldAlias = 'NUP'
      FieldName = 'NUP'
      FieldLength = 43
      DisplayWidth = 43
      Position = 9
    end
  end
  object rpParamPessoaLote: TppReport
    AutoStop = False
    DataPipeline = ppParamPessoaLote
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 384
    Top = 272
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppParamPessoaLote'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37571
      mmPrintPosition = 0
      object TitRelat: TppLabel
        UserName = 'TitRelat'
        Caption = 'Relatório de Cadastro de Parâmetros por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 92075
        mmTop = 28575
        mmWidth = 98954
        BandType = 0
      end
      object rpEncPIDPIADBImage1: TppDBImage
        UserName = 'rpEncPIDPIADBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 29104
        mmTop = 1588
        mmWidth = 39688
        BandType = 0
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 257949
        mmTop = 31750
        mmWidth = 25950
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'ppLabel79'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 243153
        mmTop = 31750
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = []
        Transparent = True
        mmHeight = 7408
        mmLeft = 76465
        mmTop = 1323
        mmWidth = 136525
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 
          'SCN, Quadra 2, Bloco A Edificio Corporate  Financial Center 12 e' +
          ' 13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 8996
        mmWidth = 120386
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Brasilia DF CEP 70.712-900 - (061) 329-1700 - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 93398
        mmTop = 13758
        mmWidth = 72231
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'CNPJ: 03.296.986/0001-03 - Inscrição Estadual: 01.001.001-001-01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 92604
        mmTop = 18256
        mmWidth = 105834
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26723
        mmWidth = 284300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4022
        mmLeft = 165365
        mmTop = 13758
        mmWidth = 29718
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpEncPIDPIADBText13: TppDBText
        UserName = 'rpEncPIDPIADBText13'
        DataField = 'MATRICULA'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 795
        mmWidth = 42069
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PARAMETRO'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 69321
        mmTop = 794
        mmWidth = 57679
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CONTEUDO'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINICIO'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFIM'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 795
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CE'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 209815
        mmTop = 794
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUP'
        DataPipeline = ppParamPessoaLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLote'
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 794
        mmWidth = 25135
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 3175
        mmWidth = 24342
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relatório de Cadastro de Parâmetros por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 2910
        mmWidth = 73554
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'FUNCEF / DIBEN / GECAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 8731
        mmWidth = 37571
        BandType = 8
      end
    end
    object rpEncPIDPIAGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppParamPessoaLote
      OutlineSettings.CreateNode = True
      UserName = 'rpEncPIDPIAGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppParamPessoaLote'
      object rpEncPIDPIAGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object rpEncPIDPIALabel5: TppLabel
          UserName = 'rpEncPIDPIALabel5'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 1852
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpEncPIDPIALabel6: TppLabel
          UserName = 'rpEncPIDPIALabel6'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 23019
          mmTop = 1852
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpEncPIDPIALabel7: TppLabel
          UserName = 'rpEncPIDPIALabel7'
          Caption = 'Parâmetro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 69586
          mmTop = 1852
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpEncPIDPIALabel8: TppLabel
          UserName = 'rpEncPIDPIALabel8'
          Caption = 'Conteúdo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 130969
          mmTop = 2117
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rpEncPIDPIALabel9: TppLabel
          UserName = 'rpEncPIDPIALabel9'
          Caption = 'Dt Inicio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 11218
          BandType = 3
          GroupNo = 0
        end
        object rpEncPIDPIALabel10: TppLabel
          UserName = 'rpEncPIDPIALabel10'
          Caption = 'CE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 210080
          mmTop = 1852
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'ppLine37'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rpEncPIDPIALine1: TppLine
          UserName = 'rpEncPIDPIALine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7142
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Dt Fim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 183357
          mmTop = 1852
          mmWidth = 8848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'rpEncPIDPIALabel101'
          Caption = 'NUP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 244740
          mmTop = 1852
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
      end
      object rpEncPIDPIAGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND'
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 227
    Top = 266
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 212
    Top = 259
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
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
  object ppParamPessoaLoteAlteracao: TppBDEPipeline
    DataSource = dsParamPessoaLoteAlteracao
    SkipWhenNoRecords = False
    UserName = 'ParamPessoaLote1'
    Left = 597
    Top = 284
    object ppParamPessoaLoteAlteracaoppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppParamPessoaLoteAlteracaoppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 16
      DisplayWidth = 16
      Position = 1
    end
    object ppParamPessoaLoteAlteracaoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 58
      DisplayWidth = 58
      Position = 2
    end
    object ppParamPessoaLoteAlteracaoppField4: TppField
      FieldAlias = 'LEGENDA'
      FieldName = 'LEGENDA'
      FieldLength = 91
      DisplayWidth = 91
      Position = 3
    end
    object ppParamPessoaLoteAlteracaoppField5: TppField
      FieldAlias = 'PARAMETRO'
      FieldName = 'PARAMETRO'
      FieldLength = 58
      DisplayWidth = 58
      Position = 4
    end
    object ppParamPessoaLoteAlteracaoppField6: TppField
      FieldAlias = 'CONTEUDO'
      FieldName = 'CONTEUDO'
      FieldLength = 43
      DisplayWidth = 43
      Position = 5
    end
    object ppParamPessoaLoteAlteracaoppField7: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppParamPessoaLoteAlteracaoppField8: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppParamPessoaLoteAlteracaoppField9: TppField
      FieldAlias = 'CE'
      FieldName = 'CE'
      FieldLength = 43
      DisplayWidth = 43
      Position = 8
    end
    object ppParamPessoaLoteAlteracaoppField10: TppField
      FieldAlias = 'NUP'
      FieldName = 'NUP'
      FieldLength = 43
      DisplayWidth = 43
      Position = 9
    end
  end
  object rpParamPessoaLoteAlteracao: TppReport
    AutoStop = False
    DataPipeline = ppParamPessoaLoteAlteracao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 584
    Top = 272
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppParamPessoaLoteAlteracao'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37571
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'TitRelat'
        Caption = 'Relatório de Parâmetros Alterados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 106798
        mmTop = 28575
        mmWidth = 69511
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'rpEncPIDPIADBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 29104
        mmTop = 1588
        mmWidth = 39688
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 257949
        mmTop = 31750
        mmWidth = 25950
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel79'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 243153
        mmTop = 31750
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = []
        Transparent = True
        mmHeight = 7408
        mmLeft = 72761
        mmTop = 1323
        mmWidth = 136525
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label6'
        Caption = 
          'SCN, Quadra 2, Bloco A Edificio Corporate  Financial Center 12 e' +
          ' 13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 8996
        mmWidth = 120386
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label7'
        Caption = 'Brasilia DF CEP 70.712-900 - (061) 329-1700 - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 93398
        mmTop = 13758
        mmWidth = 72231
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label8'
        Caption = 'CNPJ: 03.296.986/0001-03 - Inscrição Estadual: 01.001.001-001-01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 92604
        mmTop = 18256
        mmWidth = 105834
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26723
        mmWidth = 284300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label2'
        Caption = 'www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4022
        mmLeft = 165365
        mmTop = 13758
        mmWidth = 29718
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'rpEncPIDPIADBText13'
        DataField = 'MATRICULA'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 795
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 795
        mmWidth = 42863
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText2'
        DataField = 'PARAMETRO'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 70379
        mmTop = 794
        mmWidth = 58738
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText3'
        DataField = 'CONTEUDO'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINICIO'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 154782
        mmTop = 795
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFIM'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 795
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText6'
        DataField = 'CE'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 209815
        mmTop = 794
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText7'
        DataField = 'NUP'
        DataPipeline = ppParamPessoaLoteAlteracao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppParamPessoaLoteAlteracao'
        mmHeight = 3704
        mmLeft = 245005
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 262563
        mmTop = 3175
        mmWidth = 18161
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relatório de Parâmetros Alterados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 2910
        mmWidth = 51594
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'FUNCEF / DIBEN / GECAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 8731
        mmWidth = 36777
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppParamPessoaLoteAlteracao
      OutlineSettings.CreateNode = True
      UserName = 'rpEncPIDPIAGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppParamPessoaLoteAlteracao'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLabel17: TppLabel
          UserName = 'rpEncPIDPIALabel5'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 1852
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'rpEncPIDPIALabel6'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 23019
          mmTop = 1852
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'rpEncPIDPIALabel7'
          Caption = 'Parâmetro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 70644
          mmTop = 1852
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'rpEncPIDPIALabel8'
          Caption = 'Conteúdo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 132027
          mmTop = 1852
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'rpEncPIDPIALabel9'
          Caption = 'Dt Inicio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 154782
          mmTop = 1852
          mmWidth = 11218
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'rpEncPIDPIALabel10'
          Caption = 'CE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 210344
          mmTop = 1852
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'ppLine37'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'rpEncPIDPIALine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7142
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label1'
          Caption = 'Dt Fim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 182298
          mmTop = 1852
          mmWidth = 8848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'rpEncPIDPIALabel101'
          Caption = 'NUP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 245005
          mmTop = 1852
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object dsParamPessoaLoteAlteracao: TwwDataSource
    DataSet = qryRelatorio
    Left = 621
    Top = 280
  end
  object updRelatorio: TUpdateSQL
    Left = 296
    Top = 8
  end
  object qryRelatorio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM '
      '(SELECT'
      #39'XXXXXXXXXX'#39' AS IDPESSOA,'
      #39' XXXXXXXXXXXXXXX'#39'  AS MATRICULA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'NOME,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS LEGENDA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'PARAMETRO,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS CONTEUDO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAINICIO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAFIM,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS CE,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NUP'
      'FROM DUAL'
      ')'
      'WHERE 1 = 2')
    UpdateObject = updRelatorio
    ValidateWithMask = True
    Left = 272
    object qryRelatorioIDPESSOA: TStringField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      FixedChar = True
      Size = 10
    end
    object qryRelatorioMATRICULA: TStringField
      DisplayWidth = 16
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 16
    end
    object qryRelatorioNOME: TStringField
      DisplayWidth = 58
      FieldName = 'NOME'
      FixedChar = True
      Size = 58
    end
    object qryRelatorioLEGENDA: TStringField
      DisplayWidth = 91
      FieldName = 'LEGENDA'
      FixedChar = True
      Size = 91
    end
    object qryRelatorioPARAMETRO: TStringField
      DisplayWidth = 58
      FieldName = 'PARAMETRO'
      FixedChar = True
      Size = 58
    end
    object qryRelatorioCONTEUDO: TStringField
      DisplayWidth = 43
      FieldName = 'CONTEUDO'
      FixedChar = True
      Size = 43
    end
    object qryRelatorioDATAINICIO: TStringField
      DisplayWidth = 15
      FieldName = 'DATAINICIO'
      FixedChar = True
      Size = 15
    end
    object qryRelatorioDATAFIM: TStringField
      DisplayWidth = 15
      FieldName = 'DATAFIM'
      FixedChar = True
      Size = 15
    end
    object qryRelatorioCE: TStringField
      DisplayWidth = 43
      FieldName = 'CE'
      FixedChar = True
      Size = 43
    end
    object qryRelatorioNUP: TStringField
      DisplayWidth = 43
      FieldName = 'NUP'
      FixedChar = True
      Size = 43
    end
  end
  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
    Left = 280
  end
end
