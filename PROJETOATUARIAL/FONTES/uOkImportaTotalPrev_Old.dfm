inherited frmOkImportaTotalPrev_Old: TfrmOkImportaTotalPrev_Old
  Left = 113
  Top = 111
  Caption = 'Importa dados da base TOTALPREV'
  ClientHeight = 413
  ClientWidth = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 510
    Height = 374
    object Label10: TLabel
      Left = 21
      Top = 148
      Width = 5
      Height = 13
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 508
      Height = 136
      Align = alTop
      Caption = 'Dados da Versão de Base'
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 28
        Width = 40
        Height = 13
        Caption = 'Versao'
      end
      object Label3: TLabel
        Left = 18
        Top = 54
        Width = 58
        Height = 13
        Caption = 'Endtidade'
      end
      object Label4: TLabel
        Left = 18
        Top = 80
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label5: TLabel
        Left = 18
        Top = 106
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Edit1: TEdit
        Left = 101
        Top = 23
        Width = 356
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 101
        Top = 49
        Width = 356
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit2'
      end
      object Edit3: TEdit
        Left = 101
        Top = 75
        Width = 356
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 2
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 101
        Top = 101
        Width = 356
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 3
        Text = 'Edit4'
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 148
      Width = 508
      Height = 225
      Align = alBottom
      Caption = 'Situação na Fundação'
      TabOrder = 1
      object CkLstBxSitFundacao: TCheckListBox
        Left = 2
        Top = 15
        Width = 504
        Height = 199
        Align = alClient
        IntegralHeight = True
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 510
    inherited tb97Fundo: TToolbar97
      Left = 338
      DockPos = 341
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      DockPos = 172
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update fi_participante'
      ' set   fi_participante.tipo_participante = '#39'B'#39
      ' from  fi_participante fi_participante,'
      '       fi_beneficio_concedido fi_beneficio_concedido'
      'where  fi_participante.cd_versao = :cd_versao'
      
        '  and  fi_participante.cd_versao = fi_beneficio_concedido.cd_ver' +
        'sao'
      
        '  and  fi_participante.cd_partic = fi_beneficio_concedido.cd_par' +
        'tic'
      '')
    ValidateWithMask = True
    Left = 151
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_versao'
        ParamType = ptUnknown
      end>
  end
  object wwQryAtuTipoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update FI_PARTICIPANTE'
      '  set  TP_PARTICIPANTE = '#39'B'#39
      'where  CD_VERSAO  = :cd_versao'
      '  and  CD_PARTIC in'
      '    (select FI_DEPENDENTE.CD_PARTIC'
      '      from  FI_PARTICIPANTE FI_PARTICIPANTE,'
      '            FI_DEPENDENTE FI_DEPENDENTE'
      '     where  FI_PARTICIPANTE.CD_VERSAO  = :cd_versao'
      '       and  FI_PARTICIPANTE.CD_VERSAO  = FI_DEPENDENTE.CD_VERSAO'
      '       and  FI_PARTICIPANTE.CD_PARTIC  = FI_DEPENDENTE.CD_PARTIC'
      '       and  FI_DEPENDENTE.CD_TIPO_BENEF is not null)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 68
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
  object wwQryAtuPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update  FI_participante'
      ' set    tp_participante = '#39'A'#39
      ' where  cd_versao = :cd_versao '
      '   and  CD_SITUACAO_PATROC = 1'
      '   and  tp_participante is null')
    ValidateWithMask = True
    Left = 447
    Top = 116
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
  object qrySitFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_SITUACAO_FUNDACAO'
      'order by DS_SITUACAO_FUNDACAO')
    ValidateWithMask = True
    Left = 256
    Top = 190
    object qrySitFundacaoCD_SITUACAO_FUNDACAO: TFloatField
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_SITUACAO_FUNDACAO.CD_SITUACAO_FUNDACAO'
      Visible = False
    end
    object qrySitFundacaoDS_SITUACAO_FUNDACAO: TStringField
      FieldName = 'DS_SITUACAO_FUNDACAO'
      Origin = '"CM.FI_SITUACAO_FUNDACAO".DS_SITUACAO_FUNDACAO'
      Size = 50
    end
  end
  object wwQryTotalxx: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '    Select'
      '      sum(1) as total'
      '   from'
      '            PARTPREVPLAN      PARTPREVPLAN'
      '    where                                         '
      '          PARTPREVPLAN.IDPESSJUR       = :patroc'
      '    and   PARTPREVPLAN.IDPLANOPREV     = :plano'
      '    and   PARTPREVPLAN.idsitpart       = :situacao'
      '')
    ValidateWithMask = True
    Left = 102
    Top = 222
    ParamData = <
      item
        DataType = ftInteger
        Name = 'patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'situacao'
        ParamType = ptUnknown
      end>
  end
  object QryTotal: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      '      sum(1) as total'
      '   from'
      '            PARTPREVPLAN      PARTPREVPLAN'
      '    where                                         '
      '          PARTPREVPLAN.IDPESSJUR       = :patroc'
      '    and   PARTPREVPLAN.IDPLANOPREV     = :plano'
      '    and   PARTPREVPLAN.idsitpart       = :situacao')
    Left = 101
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'patroc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'situacao'
        ParamType = ptUnknown
      end>
  end
  object QryGrupoPatrocinadoras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PESSOA_PATROC, CD_PLANO'
      'FROM FI_BASE_PLANO_PATRONAL'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 151
    Top = 166
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_versao'
        ParamType = ptUnknown
      end>
  end
end
