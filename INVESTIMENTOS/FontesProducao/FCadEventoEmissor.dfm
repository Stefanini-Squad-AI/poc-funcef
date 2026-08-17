inherited frmCadEventoEmissor: TfrmCadEventoEmissor
  Left = 134
  Top = 179
  Caption = 'Cadastro de Eventos Associados ao Emissor'
  ClientHeight = 289
  ClientWidth = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 406
    Height = 203
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 404
      Height = 201
      Align = alClient
      Caption = ' Evento: '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Emissor:'
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 92
        Height = 13
        Caption = 'Tipo do Evento:'
      end
      object Label3: TLabel
        Left = 144
        Top = 96
        Width = 32
        Height = 13
        Caption = 'Data:'
      end
      object LbLValor: TLabel
        Left = 16
        Top = 96
        Width = 34
        Height = 13
        Caption = 'Valor:'
      end
      object DBlkEmissor: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'40'#9'Emissores')
        DataField = 'IDEMISSOR'
        DataSource = ds
        LookupTable = QryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBlkTipoEvento: TwwDBLookupCombo
        Left = 16
        Top = 72
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTPEVENEMISSOR'#9'40'#9'Tipo de Evento')
        DataField = 'IDTIPOEVENEMISSOR'
        DataSource = ds
        LookupTable = QryTipoEvento
        LookupField = 'IDTIPOEVENEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBData: TCMDateTimePicker
        Left = 144
        Top = 112
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAEVENTOEMISSOR'
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
      object dbreValor: TDBRealEdit
        Left = 16
        Top = 112
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '     10,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VlrEventoEmissor'
        DataSource = ds
      end
      object dbrgStat: TDBRadioGroup
        Left = 16
        Top = 136
        Width = 369
        Height = 49
        Caption = 'Status:'
        Columns = 2
        DataField = 'StatEventoEmissor'
        DataSource = ds
        Items.Strings = (
          '&Previsto'
          '&Realizado')
        TabOrder = 4
        Values.Strings = (
          'P'
          'R')
      end
    end
  end
  inherited Dock972: TDock97
    Width = 406
  end
  inherited Dock971: TDock97
    Top = 250
    Width = 406
    inherited tb97Fundo: TToolbar97
      Left = 234
      DockPos = 235
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 65
      DockPos = 66
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.EVENTOEMISSOR'
      'set'
      '  IDTIPOEVENEMISSOR = :IDTIPOEVENEMISSOR,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  DATAEVENTOEMISSOR = :DATAEVENTOEMISSOR,'
      '  VLREVENTOEMISSOR = :VLREVENTOEMISSOR,'
      '  STATEVENTOEMISSOR = :STATEVENTOEMISSOR'
      'where'
      '  IDTIPOEVENEMISSOR = :OLD_IDTIPOEVENEMISSOR and'
      '  IDEMISSOR = :OLD_IDEMISSOR and'
      '  DATAEVENTOEMISSOR = :OLD_DATAEVENTOEMISSOR')
    InsertSQL.Strings = (
      'insert into CM.EVENTOEMISSOR'
      
        '  (IDTIPOEVENEMISSOR, IDEMISSOR, DATAEVENTOEMISSOR, VLREVENTOEMI' +
        'SSOR, STATEVENTOEMISSOR)'
      'values'
      
        '  (:IDTIPOEVENEMISSOR, :IDEMISSOR, :DATAEVENTOEMISSOR, :VLREVENT' +
        'OEMISSOR, '
      '   :STATEVENTOEMISSOR)')
    DeleteSQL.Strings = (
      'delete from CM.EVENTOEMISSOR'
      'where'
      '  IDTIPOEVENEMISSOR = :OLD_IDTIPOEVENEMISSOR and'
      '  IDEMISSOR = :OLD_IDEMISSOR and'
      '  DATAEVENTOEMISSOR = :OLD_DATAEVENTOEMISSOR')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'Emissor.SiglaEmissor'
      'EventoEmissor.IdTipoEvenEmissor'
      'EventoEmissor.DataEventoEmissor'
      'EventoEmissor.StatEventoEmissor')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'C')
    Descricao.Strings = (
      'Emissor'
      'Evento'
      'Data'
      'Status')
    Tabelas.Strings = (
      'CM.EVENTOEMISSOR'
      'CM.EMISSOR')
    CamposChave.Strings = (
      'EventoEmissor.IdTipoEvenEmissor'
      'EventoEmissor.DataEventoEmissor'
      'EventoEmissor.IdEmissor'
      'Emissor.IdEmissor')
    Filtro.Strings = (
      'Emissor.IdEmissor = EventoEmissor.IdEmissor')
    Left = 333
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '#9'EE.IDTIPOEVENEMISSOR ,'
      #9'EE.IDEMISSOR ,'
      '               '#9'EE.DATAEVENTOEMISSOR ,'
      '               '#9'EE.VLREVENTOEMISSOR ,'
      '               '#9'EE.STATEVENTOEMISSOR'
      'FROM '
      '              '#9'CM.EVENTOEMISSOR EE')
  end
  object QryEmissor: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select EM.IdEmissor , EM.SiglaEmissor'
      'from CM.Emissor EM')
    ValidateWithMask = True
    Left = 342
    Top = 84
  end
  object QryTipoEvento: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select TEE.idTipoEvenEmissor , TEE.DescTpEvenEmissor'
      'from CM.TipoEvenEmissor TEE')
    ValidateWithMask = True
    Left = 342
    Top = 116
  end
  object qryProcura: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 342
    Top = 52
  end
end
