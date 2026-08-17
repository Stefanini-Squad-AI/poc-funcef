inherited frmCancelaBoleta: TfrmCancelaBoleta
  Left = 249
  Top = 147
  HelpContext = 160049
  Caption = 'Cancelamento de Cobrança Bancária'
  ClientHeight = 311
  ClientWidth = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    Height = 272
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 265
      Height = 13
      Caption = 'Cancelar todas as boletas vencidas a mais de '
    end
    object Label2: TLabel
      Left = 360
      Top = 16
      Width = 129
      Height = 13
      Caption = 'dias dos participantes '
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 270
      Height = 13
      Caption = 'pentencentes aos planos selecionados abaixo :'
    end
    object edQtdeDias: TEditNum
      Left = 288
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
      IntDigits = 3
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object dbgrdPlano: TwwDBGrid
      Left = 16
      Top = 72
      Width = 481
      Height = 185
      Selected.Strings = (
        'FLGSELECIONADO'#9'7'#9'Selecionar'
        'IDPLANOPREV'#9'7'#9'Cód.'
        'NOME'#9'40'#9'Plano Previdenciário')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsPlano
      KeyOptions = []
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object BitBtn1: TBitBtn
      Left = 368
      Top = 40
      Width = 129
      Height = 25
      Caption = 'Selecionar Todos'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 272
    Width = 521
    inherited tb97Fundo: TToolbar97
      Left = 349
      DockPos = 351
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 180
      DockPos = 182
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 267
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV,NOME, 0 AS FLGSELECIONADO'
      'FROM   PLANPREV'
      
        'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO ' +
        'PLP, PATRO P'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA )'
      ''
      'ORDER BY NOME'
      ' '
      ' '
      ' ')
    UpdateObject = updPlano
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 104
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 56
    Top = 272
  end
  object updPlano: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (IDPLANOPREV, NOME)'
      'values'
      '  (:IDPLANOPREV, :NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 152
    Top = 264
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TRUNC(TO_DATE(:DATAHOJE,'#39'DD/MM/YYYY'#39') - HST.DATAPREVISAOR' +
        'ECE,0),'
      
        '       HST.IDPESSOA, HST.MESREFERENCIA,      HST.MESCOBRANCA,  H' +
        'ST.DATAPREVISAORECE,'
      
        '       HST.NUMRECEBIMENTO,     HST.IDMOTIVO,     HST.IDCONTRIBUI' +
        'CAO,'
      '       HST.CODDOCUMENTOPREV'
      'FROM   HSTCONTRIBPREV HST'
      'WHERE  (HST.IDPLANOPREV  IN (:SIDPLANOPREV))'
      'AND    (TO_DATE(:DATAHOJE,'#39'DD/MM/YYYY'#39') > HST.DATAPREVISAORECE)'
      'AND    (HST.FLGDESCFOLHA = 0)'
      'AND    (HST.SITRECEBIMENTO = '#39'1'#39')'
      'AND    (HST.DATAPREVISAORECE IS NOT NULL)'
      
        'GROUP BY HST.IDPESSOA,  HST.MESREFERENCIA,  HST.MESCOBRANCA, HST' +
        '.DATAPREVISAORECE,'
      
        '         HST.NUMRECEBIMENTO, HST.IDMOTIVO,    HST.IDCONTRIBUICAO' +
        ', HST.CODDOCUMENTOPREV'
      
        'HAVING TRUNC(TO_DATE(:DATAHOJE,'#39'DD/MM/YYYY'#39') - HST.DATAPREVISAOR' +
        'ECE,0) >= :DIAS')
    ValidateWithMask = True
    Left = 88
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DIAS'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 160
    Top = 192
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 256
    Top = 216
  end
end
