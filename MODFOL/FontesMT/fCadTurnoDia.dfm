inherited frmCadTurnoDia: TfrmCadTurnoDia
  Left = 570
  Top = 296
  Width = 634
  Height = 354
  HelpContext = 210028
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Turnos por Dia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 618
    Height = 229
    BorderWidth = 2
    object Label1: TLabel
      Left = 11
      Top = 17
      Width = 46
      Height = 13
      AutoSize = False
      Caption = 'Código '
      FocusControl = dbedCodigo
    end
    object lblTpJornada: TLabel
      Left = 75
      Top = 17
      Width = 93
      Height = 13
      Caption = 'Tipo de Jornada'
    end
    object lblVarEntrada: TLabel
      Left = 278
      Top = 146
      Width = 184
      Height = 13
      Caption = 'Variação em minutos na Entrada'
    end
    object lblVarSaida: TLabel
      Left = 278
      Top = 173
      Width = 174
      Height = 13
      Caption = 'Variação em minutos na Saída'
    end
    object grbTurnosDia: TGroupBox
      Left = 11
      Top = 65
      Width = 251
      Height = 137
      Caption = 'Turnos por Dia'
      TabOrder = 2
      object Label2: TLabel
        Left = 18
        Top = 26
        Width = 123
        Height = 13
        AutoSize = False
        Caption = 'Início do Expediente'
      end
      object Label3: TLabel
        Left = 18
        Top = 53
        Width = 123
        Height = 13
        AutoSize = False
        Caption = 'Início do Almoço'
      end
      object Label4: TLabel
        Left = 18
        Top = 80
        Width = 123
        Height = 13
        AutoSize = False
        Caption = 'Final do Almoço'
      end
      object Label5: TLabel
        Left = 18
        Top = 107
        Width = 123
        Height = 13
        AutoSize = False
        Caption = 'Final do Expediente'
      end
      object mkedFinalExped: TMaskEdit
        Left = 167
        Top = 104
        Width = 60
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object mkedFinalAlmoco: TMaskEdit
        Left = 167
        Top = 77
        Width = 60
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
        OnChange = mkedFinalAlmocoChange
      end
      object mkedInicioAlmoco: TMaskEdit
        Left = 167
        Top = 50
        Width = 60
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
        OnChange = mkedInicioAlmocoChange
      end
      object mkedInicioExped: TMaskEdit
        Left = 167
        Top = 23
        Width = 60
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
    end
    object grbInfoJornada: TGroupBox
      Left = 270
      Top = 65
      Width = 337
      Height = 69
      Caption = 'Informações sobre o Intervalo'
      TabOrder = 3
      object lblTpIntervaloJor: TLabel
        Left = 7
        Top = 25
        Width = 165
        Height = 13
        Caption = 'Tipo de Intervalo da Jornada'
      end
      object lblDurIntervalo: TLabel
        Left = 210
        Top = 20
        Width = 121
        Height = 13
        Caption = 'Duração do Intervalo'
      end
      object dbcmbTpInterJor: TwwDBComboBox
        Left = 7
        Top = 40
        Width = 187
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        DataField = 'TIPOINTERVJORNADA'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Sem Intervalo'#9'0'
          'Intervalo em Horário Fixo'#9'1'
          'Intervalo em Horário Variável'#9'2')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        OnChange = dbcmbTpInterJorChange
      end
      object dbedDurIntervalo: TwwDBEdit
        Left = 210
        Top = 39
        Width = 61
        Height = 21
        DataField = 'DURACAOINTERVALO'
        DataSource = ds
        Enabled = False
        MaxLength = 3
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dbedCodigo: TDBEdit
      Left = 11
      Top = 33
      Width = 59
      Height = 21
      DataField = 'IDTURNODIARIO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedVarEntrada: TwwDBEdit
      Left = 480
      Top = 142
      Width = 61
      Height = 21
      DataField = 'VARIACAOHORAENTRADA'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedVarSaida: TwwDBEdit
      Left = 480
      Top = 169
      Width = 61
      Height = 21
      DataField = 'VARIACAOHORASAIDA'
      DataSource = ds
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcbTipoJornada: TwwDBComboBox
      Left = 76
      Top = 33
      Width = 187
      Height = 21
      ShowButton = True
      Style = csDropDownList
      MapList = True
      AllowClearKey = True
      DataField = 'TIPOJORNADA'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Normal'#9'00'
        'Jornada 12 x 36'#9'02'
        'Jornada com horário diário fixo e folga variável'#9'03'
        'Jornada com horário diário fixo e folga fixa (no domingo)'#9'04'
        
          'Jornada com horário diário fixo e folga fixa (exceto no domingo)' +
          #9'05'
        
          'Jornada com horário diário fixo e folga fixa (em outro dia da se' +
          'mana), com folga adicional periódica no domingo'#9'06'
        'Turno ininterrupto de revezamento'#9'07'
        'Demais tipos de jornada'#9'09')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
      OnChange = dbcbTipoJornadaChange
    end
  end
  inherited Dock972: TDock97
    Width = 618
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 618
    inherited tb97Fundo: TToolbar97
      Left = 276
      DockPos = 276
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 107
      DockPos = 107
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 13
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 494
    Top = 17
  end
  inherited ImlPadrao: TImageList
    Left = 264
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 442
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 530
    Top = 9
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Turno'
    Colunas.Strings = (
      'TURNODIA.IDTURNODIARIO'
      'TURNODIA.INICIOEXPEDIENTE'
      'TURNODIA.INICIOALMOCO'
      'TURNODIA.FINALALMOCO'
      'TURNODIA.FINALEXPEDIENTE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Início do Expediente'
      'Início do Almoço'
      'Final do Almoço'
      'Final do Expediente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TURNODIA')
    CamposChave.Strings = (
      'TURNODIA.IDTURNODIARIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '8'
      '8'
      '8'
      '8')
    ExibePergunta = False
    Left = 370
    Top = 9
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 586
    Top = 9
  end
end
