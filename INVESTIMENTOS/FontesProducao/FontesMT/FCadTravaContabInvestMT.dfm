inherited FrmCadTravaContabInvest: TFrmCadTravaContabInvest
  Left = 180
  Top = 176
  HelpContext = 790134
  Caption = 'Cadastro'
  ClientHeight = 446
  ClientWidth = 658
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 658
    Height = 329
    inherited dbGrd: TwwDBGrid [0]
      Width = 656
      Height = 327
      Selected.Strings = (
        'DESCTIPOINVEST'#9'25'#9'Tipo de Investimento'#9'F'
        'DESCCLASSE'#9'42'#9'Classe'#9'F'
        'DTATRAVACTB'#9'13'#9'Data Bloqueio'#9'F')
    end
    inherited pnlControles: TPanel [1]
      Width = 656
      Height = 327
      object Label8: TLabel
        Left = 16
        Top = 132
        Width = 99
        Height = 13
        Caption = 'Data do Bloqueio'
      end
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object lblClasse: TLabel
        Left = 16
        Top = 51
        Width = 38
        Height = 13
        Caption = 'Classe'
      end
      object lblMercado: TLabel
        Left = 16
        Top = 91
        Width = 50
        Height = 13
        Caption = 'Mercado'
      end
      object dbdDataBloq: TCMDateTimePicker
        Left = 16
        Top = 148
        Width = 126
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTATRAVACTB'
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
        TabOrder = 3
      end
      object dblTipoInvest: TCMDBLookupCombo
        Left = 16
        Top = 24
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'30'#9'Descrição'#9'F')
        DataField = 'IDTIPOINVEST'
        DataSource = ds
        LookupTable = CdsTipoInvest
        LookupField = 'IDTIPOINVEST'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkClasseTit: TCMDBLookupCombo
        Left = 16
        Top = 67
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Descrição'#9'F')
        DataField = 'IDCLASSETIT'
        DataSource = ds
        LookupTable = CdsClasseRenfix
        LookupField = 'IDCLASSETIT'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkMercado: TCMDBLookupCombo
        Left = 16
        Top = 107
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCMERCADO'#9'30'#9'Descrição'#9'F')
        DataField = 'IDMERCADO'
        DataSource = ds
        LookupTable = CdsMercado
        LookupField = 'IDMERCADO'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 658
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 658
    inherited tb97Fundo: TToolbar97
      Left = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
    end
  end
  inherited pnlTitulo: TPanel
    Width = 658
    inherited lbNomItem: TfcLabel
      Width = 267
      Caption = 'Trava Contabil por Módulo'
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   A.IDTIPOINVEST, A.DESCTIPOINVEST,'
      '   A.DESCCLASSE,'
      '   A.IDCLASSETIT,  A.IDMERCADO, '
      '   A.DTATRAVACTB'
      'FROM'
      '(    '
      'SELECT'
      '   T.IDTIPOINVEST, T.DESCTIPOINVEST,'
      '   0 AS IDCLASSETIT, 0 AS IDMERCADO, '
      '   (T.DESCTIPOINVEST) AS DESCCLASSE,'
      '   TO_DATE('#39'01/01/2006'#39','#39'DD/MM/YYYY'#39') AS DTATRAVACTB'
      'FROM'
      '   TIPOINVEST T'
      'WHERE '
      '   T.IDTIPOINVEST IN (1,5,6,7,9)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '   T.IDTIPOINVEST, T.DESCTIPOINVEST,'
      '   C.IDCLASSETIT, 0 AS IDMERCADO, '
      '   (C.DESCCLASSETIT) AS DESCCLASSE,'
      '   TO_DATE('#39'01/01/2006'#39','#39'DD/MM/YYYY'#39') AS DTATRAVACTB'
      'FROM'
      '   CLASSETITRENFIX C, TIPOINVEST T'
      'WHERE'
      '    (T.IDTIPOINVEST = 1)'
      '    AND ((FLGATIVA = '#39'S'#39') OR (FLGATIVA IS NULL))'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '   T.IDTIPOINVEST, T.DESCTIPOINVEST,'
      '   0 AS IDCLASSETIT, M.IDMERCADO, '
      '   (M.DESCMERCADO) AS DESCCLASSE,'
      '   TO_DATE('#39'01/01/2006'#39','#39'DD/MM/YYYY'#39') AS DTATRAVACTB'
      'FROM'
      '   MERCADO M, TIPOINVEST T'
      'WHERE'
      '    (T.IDTIPOINVEST = 2)'
      '    AND (M.IDMERCADO IN (1,5,6,8))'
      '    AND (M.IDTIPOINVEST = T.IDTIPOINVEST)'
      ') A'
      'ORDER BY A.DESCTIPOINVEST, DESCCLASSE'
      ''
      ' ')
    ClientDataSet = Cds
    Left = 304
    Top = 151
  end
  object CdsTipoInvest: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 468
    Top = 103
    Data = {
      7F0200009619E0BD010000001800000006000A00000003000000E5000C494454
      49504F494E5645535408000400000000000E444553435449504F494E56455354
      0100490000000100055749445448020002003C000D5452474454494E434C5553
      414F08000800000000000F54524755534552494E434C5553414F010049000000
      0100055749445448020002001E000B434F445345474441494541010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000B445441545241564143544208000800000000000100044C4349
      440400010009080000000005000000000000F03F0A52656E6461204669786100
      FCE02482AFCC4202434D00000500000000000000400E52656E64612056617269
      6176656C00F0E22482AFCC4202434D00000500000000000008401A496E766573
      74696D656E746F7320496D6F62696C696172696F7300F0E22482AFCC4202434D
      00000500000000000010400B456D7072657374696D6F7300F0E22482AFCC4202
      434D0000050000000000001C401146756E646F20496D6F62696C696172696F00
      601DA827B4CC4208434D53454C454354000005000000000000204004424D2646
      00DC32A827B4CC4208434D53454C45435400000500000000000014401346756E
      646F2064652052656E64612046697861002834549DB3CC4203434D3200500500
      000000000018401746756E646F2064652052656E64612056617269E176656C00
      0005000000000000F0BF0F4361727461206465204669616EE7610024149094B8
      CC4208434D33303732363500000500000000000022401B46756E646F20646520
      4469726569746F20437265646974F372696F00F88E22A3BECC4208434D333135
      383632}
  end
  object CdsMercado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 468
    Top = 151
  end
  object CdsClasseRenfix: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 468
    Top = 198
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM TIPOINVEST')
    ClientDataSet = CdsTipoInvest
    Left = 544
    Top = 111
  end
end
