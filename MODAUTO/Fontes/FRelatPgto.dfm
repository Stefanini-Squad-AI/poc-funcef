inherited frmRelatPgto: TfrmRelatPgto
  Left = 196
  Top = 128
  Caption = 'Pagamentos/Recebimentos'
  ClientHeight = 349
  ClientWidth = 540
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 540
    Height = 310
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 530
      Height = 300
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object Label1: TLabel
        Left = 25
        Top = 176
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object Label3: TLabel
        Left = 24
        Top = 216
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object Label4: TLabel
        Left = 13
        Top = 256
        Width = 64
        Height = 13
        Caption = 'Favorecido'
      end
      object dbcContrato: TwwDBLookupCombo
        Left = 89
        Top = 176
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECONTRATO'#9'60'#9'Nome do Contrato')
        LookupTable = qryContrato
        LookupField = 'IDCONTRATO'
        Options = [loTitles]
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object gbDatasProgramadas: TGroupBox
        Left = 35
        Top = 85
        Width = 322
        Height = 67
        Caption = 'Datas Programadas compreendidas entre:'
        Enabled = False
        TabOrder = 1
        object Label2: TLabel
          Left = 160
          Top = 33
          Width = 8
          Height = 13
          Caption = 'e'
        end
        object dtInicio: TCMDateTimePicker
          Left = 15
          Top = 27
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clGray
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
        object dtFim: TCMDateTimePicker
          Left = 185
          Top = 27
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clGray
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
      end
      object rdDatas: TRadioGroup
        Left = 36
        Top = 24
        Width = 321
        Height = 57
        Caption = 'Seleção das Datas Programadas'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Todos'
          'Intervalo de Datas')
        TabOrder = 0
        OnClick = rdDatasClick
      end
      object dbcFavorecido: TwwDBLookupCombo
        Left = 88
        Top = 256
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'RAZAOSOCIAL'#9'60'#9'Razão Social')
        LookupTable = qryFavorecido
        LookupField = 'IDFORCLI'
        Options = [loTitles]
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dbcProcesso: TwwDBLookupCombo
        Left = 88
        Top = 216
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODCONTRATOEMPR'#9'20'#9'Processo')
        LookupTable = qryProcesso
        LookupField = 'CODCONTRATOEMPR'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object rdPgtoRec: TRadioGroup
        Left = 389
        Top = 25
        Width = 113
        Height = 126
        Ctl3D = True
        ItemIndex = 0
        Items.Strings = (
          'Pagamento'
          'Recebimento')
        ParentCtl3D = False
        TabOrder = 2
        OnClick = rdDatasClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 310
    Width = 540
    inherited tb97Fundo: TToolbar97
      Left = 209
      DockPos = 209
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 41
      DockPos = 41
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
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
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.NOMECONTRATO,C.IDCONTRATO'
      'FROM CONTRATOCONTR C, CONTRATOUSUARIO U'
      'WHERE C.IDCONTRATO=U.IDCONTRATO'
      '      AND U.IDUSUARIO = :IDUSUARIO'
      'ORDER BY C.NOMECONTRATO')
    ValidateWithMask = True
    Left = 325
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryContratoNOMECONTRATO: TStringField
      DisplayLabel = 'Nome do Contrato'
      DisplayWidth = 60
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryContratoIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
  end
  object qryProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.CODCONTRATOEMPR'
      'FROM CONTRATOCONTR C, CONTRATOUSUARIO U'
      'WHERE C.IDCONTRATO=U.IDCONTRATO'
      '      AND U.IDUSUARIO = :IDUSUARIO'
      'ORDER BY C.CODCONTRATOEMPR'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 213
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryProcessoCODCONTRATOEMPR: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 20
      FieldName = 'CODCONTRATOEMPR'
    end
  end
  object qryFavorecido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.IDFORCLI,P.RAZAOSOCIAL'
      'FROM CONTRATOCONTR C,'
      '     CONTRATOUSUARIO U, PESSOA P'
      'WHERE C.IDCONTRATO = U.IDCONTRATO'
      '      AND C.IDFORCLI = P.IDPESSOA'
      '      AND U.IDUSUARIO = :IDUSUARIO'
      'ORDER BY P.RAZAOSOCIAL'
      ''
      '')
    ValidateWithMask = True
    Left = 141
    Top = 245
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryFavorecidoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFavorecidoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
  end
end
