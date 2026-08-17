inherited frmAssociaEmissor: TfrmAssociaEmissor
  Left = 150
  Top = 61
  Caption = 'Associações com Emissores'
  ClientHeight = 447
  ClientWidth = 586
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 586
    Height = 408
    object Label11: TLabel
      Left = 327
      Top = 6
      Width = 84
      Height = 16
      Caption = 'Emissor(es)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbtnAssociaEmissor: TSpeedButton
      Left = 277
      Top = 55
      Width = 25
      Height = 26
      Hint = 'Associar parâmetro selecionado'
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaEmissorClick
    end
    object sbtnAssociaTodosEmissor: TSpeedButton
      Left = 277
      Top = 87
      Width = 25
      Height = 26
      Hint = 'Associa todos parâmetros'
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaTodosEmissorClick
    end
    object sbtnDesassociaEmissor: TSpeedButton
      Left = 277
      Top = 119
      Width = 25
      Height = 26
      Hint = 'Desassociar parâmetro selecionado'
      Caption = '>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbtnDesassociaEmissorClick
    end
    object sbtnDesassociaTodosEmissor: TSpeedButton
      Left = 277
      Top = 120
      Width = 25
      Height = 25
      Hint = 'Desassocia todos parâmetros'
      Caption = '>>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosEmissorClick
    end
    object Label2: TLabel
      Left = 22
      Top = 6
      Width = 194
      Height = 16
      Caption = 'Emissor(es) Selecionado(s)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pgctrlEmissor: TPageControl
      Left = 5
      Top = 186
      Width = 576
      Height = 217
      ActivePage = tbsParametros
      Align = alBottom
      TabOrder = 0
      OnChange = pgctrlEmissorChange
      object tbsBolsa: TTabSheet
        Caption = 'Bolsas de Valores'
        TabVisible = False
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 568
          Height = 189
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object sbtnAssociaBolsa: TSpeedButton
            Left = 272
            Top = 55
            Width = 25
            Height = 26
            Hint = 'Associar bolsa selecionada'
            Caption = '<'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociaBolsaClick
          end
          object sbtnAssociaTodasBolsas: TSpeedButton
            Left = 272
            Top = 87
            Width = 25
            Height = 26
            Hint = 'Associar todas bolsas'
            Caption = '<<'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociaTodasBolsasClick
          end
          object sbtnDesassociaBolsa: TSpeedButton
            Left = 272
            Top = 119
            Width = 25
            Height = 26
            Hint = 'Desassociar bolsa selecionada'
            Caption = '>'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociaBolsaClick
          end
          object sbtnDesassociaTodasBolsas: TSpeedButton
            Left = 272
            Top = 151
            Width = 25
            Height = 25
            Hint = 'Desassociar todas bolsas'
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociaTodasBolsasClick
          end
          object Label5: TLabel
            Left = 8
            Top = 30
            Width = 152
            Height = 22
            AutoSize = False
            Caption = 'Bolsas de Negociações'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Label6: TLabel
            Left = 304
            Top = 30
            Width = 121
            Height = 22
            AutoSize = False
            Caption = 'Bolsas de Valores'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Label1: TLabel
            Left = 183
            Top = 10
            Width = 82
            Height = 13
            Caption = 'Sigla na Bolsa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkBolsas: TDBLookupListBox
            Left = 304
            Top = 49
            Width = 257
            Height = 134
            KeyField = 'IDBOLSAVALORES'
            ListField = 'SGLBOLSAVALORES'
            ListSource = DSBolsas
            TabOrder = 0
            OnDblClick = sbtnAssociaBolsaClick
            OnDragDrop = dblkBolsasDragDrop
            OnDragOver = dblkBolsasDragOver
            OnMouseDown = dblkBolsasMouseDown
          end
          object dblckEmissorXBolsas: TDBLookupListBox
            Left = 8
            Top = 49
            Width = 257
            Height = 134
            KeyField = 'IDBOLSAVALORES'
            ListField = 'SGLBOLSAVALORES'
            ListSource = DSEmissorXBolsas
            TabOrder = 1
            OnDblClick = sbtnDesassociaBolsaClick
            OnDragDrop = dblckEmissorXBolsasDragDrop
            OnDragOver = dblckEmissorXBolsasDragOver
            OnMouseDown = dblckEmissorXBolsasMouseDown
          end
          object DBEdit1: TDBEdit
            Left = 192
            Top = 26
            Width = 73
            Height = 21
            DataField = 'SGLEMISSORBOLSA'
            DataSource = DSEmissorXBolsas
            TabOrder = 2
          end
        end
      end
      object tbsParametros: TTabSheet
        Caption = 'Indicadores'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 568
          Height = 189
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object sbtnAssociaParam: TSpeedButton
            Left = 272
            Top = 48
            Width = 25
            Height = 26
            Hint = 'Associar parâmetro selecionado'
            Caption = '<'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociaParamClick
          end
          object sbtnAssociaTodosParam: TSpeedButton
            Left = 272
            Top = 80
            Width = 25
            Height = 26
            Hint = 'Associa todos parâmetros'
            Caption = '<<'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociaTodosParamClick
          end
          object sbtnDesassociaParam: TSpeedButton
            Left = 272
            Top = 112
            Width = 25
            Height = 26
            Hint = 'Desassociar parâmetro selecionado'
            Caption = '>'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociaParamClick
          end
          object sbtnDesassociaTodosParam: TSpeedButton
            Left = 272
            Top = 144
            Width = 25
            Height = 25
            Hint = 'Desassocia todos parâmetros'
            Caption = '>>'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociaTodosParamClick
          end
          object lblParam: TLabel
            Left = 313
            Top = 3
            Width = 224
            Height = 19
            AutoSize = False
            Caption = 'Indicadores disponíveis ao Emissor'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object lblParamEmissor: TLabel
            Left = 17
            Top = 4
            Width = 224
            Height = 17
            AutoSize = False
            Caption = 'Indicadores utilizados pelo Emissor'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object dblkparametros: TDBLookupListBox
            Left = 304
            Top = 24
            Width = 257
            Height = 160
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'IDPARAMEMISSOR'
            ListField = 'DESCPARAMEMISSOR'
            ListSource = dsParametros
            ParentFont = False
            TabOrder = 0
            OnDblClick = sbtnAssociaParamClick
            OnDragDrop = dblkparametrosDragDrop
            OnDragOver = dblkparametrosDragOver
            OnMouseDown = dblkparametrosMouseDown
          end
          object dblkParamXEmissor: TDBLookupListBox
            Left = 8
            Top = 24
            Width = 257
            Height = 160
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'IDPARAMEMISSOR'
            ListField = 'DESCPARAMEMISSOR'
            ListSource = dsParamXEmissor
            ParentFont = False
            TabOrder = 1
            OnDblClick = sbtnDesassociaParamClick
            OnDragDrop = dblkParamXEmissorDragDrop
            OnDragOver = dblkParamXEmissorDragOver
            OnMouseDown = dblkparametrosMouseDown
          end
        end
      end
    end
    object dblkEmissorParam: TDBLookupListBox
      Left = 8
      Top = 23
      Width = 257
      Height = 160
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'IDEMISSOR'
      ListField = 'NOME'
      ListSource = dsEmissorParam
      ParentFont = False
      TabOrder = 1
    end
    object dblkEmissor: TDBLookupListBox
      Left = 312
      Top = 23
      Width = 257
      Height = 160
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'IDEMISSOR'
      ListField = 'NOME'
      ListSource = dsEmissor
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 586
    inherited tb97Fundo: TToolbar97
      Left = 416
      DockPos = 416
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 248
      DockPos = 248
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 83
  end
  object dsEmissor: TwwDataSource
    AutoEdit = False
    DataSet = qryEmissor
    Left = 519
    Top = 131
  end
  object qryEmissor: TwwQuery
    AfterScroll = qryEmissorAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA,P.NOME,P.RAZAOSOCIAL,E.SIGLAEMISSOR , E.IDEMIS' +
        'SOR'
      'FROM PESSOA P , EMISSOR E'
      'WHERE E.IDEMISSOR = P.IDPESSOA '
      ''
      'ORDER BY E.SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 484
    Top = 130
    object qryEmissorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryEmissorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryEmissorRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
    end
    object qryEmissorSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 384
    Top = 64
  end
  object qryParamXEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PE.IdParamEmissor, P.DescParamEmissor '
      'from PARAMxEMISSOR PE , PARAMEMISSOR P '
      'where PE.IdParamEmissor = P.IdParamEmissor '
      'AND'
      ' IdEmissor = :Emissor')
    ValidateWithMask = True
    Left = 37
    Top = 365
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Emissor'
        ParamType = ptUnknown
      end>
    object qryParamXEmissorDESCPARAMEMISSOR: TStringField
      DisplayWidth = 60
      FieldName = 'DESCPARAMEMISSOR'
      Origin = 'PARAMEMISSOR.DESCPARAMEMISSOR'
      Size = 60
    end
    object qryParamXEmissorIDPARAMEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARAMEMISSOR'
      Origin = 'PARAMXEMISSOR.IDPARAMEMISSOR'
      Visible = False
    end
  end
  object dsParamXEmissor: TwwDataSource
    DataSet = qryParamXEmissor
    Left = 86
    Top = 365
  end
  object dsParametros: TwwDataSource
    DataSet = qryParametros
    Left = 81
    Top = 308
  end
  object qryParametros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCPARAMEMISSOR,IDPARAMEMISSOR'
      'FROM PARAMEMISSOR'
      'where IDPARAMEMISSOR NOT IN'
      '(select IDPARAMEMISSOR'
      'from   PARAMXEMISSOR'
      'where IDEMISSOR = :emissor)')
    ValidateWithMask = True
    Left = 33
    Top = 308
    ParamData = <
      item
        DataType = ftFloat
        Name = 'emissor'
        ParamType = ptUnknown
      end>
  end
  object qryBolsas: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT BV.IDBOLSAVALORES, BV.SGLBOLSAVALORES'
      'FROM BOLSAVALORES BV'
      'where BV.IDBOLSAVALORES NOT IN'
      '(select EXB.IDBOLSAVALORES'
      'from   EMISSORXBOLSA EXB'
      'where EXB.IDEMISSOR = :emissor)')
    ValidateWithMask = True
    Left = 137
    Top = 308
    ParamData = <
      item
        DataType = ftFloat
        Name = 'emissor'
        ParamType = ptUnknown
      end>
  end
  object DSBolsas: TwwDataSource
    DataSet = qryBolsas
    Left = 209
    Top = 308
  end
  object qryEmissorXBolsas: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT EXB.IdBolsaValores,'
      '              EXB.IdEmissor,'
      '              EXB.SGLEMISSORBOLSA,'
      '              BV.SglBolsaValores'
      ''
      ''
      'from       EMISSORXBOLSA EXB,'
      '              BOLSAVALORES BV'
      'where '
      '              EXB.IdBolsaValores = BV.IdBolsaValores'
      'and'
      '              EXB.IdEmissor = :Emissor')
    ValidateWithMask = True
    Left = 136
    Top = 365
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Emissor'
        ParamType = ptUnknown
      end>
  end
  object DSEmissorXBolsas: TwwDataSource
    DataSet = qryEmissorXBolsas
    Left = 217
    Top = 365
  end
  object qryAuxII: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
    Top = 64
  end
  object dsEmissorParam: TwwDataSource
    AutoEdit = False
    DataSet = qryEmissorParam
    Left = 111
    Top = 128
  end
  object qryEmissorParam: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 76
    Top = 127
    object FloatField1: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
    end
    object StringField3: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
  end
  object qryBuscaEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPARAMEMISSOR,'
      '   IDEMISSOR'
      'FROM'
      '   PARAMXEMISSOR')
    ValidateWithMask = True
    Left = 352
    Top = 128
  end
end
