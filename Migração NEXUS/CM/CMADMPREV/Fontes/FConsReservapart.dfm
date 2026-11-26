inherited frmConsReservaPart: TfrmConsReservaPart
  Left = 332
  Top = 33
  Caption = 'Consulta de Reservas do Participante'
  ClientHeight = 467
  ClientWidth = 686
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 686
    Height = 428
    object pnlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 684
      Height = 119
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblTexto: TLabel
        Left = 13
        Top = 3
        Width = 235
        Height = 23
        Caption = 'Participante Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object pnlDados: TPanel
        Left = 12
        Top = 28
        Width = 651
        Height = 85
        Enabled = False
        TabOrder = 0
        object Label2: TLabel
          Left = 13
          Top = 6
          Width = 42
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPatro: TLabel
          Left = 13
          Top = 43
          Width = 99
          Height = 16
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 342
          Top = 6
          Width = 146
          Height = 16
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edNome: TEdit
          Left = 13
          Top = 21
          Width = 315
          Height = 21
          TabOrder = 0
        end
        object edPatro: TEdit
          Left = 13
          Top = 58
          Width = 315
          Height = 21
          TabOrder = 1
        end
        object edPlano: TEdit
          Left = 342
          Top = 21
          Width = 295
          Height = 21
          TabOrder = 2
        end
      end
    end
    object pnlArvore: TPanel
      Left = 1
      Top = 120
      Width = 684
      Height = 307
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 364
        Top = 11
        Width = 109
        Height = 13
        Caption = 'Código da Reserva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 364
        Top = 55
        Width = 48
        Height = 13
        Caption = 'Reserva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 449
        Top = 98
        Width = 39
        Height = 13
        Caption = 'Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TLabel
        Left = 405
        Top = 245
        Width = 225
        Height = 13
        Caption = 'Esta Reserva não Pertence a este Participante.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlValores: TPanel
        Left = 368
        Top = 213
        Width = 301
        Height = 82
        BevelOuter = bvLowered
        TabOrder = 5
        object lblValores: TLabel
          Left = 1
          Top = 1
          Width = 147
          Height = 20
          Caption = 'Valores da Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 27
          Top = 30
          Width = 90
          Height = 13
          Caption = 'Valor na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 171
          Top = 30
          Width = 80
          Height = 13
          Caption = 'Valor em Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edValMoeda: TEdit
          Left = 27
          Top = 43
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edValReal: TEdit
          Left = 171
          Top = 43
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
      end
      object pnlCotacao: TPanel
        Left = 368
        Top = 140
        Width = 300
        Height = 67
        BevelOuter = bvLowered
        TabOrder = 3
        object Label9: TLabel
          Left = 22
          Top = 25
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 168
          Top = 25
          Width = 30
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCotacao: TLabel
          Left = 1
          Top = 1
          Width = 62
          Height = 20
          Caption = 'Cotação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object dtCotacao: TCMDateTimePicker
          Left = 22
          Top = 38
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
          OnExit = dtCotacaoExit
        end
        object edValorCot: TEdit
          Left = 168
          Top = 38
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
      end
      object cmtvTipoReserva: TCMTreeView
        Left = 1
        Top = 1
        Width = 357
        Height = 305
        PodeNavegar = True
        DataSource = ds
        CampoChave = qryReservaXPlanoCODHIERARQUIA
        CampoDescricao = qryReservaXPlanoNOME
        CampoTipo = qryReservaXPlanoANALITICOSINTETI
        Align = alLeft
      end
      object meCodHierarquia: TMaskEdit
        Left = 364
        Top = 25
        Width = 201
        Height = 21
        TabOrder = 0
      end
      object dbedReserva: TDBEdit
        Left = 364
        Top = 69
        Width = 300
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 1
      end
      object dbedMoeda: TwwDBEdit
        Left = 449
        Top = 110
        Width = 121
        Height = 21
        DataField = 'MOESIGLA'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnChange = dbedMoedaChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 686
    inherited tb97Fundo: TToolbar97
      Left = 518
      DockPos = 520
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryReservaXPlano
    Left = 33
    Top = 421
  end
  object qryReservaXPlano: TwwQuery
    AfterScroll = qryReservaXPlanoAfterScroll
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT  R.CODHIERARQUIA, R.ANALITICOSINTETI, R.NOME,'
      
        '                R.FLGCONTROLE, R.IDTIPORESERVA, R.INDICEREAJUSTE' +
        ','
      '                M.MOESIGLA '
      'FROM RESERVAXPLANO R, MOEDA M'
      'WHERE  R.INDICEREAJUSTE = M.MOECODIGO(+) AND'
      '                R.FLGCOLETIVA = 0'
      '            ')
    ValidateWithMask = True
    Left = 110
    Top = 421
    object qryReservaXPlanoCODHIERARQUIA: TStringField
      FieldName = 'CODHIERARQUIA'
      Size = 8
    end
    object qryReservaXPlanoANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Size = 1
    end
    object qryReservaXPlanoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qryReservaXPlanoFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
    end
    object qryReservaXPlanoIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object qryReservaXPlanoINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object qryReservaXPlanoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryReservaPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RESERVAPART'
      'WHERE IDPLANOPREV = :iIdPlanoPrev AND'
      '               IDPESSOA = :iIdPessoa AND'
      '               IDPESSJUR = :iIdPessJur AND'
      '               IDTIPORESERVA = :iIdTipoReserva')
    ValidateWithMask = True
    Left = 208
    Top = 421
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdTipoReserva'
        ParamType = ptUnknown
      end>
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA,COTVALOR'
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :iIdMoeda AND'
      '     COTDATA IN'
      
        '      (SELECT MAX(COTDATA) FROM COTACAOMOEDA WHERE MOECODIGO = :' +
        'iIdMoeda)')
    ValidateWithMask = True
    Left = 292
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end>
  end
  object qryHistMovReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RESERVAPART'
      'WHERE IDPLANOPREV = :iIdPlanoPrev AND'
      '               IDPESSOA = :iIdPessoa AND'
      '               IDPESSJUR = :iIdPessJur AND'
      '               IDTIPORESERVA = :iIdTipoReserva')
    ValidateWithMask = True
    Left = 372
    Top = 421
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdTipoReserva'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 453
    Top = 421
  end
end
