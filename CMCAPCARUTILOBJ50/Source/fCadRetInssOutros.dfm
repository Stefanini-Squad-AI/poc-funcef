inherited frmCadRetInssOutros: TfrmCadRetInssOutros
  Left = 206
  Top = 103
  Caption = 'Retenção de INSS de Fornecedores em outras empresas'
  ClientHeight = 380
  ClientWidth = 394
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    Height = 294
    inherited pnlMestre: TPanel
      Width = 392
      Height = 60
      object grpFornecedor: TGroupBox
        Left = 8
        Top = 8
        Width = 367
        Height = 41
        Caption = 'Fornecedor'
        TabOrder = 0
        object lblFornecedor: TLabel
          Left = 7
          Top = 18
          Width = 354
          Height = 13
          AutoSize = False
          Caption = 'FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 392
      Height = 232
      inherited pgctrlDetalhe: TPageControl
        Width = 294
        Height = 173
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 286
            Height = 145
            Selected.Strings = (
              'MESANO'#9'23'#9'Mês/Ano'
              'VLRETIDO'#9'23'#9'Valor Retido')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 286
            Height = 145
            object Label1: TLabel
              Left = 16
              Top = 16
              Width = 52
              Height = 13
              Caption = 'Mês/Ano'
              FocusControl = dbedtMESANO
            end
            object Label2: TLabel
              Left = 16
              Top = 80
              Width = 71
              Height = 13
              Caption = 'Valor Retido'
            end
            object dbedtMESANO: TDBEdit
              Left = 16
              Top = 32
              Width = 165
              Height = 21
              DataField = 'MESANO'
              DataSource = dsDet
              TabOrder = 0
              OnExit = dbedtMESANOExit
            end
            object dbedtValorRetido: TDBRealEdit
              Left = 16
              Top = 96
              Width = 169
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
              DataField = 'VLRETIDO'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 384
      end
      inherited Dock974: TDock97
        Left = 298
        Height = 173
      end
    end
  end
  inherited Dock972: TDock97
    Width = 394
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
    Top = 341
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 222
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 53
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 39
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 318
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 319
    Top = 39
    object CdsIDPESSOA: TFloatField
      DisplayLabel = 'Fornecedor'
      FieldName = 'IDPESSOA'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Razão Social')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'EMPRESAFORN'
      'FORNSERV')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.RAZAOSOCIAL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI'
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA'
      'PESSOA.RAZAOSOCIAL IS NOT NULL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 256
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 260
    Top = 39
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 308
    Top = 71
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 271
    Top = 71
    object CdsDetIDPESSOA: TFloatField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 14
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsDetANOMES: TStringField
      DisplayLabel = 'Ano/Mês'
      DisplayWidth = 23
      FieldName = 'ANOMES'
      Visible = False
      Size = 6
    end
    object CdsDetVLRETIDO: TFloatField
      DisplayLabel = 'Valor Retido'
      DisplayWidth = 23
      FieldName = 'VLRETIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object CdsDetMESANO: TStringField
      DisplayLabel = 'Mês/Ano'
      DisplayWidth = 23
      FieldName = 'MESANO'
      EditMask = '99/9999;0;_'
      Size = 6
    end
  end
end
