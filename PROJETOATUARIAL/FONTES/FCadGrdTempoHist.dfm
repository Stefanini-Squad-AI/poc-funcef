inherited frmCadGrdTempoHist: TfrmCadGrdTempoHist
  Left = 282
  Top = 138
  Width = 470
  Height = 357
  Caption = 'Base de Histórico  - Tempo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
    Height = 244
    inherited dbGrd: TwwDBGrid [0]
      Width = 452
      Height = 234
      Selected.Strings = (
        'DS_TIPO_TEMPO'#9'40'#9'Tipo de Tempo'
        'DT_TEMPO'#9'10'#9'Data')
      Color = clSilver
      ReadOnly = True
    end
    inherited pnlControles: TPanel [1]
      Width = 452
      Height = 234
      object Label4: TLabel
        Left = 40
        Top = 28
        Width = 86
        Height = 13
        Caption = 'Tipo de Tempo'
      end
      object Label8: TLabel
        Left = 40
        Top = 82
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 40
        Top = 137
        Width = 26
        Height = 13
        Caption = 'Dias'
      end
      object Label2: TLabel
        Left = 115
        Top = 137
        Width = 37
        Height = 13
        Caption = 'Meses'
      end
      object Label3: TLabel
        Left = 190
        Top = 137
        Width = 29
        Height = 13
        Caption = 'Anos'
      end
      object LkcTbTipoTempo: TwwDBLookupCombo
        Left = 40
        Top = 43
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_TIPO_TEMPO'#9'60'#9'Tipo de Tempo')
        DataField = 'CD_TIPO_TEMPO'
        DataSource = ds
        LookupTable = qryTipoTempo
        LookupField = 'CD_TIPO_TEMPO'
        Options = [loColLines, loRowLines]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object DBEdit1: TDBEdit
        Left = 40
        Top = 151
        Width = 46
        Height = 21
        AutoSelect = False
        DataField = 'QT_DIA_TEMPO'
        DataSource = ds
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 115
        Top = 151
        Width = 46
        Height = 21
        AutoSelect = False
        DataField = 'QT_MES_TEMPO'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 190
        Top = 151
        Width = 46
        Height = 21
        AutoSelect = False
        DataField = 'QT_ANO_TEMPO'
        DataSource = ds
        TabOrder = 4
      end
      object DateEdit: TCMDateTimePicker
        Left = 40
        Top = 96
        Width = 126
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 462
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 18
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 18
        Width = 18
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 54
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 36
        Width = 18
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 291
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 124
      DockPos = 124
    end
    inherited dbnav: TDBNavigator
      Left = 40
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 268
    Top = 23
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 363
    Top = 16
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 394
    Top = 14
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select b.DS_TIPO_TEMPO, a.*'
      'from FI_BK_TEMPO_PARTICIPANTE a, FI_TIPO_TEMPO b'
      'where a.CD_VERSAO = :CD_VERSAO'
      '   and a.CD_PARTIC = :CD_PARTIC'
      '   and a.CD_TIPO_TEMPO = b.CD_TIPO_TEMPO'
      'order by b.DS_TIPO_TEMPO, a.DT_TEMPO')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 238
    Top = 23
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
      end>
    object qryPrincipalDS_TIPO_TEMPO: TStringField
      DisplayLabel = 'Tipo de Tempo'
      DisplayWidth = 40
      FieldName = 'DS_TIPO_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.CD_VERSAO'
      Size = 60
    end
    object qryPrincipalDT_TEMPO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DT_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_DIA_TEMPO'
    end
    object qryPrincipalQT_DIA_TEMPO: TFloatField
      DisplayLabel = 'Dias'
      DisplayWidth = 10
      FieldName = 'QT_DIA_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_MES_TEMPO'
      Visible = False
    end
    object qryPrincipalQT_MES_TEMPO: TFloatField
      DisplayLabel = 'Meses'
      DisplayWidth = 10
      FieldName = 'QT_MES_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.QT_ANO_TEMPO'
      Visible = False
    end
    object qryPrincipalQT_ANO_TEMPO: TFloatField
      DisplayLabel = 'Anos'
      DisplayWidth = 10
      FieldName = 'QT_ANO_TEMPO'
      Origin = 'FI_TIPO_TEMPO.DS_TIPO_TEMPO'
      Visible = False
    end
    object qryPrincipalCD_VERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_VERSAO'
      Origin = 'FI_TEMPO_PARTICIPANTE.CD_PARTIC'
      Visible = False
    end
    object qryPrincipalCD_PARTIC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PARTIC'
      Origin = 'FI_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO'
      Visible = False
    end
    object qryPrincipalCD_TIPO_TEMPO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_TEMPO'
      Origin = 'FI_TEMPO_PARTICIPANTE.DT_TEMPO'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BK_TEMPO_PARTICIPANTE'
      'set'
      '  DT_TEMPO = :DT_TEMPO,'
      '  QT_DIA_TEMPO = :QT_DIA_TEMPO,'
      '  QT_MES_TEMPO = :QT_MES_TEMPO,'
      '  QT_ANO_TEMPO = :QT_ANO_TEMPO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_TIPO_TEMPO = :OLD_CD_TIPO_TEMPO')
    InsertSQL.Strings = (
      'insert into FI_BK_TEMPO_PARTICIPANTE'
      '  (CD_VERSAO, CD_PARTIC, CD_TIPO_TEMPO, DT_TEMPO, QT_DIA_TEMPO, '
      '   QT_MES_TEMPO, QT_ANO_TEMPO)'
      'values'
      
        '  (:CD_VERSAO, :CD_PARTIC, :CD_TIPO_TEMPO, :DT_TEMPO, :QT_DIA_TE' +
        'MPO, '
      '   :QT_MES_TEMPO, :QT_ANO_TEMPO)')
    DeleteSQL.Strings = (
      'delete from FI_BK_TEMPO_PARTICIPANTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_TIPO_TEMPO = :OLD_CD_TIPO_TEMPO')
    Left = 300
    Top = 23
  end
  object qryTipoTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_TIPO_TEMPO'
      'order by DS_TIPO_TEMPO')
    ValidateWithMask = True
    Left = 228
    Top = 90
    object qryTipoTempoDS_TIPO_TEMPO: TStringField
      DisplayLabel = 'Tipo de Tempo'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_TEMPO'
      Origin = '"CM.FI_TIPO_TEMPO".DS_TIPO_TEMPO'
      Size = 60
    end
    object qryTipoTempoCD_TIPO_TEMPO: TFloatField
      FieldName = 'CD_TIPO_TEMPO'
      Origin = '"CM.FI_TIPO_TEMPO".CD_TIPO_TEMPO'
      Visible = False
    end
    object qryTipoTempoIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = '"CM.FI_TIPO_TEMPO".IR_DOMINIO_SISTEMA'
      Visible = False
      Size = 3
    end
  end
  object dsTipoTempo: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoTempo
    Left = 261
    Top = 90
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_TEMPO.DS_TIPO_TEMPO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Tempo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_BK_TEMPO_PARTICIPANTE'
      'FI_TIPO_TEMPO')
    CamposChave.Strings = (
      'FI_BK_TEMPO_PARTICIPANTE.CD_VERSAO'
      'FI_BK_TEMPO_PARTICIPANTE.CD_PARTIC'
      'FI_BK_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO')
    Filtro.Strings = (
      
        'FI_BK_TEMPO_PARTICIPANTE.CD_TIPO_TEMPO = FI_TIPO_TEMPO.CD_TIPO_T' +
        'EMPO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 189
    Top = 124
  end
end
