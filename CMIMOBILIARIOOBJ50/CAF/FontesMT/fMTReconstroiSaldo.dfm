inherited frmMTReconstroiSaldo: TfrmMTReconstroiSaldo
  Left = 262
  Top = 93
  Caption = 'Reconstruir Saldo Contábil dos Bens'
  ClientHeight = 303
  ClientWidth = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 264
    object Label3: TLabel
      Left = 24
      Top = 88
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object Label26: TLabel
      Left = 24
      Top = 136
      Width = 127
      Height = 13
      Caption = 'Placa de Tombamento'
    end
    object Label1: TLabel
      Left = 192
      Top = 136
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 24
      Top = 104
      Width = 411
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'NOME'#9'No'
        'CLASSE'#9'15'#9'CLASSE'#9'No')
      DataField = 'IDGRUPO'
      LookupTable = cdsGrupo
      LookupField = 'IDGRUPO'
      Options = [loTitles]
      DropDownCount = 12
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcGrupoExit
    end
    object rdgTipoBem: TRadioGroup
      Left = 24
      Top = 16
      Width = 201
      Height = 65
      Caption = ' Bens '
      ItemIndex = 0
      Items.Strings = (
        'Patrimoniais'
        'Investimentos Imobiliários')
      TabOrder = 0
    end
    object rdgRemover: TRadioGroup
      Left = 240
      Top = 16
      Width = 193
      Height = 65
      Caption = ' Processar por '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Grupo'
        'Conjunto'
        'Bem')
      TabOrder = 1
    end
    object edPlaca: TEdit
      Left = 24
      Top = 152
      Width = 129
      Height = 21
      TabOrder = 4
      OnEnter = edPlacaEnter
      OnExit = edPlacaExit
    end
    object bbtnPlaca: TBitBtn
      Left = 152
      Top = 152
      Width = 21
      Height = 21
      TabOrder = 3
      OnClick = bbtnPlacaClick
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
    object pnlStatus: TPanel
      Left = 5
      Top = 218
      Width = 442
      Height = 41
      Align = alBottom
      TabOrder = 5
      Visible = False
      object lblStatus: TLabel
        Left = 8
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 421
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 419
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object edDescricao: TMemo
      Left = 192
      Top = 152
      Width = 242
      Height = 62
      ReadOnly = True
      TabOrder = 6
    end
    object ckbLog: TCheckBox
      Left = 24
      Top = 193
      Width = 153
      Height = 17
      Caption = 'Gerar Arquivo de Log'
      TabOrder = 7
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 264
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 282
      DockPos = 374
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      inherited ToolbarSep971: TToolbarSep97
        Left = 97
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 97
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 100
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 642
    Top = 407
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 196
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = cdsGrupo
    Left = 296
    Top = 184
  end
  object sqlBem: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDBEM,'
      '       B.PLACA,'
      '       B.DESBEM'
      'FROM BEM B'
      'WHERE (B.PLACA = :PLACA)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '')
    ClientDataSet = cdsBem
    Left = 288
    Top = 116
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 102
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle'
      'Valor Residual')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 288
    Top = 88
  end
end
