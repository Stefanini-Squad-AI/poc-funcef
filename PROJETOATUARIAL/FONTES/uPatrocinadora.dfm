inherited frmPatrocinadora: TfrmPatrocinadora
  Left = 455
  Top = 36
  HelpContext = 40167
  Caption = 'Patrocinadora'
  ClientHeight = 339
  ClientWidth = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    Height = 253
    object Label1: TLabel
      Left = 20
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 20
      Top = 49
      Width = 26
      Height = 13
      Caption = 'CGC'
      FocusControl = DBEdit6
    end
    object Label11: TLabel
      Left = 20
      Top = 89
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 225
      Top = 50
      Width = 100
      Height = 13
      Caption = 'Data de Reajuste'
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 25
      Width = 381
      Height = 21
      AutoSelect = False
      DataField = 'NO_PESSOA'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 20
      Top = 64
      Width = 167
      Height = 21
      AutoSelect = False
      DataField = 'NR_CGC'
      DataSource = ds
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 20
      Top = 104
      Width = 381
      Height = 94
      DataField = 'DS_OBSERV'
      DataSource = ds
      ScrollBars = ssBoth
      TabOrder = 4
    end
    object btbtnEndereco: TBitBtn
      Left = 32
      Top = 207
      Width = 83
      Height = 35
      Caption = '&Endereço >>'
      Enabled = False
      TabOrder = 5
      OnClick = btbtnEnderecoClick
    end
    object DBEdit2: TDBEdit
      Left = 225
      Top = 65
      Width = 119
      Height = 21
      DataField = 'DT_REAJUSTE_SALARIO'
      DataSource = dsPatroc
      TabOrder = 3
    end
    object dtEdit: TCMDateTimePicker
      Left = 225
      Top = 65
      Width = 111
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
      TabOrder = 2
      Visible = False
    end
    object btbtnCatProf: TBitBtn
      Left = 215
      Top = 207
      Width = 97
      Height = 35
      Caption = '&Categ. Prof. >>'
      Enabled = False
      TabOrder = 7
      OnClick = btbtnCatProfClick
    end
    object btbtnContatos: TBitBtn
      Left = 125
      Top = 207
      Width = 79
      Height = 35
      Caption = '&Contatos >>'
      Enabled = False
      TabOrder = 6
      OnClick = btbtnContatosClick
    end
  end
  inherited Dock972: TDock97
    Width = 420
  end
  inherited Dock971: TDock97
    Top = 300
    Width = 420
    inherited tb97Fundo: TToolbar97
      Left = 247
      DockPos = 247
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
      DockPos = 79
      TabOrder = 1
    end
    inherited dbnav: TDBNavigator
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
    DataSet = QryPrincipal
    Left = 291
    Top = 46
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 258
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 328
    Top = 13
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PESSOA, NO_PESSOA, NR_CGC, p.DT_REAJUSTE_SALARIO,'
      '           DS_OBSERV, CD_UF'
      'from FI_PESSOA_JURIDICA f, FI_PATROCINADORA p'
      'where f. CD_PESSOA = p.CD_PESSOA_PATROC'
      'order by NO_PESSOA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 258
    Top = 46
    object QryPrincipalCD_PESSOA: TFloatField
      DisplayLabel = 'Código da Patrocinadora'
      DisplayWidth = 5
      FieldName = 'CD_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.CD_PESSOA'
      Visible = False
    end
    object QryPrincipalNO_PESSOA: TStringField
      DisplayLabel = 'Nome da Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
    object QryPrincipalNR_CGC: TStringField
      DisplayLabel = 'CGC da Patrocinadora'
      DisplayWidth = 14
      FieldName = 'NR_CGC'
      Origin = 'FI_PESSOA_JURIDICA.NR_CGC'
      Size = 14
    end
    object QryPrincipalDS_OBSERV: TMemoField
      DisplayLabel = 'Observações'
      DisplayWidth = 10
      FieldName = 'DS_OBSERV'
      Origin = 'FI_PESSOA_JURIDICA.DS_OBSERV'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object QryPrincipalCD_UF: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 2
      FieldName = 'CD_UF'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_UF'
      Visible = False
      Size = 2
    end
    object QryPrincipalDT_REAJUSTE_SALARIO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DT_REAJUSTE_SALARIO'
      Origin = 'FI_PATROCINADORA.DT_REAJUSTE_SALARIO'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_PESSOA_JURIDICA'
      'set'
      '  NO_PESSOA = :NO_PESSOA,'
      '  NR_CGC = :NR_CGC,'
      '  DS_OBSERV = :DS_OBSERV'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into FI_PESSOA_JURIDICA'
      '  (CD_PESSOA, NO_PESSOA, NR_CGC, DS_OBSERV)'
      'values'
      '  (:CD_PESSOA, :NO_PESSOA, :NR_CGC, :DS_OBSERV)')
    DeleteSQL.Strings = (
      'delete from FI_PESSOA_JURIDICA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Left = 325
    Top = 47
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_PESSOA) as Max_CD'
      'from FI_PESSOA_JURIDICA')
    ValidateWithMask = True
    Left = 374
    Top = 12
  end
  object qryPatroc: TwwQuery
    CachedUpdates = True
    BeforePost = qryPatrocBeforePost
    AfterPost = qryPatrocAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA_PATROC, DT_REAJUSTE_SALARIO'
      'from FI_PATROCINADORA '
      'where CD_PESSOA_PATROC = :CD_PESSOA')
    UpdateObject = UpdtSQLPatroc
    ValidateWithMask = True
    Left = 258
    Top = 74
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryPatrocCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_PATROCINADORA.CD_PESSOA_PATROC'
    end
    object qryPatrocDT_REAJUSTE_SALARIO: TDateTimeField
      FieldName = 'DT_REAJUSTE_SALARIO'
      Origin = 'FI_PATROCINADORA.DT_REAJUSTE_SALARIO'
    end
  end
  object UpdtSQLPatroc: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_PATROCINADORA'
      'set'
      '  DT_REAJUSTE_SALARIO = :DT_REAJUSTE_SALARIO'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC')
    InsertSQL.Strings = (
      'insert into FI_PATROCINADORA'
      '  (CD_PESSOA_PATROC, DT_REAJUSTE_SALARIO)'
      'values'
      '  (:CD_PESSOA_PATROC, :DT_REAJUSTE_SALARIO)')
    DeleteSQL.Strings = (
      'delete from FI_PATROCINADORA'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC')
    Left = 325
    Top = 74
  end
  object dsPatroc: TwwDataSource
    AutoEdit = False
    DataSet = qryPatroc
    Left = 291
    Top = 74
  end
  object qryContatos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA_CONTATO, NO_PESSOA_CONTATO'
      'from FI_CONTATO_PESSOA_JURIDICA'
      'where CD_PESSOA_CONTATO = :CD_PESSOA')
    ValidateWithMask = True
    Left = 374
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCatProf: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA_PATROC'
      'from FI_CATEG_PROF_ESP_PATROC'
      'where CD_PESSOA_PATROC = :CD_PESSOA')
    ValidateWithMask = True
    Left = 374
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PESSOA_PATROC = :CD_PESSOA')
    ValidateWithMask = True
    Left = 374
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PF.NO_PESSOA'
      'PF.NR_CGC')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Patrocinadora'
      'CGC')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_PATROCINADORA PT'
      'FI_PESSOA_JURIDICA PF')
    CamposChave.Strings = (
      'PT.CD_PESSOA_PATROC')
    Filtro.Strings = (
      'PF.CD_PESSOA = PT.CD_PESSOA_PATROC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '14')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 208
    Top = 55
  end
end
