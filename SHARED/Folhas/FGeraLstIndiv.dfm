inherited FrmGeraLstIndiv: TFrmGeraLstIndiv
  Left = 349
  Top = 168
  Caption = 'Gera Lista Individual'
  ClientHeight = 319
  ClientWidth = 263
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 263
    Height = 280
    object lblQtSel: TLabel
      Left = 150
      Top = 92
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Selecionados: 0'
    end
    object grpMesRef: TGroupBox
      Left = 35
      Top = 17
      Width = 208
      Height = 64
      Caption = ' Mês e Ano para Processamento '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cmbMes: TComboBox
        Left = 8
        Top = 25
        Width = 121
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
        Left = 136
        Top = 25
        Width = 63
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
    end
    object dbgrdLstIndiv: TwwDBGrid
      Left = 8
      Top = 112
      Width = 241
      Height = 145
      Selected.Strings = (
        'SELECIONAR'#9'10'#9'Selecionar'#9'F'
        'NOMEUSUARIO'#9'20'#9'Usuários'#9'T')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsLstIndiv
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdLstIndivCalcCellColors
      IndicatorColor = icBlack
      OnFieldChanged = dbgrdLstIndivFieldChanged
    end
  end
  inherited Dock971: TDock97
    Top = 280
    Width = 263
    inherited tb97Fundo: TToolbar97
      Left = 169
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  object btnMarcaTodas: TBitBtn [2]
    Left = 44
    Top = 87
    Width = 21
    Height = 20
    Hint = 'Seleciona Todos'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnMarcaTodasClick
    Glyph.Data = {
      D6000000424DD60000000000000076000000280000000C0000000C0000000100
      0400000000006000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
      0000888224888888000088222248888800008822822488880000882848224888
      0000888224822488000088222248228800008822822482880000882888224888
      0000888888822488000088888888228800008888888882880000}
  end
  object btnInverte: TBitBtn [3]
    Left = 23
    Top = 87
    Width = 21
    Height = 20
    Hint = 'Inverte a Seleção'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnInverteClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888488888888888888844888888888888444448888888888444444488
      1888884444444888118884448844888881188448884888888118844888888188
      8118844888881188111888448881111111888884881111111888888888811111
      8888888888881188888888888888818888888888888888888888}
  end
  object qryLstIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  0 AS SELECIONAR,'
      '  t.IDUSUARIO, t.NOMEUSUARIO'
      'FROM'
      '(--por usuario'
      'SELECT'
      '  USUARIOSISTEMA.IDUSUARIO, USUARIOSISTEMA.NOMEUSUARIO'
      '      FROM OPERFUNC'
      '     INNER JOIN AUTORIZA'
      '        ON AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC'
      '     INNER JOIN FROBFNOP'
      '        ON FROBFNOP.IDOPERFUNC = OPERFUNC.IDOPERFUNC'
      '     INNER JOIN USUARIOSISTEMA'
      '        ON USUARIOSISTEMA.IDESPACESSO = AUTORIZA.IDESPACESSO'
      '     WHERE AUTORIZA.IDPESSOA = 1'
      '       AND OPERFUNC.IDMODULO = 18'
      '       AND OPERFUNC.IDFUNCAO = 17013'
      
        '       AND OPERFUNC.IDOPERACAO IN (SELECT IDOPERACAO FROM OPERAC' +
        'AO WHERE NOMEOPERACAO = '#39'Geral Lista Individual'#39')'
      
        '       AND FROBFNOP.IDOBJETO IN (SELECT IDOBJETO FROM OBJETO WHE' +
        'RE NOMEOBJETO = '#39'BtnGeraLstIndiv'#39')'
      
        '       AND FROBFNOP.IDFORM IN (SELECT IDFORM FROM FORM WHERE NOM' +
        'EFORM = '#39'FrmCadListaRecebedor'#39') '
      'UNION ALL       '
      '--por grupo'
      'SELECT'
      '  USUARIOSISTEMA.IDUSUARIO, USUARIOSISTEMA.NOMEUSUARIO'
      
        '      FROM GRUPOACESSO, GRUPOUSU, AUTORIZA, OPERFUNC, USUARIOSIS' +
        'TEMA, FROBFNOP'
      '     WHERE GRUPOUSU.IDUSUARIO = USUARIOSISTEMA.IDUSUARIO'
      '       AND GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO'
      '       AND GRUPOACESSO.IDESPACESSO = AUTORIZA.IDESPACESSO'
      '       AND AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC'
      '       AND FROBFNOP.IDOPERFUNC = OPERFUNC.IDOPERFUNC'
      '       AND OPERFUNC.IDMODULO = 18'
      '       AND AUTORIZA.IDPESSOA = 1'
      '       AND OPERFUNC.IDFUNCAO = 17013'
      
        '       AND OPERFUNC.IDOPERACAO IN (SELECT IDOPERACAO FROM OPERAC' +
        'AO WHERE NOMEOPERACAO = '#39'Geral Lista Individual'#39')'
      
        '       AND FROBFNOP.IDOBJETO IN (SELECT IDOBJETO FROM OBJETO WHE' +
        'RE NOMEOBJETO = '#39'BtnGeraLstIndiv'#39')'
      
        '       AND FROBFNOP.IDFORM IN (SELECT IDFORM FROM FORM WHERE NOM' +
        'EFORM = '#39'FrmCadListaRecebedor'#39') '
      ') t'
      ''
      'order by  t.NOMEUSUARIO')
    UpdateObject = updLstIndiv
    ControlType.Strings = (
      'SELECIONAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 136
    Top = 165
    object qryLstIndivSELECIONAR: TFloatField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 10
      FieldName = 'SELECIONAR'
    end
    object qryLstIndivNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuários'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.NOMEUSUARIO'
      FixedChar = True
    end
    object qryLstIndivIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.IDUSUARIO'
      Visible = False
    end
  end
  object dsLstIndiv: TwwDataSource
    DataSet = qryLstIndiv
    Left = 93
    Top = 161
  end
  object updLstIndiv: TUpdateSQL
    Left = 37
    Top = 159
  end
end
