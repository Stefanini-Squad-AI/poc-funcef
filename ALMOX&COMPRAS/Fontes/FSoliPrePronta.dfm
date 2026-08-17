inherited FrmSoliPrePronta: TFrmSoliPrePronta
  Left = 71
  Top = 57
  Caption = 'Cadastro de Solicitação Pré-Pronta'
  ClientHeight = 431
  ClientWidth = 643
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 643
    Height = 345
    inherited pnlMestre: TPanel
      Width = 633
      Height = 92
      object Label1: TLabel
        Left = 18
        Top = 35
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 19
        Top = 9
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object EdDesc: TDBEdit
        Left = 18
        Top = 50
        Width = 595
        Height = 21
        DataField = 'DESCSCPREPRONTA'
        DataSource = ds
        TabOrder = 0
      end
      object lbAlmox: TStaticText
        Left = 99
        Top = 8
        Width = 47
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'lbAlmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 97
      Width = 633
      Height = 243
      Tabs.Strings = (
        'Itens')
      inherited pgctrlDetalhe: TPageControl
        Width = 535
        Height = 184
        inherited tbsDet: TTabSheet
          Caption = 'Itens'
          inherited dbgrdDet: TwwDBGrid
            Width = 527
            Height = 156
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Código'
              'DESCRICAO'#9'35'#9'Descrição'
              'CODMEDIDA'#9'4'#9'Unidade~Medida'
              'QTDEPESSOA'#9'10'#9'Quantidade'
              'NDIAS'#9'10'#9'Nº Dias')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 527
            Height = 156
            object pnl: TPanel
              Left = 26
              Top = 17
              Width = 481
              Height = 118
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 20
                Top = 14
                Width = 25
                Height = 13
                Caption = 'Item'
              end
              object Label6: TLabel
                Left = 125
                Top = 14
                Width = 104
                Height = 13
                Caption = 'Descrição do Item'
              end
              object Label8: TLabel
                Left = 174
                Top = 63
                Width = 48
                Height = 13
                Caption = 'Unidade'
              end
              object Label7: TLabel
                Left = 20
                Top = 63
                Width = 103
                Height = 13
                Caption = 'Qtde. por Pessoa '
              end
              object Label3: TLabel
                Left = 316
                Top = 63
                Width = 44
                Height = 13
                Caption = 'Nº Dias'
              end
              object dblcItem: TwwDBLookupCombo
                Left = 20
                Top = 28
                Width = 91
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODARTIGO'#9'14'#9'Código'
                  'DESCRICAO'#9'50'#9'Descrição')
                DataField = 'CODARTIGO'
                DataSource = dsDet
                LookupTable = qryArtigo
                LookupField = 'CODARTIGO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcItemCloseUp
              end
              object dblcDesc: TwwDBLookupCombo
                Left = 125
                Top = 28
                Width = 332
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Descrição'
                  'CODARTIGO'#9'14'#9'Código')
                DataField = 'CODARTIGO'
                DataSource = dsDet
                LookupTable = qryArtigo
                LookupField = 'CODARTIGO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcDescCloseUp
              end
              object dblcUN: TwwDBLookupCombo
                Left = 174
                Top = 77
                Width = 109
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODMEDIDA'#9'4'#9'Código'
                  'DESCMEDIDA'#9'25'#9'Descrição')
                DataField = 'CODMEDIDA'
                DataSource = dsDet
                LookupTable = qryUnidMed
                LookupField = 'CODMEDIDA'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object edQtde: TDBRealEdit
                Left = 20
                Top = 77
                Width = 117
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'QTDEPESSOA'
                DataSource = dsDet
              end
              object edDias: TEdit
                Left = 318
                Top = 78
                Width = 121
                Height = 21
                TabStop = False
                Color = clSilver
                Enabled = False
                TabOrder = 4
                Text = '                          1'
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 625
      end
      inherited Dock974: TDock97
        Left = 539
        Height = 184
      end
    end
  end
  inherited Dock972: TDock97
    Width = 643
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 643
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '         IDSCPREPRONTA,'
      '         IDPESSOA,'
      '         CODALMOXARIFADO,'
      '         DESCSCPREPRONTA'
      'FROM'
      '         SCPREPRONTA'
      'WHERE'
      '        (IDSCPREPRONTA = :pIDSC)')
    Left = 330
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDSC'
        ParamType = ptUnknown
      end>
    object qryIDSCPREPRONTA: TFloatField
      FieldName = 'IDSCPREPRONTA'
      Origin = 'SCPREPRONTA.IDSCPREPRONTA'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'SCPREPRONTA.IDPESSOA'
    end
    object qryCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'SCPREPRONTA.CODALMOXARIFADO'
    end
    object qryDESCSCPREPRONTA: TStringField
      FieldName = 'DESCSCPREPRONTA'
      Origin = 'SCPREPRONTA.DESCSCPREPRONTA'
      Size = 60
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 593
    Top = 4
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SCPREPRONTA'
      'set'
      '  IDSCPREPRONTA = :IDSCPREPRONTA,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  DESCSCPREPRONTA = :DESCSCPREPRONTA'
      'where'
      '  IDSCPREPRONTA = :OLD_IDSCPREPRONTA')
    InsertSQL.Strings = (
      'insert into SCPREPRONTA'
      '  (IDSCPREPRONTA, IDPESSOA, CODALMOXARIFADO, DESCSCPREPRONTA)'
      'values'
      
        '  (:IDSCPREPRONTA, :IDPESSOA, :CODALMOXARIFADO, :DESCSCPREPRONTA' +
        ')')
    DeleteSQL.Strings = (
      'delete from SCPREPRONTA'
      'where'
      '  IDSCPREPRONTA = :OLD_IDSCPREPRONTA')
    Left = 300
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SCPREPRONTA.DESCSCPREPRONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'SCPREPRONTA')
    CamposChave.Strings = (
      'SCPREPRONTA.IDSCPREPRONTA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 373
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 4
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 436
    Top = 66
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       I.IDSCPREPRONTA,'
      '       I.CODARTIGO,'
      '       I.CODMEDIDA,'
      '       I.QTDEPESSOA,'
      '       I.NDIAS,'
      
        '       (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO)  A' +
        'S DESCRICAO'
      ''
      'FROM'
      '       ITEMSCPREPRONTA I,'
      '      ARTIGO A,'
      '      PRODUTO P'
      'WHERE'
      '            (I.IDSCPREPRONTA = :pIDSC)'
      '   AND (I.CODARTIGO = A.CODARTIGO )'
      '   AND (A.CODPRODUTO = P.CODPRODUTO )')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 558
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDSC'
        ParamType = ptUnknown
      end>
    object qryDetCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = 'ITEMSCPREPRONTA.CODARTIGO'
      Size = 14
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = '"CM.PRODUTO".DESCPROD'
      Size = 50
    end
    object qryDetCODMEDIDA: TStringField
      DisplayLabel = 'Unidade~Medida'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'ITEMSCPREPRONTA.CODMEDIDA'
      Size = 4
    end
    object qryDetQTDEPESSOA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEPESSOA'
      Origin = 'ITEMSCPREPRONTA.QTDEPESSOA'
      DisplayFormat = '#,##0.00'
    end
    object qryDetNDIAS: TFloatField
      DisplayLabel = 'Nº Dias'
      DisplayWidth = 10
      FieldName = 'NDIAS'
      Origin = 'ITEMSCPREPRONTA.NDIAS'
    end
    object qryDetIDSCPREPRONTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSCPREPRONTA'
      Origin = 'ITEMSCPREPRONTA.IDSCPREPRONTA'
      Visible = False
    end
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '         U.CodMedida, '
      '         U.DescMedida '
      'From'
      '         UnMedida U,'
      '         Conver   C '
      'Where  '
      '         (RTRIM(C.CodProduto) =  RTRIM(:pCodProd))'
      '  and (U.CodMedida  = C.CodMedida)'
      'Order By CodMedida ')
    ValidateWithMask = True
    Left = 462
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    object qryUnidMedCODMEDIDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CODMEDIDA'
      Origin = 'UNMEDIDA.CODMEDIDA'
      Size = 4
    end
    object qryUnidMedDESCMEDIDA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCMEDIDA'
      Origin = 'UNMEDIDA.DESCMEDIDA'
      Size = 25
    end
  end
  object qryArtigo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        A.CODARTIGO,'
      
        '        (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO)  ' +
        'AS DESCRICAO'
      'FROM '
      '       ARTIGO A, '
      '       PRODUTO P'
      'WHERE '
      '               (A.CODTIPOARTIGO = '#39'2'#39' )'
      '      AND (A.FLGATIVO = '#39'S'#39')'
      '      AND (A.CODPRODUTO = P.CODPRODUTO )'
      'ORDER BY '
      '       DESCRICAO'
      ''
      '')
    ValidateWithMask = True
    Left = 514
    Top = 5
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSCPREPRONTA'
      'set'
      '  IDSCPREPRONTA = :IDSCPREPRONTA,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  QTDEPESSOA = :QTDEPESSOA,'
      '  NDIAS = :NDIAS'
      'where'
      '  IDSCPREPRONTA = :OLD_IDSCPREPRONTA and'
      '  RTRIM(CODARTIGO) = RTRIM(:OLD_CODARTIGO)')
    InsertSQL.Strings = (
      'insert into ITEMSCPREPRONTA'
      '  (IDSCPREPRONTA, CODARTIGO, CODMEDIDA, QTDEPESSOA, NDIAS)'
      'values'
      '  (:IDSCPREPRONTA, :CODARTIGO, :CODMEDIDA, :QTDEPESSOA, :NDIAS)')
    DeleteSQL.Strings = (
      'delete from ITEMSCPREPRONTA'
      'where'
      '  IDSCPREPRONTA = :OLD_IDSCPREPRONTA and'
      '  RTRIM(CODARTIGO) = RTRIM(:OLD_CODARTIGO)')
    Left = 596
    Top = 52
  end
end
