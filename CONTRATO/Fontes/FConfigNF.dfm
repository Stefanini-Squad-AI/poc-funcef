inherited FrmConfigNF: TFrmConfigNF
  Left = 132
  Top = 152
  Caption = 'Configuração de Nota  Fiscal'
  ClientHeight = 481
  ClientWidth = 732
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 16
    Top = 208
    Width = 104
    Height = 13
    Caption = 'Agregado para IPI'
  end
  inherited pnlFundo: TPanel
    Width = 732
    Height = 395
    object Panel2: TPanel
      Left = 1
      Top = 117
      Width = 730
      Height = 24
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Campos da Nota'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 141
      Width = 730
      Height = 253
      Selected.Strings = (
        'DESCRICAO'#9'37'#9'Descrição'#9'F'
        'LINHA'#9'10'#9'Linha'#9'F'
        'COLUNA'#9'10'#9'Coluna'#9'F'
        'TAMANHO'#9'10'#9'Tamanho'#9'F'
        'FLGALINHAMENTO'#9'9'#9'Alinhamento'#9'F'
        'FLGIMPOSTO'#9'6'#9'Imposto'#9'F'
        'FLGTOTALIZADA'#9'9'#9'Totalização'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsDet
      KeyOptions = []
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 116
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 121
        Height = 13
        Caption = 'Descrição do Modelo'
        FocusControl = dbedDescricao
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 118
        Height = 13
        Caption = 'Linha Detalhe Inicial'
        FocusControl = dbedLinDetInicial
      end
      object Label3: TLabel
        Left = 176
        Top = 64
        Width = 111
        Height = 13
        Caption = 'Linha Detalhe Final'
        FocusControl = dbedLinDetFinal
      end
      object Label4: TLabel
        Left = 344
        Top = 64
        Width = 141
        Height = 13
        Caption = 'Número de Linhas da NF'
        FocusControl = dbeNumLinhasNota
      end
      object dbedDescricao: TDBEdit
        Left = 16
        Top = 32
        Width = 641
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object chkImpCond: TDBCheckBox
        Left = 528
        Top = 82
        Width = 145
        Height = 17
        Caption = 'Imprime condensado'
        DataField = 'FLGCONDENSADO'
        DataSource = ds
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbedLinDetInicial: TDBEdit
        Left = 16
        Top = 80
        Width = 137
        Height = 21
        DataField = 'LINDETINICIAL'
        DataSource = ds
        TabOrder = 1
      end
      object dbedLinDetFinal: TDBEdit
        Left = 176
        Top = 80
        Width = 137
        Height = 21
        DataField = 'LINDETFINAL'
        DataSource = ds
        TabOrder = 2
      end
      object dbeNumLinhasNota: TDBEdit
        Left = 344
        Top = 80
        Width = 145
        Height = 21
        DataField = 'NUMLINHASNOTA'
        DataSource = ds
        TabOrder = 3
      end
    end
  end
  inherited Dock972: TDock97
    Width = 732
    inherited Toolbar971: TToolbar97
      object BtnImprime: TToolbarButton97
        Left = 240
        Top = 0
        Width = 71
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownArrow = False
        DropdownCombo = True
        DropdownMenu = MnuImprimir
        Caption = '&Imprimir'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 442
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 498
      DockPos = 498
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 329
      DockPos = 329
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 768
    Top = 65526
  end
  inherited ds: TwwDataSource
    Left = 355
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ModNotaFiscal'
      'set'
      '  IDMODELONF = :IDMODELONF,'
      '  IDPESSOA = :IDPESSOA,'
      '  LINDETINICIAL = :LINDETINICIAL,'
      '  LINDETFINAL = :LINDETFINAL,'
      '  FLGCONDENSADO = :FLGCONDENSADO,'
      '  DESCRICAO = :DESCRICAO,'
      '  NUMLINHASNOTA = :NUMLINHASNOTA'
      'where'
      '  IDMODELONF = :OLD_IDMODELONF')
    InsertSQL.Strings = (
      'insert into ModNotaFiscal'
      
        '  (IDMODELONF, IDPESSOA, LINDETINICIAL, LINDETFINAL, FLGCONDENSA' +
        'DO, DESCRICAO, '
      '   NUMLINHASNOTA)'
      'values'
      
        '  (:IDMODELONF, :IDPESSOA, :LINDETINICIAL, :LINDETFINAL, :FLGCON' +
        'DENSADO, '
      '   :DESCRICAO, :NUMLINHASNOTA)')
    DeleteSQL.Strings = (
      'delete from ModNotaFiscal'
      'where'
      '  IDMODELONF = :OLD_IDMODELONF')
    Left = 395
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'MODNOTAFISCAL.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'MODNOTAFISCAL')
    CamposChave.Strings = (
      'MODNOTAFISCAL.IDMODELONF')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 61
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 649
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 436
    Top = 54
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   ModNotaFiscal'
      'WHERE'
      '   (IDModeloNF = :IDModeloNF) AND'
      '   (IDPessoa = :IDPessoa)'
      ' '
      ' ')
    Left = 314
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDModeloNF'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
  end
  object QryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMODELONF,'
      '   IDCOMPNF,'
      '   COLUNA,'
      '   LINHA,'
      '   TAMANHO,'
      '   FLGALINHAMENTO,'
      '   FLGIMPOSTO,'
      '   FLGTOTALIZADA,'
      '   NUMMAXLINHAS,'
      '   VALORDEFAULT,'
      '   DESCRICAO'
      'FROM'
      '   COMPNOTAFISCAL'
      'WHERE'
      '   (IDModeloNF = :IDModeloNF)'
      'ORDER BY IDCOMPNF'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      '            '
      ' ')
    UpdateObject = UpdDet
    ControlType.Strings = (
      'FLGTOTALIZADA;CheckBox;S;N'
      'FLGIMPOSTO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 472
    Top = 7
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDModeloNF'
        ParamType = ptInput
        Value = '0'
      end>
    object QryDetDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 48
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryDetCOLUNA: TFloatField
      DisplayLabel = 'Coluna'
      DisplayWidth = 10
      FieldName = 'COLUNA'
    end
    object QryDetLINHA: TFloatField
      DisplayLabel = 'Linha'
      DisplayWidth = 10
      FieldName = 'LINHA'
    end
    object QryDetTAMANHO: TFloatField
      DisplayLabel = 'Tamanho'
      DisplayWidth = 10
      FieldName = 'TAMANHO'
    end
    object QryDetFLGIMPOSTO: TStringField
      DisplayLabel = 'Imposto'
      DisplayWidth = 6
      FieldName = 'FLGIMPOSTO'
      FixedChar = True
      Size = 1
    end
    object QryDetFLGTOTALIZADA: TStringField
      DisplayLabel = 'Totalização'
      DisplayWidth = 9
      FieldName = 'FLGTOTALIZADA'
      FixedChar = True
      Size = 1
    end
    object QryDetNUMMAXLINHAS: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMMAXLINHAS'
      Visible = False
    end
    object QryDetVALORDEFAULT: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORDEFAULT'
      Visible = False
    end
    object QryDetIDMODELONF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODELONF'
      Visible = False
    end
    object QryDetIDCOMPNF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOMPNF'
      Visible = False
    end
    object QryDetFLGALINHAMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGALINHAMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DsDet: TwwDataSource
    DataSet = QryDet
    Left = 512
    Top = 7
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update COMPNOTAFISCAL'
      'set'
      '  IDMODELONF = :IDMODELONF,'
      '  IDCOMPNF = :IDCOMPNF,'
      '  COLUNA = :COLUNA,'
      '  LINHA = :LINHA,'
      '  TAMANHO = :TAMANHO,'
      '  FLGALINHAMENTO = :FLGALINHAMENTO,'
      '  FLGIMPOSTO = :FLGIMPOSTO,'
      '  FLGTOTALIZADA = :FLGTOTALIZADA,'
      '  NUMMAXLINHAS = :NUMMAXLINHAS,'
      '  VALORDEFAULT = :VALORDEFAULT,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDMODELONF = :OLD_IDMODELONF and'
      '  IDCOMPNF = :OLD_IDCOMPNF')
    InsertSQL.Strings = (
      'insert into COMPNOTAFISCAL'
      
        '  (IDMODELONF, IDCOMPNF, COLUNA, LINHA, TAMANHO, FLGALINHAMENTO,' +
        ' FLGIMPOSTO, '
      '   FLGTOTALIZADA, NUMMAXLINHAS, VALORDEFAULT, DESCRICAO)'
      'values'
      
        '  (:IDMODELONF, :IDCOMPNF, :COLUNA, :LINHA, :TAMANHO, :FLGALINHA' +
        'MENTO, '
      
        '   :FLGIMPOSTO, :FLGTOTALIZADA, :NUMMAXLINHAS, :VALORDEFAULT, :D' +
        'ESCRICAO)')
    DeleteSQL.Strings = (
      'delete from COMPNOTAFISCAL'
      'where'
      '  IDMODELONF = :OLD_IDMODELONF and'
      '  IDCOMPNF = :OLD_IDCOMPNF')
    Left = 568
    Top = 7
  end
  object MnuImprimir: TPopupMenu
    Left = 312
    Top = 57
    object MnuNotateste: TMenuItem
      Caption = '&Nota de Teste'
    end
    object MnuMapa: TMenuItem
      Caption = '&Mapa para Configuração'
    end
  end
end
