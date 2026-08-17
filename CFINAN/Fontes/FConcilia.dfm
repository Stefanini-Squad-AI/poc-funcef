inherited frmConcilia: TfrmConcilia
  Left = 37
  Top = 129
  Caption = 'Conciliação Bancária'
  ClientHeight = 409
  ClientWidth = 772
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 370
    object pnlDadosFiltro: TPanel
      Left = 5
      Top = 5
      Width = 762
      Height = 68
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object btnFiltra: TBitBtn
        Left = 621
        Top = 10
        Width = 97
        Height = 41
        Caption = '&Seleciona'
        TabOrder = 3
        OnClick = btnFiltraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object gbSaldoExtrato: TGroupBox
        Left = 351
        Top = 6
        Width = 262
        Height = 55
        Caption = 'Saldo do Extrato'
        TabOrder = 2
        object lblSaldo: TLabel
          Left = 9
          Top = 17
          Width = 111
          Height = 13
          Caption = 'em Moeda Corrente'
        end
        object Label1: TLabel
          Left = 138
          Top = 17
          Width = 94
          Height = 13
          Caption = 'em Outra Moeda'
        end
        object ednSaldoOMoeda: TRealEdit
          Left = 135
          Top = 30
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object ednSaldoCorrente: TRealEdit
          Left = 6
          Top = 30
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
      end
      object gbData: TGroupBox
        Left = 213
        Top = 6
        Width = 133
        Height = 55
        TabOrder = 1
        object lblDataExtrato: TLabel
          Left = 4
          Top = 14
          Width = 90
          Height = 13
          Caption = 'Data do Extrato'
        end
        object edDataExtrato: TCMDateTimePicker
          Left = 4
          Top = 27
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
      end
      object gbBanco: TGroupBox
        Left = 3
        Top = 6
        Width = 208
        Height = 55
        TabOrder = 0
        object lblContaBanco: TLabel
          Left = 6
          Top = 15
          Width = 125
          Height = 13
          Caption = 'Conta Bancária/Caixa'
        end
        object dblcPortador: TwwDBLookupCombo
          Left = 6
          Top = 27
          Width = 196
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'NOCONTACORR'#9'15'#9'Conta')
          LookupTable = qryPortador
          LookupField = 'CODPORTADOR'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcPortadorExit
        end
      end
    end
    object dbgExtrato: TwwDBGrid
      Left = 5
      Top = 73
      Width = 762
      Height = 218
      Hint = 
        'Duplo Click no campo Status, troca o status de não conciliado pa' +
        'ra conciliado e vice versa'
      ControlType.Strings = (
        'STATUSCONCILIA;CheckBox;P;N')
      PictureMasks.Strings = (
        'VALORLANCFINAN'#9'#,##0.00;(#,##0.00)'#9'T'#9'T'
        'VALOROUTRAMOEDA'#9'#,##0.00;(#,##0.00)'#9'T'#9'T')
      Selected.Strings = (
        'STATUSCONCILIA'#9'1'#9'Status'#9'F'
        'DATALANCFINAN'#9'10'#9'Data '#9'F'
        'NUMCHQBORDERO'#9'15'#9'Documento'#9'F'
        'ENTRADASAIDA'#9'1'#9'E/S'#9'F'
        'VALORLANCFINAN'#9'10'#9'Valor Moeda Corrente'#9'F'
        'VALOROUTRAMOEDA'#9'10'#9'Valor Outra Moeda'#9'F'
        'HISTORICO'#9'60'#9'Histórico'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsExtrato
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgExtratoTitleButtonClick
      IndicatorColor = icBlack
    end
    object plnSaldos: TPanel
      Left = 5
      Top = 291
      Width = 762
      Height = 74
      Align = alBottom
      TabOrder = 2
      object gbCorrente: TGroupBox
        Left = 8
        Top = 9
        Width = 449
        Height = 61
        Caption = 'Saldo Conciliado em Moeda Corrente'
        Enabled = False
        TabOrder = 0
        object lblSaldoConciliadoAn: TLabel
          Left = 153
          Top = 18
          Width = 121
          Height = 13
          Caption = 'Antes da Conciliação'
        end
        object lblSaldoConciliadoAt: TLabel
          Left = 302
          Top = 18
          Width = 110
          Height = 13
          Caption = 'Após a Conciliação'
        end
        object Label2: TLabel
          Left = 9
          Top = 18
          Width = 68
          Height = 13
          Caption = 'Dia Anterior'
        end
        object edSaldoConciliadoAnt: TEditNum
          Left = 152
          Top = 32
          Width = 136
          Height = 21
          Enabled = False
          TabOrder = 0
          IntDigits = 17
          Signal = True
          DecDigits = 2
          Numeric = True
          Alignment = taRightJustify
        end
        object edSaldoConciliadoAtu: TEditNum
          Left = 304
          Top = 32
          Width = 131
          Height = 21
          Enabled = False
          TabOrder = 1
          IntDigits = 17
          Signal = True
          DecDigits = 2
          Numeric = True
          Alignment = taRightJustify
        end
        object edSaldoConciliadoAnterior: TEditNum
          Left = 8
          Top = 32
          Width = 128
          Height = 21
          TabStop = False
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 2
          IntDigits = 17
          Signal = True
          DecDigits = 2
          Numeric = True
          Alignment = taRightJustify
        end
      end
      object gbOutraMoeda: TGroupBox
        Left = 464
        Top = 9
        Width = 289
        Height = 61
        Caption = 'Saldo Conciliado em Outra Moeda'
        Enabled = False
        TabOrder = 1
        object lblSaldoConciliaOMAt: TLabel
          Left = 152
          Top = 18
          Width = 110
          Height = 13
          Caption = 'Após a Conciliação'
        end
        object lblSaldoConciliaOMAn: TLabel
          Left = 16
          Top = 18
          Width = 121
          Height = 13
          Caption = 'Antes da Conciliação'
        end
        object edSaldoConciliaOMAtu: TEditNum
          Left = 152
          Top = 34
          Width = 123
          Height = 21
          Enabled = False
          TabOrder = 1
          IntDigits = 17
          Signal = True
          DecDigits = 2
          Numeric = True
          Alignment = taRightJustify
        end
        object edSaldoConciliaOMAnt: TEditNum
          Left = 16
          Top = 34
          Width = 123
          Height = 21
          Enabled = False
          TabOrder = 0
          IntDigits = 17
          Signal = True
          DecDigits = 2
          Numeric = True
          Alignment = taRightJustify
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryPortador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PORTADORCONTA')
    ValidateWithMask = True
    Left = 144
    Top = 16
  end
  object qryExtrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT * FROM MOVIMFINANC WHERE STATUSCONCILIA = '#39'N'#39' OR STATUSCO' +
        'NCILIA = '#39'C'#39)
    UpdateObject = updExtrato
    ControlType.Strings = (
      'STATUSCONCILIA;CheckBox;P;N')
    PictureMasks.Strings = (
      'VALORLANCFINAN'#9'#,##0.00'#9'T'#9'T'
      'VALOROUTRAMOEDA'#9'#,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 160
    Top = 80
  end
  object dsExtrato: TwwDataSource
    DataSet = cdsExtrato
    Left = 328
    Top = 80
  end
  object updExtrato: TUpdateSQL
    ModifySQL.Strings = (
      'update MOVIMFINANC'
      'set'
      '  STATUSCONCILIA = :STATUSCONCILIA'
      'where'
      '  CODLANCFINANC = :OLD_CODLANCFINANC')
    InsertSQL.Strings = (
      'insert into MOVIMFINANC'
      '  (STATUSCONCILIA)'
      'values'
      '  (:STATUSCONCILIA)')
    DeleteSQL.Strings = (
      'delete from MOVIMFINANC'
      'where'
      '  CODLANCFINANC = :OLD_CODLANCFINANC')
    Left = 384
    Top = 80
  end
  object cdsExtrato: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'PLNCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'IDMODULO'
        DataType = ftFloat
      end
      item
        Name = 'HISTPADFINAN'
        DataType = ftFloat
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'IDUSUARIOINCLUSAO'
        DataType = ftFloat
      end
      item
        Name = 'CODPORTADOR'
        DataType = ftFloat
      end
      item
        Name = 'VALORLANCFINAN'
        DataType = ftFloat
      end
      item
        Name = 'NUMCHQBORDERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DATALANCFINAN'
        DataType = ftDateTime
      end
      item
        Name = 'DATACONCILIACAO'
        DataType = ftDateTime
      end
      item
        Name = 'ENTRADASAIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'STATUSCONCILIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCTRANSF'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDNFLIVRO'
        DataType = ftFloat
      end
      item
        Name = 'DATADISPFINANC'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspExtrato'
    StoreDefs = True
    Left = 272
    Top = 80
    object cdsExtratoSTATUSCONCILIA: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 1
      FieldName = 'STATUSCONCILIA'
      Origin = 'MOVIMFINANC.STATUSCONCILIA'
      OnChange = cdsExtratoSTATUSCONCILIAChange
      Size = 1
    end
    object cdsExtratoDATALANCFINAN: TDateTimeField
      DisplayLabel = 'Data '
      DisplayWidth = 10
      FieldName = 'DATALANCFINAN'
      Origin = 'MOVIMFINANC.DATALANCFINAN'
      ReadOnly = True
    end
    object cdsExtratoNUMCHQBORDERO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 15
      FieldName = 'NUMCHQBORDERO'
      Origin = 'MOVIMFINANC.NUMCHQBORDERO'
      ReadOnly = True
      Size = 15
    end
    object cdsExtratoENTRADASAIDA: TStringField
      DisplayLabel = 'E/S'
      DisplayWidth = 1
      FieldName = 'ENTRADASAIDA'
      Origin = 'MOVIMFINANC.ENTRADASAIDA'
      ReadOnly = True
      Size = 1
    end
    object cdsExtratoVALORLANCFINAN: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'VALORLANCFINAN'
      Origin = 'MOVIMFINANC.VALORLANCFINAN'
      ReadOnly = True
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsExtratoVALOROUTRAMOEDA: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'VALOROUTRAMOEDA'
      Origin = 'MOVIMFINANC.VALOROUTRAMOEDA'
      ReadOnly = True
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsExtratoHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICO'
      Origin = 'MOVIMFINANC.HISTORICO'
      ReadOnly = True
      Size = 60
    end
    object cdsExtratoCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
      Origin = 'MOVIMFINANC.CODLANCFINANC'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'MOVIMFINANC.PLNCODIGO'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'MOVIMFINANC.IDMODULO'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoHISTPADFINAN: TFloatField
      FieldName = 'HISTPADFINAN'
      Origin = 'MOVIMFINANC.HISTPADFINAN'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOVIMFINANC.MOECODIGO'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'MOVIMFINANC.IDUSUARIOINCLUSAO'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'MOVIMFINANC.CODPORTADOR'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoDATACONCILIACAO: TDateTimeField
      FieldName = 'DATACONCILIACAO'
      Origin = 'MOVIMFINANC.DATACONCILIACAO'
      ReadOnly = True
      Visible = False
    end
    object cdsExtratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'MOVIMFINANC.IDPESSOA'
      ReadOnly = True
      Visible = False
    end
  end
  object dspExtrato: TDataSetProvider
    DataSet = qryExtrato
    Constraints = True
    Left = 216
    Top = 80
  end
end
