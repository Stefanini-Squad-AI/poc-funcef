inherited frmRegLinha: TfrmRegLinha
  Left = 83
  Top = 168
  HelpContext = 210033
  Caption = 'Cadastro das Linhas de Transporte por Pessoa'
  ClientHeight = 330
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 244
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 624
      Height = 49
      object Label1: TLabel
        Left = 11
        Top = 6
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 107
        Top = 6
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 513
        Top = 19
        Width = 105
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 11
        Top = 20
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 107
        Top = 20
        Width = 401
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 53
      Width = 624
      Height = 187
      Tabs.Strings = (
        'Linhas')
      inherited pgctrlDetalhe: TPageControl
        Width = 526
        Height = 128
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 518
            Height = 100
            Selected.Strings = (
              'QTDDIARIA'#9'10'#9'Qtde. Diária'#9'F'
              'TIPOLINHATRANSP'#9'20'#9'Tipo'#9'F'
              'DESCRICAO'#9'40'#9'Descrição'#9'F'
              'NUMLINHATRANSP'#9'10'#9'Referência'#9'F'
              'VLRLINHATRANSP'#9'10'#9'Valor'#9'F')
            Font.Style = []
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 518
            Height = 100
            object Label3: TLabel
              Left = 68
              Top = 11
              Width = 115
              Height = 13
              Caption = 'Linha de Transporte'
            end
            object Label5: TLabel
              Left = 68
              Top = 61
              Width = 103
              Height = 13
              Caption = 'Quantidade Diária'
            end
            object dblcLinhaTransp: TwwDBLookupCombo
              Left = 68
              Top = 26
              Width = 381
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Descrição da Linha'
                'NUMLINHATRANSP'#9'5'#9'Número/Ref.'
                'TIPOLINHATRANSP'#9'15'#9'Tipo de Transporte'
                'VLRLINHATRANSP'#9'10'#9'Valor Unitário')
              DataField = 'IDLINHATRANSP'
              DataSource = dsDet
              LookupTable = CdsLinhaTransp
              LookupField = 'IDLINHATRANSP'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcLinhaTranspChange
            end
            object dbspQtdDiaria: TDBRealEdit
              Left = 68
              Top = 75
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDDIARIA'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 616
      end
      inherited Dock974: TDock97
        Left = 530
        Height = 128
      end
    end
  end
  inherited Dock972: TDock97
    Width = 632
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 291
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 462
      DockPos = 538
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 295
      DockPos = 371
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 541
    Top = 28
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 541
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 472
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    Left = 541
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 472
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 338
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 303
    Top = 1
  end
  object CdsLinhaTransp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 394
    Top = 1
  end
  object CdsRadInst: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 250
    Top = 65
  end
end
