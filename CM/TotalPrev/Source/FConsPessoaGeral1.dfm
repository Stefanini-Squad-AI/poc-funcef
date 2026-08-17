inherited frmConsPessoaGeral: TfrmConsPessoaGeral
  Left = 24
  Top = 105
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Geral de Pessoas'
  ClientHeight = 378
  ClientWidth = 745
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 745
    Height = 339
    object pgctrlBusca: TPageControl
      Left = 5
      Top = 5
      Width = 735
      Height = 329
      ActivePage = tbsBusca
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlBuscaChange
      object tbsBusca: TTabSheet
        Caption = 'Dados para Consulta'
        object pnlInscricao: TPanel
          Left = 0
          Top = 33
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 1
          object Label5: TLabel
            Left = 20
            Top = 10
            Width = 77
            Height = 13
            Caption = 'Inscrição No.'
          end
          object cmbInscricao: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edInscricao: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlNome: TPanel
          Left = 0
          Top = 66
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 2
          object Label2: TLabel
            Left = 20
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Nome'
          end
          object cmbNome: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edNome: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlCPF: TPanel
          Left = 0
          Top = 99
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 3
          object Label3: TLabel
            Left = 20
            Top = 10
            Width = 24
            Height = 13
            Caption = 'CPF'
          end
          object cmbCPF: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edCPF: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlSitFund: TPanel
          Left = 0
          Top = 198
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 6
          object Label4: TLabel
            Left = 20
            Top = 10
            Width = 56
            Height = 13
            Caption = 'Sit. Plano'
          end
          object CmbSitPlano: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdSitPlano: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlPlano: TPanel
          Left = 0
          Top = 132
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 4
          object Label6: TLabel
            Left = 20
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object CmbPlano: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edPlano: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlPatro: TPanel
          Left = 0
          Top = 165
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 5
          object Label7: TLabel
            Left = 20
            Top = 10
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object CmbPatro: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdPatro: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlSitPlano: TPanel
          Left = 0
          Top = 264
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 7
          object Label8: TLabel
            Left = 20
            Top = 10
            Width = 80
            Height = 13
            Caption = 'Sit. Fundação'
          end
          object CmbSitFund: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdSitFund: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlMatricula: TPanel
          Left = 0
          Top = 0
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 0
          object Label9: TLabel
            Left = 20
            Top = 10
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object cmbMatricula: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edMatricula: TEdit
            Left = 284
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlSitPatro: TPanel
          Left = 0
          Top = 231
          Width = 727
          Height = 33
          Align = alTop
          TabOrder = 8
          object Label1: TLabel
            Left = 20
            Top = 10
            Width = 54
            Height = 13
            Caption = 'Sit. Patro'
          end
          object cmbSitPatro: TComboBox
            Left = 125
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edSitPatro: TEdit
            Left = 285
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Pesquisa'
        ImageIndex = 1
        object dbgResultado: TwwDBGrid
          Left = 0
          Top = 0
          Width = 727
          Height = 301
          Selected.Strings = (
            'PATRO'#9'19'#9'Patrocinadora'#9'F'
            'SITPATRO'#9'15'#9'Situação'#9'F'
            'MATRICULA'#9'15'#9'Matrícula'#9'F'
            'CLASSIFICACAO'#9'11'#9'Identificação'#9'F'
            'NOME'#9'40'#9'Nome'#9'F'
            'NUMDOCUMENTO'#9'18'#9'CPF'#9'F'
            'INSCRICAONUMERO'#9'10'#9'Inscrição'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRes
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = dbgResultadoTitleButtonClick
          OnDblClick = dbgResultadoDblClick
          OnKeyDown = dbgResultadoKeyDown
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 339
    Width = 745
    inherited tb97Fundo: TToolbar97
      Left = 322
      DockPos = 322
      inherited sep1: TToolbarSep97
        Left = 244
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 164
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
      end
      object bbtnBusca: TBitBtn
        Left = 82
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Busca'
        Default = True
        TabOrder = 2
        OnClick = bbtnBuscaClick
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
      object bbtnParticipante: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Consultar'
        Enabled = False
        TabOrder = 3
        OnClick = bbtnElegivelClick
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 64
    Top = 517
  end
  object qryRes1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' PE.IDPESSOA,'
      ' PE.NOME,'
      ' PE2.NOME AS PATRO,'
      ' SFU.DESCRICAO AS SITPATRO, '
      ' '#39'000000000000'#39' as matricshow,'
      
        ' DECODE(EL.MATRICULA, NULL, DT.MATRICULA, EL.MATRICULA) AS MATRI' +
        'CULA,'
      
        ' DECODE(PE.IDPESSOA,DT.IDTITULAR,'#39'TITULAR'#39',PE.IDPESSOA,'#39'BENEFICI' +
        'ARIO'#39') AS CLASSIFICACAO, '
      ' EL.IDPESSJUR,'
      ' DT.IDTITULAR,'
      ' PV.INSCRICAONUMERO,'
      ' PE.NUMDOCUMENTO'
      'FROM'
      ' PESSOA         PE,'
      ' PESSOA         PE2,'
      ' ELEGPATRO      EL,'
      ' DEPENTIT       DT,'
      ' SITFUNC        SFU,'
      ' (SELECT IDPESSOA, INSCRICAONUMERO'
      '  FROM PARTPREVPLAN'
      '  WHERE FLGDESATIVADO = 0) PV'
      'WHERE'
      '-- FILTRO PESSOA'
      ' (PE.IDPESSOA       IN (49424)     )  AND'
      '-- JOIN PESSOA COM ELEGPATRO'
      ' (PE.IDPESSOA       =     EL.IDPESSOA(+))  AND'
      '-- JOIN ELEGPATRO COM SITFUNC'
      ' (EL.IDSITFUNC = SFU.IDSITFUNC(+)) AND '
      '-- JOIN PESSOA PARA PATROCINADORA'
      ' (PE2.IDPESSOA = EL.IDPESSJUR) AND'
      '-- JOIN  PESSOA COM PARTPREVPLAN'
      ' (PE.IDPESSOA       =     PV.IDPESSOA(+))  AND'
      '-- JOIN  DEPENTIT COM PESSOA'
      ' (DT.IDPESSOA       =     PE.IDPESSOA   )  AND'
      '-- JOIN  DEPENTIT COM DEPENTIT'
      ' (DT.IDTITULAR      =     DT.IDTITULAR  )  AND'
      ' (DT.IDDEPENDENCIA  =   DT.IDDEPENDENCIA)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 356
    Top = 126
  end
  object dsRes: TDataSource
    DataSet = cds
    Left = 524
    Top = 154
  end
  object Dsp: TDataSetProvider
    DataSet = qryRes1
    Constraints = True
    Left = 401
    Top = 199
  end
  object qryRes: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      ' PE.IDPESSOA,'
      ' PE.NOME,'
      ' PE2.NOME AS PATRO,'
      ' SFU.DESCRICAO AS SITPATRO, '
      
        ' DECODE(EL.MATRICULA, NULL, DT.MATRICULA, EL.MATRICULA) AS MATRI' +
        'CULA,'
      
        ' DECODE(PE.IDPESSOA,DT.IDTITULAR,'#39'TITULAR'#39',PE.IDPESSOA,'#39'BENEFICI' +
        'ARIO'#39') AS CLASSIFICACAO, '
      ' EL.IDPESSJUR,'
      ' DT.IDTITULAR,'
      ' PV.INSCRICAONUMERO,'
      ' PE.NUMDOCUMENTO'
      'FROM'
      ' PESSOA         PE,'
      ' PESSOA         PE2,'
      ' ELEGPATRO      EL,'
      ' DEPENTIT       DT,'
      ' SITFUNC        SFU,'
      ' (SELECT IDPESSOA, INSCRICAONUMERO'
      '  FROM PARTPREVPLAN'
      '  WHERE FLGDESATIVADO = 0) PV'
      'WHERE'
      '-- FILTRO PESSOA'
      ' (PE.IDPESSOA       IN (49424)     )  AND'
      '-- JOIN PESSOA COM ELEGPATRO'
      ' (PE.IDPESSOA       =     EL.IDPESSOA(+))  AND'
      '-- JOIN ELEGPATRO COM SITFUNC'
      ' (EL.IDSITFUNC = SFU.IDSITFUNC(+)) AND '
      '-- JOIN PESSOA PARA PATROCINADORA'
      ' (PE2.IDPESSOA = EL.IDPESSJUR) AND'
      '-- JOIN  PESSOA COM PARTPREVPLAN'
      ' (PE.IDPESSOA       =     PV.IDPESSOA(+))  AND'
      '-- JOIN  DEPENTIT COM PESSOA'
      ' (DT.IDPESSOA       =     PE.IDPESSOA   )  AND'
      '-- JOIN  DEPENTIT COM DEPENTIT'
      ' (DT.IDTITULAR      =     DT.IDTITULAR  )  AND'
      ' (DT.IDDEPENDENCIA  =   DT.IDDEPENDENCIA)'
      ' ')
    ClientDataSet = cds
    Left = 377
    Top = 45
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 513
    Top = 94
  end
end
