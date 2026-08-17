inherited frmParamFichaFuncAux: TfrmParamFichaFuncAux
  Left = 67
  Top = 146
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Seleção para Ficha Funcional'
  ClientHeight = 299
  ClientWidth = 662
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 662
    Height = 260
    BorderWidth = 2
    object rgSelecao: TRadioGroup
      Left = 23
      Top = 11
      Width = 341
      Height = 37
      Caption = 'Listar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Uma Só Pessoa'
        'A Selecionar')
      TabOrder = 0
      OnClick = rgSelecaoClick
    end
    object dblcFunc: TwwDBLookupCombo
      Left = 23
      Top = 58
      Width = 341
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qry
      LookupField = 'NOME'
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object gbxTipoPapel: TGroupBox
      Left = 375
      Top = 11
      Width = 263
      Height = 46
      Caption = 'Tipo de Papel'
      TabOrder = 2
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 16
        Width = 249
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object gbxOpcoesImp: TGroupBox
      Left = 23
      Top = 89
      Width = 618
      Height = 162
      Caption = 'Opções de Impressão'
      TabOrder = 3
      object cbxDocumentacao: TCheckBox
        Left = 9
        Top = 16
        Width = 224
        Height = 17
        Caption = 'Documentação'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbxUltEmpr: TCheckBox
        Left = 9
        Top = 34
        Width = 224
        Height = 17
        Caption = 'Empregos Anteriores'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbxTreinamento: TCheckBox
        Left = 9
        Top = 52
        Width = 224
        Height = 17
        Caption = 'Treinamento'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbxExper: TCheckBox
        Left = 9
        Top = 71
        Width = 224
        Height = 17
        Caption = 'Experiências'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cbxAval: TCheckBox
        Left = 9
        Top = 89
        Width = 224
        Height = 17
        Caption = 'Avaliações, Testes, Entrevistas'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object cbxMedic: TCheckBox
        Left = 9
        Top = 107
        Width = 224
        Height = 17
        Caption = 'Exames, Testes e Ocorrências Médicas'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object cbxEvolFunc: TCheckBox
        Left = 9
        Top = 125
        Width = 245
        Height = 17
        Caption = 'Alterações Funcionais (Salário, Cargo, Lotação)'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object cbxBenef: TCheckBox
        Left = 329
        Top = 16
        Width = 224
        Height = 17
        Caption = 'Benefícios Sociais'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object cbxFerias: TCheckBox
        Left = 329
        Top = 34
        Width = 224
        Height = 17
        Caption = 'Férias'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object cbxSindical: TCheckBox
        Left = 329
        Top = 71
        Width = 224
        Height = 17
        Caption = 'Contribuição Sindical'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object cbxDepen: TCheckBox
        Left = 329
        Top = 52
        Width = 224
        Height = 17
        Caption = 'Dependentes'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object cbxSitFunc: TCheckBox
        Left = 329
        Top = 89
        Width = 240
        Height = 17
        Caption = 'Alterações na Situação Funcionail'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object cbxObserv: TCheckBox
        Left = 329
        Top = 107
        Width = 224
        Height = 17
        Caption = 'Observações (onde aplicável)'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object cbxDescCargo: TCheckBox
        Left = 329
        Top = 125
        Width = 224
        Height = 17
        Caption = 'Descrição do Cargo'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object cbxCargoAltern: TCheckBox
        Left = 329
        Top = 143
        Width = 200
        Height = 17
        Caption = 'Cargo Alternativo para Quem Tiver'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 14
      end
    end
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 662
    inherited tb97Fundo: TToolbar97
      Left = 216
      DockPos = 216
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 478
    Top = 62
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 551
    Top = 61
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 599
    Top = 61
  end
end
