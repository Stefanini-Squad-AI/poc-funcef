inherited frmCadContaBancoMT: TfrmCadContaBancoMT
  Left = 124
  Top = 126
  Caption = 'frmCadContaBancoMT'
  ClientHeight = 371
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 624
    Height = 285
    inherited pnlMestre: TPanel
      Width = 614
      Height = 47
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 42
        Height = 13
        Caption = 'Pessoa'
      end
      object lblCPF: TLabel
        Left = 367
        Top = 3
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object lblDataNasc: TLabel
        Left = 542
        Top = 3
        Width = 65
        Height = 13
        Caption = 'Data Nasc.'
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 17
        Width = 347
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dbedCPF: TDBEdit
        Left = 367
        Top = 17
        Width = 121
        Height = 21
        Color = clSilver
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbedDataNasc: TDBEdit
        Left = 499
        Top = 17
        Width = 108
        Height = 21
        Color = clSilver
        DataField = 'DATANASC'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 52
      Width = 614
      Height = 228
      inherited pgctrlDetalhe: TPageControl
        Width = 516
        Height = 169
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 508
            Height = 141
            object GroupBox1: TGroupBox
              Left = 1
              Top = 0
              Width = 363
              Height = 133
              TabOrder = 0
              object Label6: TLabel
                Left = 71
                Top = 10
                Width = 37
                Height = 13
                Caption = 'Banco'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 71
                Top = 53
                Width = 47
                Height = 13
                Caption = 'Agência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 71
                Top = 92
                Width = 88
                Height = 13
                Caption = 'Conta Bancária'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 4
                Top = 10
                Width = 55
                Height = 13
                Caption = 'Banco Nº'
              end
              object Label5: TLabel
                Left = 4
                Top = 53
                Width = 65
                Height = 13
                Caption = 'Agência Nº'
              end
              object dbedContaBancaria: TDBEdit
                Left = 71
                Top = 106
                Width = 121
                Height = 21
                DataField = 'CONTACORRENTE'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object dblkpcmbBanco: TwwDBLookupCombo
                Left = 71
                Top = 24
                Width = 280
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'60'#9'Banco'
                  'NUMBANCO'#9'10'#9'Nº')
                DataField = 'IDBANCO'
                DataSource = dsDet
                LookupTable = CdsBanco
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 71
                Top = 68
                Width = 280
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'60'#9'AGENCIA'
                  'NUMAGENCIA'#9'15'#9'NUMAGENCIA')
                DataField = 'IDAGENCIA'
                DataSource = dsDet
                LookupTable = cdsAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object edDigBanco: TEditNum
                Left = 4
                Top = 24
                Width = 64
                Height = 21
                Hint = 'Digite este campo caso deseje procurar o banco por número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
              object edDigAgencia: TEditNum
                Left = 4
                Top = 68
                Width = 64
                Height = 21
                Hint = 'Digite este campo caso deseje procurar a agência por número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
            end
            object rgrpTipoConta: TDBRadioGroup
              Left = 368
              Top = -1
              Width = 137
              Height = 60
              Caption = 'Tipo'
              DataField = 'TIPOCONTA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Conta Corrente'
                'Conta Salário'
                'Poupança')
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                '1'
                '2'
                '3')
            end
            object dbgrpContaPref: TDBRadioGroup
              Left = 368
              Top = 61
              Width = 137
              Height = 36
              Caption = 'Conta Preferencial'
              Columns = 2
              DataField = 'FLGCONTAPREF'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object dbgrpContaConj: TDBRadioGroup
              Left = 368
              Top = 97
              Width = 137
              Height = 36
              Caption = 'Conta Conjunta'
              Columns = 2
              DataField = 'FLGCONTACONJUNTA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'N'
                'S')
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 508
            Height = 141
          end
        end
      end
      inherited Dock973: TDock97
        Width = 606
      end
      inherited Dock974: TDock97
        Left = 520
        Height = 169
      end
    end
  end
  inherited Dock972: TDock97
    Width = 624
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 624
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 522
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 396
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 494
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 368
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    ProviderName = ''
    Left = 424
    Top = 7
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object CdsNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOAFISICA.DATANASC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição'
      'CPF'
      'Pessoa'
      'Data de Nascimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOAFISICA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'VW_RECEBEDOR')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PESSOA.IDPESSOA = VW_RECEBEDOR.IDRECEBEDOR'
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'VW_RECEBEDOR.IDTITULAR = ELEGPATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '13'
      '15'
      '60'
      '10')
    Left = 550
    Top = 6
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 508
    Top = 111
  end
  inherited dsDet: TwwDataSource
    Left = 536
    Top = 111
  end
  object CdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 252
    Top = 191
    object CdsBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsBancoBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 60
      FieldName = 'BANCO'
      Size = 60
    end
    object CdsBancoNUMBANCO: TStringField
      DisplayLabel = 'Nº'
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Size = 10
    end
  end
  object cdsAgencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 252
    Top = 239
    object cdsAgenciaAGENCIA: TStringField
      DisplayWidth = 60
      FieldName = 'AGENCIA'
      Size = 60
    end
    object cdsAgenciaNUMAGENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object cdsAgenciaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object cdsAgenciaIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Visible = False
    end
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 564
    Top = 111
    object cdsDetNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object cdsDetNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object cdsDetCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object cdsDetDESCTIPO: TStringField
      FieldName = 'DESCTIPO'
      Size = 14
    end
    object cdsDetFLGCONTAPREF: TFloatField
      FieldName = 'FLGCONTAPREF'
    end
    object cdsDetIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object cdsDetIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
    end
    object cdsDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsDetTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Size = 1
    end
    object cdsDetIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object cdsDetFLGCONTACONJUNTA: TStringField
      FieldName = 'FLGCONTACONJUNTA'
      Size = 1
    end
  end
end
