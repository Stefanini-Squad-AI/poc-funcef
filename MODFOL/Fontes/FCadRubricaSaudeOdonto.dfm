inherited frmCadRubricaSaudeOdonto: TfrmCadRubricaSaudeOdonto
  Left = 414
  Top = 129
  Caption = 'Rubricas dos Planos de Saúde / Odontológico'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 393
      Height = 161
      Caption = 'Cadastro de Rubrica  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 312
        Top = 24
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object grp2: TGroupBox
        Left = 8
        Top = 72
        Width = 377
        Height = 65
        Caption = 'Mês e Ano de Referência'
        TabOrder = 2
        object dbedAno: TwwDBSpinEdit
          Left = 183
          Top = 31
          Width = 81
          Height = 21
          Increment = 1
          MaxValue = 3000
          MinValue = 1900
          Value = 2012
          DataField = 'ANO'
          DataSource = ds
          MaxLength = 4
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object dbcMes: TwwDBComboBox
          Left = 8
          Top = 32
          Width = 121
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          DataField = 'MES'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Janeiro'#9'1'
            'Fevereiro'#9'2'
            'Março'#9'3'
            'Abril'#9'4'
            'Maio'#9'5'
            'Junho'#9'6'
            'Julho'#9'7'
            'Agosto'#9'8'
            'Setembro'#9'9'
            'Outubro'#9'10'
            'Novembro'#9'11'
            'Dezembro'#9'12')
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      object dbedValor: TDBEdit
        Left = 312
        Top = 40
        Width = 73
        Height = 21
        DataField = 'VALOR'
        DataSource = ds
        TabOrder = 1
      end
      object dbcRubrica: TDBLookupComboBox
        Left = 8
        Top = 40
        Width = 297
        Height = 21
        DataField = 'IDPROVENTO'
        DataSource = ds
        KeyField = 'IDPROVENTO'
        ListField = 'DESCRICAO'
        ListSource = dsRub
        TabOrder = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 410
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 462
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 424
    Top = 167
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 464
    Top = 167
  end
  inherited Cds: TCMClientDataSet
    Left = 476
    Top = 119
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubrica'
    Colunas.Strings = (
      'P.DESCRICAO'
      
        'DECODE(MES,'#39'01'#39', '#39'JANEIRO'#39',  '#39'02'#39', '#39'FEVEREIRO'#39','#39'03'#39', '#39'MARÇO'#39',  '#39 +
        '04'#39', '#39'ABRIL'#39',  '#39'05'#39', '#39'MAIO'#39', '#39'06'#39', '#39'JUNHO'#39', '#39'07'#39', '#39'JULHO'#39','#39'08'#39', ' +
        #39'AGOSTO'#39','#39'09'#39', '#39'SETEMBRO'#39', '#39'10'#39', '#39'OUTUBRO'#39','#39'11'#39', '#39'NOVEMBRO'#39', '#39'DE' +
        'ZEMBRO'#39') AS MES'
      'V.ANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'DESCRIÇÃO'
      'MES'
      'ANO')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VLRRUBRICA V'
      'PROVDESC P')
    CamposChave.Strings = (
      'V.IDVLRRUBRICA')
    Filtro.Strings = (
      'V.IDPROVENTO = P.IDPROVENTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '15'
      '8')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 472
    Top = 71
  end
  object cdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 412
    Top = 71
  end
  object dsRub: TwwDataSource
    DataSet = cdsRubrica
    Left = 414
    Top = 127
  end
  object QRY: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 328
    Top = 25
  end
end
