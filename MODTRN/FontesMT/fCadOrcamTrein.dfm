inherited frmCadOrcamTrein: TfrmCadOrcamTrein
  Left = 169
  Top = 121
  HelpContext = 720003
  Caption = 'Cadastro de Orçamentos Anuais por Curso'
  ClientHeight = 424
  ClientWidth = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 453
    Height = 338
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 445
      Height = 49
      object Label10: TLabel
        Left = 12
        Top = 5
        Width = 33
        Height = 13
        Caption = 'Curso'
      end
      object dbedNome: TwwDBEdit
        Left = 12
        Top = 19
        Width = 421
        Height = 21
        Color = clGray
        DataField = 'DESCRICAO'
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 53
      Width = 445
      Height = 281
      Tabs.Strings = (
        'Orçamentos')
      inherited pgctrlDetalhe: TPageControl
        Width = 347
        Height = 222
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 339
            Height = 194
            ControlType.Strings = (
              'FLGIMPRESCIND;CheckBox;1;0')
            Selected.Strings = (
              'ANO'#9'7'#9'Ano'#9'F'
              'CENTRO_CUSTO'#9'30'#9'Centro de Custo'
              'OCORRENCIAS'#9'10'#9'Quantidade de Ocorrências')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 339
            Height = 194
            object Label3: TLabel
              Left = 14
              Top = 9
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object Label6: TLabel
              Left = 14
              Top = 90
              Width = 69
              Height = 13
              Caption = 'Ocorrências'
            end
            object Label2: TLabel
              Left = 14
              Top = 150
              Width = 152
              Height = 13
              Caption = 'Centro de Custo (opcional)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 195
              Top = 9
              Width = 129
              Height = 13
              Caption = 'Carga Horária Prevista'
            end
            object Label4: TLabel
              Left = 195
              Top = 90
              Width = 83
              Height = 13
              Caption = 'Custo Previsto'
            end
            object dbspeAno: TwwDBSpinEdit
              Left = 14
              Top = 24
              Width = 69
              Height = 21
              Increment = 1
              DataField = 'ANO'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object dbedOcor: TDBRealEdit
              Left = 14
              Top = 105
              Width = 69
              Height = 21
              Hint = 'Número de Inscrições Previstas no Ano Acima'
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              WordWrap = False
              OnChange = dbedOcorChange
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'OCORRENCIAS'
              DataSource = dsDet
            end
            object cmbCCusto: TwwDBLookupCombo
              Left = 14
              Top = 165
              Width = 313
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'#9'F'
                'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = cmbCCustoChange
            end
            object redCusto: TRealEdit
              Left = 195
              Top = 105
              Width = 129
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object ednHoras: TRealEdit
              Left = 195
              Top = 24
              Width = 129
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 437
      end
      inherited Dock974: TDock97
        Left = 351
        Height = 222
      end
    end
  end
  inherited Dock972: TDock97
    Width = 453
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 283
      DockPos = 538
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 116
      DockPos = 371
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 349
    Top = 108
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 349
    Top = 95
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 280
    Top = 94
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    ExibePergunta = False
    Left = 349
    Top = 81
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 280
    Top = 81
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 354
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDORCAMTREIN'
        DataType = ftFloat
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDCURSO'
        DataType = ftFloat
      end
      item
        Name = 'ANO'
        DataType = ftFloat
      end
      item
        Name = 'OCORRENCIAS'
        DataType = ftFloat
      end
      item
        Name = 'CENTRO_CUSTO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CdsDetIndex1'
        Fields = 'ANO;CODCENTROCUSTO'
      end>
    IndexName = 'CdsDetIndex1'
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 319
    Top = 1
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'CdsCCustoIndexNOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCCustoIndexNOME'
    Params = <>
    StoreDefs = True
    Left = 410
    Top = 1
  end
end
