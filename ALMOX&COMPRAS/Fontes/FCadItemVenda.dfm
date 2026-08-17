inherited FrmCadItemVenda: TFrmCadItemVenda
  Caption = 'Cadastro de Item  de Venda -'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Unidades de Medida'
        'Contabilização'
        'Descrição Detalhada'
        'Escrita Fiscal'
        'Impostos'
        'Cor e Tamanho')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgContab'
        ''
        ''
        'dbgrdImposto'
        'dbgCorTam')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbsDet
        object TbsCorTam: TTabSheet
          Caption = 'Cor e Tamanho'
          object dbgCorTam: TwwDBGrid
            Left = 0
            Top = 0
            Width = 584
            Height = 98
            Selected.Strings = (
              'CODCOR'#9'5'#9'Código da Cor '
              'DESCCOR'#9'25'#9'Descrição'
              'CODTAMANHO'#9'3'#9'Código do Tamanho'
              'DESCTAMANHO'#9'20'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsCorTam
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlCortam: TPanel
            Left = 0
            Top = 0
            Width = 584
            Height = 98
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LblTam: TLabel
              Left = 137
              Top = 54
              Width = 53
              Height = 13
              Caption = 'Tamanho'
            end
            object lblCor: TLabel
              Left = 137
              Top = 6
              Width = 20
              Height = 13
              Caption = 'Cor'
            end
            object dblcCor: TwwDBLookupCombo
              Left = 135
              Top = 21
              Width = 271
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCOR'#9'5'#9'Código'
                'DESCCOR'#9'25'#9'Descrição')
              DataField = 'CODCOR'
              DataSource = DsCorTam
              LookupTable = qryCor
              LookupField = 'CODCOR'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcTam: TwwDBLookupCombo
              Left = 135
              Top = 69
              Width = 271
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODTAMANHO'#9'3'#9'Código'
                'DESCTAMANHO'#9'20'#9'Descrição')
              DataField = 'CODTAMANHO'
              DataSource = DsCorTam
              LookupTable = qryTam
              LookupField = 'CODTAMANHO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '10'
      '4'
      '40')
  end
  inherited dsImposto: TwwDataSource
    Left = 536
  end
  object qryCor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCOR, DESCCOR FROM COR ORDER BY DESCCOR')
    ValidateWithMask = True
    Left = 36
    Top = 309
  end
  object qryTam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTAMANHO, DESCTAMANHO FROM TAMANHO'
      'ORDER BY DESCTAMANHO')
    ValidateWithMask = True
    Left = 37
    Top = 355
  end
  object DsCorTam: TwwDataSource
    DataSet = qryCorTam
    Left = 481
    Top = 310
  end
  object updCorTam: TUpdateSQL
    ModifySQL.Strings = (
      'update Artigo'
      'set'
      '  CODARTIGO = :CODARTIGO,'
      '  CODPRODUTO = :CODPRODUTO,'
      '  CODCOR = :CODCOR,'
      '  CODTAMANHO = :CODTAMANHO,'
      '  CODTIPOARTIGO = :CODTIPOARTIGO'
      'where'
      '  rtrim(CODARTIGO) = rtrim(:OLD_CODARTIGO)')
    InsertSQL.Strings = (
      'insert into Artigo'
      '  (CODARTIGO, CODPRODUTO, CODCOR, CODTAMANHO, CODTIPOARTIGO)'
      'values'
      
        '  (:CODARTIGO, :CODPRODUTO, :CODCOR, :CODTAMANHO, :CODTIPOARTIGO' +
        ')')
    DeleteSQL.Strings = (
      'delete from Artigo'
      'where'
      ' rtrim(CODARTIGO) = rtrim(:OLD_CODARTIGO)')
    Left = 545
    Top = 307
  end
  object qryCorTam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  A.CodArtigo,'
      '            A.CodProduto, '
      '            A.CodCor,'
      '            A.CodTamanho,'
      '            A.CodTipoArtigo,'
      '            T.DescTamanho, '
      '            C.DescCor'
      'From  Artigo A,'
      '         Cor C,'
      '         Tamanho T,'
      '         Produto P    '
      'Where'
      '       A.CodCor  =  C.CodCor And'
      '       A.CodTamanho  =  T.CodTamanho And'
      '       A.CodTipoArtigo =  3  And '
      '       A.CodProduto     =  P.CodProduto')
    UpdateObject = updCorTam
    ValidateWithMask = True
    Left = 547
    Top = 355
  end
end
