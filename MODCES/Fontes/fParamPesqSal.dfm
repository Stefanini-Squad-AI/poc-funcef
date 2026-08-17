inherited frmParamPesqSal: TfrmParamPesqSal
  Left = 245
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Tabulação de Pesquisa Salarial'
  ClientHeight = 231
  ClientWidth = 324
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 324
    Height = 192
    BorderWidth = 2
    object GroupBox1: TGroupBox
      Left = 27
      Top = 12
      Width = 274
      Height = 47
      Caption = 'Tabulação'
      TabOrder = 0
      object dblcPesq: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 258
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPESQSALAR'#9'40'#9'Nome da Pesquisa'
          'DATAREFPESQ'#9'12'#9'Data Ref.')
        LookupTable = qryPesq
        LookupField = 'NOMEPESQSALAR'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
      end
    end
    object rgTipoTab: TRadioGroup
      Left = 26
      Top = 65
      Width = 275
      Height = 106
      Caption = 'Tabulação Por'
      ItemIndex = 0
      Items.Strings = (
        'Cargo'
        'Empresa/Entidade')
      TabOrder = 1
      OnClick = rgTipoTabClick
    end
    object rgExcluir: TRadioGroup
      Left = 96
      Top = 77
      Width = 193
      Height = 30
      Caption = 'Excluir Empresa da Média?'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Nossa'
        'Outra'
        'Não')
      TabOrder = 2
      OnClick = rgExcluirClick
    end
    object dblcEntid: TwwDBLookupCombo
      Left = 96
      Top = 112
      Width = 193
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qryEntid
      LookupField = 'NOME'
      Style = csDropDownList
      TabOrder = 3
      Visible = False
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = False
      OnChange = dblcEntidChange
    end
  end
  inherited Dock971: TDock97
    Top = 192
    Width = 324
    inherited tb97Fundo: TToolbar97
      Left = 76
      DockPos = 168
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 164
    Top = 134
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPesq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESQSALAR, NOMEPESQSALAR, DATAREFPESQ'
      'FROM'
      '  PESQISAL '
      'ORDER BY'
      '  NOMEPESQSALAR')
    ValidateWithMask = True
    Left = 262
    Top = 134
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
    Left = 216
    Top = 134
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pesquisa'
        ParamType = ptUnknown
      end>
  end
end
