inherited FrmParamSuplAntecipada: TFrmParamSuplAntecipada
  Left = 140
  Top = 87
  BorderIcons = []
  Caption = 'Parâmetros para o Termo de Opção Pela Suplementação Antecipada'
  ClientHeight = 357
  ClientWidth = 594
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 318
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 584
      Height = 149
      Align = alTop
      TabOrder = 0
      object ConsPart1: TConsPart
        Left = 15
        Top = 65
        Width = 96
        Height = 42
        Caption = '&Consulta'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333300333333
          3333333333333333333333330033333333333333333333333333333303333330
          3333333333333333333333330333333033333333333333333333333330333300
          0333333333333333333333333033330003333333333333333333333330033003
          3333333333333333333333333003300333333333333333333333333333030033
          3333333333333333333333333303003333333333333333333333333333000333
          3333333333333333333333333300033333333333333333330033333333000333
          3333333333333330003333333300033333333337000733000333333303300003
          333333000000000333333333033000033333307888EE70333333333330300333
          33337088888EE073333333333030033333330888888888033333333333000333
          33330888888888033333333333000333333308E8888888033333333333300333
          333308EEE888880333333333333003333333307EEE8870333333333333330033
          3333330088800333333333333333003333333337000733333333333333330033
          3333333333333333333333333333003333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 660
        Top = 181
        Width = 259
        Height = 166
        Caption = 'Panel5'
        Enabled = False
        TabOrder = 0
        Visible = False
        object Label1: TLabel
          Left = 15
          Top = 7
          Width = 152
          Height = 13
          Caption = 'Situação na Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 15
          Top = 45
          Width = 105
          Height = 13
          Caption = 'Situação no Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 15
          Top = 83
          Width = 129
          Height = 13
          Caption = 'Situação na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edSitPatro: TEdit
          Left = 15
          Top = 20
          Width = 230
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'edSitPatro'
          Visible = False
        end
        object edSitFundacao: TEdit
          Left = 15
          Top = 96
          Width = 230
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'edSitFundacao'
          Visible = False
        end
      end
      object bbtnProcurar: TBitBtn
        Left = 15
        Top = 20
        Width = 97
        Height = 42
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object Panel7: TPanel
        Left = 146
        Top = 14
        Width = 432
        Height = 118
        BevelOuter = bvNone
        TabOrder = 2
        object Label4: TLabel
          Left = 14
          Top = 5
          Width = 107
          Height = 19
          Caption = 'Participante '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 14
          Top = 43
          Width = 178
          Height = 19
          Caption = 'Plano Previdenciário '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 14
          Top = 84
          Width = 121
          Height = 19
          Caption = 'Patrocinadora '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblpart: TLabel
          Left = 14
          Top = 25
          Width = 399
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblpatro: TLabel
          Left = 14
          Top = 101
          Width = 399
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblplano: TLabel
          Left = 14
          Top = 62
          Width = 399
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 14
          Top = 130
          Width = 42
          Height = 19
          Caption = 'Filial'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblfilial: TLabel
          Left = 14
          Top = 146
          Width = 296
          Height = 16
          AutoSize = False
          Caption = 'lblfilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 154
      Width = 584
      Height = 159
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label9: TLabel
        Left = 1
        Top = 44
        Width = 582
        Height = 26
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Processos de Requerimento do Benefício'
        Color = clInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
      end
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 70
        Width = 582
        Height = 88
        Selected.Strings = (
          'NUMEROPROCESSO'#9'10'#9'N. Processo'
          'DATAINICIOFUND'#9'10'#9'Data de Inicio'
          'DATAREQUERIMENTO'#9'10'#9'Data de Requerimento'
          'VALORBASE1'#9'10'#9'Opção 1'
          'VALORBASE2'#9'10'#9'Opção 2'
          'VALORBASE3'#9'10'#9'Opção 3')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtmRelatAdmPrev.dssuplantecipada
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 582
        Height = 43
        Align = alTop
        TabOrder = 1
        object Label8: TLabel
          Left = 91
          Top = 14
          Width = 56
          Height = 13
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cmbbeneficio: TwwDBLookupCombo
          Left = 160
          Top = 11
          Width = 313
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qrybeneficio
          LookupField = 'IDBENEFICIO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = cmbbeneficioCloseUp
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 594
    inherited tb97Fundo: TToolbar97
      Left = 346
      DockPos = 346
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
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 132
    Top = 18
  end
  object qrybeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , IDBENEFICIO'
      'FROM   BENEFICIO'
      'WHERE  IDBENEFICIO IN (SELECT BP.IDBENEFICIO'
      
        '                       FROM   BENEFPLANPREV BP, PLANPREVPATRO PL' +
        'P, PATRO PT'
      '                       WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      '                       AND    PLP.IDPESSJUR = PT.IDPESSOA'
      '                       AND    BP.IDPLANOPREV = PLP.IDPLANOPREV )'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 469
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsbeneficio: TwwDataSource
    AutoEdit = False
    DataSet = qrybeneficio
    Left = 509
    Top = 58
  end
end
