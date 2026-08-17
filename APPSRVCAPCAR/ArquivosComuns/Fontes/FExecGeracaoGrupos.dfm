inherited frmExecGeracaoGrupos: TfrmExecGeracaoGrupos
  Left = 108
  Top = 216
  HelpContext = 640001
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Criação e Atualização de Grupos para Rateio'
  ClientHeight = 196
  ClientWidth = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 52
    Width = 577
    Height = 60
    object Label1: TLabel
      Left = 72
      Top = 20
      Width = 171
      Height = 13
      Caption = 'Código dos Imóveis / Grupo:  '
    end
    object mskCodigo: TMaskEdit
      Left = 248
      Top = 16
      Width = 137
      Height = 21
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 161
    Width = 577
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 192
      DockPos = 192
      inherited sep1: TToolbarSep97
        Left = 268
        SizeHorz = 1
      end
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 1
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 186
        SizeHorz = 1
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 350
        Top = 0
        Blank = True
        SizeHorz = 1
      end
      inherited bbtnSair: TBitBtn
        Left = 187
        Top = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 269
        Top = 1
      end
      object btnGera: TBitBtn
        Left = 1
        Top = 0
        Width = 185
        Height = 29
        Caption = 'Criar / Atualizar Grupos'
        TabOrder = 2
        OnClick = btnGeraClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 6
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 577
    Height = 52
    Align = alTop
    TabOrder = 2
    object Label13: TLabel
      Left = 16
      Top = 12
      Width = 59
      Height = 13
      Caption = 'ATENÇÃO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      WordWrap = True
    end
    object Label14: TLabel
      Left = 76
      Top = 12
      Width = 493
      Height = 13
      AutoSize = False
      Caption = 
        ':  Este procedimento irá criar grupos para rateio de acordo com ' +
        'o código dos imóveis.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 76
      Top = 28
      Width = 493
      Height = 13
      AutoSize = False
      Caption = '   Todos os grupos já existentes serão atualizados.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 112
    Width = 577
    Height = 49
    Align = alBottom
    TabOrder = 3
    object lblContador: TLabel
      Left = 468
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 180
      Height = 13
      Caption = 'Criando / Atualizando Grupos...'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 545
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryCodigos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IMOCODIGO,'
      '   SUM(I.IMOAREA) AS AREA,'
      '   SUM(I.IMOAREAGERENCIAL) AS AREA_GERENCIAL'
      ''
      'FROM'
      '   IMOVEL I'
      ''
      'WHERE'
      '   ( I.IDPESSOA =:PIDEMPRESAPROP )'
      
        '   AND ( (:PFLGTIPOIMOVEL IS NULL ) OR (I.FLGTIPOIMOVEL =:PFLGTI' +
        'POIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL ) OR (I.IDIMOVELMESTRE =:PIDI' +
        'MOVELMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL ) OR (I.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIMOCODIGO IS NULL ) OR (I.IMOCODIGO =:PIMOCODIGO) )'
      
        '   AND ( (:PIMOMATRICULA IS NULL ) OR (I.IMOMATRICULA =:PIMOMATR' +
        'ICULA) )'
      
        '   AND ( (:PCODTIPIMOVEL IS NULL ) OR (I.CODTIPIMOVEL =:PCODTIPI' +
        'MOVEL) )'
      
        '   AND ( (:PIDADMINIMOVEL IS NULL ) OR (I.IDADMINIMOVEL =:PIDADM' +
        'INIMOVEL) )'
      
        '   AND ( (:PIDCARTEIRAINVEST IS NULL ) OR (I.IDCARTEIRAINVEST =:' +
        'PIDCARTEIRAINVEST) )'
      
        '   AND ( (:PFLGSTATUSOCUPACAO IS NULL ) OR (I.FLGSTATUSOCUPACAO ' +
        '=:PFLGSTATUSOCUPACAO) )'
      '   AND ( (:PFLGSTATUS IS NULL ) OR (I.FLGSTATUS =:PFLGSTATUS) )'
      '   AND ( (:PFLGATIVO IS NULL ) OR (I.FLGATIVO =:PFLGATIVO) )'
      '   AND ( I.IMOCODIGO IS NOT NULL )'
      ''
      'GROUP BY'
      '   I.IMOCODIGO')
    ValidateWithMask = True
    Left = 469
    Top = 65
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end>
    object qryCodigosIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Origin = '"CM.IMOVEL".IMOCODIGO'
      Size = 15
    end
    object qryCodigosAREA: TFloatField
      FieldName = 'AREA'
      Origin = '"CM.IMOVEL".IMOAREA'
    end
    object qryCodigosAREA_GERENCIAL: TFloatField
      FieldName = 'AREA_GERENCIAL'
      Origin = '"CM.IMOVEL".IMOAREAGERENCIAL'
    end
  end
end
