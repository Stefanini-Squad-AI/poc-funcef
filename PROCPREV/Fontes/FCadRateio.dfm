inherited frmCadRateio: TfrmCadRateio
  Left = 46
  Top = 130
  Width = 723
  Height = 418
  Caption = 'Rateio de Custos por Estabelecimento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 715
  end
  inherited Dock971: TDock97 [1]
    Top = 352
    Width = 715
    inherited tb97Fundo: TToolbar97
      Left = 358
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 715
    Height = 305
    inherited dbGrd: TwwDBGrid [0]
      Top = 64
      Width = 705
      Height = 236
      Selected.Strings = (
        'DATABASE'#9'10'#9'Data Cisão/Incorp.'
        'TIPORATEIO'#9'10'#9'Tipo (1=Data,2=Vlr Indiv.,3=Vlr Tot.'
        'PERIODO'#9'10'#9'Prescrição (meses)')
      TabOrder = 2
      UseTFields = False
    end
    inherited pnlControles: TPanel [1]
      Top = 64
      Width = 705
      Height = 236
      object Label1: TLabel
        Left = 33
        Top = 11
        Width = 189
        Height = 13
        Caption = 'Empresa Adquirida ou Adquirente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 33
        Top = 108
        Width = 175
        Height = 13
        Caption = 'Período de Prescrição (meses)'
      end
      object Label2: TLabel
        Left = 33
        Top = 75
        Width = 176
        Height = 13
        Caption = 'Data da cisão ou incorporação'
      end
      object Shape1: TShape
        Left = 192
        Top = 168
        Width = 175
        Height = 1
        Pen.Color = clBlue
      end
      object Label10: TLabel
        Left = 232
        Top = 153
        Width = 93
        Height = 13
        Caption = 'Esquema de Rateio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 363
        Top = 161
        Width = 8
        Height = 13
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlValor: TPanel
        Left = 378
        Top = 15
        Width = 298
        Height = 193
        TabOrder = 5
        object Label7: TLabel
          Left = 35
          Top = 39
          Width = 97
          Height = 13
          Caption = 'Valor Limite (até)'
        end
        object Label8: TLabel
          Left = 182
          Top = 39
          Width = 101
          Height = 13
          Caption = 'Nosso Percentual'
        end
        object Label9: TLabel
          Left = 13
          Top = 9
          Width = 273
          Height = 13
          Caption = 'Com Base no Valor Atualizado do(s) Processo(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedPerc1V: TDBRealEdit
          Left = 207
          Top = 57
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT1'
          DataSource = ds
        end
        object dbedPerc2V: TDBRealEdit
          Left = 207
          Top = 84
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT2'
          DataSource = ds
        end
        object dbedVal1: TDBRealEdit
          Left = 21
          Top = 57
          Width = 131
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORBASE1'
          DataSource = ds
        end
        object dbedVal2: TDBRealEdit
          Left = 21
          Top = 84
          Width = 131
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORBASE2'
          DataSource = ds
        end
        object dbedVal3: TDBRealEdit
          Left = 21
          Top = 111
          Width = 131
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORBASE3'
          DataSource = ds
        end
        object dbedVal4: TDBRealEdit
          Left = 21
          Top = 138
          Width = 131
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORBASE4'
          DataSource = ds
        end
        object dbedPerc3V: TDBRealEdit
          Left = 207
          Top = 111
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT3'
          DataSource = ds
        end
        object dbedPerc4V: TDBRealEdit
          Left = 207
          Top = 138
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT4'
          DataSource = ds
        end
        object dbedVal5: TDBRealEdit
          Left = 21
          Top = 165
          Width = 131
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 8
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORBASE5'
          DataSource = ds
        end
        object dbedPerc5V: TDBRealEdit
          Left = 207
          Top = 165
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 9
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT5'
          DataSource = ds
        end
      end
      object pnlData: TPanel
        Left = 378
        Top = 15
        Width = 298
        Height = 193
        TabOrder = 4
        object Label6: TLabel
          Left = 20
          Top = 78
          Width = 153
          Height = 13
          Caption = 'Nosso Percentual Anteriror'
        end
        object Label4: TLabel
          Left = 20
          Top = 144
          Width = 159
          Height = 13
          Caption = 'Nosso Percentual Posteriror'
        end
        object Label5: TLabel
          Left = 22
          Top = 21
          Width = 254
          Height = 13
          Caption = 'Com Base na Data da cisão ou incorporação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedPerc1: TDBRealEdit
          Left = 206
          Top = 75
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT1'
          DataSource = ds
        end
        object dbedPerc2: TDBRealEdit
          Left = 206
          Top = 141
          Width = 69
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENT2'
          DataSource = ds
        end
      end
      object dblcEntid: TwwDBLookupCombo
        Left = 33
        Top = 29
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        DataField = 'IDPESSOA'
        DataSource = ds
        LookupTable = qryEntid
        LookupField = 'IDPESSOA'
        Options = [loColLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbspeAno: TwwDBSpinEdit
        Left = 222
        Top = 102
        Width = 121
        Height = 21
        Increment = 1
        DataField = 'PERIODO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object dbedDataBase: TCMDateTimePicker
        Left = 222
        Top = 69
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATABASE'
        DataSource = ds
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
        TabOrder = 2
      end
      object dbrgTipoRateio: TDBRadioGroup
        Left = 30
        Top = 135
        Width = 157
        Height = 73
        Caption = 'Tipo de Rateio'
        DataField = 'TIPORATEIO'
        DataSource = ds
        Items.Strings = (
          ' Por Data'
          ' Por Valor Individual'
          ' Por Valor Total')
        TabOrder = 3
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrgTipoRateioChange
      end
    end
    object gbxGrupoFunc: TGroupBox
      Left = 5
      Top = 5
      Width = 705
      Height = 59
      Align = alTop
      Caption = 'Estabelecimento'
      TabOrder = 1
      object dbedDescricao: TwwDBEdit
        Left = 162
        Top = 22
        Width = 381
        Height = 21
        TabStop = False
        DataField = 'NOME'
        DataSource = ds2
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = tblRateio
    Left = 273
    Top = 11
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 273
    Top = 64
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 360
    Top = 60
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = qryEstab
    Left = 114
    Top = 63
  end
  object tblRateio: TwwTable
    BeforeInsert = tblRateioBeforeInsert
    AfterInsert = tblRateioAfterInsert
    AfterScroll = tblRateioAfterScroll
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDFILIALPESSOA'
    MasterFields = 'IDFILIALPESSOA'
    MasterSource = ds2
    TableName = 'CM.RATEIOPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 327
    Top = 10
  end
  object qryEstab: TwwQuery
    AfterScroll = qryEstabAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.NOME, F.IDFILIALPESSOA '
      'from PESSOA P, FILIALPESSOA F'
      'where P.IDGRUPO  = :IdEmpresa'
      'and    P.IDPESSOA = F.IDFILIALPESSOA '
      'order by upper(P.NOME)')
    ValidateWithMask = True
    Left = 183
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresa'
        ParamType = ptUnknown
      end>
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME from PESSOA'
      'where FLGFORNSERV = 1'
      'order by upper(NOME)')
    ValidateWithMask = True
    Left = 261
    Top = 128
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Filial / Estabelecimento')
    Tabelas.Strings = (
      'FILIALPESSOA'
      'PESSOA')
    CamposChave.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA')
    Filtro.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '82')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 504
    Top = 8
  end
end
