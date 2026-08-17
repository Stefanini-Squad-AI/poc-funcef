inherited frmSelRelPesq: TfrmSelRelPesq
  Left = 217
  Top = 162
  Caption = 'Seleção para Tabulação de Pesquisa Salarial'
  ClientHeight = 277
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 238
    inherited PageControl1: TPageControl
      Height = 228
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object dblcPesq: TwwDBLookupCombo
          Left = 59
          Top = 25
          Width = 275
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPESQSALAR'#9'40'#9'Nome da Pesquisa'
            'DATAREFPESQ'#9'12'#9'Data Ref.')
          LookupTable = qryPesqui
          LookupField = 'NOMEPESQSALAR'
          Options = [loColLines, loTitles]
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = False
          OnChange = rgExcluiClick
          OnCloseUp = dblcPesqCloseUp
        end
        object rgTipoTab: TRadioGroup
          Left = 58
          Top = 59
          Width = 275
          Height = 118
          Caption = 'Tabulação Por'
          ItemIndex = 0
          Items.Strings = (
            'Cargo'
            'Empresa/Entidade')
          TabOrder = 1
          OnClick = rgTipoTabClick
        end
        object rgExclui: TRadioGroup
          Left = 128
          Top = 74
          Width = 193
          Height = 30
          Caption = 'Exclui Empresa da Média ?'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Nossa'
            'Outra'
            'Não')
          TabOrder = 2
          OnClick = rgExcluiClick
        end
        object dblcEntid: TwwDBLookupCombo
          Left = 128
          Top = 109
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryEntid
          LookupField = 'NOME'
          TabOrder = 3
          Visible = False
          AutoDropDown = False
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = False
          OnCloseUp = dblcPesqCloseUp
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 91
          Top = 105
        end
        inherited BitBtn2: TBitBtn
          Left = 91
          Top = 45
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 238
    inherited tb97Fundo: TToolbar97
      Left = 80
      DockPos = 242
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Top = 164
  end
  object qryPesqui: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESQSALAR, NOMEPESQSALAR, DATAREFPESQ from PESQISAL '
      'order by NOMEPESQSALAR')
    ValidateWithMask = True
    Left = 366
    Top = 11
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select distinct P.IDPESSOA, P.NOME '
      'from PESSOA P, TENDPESQSAL T'
      'where P.IDPESSOA         = T.IDEMPRESAPARTIC'
      'and     T.IDPESQSALAR = :Pesquisa'
      'order by upper(P.NOME)'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 86
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pesquisa'
        ParamType = ptUnknown
      end>
  end
  object ds: TwwDataSource
    DataSet = qryPesqui
    Left = 23
    Top = 226
  end
end
