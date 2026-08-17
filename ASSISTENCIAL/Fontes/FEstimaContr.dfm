inherited frmEstimaContr: TfrmEstimaContr
  Left = 99
  Top = 119
  Caption = 'Estimativa de Contribuições Assistenciais'
  ClientHeight = 387
  ClientWidth = 607
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 607
    Height = 348
    object pnlPesquisa: TPanel
      Left = 5
      Top = 5
      Width = 597
      Height = 340
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 376
        Top = 47
        Width = 133
        Height = 13
        Caption = 'Plano Assistencial Desejado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnConsultar: TBitBtn
        Left = 377
        Top = 9
        Width = 96
        Height = 29
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
        TabOrder = 0
        OnClick = bbtnConsultarClick
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
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 368
        Height = 338
        Cursor = crNo
        Align = alLeft
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 66
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 53
          Width = 97
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 233
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 92
          Width = 102
          Height = 13
          Caption = 'Nome do Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 234
          Top = 53
          Width = 113
          Height = 13
          Caption = 'Inscrição Previdenciária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 132
          Width = 182
          Height = 13
          Caption = 'Situação do Participante na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edpatro: TEdit
          Left = 8
          Top = 29
          Width = 224
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object edprev: TEdit
          Left = 8
          Top = 67
          Width = 224
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object edmat: TEdit
          Left = 233
          Top = 29
          Width = 123
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object ednome: TEdit
          Left = 8
          Top = 105
          Width = 347
          Height = 21
          CharCase = ecUpperCase
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object numinscprev: TEdit
          Left = 234
          Top = 67
          Width = 122
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object edSitPart: TEdit
          Left = 8
          Top = 145
          Width = 347
          Height = 21
          CharCase = ecUpperCase
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object GroupBox4: TGroupBox
          Left = 6
          Top = 173
          Width = 356
          Height = 158
          Caption = 'Contribuições'
          TabOrder = 6
          object chkLstCont: TCheckListBox
            Left = 2
            Top = 15
            Width = 352
            Height = 141
            Align = alClient
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object cmbplanass: TwwDBLookupCombo
        Left = 376
        Top = 64
        Width = 208
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'NOME')
        LookupTable = qryplanass
        LookupField = 'IDPLANASS'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = cmbplanassChange
      end
      object dbgCapSegAss: TwwDBGrid
        Left = 374
        Top = 181
        Width = 217
        Height = 151
        Selected.Strings = (
          'TIPOSEG'#9'9'#9'Segurados'#9'F'
          'PREMIOFXA'#9'7'#9'Faixa 1'#9'F'
          'PREMIOFXB'#9'7'#9'Faixa 2'#9'F'
          'PREMIOFXC'#9'6'#9'Faixa 3'#9'F'
          'PREMIOFXD'#9'10'#9'Faixa 4'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dscapsegass
        ReadOnly = True
        TabOrder = 3
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        Visible = False
        IndicatorColor = icBlack
      end
    end
    object GroupBox3: TGroupBox
      Left = 381
      Top = 135
      Width = 208
      Height = 46
      Caption = 'Resultado(R$) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object edvalor: TRealEdit
        Left = 12
        Top = 17
        Width = 105
        Height = 23
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object bbtnEnviar: TBitBtn
      Left = 383
      Top = 98
      Width = 97
      Height = 30
      Caption = '&Calcular '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnEnviarClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
    end
    object btnvoltar: TBitBtn
      Left = 493
      Top = 98
      Width = 96
      Height = 30
      Caption = '&Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnvoltarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 607
    inherited tb97Fundo: TToolbar97
      Left = 437
      DockPos = 437
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 80
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 659
    Top = 443
  end
  object qrycontribass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CONTRIBASS.* , REGRA.NOMEREGRA, TP.NOME NOMETP'
      '              ,PT.DESCRICAO , CT.NOME'
      'FROM CONTRIBASS, REGRA , TPPERIODICIDADE TP , PORTADORFORMA PT,'
      'CONTRIBUICAO CT'
      'WHERE IDPLANASS = :IDPLANASS AND '
      'CONTRIBASS.IDREGRA = REGRA.IDREGRA AND'
      'TP.IDTPPERIODICIDADE = CONTRIBASS.IDTPPERIODICIDADE  AND'
      'PT.CODPORTFORMA(+) = CONTRIBASS.CODPORTFORMA AND'
      'CT.IDCONTRIBUICAO = CONTRIBASS.IDCONTASS'
      'AND CONTRIBASS.FLGTOTAL = 0')
    ValidateWithMask = True
    Left = 157
    Top = 253
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object dscontribass: TwwDataSource
    DataSet = qrycontribass
    Left = 293
    Top = 269
  end
  object seldlgproc: TcmSelectDlg
    SearchControls = True
    Caption = 'Procura de Pessoa'
    DataSet = qryaux
    FieldNames.Strings = (
      'matricula'
      'nome'
      'cpf')
    DisplayLabels.Strings = (
      'Matrícula'
      'Nome'
      'CPF')
    AlwaysShow = True
    HelpContext = 0
    Left = 238
    Top = 296
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 237
    Top = 197
  end
  object dsaux: TwwDataSource
    DataSet = qryaux
    Left = 269
    Top = 197
  end
  object regraestima: TRegra
    QueryIn = qryregra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 30
    Top = 200
  end
  object qryregra: TwwQuery
    BeforeOpen = qryregraBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PB.IDPESSOA,'
      '      PB.NUMDOCUMENTO,'
      '      PFB.DATANASC,'
      '      PFB.SEXO,'
      '      PFB.ESTCIVIL,'
      '      PFB.DATAMORTE,'
      '      DT.IDDEPENDENCIA,'
      '      DT.IDTITULAR,'
      '      DT.IDPESSOA,'
      '      D.IDSITDEPENDENTE,'
      '      PLA.IDPLANASS,'
      '      PPP.IDPLANOPREV,'
      '      PPP.IDPESSJUR,'
      '      1 AS SEQPROPOSTA,'
      
        '      TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS DAT' +
        'AENTRADA,'
      '      TO_CHAR(SYSDATE,'#39'YYYY/MM'#39') MESENTRADA,'
      '      0 AS FLGINSCRICAOCANC,'
      '      PPP.INSCRICAONUMERO,'
      '      '#39'          '#39' AS DATACANCELAMENTO,'
      '      '#39'1'#39' AS FLGPARTBENEF,'
      '      PT.FLGFUNCIONARIO,'
      '      EP.MATRICULA,'
      '      EP.DATAADMISSAO,'
      '      EP.NIVEL,'
      '      EP.TEMPOSERVANTERIOR,'
      '      EP.TEMPONAOCREDITADO,'
      '      EP.TEMPOSERVANTREAL,'
      '      EP.TEMPOSITESPECIAL,'
      '      EP.VALORBASE1,'
      '      EP.VALORBASE2,'
      '      EP.VALORBASE3,'
      '      EP.NIVEL,'
      '      TO_CHAR(SYSDATE,'#39'YYYY/MM'#39') MESREF,'
      '      PPP.SALPARTICIPACAO,'
      '      PPP.SALMANTIDO,'
      '      NVL(QRYBENEF.SALBENEFICIO,0) SALBENEFICIO,'
      '      PT.FLGFUNCIONARIO,'
      '      EP.IDSITFUNC,'
      '      EP.DATADEMISSAO,'
      '      PPP.IDSITPART,'
      '      PLA.OPCAOBDIF AS OPCAOA,'
      '      PLA.OPCAOAIDENT AS OPCAOB,'
      '      STP.FLGINTERNO'
      'FROM'
      '      PESSOA         PT,'
      '      PESSOA         PB,'
      '      PESSOAFISICA   PFB,'
      '      DEPENDENTE     D,'
      '      DEPENTIT       DT,'
      '      PARTPREVPLAN   PPP,'
      '      ELEGPATRO      EP,'
      '      SITPART        STP,'
      '      PLANASS        PLA,'
      '      SITDEPENDENTE  SD,'
      '      (SELECT BF.IDPLANOPREV, '
      '              BF.IDTITULAR, '
      #9'      BF.IDPESSJUR,'
      '              SUM(BF.VALORATUAL) SALBENEFICIO'
      '       FROM BENEFBFCIARIO BF'
      '       WHERE (BF.IDSITBENEFICIO = 1) AND'
      '             (BF.IDTITULAR   = :IDPESSOA) AND'
      '             (BF.IDPLANOPREV = :IDPLANOPREV) AND'
      '             (BF.IDPESSJUR   = :IDPESSJUR)'
      '       GROUP BY BF.IDPLANOPREV, '
      '                BF.IDTITULAR, '
      #9#9'BF.IDPESSJUR, '
      #9#9'BF.IDPESSOA) QRYBENEF'
      'WHERE'
      ''
      '      (DT.IDTITULAR      = PT.IDPESSOA)              AND'
      '      (DT.IDPESSOA       = PB.IDPESSOA)              AND'
      '      (DT.IDTITULAR      = :IDPESSOA)                AND'
      '      (DT.IDPESSOA       = :IDPESSOA)                AND'
      '      (DT.IDDEPENDENCIA  = DT.IDDEPENDENCIA)         AND'
      '      (D.IDPESSOA        = DT.IDPESSOA)              AND'
      '      (D.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))    AND'
      '      (PPP.IDPESSJUR     = :IDPESSJUR)               AND'
      '      (PPP.IDPESSOA      = DT.IDTITULAR)             AND'
      '      (PPP.IDPLANOPREV   = :IDPLANOPREV)             AND'
      '      (PPP.IDSITPART     = STP.IDSITPART)            AND'
      '      (PPP.SEQPROPOSTA   = PPP.SEQPROPOSTA)          AND'
      '      (EP.IDPESSJUR      = PPP.IDPESSJUR)            AND'
      '      (EP.IDPESSOA       = PPP.IDPESSOA)             AND'
      '      (PLA.IDPLANASS     = :IDPLANASS)               AND'
      '      (PPP.IDPESSOA      = QRYBENEF.IDTITULAR(+))    AND'
      '      (PPP.IDPLANOPREV   = QRYBENEF.IDPLANOPREV(+))  AND'
      '      (PPP.IDPESSJUR     = QRYBENEF.IDPESSJUR(+))    AND'
      '      (DT.IDPESSOA       = PFB.IDPESSOA)          '
      ''
      ' ')
    ValidateWithMask = True
    Left = 198
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select nome , idplanass '
      ' from planass')
    ValidateWithMask = True
    Left = 117
    Top = 236
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 317
    Top = 228
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'EP.MATRICULA'
      'PE.NOME'
      'PV.INSCRICAONUMERO'
      'PP.NOME'
      'PJ.NOME'
      'PV.INSCRICAODATA'
      'SP.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome do participante '
      'Inscrição'
      'Plano Previdenciário'
      'Patrocinadora'
      'Data de Inscrição'
      'Situação')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA        PE'
      'PESSOA        PJ'
      'PARTPREVPLAN  PV'
      'ELEGPATRO     EP'
      'ELEGIVEL      EL'
      'PLANPREV      PP'
      'SITPART  SP')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'EP.IDPESSOA'
      'EP.IDPESSJUR'
      'PV.IDPLANOPREV')
    Filtro.Strings = (
      'PE.IDPESSOA=EL.IDPESSOA'
      'PJ.IDPESSOA = EP.IDPESSJUR'
      'PV.IDPESSJUR = PJ.IDPESSOA'
      'PV.IDPESSOA  = PE.IDPESSOA'
      'PV.IDPLANOPREV = PP.IDPLANOPREV'
      'PV.IDSITPART = PV.IDSITPART'
      'PV.SEQPROPOSTA = PV.SEQPROPOSTA'
      'PV.FLGDESATIVADO = 0'
      'EL.IDPESSOA = EP.IDPESSOA'
      'PV.IDSITPART = SP.IDSITPART')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '18'
      '10'
      '60'
      '1'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 144
    Top = 26
  end
  object qrycapsegass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPOSEG, PREMIOFXA, PREMIOFXB, PREMIOFXC, PREMIOFXD '
      'FROM CAPSEGASS'
      'WHERE IDPLANASS= :IDPLANASS and'
      '               flgvigencia = 1'
      'ORDER BY ORDEM')
    PictureMasks.Strings = (
      'PREMIOFXA'#9'#,0.00;(#,0.00)'#9'T'#9'T'
      'PREMIOFXB'#9'#,0.00;(#,0.00)'#9'T'#9'T'
      'PREMIOFXC'#9'#,0.00;(#,0.00)'#9'T'#9'T'
      'PREMIOFXD'#9'#,0.00;(#,0.00)'#9'T'#9'T')
    ValidateWithMask = True
    Left = 109
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
    object qrycapsegassTIPOSEG: TStringField
      DisplayLabel = 'Segurados'
      DisplayWidth = 9
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
      Size = 7
    end
    object qrycapsegassPREMIOFXA: TFloatField
      DisplayLabel = 'Faixa 1'
      DisplayWidth = 7
      FieldName = 'PREMIOFXA'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXA'
    end
    object qrycapsegassPREMIOFXB: TFloatField
      DisplayLabel = 'Faixa 2'
      DisplayWidth = 7
      FieldName = 'PREMIOFXB'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXB'
    end
    object qrycapsegassPREMIOFXC: TFloatField
      DisplayLabel = 'Faixa 3'
      DisplayWidth = 6
      FieldName = 'PREMIOFXC'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXC'
    end
    object qrycapsegassPREMIOFXD: TFloatField
      DisplayLabel = 'Faixa 4'
      DisplayWidth = 10
      FieldName = 'PREMIOFXD'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXD'
    end
  end
  object dscapsegass: TwwDataSource
    DataSet = qrycapsegass
    Left = 189
    Top = 285
  end
end
