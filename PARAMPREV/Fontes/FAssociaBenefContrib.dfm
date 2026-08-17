inherited frmAssociaBenefContrib: TfrmAssociaBenefContrib
  Left = 147
  Top = 210
  Caption = 'Associação de Contribuição por Benefício'
  ClientHeight = 445
  ClientWidth = 732
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 732
    Height = 406
    object lblPlanPatro: TLabel
      Left = 8
      Top = 2
      Width = 283
      Height = 43
      AutoSize = False
      Caption = 'Rubricas por Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object sbtnAssocia: TSpeedButton
      Left = 349
      Top = 72
      Width = 25
      Height = 26
      Hint = 'Associar contribuição selecionada'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
    end
    object sbtnAssociaTodos: TSpeedButton
      Left = 349
      Top = 102
      Width = 25
      Height = 26
      Hint = 'Associar todas as contribuições'
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
    end
    object sbtnDesassocia: TSpeedButton
      Left = 349
      Top = 132
      Width = 25
      Height = 26
      Hint = 'Desativar Contribuição selecionada'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
    end
    object Label10: TLabel
      Left = 383
      Top = 1
      Width = 247
      Height = 47
      AutoSize = False
      Caption = 'Rubricas  não Associadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 730
      Height = 192
      Align = alTop
      TabOrder = 0
      object lblBeneficios: TLabel
        Left = 13
        Top = 6
        Width = 98
        Height = 24
        Caption = 'Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblklstBenef: TDBLookupListBox
        Left = 9
        Top = 33
        Width = 706
        Height = 134
        KeyField = 'IDBENEFICIO'
        ListField = 'NOME'
        ListSource = dsBenef
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 193
      Width = 730
      Height = 212
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object btnRemoveContrib: TSpeedButton
        Left = 349
        Top = 72
        Width = 25
        Height = 26
        Hint = 'Associar contribuição selecionada'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnRemoveContribClick
      end
      object btnRemoveTodasContrib: TSpeedButton
        Left = 349
        Top = 102
        Width = 25
        Height = 26
        Hint = 'Associar todas as contribuições'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnRemoveTodasContribClick
      end
      object btnAdicionaContrib: TSpeedButton
        Left = 349
        Top = 132
        Width = 25
        Height = 26
        Hint = 'Desativar Contribuição selecionada'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAdicionaContribClick
      end
      object btnAdicionaTodasContrib: TSpeedButton
        Left = 349
        Top = 162
        Width = 25
        Height = 25
        Hint = 'Desativar todas as contribuições'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAdicionaTodasContribClick
      end
      object Label1: TLabel
        Left = 383
        Top = 1
        Width = 298
        Height = 47
        AutoSize = False
        Caption = 'Contribuições Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label2: TLabel
        Left = 8
        Top = 2
        Width = 313
        Height = 43
        AutoSize = False
        Caption = 'Contribuições Não Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dblklstContrib: TDBLookupListBox
        Left = 6
        Top = 32
        Width = 331
        Height = 212
        KeyField = 'IDCONTRIBUICAO'
        ListField = 'NOME'
        ListSource = dsContrib
        TabOrder = 0
      end
      object dblklstContribRel: TDBLookupListBox
        Left = 384
        Top = 32
        Width = 333
        Height = 212
        KeyField = 'IDCONTRIBUICAO'
        ListField = 'NOME'
        ListSource = dsContribRel
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object qryBenef: TwwQuery
    AfterScroll = qryBenefAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBENEFICIO, NOME FROM BENEFICIO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 312
    Top = 104
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 312
    Top = 48
  end
  object dsContrib: TwwDataSource
    DataSet = qryContrib
    Left = 256
    Top = 248
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CC.IDCONTRIBUICAO, CC.NOME'
      '  FROM BENEFPLANPREV BP'
      '  JOIN CONTPLANPATRO C'
      '    ON C.IDPLANOPREV = BP.IDPLANOPREV'
      '  JOIN CONTRIBUICAO CC '
      '    ON C.IDCONTRIBUICAO = CC.IDCONTRIBUICAO'
      '  JOIN BENEFICIO B'
      '    ON B.IDBENEFICIO = BP.IDBENEFICIO'
      'WHERE B.IDBENEFICIO = :IDBENEFICIO'
      '   AND NOT EXISTS (SELECT 1 FROM BENEFXTAXA BX'
      '   WHERE BX.IDBENEFICIO = B.IDBENEFICIO'
      '   AND BX.IDCONTRIBUICAO = C.IDCONTRIBUICAO)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 256
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsContribRel: TwwDataSource
    DataSet = qryContribRel
    Left = 642
    Top = 248
  end
  object qryContribRel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME FROM BENEFXTAXA BX'
      'INNER JOIN CONTRIBUICAO C'
      'ON BX.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'WHERE BX.IDBENEFICIO = :IDBENEFICIO'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 642
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
end
