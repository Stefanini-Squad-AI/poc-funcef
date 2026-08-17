inherited frmLancaDestac: TfrmLancaDestac
  Left = 249
  Top = 177
  Caption = 'Lançamento de Rubricas do Destacamento e/ou  Contabilização'
  ClientHeight = 322
  ClientWidth = 503
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 503
    Height = 198
    BorderWidth = 2
    object gbxFolha: TGroupBox
      Left = 2
      Top = 2
      Width = 499
      Height = 177
      Align = alTop
      Caption = 'Informações para s Folha de Pagamento'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object Label5: TLabel
        Left = 10
        Top = 73
        Width = 90
        Height = 13
        Caption = 'Diárias ( > 50%)'
      end
      object Label1: TLabel
        Left = 10
        Top = 107
        Width = 91
        Height = 13
        Caption = 'Transporte (Km)'
      end
      object Label2: TLabel
        Left = 10
        Top = 139
        Width = 109
        Height = 13
        Caption = 'Dev. Adiantamento'
      end
      object grpMesRef: TGroupBox
        Left = 152
        Top = 17
        Width = 200
        Height = 42
        Caption = ' Mês e Ano de Referência '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cmbMes: TComboBox
          Left = 7
          Top = 14
          Width = 115
          Height = 21
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
        object spnedAno: TSpinEdit
          Left = 132
          Top = 14
          Width = 58
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object dblckRub1: TwwDBLookupCombo
        Left = 142
        Top = 69
        Width = 346
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
        LookupTable = CdsRub1
        LookupField = 'IDPROVENTO'
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblckRub2: TwwDBLookupCombo
        Left = 142
        Top = 104
        Width = 346
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
        LookupTable = CdsRub2
        LookupField = 'IDPROVENTO'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblckRub3: TwwDBLookupCombo
        Left = 142
        Top = 137
        Width = 346
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
        LookupTable = CdsRub3
        LookupField = 'IDPROVENTO'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 283
    Width = 503
    inherited TB97oKCancelar: TToolbar97 [0]
      Left = 162
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 331
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
  end
  object gbxTipoOper: TGroupBox [2]
    Left = 0
    Top = 198
    Width = 503
    Height = 85
    Align = alBottom
    Caption = 'Tipo de Operação da Contabilização'
    TabOrder = 2
    object dblckTipOper: TwwDBLookupCombo
      Left = 53
      Top = 35
      Width = 375
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'Descrição')
      LookupTable = CdsTipoOper
      LookupField = 'TIPCODIGO'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 267
    Top = 259
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object CdsRub1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'CODPROVDESC'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRPROVDESC'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'CODRUBCLT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'IDREGRA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'ds'
    ReadOnly = True
    StoreDefs = True
    Left = 172
    Top = 59
  end
  object CdsRub2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 173
    Top = 114
  end
  object CdsRub3: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 169
    Top = 165
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 224
  end
end
