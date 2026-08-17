object molListaCodigosCNAB: TmolListaCodigosCNAB
  Left = 0
  Top = 0
  Width = 402
  Height = 182
  TabOrder = 0
  object Label6: TLabel
    Left = 8
    Top = 2
    Width = 72
    Height = 13
    Caption = 'Retorno Débito'
  end
  object lstCodigosCNAB: TCheckListBox
    Left = 8
    Top = 16
    Width = 385
    Height = 129
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
  end
  object btnInverteCodigosCNAB: TBitBtn
    Left = 343
    Top = 7
    Width = 21
    Height = 20
    Hint = 'Inverte a Seleção de Patrocinadoras'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnInverteCodigosCNABClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888488888888888888844888888888888444448888888888444444488
      1888884444444888118884448844888881188448884888888118844888888188
      8118844888881188111888448881111111888884881111111888888888811111
      8888888888881188888888888888818888888888888888888888}
  end
  object btnMarcaTodosCodigosCNAB: TBitBtn
    Left = 364
    Top = 7
    Width = 21
    Height = 20
    Hint = 'Seleciona todas as Patrocinadoras'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnMarcaTodosCodigosCNABClick
    Glyph.Data = {
      D6000000424DD60000000000000076000000280000000C0000000C0000000100
      0400000000006000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
      0000888224888888000088222248888800008822822488880000882848224888
      0000888224822488000088222248228800008822822482880000882888224888
      0000888888822488000088888888228800008888888882880000}
  end
  object edtSelCodigosCNAB: TEdit
    Left = 8
    Top = 151
    Width = 313
    Height = 21
    Hint = 
      'Digite aqui o código das Rubricas a procurar separados por vírgu' +
      'la'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnKeyPress = edtSelCodigosCNABKeyPress
  end
  object btnSelCodigosCNAB: TBitBtn
    Left = 326
    Top = 149
    Width = 68
    Height = 25
    Caption = '   &Marcar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TabStop = False
    OnClick = btnSelCodigosCNABClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888888888888FF8888888888888778888888888888F77F8888888888800F08
      8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
      88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
      08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
      F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
      FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
      788877F77FF878F7788889999991777888888777777787788888889999988888
      8888887777788888888888888888888888888888888888888888}
    NumGlyphs = 2
    Spacing = 0
  end
  object qryLookCodigosCNAB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT DISTINCT --IDCODIGOSCNAB,'
      '        --IDMODELOSCNAB,'
      '        RECPAG,'
      '        TIPO,'
      '        CODIGO,'
      
        '        '#39'('#39' || CODIGO || '#39') - '#39' || LTRIM(RTRIM(DESCRICAO)) as DE' +
        'SCRICAO, '
      '        FLGINDICABAIXA,'
      '        CODALTERADOR,'
      '        FLGCONTABALTERADOR'
      '        '
      '   FROM CODIGOSCNAB'
      '   '
      '  WHERE CODALTERADOR=214'
      '      AND  IDMODELOSCNAB IN (62,63)'
      ' /*'
      
        '  AND DESCRICAO IN('#39'DÉBITO/CRÉDITO NÃO EFETUADO - SEM CONTRATO D' +
        'E DEB AUTOMÁTICO'#39','
      
        '        '#39'DÉBITO/CRÉDITO NÃO EFETUADO - CAD DE OPTANTES INEXISTEN' +
        'TE'#39','
      '        '#39'DÉBITO/CRÉDITO NÃO EFETUADO - CONTA NÃO CADASTRADA.'#39','
      
        '        '#39'DÉBITO/CRÉDITO NÃO EFETUADO - INSUFICIÊNCIA DE FUNDOS.'#39 +
        ','
      '        '#39'DÉBITO/CRÉDITO NÃO EFETUADO - OUTRAS RESTRIÇÕES.'#39')'
      '  AND CODIGO IN('#39'81'#39', '#39'78'#39', '#39'05'#39', '#39'09'#39') '
      '  '
      '  AND  LENGTH(TRIM(TRANSLATE(CODIGO, '#39'0123456789'#39','#39' '#39'))) IS NULL'
      '*/'
      ''
      '  ORDER BY DESCRICAO,'
      '        CODIGO '
      ''
      '')
    ValidateWithMask = True
    Left = 92
    Top = 52
    object qryLookCodigosCNABDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object qryLookCodigosCNABCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryLookCodigosCNABTIPO: TStringField
      FieldName = 'TIPO'
    end
    object qryLookCodigosCNABRECPAG: TStringField
      FieldName = 'RECPAG'
    end
    object qryLookCodigosCNABCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object qryLookCodigosCNABFLGINDICABAIXA: TStringField
      FieldName = 'FLGINDICABAIXA'
    end
    object qryLookCodigosCNABFLGCONTABALTERADOR: TStringField
      FieldName = 'FLGCONTABALTERADOR'
    end
  end
end
