inherited frmSelecCampoVar: TfrmSelecCampoVar
  Left = 62
  Top = 110
  Caption = 'Assistente para associar a variável à base'
  ClientHeight = 367
  ClientWidth = 655
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 655
    Height = 328
    object EditSQLExpressao: TMemo
      Left = 5
      Top = 6
      Width = 407
      Height = 152
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'EditSQLExpr'
        'essao')
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object GroupBox3: TGroupBox
      Left = 106
      Top = 240
      Width = 471
      Height = 81
      Caption = 'Campo Selecioando'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object EditExpressao: TMemo
        Left = 2
        Top = 15
        Width = 467
        Height = 64
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 6
      Width = 266
      Height = 231
      DataSource = dsGrupoLogico
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid1CellClick
      OnEnter = DBGrid1Enter
      Columns = <
        item
          Expanded = False
          FieldName = 'NO_GRUPO'
          Title.Caption = 'Cadastros'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 271
      Top = 6
      Width = 378
      Height = 212
      DataSource = dsGrupoAtributo
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid2CellClick
      OnEnter = DBGrid2Enter
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_ATRIBUTO_TABELA'
          Title.Caption = 'Campos'
          Visible = True
        end>
    end
    object DBComboBoxTipoAtributo: TDBLookupComboBox
      Left = 271
      Top = 217
      Width = 378
      Height = 21
      Enabled = False
      ListSource = wwDtSrcLookUp
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 328
    Width = 655
    inherited tb97Fundo: TToolbar97
      Left = 446
      DockPos = 446
      inherited sep1: TToolbarSep97
        Left = 0
      end
      inherited sep3: TToolbarSep97
        Left = 84
      end
      inherited bbtnSair: TBitBtn
        Left = 3
        Caption = '&Salvar'
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 87
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 277
      DockPos = 277
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Inserir'
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object BtBtnLimpar: TBitBtn
      Left = 183
      Top = 1
      Width = 88
      Height = 34
      Hint = 'Limpa condição'
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtBtnLimparClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 8
  end
  object qryGrupoLogico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_GRUPO_LOGICO'
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 205
    Top = 37
    object qryGrupoLogicoCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = 'FI_GRUPO_LOGICO.CD_GRUPO'
    end
    object qryGrupoLogicoNO_GRUPO: TStringField
      FieldName = 'NO_GRUPO'
      Origin = 'FI_GRUPO_LOGICO.NO_GRUPO'
      Size = 60
    end
    object qryGrupoLogicoNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'FI_GRUPO_LOGICO.NR_ORDEM'
    end
  end
  object dsGrupoLogico: TwwDataSource
    DataSet = qryGrupoLogico
    Left = 230
    Top = 37
  end
  object qryGrupoAtributo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGrupoLogico
    SQL.Strings = (
      'SELECT  *'
      'FROM FI_ATRIBUTO_TABELA'
      'WHERE CD_GRUPO = :CD_GRUPO'
      'and   TP_ATRIBUTO in ('#39'N'#39', '#39'F'#39')'
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 585
    Top = 37
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoAtributoNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object qryGrupoAtributoNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object qryGrupoAtributoDS_ATRIBUTO_TABELA: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".DS_ATRIBUTO_TABELA'
      Size = 60
    end
    object qryGrupoAtributoTP_ATRIBUTO: TStringField
      FieldName = 'TP_ATRIBUTO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".TP_ATRIBUTO'
      Size = 1
    end
    object qryGrupoAtributoNR_TAM_ATRIBUTO_TABELA: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NR_TAM_ATRIBUTO_TABELA'
    end
    object qryGrupoAtributoIR_MANDATORIO: TStringField
      FieldName = 'IR_MANDATORIO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_MANDATORIO'
      Size = 1
    end
    object qryGrupoAtributoIR_CARGA_OBRIGATORIA: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".IR_CARGA_OBRIGATORIA'
      Size = 1
    end
    object qryGrupoAtributoNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA_LOOKUP'
    end
    object qryGrupoAtributoNO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA_LOOKUP'
      Size = 60
    end
    object qryGrupoAtributoNO_ATRIBUTO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
      Size = 60
    end
    object qryGrupoAtributoCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = '"CM.FI_ATRIBUTO_TABELA".CD_GRUPO'
    end
  end
  object dsGrupoAtributo: TwwDataSource
    DataSet = qryGrupoAtributo
    Left = 610
    Top = 37
  end
  object wwQryLookUp: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGrupoLogico
    ValidateWithMask = True
    Left = 565
    Top = 177
  end
  object wwDtSrcLookUp: TwwDataSource
    DataSet = wwQryLookUp
    Left = 590
    Top = 177
  end
  object QryQuery: TQuery
    DatabaseName = 'BaseDados'
    Left = 594
    Top = 242
  end
  object wwQryPkAtributo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from fi_fk_tabela'
      '      where RTRIM(no_tabela) = :no_tabela and'
      
        '                 RTRIM(no_atributo_tabela_fk) = :no_atributo_tab' +
        'ela  '
      '')
    ValidateWithMask = True
    Left = 545
    Top = 242
    ParamData = <
      item
        DataType = ftString
        Name = 'no_tabela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'no_atributo_tabela'
        ParamType = ptUnknown
      end>
  end
end
