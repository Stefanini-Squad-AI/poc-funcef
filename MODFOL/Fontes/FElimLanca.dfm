inherited frmElimLanca: TfrmElimLanca
  Left = 239
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Eliminação de Lançamentos'
  ClientHeight = 314
  ClientWidth = 482
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 482
    Height = 275
    BorderWidth = 2
    object rgProcessados: TRadioGroup
      Left = 12
      Top = 7
      Width = 231
      Height = 38
      Caption = 'Processados ?'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não'
        'Ambos')
      TabOrder = 0
      TabStop = True
    end
    object grpMesRef: TGroupBox
      Left = 249
      Top = 7
      Width = 220
      Height = 78
      Caption = ' Mês e Ano de Início '
      TabOrder = 2
      object cmbMes: TComboBox
        Left = 14
        Top = 40
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Visible = False
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object spnedAno: TSpinEdit
        Left = 140
        Top = 40
        Width = 66
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
        Visible = False
      end
      object cbxMesAno: TCheckBox
        Left = 28
        Top = 19
        Width = 78
        Height = 17
        Caption = 'Qualquer'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = cbxMesAnoClick
      end
      object cmbSinal: TComboBox
        Left = 140
        Top = 12
        Width = 66
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = ' = '
        Visible = False
        Items.Strings = (
          ' = '
          ' <='
          ' >=')
      end
    end
    object rgPermanentes: TRadioGroup
      Left = 12
      Top = 47
      Width = 231
      Height = 38
      Caption = 'Permanentes ?'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não'
        'Ambos')
      TabOrder = 1
      TabStop = True
    end
    object gbxRubrica: TGroupBox
      Left = 12
      Top = 87
      Width = 458
      Height = 178
      Caption = 'Rubricas'
      TabOrder = 3
      object Label2: TLabel
        Left = 7
        Top = 132
        Width = 159
        Height = 13
        Caption = 'Procura por Rubricas pelo Código'
      end
      object edCodRubricas: TEdit
        Left = 7
        Top = 146
        Width = 336
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a Procurar separdos por vírgul' +
          'a'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object sbtnMarcarRub: TBitBtn
        Left = 348
        Top = 143
        Width = 103
        Height = 28
        Caption = '   &Marcar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        TabStop = False
        OnClick = sbtnMarcarRubClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888FF8888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
          08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
          F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
          FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
          788877F77FF878F7788889999991777888888777777787788888889999988888
          8888887777788888888888888888888888888888888888888888}
        NumGlyphs = 2
        Spacing = 0
      end
      object chklstRubrica: TCheckListBox
        Left = 7
        Top = 14
        Width = 308
        Height = 115
        OnClickCheck = chklstRubricaClickCheck
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstRubricaDrawItem
      end
      object bbtnSelTodasRub: TBitBtn
        Left = 320
        Top = 15
        Width = 131
        Height = 25
        Caption = '   Seleciona Todas'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodasRubClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333300000
          0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
          FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
          9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
          00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
          993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
          3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
          3333388888887733333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnInverteSelRub: TBitBtn
        Left = 320
        Top = 42
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelRubClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333000000003333333388888888333333330FFF
          FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
          FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
          FFF0333833338FFFFFF833333333000000003333333388888888000000003333
          333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
          00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
          033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
          3333888888877333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 482
    inherited tb97Fundo: TToolbar97
      Left = 312
      DockPos = 312
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 144
      DockPos = 144
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 80
    Top = 134
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 184
    Top = 134
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 136
    Top = 134
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RP.CODPROVDESC, RP.DESCRPROVDESC, RP.IDRUBRICA'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RP.IDPESSOA   = :IDEMPRESA) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (PD.IDPROVENTO = RP.IDRUBRICA)'
      'ORDER BY'
      '  UPPER(DESCRPROVDESC)')
    ValidateWithMask = True
    Left = 228
    Top = 134
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
