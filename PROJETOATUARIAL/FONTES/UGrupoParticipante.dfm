inherited frmGrupoParticipante: TfrmGrupoParticipante
  Left = 540
  Top = 248
  HelpContext = 40165
  Caption = 'Grupo de Partipantes'
  ClientHeight = 399
  ClientWidth = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 497
    Height = 313
    object GrpBxRotCalc: TGroupBox
      Left = 1
      Top = 1
      Width = 495
      Height = 311
      Align = alClient
      Caption = 'Grupo de Enquadramento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 357
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 20
        Top = 40
        Width = 89
        Height = 13
        Caption = 'Nome do Grupo'
      end
      object DBEditNomeGrupo: TDBEdit
        Left = 19
        Top = 59
        Width = 382
        Height = 21
        DataField = 'NO_GRUPO_PARTIC'
        DataSource = ds
        TabOrder = 2
        OnChange = DBEditNomeGrupoChange
      end
      object DBMemocondicao: TDBMemo
        Left = 2
        Top = 147
        Width = 491
        Height = 162
        Hint = 'Condição de Enquadramento do Participante'
        Align = alBottom
        DataField = 'DS_CONDICAO_EQUADRAMENTO'
        DataSource = ds
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object wwDBEdit1: TwwDBEdit
        Left = 356
        Top = 31
        Width = 45
        Height = 21
        Hint = 'Ordem de Enquadramento do Participante'
        Color = clSilver
        DataField = 'CD_GRUPO_PARTIC'
        DataSource = ds
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object BtBtnFormula: TBitBtn
        Left = 325
        Top = 93
        Width = 146
        Height = 31
        Hint = 
          'Assistente para construção da condição de enquadramento do parti' +
          'cipante'
        Caption = 'Condição Grupo >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtBtnFormulaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        NumGlyphs = 2
      end
      object GroupBox: TGroupBox
        Left = 18
        Top = 88
        Width = 298
        Height = 38
        Caption = 'Tipo do Grupo'
        Enabled = False
        TabOrder = 4
        object ChkBxCalculo: TCheckBox
          Left = 26
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Calculo'
          TabOrder = 0
        end
        object ChkBxExportacao: TCheckBox
          Left = 109
          Top = 16
          Width = 87
          Height = 17
          Caption = 'Exportação'
          TabOrder = 1
        end
        object ChkBxCritica: TCheckBox
          Left = 216
          Top = 16
          Width = 62
          Height = 17
          Caption = 'Crítica'
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 497
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 497
    inherited tb97Fundo: TToolbar97
      Left = 325
      DockPos = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 156
      DockPos = 159
    end
    inherited dbnav: TDBNavigator
      Left = 29
      Hints.Strings = ()
      OnClick = dbnavClick
    end
  end
  inherited ds: TwwDataSource
    DataSet = wwqryGrupoPartic
    Left = 251
    Top = 13
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 458
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    DataSet = wwqryGrupoPartic
    Left = 428
    Top = 13
  end
  object wwqryGrupoPartic: TwwQuery
    CachedUpdates = True
    AfterOpen = wwqryGrupoParticAfterOpen
    BeforePost = wwqryGrupoParticBeforePost
    AfterPost = wwqryGrupoParticAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      '  FROM FI_GRUPO_PARTICIPANTE GRUPO_PARTICIPANTE'
      ' '
      ' order by no_grupo_partic')
    UpdateObject = UpdtSQLGrupoPartic
    ValidateWithMask = True
    Left = 280
    Top = 12
    object wwqryGrupoParticCD_GRUPO_PARTIC: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC'
    end
    object wwqryGrupoParticNO_GRUPO_PARTIC: TStringField
      DisplayLabel = 'Nome do Grupo'
      DisplayWidth = 60
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      Size = 60
    end
    object wwqryGrupoParticDS_CONDICAO_EQUADRAMENTO: TMemoField
      DisplayWidth = 10
      FieldName = 'DS_CONDICAO_EQUADRAMENTO'
      Origin = 'FI_GRUPO_PARTICIPANTE.DS_CONDICAO_EQUADRAMENTO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object wwqryGrupoParticDS_SQL_ENQUADRAMENTO: TMemoField
      DisplayWidth = 10
      FieldName = 'DS_SQL_ENQUADRAMENTO'
      Origin = 'FI_GRUPO_PARTICIPANTE.DS_SQL_ENQUADRAMENTO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object UpdtSQLGrupoPartic: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRUPO_PARTICIPANTE'
      'set'
      '  NO_GRUPO_PARTIC = :NO_GRUPO_PARTIC,'
      '  DS_CONDICAO_EQUADRAMENTO = :DS_CONDICAO_EQUADRAMENTO,'
      '  DS_SQL_ENQUADRAMENTO = :DS_SQL_ENQUADRAMENTO'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC ')
    InsertSQL.Strings = (
      'insert into FI_GRUPO_PARTICIPANTE'
      '  (CD_GRUPO_PARTIC, NO_GRUPO_PARTIC, DS_CONDICAO_EQUADRAMENTO, '
      'DS_SQL_ENQUADRAMENTO)'
      'values'
      '  (:CD_GRUPO_PARTIC, :NO_GRUPO_PARTIC, '
      ':DS_CONDICAO_EQUADRAMENTO, :DS_SQL_ENQUADRAMENTO)')
    DeleteSQL.Strings = (
      'delete from FI_GRUPO_PARTICIPANTE'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC')
    Left = 310
    Top = 11
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_GRUPO_PARTIC) as Max_CD'
      'from FI_GRUPO_PARTICIPANTE')
    ValidateWithMask = True
    Left = 348
    Top = 15
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select 1 from'
      '   FI_BENEFICIO_CONCEDIDO FI_BENEFICIO_CONCEDIDO,'
      '   FI_TIPO_BENEFICIO FI_TIPO_BENEFICIO'
      '   where'
      
        '    FI_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF = FI_TIPO_BENEFICIO.CD_' +
        'TIPO_BENEF'
      
        'and FI_TIPO_BENEFICIO.DS_TIPO_BENEF = '#39'Aposentadoria por invalid' +
        'ez'#39
      'and FI_BENEFICIO_CONCEDIDO.CD_VERSAO = :CD_VERSAO'
      'and FI_BENEFICIO_CONCEDIDO.CD_PARTIC = :CD_PARTIC'
      'and FI_BENEFICIO_CONCEDIDO.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      'and FI_BENEFICIO_CONCEDIDO.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      'and FI_BENEFICIO_CONCEDIDO.CD_PLANO = :CD_PLANO')
    Left = 25
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_GRUPO_PARTIC, NR_ORDEM'
      'from FI_GRUPO_CALCULO'
      'WHERE CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC'
      '  AND CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  AND CD_PLANO = :CD_PLANO'
      'order by NR_ORDEM')
    ValidateWithMask = True
    Left = 220
    Top = 47
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryExportacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_GRUPO_PARTIC, NR_ORDEM'
      'from FI_GRUPO_EXPORTACAO'
      'WHERE CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC'
      '  AND CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  AND CD_PLANO = :CD_PLANO'
      'order by NR_ORDEM'
      ' ')
    ValidateWithMask = True
    Left = 250
    Top = 47
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryCritica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_GRUPO_PARTIC, NR_ORDEM'
      'from FI_GRUPO_CRITICA'
      'WHERE CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC'
      '  AND CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  AND CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  AND CD_PLANO = :CD_PLANO'
      'order by NR_ORDEM'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 47
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryInsCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_GRUPO_CALCULO'
      'values'
      '(:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID,'
      ' :CD_PLANO, :NR_ORDEM)')
    ValidateWithMask = True
    Left = 220
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_ORDEM'
        ParamType = ptUnknown
      end>
  end
  object qryInsExportacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_GRUPO_EXPORTACAO'
      'values'
      '(:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID,'
      ' :CD_PLANO, :NR_ORDEM)')
    ValidateWithMask = True
    Left = 250
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_ORDEM'
        ParamType = ptUnknown
      end>
  end
  object qryInsCritica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into FI_GRUPO_CRITICA'
      'values'
      '(:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID,'
      ' :CD_PLANO, :NR_ORDEM)')
    ValidateWithMask = True
    Left = 280
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_ORDEM'
        ParamType = ptUnknown
      end>
  end
  object qryAuxCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NR_ORDEM) as Max_CD'
      'from FI_GRUPO_CALCULO'
      'where CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 220
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryAuxExportacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NR_ORDEM) as Max_CD'
      'from FI_GRUPO_EXPORTACAO'
      'where CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 250
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryAuxCritica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NR_ORDEM) as Max_CD'
      'from FI_GRUPO_CRITICA'
      'where CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 280
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryDelCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete FI_GRUPO_CALCULO'
      'where CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 310
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryDelExportacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete FI_GRUPO_EXPORTACAO'
      'where CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 340
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryDelCritica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete FI_GRUPO_CRITICA'
      'where CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 370
    Top = 78
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Grupo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_GRUPO_PARTICIPANTE')
    CamposChave.Strings = (
      'FI_GRUPO_PARTICIPANTE.CD_GRUPO_PARTIC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 192
    Top = 55
  end
  object qryDelExportPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete FI_GRUPO_EXPORT_PARTIC'
      'where CD_GRUPO_PARTIC = :CD_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 340
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryDelGrupoParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_PARTICIPANTE'
      'SET CD_GRUPO_CALCULO = NULL,'
      '    CD_GRUPO_EXPORTACAO = NULL'
      'WHERE CD_GRUPO_CALCULO = :CD_GRUPO'
      '   OR CD_GRUPO_EXPORTACAO = :CD_GRUPO')
    ValidateWithMask = True
    Left = 340
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
  end
end
