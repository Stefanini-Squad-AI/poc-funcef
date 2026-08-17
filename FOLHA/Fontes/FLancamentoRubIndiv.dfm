inherited FrmLancamentoRubIndiv: TFrmLancamentoRubIndiv
  Left = 250
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Busca Adiantamentos Efetuados'
  ClientHeight = 463
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 424
    object pnlMesCobeVersao: TPanel
      Left = 1
      Top = 1
      Width = 621
      Height = 179
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 184
        Height = 64
        Caption = 'Mês e Ano de Cobrança'
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 16
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label2: TLabel
          Left = 116
          Top = 12
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cmbMesCob: TComboBox
          Left = 7
          Top = 29
          Width = 106
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          Text = 'cmbMesCob'
          OnChange = cmbMesCobChange
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object edtAnoCob: TEdit
          Left = 115
          Top = 29
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '2004'
          OnChange = edtAnoCobChange
        end
        object UpDown1: TUpDown
          Left = 156
          Top = 29
          Width = 15
          Height = 21
          Associate = edtAnoCob
          Min = 1999
          Max = 4000
          Position = 2004
          TabOrder = 2
          Thousands = False
          Wrap = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 185
        Top = 1
        Width = 432
        Height = 176
        Caption = 'Versão de Pagamento'
        TabOrder = 1
        object chklstVersao: TCheckListBox
          Left = 2
          Top = 15
          Width = 428
          Height = 159
          OnClickCheck = chklstVersaoClickCheck
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object btnMostraPessoa: TButton
        Left = 24
        Top = 144
        Width = 137
        Height = 25
        Caption = 'Mostrar Pessoas'
        TabOrder = 2
        OnClick = btnMostraPessoaClick
      end
    end
    object pnlPessoas: TPanel
      Left = 1
      Top = 180
      Width = 621
      Height = 243
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object lblRubrica: TLabel
        Left = 218
        Top = 183
        Width = 45
        Height = 13
        Caption = 'Rubrica'
      end
      object lblRegraPA: TLabel
        Left = 218
        Top = 215
        Width = 35
        Height = 13
        Caption = 'Regra'
      end
      object grbPessoas: TGroupBox
        Left = 2
        Top = 2
        Width = 617
        Height = 171
        Align = alTop
        TabOrder = 0
        object dbgLancamento: TwwDBGrid
          Left = 2
          Top = 19
          Width = 613
          Height = 150
          ControlType.Strings = (
            'SEL;CheckBox;1;0')
          Selected.Strings = (
            'SEL'#9'2'#9' '#9'F'
            'MATTIT'#9'10'#9'Mat. Titular'#9'F'
            'MATDEP'#9'10'#9'Matr. Dep.'#9'F'
            'NOME'#9'36'#9'Nome'#9'F'
            'LIQ'#9'10'#9'Valor'#9'F'
            'IDPLANOCONTABIL'#9'11'#9'Plano Contábil'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsLancamento
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object chkMarcaTudo: TCheckBox
          Left = 10
          Top = 3
          Width = 158
          Height = 17
          Caption = 'Marcar/Desmarcar tudo'
          TabOrder = 0
          OnClick = chkMarcaTudoClick
        end
      end
      object dblkRubrica: TwwDBLookupCombo
        Left = 270
        Top = 179
        Width = 331
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryRubrica
        LookupField = 'IDPROVENTO'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object grbAnoMesDesconto: TGroupBox
        Left = 4
        Top = 177
        Width = 189
        Height = 54
        Caption = 'Mês e Ano para Desconto'
        TabOrder = 2
        object Label3: TLabel
          Left = 9
          Top = 16
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label4: TLabel
          Left = 118
          Top = 12
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cmbMesDesconto: TComboBox
          Left = 9
          Top = 28
          Width = 106
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object edtAnoDesconto: TEdit
          Left = 117
          Top = 28
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '2000'
        end
        object UpDown2: TUpDown
          Left = 158
          Top = 28
          Width = 15
          Height = 21
          Associate = edtAnoDesconto
          Min = 1999
          Max = 4000
          Position = 2000
          TabOrder = 2
          Thousands = False
          Wrap = False
        end
      end
      object dblcRegra: TwwDBLookupCombo
        Left = 264
        Top = 211
        Width = 336
        Height = 21
        Hint = 'Informe uma regra caso deseje usar controle automático de saldo'
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEREGRA'#9'100'#9'Regra'#9'F'
          'IDREGRA'#9'10'#9'Código'#9'F'
          'DESCREGRA'#9'50'#9'Tipo'#9'F')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loColLines, loRowLines, loTitles]
        DropDownWidth = 320
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 375
      DockPos = 375
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 97
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 97
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 100
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 427
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object qryAux_ELIMINAR: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 254
    Top = 38
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPROVENTO,'
      '  CODPROVDESC||'#39' - '#39'||DESCRPROVDESC AS DESCRICAO'
      ''
      'FROM'
      '  PROVDESC'
      ''
      'WHERE '
      '  FLGDESCONTO = 1 AND'
      '  CODPROVDESC IS NOT NULL')
    ValidateWithMask = True
    Left = 429
    Top = 112
  end
  object qryBuscaRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (SELECT MAX(SEQRUBRICAINDIV)'
      '        FROM RUBRICAINDIV'
      '        WHERE IDPESSOA = :PIDPESSOA'
      '        AND IDEMPRESA = :PIDEMPRESA'
      '        AND IDRUBRICA = :PIDRUBRICA) AS MAXSEQ,'
      '       SEQRUBRICAINDIV,'
      '       NUMOCORRENCIAS,'
      '       PARCELAS,'
      '       ANOMESREF,'
      '       FLGUSADO,'
      '       IDPLANOCONTABIL'
      'FROM RUBRICAINDIV'
      'WHERE IDPESSOA  = :PIDPESSOA'
      'AND IDEMPRESA = :PIDEMPRESA'
      'AND IDRUBRICA = :PIDRUBRICA'
      'ORDER BY NVL(FLGUSADO, 0), ANOMESREF'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 263
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryInsereRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RUBRICAINDIV ('
      '  FLGPENSAOALIM,'
      '  NUMOCORRENCIAS,'
      '  FLGPERMANENTE,'
      '  PARCELAS,'
      '  FLGTPRUBMANUT,'
      '  IDPESSOA,'
      '  IDEMPRESA,'
      '  IDRUBRICA,'
      '  SEQRUBRICAINDIV,'
      '  VALORRUBRICA,'
      '  ANOMESREF,'
      '  IDTITULAR,'
      '  DATAINICIO,'
      '  IDREGRACALCULO,'
      '  FLGCONTROLASALDO,'
      '  VLRSALDOINICIAL,'
      '  VLRTOTALPROC,'
      '  IDPLANOCONTABIL,'
      '  IDSEQINTERNOFB'
      ')'
      'VALUES'
      '(0,'
      ' 0,'
      ' :PFLGPERMANENTE,'
      ' :PPARCELAS,'
      ' 1,'
      ' :PIDPESSOA,'
      ' :PIDEMPRESA,'
      ' :PIDRUBRICA,'
      ' :PSEQRUBRICAINDIV,'
      ' :PVALORRUBRICA,'
      ' :PANOMESREF,'
      ' :PIDTITULAR,'
      ' :PDATAINICIO,'
      ' :PIDREGRACALCULO,'
      ' :PFLGCONTROLASALDO,'
      ' :PVLRSALDOINICIAL,'
      ' :PVLRTOTALPROC,'
      ' :PIDPLANOCONTABIL,'
      ' :PIDSEQINTERNOFB'
      ')')
    ValidateWithMask = True
    Left = 343
    Top = 74
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGPERMANENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPARCELAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PSEQRUBRICAINDIV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALORRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRACALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCONTROLASALDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRSALDOINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRTOTALPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOCONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSEQINTERNOFB'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, R.IDTIPOREGRA'
      'FROM REGRA R, TIPOREGRA T'
      'WHERE R.IDTIPOREGRA = T.IDTIPOREGRA'
      'ORDER BY UPPER(R.NOMEREGRA)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 91
  end
  object dsLancamento: TwwDataSource
    DataSet = cdsLancamento
    Left = 83
    Top = 78
  end
  object cdsLancamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 43
    Top = 78
  end
  object cmsqlLancamento: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 AS SEL, MATTIT, MATDEP, NOME,'
      
        '       LIQ, IDRESPONSAVEL, IDTITULAR, IDPATRO, IDPESSJUR, IDPLAN' +
        'OCONTABIL'
      'FROM ('
      
        'SELECT DISTINCT E.MATRICULA AS MATTIT, D.MATRICULA AS MATDEP, P.' +
        'NOME,'
      
        '       L.LIQ, L.IDRESPONSAVEL, L.IDTITULAR, L.IDPATRO, L.IDPESSJ' +
        'UR, L.IDPLANOCONTABIL'
      'FROM PESSOA P, DEPENTIT D, ELEGPATRO E,'
      
        '     (SELECT H.IDTITULAR,  H.IDRESPONSAVEL, H.IDPLANOCONTABIL, H' +
        '.IDPATRO, H.IDPESSJUR,'
      '             SUM(DECODE(H.FLGESPECIAL,0,'
      
        '                 DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO, 1,(-1)*' +
        'H.VALORPROVENTO, 0), 0)) AS LIQ'
      '      FROM HISTRUBSAL H'
      '      WHERE  H.IDHSTFOLHABENEF = (2835)'
      '      AND  (H.FLGESTORNO IS NOT NULL OR H.FLGESTORNO = 0)'
      '      AND H.IDMODULO = 18'
      
        '      GROUP BY  H.IDTITULAR, H.IDRESPONSAVEL, H.IDPLANOCONTABIL,' +
        ' H.IDPATRO, H.IDPESSJUR) L'
      'WHERE L.IDRESPONSAVEL = D.IDPESSOA(+)'
      'AND L.IDTITULAR = D.IDTITULAR(+)'
      'AND L.IDRESPONSAVEL = P.IDPESSOA'
      'AND L.IDTITULAR = E.IDPESSOA'
      'AND L.IDPATRO = E.IDPESSJUR'
      ')'
      'ORDER BY MATTIT'
      ' ')
    ClientDataSet = cdsLancamento
    Left = 123
    Top = 78
  end
end
