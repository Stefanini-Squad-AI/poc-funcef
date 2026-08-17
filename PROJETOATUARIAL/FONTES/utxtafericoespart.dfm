inherited frmTXTdeAfericaoPart: TfrmTXTdeAfericaoPart
  Left = 232
  Top = 31
  HelpContext = 40392
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TXT de Aferições'
  ClientHeight = 460
  ClientWidth = 512
  OnDestroy = FormDestroy
  OnPaint = nil
  OnResize = nil
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 512
    Height = 421
    BorderWidth = 1
    ParentFont = False
    object Label2: TLabel
      Left = 15
      Top = 101
      Width = 82
      Height = 13
      Caption = 'Planos existentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 352
      Top = 140
      Width = 132
      Height = 52
      Caption = 
        'Selecione a unidade e a pasta de destino para o seu arquivo .TXT' +
        ' de Aferições'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 16
      Top = 296
      Width = 96
      Height = 13
      Caption = 'Destino selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 352
      Top = 200
      Width = 82
      Height = 13
      Caption = 'Pasta de destino '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 344
      Top = 102
      Width = 112
      Height = 13
      Caption = 'Unidades selecionáveis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
      Top = 199
      Width = 71
      Height = 13
      Caption = 'Patrocinadoras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Path: TEdit
      Left = 14
      Top = 311
      Width = 327
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 332
      Width = 326
      Height = 81
      Caption = 'Status da tarefa'
      TabOrder = 4
      object LabelAguarde: TLabel
        Left = 21
        Top = 15
        Width = 114
        Height = 13
        Caption = 'Aguardando comando...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelTotReg: TLabel
        Left = 24
        Top = 62
        Width = 88
        Height = 13
        Caption = '0 Registros Salvos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ProgressBarTXTAfericoes: TProgressBar
        Left = 20
        Top = 34
        Width = 282
        Height = 23
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object DriveComboBoxAfericoes: TDriveComboBox
      Left = 345
      Top = 118
      Width = 153
      Height = 19
      DirList = DirectoryListBoxAfericoes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DirectoryListBoxAfericoes: TDirectoryListBox
      Left = 349
      Top = 216
      Width = 153
      Height = 197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = DirectoryListBoxAfericoesChange
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 4
      Width = 487
      Height = 93
      Caption = 'Parâmentros para geração do TXT de Aferições'
      TabOrder = 0
      object LabelPercentualDeAlimentacao: TLabel
        Left = 22
        Top = 70
        Width = 264
        Height = 13
        Caption = 'Pecentual para alimentação de reservas do Participante'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 24
        Top = 23
        Width = 256
        Height = 13
        Caption = 'Data de referência para registro que gravados no TXT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object spbSobre: TSpeedButton
        Left = 448
        Top = 61
        Width = 25
        Height = 25
        Hint = 'Considerações'
        AllowAllUp = True
        GroupIndex = 1
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
          33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
          FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
          FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
          FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
          FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
          FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
          3333333773FFFF77333333333FBFBF3333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = spbSobreClick
      end
      object sePercentualDeAlimentacao: TSpinEdit
        Left = 304
        Top = 64
        Width = 61
        Height = 22
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 1000
        MinValue = 1
        ParentFont = False
        TabOrder = 2
        Value = 100
      end
      object DataDeAfericao: TCMDateTimePicker
        Left = 300
        Top = 16
        Width = 129
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 0
        OnChange = DirectoryListBoxAfericoesChange
      end
      object cbContabContribNaoPresentesNasReservas: TCheckBox
        Left = 22
        Top = 46
        Width = 285
        Height = 17
        Caption = 'Contabilizar contribuições não colocadas nas Reservas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = cbContabContribNaoPresentesNasReservasClick
      end
    end
    object CheckListBoxPlanPrev: TCheckListBox
      Left = 16
      Top = 119
      Width = 321
      Height = 77
      OnClickCheck = CheckListBoxPlanPrevClickCheck
      ItemHeight = 13
      TabOrder = 5
    end
    object CheckListBoxPlanPrevPatro: TCheckListBox
      Tag = 1
      Left = 16
      Top = 216
      Width = 322
      Height = 77
      OnClickCheck = CheckListBoxPlanPrevClickCheck
      ItemHeight = 13
      TabOrder = 6
    end
    object pnlSobre: TPanel
      Left = 60
      Top = 78
      Width = 389
      Height = 267
      BevelInner = bvRaised
      TabOrder = 7
      Visible = False
      object pnlCabec: TPanel
        Left = 6
        Top = 6
        Width = 377
        Height = 32
        BevelOuter = bvLowered
        TabOrder = 0
        object Label8: TLabel
          Left = 34
          Top = 10
          Width = 313
          Height = 13
          Caption = 'Considerações sobre o cáculo reservas do participante'
        end
      end
      object pnlText: TPanel
        Left = 6
        Top = 46
        Width = 377
        Height = 214
        BevelOuter = bvLowered
        TabOrder = 1
        object Memo1: TMemo
          Left = 1
          Top = 1
          Width = 375
          Height = 212
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            ''
            'A alimentação da reserva do participante segue as regras abaixo:'
            ''
            '1 - Não considera contribuição devolvida ao participante'
            ''
            '2 - Quando houver divergência será cobrado o menor valor '
            '     (entre o esperado e o recebido) se não houve recebimento'
            ''
            
              '3 - O salário de participação na data de inscrição é formado pel' +
              'as'
            '    rubricas de salário no mês de inscrição'
            ''
            
              '4 - O salário de participação no mês de referência é formado pel' +
              'as'
            
              '    rubricas de salário no mês de referência (selecionado pelo u' +
              'suário)')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 421
    Width = 512
    inherited tb97Fundo: TToolbar97
      Left = 239
      DockPos = 239
      TabOrder = 0
      inherited bbtnSair: TBitBtn
        ParentFont = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        ParentFont = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 71
      DockPos = 71
      TabOrder = 1
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Ok'
        ParentFont = False
        OnClick = bbtnConfirmarClick
        OnExit = bbtnConfirmarExit
      end
      inherited bbtnCancelar: TBitBtn
        ParentFont = False
        OnClick = bbtnSairClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 479
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryPrincipal: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      '  ')
    ValidateWithMask = True
    Left = 284
    Top = 95
  end
  object wwDSPlanPrev: TwwDataSource
    DataSet = QryPlanPrev
    Left = 128
    Top = 72
  end
  object QryPlanPrev: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT  DISTINCT  pp.IdPlanoPrev,'
      '                  pp.Nome'
      '              '
      'FROM PLANPREV pp'
      ''
      '')
    ValidateWithMask = True
    Left = 168
    Top = 72
    object QryPlanPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREV.IDPLANOPREV'
    end
    object QryPlanPrevNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
  end
  object QryReservasDoParticipante: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT r.IdPessoa,r.IdTipoReserva,NVL(hm.SaldoCotas,0) As "Saldo' +
        'DeCotas",'
      '       rx.INDICEREAJUSTE,rx.flgTitularColet,rx.FlgControle'
      'FROM   RESERVAPART r,'
      
        '(select hm.IdPessoa,hm.IdPessJur,hm.IdPlanoPrev,hm.IdTipoReserva' +
        ',hm.SaldoCotas from HISTMOVRESERVA hm where'
      
        'hm.DataAlimentacao = ( SELECT MAX(hm2.DataAlimentacao) FROM Hist' +
        'MovReserva hm2'
      #9#9'      WHERE     ( hm2.idpessoa = hm.idpessoa)'
      #9#9'      AND       ( hm2.idtiporeserva = hm.idtiporeserva)'
      #9#9'      AND       ( hm2.idpessjur = hm.idpessjur)'
      #9#9'      AND       ( hm2.DataAlimentacao <= :DataDeAfericao) )'
      'AND       ( hm. IdPessoa  = :Pessoa  )'
      'AND       ( hm.IdPessJur= :PessJur )'
      'AND       ( hm.idPlanoPrev = :PlanoPrev  )) hm, reservaxplano rx'
      ''
      'WHERE     ( r.IdPessoa  = :Pessoa  )'
      'AND       ( r.IdPessJur = :PessJur )'
      'AND       ( r.IdPlanoPrev = :PlanoPrev )'
      'AND       ( r.seqproposta = 1)'
      ''
      'AND       ( rx.idtiporeserva = r.idtiporeserva)'
      'AND       ( rx.flgcoletiva = 0)'
      'AND       ( rx.flgcontrole = 0)'
      'AND       ( rx.analiticosinteti = '#39'A'#39')'
      ''
      'AND       (r.idtiporeserva = hm.idtiporeserva(+))'
      ''
      '')
    ValidateWithMask = True
    Left = 408
    Top = 285
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataDeAfericao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end>
    object QryReservasDoParticipanteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryReservasDoParticipanteIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object QryReservasDoParticipanteSaldoDeCotas: TFloatField
      FieldName = 'SaldoDeCotas'
    end
    object QryReservasDoParticipanteINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object QryReservasDoParticipanteFLGTITULARCOLET: TStringField
      FieldName = 'FLGTITULARCOLET'
      Size = 1
    end
    object QryReservasDoParticipanteFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
    end
  end
  object QryContribuicoes: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT c.IdContribuicao,c.ValorBase1'
      'FROM   CONTRIBPREVPARTP c'
      'WHERE (c.IdPessoa = :Pessoa)'
      'AND   (c.IdPlanoPrev = :PlanoPrev)'
      'AND   (c.IdPessJur = :PessJur)'
      'AND   c.IdContribuicao IN (19,21)'
      'ORDER BY c.IdContribuicao   ')
    ValidateWithMask = True
    Left = 46
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PessJur'
        ParamType = ptUnknown
      end>
    object QryContribuicoesIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object QryContribuicoesVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
  end
  object QryBeneficios: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT bf.IdBeneficio,bf.IdSitBeneficio,bf.DataFinal'
      'FROM  BENEFBFCIARIO bf'
      'WHERE (bf.IdPessoa =:Pessoa )'
      'AND (bf.IdPlanoPrev =:PlanoPrev )'
      'AND (bf.IdPessJur =:PessJur)'
      'AND (bf.IdBeneficio = 43 )'
      'AND (bf.IdSitBeneficio = 1)'
      'ORDER BY bf.DataFinal DESC'
      '')
    ValidateWithMask = True
    Left = 148
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PessJur'
        ParamType = ptUnknown
      end>
    object QryBeneficiosIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BENEFBFCIARIO.IDBENEFICIO'
    end
    object QryBeneficiosIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BENEFBFCIARIO.IDSITBENEFICIO'
    end
    object QryBeneficiosDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'BENEFBFCIARIO.DATAFINAL'
    end
  end
  object QryQuadroConvenio: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT qc.cod FROM ELEGPATRO e,TTT qc'
      'WHERE e.MATRICULA = qc.Cod'
      'AND e.IdPessoa = :Pessoa')
    ValidateWithMask = True
    Left = 57
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end>
  end
  object QryIndiceReajuste: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT rp.INDICEREAJUSTE,rp.flgTitularColet,rp.FlgControle'
      'FROM   RESERVAXPLANO rp'
      'WHERE  ( rp.IDPLANOPREV   = :PlanoPrev   )'
      'AND    ( rp.IDTIPORESERVA = :TipoReserva )'
      'AND    ( rp.AnaliticoSinteti = '#39'A'#39' )'
      'AND    ( rp.flgColetiva = 0 )'
      ''
      '')
    ValidateWithMask = True
    Left = 275
    Top = 227
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TipoReserva'
        ParamType = ptUnknown
      end>
  end
  object QryPeriodicidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  MOEPERIODICIDADE '
      'FROM MOEDA '
      'WHERE MOECODIGO = :IndiceReajuste')
    ValidateWithMask = True
    Left = 455
    Top = 371
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IndiceReajuste'
        ParamType = ptUnknown
      end>
  end
  object QryGenerica: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 408
    Top = 48
  end
  object QrySalPartDataDeReferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      H.IDRUBRICA,'
      
        '      DECODE(P.flgDesconto,0,H.VALORPROVENTO,-1 * H.VALORPROVENT' +
        'O) As "SalPartDtRef"'
      'FROM'
      '    HISTRUBSAL H,PROVDESC P, PROVDESCXPLANO PXP'
      'WHERE (H.IDPESSOA = :Pessoa) AND (H.MES = :DataDeAfericao) AND'
      '      (H.IDRUBRICA = P.IDPROVENTO) AND'
      '      (H.FLGCOMPOESALBENEF = 1) AND'
      '      (P.IDPROVENTO = PXP.IDRUBRICA(+) AND'
      '      PXP.IDPLANOPREV(+) = :PlanoPrev)'
      'ORDER BY'
      '      H.IDRUBRICA ASC')
    ValidateWithMask = True
    Left = 159
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataDeAfericao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object QrySalPartDataDeInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(DECODE(P.flgDesconto,0,H.VALORPROVENTO,-1 * H.VALORPR' +
        'OVENTO)) As "SalPartDtInscricao"'
      'FROM HISTRUBSAL H,PROVDESC P, PROVDESCXPLANO PXP'
      'WHERE (H.IDPESSOA = :Pessoa) AND (H.MES = :DataDeInscricao) AND'
      '      (H.IDRUBRICA = P.IDPROVENTO) AND'
      '      (H.FLGCOMPOESALBENEF = 1) AND'
      '      (P.IDPROVENTO = PXP.IDRUBRICA(+) AND'
      '      PXP.IDPLANOPREV(+) = :PlanoPrev)')
    ValidateWithMask = True
    Left = 60
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataDeInscricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object QryContribNaoIncidentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT nvl(round(sum(h.valoresperado) * :Percentual,2),0) As Val' +
        'orEsperado'
      'FROM hstcontribprev h, reservaxplano r, reservaxcontrib rx'
      'WHERE (rx.idtiporeserva = :TipoReserva)'
      'AND   (rx.idtiporeserva = r.idtiporeserva)'
      'AND   (h.idpessoa = :Pessoa)'
      'AND   (h.idcontribuicao = rx.idcontribuicao)'
      'AND   (h.MesReferencia = :AnoMesReferencia)'
      
        'AND   ((h.DataUltAlim > :DataUltAlim) or (h.DataUltAlim is Null)' +
        ' )'
      'AND   (h.valorrecebido <> 0)'
      '')
    ValidateWithMask = True
    Left = 212
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Percentual'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TipoReserva'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AnoMesReferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataUltAlim'
        ParamType = ptUnknown
      end>
  end
  object QryPlanPrevPatro: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT  DISTINCT  ppa.IdPessJur ,'
      '                  p.Nome '
      'FROM PLANPREVPATRO  ppa,Pessoa p'
      'WHERE  (ppa.IdPessJur=p.IdPessoa)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 228
    Top = 144
    object QryPlanPrevPatroIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'PLANPREVPATRO.IDPESSJUR'
    end
    object QryPlanPrevPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
  object QryValEspxValRec: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT h.MesCobranca, rx.IdTipoReserva TIPO,'
      '       NVL(H.ValorEsperado,0) VALORESPERADO,'
      '       NVL(H.ValorRecebido,0) VALORRECEBIDO,'
      '       h.SitRecebimento, h.IdMotivo'
      'FROM   hstcontribprev h, reservaxplano r,'
      '       reservaxcontrib rx'
      'WHERE (h.idPessoa = :Pessoa)'
      'AND   (h.idPessJur = :PessJur)'
      'AND   (h.idPlanoPrev = :PlanoPrev)'
      'AND   (h.idContribuicao = rx.idContribuicao)'
      
        'AND   (h.MesReferencia >= :AnoMesReferencia) AND (h.MesReferenci' +
        'a <= :AnoMesReferenciaFinal)'
      
        'AND   ((h.DataUltAlim > :DataAfericao) or (h.DataUltAlim is Null' +
        ') )'
      'AND   (h.flgDevolucao = 0)'
      'AND   (rx.IdTipoReserva = r.IdTipoReserva)'
      'AND   (rx.IdTipoReserva(+) = :TipoReserva)'
      '')
    ValidateWithMask = True
    Left = 408
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AnoMesReferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AnoMesReferenciaFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DataAfericao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TipoReserva'
        ParamType = ptUnknown
      end>
    object QryValEspxValRecMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object QryValEspxValRecTIPO: TFloatField
      FieldName = 'TIPO'
    end
    object QryValEspxValRecVALORESPERADO: TFloatField
      FieldName = 'VALORESPERADO'
    end
    object QryValEspxValRecVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object QryValEspxValRecSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      Size = 1
    end
    object QryValEspxValRecIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
  end
end
