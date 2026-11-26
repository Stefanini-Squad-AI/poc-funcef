inherited frmSelecionaParticipantes: TfrmSelecionaParticipantes
  Left = 346
  Top = 42
  Caption = 'Selecionar Participantes'
  ClientHeight = 412
  ClientWidth = 568
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 568
    Height = 373
    object Splitter1: TSplitter
      Left = 1
      Top = 177
      Width = 566
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object pnlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 566
      Height = 176
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 564
        Height = 20
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecionar Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 24
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 11
        Top = 66
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
      object Label8: TLabel
        Left = 299
        Top = 66
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
      object Label4: TLabel
        Left = 11
        Top = 106
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
      object Label9: TLabel
        Left = 299
        Top = 106
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 1
        Top = 140
        Width = 564
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object sbtnAssocia: TSpeedButton
          Left = 248
          Top = 6
          Width = 25
          Height = 25
          Hint = 
            'Acrescentar participante na lista de participantes para desfazer' +
            ' preparo/envio'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAssociaClick
        end
        object sbtnDesassocia: TSpeedButton
          Left = 280
          Top = 6
          Width = 25
          Height = 25
          Hint = 
            'Retirar participante da lista de participantes para desfazer pre' +
            'paro/envio'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
            3333333333777F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
            3333333777737777F333333099999990333333373F3333373333333309999903
            333333337F33337F33333333099999033333333373F333733333333330999033
            3333333337F337F3333333333099903333333333373F37333333333333090333
            33333333337F7F33333333333309033333333333337373333333333333303333
            333333333337F333333333333330333333333333333733333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnDesassociaClick
        end
      end
      object bbtnProcurar: TBitBtn
        Left = 455
        Top = 40
        Width = 90
        Height = 37
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
      object wwDBEdit1: TwwDBEdit
        Left = 11
        Top = 40
        Width = 409
        Height = 21
        DataField = 'NOME'
        DataSource = dsParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 11
        Top = 79
        Width = 281
        Height = 21
        DataField = 'NOMEPATRO'
        DataSource = dsParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit3: TwwDBEdit
        Left = 299
        Top = 79
        Width = 121
        Height = 21
        DataField = 'INSCRICAONUMERO'
        DataSource = dsParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit4: TwwDBEdit
        Left = 11
        Top = 119
        Width = 281
        Height = 21
        DataField = 'NOMEPLANO'
        DataSource = dsParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit5: TwwDBEdit
        Left = 299
        Top = 119
        Width = 121
        Height = 21
        DataField = 'INSCRICAONUMERO'
        DataSource = dsParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 180
      Width = 566
      Height = 192
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 564
        Height = 20
        Align = alTop
        Alignment = taCenter
        Caption = 'Participantes para Desfazer Preparo / Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrdParticipantes: TwwDBGrid
        Left = 1
        Top = 21
        Width = 564
        Height = 170
        Selected.Strings = (
          'NOME'#9'60'#9'Participante'
          'MATRICULA'#9'13'#9'Matrícula'
          'INSCRICAONUMERO'#9'10'#9'Inscrição Nº'
          'NOMEPATRO'#9'60'#9'Patrocinadora'
          'NOMEPLANO'#9'50'#9'Plano')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsSelecionados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 568
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 355
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITPART')
    CamposChave.Strings = (
      'PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSOA'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA     = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA  = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA      = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'SITPART.FLGINTERNO <> '#39'AS'#39' '
      'SITPART.FLGINTERNO <> '#39'CA'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 80
    Top = 266
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME, PT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '  EL.MATRICULA, PP.INSCRICAONUMERO,'
      '  PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,'
      '  PP.IDSITPART, SP.FLGINTERNO'
      'FROM'
      '  PARTPREVPLAN PP, ELEGPATRO EL, PLANPREV PL,'
      '  PESSOA P, PESSOA PT, SITPART SP'
      'WHERE (PP.IDPESSJUR   = :IDPESSJUR)'
      'AND   (PP.IDPLANOPREV = :IDPLANOPREV)'
      'AND   (PP.IDPESSOA    = :IDPESSOA)'
      'AND   (PP.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (PP.IDPESSJUR   = EL.IDPESSJUR)'
      'AND   (PP.IDPESSOA    = EL.IDPESSOA)'
      'AND   (EL.IDPESSOA    = P.IDPESSOA)'
      'AND   (EL.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND  (PP.IDSITPART   = SP.IDSITPART)')
    ValidateWithMask = True
    Left = 469
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsParticipante: TwwDataSource
    DataSet = qryParticipante
    Left = 375
    Top = 357
  end
  object qrySelecionados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME, PT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '  EL.MATRICULA, PP.INSCRICAONUMERO,'
      '  PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,'
      '  PP.IDSITPART, SP.FLGINTERNO'
      'FROM'
      
        '  PARTPREVPLAN PP, ELEGPATRO EL, PLANPREV PL, PESSOA P, PESSOA P' +
        'T, SITPART SP'
      'WHERE  (PP.IDPESSJUR   = :IDPESSJUR)'
      'AND    (PP.IDPLANOPREV = :IDPLANOPREV)'
      'AND    (PP.IDPESSOA    = :IDPESSOA)'
      'AND    (PP.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND    (PP.IDPESSJUR   = EL.IDPESSJUR)'
      'AND    (PP.IDPESSOA    = EL.IDPESSOA)'
      'AND    (EL.IDPESSOA    = P.IDPESSOA)'
      'AND    (EL.IDPESSJUR   = PT.IDPESSOA)'
      'AND    (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND    (PP.IDSITPART   = SP.IDSITPART)'
      '')
    UpdateObject = updSelecionados
    ValidateWithMask = True
    Left = 281
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object updSelecionados: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTPREVPLAN'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  INSCRICAONUMERO = :OLD_INSCRICAONUMERO')
    InsertSQL.Strings = (
      'insert into PARTPREVPLAN'
      
        '  (IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA, INSCRICAONUMER' +
        'O)'
      'values'
      
        '  (:IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :SEQPROPOSTA, :INSCRICAO' +
        'NUMERO)')
    DeleteSQL.Strings = (
      'delete from PARTPREVPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  INSCRICAONUMERO = :OLD_INSCRICAONUMERO')
    Left = 93
    Top = 357
  end
  object dsSelecionados: TwwDataSource
    DataSet = qrySelecionados
    Left = 187
    Top = 357
  end
end
