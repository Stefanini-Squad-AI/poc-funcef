inherited frmCadTipoDocMT: TfrmCadTipoDocMT
  Left = 302
  Top = 146
  Caption = 'Cadastro de Tipo de Documentos'
  ClientHeight = 328
  ClientWidth = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 482
    Height = 204
    object Label1: TLabel
      Left = 10
      Top = 6
      Width = 58
      Height = 13
      Caption = 'Descrição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 447
      Top = 6
      Width = 80
      Height = 13
      Caption = 'Cod Reduzido'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Bevel1: TBevel
      Left = 9
      Top = 118
      Width = 463
      Height = 79
      Shape = bsFrame
    end
    object dbedDescricao: TDBEdit
      Left = 10
      Top = 21
      Width = 340
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 10
      Top = 49
      Width = 277
      Height = 62
      BevelOuter = bvLowered
      TabOrder = 1
      object sbtnAcrescimo: TSpeedButton
        Left = 9
        Top = 17
        Width = 127
        Height = 34
        GroupIndex = 1
        Down = True
        Caption = 'Acréscimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777777777777700077770000077770007777066607777000777706660777
          7000777706660777700070000666000070007706666666077000777066666077
          7000777706660777700077777060777770007777770777777000777777777777
          7000}
        ParentFont = False
        OnClick = sbtnAcrescimoClick
      end
      object sbtnDecrescimo: TSpeedButton
        Left = 143
        Top = 17
        Width = 127
        Height = 34
        GroupIndex = 1
        Caption = 'Decréscimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777777777777700077777707777770007777706077777000777706660777
          7000777066666077700077066666660770007000066600007000777706660777
          7000777706660777700077770666077770007777000007777000777777777777
          7000}
        ParentFont = False
        OnClick = sbtnDecrescimoClick
      end
    end
    object RgEmgParcela: TDBRadioGroup
      Left = 294
      Top = 44
      Width = 177
      Height = 67
      Caption = ' Engloba/Parcela '
      DataField = 'FLGENGLOBAPARCELA'
      DataSource = ds
      Items.Strings = (
        '&Sempre Engloba/Parcela'
        '&Não Engloba/Parcela'
        '&Definido pelo usuário')
      TabOrder = 2
      Values.Strings = (
        'S'
        'N'
        'A')
    end
    object dbeCodReduzido: TDBEdit
      Left = 447
      Top = 21
      Width = 110
      Height = 21
      DataField = 'CODREDUZIDO'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 478
      Top = 119
      Width = 177
      Height = 92
      Caption = '  Serviço '
      DataField = 'FLGSERVICO'
      DataSource = ds
      Enabled = False
      Items.Strings = (
        '&Não Caracteriza'
        'Nota &Fiscal'
        '&Outros')
      TabOrder = 4
      Values.Strings = (
        'N'
        'F'
        'O')
      Visible = False
    end
    object CkbGeraNumDoc: TDBCheckBox
      Left = 25
      Top = 124
      Width = 252
      Height = 17
      Caption = 'Gera Número do Documento Automático'
      DataField = 'FLGGERANUMDOC'
      DataSource = ds
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object CkbDocFiscal: TDBCheckBox
      Left = 25
      Top = 143
      Width = 201
      Height = 17
      Caption = 'Consiste em Documento Fiscal'
      DataField = 'FLGDOCFISCAL'
      DataSource = ds
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 293
      Top = 146
      Width = 89
      Height = 17
      Caption = 'Imprime AP'
      DataField = 'FLGIMPRIMEAP'
      DataSource = ds
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBchkFlgNaoGeraRAD: TDBCheckBox
      Left = 293
      Top = 125
      Width = 113
      Height = 17
      Caption = 'Não Gera &RAD'
      DataField = 'FLGNAOGERARAD'
      DataSource = ds
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 25
      Top = 162
      Width = 312
      Height = 17
      Caption = 'Gera Numero interno = Numero de Documento'
      DataField = 'FLGCODDOCIGUALNODOC'
      DataSource = ds
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 482
  end
  inherited Dock971: TDock97
    Top = 251
    Width = 482
    inherited tb97Fundo: TToolbar97
      Left = 310
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 141
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 66
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
  end
  inherited Cds: TCMClientDataSet
    Left = 132
    Top = 71
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TIPODOCRECPAG.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPODOCRECPAG')
    CamposChave.Strings = (
      'TIPODOCRECPAG.CODTIPDOC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '35')
    OperComparador.Strings = (
      '-1')
    Left = 413
    Top = 6
  end
  object CdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 513
    Top = 244
  end
  object CdsModelosCnab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 330
  end
end
