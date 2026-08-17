inherited FrmCpLayout: TFrmCpLayout
  Left = 40
  Top = 95
  Caption = 'Cadastramento de Lay-Out'
  ClientHeight = 391
  ClientWidth = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 633
    Height = 305
    inherited pnlControles: TPanel
      Width = 266
      Height = 295
      Align = alLeft
      BevelOuter = bvRaised
      object Label2: TLabel
        Left = 5
        Top = 4
        Width = 101
        Height = 13
        Caption = 'Tipos de Lay_Out'
      end
      object Label3: TLabel
        Left = 5
        Top = 116
        Width = 118
        Height = 13
        Caption = 'Descrição do Campo'
      end
      object Label4: TLabel
        Left = 5
        Top = 246
        Width = 84
        Height = 13
        Caption = 'Posição Inicial'
      end
      object Label6: TLabel
        Left = 115
        Top = 246
        Width = 77
        Height = 13
        Caption = 'Posição Final'
      end
      object Label7: TLabel
        Left = 6
        Top = 157
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object Label1: TLabel
        Left = 5
        Top = 202
        Width = 72
        Height = 13
        Caption = 'Identificador'
        ParentShowHint = False
        ShowHint = False
      end
      object cbFlgValor: TComboBox
        Left = 5
        Top = 175
        Width = 180
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Campo Comum'
          'Campo Data'
          'Valor Inteiro'
          'Valor com 2 Casas Decimais'
          'Valor com 3 Casas Decimais'
          'Valor com 4 Casas Decimais'
          '')
      end
      object CmbIdLayout: TwwDBLookupCombo
        Left = 6
        Top = 18
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO'#9'T')
        LookupTable = qryTpLayout
        LookupField = 'IDLAYOUT'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = CmbIdLayoutChange
      end
      object EdPosInicial: TEdit
        Left = 6
        Top = 265
        Width = 67
        Height = 21
        Hint = 'Posição inicial do campo no arquivo movimento.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object EdPosFinal: TEdit
        Left = 116
        Top = 265
        Width = 67
        Height = 21
        Hint = 'Posição final do campo no arquivo movimento.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object edNomeCpo: TEdit
        Left = 6
        Top = 133
        Width = 189
        Height = 21
        Hint = 'Nome designado pelo usuário, ex: CAMPO 01, CAMPO 02, etc ...'
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = edNomeCpoChange
      end
      object EdTipoReg: TEdit
        Left = 4
        Top = 217
        Width = 77
        Height = 21
        Hint = 
          'Caracter que Identifica o Header, Detalhe ou Trailer. Deixar em ' +
          'branco caso o arquivo de movimento não contenha Header e Trailer' +
          '.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object rdgTipoReg: TRadioGroup
        Left = 7
        Top = 44
        Width = 128
        Height = 67
        Caption = 'Tipo de Registro'
        Color = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 1
        Items.Strings = (
          'Header'
          'Detalhe'
          'Trailer')
        ParentColor = False
        ParentFont = False
        TabOrder = 6
        OnClick = rdgTipoRegClick
      end
      object gbInf: TGroupBox
        Left = 141
        Top = 46
        Width = 113
        Height = 65
        Caption = 'Ver Informações'
        TabOrder = 7
        object btnInf: TBitBtn
          Left = 10
          Top = 24
          Width = 87
          Height = 25
          Caption = '&Informações'
          TabOrder = 0
          OnClick = btnInfClick
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 271
      Width = 362
      Height = 295
      Selected.Strings = (
        'NOMECPO'#9'21'#9'Nome do Campo'
        'POSINICIAL'#9'10'#9'Pos. Inicial'
        'POSFINAL'#9'10'#9'Pos. Final'
        'TIPOREG'#9'10'#9'Identificador')
      Align = alLeft
      Font.Charset = ANSI_CHARSET
      Font.Style = []
      ParentFont = False
      TitleFont.Style = []
      OnDblClick = dbGrdDblClick
    end
    object pnlInf: TPanel
      Left = 633
      Top = 5
      Width = 362
      Height = 295
      Align = alLeft
      TabOrder = 2
      object ListBoxInf: TListBox
        Left = 1
        Top = 57
        Width = 360
        Height = 196
        Align = alTop
        Columns = 1
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        Sorted = True
        TabOrder = 0
      end
      object pnlTitInf: TPanel
        Left = 1
        Top = 1
        Width = 360
        Height = 56
        Align = alTop
        Alignment = taLeftJustify
        TabOrder = 1
        object gbDestino: TGroupBox
          Left = 1
          Top = 1
          Width = 358
          Height = 54
          Align = alClient
          Caption = 'Descrição da Origem ou Destino das Informações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object cbArquivo: TComboBox
            Left = 8
            Top = 22
            Width = 337
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cbArquivoChange
            Items.Strings = (
              'TABELA DE CAPITAIS DE SEGURO')
          end
        end
      end
      object gbStatusInf: TGroupBox
        Left = 1
        Top = 253
        Width = 360
        Height = 38
        Align = alTop
        TabOrder = 2
        object spbtnFechar: TSpeedButton
          Left = 263
          Top = 11
          Width = 63
          Height = 22
          Caption = '&Fechar'
          OnClick = spbtnFecharClick
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 633
  end
  inherited Dock971: TDock97
    Top = 352
    Width = 633
    inherited tb97Fundo: TToolbar97
      Left = 382
      DockPos = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 214
      DockPos = 214
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT * FROM CPLAYOUT'
      'WHERE IDLAYOUT= :PIDLAYOUT'
      'ORDER BY POSINICIAL')
    Left = 410
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLAYOUT'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 272
    Top = 6
    TargetsData = (
      1
      4
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        ''
        'Items'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    Left = 475
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'CPLAYOUT.IDLAYOUT'
      'CPLAYOUT.NOMECPO'
      'TPLAYOUT.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'CÓDIGO DO LAYOUT'
      'NOME DO CAMPO'
      'DESCRIÇÃO DO LAYOUT')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CPLAYOUT'
      'TPLAYOUT')
    CamposChave.Strings = (
      'TPLAYOUT.IDLAYOUT')
    Filtro.Strings = (
      'TPLAYOUT.IDLAYOUT=CPLAYOUT.IDLAYOUT')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '20'
      '30')
    Left = 509
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 443
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 377
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 307
    Top = 6
  end
  object qryTpLayout: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 342
    Top = 5
  end
  object qryIns: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT')
    ValidateWithMask = True
    Left = 374
    Top = 53
  end
  object DsTpLayout: TwwDataSource
    DataSet = qryTpLayout
    Left = 333
    Top = 36
  end
end
