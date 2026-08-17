inherited frmConfigRegAcesso: TfrmConfigRegAcesso
  Left = 530
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Confirme ou Altere a Forma de Operação desta Estação'
  ClientHeight = 373
  ClientWidth = 596
  FormStyle = fsNormal
  Visible = False
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 596
    Height = 334
    BorderWidth = 2
    object GroupBox1: TGroupBox
      Left = 11
      Top = 8
      Width = 216
      Height = 144
      Caption = 'Verificar Horário de Operação'
      TabOrder = 0
      object cbxVerificaHorario: TRadioButton
        Left = 40
        Top = 24
        Width = 48
        Height = 17
        Caption = 'Sim'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = cbxVerificaHorarioClick
      end
      object cbxNaoVerificaHorario: TRadioButton
        Left = 120
        Top = 24
        Width = 48
        Height = 17
        Caption = 'Não'
        TabOrder = 1
        OnClick = cbxVerificaHorarioClick
      end
      object stgdHorario: TStringGrid
        Left = 9
        Top = 48
        Width = 198
        Height = 87
        ColCount = 3
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentFont = False
        TabOrder = 2
        OnGetEditMask = stgdHorarioGetEditMask
      end
    end
    object gbxMin: TGroupBox
      Left = 235
      Top = 8
      Width = 202
      Height = 55
      TabOrder = 1
      object Label9: TLabel
        Left = 168
        Top = 23
        Width = 24
        Height = 13
        Caption = 'min.'
      end
      object cbxTolerancia: TCheckBox
        Left = 11
        Top = 22
        Width = 102
        Height = 17
        Hint = 
          'Verifica Tolerância na Entrada (Horário da Pessoa) para Avisar o' +
          'u Bloquear Acesso ?'
        Caption = 'Toler. Entrada'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = cbxToleranciaClick
      end
      object spedMin: TSpinEdit
        Left = 122
        Top = 19
        Width = 42
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
    end
    object rgPontoAcesso: TRadioGroup
      Left = 445
      Top = 8
      Width = 140
      Height = 55
      Caption = 'Operar Como'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ponto'
        'Acesso')
      TabOrder = 2
    end
    object gbxSignificado: TGroupBox
      Left = 235
      Top = 68
      Width = 350
      Height = 84
      Hint = 'Este sentido deve ser analisado olhando-se a catraca de frente'
      Caption = 'Significado do Sentido do Giro da Catraca'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      object rgSentido1: TRadioGroup
        Left = 14
        Top = 16
        Width = 157
        Height = 55
        Caption = 'Da Direita para Esquerda'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Saída'
          'Entrada')
        ParentFont = False
        TabOrder = 0
      end
      object rgSentido2: TRadioGroup
        Left = 179
        Top = 16
        Width = 157
        Height = 55
        Caption = 'Da Esquerda para Direita'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 1
        Items.Strings = (
          'Saída'
          'Entrada')
        ParentFont = False
        TabOrder = 1
      end
    end
    object gbxMensagem: TGroupBox
      Left = 11
      Top = 156
      Width = 216
      Height = 69
      Caption = 'Mensagem Padrão no Visor'
      TabOrder = 4
      object edMensagemPadrao: TEdit
        Left = 16
        Top = 28
        Width = 184
        Height = 21
        TabOrder = 0
      end
    end
    object gbxTempoEspera: TGroupBox
      Left = 235
      Top = 156
      Width = 350
      Height = 69
      Caption = 'Tempo de Espera (em Segundos)'
      TabOrder = 5
      object lblTempoCatraca: TLabel
        Left = 40
        Top = 17
        Width = 102
        Height = 13
        Caption = 'Liberação da Catraca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTempo: TLabel
        Left = 184
        Top = 17
        Width = 133
        Height = 13
        Caption = 'Exibição dos Dados na Tela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object spedTempoCatraca: TSpinEdit
        Left = 41
        Top = 33
        Width = 102
        Height = 22
        Hint = 'Tempo Que a Catraca Espera Até Que a Pessoa Passe'
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 10
      end
      object spedTempo: TSpinEdit
        Left = 185
        Top = 33
        Width = 102
        Height = 22
        Hint = 'Tempo Em Que a Tela Exibe Dados da Pessoa'
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 2
      end
    end
    object gbxSerial: TGroupBox
      Left = 11
      Top = 271
      Width = 460
      Height = 54
      Caption = 'Conexão via Porta Serial'
      TabOrder = 6
      object Label3: TLabel
        Left = 12
        Top = 23
        Width = 64
        Height = 13
        Caption = 'Velocidade'
      end
      object lblAcionamento: TLabel
        Left = 169
        Top = 23
        Width = 103
        Height = 13
        Caption = 'Tipo Acionamento'
        Visible = False
      end
      object cmbVeloc: TComboBox
        Left = 82
        Top = 19
        Width = 77
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '110'
          '300'
          '600'
          '1200'
          '2400'
          '4800'
          '9600'
          '10400'
          '14400'
          '19200'
          '28800'
          '38400'
          '56000'
          '57600'
          '115200'
          '128000'
          '256000')
      end
      object cmbAcionamento: TwwDBComboBox
        Left = 278
        Top = 19
        Width = 172
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = False
        AllowClearKey = False
        DropDownCount = 8
        DropDownWidth = 300
        ItemHeight = 0
        Items.Strings = (
          '00 - sem acionamento'
          '01 - catraca genérica c/ sensor'
          '02 - acionamento simples s/ sensor'
          '03 - catraca RODBEL entrada'
          '04 - catraca RODBEL saída'
          '05 - catraca RODBEL bidirecional'
          '06 - catraca RODBEL saída livre'
          '07 - acionamento simples c/ sensor'
          '08 - catraca óptica entrada'
          '09 - catraca óptica saída'
          '10 - catraca óptica bidirecional'
          '11 - catraca óptica saída livre'
          '12 - catraca bidirecional independente do leitor'
          '13 - catraca óptica bidirecional independente do leitor'
          '14 - catraca bidirecional com um leitor (barras)')
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
        Visible = False
      end
    end
    object rgPermiteAcessoOutraEmpProp: TRadioGroup
      Left = 11
      Top = 229
      Width = 574
      Height = 38
      Hint = 
        'Quando Existir Matrículas Iguais Entre as Empresas, o Sistema ir' +
        'á Usar Um ou Outro Aleatóriamente'
      Caption = 
        'Permitir que Pessoas de Outras Empresas Proprietárias Façam Aces' +
        'sos Nesta Estação?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object GroupBox2: TGroupBox
      Left = 475
      Top = 271
      Width = 110
      Height = 54
      Caption = 'Geração do LOG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object cmbGerarLog: TComboBox
        Left = 9
        Top = 20
        Width = 93
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Não Gerar'
          'Simples'
          'Completo')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 596
    inherited tb97Fundo: TToolbar97
      Left = 428
      DockPos = 437
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 327
    TargetsData = (
      1
      1
      (
        '*'
        'Cells'
        0))
  end
end
