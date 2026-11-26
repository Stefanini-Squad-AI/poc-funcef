inherited frmConsRubricas: TfrmConsRubricas
  Left = 127
  Top = 155
  HelpContext = 160178
  Caption = 'Consulta ao Cadastro de Rubricas'
  ClientHeight = 337
  ClientWidth = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 298
    object Label1: TLabel
      Left = 15
      Top = 15
      Width = 170
      Height = 13
      Caption = 'Código na Fundação (Interno)'
    end
    object Label2: TLabel
      Left = 15
      Top = 57
      Width = 111
      Height = 13
      Caption = 'Nome na Fundação'
    end
    object pgctrlRubricaXPess: TPageControl
      Left = 1
      Top = 106
      Width = 670
      Height = 191
      ActivePage = tbsRubricaxPESS
      Align = alBottom
      TabOrder = 0
      object tbsRubricaxPESS: TTabSheet
        Caption = 'Rubrica Associada as Seguintes Empresas'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 662
          Height = 163
          Selected.Strings = (
            'NOMEEMPRESA'#9'30'#9'Empresa'
            'CODPROVDESC'#9'10'#9'Código ~na Empresa'#9'F'
            'DESCRPROVDESC'#9'60'#9'Nome ~na Empresa')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRubricaxPESS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
    object bbtnProcFuncao: TBitBtn
      Left = 557
      Top = 10
      Width = 100
      Height = 31
      Caption = '&Procurar'
      TabOrder = 1
      OnClick = bbtnProcFuncaoClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
    object wwDBEdit1: TwwDBEdit
      Left = 15
      Top = 30
      Width = 121
      Height = 21
      Color = clBtnFace
      DataField = 'IDPROVENTO'
      DataSource = dsProvDesc
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 15
      Top = 72
      Width = 466
      Height = 21
      Color = clBtnFace
      DataField = 'DESCRICAO'
      DataSource = dsProvDesc
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 298
    Width = 672
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 7
    Top = 386
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Rubrica'
    Colunas.Strings = (
      'RUBRICAXPESS.CODPROVDESC'
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código Externo'
      'Código na Fundação'
      'Descrição na Fundação'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXPESS'
      'PESSOA')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO')
    Filtro.Strings = (
      
        'PROVDESC.FLGTPRUBRICA LIKE '#39'%P%'#39' OR PROVDESC.FLGTPRUBRICA IS NUL' +
        'L'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA(+)'
      'PESSOA.IDPESSOA(+) = RUBRICAXPESS.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '130'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 546
    Top = 51
  end
  object qryProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO'
      'FROM PROVDESC'
      'WHERE IDPROVENTO = :IDPROVENTO')
    ValidateWithMask = True
    Left = 312
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaXPess: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS NOMEEMPRESA,'
      '       RP.CODPROVDESC,'
      '       RP.DESCRPROVDESC'
      'FROM   PESSOA P, RUBRICAXPESS RP'
      'WHERE  RP.IDRUBRICA = :IDPROVENTO'
      'AND    P.IDPESSOA   = RP.IDPESSOA')
    ValidateWithMask = True
    Left = 150
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object dsProvDesc: TwwDataSource
    AutoEdit = False
    DataSet = qryProvDesc
    Left = 69
    Top = 282
  end
  object dsRubricaxPESS: TwwDataSource
    AutoEdit = False
    DataSet = qryRubricaXPess
    Left = 228
    Top = 291
  end
end
