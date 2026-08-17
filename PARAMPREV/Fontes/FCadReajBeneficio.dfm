inherited frmCadReajBeneficio: TfrmCadReajBeneficio
  Left = 124
  Top = 19
  HelpContext = 160162
  Caption = 'Cadastro de Regras de Reajuste dos Benefícios da Fundação'
  ClientHeight = 450
  ClientWidth = 630
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    Height = 364
    object GroupBox2: TGroupBox
      Left = 12
      Top = 168
      Width = 608
      Height = 188
      Caption = ' Tabela de Reajustes já Cadastrados '
      TabOrder = 0
      object dbgrdReajINSS: TwwDBGrid
        Left = 13
        Top = 16
        Width = 589
        Height = 167
        Selected.Strings = (
          'MESREAJ'#9'7'#9'Mês do ~Reajuste'
          'IDRGREAJ'#9'8'#9'Código ~Regra'
          'NOMEREGRA'#9'50'#9'Nome da ~Regra de Reajuste'#9'F'
          'DESCREAJUSTE'#9'23'#9'Tipo de ~Reajuste')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Color = clMenu
        DataSource = dsGrid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 15
      Width = 608
      Height = 148
      Caption = ' Informações do Reajuste '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label5: TLabel
        Left = 10
        Top = 37
        Width = 56
        Height = 13
        Caption = 'Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 11
        Top = 73
        Width = 224
        Height = 13
        Caption = 'Regra de Reajuste utilizada no período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbtnCopiar: TSpeedButton
        Left = 424
        Top = 81
        Width = 162
        Height = 58
        Hint = 
          'Copiar Regra para os outros benefícios no mesmo mês e mesmo plan' +
          'o'
        Caption = ' Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnCopiarClick
      end
      object dblkpcmbBeneficio: TwwDBLookupCombo
        Left = 10
        Top = 51
        Width = 408
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Benefício')
        DataField = 'IDBENEFICIO'
        DataSource = ds
        LookupTable = qryBenefPlanPrev
        LookupField = 'IDBENEFICIO'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbBeneficioCloseUp
      end
      object PnlPlano: TPanel
        Left = 10
        Top = 15
        Width = 408
        Height = 21
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object dblkpcmbRegra: TwwDBLookupCombo
        Left = 11
        Top = 87
        Width = 408
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra de Reajuste'
          'IDREGRA'#9'10'#9'Código')
        DataField = 'IDRGREAJ'
        DataSource = ds
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object grpAnoMes: TGroupBox
        Left = 423
        Top = 7
        Width = 163
        Height = 66
        TabOrder = 3
        object Label1: TLabel
          Left = 8
          Top = 11
          Width = 23
          Height = 13
          Caption = 'Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 60
          Top = 11
          Width = 96
          Height = 13
          Caption = 'Mês do Reajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 51
          Top = 31
          Width = 7
          Height = 13
          Caption = '/'
        end
        object edAno: TEdit
          Left = 8
          Top = 27
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
          Text = '2002'
        end
        object edMes: TEdit
          Left = 60
          Top = 27
          Width = 40
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          Text = '08'
        end
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 11
        Top = 108
        Width = 408
        Height = 31
        Caption = ' Tipo de Reajuste '
        Columns = 2
        DataField = 'FLGREAJSRB'
        DataSource = ds
        Items.Strings = (
          'Reajustar Suplementação'
          'Reajustar SRB')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
    end
  end
  inherited Dock972: TDock97
    Width = 630
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 630
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 74
    Top = 427
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 341
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update REAJBENEFICIO'
      'set'
      '  MESREAJ = :MESREAJ,'
      '  IDRGREAJ = :IDRGREAJ,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  FLGREAJSRB = :FLGREAJSRB'
      'where'
      '  MESREAJ = :OLD_MESREAJ and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into REAJBENEFICIO'
      '  (MESREAJ, IDRGREAJ, IDPLANOPREV, IDBENEFICIO, FLGREAJSRB)'
      'values'
      '  (:MESREAJ, :IDRGREAJ, :IDPLANOPREV, :IDBENEFICIO, :FLGREAJSRB)')
    DeleteSQL.Strings = (
      'delete from REAJBENEFICIO'
      'where'
      '  MESREAJ = :OLD_MESREAJ and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 302
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'B.NOME'
      'R.MESREAJ'
      'R.IDRGREAJ')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Benefício'
      'Ano e Mês de Reajuste'
      'Código da Regra de Reajuste')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REAJBENEFICIO R'
      'BENEFICIO B')
    CamposChave.Strings = (
      'R.MESREAJ'
      'R.IDBENEFICIO')
    Filtro.Strings = (
      'B.IDBENEFICIO = R.IDBENEFICIO'
      'R.IDPLANOPREV = 3')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '20'
      '15')
    Left = 566
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 17
    Top = 424
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 257
    Top = 3
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      
        '  R.MESREAJ, R.IDRGREAJ, R.IDPLANOPREV, R.IDBENEFICIO, R.FLGREAJ' +
        'SRB, '
      '  P.NOME'
      'FROM'
      '  REAJBENEFICIO R, PLANPREV P'
      'WHERE'
      '  R.MESREAJ     = :MESREAJ     AND'
      '  R.IDPLANOPREV = :IDPLANOPREV AND'
      '  R.IDBENEFICIO = :IDBENEFICIO AND '
      '  R.IDPLANOPREV = P.IDPLANOPREV'
      'ORDER  BY'
      '  R.MESREAJ DESC'
      ' ')
    Left = 382
    Top = 65535
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREAJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 428
    Top = 1
  end
  object qryGrid: TwwQuery
    AfterScroll = qryGridAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.MESREAJ, R.IDRGREAJ, RG.NOMEREGRA,'
      '       R.IDBENEFICIO, '
      
        '       DECODE(R.FLGREAJSRB, 1, '#39'Reajustar SRB'#39', '#39'Reajustar Suple' +
        'mentação'#39') as DESCREAJUSTE'
      'FROM   REAJBENEFICIO R, REGRA RG'
      'WHERE  R.IDRGREAJ = RG.IDREGRA'
      'AND    R.IDPLANOPREV = :IDPLANOPREV'
      'AND    R.IDBENEFICIO = :IDBENEFICIO'
      'ORDER  BY R.MESREAJ DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 514
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsGrid: TwwDataSource
    DataSet = qryGrid
    Left = 460
    Top = 2
  end
  object qryBenefPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME'
      'FROM BENEFPLANPREV BP, BENEFICIO B'
      'WHERE BP.IDPLANOPREV = :IDPLANOPREV'
      'AND BP.IDBENEFICIO = B.IDBENEFICIO'
      'AND BP.FLGREFERENCIA = 0'
      'ORDER BY B.NOME'
      ' ')
    ValidateWithMask = True
    Left = 51
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 268
    Top = 344
  end
  object qryBenefSemRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BP.IDBENEFICIO'
      'FROM   BENEFPLANPREV BP, BENEFICIO B, TPPAGTOBENEFICIO T'
      'WHERE  (BP.IDPLANOPREV     = :IDPLANOPREV)'
      'AND    (BP.IDBENEFICIO     <> :IDBENEFICIO)'
      'AND    (BP.IDBENEFICIO     = B.IDBENEFICIO)'
      'AND    (BP.FLGREFERENCIA   = 0)'
      'AND    (BP.FLGCALCTODOMES  = 0)'
      'AND    (B.FLGRESGATE       = 0)'
      'AND    (B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)'
      'AND    (T.FLGFREQUENCIA    <> '#39'U'#39')'
      'AND    (BP.IDBENEFICIO NOT IN (SELECT RJ.IDBENEFICIO'
      '                               FROM   REAJBENEFICIO RJ'
      '                               WHERE  RJ.MESREAJ = :MESREAJ'
      
        '                               AND    RJ.IDPLANOPREV = :IDPLANOP' +
        'REV) )')
    ValidateWithMask = True
    Left = 154
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREAJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
