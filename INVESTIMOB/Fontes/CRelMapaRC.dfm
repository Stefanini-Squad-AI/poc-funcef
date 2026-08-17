inherited cfgRelMapaRC: TcfgRelMapaRC
  Left = 68
  Top = 140
  HelpContext = 540080
  Caption = 'Mapa de Rentabilidade por Contrato'
  ClientHeight = 402
  ClientWidth = 538
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 538
    Height = 320
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 84
      Height = 13
      Caption = 'Administradora'
    end
    object Label6: TLabel
      Left = 16
      Top = 138
      Width = 109
      Height = 13
      Caption = 'Índice de Correção'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 204
      Width = 505
      Height = 2
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 16
      Top = 260
      Width = 505
      Height = 2
      Shape = bsTopLine
    end
    object grpAtuarial: TGroupBox
      Left = 16
      Top = 52
      Width = 241
      Height = 65
      Caption = ' Índice Atuarial Projetado '
      TabOrder = 1
      object Label2: TLabel
        Left = 84
        Top = 32
        Width = 16
        Height = 20
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 212
        Top = 32
        Width = 16
        Height = 20
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image2: TImage
        Left = 112
        Top = 33
        Width = 18
        Height = 18
        AutoSize = True
        Picture.Data = {
          07544269746D61704E010000424D4E0100000000000076000000280000001200
          0000120000000100040000000000D80000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888000000888888877777888888000000888888000007
          8888880000008888880FFF078888880000008888880FFF078888880000008888
          880FFF078888880000008877770FFF077777780000008000000FFF0000007800
          000080FFFFFFFFFFFFF07800000080FFFFFFFFFFFFF07800000080FFFFFFFFFF
          FFF0780000008000000FFF000000880000008888880FFF078888880000008888
          880FFF078888880000008888880FFF078888880000008888880FFF0788888800
          0000888888000008888888000000888888888888888888000000}
      end
      object edtAtuarialPrevisto: TRealEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edtAtuarialSoma: TRealEdit
        Left = 144
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object DBcboIndiceCorrecao: TwwDBLookupCombo
      Left = 16
      Top = 152
      Width = 121
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOESIGLA'#9'6'#9'Moeda')
      LookupTable = qryIndice
      LookupField = 'MOECODIGO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object grpReferencia: TGroupBox
      Left = 264
      Top = 52
      Width = 257
      Height = 65
      Caption = 'Competência de Recebimento'
      TabOrder = 2
      object Label4: TLabel
        Left = 16
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label3: TLabel
        Left = 176
        Top = 18
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object cboMes: TComboBox
        Left = 16
        Top = 32
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 176
        Top = 32
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2050
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object chkVlrCorrigido: TCheckBox
      Left = 24
      Top = 216
      Width = 401
      Height = 17
      Caption = 'NÃO corrigir o Valor de Aquisição'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 7
      OnClick = chkVlrCorrigidoClick
    end
    object chkVigente: TCheckBox
      Left = 24
      Top = 237
      Width = 209
      Height = 17
      Caption = 'Exibir apenas contratos vigentes'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object rdgOrdenacao: TRadioGroup
      Left = 152
      Top = 128
      Width = 153
      Height = 65
      Caption = ' Ordenar por: '
      ItemIndex = 0
      Items.Strings = (
        'Nº do Contrato'
        'Nome do Contrato')
      TabOrder = 4
    end
    object edtAdminImovel: TEdit
      Left = 16
      Top = 24
      Width = 457
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnBuscaAdminImovel: TBitBtn
      Left = 472
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Busca uma Administradora'
      TabOrder = 13
      OnClick = btnBuscaAdminImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object rdgAtuarial: TRadioGroup
      Left = 320
      Top = 128
      Width = 201
      Height = 65
      Caption = ' Mínimo Atuarial baseado no: '
      ItemIndex = 0
      Items.Strings = (
        'Custo Contábil'
        'Valor Corrigido')
      TabOrder = 5
    end
    object chkLinhas: TCheckBox
      Left = 24
      Top = 272
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 6
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 292
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 290
      Width = 129
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 11
    end
    object btnLimpaAdminImovel: TBitBtn
      Left = 496
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Administradora'
      TabOrder = 12
      OnClick = btnLimpaAdminImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object chkDesocupado: TCheckBox
      Left = 260
      Top = 237
      Width = 209
      Height = 17
      Caption = 'Exibir os imóveis desocupados'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 320
    Width = 538
    Height = 49
    Align = alBottom
    TabOrder = 1
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 141
      Height = 13
      Caption = 'Processando Relatório...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 428
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 505
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 369
    Width = 538
    inherited tb97Fundo: TToolbar97
      Left = 366
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, M.MOEDESC, M.MOESIGLA,'
      '   M.MOEPERIODICIDADE, M.MOEINATIVO,'
      '   M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM'
      'FROM'
      '   MOEDA M'
      'ORDER BY'
      '   M.MOESIGLA')
    ValidateWithMask = True
    Left = 88
    Top = 149
    object qryIndiceMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryIndiceMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
    object qryIndiceMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryIndiceMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Visible = False
      Size = 1
    end
    object qryIndiceMOEINATIVO: TStringField
      FieldName = 'MOEINATIVO'
      Origin = 'MOEDA.MOEINATIVO'
      Visible = False
      Size = 1
    end
    object qryIndiceFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object qryIndiceDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'MOEDA.DATAINICIO'
      Visible = False
    end
    object qryIndiceDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'MOEDA.DATAFIM'
      Visible = False
    end
  end
  object qryCriaContratoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTRATOXIMOVEL'
      
        '(IDCONTRATOIMOVEL, IDIMOVEL, CIMVLRALUGUEL, CIMVLRAJUSTADO, FLGR' +
        'ATEIO, CIMPERCENTRATEIO)'
      'VALUES (:CONTRATO, :IMOVEL, 0, 0, 0, 0)')
    ValidateWithMask = True
    Left = 449
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryCriaContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTRATOIMOVEL'
      
        '(IDCONTRATOIMOVEL, IDPESSOA, CONNOME, FLGTIPOCONTRATO, FLGINDETE' +
        'RMINADO, CONVLRTOTAL, CONVLRAJUSTADO, FLGSTATUS)'
      
        'VALUES (:CONTRATO, :EMPRESAPROP, '#39'IMOVEIS DESOCUPADOS'#39', '#39'L'#39', 1, ' +
        '0, 0, '#39'V'#39')'
      '')
    ValidateWithMask = True
    Left = 449
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object qryAlteraContratoLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL'
      'SET'
      '   IDCONTRATOIMOVEL =:CONTRATO'
      'WHERE'
      '   ( IDCONTRATOIMOVEL IS NULL )'
      '   AND ( IDIMOVEL =:IMOVEL )'
      '')
    ValidateWithMask = True
    Left = 449
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryDesfazContratoLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL'
      'SET'
      '   IDCONTRATOIMOVEL = NULL'
      'WHERE'
      '   IDCONTRATOIMOVEL <= -100'
      '')
    ValidateWithMask = True
    Left = 449
    Top = 275
  end
  object qryDesfazContratoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   CONTRATOXIMOVEL'
      'WHERE'
      '   IDCONTRATOIMOVEL <= -100')
    ValidateWithMask = True
    Left = 449
    Top = 263
  end
  object qryDesfazContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   CONTRATOIMOVEL'
      'WHERE'
      '   IDCONTRATOIMOVEL <= -100')
    ValidateWithMask = True
    Left = 449
    Top = 251
  end
  object qryMarcaImovelOcupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE IMOVEL'
      '   SET FLGSTATUSOCUPACAO = '#39'O'#39
      ' WHERE ( (:IMOVEL IS NULL) OR (IDIMOVEL =:IMOVEL) )'
      '   AND IDIMOVEL IN ('
      '                    SELECT  X.IDIMOVEL'
      '                      FROM  CONTRATOIMOVEL C, CONTRATOXIMOVEL X'
      
        '                     WHERE  X.IDCONTRATOIMOVEL = C.IDCONTRATOIMO' +
        'VEL'
      
        '                       AND  TO_NUMBER( TO_CHAR(C.CONDATAINICIO,'#39 +
        'YYYY'#39') || TO_CHAR(C.CONDATAINICIO,'#39'MM'#39') ) <= :pANOMESALUG'
      
        '                       AND (TO_NUMBER( TO_CHAR(C.CONDATAFIM,   '#39 +
        'YYYY'#39') || TO_CHAR(C.CONDATAFIM,   '#39'MM'#39') ) >= :pANOMESALUG OR C.F' +
        'LGINDETERMINADO = '#39'S'#39')'
      
        '                       AND ( (:CONTRATO IS NULL) OR (C.IDCONTRAT' +
        'OIMOVEL =:CONTRATO) )'
      '                   )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 245
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pANOMESALUG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pANOMESALUG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryMarcaImovelDesocupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE IMOVEL'
      '   SET FLGSTATUSOCUPACAO = '#39'D'#39
      ' WHERE ( (:IMOVEL IS NULL) OR (IDIMOVEL =:IMOVEL) )'
      '   AND IDIMOVEL NOT IN ('
      '                    SELECT  X.IDIMOVEL'
      '                      FROM  CONTRATOIMOVEL C, CONTRATOXIMOVEL X'
      
        '                     WHERE  X.IDCONTRATOIMOVEL = C.IDCONTRATOIMO' +
        'VEL'
      
        '                       AND  TO_NUMBER( TO_CHAR(C.CONDATAINICIO,'#39 +
        'YYYY'#39') || TO_CHAR(C.CONDATAINICIO,'#39'MM'#39') ) <= :pANOMESALUG'
      
        '                       AND (TO_NUMBER( TO_CHAR(C.CONDATAFIM,   '#39 +
        'YYYY'#39') || TO_CHAR(C.CONDATAFIM,   '#39'MM'#39') ) >= :pANOMESALUG OR C.F' +
        'LGINDETERMINADO = '#39'S'#39')'
      
        '                       AND ( (:CONTRATO IS NULL) OR (C.IDCONTRAT' +
        'OIMOVEL =:CONTRATO) )'
      '                   )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 245
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pANOMESALUG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pANOMESALUG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
end
