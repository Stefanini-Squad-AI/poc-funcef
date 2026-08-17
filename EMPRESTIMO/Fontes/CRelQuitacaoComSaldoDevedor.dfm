inherited cfgRelQuitacaoComSaldoDevedor: TcfgRelQuitacaoComSaldoDevedor
  Left = 351
  Top = 151
  Caption = 'Quitações Com Saldo Devedor ou Valores em Aberto'
  ClientHeight = 387
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 354
    object Label2: TLabel
      Left = 320
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited edtNome: TEdit
        Width = 369
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
        OnClick = molContratoEmptmobtnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
        OnClick = molContratoEmptmobtnLimpaContratoClick
      end
    end
    object DBcboTipoContrato: TwwDBLookupCombo
      Left = 320
      Top = 64
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoContr
      LookupField = 'IDTIPOCONTREMPTMO'
      DropDownWidth = 8
      Enabled = False
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 64
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
      LookupField = 'IDTIPOEMPTMO'
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    object GroupBox2: TGroupBox
      Left = 256
      Top = 272
      Width = 353
      Height = 65
      TabOrder = 5
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 250
        Top = 38
        Width = 87
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        ColorDialogOptions = []
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 185
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 161
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 320
      Top = 208
      Width = 289
      Height = 57
      Caption = ' Período de Datas (Previstas) '
      TabOrder = 4
      object Label5: TLabel
        Left = 141
        Top = 28
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object edtDataIni: TCMDateTimePicker
        Left = 24
        Top = 24
        Width = 99
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
        UnboundDataType = wwDTEdtDate
      end
      object edtDataFim: TCMDateTimePicker
        Left = 168
        Top = 24
        Width = 98
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
        UnboundDataType = wwDTEdtDate
      end
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 98
      Width = 301
      Height = 101
      TabOrder = 6
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 79
      end
    end
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 281
      DockPos = 342
    end
  end
  object qryQuitacaoComSaldoDevedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    HME.IDCONTRATOEMPTMO,'
      '    PES.NOME,'
      '    DEP.MATRICULA,'
      '    HME.HMEDATAPREVISTA,'
      '    DECODE(CON.FLGSITUACAO, '#39'A'#39', '#39'ATIVO'#39','
      '                            '#39'E'#39', '#39'ENCERRADO'#39','
      '                            '#39'J'#39', '#39'EM COBRANÇA JURÍDICA'#39','
      '                            '#39'K'#39', '#39'EM QUITAÇÃO'#39','
      '                            '#39'Q'#39', '#39'QUITADO'#39','
      '                            '#39'R'#39', '#39'RENOVADO'#39','
      '                            '#39'C'#39','#39'CANCELADO'#39') AS SIT_CONTRATO,'
      '    0 AS SALDODEV,'
      '    0 AS VALORDEV'
      'FROM'
      '    HISTMOVEMPTMO HME,'
      '    CONTRATOEMPTMO CON,'
      '    DEPENTIT DEP,'
      '    PESSOA PES'
      'WHERE'
      '    CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO'
      'AND HME.HMEDATAPREVISTA BETWEEN SYSDATE-1 AND SYSDATE'
      'AND HME.HMETIPOMOV          = 3'
      'AND NVL(HME.FLGESTORNADO,0) = 0'
      'AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      'AND CON.IDPATRO            IN (1,91008)'
      'AND CON.IDPLANOPREV        IN (2,19,66,74)'
      'AND DEP.IDTITULAR           = CON.IDPESSOA'
      'AND DEP.IDPESSOA            = CON.IDBENEF'
      'AND PES.IDPESSOA            = CON.IDBENEF'
      'AND 1 = 0'
      'ORDER BY'
      '    HME.HMEDATAPREVISTA, HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 160
    Top = 272
    object qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuitacaoComSaldoDevedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryQuitacaoComSaldoDevedorMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryQuitacaoComSaldoDevedorHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryQuitacaoComSaldoDevedorSIT_CONTRATO: TStringField
      FieldName = 'SIT_CONTRATO'
    end
    object qryQuitacaoComSaldoDevedorSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qryQuitacaoComSaldoDevedorVALORDEV: TFloatField
      FieldName = 'VALORDEV'
    end
  end
  object qryTotalDebito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    NVL(SUM(HME.HMEVLRPREVISTO),0) AS HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME, TIPOSUSPEMPTMO TSE, PARAMEMPTMO PAR'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV           NOT IN (0, 5, 8)'
      '   AND HME.FLGBAIXADO           = 0'
      '   AND HME.HMEDATAEFETIVA       IS NULL'
      '   AND HME.HMEVLREFETIVO        IS NULL'
      '   AND HME.HMEVLRPREVISTO      <> 0'
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND (PAR.FLGEXCEPCIONAL = 0 OR'
      '      (NVL(HME.FLGSUSPENSAO, 0) = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0' +
        ') = 1))'
      '       )'
      '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+)'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      '   AND NVL(HME.FLGABONADO, 0)   = 0'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryTotalDebitoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
end
