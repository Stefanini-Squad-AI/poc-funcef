inherited frmCadTipoCriterioRatMT: TfrmCadTipoCriterioRatMT
  Left = 223
  Top = 138
  HelpContext = 520031
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Tipo de Critério para Rateio'
  ClientHeight = 419
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 622
    Height = 333
    object dbmeQuery: TDBMemo
      Left = 1
      Top = 243
      Width = 620
      Height = 89
      Hint = 
        'Exemplo: SELECT COUNT(*) AS VALOR FROM FUNCIONARIO WHERE (CODCEN' +
        'TROCUSTO = :CODCENTROCUSTO) AND (IDEMPRESA = :IDEMPRESA)'
      Align = alClient
      DataField = 'TEMPLATE'
      DataSource = DsDataView
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 620
      Height = 214
      Align = alTop
      TabOrder = 1
      object bbtnExemplo: TSpeedButton
        Left = 339
        Top = 90
        Width = 258
        Height = 34
        Caption = 'Click para Exemplo de Pesquisa'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888004444400
          888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
          408887F88877788887F88744447F74444088878888878888878F7C4444444444
          44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
          44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
          440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
          4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        OnClick = bbtnExemploClick
      end
      object bbtnExemplo1: TSpeedButton
        Left = 339
        Top = 128
        Width = 127
        Height = 34
        Caption = 'Copia Exemplo 1'
        Flat = True
        Glyph.Data = {
          26020000424D2602000000000000760000002800000030000000120000000100
          040000000000B001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888888888888FFF88888888881888888888444888888888
          888F88888888777FF8888888811888888884484488888888887F888888877F77
          88888888111118888884488888888888877FFF8888877F888888888111111188
          888448888888888877777FF888877F8888888888111111188884488888888887
          777777FF88877F8FF88888888118811188844844888888887777777FF8877F77
          88888888881888118888444888888888877F8777F88877788888888C88888881
          8888888888888888F8788877F88888888888888C888888818888888888888887
          F8888887F8888FFF8888888CC888C8888888444888888887FF888F878888777F
          F888888CCC88CC8888844844888888877F887FF888877F7788888888CCCCCCC8
          888448888888888777FF77FF88877F88888888888CCCCCCC8884488888888888
          7777777FF8877F888888888888CCCCC888844888888888888777777788877F8F
          F88888888888CC8888844844888888888877777888877F77888888888888C888
          8888444888888888888877888888777888888888888888888888888888888888
          88887888888888888888}
        NumGlyphs = 2
        OnClick = bbtnExemplo1Click
      end
      object bbtnExemplo2: TSpeedButton
        Left = 470
        Top = 128
        Width = 127
        Height = 34
        Caption = 'Copia Exemplo 2'
        Flat = True
        Glyph.Data = {
          26020000424D2602000000000000760000002800000030000000120000000100
          040000000000B001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888888888888FFF88888888881888888888444888888888
          888F88888888777FF8888888811888888884484488888888887F888888877F77
          88888888111118888884488888888888877FFF8888877F888888888111111188
          888448888888888877777FF888877F8888888888111111188884488888888887
          777777FF88877F8FF88888888118811188844844888888887777777FF8877F77
          88888888881888118888444888888888877F8777F88877788888888C88888881
          8888888888888888F8788877F88888888888888C888888818888888888888887
          F8888887F8888FFF8888888CC888C8888888444888888887FF888F878888777F
          F888888CCC88CC8888844844888888877F887FF888877F7788888888CCCCCCC8
          888448888888888777FF77FF88877F88888888888CCCCCCC8884488888888888
          7777777FF8877F888888888888CCCCC888844888888888888777777788877F8F
          F88888888888CC8888844844888888888877777888877F77888888888888C888
          8888444888888888888877888888777888888888888888888888888888888888
          88887888888888888888}
        NumGlyphs = 2
        OnClick = bbtnExemplo2Click
      end
      object lblPeriodo: TLabel
        Left = 19
        Top = 170
        Width = 130
        Height = 13
        Caption = 'Período de Referência'
      end
      object Panel1: TPanel
        Left = 17
        Top = 14
        Width = 313
        Height = 149
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        object lblDescricao: TLabel
          Left = 12
          Top = 12
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object dbedDescricao: TwwDBEdit
          Left = 11
          Top = 28
          Width = 289
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object memlegenda: TMemo
          Left = 10
          Top = 58
          Width = 300
          Height = 87
          BorderStyle = bsNone
          Color = clBtnFace
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            'A Pesquisa no Banco de Dados deve conter somente um '
            'campo que deverá se chamar VALOR e este deverá ser único '
            'para cada centro de custo. É obrigatório indicar 2 parâmetros '
            ':CODCENTROCUSTO e :IDEMPRESA. O parâmetro de data '
            'também poderá ser utilizado :DATA para data completa ou '
            ':ANOMES para utilizar o mês/ano no formato AAAAMM.'
            ' '
            ' ')
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object dbrgTipo: TDBRadioGroup
        Left = 339
        Top = 9
        Width = 258
        Height = 76
        Caption = 'Tipo de Rateio'
        DataField = 'TIPORATEIO'
        DataSource = ds
        Items.Strings = (
          '&Pré-Definido'
          '&Gerados a partir de Pesquisa na Base')
        TabOrder = 1
        Values.Strings = (
          'M'
          'G')
        OnClick = dbrgTipoClick
      end
      object dblcPeriodo: TCMDBLookupCombo
        Left = 92
        Top = 184
        Width = 211
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'30'#9'Período'#9'F')
        DataField = 'PERNUMERO'
        DataSource = ds
        LookupTable = CdsPeriodo
        LookupField = 'PERNUMERO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcExercicio: TCMDBLookupCombo
        Left = 19
        Top = 184
        Width = 67
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PEREXERCICIO'#9'10'#9'Exercício'#9'F')
        DataField = 'PEREXERCICIO'
        DataSource = ds
        LookupTable = CdsExercicio
        LookupField = 'PEREXERCICIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcExercicioExit
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 215
      Width = 620
      Height = 28
      Align = alTop
      Caption = 'Critério de Pesquisa na Base'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 622
  end
  inherited Dock971: TDock97
    Top = 380
    Width = 622
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520031
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 279
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 521
    Top = 271
  end
  inherited ImlPadrao: TImageList
    Left = 135
    Top = 279
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 251
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 460
    Top = 279
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CRITERIORATORC.DESCRICAO'
      'CRITERIORATORC.TIPORATEIO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo de Rateio')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CRITERIORATORC')
    CamposChave.Strings = (
      'CRITERIORATORC.IDCRITERIORATORC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '1')
    Left = 352
    Top = 279
  end
  object CdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 26
    Top = 351
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 162
    Top = 351
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 298
    Top = 351
  end
  object CdsDataView: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 433
    Top = 351
  end
  object DsDataView: TwwDataSource
    DataSet = CdsDataView
    Left = 553
    Top = 351
  end
end
