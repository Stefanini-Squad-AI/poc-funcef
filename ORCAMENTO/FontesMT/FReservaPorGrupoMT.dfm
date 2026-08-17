inherited FrmReservaPorGrupoMT: TFrmReservaPorGrupoMT
  Left = 237
  Top = 170
  Caption = 'Reservas Orçamentárias por Grupo de Contas'
  ClientHeight = 441
  ClientWidth = 535
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 535
    Height = 402
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 533
      Height = 152
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 112
        Height = 13
        Caption = 'Grupo orçamentário'
      end
      object btBuscGrupo: TSpeedButton
        Left = 423
        Top = 22
        Width = 88
        Height = 24
        Hint = 'Procurar por um grupo de contas orçamentárias'
        Caption = 'Procurar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        OnClick = btBuscGrupoClick
      end
      object Label2: TLabel
        Left = 272
        Top = 56
        Width = 101
        Height = 13
        Caption = 'Plano de trabalho'
      end
      object Label3: TLabel
        Left = 16
        Top = 98
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label4: TLabel
        Left = 16
        Top = 56
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object edtDescGrupo: TEdit
        Left = 16
        Top = 24
        Width = 393
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object cboPlanoTrab: TCMDBLookupCombo
        Left = 272
        Top = 72
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'20'#9'Descrição'#9'F'
          'IDPLANOTRABALHO'#9'8'#9'Código'#9'F'
          'NOMECR'#9'20'#9'Centro Respon.'#9'F'
          'NOMEUN'#9'20'#9'Atividade/Projeto'#9'F')
        LookupTable = CdsPlanoTrab
        LookupField = 'IDPLANOTRABALHO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cboPlano: TCMDBLookupCombo
        Left = 16
        Top = 114
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F')
        LookupTable = CdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = cboPlanoEnter
      end
      object cboPatro: TCMDBLookupCombo
        Left = 16
        Top = 72
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome'#9'F')
        LookupTable = CdsPatro
        LookupField = 'IDPATRO'
        Options = [loTitles]
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = cboPatroEnter
      end
      object btSelContas: TBitBtn
        Left = 272
        Top = 104
        Width = 241
        Height = 33
        Hint = 'Seleciona as contas orçamentárias do grupo selecionado'
        Caption = 'Selecionar contas orçamentárias'
        TabOrder = 4
        OnClick = btSelContasClick
        Glyph.Data = {
          DA060000424DDA06000000000000360000002800000016000000190000000100
          180000000000A406000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFF837272684C4C999596FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7FBE6EAF5E5E9F4F8F8FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFF64585848333386827FEBEBF2EBEBF2F6F7FBDEE0ED
          A9B0D37286C24D77C84E86D77893CCBDC3DFF4F5FAFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFF606161393938A9A59E7081B97081B96E89
          C74D87D71E69D4124DBA1243AE2068CF3899F553A3ED7B9ED3C3C6DDC3C6DDFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF707171525352B0A9A680CAF280
          CAF277CFFF5ABDFF4FA7F5438ED8438BCE5186C56C95CA8CBBDC7DB9E279AEDC
          79AEDCFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF8182827B7A7ABDB8B7
          A7E7F1A7E7F1B7FAFFB3EEFFB2EBFBA8E0F1AEDDEEB7D1E5D9DBE5E3DDDEA7AD
          B790AFC990AFC9FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF9191918787
          86A6A5A2B0B7D0B0B7D0A9B1D2B9C0D1D1D6DDD3D6DBE8E3E3EFEAEAFBF9F9FF
          FFFFEEE9E4C2C0C6C2C0C6FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE5
          E5E5DBDBDBEDEDECFFFFFFFFFFFFEBEAF1C4C0C6F1EDECFFFFFFFFFFFFFFFFFF
          FFFFFFF0F0F0FFFFFECFCECBCFCECBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEED7D7D5FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2D3D0D1A49C9A7A80936B789F
          164CFFBF8577164CFF493328574238786861A39A96CAC6C5FFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAAACCF1164CFF164CFF164C
          FF3784FFEEBF9EBF8577C4B0B53784FF5A50524D382E6B5A53928884A9A2A1FF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE8F0F63884FFDBBEA9FF
          DCAFFDE0B8FEECC8FDEBD5ECB081FFE1B9F8F1EA7CA7FF63718E4630265F4D45
          6F605DFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFCFCFCA9CCF54181F0
          FFDFB9FADDBAFDEECFFEF5E6ECC2A8F8C997FFE2C1FFF7EFFFFFFF7CA6FF80B3
          FF493A3252433DFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF8F8F9439C
          F9439CF9FFECD3FFEEDBFFFBF6FFFEFDDD9F75FEDBAFFFECD7FFF8F1FFFDFCFF
          FFFF4E9CFF506D9052423BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDB
          E8F44092FAF8E0C8FFF2E2FFFBF6FFFEFEF2DCCCF5C899FFE9CCFFFBF7FFFEFE
          FFFFFFEDF5FF3091FF4D525F63534EFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFF9CC9F1439CF9FFF8F2FFFAF5FFF9F4FDF9F6EBC2A3FEDCAFFFF3E3FFFD
          FCFFFFFFFFFFFF8CC3FF5BACFF5A483F81746FFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFF439CF9E1C9B5FFF3E7FFF3E8FFFCF9F3EAE5EEC8A5FFE8C9FF
          F4E8FFFAF5FFFFFFF9FCFF3A9DFF7D8EA272635CA49C98FFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFF439CF9FFEEDDFFFFFFFFFFFFCCDDFF9DBAFFB2BCD9
          F8EDDFFFFEFDFFFFFFFFFFFFA5D2FF52ADFE5B4941918782C6C1BFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFF3695FF7FC5FFB7C7E1B9C9E2CCC7C6D8D5
          D4D2D8E6C7DDFEC3DEFFFFFFFFFFFFFF53B0FF90AAC280746FB4AFACE0DEDEFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDBEBFBF0F0F1EBEBEBEEEDEDF3
          F2F2F8F7F7FBFBFBFCFBFBD9E9FAAAD4FF7FC5FF65C2FFA3A3A4B2AEADD7D6D5
          F2F1F1FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF2F7FB7FC5FFBEDBF1DDDCDCE2E1
          E1F1F1F1FBFBFBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF8F8F8F9
          F9F9FCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 342
      Width = 533
      Height = 59
      Align = alBottom
      TabOrder = 1
      object Label5: TLabel
        Left = 16
        Top = 9
        Width = 106
        Height = 13
        Caption = 'Critério para rateio'
      end
      object Label6: TLabel
        Left = 296
        Top = 9
        Width = 95
        Height = 13
        Caption = 'Valor para rateio'
      end
      object btCalcularRat: TSpeedButton
        Left = 408
        Top = 23
        Width = 95
        Height = 23
        Hint = 'Calcular critérios para rateio'
        Caption = 'Calcular'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777700000000000000766444444444444406E6666666666
          66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
          66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
          EE60766666666666666777777777777777777777777777777777}
        OnClick = btCalcularRatClick
      end
      object cboRatCriter: TCMDBLookupCombo
        Left = 16
        Top = 25
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsRatCriter
        LookupField = 'IDCRITERIORATORC'
        Options = [loTitles]
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edtVlrRateio: TDBRealEdit
        Left = 296
        Top = 25
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object grid: TwwDBGrid
      Left = 1
      Top = 153
      Width = 533
      Height = 189
      ControlType.Strings = (
        'DATAREFERENCIA;CustomEdit;')
      Selected.Strings = (
        'DATAREFERENCIA'#9'14'#9'Data ~Referência'
        'CODCENTROCUSTO'#9'13'#9'Código ~Centro de Custo'
        'NOME'#9'17'#9'Centro de~Custo'
        'CODCENTRORESPON'#9'13'#9'Código ~Centro Respons.'
        'CRESP'#9'21'#9'Centro ~Responsabilidade'
        'VLRRESERVA'#9'12'#9'Valor~Reserva'
        'SALDO'#9'15'#9'Saldo da conta~No período')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      OnRowChanged = gridRowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = gridCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = gridTopRowChanged
      OnUpdateFooter = gridUpdateFooter
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 535
    inherited tb97Fundo: TToolbar97
      Left = 363
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 619
    Top = 35
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object msGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN'
      'G.CODGRUPOORC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 169
    Top = 25
  end
  object CdsPlanoTrab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 81
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 105
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 65
  end
  object CdsRatCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 233
  end
  object CdsContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasAfterOpen
    Left = 40
    Top = 208
  end
  object ds: TDataSource
    DataSet = CdsContas
    Left = 40
    Top = 264
  end
  object CdsValorCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 240
  end
  object CdsDataView: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 272
  end
  object CdsValorCentCustAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 296
  end
end
