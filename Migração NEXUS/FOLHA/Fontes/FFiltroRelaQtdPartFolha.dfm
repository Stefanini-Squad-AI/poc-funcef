inherited FrmFiltroRelaQtdPartFolha: TFrmFiltroRelaQtdPartFolha
  Left = 144
  Top = 170
  HelpContext = 180089
  Caption = 
    'Filtro do Relatório de Quantidade de Participantes por Patrocina' +
    'dora por Versão da Folha'
  ClientHeight = 232
  ClientWidth = 570
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 570
    Height = 193
    object lblhistorico: TLabel
      Left = 88
      Top = 28
      Width = 104
      Height = 13
      Caption = 'Histórico da Folha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 88
      Top = 96
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbHistorico: TwwDBLookupCombo
      Left = 88
      Top = 43
      Width = 393
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'HISTORICO'#9'50'#9'Histórico'#9'F')
      LookupTable = qryHistorico
      LookupField = 'IDHSTFOLHABENEF'
      Options = [loTitles]
      Enabled = False
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = cmbHistoricoChange
    end
    object dblkPatroFolhaBenef: TwwDBLookupCombo
      Left = 88
      Top = 112
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = qryPatroFolhaBenef
      LookupField = 'IDPESSOA'
      Enabled = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 193
    Width = 570
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 67
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '  MESREFERENCIA'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 449
    Top = 43
    object qryHistoricoHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHistoricoMESREFERENCIA: TStringField
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTFOLHABENEF.MESREFERENCIA'
      Visible = False
      Size = 7
    end
    object qryHistoricoIDHSTFOLHABENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
  object qryPatroFolhaBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PT.IDPESSOA,'
      '  P.NOME'
      'FROM PATRO PT, PESSOA P'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 448
    Top = 112
    object qryPatroFolhaBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PATRO.IDPESSOA'
    end
    object qryPatroFolhaBenefNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
end
