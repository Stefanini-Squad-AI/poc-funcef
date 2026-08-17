inherited frmCadPpraAgenteRisco: TfrmCadPpraAgenteRisco
  Left = 490
  Top = 236
  HelpContext = 750101
  Caption = 'Cadastro dos Agentes de Risco'
  ClientHeight = 276
  ClientWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 190
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 89
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblCodeSocial: TLabel
      Left = 16
      Top = 50
      Width = 86
      Height = 13
      Caption = 'Código eSocial'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      Color = clGray
      DataField = 'IDAGENTERISCO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 102
      Width = 560
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 2
    end
    object dbrgTipo: TDBRadioGroup
      Left = 16
      Top = 128
      Width = 560
      Height = 45
      Caption = 'Tipo de Agente'
      Columns = 5
      DataField = 'INDTIPO'
      DataSource = ds
      Items.Strings = (
        'Químico'
        'Biológico'
        'Físico'
        'Ergonômico'
        'Mecânico')
      TabOrder = 3
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object dbCodeSocial: TwwDBEdit
      Left = 16
      Top = 64
      Width = 113
      Height = 21
      DataField = 'CODIGOESOCIAL'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 592
  end
  inherited Dock971: TDock97
    Top = 237
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 420
      DockPos = 515
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 750101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 251
      DockPos = 346
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 527
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 366
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 527
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 465
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 338
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'P.IDAGENTERISCO'
      'P.CODIGOESOCIAL'
      'P.DESCRICAO'
      
        'DECODE(P.INDTIPO, 1, '#39'QUÍMICO'#39', 2, '#39'BIOLÓGICO'#39', 3, '#39'FÍSICO'#39', 4, ' +
        #39'ERGONÔMICO'#39', 5, '#39'MECÂNICO'#39') AS TIPO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Código eSocial'
      'Descrição'
      'Tipo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PPRAAGENTERISCO P')
    CamposChave.Strings = (
      'P.IDAGENTERISCO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '8'
      '4'
      '75'
      '14')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
  end
end
