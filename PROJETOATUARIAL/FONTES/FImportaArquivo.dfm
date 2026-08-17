inherited frmImportaArquivo: TfrmImportaArquivo
  Left = 98
  Top = 33
  HelpContext = 40149
  Caption = 'Importar Arquivo'
  ClientHeight = 465
  ClientWidth = 591
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 591
    Height = 426
    object GroupBox1: TGroupBox
      Left = 10
      Top = 230
      Width = 366
      Height = 186
      Caption = 'Seleção do Arquivo'
      TabOrder = 0
      object DrveCmbBxDrive: TDriveComboBox
        Left = 8
        Top = 16
        Width = 173
        Height = 20
        DirList = DrctryLstBxDiret
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DrctryLstBxDiret: TDirectoryListBox
        Left = 8
        Top = 40
        Width = 173
        Height = 116
        DirLabel = LblDiretorio
        FileList = FlLstBxArq
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
      end
      object FltrCmbBxFiltro: TFilterComboBox
        Left = 8
        Top = 160
        Width = 173
        Height = 22
        FileList = FlLstBxArq
        Filter = 'All files (*.txt)|*.txt'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object FlLstBxArq: TFileListBox
        Left = 185
        Top = 15
        Width = 171
        Height = 166
        FileEdit = EdtArqSelec
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 14
        Mask = '*.txt'
        ParentFont = False
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 380
      Top = 230
      Width = 201
      Height = 111
      Caption = 'Arquivo Selecionado'
      Enabled = False
      TabOrder = 1
      object Label5: TLabel
        Left = 10
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Diretório:'
      end
      object LblDiretorio: TLabel
        Left = 10
        Top = 34
        Width = 168
        Height = 13
        Caption = 'C:\...\Projeto Atuarial\Fontes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 55
        Width = 48
        Height = 13
        Caption = 'Arquivo:'
      end
      object EdtArqSelec: TEdit
        Left = 10
        Top = 72
        Width = 181
        Height = 21
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '*.txt'
      end
    end
    object GroupBox3: TGroupBox
      Left = 380
      Top = 345
      Width = 201
      Height = 71
      Caption = 'Parâmetros de importação'
      TabOrder = 2
      object Label6: TLabel
        Left = 30
        Top = 45
        Width = 43
        Height = 13
        Caption = 'Apenas'
      end
      object Label8: TLabel
        Left = 130
        Top = 45
        Width = 49
        Height = 13
        Caption = 'registros'
      end
      object MskEdtNumRegs: TMaskEdit
        Left = 80
        Top = 40
        Width = 46
        Height = 21
        EditMask = '!99999;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '     '
      end
    end
    object ChckBxTodosRegs: TCheckBox
      Left = 410
      Top = 365
      Width = 146
      Height = 17
      Caption = 'Todo o arquivo'
      TabOrder = 3
    end
    object PnlVersaoBase: TPanel
      Left = 10
      Top = 50
      Width = 571
      Height = 131
      BevelInner = bvLowered
      Enabled = False
      TabOrder = 4
      object Label1: TLabel
        Left = 10
        Top = 45
        Width = 51
        Height = 13
        Caption = 'Entidade'
      end
      object Label2: TLabel
        Left = 291
        Top = 45
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label3: TLabel
        Left = 10
        Top = 85
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label11: TLabel
        Left = 124
        Top = 5
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = 'Versão Base'
      end
      object Label9: TLabel
        Left = 11
        Top = 5
        Width = 107
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de referência'
      end
      object Label4: TLabel
        Left = 292
        Top = 5
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usuário'
      end
      object Label10: TLabel
        Left = 290
        Top = 85
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object DBLkpCmbBxEntidade: TDBLookupComboBox
        Left = 10
        Top = 60
        Width = 271
        Height = 21
        KeyField = 'CD_PESSOA_ENTID'
        ListField = 'NO_PESSOA'
        ListSource = dsEntidade
        TabOrder = 2
      end
      object DBLkpCmbBxPatrocinadora: TDBLookupComboBox
        Left = 290
        Top = 60
        Width = 271
        Height = 21
        KeyField = 'CD_PESSOA_PATROC'
        ListField = 'NO_PESSOA'
        ListSource = dsPatrocinadora
        TabOrder = 3
      end
      object DBLkpCmbBxPlano: TDBLookupComboBox
        Left = 10
        Top = 100
        Width = 271
        Height = 21
        KeyField = 'CD_PLANO'
        ListField = 'NO_PLANO'
        ListSource = dsPlano
        TabOrder = 5
      end
      object MskEdtDtRefer: TMaskEdit
        Left = 10
        Top = 20
        Width = 106
        Height = 21
        EditMask = '!99/00/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object Edit4: TEdit
        Left = 290
        Top = 20
        Width = 271
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 4
      end
      object EdtVersao: TEdit
        Left = 125
        Top = 20
        Width = 156
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 1
      end
      object EdtDtDescrBase: TEdit
        Left = 290
        Top = 100
        Width = 271
        Height = 21
        TabOrder = 6
      end
    end
    object RdGrpOpcao: TRadioGroup
      Left = 10
      Top = 5
      Width = 571
      Height = 41
      Caption = 'Opções de importação'
      Columns = 2
      Items.Strings = (
        'Criar uma nova versão de base'
        'Importar para a versão de base de trabalho')
      TabOrder = 5
      OnClick = RdGrpOpcaoClick
    end
    object Panel2: TPanel
      Left = 10
      Top = 185
      Width = 571
      Height = 41
      BevelInner = bvLowered
      TabOrder = 6
      object Label12: TLabel
        Left = 10
        Top = 13
        Width = 111
        Height = 13
        Caption = 'Lay-out do arquivo:'
      end
      object DBLkpCmbBxLayout: TDBLookupComboBox
        Left = 125
        Top = 10
        Width = 436
        Height = 21
        KeyField = 'CD_ARQUIVO'
        ListField = 'NO_ARQUIVO'
        ListSource = dsLayout
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 591
    inherited tb97Fundo: TToolbar97
      Left = 300
      DockPos = 300
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 132
      DockPos = 132
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 238
    Top = 18
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryEntidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   DISTINCT B.CD_PESSOA_ENTID,'
      '         A.NO_PESSOA'
      '  FROM   FI_PESSOA_JURIDICA A,'
      '         FI_PLANO_PATRONAL B'
      ' WHERE   A.CD_PESSOA = B.CD_PESSOA_ENTID'
      'ORDER BY A.NO_PESSOA')
    ValidateWithMask = True
    Left = 315
    Top = 55
    object qryEntidadeCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PESSOA_ENTID'
    end
    object qryEntidadeNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
  end
  object dsEntidade: TwwDataSource
    DataSet = qryEntidade
    Left = 295
    Top = 5
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEntidade
    SQL.Strings = (
      'SELECT   DISTINCT B.CD_PESSOA_ENTID,'
      '         B.CD_PESSOA_PATROC,'
      '         A.NO_PESSOA'
      '  FROM   FI_PESSOA_JURIDICA A,'
      '         FI_PLANO_PATRONAL B'
      ' WHERE   A.CD_PESSOA = B.CD_PESSOA_PATROC'
      '   AND   B.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      'ORDER BY A.NO_PESSOA')
    ValidateWithMask = True
    Left = 340
    Top = 65531
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryPatrocinadoraCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PESSOA_ENTID'
    end
    object qryPatrocinadoraCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PESSOA_PATROC'
    end
    object qryPatrocinadoraNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
  end
  object dsPatrocinadora: TwwDataSource
    DataSet = qryPatrocinadora
    Left = 410
    Top = 5
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatrocinadora
    SQL.Strings = (
      'SELECT   A.CD_PESSOA_ENTID,'
      '         A.CD_PESSOA_PATROC,'
      '         A.CD_PLANO,'
      '         A.NO_PLANO'
      '  FROM   FI_PLANO_PATRONAL A'
      ' WHERE   A.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   AND   A.CD_PESSOA_PATROC = :CD_PESSOA_pATROC'
      'ORDER BY A.NO_PLANO')
    ValidateWithMask = True
    Left = 455
    Top = 5
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_pATROC'
        ParamType = ptUnknown
      end>
    object qryPlanoCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PESSOA_ENTID'
    end
    object qryPlanoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PESSOA_PATROC'
    end
    object qryPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PLANO'
    end
    object qryPlanoNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = '"CM.FI_PLANO_PATRONAL".NO_PLANO'
      Size = 60
    end
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 485
    Top = 5
  end
  object qryLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_ARQUIVO,NO_ARQUIVO from FI_ARQUIVO'
      'where ir_para_importacao = '#39'S'#39)
    ValidateWithMask = True
    Left = 520
    Top = 5
    object qryLayoutCD_ARQUIVO: TFloatField
      FieldName = 'CD_ARQUIVO'
      Origin = 'FI_ARQUIVO.CD_ARQUIVO'
    end
    object qryLayoutNO_ARQUIVO: TStringField
      FieldName = 'NO_ARQUIVO'
      Origin = 'FI_ARQUIVO.NO_ARQUIVO'
      Size = 60
    end
  end
  object dsLayout: TwwDataSource
    DataSet = qryLayout
    Left = 550
    Top = 5
  end
  object qryVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_VERSAO_BASE'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 220
    Top = 65531
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryVersaoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".CD_VERSAO'
    end
    object qryVersaoDS_VERSAO: TStringField
      FieldName = 'DS_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".DS_VERSAO'
      Size = 60
    end
    object qryVersaoDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_VERSAO_BASE".DT_GERACAO'
    end
    object qryVersaoLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = '"CM.FI_VERSAO_BASE".LOGIN'
    end
    object qryVersaoDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = '"CM.FI_VERSAO_BASE".DT_REFER_BASE'
    end
    object qryVersaoIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = '"CM.FI_VERSAO_BASE".CD_PLANO'
      Size = 1
    end
  end
  object dsVersao: TwwDataSource
    DataSet = qryVersao
    Left = 255
  end
  object qryChaveVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(CD_VERSAO) COD FROM FI_VERSAO_BASE')
    ValidateWithMask = True
    Left = 300
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 355
    Top = 40
  end
  object wwQryAtuPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update  FI_participante'
      ' set    tp_participante = '#39'A'#39
      ' where  cd_versao = :cd_versao '
      '      and  tp_participante is null')
    ValidateWithMask = True
    Left = 532
    Top = 431
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end>
    object StringField2: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object wwQryAtuTipoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update FI_PARTICIPANTE'
      '  set  TP_PARTICIPANTE = '#39'B'#39
      'where  CD_VERSAO = :cd_versao'
      '  and  CD_PARTIC in'
      '    (select FI_DEPENDENTE.CD_PARTIC'
      '      from  FI_PARTICIPANTE, FI_DEPENDENTE'
      '     where  FI_PARTICIPANTE.CD_VERSAO = :cd_versao'
      '       and  FI_PARTICIPANTE.CD_VERSAO = FI_DEPENDENTE.CD_VERSAO'
      '       and  FI_PARTICIPANTE.CD_PARTIC = FI_DEPENDENTE.CD_PARTIC)'
      '')
    ValidateWithMask = True
    Left = 499
    Top = 431
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_versao'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_ENTIDADE_PREVIDENCIA b'
      'where a.CD_PESSOA = b.CD_PESSOA_ENTID'
      '   and a.CD_PESSOA = :CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 15
    Top = 430
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryEntidNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object qryPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_PESSOA'
      'from FI_PESSOA_JURIDICA a, FI_PATROCINADORA b'
      'where a.CD_PESSOA = b.CD_PESSOA_PATROC'
      '   and a.CD_PESSOA = :CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 50
    Top = 430
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end>
    object qryPatrocNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object qryPlan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 85
    Top = 430
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
  end
  object wwQryVersaoBase: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_BASE_PLANO_PATRONAL'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 254
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object wwQryVersaoBaseCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_VERSAO'
    end
    object wwQryVersaoBaseCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_PATROC'
    end
    object wwQryVersaoBaseCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_ENTID'
    end
    object wwQryVersaoBaseCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PLANO'
    end
  end
end
