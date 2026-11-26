inherited frmPRelDemosBenef: TfrmPRelDemosBenef
  Left = 288
  Top = 165
  Caption = 'Demonstrativo de Cálculo de Benefício'
  ClientHeight = 253
  ClientWidth = 476
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 476
    Height = 214
    object GroupBox1: TGroupBox
      Left = 13
      Top = 2
      Width = 451
      Height = 139
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 14
        Width = 37
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 11
        Top = 53
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 93
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 283
        Top = 53
        Width = 86
        Height = 13
        Caption = 'Num. Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 283
        Top = 14
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 11
        Top = 27
        Width = 260
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatro: TEdit
        Left = 11
        Top = 66
        Width = 260
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPlano: TEdit
        Left = 11
        Top = 106
        Width = 260
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edNumInsc: TEdit
        Left = 283
        Top = 66
        Width = 154
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edMatricula: TEdit
        Left = 283
        Top = 27
        Width = 154
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object bbtnProcurar: TBitBtn
        Left = 349
        Top = 97
        Width = 88
        Height = 35
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
        TabOrder = 5
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
    end
    object GroupBox2: TGroupBox
      Left = 13
      Top = 140
      Width = 451
      Height = 59
      TabOrder = 1
      object Label10: TLabel
        Left = 11
        Top = 14
        Width = 56
        Height = 13
        Caption = 'Benefício'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 284
        Top = 14
        Width = 138
        Height = 13
        Caption = 'Data do Cálculo (Regra)'
      end
      object dblkpcmbBeneficio: TwwDBLookupCombo
        Left = 11
        Top = 27
        Width = 256
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Benefício'
          'NUMEROPROCESSO'#9'10'#9'No. Processo'#9'F')
        LookupTable = qryBeneficio
        LookupField = 'NOME'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkpcmbBeneficioCloseUp
      end
      object dblkpcmbIdCalculo: TwwDBLookupCombo
        Left = 284
        Top = 27
        Width = 155
        Height = 21
        Hint = 'Este campo pode ficar em branco ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODCALCULO'#9'50'#9'Código'#9'F'
          'DATACALCULO'#9'10'#9'Data do Cálculo'#9'F')
        LookupTable = qryCalculoProcesso
        LookupField = 'DATACALCULO'
        Options = [loTitles]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbIdCalculoCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 476
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 107
    Top = 127
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       DECODE(BG.IDBENEFICIO, NULL, B.NOME, '#39'Grupo '#39'||G.DESCRICA' +
        'O) AS NOME ,'
      '             B.IDBENEFICIO,BF.IDTITULAR, B.NUMORDEMEVENTO,'
      '             BF.IDPLANOPREV, BF.IDPESSJUR, BF.IDPESSOA,'
      '             BF.NUMEROPROCESSO, BF.DATAINICIO,'
      '             BP.TPMODALIDADE'
      'FROM   BENEFICIO B, BENEFPLANPREV BP, BENEFXGRUPO BG,'
      '       GRUPOBENEF G, BENEFBFCIARIO BF,'
      
        '       (SELECT DISTINCT IDTITULAR, IDPLANOPREV, IDPESSJUR, NUMER' +
        'OPROCESSO'
      '        FROM RELBENEFPART) RB'
      'WHERE  BF.IDTITULAR      = :pIdTitular'
      'AND    BF.IDPLANOPREV    = :pIdPlanoPrev'
      'AND    BF.IDPESSJUR      = :pIdPessJur'
      'AND    BP.IDPLANOPREV    = BF.IDPLANOPREV'
      'AND    BP.IDBENEFICIO    = BF.IDBENEFICIO'
      
        'AND    ((BP.FLGREFERENCIA = 0) or ((BP.FLGREFERENCIA = 1) AND (B' +
        'P.FLGPAGAINSS = 1) ))'
      'AND    BP.IDBENEFICIO    = B.IDBENEFICIO'
      'AND    BP.IDPLANOPREV    = BG.IDPLANOPREV(+)'
      'AND    BP.IDBENEFICIO    = BG.IDBENEFICIO(+)'
      'AND   (1 = BG.FLGPRINCIPAL OR BG.FLGPRINCIPAL IS NULL)'
      'AND    BG.IDGRUPOBENEF   = G.IDGRUPOBENEF(+)'
      'AND    BF.IDTITULAR      = RB.IDTITULAR(+)'
      'AND    BF.IDPLANOPREV    = RB.IDPLANOPREV(+)'
      'AND    BF.IDPESSJUR      = RB.IDPESSJUR(+)'
      'AND    BF.NUMEROPROCESSO = RB.NUMEROPROCESSO(+)'
      'ORDER BY BF.NUMEROPROCESSO DESC'
      ''
      '')
    ValidateWithMask = True
    Left = 222
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end>
  end
  object qryCalculoProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT TO_CHAR(ROWNUM)||'#39'o. Calculo'#39' AS CODCALCULO, R.D' +
        'ATACALCULO,R.NUMEROPROCESSO, R.IDCALCULO'
      'FROM CALCULO C, RELBENEFPART R, TIPOCALCULO TP'
      'WHERE C.IDCALCULO   = R.IDCALCULO  AND'
      '      R.IDPESSJUR   = :pIdPessjur   AND'
      '      R.IDPLANOPREV = :pIdPlanoprev AND'
      '      R.IDTITULAR   = :pIdTitular AND'
      '      R.NUMEROPROCESSO =  :pnumproc and'
      '      R.IDTIPOCALCULO = TP.IDTIPOCALCULO(+)'
      'ORDER BY  R.DATACALCULO')
    ValidateWithMask = True
    Left = 190
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pnumproc'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
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
      'PARTPREVPLAN.INSCRICAONUMERO')
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
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 73
    Top = 127
  end
end
