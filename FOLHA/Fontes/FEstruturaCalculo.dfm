inherited frmEstruturaCalculo: TfrmEstruturaCalculo
  Left = 88
  Top = 180
  HelpContext = 180046
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Estruturas de Cálculo'
  ClientHeight = 455
  ClientWidth = 761
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 761
    Height = 369
    inherited pnlMestre: TPanel
      Width = 759
      Height = 83
      object pnlEstruturaCalc: TPanel
        Left = 0
        Top = 0
        Width = 759
        Height = 83
        Align = alTop
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 224
          Top = 1
          Width = 223
          Height = 80
          Caption = 'Regra de Cálculo'
          TabOrder = 0
          object dblkRegra: TwwDBLookupCombo
            Left = 6
            Top = 21
            Width = 211
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Descrição da Regra'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dbcboxValor: TDBCheckBox
            Left = 9
            Top = 49
            Width = 209
            Height = 17
            Hint = 
              'Marque esta opção para gravar apenas o valores válidos maiores q' +
              'ue zero'
            Caption = 'Gravar valores maiores que zero'
            DataField = 'FLGVALIDO'
            DataSource = ds
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox2: TGroupBox
          Left = 1
          Top = 1
          Width = 223
          Height = 80
          BiDiMode = bdLeftToRight
          Caption = 'Descrição da Estrutura de Cálculo'
          ParentBiDiMode = False
          TabOrder = 1
          object edtDescricao: TEdit
            Left = 5
            Top = 33
            Width = 211
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 447
          Top = 1
          Width = 311
          Height = 46
          Caption = 'Rubrica de Exibição'
          TabOrder = 2
          object dblkRubrica: TwwDBLookupCombo
            Left = 9
            Top = 17
            Width = 295
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'JUNCAORUBRICA'#9'69'#9'Código  Descrição da Rubrica'#9'F')
            LookupTable = qryRubrica
            LookupField = 'IDPROVENTO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object dbrgAtivo: TDBRadioGroup
          Left = 448
          Top = 47
          Width = 310
          Height = 34
          Caption = ' Situação para Execução na Prévia '
          Columns = 2
          DataField = 'flgativo'
          DataSource = ds
          Items.Strings = (
            'Ativo'
            'Desativado')
          TabOrder = 3
          Values.Strings = (
            '1'
            '0')
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 84
      Width = 759
      Height = 284
      Tabs.Strings = (
        'Associação')
      detdbGrids.Strings = (
        'detDbGrids')
      inherited Dock974: TDock97 [0]
        Left = 665
        Height = 225
        BackgroundOnToolbars = False
      end
      inherited Dock973: TDock97
        Width = 751
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Width = 27
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 52
          end
        end
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 661
        Height = 225
        inherited tbsDet: TTabSheet
          Caption = 'Associação'
          inherited dbgrdDet: TwwDBGrid
            Left = 96
            Top = 111
            Width = 916
            Height = 300
            Selected.Strings = (
              'IDESTRUTURA'#9'10'#9'IDESTRUTURA'
              'IDRUBRICA'#9'10'#9'IDRUBRICA'
              'GRUPOCALCULO'#9'10'#9'Grupo')
            MemoAttributes = [mSizeable]
            Align = alNone
            KeyOptions = []
            Visible = False
          end
          inherited pnlControlesDet: TPanel
            Width = 653
            Height = 63
            Align = alTop
            object PnlEdita: TPanel
              Left = 0
              Top = 0
              Width = 653
              Height = 58
              Align = alTop
              Caption = 'PnlEdita'
              TabOrder = 0
              object GroupBox5: TGroupBox
                Left = 465
                Top = 1
                Width = 185
                Height = 56
                Align = alLeft
                Caption = 'Número do Grupo'
                TabOrder = 0
                object cmbGrupo: TComboBox
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  Items.Strings = (
                    '01 '
                    '02 '
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '10'
                    '11'
                    '12'
                    '13'
                    '14'
                    '15'
                    '16'
                    '17'
                    '18'
                    '19'
                    '20')
                end
              end
              object GroupBox3: TGroupBox
                Left = 1
                Top = 1
                Width = 464
                Height = 56
                Align = alLeft
                Caption = 'Rubrica para Associação'
                TabOrder = 1
                object dblkRubricaAssoc: TwwDBLookupCombo
                  Left = 9
                  Top = 20
                  Width = 424
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'JUNCAO'#9'69'#9'Código  Descrição da Rubrica'#9'F')
                  LookupTable = qryRubricaNaoAssoc
                  LookupField = 'IDPROVENTO'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
          object dbgAssoc: TwwDBGrid
            Left = 0
            Top = 63
            Width = 653
            Height = 134
            Selected.Strings = (
              'CODRUBRICA'#9'7'#9'Código'
              'DESCRICAO'#9'69'#9'Descrição'#9'F'
              'GRUPOCALCULO'#9'7'#9'Grupo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            OnCellChanged = dbgAssocCellChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAssoc
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgAssocDblClick
            IndicatorColor = icBlack
            DragVertOffset = 50
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 761
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 761
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 250
    Top = 10
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qrydet
    Left = 358
    Top = 250
  end
  inherited ds: TwwDataSource
    Left = 437
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTRUTURACALCULO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  IDREGRA = :IDREGRA,'
      '  IDRUBRICAEXIBICAO = :IDRUBRICAEXIBICAO,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGVALIDO = :FLGVALIDO'
      'where'
      '  IDESTRUTURA = :OLD_IDESTRUTURA')
    InsertSQL.Strings = (
      'insert into ESTRUTURACALCULO'
      
        '  (IDESTRUTURA, DESCRICAO, IDREGRA, IDRUBRICAEXIBICAO, IDFUNDACA' +
        'O, '
      'FLGATIVO, '
      '   FLGVALIDO)'
      'values'
      '  (:IDESTRUTURA, :DESCRICAO, :IDREGRA, :IDRUBRICAEXIBICAO, '
      ':IDFUNDACAO, '
      '   :FLGATIVO, :FLGVALIDO)')
    DeleteSQL.Strings = (
      'delete from ESTRUTURACALCULO'
      'where'
      '  IDESTRUTURA = :OLD_IDESTRUTURA')
    Left = 469
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ESTRUTURACALCULO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descriçao da Estrutura')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'ESTRUTURACALCULO')
    CamposChave.Strings = (
      'ESTRUTURACALCULO.IDESTRUTURA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 501
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 281
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 343
    Top = 10
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT IDESTRUTURA, DESCRICAO, IDREGRA, IDRUBRICAEXIBICAO, IDFUN' +
        'DACAO, FLGATIVO, FLGVALIDO'
      'FROM ESTRUTURACALCULO'
      ' '
      ' '
      ' ')
    Left = 373
    Top = 10
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 312
    Top = 10
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA '
      'FROM REGRA ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 556
    Top = 10
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO,'
      '       IDPROVENTO || '#39' - '#39' || DESCRICAO AS JUNCAORUBRICA'
      ''
      'FROM PROVDESC'
      'WHERE FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 532
    Top = 121
  end
  object qryRubricaNaoAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '0 || '#39' - '#39'|| '#39'TESTE'#39' AS JUNCAO,'
      '0 AS IDPROVENTO,'
      #39'TESTE'#39' AS DESCRICAO'
      'FROM DUAL'
      'WHERE 1=2'
      ' ')
    ValidateWithMask = True
    Left = 620
    Top = 9
  end
  object qryAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDESTRUTURA,'
      '  IDRUBRICA AS IDPROVENTO,'
      '  IDRUBRICA AS CODRUBRICA,'
      '  '#39' '#39' AS DESCRICAO ,'
      ' IDRUBRICA||'#39'  '#39'||'#39' '#39' AS JUNCAO,'
      ' GRUPOCALCULO'
      ''
      'FROM ESTRUTURAXRUBRICA'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 38
    Top = 352
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 652
    Top = 8
  end
  object dsAssoc: TwwDataSource
    DataSet = qryAssoc
    Left = 106
    Top = 352
  end
  object qrydet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IDESTRUTURA, IDRUBRICA, GRUPOCALCULO'
      ' FROM ESTRUTURAXRUBRICA')
    UpdateObject = updet
    ValidateWithMask = True
    Left = 317
    Top = 250
  end
  object updet: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTRUTURACALCULO'
      'set'
      '  IDESTRUTURA = :IDESTRUTURA,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDREGRA = :IDREGRA,'
      '  IDRUBRICAEXIBICAO = :IDRUBRICAEXIBICAO'
      'where'
      '  IDESTRUTURA = :OLD_IDESTRUTURA and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDRUBRICAEXIBICAO = :OLD_IDRUBRICAEXIBICAO')
    InsertSQL.Strings = (
      'insert into ESTRUTURACALCULO'
      '  (IDESTRUTURA, DESCRICAO, IDREGRA, IDRUBRICAEXIBICAO)'
      'values'
      '  (:IDESTRUTURA, :DESCRICAO, :IDREGRA, :IDRUBRICAEXIBICAO)')
    DeleteSQL.Strings = (
      'delete from ESTRUTURACALCULO'
      'where'
      '  IDESTRUTURA = :OLD_IDESTRUTURA and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDRUBRICAEXIBICAO = :OLD_IDRUBRICAEXIBICAO')
    Left = 397
    Top = 250
  end
end
