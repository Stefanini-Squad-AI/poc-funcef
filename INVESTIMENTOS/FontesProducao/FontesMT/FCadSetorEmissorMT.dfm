inherited FrmCadSetorEmissorMT: TFrmCadSetorEmissorMT
  Left = 284
  Top = 231
  HelpContext = 790108
  Caption = 'Cadastro'
  ClientHeight = 303
  ClientWidth = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 186
    inherited dbGrd: TwwDBGrid [0]
      Width = 615
      Height = 184
      Selected.Strings = (
        'CODSETOREMISSOR'#9'13'#9'Código'
        'DESCSETOREMISSOR'#9'60'#9'Setor'
        'TIPO'#9'9'#9'Tipo')
    end
    inherited pnlControles: TPanel [1]
      Width = 615
      Height = 184
      object Label1: TLabel
        Left = 34
        Top = 66
        Width = 31
        Height = 13
        Caption = 'Setor'
      end
      object Label2: TLabel
        Left = 32
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 34
        Top = 120
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object dbeSetor: TwwDBEdit
        Left = 33
        Top = 82
        Width = 297
        Height = 21
        DataField = 'DESCSETOREMISSOR'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbeCodigo: TwwDBEdit
        Left = 33
        Top = 32
        Width = 112
        Height = 21
        DataField = 'CODSETOREMISSOR'
        DataSource = ds
        Enabled = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTipo: TwwDBComboBox
        Left = 33
        Top = 136
        Width = 225
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'SETORANALIT'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Analítico'#9'A'
          'Sintético'#9'S')
        Sorted = False
        TabOrder = 2
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock972: TDock97
    Width = 617
  end
  inherited Dock971: TDock97
    Top = 264
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
    end
  end
  inherited pnlTitulo: TPanel
    Width = 617
    inherited lbNomItem: TfcLabel
      Width = 175
      Caption = 'Setor do Emissor'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 334
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 280
    Top = 71
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    Left = 308
    Top = 71
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SETOREMISSOR.CODSETOREMISSOR'
      'SETOREMISSOR.DESCSETOREMISSOR')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Setor')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SETOREMISSOR')
    CamposChave.Strings = (
      'SETOREMISSOR.CODSETOREMISSOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
  end
  inherited CdsAux: TCMClientDataSet
    Left = 444
    Top = 47
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 360
    Top = 12
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT CODSETOREMISSOR,'
      '       DESCSETOREMISSOR,'
      '       SETORANALIT,'
      '       DECODE(SETORANALIT,'#39'A'#39','#39'Analítico'#39','#39'S'#39','#39'Sintético'#39') TIPO'
      'FROM SETOREMISSOR'
      ' ')
    ClientDataSet = Cds
    Left = 352
    Top = 78
  end
  object DtsAux: TDataSource
    DataSet = CdsAux
    Left = 464
    Top = 47
  end
end
